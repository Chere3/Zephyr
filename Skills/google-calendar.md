---
title: "Google Calendar Skill"
aliases: ["google-calendar", "calendar"]
tags: [skill, calendar, api, active]
location: "/home/diego/clawd/skills/google-calendar"
status: "active"
---

# 📅 Google Calendar Skill

Complete Google Calendar API integration for event management, real-time reminders, and automation.

---

## 🎯 What It Does

Reads events from Google Calendar, extracts reminder metadata, and enables automated workflows like [[calendar-reminders]].

---

## 🛠️ Core Scripts

| Script | Purpose | Usage |
|--------|---------|-------|
| `calendar_list.js` | List events (today/week/range) | `node scripts/calendar_list.js --today` |
| `calendar_create.js` | Create new events | `node scripts/calendar_create.js --title "Event" --date "2026-02-02" --time "15:00"` |
| `calendar_update.js` | Modify existing events | `node scripts/calendar_update.js --event-id "xxx" --title "New Title"` |
| `calendar_delete.js` | Remove events | `node scripts/calendar_delete.js --event-id "xxx"` |
| `calendar_reminders.js` | Real-time reminders | Runs via [[cron-jobs]] every 5 min |
| `refresh_token.js` | Refresh OAuth token | Manual or auto via cron (6h) |
| `auth.js` | Initial OAuth setup | One-time setup |

---

## 📊 Key Capabilities

✅ **Read events** — Today, this week, custom date range  
✅ **Create events** — New events with recurrence  
✅ **Modify events** — Change time, title, description, attendees  
✅ **Delete events** — Remove events from calendar  
✅ **Real-time reminders** — WhatsApp notifications based on reminder settings  
✅ **Recurring events** — Support for daily/weekly/monthly/yearly patterns  
✅ **Token management** — Auto-refresh via cron  

---

## 🔗 Used By

| Project | Purpose |
|---------|---------|
| [[calendar-reminders]] | Reads events + sends reminders |
| [[cashew-finance]] | Future: Calendar payment reminders |
| Daily notes | Check upcoming events |

---

## 📁 File Structure

```
/home/diego/clawd/skills/google-calendar/
├── SKILL.md                          # Main documentation
├── scripts/
│   ├── auth.js                       # OAuth setup
│   ├── calendar_list.js              # List events
│   ├── calendar_create.js            # Create events
│   ├── calendar_update.js            # Modify events
│   ├── calendar_delete.js            # Delete events
│   ├── calendar_reminders.js         # Real-time reminders
│   ├── refresh_token.js              # Token refresh
│   └── tasks_list.js                 # Google Tasks (related)
├── node_modules/                     # googleapis dependency
├── package.json
└── references/
    └── google-calendar-api.md
```

---

## 🔐 Authentication

**Setup:** One-time OAuth flow via `auth.js`  
**Token:** `~/.clawd/google-calendar-token.json` (user-only permissions)  
**Expiry:** 60 minutes  
**Refresh:** Automatic via [[cron-jobs]] (every 6 hours) or built-in pre-flight checks  

---

## 📋 Examples

### List today's events
```bash
node scripts/calendar_list.js --today
```

### Create recurring event
```bash
node scripts/calendar_create.js \
  --title "Lavarse la cara" \
  --date "2026-02-01" \
  --time "19:30" \
  --duration 15 \
  --description "Daily hygiene routine" \
  --recurrence "DAILY"
```

### Get reminders metadata
```bash
node scripts/calendar_list.js --today | jq '.[] | {title: .summary, reminders: .reminders}'
```

---

## 🧠 How Reminders Work

**Data flow:**
1. Event created with reminder time (e.g., 15 minutes)
2. Google Calendar stores: `reminders: { useDefault: true }` OR `reminders: { overrides: [{minutes: 15}] }`
3. [[calendar-reminders]] script reads event
4. Extracts reminder time from metadata
5. When time comes, sends WhatsApp alert

**Reminder sources (priority):**
1. Custom overrides (if event has explicit reminder times)
2. Google default (if `useDefault: true`)
3. Fallback (15 minutes if no reminder set)

---

## 🔗 Integration with Other Skills

- **Token management:** Uses OAuth from [[token-management]]
- **WhatsApp:** Sends reminders via [[whatsapp-integration]]
- **Cron jobs:** Scheduled refresh via [[cron-jobs]]

---

## 🚨 Common Issues

| Problem | Solution |
|---------|----------|
| "invalid_request" error | Token expired → auto-refresh (script handles) |
| Can't read events | Check permissions in Google OAuth setup |
| Reminders not firing | Verify Google Calendar app has reminders enabled |
| Script hangs | Network timeout → add timeout parameter |

---

## 🎯 Future Enhancements

- [ ] Calendar sync with Obsidian (auto-update notes)
- [ ] Event templates (recurring patterns)
- [ ] Conflict detection (warn if double-booked)
- [ ] Smart scheduling (find best meeting time for attendees)
- [ ] Integration with [[cashew-finance]] (payment calendar)

---

## 📊 Performance

- **List events:** ~500ms (API call)
- **Create event:** ~300ms
- **List reminders:** ~500ms (with parsing)
- **Token refresh:** ~1s (includes network)

---

## 📚 Documentation

**Full skill docs:** `/home/diego/clawd/skills/google-calendar/SKILL.md`  
**API reference:** `references/google-calendar-api.md`  
**Setup guide:** Run `node scripts/auth.js` for OAuth setup  
**Related:** [[calendar-reminders]] project documentation  

---

## 👤 Owner

Managed by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*Core skill for calendar automation and event tracking.*
