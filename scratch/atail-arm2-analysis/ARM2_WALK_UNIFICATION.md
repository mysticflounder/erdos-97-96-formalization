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

## FE factor (the ×3) — why SI-level UNSAT covers all three

FrontierRefinedEscapeOutcome (FE1/FE2/FE3) is a SEPARATE factor. Constraints
1–8 of the SI1 spec are the SI (strictInterior) side only. A contradiction from
the SI data ALONE kills SI × {FE1,FE2,FE3} together (3 of 12 at once). FE only
needs separate handling if the SI side is realizable and the escape adds the
missing constraint (FE2 = escape lands on the frontier circle; FE1/FE3 =
off-radius common deletion).
