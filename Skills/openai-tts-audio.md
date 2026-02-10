---
title: "OpenAI TTS Audio Skill"
aliases: ["openai-tts-audio", "tts-audio", "voice-notes", "openai-live-tts"]
tags: [skill, tts, audio, whatsapp, active]
location: "/home/diego/clawd/skills/openai-tts-audio"
status: "active"
created: 2026-02-09
updated: 2026-02-09
---

# 🔊 TTS Audio Skill (OpenAI Voices-first)

Skill para generar audios y enviarlos por chat usando voces de OpenAI como motor principal.

---

## 🎯 Objetivo

- Responder con audio en WhatsApp/otros canales.
- Priorizar voces de OpenAI (multilenguaje).
- Flujo rápido: texto → mp3 → envío.

---

## 🧩 Herramientas y documentación

## 1) OpenAI Voice API (primario)

Script local:
- `/home/diego/clawd/skills/openai-tts-audio/scripts/openai_live_tts.py`

**Variables de entorno:**
- `OPENAI_API_KEY` (requerida)
- `OPENAI_TTS_VOICE` (opcional, ejemplo: `nova`, `shimmer`, `alloy`)

**Voces preferidas por defecto:**
1. `nova`
2. `shimmer`
3. `alloy`

### Uso
```bash
python /home/diego/clawd/skills/openai-tts-audio/scripts/openai_live_tts.py \
  --text "Hola, aquí va tu audio" \
  --lang es
```

**Salida:**
- ruta del mp3
- línea `MEDIA:/.../voice.mp3`

---

## 2) OpenClaw `message` (entrega)

Para mandar el mp3 al chat:
- `action: send`
- `channel: whatsapp`
- `target: <chat-id>`
- `filePath: <ruta_mp3>`

---

## 3) Fallback `tts` interno

Si OpenAI no está disponible o falla:
- usar tool `tts`
- enviar audio con `message`.

---

## ⚙️ Flujo operativo recomendado

1. Redactar texto corto (1–4 frases).
2. Generar audio con `openai_live_tts.py`.
3. Enviar con `message` + `filePath`.
4. Si falla, fallback a `tts`.

---

## 🔐 Reglas de seguridad

- No suplantar identidad/voz de personas reales.
- No divulgar datos privados en audio.
- Rechazar imitaciones de figuras públicas/personas específicas.

---

## 📁 Referencias

- Skill: `/home/diego/clawd/skills/openai-tts-audio/SKILL.md`
- Script: `/home/diego/clawd/skills/openai-tts-audio/scripts/openai_live_tts.py`
- Related: [[whatsapp-auto-responder]]
