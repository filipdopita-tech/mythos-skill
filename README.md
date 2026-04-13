# ⚡ Mythos — Claude Code Skill

> Emulation of Claude Mythos Preview. Falsification-first. Calibrated confidence. Bias monitoring. Evidence or nothing.

Mythos is a Claude Code skill that emulates Anthropic's unreleased frontier model — a reasoning system built on **falsification-first epistemology**: every hypothesis starts with ASSUME YES and actively seeks disconfirming evidence before confirming.

No brainstorming. No mid-task interruptions. One agent that doesn't stop until it has proof — or can explain exactly why nothing was found.

---

## What Makes v2 Different

v1 was a hypothesis loop. v2 is a different epistemology:

| | Standard Claude | Mythos v2 |
|---|---|---|
| Default stance | Neutral: "Looking for X" | Adversarial: "X exists — prove me wrong" |
| Claims | "Maybe X" | `[HIGH/direct/85%] X — evidence: Y` |
| Hypotheses | Confirms plausible | Actively falsifies |
| Uncertainty | Vague ("maybe") | Calibrated `[HIGH/MED/LOW/%]` |
| Bias check | None | Explicit, every 3 iterations |
| Output | Always an answer | Findings + proof, or "nothing — why + test evidence" |

---

## Core Loop (10 steps)

```
0. PRE-FLIGHT       — scope, sweep, hypotheses (ranked by prior), task graph
1. EXTENDED THINK   — falsifying test first (what would disprove this?)
2. EXECUTE          — real action, not just reasoning
3. EVIDENCE         — [HIGH/direct/91%] or [MED/inference/67%]
4. REPLICATION      — HIGH claims require 2× independent reproduction
5. CHAIN            — implications + update other hypotheses
6. REFUTED?         — REFUTED + reason → next hypothesis
7. BIAS CHECK       — every 3 iterations: 7 cognitive bias types
8. PIVOT CHECK      — every 3 iterations without HIGH: re-rank priors
9. SELF-CORRECT     — claim without evidence → back to step 2
10. DONE?           — adversarial review → output
```

Max 7 iterations per sub-task. After 3 sub-tasks with 0 HIGH findings: auto scope expansion.

---

## Evidence Quality System

```
[HIGH/direct/85–100%]  — command run, output seen, reproduced
[HIGH/code/85–100%]    — code read, finding at specific line, reproduced
[MED/inference/60–84%] — logical inference from HIGH findings
[MED/pattern/60–84%]   — pattern match on documented problem type
[LOW/hypothesis/30–59%]— unverified hypothesis, needs test
[UNVERIFIED/<30%]      — never appears in output as fact
```

**Minimum Viable Proof**: smallest set of HIGH findings supporting the conclusion. Once reached — stop collecting. More evidence past MVP = sunk cost bias.

---

## Install

```bash
# Clone into your Claude Code skills directory
git clone https://github.com/filipdopita-tech/mythos-skill ~/.claude/skills/mythos
```

Or one-liner:
```bash
curl -fsSL https://raw.githubusercontent.com/filipdopita-tech/mythos-skill/main/install.sh | bash
```

Then use `/mythos [task]` in any Claude Code session.

---

## Usage

```
/mythos [task description]
```

| Command | What it does |
|---|---|
| `/mythos security ./api` | Assume-compromise hunt — full exploit chain |
| `/mythos debug "null pointer on login"` | Assume bug exists — falsify location |
| `/mythos audit ./src` | Calibrated audit with replication |
| `/mythos deep "why is checkout slow"` | Falsification-first chain reasoning |

On activation, Mythos always announces:
```
MYTHOS — [variant] | Scope: [X] | Model: claude-opus-4-6
→ Pre-flight started.
```

---

## Benchmarks (Real Mythos, Project Glasswing)

| Benchmark | Score |
|---|---|
| PoC exploit on first attempt | **83.1%** (vs ~12% standard models) |
| Firefox CVE coverage | **181/181** novel vulnerabilities |
| Oldest vulnerability found | 27-year OpenBSD |
| Timing side-channel | 16-year FFmpeg |

This skill emulates the reasoning approach — falsification-first, evidence calibration, bias monitoring — that produces results like these.

---

## When to Use

- Security audits, vulnerability hunting, penetration testing
- Deep debugging where standard approaches (grep, add logs, ask Claude) failed
- Any analysis requiring **proof**, not opinion
- Complex chain reasoning across layers (code → infra → business impact)

**Don't use for:** simple queries, single-file edits, tasks Sonnet handles in one turn.

---

## Cost

Each task uses `claude-opus-4-6` in an iterative loop — expect **$0.50–$5.00 per task** depending on depth and number of hypotheses tested.

---

## Requirements

- [Claude Code](https://claude.ai/code) CLI installed
- macOS, Linux, or Windows (WSL)
- No external APIs required

---

## License

MIT — free to use, fork, and modify.

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md).
