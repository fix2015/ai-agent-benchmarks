# Contributing

Thanks for your interest in improving AI Agent Benchmarks! Here's how you can help.

## Adding a New Agent

1. Create a profile in `agents/<agent-name>.md` following the existing format
2. Add the agent to all comparison tables in `README.md`
3. Add feature data to `benchmarks/feature-matrix.json`
4. If you have benchmark scores, add them to `benchmarks/scores.json`
5. Submit a PR with sources for any claims

## Updating Benchmark Scores

1. Run benchmarks using `scripts/run-benchmark.sh` or your own methodology
2. Document your setup: model version, date, hardware, task set
3. Update `benchmarks/scores.json` with new data
4. Submit a PR with raw results in the `results/` directory

## Reporting Inaccuracies

Open an issue with:
- Which data point is incorrect
- What the correct value should be
- A source or reference supporting the correction

## Guidelines

- All claims should be verifiable from public sources
- Benchmark scores should include methodology
- Keep agent profiles objective and factual
- Update the `last_updated` field when modifying data files
