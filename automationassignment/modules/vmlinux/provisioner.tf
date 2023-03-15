resource "null_resource" "provisioner" {
  depends_on = [azurerm_linux_virtual_machine.vm]

connection {
  type        = "ssh"
  user        = var.admin_username
  private_key = file(var.ssh_private_key)
  host        = azurerm_linux_virtual_machine.vm.public_ip_address
}


provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install nginx",
    ]
  }
}

resource "null_resource" "provisioner2" {
  depends_on = [azurerm_linux_virtual_machine.vm2]

  connection {
    type        = "ssh"
    user        = var.admin_username
    private_key = file(var.ssh_private_key)
    host        = azurerm_linux_virtual_machine.vm2.public_ip_address
}

  provisioner "remote-exec" {
  inline = [
  "sudo yum -y update",
  "sudo yum -y install epel-release",
  "sudo yum -y install nginx",
    ]
  }
}
