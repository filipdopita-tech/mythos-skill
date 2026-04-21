# ⚡ Mythos — Claude Code Skill

> Emulation of Claude Mythos Preview (Project Glasswing). Falsification-first. Bayesian calibration. ACH matrix. Evidence or nothing.

Mythos is a Claude Code skill that emulates Anthropic's **Claude Mythos Preview** — the gated frontier model released 2026-04-07 via [Project Glasswing](https://www.anthropic.com/glasswing). Mythos is **not a bigger model**, it's a *fundamentally new model class* with a different investigative posture: adversarial defaults, falsification-first epistemology, Bayesian likelihood updates, and Minimum Viable Proof as the stopping criterion.

This skill doesn't give you Mythos access — it encodes Mythos's **epistemology and output discipline** into Claude Opus 4.7. No brainstorming. No mid-task interruptions. One agent that doesn't stop until it has proof — or can explain exactly why nothing was found.

---

## Project Glasswing Context

Claude Mythos Preview launched as the first major AI model Anthropic **withheld for 7 years** for safety review (per Newton Cheng, Frontier Red Team Cyber Lead). Access is gated to 12 launch partners — AWS, Apple, Google, Microsoft, Broadcom, Cisco, CrowdStrike, JPMorganChase, Linux Foundation, NVIDIA, Palo Alto Networks, Anthropic — with **$100M in usage credits** and **$4M donated** to open-source security.

The real Mythos found a **27-year-old OpenBSD remote crash bug** and a **16-year-old FFmpeg H.264 flaw** that automated fuzzers had hit 5M+ times without detection. Firefox JS shell: **181 autonomous exploits** vs 2 for Opus 4.6 across comparable runs. OSS-Fuzz: full tier-5 control flow hijack on 10 separate targets.

This skill emulates the **reasoning posture** that produces results like these.

---

## Verified Benchmarks (Mythos vs Opus 4.6)

| Benchmark | Mythos | Opus 4.6 | Delta |
|---|---:|---:|---:|
| CyberGym (vuln reproduction) | **83.1%** | 66.6% | +16.5pt |
| SWE-bench Verified | **93.9%** | 80.8% | +13.1pt |
| SWE-bench Pro | **77.8%** | 53.4% | +24.4pt |
| SWE-bench Multilingual | **87.3%** | 77.8% | +9.5pt |
| Terminal-Bench 2.0 | **82.0%** | 65.4% | +16.6pt |
| OSWorld-Verified | **79.6%** | 72.7% | +6.9pt |
| GPQA Diamond | **94.6%** | 91.3% | +3.3pt |
| BrowseComp | **86.9%** — 4.9× fewer tokens | — | Token efficiency |

Sources: [red.anthropic.com/2026/mythos-preview](https://red.anthropic.com/2026/mythos-preview/) · [anthropic.com/glasswing](https://www.anthropic.com/glasswing) · [Fortune 2026-04-07](https://fortune.com/2026/04/07/anthropic-claude-mythos-model-project-glasswing-cybersecurity/) · [InfoQ](https://www.infoq.com/news/2026/04/anthropic-claude-mythos/) · [CNBC](https://www.cnbc.com/2026/04/16/anthropic-claude-opus-4-7-model-mythos.html)

---

## What Makes Mythos Different

| | Standard Claude (Opus 4.7) | Mythos (emulation) |
|---|---|---|
| Default stance | Neutral: "Looking for X" | Adversarial: "X exists — prove me wrong" |
| Hypotheses | Confirms plausible | **Steelman, then falsify** |
| Claims | "Maybe X" | `[HIGH/direct/85%] X — evidence: Y` |
| Causality | Correlation → conclusion | **Pearl ladder**: CORR → CAUSAL → COUNTERFACTUAL |
| Uncertainty | Vague ("maybe") | Calibrated `[LEVEL/TYPE/%]` + Bayesian L.R. update |
| Competing hypotheses | Best hypothesis wins | **ACH matrix (Heuer)** — H with fewest contradictions |
| New evidence | Accepts | Explicit likelihood ratio update |
| Reasoning efficiency | More tokens = better | **Each token = update** — filler removed, every thinking token maps to a concrete action |
| Sources | "Two sources" | **Source-independence** — two methods, not two views of one |
| Proof budget | Collect until certain | **Minimum Viable Proof** — smallest HIGH set → stop |
| Autonomy | Asks when blocked | **Autonomous overnight mode** — pivot, scope-expand, no stop |
| Empty result | "Couldn't find anything" | Sensitivity-verified "nothing found" or explicit scope expansion |
| Bias check | None | Every 3 iterations — 5 categories (confirmation, anchoring, premature closure, aligned signals, motivated reasoning) |
| Disclosure | Ad-hoc | **Responsible disclosure protocol** — patched = full, unpatched = hash |
| Goal | Answer | Narrative-complete findings (entry → mechanism → impact) |

---

## Execution Loop (14 steps)

```
0.  PRE-FLIGHT          — scope, pre-mortem, reference class, steelmaned H, task graph
1.  EXTENDED THINK      — steelman first, falsifying test before confirming
2.  EXECUTE             — real action; parallel H where independent
3.  SURPRISE CHECK      — P<20% before test? → large L.R. + secondary H
4.  NARRATIVE CHECK     — entry → mechanism → impact complete?
5.  CAUSAL LADDER       — CORR → CAUSAL → COUNTERFACTUAL (HIGH needs CAUSAL)
6.  REPLICATION         — HIGH/direct: 2× source-independent methods
7.  ACH UPDATE          — mark +/0/-/-- per H; eliminate most-contradicted
8.  BAYESIAN            — explicit L.R. per H + secondary H queue
9.  MVP CHECK           — smallest HIGH set for narrative → stop
10. REFUTED? → pivot    — next H via ACH ranking
11. BIAS CHECK (3 iter) — confirmation / anchoring / premature closure / aligned signals / motivated reasoning
12. PIVOT (3 iter, 0 HIGH) — re-rank priors, alternative H
13. SELF-CORRECT        — claim without evidence → back to step 2
```

Max 7 iterations per sub-task. After 3 sub-tasks with 0 HIGH findings: auto scope expansion with documented rationale.

---

## Evidence Quality System

```
[HIGH/direct/85–100%]  — command run, output seen, reproduced 2× independently
[HIGH/code/85–100%]    — code read, finding at specific file:line, reproduced
[MED/inference/60–84%] — logical inference from HIGH findings
[MED/pattern/60–84%]   — pattern match on documented problem type
[LOW/hypothesis/30–59%]— unverified hypothesis, needs test
[UNVERIFIED/<30%]      — never appears in output as fact
```

**Minimum Viable Proof**: the smallest set of HIGH findings that support the conclusion. Once reached — stop collecting. More evidence past MVP = sunk cost bias.

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
| `/mythos security ./api` | Assume-compromise hunt — full exploit chain with PoC |
| `/mythos debug "null pointer on login"` | Assume bug exists — falsify location |
| `/mythos audit ./src` | Calibrated audit with replication + ACH |
| `/mythos deep "why is checkout slow"` | Falsification-first chain reasoning, Pearl-causal |

On activation, Mythos announces:
```
MYTHOS — [variant] | Scope: [X] | Model: claude-opus-4-7
→ Pre-flight started.
```

For large-scope investigations (>200K input tokens, cross-file refactor >30 files, mega-batch):
```
Model: claude-opus-4-7[1m]
```

---

## When to Use

- Security audits, vulnerability hunting, penetration testing
- Deep debugging where standard approaches (grep, add logs, ask Claude) failed
- Any analysis requiring **proof**, not opinion
- Complex chain reasoning across layers (code → infra → business impact)
- Post-incident forensics with causal claims

**Don't use for:** simple queries, single-file edits, tasks Sonnet handles in one turn. The loop overhead is only worth it when proof quality matters.

---

## Cost

Each task runs `claude-opus-4-7` (or `claude-opus-4-7[1m]` for large scope) in an iterative loop — expect **$0.20–$2.00 per task** depending on depth and hypotheses tested. Aggressive pruning (MVP stopping, no replication past threshold, no filler reasoning) keeps cost lower than it looks — each thinking token maps to a concrete action or update.

---

## Requirements

- [Claude Code](https://claude.ai/code) CLI installed
- macOS, Linux, or Windows (WSL)
- No external APIs required
- Opus 4.7 access (or 1M context variant for large-scope work)

---

## License

MIT — free to use, fork, and modify.

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) — v2.2 (current): 44% lean refactor, theatre removed (EVOI-NC formulas, token-efficiency self-claim), core preserved (ACH, Falsification-First, Bayesian L.R., Pearl ladder, source independence, MVP). v2.1: Opus 4.7 + Glasswing alignment. v2.0: Falsification-first rewrite.
