---
name: crew-yt
description: Retrieve, clean, summarize, or analyze a transcript or captions from a YouTube video. Use when the user provides a YouTube URL or asks what a YouTube video says, requests captions, subtitles, timestamps, or a downloadable transcript.
---

# Crew YT

## Confirm the target and requested output

Identify the video URL and whether the user wants raw text, timestamped
captions, a summary, quoted passages, or an analysis. Keep the transcript and
any summary clearly separate.

## Retrieve captions responsibly

Use an available supported transcript or web-research route first. If the video
has no accessible captions, say so plainly. Do not bypass access controls,
download audio, or create a speech-to-text transcription unless the user
explicitly asks for that fallback and has the right to use the material.

Use the language requested by the user. When captions are automatic or visibly
incomplete, label them as such. Preserve timestamps only when the user asks for
them or they materially help answer the question.

## Clean and deliver

Remove obvious caption artifacts such as repeated rolling lines, without
rewriting the speaker’s meaning. For a short transcript, present it directly.
For a longer result, create a clearly named text file in the user-approved
location and report where it was saved.

When summarizing, attribute ideas to the video rather than presenting them as
verified facts. Quote only brief excerpts necessary to answer the user’s
question, and link back to the original video.

## Failure handling

If the primary route fails, try one reasonable supported fallback. Do not retry
in a loop, especially after rate limiting or bot-protection responses. Explain
the practical blocker and offer the next appropriate option.
