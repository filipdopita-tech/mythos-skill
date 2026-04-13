# ⚡ Mythos — Claude Code Skill

> Emulation of Claude Mythos Preview. One autonomous agent. Iterative loop. Evidence-first.

Mythos is a Claude Code skill that emulates Anthropic's unreleased frontier model — a reasoning system that **hypothesizes, executes, evaluates, and self-corrects** in a closed loop until it produces a result backed by real evidence.

No brainstorming. No swarm. No asking mid-task. Just one agent that doesn't stop until it has proof.

---

## What It Does

```
MAP → HYPOTHESIZE → EXECUTE → EVALUATE → SELF-CORRECT → OUTPUT
```

- Forms a concrete hypothesis ("The bug is at auth.ts:142")
- Verifies it with a real action (runs code, reads file, executes bash)
- Chains findings (if A implies B, verifies B in the same loop)
- Self-corrects before output ("Is every claim backed by evidence?")
- Returns a result with proof — or explains exactly why nothing was found

Max 5 iterations per task. Always uses `claude-opus-4-6`.

---

## Install

```bash
# Clone into your Claude Code skills directory
git clone https://github.com/filipdopita-tech/mythos-skill ~/.claude/skills/mythos
```

> **Via ClawhHub marketplace** (if you have it installed):
> `claude install https://github.com/filipdopita-tech/mythos-skill`

---

## Usage

```
/mythos [task description]
```

| Command | What it does |
|---|---|
| `/mythos security ./api` | Vulnerability hunt with PoC |
| `/mythos debug "null pointer on login"` | Root cause + fix |
| `/mythos audit ./src` | Comprehensive code audit with evidence |
| `/mythos deep "why is checkout slow"` | Deep analysis + chain reasoning |

---

## Benchmarks (Real Mythos)

| Benchmark | Score |
|---|---|
| PoC exploit on first attempt | **83.1%** |
| Firefox CVE coverage | **181/181** |
| Oldest vuln found | 27-year OpenBSD |
| RCE discovery | 17-year FreeBSD |

This skill emulates the reasoning *approach* — the loop structure, evidence requirements, and chain-finding methodology — that produces results like these.

---

## When to Use

- Security audits and vulnerability hunting
- Deep debugging where standard approaches failed
- Any task where you need **proof**, not opinion
- Complex multi-layer analysis (code → infra → business impact)

**Don't use for:** simple queries, single-file edits, tasks that Sonnet handles in one turn.

---

## Cost

Each task uses `claude-opus-4-6` in an iterative loop — expect **$0.20–$2.00 per task** depending on depth and codebase size.

---

## Requirements

- [Claude Code](https://claude.ai/code) CLI installed
- macOS, Linux, or Windows (WSL)
- No external APIs required

---

## License

MIT — free to use, fork, and modify.

---

## Landing Page

[filipdopita-tech.github.io/mythos-skill](https://filipdopita-tech.github.io/mythos-skill) *(or open `index.html` locally)*
