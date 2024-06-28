resource "aws_s3_bucket" "terraform-bucket-s3" {
  bucket = "codepipeline-filipe1"

  tags = {
    Name        = "TerraformCreatedBucket"
  }
}