# Playground for running a distributed Kafka cluster built with terraform and ansible

## Note
Instance provisioning happens in the related ansible repo. https://github.com/soony88/kafka-playground-ansible.git

## Usage
- Create your ~/.aws/config and ~/.aws/credentials file so that you can connect to the AWS provider
- Export your `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION`
- Run the following command:
  - `env | grep AWS > env_file && docker run --rm -it -v $(pwd):/tmp -v ~/.aws:/root/.aws --entrypoint '/bin/sh' --env-file env_file hashicorp/terraform`
  - The above command passes in your exported AWS credentials to the container, and mounts the code in the current working directory to the `/tmp` directory
- cd to `/tmp/terraform` and run your terraform commands there

## Other docos
- Install: https://docs.confluent.io/current/installation/index.html
- Ansible playbooks: https://docs.confluent.io/current/tutorials/cp-ansible/docs/index.html#in-scope
- Running in Production: https://docs.confluent.io/current/kafka/deployment.html
- Kafka multinode: https://docs.confluent.io/current/kafka/multi-node.html
- AWS Kafka Best Practices: https://aws.amazon.com/blogs/big-data/best-practices-for-running-apache-kafka-on-aws/
