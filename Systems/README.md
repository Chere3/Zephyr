# ⚙️ Systems

Operational infrastructure and automation documentation.

---

## 📁 Contents

| System | Description |
|--------|-------------|
| [[cron-jobs]] | Scheduled tasks and their schedules |
| [[token-management]] | API token refresh and maintenance |
| [[whatsapp-integration]] | WhatsApp gateway configuration |
| [[Skills-Strategy]] | How skills are managed |

---

## 🕐 Active Cron Jobs

| Schedule | Job | Purpose |
|----------|-----|---------|
| `*/2 * * * *` | calendar-reminders | Check for upcoming events |
| `0 */2 * * *` | email-tagger | Classify new emails |
| `0 6 * * *` | embeddings-indexer | Update vector memory |
| `0 8 * * *` | az-job-monitor | Check for new jobs |
| `0 * * * *` | viral-reply-human | Twitter engagement |

---

## ✍️ Adding Systems

1. Create `system-name.md` in this folder
2. Include: Purpose, Configuration, Maintenance notes
3. Update [[INDEX]] if significant

---

*Systems keep everything running automatically.*
