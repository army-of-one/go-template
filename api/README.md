# API

This directory stores the API specification. The specification should be a valid 
swagger 2.0 yaml. 

The spec can be added manually or during generation.

The spec name should be: `swagger.yml`.

To generate the files from the spec, run (from root):

```
make swagger
```

## Future Features

- Overrides for swagger filename
- Script to run this for .yaml/.yml files in dir.