resource "aws_s3_bucket" "terraform-bucket-s3" { #defining resource and giving a resource name in terrafor
  bucket = "codepipeline-filipe1"

  tags = {
    Name        = "TerraformCreatedBucket" #defining bucket name
  }
}