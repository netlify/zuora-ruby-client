# How to generate this library

1. docker pull swaggerapi/swagger-codegen-cli
2. rm -rf tmp && mkdir tmp
3. docker run -w /foo -v$PWD:/foo --rm -it swaggerapi/swagger-codegen-cli generate -i zuora.yml -o tmp -l ruby --additional-properties gemName=zuora --additional-properties moduleName=Zuora
4. chown -R YOUR_LOCAL_USER tmp/*
5. mv tmp/* .
