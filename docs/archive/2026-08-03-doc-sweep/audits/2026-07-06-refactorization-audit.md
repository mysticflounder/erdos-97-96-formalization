<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Refactorization audit (2026-07-06)

Provenance: produced by a general-purpose analysis agent during the
2026-07-06 project audit; key claims (EpQ1008Shards dead, |A|=12 census
memory, README stale claims, axiom closures) spot-verified by the auditing
session. Snapshot caveat: a concurrent session was regenerating the
certificate shard corpus during the audit (repo grew 767 → 1,532 Lean files
mid-audit); import-graph structure is stable, file/line counts are
snapshot-stamped.

**Decision recorded after the audit (Adam, 2026-07-06):** this repo is the
main repo where the proof will be closed; `p97-rvol` and other companion
repos are historical. Findings 1 and 3 below should be read in that light —
the 58 copied modules are canonical *here*, nothing syncs back, and
`p97-rvol/docs/live-status.md` is no longer authoritative.

---

## 1. Certificate pipeline reuse — the checker IS generic; no parallel checker needed

- `EndpointCertificate/Checker.lean` contains zero endpoint-specific content:
  `Certificate = { generators : List Poly, coefficients : List Poly }` over
  sparse exact-ℚ polynomials; `checkCertificate` verifies Σ cᵢ·gᵢ = 1. No
  geometry, no point names. Generated pattern modules are pure data defs plus
  one `native_decide` theorem; geometric binding happens at consumption time.
- `scripts/endpoint-certificate.py` is already split into a generic layer
  (poly parser/arithmetic, Singular driver, exact identity re-check
  `check_identity`, Lean emitter `emit_lean_certificate`, JSON schema
  `endpoint_certificate.v1`) and an endpoint-specific front end (the ten-label
  `POINTS`, `dist2_expr`, `rabinowitsch_generator`, `certificate_inputs`).
- The (5,5,4) census tooling (`p97-rvol/scratch/u1_2_faithful/twolargecap_core/
  certify_globalcount_table.py`, historical) tests `reduce(1,G)` in Singular —
  its NON-realizable verdict is exactly "1 ∈ ideal", liftable to the
  Σ cᵢ·gᵢ = 1 witness the existing emitter extracts and the existing checker
  verifies.

**Recommendation:** for workstream A, write only a new front end (11-label
variable map + gauge x0=(0,0), x1=(1,0) + census-table generator
construction). Reuse `Checker.lean`, `emit_lean_certificate`, and the
TermShards sharding flow verbatim. The one trigger for new checker work:
census rows that are ℂ-feasible and need ℝ-only arguments (inequality
content) do not fit the equality-only checker — data-dependent, not
schema-dependent.

## 2. Build/iteration latency — factor the monolith theorem; shard the hot file

- Default `lake build` compiles only the 163-module import closure of the
  roots (~125k lines); the certificate corpus (96% of repo LOC) compiles only
  when explicitly targeted.
- Hot edit path: `SurplusM44Packet.lean` (8,068 lines, 15 commits since
  2026-06-01, most-edited Lean file) → `SurplusCOMPGBankGeometry.lean` →
  `RemovableVertexAxiom.lean` (3 spine sorries) → `Descent.lean` → root.
- `U1LargeCapRouteBTail.lean` (5,897 lines): 50 textual sorries; 49 are
  internal case branches of the single theorem
  `u1_largeCap_routeB_tail_liveData_false` (~line 3251 to ~5618 — one
  ~2,400-line declaration); the 50th is
  `DoubleApexOffSurplusSharedRadiusPair`. Anyone grinding a case branch
  re-elaborates all 5,897 lines per iteration.
- Largest reachable-path oleans (one-time costs): `U5FiniteExtraction` 26MB,
  `N4d/FormAEndpointPairKill` 24MB, `N9Endpoint/N4e` 22MB,
  `SurplusCOMPGBank` 19MB.

**Recommendation:** (a) lean-shard `SurplusM44Packet.lean` (policy/tooling
proven on the EpQ shards). (b) Sharding tools cannot split a single theorem —
factor the 49 sorry-bearing case branches of
`u1_largeCap_routeB_tail_liveData_false` into named helper lemmas in a
separate module (which also gives them stable spine names), leaving a thin
dispatch theorem; the closed prefix (lines 1–3250) can then shard normally.

## 3. Cross-repo duplication — drift had started; resolution is the freeze decision

- All 59 shared-name `P97/*.lean` modules diffed modulo the
  `Erdos9796Proof`↔`RVOL` namespace rewrite: 58 byte-identical; 1 drifted
  (`CapBridgeFromK4.lean`, docstring only). `U1LargeCapRouteBTail.lean`
  identical except one deliberate import-line difference.
- `p97-rvol` still requires this repo as a live path dep and has 403 modules
  of its own; its `docs/live-status.md` still declared itself canonical.

**Resolution (2026-07-06 decision):** p97-rvol is historical. No sync-back
gate is needed; the copies here are canonical sources. Remaining follow-up:
mark p97-rvol's live-status.md as superseded (one-line header in that repo,
next time it is touched).

## 4. Dead code

- 1,532 modules at final snapshot; 163 reachable from the roots. All 1,369
  unreachable modules are under `EndpointCertificate/` — input material for
  workstream C wiring, not dead (except below). Import hygiene outside the
  cert tree is clean; no orphaned U-series Statement scaffolding (consumers
  chain through `U3ToU5Terminal.lean` → `U1LargeCapRouteBTail.lean`).
- **Genuinely dead:** `Patterns/EpQ1008Shards/` (31 files, 92,437 lines, the
  older Product-shard family) — verified: imported by nothing;
  `EpQ1008.lean` imports the newer `EpQ1008TermShards/` family.

**Recommendation:** delete `EpQ1008Shards/` once the TermShards regeneration
is validated and committed. No build-time effect (dead files aren't
compiled); the win is repo weight, grep/index noise, and removing a
superseded-vs-current ambiguity for future agents.

## 5. Doc drift

- **README.md**: stale single-sorry claim, stale "active work in p97-rvol",
  stale "no native_decide in the closure" (both targets now include
  `Lean.ofReduceBool` + `Lean.trustCompiler`), stale file counts, stale
  one-warning build claim, stale p97-rvol gate table. → Rewritten 2026-07-06
  (this audit's remediation).
- **docs/dead-ends.md**: copied from p97-rvol; conventions block said "this
  repo = p97-rvol" (inverted) and linked four docs that don't exist here.
  → Provenance header fixed 2026-07-06.
- Clean: `four-point-subpacket-plan.md` (deliberate p97-rvol comparisons),
  the other top-level docs, both `docs/u-lane/` files.

## 6. Hygiene

- **No git hooks and no CI.** Highest-value gates: a pre-push hook running
  the axiom-closure check on both targets (`proof-blueprint verify-publish`
  once the miner is fixed, or a direct `#print axioms` snippet until then).
- `lean/_pb_snippet_*.lean` (proof-blueprint scratch) is not gitignored and
  appears in `git status` intermittently. Add to `.gitignore` (or fix
  upstream in proof-blueprint — see its `PHASE10-BATCHED-MINING.md` spec).
- `data/` (proof-blueprint DB) and `scripts/__pycache__/` correctly
  gitignored; `certificates/` JSON committed intentionally;
  `scripts/lake-build.sh` lock logic sound.
- **proof-blueprint mining regression** (found during this audit): the
  one-shot graph mine no longer fits its hardcoded 600 s kernel budget after
  the cert-corpus growth, so no kernel-fresh spine tree can currently be
  produced for this repo; live `#print axioms` per target still works. Fix
  spec: `proof-blueprint/PHASE10-BATCHED-MINING.md` (batched mining,
  per-batch persistence, configurable timeout, concurrency lock).
