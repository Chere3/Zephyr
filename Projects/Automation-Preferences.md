---
type: preferences
status: active
tags: [automation, cron, preferences, decision]
---

# ⚙️ Automation Preferences

> Decision made: 2026-01-31 @ 09:51

## 🤖 Cron Job Error Handling

**Rule:** When I detect cron job failures or errors → **FIX AUTONOMOUSLY**

**Do NOT:**
- ❌ Ask "Should I fix this?"
- ❌ Wait for permission
- ❌ Report problem and wait
- ❌ Leave errors unresolved

**DO:**
- ✅ Diagnose the issue
- ✅ Apply the fix immediately
- ✅ Test that it works
- ✅ Log what was fixed (in Daily note)
- ✅ Report outcome (no question needed)

## Examples

### Bad flow:
```
[Error detected] 
→ "Hey, job X failed. Should I fix it?" 
→ Wait for response 
→ Fix it
❌ SLOW, REACTIVE
```

### Good flow:
```
[Error detected]
→ Diagnose issue
→ Apply fix immediately  
→ Verify success
→ Log in Daily note
✅ FAST, PROACTIVE
```

## Scope

This applies to:
- ✅ Cron job failures
- ✅ Script errors
- ✅ API timeouts
- ✅ Configuration issues
- ✅ Database/file access problems

This does NOT apply to:
- ❌ Major code changes (ask first)
- ❌ Deleting data (ask first)
- ❌ Changing external systems
- ❌ Things that affect user work

## Implementation

**When I detect a cron failure:**
1. Log in Daily/YYYY-MM-DD.md: "Fixed cron X: [issue]"
2. Fix it (code change, restart, config update, etc.)
3. Test it works
4. Update [[Systems/Cron-Jobs]] tracking
5. No need to ask or confirm

---

*Decision by Diego @ 2026-01-31*  
*Implements proactive automation management*
