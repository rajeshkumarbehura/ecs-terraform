[
  {
    "name": "${container_name}",
    "image": "${app_image}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "networkMode": "awsvpc",
    "environment": [
      {
        "name": "DB_PASSWORD",
        "value": "TESTING_PASSWORD"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/ops-stream-app",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "ecs"
      }
    },
    "portMappings": [
      {
         "containerPort": ${app_port},
         "hostPort": ${app_port}
      }
    ]
  }
]
