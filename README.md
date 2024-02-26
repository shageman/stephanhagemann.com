# stephanhagemann.com

## Development

cd stephanhagemann.com
bundle

lefthook install

bin/rails s
```

You will need to have a local server running at http://localhost:3000 in order to make a commit. That's because lefthook runs a command to verify that there are no 404s reachable from the root page

## Deploy

Be sure to have rust installed. Then `cargo install pks` to allow pks to check packwerk boundaries.

Pushing to git will deploy a new version of the site to netlify.

To see locally what will end up in netlify, run the following and check the output in the `build` folder:

```
bin/static-build
```

## Visualize Structure

```
dot packs.dot -Tpng -o packs.png && open packs.png
```

## Importing new Agile Landscape data

Create a new version of the source data in <https://docs.google.com/spreadsheets/d/10tSoXkNMRWGEDboGZrYasxc8Ak_YIscgTjnP1pmnRLI/edit#gid=0> and use the JSON tab to grab a json representation. Put that in `packs/agile_landscape/lib/tasks/agile_landscape_raw.json`. Then run 

```
rake agile_landscape:etl
```

## Todos
