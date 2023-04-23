# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "fake-product" {
  bucket = "fake-product-assets"

  tags = {
    Name = "fake-product-assets"
  }
}
