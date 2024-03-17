 provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "k8s-chave" {
  key_name   = "k8s-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbjahc0bf0YD5pHSq8cRfM9CavFHcUQsyeB7Q//62fbni832RkupkIqtwE35gRoj9hJsAOCpubLrYxjdfkFxyjq/1UG7ofVWTDrxp+kMNVE/mSV22MO+n05V1Q95mPfRyAlPdFq4oNxZHZK70+FDRDErlyQqeou11gI4qwhW9o5x8ivWplV4SgNPMkoGP3FuIjqfKv+Hjd3ApXo8JJpg1/oQFrrxbwfWuutL2Rf0Y+sEmkUqcAsVkdFa5h//Mc5jSosRW14REBZDjbAgNHFsAkNXQpUAOsmkVgU4czxq3wZe7GWHJS8cCvLSlsY3qhsIJGQFGyvdu5Rb4vWUcQFx7T rodrygo@rdgnote1"
}

resource "aws_security_group" "k8s-sgroup" {
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

} 

resource "aws_instance" "node-worker" {
  ami           = "ami-0f74c08b8b5effa56"
  instance_type = "t3.medium"
  key_name = "k8s-key"
  count = 2
  tags = {
    name = "tag-k8s"
    type = "tag-worker"
  }
  security_groups = ["${aws_security_group.k8s-sgroup.name}"]
}

resource "aws_instance" "node-cplane" {
  ami           = "ami-0f74c08b8b5effa56"
  instance_type = "t3.medium"
  key_name = "k8s-key"
  count = 1
  tags = {
    name = "tag-k8s"
    type = "tag-cplane"
  }
  security_groups = ["${aws_security_group.k8s-sgroup.name}"]
}

