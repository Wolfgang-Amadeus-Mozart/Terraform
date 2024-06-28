resource "aws_key_pair" "key-pair" { #call for the aws keys resource creating and give a terraform name to it
  key_name   = "terraform-keypair" #Give a name to the key
  public_key = file("./terraform-keypair.pub") #Reads a local File
}