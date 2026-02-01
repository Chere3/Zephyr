---
title: "CV Updater"
aliases: ["cv-updater", "cv-customizer", "resume-automation"]
tags: [project, career, automation, active]
status: "active"
created: 2026-01-31
updated: 2026-01-31
priority: "high"
---

# 📄 CV Updater - Intelligent Resume Customization

Automated system to customize CVs based on job postings, extract keywords, enhance bullet points, and generate optimized PDFs.

---

## 🎯 Goal

Transform job posting → Analyze → Customize CV (profile, skills, bullets) → Generate PDF tailored to role.

**Vision:** Spend 5 minutes reading posting, 30 seconds generating custom CV.

---

## 📋 Current Status

| Component | Status | Details |
|-----------|--------|---------|
| Keyword extraction | ✅ Complete | NLP-based from job postings |
| Seniority detection | ✅ Complete | Auto-detect role level (Junior/Mid/Senior) |
| Profile rewriting | ✅ Complete | Tailored to role + seniority |
| Skills customization | ✅ Complete | Reorder by relevance |
| Bullet enhancement | ✅ Complete | Action verbs + metrics |
| PDF generation | ✅ Complete | LaTeX → PDF compilation |
| CVs generated | ✅ 3+ | Hyperautomation, S/4HANA, FullStack |
| Cron automation | 📋 Planned | Monitor jobs → auto-generate CVs |

---

## 🛠️ Implementation Versions

### v1: Basic Keyword Highlighting
- **Status:** ⚠️ Deprecated
- **Approach:** Highlight matching keywords in existing CV
- **Problem:** Didn't actually customize content
- **File:** `update_cv.py` (kept for reference)

### v2: Content Customization (CURRENT)
- **Status:** ✅ Active
- **Approach:** Rewrite profile, reorder skills, enhance bullets
- **Features:** Job posting → keyword extraction → AI-powered customization
- **Files:**
  - `generate_custom_cv.py` — Main script
  - `cv_base.tex` — LaTeX template
  - Output: `~/onedrive/documentos/cvs/Diego_Romero_[role].pdf`

**Key improvements:**
- ✅ Rewrites profile to match role + seniority
- ✅ Reorders skills by job relevance
- ✅ Enhances bullets with metrics (e.g., "Developed → Engineered & Optimized [tech] reducing X by Y%")
- ✅ Tone alignment (junior, mid-level, senior language)

### v3: Full AI Intelligence (IN PROGRESS)
- **Status:** 🔄 Development
- **Approach:** Deep analysis + bullet rewriting + experience reordering
- **Target:** `update_cv_intelligent.py`
- **Planned features:**
  - Full experience section rewrite (reorder by relevance)
  - Bullet point rewriting (better action verbs + quantified results)
  - Advanced seniority detection
  - Recommendation for which projects/roles to highlight

---

## 📊 Seniority Detection

**Auto-detects from job posting:**

| Level | Keywords | CV Tone | Skills Emphasis |
|-------|----------|---------|-----------------|
| **Junior** | "entry-level", "fresh", "graduate" | Learning-focused, enthusiastic | Breadth of knowledge |
| **Mid-level** | "3-5 years", "experience required" | Results-driven, practical | Specialized skills |
| **Senior** | "10+ years", "lead", "architect" | Strategic, leadership | Impact + mentoring |

**Example:**
- Job: "Hyperautomation Engineer" (mid-level) → Profile emphasizes automation expertise + business impact
- Job: "Associate Director" (senior) → Profile emphasizes strategic thinking + team leadership

---

## 🎨 Profile Customization

**Original (generic):**
```
Passionate developer with full-stack experience...
```

**Hyperautomation Engineer version:**
```
Automation-focused engineer specializing in RPA and process optimization.
Designed workflows reducing manual work by 80%+. Proficient in UiPath, Python, and integration patterns.
```

**S/4HANA Data Transformation version:**
```
Data transformation specialist with expertise in SAP environments.
Led data quality initiatives improving accuracy from 85% to 98%.
Strong background in ETL, data governance, and analytics.
```

---

## 🔧 Technical Details

### Core Scripts

**`generate_custom_cv.py`** (v2 - Current)
- **Input:** Job posting URL or text
- **Process:**
  1. Extract keywords (NLP)
  2. Detect seniority level
  3. Rewrite profile paragraph
  4. Customize skills section
  5. Enhance bullets with metrics
  6. Generate LaTeX
  7. Compile to PDF
- **Output:** `/onedrive/documentos/cvs/Diego_Romero_[role].pdf`
- **Time:** <30 seconds per CV

**`update_cv_intelligent.py`** (v3 - In Progress)
- All of v2, plus:
- Reorders entire experience section by job relevance
- Rewrites bullet points for better impact
- Suggests which achievements to highlight

### Files & Paths

```
/home/diego/clawd/
├── cv_base.tex                          # LaTeX template
├── skills/cv-updater/
│   ├── SKILL.md                         # Documentation
│   ├── scripts/
│   │   ├── generate_custom_cv.py        # v2 (working)
│   │   ├── update_cv_intelligent.py     # v3 (WIP)
│   │   ├── job_monitor.py               # [[az-job-monitor]]
│   │   └── keyword_extractor.py         # Helper utilities
│   └── references/
│       ├── keywords.json                # Skill keywords
│       └── tone-templates.json          # Seniority tone examples
└── transacciones/
    └── cvs/
        ├── Diego_Romero_Hyperautomation_Engineer.pdf
        ├── Diego_Romero_Associate_Director.pdf
        └── Diego_Romero_FullStack_Platform_Engineer.pdf
```

### LaTeX Compilation

**System:** Uses local packages from `~/.texmf/tex/latex/` (CTAN downloads)  
**Why custom?:** System texlive was incomplete; CTAN downloads more reliable  
**Packages:** TeX Gyre Termes, fontspec, hyperref, etc.

---

## 📈 CV Versions Generated

| Role | Date | Skills Emphasized | Profile Focus |
|------|------|-------------------|----------------|
| Hyperautomation Engineer | 2026-01-31 | RPA, Python, Automation | Process automation expertise |
| S/4HANA Data Transformation Associate Director | 2026-01-31 | SAP, Data Quality, ETL | Data governance + team leadership |
| FullStack Platform Engineer | 2026-01-31 | Java, Python, Docker, Kubernetes | Infrastructure + scaling |

---

## 🔗 Integration with [[az-job-monitor]]

**Workflow:**
1. `job_monitor.py` scrapes AstraZeneca Jalisco jobs daily (8 AM cron)
2. Detects NEW job postings
3. (Future) Triggers `generate_custom_cv.py` automatically
4. Generates + saves PDF to ~/onedrive/documentos/cvs/

**Status:** Currently manual — run script when interested in role  
**Planned:** Full automation (detect job → generate CV → notify Diego)

---

## 🔑 Key Features

### Keyword Extraction
- Parses job description for: technologies, soft skills, domain knowledge
- Weights keywords by frequency + importance
- Matches against Diego's experience + skills

### Tone Customization
```python
tones = {
    "junior": {
        "profile_start": "Enthusiastic developer...",
        "action_verbs": ["Learned", "Contributed", "Assisted"]
    },
    "mid": {
        "profile_start": "Results-driven engineer...",
        "action_verbs": ["Developed", "Designed", "Implemented"]
    },
    "senior": {
        "profile_start": "Strategic leader...",
        "action_verbs": ["Architected", "Spearheaded", "Led transformation"]
    }
}
```

### Bullet Point Enhancement

**Original:**
```
Worked on backend systems
```

**Enhanced (mid-level):**
```
Designed microservices reducing API response time by 40%
```

**Enhanced (senior):**
```
Architected distributed system supporting 10M+ daily transactions
Led team of 5 engineers; mentored 2 junior developers
```

---

## 📊 Best Practices Implemented

✅ **Action verbs aligned to seniority**
✅ **Metric-driven bullets** (Verb + Skill + Result + Metric)
✅ **Reordered by relevance** (most matching skills first)
✅ **One-page PDF** (professional format)
✅ **Consistent naming** (Diego_Romero_[role].pdf)
✅ **LaTeX source + PDF** (both saved for version control)

---

## 🚀 Future Enhancements

### v3 (In Progress)
- [ ] Full experience section rewrite (reorder by relevance)
- [ ] Advanced bullet point rewriting
- [ ] Multi-page CV support (for very detailed achievements)

### v4 (Planned)
- [ ] Cover letter generation (tailored to job posting)
- [ ] LinkedIn profile customization
- [ ] Skills matrix visualization
- [ ] Interview prep notes (based on job description)

### Integration (Planned)
- [ ] Auto-detect + auto-generate on new AstraZeneca job
- [ ] Dashboard showing which CVs generated, upload status
- [ ] Track which CVs resulted in interviews/offers
- [ ] A/B test different CV versions

---

## 📋 Troubleshooting

| Issue | Solution |
|-------|----------|
| PDF won't compile | Check LaTeX packages in `~/.texmf/` are installed |
| Keywords not matching | Add new patterns to `keywords.json` |
| Profile tone wrong | Adjust `tone-templates.json` for seniority |
| Text formatting broken | Check `cv_base.tex` has proper escape characters |

---

## 🔄 Workflow Example

**Step 1: Find job posting**
```
Read: "Hyperautomation Engineer" at AstraZeneca
Key requirements: RPA, Python, Process mining, UI automation
```

**Step 2: Run script**
```bash
python generate_custom_cv.py \
  --job-url "https://careers.astrazeneca.com/..." \
  --role "Hyperautomation Engineer"
```

**Step 3: AI does its thing**
- Extracts keywords: RPA, Python, Automation, Process Optimization
- Detects seniority: Mid-level (3-5 years required)
- Rewrites profile for automation focus
- Reorders skills: RPA first, then Python, then others
- Enhances bullets with metrics
- Generates LaTeX + compiles PDF

**Step 4: Output**
```
✅ Generated: ~/onedrive/documentos/cvs/Diego_Romero_Hyperautomation_Engineer.pdf
⏱️ Time: 22 seconds
📊 Keywords matched: 8/12 (67%)
```

---

## 📚 Documentation

**Skill file:** `/home/diego/clawd/skills/cv-updater/SKILL.md`  
**Daily notes:** [[2026-01-31]] (refactor completion)  
**Job monitor integration:** [[az-job-monitor]]

---

## 🔄 Version History

| Date | Change | Version |
|------|--------|---------|
| 2026-01-31 | Refactored v1 → v2 (content customization) | v2.0 |
| 2026-01-31 | Enhanced with seniority detection | v2.1 |
| 2026-02-01 | Documented v3 roadmap | v2.1+ |

---

## 👤 Owner

Created by: Zephyr  
For: Diego  
Last updated: 2026-01-31

---

*Active project. Regularly updated with new CV versions and refinements.*
