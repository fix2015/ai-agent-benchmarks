# AI Agent Benchmarks

[![GitHub stars](https://img.shields.io/github/stars/fix2015/ai-agent-benchmarks?style=flat-square)](https://github.com/fix2015/ai-agent-benchmarks/stargazers)
[![Last commit](https://img.shields.io/github/last-commit/fix2015/ai-agent-benchmarks?style=flat-square)](https://github.com/fix2015/ai-agent-benchmarks/commits)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://github.com/fix2015/ai-agent-benchmarks/pulls)

A comprehensive, data-driven comparison of AI-powered coding agents. This repo tracks features, capabilities, pricing, benchmark scores, and performance data across the leading AI coding assistants available today.

> **Last updated:** July 2026 · **Agents tracked:** 8 · **Benchmark categories:** 7 · **Data files:** 8

## Contents

- [Quick Comparison](#comparison-table)
- [Feature Comparison](#feature-comparison)
- [Benchmark Results](#benchmark-results)
- [Speed Benchmarks](#speed-benchmarks)
- [Language Support](#language-support)
- [Context Window Scaling](#context-window-scaling)
- [Pricing](#pricing)
- [Agent Profiles](#agent-profiles)
- [Run Your Own Benchmarks](#how-to-run-your-own-benchmarks)
- [Contributing](#contributing)

## Data Files

All benchmark data is available as structured JSON in `benchmarks/`:

| File | Description |
|------|-------------|
| [`scores.json`](benchmarks/scores.json) | Overall benchmark scores (1-10 scale) |
| [`swe-bench-results.json`](benchmarks/swe-bench-results.json) | SWE-bench Verified scores |
| [`feature-matrix.json`](benchmarks/feature-matrix.json) | Feature comparison matrix |
| [`pricing-comparison.json`](benchmarks/pricing-comparison.json) | Pricing plans and estimated costs |
| [`speed-test.json`](benchmarks/speed-test.json) | Task completion time benchmarks |
| [`token-efficiency.json`](benchmarks/token-efficiency.json) | Token consumption per task type |
| [`language-support.json`](benchmarks/language-support.json) | Per-language code generation quality |
| [`context-window-test.json`](benchmarks/context-window-test.json) | Performance across repo sizes |

Detailed agent profiles are in `agents/`:
[Claude Code](agents/claude-code.md) · [Codex CLI](agents/codex-cli.md) · [Gemini CLI](agents/gemini-cli.md) · [Cursor](agents/cursor.md) · [Windsurf](agents/windsurf.md) · [GitHub Copilot](agents/github-copilot.md) · [Aider](agents/aider.md) · [Continue](agents/continue.md)

---

## Comparison Table

| Agent | Model(s) | Context Window | Interface | MCP Support | Multi-file Edit | Cost | Open Source |
|-------|----------|---------------|-----------|-------------|-----------------|------|-------------|
| **Claude Code** (Anthropic) | Claude Sonnet 4 / Opus 4 | 200K tokens | Terminal (CLI) | Yes | Yes | Usage-based (API) | Yes (CLI is open source) |
| **Codex CLI** (OpenAI) | GPT-4.1 / o3 / o4-mini | 200K tokens | Terminal (CLI) | No | Yes | Usage-based (API) | Yes |
| **Gemini CLI** (Google) | Gemini 2.5 Pro | 1M tokens | Terminal (CLI) | Yes | Yes | Free tier + API pricing | Yes |
| **Cursor** | Multi-model (GPT-4o, Claude, etc.) | Varies by model | IDE (VS Code fork) | No | Yes | $20/mo Pro, $40/mo Business | No |
| **Windsurf** (Codeium) | Cascade (proprietary) + multi-model | Varies by model | IDE (VS Code fork) | No | Yes | Free tier, $15/mo Pro | No |
| **GitHub Copilot** | GPT-4o / Claude 3.5 Sonnet | Varies by model | IDE extension + CLI | Limited | Yes (via agent mode) | $10/mo Individual, $19/mo Business | No |
| **Aider** | Multi-model (any LLM) | Depends on model | Terminal (CLI) | No | Yes | Free (bring your own API key) | Yes |
| **Continue** | Multi-model (any LLM) | Depends on model | IDE extension (VS Code, JetBrains) | No | Yes | Free (bring your own API key) | Yes |

---

## Feature Comparison

### Code Generation

| Feature | Claude Code | Codex CLI | Gemini CLI | Cursor | Windsurf | GitHub Copilot | Aider | Continue |
|---------|------------|-----------|------------|--------|----------|----------------|-------|----------|
| Inline completion | - | - | - | Yes | Yes | Yes | - | Yes |
| Chat-based generation | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Agentic task execution | Yes | Yes | Yes | Yes | Yes | Yes (agent mode) | Yes | Partial |
| Image/screenshot input | Yes | No | Yes | Yes | Yes | Yes | No | Partial |
| Web search / fetching | Yes | No | Yes | Yes | Yes | Yes | No | No |

### Codebase Understanding

| Feature | Claude Code | Codex CLI | Gemini CLI | Cursor | Windsurf | GitHub Copilot | Aider | Continue |
|---------|------------|-----------|------------|--------|----------|----------------|-------|----------|
| Automatic repo indexing | Yes | Yes | Yes | Yes | Yes | Yes | Yes (repo map) | Yes |
| Cross-file awareness | Excellent | Good | Excellent | Good | Good | Good | Good | Fair |
| Git integration | Deep | Good | Good | Good | Good | Deep | Deep | Basic |
| Large codebase support | Excellent | Good | Excellent | Good | Good | Good | Good | Fair |

### Developer Experience

| Feature | Claude Code | Codex CLI | Gemini CLI | Cursor | Windsurf | GitHub Copilot | Aider | Continue |
|---------|------------|-----------|------------|--------|----------|----------------|-------|----------|
| Setup complexity | Low | Low | Low | Low | Low | Low | Medium | Medium |
| Custom instructions | Yes | Yes | Yes | Yes (rules) | Yes | Yes (instructions) | Yes (conventions) | Yes |
| Tool/plugin ecosystem | MCP | Sandboxed | MCP + Extensions | Extensions | Extensions | Extensions | - | Extensions |
| Parallel tool calls | Yes | Yes | Yes | N/A | N/A | N/A | No | No |
| Background/headless mode | Yes | Yes | Yes | No | No | No | Yes | No |

---

## Benchmark Results

Scores are based on publicly available evaluations (SWE-bench, HumanEval, internal testing) and normalized to a 1-10 scale. These are approximate and reflect mid-2026 capabilities.

### Overall Scores

| Category | Claude Code | Codex CLI | Gemini CLI | Cursor | Windsurf | GitHub Copilot | Aider | Continue |
|----------|------------|-----------|------------|--------|----------|----------------|-------|----------|
| **Code Generation** | 9.2 | 8.5 | 9.0 | 8.7 | 8.0 | 8.3 | 8.0 | 7.5 |
| **Bug Fixing** | 9.0 | 8.3 | 8.7 | 8.2 | 7.8 | 7.9 | 8.1 | 7.2 |
| **Refactoring** | 9.1 | 8.0 | 8.5 | 8.5 | 7.9 | 7.8 | 8.2 | 7.3 |
| **Multi-file Changes** | 9.3 | 8.4 | 8.8 | 8.0 | 7.7 | 7.5 | 8.3 | 6.8 |
| **Test Writing** | 8.8 | 8.2 | 8.5 | 8.0 | 7.6 | 7.8 | 7.9 | 7.0 |
| **Overall** | **9.1** | **8.3** | **8.7** | **8.3** | **7.8** | **7.9** | **8.1** | **7.2** |

### SWE-bench Verified (where available)

| Agent | SWE-bench Score | Notes |
|-------|----------------|-------|
| Claude Code (Opus 4) | 72.0% | Agentic scaffolding |
| Codex CLI (o3) | 69.1% | Agentic scaffolding |
| Gemini CLI (2.5 Pro) | 63.8% | Agentic scaffolding |
| Aider (Opus 4) | 72.0% | Depends on underlying model |
| Cursor (agent mode) | ~65% | Estimated from community reports |

> **Note:** SWE-bench scores depend heavily on the scaffolding and underlying model. These numbers reflect each tool's best publicly reported configuration as of mid-2026.

### Methodology

- **Code Generation**: Given a natural language specification, produce correct, idiomatic code across multiple languages (Python, TypeScript, Rust, Go).
- **Bug Fixing**: Identify and fix bugs from issue descriptions, stack traces, or failing tests.
- **Refactoring**: Restructure existing code while preserving behavior. Includes renaming, extracting functions, and changing patterns across files.
- **Multi-file Changes**: Implement features or fixes that require coordinated edits across 3+ files.
- **Test Writing**: Generate meaningful test suites with good coverage for existing code.

---

## Speed Benchmarks

Time to complete standard tasks (seconds, lower is better). Tested on MacBook Pro M3 Max, 64GB RAM.

| Task | Claude Code | Codex CLI | Gemini CLI | Cursor | Aider |
|------|-----------|-----------|------------|--------|-------|
| Simple bug fix (1 file) | 12s | 18s | 15s | 8s | 22s |
| Add API endpoint | 45s | 65s | 50s | 35s | 70s |
| Multi-file refactor (8 files) | 30s | 55s | 35s | 40s | 45s |
| Write test suite (200-line module) | 60s | 80s | 55s | 50s | 90s |
| Implement feature (3 files + tests) | 120s | 180s | 140s | 100s | 200s |

> IDE agents tend to be faster for simple tasks due to lower startup overhead. CLI agents excel at autonomous multi-file operations.

---

## Language Support

Code generation quality by programming language (1-10 scale):

| Language | Claude Code | Codex CLI | Gemini CLI | Cursor | Aider |
|----------|-----------|-----------|------------|--------|-------|
| Python | 9.5 | 9.0 | 9.2 | 9.0 | 8.5 |
| TypeScript | 9.3 | 8.8 | 9.0 | 9.0 | 8.3 |
| Rust | 8.8 | 8.0 | 8.5 | 7.5 | 7.8 |
| Go | 9.0 | 8.5 | 8.7 | 8.0 | 8.0 |
| Java | 8.8 | 8.5 | 8.5 | 8.5 | 8.0 |
| C/C++ | 8.5 | 8.0 | 8.3 | 7.5 | 7.5 |
| Swift | 8.2 | 7.5 | 8.0 | 7.8 | 7.0 |
| SQL | 9.0 | 8.5 | 8.8 | 8.0 | 8.0 |

---

## Context Window Scaling

How agents perform as codebase size increases:

| Repo Size | Files | Lines | Claude Code | Gemini CLI | Codex CLI | Cursor | Aider |
|-----------|-------|-------|-----------|------------|-----------|--------|-------|
| Small | 15 | 2K | 9.5 | 9.2 | 9.0 | 9.0 | 8.8 |
| Medium | 80 | 15K | 9.3 | 9.0 | 8.5 | 8.5 | 8.3 |
| Large | 350 | 75K | 9.0 | 8.8 | 7.8 | 7.5 | 7.8 |
| X-Large | 1200 | 250K | 8.5 | **8.8** | 7.0 | 6.5 | 7.5 |

> Gemini CLI benefits significantly from its 1M token context at x-large sizes. Claude Code maintains strong performance through intelligent context management despite a smaller window.

---

## Pricing

| Agent | Model | Free Tier | Monthly Cost (Heavy Use) |
|-------|-------|-----------|-------------------------|
| Claude Code | Usage-based | No | $50-150 |
| Codex CLI | Usage-based | No | $50-200 |
| Gemini CLI | Freemium | **Yes** | $0-50 |
| Cursor | Subscription | Yes (limited) | $20-40 |
| Windsurf | Freemium | **Yes** | $15 |
| GitHub Copilot | Subscription | Yes (limited) | $10-19 |
| Aider | BYOK | **Yes** (tool is free) | $30-100 |
| Continue | BYOK | **Yes** (fully free with local models) | $0-100 |

See [`benchmarks/pricing-comparison.json`](benchmarks/pricing-comparison.json) for detailed plan breakdowns.

---

## Agent Profiles

Detailed profiles with setup instructions, model options, and strengths:

- [Claude Code](agents/claude-code.md) — Anthropic's terminal-based agentic coder
- [Codex CLI](agents/codex-cli.md) — OpenAI's sandboxed CLI agent
- [Gemini CLI](agents/gemini-cli.md) — Google's 1M-context terminal agent
- [Cursor](agents/cursor.md) — AI-first IDE (VS Code fork)
- [Windsurf](agents/windsurf.md) — Codeium's Cascade-powered IDE
- [GitHub Copilot](agents/github-copilot.md) — Most widely adopted AI assistant
- [Aider](agents/aider.md) — Open-source, model-agnostic CLI
- [Continue](agents/continue.md) — Fully open-source IDE extension

---

## How to Run Your Own Benchmarks

### Quick Start

1. **Pick a task set.** Use [SWE-bench](https://github.com/princeton-nlp/SWE-bench), [HumanEval](https://github.com/openai/human-eval), or create your own from real issues in your codebase.

2. **Standardize the environment.** Each agent should start from the same git commit with the same instructions.

3. **Run each agent.** Time the execution and capture outputs:
   ```bash
   # Example with Claude Code
   claude -p "Fix the bug described in issue #42" --output-format json

   # Example with Codex CLI
   codex "Fix the bug described in issue #42"

   # Example with Gemini CLI
   gemini "Fix the bug described in issue #42"

   # Example with Aider
   aider --message "Fix the bug described in issue #42"
   ```

4. **Evaluate results.** Check if tests pass, code compiles, and the change is correct.

### Evaluation Criteria

| Criteria | Weight | Description |
|----------|--------|-------------|
| Correctness | 40% | Does the code work? Do tests pass? |
| Code quality | 20% | Is the code clean, idiomatic, and maintainable? |
| Completeness | 20% | Are edge cases handled? Are all files updated? |
| Speed | 10% | How long did the agent take? |
| Token efficiency | 10% | How many tokens/API calls were consumed? |

### Tips

- Run each benchmark 3-5 times to account for non-determinism.
- Use the same model version across runs.
- Test on repos of different sizes (small library, medium app, large monorepo).
- Include tasks of varying difficulty.
- Track costs alongside performance.

---

## Key Takeaways

- **Best for terminal power users**: Claude Code, Codex CLI, Gemini CLI, Aider
- **Best for IDE-native workflow**: Cursor, Windsurf, GitHub Copilot, Continue
- **Largest context window**: Gemini CLI (1M tokens)
- **Best open source options**: Claude Code (CLI), Codex CLI, Gemini CLI, Aider, Continue
- **Best free tier**: Gemini CLI, GitHub Copilot (free tier), Aider + Continue (BYOK)

---

## Contributing

Contributions are welcome! Here's how you can help:

### Adding a New Agent

1. Fork this repo
2. Add the agent to all comparison tables
3. Include benchmark scores with methodology notes
4. Submit a PR with sources for any claims

### Updating Benchmarks

1. Run the benchmarks using the methodology above
2. Document your setup (model version, date, hardware)
3. Submit a PR with raw results

### Reporting Inaccuracies

Open an issue with:
- Which data point is wrong
- What the correct value is
- A source or reference

---

## Disclaimer

Benchmark scores are approximate and based on publicly available information, community reports, and independent testing. AI coding agents are evolving rapidly -- scores and features may change with new releases. Always test agents on your own workflows before making decisions.

---

## License

MIT License. See [LICENSE](LICENSE) for details.
