output "Public ip" {
  value = "${digitalocean_droplet.web.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.web.name}"
}
