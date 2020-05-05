# outputs.tf


output "aws_vpc_id" {
  value = aws_vpc.main.id
}


output "aws_subnet_id" {
  value = aws_subnet.public.*.id
}


data "aws_vpc" "main" {
  filter {
    name = "tag:Name"
    values = ["data-stream-test-vpc"]
  }
}

data "aws_subnet" "public1" {
  filter {
    name = "tag:Name"
    values = ["data-stream-test-public-subnet"]
  }

  filter {
    name = "availability-zone"
    values = ["ap-southeast-1a"]
  }
}

data "aws_subnet" "public2" {
  filter {
    name = "tag:Name"
    values = ["data-stream-test-public-subnet"]
  }

  filter {
    name = "availability-zone"
    values = ["ap-southeast-1a"]
  }
}


output "aws_vpc_name" {
  value = data.aws_vpc.main.id
}


output "aws_vpc" {
  value = data.aws_vpc.main
}



output "aws_subnet________" {
  value = data.aws_subnet.public1.id
}
