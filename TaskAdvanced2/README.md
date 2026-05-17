# Terraform CI/CD + Remote State (S3-compatible)

## Описание решения

Реализована инфраструктура с использованием Terraform и автоматизированным CI/CD через GitHub Actions.

Проект включает:

* переиспользуемый модуль VM;
* 3 окружения (dev/stage/prod);
* удалённое хранение состояния Terraform;
* автоматизацию планирования и развёртывания инфраструктуры.

---

## Архитектура

* Terraform state хранится в S3-совместимом хранилище Yandex Cloud Object Storage
* CI/CD реализован через GitHub Actions
* инфраструктура разделена по окружениям (envs/dev, envs/stage, envs/prod)

---

## CI/CD pipeline

Pipeline выполняет:

1. `terraform init` — подключение backend (S3)
2. `terraform validate` — проверка конфигурации
3. `terraform plan` — построение плана изменений
4. `terraform apply` — автоматический запуск (без workflow_dispatch)

---

## Remote state

Используется S3 backend:

* bucket: practicum-terraform-state-bucket
* key: env-specific (dev/stage/prod)
* storage: Yandex Object Storage
* доступ через access_key / secret_key (GitHub Secrets)

---

## Безопасность

Секреты не хранятся в репозитории:

* OAuth token → GitHub Secrets
* S3 credentials → GitHub Secrets
* SSH key → GitHub Secrets

---

## Модульность

Terraform модуль `vm_module`:

* CPU / RAM конфигурируются через variables
* диск подключается как secondary disk
* сеть через subnet_id
* SSH доступ через metadata

---

## Запуск

### dev

```bash
terraform apply -var-file=terraform.tfvars
```

---

## Особенности реализации

* полностью переиспользуемый модуль
* разделение окружений через tfvars
* remote state без локального хранения
* CI/CD без ручного запуска Terraform локально


