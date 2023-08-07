# main.tf - 
# Disclaimer - We use AWS to automate so be aware that this service uses your personal credit card info unless you use a burner card 
resource "aws_instance" "basic_ec2" {
    ami             = "ami-..."
    instance_type   = "t2.micro"
}