# Day 0 – Quick Validation Checklist

Use this list to confirm that your dev‑container environment, Git, Azure CLI and Terraform are all wired up correctly. Tick each box as you finish the step and commit the file once everything is green.

---

## ✅ Required (Status @ 2025‑08‑07)

| ✅? | Task                       | Note                                                                      |
| -- | -------------------------- | ------------------------------------------------------------------------- |
| ☑️ | **Dev Container boots**    | Container attached & prompt at `/workspaces/infra-playground` ✔︎          |
| ☑️ | **Git initial commit**     | To‑do: run `git add . && git commit -m "init"`                            |
| ☑️ | **GitHub push**            | Create remote repo & `git push -u origin main`                            |
| ☑️ | **Azure CLI login**        | Pending — Free Trial / Learn Sandbox not created yet                      |
| ☑️ | **Resource group created** | Will run after CLI login: `az group create -n rg-playground -l japaneast` |
| ☑️ | **Terraform init**         | To‑do after az login: `cd terraform && terraform init`                    |

---

## 🔬 Optional (nice to have)

| ✅? | Task                             | Note                                         |
| -- | -------------------------------- | -------------------------------------------- |
| ☑️ | **Network helper script**        | `./scripts/subnet_calc.sh 10.0.0.0/24`       |
| ☑️ | **Terraform plan (no‑op)**       | `terraform plan` should show *No changes*    |
| ☑️ | **Checklist committed & pushed** | Commit this file as `chore(day0): checklist` |

---

## 🐞 Issues encountered

| Step            | Error / Symptom | How I fixed / Next action                     |
| --------------- | --------------- | --------------------------------------------- |
| Azure CLI login | No subscription | Will create Free Account or use Learn Sandbox |

---

## 📌 Next

1. Create Free Account or activate Learn Sandbox, then finish az/Terraform steps.
2. Write and test `subnet_calc.sh`.
3. Plan Day 1: Linux basics, PowerShell scripting.
