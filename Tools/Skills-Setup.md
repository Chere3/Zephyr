---
type: reference
tags: [skills, setup, troubleshooting, automation]
---

# 🛠️ Skills Setup & Troubleshooting

> Setup guides and troubleshooting for each skill

---

## 🟢 Active Skills (No setup needed)

### CV Updater
```bash
cd ~/clawd/skills/cv-updater
python3 scripts/generate_custom_cv.py [job_posting_text]
```

### Music Control
```bash
bash ~/clawd/skills/music-control/scripts/current.sh
bash ~/clawd/skills/music-control/scripts/play.sh
bash ~/clawd/skills/music-control/scripts/lyrics.sh
```

### Polymarket
```bash
python3 ~/clawd/skills/polymarket/scripts/polymarket.py trending
python3 ~/clawd/skills/polymarket/scripts/polymarket.py search "bitcoin"
```

### 1Password
```bash
node ~/clawd/skills/1password/scripts/op.js --action list --vault "Private"
node ~/clawd/skills/1password/scripts/op.js --action get --item "Netflix"
```

### Organizer
```bash
node ~/clawd/skills/organizer/scripts/organize.js --target "~/Downloads"
```

---

## 🟡 Needs Setup

### Google Calendar
**Issue:** Token auth expiring  
**Fix:**
```bash
node ~/clawd/skills/google-calendar/scripts/auth.js
```
Opens browser for OAuth → saves token locally

**File:** `~/.clawd/google-calendar-token.json`

---

### LinkedIn Poster
**Issue:** First-time auth required  
**Setup:**
```bash
node ~/clawd/skills/linkedin-poster/scripts/auth.js
```
Scans browser for LinkedIn login → saves session

**Use:**
```bash
node ~/clawd/skills/linkedin-poster/scripts/post.js \
  --text "Your post here" \
  --image "./image.jpg"
```

---

### Email Tagger (Auto-Recovery Enabled)
**Previous issue:** IMAP port 1143 not responding  
**Current fix:** Auto-detects and starts Proton Bridge if needed ✅

**Use:**
```bash
node ~/clawd/skills/email-tagger/tagger.js --limit 20
```
*(Will auto-start Proton Bridge if it's down)*

**How it works:**
1. Tries to connect on port 1143
2. If connection refused → Auto-starts Proton Bridge
3. Retries connection once
4. Completes or reports clear error

**Manual fallback:**
```bash
# If auto-start fails, start Bridge manually
proton-bridge  # or /usr/bin/proton-bridge

# Then run tagger
node ~/clawd/skills/email-tagger/tagger.js --limit 20
```

**Check if running:**
```bash
lsof -i :1143  # Should show proton-bridge
```

**Details:** See [[2026-01-31-Cron-Fix]]

---

### WhatsApp Auto-Responder
**Setup:**
```bash
node ~/clawd/skills/whatsapp-auto-responder/scripts/responder.js --setup
```
Shows QR code → scan with phone → device linked

**Run:**
```bash
node ~/clawd/skills/whatsapp-auto-responder/scripts/responder.js --run
```

---

### ProtonMail Client
**Prerequisite:** ProtonMail Bridge running locally  
```bash
# Check Bridge status
lsof -i :1143
lsof -i :1587
```

**Setup:** Edit credentials in `scripts/client.js`

**Use:**
```bash
node ~/clawd/skills/proton-client/scripts/client.js --action list --limit 5
node ~/clawd/skills/proton-client/scripts/client.js --action send \
  --to "email@example.com" \
  --subject "Hello" \
  --body "Message"
```

---

### Gemini Computer Use
**Prerequisite:** Google API Key  
```bash
cd ~/clawd/skills/gemini-computer-use
cp env.example env.sh
# Edit env.sh with GOOGLE_API_KEY
source env.sh
```

**Install dependencies:**
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

**Run agent:**
```bash
python3 agent.py --task "Click on Gmail login button"
```

---

## 🔧 Common Troubleshooting

### Port Issues
```bash
# Check if port listening
lsof -i :1143
netstat -tulpn | grep 1143

# Kill process on port
lsof -ti:1143 | xargs kill -9
```

### Token Expiration (Google Calendar, LinkedIn)
```bash
# Remove old token
rm ~/.clawd/google-calendar-token.json

# Re-auth
node ~/clawd/skills/google-calendar/scripts/auth.js
```

### Missing Dependencies
```bash
# CV Updater needs pdflatex
sudo pacman -S texlive  # Arch
apt install texlive     # Ubuntu
```

### Bird CLI (not a skill, but used)
```bash
# Already installed globally via bun
bird whoami
bird search "query" -n 5
```

---

## 📋 Skills by Use Case

**Social Media:**
- LinkedIn Poster — Post content
- Twitter (bird CLI) — Reply, search, engage
- WhatsApp Auto-Responder — Auto-reply

**Productivity:**
- Google Calendar — Event management
- Email Tagger — Flag important emails
- Organizer — File organization

**Information:**
- Polymarket — Prediction markets
- Music Control — Song info & lyrics
- 1Password — Vault access

**Automation:**
- CV Updater — Job applications
- Gemini Computer Use — Browser automation
- ProtonMail Client — Encrypted email

---

## 🚀 Auto-Skills in Cron Jobs

**Active integrations:**
1. [[Systems/Cron-Jobs#Daily News Digest]] — Uses news APIs + stocks
2. [[Systems/Cron-Jobs#AstraZeneca Job Monitor]] — Uses scraper
3. [[Systems/Cron-Jobs#Viral Twitter Reply Bot]] — Uses bird CLI

**Can be integrated:**
- Google Calendar → Daily briefing
- Email Tagger → Morning email summary
- LinkedIn Poster → Auto-share content
- Polymarket → Track predictions

---

*Last updated: 2026-01-31 09:57 CST*  
*See: [[Tools/Skills-Inventory]] for complete list*
[[Twitter]]