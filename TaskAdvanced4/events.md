# События

# Каталог доменных событий

---

# Customer Profile Context

## CustomerRegistered

### Контекст-источник

Customer Profile Context

### Семантика

Создан новый клиент платформы.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "CustomerRegistered",
  "occurredAt": "timestamp",
  "customerId": "uuid",
  "fullName": "string",
  "email": "string"
}
```

---

## CustomerProfileUpdated

### Контекст-источник

Customer Profile Context

### Семантика

Обновлены данные клиента.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "CustomerProfileUpdated",
  "occurredAt": "timestamp",
  "customerId": "uuid",
  "changedFields": ["string"]
}
```

---

# Patient Management Context

## PatientRegistered

### Контекст-источник

Patient Management Context

### Семантика

Пациент зарегистрирован в медицинской системе.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "PatientRegistered",
  "occurredAt": "timestamp",
  "patientId": "uuid",
  "customerId": "uuid",
  "clinicId": "uuid"
}
```

---

## ConsentGranted

### Контекст-источник

Patient Management Context

### Семантика

Пациент предоставил согласие на обработку данных.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "ConsentGranted",
  "occurredAt": "timestamp",
  "patientId": "uuid",
  "consentType": "AI_PROCESSING"
}
```

---

# Appointment Context

## AppointmentScheduled

### Контекст-источник

Appointment Context

### Семантика

Создана запись на приём.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "AppointmentScheduled",
  "occurredAt": "timestamp",
  "appointmentId": "uuid",
  "patientId": "uuid",
  "doctorId": "uuid",
  "scheduledAt": "timestamp"
}
```

---

## PatientCheckedIn

### Контекст-источник

Appointment Context

### Семантика

Пациент зарегистрирован на визит.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "PatientCheckedIn",
  "occurredAt": "timestamp",
  "appointmentId": "uuid",
  "patientId": "uuid"
}
```

---

# Clinical Workflow Context

## MedicalExaminationStarted

### Контекст-источник

Clinical Workflow Context

### Семантика

Начато медицинское обследование.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "MedicalExaminationStarted",
  "occurredAt": "timestamp",
  "clinicalCaseId": "uuid",
  "patientId": "uuid",
  "doctorId": "uuid"
}
```

---

## DiagnosisCreated

### Контекст-источник

Clinical Workflow Context

### Семантика

Создан медицинский диагноз.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "DiagnosisCreated",
  "occurredAt": "timestamp",
  "clinicalCaseId": "uuid",
  "patientId": "uuid",
  "diagnosisCode": "string"
}
```

---

# AI Diagnostics Context

## AIAnalysisRequested

### Контекст-источник

AI Diagnostics Context

### Семантика

Запущен AI-анализ медицинских данных.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "AIAnalysisRequested",
  "occurredAt": "timestamp",
  "aiResearchId": "uuid",
  "patientId": "uuid",
  "modelVersion": "string"
}
```

---

## AIResearchCompleted

### Контекст-источник

AI Diagnostics Context

### Семантика

AI-анализ завершён.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "AIResearchCompleted",
  "occurredAt": "timestamp",
  "aiResearchId": "uuid",
  "patientId": "uuid",
  "resultStatus": "SUCCESS"
}
```

---

## AIRiskDetected

### Контекст-источник

AI Diagnostics Context

### Семантика

AI выявил риск или аномалию.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "AIRiskDetected",
  "occurredAt": "timestamp",
  "patientId": "uuid",
  "riskLevel": "HIGH",
  "riskType": "string"
}
```

---

# Payment Context

## InvoiceGenerated

### Контекст-источник

Payment Context

### Семантика

Сформирован счёт на оплату.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "InvoiceGenerated",
  "occurredAt": "timestamp",
  "invoiceId": "uuid",
  "customerId": "uuid",
  "amount": 1000.50,
  "currency": "EUR"
}
```

---

## PaymentCompleted

### Контекст-источник

Payment Context

### Семантика

Платёж успешно выполнен.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "PaymentCompleted",
  "occurredAt": "timestamp",
  "paymentId": "uuid",
  "invoiceId": "uuid",
  "amount": 1000.50
}
```

---

## PaymentFailed

### Контекст-источник

Payment Context

### Семантика

Платёж завершился ошибкой.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "PaymentFailed",
  "occurredAt": "timestamp",
  "paymentId": "uuid",
  "reason": "INSUFFICIENT_FUNDS"
}
```

---

# Credit Context

## CreditApplicationSubmitted

### Контекст-источник

Credit Context

### Семантика

Подана кредитная заявка.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "CreditApplicationSubmitted",
  "occurredAt": "timestamp",
  "creditApplicationId": "uuid",
  "customerId": "uuid",
  "requestedAmount": 5000
}
```

---

## CreditApproved

### Контекст-источник

Credit Context

### Семантика

Кредитная заявка одобрена.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "CreditApproved",
  "occurredAt": "timestamp",
  "creditApplicationId": "uuid",
  "approvedAmount": 5000,
  "interestRate": 6.5
}
```

---

# Prescription Processing Context

## PrescriptionIssued

### Контекст-источник

Prescription Processing Context

### Семантика

Создан медицинский рецепт.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "PrescriptionIssued",
  "occurredAt": "timestamp",
  "prescriptionId": "uuid",
  "patientId": "uuid",
  "doctorId": "uuid"
}
```

---

## PrescriptionSentToPartner

### Контекст-источник

Prescription Processing Context

### Семантика

Рецепт отправлен фармацевтическому партнёру.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "PrescriptionSentToPartner",
  "occurredAt": "timestamp",
  "prescriptionId": "uuid",
  "partnerId": "uuid"
}
```

---

# Telemetry Ingestion Context

## TelemetryReceived

### Контекст-источник

Telemetry Ingestion Context

### Семантика

Получена телеметрия от медицинского устройства.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "TelemetryReceived",
  "occurredAt": "timestamp",
  "deviceId": "uuid",
  "patientId": "uuid",
  "metricType": "HEART_RATE",
  "metricValue": 88
}
```

---

## DeviceAlertDetected

### Контекст-источник

Telemetry Ingestion Context

### Семантика

Обнаружено критическое состояние оборудования или пациента.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "DeviceAlertDetected",
  "occurredAt": "timestamp",
  "deviceId": "uuid",
  "alertLevel": "CRITICAL",
  "description": "string"
}
```

---

# Self-Service Analytics Context

## DatasetPublished

### Контекст-источник

Self-Service Analytics Context

### Семантика

Опубликован новый аналитический датасет.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "DatasetPublished",
  "occurredAt": "timestamp",
  "datasetId": "uuid",
  "datasetName": "string",
  "owner": "string"
}
```

---

## BusinessKPICalculated

### Контекст-источник

Realtime Analytics Context

### Семантика

Рассчитан бизнес KPI.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "BusinessKPICalculated",
  "occurredAt": "timestamp",
  "kpiName": "MonthlyRevenue",
  "value": 1000000,
  "period": "2026-05"
}
```

---

# Schema Governance Context

## SchemaVersionPublished

### Контекст-источник

Schema Governance Context

### Семантика

Опубликована новая версия схемы событий.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "SchemaVersionPublished",
  "occurredAt": "timestamp",
  "schemaId": "uuid",
  "schemaVersion": "v2",
  "compatibilityMode": "BACKWARD"
}
```

---

# Compliance Context

## ComplianceViolationDetected

### Контекст-источник

Compliance Context

### Семантика

Обнаружено нарушение политики безопасности или compliance.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "ComplianceViolationDetected",
  "occurredAt": "timestamp",
  "violationType": "PHI_ACCESS",
  "severity": "HIGH"
}
```

---

## AuditRecordCreated

### Контекст-источник

Audit Context

### Семантика

Создана audit запись о действии пользователя или системы.

### Минимальный контракт

```json
{
  "eventId": "uuid",
  "eventType": "AuditRecordCreated",
  "occurredAt": "timestamp",
  "actorId": "uuid",
  "action": "CREATE_PATIENT",
  "resourceId": "uuid"
}
```
