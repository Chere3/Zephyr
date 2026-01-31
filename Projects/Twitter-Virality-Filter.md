---
type: feature
status: implemented
tags: [twitter, bot, virality, filter, automation]
date: 2026-01-31
---

# 🎯 Twitter Bot: Virality Filter

> Only respond to tweets that actually matter (2026-01-31)

## Problem

Bot was replying to tweets from accounts with:
- 200 followers, 3 likes
- Niche audiences, zero real reach
- Accounts nobody has heard of

**Result:** Replies got lost in the noise. No amplification.

## Solution: Virality Thresholds

**Smart filtering before replying. Uses OR logic (any one metric qualifies):**

### Threshold Configuration
```python
VIRALITY_THRESHOLDS = {
    'min_likes': 50,           # Post must have 50+ likes
    'min_followers': 5000,     # Account must have 5000+ followers  
    'min_engagement_rate': 0.01  # 1% engagement (likes / followers)
}
```

### How It Works

**Check each tweet for:**

1. **Absolute likes:** Post has 50+ likes?
   - ✅ Mega-viral post (even if author is small)
   - Example: 300 follower account with 100-like post

2. **Account followers:** Does author have 5000+ followers?
   - ✅ Built-in audience (automatic virality)
   - Example: 10k follower account (any post gets reach)

3. **Engagement rate:** (likes / followers) ≥ 1%?
   - ✅ Small account with crazy engagement
   - Example: 1000 followers, 15 likes (1.5% = viral for their size)

### Real Examples

| Account | Followers | Likes | Engagement | Viral? |
|---------|-----------|-------|------------|--------|
| Big tech founder | 50,000 | 200 | 0.4% | ✅ (5000+ followers) |
| Small startup | 2,000 | 100 | 5% | ✅ (50+ likes) |
| Indie dev | 1,000 | 15 | 1.5% | ✅ (1% engagement) |
| Random account | 500 | 3 | 0.6% | ❌ (all below threshold) |

## Implementation Details

### New Functions

**`is_viral_enough(tweet)`**
- Calculates engagement rate
- Checks all three thresholds
- Returns true if ANY metric passes
- Logs rejection reason if not viral

**`get_user_followers(handle)`**
- Queries account info via bird CLI
- Parses follower count
- Caches per-session

**`extract_metrics(text)`**
- Parses likes, retweets, replies from bird output
- Fallback to 0 if parsing fails
- Works with bird's --plain format

### Modified Flow

```
Search tweets
  ↓
For each tweet:
  ├─ Extract: content, handle, likes, retweets
  ├─ Get: follower count
  ├─ Check: is_viral_enough()?
  │  ├─ ✅ Pass → Add to viral_tweets[]
  │  └─ ❌ Fail → Log rejection, skip
  ↓
Filter viral_tweets[]
  ├─ Empty? → Exit (no viral tweets found)
  └─ Has tweets? → Pick first, generate reply, post
```

## Benefits

✅ **Quality over quantity**
- Replies get seen (real reach)
- Engagement curves up (actual followers see it)
- Time/effort spent wisely

✅ **Personal brand building**
- Only responding to significant voices
- Attracts similar-size/quality accounts
- Reduces noise replies

✅ **Algorithm-friendly**
- Tweet with reach → more engagement
- High engagement → algorithm amplifies
- Viral reply → more followers

## Configuration

**To adjust thresholds:**

Edit `viral_reply_human.py`:
```python
VIRALITY_THRESHOLDS = {
    'min_likes': 50,           # Adjust this
    'min_followers': 5000,     # Or this
    'min_engagement_rate': 0.01  # Or this
}
```

**Examples:**
- **Aggressive (reply to more):** min_likes=20, min_followers=2000, engagement=0.5%
- **Conservative (reply to less):** min_likes=100, min_followers=10000, engagement=2%
- **Current (balanced):** min_likes=50, min_followers=5000, engagement=1%

## Metrics to Watch

After running a few days:
- What % of tweets are filtered out?
- Which metrics matter most? (likes vs followers vs engagement)
- Are replies getting better engagement now?
- Is follower growth improving?

## Related

- [[Tools/Twitter]] — Main bot setup
- [[Systems/Cron-Jobs]] — Hourly execution
- [[Daily/2026-01-31]] — Implementation day

---

*Implemented: 2026-01-31*  
*Status: ✅ Active*  
*Next review: 2026-02-07 (after 1 week of data)*
