# outputs.tf
output "aws_vpc_id" {
  value = aws_vpc.main.id
}


output "aws_subnet_id" {
  value = aws_subnet.public.*.id
}


data "aws_subnet"  "public_1a"{
  filter {
    name = "tag:Name"
    values = ["dev-data-stream-public-subnet"]
  }
  filter {
    name = "availability-zone"
    values = ["ap-southeast-1a"]
  }
}

data "aws_subnet"  "public_1b"{
  filter {
    name = "tag:Name"
    values = ["dev-data-stream-public-subnet"]
  }
  filter {
    name = "availability-zone"
    values = ["ap-southeast-1b"]
  }
}


data "aws_subnet"  "public_1c"{
  filter {
    name = "tag:Name"
    values = ["dev-data-stream-public-subnet"]
  }
  filter {
    name = "availability-zone"
    values = ["ap-southeast-1c"]
  }
}



output "aws_vpc" {
  value = data.aws_subnet.public_1a.id
}
output "aws_vpc2" {
  value = data.aws_subnet.public_1b.id
}
