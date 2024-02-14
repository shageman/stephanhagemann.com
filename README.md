# stephanhagemann.com

## Development

```
cd stephanhagemann.com
bundle

lefthook install

bin/rails s
```

You will need to have a local server running at http://localhost:3000 in order to make a commit. That's because lefthook runs a command to verify that there are no 404s reachable from the root page

## Visualize Structure

```
dot packs.dot -Tpng -o packs.png && open packs.png
```
 