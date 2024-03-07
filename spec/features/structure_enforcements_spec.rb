# typed: false
# enforce that route and path helpers are not used outside of the package defining the routes
# enforce that global routes file only draw routes
  # and that drawn routes are found via constant
# enforce that dependency, privacy, and architecture are set to strict
  # enforce that file looks like this:
    # enforce_architecture: strict
    # enforce_dependencies: strict
    # enforce_privacy: strict
    #
    # dependencies:
    # - packs_userfacing/agile_landscape
    # - packs_userfacing/books
    # - packs_userfacing/contact
    # - packs_userfacing/posts
    # - packs_utility/rails_shims
    # - packs_userfacing/root
    # - packs_userfacing/services
    # - packs_userfacing/speaking
    # - packs_userfacing/tags
    #
    # layer: application_harness
