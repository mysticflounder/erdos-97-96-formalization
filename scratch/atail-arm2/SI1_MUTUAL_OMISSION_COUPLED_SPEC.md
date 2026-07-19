# arm2 crux — SI1 mutual-omission coupled residual (card-agnostic)

Extracted from Lean source 2026-07-19 (session fd7b0078). This is the smallest
OPEN sub-case of arm2 (`FrontierCoupledStrictInteriorNormalForm R → False`),
the sole surviving frontier route for closing
`DoubleApexOffSurplusSharedRadiusPair` (U1LargeCapRouteBTail.lean:2531).

## HARD REGIME GUARDS (violating these = the drift Adam caught)

- **CARD-AGNOSTIC.** Do NOT fix |A| = 11, do NOT assume the (5,5,4) cap
  profile, do NOT invoke Census-554. The live obligation is cap.card = 7 ⟹
  |A| ≥ 12; the argument must use ONLY the local structure below, valid for
  every |A| ≥ 12. A verdict that silently assumes a finite point count is
  INVALID.
- The only cardinalities allowed are the LOCAL ones stated (4-point classes,
  overlap ≤ 2, class card ≥ 4). No global counting over a fixed |A|.

## Objects (all points in ℝ²; centers are honest points of A)

Sources for the metric content:
- `RetainedInteriorBlockerCollision` — RetainedStrictInteriorPairSelector.lean:95
- `LocalizedCollisionMutualOmissionCycle` — LocalizedCollisionMutualOmissionCycle.lean:131
- `CommonDeletionTwoCenterPacket` — CommonDeletionTwoCenter.lean:29

Centers / distinguished points (distinct unless noted):
- `c0` = oppApex1 (robust first apex).
- `bc` = common collision blocker (= centerAt s1 = centerAt s2 = centerAt g).
- `bf` = fresh point's actual blocker (= centerAt f). **`bc ≠ bf`.**
- `s1, s2` = the two collision sources (distinct), in oppCap1 strict interior.
- `bc` also lies in oppCap1 strict interior.
- `g` = collisionSource ∈ {s1, s2}. Take g = s1 WLOG (centerAt g = bc holds).
- `f` = fresh point, f ∈ A, f ≠ g, f ∉ {s1, s2}.

## Constraints (the FULL card-agnostic system)

Collision (equal-blocker straddle, k = 1):
1. `dist(c0,s1) = dist(c0,s2) = radius` (both in SelectedClass at c0), radius>0.
2. `dist(bc,s1) = dist(bc,s2) =: rb` (equal blocker), rb > 0.
3. `s1, s2, bc` in oppCap1 interior; with cL,cR the two oppCap1 Moser endpoints
   (gauge cL=(0,0), cR=(1,0)), the order (cL, s1, bc, s2, cR) is convex CCW —
   all 10 triples signedArea2 > 0 (STRADDLE, k=1). s1,s2,bc strictly below the
   cL–cR axis and inside the minimal enclosing circle (MEC) of the config.
   [This sub-system alone is SAT — banked witnesses s4_witness.json / "0202";
   it must stay SAT, it is not the contradiction by itself.]

Frontier class at the apex (arm1 coupling — the load-bearing new tension):
4. c0 carries the frontier SelectedClass at `radius` with card ≥ 4, containing
   s1 and s2 (both at distance radius from c0).

Mutual-omission cycle packets (the UNUSED coupling levers — #1 + #3 in P3RT7B):
5. freshPacket: f survives-4 at c0 AND at bc:
   - ∃ 4 distinct A-points `P1..P4 ∈ A∖{f}` with `dist(c0,Pi)` all equal (rf0>0);
   - ∃ 4 distinct A-points `Q1..Q4 ∈ A∖{f}` with `dist(bc,Qi)` all equal (rfb>0);
   - `|{P1..P4} ∩ {Q1..Q4}| ≤ 2`.
6. collisionSourcePacket: g survives-4 at c0 AND at bf:
   - ∃ 4 distinct A-points `M1..M4 ∈ A∖{g}` with `dist(c0,Mi)` all equal (rg0>0);
   - ∃ 4 distinct A-points `N1..N4 ∈ A∖{g}` with `dist(bf,Ni)` all equal;
   - `|{M1..M4} ∩ {N1..N4}| ≤ 2`.
7. Mutual omission: f ∉ shell(g) and g ∉ shell(f), where shell(x) is x's
   4-point critical support at centerAt(x). Concretely: f is not among g's
   4 critical points at bc; g is not among f's 4 critical points at bf.
8. All the class points P,Q,M,N are members of A (may coincide across classes
   subject to the ≤2 overlap bounds), and the classes avoid their deleted
   point (P,Q avoid f; M,N avoid g).

## The question (decisive either way)

Is the system {1–8} SATISFIABLE over ℝ² (card-agnostically)?

- **UNSAT** ⟹ SI1 (localizedCollisionMutualOmission) × every FE escape closes;
  a major reduction of arm2 (the crux). Deliver a checkable certificate /
  minimal unsat core.
- **SAT** ⟹ the mutual-omission + overlap≤2 levers are ALSO insufficient (as
  opposite-apex already was, s4_witness); SI1-straddle survives all formalized
  local data, and closure needs geometry beyond it (global convex position of
  the full ≥12-point set — the genuinely open combinatorics). Deliver the
  exact rational witness (card-agnostic: it need only exhibit the finitely many
  named points above, NOT a full |A|-point model).

## Suggested attack angle (arm1↔arm2 coupling)

Constraints 4 + 5 + 6 force c0 = oppApex1 to admit ≥4-equidistant classes at
possibly-three radii (the frontier `radius` with s1,s2; rf0 avoiding f; rg0
avoiding g). arm1's content is that oppApex1 has a UNIQUE ≥4-radius (card 4 or
5). If the packets' apex classes are forced onto the SAME radius as the
frontier class, deleting s1(=g) or f from a card-4 or card-5 unique class
cannot leave 4 equidistant — a pigeonhole tension. Probe whether {4,5,6}
are jointly realizable at a single apex under the ≤2 overlaps, first WITHOUT
assuming uniqueness, then note what uniqueness would add.
