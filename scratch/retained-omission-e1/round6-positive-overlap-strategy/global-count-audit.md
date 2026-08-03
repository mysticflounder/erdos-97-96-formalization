# Retained-omission E1: global-count / positive-overlap audit

## Scope and verification limit

Read-only, source-only audit of
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
(`FrontierLiveClosure.lean:6918`).  No Lean/Lake, solver, CEGAR, or production
source was run or edited.  Thus declaration statements and the scratch models
below are inspected source facts, not a fresh kernel-closure result.

## Verdict

**No positive cross-row overlap follows from the named interfaces by
cardinality/minimality alone.**  The only global count is in the wrong
direction, and neither normal-form constructor supplies a lower bound on the
number of members of any two q-deleted rows in a common finite domain.  The
first missing datum is a *positive, named row incidence* (or a row/support
identification), not another cardinality estimate.

This is not a claim that the full Lean package has a countermodel: a model of
`CounterexampleData`, `R.minimal`, and `H` would be an Erdős-97
counterexample.  It is a precise negative result about the proposed
counting-to-overlap projection.

## Exact hypothesis inventory

* `R : FrontierCommonDeletionParentResidual F`
  (`OrientedPhysicalApexIngress.lean:251-264`) retains minimality, no-M44,
  `9 < |A|`, one frontier radius class of size at least four, and a
  first-apex/second-apex common-deletion packet.  It supplies no global upper
  bound on `|A|`, no cap upper bound, and no cross-row membership.
* `P : RetainedInteriorDirectedOmission R`
  (`RetainedMatchingGeometricReduction.lean:124-153`) gives two distinct
  first-cap-interior points on the *same first-apex radius*, distinct actual
  blockers, and one directed **non-membership** plus deletion survival.  It
  does not say either source belongs to the other blocker's selected row.
* `Q : RetainedOmissionAllLargeNormalForm P`
  (`FrontierLiveClosure.lean:6763-6802`) has two cases.
  - `pairedCommonDeletion` gives the opposite directed **non-membership** and
    a second common-deletion packet.
  - `reverseHitFreshCommonDeletion` gives an actual reverse hit but then a
    fresh point explicitly *outside* that reverse shell, together with a
    fresh q-deleted packet.  It supplies no membership of the fresh packet's
    chosen support in the retained base/shell.
* Every `CommonDeletionTwoCenterPacket` contains two chosen q-deleted
  four-point supports and only their **within-packet upper bound**
  `|(B1 ∩ B2)| <= 2` (`CommonDeletionTwoCenter.lean:29-49`).  Its definition
  has no lower cap-hit count, no support equality across two packets, and no
  positive cross-packet incidence.
* `G : TriApexAllLargeContext D S`
  (`FrontierLiveClosure.lean:6832-6845`) says each cap has size at least six,
  every apex is rich, `|A| <= 4 |notRobustCenters D|`, and no one
  center/radius covers all three apices.  Richness gives row--rich-class
  intersection *upper* bounds (at most two), not a positive hit.

The cover field is exactly the union-bound shadow of minimality:
`notRobustCenters D = A.filter (not FullyDeletionRobustAt D)` and
`|A| <= 4 |notRobustCenters D|`
(`MinimalUniqueFourCover.lean:436-459`).  Even granting that the two actual
blockers are non-robust, this merely gives more non-robust centers.  The
inequality requires a lower bound on that number, whereas a contradiction
would need an incompatible upper bound.  The three rich apices only yield
`|notRobustCenters D| <= |A|-3`, which is compatible with the cover bound for
every relevant `|A| > 9`.

## Candidate pigeonhole, and why it cannot instantiate

For supports `X,Y` and a finite domain `C`, the only relevant elementary
count is

```text
|(X ∩ Y) ∩ C| >= |X ∩ C| + |Y ∩ C| - |C|.
```

Thus a positive overlap would follow from named bounds
`a <= |X ∩ C|`, `b <= |Y ∩ C|`, and `|C| < a+b`.  The present interfaces give
none of those three data in usable form:

1. `G.cap_card_ge_six` is a **lower**, not upper, bound on the cap;
2. a q-deleted packet has no lower bound at all on `|Bi ∩ C|` and does not
   state `Bi ⊆ C`; and
3. supports from different packets have no common `C` nor any relation.

Using `C=A` is vacuous: two four-point supports give only
`|X ∩ Y| >= 8 - |A|`, while `R.carrier_card_gt_nine` makes its right-hand
side negative.  The packet's `<= 2` overlap fact cannot be reversed into a
positive overlap.

The nearby exact-overlap theorem
`selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers`
(`FrontierLiveClosure.lean:8515-...`) is not a counting theorem: it needs two
explicit *positive* cross-memberships.  `P` provides an omission, the paired
case provides the opposite omission, and the fresh case negates the proposed
fresh-to-reverse-shell incidence.  Its hypotheses therefore cannot be
manufactured by the cover inequality.

## Existing abstract witnesses / bank check

Two inspected scratch artifacts directly block the proposed inference at the
appropriate abstraction level.

* `scratch/TriApexCardinalityCoverModel.lean` gives a decidable 17-point
  finite incidence shadow with cap sizes `(8,6,6)`, three robust apices,
  fourteen non-robust points, a four-row canonical cover, two distinct blocker
  classes, and the complete cross-omission rectangle.  It proves the numerical
  shadow `17 <= 4 * 14` while no positive cross-membership is present.
* `scratch/hard-branch-math/FullPacketIncidenceShadow.lean` is stronger for
  the packet route: it explicitly contains two q-deleted two-center packet
  shadows, all-large `(8,6,6)` caps, the canonical-cover inequality, and the
  rich-row intersection upper bounds.  Its source theorem records that the
  two off-cap row parts have size two and meet in exactly one point, while no
  three-hit/positive rich incidence is forced.  It deliberately omits full
  `CounterexampleData.Minimal` geometry, so it is only a finite-set shadow,
  not an E1 countermodel.

The mandated theorem-bank census was also inspected.  Its U5 families are
bounded incidence contradictions, but their inputs include explicit selected
row memberships / dangerous triples rather than a cover count
(`docs/general-n-certificate-bank-mining-2026-07-09.md:369-410`; concise
inventory `certificates/p97_rvol_general_n_mining.md`).  The focused fresh-arm
preflight at
`scratch/retained-omission-e1/round6-fresh-arm-shared-base/REPORT.md` reaches
the same interface boundary: its closest U2/U5 consumers require named base
memberships, which the chosen support `freshPacket.B₂` does not provide.

## First useful bridge

For the fresh constructor, the minimal non-vacuous bridge is a concrete
positive overlap/row identification, e.g. two named retained-base points in
`freshPacket.B₂` (or another theorem giving a positive intersection with the
actual reverse shell).  It must preserve the packet's q-deletion provenance.
For the paired constructor, an analogous bridge must turn an omission into a
new independently justified cross-membership; it cannot simply assume the
negation of `reverse_omission`.

Only after such a bridge gives lower hit counts in a bounded common domain
could the displayed pigeonhole inequality be used.  The current
`notRobustCover_card` cannot provide that bridge.
