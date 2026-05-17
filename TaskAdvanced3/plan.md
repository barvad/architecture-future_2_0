# План управления рисками трансформации «Будущее 2.0»

## Подход к управлению рисками

Для программы трансформации предлагается использовать комбинированный подход:

* технические меры:

  * архитектурные паттерны,
  * автоматизация,
  * observability,
  * platform engineering,
  * security controls;

* управленческие меры:

  * governance,
  * изменение организационной структуры,
  * обучение,
  * roadmap management,
  * контроль migration milestones.

---

# 1. Архитектурные риски

| Риск                                    | Способ снижения                                                                     | Тип мер                      |
| --------------------------------------- | ----------------------------------------------------------------------------------- | ---------------------------- |
| Сохранение зависимости от legacy DWH    | Внедрение Anti-Corruption Layer, CDC, постепенный перенос логики в доменные сервисы | Технический                  |
| Некорректное выделение доменов          | Event Storming, DDD workshops, архитектурный review board                           | Управленческий               |
| Формирование distributed monolith       | Async-first integration, запрет shared database, domain ownership                   | Технический + управленческий |
| Перегрузка event platform               | Kafka partitioning, autoscaling, capacity planning                                  | Технический                  |
| Неконсистентность данных между доменами | MDM, schema registry, idempotent consumers                                          | Технический                  |
| Смешение OLTP и аналитических нагрузок  | Выделение Lakehouse и realtime analytical storage                                   | Технический                  |
| Рост сложности интеграций               | Стандартизация event contracts и API governance                                     | Управленческий + технический |

---

# 2. Организационные риски

| Риск                                             | Способ снижения                                   | Тип мер                      |
| ------------------------------------------------ | ------------------------------------------------- | ---------------------------- |
| Недостаток экспертизы в event-driven архитектуре | Обучение команд, внутренние архитектурные гильдии | Управленческий               |
| Сопротивление legacy-команд                      | Migration KPI, вовлечение команд в redesign       | Управленческий               |
| Отсутствие ownership доменов                     | Введение domain teams и platform teams            | Управленческий               |
| Конфликт между доменами                          | Architecture governance board                     | Управленческий               |
| Замедление time-to-market                        | Incremental migration и Strangler Fig pattern     | Технический + управленческий |
| Отсутствие поддержки бизнеса                     | Executive sponsorship и roadmap transparency      | Управленческий               |

---

# 3. Технологические риски

| Риск                             | Способ снижения                                               | Тип мер                      |
| -------------------------------- | ------------------------------------------------------------- | ---------------------------- |
| Потеря данных при CDC            | Replay strategy, reconciliation jobs, exactly-once processing | Технический                  |
| Ошибки схем событий              | Schema Registry + compatibility validation                    | Технический                  |
| Рост latency event-chain         | Distributed tracing, SLA/SLO monitoring                       | Технический                  |
| Нестабильность stream processing | Checkpointing, fault-tolerant streaming                       | Технический                  |
| Рост cloud costs                 | FinOps, autoscaling, lifecycle management                     | Технический + управленческий |
| Vendor lock-in                   | Kubernetes, open standards, portable storage                  | Технический                  |
| Сложность observability          | Centralized logging + tracing + metrics platform              | Технический                  |

---

# 4. Риски безопасности и compliance

| Риск                                  | Способ снижения                                  | Тип мер                      |
| ------------------------------------- | ------------------------------------------------ | ---------------------------- |
| Утечка медицинских данных             | Encryption, tokenization, isolated storage       | Технический                  |
| Нарушение доступа к данным            | RBAC/ABAC, centralized IAM                       | Технический                  |
| Несоблюдение регуляторных требований  | Audit trails, data residency, compliance reviews | Управленческий + технический |
| Неправильное использование PHI данных | Изоляция PHI-контуров и data masking             | Технический                  |

---

# 5. Риски миграции

| Риск                                        | Способ снижения                                       | Тип мер        |
| ------------------------------------------- | ----------------------------------------------------- | -------------- |
| Долгое coexistence legacy и новой платформы | Legacy sunset roadmap                                 | Управленческий |
| Отказ сервисов во время cutover             | Blue-Green deployment, rollback strategy              | Технический    |
| Неполная миграция бизнес-логики             | Reverse engineering SQL/ETL и постепенный refactoring | Технический    |
| Массовые сбои интеграций                    | Canary release и contract testing                     | Технический    |
| Потеря совместимости между доменами         | Consumer-driven contracts                             | Технический    |

---

# Организационная модель управления рисками

## 1. Architecture Governance Board

Отвечает за:

* контроль архитектурных стандартов,
* утверждение доменных границ,
* review integration patterns,
* контроль технического долга.

---

## 2. Platform Team

Отвечает за:

* event platform,
* observability,
* CI/CD,
* IAM,
* schema governance,
* self-service infrastructure.

---

## 3. Domain Teams

Отвечают за:

* бизнес-логику доменов,
* event contracts,
* data ownership,
* SLA сервисов.

---

## 4. Security & Compliance Team

Отвечает за:

* PHI/PII governance,
* audit,
* encryption,
* access policies,
* regulatory compliance.

---

# Ключевые технические практики снижения рисков

## Event Governance

* Schema Registry
* versioned contracts
* backward compatibility checks
* consumer-driven contract testing

---

## Надёжность платформы

* DLQ
* retry policies
* circuit breakers
* idempotent consumers
* outbox pattern

---

## Безопасность

* Zero Trust
* mTLS
* encryption at rest/in transit
* centralized IAM
* secrets management

---

## Observability

* centralized logging
* distributed tracing
* metrics + alerting
* SLO/SLI monitoring

---

# План поэтапного снижения рисков

## Этап 1 (0–6 месяцев)

Основная цель:

* снижение рисков интеграции и migration readiness.

Меры:

* запуск pilot domains,
* внедрение Kafka,
* schema registry,
* observability platform,
* ACL для legacy.

---

## Этап 2 (6–18 месяцев)

Основная цель:

* снижение рисков масштабирования.

Меры:

* потоковые витрины,
* domain ownership,
* MDM,
* self-service analytics,
* realtime pipelines.

---

## Этап 3 (18–36 месяцев)

Основная цель:

* отказ от критичных legacy-зависимостей.

Меры:

* sunset DWH,
* отказ от Camel как core integration layer,
* переход на event-native integration,
* полная доменная аналитика.
