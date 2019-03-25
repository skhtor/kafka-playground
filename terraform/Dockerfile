from hashicorp/terraform

RUN adduser -S terraform
USER terraform
WORKDIR /home/terraform

COPY . .

ENTRYPOINT [ '/bin/sh' ]
