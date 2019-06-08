resource "aws_ecr_repository" "plimage_repo" {
  name     = "processlink"
}

resource "aws_ecr_repository_policy" "plimage_repo_policy" {
  repository = "${aws_ecr_repository.plimage_repo.name}"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "plimage policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:ListImages"
            ]
        }
    ]
}
EOF
}