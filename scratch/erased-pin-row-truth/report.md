<!-- Provenance: report body produced by the erased-pin row-truth probe agent
     (math-prover, 2026-07-07, dispatched by the orchestrating session as part
     of the foreign-lane de-risk sweep; two-hit-probe encoding reused).
     Subagent report-file writes are guard-blocked, so the orchestrator
     transcribed the agent's final message verbatim below this header.

     Independent spot-verification by the orchestrator (own exact-Fraction
     arithmetic, no rowlib import), 2026-07-07:
       - witness_ep_right_m1_s0_l0_r3.json: class {w,s1,s2,s3} at center Pu —
         exactly-4 equidistant, points distinct, buckets (1,0,0,3) confirmed,
         and the class contains ALL THREE surplus interiors (the every-x
         property behind the statement-minus-K4 falsification). PASS.
       - witness_ep_right_m0_s0_l2_r2.json: class {Q1,Q2,s2,s3}, exactly-4,
         buckets (0,0,2,2) confirmed. PASS.
       - witness_surplus_opposite_SO_t2_PuQ1.json: center u, class
         {s2,s3,Pu,Q1}, exactly-4 equidistant, distinct. PASS.
     Together with the agent's gate record (G0 checker parity on the stored
     two-hit witnesses; G1 fresh re-finds; G2 negative controls at 6x budget)
     and logs/verify_all.log (exit 0 over all 28 witness files), the verdict
     table is accepted. Orchestrator caveats carried: the Lean-structure
     inhabitation step is the same standard-MEC prose bridge the two-hit
     report used (not run through Lean); the minimality-at-card-10 step cites
     the kernel-proven n <= 9 closure (FiniteN9Closure), whose home import
     chain should be cited precisely when this is consumed by the slot-2
     lane. -->

# Erased-pin row-truth probe — final report (2026-07-07)

## What was investigated

Realizability of the local exact-count configurations behind the 28
non-terminal erased-pin rows (18 left-right-subpacket + 10 same-side-heavy,
from `certificates/surplus/erased_pin_count_rows.json`), plus the two direct
surplus-side `ErasedPinTriple` obligations, using the `scratch/two-hit-probe/`
encoding (reused, not reinvented). All artifacts in
`scratch/erased-pin-row-truth/` (STATE.md, rowlib.py, search.py,
verify_rows.py, check_inputs.py, results/, logs/).

**Semantics cross-check (mandatory step): NO DISCREPANCY.** The
two-hit-probe encoding matches the Lean predicates on every checked
convention: adjacency (left of cap i = cap i+1, right = cap i−1;
`SurplusM44Packet.lean:293-320`), `oppIndex1/2` and `capInteriorByIndex`
(`Cap/PartitionFromMEC.lean:521,474`), `SelectedClass` (x ∈ class automatic
at radius dist p x; center never in class), the four count buckets with the
center erased from the same-cap bucket (`SurplusM44Packet.lean:391-411`),
the row predicates and their ambient side conditions
(`RemovableVertexAxiom.lean:1769-1785, 2249-2340`), and `ErasedPinTriple` =
exact 4-class through x (`WitnessPacketInterface.lean:157`). Side "right" =
center ∈ oppIndex1 interiors {Pw,Pu}; "left" = center ∈ oppIndex2 interiors
{Q1,Q2}.

## Gate record (all PASS)

- **G0 (checker parity):** the self-contained verifier passes all three
  stored two-hit witnesses, including count recomputation on both sides.
- **G1 (positive controls):** fresh searches (not replays; different frame,
  k = 379/1367 vs template 2/7) re-found exact witnesses for (1,0,2,1)
  right — restart 0, 59/59 exact checks — and (1,0,1,2) left via exact
  mirror; both independently re-verified.
- **G2 (negative controls, 6× the G1 budget):** moserCount = 3 → no witness
  (best normalized margin −2.73; binding: hull convexity at the forced
  circumcenter). Endpoint two-hit at u (violates the closed
  `capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep`) → no witness
  (margin approaches 0 from below, never crosses — a tight proven bound
  behaves exactly this way). sameCap = 2 and l = 3 (right) admit no label
  assignment (cardinality), matching the Lean closures.

## Per-row verdicts

Witness standard: exact-rational full (m,4,4) packet configuration;
equalities exact by construction over ℚ; every strict condition an exact
Fraction sign test; independently re-verified by `verify_rows.py` (exit 0
over all 28 files, transcript `logs/verify_all.log`); all coordinates in
`results/witness_*.json`.

**Left-right-subpacket (18 rows):** 16 WITNESS-FOUND, 2 structurally
impossible (Lean-closed).
Right side, center Pu — (0,0,2,2) {Q1,Q2,s2,s3}; (0,0,1,3) {Q2,s1,s2,s3};
(0,1,2,1) {Pw,Q1,Q2,s2}; (0,1,1,2) {Pw,Q1,s2,s3}; (1,0,2,1) {u,Q1,Q2,s2};
(1,0,1,2) {u,Q1,s2,s3}; (1,1,1,1) {u,Pw,Q1,s3}; (2,0,1,1) {u,w,Q1,s2}.
Left side: all 8 exact mirrors, each independently re-verified against left
count semantics. (0,0,3,1)R and (0,0,1,3)L: STRUCTURALLY IMPOSSIBLE,
already closed in Lean — the only two rows with no witness, and provably so.

**Same-side-heavy (10 rows):** 10/10 WITNESS-FOUND.
Right: (0,0,0,4) {s1,s2,s3,s4} (n=11 model, surplus card 6); (0,1,0,3)
{Pw,s1,s2,s3} (deep pass); (1,0,0,3) {w,s1,s2,s3}; (1,1,0,2) {v,Pw,s2,s3};
(2,0,0,2) {u,w,s2,s3}. Left: 5 verified mirrors.

**Surplus-side probes (both extended cleanly, no semantic gap):**
- Surplus-opposite Moser-vertex triple (center u): WITNESS-FOUND, class
  {s2,s3,Pu,Q1} — composition respects both closed endpoint one-hit bounds
  (≤1 from closed C₂, ≤1 from closed C₃). This configuration is precisely a
  surplus-index containment escape ({s2,s3,Pu,Q1} ⊄ C₁), which
  `NonSurplusMoserCapContainment` does not forbid.
- Surplus-cap strict-interior triple (center s1): WITNESS-FOUND, class
  {s2,Q2,v,Pu}.

**Ambient-inputs check (`check_inputs.py`, exact, all 28 witnesses):** all
five inputs available to the row producer in the routed-rows statement —
the two endpoint-escape exclusions, the two pinned-residual exclusions, and
`NonSurplusMoserCapContainment` — HOLD on every witness (decided by finite
exact enumeration of all realized radii; outer-vertex mappings verified
against `SurplusM44Packet.lean:532-566`). Max Moser-centered class card is
1 in every witness except the surplus-opposite one (4 at u, which no
assumed input constrains).

## Strongest single result: the ∃x escape is also closed off locally

The r = 3 witnesses at n = 10 (rows (0,1,0,3), (1,0,0,3), (0,0,1,3)) have
their class containing ALL THREE surplus interiors, all on one circle
centered at p = Pu. Hence for EVERY admissible choice of erased
x ∈ capInterior(surplusIdx) = {s1,s2,s3}, the same row is realized at the
same p with the same radius. So the ∃x conclusion of
`IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement` (and
equally the CountRows and CountFamily variants — the same witness violates
the family predicate at (1,0,0,3)) fails for every x, while EVERY
hypothesis except `HasNEquidistantProperty 4 A` holds: nonempty,
ConvexIndep, card > 9, all five exclusion/containment inputs (verified
exactly), and minimality — which for a 10-point A is unconditionally TRUE
via the kernel-proven n ≤ 9 endpoint (`counterexample_card_ge_nine` +
`FiniteN9Closure`). **PROVEN (modulo the prose bridge below): the
erased-pin local input surface minus the K4-everywhere hypothesis is
FALSE.** K4-everywhere is load-bearing for this residual; no local
producer, and no cleverer local choice of x, can close it. The n=11
witness (0,0,0,4) has the same all-x property but the falsification is not
claimed from it (minimality-at-10 is the open question itself).

## Rigor summary

- Row/surplus realizability verdicts: **PROVEN** (constructive exact
  witnesses, independently re-verified; zero floats in any accepted
  artifact). Lean-structure inhabitation (points → `SurplusCapPacket` +
  `IsM44`) is by the same standard-MEC prose bridge the two-hit report used
  (strictly acute boundary triangle + enclosing circle ⇒ MEC; strict signs
  ⇒ CapTriple; strict convex position ⇒ ConvexIndep); not run through Lean.
- Ambient-input satisfaction and the every-x property: **PROVEN** (exact
  finite decisions).
- Statement-minus-K4 falsification: **PROVEN** modulo the prose bridge plus
  the kernel-proven n ≤ 9 closure.
- The two closed rows: **PROVEN** in Lean (existing lemmas); reproduced
  here as encoding-level vacuity.
- No NO-WITNESS or UNRESOLVED rows remain; nothing rests on search failure.
  G2-N2's boundary-approach observation is HEURISTIC color only.
- Not probed: configurations satisfying K4-everywhere (impossible at
  n = 10/11 short of constructing a counterexample — the
  faithful-construction-nogo ceiling); minimality at n = 11.

## Consequences (for the slot-2 lane — actionable)

The plan's "row-exclusion targets" framing is dead for all 26 realizable
rows, in the strongest local sense: each row is realized by an
exact-rational full packet that also satisfies all five ambient inputs the
statement provides, so no per-row lemma or certificate over {IsM44 packet +
convexity + placements + the five inputs} can exist — any
msolve/Singular/positivstellensatz bank over that constraint set has a
nonempty real variety (a ℚ-point), so no ℂ-empty/unit-ideal kill is
possible. The only rows that can remain exclusion targets are the two
cardinality rows already closed in Lean. The same applies to both direct
surplus-side producer obligations ("surplus-opposite" and "surplus-cap
strict-interior" ErasedPinTriple exclusions): both realizable with all
inputs intact, and the SO shape is exactly a surplus-index containment
escape, i.e. it needs the (Q)-class escape exclusion, not an existing
packet lemma. Moreover the r=3 witnesses close the remaining local degree
of freedom: choosing x cleverly cannot rescue the current surface, because
for those packets every admissible x realizes a row — the
routed/count-rows/count-family surface minus K4-everywhere is false. The
forced reshape is therefore the two-hit correction pattern applied to the
whole residual: keep the finite row census as data, but the exclusion
argument must consume the global `HasNEquidistantProperty 4 A` structure
(K4 at the erased point's neighbors / minimality pressure), as the terminal
rows already do through the seeded-candidate route — or the local sorry
must be re-shaped so its conclusion no longer quantifies away the global
facts. The 28 witness JSONs are realizability anchors for smoke-testing
whatever emitter/census machinery replaces the per-row certificates.

Key artifacts: `STATE.md` (protocol, gates, row table, resume),
`results/row_truth_results.json` (machine-readable verdicts),
`results/witness_*.json` (28 exact witnesses), `logs/verify_all.log` and
`logs/check_inputs.log` (verification transcripts).
