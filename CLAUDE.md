# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the documentation repository for RISKEN - a microservice-based security monitoring platform that supports AWS, GCP, Azure, web applications, domains, and source code management. The documentation is built using MkDocs with Material theme and supports both Japanese and English languages.

## Common Development Commands

### Documentation Development
```bash
# Install MkDocs and dependencies
make install

# Build the documentation
make build

# Run documentation server locally (http://localhost:8001)
make run

# Alternative: Run with Docker
docker run --rm -it -p 8001:8001 -v ${PWD}:/docs squidfunk/mkdocs-material
```

### RISKEN Platform Development (Docker Compose)
```bash
# Start all RISKEN services
docker-compose up -d

# Stop all services
docker-compose down

# View logs
docker-compose logs -f [service-name]

# Restart specific service
docker-compose restart [service-name]
```

## Architecture & Structure

### Documentation Structure
- `/docs/` - Source markdown files organized by feature
  - `*.md` - Japanese documentation (primary)
  - `*.en.md` - English documentation
  - Subdirectories for each major component (aws/, gcp/, diagnosis/, etc.)
- `/img/` - Documentation images and diagrams
- `/site/` - Built HTML output (generated, do not edit)

### Key Configuration Files
- `mkdocs.yml` - MkDocs configuration with navigation, theme, and plugin settings
- `docker-compose.yaml` - Full RISKEN platform setup for local testing
- `Makefile` - Build and development commands
- `requirements.txt` - Python dependencies for MkDocs

### RISKEN Service Architecture
The platform consists of multiple microservices:
- **Core Services**: API Gateway, Core Service, Alert Service
- **Cloud Scanners**: AWS, GCP, Azure, Diagnosis
- **Security Scanners**: OSINT, Code (Gitleaks)
- **Infrastructure**: MySQL, SQS-compatible queue, Nginx proxy

## Documentation Guidelines

### Language Support
- Primary language: Japanese (`.md` files)
- Translations: English (`.en.md` files)
- Keep both versions synchronized when making changes

### Navigation Structure
The documentation follows a hierarchical structure defined in `mkdocs.yml`:
1. Home/Introduction
2. Cloud Services (AWS, GCP, Diagnosis)
3. Web Application Security
4. OSINT
5. Code Security
6. Admin Features
7. API Reference

### Adding New Documentation
1. Create Japanese version first in appropriate directory
2. Add English translation with `.en.md` extension
3. Update navigation in `mkdocs.yml` for both languages
4. Place images in `/img/` directory with descriptive names

## Development Workflow

### Local Documentation Testing
1. Make changes to markdown files
2. Run `make run` to preview locally
3. Verify both Japanese and English versions
4. Build with `make build` to check for errors

### RISKEN Platform Testing
1. Use `docker-compose up -d` to start full platform
2. Access services via localhost ports defined in docker-compose.yaml
3. Test documentation references against actual platform behavior

## Important Notes

- This is the documentation repository only - application code is in separate repositories
- The docker-compose.yaml provides a complete RISKEN environment for documentation verification
- MkDocs Material theme provides search, navigation, and responsive design
- Documentation uses mkdocs-static-i18n for internationalization support