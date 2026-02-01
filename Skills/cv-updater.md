---
title: "CV Updater Skill"
aliases: ["cv-updater", "resume"]
tags: [skill, cv, automation, active]
location: "/home/diego/clawd/skills/cv-updater"
status: "active"
---

# 📄 CV Updater Skill

AI-powered CV customization based on job postings. Master skill used by [[cv-updater]] project and [[az-job-monitor]].

---

## 🎯 What It Does

Takes job posting + existing CV → generates customized resume tailored to role (v2) or with intelligent reordering (v3 in progress).

---

## 🛠️ Core Scripts

| Script | Purpose | Status |
|--------|---------|--------|
| `generate_custom_cv.py` | v2: Keyword extraction + profile rewrite | ✅ Active |
| `update_cv_intelligent.py` | v3: Full AI analysis + bullet rewriting | 🔄 In Progress |
| `job_monitor.py` | Daily AstraZeneca job scraper | ✅ Active |
| `keyword_extractor.py` | Extract tech keywords from job posting | ✅ Active |

---

## 📊 Capabilities

**v2 (Current):**
✅ Keyword extraction from job posting  
✅ Seniority detection (Junior/Mid/Senior)  
✅ Profile paragraph rewriting  
✅ Skills section customization  
✅ Bullet point enhancement with metrics  
✅ LaTeX compilation to PDF  
✅ <30 second per CV  

**v3 (Planned):**
📋 Full experience section reordering  
📋 Advanced bullet rewriting  
📋 Multi-page support  

---

## 🔗 Used By

| Project | Purpose |
|---------|---------|
| [[cv-updater]] | Main CV generation project |
| [[az-job-monitor]] | Detects jobs → triggers CV generation (future) |

---

## 📁 File Structure

```
/home/diego/clawd/skills/cv-updater/
├── SKILL.md
├── scripts/
│   ├── generate_custom_cv.py        # v2 (working)
│   ├── update_cv_intelligent.py     # v3 (WIP)
│   ├── job_monitor.py               # AstraZeneca scraper
│   └── keyword_extractor.py         # Helper
├── references/
│   ├── keywords.json                # Skill keywords database
│   └── tone-templates.json          # Seniority tone examples
└── ...
```

---

## 🧠 How It Works

**Input:** Job posting URL or text  

**Process (v2):**
1. Extract keywords (NLP analysis)
2. Detect seniority level
3. Rewrite profile for role + seniority
4. Reorder skills by relevance
5. Enhance bullets with metrics
6. Generate LaTeX
7. Compile to PDF

**Output:** `~/onedrive/documentos/cvs/Diego_Romero_[role].pdf`

---

## 🎨 Customization Features

### Seniority Detection

| Level | Keywords | CV Tone |
|-------|----------|---------|
| Junior | "entry-level", "fresh", "graduate" | Learning-focused |
| Mid | "3-5 years", "experienced" | Results-driven |
| Senior | "10+ years", "lead", "architect" | Strategic |

### Profile Rewriting

Transforms generic profile to role-specific focus:
```
Generic: "Passionate developer with full-stack experience..."
Hyperautomation: "Automation specialist with RPA expertise, reducing manual work by 80%+..."
```

### Bullet Enhancement

Original → Enhanced:
```
"Worked on backend systems"
↓
"Designed microservices reducing API response time by 40%"
```

---

## 🚀 Usage Examples

### Generate CV for job posting
```bash
python generate_custom_cv.py \
  --job-url "https://careers.astrazeneca.com/job/..." \
  --role "Hyperautomation Engineer"
```

### Generate with job text
```bash
python generate_custom_cv.py \
  --job-text "Requirements: Python, RPA, process mining..." \
  --role "Automation Engineer"
```

### Monitor and auto-generate (future)
```bash
python job_monitor.py  # Detects new jobs
→ Triggers cv-updater automatically
→ Generates + saves PDF
→ Notifies Diego
```

---

## 📊 CVs Generated

| Role | Date | Key Skills |
|------|------|-----------|
| Hyperautomation Engineer | 2026-01-31 | RPA, Python, Process Optimization |
| S/4HANA Data Transformation AD | 2026-01-31 | SAP, Data Quality, ETL, Leadership |
| FullStack Platform Engineer | 2026-01-31 | Java, Python, Docker, Kubernetes |

---

## 🔗 Integration Points

**AstraZeneca Job Monitor:**
- Detects new job posting
- (Future) Automatically generates CV
- Saves to ~/onedrive/documentos/cvs/

**LaTeX System:**
- Uses `/home/diego/clawd/cv_base.tex`
- Compiles via pdflatex
- Stores packages in ~/.texmf/

---

## ⚙️ Configuration

**Keywords database:** `references/keywords.json`  
**Tone templates:** `references/tone-templates.json`  
**CV base:** `/home/diego/clawd/cv_base.tex`  
**Output:** `~/onedrive/documentos/cvs/`  

---

## 🧪 Testing

**Test with real job postings:**
```bash
# Test Hyperautomation Engineer posting
curl -s "https://careers.astrazeneca.com/job/..." | \
python generate_custom_cv.py --stdin
```

**Validate PDF output:**
```bash
ls -lah ~/onedrive/documentos/cvs/Diego_Romero_*.pdf
```

---

## 🎯 Best Practices

✅ Always use actual job posting (not summary)  
✅ Let keyword extraction run (don't override)  
✅ Review PDF for formatting before sending  
✅ Keep base CV updated with latest experience  
✅ Test tone + seniority detection  

---

## 🚨 Troubleshooting

| Issue | Solution |
|-------|----------|
| LaTeX compile fails | Check packages in ~/.texmf/ |
| PDF corrupt | Validate LaTeX output, try recompile |
| Keywords not matching | Add new pattern to keywords.json |
| Seniority detection wrong | Review tone-templates, adjust thresholds |

---

## 🎯 Future Enhancements

- [ ] v3 completion (full AI analysis)
- [ ] Multi-language support (Spanish CVs)
- [ ] Cover letter generation
- [ ] LinkedIn profile customization
- [ ] Interview prep from job posting
- [ ] A/B testing (track which CV versions get interviews)

---

## 📚 Related

**Full project docs:** [[cv-updater]] project  
**Job monitoring:** [[az-job-monitor]] project  
**Daily notes:** [[2026-01-31]] (initial v2 completion)  

---

## 👤 Owner

Managed by: Zephyr  
For: Diego  
Last updated: 2026-01-31

---

*Transforms job postings into customized resumes in 30 seconds.*
