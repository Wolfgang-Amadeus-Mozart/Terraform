resource "aws_key_pair" "deployer" {
  key_name   = "local-generated-wsl-key"
  public_key = file("./local-generated-wsl-key.pub")
}

resource "aws_instance" "aws-instance" {
  ami                         = "ami-0bb84b8ffd87024d8"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
   subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.sgId]
  associate_public_ip_address = true

  tags = {

    Name = "EC2-Terraform"
  }

}