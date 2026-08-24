# Create a key pair for login
resource "aws_key_pair" "my_key" {
  public_key = file("terra-key.pub")
  key_name = "my_terra_key"
}
# Create a VPC and SG with required ports
resource "aws_default_vpc" "default" {

}

#create SG
resource "aws_security_group" "my_security_group" {
  name = "terraform_sg"
  description = "SG created with terraform"
  vpc_id = aws_default_vpc.default.id
}

#ports
resource "aws_vpc_security_group_ingress_rule" "inbound" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.my_security_group.id
  from_port = 22
  to_port = 22
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "outbound" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
}
# Create the EC2 Instances
resource "aws_instance" "my_instance" {
  ami = var.instance_ami # OS AMI ID

	instance_type = var.instance_type # Instance Type

	key_name = aws_key_pair.my_key.key_name	# Key pair

	vpc_security_group_ids = [aws_security_group.my_security_group.id] # VPC & Security Group

	# root storage (EBS)
	root_block_device {
		volume_size = 10
		volume_type = "gp3"
	}

	tags = {
    Name = "terra-automate-server"
  }
}
