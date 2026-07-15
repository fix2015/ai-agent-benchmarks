#!/bin/bash
# run-benchmark.sh — Run a coding task across multiple AI agents and compare results
#
# Usage: ./scripts/run-benchmark.sh <task-file> <repo-path>
#
# task-file: A text file containing the task description
# repo-path: Path to the repository to test against

set -euo pipefail

TASK_FILE="${1:?Usage: $0 <task-file> <repo-path>}"
REPO_PATH="${2:?Usage: $0 <task-file> <repo-path>}"
RESULTS_DIR="results/$(date +%Y%m%d_%H%M%S)"
TASK=$(cat "$TASK_FILE")

mkdir -p "$RESULTS_DIR"

echo "=== AI Agent Benchmark Runner ==="
echo "Task: $TASK_FILE"
echo "Repo: $REPO_PATH"
echo "Results: $RESULTS_DIR"
echo ""

run_agent() {
    local agent_name="$1"
    local agent_cmd="$2"
    local agent_dir="$RESULTS_DIR/$agent_name"

    mkdir -p "$agent_dir"

    echo "[$agent_name] Starting..."

    # Copy repo to isolated directory
    cp -r "$REPO_PATH" "$agent_dir/repo"
    cd "$agent_dir/repo"

    # Record start time
    local start_time=$(date +%s)

    # Run agent and capture output
    eval "$agent_cmd" > "$agent_dir/output.log" 2>&1 || true

    # Record end time
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))

    # Capture the diff
    git diff > "$agent_dir/changes.diff" 2>/dev/null || true
    git diff --stat > "$agent_dir/stats.txt" 2>/dev/null || true

    # Record metadata
    cat > "$agent_dir/metadata.json" << EOF
{
    "agent": "$agent_name",
    "duration_seconds": $duration,
    "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "task_file": "$TASK_FILE",
    "repo": "$REPO_PATH"
}
EOF

    echo "[$agent_name] Completed in ${duration}s"
    cd - > /dev/null
}

# Uncomment the agents you want to benchmark:

# Claude Code
if command -v claude &> /dev/null; then
    run_agent "claude-code" "claude -p '$TASK' --output-format json"
fi

# Codex CLI
if command -v codex &> /dev/null; then
    run_agent "codex-cli" "codex '$TASK'"
fi

# Gemini CLI
if command -v gemini &> /dev/null; then
    run_agent "gemini-cli" "gemini '$TASK'"
fi

# Aider
if command -v aider &> /dev/null; then
    run_agent "aider" "aider --message '$TASK' --yes"
fi

echo ""
echo "=== Benchmark Complete ==="
echo "Results saved to: $RESULTS_DIR"
echo ""
echo "Compare diffs:"
for dir in "$RESULTS_DIR"/*/; do
    agent=$(basename "$dir")
    if [ -f "$dir/metadata.json" ]; then
        duration=$(grep duration "$dir/metadata.json" | grep -o '[0-9]*')
        lines=$(wc -l < "$dir/changes.diff" 2>/dev/null || echo 0)
        echo "  $agent: ${duration}s, ${lines} lines changed"
    fi
done
