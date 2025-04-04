resource "aws_ecr_repository" "repo" {
  for_each = local.ecr_repos

  name                 = each.key
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

