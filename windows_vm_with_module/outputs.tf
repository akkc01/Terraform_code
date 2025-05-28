output "vm_public_ip" {
  value = module.public_ip.public_ip
}

output "vm_id" {
  value = module.vm.vm_id
}
