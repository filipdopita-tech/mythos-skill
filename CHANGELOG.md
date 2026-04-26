# Changelog

## [2.3.1] — 2026-04-26

### Added — Two new investigative sections

- **ACH Parallel Mode (forked subagents)**: when 4-5 H share evidence space, fork each H to its own subagent (CC 2.1.117+ `CLAUDE_CODE_FORK_SUBAGENT=1`), each runs with mandate "ASSUME H_X yes, falsify, return L.R. + evidence rows", master merges into ACH matrix. ~3-5× tokens but wall-clock 1× and zero sequential anchoring. Skip for 1-2 H or tight time budget.
- **Resource monitoring (autonomous-specific)**: pre-flight Rate Limits API check (`/v1/organizations/{id}/rate_limits`, GA 2026-04-24); per-iter token spend checkpoint; token-ninja MCP velocity tracker (optional) — abort run when iter spend >15K tokens for 3 in a row, hard stop at 80% rate-limit hit.
- **Sanitized**: removed personal path/identity references from new sections.

---

## [2.3.0] — 2026-04-26

### Added — RDT Pattern Translation (cherry-pick from kyegomez/OpenMythos)

Two functional gaps closed by translating concepts from OpenMythos Recurrent-Depth Transformer architecture into prompt scaffolding. Lean addition: +4 lines, no theatre.

- **ACT Halting** (Execution Loop step 9): Adaptive Computation Time stop criterion alongside MVP. Stops loop when posterior of all HIGH H changes <±5pp between iter N and N+1 AND zero new secondary H — stagnation detection, prevents sunk cost iteration past MVP. Original MVP tested *narrative completeness*; ACT tests *convergence stagnation*. Complementary, not redundant.
- **Confidence Runaway guard** (Bias Check #6): Trigger-based (not periodic) bias check fires when H confidence grows ≥15pp/iter for 2 consecutive iterations without new direct evidence (only inference / same-method replication). Periodic 5-bias check fires every 3 iter; runaway can occur within that window — this catches it real-time. Action: freeze posterior, force ACH re-mark.
- **Skipped from OpenMythos**: Latent Depth Pass (silent T-loop refinement) — duplicates Extended Thinking 8K + Pre-Flight steelmaning. MoE expert routing — 7 domain variants already cover. LoRA adaptation — N/A for single Markdown skill. Loop-index embeddings — `[iter N/7]` notation already implicit in status line.
- **Rationale**: OpenMythos is an ML training architecture (PyTorch, Recurrent-Depth Transformer), not a skill. Direct import impossible. But 2 of its conceptual patterns (ACT halting, stability constraint) translate cleanly to investigative discipline gaps. Less is more — v2 lean refactor preserved.
- **Reference**: [kyegomez/OpenMythos](https://github.com/kyegomez/OpenMythos) (RDT architecture, 5793★)

---

## [2.2.0] — 2026-04-17 (sync 2026-04-21)

### Changed — Lean Refactor: 44% reduction, core preserved

- **Size**: SKILL.md 1133 → 638 lines (44% reduction)
- **Removed (theatre)**: EVOI-NC ranking formulas, "4.9× token efficiency" self-claim, 7 individually-listed bias types (consolidated to 5), redundant explanatory prose around every concept
- **Preserved (core)**: ACH matrix, Falsification-First, Bayesian L.R. updates, Pearl causal ladder, source independence, MVP stopping criterion, pre-flight protocol, bias check categories, autonomous mode
- **Consolidated**: Domain templates (Security/Debug/Architecture/Data) merged into shared pre-flight + per-domain deltas
- **Tightened**: Extended Thinking format, Execution Loop (14 sequential steps, previously 10 with branching), Evidence Quality levels (1-5, reverse severity-sorted)
- **Confidence 85%**: core epistemology unchanged; rollback to v2.1 trivial if discipline regresses
- **Rationale**: Mythos scaffold works through *discipline at every step*, not through *listing what disciplines to apply*. v2.1 described the system; v2 runs it.

---

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
