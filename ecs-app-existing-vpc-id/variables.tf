# variables.tf

variable "prefix" {
  description = "Prefix for all envirnoments"
  default     = "ops-reader"
}

variable "short-prefix" {
  description = "Prefix for all envirnoments"
  default     = "ds"
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "ap-southeast-1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "OpsReaderEcsTaskExecutionRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}



variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "health_check_path" {
  default = "/api/v2/index"
}

variable "ops_stream_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "466551463358.dkr.ecr.ap-southeast-1.amazonaws.com/dev-ops-stream:2.0.0"
}


####  Ops Reader Variables
variable "ops_reader_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "466551463358.dkr.ecr.ap-southeast-1.amazonaws.com/dev-ops-stream:2.0.0"
}

variable "ops_reader_health_check_path" {
  default = "/api/v2/index"
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

variable "ops_reader_container_name" {
  description = "Ops Reader container name"
  default     = "ops-reader-app"
}



