# 🧱 Terraform Variables, Data Types & Parameterization

![Terraform Version](https://img.shields.io/badge/Terraform-1.5%2B-blue.svg?logo=terraform)
![Azure Provider](https://img.shields.io/badge/AzureRM-3.100%2B-0078D4.svg?logo=microsoft-azure)
![IaC](https://img.shields.io/badge/IaC-Variables%20%26%20Types-623CE4.svg)
![Validation](https://img.shields.io/badge/Validation-Pass-success.svg)

> **Repository 03 of 08 in the Terraform + Microsoft Azure Professional Learning Series**

---

## 📌 Navigation
| ⏪ Previous Repository | 📚 Current Repository | ⏩ Next Repository |
| :--- | :---: | :--- |
| [← 02. terraform-azure-resource-provisioning](https://github.com/vishalnik002-git/terraform-azure-resource-provisioning) | **03. terraform-azure-variables-and-data-types** | [04. terraform-azure-collections-and-loops →](https://github.com/vishalnik002-git/terraform-azure-collections-and-loops) |

---

## 📖 Project Overview

Hardcoding values directly into infrastructure files limits flexibility and prevents code reuse across environments.
This repository explores the complete **Terraform Variable System** and demonstrates how to build dynamic, parameterized infrastructure using the **Declare → Assign → Use** architectural pattern.

It covers:
- **Primitive Data Types**: `string`, `number`, `bool`.
- **Collection Data Types**: `list`, `set`, `map`.
- **Complex Data Types**: `object`, `tuple`.
- **Variable Precedence**: How values are declared in `variables.tf`, assigned in `terraform.tfvars`, and referenced in `main.tf` via the `var.` accessor.

> ℹ️ **Learning Note**: This repository contains learning configurations and documentation. Automated validation checks verify HCL syntax without provisioning live Azure cloud resources.

---

## 🎯 Learning Objectives

By exploring this repository, you will understand:
1. The difference between declaring variables, assigning values, and consuming them.
2. How to use primitive types (`string`, `number`, `bool`) to parameterize names, counts, and flags.
3. How to use collection types (`list`, `set`, `map`) to handle ordered items, unique collections, and key-value tags.
4. How to use complex structured types (`object`, `tuple`) to enforce strict multi-field configuration schemas.
5. The role of `terraform.tfvars.example` in providing safe configuration templates without exposing secrets.
6. How variable parameterization applies to real Azure Resource Groups and Storage Accounts.

---

## 🏗️ The Declare → Assign → Use Architectural Pattern

```
+-------------------------------------------------------------------------+
|                  Declare  --->  Assign  --->  Use                       |
+-------------------------------------------------------------------------+
        |                                 |                         |
        v                                 v                         v
 [ variables.tf ]              [ terraform.tfvars ]           [ main.tf ]
  - Declares variable name      - Supplies real environment    - Consumes value via
  - Defines type constraint       values per environment         var.<variable_name>
  - Sets optional default       - Kept out of Git              - Resource created with
  - Adds description                                             dynamic properties
```

---

## 📂 Repository Structure

```
terraform-azure-variables-and-data-types/
├── .github/
│   └── workflows/
│       └── validate.yml          # GitHub Actions CI validation pipeline
├── examples/
│   ├── 01-primitive-types/       # Standalone string, number, bool demo
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── 02-collection-types/      # Standalone list, set, map demo
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── 03-complex-types/         # Standalone object, tuple demo
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── 04-resource-provisioning-with-variables/ # Azure RG + Storage with variables
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│       └── versions.tf
├── .gitignore                    # Prevents committing real .tfvars
├── main.tf                       # Main configuration consuming variables
├── outputs.tf                    # Declares typed output demonstrations
├── providers.tf                  # AzureRM provider configuration
├── terraform.tfvars.example      # Sample input values template
├── variables.tf                  # Comprehensive variable declarations
├── versions.tf                   # Terraform version constraints
└── README.md                     # Comprehensive documentation
```

---

## 🧩 Comprehensive Data Types Breakdown

### 1. Primitive Data Types
| Data Type | Description | Example Syntax |
| :--- | :--- | :--- |
| `string` | Textual data enclosed in double quotes | `variable "project_name" { type = string }` |
| `number` | Numeric value (integers or floating point) | `variable "instance_count" { type = number }` |
| `bool` | Boolean flag (`true` or `false`) | `variable "enable_geo" { type = bool }` |

### 2. Collection Data Types
| Data Type | Description | Indexing / Access |
| :--- | :--- | :--- |
| `list(string)` | Ordered sequence of elements | `var.allowed_regions[0]` |
| `set(string)` | Collection of unique unordered elements | Can be converted or iterated |
| `map(string)` | Collection of key-value string pairs | `var.resource_tags["Environment"]` |

### 3. Complex Data Types
- **`object({...})`**: A structural type holding named attributes, where each attribute has its own specified type.
  ```hcl
  variable "storage_profile" {
    type = object({
      name        = string
      tier        = string
      replication = string
    })
  }
  ```
- **`tuple([...])`**: A fixed-length sequence where each index has a predetermined type (e.g. `tuple([string, number, bool])`).

---

## 🛠️ Step-by-Step Getting Started Guide

### Prerequisites
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) (v1.5.0+).

### 1. Format Code
```bash
terraform fmt
```

### 2. Initialize Working Directory
```bash
terraform init -backend=false
```

### 3. Validate Configuration
```bash
terraform validate
```

### 4. Provide Variables for Plan (Educational Documentation)
```bash
terraform plan -var-file="terraform.tfvars.example"
```

### 5. Apply Changes (Educational Documentation)
```bash
terraform apply
```
> ⚠️ **IMPORTANT**: In production, `terraform apply` requires manual confirmation. In this educational repository, no cloud deployment is executed.

---

## 🔄 Terraform Resource Lifecycle & Destruction Concepts

1. **Changing Variables Triggers Updates or Recreation**:
   Modifying variable values can have significant lifecycle impacts. For example, changing a Resource Group name variable forces Terraform to plan the **destruction** of the old group and the creation of a new one. Always inspect `terraform plan` to verify whether changes are in-place (`~`) or destructive (`-/+`).
2. **Safe Variable Management**:
   Never store passwords or access keys in `.tf` or `.tfvars` files committed to Git. Use environment variables (`TF_VAR_name`) or cloud key vaults for sensitive credentials.

---

## 🤖 CI/CD Automation (GitHub Actions)

This repository includes automated validation via `.github/workflows/validate.yml` that verifies all 4 example directories and the root module on every push and pull request.

---

## 👨‍💻 Author Information

- **Developer**: Vishal Yadav (`vishalnik002-git`)
- **Education**: MCA @ Galgotias University (2025–2027) | BCA @ MGKVP (2022–2025)
- **Role**: DevOps Intern @ DevOps Insiders
- **GitHub Profile**: [https://github.com/vishalnik002-git](https://github.com/vishalnik002-git)
