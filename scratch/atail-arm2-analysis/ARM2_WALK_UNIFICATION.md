# arm2 unification — the common-deletion blocker walk at oppApex1

Session fd7b0078, 2026-07-19 (overnight, while math-prover a3d2ad88 decides the
SI1 coupled system). This doc maps the WHOLE arm2 attack surface (all 12 SI×FE
cases) and isolates the single shared tension. Structural facts are READ FROM
SOURCE (solid); the closing derivation at the end is CONJECTURED and flagged.

Regime guard: everything here is CARD-AGNOSTIC (cap.card=7 ⟹ |A|≥12). No |A|=11,
no (5,5,4), no Census-554.

## The 4 SI cases share one object (PROVEN from source)

`RetainedMatchingTwoStepCommonDeletionWalk R` (RetainedMatchingCommonDeletionCycle.lean:61)
is a walk `first → second → next` with, verbatim:
- first, second, next ∈ A, first≠second, second≠next;
- **first, second ∈ SelectedClass D.A oppApex1 radius** (frontier radius from
  the apex) AND ∈ oppCap1 strict interior;
- `firstPacket`: CommonDeletionTwoCenterPacket at `second`, centers
  (oppApex1, b_first) where b_first = centerAt(first) — i.e. **second
  survives-4 at oppApex1 AND at b_first**, |classes ∩| ≤ 2;
- `secondPacket`: at `next`, centers (oppApex1, b_second=centerAt(second)) —
  **next survives-4 at oppApex1 AND at b_second**, overlap ≤ 2;
- consequences: second ∉ shell(first), next ∉ shell(second) (omission edges);
  b_second ≠ b_first, b_next ≠ b_second (consecutive distinct blockers).
- `nextLocation`: sourceReturn (next=first) | freshFirstCap (next ∈ oppCap1
  interior) | freshSecondCap (next ∈ oppCap2 interior).

The three SI matching cases are the endpoint CLOSURE TYPE of this walk
(RetainedMatchingTwoStepEndpointOutcome, :269):
- **SI2 sourceReturn**: next = first (2-cycle first→second→first).
- **SI3 endpointCriticalFiber**: next≠first but centerAt(next)=b_first
  (endpoint blocker collision) ⇒ a FrontierCommonDeletionCriticalFiber with a
  forced RowHit.
- **SI4 threeDistinctBlockers**: b_first, b_second, b_next pairwise distinct.

**SI1** (localizedCollisionMutualOmission) is the COLLISION variant: two sources
s1,s2 in oppCap1 interior at frontier radius sharing ONE blocker bc
(`blockers_eq`, so dist(bc,s1)=dist(bc,s2) — the equal-blocker straddle), plus a
fresh point f (mutual-omission cycle) giving two more overlap≤2 packets. This is
what a3d2ad88 is deciding.

## The single shared tension (the arm1↔arm2 coupling)

Across ALL of SI1–SI4, the load-bearing common structure is:

> Several distinct points of oppCap1 interior, all on the frontier class at
> oppApex1 (dist = radius), where EACH point p additionally forces a 4-point
> class equidistant from oppApex1 that SURVIVES deleting p (from `survives₁`
> of its packet, center₁ = oppApex1).

So **oppApex1 must carry ≥4-equidistant classes surviving the deletion of each
walk/collision point.** This is precisely arm1's domain: arm1
(OriginalFrontierUniqueRadiusArm) asserts oppApex1 has a UNIQUE ≥4-radius of
card 4 or 5.

### CONJECTURED closing lever (NOT yet proven — verify against source defs)

Let U = the unique ≥4-radius class at oppApex1 (arm1), |U| ∈ {4,5}. For a walk
point p with `survives-4 at oppApex1 (A∖{p})`:
- if that survival class is at radius = frontier radius, then it ⊆ frontier
  class, and deleting p leaves ≥4 ⇒ frontier class card ≥ 5 and p ∈ it;
- if at a radius ≠ frontier radius, oppApex1 has a SECOND ≥4-radius ⇒ **directly
  contradicts arm1 uniqueness.**

Under arm1 uniqueness, all survivals collapse onto the single frontier class U
(|U|≤5). A walk/collision forcing k distinct interior points to each survive at
oppApex1 needs |U| ≥ k+? ; once the number of forced survivors exceeds |U|−3,
overflow ⇒ False. SI1 (2 sources + fresh) and the SI2–4 walk (2–3 pts) sit right
at this boundary — matching the "TIGHT at exact-seven" counting elsewhere
(five_le_card_of_periodThree_straddles, interior = 7−2 = 5).

STATUS of this lever: CONJECTURED. To confirm, need (a) exact def of "survives-4
at oppApex1" vs SelectedClass radius uniqueness; (b) whether arm1 uniqueness is
available as a hypothesis in the coupled consumer (it is the OTHER arm — so the
coupled false must NOT assume it; rather the two arms are discharged jointly by
false_of_parentResidualConsumers, which takes uniqueFalse AND coupledFalse
separately). => The overflow may need to live inside `uniqueFalse` OR be proven
WITHOUT uniqueness. Open question to resolve after the SI1 SAT/UNSAT verdict.

## Consequence for the attack

- If a3d2ad88 returns **SI1 UNSAT** on the 2-point coupled system: the shared
  tension already closes at k=2 ⇒ likely closes SI2–4 a fortiori (more forced
  survivors). Port one Lean lemma over the shared walk/packet structure.
- If **SI1 SAT**: the 2-point tension is realizable; the distinguishing closer
  is the walk-length / closure-type structure (SI2–4) or the equal-blocker
  straddle (SI1), and the overflow needs ≥3 forced survivors. Attack SI2–4 with
  the walk explicitly (3 points, 3 distinct blockers).

## VERIFIED RESULT (2026-07-19, prover a3d2ad88 + independent double-check)

The SI1 coupled system {1–8} was decided and the encoding independently
re-verified (Adam: "double check the encoding"):

- **{1–8} is SAT** (z3 qfnra-nlsat SAT at every stage 0–3; exact-rational
  re-validated on a 21-point witness, all 8 constraints PASS). Encoding checked
  faithful to Lean source line-by-line (`si1_coupled.py` re-run reproduces:
  Stages 0–3 sat, exact witness VALIDATED).
- **Two "unused levers" are VACUOUS, not unused** (Lean-cited): `overlap≤2` is a
  THEOREM (`inter_card_le_two`, distinct centers ⇒ ≤2 shared), and mutual
  omission #7 ≡ the survives-at-2nd-center content of #5/#6
  (`cross_deletion_survives_iff_...`). Neither can close SI1.
- **The uniqueness+card-4 pigeonhole is UNAVAILABLE in arm2.** Probes:
  {1–8}+uniqueness+card=4 → UNSAT, but +card=5 → SAT. And
  `FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust`
  (OrientedPhysicalApexIngress.lean:318, docstring :313-317) proves arm2's `R`
  makes oppApex1 robust via EITHER card≥5 OR card=4-with-a-second-radius. So in
  arm2: card≥5 ⇒ the card-5 SAT escape; card=4 ⇒ a SECOND ≥4-radius exists ⇒
  NOT unique ⇒ the pigeonhole's uniqueness premise fails and g survives-4 at
  oppApex1 via that second radius. Robustness itself supplies SI1's required
  "g survives-4 at oppApex1". **SI1 is realizable in both arm2 sub-cases.**
- **The SAT witness is grossly NON-CONVEX** (`witness_convexity_check.py`: 132
  collinear triples; hull size 6; 17 of 23 points strictly interior, incl. c0,
  bc, bf, s1, s2, f). So `D.convex` EXCLUDES it.

### Rigorous reduction of the crux (SI1)

Every LOCAL lever for SI1 is ruled out (opposite-apex, mutual-omission,
overlap≤2 all SAT/vacuous; uniqueness-card4 excluded by arm2 robustness). The
crux reduces to the SINGLE open question:

> **Does `D.convex` (global convex position of A) + {1–8} → UNSAT?**
> Equivalently: is there a CONVEX-position witness of {1–8}?

This is exactly dead-ends.md's irreducible (Q) / Candidate D ("must couple ≥2
centers; falsifiers are non-convex"). The a3d2ad88 witness IS such a non-convex
falsifier. UNSAT here (no convex witness) ⇒ SI1 closes via `D.convex`; a convex
witness ⇒ genuinely harder / open. This is the next probe.

## FE factor (the ×3) — why SI-level UNSAT covers all three

FrontierRefinedEscapeOutcome (FE1/FE2/FE3) is a SEPARATE factor. Constraints
1–8 of the SI1 spec are the SI (strictInterior) side only. A contradiction from
the SI data ALONE kills SI × {FE1,FE2,FE3} together (3 of 12 at once). FE only
needs separate handling if the SI side is realizable and the escape adds the
missing constraint (FE2 = escape lands on the frontier circle; FE1/FE3 =
off-radius common deletion).
