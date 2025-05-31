# Playwright TypeScript Tailscale Docker Image

This repository contains a Dockerfile and GitHub Actions workflow to build a Docker image based on Ubuntu 22.04, with the following features:

- Installs Node.js, npm, and ts-node for running TypeScript projects
- Installs Playwright and all required dependencies for browser automation
- Installs Tailscale for secure networking
- Includes common utilities like curl, git, vim, and sudo

## Dockerfile
The Dockerfile sets up an Ubuntu 22.04 environment with all the necessary tools for running Playwright tests and using Tailscale. It also installs Playwright browsers and global TypeScript support.

## GitHub Actions Workflow
The `.github/workflows/docker-publish.yml` workflow automatically builds and pushes the Docker image to Docker Hub when changes are pushed to the `main` branch.

### Docker Hub Authentication
To enable Docker Hub deployment, add the following repository secrets in your GitHub repository:
- `DOCKERHUB_USERNAME`: Your Docker Hub username
- `DOCKERHUB_TOKEN`: A Docker Hub access token (create one from your Docker Hub account)


## Docker Hub
The built image can be accessed on Docker Hub at: [sudtanj/playwright-typescript-tailscale-docker](https://hub.docker.com/r/sudtanj/playwright-typescript-tailscale-docker)

## Usage
1. Clone this repository and modify the Dockerfile as needed.
2. Push changes to the `main` branch to trigger the GitHub Actions workflow.
3. The built image will be available on Docker Hub under your account and at the link above.

## Example Docker Run
```
docker run --rm -it your-dockerhub-username/playwright-typescript-tailscale:latest bash
```

Replace `your-dockerhub-username` with your actual Docker Hub username.

---

Feel free to customize the Dockerfile and workflow for your specific needs!
