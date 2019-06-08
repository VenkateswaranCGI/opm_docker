output "ecr_repository_url" {
  value = "${aws_ecr_repository.plimage_repo.repository_url}"
}