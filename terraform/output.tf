output "master_public_ip" {
    value = aws_instance.master.public_ip
}

output "worker_public_ip" {
    value = aws_instance.worker.public_ip
}