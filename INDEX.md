---
title: "Asistente Index - Central Hub"
aliases: ["Hub", "Central", "Home"]
tags: [index, hub, central]
---

# 🏠 Asistente Index - Central Hub

Central navigation hub for all notes, projects, skills, and systems in your Obsidian vault.

---

## 🎯 Vault Structure

```
INDEX (you are here)
├── Daily/ → Raw session logs + decisions
├── Projects/ → Active work (5 projects)
├── Skills/ → Reusable tools (16 total)
├── Systems/ → Infrastructure + automation (4 systems)
└── Archive/ → Old stuff
```

---

## 🚀 Active Projects

| Project | Status | Primary Skill | Purpose |
|---------|--------|---------------|---------|
| **[[calendar-reminders]]** | ✅ Active | [[google-calendar]] | WhatsApp event alerts every 5 min |
| **[[cashew-finance]]** | 🔄 In Progress | — | Transaction categorization (API pending) |
| **[[cv-updater]]** | ✅ Active | [[cv-updater]] | AI CV customization (v2 active, v3 WIP) |
| **[[az-job-monitor]]** | ✅ Active | [[cv-updater]] | Daily AstraZeneca job scraper |
| **[[moltbook-integration]]** | 📋 Pending | [[moltbook-interact]] | AI social network (verification pending) |

---

## 🎓 All Skills (16 Total)

### Primary Skills (What You Use Most)

| Skill | Purpose | Status |
|-------|---------|--------|
| **[[google-calendar]]** | Event management + real-time reminders | ✅ Active |
| **[[cv-updater]]** | AI CV customization from job postings | ✅ Active |
| **[[x-api]]** | Twitter/X posting via OAuth 1.0a | ✅ Active |
| **[[gemini-computer-use]]** | Browser automation via Gemini AI | ✅ Active |

### Business & Finance Skills

| Skill | Purpose | Status |
|-------|---------|--------|
| **[[freelance-gig-monitor]]** | Upwork/Fiverr opportunity discovery | ✅ Active |
| **[[affiliate-tracker]]** | Affiliate program tracking + ROI analysis | ✅ Active |
| **[[twitter-content-monetizer]]** | Content analytics + monetization potential | ✅ Active |
| **[[polymarket]]** | Prediction market odds + data queries | ✅ Active |

### Automation & Integration Skills

| Skill | Purpose | Status |
|-------|---------|--------|
| **[[email-tagger]]** | Email automation + organization (IMAP) | ✅ Active |
| **[[whatsapp-auto-responder]]** | WhatsApp message automation + routing | ✅ Active |
| **[[linkedin-poster]]** | LinkedIn automation + content scheduling | ✅ Active |
| **[[moltbook-interact]]** | Agent social network API integration | ⏳ Pending |

### Utility & System Skills

| Skill | Purpose | Status |
|-------|---------|--------|
| **[[music-control]]** | Media player + lyrics (playerctl + Genius) | ✅ Active |
| **[[1password]]** | Secure credential CLI management (op) | ✅ Active |
| **[[organizer]]** | Daily workspace file organization | ✅ Active |
| **[[proton-client]]** | ProtonMail + ProtonVPN integration | ✅ Active |

---

## ⚙️ Infrastructure Systems

The backbone of automation:

| System | Purpose | Status |
|--------|---------|--------|
| **[[cron-jobs]]** | 11+ scheduled tasks (every 5 min to daily) | ✅ Active |
| **[[token-management]]** | OAuth 2.0 + API key security layer | ✅ Active |
| **[[whatsapp-integration]]** | Primary notification channel | ✅ Active |
| **[[gateway]]** | Main Clawdbot service (TBD) | ✅ Running |

### System Connections

```
Cron Jobs (every 5 min - 24 hours)
    ↓
Token Management (ensure auth valid)
    ↓
Skills (execute: calendar, cv, monitor, etc)
    ↓
WhatsApp Integration (send notifications)
```

---

## 📚 Recent Daily Notes

Last 3 sessions:

| Date | Tags | Highlights |
|------|------|-----------|
| **[[2026-02-01]]** | calendar, automation, obsidian, skills | Calendar reminders MVP ✅, Token refresh ✅, Obsidian refactor ✅, All 16 skills documented ✅ |
| **[[2026-01-31]]** | cv, jobs, finance | CV updater v2 complete ✅, AstraZeneca monitor active ✅, Cashew extraction done ✅ |
| **[[2026-01-30]]** | setup, infrastructure | Skills configured ✅, Initial automation setup ✅ |

---

## 🧭 Quick Navigation

### By Work Type

**If you want to...**
- 📅 **Check calendar reminders** → [[calendar-reminders]]
- 💰 **Track finances** → [[cashew-finance]]
- 📄 **Generate custom CV** → [[cv-updater]]
- 🔍 **Monitor AstraZeneca jobs** → [[az-job-monitor]]
- 🌐 **Check Moltbook** → [[moltbook-integration]]

### By Skill Category

**Primary (High Use):**
- 📅 [[google-calendar]] — Event management
- 📝 [[cv-updater]] — Resume customization
- 🐦 [[x-api]] — Twitter posting
- 🤖 [[gemini-computer-use]] — Browser automation

**Business:**
- 💼 [[freelance-gig-monitor]] — Find gigs
- 💰 [[affiliate-tracker]] — Track earnings
- 📊 [[twitter-content-monetizer]] — Analyze content
- 📈 [[polymarket]] — Prediction markets

**Automation:**
- 📧 [[email-tagger]] — Email organization
- 💬 [[whatsapp-auto-responder]] — Message automation
- 💼 [[linkedin-poster]] — Social media
- 🌐 [[moltbook-interact]] — Agent social network

**Utilities:**
- 🎵 [[music-control]] — Media control
- 🔐 [[1password]] — Password management
- 📁 [[organizer]] — File organization
- 🔒 [[proton-client]] — Encrypted services

### By Infrastructure

**If you want to...**
- ⏰ **Check scheduled jobs** → [[cron-jobs]]
- 🔐 **Manage credentials** → [[token-management]]
- 💬 **Check WhatsApp** → [[whatsapp-integration]]
- 🏗️ **System architecture** → [[gateway]]

---

## 📊 Graph View

Open Obsidian's **Graph View** to visualize:

```
INDEX (center)
    ├── Daily (2026-02-01, 2026-01-31, etc)
    │   └── [leaf nodes - link to projects]
    ├── Projects (5 nodes)
    │   └── [link to skills + systems]
    ├── Skills (16 nodes)
    │   └── [reference by projects + daily]
    └── Systems (4 nodes)
        └── [interconnected, used by projects]
```

**Tips:**
- Zoom out to see full graph
- Click nodes to navigate
- Filter by tag (tag:project, tag:system, tag:active)
- No isolated nodes (all should connect)

---

## 🔍 Obsidian Structure Guide

**Full documentation:** `/home/diego/clawd/OBSIDIAN-STRUCTURE.md`

**Key principles:**
✅ YAML frontmatter on every file (title, date, tags, status)  
✅ Wikilinks `[[reference]]` for navigation  
✅ Tags by domain + status (calendar, automation, active, pending)  
✅ Daily notes as leaves (link to projects, not hubs)  
✅ Projects as connectors (link to skills + systems)  
✅ Skills + Systems as masters (referenced by projects)  

---

## 📋 Folder Structure

```
~/OneDrive/Documentos/Asistente/asistente-thoughts/
├── INDEX.md                      # 👈 You are here
├── OBSIDIAN-STRUCTURE.md         # Complete vault guide
├── Daily/
│   ├── 2026-02-01.md            # Today's session
│   ├── 2026-01-31.md            # Yesterday
│   └── ...
├── Projects/                     # Active work (5 files)
│   ├── calendar-reminders.md
│   ├── cashew-finance.md
│   ├── cv-updater.md
│   ├── az-job-monitor.md
│   └── moltbook-integration.md
├── Skills/                       # Tools (16 files)
│   ├── google-calendar.md
│   ├── cv-updater.md
│   ├── x-api.md
│   ├── gemini-computer-use.md
│   ├── freelance-gig-monitor.md
│   ├── affiliate-tracker.md
│   ├── twitter-content-monetizer.md
│   ├── polymarket.md
│   ├── email-tagger.md
│   ├── whatsapp-auto-responder.md
│   ├── linkedin-poster.md
│   ├── moltbook-interact.md
│   ├── music-control.md
│   ├── 1password.md
│   ├── organizer.md
│   └── proton-client.md
├── Systems/                      # Infrastructure (4 files)
│   ├── cron-jobs.md
│   ├── token-management.md
│   ├── whatsapp-integration.md
│   └── gateway.md               # (todo)
└── Archive/                      # Old stuff
    └── 2025-Q4/
```

---

## 🔗 Obsidian Integration

**Open vault:**
- Path: `~/OneDrive/Documentos/Asistente/asistente-thoughts/`
- Obsidian will detect `.md` files automatically

**Graph View:**
1. Click graph icon (top right)
2. Use to navigate visually
3. Filter by tag for focus areas

**Local Graph:**
- Right-click any note
- Select "Open local graph"
- See immediate connections

---

## 🎯 Daily Workflow

### Morning (When you start)
1. Open `Daily/2026-02-XX.md`
2. Use [[OBSIDIAN-STRUCTURE.md]] template
3. Add tags (domain + status)

### During Session
4. Work on projects/tasks
5. Link to relevant projects with `[[project-name]]`
6. Document decisions/learnings

### Evening (Wrap up)
7. Update project status if needed
8. Update INDEX.md if new projects
9. Review graph view for connectivity

---

## 📊 Statistics

| Metric | Count |
|--------|-------|
| Active Projects | 5 |
| Total Skills | 16 |
| Systems | 4 |
| Cron Jobs | 11+ |
| Daily Notes | 3+ |
| Total Files | 30+ |

---

## 🧠 Philosophy

**Obsidian as brain:**
- Daily notes = raw input (experiences, decisions)
- Projects = active work (what you're building)
- Skills = tools (how you build)
- Systems = infrastructure (where you build)
- Graph = connections (how everything relates)

**Goal:** Navigate your work without friction. Click → understand → act.

---

## 🚀 Next Steps

1. ✅ Review this INDEX
2. ✅ Explore [[cron-jobs]] (understand automation)
3. ✅ Check [[calendar-reminders]] (see active project)
4. ✅ Browse [[2026-02-01]] (today's work)
5. ✅ Review all 16 [[Skills]] documented
6. 📋 Create your own daily notes using template
7. 📋 Add wikilinks to projects/skills/systems

---

## 🔐 Vault Health

**Current state:** Well-structured + fully documented (as of 2026-02-01)
- ✅ All 5 projects documented
- ✅ All 16 skills documented
- ✅ All 4 systems consolidated
- ✅ Folder structure clear
- ✅ Wikilinks connected
- ✅ No isolated nodes
- ✅ Proper hierarchy implemented
- 📋 System master note (gateway) pending

---

## 📝 Notes

- **Metadata first** — Frontmatter on every file
- **Wikilinks everywhere** — Not just Google Drive
- **Tags for filtering** — Use graph view filter
- **Update daily** — Keeps vault fresh
- **Review weekly** — Graph view shows gaps

---

## 👤 Managed by

Created by: Zephyr  
For: Diego  
Last updated: 2026-02-01 (all 16 skills documented)

---

**This is your brain. Keep it organized.**  
*Last sync: 2026-02-01 12:30 CST*
