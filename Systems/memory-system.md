---
title: "Memory System"
date: 2026-02-06
tags: [systems, memory, obsidian, embeddings]
---

## 🎯 Goal
Use the **Obsidian vault** as the single source of truth for memory (daily ops + long-term context), instead of `/home/diego/clawd/memory/*.md`.

## ✅ Current Reality (important)
There are **two** ways memory is searched:

1) **OpenClaw tool** `memory_search` / `memory_get`
- Searches **only**: `MEMORY.md` + `/home/diego/clawd/memory/*.md`
- It **does not** search the Obsidian vault.

2) **Vault semantic search (preferred)**
- Vault: `~/OneDrive/Documentos/Asistente/asistente-thoughts/`
- Embeddings index: `~/.clawd/embedding-index.json`
- Updated by cron: `embeddings-indexer-daily` (06:00)
- Query via:
  - `cd ~/clawd && source .env && node embeddings-search.js "<query>"`

## ✅ New Policy
- All new operational + memory notes go into the vault (`Daily/`, `Projects/`, `Systems/`, `People/`, etc.)
- **Language:** write vault notes in **English** (user preference). Use Spanish only for quoted messages or exact reminder text.
- `/home/diego/clawd/memory/*.md` is **legacy** (do not add new entries there)
- When asked “remember X”, do:
  1) run `memory_search` (tool requirement; may return empty)
  2) run `embeddings-search.js` against the vault and answer from that

## 📦 Migration
Legacy files copied to:
- `Archive/legacy-clawd-memory/`

(Kept as reference; safe, non-destructive.)
