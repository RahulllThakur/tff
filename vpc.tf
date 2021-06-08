provider "google" {
  project = "myfirstproject-315506" 
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_instance" "vm_instance" {
  name         = "Jenkins-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

 network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  #  metadata_startup_script = "sudo apt-get -y update && sudo apt-get -y install openjdk-8-jdk && sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add - && sudo echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list && sudo apt-get -y update && sudo apt-get -y install jenkins "

}
