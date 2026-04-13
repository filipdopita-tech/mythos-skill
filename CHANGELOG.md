# Changelog

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
