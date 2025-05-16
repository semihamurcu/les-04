locals {
  vms = {
    webserver = "web"
    databaseserver  = "db"
  }
}

resource "esxi_guest" "vm" {
  for_each          = local.vms
  guest_name        = each.key
  disk_store        = "Datastore1"
  ovf_source        = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"

  network_interfaces {
    virtual_network = "VM Network"
  }

  guestinfo = {
    "metadata"          = base64encode(templatefile("${path.module}/metadata.yaml.tftpl", { hostname = each.key }))
    "metadata.encoding" = "base64"
    "userdata"          = filebase64("${path.module}/userdata.yaml")
    "userdata.encoding" = "base64"
  }
}

resource "local_file" "ansible_inventory" {
  content = <<EOF
[web]
%{ for name, role in local.vms ~}
%{ if role == "web" }${name} ansible_host=${esxi_guest.vm[name].ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/devhostnieuw
%{ endif ~}
%{ endfor ~}

[db]
%{ for name, role in local.vms ~}
%{ if role == "db" }${name} ansible_host=${esxi_guest.vm[name].ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/devhostnieuw
%{ endif ~}
%{ endfor ~}
EOF

  filename = "${path.module}/inventory.ini"
}