resource "aws_instance" "webserver"{
	ami = "ami-00d2dbb426772b03a"
	instance_type = "t2.micro"
}
