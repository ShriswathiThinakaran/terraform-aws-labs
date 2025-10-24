provider "aws" {
  region = "us-east-1"  # Change region if needed
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c7217cdde317cfec"  # Example Amazon Linux 2023 AMI for us-east-1
  instance_type = "t2.micro"
  key_name = "ec2-lab-key"
         # Replace with your existing key pair
  tags = {
    Name = "MyTerraformInstance"
  }
}
