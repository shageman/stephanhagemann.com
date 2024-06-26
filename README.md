# stephanhagemann.com

[![Netlify Status](https://api.netlify.com/api/v1/badges/d673fc38-8df5-4186-8181-45d2a90eb174/deploy-status)](https://app.netlify.com/sites/stephanhagemann-com/deploys) [![Regular scheduled build](https://github.com/shageman/stephanhagemann.com/actions/workflows/regular-build.yml/badge.svg?branch=main)](https://github.com/shageman/stephanhagemann.com/actions/workflows/regular-build.yml)

## Deploy

Be sure to have `rust` installed. Then `cargo install pks` to allow pks to check packwerk boundaries and is executed as part of the pre-commit hooks found in [.lefthook](https://github.com/shageman/stephanhagemann.com/blob/main/lefthook.yml).

Pushing to git will deploy a new version of the site to netlify.

To see locally what will end up in netlify, run `bin/static-build` and check the output in the `build` folder.

## Development

```
cd stephanhagemann.com
bundle

lefthook install

bin/rails s
```

### Visualize Structure

```
dot packs.dot -Tpng -o packs.png && open packs.png
```

### Verify structural independence

`pks` can prove quite a bit about the separateness or entanglement of packages (learn more at https://gradualmodularization.com or https://github.com/orgs/rubyatscale/repositories). This codebase has all enforcements set to true (strict where possible) and doesn't allow for exceptions. That said, `pks` can't prove that a package can operate independently from other packages that it does not depend on because their might be relationships that `pks` can't see (metaprogramming!). To verify the structural independence of packages as implied by their dependency graph, run the below command. The script will loop over all the packages and *delete* for each package all packages that it doesn't depend on and then execute tests to verify that the remaining app still works.

```
./isolation_checker.sh
```

### Importing new Agile Landscape data

Create a new version of the source data in <https://docs.google.com/spreadsheets/d/10tSoXkNMRWGEDboGZrYasxc8Ak_YIscgTjnP1pmnRLI/edit#gid=0> and use the JSON tab to grab a json representation. Put that in `packs_userfacing/agile_landscape/lib/tasks/agile_landscape_raw.json`. Then run 

```
rake agile_landscape:etl
```
