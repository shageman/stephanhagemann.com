# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rubocop-packs` gem.
# Please instead update this file by running `bin/tapioca gem rubocop-packs`.

# source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#4
module RuboCop; end

# source://rubocop-packs//lib/rubocop/cop/packwerk_lite/private.rb#4
module RuboCop::Cop; end

# source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#5
module RuboCop::Cop::Packs; end

# This cop states that public API should live on class methods, which are more easily statically analyzable,
# searchable, and typically hold less state.
#
# Options:
#
# * `AcceptableParentClasses`: A list of classes that, if inherited from, non-class methods are permitted (useful when value objects are a part of your public API)
# * `AcceptableMixins`: A list of modules that, if included, non-class methods are permitted
#
# @example
#
#   # bad
#   # packs/foo/app/public/foo.rb
#   module Foo
#   def blah
#   end
#   end
#
#   # good
#   # packs/foo/app/public/foo.rb
#   module Foo
#   def self.blah
#   end
#   end
#
# source://rubocop-packs//lib/rubocop/cop/packs/class_methods_as_public_apis.rb#31
class RuboCop::Cop::Packs::ClassMethodsAsPublicApis < ::RuboCop::Cop::Base
  # source://rubocop-packs//lib/rubocop/cop/packs/class_methods_as_public_apis.rb#40
  sig { params(node: T.untyped).void }
  def on_def(node); end

  # source://rubocop-packs//lib/rubocop/cop/packs/class_methods_as_public_apis.rb#35
  sig { returns(T::Boolean) }
  def support_autocorrect?; end

  private

  # source://rubocop-packs//lib/rubocop/cop/packs/class_methods_as_public_apis.rb#70
  sig { params(node: T.untyped).returns(T::Boolean) }
  def node_includes_acceptable_mixin?(node); end
end

# This cop helps ensure that each pack has a documented public API
# The following examples assume this basic setup.
#
# @example
#
#   # bad
#   # packs/foo/app/public/foo.rb
#   class Foo
#   def bar; end
#   end
#
#   # good
#   # packs/foo/app/public/foo.rb
#   class Foo
#   # This is a documentation comment.
#   def bar; end
#   end
#
#   # good
#   # packs/foo/app/public/foo.rb
#   class Foo
#   # This is a documentation comment.
#   # It should appear above a sorbet type signature
#   sig { void }
#   def bar; end
#   end
#
# source://rubocop-packs//lib/rubocop/cop/packs/documented_public_apis.rb#33
class RuboCop::Cop::Packs::DocumentedPublicApis < ::RuboCop::Cop::Style::DocumentationMethod
  # source://rubocop-packs//lib/rubocop/cop/packs/documented_public_apis.rb#51
  sig { params(node: T.untyped).void }
  def check(node); end

  # source://rubocop-packs//lib/rubocop/cop/packs/documented_public_apis.rb#74
  sig { params(node: T.untyped).returns(T::Boolean) }
  def node_is_sorbet_signature?(node); end

  # source://rubocop-packs//lib/rubocop/cop/packs/documented_public_apis.rb#46
  sig { returns(T::Boolean) }
  def support_autocorrect?; end
end

# This cop helps ensure that each pack exposes one namespace.
# Note that this cop doesn't necessarily expect you to be using packs-rails (https://github.com/rubyatscale/packs-rails),
# but it does expect packs to live in the organizational structure as described in the README.md of that gem.
#
# This allows packs to opt in and also prevent *other* files from sitting in their namespace.
#
# @example
#
#   # bad
#   # packs/foo/app/services/blah/bar.rb
#   class Blah::Bar; end
#
#   # good
#   # packs/foo/app/services/foo/blah/bar.rb
#   class Foo::Blah::Bar; end
#
# source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#6
class RuboCop::Cop::Packs::RootNamespaceIsPackName < ::RuboCop::Cop::Base
  include ::RuboCop::Cop::RangeHelp

  # source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name.rb#32
  sig { void }
  def on_new_investigation; end

  # In the future, we'd love this to support auto-correct.
  # Perhaps by automatically renamespacing the file and changing its location?
  #
  # source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name.rb#79
  sig { returns(T::Boolean) }
  def support_autocorrect?; end

  private

  # source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name.rb#86
  sig { returns(::RuboCop::Cop::Packs::RootNamespaceIsPackName::DesiredZeitwerkApi) }
  def desired_zeitwerk_api; end
end

# This is a private class that represents API that we would prefer to be available somehow in Zeitwerk.
# However, the boundaries between systems (packwerk/zeitwerk, rubocop/zeitwerk) are poor in this class, so
# that would need to be separated prior to proposing any API changes in zeitwerk.
#
# source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#12
class RuboCop::Cop::Packs::RootNamespaceIsPackName::DesiredZeitwerkApi
  # For now, this API includes `package_for_path`
  # If this were truly zeitwerk API, it wouldn't include any mention of packs and it would likely not need the package at all
  # Since it could get the actual namespace without knowing anything about packs.
  # However, we would need to pass to it the desired namespace based on the pack name for it to be able to suggest
  # a desired filepath.
  # Likely this means that our own cop should determine the desired namespace and pass that in
  # and this can determine actual namespace and how to get to expected.
  #
  # source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#32
  sig do
    params(
      relative_filename: ::String,
      package_for_path: ::Packs::Pack
    ).returns(T.nilable(::RuboCop::Cop::Packs::RootNamespaceIsPackName::DesiredZeitwerkApi::NamespaceContext))
  end
  def for_file(relative_filename, package_for_path); end

  # source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#86
  sig { params(pack: ::Packs::Pack).returns(::String) }
  def get_pack_based_namespace(pack); end

  private

  # source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#98
  sig { params(remaining_file_path: ::String, package_name: ::String).returns(::String) }
  def get_actual_namespace(remaining_file_path, package_name); end

  # source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#93
  sig { returns(::Pathname) }
  def root_pathname; end
end

# source://rubocop-packs//lib/rubocop/cop/packs/root_namespace_is_pack_name/desired_zeitwerk_api.rb#15
class RuboCop::Cop::Packs::RootNamespaceIsPackName::DesiredZeitwerkApi::NamespaceContext < ::T::Struct
  const :current_namespace, ::String
  const :current_fully_qualified_constant, ::String
  const :expected_namespace, ::String
  const :expected_filepath, ::String

  class << self
    # source://sorbet-runtime/0.5.11247/lib/types/struct.rb#13
    def inherited(s); end
  end
end

# This cop helps ensure that each pack's public API is strictly typed, enforcing strong boundaries.
#
# @example
#
#   # bad
#   # packs/foo/app/public/foo.rb
#   # typed: false
#   module Foo; end
#
#   # good
#   # packs/foo/app/public/foo.rb
#   # typed: strict
#   module Foo; end
#
# source://rubocop-packs//lib/rubocop/cop/packs/typed_public_apis.rb#22
class RuboCop::Cop::Packs::TypedPublicApis < ::RuboCop::Cop::Sorbet::StrictSigil
  # source://rubocop-packs//lib/rubocop/cop/packs/typed_public_apis.rb#38
  sig { params(processed_source: T.untyped).void }
  def investigate(processed_source); end
end

# source://rubocop-packs//lib/rubocop/cop/packwerk_lite/private.rb#5
module RuboCop::Cop::PackwerkLite; end

# This is a private class that represents API that we would prefer to be available somehow in Zeitwerk.
# However, the boundaries between systems (packwerk/zeitwerk, rubocop/zeitwerk) are poor in this class, so
# that would need to be separated prior to proposing any API changes in zeitwerk.
#
# source://rubocop-packs//lib/rubocop/cop/packwerk_lite/constant_resolver.rb#11
class RuboCop::Cop::PackwerkLite::ConstantResolver; end

# source://rubocop-packs//lib/rubocop/cop/packwerk_lite/constant_resolver.rb#14
class RuboCop::Cop::PackwerkLite::ConstantResolver::ConstantReference < ::T::Struct
  const :constant_name, ::String
  const :global_namespace, ::String
  const :source_package, ::ParsePackwerk::Package
  const :constant_definition_location, ::Pathname
  const :referencing_file, ::Pathname

  # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/constant_resolver.rb#29
  sig { returns(T::Boolean) }
  def public_api?; end

  # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/constant_resolver.rb#24
  sig { returns(::ParsePackwerk::Package) }
  def referencing_package; end

  class << self
    # source://sorbet-runtime/0.5.11247/lib/types/struct.rb#13
    def inherited(s); end

    # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/constant_resolver.rb#37
    sig do
      params(
        node: ::RuboCop::AST::ConstNode,
        processed_source: ::RuboCop::AST::ProcessedSource
      ).returns(T.nilable(::RuboCop::Cop::PackwerkLite::ConstantResolver::ConstantReference))
    end
    def resolve(node, processed_source); end
  end
end

# This cop helps ensure that packs are depending on packs explicitly.
#
# @example
#
#   # bad
#   # packs/foo/app/services/foo.rb
#   class Foo
#   def bar
#   Bar
#   end
#   end
#
#   # packs/foo/package.yml
#   # enforces_dependencies: true
#   # enforces_privacy: false
#   # dependencies:
#   #   - packs/baz
#
#   # good
#   # packs/foo/app/services/foo.rb
#   class Foo
#   def bar
#   Bar
#   end
#   end
#
#   # packs/foo/package.yml
#   # enforces_dependencies: true
#   # enforces_privacy: false
#   # dependencies:
#   #   - packs/baz
#   #   - packs/bar
#
# source://rubocop-packs//lib/rubocop/cop/packwerk_lite/dependency_checker.rb#39
class RuboCop::Cop::PackwerkLite::Dependency < ::RuboCop::Cop::Base
  # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/dependency_checker.rb#48
  sig { params(node: ::RuboCop::AST::ConstNode).void }
  def on_const(node); end

  # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/dependency_checker.rb#43
  sig { returns(T::Boolean) }
  def support_autocorrect?; end
end

# This cop helps ensure that packs are using public API of other systems
# The following examples assume this basic setup.
#
# @example
#   # packs/bar/app/public/bar.rb
#   class Bar
#   def my_public_api; end
#   end
#
#   # packs/bar/app/services/private.rb
#   class Private
#   def my_private_api; end
#   end
#
#   # packs/bar/package.yml
#   # enforces_dependencies: false
#   # enforces_privacy: true
#
#   # bad
#   # packs/foo/app/services/foo.rb
#   class Foo
#   def bar
#   Private.my_private_api
#   end
#   end
#
#   # good
#   # packs/foo/app/services/foo.rb
#   class Bar
#   def bar
#   Bar.my_public_api
#   end
#   end
#
# source://rubocop-packs//lib/rubocop/cop/packwerk_lite/privacy_checker.rb#40
class RuboCop::Cop::PackwerkLite::Privacy < ::RuboCop::Cop::Base
  # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/privacy_checker.rb#49
  sig { params(node: ::RuboCop::AST::ConstNode).void }
  def on_const(node); end

  # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/privacy_checker.rb#44
  sig { returns(T::Boolean) }
  def support_autocorrect?; end
end

# source://rubocop-packs//lib/rubocop/cop/packwerk_lite/private.rb#6
module RuboCop::Cop::PackwerkLite::Private
  class << self
    # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/private.rb#10
    sig { params(node: ::RuboCop::AST::ConstNode).returns(T::Boolean) }
    def partial_const_reference?(node); end

    # source://rubocop-packs//lib/rubocop/cop/packwerk_lite/private.rb#27
    sig do
      params(
        constant_reference: ::RuboCop::Cop::PackwerkLite::ConstantResolver::ConstantReference,
        type: ::String
      ).returns(T::Boolean)
    end
    def violation_in_package_todo_yml?(constant_reference, type: T.unsafe(nil)); end
  end
end

# source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#5
module RuboCop::Packs
  class << self
    # source://rubocop-packs//lib/rubocop/packs.rb#16
    sig { void }
    def bust_cache!; end

    # source://rubocop-packs//lib/rubocop/packs.rb#27
    sig { returns(::RuboCop::Packs::Private::Configuration) }
    def config; end

    # @yield [config]
    #
    # source://rubocop-packs//lib/rubocop/packs.rb#22
    sig { params(blk: T.proc.params(arg0: ::RuboCop::Packs::Private::Configuration).void).void }
    def configure(&blk); end
  end
end

# source://rubocop-packs//lib/rubocop/packs.rb#11
RuboCop::Packs::CONFIG_DEFAULT = T.let(T.unsafe(nil), Pathname)

# Because RuboCop doesn't yet support plugins, we have to monkey patch in a
# bit of our configuration.
#
# source://rubocop-packs//lib/rubocop/packs/inject.rb#10
module RuboCop::Packs::Inject
  class << self
    # source://rubocop-packs//lib/rubocop/packs/inject.rb#14
    sig { void }
    def defaults!; end
  end
end

# source://rubocop-packs//lib/rubocop/packs.rb#10
RuboCop::Packs::PROJECT_ROOT = T.let(T.unsafe(nil), Pathname)

# source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#6
module RuboCop::Packs::Private
  class << self
    # source://rubocop-packs//lib/rubocop/packs/private.rb#13
    sig { void }
    def bust_cache!; end

    # source://rubocop-packs//lib/rubocop/packs/private.rb#18
    sig { void }
    def load_client_configuration; end
  end
end

# source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#7
class RuboCop::Packs::Private::Configuration
  # source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#14
  sig { void }
  def initialize; end

  # source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#19
  sig { void }
  def bust_cache!; end

  # source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#11
  sig { returns(T::Array[::String]) }
  def globally_permitted_namespaces; end

  # @return [Array<String>]
  #
  # source://rubocop-packs//lib/rubocop/packs/private/configuration.rb#11
  def globally_permitted_namespaces=(_arg0); end
end

# source://rubocop-packs//lib/rubocop/packs/private/offense.rb#6
class RuboCop::Packs::Private::Offense < ::T::Struct
  const :cop_name, ::String
  const :filepath, ::String

  # source://rubocop-packs//lib/rubocop/packs/private/offense.rb#13
  sig { returns(T.nilable(::Packs::Pack)) }
  def pack; end

  class << self
    # source://sorbet-runtime/0.5.11247/lib/types/struct.rb#13
    def inherited(s); end
  end
end

# See docs/packwerk_lite.md
#
# source://rubocop-packs//lib/rubocop/packwerk_lite.rb#12
module RuboCop::PackwerkLite; end

# source://rubocop-packs//lib/rubocop/packwerk_lite.rb#13
class RuboCop::PackwerkLite::Error < ::StandardError; end
