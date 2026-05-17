# Агрегаты

## Customer Profile Aggregate

### Bounded Context

Customer Profile Context

### Назначение

Хранение единого профиля клиента компании независимо от медицинских и финансовых сервисов.

### Aggregate Root

`Customer`

### Ключ агрегата

`CustomerId`

### Основные сущности

* Customer
* ContactInfo
* Address
* CustomerPreferences

### Инварианты

* CustomerId уникален во всей платформе.
* Email и phone должны быть валидны.
* Один клиент может иметь только один master profile.
* Профиль клиента должен быть синхронизирован с MDM.

### Основные события

* CustomerRegistered
* CustomerProfileUpdated
* CustomerDeactivated

---

# Patient Aggregate

## Bounded Context

Patient Management Context

## Назначение

Управление пациентами и их жизненным циклом в медицинской системе.

## Aggregate Root

`Patient`

## Ключ агрегата

```text
PatientId
```

## Основные сущности

* Patient
* InsuranceInfo
* EmergencyContact
* Consent

## Инварианты

* Пациент должен быть связан с CustomerId.
* Медицинский consent обязателен для AI processing.
* Нельзя удалить пациента при наличии активных визитов.
* PHI данные должны храниться в защищённом контуре.

## Основные события

* PatientRegistered
* PatientProfileUpdated
* ConsentGranted
* ConsentRevoked

---

# Appointment Aggregate

## Bounded Context

Appointment Context

## Назначение

Управление расписанием и записью на приём.

## Aggregate Root

`Appointment`

## Ключ агрегата

`AppointmentId`

## Основные сущности

* Appointment
* ScheduleSlot
* PhysicianAssignment

## Инварианты

* Один слот времени не может быть назначен двум пациентам.
* Appointment должен быть связан с существующим PatientId.
* Отменённый визит нельзя перевести в Completed.
* Врач должен быть доступен в указанное время.

## Основные события

* AppointmentScheduled
* AppointmentCancelled
* PatientCheckedIn
* AppointmentCompleted

---

# Clinical Case Aggregate

## Bounded Context

Clinical Workflow Context

## Назначение

Управление медицинским обследованием и диагнозом.

## Aggregate Root

`ClinicalCase`

## Ключ агрегата

`ClinicalCaseId`

## Основные сущности

* ClinicalCase
* Examination
* Diagnosis
* TreatmentPlan

## Инварианты

* ClinicalCase связан с PatientId.
* Диагноз не может быть создан без завершённого обследования.
* TreatmentPlan должен быть подписан врачом.
* Медицинские записи immutable после финализации.

## Основные события

* MedicalExaminationStarted
* MedicalExaminationCompleted
* DiagnosisCreated
* TreatmentAssigned

---

# AI Research Aggregate

## Bounded Context

AI Diagnostics Context

## Назначение

Управление AI-анализом медицинских данных.

## Aggregate Root

`AIResearch`

## Ключ агрегата

`AIResearchId`

## Основные сущности

* AIResearch
* AIModelVersion
* PredictionResult
* RiskAssessment

## Инварианты

* AI inference требует patient consent.
* Используется только approved ML model version.
* PredictionResult должен быть traceable.
* AI output не заменяет медицинское заключение врача.

## Основные события

* AIAnalysisRequested
* AIResearchCompleted
* AIRiskDetected

---

# Payment Aggregate

## Bounded Context

Payment Context

## Назначение

Обработка финансовых транзакций.

## Aggregate Root

`Payment`

## Ключ агрегата

`PaymentId`

## Основные сущности

* Payment
* Transaction
* PaymentMethod

## Инварианты

* Сумма транзакции immutable после подтверждения.
* Payment должен быть связан с InvoiceId.
* Дублирующие транзакции запрещены.
* Все операции должны быть audit logged.

## Основные события

* InvoiceGenerated
* PaymentCompleted
* PaymentFailed
* RefundIssued

---

# Credit Application Aggregate

## Bounded Context

Credit Context

## Назначение

Управление кредитными заявками.

## Aggregate Root

`CreditApplication`

## Ключ агрегата

`CreditApplicationId`

## Основные сущности

* CreditApplication
* CreditScore
* LoanContract

## Инварианты

* Credit scoring обязателен перед approval.
* Approved loan immutable после подписания.
* Loan contract должен иметь audit trail.
* Заявка привязана к CustomerId.

## Основные события

* CreditApplicationSubmitted
* CreditApproved
* CreditRejected
* LoanContractSigned

---

# Prescription Aggregate

## Bounded Context

Prescription Processing Context

## Назначение

Управление медицинскими назначениями и рецептами.

## Aggregate Root

`Prescription`

## Ключ агрегата

`PrescriptionId`

## Основные сущности

* Prescription
* Medication
* DosageInstruction

## Инварианты

* Prescription должен быть подписан врачом.
* Medication должна существовать в pharma catalog.
* Изменение prescription после отправки запрещено.
* Все prescriptions audit logged.

## Основные события

* PrescriptionIssued
* PrescriptionUpdated
* PrescriptionSentToPartner

---

# Telemetry Aggregate

## Bounded Context

Telemetry Ingestion Context

## Назначение

Обработка телеметрии медицинского оборудования.

## Aggregate Root

`TelemetryStream`

## Ключ агрегата

`TelemetryStreamId`

## Основные сущности

* TelemetryEvent
* Device
* DeviceMetric

## Инварианты

* Device должен быть зарегистрирован.
* События должны иметь timestamp.
* Duplicate telemetry events должны игнорироваться.
* Поток должен поддерживать ordering per device.

## Основные события

* TelemetryReceived
* DeviceAlertDetected
* DeviceDisconnected

---

# Dataset Aggregate

## Bounded Context

Self-Service Analytics Context

## Назначение

Управление аналитическими витринами и датасетами.

## Aggregate Root

`Dataset`

## Ключ агрегата

`DatasetId`

## Основные сущности

* Dataset
* SemanticDefinition
* AccessPolicy

## Инварианты

* Dataset должен иметь owner.
* PHI данные запрещены в self-service datasets.
* Semantic model versioned.
* Access policy обязательна.

## Основные события

* DatasetPublished
* DatasetUpdated
* AccessPolicyChanged

---

# Schema Aggregate

## Bounded Context

Schema Governance Context

## Назначение

Управление схемами событий.

## Aggregate Root

`SchemaDefinition`

## Ключ агрегата

`SchemaId`

## Основные сущности

* SchemaDefinition
* SchemaVersion
* CompatibilityRule

## Инварианты

* Schema version immutable.
* Backward compatibility обязательна.
* Schema должна быть зарегистрирована до публикации событий.
* Consumers должны использовать approved versions.

## Основные события

* SchemaVersionPublished
* SchemaDeprecated
* CompatibilityViolationDetected
