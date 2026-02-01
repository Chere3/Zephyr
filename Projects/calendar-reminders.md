---
title: "Calendar Reminders"
aliases: ["calendar-reminders", "whatsapp-reminders"]
tags: [project, automation, calendar, active]
status: "active"
created: 2026-02-01
updated: 2026-02-01
priority: "high"
---

# 📱 Calendar Reminders via WhatsApp

Real-time notifications for upcoming calendar events, delivered to WhatsApp based on reminder settings.

---

## 🎯 Goal

Receive WhatsApp reminders before events using Google Calendar's reminder metadata (custom times or 15-min default).

---

## 📋 Implementation Status

| Component | Status | Details |
|-----------|--------|---------|
| Script | ✅ Complete | `calendar_reminders.js` working |
| Cron job | ✅ Active | Every 5 minutes |
| Token refresh | ✅ Complete | Auto pre-flight + mid-flight retry |
| WhatsApp delivery | ✅ Working | Formatted messages with details |
| State tracking | ✅ Complete | Prevents duplicates |
| Production | ✅ Running | Cron ID: `f1ab3352...` |

---

## 🛠️ Technical Details

### Core Script
- **Location:** `/home/diego/clawd/skills/google-calendar/scripts/calendar_reminders.js`
- **Language:** Node.js
- **Dependencies:** `googleapis` (already installed)
- **Size:** ~6.5 KB

### Cron Configuration
- **Schedule:** `*/5 * * * *` (every 5 minutes)
- **Cron ID:** `f1ab3352-c50c-42b9-b91f-621861dbb8c8`
- **Mode:** Isolated session
- **Wake mode:** Next heartbeat

### State Management
- **File:** `~/.clawd/calendar-reminders-state.json`
- **Purpose:** Track sent reminders to prevent duplicates
- **Cleanup:** Auto-removes entries >48 hours old
- **Cooldown:** 10-minute minimum between same reminder

### Token Handling
- **Token path:** `~/.clawd/google-calendar-token.json`
- **Pre-flight:** Checks expiry on startup, refreshes if <5 min remaining
- **Mid-flight:** If API call fails with auth error, auto-refreshes and retries
- **Function:** `refreshTokenSafely()` with 30-second timeout

---

## 💬 Message Format

**Example WhatsApp reminder:**
```
⏰ Recordatorio en 15 min

📌 Ordenar finanzas
🕐 11:00 (2 hours)
📍 [Location if set]

📝 [Description if set]
```

---

## 🔗 Dependencies & Related

**Uses:**
- [[google-calendar]] skill (event reading + reminder metadata)
- [[cron-jobs]] system (scheduling)
- [[whatsapp-integration]] system (message delivery)

**Integrates with:**
- Google Calendar API (v3)
- Clawdbot message tool
- Obsidian for documentation

---

## 📝 How It Works

1. **Startup:** Checks token expiry, refreshes if needed
2. **List events:** Gets next 24 hours of events from Google Calendar
3. **Check reminders:** For each event, reads custom reminder time (or defaults to 15 min)
4. **Calculate timing:** Determines if reminder should fire now (±5 min window)
5. **Track state:** Checks if reminder already sent (prevents duplicates)
6. **Send message:** Calls `clawdbot message send --channel=whatsapp`
7. **Update state:** Records sent time in `calendar-reminders-state.json`
8. **Cleanup:** Removes old state entries (>48h)

---

## 🔧 Configuration

### Reminder Timing Sources

**Priority order:**
1. **Custom overrides** — If event has `reminders.overrides` with custom times
2. **Google default** — If event has `reminders.useDefault: true` (uses 15 min)
3. **Fallback** — 15 minutes if no reminders set

### To Change Reminder Time

Edit script line 27:
```javascript
// Current fallback (15 min)
return 15;

// Change to 30 min:
return 30;
```

### To Run Manually
```bash
node /home/diego/clawd/skills/google-calendar/scripts/calendar_reminders.js
```

---

## 📊 Testing & Validation

**Tested:** 2026-02-01 11:40 AM  
**Status:** Script runs successfully, token refresh working  
**Next test:** Monitor actual event reminders over 48 hours  

**Expected behavior:**
- 11:45 AM — Reminder for "Ordenar finanzas" (11:00 event + 15 min reminder)
- 13:45 PM — Reminder for "Ordenar cuarto" (13:00 event)
- And so on...

---

## 🚨 Troubleshooting

| Issue | Solution |
|-------|----------|
| No reminders sent | Check cron job is enabled: `clawdbot cron list` |
| Token errors | Script auto-refreshes; if persists, manually refresh: `node scripts/refresh_token.js` |
| WhatsApp not receiving | Check WhatsApp integration is configured; verify channel in script |
| Duplicate messages | Cooldown logic should prevent; check `~/.clawd/calendar-reminders-state.json` |

---

## 🎯 Future Enhancements

- [ ] Custom message templates per event type
- [ ] Message threading/grouping for multiple reminders
- [ ] Snooze option in WhatsApp reply
- [ ] Calendar-specific filtering (skip certain calendars)
- [ ] Integration with [[cashew-finance]] for financial events
- [ ] Daily reminder summary (all reminders for the day)

---

## 📚 Documentation

**Related files:**
- Skill documentation: `/home/diego/clawd/skills/google-calendar/SKILL.md`
- Structure guide: `/home/diego/clawd/OBSIDIAN-STRUCTURE.md`
- Daily notes: [[2026-02-01]] (implementation date)

---

## 🔄 Version History

| Date | Change | Version |
|------|--------|---------|
| 2026-02-01 | Initial implementation + token refresh | 1.0 |
| 2026-02-01 | Auto token refresh enhancement | 1.1 |

---

## 👤 Owner

Created by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*This project is actively maintained. Changes documented in [[2026-02-01]] and beyond.*
