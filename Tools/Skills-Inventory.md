---
type: tools
status: active
tags: [skills, tools, inventory, automation]
---

# 🛠️ Skills Inventory

> Complete catalog of installed Agent Skills in Clawdbot

**Location:** `/home/diego/clawd/skills/`  
**Total:** 11 skills (active + in progress)

---

## ✅ Active Skills

### 📄 CV Updater
**Path:** `cv-updater/`  
**Status:** ✅ Active & Used  
**Purpose:** Match job keywords → optimize CV → generate PDF

**Key Features:**
- Extract keywords from job postings
- Highlight matching skills in CV
- Add missing keywords to skills section
- Compile to PDF automatically

**Requirements:** `pdflatex` (TeXLive)  
**Used for:** [[Projects/AstraZeneca]] CV generation

**Scripts:**
- `update_cv.py` — Keyword highlighting (v1)
- `generate_custom_cv.py` — Intelligent rewrite (v2, working)
- `update_cv_intelligent.py` — Full AI analysis (v3, in progress)

---

### 🐦 Social Media

#### LinkedIn Poster
**Path:** `linkedin-poster/`  
**Status:** ✅ Installed  
**Purpose:** Automate LinkedIn post publishing

**Features:**
- Post text/images to LinkedIn
- Schedule posts for later
- Automate workflow

**Auth:** Manual browser login (one-time)  
**Scripts:** `scripts/auth.js`, `scripts/post.js`

---

### 📅 Google Calendar
**Path:** `google-calendar/`  
**Status:** ⚠️ Setup needed (token auth issue)  
**Purpose:** Complete calendar management & daily summaries

**Features:**
- View events (today/week/date range)
- Create/modify/delete events
- Set reminders & notifications
- Generate daily briefing

**Setup:** `node scripts/auth.js` (OAuth)  
**Used for:** [[Systems/Cron-Jobs#Daily News Digest]]  
**Issue:** Token occasionally expires (noted in memory)

---

### 🎵 Music Control
**Path:** `music-control/`  
**Status:** ✅ Installed  
**Purpose:** Control music player & fetch lyrics

**Features:**
- Get current song info
- Play/pause music
- Skip tracks
- Fetch lyrics
- Works with: Spotify, VLC, MPRIS-compatible apps

**Tech:** `playerctl` + Genius API  
**Scripts:** `scripts/current.sh`, `scripts/play.sh`, `scripts/lyrics.sh`

---

### 📧 Email Tagger
**Path:** `email-tagger/`  
**Status:** ✅ Active (Auto-recovery enabled as of 2026-01-31)  
**Purpose:** Auto-flag important emails based on rules

**Features:**
- Scan emails by heuristics
- Score-based flagging system
- Auto-star important emails

**Tech:** IMAP connection  
**Scripts:** `scripts/tagger.js`  
**Auto-fix:** Detects port 1143 issues & starts Proton Bridge (implemented 2026-01-31)

---

### 🤖 WhatsApp Auto-Responder
**Path:** `whatsapp-auto-responder/`  
**Status:** ⚠️ Installed (not primary)  
**Purpose:** Learn personality & auto-respond via WhatsApp

**Features:**
- QR code device linking
- Learn from past messages
- Auto-respond with personality
- Message summary

**Tech:** Baileys (WhatsApp Web API)  
**Scripts:** `scripts/responder.js`

---

### 📊 Polymarket
**Path:** `polymarket/`  
**Status:** ✅ Installed  
**Purpose:** Query prediction markets (odds, trending, search)

**Features:**
- Check trending markets
- Search specific events
- Track market prices
- Get odds on predictions

**API:** Polymarket.com REST API  
**Scripts:** `scripts/polymarket.py`  
**Example:** Bitcoin prices, election odds, tech predictions

---

### 🔐 1Password
**Path:** `1password/`  
**Status:** ✅ Installed  
**Purpose:** Secure vault management via CLI

**Features:**
- List vault items
- Get item details securely
- Interact with 1Password vaults

**Requirements:** `op` CLI installed & authenticated  
**Scripts:** `scripts/op.js`

---

### 🗂️ Organizer
**Path:** `organizer/`  
**Status:** ✅ Installed  
**Purpose:** Auto-organize files by extension

**Features:**
- Organize Downloads/Inbox folders
- File categorization rules
- Supports: Images, Documents, Archives, Audio, Video, Code, etc.

**Scripts:** `scripts/organize.js`

---

## 🚀 Advanced Skills

### 🤖 Gemini Computer Use
**Path:** `gemini-computer-use/`  
**Status:** ✅ Installed  
**Purpose:** Browser automation via Gemini 2.5 Computer Use model

**Features:**
- Automate web tasks via AI
- Screenshot → function_call → action loop
- Safety confirmation for risky actions
- Full browser control via Playwright

**Tech:** Gemini 2.5 API + Playwright  
**Setup:** `cp env.example env.sh` + set GOOGLE_API_KEY  
**Use case:** Complex web automation tasks

---

### 🎬 ProtonMail Client
**Path:** `proton-client/`  
**Status:** ⚠️ Setup incomplete  
**Purpose:** Connect to ProtonMail via Bridge

**Features:**
- List emails via IMAP
- Send emails via SMTP
- Read secure emails

**Tech:** ProtonMail Bridge (local)  
**Scripts:** `scripts/client.js`  
**Issue:** Requires Bridge running locally

---

## 📊 Skills Matrix

| Skill | Status | Purpose | Used |
|-------|--------|---------|------|
| CV Updater | ✅ | Job CV optimization | [[Projects/AstraZeneca]] |
| Google Calendar | ⚠️ | Event management | [[Systems/Cron-Jobs]] |
| Email Tagger | ✅ | Email flagging | Cron job (auto-recovery) |
| LinkedIn Poster | ✅ | Social automation | Available |
| Music Control | ✅ | Player control | Available |
| WhatsApp Auto-Responder | ⚠️ | Auto-replies | Installed |
| Polymarket | ✅ | Prediction markets | Available |
| 1Password | ✅ | Vault management | Available |
| Organizer | ✅ | File organization | Available |
| Gemini Computer Use | ✅ | Browser automation | Advanced |
| ProtonMail Client | ⚠️ | Email via Bridge | Planned |

## 🎯 Known Issues

1. **Google Calendar** — Token expires, needs re-auth
2. **ProtonMail** — Requires local Bridge setup (but Email Tagger auto-starts it now)
3. **CV Updater v3** — Intelligent rewrite still in progress
4. ~~Email Tagger~~ — ✅ FIXED (auto-recovery 2026-01-31)

## 🔗 Related

- [[Systems/Cron-Jobs]] — Uses some skills
- [[Projects/AstraZeneca]] — Uses CV Updater
- [[Tools/Twitter]] — Bird CLI (not a local skill, installed separately)
- MEMORY.md — Issues & status

---

*Last updated: 2026-01-31 09:57 CST*  
*Skills directory: ~/clawd/skills/*
