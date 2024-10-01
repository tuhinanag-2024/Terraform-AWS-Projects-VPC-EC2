resource "aws_instance" "PublicEC2" {
  ami =   "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.PublicSubnet_A.id}"
  key_name = "AddYourPemFile"
  tags = {
    Name = "PublicEC2_TF_Project-1"
  }
  depends_on = [aws_vpc.mainvpc,aws_subnet.PublicSubnet_A,aws_security_group.allow_ssh]
}

resource "aws_instance" "PrivateEC2" {
  ami =   "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.PrivateSubnet_B.id}"
  key_name = "AddYourPemFile"
  tags = {
    Name = "PrivateEC2_TF_Project-1"
  }
  depends_on = [aws_vpc.mainvpc,aws_subnet.PrivateSubnet_B,aws_security_group.allow_ssh]
}
