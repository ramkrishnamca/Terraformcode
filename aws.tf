# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_RAMA_KEY" {}

provider "aws" {
  region = "us-east-1"
  access_key ="${var.AWS_ACCESS_KEY}"
  secret_key ="${var.AWS_SECRET_KEY}"

}
/* aws pair creation */
resource "aws_key_pair" "devopskey" {
  key_name    = "devopskey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDScKU4LBAPXrumGvAEt8v6qEImlR/DK289BAWKyulaG0ROlb6Bxh1R9z7HYTpPQGviep67Ql0gcT0yPn/BR2A61/Z9tMViqfJLfzZi9s+fzrAfLbuBG2+BbULATiU6l+weqSV0KWl3OLf7BSQA1TWi1UHqAz0X0eyvczyXo5bF/hYy0Ixv2nN2AcW5v1ajIQnQ6hmyDZmT4d/GjmQfnM9iNSjIdtEz7NVN5u0On4wqErZSuB+zcGI1VItvosOXE4f3eUSyv+huwSAdFXPTMq/Xbr2HB/PV6zsuCcO3pnAB0ztmTBIgkBa6aLp2WMya1SavRCXLHdH+J8KIOjb340N7 root@ip-11-0-0-30.eu-central-1.compute.internal"
}

resource "aws_instance" "web" {
  ami  	         = "ami-29976653"
  instance_type  = "t2.micro"
  key_name       = "${aws_key_pair.devopskey.key_name}"
  tags {
  Name = "TerraformTest"
  }
}

