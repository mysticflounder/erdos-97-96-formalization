# Paired common-deletion normal form (E1 paired arm), 2026-08-05

Anchor:
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core`.

## What landed

`lean/Erdos9796Proof/P97/ATail/PairedCommonDeletionNormalForm.lean` (new,
kernel-clean: `propext`, `Classical.choice`, `Quot.sound` only).

The paired arm *is* the source-return two-step common-deletion walk
(`pairedSourceReturnWalk`): kept and deleted are the two retained-radius
sources, and the walk returns to the kept source. Feeding it to the already
source-proved `nonempty_sourceReturnRadiusOutcome` and renewing the exact-four
arm at the second rich first-apex radius gives the exhaustive two-outcome
normal form `nonempty_pairedCommonDeletionOutcome`:

* `PairedApexClassJointDeletion` — a carrier point on some first-apex class of
  at least four points is omitted by **both** retained shells. Its deletion is
  a common deletion at the first apex and at both retained blockers, and its
  own actual blocker is a fourth distinct centre
  (`blocker_ne_keptBlocker`, `blocker_ne_deletedBlocker`).
  Reached both from the joint-deletion arm of the radius split (source on the
  retained radius) and from the exact-four arm when the second class escapes
  the two shells (source off the retained radius).

* `PairedTwoRadiusGrid` — the saturated case. Both retained shells are pinned
  onto two concentric first-apex classes `C` (retained radius) and `C'`
  (second rich radius), with
  `|C| = |C'| = 4`, `Kkept ∩ C = {kept, keptPartner}`,
  `Kdel ∩ C = {deleted, deletedPartner}`, `|Kkept ∩ C'| = |Kdel ∩ C'| = 2`,
  `Kkept ⊔ Kdel = C ⊔ C'`.

### The escape test is global over all rich first-apex radii

The producer does not test only the one second radius handed over by richness.
It branches on whether *any* positive first-apex radius carrying at least four
carrier points has a point escaping both retained shells. A third rich radius
would be disjoint from both `C` and `C'`, hence disjoint from
`Kkept ∪ Kdel = C ∪ C'`, so all of its points escape and the arm routes to the
joint deletion instead. The grid therefore records

```
PairedTwoRadiusGrid.richClass_mem :
  ∀ r, 0 < r → 4 ≤ (SelectedClass D.A S.oppApex1 r).card →
    r = radius ∨ r = otherRadius
```

with the derived consequences `otherClass_card_le_three`, `classCard_le_four`
and `not_sixPoint_class`. The last one retires the single-radius arm of
`ApexRichClassStructure` at the first apex: on the grid, richness there is
exactly two four-point classes, and they are the two grid radii.

### Cap placement census (`PairedGridCapPlacement`)

In `ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean`, producer
`pairedGridCapPlacement`, kernel-clean.

Two opposing bounds on the strict first-cap interior meet exactly:

* **Lower.** A positive first-apex class of four points contributes at least two
  points to the strict interior of its own cap
  (`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`, itself from
  the two adjacent-cap one-hit rules). `C` and `C'` together contribute at
  least four.
* **Upper.** Each retained shell contributes at most two, with no placement
  input required.
  `exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge` gives
  the blocker some strict cap. If that cap is `oppIndex1`, the same-cap row
  bound `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
  applies to the shell read as a `SelectedFourClass`. Otherwise the cross-cap
  one-hit rule `criticalShell_inter_otherRichCapSlice_card_le_one` applies once
  per grid class, and `keptShell_subset_union` / `deletedShell_subset_union`
  say the shell has no other points.

Since `Kkept ⊔ Kdel = C ⊔ C'`, the two counts are the same number, so every
inequality becomes an equality:

| field | content |
|---|---|
| `retained_inter_capInterior_eq` | `C ∩ capInterior oppIndex1 = {kept, deleted}` exactly |
| `other_inter_capInterior_card` | `(C' ∩ capInterior oppIndex1).card = 2` |
| `keptPartner_not_mem_capInterior` | `keptPartner` is outside the strict interior |
| `deletedPartner_not_mem_capInterior` | `deletedPartner` is outside the strict interior |
| `keptShell_inter_other_capInterior_card` | `Kkept` meets `C' ∩ capInterior oppIndex1` in exactly one point |
| `deletedShell_inter_other_capInterior_card` | same for `Kdel` |

So the strict first-cap interior sees exactly four of the eight grid points —
the two retained sources plus one second-class hit from each shell — and both
retained-class partners are pushed into the two adjacent caps, one each (an apex
class meets each adjacent cap in at most one point).

### Both classes named, and the partners separated

Two consequences of the census, both kernel-clean.

`PairedTwoRadiusGrid.retainedClass_eq` and `PairedTwoRadiusGrid.otherClass_eq`
turn the two cardinality-four classes into explicit four-element `Finset`s:

```
SelectedClass D.A S.oppApex1 radius
  = {O.kept, keptPartner, O.deleted, deletedPartner}
SelectedClass D.A S.oppApex1 otherRadius
  = {keptOtherFirst, keptOtherSecond, deletedOtherFirst, deletedOtherSecond}
```

`keptShell_eq` and `deletedShell_eq` are the transposes, naming the two critical
shells by the same mechanism:

```
(H.selectedAt O.kept _).toCriticalFourShell.support
  = {O.kept, keptPartner, keptOtherFirst, keptOtherSecond}
(H.selectedAt O.deleted _).toCriticalFourShell.support
  = {O.deleted, deletedPartner, deletedOtherFirst, deletedOtherSecond}
```

All four sets are *exact* radius classes, not selected subsets:
`SelectedClass` is a filter of `D.A` by definition, and
`CriticalFourShell.support_eq` says the shell support is the whole radius class
in `D.A`. So no further carrier point of `A` sits at any of the four radii from
its centre — which is the fact a realizability encoding needs in order to assert
each row as exact.

Each class is the union of its two named shell slices because
`shells_union_eq_classes_union` covers it by the two shells, so nothing in the
class escapes both named pairs. The eight points are pairwise distinct: within a
shell by the `*_ne` fields, across shells by `shells_disjoint`
(`ne_of_mem_keptShell_of_mem_deletedShell` and its three named corollaries).

The separation of the escapees is one generic mechanism applied twice. The
private helper `class_outside_pair_distinct_adjacentCaps` (in
`TriApexEndpointRetainedOmission.lean`, next to the placement producer) takes
two *distinct* points of one first-apex class, both outside the strict first-cap
interior, and puts them in *different* adjacent caps: both land in the two
adjacent closed caps by
`selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`, and a first-apex
class meets each adjacent cap in at most one point
(`leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` and the right
analogue), so they cannot share one.

`grid_retainedPartners_mem_distinct_adjacentCaps` applies it to the retained
class:

```
(keptPartner ∈ leftAdjacentCap oppIndex1 ∧ deletedPartner ∈ rightAdjacentCap oppIndex1)
  ∨ (keptPartner ∈ rightAdjacentCap oppIndex1 ∧ deletedPartner ∈ leftAdjacentCap oppIndex1)
```

`grid_otherClass_escapees_mem_distinct_adjacentCaps` applies it to the second
class. Each shell meets the second class in a named two-point set and hits the
strict first-cap interior in exactly one of them
(`keptShell_inter_other_capInterior_card`, `deletedShell_inter_other_capInterior_card`),
so each shell contributes exactly one second-class escapee
(`grid_slice_exists_outside`); the two escapees lie in different shells, hence
are distinct, hence occupy different adjacent caps.

So *both* four-point classes straddle all three caps around the first apex in
the same pattern — two points strictly inside the first cap, one in each
neighbour — which is the cyclic-order input any order model of the grid needs.

These four theorems are supporting lemmas for the grid leaf, not a reduction of
it: they add no `sorry` and remove none. They are consequences of
`PairedGridCapPlacement`, so they are available inside the leaf proof without
being wired as hypotheses.

The grid leaf
`false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core` now takes
`PairedGridCapPlacement Gr` as a hypothesis; the dispatcher supplies it from
`pairedGridCapPlacement Gr G`. No `sorry` was added — the open spine count stays
at 28.

### Order-sensitive content in the grid arm

The grid is not a bare incidence count. Each of the four two-point sets is
equidistant from the first apex *and* from its own shell's blocker, so
`SurplusCOMPGBank.sep_signedArea2` applies directly:

```
PairedTwoRadiusGrid.keptRetainedPair_sep
PairedTwoRadiusGrid.keptOtherPair_sep
PairedTwoRadiusGrid.deletedRetainedPair_sep
PairedTwoRadiusGrid.deletedOtherPair_sep
```

each stating `signedArea2 u p b = - signedArea2 v p b`: the two hits are
reflections across the chord from the first apex `p` to that shell's blocker
`b`. In convex cyclic terms, both shell pairs alternate with `{p, b}`.

Consequence worth recording (proved on paper here, not yet in Lean): the
seven-point Kalmanson terminal
`KalmansonRadiusOrderReversal.false_of_four_selected_rows_seven_ccw_radius_order_reversal`
requires the cyclic pattern `b_x, u, u', b_y, p, w, w'`, in which the arc from
`p` to `b_x` contains no `Kkept` point. The separation facts above force that
arc to contain exactly two `Kkept` points. So that bank terminal cannot fire on
the grid — consistent with the 2026-08-03 audit finding that no existing
Kalmanson terminal consumes the surviving retained-omission classes.

## Coordinator-interface frontier

Before (1 leaf):

| leaf | hypotheses |
|---|---|
| `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core` | `R`, `O`, `reverse_omission`, `reversePacket`, `G` |

After (dispatcher + 2 leaves):

| symbol | role | hypotheses |
|---|---|---|
| `false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core` | checked dispatcher, no `sorry` | unchanged signature |
| `false_of_pairedCommonDeletion_apexClassJointDeletion_triApexAllLarge_core` | leaf | `PairedApexClassJointDeletion O`, `G` |
| `false_of_pairedCommonDeletion_twoRadiusGrid_triApexAllLarge_core` | leaf | `PairedTwoRadiusGrid O`, `G` |

Granularity: one immediate constructor fan-out of two, from a single inductive
`PairedCommonDeletionOutcome`. No new structures beyond the two leaf data
packets. Spine open obligations: 27 → 28.

Narrowing measure per leaf (project rule 2):

* joint-deletion leaf — strictly stronger hypotheses: the parent supplies only
  the mutual-omission pair; the leaf additionally names a third source on a
  first-apex class of ≥ 4 points together with a four-centre survival surface.
* grid leaf — strictly stronger hypotheses and a strictly smaller cardinality
  range: the parent's retained class is only bounded below by four and its
  shells are unconstrained off the retained radius; the leaf pins both class
  cardinalities to exactly four and determines both full shells as
  `C ⊔ C'`.

Acyclicity: both leaves are consumed only by the dispatcher; neither calls the
parent (project rule 4).

Superseded interfaces: none removed. `reverse_omission` is now unused by the
dispatcher (the reverse packet already implies it) but is retained in the
signature because the coordinator
`nonempty_retainedOmissionAllLargeNormalForm` supplies it positionally, and it
remains the coherence assertion for the paired constructor.

## Promoted modules

`ATail/RetainedMatchingCommonDeletionCycle.lean` and
`ATail/RetainedMatchingSourceReturnRadiusSplit.lean` were `COMPAT-ONLY/BANK`;
their status headers now read `ON-SPINE`. Their endpoint-classification and U5
ingress theorems remain bank-only — no publish-spine consumer uses those yet.

## Survey of existing terminals against the grid (negative)

A full sweep of the repo and of the three `certificates/*_mining.json` banks
found nothing that refutes the grid. The three closest families and why each
misses:

1. `TwoCenterBisectorParity.false_of_two_centers_equidistant_pair_{after,
   enclosed, split, before}` cover exactly the four cyclically **non-interleaved**
   arrangements of a chord and two centres equidistant from it. The four proved
   `*_sep` identities force the **interleaved** arrangement — the apex and the
   blocker are separated by their own two hits — which no proved lemma addresses.
2. `criticalFourShell_inter_selectedClass_card_le_two` and every sibling `≤ 2`
   bound are *met with equality* by the 2/2/2/2 grid. It is the extremal case,
   not an excluded one.
3. `three_common_equidistant_centers_eq` and
   `eq_of_equidistant_three_noncollinear` need three shared equidistant points;
   each grid slice supplies exactly two by construction.

`Disjoint` appears in no statement of any of the three mining banks, and the
banks contain no reflected-pair / opposite-signed-area shape.

## The cap-counting layer does not close the grid (negative)

`TriApexAllLargeContext` carries four fields. Two are counting
(`cap_card_ge_six`, `notRobustCover_card`), one is the apex dichotomy
(`apex_rich`), one is global (`no_center_covers_all_apices`). Worked on paper
against the grid; not formalized, because it does not close.

The counting is done with lemmas that hold for *every* positive radius, not
only rich ones:

* `leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` and the right
  analogue — every first-apex class meets each adjacent cap in at most one
  point, with no cardinality hypothesis;
* `leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2`
  (`SurplusM44Packet/Shard03.lean:1367`) — the adjacent cap *is* an indexed cap,
  so `cap_card_ge_six` applies to it;
* `selectedClass_capInteriorByIndex_card_ge_card_sub_two`
  (`CapInteriorRadiusCounting.lean:84`) — the general `card − 2` interior bound,
  again with no cardinality hypothesis.

Write `k` for the number of distinct positive first-apex radii. Every point of
the adjacent cap other than the apex itself lies in exactly one class and each
class contributes at most one, so `6 ≤ cap.card` gives `k ≥ 5`. In the other
direction the grid's `classCard_le_four` and `richClass_mem` bound the total:
two classes of four and the rest at most three, so `|A| − 1 ≤ 3k + 2`. Adding
the `card − 2` interior bound summed over all radii gives only `k ≥ 4`, which is
weaker.

Both constraints hold on the grid and neither contradicts the other for any
`|A| ≥ 15`: the grid simply forces the first apex to see at least five distinct
distances. So the pure cap-counting layer is non-closing, in the same way the
`≤ 2` bounds were: the grid satisfies it, and satisfies the sharpest available
form of it.

That leaves `notRobustCover_card` (`|A| ≤ 4·|notRobustCenters D|`) and
`no_center_covers_all_apices` as the two genuinely unconsumed fields of the
context, alongside the K4/deletion semantics.

## Verdict semantics for the realizability probe

A numerical realizability probe on the pinned local configuration is the current
input to choosing the next lane. Its verdict is decisive in one direction only,
and only for an encoding that is *over-constrained* relative to what is proved
(the rule `flc-sharding-plan` established on the Rigid221 pentagon, convo #3103):

* an encoding asserting a **superset** of the proved constraints that comes back
  **SAT** is decisive — the true, weaker system is then realizable, so no
  contradiction exists at that layer;
* an encoding that **drops or relaxes** any proved constraint and comes back SAT
  says nothing about the true system;
* **UNSAT** of an over-constrained encoding is never decisive, since the extra
  assertions could be what is infeasible;
* **UNKNOWN** is counted separately and never folded into UNSAT.

The two facts in "Both classes named, and the partners separated" are proved, so
they belong in the encoding and push it in the over-constrained direction.

## Next targets

The grid leaf is the sharper of the two: it is the "global deletion-row /
full-shell coupling" the 2026-08-03 audit named as the missing producer, and it
arrives with its reflection data already proved. The joint-deletion leaf is the
generic arm — note that a three-centre survival packet with an *unconstrained*
source is available from `|A| ≥ 15` alone, so any consumer of that leaf must
use the source's membership in a first-apex class of at least four points.
