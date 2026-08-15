# Exact-12 v14 wave `86017f66` +100 general-theorem search (2026-08-09)

## Scope and status

This report classifies the final 100 authenticated journal records from each
of the twelve exact-12 v14 cells in the `86017f66` wave.  It is a
wave-boundary theorem search, not a terminal bank, an all-cell coverage proof,
an UNSAT result, or a live Lean closure.

The searched suffix contains exactly 1,200 learned records: 100 from each
cell.  The suffix index ranges are:

| cell | record indices | journal SHA-256 |
|---:|:---:|:---|
| 0 | 400–499 | `2526838af05fabb0423b656acbc176afc0ce775b8d234a2baf9e82be8a2c7596` |
| 1 | 791–890 | `c8d51178bed39da975093d9099921150bdcab7b5fa7743dacda841d4530758e8` |
| 2 | 362–461 | `f2fdf4b5b4606496400a09f19e424cee41a525d14baad6454ec7fcc9d140e0d6` |
| 3 | 400–499 | `0d37775099b4b39472e856ad447b4a96d4e758fcf740192cb578dd49045a080f` |
| 4 | 800–899 | `2a7c8cf4d69a65fb16af6eb28d86bb89a0542efdc35e63b0b794ba9d137a9199` |
| 5 | 380–479 | `74b3e6f2f606cd69ebb879530e75c89e0268d5aa816d4ae0e26295c42280f2cd` |
| 6 | 400–499 | `84a66bef0a887c9c0911d09aeba53bea6a6ab79ee39466cd0bd0a932d8c64e19` |
| 7 | 400–499 | `5205f5ab8efa373b85689636a62b5be92693b3749679727f10a2bba6feec95cc` |
| 8 | 371–470 | `58a3ee75f203568451866e6ba70e1974c5af929f8508cf496bd0cfb7a83774d6` |
| 9 | 400–499 | `f69382c382253c3767dfd2ebf1373e411415d0ab732e4c36e42a74fe0ffb713c` |
| 10 | 632–731 | `8686318e2f3d00446c7dcb0cd065d2bb4d822c39c88b9f45533efd3205a14243` |
| 11 | 360–459 | `a7508a34f4bc8a1a3060d70db759206b9cf4276ef8b928af4566c72726294982` |

The journal digests authenticate the complete current files, while the index
ranges identify the searched suffixes.

## Classification

| detector stage | records | existing general Lean consumer |
|:---|---:|:---|
| `equality-duplicate-center` | 1,145 | `Census554.not_realizes_of_duplicateCenterCore`; also the faithful-carrier bank consumer in `GenericRowNogoodCertificate` |
| `equality-equilateral-bisector-collision` | 24 | `Census554.not_realizes_of_equilateralBisectorCollisionCore` |
| `equality-perpendicular-bisector-convex` | 22 | `Census554.false_of_convexIndep_of_perpBisectorCore` |
| `equality-three-triad-collision` | 7 | `Census554.not_realizes_of_threeTriadCollisionCore` |
| `equality-six-point-five-circle-collision-b` | 1 | `Census554.not_realizes_of_sixPointFiveCircleCollisionCoreB` |
| `source-order-positive-coverage` | 1 | the existing exact-12 source-order positive-coverage consumer and its convex-five-point core arm |

All five structural families are already explicit arms of
`Census554.MetricCoreAlternative`, and
`Census554.false_of_metricCoreAlternative` is the general arbitrary-carrier
consumer.  Thus this wave does **not** expose a missing local geometry theorem
or a missing metric-core consumer.

The most common literal frozen-label duplicate-center core occurred 24 times:

```text
centers = [2, 4]
triple  = [0, 1, 3]
```

The next two occurred 21 and 18 times respectively:

```text
centers = [3, 4], triple = [0, 1, 5]
centers = [1, 3], triple = [0, 2, 6]
```

These repetitions are useful producer hints only.  The comparison is on
literal frozen labels; no source-entitled role transport or symmetry lift was
proved by this search.

## Consequence for the live Rigid221 arm

The new source-clean `nextRowOnlyHit` normalization produces either:

1. an exact-eleven five-row `FiveSurvivorFaithfulCarrierBoundary`; or
2. the explicit reciprocal `xu`/next-row collision.

The recent computational wave says that the distinct faithful-carrier arm
should target `Census554.MetricCoreAlternative`, not another new geometric
consumer.  What remains missing is a **source producer** from the live five-row
boundary (plus any source-entitled role/order data) to one of those metric-core
arms.  The collision arm still needs an independent reciprocal-row terminal.

Accordingly, the next theorem work is:

* retain the faithful-carrier boundary as the general consumer interface;
* mine or prove a positive-core producer expressed in its vocabulary;
* separately search the reciprocal `xu` collision against pinned-multiplicity,
  duplicate-center, and third-bisector terminals;
* do not interpret the 1,200 learned cuts as exact-12 coverage or universal
  closure.

## Next source-faithful finite contract

The existing v14 job is not automatically a consumer for the new five-row
boundary.  Its distinguished rows are tied to the older frozen source roles,
whereas `FiveSurvivorFaithfulCarrierBoundary` chooses arbitrary exact
`q`-deleted K4 witnesses at five source-proved centers.  Reusing v14 coverage
without an additional row-identification theorem would therefore be an
unsound ingress shortcut.

The smallest finite predicate justified by the boundary is instead:

```text
FrozenFiveOmissionBoundary(row, deleted):
  blocker : Label
  centers : Finset Label
  |centers| = 5
  blocker != deleted
  blocker not in centers
  deleted in row[blocker]
  for every center in centers, deleted not in row[center]
```

This records exactly the pinned-multiplicity information proved on the source
side: five distinct surviving rows omit the deleted point, while its distinct
actual blocker row contains it.  The corresponding Lean adapter is being
added in `ExactTwelveRigid221SourceSafeIngress.lean`.  Its source-facing wrapper
must supply both `FrozenSafeCubeOK` and the omission boundary for the same
faithful pattern and labeling; two unrelated existential labelings cannot be
combined into one finite instance.  It must be green before an encoder or
search starts.

The smallest safe finite implementation uses the generic source-faithful
exact-twelve selected-row surface, not the v14 compiler.  Enumerate
`deleted = d`, `blocker = b != d`, and five centers chosen from the eleven
labels other than `b`; this gives `12 * 11 * choose(11,5) = 60,984` possible
witness triples.  Replay the exact predicate `d in row[b]` and
`d not in row[c]` for every chosen center.  In particular, do not add
`d not in centers`: the Lean boundary does not prove it.  A direct encoding
must use explicit witness variables and independently replay the decoded
witness; the existing one-way `CoverInstance.pattern_variable` helper is not
a biconditional.  A bounded complete-cube post-filter is the lower-risk first
canary.

A terminal computational result must then replay to a named
`Census554.MetricCoreAlternative` for the same faithful carrier pattern.  SAT,
job-coordinate coverage, or a bank of unrelated v14 cuts is not that producer.
The reciprocal `xu` collision remains a separate theorem lane: no existing
source-clean reciprocal, pinned-multiplicity, duplicate-center, or
third-bisector terminal consumes its present hypotheses.

The follow-up indexed theorem-bank search found two superficially nearby but
inapplicable results.  The robust first-apex theorem
`blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives`
needs a separate double-deletion survival packet and only recovers blocker
equality from reciprocal membership; it supplies no contradiction for the
collision already in hand.  The finite-map theorem
`third_fiber_or_larger_known_fiber_of_three_omissions` needs three values
omitted globally by one self-map plus two known collision fibers.  A single
deleted source omitted from five selected rows is not such a global omission
statement.  Neither theorem closes or directly strengthens either branch.
