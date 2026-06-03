provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:1.25.3"
}

resource "docker_container" "recette" {
  name  = "stacknova-recette"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  labels {
    label = "env"
    value = "recette"
  }

  labels {
    label = "project"
    value = "stacknova"
  }
}
