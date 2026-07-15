# Codex CLI

**Vendor:** OpenAI
**Interface:** Terminal CLI
**Open Source:** Yes
**Repository:** https://github.com/openai/codex

## Overview

Codex CLI is OpenAI's terminal-based coding agent. It uses GPT-4.1 and o3/o4-mini models with a sandboxed execution environment for safe code generation and modification.

## Models

| Model | Context | Best For |
|-------|---------|----------|
| GPT-4.1 | 200K | General coding tasks |
| o3 | 200K | Complex reasoning tasks |
| o4-mini | 200K | Fast, cost-effective tasks |

## Key Strengths

- **Sandboxed execution** — runs code in isolated environments
- **Multi-model support** — switch between GPT-4.1, o3, o4-mini
- **Background mode** — headless execution support
- **Approval workflows** — configurable auto-approve levels

## Pricing

Usage-based API pricing through OpenAI platform.

## Setup

```bash
npm install -g @openai/codex
codex
```

## Best For

- OpenAI ecosystem users
- Tasks requiring sandboxed execution
- Developers familiar with GPT models
