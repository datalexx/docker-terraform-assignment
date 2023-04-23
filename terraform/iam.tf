# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
resource "aws_iam_user" "admins" {
  count = length(var.admins)
  name  = element(var.admins, count.index)
}

resource "aws_iam_user" "fake-product" {
  name = "fake-product"
}

resource "aws_iam_user_policy_attachment" "admin-attach" {
  count      = length(var.admins)
  user       = element(var.admins, count.index)
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_examples_s3_rw-bucket.html
data "aws_iam_policy_document" "bucket-rw" {
  statement {
    actions   = ["s3:ListBucket", "s3:*Object"]
    resources = [aws_s3_bucket.fake-product.arn]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "bucket-rw" {
  name   = "bucket-rw-access"
  policy = data.aws_iam_policy_document.bucket-rw.json
}

resource "aws_iam_user_policy_attachment" "bucket-attach" {
  user       = aws_iam_user.fake-product.name
  policy_arn = aws_iam_policy.bucket-rw.arn
}
