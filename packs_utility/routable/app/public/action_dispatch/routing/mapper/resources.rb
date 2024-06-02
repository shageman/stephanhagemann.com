# typed: strict

module  ActionDispatch::Routing::Mapper::Resources
  extend T::Sig

  alias_method :original_draw, :draw

  #new access to draw method
  sig {params(routeable: T.proc.returns(Routable), expected_outside_routes: T::Array[String]).void}
  def draw_routes_with_unsurprising_namespacing(routeable, expected_outside_routes = [])
    begin
      routeable.()
    rescue NameError
      Kernel.puts "Skipping route creation for #{routeable}. Constant not defined."
      return
    end

    # Kernel.puts "#{routeable.()} is defined"
    all_defined_routes_before = Rails.application.routes.routes.map { _1.path.spec.to_s }
    original_draw(routeable.().route_file_name)
    all_defined_routes_after = Rails.application.routes.routes.map { _1.path.spec.to_s }

    new_routes = all_defined_routes_after - all_defined_routes_before
    routes_outside_expected_namespace = new_routes.select { !_1.starts_with?(/\/#{routeable.().route_file_name}[\/\(]/) }
    unexpected_outside_routes = routes_outside_expected_namespace.select { |r| expected_outside_routes.none? { |e| r.starts_with?(/#{e}[\/\(]?/) } }
    if unexpected_outside_routes.size > 0
      Kernel.raise("Drawing routes for #{routeable.().route_file_name} added route outside of package namespace. Specifically: #{routes_outside_expected_namespace.join(", ")}")
    end
  end

  #old method made to crash
  sig {params(name: String).void}
  def draw(name)
    Kernel.raise "Use drawful instead"
  end
end
