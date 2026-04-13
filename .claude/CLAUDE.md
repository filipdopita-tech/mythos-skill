# Claude Code — Filip Dopita / OneFlow

## Identity & Language
- Answer in CZECH always. Sign "Dopita". No em dash, no "Let me...", no trailing summaries.
- Direct, confident, no apologies. Results immediately.

## Architecture
- DDD with bounded contexts. Files 200-400 lines (800 max), functions <50 lines
- TDD: RED → GREEN → REFACTOR. Input validation at system boundaries only
- No hardcoded secrets. Credentials in ~/.credentials/ (chmod 600)
- Immutability: never mutate, return new copies

## Code Standards
- Explicit error handling. Parameterized queries. Sanitize HTML at output
- Repository pattern for data access. Circuit breaker for external calls
- Structured error: {isError, isRetryable, errorCategory, message}
- API envelope: {success, data, error, metadata}

## Git
- Format: `<type>: <description>` (feat, fix, refactor, docs, test, chore, perf, ci)
- Atomic commits. No secrets in git diff.

## Testing
- 80%+ coverage. Unit + Integration + E2E
- No mocking databases — hit real DB in integration tests

## Services (OneFlow ecosystem)
- VPS Flash (Contabo): compute, Claude Code, all services
- Email: postfix+dovecot+opendkim, 5 domains (oneflowteam.cz + 4 cold email)
- Stack: Python, Node.js, systemd services, MariaDB, Caddy reverse proxy
- deploy-service skill: systemd unit, EnvironmentFile for secrets, Restart=always

## Available Skills (name explicitly in prompt to activate)
Core: deploy-service, systematic-debugging, gsd-executor, security-self-audit,
      mythos, dd-emitent, ig-content-creator, content-repurpose
GSD: gsd-plan-phase, gsd-execute-phase, gsd-verify-work, gsd-debug, gsd-new-project
Quality: deset, verification-before-completion, code-review, tdd
Arch: architect, performance-optimizer, security-reviewer

## Planning (GSD)
- Wave-based execution: independent tasks run parallel, dependent sequential
- Atomic commits per task. Deviation → report immediately, do NOT retry
- Checkpoint protocol: every 3 tasks or before risky operations

## Token Efficiency
- Concise. Tables > prose. Diffs > full rewrites. No preamble/recap.
- Sub-agents: Haiku for audit/grep/classify. Sonnet for execution. Opus for architecture.

## OneFlow Brand Voice
- Colors: #0f1113 bg, #cdb186 gold, #795b38 orange, #ffffff text
- Content pillars: Investment 30%, Fundraising BTS 25%, CZ Market 20%, Personal 15%, AI 10%
- Banned: inovativní, revoluční, win-win, synergie, disruptivní, v dnešní době
