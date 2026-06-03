output "container_name" {
  value = docker_container.recette.name
}

output "container_port" {
  value = "http://localhost:${docker_container.recette.ports[0].external}"
}
