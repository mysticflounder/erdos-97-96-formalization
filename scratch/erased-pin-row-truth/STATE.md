# Erased-pin row-truth probe — STATE

Purpose: realizability reality-check over the 28 non-terminal erased-pin count
rows (+ 2 surplus-side ErasedPinTriple obligations) BEFORE per-row exclusion
lemmas are attempted.  Template: `scratch/two-hit-probe/` (encoding reused, not
reinvented).

## Protocol

- Frame: (m,4,4) `SurplusCapPacket`, surplusIdx = 0, (v1,v2,v3) = (u,v,w).
  Gauge v=(0,0), w=(1,0); MEC center (1/2,k), R^2 = 1/4+k^2; u = chord_point.
  n=10 model: labels u,v,w,s1..s3,Pw,Pu,Q1,Q2, hull
  [u,Q1,Q2,v,s1,s2,s3,w,Pw,Pu] ccw.  n=11 model (rows needing 4 surplus hits):
  insert s4 between s3 and w (surplus cap card 6, still IsM44).
- Row semantics (pinned against Lean `RemovableVertexAxiom.lean` +
  `SurplusM44Packet.lean`, see "Semantics cross-check" below): center p in
  opp-cap strict interior, radius = dist p x, x in surplus interior (auto class
  member), counts (m,s,l,r) = (|class∩{u,v,w}|, |class∩(home ints − p)|,
  |class∩leftAdjInts|, |class∩rightAdjInts|), sum = 4 = |class| exact.
  Right rows: center ∈ {Pw,Pu} (oppIndex1): left bucket = {Q1,Q2}, right
  bucket = surplus ints.  Left rows: center ∈ {Q1,Q2} (oppIndex2): left =
  surplus ints, right = {Pw,Pu}.
- Witness = exact-rational full configuration passing every strict check of the
  two-hit probe checker (gauge, Moser-on-MEC, strict in-disk, strictly acute,
  strict cap sides, all-hull-triples strictly convex, all pairs distinct, exact
  4-class at p through x, all other labels strictly off-circle, counts).
  Search: float maximin-margin hill climb -> rationalize params
  (limit_denominator ladder) -> exact rebuild (equalities exact BY
  CONSTRUCTION: chord_point / rot_t / perp_bisector_point over Q) -> exact
  Fraction checker -> independent self-contained verifier (verify_rows.py).
- Left rows: searched via exact mirror ((x,y)->(1-x,y), relabel
  (v w)(Pw Q2)(Pu Q1)(s1 s3); n=11: (s1 s4)(s2 s3)) of right witnesses, then
  independently exact-verified against LEFT count semantics.
- NO-WITNESS verdicts are EMPIRICAL (search scope + budget recorded), never
  proof of exclusion.  Witness verdicts are PROVEN (constructive, exact).
- Scope note (same as two-hit probe): witnesses satisfy the LOCAL constraint
  set (ConvexIndep + IsM44 packet + placements + exact counts).  Global
  hypotheses of the enclosing statement (HasNEquidistantProperty 4 A,
  minimality, endpoint/pinned-residual exclusions, NonSurplusMoserCapContainment)
  are NOT imposed; a witness kills local-geometric row-exclusion
  lemmas/certificates, not the ∃x-shaped spine obligation itself.

## Semantics cross-check (two-hit probe encoding vs Lean) — PASSED

Checked 2026-07-07 against source:
- leftAdjacentIndex/rightAdjacentIndex (SurplusM44Packet.lean:293-320) match
  probe comment: left of cap i = cap i+1, right = cap i−1 (mod 3).
- oppIndex1/oppIndex2 (PartitionFromMEC.lean:521-532), capInteriorByIndex
  (:474) = closed cap minus 2 chord endpoints.  IsM44 (:443) = both opp caps
  card 4.  Surplus card = |A|−5 ≥ 5.
- SelectedClass (WitnessPacketInterface.lean:53) = A.filter (dist p · = d);
  x ∈ class automatic at d = dist p x; p never in class (d>0).
- moserCount/sameCapCount/leftAdjCount/rightAdjCount
  (SurplusM44Packet.lean:391-411); sameCapCount erases the CENTER.
- Row predicates RightNonSurplusExactCountRowExcluded / Left…
  (RemovableVertexAxiom.lean:1769-1785); ambient side conditions from
  IsM44…CountRowsFactsStatement (:2249): x ∈ capInterior surplusIdx,
  p ∈ capInterior oppIndex1/2, p ∈ A.erase x.
- ErasedPinTriple (WitnessPacketInterface.lean:157) = 0 < dist p x ∧ filter
  card 3 on (A.erase x).erase p ⇔ exact 4-class through x at p (x ∈ A).
- NO DISCREPANCY FOUND — probe encoding is faithful.  (No stop condition.)

## Gates

- G0 (checker parity): my independent verifier must PASS the three stored
  two-hit-probe witness JSONs (schema two_hit_probe_witness.v1).
  [PASS 2026-07-07: 3/3 verified, incl. count semantics both sides]
- G1 (positive controls): fresh searches must re-find exact witnesses for
  (1,0,2,1) right and (1,0,1,2) left, exact + independently verified.
  [PASS: fresh witness restart 0, 59/59 exact checks; mirror verified;
   verify_rows.py PASS on both files]
- G2 (negative controls, 60 restarts x 4000 steps — 6x the G1 budget):
  - G2-N1 moser=3 (class {u,v,w,s2} at p=Pu): PROVEN impossible
    (p = circumcenter, in no cap).  [PASS: no witness; best normalized
    margin −2.73, binding check cvx[u,w,Pu] — deeply infeasible]
  - G2-N2 endpoint two-hit (center u, class ⊇ {Pw,Pu}): PROVEN impossible
    (capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep).
    [PASS: no witness; best margin −1e-6-ish (tight boundary approach,
    binding cvx[w,Pw,Pu]) — consistent with a tight proven bound]
  - G2-N3 sameCap=2 / l=3(right): no label assignment exists in the (m,4,4)
    model (cardinality); vacuous, matches Lean closures.  [PASS]

## Row status — COMPLETE 2026-07-07 (right side searched; left = verified mirror)

RIGHT (center ∈ {Pw,Pu}); LRS = left-right-subpacket, SSH = same-side-heavy.
Every witness: exact-rational, all-checks-pass, independently re-verified
(verify_rows.py exit 0 over all 28 files), and all five ambient inputs of the
routed-rows statement decided exactly and HOLDING (check_inputs.py).

| row (m,s,l,r) | route | model | verdict (witness assignment) |
|---|---|---|---|
| (0,0,3,1) | LRS | — | STRUCTURALLY IMPOSSIBLE (Lean-closed; l ≤ 2) — no search |
| (0,0,2,2) | LRS | n=10 | WITNESS-FOUND (Pu; {Q1,Q2,s2,s3}) |
| (0,0,1,3) | LRS | n=10 | WITNESS-FOUND (Pu; {Q2,s1,s2,s3}) |
| (0,1,2,1) | LRS | n=10 | WITNESS-FOUND (Pu; {Pw,Q1,Q2,s2}) |
| (0,1,1,2) | LRS | n=10 | WITNESS-FOUND (Pu; {Pw,Q1,s2,s3}) |
| (1,0,2,1) | LRS | n=10 | WITNESS-FOUND (G1; Pu; {u,Q1,Q2,s2}) |
| (1,0,1,2) | LRS | n=10 | WITNESS-FOUND (Pu; {u,Q1,s2,s3}) |
| (1,1,1,1) | LRS | n=10 | WITNESS-FOUND (Pu; {u,Pw,Q1,s3}) |
| (2,0,1,1) | LRS | n=10 | WITNESS-FOUND (Pu; {u,w,Q1,s2}) |
| (0,0,0,4) | SSH | n=11 | WITNESS-FOUND (Pu; {s1,s2,s3,s4}) |
| (0,1,0,3) | SSH | n=10 | WITNESS-FOUND (deep pass; Pu; {Pw,s1,s2,s3}) |
| (1,0,0,3) | SSH | n=10 | WITNESS-FOUND (Pu; {w,s1,s2,s3}) |
| (1,1,0,2) | SSH | n=10 | WITNESS-FOUND (Pu; {v,Pw,s2,s3}; u/w-variants infeasible at budget) |
| (2,0,0,2) | SSH | n=10 | WITNESS-FOUND (Pu; {u,w,s2,s3}) |
| LEFT mirrors (14) | | | 13 WITNESS-FOUND (exact mirrors, independently re-verified); (0,0,1,3)L structurally impossible |

Surplus-side probes:
- surplus-opposite (center u) ErasedPinTriple: WITNESS-FOUND
  (class {s2,s3,Pu,Q1}, x=s2 — respects both closed endpoint one-hit bounds;
  58/58 checks; note this is exactly a surplus-index containment escape,
  which the statement's NonSurplusMoserCapContainment input does NOT forbid)
- surplus-interior (center s1) ErasedPinTriple: WITNESS-FOUND
  (class {s2,Q2,v,Pu}, x=s2; 58/58 checks)

Bottom line: 26/26 searchable non-terminal rows realizable + both direct
surplus-side triples realizable; the only excluded rows are the two
cardinality-impossible ones already closed in Lean.  Zero NO-WITNESS rows.

## Files

- rowlib.py — models, exact/float construction, checker (mirrors two-hit probe
  check_configuration, generalized to n=11 + non-oppIndex centers).
- search.py — assignment enumeration + float maximin search + rationalization
  + exact accept; gates mode and sweep mode; incremental results JSON.
- verify_rows.py — independent self-contained exact verifier (+ parity mode
  for the original two-hit witness JSONs).
- check_inputs.py — exact decision, per witness, of the five ambient inputs of
  the routed-rows statement (endpoint escapes, pinned residuals, non-surplus
  Moser-cap containment); log: logs/check_inputs.log.
- results/row_truth_results.json — per-row verdicts (machine-readable).
- results/witness_*.json — exact witnesses.
- logs/*.log — run logs.

## Resume instructions

1. Read this file + results/row_truth_results.json.
2. `uv run --with sympy python search.py --gates` re-runs G0–G2.
3. `uv run --with sympy python search.py --sweep` continues the row sweep
   (skips rows already verdicted in results JSON).
4. `uv run --with sympy python verify_rows.py results/witness_*.json` re-runs
   independent verification of every stored witness.
5. Surplus-side probes: `uv run --with sympy python search.py --surplus`.
