---
title: "X API Skill"
aliases: ["x-api", "twitter-api", "twitter-posting"]
tags: [skill, social, api, active]
location: "/home/diego/clawd/skills/x-api"
status: "active"
---

# 🐦 X API Skill

Post to X (Twitter) using the official API with OAuth 1.0a. Bypasses rate limits and bot detection that affect cookie-based approaches.

---

## 🎯 What It Does

Enables programmatic posting to X/Twitter with full OAuth 1.0a authentication. No rate limits, no bot detection issues.

---

## 🛠️ Core Capabilities

✅ Post tweets (text + media)  
✅ Schedule posts (future)  
✅ Retweet + quote tweets  
✅ Engage with comments  
✅ Analytics tracking (future)  

---

## 🔗 Used By

| Project | Purpose |
|---------|---------|
| `viral-reply-human` | Hourly X engagement (cron job) |
| `twitter-content-monetizer` | Analyze engagement metrics |
| Manual posting | Post updates via API |

---

## 📋 Setup

**OAuth 1.0a credentials:**
- Consumer Key
- Consumer Secret
- Access Token
- Access Token Secret

**Storage:** Environment variables (from gateway config)

---

## 📚 Related

**Full SKILL.md:** `/home/diego/clawd/skills/x-api/SKILL.md`  
**Usage:** Cron job `viral-reply-human` (hourly)  
**Account:** @ChereeTech  

---

## 👤 Owner

Used by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*Post to X without rate limit constraints.*
