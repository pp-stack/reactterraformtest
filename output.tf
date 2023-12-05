output "public_dns" {
    description = "Public DNS of the created instance with HTTP link"
    value = "http://${aws_instance.react-app.public_dns}"
}