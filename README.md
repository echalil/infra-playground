# infra-playground

> A hands‑on repository for sharpening cloud‑infrastructure skills (Azure, AWS, Terraform, DevOps).

---

## ✨ Features

| Area                     | What you get                                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------------------------------ |
| **Dev Container**        | Ubuntu 22.04 image pre‑loaded with **Terraform CLI** & **Azure CLI**—just reopen in container and code 🏃‍♂️ |
| **Scripts**              | Small automation helpers such as `subnet_calc.sh` for quick network math                                     |
| **Terraform templates**  | A minimal `main.tf` (Az provider) ready for experiments—modular examples coming soon                         |
| **Multi‑cloud branches** | Future branches will mirror AWS SAA‑C03 & GCP ACE labs                                                       |

---

## 🚀 Quick Start

### Prerequisites

* Docker Desktop ≥ 4.x
* Visual Studio Code ≥ 1.90 with the **Dev Containers** extension
* (Optional) GitHub account for forks & pushes

### Clone & Launch

```bash
# Clone the repo
git clone git@github.com:<your‑account>/infra-playground.git
cd infra-playground

# Open with VS Code
code .

# Command Palette ⇧⌘P → “Dev Containers: Reopen in Container”
# First run will pull the image and install dependencies
```

When the container is ready your prompt should look like:

```bash
vscode ➜ /workspaces/infra-playground $
```

---

## 🗂️ Directory Layout

```
infra-playground/
├─ .devcontainer/        # Dev Container settings
│   └─ devcontainer.json
├─ scripts/
│   └─ subnet_calc.sh    # Network subnet helper
├─ terraform/
│   └─ main.tf           # Hello‑Terraform (Azurerm)
└─ README.md
```

---

## 🧩 Usage Examples

### Azure CLI

```bash
az login --use-device-code           # Sign in (Free Trial or Learn Sandbox)
az group create -n rg-playground -l japaneast
```

### Terraform

```bash
cd terraform
terraform init                       # Download provider plugins
terraform plan -out tfplan           # Create execution plan
terraform apply tfplan               # Provision resources
```

### Network Script

```bash
./scripts/subnet_calc.sh 10.0.0.0/24
```

---

## 🗺️ Roadmap

* [ ] Add Bicep + Azure Blueprint demos
* [ ] Introduce AWS VPC module (Terraform)
* [ ] GitHub Actions CI: `terraform fmt` & `tflint`
* [ ] K8s on Docker Desktop + GitOps (Argo CD)

---

## 🤝 Contributing

Pull requests are welcome! Please follow these conventions:

1. Every script must include inline comments or a companion README.
2. Run `terraform fmt` on all *.tf* files before committing.
3. Use **Conventional Commits** for commit messages.

