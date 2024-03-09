# typed: false

RSpec.describe "packs meta rules" do
  it "confirm all packages (other than root) are defined in packs_*" do
    current_folders = Dir.glob("**/package.yml")

    current_folders.each do |f|
      next if f == "package.yml"
      expect(f).to start_with("packs_")
    end
  end

  it "confirm all packages underneath packs_XY are in layer XY" do
    Packs.all.each do |pack|
      path_path = pack.path.relative_path_from(Pathname.pwd)
      expected_layer = path_path.to_s.gsub(/\/.*/, "").gsub(/packs_/, "")

      next if expected_layer == "."

      pack_layer = pack.raw_hash["layer"]
      expect(pack_layer).to eq(expected_layer)
    end
  end

  it "confirm all packages enforce privacy strictly" do
    Packs.all.each do |pack|
      privacy_enforcement = pack.raw_hash["enforce_privacy"]
      expect(privacy_enforcement).to eq("strict")
    end
  end

  it "confirm all packages enforce architecture strictly" do
    Packs.all.each do |pack|
      architecture_enforcement = pack.raw_hash["enforce_architecture"]
      expect(architecture_enforcement).to eq("strict")
    end
  end

  it "confirm all packages enforce dependency strictly" do
    Packs.all.each do |pack|
      dependency_enforcement = pack.raw_hash["enforce_dependencies"]
      expect(dependency_enforcement).to eq("strict")
    end
  end

  it "ensures all package.yml are in canonical form and don't have extraneous keys" do
    package_ymls = Dir.glob("**/package.yml")
    package_ymls.each do |package_yml|
      data = YAML.load_file(package_yml)

      expected_keys = %w(enforce_ dependencies layer)
      data.keys.each do |key|
        expect(expected_keys.any? { key.start_with?(_1)}).to eq true
      end

      enforcements = data.select { |key, _| key.to_s.start_with?("enforce_") }.sort.to_h
      result = enforcements.to_yaml
      result += "\n"

      if data["dependencies"]
        dependencies = { "dependencies" => data["dependencies"].sort }
        result += dependencies.to_yaml
        result += "\n"
      end

      layer = { "layer" => data["layer"] }
      result += layer.to_yaml
      result = result.gsub("---\n", "")

      File.write(package_yml, result)
    end
  end
end
