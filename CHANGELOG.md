# Changelog

## [2.1.0] — 2026-04-17

### Changed — Anthropic Glasswing Alignment + Opus 4.7

- **Model upgrade**: default target `claude-opus-4-7` (was Opus 4.6); 1M context variant for large-scope investigations
- **Real Mythos context**: explicit reference to Anthropic's Project Glasswing launch (2026-04-07), 12 launch partners, $100M usage credits, first model withheld for safety in 7 years
- **Verified benchmarks table**: CyberGym 83.1%, SWE-bench Verified 93.9%, SWE-bench Pro 77.8%, Terminal-Bench 2.0 82.0%, GPQA Diamond 94.6%, BrowseComp 4.9× token efficiency
- **Real-world capability evidence**: Firefox JS shell exploits (181 successes), OSS-Fuzz tier-5 chain hijack on 10 targets, 27-year-old OpenBSD bug, 16-year-old FFmpeg flaw
- **Bayesian updates**: hypothesis confidence updated via likelihood ratios after every evidence step
- **Steelman-before-falsify**: steelman strongest counter-hypothesis before attempting falsification
- **Pearl causal ladder**: association → intervention → counterfactual reasoning for causal claims
- **ACH matrix (Heuer)**: Analysis of Competing Hypotheses — hypothesis with fewest contradictions wins
- **EVOI-NC prioritization**: Expected Value of Information with Noise Correction for evidence-gathering order
- **Source-independence rule**: replication requires independent sources, not same-source repeated reads
- **Narrative completeness check**: output must tell a complete causal story, not a list of facts
- **Autonomous overnight mode**: scope-bounded multi-hour investigations with self-paced checkpoints
- **Responsible disclosure protocol**: for novel vulnerabilities — coordinated disclosure templates
- **4.9× token efficiency target**: aggressive evidence pruning, MVP-first, no redundant replication past threshold

---

## [2.0.0] — 2026-04-13

### Changed — Major Rewrite

Core epistemology upgraded from MAP→HYPOTHESIZE loop to full Falsification-First protocol:

- **Falsification-First**: every hypothesis starts with ASSUME YES + seeks disconfirming evidence first
- **Evidence quality system**: `[HIGH/direct/]`, `[HIGH/code/]`, `[MED/inference/]`, `[MED/pattern/]`, `[LOW/hypothesis/]`, `[UNVERIFIED]` with calibrated % confidence
- **10-step execution loop** (was 6-step): pre-flight → extended think → execute → evidence → replication check → chain → refuted? → bias check → pivot check → self-correct
- **Meta-cognitive monitoring**: 7 cognitive bias types (confirmation, anchoring, availability, sunk cost, survivorship, false precision, premature closure) checked every 3 iterations
- **Pre-Flight protocol**: scope definition → initial sweep → ranked hypotheses → task graph before any hypothesizing
- **Task graph (DAG)** with status tracking (✓=done, →=active, ○=pending, ✗=failed, ?=uncertain)
- **Replication requirement**: HIGH/direct claims require 2× independent reproduction
- **Knowledge State tracking**: KNOWN / UNKNOWN / UNKNOWABLE / ASSUMED
- **Scope Expansion protocol**: auto-expands after 3 sub-tasks with 0 HIGH findings
- **Adversarial Self-Review checklist** (10 items) before every output
- **Minimum Viable Proof**: defined stopping criterion — don't collect evidence past MVP
- **Activation announcement format**: `MYTHOS — [variant] | Scope: [X] | Model: claude-opus-4-6`
- **Extended Thinking blocks**: `[THINKING]/[RESULT]` format wrapping every action

---

## [1.0.0] — 2026-04-13

### Added
- Initial public release
- Core MAP → HYPOTHESIZE → EXECUTE → EVALUATE → SELF-CORRECT → OUTPUT loop
- Security domain with PoC-first approach
- General purpose domain (debugging, architecture, data analysis)
- Self-correction checklist before every output
- Ecosystem-agnostic design (macOS, Linux, Windows WSL)
- One-liner install script
- Full README with benchmarks and usage examples
