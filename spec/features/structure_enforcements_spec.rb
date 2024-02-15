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
    # - packs/agile_landscape
    # - packs/books
    # - packs/contact
    # - packs/posts
    # - packs/rails_shims
    # - packs/root
    # - packs/services
    # - packs/speaking
    # - packs/tags
    # 
    # layer: application_harness
