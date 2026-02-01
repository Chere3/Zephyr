---
title: "WhatsApp Integration"
aliases: ["whatsapp-integration", "whatsapp", "messaging"]
tags: [system, communication, integration, active]
status: "active"
---

# 💬 WhatsApp Integration - Primary Messaging Channel

Master hub for all WhatsApp communication. Used by [[calendar-reminders]], news digests, alerts, and auto-responses.

---

## 🎯 Overview

WhatsApp is the primary notification channel for all automated systems. When [[cron-jobs]] execute, they send formatted messages here.

---

## 📤 Outbound Messages

### Sources
| Source | Frequency | Purpose | Status |
|--------|-----------|---------|--------|
| [[calendar-reminders]] | Every 5 min (when triggered) | Event alerts | ✅ Active |
| `daily-news-complete` | Daily 8 AM | News digest | ✅ Active |
| `weekly-summary-5pm` | Fri 5:50 PM | Weekly KPIs | ✅ Active |
| [[az-job-monitor]] | Daily 8 AM (if new jobs) | Job alerts | ✅ Active |
| `Cargar arturitos` | Weekdays 5:50 PM | Reminder | ✅ Active |

### Message Format

**Standard template:**
```
[Emoji] [TITLE]

[Brief description]
[Details if needed]

[Link/action if applicable]

[Footer/timestamp]
```

**Example (calendar reminder):**
```
⏰ Recordatorio en 15 min

📌 Ordenar finanzas
🕐 11:00 (2 hours)
📍 [Location]

📝 [Description if set]
```

---

## 📥 Inbound Messages

### Auto-responder
- **Script:** `whatsapp-auto-responder` (cron 2h)
- **Function:** Monitor incoming messages, auto-reply if configured
- **Status:** ✅ Active

### Manual Interaction
- Diego sends commands/queries to Zephyr
- Processed in main session
- Responses sent back via WhatsApp

---

## 🔧 Technical Implementation

### Sending Messages
```bash
clawdbot message send \
  --channel=whatsapp \
  --message="Your message here" \
  --target="default"
```

### Integration Points

**From Node.js scripts:**
```javascript
execSync(`clawdbot message send --channel=whatsapp --message="${msg}"`, {
  stdio: 'pipe'
});
```

**From Python scripts:**
```python
import subprocess
subprocess.run([
  'clawdbot', 'message', 'send',
  '--channel=whatsapp',
  '--message=Your message',
  '--target=default'
])
```

**From cron jobs:**
```json
{
  "payload": {
    "kind": "agentTurn",
    "message": "Send WhatsApp: Your message"
  }
}
```

---

## ✨ Features

✅ **Formatted messages** — Rich text, emojis, line breaks  
✅ **Multiple sources** — Cron jobs, scripts, cron jobs can all send  
✅ **Error handling** — If send fails, logged (doesn't crash main system)  
✅ **Rate limiting** — Respects WhatsApp limits  
✅ **Timezone aware** — Messages include timestamps in Mexico City time  

---

## 📊 Message Volume

**Current rate:**
- Calendar reminders: 0-5 per day (event-driven)
- News digest: 1 per day (8 AM)
- Weekly summary: 1 per week (Friday 5:50 PM)
- Job alerts: 0-1 per day (when new jobs found)
- Cargar arturitos: 5 per week (weekdays)

**Total:** ~15-20 messages per week  
**Status:** Well within WhatsApp limits

---

## 🎯 Message Categories

### Alerts (Priority: High)
- Calendar reminders (15 min before event)
- New job postings (only NEW ones)
- System errors (if any)

### Digests (Priority: Medium)
- Daily news summary (8 AM)
- Weekly metrics (Friday 5:50 PM)

### Reminders (Priority: Low)
- Cargar arturitos (weekdays 5:50 PM)
- Other personal reminders

---

## 🔗 Integration with Projects

| Project | Usage | Frequency |
|---------|-------|-----------|
| [[calendar-reminders]] | Event alerts | Every 5 min (triggered) |
| [[az-job-monitor]] | New job alerts | Daily 8 AM |
| [[cashew-finance]] | Payment reminders (future) | Daily |
| [[moltbook-integration]] | Social network posts (future) | Manual |

---

## 🚨 Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| Message not sent | WhatsApp API down | Retry in 5 min |
| Malformed message | Text escaping issue | Check quote marks + special chars |
| No formatting | Missing newlines | Add \n for line breaks |
| Emoji not showing | Character encoding | Use UTF-8, test in script |
| Subprocess call fails | PATH issue | Use full path to clawdbot |

---

## 🔐 Privacy & Security

✅ Messages sent over WhatsApp's encrypted channels  
✅ No sensitive data in messages (PII sanitized)  
✅ Credentials stored securely  
✅ Account limited to messaging only (no read access)  

---

## 🎯 Future Enhancements

- [ ] Interactive buttons in WhatsApp (reply with options)
- [ ] Media attachments (screenshots, PDFs)
- [ ] Message threading (group related alerts)
- [ ] Do-not-disturb hours (no messages 11 PM - 8 AM)
- [ ] Message templates + personalization
- [ ] Analytics (which alerts get read, replied to, etc.)

---

## 📚 Related Systems

- [[cron-jobs]] — Schedule senders
- [[token-management]] — Credential handling
- [[calendar-reminders]] — Major user
- [[az-job-monitor]] — Major user

---

## 👤 Owner

Managed by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*The primary notification channel for all automated systems.*
