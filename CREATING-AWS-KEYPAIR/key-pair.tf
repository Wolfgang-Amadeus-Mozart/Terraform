resource "aws_key_pair" "key-pair" {
  key_name   = "terraform-keypair"
  public_key = file("./terraform-keypair.pub")
}