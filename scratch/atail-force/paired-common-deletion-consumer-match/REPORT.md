# Paired common-deletion consumer match

Date: 2026-07-17

Status: **consumer audit complete; no existing terminal consumer matches the
current packet without a genuinely new paired incidence/order theorem**.

This lane audits the exact output of
`LargeCapUniqueFiveTwoCommonDeletionSources` against the closest production
and scratch theorem-bank consumers.  It does not claim a closure theorem.

## Scope and evidence

The production input is
`Problem97.ATailLargeCapUniqueFiveLowHit.LargeCapUniqueFiveTwoCommonDeletionSources`
from
`lean/Erdos9796Proof/P97/ATail/LargeCapUniqueFiveLowHit.lean`.

Before proposing a new local consumer, this audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- the current production and `scratch/atail-force` theorem surfaces; and
- `nthdegree docs search --lean` queries for common-deletion rows, mutual
  critical-source bisectors, common outside pairs, the U5 triple consumers,
  `u1TwoLargeCapObstruction`, and one deletion surviving at three centers.

Search hits were rechecked against the current local source.  The shortest
relevant imported bank theorem is the production U5 two-triple-point
incompatibility, not one of the longer literal source-unit certificates.

Epistemic labels used below:

- **PROVEN**: kernel-checked in production or in this scratch lane;
- **DERIVABLE**: follows directly from named checked packet fields/theorems,
  but is not packaged here as a separate declaration; and
- **NOT PRODUCED**: an exact extra antecedent required by a consumer, with no
  current theorem deriving it from the paired packet.

## Exact information already in the packet

Let `P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile`.  Write

```text
p := S.oppApex2
c := H.centerAt P.unusedRow.unused.point P.unusedRow.source_mem_A
q₁ := P.first
q₂ := P.second
T := SelectedClass D.A p profile.radius ∩
       S.capInteriorByIndex S.oppIndex2
```

The packet gives:

- `q₁,q₂ ∈ T` and `q₁ ≠ q₂`;
- neither source belongs to the unused source's actual critical support;
- deletion of either source preserves K4 at both `c` and `p`; and
- concrete packets
  `P.firstPacket : CommonDeletionTwoCenterPacket D H q₁ c p` and
  `P.secondPacket : CommonDeletionTwoCenterPacket D H q₂ c p`.

For each deletion packet, its `c`-row is the unused source's actual selected
support with the deleted source erased, while its `p`-row is the exact
physical radius-five class with that source erased.  Consequently:

- the two physical rows share the other three physical class points;
- each physical row contains the other deleted source; and
- each common-row/physical-row pair has intersection cardinality at most one,
  by `actualUnusedRow_physicalInterior_inter_card_le_one`.

The last point is decisive: the packet does **not** already contain two
points co-radial at both `c` and `p`.  Any consumer needing such a common pair
is on the contradictory side of the missing boundary.

## New checked boundary lemmas

`ActualSourceRowBoundary.lean` proves four `sorryAx`-free scratch theorems.

### 1. An actual source row has at most one other physical hit

```lean
theorem actualCriticalRow_otherPhysicalInterior_inter_card_le_one
    (hsourcePhysical :
      source ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2)
    (hphysicalSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2) :
    (((SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capInteriorByIndex S.oppIndex2).erase source) ∩
        (H.selectedAt source ...).toCriticalFourShell.support).card ≤ 1
```

Specializations are checked for `P.first` and `P.second`.

**Implication direction:** an actual row sourced at either deleted physical
point cannot provide two *additional* physical exact-five points.  Therefore
the shortest U5 two-hit sink and the cap-localized two-hit sink cannot be
turned into producers by choosing the actual rows at `q₁` or `q₂`.

The proof uses the following route.  Two further physical hits would put the
actual blocker in the physical cap via the two-center localization lemma.
The source and the two hits would then be three same-cap support points of one
selected row, contradicting the ordered-cap support bound of two.

### 2. Mutual actual-row incidence means blocker collision

```lean
theorem actualBlockers_eq_iff_mutualCrossMembership (P) :
    H.centerAt P.first P.firstPacket.q_mem_A =
        H.centerAt P.second P.secondPacket.q_mem_A ↔
      (P.second ∈
          (H.selectedAt P.first P.firstPacket.q_mem_A)
            .toCriticalFourShell.support ∧
       P.first ∈
          (H.selectedAt P.second P.secondPacket.q_mem_A)
            .toCriticalFourShell.support)
```

**Implication direction:** reciprocal actual-source incidence collapses the
two actual blockers; it does not produce two distinct new bisector centers.
The reverse implication is deletion criticality.  The forward implication
uses `p` as a third point of the perpendicular-bisector filter and the
Dumitrescu bound.

This rules out the tempting route through
`false_of_separatedPair_mutualCriticalSourceBisectors`: its final
`actual blockers are distinct` field is incompatible with the reciprocal
memberships in this exact-five setting.

Validation from `lean/`:

```bash
lake env lean -R .. \
  ../scratch/atail-force/paired-common-deletion-consumer-match/ActualSourceRowBoundary.lean
```

All four `#print axioms` outputs contain only `propext`, `Classical.choice`,
and `Quot.sound`.

## Exact consumer audit

### Production U5 two-triple-point incompatibility

Closest terminal theorem:

```lean
theorem U5QCriticalTripleClass.two_triple_points_incompatibility
    (htriple : U5DangerousTriple D q p T)
    (K : U5QCriticalTripleClass D q center B)
    (hcenter_ne_p : center ≠ p)
    (ht₁T : t₁ ∈ T) (ht₂T : t₂ ∈ T) (ht₁₂ : t₁ ≠ t₂)
    (ht₁B : t₁ ∈ B) (ht₂B : t₂ ∈ B) : False
```

For `q := q₁` (symmetrically `q₂`), the physical exact-five class supplies a
dangerous triple around `p`, and the actual critical row supplies the
q-critical class at its blocker.  The smallest missing fields appear to be

```text
t₁,t₂ ∈ (physical class minus q),  t₁ ≠ t₂,
t₁,t₂ ∈ H.selectedAt q ... .support.
```

Verdict: **impossible antecedent, not a producer target**.  The first new
checked boundary theorem says the actual row has at most one such other
physical hit.

The adjacent-centers U5 incompatibilities are not closer.  They require
q-critical rows whose **centers** are named points of the dangerous triple.
`H.selectedAt q₁` and `H.selectedAt q₂` are rows *sourced* at those points;
their centers are their critical blockers.  Treating source names as center
names is a role error.

### Ordered-cap common outside-pair uniqueness

Production kernel:

```lean
CapSelectedRowCounting.outsidePair_unique_capCenter
```

Scratch row adapter:

```lean
false_of_two_cap_center_rows_common_outside_pair
```

The exact additional packet needed for the two actual rows is:

```lean
structure ActualRowsCommonOutsidePair (P) where
  k : Fin 3
  firstBlocker_mem_cap :
    H.centerAt P.first P.firstPacket.q_mem_A ∈ S.capByIndex k
  secondBlocker_mem_cap :
    H.centerAt P.second P.secondPacket.q_mem_A ∈ S.capByIndex k
  blockers_ne :
    H.centerAt P.first P.firstPacket.q_mem_A ≠
      H.centerAt P.second P.secondPacket.q_mem_A
  a b : ℝ²
  a_ne_b : a ≠ b
  a_mem_first : a ∈ (H.selectedAt P.first ...).support
  b_mem_first : b ∈ (H.selectedAt P.first ...).support
  a_mem_second : a ∈ (H.selectedAt P.second ...).support
  b_mem_second : b ∈ (H.selectedAt P.second ...).support
  a_not_mem_cap : a ∉ S.capByIndex k
  b_not_mem_cap : b ∉ S.capByIndex k
```

Then a thin theorem

```lean
theorem false_of_actualRowsCommonOutsidePair
    (P) (X : ActualRowsCommonOutsidePair P) : False
```

would feed the existing adapter directly.

Verdict: **NOT PRODUCED**.  Neither common cap placement of the two blockers
nor a two-point support intersection is currently supplied.  Reciprocal
source membership cannot provide the distinct common pair: it forces the
blockers equal.  For either per-deletion pair of rows already in `P`, the
common support intersection is at most one, independently ruling out this
sink.

### Fixed-triple second-center metric sink

`false_of_fixedTriple_secondCenter_two_equalities` is the raw metric form of
the same two-circle obstruction: a second center has the two equalities that
put three fixed noncollinear points on its circle.

Verdict: **strictly stronger than the U5 two-hit antecedent in row form**.
Instantiating it from an actual source row would again require two additional
physical points, already ruled out by the checked cardinality-one theorem.

### Mutual critical-source bisectors

`false_of_separatedPair_mutualCriticalSourceBisectors` consumes reciprocal
source-row memberships together with three pairwise-distinct bisector
centers.  Taking its base center to be the physical apex provides the two
`actual blocker ≠ p` facts from the common-deletion packets.

Verdict: **the last distinctness field is false**.  In the present packet,
reciprocal membership is equivalent to equality of the two actual blockers.
The correct implication is a center collision, not `False` through the
three-center consumer.

### Common-deletion expansion

`commonDeletion_successor_or_alignedCriticalPair` accepts either
`P.firstPacket` or `P.secondPacket` with no extra antecedent.  It concludes:

```text
another common deletion at the same two centers
  OR
two prescribed-critical sources aligned at one center.
```

Verdict: **exactly applicable but nonterminal**.  It consumes one origin at a
time and forgets the fact that `P` contains two distinct physical origins.
No indexed theorem consumes the two expansions simultaneously.  The nearby
union-cardinality theorem is only a lower bound, not a contradiction.

Similarly, `biApex_three_center_two_deletion_coupling` packages one of several
common-deletion packets; it does not eliminate one.

### Live multiplicity consumer

`false_of_unalignedCommonCapLiveMultiplicity` needs a
`LiveDangerousRetainingSystem` and two points common to a live row and a
common-deletion row outside a common cap.

Verdict: **role mismatch and missing multiplicity**.  The exact-five packet
has no live six-label row role.  Even ignoring that mismatch, its canonical
common-row/physical-row intersection is at most one.

### `u1TwoLargeCapObstruction`

The sibling-bank theorem consumes seven named metric equalities:

```text
c: a=d=f,
d: c=e=f,
f: a=d=e,
e: a=c,
with a ≠ c.
```

Verdict: **not a small adapter target**.  The physical exact-five row can
supply two same-center equalities after choosing three physical points, but
the packet gives no center-as-support placements that generate the five
remaining cross-row equalities.  No label assignment found in the bank audit
turns the current row roles into this antecedent.

### Original double-apex shared pair

The original K-A pair/two-circle consumer needs two distinct points lying in
the same radius class at both `c` and `p`.

Verdict: **not present in either common-deletion packet**.  The actual unused
row's physical-interior intersection has cardinality at most one.  Proving a
two-point common fiber here would contradict the already checked cap-local
boundary; it should not be described as a routine packet projection.

## Complete actual-cross status

The two actual source rows give a useful finite status split:

```text
q₂ ∈ row(q₁) and q₁ ∈ row(q₂)
    => actual blockers are equal;

q₂ ∉ row(q₁)
    => actual blockers are distinct
    and deletion of q₂ survives at blocker(q₁);

q₁ ∉ row(q₂)
    => actual blockers are distinct
    and deletion of q₁ survives at blocker(q₂).
```

The omission implications use
`blocker_centers_ne_of_not_mem_other_selected_support` and
`cross_deletion_survives_iff_not_mem_selected_support`.

Thus a non-mutual arm gives one deletion surviving at a third center.  The
bank search found packet constructors and continuation lemmas for this shape,
but no terminal theorem saying that one deletion surviving at these three
origin-tagged centers is impossible.  This is the first honest missing
consumer boundary.

## Recommended next theorem boundary

Do not target another two-hit row packet.  The cap geometry proves those
antecedents impossible before they can be produced.  The next theorem must
retain both origin tags and split the two actual cross-incidences.

The parent-facing endpoint is:

```lean
theorem false_of_exactFive_pairedCommonDeletion
    (P : LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) : False
```

This statement is **CONJECTURAL**, not proved by this audit.  A non-circular
implementation must visibly consume:

1. the mutual arm as an actual-blocker collision;
2. each omission arm as cross-deletion survival at a third center;
3. both distinct physical origins simultaneously; and
4. an ordered-cap, global critical-map, or nonreturn/progress fact that
   eliminates those resulting configurations.

A companion audit subsequently proved the positive local boundary:

```lean
theorem exists_distinct_physicalInterior_survives_actualBlocker
    (q : ℝ²) (hqPhysical : q ∈ physicalStrictCapClass) :
    ∃ w ∈ physicalStrictCapClass, w ≠ q ∧
      HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q ...)
```

Thus cross omission is guaranteed at every physical source; it is not itself
a contradiction. The pinned exact finite-metric regression in
`../paired-common-deletion-nonreturn-audit/` realizes a source-faithful
two-cycle, while a separate Euclidean convex/MEC cap regression admits local
rank wrap. The correct narrower research statement is therefore a finite
physical-class actual-critical omission-cycle packet. Its consumer must use
the convex/MEC geometry and concrete critical map on the same cycle, or force
a named cross-incidence consumed by an existing sink. Geometry-free paired
nonreturn/progress is regression-refuted.

## Bottom line

There is no thin adapter from the current paired packet to an existing
terminal consumer.  Two especially tempting routes are now ruled out by
checked theorems:

- an actual source row cannot contain two other physical exact-five points;
- reciprocal actual-source incidence forces blocker equality.

The achievable next advance is therefore a source-exact omission-cycle
consumer over the actual-cross status split, with joint global geometry.
Continuing to mine one-row two-hit, mutual-distinct-bisector, or anonymous
local-rank packets would mine the wrong object.
