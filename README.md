# stephanhagemann.com

## Development

```
cd stephanhagemann.com
bundle

lefthook install

bin/rails s
```

## Before Commits

Before commit run the following to validate you have no issues:

```
lefthook run pre-commit --force
```

## Visualize Structure

```
dot packs.dot -Tpng -o packs.png && open packs.png
```
