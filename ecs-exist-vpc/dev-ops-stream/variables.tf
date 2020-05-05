# variables.tf

variable "prefix" {
  description = "Prefix for all envirnoments"
  default     = "ops-stream"
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "ap-southeast-1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "OpsStreamEcsTaskExecutionRole"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 2
}

variable "health_check_path" {
  default = "/api/v2/index"
}

variable "ops_stream_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "XXXXXXXXXXX.dkr.ecr.ap-southeast-1.amazonaws.com/dev-application:2.0.0"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "ops_stream_container_name" {
  description = "Ops Stream container name"
  default     = "ops-stream-app"
}

# make sure about vpc name, check network terraform folder to find out
variable "vpc_name" {
  description = "Prefix for all envirnoments"
  default = "dev-data-stream-vpc"
}

