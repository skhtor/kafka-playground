# Playground for running a distributed Kafka cluster built with terraform and ansible

## Usage
- Create your ~/.aws/config and ~/.aws/credentials file so that you can connect to the AWS provider
- Export your `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION`
- Run the following command:
  - `env | grep AWS > env_file && docker run --rm -it -v $(pwd):/tmp -v ~/.aws:/root/.aws --entrypoint '/bin/sh' --env-file env_file hashicorp/terraform`
  - The above command passes in your exported AWS credentials to the container, and mounts the code in the current working directory to the `/tmp` directory
- cd to `/tmp/terraform` and run your terraform commands there
