---
title: "Token Management - OAuth & API Keys"
aliases: ["token-management", "oauth", "credentials"]
tags: [system, security, infrastructure, active]
status: "active"
---

# 🔐 Token Management - OAuth & API Credentials

Centralized management of authentication tokens and API keys across all integrations.

---

## 🎯 Overview

Single source of truth for how credentials are stored, refreshed, and used.

---

## 📋 Tokens in Use

| Service | Type | Location | Refresh | Status |
|---------|------|----------|---------|--------|
| **Google Calendar** | OAuth 2.0 | `~/.clawd/google-calendar-token.json` | Auto (6h cron) | ✅ Active |
| **Google Drive** | OAuth 2.0 | `~/.clawd/google-drive-token.json` | Auto (6h cron) | ✅ Active |
| **Twitter/X API** | OAuth 1.0a | Environment var | Manual | ✅ Active |
| **Moltbook** | API Token | `~/.config/moltbook/credentials.json` | Manual | ⏳ Pending |
| **Alpha Vantage** | API Key | Gateway config | N/A (static) | ✅ Active |
| **NewsAPI** | API Key | Script config | N/A (static) | ✅ Active |

---

## 🔄 Token Refresh Strategy

### Google Calendar
**Expiry:** 60 minutes after issuance  
**Refresh:** Automatic via cron (every 6 hours)  
**Fallback:** Script auto-refreshes if <5 min remaining  
**Status:** Very robust

### Twitter/X API
**Type:** OAuth 1.0a (no expiry)  
**Refresh:** N/A  
**Invalidation:** Token valid until revoked  
**Status:** Stable

### Static API Keys
**Type:** Fixed keys (Alpha Vantage, NewsAPI)  
**Expiry:** Never (rotate manually if compromised)  
**Refresh:** Manual only  
**Status:** Low-risk (read-only access)

---

## 🛡️ Security Practices

### Storage
✅ Tokens in `~/.clawd/` and `~/.config/` (user-only, 600 permissions)  
✅ No hardcoded secrets in code  
✅ No tokens in Git  
✅ Environment variables for sensitive keys  

### Access Control
✅ Tokens scoped to minimum permissions needed  
✅ Different token per integration (no shared keys)  
✅ Read-only keys where possible  

### Monitoring
✅ Token expiry checked before use  
✅ Failed auth logged  
✅ Can revoke tokens from provider dashboard  

---

## 🔧 Common Patterns

### Pre-flight check (before API call)
```javascript
const token = loadToken();
if (expiryIn < 5_minutes) {
  refreshToken(); // Auto-refresh
}
const result = apiCall(token);
```

### Mid-flight retry (on auth error)
```javascript
try {
  return apiCall(token);
} catch (err) {
  if (err.isAuthError) {
    refreshToken();
    return apiCall(newToken);
  }
  throw err;
}
```

### Cron maintenance (scheduled)
```
Every 6 hours:
1. Load token
2. Check expiry
3. If expiring soon, refresh
4. Log result
```

---

## 📚 Implementation Details

### Google Calendar (Most Complex)

**Files:**
- Token: `~/.clawd/google-calendar-token.json`
- Config: `/home/diego/clawd/skills/google-calendar/scripts/refresh_token.js`

**Refresh mechanism:**
```bash
# Manual refresh
node scripts/refresh_token.js

# Auto via cron
clawdbot cron run --name google-calendar-token-refresh

# Auto in scripts
if (tokenExpiring) {
  execSync('node refresh_token.js');
}
```

**Related:** [[google-calendar]] skill

### Twitter/X API (Stable)

**Type:** OAuth 1.0a (consumer key + secret)  
**No expiry:** Token lasts until revoked  
**Location:** Environment variables (from gateway config)  

**Related:** [[x-api]] skill

### Moltbook (Pending)

**Status:** Awaiting account verification  
**File:** `~/.config/moltbook/credentials.json`  
**Setup:** Once verified, credentials provided by Moltbook  

**Related:** [[moltbook-integration]] project

---

## ⚠️ Known Issues

| Issue | Impact | Solution |
|-------|--------|----------|
| Google token expires mid-job | API call fails | Already fixed: auto-refresh built in |
| Subprocess auth context | Token not accessible from subprocess | Use direct API calls instead |
| Hardcoded expiry check | Manual maintenance | Cron job handles automatically |

---

## 🚀 Future Improvements

- [ ] Centralized token dashboard (see all tokens, expiry, last use)
- [ ] Automated token rotation (refresh all weekly)
- [ ] Audit log (who used what token when)
- [ ] Token encryption at rest (currently plaintext)
- [ ] Alerts if token unused >30 days (possible security issue)
- [ ] Integration with password manager (1Password, etc.)

---

## 🔗 Related Systems

- [[cron-jobs]] — Token refresh runs on schedule
- [[google-calendar]] — Uses OAuth token
- [[x-api]] — Uses OAuth 1.0a
- [[whatsapp-integration]] — Needs credentials
- [[gateway]] — Stores environment variables

---

## 🧠 Philosophy

Tokens are the keys to the kingdom. Rules:
1. **Never hardcode** — Always load from file/env
2. **Always rotate** — Regular refresh prevents staleness
3. **Always scope** — Minimum permissions per token
4. **Always monitor** — Log all token operations
5. **Always audit** — Know who accessed what when

---

## 👤 Owner

Managed by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*The foundation of secure authentication across all systems.*
