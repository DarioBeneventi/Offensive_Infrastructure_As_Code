# main.tf - 
# Disclaimer - We use AWS to automate so be aware that this service uses your personal credit card info unless...
# Copy paste SSH public key
resource "aws_key_pair" "ssh_key" {
    key_name        = "key"
    public_key      = "ssh_rsa ......"
}

# Empty resource, default AWS VPC(network) already exists
resource "aws_default_vpc" "default" {
}

# Firewall rule to allow SSH from our bouncing server IP only (ingress), outgoing traffic is allowed (egress)
resource "aws_security_group" "SSHAdmin" {
    name            = "SSHSuperUser"
    description     = "SSH allow traffic"
    vpc_id          = "aws_default_vpc.default.id"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["my.super.secret.ip/32"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Link the SSH key & security group to our ec2 server
resource "aws_instance" "basic_ec2" {
    ami             = "ami-..."
    instance_type   = "t2.micro"

    vpc_security_group_ids      = aws_security_group.SSHSuperUser.id
    key_name                    = aws.ssh_key.id
    associate_public_ip_address = "true"
    root_block_device {
        volume_size = "25"
    }
}

# Print servers public ip
ouput "public_ip" {
    value = "aws_instance.basic_ec2.public_ip"
}
