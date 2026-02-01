---
title: "Cashew Finance"
aliases: ["cashew-finance", "cashew", "transaction-tracker"]
tags: [project, finance, automation, in-progress]
status: "in-progress"
created: 2026-02-01
updated: 2026-02-01
priority: "high"
---

# 💰 Cashew Finance - Transaction Management

Automated financial tracking system for categorizing, importing, and analyzing personal transactions from credit card statements.

---

## 🎯 Goal

Build seamless transaction flow: Bank Statement → Extract → Categorize → Import to Cashew → Analyze.

---

## 📋 Current Status

| Component | Status | Details |
|-----------|--------|---------|
| Transaction extraction | ✅ Complete | 89 transactions extracted (Nov-Dec 2025) |
| Categorization | ✅ Complete | 7 categories + subcategories mapped |
| CSV/JSON generation | ✅ Complete | Output ready for import |
| Cashew app import | ⏸️ Pending | Awaiting API spec decision |
| Monthly automation | 🔄 Planned | Auto-import workflow |
| Analysis dashboard | 📋 Planned | Financial insights + trends |

---

## 💾 Data Summary (Latest Extract)

**Period:** November - December 2025  
**Total transactions:** 89  
**Income:** $5,938.51 (payments to card)  
**Expenses:** $23,299.21  
**Net:** -$17,360.70 (credit card balance)

---

## 📂 Category Structure

```
Inversiones
  ├─ Criptomonedas
  ├─ Tasa fija
  ├─ Tasa variable
  └─ Fondo de emergencia

Ahorro gusitos
  ├─ Subida de límite de crédito
  ├─ Computadora
  └─ Gastos variados

Tarifas y suscripciones (flat)
Comidas y lujos (flat)
Transporte (flat)
Ingreso de Trabajo (flat)
```

---

## 🛠️ Technical Implementation

### Scripts
- **Location:** `/home/diego/clawd/scripts/cashew_importer.py`
- **Language:** Python 3
- **Dependencies:** `pdfplumber` (PDF extraction), `json` (output)
- **Input:** PDF credit card statements
- **Output:** JSON with categorized transactions

### Data Files
- **Tracker:** `~/.cashew_tracker.json` (state + history)
- **Output:** `/home/diego/clawd/transacciones_diciembre_2025.json`
- **Categories:** Hardcoded in script (keyword matching)

### Workflow

1. **Extract PDF** → Use pdfplumber to get transaction text
2. **Parse transactions** → Extract date, amount, description
3. **Categorize** → Match description against keyword dictionary
4. **Validate** → Check totals match statement
5. **Generate output** → JSON + Cashew app link
6. **Upload** → Send to Cashew (awaiting API decision)

---

## 🔄 API Integration (PENDING)

**Decision needed:** Which integration method?

### Option 1: Batch Upload
- **Method:** CSV/JSON bulk upload endpoint
- **Frequency:** Monthly (or on-demand)
- **Pros:** Simple, one-shot operation
- **Cons:** Requires bulk endpoint support
- **Best for:** Monthly reconciliation

### Option 2: Streaming API
- **Method:** POST each transaction individually
- **Frequency:** Real-time or daily
- **Pros:** Real-time tracking, transaction-by-transaction control
- **Cons:** More API calls, rate limiting possible
- **Best for:** Transaction-level tracking

### Option 3: Webhook Approach
- **Method:** Cashew calls back to update Diego's records
- **Frequency:** Whenever Cashew sees transaction
- **Pros:** Source of truth is Cashew, automatic sync
- **Cons:** Requires server/webhook endpoint
- **Best for:** Bidirectional sync

**Status:** Awaiting Diego's preference on [[2026-02-01]]

---

## 📊 Key Features

### Current
- ✅ PDF statement parsing
- ✅ Smart categorization (keyword matching)
- ✅ JSON export ready
- ✅ Deduplication (prevents re-importing same transaction)

### Planned
- 🔄 Monthly automation (Cron job for auto-import)
- 📈 Financial dashboard (summary by category)
- 📊 Trend analysis (month-over-month, yearly)
- 🎯 Budget tracking (set limits per category)
- 💡 Insights (where money goes, anomalies)
- 🔗 Integration with [[calendar-reminders]] for payment reminders

---

## 🔗 Dependencies & Related

**Uses:**
- Python 3.x with pdfplumber
- Cashew app (external)
- [[cron-jobs]] (planned for monthly automation)

**Integrates with:**
- Credit card statements (Nu México CC)
- Cashew Finance app
- Personal finance tracking

**Related Projects:**
- [[az-job-monitor]] (income tracking)
- [[calendar-reminders]] (payment reminders)

---

## 📝 Transaction Categories

**Inversiones (Investments)**
- Cryptocurrency purchases/transfers
- Fixed interest (savings)
- Variable return investments
- Emergency fund contributions

**Ahorro gusitos (Fun Savings)**
- Credit limit increase fees
- Computer/tech equipment
- Miscellaneous savings

**Tarifas y suscripciones (Fees & Subscriptions)**
- Streaming services
- Subscriptions
- Bank fees
- Software licenses

**Comidas y lujos (Food & Luxury)**
- Restaurants
- Groceries (partially)
- Entertainment
- Personal indulgences

**Transporte (Transportation)**
- Gas/fuel
- Public transit
- Uber/taxi
- Car maintenance

**Ingreso de Trabajo (Work Income)**
- Salary deposits
- Freelance payments
- Bonus/commission

---

## 🧮 Categorization Logic

**Keyword matching (highest priority):**
```python
keywords = {
    "crypto": "Inversiones/Criptomonedas",
    "onchain": "Inversiones/Criptomonedas",
    "transferencia": "Ahorro",
    "pago": "Ingreso de Trabajo",
    "restaurante": "Comidas y lujos",
    "netflix": "Tarifas y suscripciones",
    "gasolina": "Transporte",
    # ... more patterns
}
```

**Custom overrides (hardcoded for known merchants):**
- "Compra diferida" → Tarifas y suscripciones (not Ahorro)
- Specific store names → correct category

---

## 📋 Workflow Example

**Input:** PDF statement from bank  
**Process:**
1. Extract text: "FEB 1 | -500.00 | NETFLIX"
2. Match keywords: "netflix" → Tarifas y suscripciones
3. Create record: `{date: "2026-02-01", amount: 500, category: "Tarifas y suscripciones", description: "NETFLIX"}`
4. Export JSON
5. Generate Cashew import link

**Output:**
```json
{
  "transactions": [
    {
      "date": "2026-02-01",
      "amount": 500.00,
      "type": "expense",
      "category": "Tarifas y suscripciones",
      "description": "NETFLIX",
      "source": "Nu México CC"
    }
  ]
}
```

---

## 🚀 Next Steps

### Immediate (Next heartbeat)
1. **Clarify API method** — Ask Diego which integration approach (batch/streaming/webhook)
2. **Implement chosen method** — Build endpoint/script for API upload
3. **Test with sample data** — Verify Cashew receives transactions correctly

### Short-term (This week)
1. Create cron job for monthly automation
2. Refine categorization logic based on first real import
3. Add transaction deduplication check
4. Set up error handling + retry logic

### Medium-term (Next 2 weeks)
1. Build dashboard to visualize categorized spending
2. Add budget tracking per category
3. Implement anomaly detection (unusual transactions)
4. Create monthly summary report

### Long-term (Next month)
1. Integrate with [[calendar-reminders]] (payment reminders)
2. Add recurring transaction detection
3. Build savings goal tracking
4. Create financial insights + recommendations

---

## 🔧 Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| Transactions not categorizing | Keyword not in dictionary | Add pattern to `keywords` dict |
| PDF parsing fails | Unsupported PDF format | Check PDF is text-based (not scanned image) |
| Duplicate transactions | Script run twice on same file | Check dedup logic in `~/.cashew_tracker.json` |
| Amount mismatch | Parsing error or fee not included | Validate against statement manually |

---

## 📚 References

**Files:**
- Script: `/home/diego/clawd/scripts/cashew_importer.py`
- Output: `/home/diego/clawd/transacciones_diciembre_2025.json`
- State: `~/.cashew_tracker.json`

**Related notes:**
- Daily log: [[2026-02-01]] (implementation date)
- Cashew app: https://cashewapp.com (external link)

---

## 🔄 Version History

| Date | Change | Status |
|------|--------|--------|
| 2026-02-01 | Initial implementation: extraction + categorization | v1.0 Complete |
| TBD | API integration (awaiting decision) | v2.0 Planned |
| TBD | Monthly automation + dashboard | v2.5 Planned |

---

## 👤 Owner

Created by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*Blocked on: API integration method decision. Awaiting [[2026-02-01]] follow-up conversation.*
