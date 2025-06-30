output "fvm_pip" {
  value = "Frontend_VM IP address is- ${module.pip.fvm_pip}, You can Access using ssh Only."

}

output "bvm_pip" {
  value = "Backend_VM IP address is- ${module.pip.bvm_pip}, You can Access using ssh Only."
}
