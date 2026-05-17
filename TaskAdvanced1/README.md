# Terraform VM Module for Multiple Environments

## Описание

Проект реализует переиспользуемый Terraform-модуль для создания виртуальных машин в Yandex Cloud.

Модуль поддерживает:
- настройку CPU и RAM;
- подключаемый дополнительный диск;
- подключение к subnet;
- SSH-доступ;
- использование в нескольких окружениях.

---

## Структура проекта

```text
TaskAdvanced1/
├── modules/
│   └── vm/
└── envs/
    ├── dev/
    ├── stage/
    └── prod/
```

---

## Параметры модуля

| Переменная | Описание                     |
| ---------- | ---------------------------- |
| vm_name    | Имя ВМ                       |
| zone       | Зона размещения              |
| cores      | Количество CPU               |
| memory     | RAM                          |
| disk_size  | Размер дополнительного диска |
| subnet_id  | ID подсети                   |
| ssh_key    | SSH public key               |
| image_id   | ID образа                    |

---

## Outputs

| Output      | Описание                 |
| ----------- | ------------------------ |
| vm_id       | ID виртуальной машины    |
| vm_name     | Имя ВМ                   |
| internal_ip | Внутренний IP            |
| external_ip | Внешний IP               |
| disk_id     | ID дополнительного диска |

---

## Запуск

### DEV

```bash
cd envs/dev

terraform init
terraform apply -var-file=terraform.tfvars
```

### STAGE

```bash
cd envs/stage

terraform init
terraform apply -var-file=terraform.tfvars
```

### PROD

```bash
cd envs/prod

terraform init
terraform apply -var-file=terraform.tfvars
```


