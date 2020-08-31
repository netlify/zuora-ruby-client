# How to generate this library

```
docker run -w /foo -v$PWD:/foo --rm -it swaggerapi/swagger-codegen-cli:v2.3.0 generate -i zuora.yml -o . -l ruby -c swagger_config.json
```
