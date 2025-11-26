#!/bin/bash

# ============================================================
# Spacecraft Dynamics and Control Repository Setup Script
# Author: Emanuel Quintana Silva
# Institution: Universidad Pedagógica y Tecnológica de Colombia (UPTC)
# ============================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Repository information
REPO_NAME="spacecraft-dynamics-control"
AUTHOR_NAME="Emanuel Quintana Silva"
AUTHOR_EMAIL="emanuel.quintana@uptc.edu.co"
GITHUB_USER="equintana-uptc"

echo -e "${BLUE}=====================================================${NC}"
echo -e "${BLUE}  Spacecraft Dynamics and Control Repository Setup${NC}"
echo -e "${BLUE}  UPTC - Universidad Pedagógica y Tecnológica de Colombia${NC}"
echo -e "${BLUE}=====================================================${NC}\n"

# Function to print status messages
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[i]${NC} $1"
}

# Check if Git is installed
check_git() {
    print_info "Checking Git installation..."
    if command -v git &> /dev/null; then
        GIT_VERSION=$(git --version)
        print_status "Git found: $GIT_VERSION"
        return 0
    else
        print_error "Git is not installed!"
        echo "Please install Git from: https://git-scm.com/downloads"
        exit 1
    fi
}

# Check if Quarto is installed
check_quarto() {
    print_info "Checking Quarto installation..."
    if command -v quarto &> /dev/null; then
        QUARTO_VERSION=$(quarto --version)
        print_status "Quarto found: version $QUARTO_VERSION"
        return 0
    else
        print_error "Quarto is not installed!"
        echo "Please install Quarto from: https://quarto.org/docs/get-started/"
        exit 1
    fi
}

# Configure Git
configure_git() {
    print_info "Configuring Git..."
    
    read -p "Enter your name [$AUTHOR_NAME]: " input_name
    input_name=${input_name:-$AUTHOR_NAME}
    
    read -p "Enter your email [$AUTHOR_EMAIL]: " input_email
    input_email=${input_email:-$AUTHOR_EMAIL}
    
    git config --global user.name "$input_name"
    git config --global user.email "$input_email"
    
    print_status "Git configured successfully"
}

# Create directory structure
create_structure() {
    print_info "Creating directory structure..."
    
    # Main directories
    mkdir -p manuscript
    mkdir -p chapters/{01-mathematical-preliminaries,02-attitude-representation,03-orbital-dynamics,04-perturbations,05-perturbed-dynamics,06-attitude-kinematics,07-attitude-dynamics,08-sensors,09-actuators,10-attitude-determination,11-orbital-control,12-attitude-control,13-case-study,14-advanced-topics}
    mkdir -p code/{matlab,python}
    mkdir -p code/matlab/{attitude,dynamics,orbit,control,utils}
    mkdir -p code/python/{spacecraft_dynamics,tests,simulations}
    mkdir -p data/{missions,ephemeris,measurements}
    mkdir -p figures/{diagrams,plots,schematics}
    mkdir -p appendices
    mkdir -p references
    mkdir -p docs/{api,tutorials}
    mkdir -p tests/{unit,integration}
    mkdir -p .github/workflows
    
    print_status "Directory structure created"
}

# Create index.qmd
create_index() {
    print_info "Creating main manuscript file..."
    
    cat > manuscript/index.qmd << 'EOF'
---
title: "Spacecraft Dynamics and Control"
subtitle: "Mathematical Foundations and Applications"
author:
  - name: Emanuel Quintana Silva
    orcid: 0000-0000-0000-0000
    email: emanuel.quintana@uptc.edu.co
    affiliations:
      - name: Universidad Pedagógica y Tecnológica de Colombia
        department: School of Engineering
        address: Sogamoso, Boyacá
        country: Colombia
date: today
abstract: |
  Comprehensive treatment of spacecraft dynamics and control systems using the Embedded Model Control approach.
keywords:
  - Spacecraft Dynamics
  - Attitude Control
  - Embedded Model Control
bibliography: ../references/references.bib
---

# Introduction

This manuscript presents a rigorous treatment of spacecraft dynamics and control.

See @canuto2018spacecraft for the foundational methodology.
EOF
    
    print_status "Main manuscript created"
}

# Create _quarto.yml
create_quarto_config() {
    print_info "Creating Quarto configuration..."
    
    cat > _quarto.yml << 'EOF'
project:
  type: manuscript
  output-dir: _output

manuscript:
  article: manuscript/index.qmd

format:
  html:
    theme: cosmo
    toc: true
    toc-depth: 3
    number-sections: true
    code-fold: true
  pdf:
    documentclass: book
    toc: true
  docx: default

bibliography: references/references.bib
link-citations: true

execute:
  freeze: auto
  cache: true
EOF
    
    print_status "Quarto configuration created"
}

# Create references.bib
create_references() {
    print_info "Creating bibliography file..."
    
    cat > references/references.bib << 'EOF'
@book{canuto2018spacecraft,
  author    = {Canuto, Enrico and Novara, Carlo and Massotti, Luca and 
               Carlucci, Donato and {Perez Montenegro}, Carlos},
  title     = {Spacecraft Dynamics and Control: The Embedded Model Control Approach},
  publisher = {Butterworth-Heinemann},
  year      = {2018},
  isbn      = {978-0-08-100700-6},
  doi       = {10.1016/C2015-0-04007-5}
}

@book{markley2014fundamentals,
  author    = {Markley, F. Landis and Crassidis, John L.},
  title     = {Fundamentals of Spacecraft Attitude Determination and Control},
  publisher = {Springer},
  year      = {2014},
  isbn      = {978-1-4939-0802-8}
}
EOF
    
    print_status "Bibliography created"
}

# Create .gitignore
create_gitignore() {
    print_info "Creating .gitignore..."
    
    cat > .gitignore << 'EOF'
# Quarto
/.quarto/
/_output/
**/*.quarto_ipynb
_site/
_book/

# R
.Rproj.user
.Rhistory
.RData
*.Rproj

# Python
__pycache__/
*.py[cod]
.ipynb_checkpoints/
venv/
env/

# MATLAB
*.asv
*.m~

# LaTeX
*.aux
*.log
*.out
*.toc

# System
.DS_Store
Thumbs.db
EOF
    
    print_status ".gitignore created"
}

# Create README.md
create_readme() {
    print_info "Creating README.md..."
    
    cat > README.md << 'EOF'
# Spacecraft Dynamics and Control

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![UPTC](https://img.shields.io/badge/Institution-UPTC-green.svg)](https://www.uptc.edu.co/)

Comprehensive academic repository on spacecraft dynamics and control using the Embedded Model Control approach.

## Author

**Emanuel Quintana Silva**  
Universidad Pedagógica y Tecnológica de Colombia (UPTC)  
Sogamoso, Boyacá, Colombia

## Quick Start

```bash
# Render manuscript
quarto render

# Preview
quarto preview
```

## License

CC BY-NC-SA 4.0 - See LICENSE for details
EOF
    
    print_status "README created"
}

# Create Python package structure
create_python_package() {
    print_info "Creating Python package structure..."
    
    cat > code/python/spacecraft_dynamics/__init__.py << 'EOF'
"""
Spacecraft Dynamics and Control Library
Author: Emanuel Quintana Silva
Institution: UPTC
"""

__version__ = "1.0.0"
__author__ = "Emanuel Quintana Silva"

from . import attitude
from . import orbit
from . import control

__all__ = ['attitude', 'orbit', 'control']
EOF
    
    # Create empty module files
    touch code/python/spacecraft_dynamics/{attitude,orbit,control,utils}.py
    touch code/python/tests/__init__.py
    
    print_status "Python package structure created"
}

# Create requirements.txt
create_requirements() {
    print_info "Creating requirements.txt..."
    
    cat > requirements.txt << 'EOF'
numpy>=1.24.0
scipy>=1.10.0
matplotlib>=3.7.0
pandas>=2.0.0
sympy>=1.12
jupyter>=1.0.0
pytest>=7.3.0
black>=23.0.0
EOF
    
    print_status "requirements.txt created"
}

# Initialize Git repository
init_git_repo() {
    print_info "Initializing Git repository..."
    
    if [ ! -d .git ]; then
        git init
        git add .
        git commit -m "Initial commit: Repository structure for Spacecraft Dynamics and Control"
        print_status "Git repository initialized"
    else
        print_info "Git repository already exists"
    fi
}

# Create GitHub workflow
create_github_workflow() {
    print_info "Creating GitHub Actions workflow..."
    
    mkdir -p .github/workflows
    
    cat > .github/workflows/quarto-publish.yml << 'EOF'
name: Publish Quarto Site

on:
  push:
    branches: [main]

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v4
      
      - uses: quarto-dev/quarto-actions/setup@v2
        
      - name: Render Quarto Project
        run: quarto render
        
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_output
EOF
    
    print_status "GitHub workflow created"
}

# Main execution
main() {
    echo ""
    check_git
    check_quarto
    echo ""
    
    # Ask user if they want to configure Git
    read -p "Do you want to configure Git? (y/n) [y]: " config_git
    config_git=${config_git:-y}
    
    if [[ $config_git == "y" ]]; then
        configure_git
    fi
    
    echo ""
    create_structure
    create_index
    create_quarto_config
    create_references
    create_gitignore
    create_readme
    create_python_package
    create_requirements
    create_github_workflow
    
    echo ""
    print_info "Initializing Git repository..."
    init_git_repo
    
    echo ""
    echo -e "${GREEN}=====================================================${NC}"
    echo -e "${GREEN}  Setup completed successfully!${NC}"
    echo -e "${GREEN}=====================================================${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo "1. cd $PWD"
    echo "2. quarto preview     # Preview your manuscript"
    echo "3. quarto render      # Render all formats"
    echo ""
    echo -e "${YELLOW}To push to GitHub:${NC}"
    echo "1. Create repository at: https://github.com/new"
    echo "2. git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git"
    echo "3. git branch -M main"
    echo "4. git push -u origin main"
    echo ""
    echo -e "${BLUE}Happy writing! 🚀${NC}"
}

# Run main function
main
