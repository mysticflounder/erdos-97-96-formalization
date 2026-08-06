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

## Next targets

The grid leaf is the sharper of the two: it is the "global deletion-row /
full-shell coupling" the 2026-08-03 audit named as the missing producer, and it
arrives with its reflection data already proved. The joint-deletion leaf is the
generic arm — note that a three-centre survival packet with an *unconstrained*
source is available from `|A| ≥ 15` alone, so any consumer of that leaf must
use the source's membership in a first-apex class of at least four points.
