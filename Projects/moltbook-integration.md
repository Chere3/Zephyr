---
title: "Moltbook Integration"
aliases: ["moltbook-integration", "moltbook", "agent-social-network"]
tags: [project, social, automation, pending]
status: "pending"
created: 2026-01-31
updated: 2026-02-01
priority: "medium"
---

# 🌐 Moltbook Integration - Agent Social Network

Integration with Moltbook, an AI-native social network for agents. Enables posting, replying, browsing, and engagement tracking.

---

## 🎯 Goal

Build presence on Moltbook as an AI agent. Share insights, engage with community, track impact.

**Account:** ZephyrDiego  
**Status:** PENDING (awaiting tweet verification)

---

## 📋 Current Status

| Component | Status | Details |
|-----------|--------|---------|
| Account creation | ✅ Complete | Registered as ZephyrDiego |
| Skill integration | ✅ Complete | [[moltbook-interact]] skill installed |
| Credentials | ✅ Complete | Stored in ~/.config/moltbook/ |
| Tweet verification | ⏳ PENDING | Awaiting Diego's tweet link |
| Manual posting | ✅ Ready | Can post manually |
| Auto-posting | 📋 Planned | Once verification complete |
| Engagement tracking | 📋 Planned | Comments, upvotes, replies |

---

## 🔗 Account Info

**Profile:** https://moltbook.com/u/ZephyrDiego  
**Handle:** @ZephyrDiego  
**Bio:** (to be set once verified)  
**Status:** PENDING verification

---

## 🛠️ Technical Implementation

### Skill Location
`/home/diego/clawd/skills/moltbook-interact/`

### Credentials
**File:** `~/.config/moltbook/credentials.json`  
**Contains:** API token, account ID, refresh tokens  
**Permissions:** User-only (600)

### API Endpoints

**Read operations:**
- Get profile
- List posts (feed, my posts, thread)
- Get single post
- List comments
- Get user stats

**Write operations:**
- Create post
- Create comment
- Like/unlike
- Repost
- Follow/unfollow

### Verification Process

**Step 1:** Create Moltbook account (✅ DONE)  
**Step 2:** Provide tweet URL linking account (⏳ PENDING)  
**Step 3:** Moltbook verifies ownership  
**Step 4:** Account unlocked for posting  

**Verification tweet example:**
```
Joined the agent social network on Moltbook! 
Profile: https://moltbook.com/u/ZephyrDiego
#AI #Agents #Moltbook
```

---

## 📊 Feature Set

### Current (Available)
✅ **Profile management** — View/edit profile  
✅ **Browse feed** — See community posts  
✅ **Read posts** — View full posts + comments  
✅ **Manual posting** — Create posts manually (once verified)  

### Planned (Post-Verification)
📋 **Auto-posting** — Schedule posts from Clawdbot  
📋 **Engagement tracking** — Monitor replies, upvotes, followers  
📋 **Smart replies** — Generate contextual responses to trending posts  
📋 **Analytics** — Track post performance over time  
📋 **Community insights** — What topics are trending in AI agent space  

---

## 📝 Use Cases

### Current
1. **Manual engagement** — Read posts, post updates occasionally
2. **Network building** — Follow other AI agents, learn from community
3. **Feedback loop** — See what resonates with agent builders

### Planned (Post-verification)
1. **Auto-post daily digest** — Share Clawdbot updates/milestones
2. **Live-post progress** — Major features (e.g., "Just deployed [[calendar-reminders]]")
3. **Engage on trends** — Reply to relevant discussions
4. **Collaborate** — Find other agents/builders to learn from
5. **Showcase projects** — Highlight work on [[calendar-reminders]], [[cashew-finance]], etc.

---

## 🔄 Integration Workflow (Future)

**Daily auto-post example:**
```
Cron job (daily @ 10 AM):
1. Check yesterday's accomplishments in Daily notes
2. Format as Moltbook post
3. Extract key technologies + links
4. Post with relevant hashtags
5. Log engagement metrics
```

**Example post:**
```
🚀 Shipped: Real-time calendar reminders via WhatsApp

Just deployed [[calendar-reminders]] - Google Calendar events trigger 
WhatsApp notifications based on custom reminder times. 

Features:
✅ Auto token refresh
✅ Duplicate prevention via state tracking
✅ Formatted messages with event details

Running every 5 min via [[cron-jobs]]. Built with Node.js + Google Calendar API.

#automation #productbuilding #clawdbot
```

---

## 🔗 Related Projects

**Mentions in posts (future):**
- [[calendar-reminders]] — Latest automation
- [[cashew-finance]] — Finance tracking system
- [[cv-updater]] — Resume customization
- [[az-job-monitor]] — Job tracking
- [[clawdbot]] — Main infrastructure

**Cross-posting strategy:**
- Major features → Moltbook post
- AI/agent insights → Thread on Moltbook
- Community engagement → Reply to relevant posts

---

## 👥 Community Engagement Strategy

### Topics to engage with:
- Agent development & automation
- AI tools & infrastructure
- Productivity systems
- Career automation
- Open-source AI projects

### Tone:
- Casual, genuine, helpful
- Share learnings + failures
- No marketing fluff
- Real engineering stories

### Posting frequency (planned):
- 2-3 times per week (major updates only)
- Daily engagement in threads
- Reply to questions when relevant

---

## 🔐 Security & Privacy

**Credentials storage:**
- API token in `~/.config/moltbook/credentials.json` (600 permissions)
- No hardcoded secrets in code
- Token rotation: monthly recommended

**Data privacy:**
- Public posts are... public
- No personal/sensitive data in Moltbook posts
- Link to GitHub/portfolio projects, not private repos

---

## 📊 Success Metrics (Future)

Once verified and posting:
- **Engagement:** Comments, upvotes per post
- **Followers:** Growth over time
- **Reach:** Impressions per post
- **Community:** Interactions with other agents
- **Feedback:** Learn what resonates

---

## 🚀 Next Steps

### Immediate (BLOCKING)
1. **Get verification link** — Diego needs to send tweet URL
2. **Moltbook verifies** — 1-2 days typically
3. **Unlock posting** — Account ready

### Post-verification (This week)
1. Set up profile bio
2. Post introduction
3. Test manual posting workflow
4. Gather engagement data

### Short-term (Next 2 weeks)
1. Plan auto-posting cron job
2. Create post templates
3. Set up engagement tracking
4. First batch of auto-posts

### Medium-term (Next month)
1. Analyze post performance
2. Refine content strategy
3. Build dashboard showing metrics
4. Integrate with other projects

---

## 📋 Verification Checklist

- [ ] Diego sends tweet with Moltbook profile link
- [ ] Moltbook receives verification request
- [ ] Moltbook verifies tweet authenticity
- [ ] Account unlocked for posting
- [ ] Zephyr can post via API
- [ ] Test post sent successfully
- [ ] Engagement features enabled

---

## 📚 Documentation

**Skill file:** `/home/diego/clawd/skills/moltbook-interact/SKILL.md`  
**Credentials:** `~/.config/moltbook/credentials.json` (private)  
**Profile:** https://moltbook.com/u/ZephyrDiego  
**Daily notes:** [[2026-01-31]] (initial setup)

---

## 🔄 Version History

| Date | Change | Status |
|------|--------|--------|
| 2026-01-31 | Account creation + skill setup | v1.0 Pending |
| 2026-02-01 | Documentation + verification plan | v1.0 |

---

## 🧠 Philosophy

Moltbook is an opportunity to:
1. **Learn** from other AI agents + builders
2. **Share** real experiences + learnings (not polished marketing)
3. **Connect** with people building similar systems
4. **Contribute** to agent development community

Goal: Not to "go viral" but to engage authentically with builders.

---

## 👤 Owner

Created by: Zephyr  
For: Diego  
Last updated: 2026-02-01

---

*Awaiting verification. Ready to post once approved.*
