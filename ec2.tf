resource "aws_instance" "example" {
  ami                     = "ami-0c55b159cbfafe1f0"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.instance.id]
 
  tags = {
    Name = "terraform-example"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "Witaj, świecie" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

