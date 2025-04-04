# Variables
APP_NAME := containers-app
ECR_REPO := 911679516338.dkr.ecr.us-east-1.amazonaws.com/containers-app
AWS_REGION := us-east-1
DOCKERFILE := Dockerfile
IMAGE_TAG := $(shell git rev-parse --short HEAD)
TF_DIR := ecs

# Build the Docker image
build:
	docker build -t $(APP_NAME):$(IMAGE_TAG) -f $(DOCKERFILE) .

# Tag the Docker image with ECR repository URL
tag:
	docker tag $(APP_NAME):$(IMAGE_TAG) $(ECR_REPO):$(IMAGE_TAG)

# Push the Docker image to ECR
push:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(ECR_REPO)
	docker push $(ECR_REPO):$(IMAGE_TAG)

# Build and push the Docker image to ECR
ecr: build tag push

# Run terraform plan in the ecs directory
plan:
	cd $(TF_DIR) && terraform init && terraform plan -input -var="image_tag=$(IMAGE_TAG)"

# Run terraform apply in the ecs directory
deploy: ecr
	cd $(TF_DIR) && terraform init && terraform apply -input=false -auto-approve -var="image_tag=$(IMAGE_TAG)"

destroy:
	cd $(TF_DIR) && terraform init && terraform destroy -input=false -auto-approve -var="image_tag=$(IMAGE_TAG)"
