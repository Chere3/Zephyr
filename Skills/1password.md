---
title: "1Password CLI Skill"
aliases: ["1password", "password-manager", "op"]
tags: [skill, security, cli]
location: "/home/diego/clawd/skills/1password"
status: "active"
---

# 🔐 1Password CLI Skill

Set up and use 1Password CLI (op). Install, enable desktop integration, manage accounts, read/inject secrets.

---

## 🎯 What It Does

Secure credential management via 1Password CLI. Access passwords, secrets, and sensitive data programmatically.

---

## 🛠️ Features

✅ CLI authentication (op)  
✅ Multi-account support  
✅ Credential injection  
✅ Desktop app integration  
✅ Secure script execution  

---

## 📋 Usage

```bash
# Sign in
op signin

# Read secret
op read op://vault/item/field

# Inject into script
op run -- ./script.sh
```

---

## 📚 Related

**Full SKILL.md:** `/home/diego/clawd/skills/1password/SKILL.md`  
**App:** 1Password (macOS/Linux/Windows)  

---

## 👤 Owner

Used by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*Secure credential management via 1Password CLI.*
