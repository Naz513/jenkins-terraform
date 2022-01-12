output "instance_ip" {
  description = "The public IP of the jenkins server."
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
}

output "amzn_ami" {
  description = "The AMI that will be used to provision this Server."
  value       = data.aws_ami.latest_amzn_ami.name
}