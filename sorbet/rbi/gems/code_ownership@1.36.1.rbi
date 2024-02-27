# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `code_ownership` gem.
# Please instead update this file by running `bin/tapioca gem code_ownership`.

# source://code_ownership//lib/code_ownership/mapper.rb#5
module CodeOwnership
  extend ::CodeOwnership

  requires_ancestor { Kernel }

  # source://code_ownership//lib/code_ownership.rb#127
  sig do
    params(
      backtrace: T.nilable(T::Array[::String])
    ).returns(T::Enumerable[[T.nilable(::CodeTeams::Team), ::String]])
  end
  def backtrace_with_ownership(backtrace); end

  # Given a backtrace from either `Exception#backtrace` or `caller`, find the
  # first owned file in it, useful for figuring out which file is being blamed.
  #
  # source://code_ownership//lib/code_ownership.rb#116
  sig do
    params(
      backtrace: T.nilable(T::Array[::String]),
      excluded_teams: T::Array[::CodeTeams::Team]
    ).returns(T.nilable([::CodeTeams::Team, ::String]))
  end
  def first_owned_file_for_backtrace(backtrace, excluded_teams: T.unsafe(nil)); end

  # Given a backtrace from either `Exception#backtrace` or `caller`, find the
  # first line that corresponds to a file with assigned ownership
  #
  # source://code_ownership//lib/code_ownership.rb#109
  sig do
    params(
      backtrace: T.nilable(T::Array[::String]),
      excluded_teams: T::Array[::CodeTeams::Team]
    ).returns(T.nilable(::CodeTeams::Team))
  end
  def for_backtrace(backtrace, excluded_teams: T.unsafe(nil)); end

  # source://code_ownership//lib/code_ownership.rb#160
  sig { params(klass: T.nilable(T.any(::Module, T::Class[T.anything]))).returns(T.nilable(::CodeTeams::Team)) }
  def for_class(klass); end

  # source://code_ownership//lib/code_ownership.rb#29
  sig { params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def for_file(file); end

  # source://code_ownership//lib/code_ownership.rb#177
  sig { params(package: ::Packs::Pack).returns(T.nilable(::CodeTeams::Team)) }
  def for_package(package); end

  # source://code_ownership//lib/code_ownership.rb#49
  sig { params(team: T.any(::CodeTeams::Team, ::String)).returns(::String) }
  def for_team(team); end

  # source://code_ownership//lib/code_ownership.rb#90
  sig { params(autocorrect: T::Boolean, stage_changes: T::Boolean, files: T.nilable(T::Array[::String])).void }
  def validate!(autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil), files: T.unsafe(nil)); end

  class << self
    # Generally, you should not ever need to do this, because once your ruby process loads, cached content should not change.
    # Namely, the set of files, packages, and directories which are tracked for ownership should not change.
    # The primary reason this is helpful is for clients of CodeOwnership who want to test their code, and each test context
    # has different ownership and tracked files.
    #
    # source://code_ownership//lib/code_ownership.rb#186
    sig { void }
    def bust_caches!; end

    # source://code_ownership//lib/code_ownership.rb#194
    sig { returns(::CodeOwnership::Configuration) }
    def configuration; end

    # source://code_ownership//lib/code_ownership.rb#79
    sig { params(filename: ::String).void }
    def remove_file_annotation!(filename); end

    private

    # source://code_ownership//lib/code_ownership.rb#127
    def backtrace_with_ownership(backtrace); end
  end
end

# source://code_ownership//lib/code_ownership/cli.rb#8
class CodeOwnership::Cli
  class << self
    # For now, this just returns team ownership
    # Later, this could also return code ownership errors about that file.
    #
    # source://code_ownership//lib/code_ownership/cli.rb#76
    def for_file(argv); end

    # source://code_ownership//lib/code_ownership/cli.rb#123
    def for_team(argv); end

    # source://code_ownership//lib/code_ownership/cli.rb#9
    def run!(argv); end

    private

    # source://code_ownership//lib/code_ownership/cli.rb#33
    def validate!(argv); end
  end
end

# source://code_ownership//lib/code_ownership/configuration.rb#4
class CodeOwnership::Configuration < ::T::Struct
  const :owned_globs, T::Array[::String]
  const :unowned_globs, T::Array[::String]
  const :js_package_paths, T::Array[::String]
  const :unbuilt_gems_path, T.nilable(::String)
  const :skip_codeowners_validation, T::Boolean
  const :raw_hash, T::Hash[T.untyped, T.untyped]
  const :require_github_teams, T::Boolean

  class << self
    # source://code_ownership//lib/code_ownership/configuration.rb#17
    sig { returns(::CodeOwnership::Configuration) }
    def fetch; end

    # source://sorbet-runtime/0.5.11247/lib/types/struct.rb#13
    def inherited(s); end

    # source://code_ownership//lib/code_ownership/configuration.rb#37
    sig { params(config_hash: T::Hash[T.untyped, T.untyped]).returns(T::Array[::String]) }
    def js_package_paths(config_hash); end
  end
end

# source://code_ownership//lib/code_ownership/configuration.rb#6
CodeOwnership::Configuration::DEFAULT_JS_PACKAGE_PATHS = T.let(T.unsafe(nil), Array)

# source://code_ownership//lib/code_ownership.rb#26
CodeOwnership::GlobsToOwningTeamMap = T.type_alias { T::Hash[::String, ::CodeTeams::Team] }

# source://code_ownership//lib/code_ownership.rb#75
class CodeOwnership::InvalidCodeOwnershipConfigurationError < ::StandardError; end

# @abstract Subclasses must implement the `abstract` methods below.
#
# source://code_ownership//lib/code_ownership/mapper.rb#6
module CodeOwnership::Mapper
  interface!

  # @abstract
  #
  # source://code_ownership//lib/code_ownership/mapper.rb#62
  sig { abstract.void }
  def bust_caches!; end

  # @abstract
  #
  # source://code_ownership//lib/code_ownership/mapper.rb#58
  sig { abstract.returns(::String) }
  def description; end

  # This should be fast when run with MANY files
  #
  # @abstract
  #
  # source://code_ownership//lib/code_ownership/mapper.rb#45
  sig { abstract.params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def globs_to_owner(files); end

  # This should be fast when run with ONE file
  #
  # @abstract
  #
  # source://code_ownership//lib/code_ownership/mapper.rb#35
  sig { abstract.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  # This should be fast when run with MANY files
  #
  # @abstract
  #
  # source://code_ownership//lib/code_ownership/mapper.rb#54
  sig do
    abstract
      .params(
        cache: T::Hash[::String, ::CodeTeams::Team],
        files: T::Array[::String]
      ).returns(T::Hash[::String, ::CodeTeams::Team])
  end
  def update_cache(cache, files); end

  class << self
    # source://code_ownership//lib/code_ownership/mapper.rb#23
    sig { returns(T::Array[::CodeOwnership::Mapper]) }
    def all; end

    # source://code_ownership//lib/code_ownership/mapper.rb#16
    sig { params(base: T::Class[::CodeOwnership::Mapper]).void }
    def included(base); end

    # source://code_ownership//lib/code_ownership/mapper.rb#66
    sig { returns(::CodeOwnership::Private::GlobCache) }
    def to_glob_cache; end
  end
end

# source://code_ownership//lib/code_ownership/private/extension_loader.rb#5
module CodeOwnership::Private
  class << self
    # source://code_ownership//lib/code_ownership/private.rb#40
    sig { void }
    def bust_caches!; end

    # source://code_ownership//lib/code_ownership/private.rb#26
    sig { returns(::CodeOwnership::Configuration) }
    def configuration; end

    # source://code_ownership//lib/code_ownership/private.rb#88
    sig { params(file: ::String).returns(T::Boolean) }
    def file_tracked?(file); end

    # source://code_ownership//lib/code_ownership/private.rb#106
    sig { params(team_name: ::String, location_of_reference: ::String).returns(::CodeTeams::Team) }
    def find_team!(team_name, location_of_reference); end

    # source://code_ownership//lib/code_ownership/private.rb#116
    sig { returns(::CodeOwnership::Private::GlobCache) }
    def glob_cache; end

    # This is just an alias for `configuration` that makes it more explicit what we're doing instead of just calling `configuration`.
    # This is necessary because configuration may contain extensions of code ownership, so those extensions should be loaded prior to
    # calling APIs that provide ownership information.
    #
    # source://code_ownership//lib/code_ownership/private.rb#35
    sig { returns(::CodeOwnership::Configuration) }
    def load_configuration!; end

    # Returns a string version of the relative path to a Rails constant,
    # or nil if it can't find something
    #
    # source://code_ownership//lib/code_ownership/private.rb#67
    sig { params(klass: T.nilable(T.any(::Module, T::Class[T.anything]))).returns(T.nilable(::String)) }
    def path_from_klass(klass); end

    # The output of this function is string pathnames relative to the root.
    #
    # source://code_ownership//lib/code_ownership/private.rb#82
    sig { returns(T::Array[::String]) }
    def tracked_files; end

    # source://code_ownership//lib/code_ownership/private.rb#47
    sig { params(files: T::Array[::String], autocorrect: T::Boolean, stage_changes: T::Boolean).void }
    def validate!(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
  end
end

# This class is responsible for turning CodeOwnership directives (e.g. annotations, package owners)
# into a GitHub CODEOWNERS file, as specified here:
# https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners
#
# source://code_ownership//lib/code_ownership/private/codeowners_file.rb#11
class CodeOwnership::Private::CodeownersFile
  class << self
    # source://code_ownership//lib/code_ownership/private/codeowners_file.rb#15
    sig { returns(T::Array[::String]) }
    def actual_contents_lines; end

    # source://code_ownership//lib/code_ownership/private/codeowners_file.rb#29
    sig { returns(T::Array[T.nilable(::String)]) }
    def expected_contents_lines; end

    # source://code_ownership//lib/code_ownership/private/codeowners_file.rb#93
    sig { returns(::Pathname) }
    def path; end

    # source://code_ownership//lib/code_ownership/private/codeowners_file.rb#115
    sig { returns(::CodeOwnership::Private::GlobCache) }
    def to_glob_cache; end

    # source://code_ownership//lib/code_ownership/private/codeowners_file.rb#98
    sig { params(files: T::Array[::String]).void }
    def update_cache!(files); end

    # source://code_ownership//lib/code_ownership/private/codeowners_file.rb#110
    sig { returns(T::Boolean) }
    def use_codeowners_cache?; end

    # source://code_ownership//lib/code_ownership/private/codeowners_file.rb#87
    sig { void }
    def write!; end
  end
end

# This class handles loading extensions to code_ownership using the `require` directive
# in the `code_ownership.yml` configuration.
#
# source://code_ownership//lib/code_ownership/private/extension_loader.rb#8
module CodeOwnership::Private::ExtensionLoader
  class << self
    # source://code_ownership//lib/code_ownership/private/extension_loader.rb#12
    sig { params(require_directive: ::String).void }
    def load(require_directive); end
  end
end

# source://code_ownership//lib/code_ownership/private/glob_cache.rb#6
class CodeOwnership::Private::GlobCache
  # source://code_ownership//lib/code_ownership/private/glob_cache.rb#26
  sig { params(raw_cache_contents: T::Hash[::String, T::Hash[::String, ::CodeTeams::Team]]).void }
  def initialize(raw_cache_contents); end

  # source://code_ownership//lib/code_ownership/private/glob_cache.rb#36
  sig { params(files: T::Array[::String]).returns(T::Hash[::String, T::Set[::String]]) }
  def mapper_descriptions_that_map_files(files); end

  # source://code_ownership//lib/code_ownership/private/glob_cache.rb#31
  sig { returns(T::Hash[::String, T::Hash[::String, ::CodeTeams::Team]]) }
  def raw_cache_contents; end

  private

  # source://code_ownership//lib/code_ownership/private/glob_cache.rb#50
  sig { returns(T::Hash[::String, T::Hash[::String, ::CodeTeams::Team]]) }
  def expanded_cache; end

  # source://code_ownership//lib/code_ownership/private/glob_cache.rb#69
  sig { returns(T::Hash[::String, T::Set[::String]]) }
  def files_by_mappers_via_expanded_cache; end

  # source://code_ownership//lib/code_ownership/private/glob_cache.rb#85
  sig { params(files: T::Array[::String]).returns(T::Hash[::String, T::Set[::String]]) }
  def files_by_mappers_via_file_fnmatch(files); end
end

# source://code_ownership//lib/code_ownership/private/glob_cache.rb#11
CodeOwnership::Private::GlobCache::CacheShape = T.type_alias { T::Hash[::String, T::Hash[::String, ::CodeTeams::Team]] }

# source://code_ownership//lib/code_ownership/private/glob_cache.rb#18
CodeOwnership::Private::GlobCache::FilesByMapper = T.type_alias { T::Hash[::String, T::Set[::String]] }

# source://code_ownership//lib/code_ownership/private/glob_cache.rb#9
CodeOwnership::Private::GlobCache::MapperDescription = T.type_alias { ::String }

# source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#7
module CodeOwnership::Private::OwnershipMappers; end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#8
class CodeOwnership::Private::OwnershipMappers::DirectoryOwnership
  include ::CodeOwnership::Mapper

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#61
  sig { override.void }
  def bust_caches!; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#56
  sig { override.returns(::String) }
  def description; end

  # Directory ownership ignores the passed in files when generating code owners lines.
  # This is because Directory ownership knows that the fastest way to find code owners for directory based ownership
  # is to simply iterate over the directories and grab the owner, rather than iterating over each file just to get what directory it is in
  # In theory this means that we may generate code owners lines that cover files that are not in the passed in argument,
  # but in practice this is not of consequence because in reality we never really want to generate code owners for only a
  # subset of files, but rather we want code ownership for all files.
  #
  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#43
  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def globs_to_owner(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#20
  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#27
  sig do
    override
      .params(
        cache: T::Hash[::String, ::CodeTeams::Team],
        files: T::Array[::String]
      ).returns(T::Hash[::String, ::CodeTeams::Team])
  end
  def update_cache(cache, files); end

  private

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#108
  sig { params(directory: ::Pathname).returns(T.nilable(::CodeTeams::Team)) }
  def get_team_from_codeowners_file_within_directory(directory); end

  # Takes a file and finds the relevant `.codeowner` file by walking up the directory
  # structure. Example, given `a/b/c.rb`, this looks for `a/b/.codeowner`, `a/.codeowner`,
  # and `.codeowner` in that order, stopping at the first file to actually exist.
  # If the parovided file is a directory, it will look for `.codeowner` in that directory and then upwards.
  # We do additional caching so that we don't have to check for file existence every time.
  #
  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#83
  sig { params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_relevant_owner(file); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#68
  sig { params(codeowners_file: ::Pathname).returns(::CodeTeams::Team) }
  def owner_for_codeowners_file(codeowners_file); end
end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/directory_ownership.rb#12
CodeOwnership::Private::OwnershipMappers::DirectoryOwnership::CODEOWNERS_DIRECTORY_FILE_NAME = T.let(T.unsafe(nil), String)

# Calculate, cache, and return a mapping of file names (relative to the root
# of the repository) to team name.
#
# Example:
#
#   {
#     'app/models/company.rb' => Team.find('Setup & Onboarding'),
#     ...
#   }
#
# source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#17
class CodeOwnership::Private::OwnershipMappers::FileAnnotations
  include ::CodeOwnership::Mapper

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#128
  sig { override.void }
  def bust_caches!; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#123
  sig { override.returns(::String) }
  def description; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#73
  sig { params(filename: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def file_annotation_based_owner(filename); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#37
  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def globs_to_owner(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#28
  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#109
  sig { params(filename: ::String).void }
  def remove_file_annotation!(filename); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#49
  sig do
    override
      .params(
        cache: T::Hash[::String, ::CodeTeams::Team],
        files: T::Array[::String]
      ).returns(T::Hash[::String, ::CodeTeams::Team])
  end
  def update_cache(cache, files); end
end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#22
CodeOwnership::Private::OwnershipMappers::FileAnnotations::DESCRIPTION = T.let(T.unsafe(nil), String)

# source://code_ownership//lib/code_ownership/private/ownership_mappers/file_annotations.rb#21
CodeOwnership::Private::OwnershipMappers::FileAnnotations::TEAM_PATTERN = T.let(T.unsafe(nil), Regexp)

# source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#8
class CodeOwnership::Private::OwnershipMappers::JsPackageOwnership
  include ::CodeOwnership::Mapper

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#71
  sig { override.void }
  def bust_caches!; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#55
  sig { override.returns(::String) }
  def description; end

  # Package ownership ignores the passed in files when generating code owners lines.
  # This is because Package ownership knows that the fastest way to find code owners for package based ownership
  # is to simply iterate over the packages and grab the owner, rather than iterating over each file just to get what package it is in
  # In theory this means that we may generate code owners lines that cover files that are not in the passed in argument,
  # but in practice this is not of consequence because in reality we never really want to generate code owners for only a
  # subset of files, but rather we want code ownership for all files.
  #
  # source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#45
  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def globs_to_owner(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#18
  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#60
  sig { params(package: ::CodeOwnership::Private::ParseJsPackages::Package).returns(T.nilable(::CodeTeams::Team)) }
  def owner_for_package(package); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#29
  sig do
    override
      .params(
        cache: T::Hash[::String, ::CodeTeams::Team],
        files: T::Array[::String]
      ).returns(T::Hash[::String, ::CodeTeams::Team])
  end
  def update_cache(cache, files); end

  private

  # takes a file and finds the relevant `package.json` file by walking up the directory
  # structure. Example, given `packages/a/b/c.rb`, this looks for `packages/a/b/package.json`, `packages/a/package.json`,
  # `packages/package.json`, and `package.json` in that order, stopping at the first file to actually exist.
  # We do additional caching so that we don't have to check for file existence every time
  #
  # source://code_ownership//lib/code_ownership/private/ownership_mappers/js_package_ownership.rb#82
  sig { params(file: ::String).returns(T.nilable(::CodeOwnership::Private::ParseJsPackages::Package)) }
  def map_file_to_relevant_package(file); end
end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/package_ownership.rb#8
class CodeOwnership::Private::OwnershipMappers::PackageOwnership
  include ::CodeOwnership::Mapper

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/package_ownership.rb#69
  sig { override.void }
  def bust_caches!; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/package_ownership.rb#46
  sig { override.returns(::String) }
  def description; end

  # Package ownership ignores the passed in files when generating code owners lines.
  # This is because Package ownership knows that the fastest way to find code owners for package based ownership
  # is to simply iterate over the packages and grab the owner, rather than iterating over each file just to get what package it is in
  # In theory this means that we may generate code owners lines that cover files that are not in the passed in argument,
  # but in practice this is not of consequence because in reality we never really want to generate code owners for only a
  # subset of files, but rather we want code ownership for all files.
  #
  # source://code_ownership//lib/code_ownership/private/ownership_mappers/package_ownership.rb#36
  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def globs_to_owner(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/package_ownership.rb#16
  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/package_ownership.rb#58
  sig { params(package: ::Packs::Pack).returns(T.nilable(::CodeTeams::Team)) }
  def owner_for_package(package); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/package_ownership.rb#53
  sig do
    override
      .params(
        cache: T::Hash[::String, ::CodeTeams::Team],
        files: T::Array[::String]
      ).returns(T::Hash[::String, ::CodeTeams::Team])
  end
  def update_cache(cache, files); end
end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#8
class CodeOwnership::Private::OwnershipMappers::TeamGlobs
  include ::CodeOwnership::Mapper
  include ::CodeOwnership::Validator

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#112
  sig { override.void }
  def bust_caches!; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#117
  sig { override.returns(::String) }
  def description; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#57
  sig { returns(T::Array[::CodeOwnership::Private::OwnershipMappers::TeamGlobs::GlobOverlap]) }
  def find_overlapping_globs; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#103
  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def globs_to_owner(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#88
  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#20
  sig { params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def map_files_to_owners(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#95
  sig do
    override
      .params(
        cache: T::Hash[::String, ::CodeTeams::Team],
        files: T::Array[::String]
      ).returns(T::Hash[::String, ::CodeTeams::Team])
  end
  def update_cache(cache, files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#122
  sig do
    override
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#37
class CodeOwnership::Private::OwnershipMappers::TeamGlobs::GlobOverlap < ::T::Struct
  const :mapping_contexts, T::Array[::CodeOwnership::Private::OwnershipMappers::TeamGlobs::MappingContext]

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#43
  sig { returns(::String) }
  def description; end

  class << self
    # source://sorbet-runtime/0.5.11247/lib/types/struct.rb#13
    def inherited(s); end
  end
end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/team_globs.rb#32
class CodeOwnership::Private::OwnershipMappers::TeamGlobs::MappingContext < ::T::Struct
  const :glob, ::String
  const :team, ::CodeTeams::Team

  class << self
    # source://sorbet-runtime/0.5.11247/lib/types/struct.rb#13
    def inherited(s); end
  end
end

# source://code_ownership//lib/code_ownership/private/ownership_mappers/team_yml_ownership.rb#8
class CodeOwnership::Private::OwnershipMappers::TeamYmlOwnership
  include ::CodeOwnership::Mapper

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_yml_ownership.rb#46
  sig { override.void }
  def bust_caches!; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_yml_ownership.rb#58
  sig { override.returns(::String) }
  def description; end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_yml_ownership.rb#39
  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def globs_to_owner(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_yml_ownership.rb#31
  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_yml_ownership.rb#19
  sig { params(files: T::Array[::String]).returns(T::Hash[::String, ::CodeTeams::Team]) }
  def map_files_to_owners(files); end

  # source://code_ownership//lib/code_ownership/private/ownership_mappers/team_yml_ownership.rb#53
  sig do
    override
      .params(
        cache: T::Hash[::String, ::CodeTeams::Team],
        files: T::Array[::String]
      ).returns(T::Hash[::String, ::CodeTeams::Team])
  end
  def update_cache(cache, files); end
end

# Modeled off of ParsePackwerk
#
# source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#8
module CodeOwnership::Private::ParseJsPackages
  class << self
    # source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#57
    sig { returns(T::Array[::CodeOwnership::Private::ParseJsPackages::Package]) }
    def all; end
  end
end

# source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#13
CodeOwnership::Private::ParseJsPackages::METADATA = T.let(T.unsafe(nil), String)

# source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#12
CodeOwnership::Private::ParseJsPackages::PACKAGE_JSON_NAME = T.let(T.unsafe(nil), String)

# source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#15
class CodeOwnership::Private::ParseJsPackages::Package < ::T::Struct
  const :name, ::String
  const :metadata, T::Hash[::String, T.untyped]

  # source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#48
  sig { returns(::Pathname) }
  def directory; end

  class << self
    # source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#22
    sig { params(pathname: ::Pathname).returns(::CodeOwnership::Private::ParseJsPackages::Package) }
    def from(pathname); end

    # source://sorbet-runtime/0.5.11247/lib/types/struct.rb#13
    def inherited(s); end
  end
end

# source://code_ownership//lib/code_ownership/private/parse_js_packages.rb#11
CodeOwnership::Private::ParseJsPackages::ROOT_PACKAGE_NAME = T.let(T.unsafe(nil), String)

# source://code_ownership//lib/code_ownership/private/team_plugins/ownership.rb#5
module CodeOwnership::Private::TeamPlugins; end

# source://code_ownership//lib/code_ownership/private/team_plugins/github.rb#6
class CodeOwnership::Private::TeamPlugins::Github < ::CodeTeams::Plugin
  # source://code_ownership//lib/code_ownership/private/team_plugins/github.rb#13
  sig { returns(::CodeOwnership::Private::TeamPlugins::Github::GithubStruct) }
  def github; end

  class << self
    # source://code_ownership//lib/code_ownership/private/team_plugins/github.rb#57
    sig { returns(T::Boolean) }
    def require_github_teams?; end

    # source://code_ownership//lib/code_ownership/private/team_plugins/github.rb#23
    sig { override.params(teams: T::Array[::CodeTeams::Team]).returns(T::Array[::String]) }
    def validation_errors(teams); end
  end
end

# source://code_ownership//lib/code_ownership/private/team_plugins/github.rb#10
class CodeOwnership::Private::TeamPlugins::Github::GithubStruct < ::Struct
  # Returns the value of attribute do_not_add_to_codeowners_file
  #
  # @return [Object] the current value of do_not_add_to_codeowners_file
  def do_not_add_to_codeowners_file; end

  # Sets the attribute do_not_add_to_codeowners_file
  #
  # @param value [Object] the value to set the attribute do_not_add_to_codeowners_file to.
  # @return [Object] the newly set value
  def do_not_add_to_codeowners_file=(_); end

  # Returns the value of attribute team
  #
  # @return [Object] the current value of team
  def team; end

  # Sets the attribute team
  #
  # @param value [Object] the value to set the attribute team to.
  # @return [Object] the newly set value
  def team=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

# source://code_ownership//lib/code_ownership/private/team_plugins/ownership.rb#6
class CodeOwnership::Private::TeamPlugins::Ownership < ::CodeTeams::Plugin
  # source://code_ownership//lib/code_ownership/private/team_plugins/ownership.rb#11
  sig { returns(T::Array[::String]) }
  def owned_globs; end
end

# source://code_ownership//lib/code_ownership/private/validations/files_have_owners.rb#5
module CodeOwnership::Private::Validations; end

# source://code_ownership//lib/code_ownership/private/validations/files_have_owners.rb#6
class CodeOwnership::Private::Validations::FilesHaveOwners
  include ::CodeOwnership::Validator

  # source://code_ownership//lib/code_ownership/private/validations/files_have_owners.rb#12
  sig do
    override
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
end

# source://code_ownership//lib/code_ownership/private/validations/files_have_unique_owners.rb#6
class CodeOwnership::Private::Validations::FilesHaveUniqueOwners
  include ::CodeOwnership::Validator

  # source://code_ownership//lib/code_ownership/private/validations/files_have_unique_owners.rb#12
  sig do
    override
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
end

# source://code_ownership//lib/code_ownership/private/validations/github_codeowners_up_to_date.rb#6
class CodeOwnership::Private::Validations::GithubCodeownersUpToDate
  include ::CodeOwnership::Validator

  # source://code_ownership//lib/code_ownership/private/validations/github_codeowners_up_to_date.rb#12
  sig do
    override
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
end

# @abstract Subclasses must implement the `abstract` methods below.
#
# source://code_ownership//lib/code_ownership/validator.rb#4
module CodeOwnership::Validator
  interface!

  # @abstract
  #
  # source://code_ownership//lib/code_ownership/validator.rb#11
  sig do
    abstract
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end

  class << self
    # source://code_ownership//lib/code_ownership/validator.rb#25
    sig { returns(T::Array[::CodeOwnership::Validator]) }
    def all; end

    # source://code_ownership//lib/code_ownership/validator.rb#18
    sig { params(base: T::Class[::CodeOwnership::Validator]).void }
    def included(base); end
  end
end