<!-- Provenance: produced by the endpoint mask-coverage feasibility agent
     (general-purpose, 2026-07-07, dispatched by the orchestrating session as
     part of the foreign-lane de-risk sweep). Subagent report-file writes are
     guard-blocked, so the orchestrator transcribed the agent's final verdict
     below. Independent verification by the orchestrator (separate parser,
     same session): 117 rows re-extracted from ShadowBank.lean, all
     demand-shaped; the 12-triple covered set and 20-triple gap list match
     exactly; label ranges read directly at Geometry.lean:60-70; centerMask
     indexing confirmed at SurplusCOMPGBank.lean:35-38 (.v=1, .w=2) and
     :163-164 (masks.getD index); coverage theorem
     endpointShadowInBank_of_endpointShadowOK confirmed unconditional and
     sorry-free at ShadowSearchCoverage.lean:92-100. -->

# Endpoint exact-mask producer feasibility — VERDICT: GAPS (20 of 32)

**Question.** The two remaining sorries in
`Problem97.isM44EndpointResidualsExcluded`
(`RemovableVertexAxiom.lean:2701` left, `:2727` right) each demand a
117-row bank member with exact payload masks
`centerMask .v = maskOfLabels [.Pw, .Pu, xLabel, aLabel]` and
`centerMask .w = maskOfLabels [.Q1, .Q2, bLabel, .u]`. Is every
demandable (xLabel, aLabel, bLabel) triple present in the bank?

**Demand side** (citations in STATE.md): xLabel ∈ {Q1, Q2} for BOTH
residual sides (`IsEndpointEscapeeLabel`, Geometry.lean:61-62 — left/right
differ only in `pointOf`, not in the escapee range); aLabel ∈
{w, s1, s2, s3} (:65-66); bLabel ∈ {v, s1, s2, s3} (:69-70). No hypothesis
couples the labels. 32 demandable triples, identical for both sides.
`maskOfLabels` is a no-dedup bit sum but all demandable lists are
duplicate-free, so no degenerate masks arise.

**Bank side.** Authoritative source: `ShadowBank.lean` generated rows
(`endpointRowsQ1 ++ endpointRowsQ2` = 33 + 84 = 117). All 117 rows are
demand-shaped ({Pw,Pu} ⊆ v-mask, {Q1,Q2,u} ⊆ w-mask, escapee in v-mask).

**Covered (12):**
Q1: (s1,s1) (s1,s3) (s2,s2) (s2,s3) (s3,s3);
Q2: (w,s3) (s1,s1) (s1,s2) (s1,s3) (s2,s2) (s2,s3) (s3,s3).

**Gaps (20, per side):** all 8 triples with bLabel = v; 7 of 8 with
aLabel = w (only (Q2,w,s3) covered); the s-inversions (Q1,s1,s2),
(Q1,s2,s1), (Q1,s3,s1), (Q1,s3,s2), (Q2,s2,s1), (Q2,s3,s1), (Q2,s3,s2).

**Decisive structural point.**
`endpointShadowInBank_of_endpointShadowOK` (ShadowSearchCoverage.lean:92)
is unconditional and sorry-free: every `endpointShadowOK` shadow is in the
bank. Therefore the 20 gaps are contract-level unsatisfiability — no valid
shadow carries those v/w masks — not DFS omissions. The Q1/Q2 asymmetry
((Q2,s1,s2) covered while (Q1,s1,s2) is not) shows this is not pure
s-relabeling canonicalization.

**Consequences for the endpoint lane.**
1. The exact-mask producer sorries as currently stated are unprovable for
   the 20 gap triples unless each is refuted from the ambient geometric
   hypotheses at the sorry sites — nothing currently in scope excludes
   them (PROVEN at the interface level; the geometric refutability of each
   gap triple is UNRESOLVED).
2. Pivot options: (a) narrow the producing interface so only covered
   triples are emitted upstream — the s-inversion gaps look like
   relabeling freedom at `exists_surplusInterior_triple_covering`
   (Geometry.lean:1164), while the bLabel = v and Q1-side aLabel = w gaps
   need genuine geometric exclusion; or (b) reroute through the existing
   `*_of_selectedClass_core_interfaces` surface (ResidualSoundness.lean:
   252, 581), where bank membership comes from endpointShadowOK-from-
   geometry and the v/w masks hold definitionally.
3. Even on covered triples, mask match is necessary, not sufficient —
   `EndpointMetricShadow` (MetricShadow.lean:26-35) constrains all ten row
   masks.

Artifacts: `coverage.json` (full table), `coverage_check.py` (agent
checker), `STATE.md` (derivation with file:line citations),
`bank_ids.txt`/`json_ids.txt` (117-row id cross-check).
