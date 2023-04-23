# https://spacelift.io/blog/terraform-aws-vpc

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "fake-product-staging" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fake-product-staging"
  }
}

resource "aws_vpc" "fake-product-production" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "fake-product-production"
  }
}

resource "aws_subnet" "private_subnets_staging" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.fake-product-staging.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets_production" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.fake-product-production.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}
