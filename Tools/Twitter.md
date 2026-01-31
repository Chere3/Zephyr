---
type: tool
status: active
tags: [twitter, automation, social, tool]
started: 2026-01-31
---

# 🐦 Tool: Twitter Reply Bot

> Automated intelligent replies to viral tech tweets

## Setup

**CLI:** bird (@steipete/bird v0.8.0)  
**Account:** @ChereeTech  
**Auth:** Cookie-based (API tokens stored safely)  
**Script:** ~/clawd/viral_reply_human.py

## 🤖 Bot Architecture

### Search Strategy
- Queries: 10 tech-related trending searches
- Frequency: Every hour (cron: 0 * * * *)
- Limit: 1 reply per execution (anti-spam)

### Virality Filter (NEW - 2026-01-31)
**Problem:** Was replying to nobody-knows accounts  
**Solution:** Filter by virality metrics before replying

**Thresholds (OR logic - any one qualifies):**
- ✅ Post has 50+ likes, OR
- ✅ Account has 5000+ followers, OR  
- ✅ Engagement rate ≥1% (likes / followers)

**Examples:**
- ✅ 10k followers account (automatically viral)
- ✅ 1k followers but 50+ likes (viral engagement)
- ✅ 100 followers but 1 like (1% engagement = viral)
- ❌ 500 followers, 5 likes (0.5% = not viral)

### Reply Generation
- **Method:** Human-like analysis (no templates)
- **Process:** 
  1. Read tweet content fully
  2. Understand the main claim/point
  3. Generate contextual response
  4. Sarcastic but intellectually honest

### Safety Features
- ✅ Spam detection (X error 226)
- ✅ 1-hour cooldown on spam blocks
- ✅ 15-40s random delay before posting
- ✅ Max 1 reply/hour (very conservative)

## 📊 Reply Patterns

| Pattern             | Response Style                   |
| ------------------- | -------------------------------- |
| "X is the new Y"    | Nobody saw it coming             |
| Comparisons         | Who loses when settled?          |
| Something shipped   | Someone rewrites in 10 lines     |
| Questions           | Wrong question → real one darker |
| Will be big         | Already happened                 |
| Warnings            | Too late when everyone knows     |
| Numbers/metrics     | Real metric is what's next       |
| Switching/migrating | Permanent bar shift              |
| Dead/dying tech     | Obituaries come late             |
| Jokes               | It's becoming real               |
| Better/faster       | Better at what though?           |
| Bugs/issues         | Feature request from next guy    |
| Predictions         | Miss the actual plot twist       |
| Past references     | Preview of accelerated           |
| Hidden truth        | Invisible forces                 |
| Emotional           | Wait until you see next          |

## 🎯 Topics Tracked

- AI/ML breakthroughs
- Tech disruption & displacement
- Startup funding/exits
- Open source trends
- Developer tool releases
- Performance improvements
- Security vulnerabilities
- Market shifts

## 📈 Metrics

**Replies Posted (2026-01-31):**
- Attempt 1: Failed (spam detection)
- Attempt 2: Success ("The joke's on us...")
- Total today: 1 successful

## ⚙️ Configuration

```
SEARCH_QUERIES = [
    "AI viral trending", "tech disruption", 
    "startup viral", "AI breakthrough",
    "ML model released", "tech CEO", 
    "developer tool viral", "open source trending",
    "tech 2026", "AI competition"
]

COOLDOWN = 3600s (1 hour)
REPLY_DELAY = 15-40s (random)
MAX_REPLIES_PER_RUN = 1
CRON = "0 * * * *" (every hour)
```

## 🔗 Related

- Script: ~/clawd/viral_reply_human.py
- Cron job: `viral-reply-human` (ID: 84b41d50)
- Account: @ChereeTech on X/Twitter
- Memory: [[Daily/2026-01-31#Twitter Bot]]

## 🚀 Future Improvements

- [ ] Increase reply frequency (once X allows)
- [ ] Track metrics (likes, retweets, follows gained)
- [ ] A/B test reply styles
- [ ] Add sentiment analysis
- [ ] Smart hashtag injection
- [ ] Thread replies (follow-up posts)
- [ ] GIF/image attachment support

## 📝 Notes

**Why human-style?**
- Templates feel robotic
- Real responses get more engagement
- Context-aware = higher virality
- Personality builds following

**Spam avoidance strategy:**
- 1 reply/hour = very safe rate
- Random delays prevent detection
- Diverse queries prevent pattern
- Honest content > volume

---

*Last updated: 2026-01-31*
*Active since: 2026-01-31*
