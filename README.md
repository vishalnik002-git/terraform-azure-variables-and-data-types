# 📦 Parameterized Infrastructure with Terraform Variables & `.tfvars`

[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=flat&logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![DRY Pattern](https://img.shields.io/badge/Code_Design-DRY_Pattern-blue)](https://developer.hashicorp.com/terraform/language/values/variables)

---

## 📌 Project Overview

This project demonstrates the **DRY (Don't Repeat Yourself)** design pattern in Terraform by parameterizing Azure infrastructure components.

Instead of hardcoding names and locations inside resource blocks, the code is cleanly decoupled into:
1. **`variable.tf`** — Schema definitions, type constraints (`string`), and documentation descriptions.
2. **`terraform.tfvars`** — Environment-specific input values.
3. **`main.tf`** — Reusable, declarative resource logic.

---

## 🏗️ Architecture & Decoupled Design

```text
Input Values (terraform.tfvars)
      │
      ▼
Variable Declarations (variable.tf)
      │
      ▼
Resource Configuration (main.tf)
      ├── azurerm_resource_group.rg
      └── azurerm_storage_account.storage (Implicit Dependency on RG)
```

1. **Decoupled Configuration:** Changing an environment name or region only requires editing `terraform.tfvars` without touching `main.tf`.
2. **Implicit Dependency:** `resource_group_name = azurerm_resource_group.rg.name` creates an implicit dependency, ensuring the Resource Group is created before the Storage Account.

---

## 💡 Key DevOps Concepts Demonstrated

* **Type Constraints:** Explicitly defining `type = string` prevents bad input data.
* **Variable Descriptions:** Documenting the purpose of each variable makes the module readable and team-friendly.
* **Separation of Concerns:** Keeping infrastructure logic separate from environment values allows this configuration to be deployed across Dev, Test, or Prod simply by swapping `.tfvars` files.

---

## 📁 Repository Structure

```text
.
├── main.tf              # Declarative Azure resources (RG, Storage Account)
├── variable.tf          # Variable definitions and type constraints
├── terraform.tfvars     # Concrete input values for deployment
├── provider.tf          # AzureRM provider block
├── .gitignore           # Git ignore rules for state files
└── README.md            # Project documentation
```

---

## 🚀 How to Run

### Prerequisites
* [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) authenticated (`az login`)
* [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) (>= 1.5.0)

### Steps

```bash
# 1. Clone repository
git clone https://github.com/vishalnik002-git/terraform-variables-storage-account.git
cd terraform-variables-storage-account

# 2. Authenticate to Azure
az login

# 3. Initialize Terraform
terraform init

# 4. Preview the execution plan
terraform plan

# 5. Provision infrastructure
terraform apply -auto-approve
```

---

## 🧹 Clean Up

To destroy the provisioned storage account and resource group:

```bash
terraform destroy -auto-approve
```

---

## 👤 Author
* **Vishal Yadav** — [GitHub Profile](https://github.com/vishalnik002-git) | [LinkedIn](https://www.linkedin.com/in/vishal-yadav002)
