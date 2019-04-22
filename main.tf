variable "hostname" {}
variable "image" {}
variable "private_key_path" {}
variable "public_key_path" {}
variable "region" {
	default = "fra1"
}
variable "size" {
	default = "s-1vcpu-1gb"
}s

# Create a new Web Droplet in the fra1 region
resource "digitalocean_droplet" "web" {
	image  = "${var.image}"
	name   = "${var.hostname}"
	region = "${var.region}"
	size   = "${var.size}"
	ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]

	provisioner "remote-exec" {
		connection {
			type     = "ssh"
			user     = "root"
			private_key = "${file(var.private_key_path)}"
			timeout  = "2m"
		}

		inline = [
			"apt-get -y update",
			"apt-get -y install nginx",
		]
	}
}
