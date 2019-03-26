# Playground for running a distributed Kafka cluster built with terraform and ansible

## Usage
- Create your ~/.aws/config and ~/.aws/credentials otherwise the s3 statestore wont have credentials to init
- Pass your aws access keys into the variables.tf file
- `docker run --rm -it -v $(pwd):/tmp -v ~/.aws:/root/.aws --entrypoint "/bin/sh"  hashicorp/terraform`
