#! /bin/bash

cat > ./task-definition.json <<EOF
[
    {
      "volumesFrom": [],
      "memory": 512,
      "portMappings": [
        {
          "hostPort": 80,
          "containerPort": 80,
          "protocol": "tcp"
        },
        {
          "hostPort": 3000,
          "containerPort": 3000,
          "protocol": "tcp"
        }
      ],
      "essential": true,
      "entryPoint": [],
      "mountPoints": [],
      "name": "rails-wercker-web-container",
      "environment": [
        {
          "name": "AWS_RDB_ENDPOINT",
          "value": "$AWS_RDB_ENDPOINT"
        },
        {
          "name": "AWS_RDB_PASSWORD",
          "value": "$AWS_RDB_PASSWORD"
        },
        {
          "name": "AWS_RDB_USERNAME",
          "value": "root"
        },
        {
          "name": "RAILS_SERVE_STATIC_FILES",
          "value": "true"
        },
        {
          "name": "RAILS_MASTER_KEY",
          "value": "$RAILS_MASTER_KEY"
        }
      ],
      "links": [],
      "image": "$AWS_REGISTRY_ID.dkr.ecr.$AWS_REGION.amazonaws.com/rails-wercker:$ECR_TAG",
      "command": [],
      "cpu": 3
    }
]
EOF
