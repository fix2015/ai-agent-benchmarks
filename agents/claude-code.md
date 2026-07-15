# Claude Code

**Vendor:** Anthropic
**Interface:** Terminal CLI
**Open Source:** Yes (CLI)
**Website:** https://claude.ai/code

## Overview

Claude Code is Anthropic's agentic coding tool that operates directly in the terminal. It understands entire codebases, can execute multi-step tasks autonomously, and integrates deeply with git workflows.

## Models

| Model | Context | Best For |
|-------|---------|----------|
| Claude Sonnet 4 | 200K | Fast iteration, code completion |
| Claude Opus 4 | 200K | Complex multi-file tasks, architecture |

## Key Strengths

- **Deep git integration** — understands branches, diffs, commit history
- **MCP support** — extensible via Model Context Protocol servers
- **Parallel tool calls** — executes multiple operations simultaneously
- **Background mode** — run tasks headlessly in CI/CD or scripts
- **Image input** — can read screenshots, diagrams, error images
- **Web search** — fetches documentation and references
- **Hooks system** — customizable pre/post action hooks

## Pricing

Usage-based API pricing. Included with Claude Pro ($20/mo) and Team plans with usage limits.

## Setup

```bash
npm install -g @anthropic-ai/claude-code
claude
```

## Best For

- Terminal-first developers
- Complex multi-file refactoring
- Autonomous task execution
- CI/CD integration
