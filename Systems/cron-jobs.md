---
title: "Cron Jobs - Automation Infrastructure"
aliases: ["cron-jobs", "cron", "scheduled-automation"]
tags: [system, automation, infrastructure, active]
status: "active"
---

# ⏰ Cron Jobs - Scheduled Automation Layer

Master hub for all recurring automated tasks managed via Gateway cron service.

---

## 🎯 Overview

Central orchestration point for all scheduled work. Every task here runs isolated and reports back to main session.

---

## 📋 Active Jobs

| Name | Schedule | Purpose | Status | Related |
|------|----------|---------|--------|---------|
| **calendar-reminders** | */5 * * * * | WhatsApp alerts for events | ✅ Active | [[calendar-reminders]] |
| **az-job-monitor** | 0 8 * * * | Check AstraZeneca jobs | ✅ Active | [[az-job-monitor]] |
| **daily-news-complete** | 0 8 * * * | News digest to WhatsApp | ✅ Active | — |
| **weekly-summary-5pm** | 50 17 * * 1-5 | Weekly KPI summary | ✅ Active | — |
| **Cargar arturitos** | 50 17 * * 1-5 | 5:50 PM reminder (weekdays) | ✅ Active | — |
| **Avisar a papás** | 0 9 27 1 * | Monthly reminder | ✅ Active | — |
| **google-calendar-token-refresh** | 0 */6 * * * | Token maintenance | ✅ Active | [[google-calendar]] |
| **viral-reply-human** | 0 * * * * | Hourly X/Twitter engagement | ✅ Active | [[x-api]] |
| **email-tagger-hourly** | 0 */2 * * * | Tag emails (2h interval) | ⚠️ Configured | — |
| **whatsapp-auto-responder** | 0 */2 * * * | Auto-reply handler | ✅ Active | [[whatsapp-integration]] |
| **organizer-daily** | 0 4 * * * | Daily organization tasks | ✅ Active | — |

---

## 🔧 How Cron Jobs Work

### Architecture
```
Gateway Cron Service
    ↓
Scheduled time triggers
    ↓
Spawn isolated agent session
    ↓
Execute command/message
    ↓
Report result back to main
```

### Job Structure
```json
{
  "name": "calendar-reminders",
  "schedule": {"kind": "cron", "expr": "*/5 * * * *"},
  "sessionTarget": "isolated",
  "payload": {
    "kind": "agentTurn",
    "message": "Execute: node /path/to/script.js"
  }
}
```

---

## 📊 Cron Schedule Notation

**Syntax:** `minute hour day month day-of-week`

| Example | Meaning |
|---------|---------|
| `*/5 * * * *` | Every 5 minutes |
| `0 8 * * *` | Every day at 8:00 AM |
| `0 * * * *` | Every hour at :00 |
| `50 17 * * 1-5` | Mon-Fri at 5:50 PM |
| `0 9 27 1 *` | Jan 27 at 9:00 AM |

---

## 🔗 Integration Points

### WhatsApp Integration
- `calendar-reminders` → sends event alerts
- `daily-news-complete` → sends news digest
- `weekly-summary-5pm` → sends KPI summary
- `whatsapp-auto-responder` → processes incoming messages

**Related:** [[whatsapp-integration]]

### Google Calendar
- `calendar-reminders` — reads events, sends reminders
- `google-calendar-token-refresh` — keeps token valid

**Related:** [[google-calendar]]

### Job Tracking
- `az-job-monitor` — checks for new postings
- Links to [[az-job-monitor]] project

**Related:** [[az-job-monitor]], [[cv-updater]]

### Social Networks
- `viral-reply-human` — X/Twitter engagement
- Future: Moltbook auto-posting

**Related:** [[x-api]], [[moltbook-integration]]

---

## 🛠️ Managing Cron Jobs

### List all jobs
```bash
clawdbot cron list
```

### Add new job
```bash
clawdbot cron add \
  --name "job-name" \
  --schedule "0 9 * * *" \
  --command "node /path/script.js"
```

### Update job
```bash
clawdbot cron update \
  --name "calendar-reminders" \
  --enabled false
```

### Remove job
```bash
clawdbot cron remove --name "calendar-reminders"
```

### Run manually
```bash
clawdbot cron run --name "calendar-reminders"
```

---

## ⚡ Key Features

✅ **Isolation** — Each job runs in separate agent session  
✅ **Error handling** — Failed jobs logged, don't affect others  
✅ **Monitoring** — Can check status + last run time  
✅ **Flexible scheduling** — Standard cron syntax  
✅ **Token refresh** — Automatic OAuth token handling  
✅ **Logging** — All execution logged for debugging  

---

## 🔐 Security Considerations

**Isolation:**
- Jobs run in isolated sessions (can't access main session data)
- Each job has own environment
- Credentials only for specific job

**Permissions:**
- Scripts should only have access they need
- API keys stored in ~/.clawd/ (600 permissions)
- WhatsApp credential scoped to message sending only

**Monitoring:**
- Can see what jobs are scheduled
- Can disable risky jobs easily
- Logs available for audit trail

---

## 🚨 Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| Job not running | Disabled or time wrong | Check `clawdbot cron list` |
| Script error | Code issue or missing dependency | Check logs with `clawdbot cron runs --name job` |
| Token expired | OAuth token invalid | Job should auto-refresh, or check manually |
| WhatsApp not sending | Integration issue | Test manually, check credentials |
| Duplicate execution | Multiple cron jobs same schedule | Review cron list, consolidate if needed |

---

## 📈 Performance

**Current load:**
- 11 active jobs
- Most interval: 5 minutes (calendar-reminders)
- Peak: Daily at 8:00 AM (3 jobs simultaneous)
- Est. resource: <5% CPU, <50MB memory

**Optimization opportunities:**
- Batch daily jobs (currently 3 separate)
- Consolidate weekly jobs
- Consider 10-min instead of 5-min for non-critical reminders

---

## 🎯 Future Enhancements

- [ ] Dashboard showing cron job status
- [ ] Alerting if job fails X times
- [ ] Historical analytics (which jobs run most, slowest, etc.)
- [ ] Dependency tracking (which jobs should run in order)
- [ ] Conditional jobs ("only run if previous succeeded")
- [ ] Auto-scaling (add more resources if heavy load)

---

## 🔄 Job Dependencies

```
google-calendar-token-refresh (every 6h)
    ↓
    calendar-reminders (every 5 min, needs valid token)
    az-job-monitor (every 8 AM, needs valid token)

whatsapp-auto-responder (every 2h)
    ↓
    calendar-reminders
    daily-news-complete
    weekly-summary-5pm
```

---

## 📚 Related Systems

- [[gateway]] — Main service hosting cron
- [[token-management]] — OAuth token handling
- [[whatsapp-integration]] — Message delivery
- [[automation-layer]] — Overall automation philosophy

---

## 👤 Owner

Managed by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*This is the automation heartbeat. Everything scheduled lives here.*
