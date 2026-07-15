#!/usr/bin/env python3
"""Compare benchmark results across agents and generate a summary table."""

import json
import os
import sys
from pathlib import Path


def load_results(results_dir: str) -> list[dict]:
    """Load all agent results from a benchmark run."""
    results = []
    results_path = Path(results_dir)

    for agent_dir in sorted(results_path.iterdir()):
        if not agent_dir.is_dir():
            continue

        metadata_file = agent_dir / "metadata.json"
        if not metadata_file.exists():
            continue

        with open(metadata_file) as f:
            metadata = json.load(f)

        diff_file = agent_dir / "changes.diff"
        diff_lines = 0
        additions = 0
        deletions = 0
        if diff_file.exists():
            with open(diff_file) as f:
                for line in f:
                    diff_lines += 1
                    if line.startswith("+") and not line.startswith("+++"):
                        additions += 1
                    elif line.startswith("-") and not line.startswith("---"):
                        deletions += 1

        stats_file = agent_dir / "stats.txt"
        files_changed = 0
        if stats_file.exists():
            with open(stats_file) as f:
                content = f.read()
                # Parse "N files changed" from git diff --stat
                for line in content.split("\n"):
                    if "file" in line and "changed" in line:
                        parts = line.strip().split()
                        if parts[0].isdigit():
                            files_changed = int(parts[0])

        results.append({
            "agent": metadata["agent"],
            "duration": metadata["duration_seconds"],
            "diff_lines": diff_lines,
            "additions": additions,
            "deletions": deletions,
            "files_changed": files_changed,
        })

    return results


def print_table(results: list[dict]) -> None:
    """Print a comparison table."""
    if not results:
        print("No results found.")
        return

    print("\n## Benchmark Results\n")
    print("| Agent | Duration (s) | Files Changed | Additions | Deletions | Total Diff Lines |")
    print("|-------|-------------|---------------|-----------|-----------|-----------------|")

    for r in sorted(results, key=lambda x: x["duration"]):
        print(
            f"| {r['agent']} | {r['duration']} | {r['files_changed']} | "
            f"+{r['additions']} | -{r['deletions']} | {r['diff_lines']} |"
        )

    print()

    # Summary
    fastest = min(results, key=lambda x: x["duration"])
    most_changes = max(results, key=lambda x: x["diff_lines"])
    print(f"**Fastest:** {fastest['agent']} ({fastest['duration']}s)")
    print(f"**Most changes:** {most_changes['agent']} ({most_changes['diff_lines']} lines)")


def main():
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <results-directory>")
        print(f"Example: {sys.argv[0]} results/20260715_143000")
        sys.exit(1)

    results_dir = sys.argv[1]
    if not os.path.isdir(results_dir):
        print(f"Error: {results_dir} is not a directory")
        sys.exit(1)

    results = load_results(results_dir)
    print_table(results)


if __name__ == "__main__":
    main()
