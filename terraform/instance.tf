data "aws_ami" "ami" {
	most_recent = true

	filter {
		name   = "name"
		values = ["amzn-ami-hvm-*"]
	}

	owners = ["amazon"]
}

resource "aws_instance" "main" {
	ami           = data.aws_ami.ami.id
	instance_type = "t2.micro"
	key_name      = "idwall-${var.AWS_REGION}"
	user_data     = file("script/init.sh")

	tags = {
		Name = "idwall-test"
	}
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
	security_group_id    = aws_security_group.main_sg.id
	network_interface_id = aws_instance.main.primary_network_interface_id
}
