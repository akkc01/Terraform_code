output "vm_public_ip_addresses" {
  value = [
    "vm1 public ip = ${module.pips_module.public_ip_addresses["pip1"]}",
    "vm2 public ip = ${module.pips_module.public_ip_addresses["pip2"]}"
  ]
}
