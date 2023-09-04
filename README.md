# README
## OMS API

### Development Setup
- Ruby version 2.7.1
- Rails version 6.0.4
### System Level Dependencies:
- PostgreSQL 14.1
### Project Level Dependencies
- bundle install
### Setting up the Database
```
rails db:create
```
```
rails db:migrate
```
```
rails db:seed
```
### Start the Rails Server
```
rails server
```
### Running Tests
```
bundle exec rspec
```
# DevOps Project

This repository contains code and configuration for a DevOps project.

## Project Structure

The project is structured as follows:

- **Docker Files**: Dockerfiles and related configuration files are located in the `Dockerfiles` folder.
- **Terraform Files**: Infrastructure provisioning using Terraform is defined in the `Terraform` folder.

## Building the Docker Image

To build the Docker image for the application, follow these steps:

1. Open a terminal and navigate to the root directory of the project.
2. Run the following command to build the Docker image:

    ```bash
    docker build . --file ./Dockerfiles/Dockerfile
    ```

## Using Docker Compose

To run the application using Docker Compose, ensure you have Docker Compose installed on your system. If not, you can install it [here](https://docs.docker.com/compose/install/).

Follow these steps to run the application:

1. Open a terminal and navigate to the root directory of the project.
2. Change directory to the `Dockerfiles` folder:

    ```bash
    cd Dockerfiles
    ```

3. Run the following command to start the application using Docker Compose:

    ```bash
    docker-compose up
    ```

## Terraform

### Prerequisites

Before using Terraform, make sure you have the following prerequisites:

- **AWS Credentials**: If your Terraform configuration targets AWS resources, ensure you have valid AWS credentials configured, either by setting environment variables or using AWS CLI profiles.

### Usage

To provision and manage infrastructure using Terraform, follow these steps:

1. Open a terminal and navigate to the `Terraform` directory.
2. The remote state is managed on an AWS S3 bucket.
3. Initialize Terraform by running:

    ```bash
    terraform init
    ```

4. Plan and apply the changes to provision the infrastructure:

    ```bash
    terraform plan
    terraform apply
    ```

### Continuous Integration (CI) with GitHub Actions

CI workflows are defined in the `.github/workflows/rails-CI.yml` directory.

### Continuous Deployment (CD) with Jenkinsfile

Continuous Deployment is managed using a Jenkinsfile, which defines the deployment pipeline in Jenkins.

---

Feel free to customize this README template with specific details about your project, including installation instructions, dependencies, and usage examples. Replace any placeholders with your project-specific information.






