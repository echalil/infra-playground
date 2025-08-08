# Terraform · Azure 最小闭环（资源组）

## 目标
- 使用 Terraform 在 **Azure** 上创建并销毁一个最小资源（**Resource Group**）。
- 熟悉 `init → plan → apply → destroy` 的基本流程。
- 了解本地 state 与远端 state（Azure Storage）的配置方式。

---

## 前置条件
- 已在**同一环境**完成 Azure 登录（容器或本机二选一）：
  ```bash
  az login
  az account set --subscription "<你的订阅名称或ID>"
  az account show -o table
