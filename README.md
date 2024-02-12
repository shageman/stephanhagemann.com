# stephanhagemann.com

## Development

```
cd stephanhagemann.com
bundle

bin/packwerk validate
bin/packwerk check
bin/rubocop
echo "puts Speaking::Talk.count" | bin/rails c 

bin/rails s
```