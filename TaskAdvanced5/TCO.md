# TCO-анализ трансформации «Будущее 2.0»

## Цель анализа

Цель TCO (Total Cost of Ownership) анализа — сравнить:

* стоимость владения текущей legacy-архитектурой,
* стоимость перехода на целевую cloud-native event-driven платформу,
* экономический эффект трансформации на горизонте 3 лет.

Анализ учитывает:

* инфраструктуру,
* лицензии,
* сопровождение,
* поддержку legacy,
* затраты на команды,
* простои,
* стоимость масштабирования.

---

# 1. Текущая архитектура (AS-IS)

## Основные компоненты текущего ландшафта

| Компонент            | Технологии                |
| -------------------- | ------------------------- |
| DWH                  | Microsoft SQL Server 2008 |
| Интеграции           | Apache Camel ESB          |
| BI                   | Power BI                  |
| Операционные системы | PowerBuilder              |
| AI                   | Python services           |
| Финтех               | Java / Go                 |
| Инфраструктура       | On-Premise                |

---

# Основные проблемы текущей модели

| Проблема                             | Финансовое влияние    |
| ------------------------------------ | --------------------- |
| Рост стоимости legacy поддержки      | Высокое               |
| Вертикальное масштабирование DWH     | Высокое               |
| Медленная аналитика                  | Потери time-to-market |
| Высокая связанность систем           | Дорогие изменения     |
| Сложность подключения новых бизнесов | Рост integration cost |
| Ограниченная отказоустойчивость      | Риски downtime        |

---

# 2. Целевая архитектура (TO-BE)

## Основные компоненты

| Компонент         | Технологии                  |
| ----------------- | --------------------------- |
| Event Platform    | Kafka / Redpanda            |
| Lakehouse         | S3 + Iceberg                |
| Stream Processing | Flink / Spark               |
| Analytics         | ClickHouse + Semantic Layer |
| Self-Service BI   | Data Portal                 |
| Platform          | Kubernetes                  |
| IAM               | Keycloak                    |
| Observability     | Prometheus + Grafana + Loki |
| ML Platform       | MLflow + Kubeflow           |

---

# Основные преимущества

| Эффект                         | Влияние                             |
| ------------------------------ | ----------------------------------- |
| Горизонтальное масштабирование | Снижение infrastructure bottlenecks |
| Near-real-time аналитика       | Ускорение бизнес-решений            |
| Domain ownership               | Снижение стоимости изменений        |
| Event-driven integration       | Упрощение интеграций                |
| Self-service analytics         | Снижение нагрузки на BI-команды     |
| Cloud-native platform          | Упрощение масштабирования           |

---

# 3. Модель затрат (AS-IS vs TO-BE)

## Предположения

### Горизонт анализа


3 года


### Масштаб компании


- сотни ТБ данных
- multi-domain ecosystem
- 24/7 critical systems
- рост realtime telemetry


---

# 4. TCO по категориям затрат

| Категория затрат         | AS-IS (3 года) | TO-BE (3 года) | Изменение |
| ------------------------ | -------------: | -------------: | --------: |
| On-prem infrastructure   |      405 млн ₽ |      108 млн ₽ |         ↓ |
| Cloud infrastructure     |       27 млн ₽ |      342 млн ₽ |         ↑ |
| SQL Server лицензии      |      198 млн ₽ |       27 млн ₽ |         ↓ |
| Legacy support           |      270 млн ₽ |       72 млн ₽ |         ↓ |
| PowerBuilder support     |       99 млн ₽ |       18 млн ₽ |         ↓ |
| ESB support              |       81 млн ₽ |       27 млн ₽ |         ↓ |
| Kafka/Event Platform     |        9 млн ₽ |       90 млн ₽ |         ↑ |
| Kubernetes platform      |            0 ₽ |       81 млн ₽ |         ↑ |
| Observability platform   |        9 млн ₽ |       45 млн ₽ |         ↑ |
| Data governance          |       18 млн ₽ |       63 млн ₽ |         ↑ |
| Security & compliance    |       54 млн ₽ |       99 млн ₽ |         ↑ |
| BI/Analytics teams       |      252 млн ₽ |      171 млн ₽ |         ↓ |
| Data engineering         |       99 млн ₽ |      207 млн ₽ |         ↑ |
| Incident management      |      108 млн ₽ |       54 млн ₽ |         ↓ |
| Downtime/business losses |      162 млн ₽ |       63 млн ₽ |         ↓ |
| Integration development  |      216 млн ₽ |       90 млн ₽ |         ↓ |

---

# 5. Суммарный TCO

| Архитектура | TCO за 3 года |
| ----------- | ------------: |
| AS-IS       |  1.827 млрд ₽ |
| TO-BE       |  1.467 млрд ₽ |

---

# Экономический эффект

## Снижение совокупной стоимости владения


~20% снижение TCO за 3 года


---

# Основные источники экономии

| Источник                       | Причина                       |
| ------------------------------ | ----------------------------- |
| Уход от SQL Server licensing   | Open-source stack             |
| Снижение legacy поддержки      | Отказ от PowerBuilder/Camel   |
| Уменьшение integration cost    | Event-driven integration      |
| Снижение downtime              | Fault-tolerant architecture   |
| Self-service analytics         | Меньше ручной BI-разработки   |
| Горизонтальное масштабирование | Нет дорогого vertical scaling |

---

# 6. Основные инвестиции трансформации

## Наибольшие расходы

| Направление           | Причина                  |
| --------------------- | ------------------------ |
| Cloud infrastructure  | Масштабируемая платформа |
| Kubernetes platform   | Platform engineering     |
| Stream processing     | Realtime pipelines       |
| Data engineering      | Построение Data Mesh     |
| Security & governance | Regulatory requirements  |

---

# 7. Нематериальные выгоды

## Ускорение time-to-market

Новая архитектура позволяет:

* быстрее подключать новые бизнесы,
* запускать новые регионы,
* создавать новые data products.

---

## Повышение устойчивости

Event-driven архитектура:

* снижает риски cascading failures,
* уменьшает downtime,
* повышает resilience.

---

## Масштабирование AI и IoT

Новая платформа:

* поддерживает realtime telemetry,
* масштабирует AI pipelines,
* упрощает обработку больших потоков данных.

---

# 8. ROI трансформации

## Основные драйверы ROI

| Драйвер                 | Эффект                       |
| ----------------------- | ---------------------------- |
| Faster product delivery | Рост revenue                 |
| Reduced downtime        | Снижение потерь              |
| Simplified integrations | Снижение engineering cost    |
| Better analytics        | Более быстрые бизнес-решения |
| Cloud scalability       | Оптимизация инфраструктуры   |

---

# Ожидаемый результат через 3 года

## Архитектурный эффект

* отказ от DWH как integration hub;
* переход к domain-oriented architecture;
* realtime event-driven processing;
* независимое развитие доменов.

---

## Бизнес-эффект

* ускорение запуска новых сервисов;
* поддержка multi-region expansion;
* снижение TCO;
* улучшение качества аналитики;
* повышение гибкости бизнеса.
