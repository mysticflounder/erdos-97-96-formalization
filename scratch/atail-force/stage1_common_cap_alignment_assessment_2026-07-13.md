# ATAIL Stage-I common-cap alignment assessment

Date: 2026-07-13

## Verdict

The published K-A-PAIR/live binders do **not currently prove** that `p` and
`rows.uRow.center` lie in one indexed cap.  The checked positive boundary is
an exact dichotomy:

```text
URowCommonCapAlignment
or URowSeparatedCapPlacement.
```

The first branch is the requested Stage-I sublemma.  The second branch gives
individual cap witnesses for both points, proves their indices differ, and
records that no indexed cap contains both.  No current contradiction consumer
accepts that separated packet.  Thus the exact missing geometric antecedent
is an exclusion or refinement of `URowSeparatedCapPlacement`, using data not
present in the cap-incidence boundary: the MEC disk/frame, exact full-radius
filters, all-center `K4`, critical deletion, or no-`M44` coupling.

This is a dependency result, not a refutation of the full live theorem.

## Checked actual-type boundary

`stage1_common_cap_alignment_boundary.lean` works directly with
`SurplusCapPacket D.A`, `U3FixedTriplePacket`, and the supplied
`CriticalSourceRows`.  It proves:

- `commonCapAlignment_or_separatedCapPlacement`;
- `leaf_commonCapAlignment_or_separatedCapPlacement`, specialized to the
  exact `leafSurplusPacket` used by K-A-PAIR;
- `separatedCapPlacement_iff_not_commonCapAlignment`; and
- `commonCapAlignment_of_not_separatedCapPlacement`.

The proof uses the already-checked carrier facts
`exists_capByIndex_for_p` and `exists_capByIndex_for_uRow_center`.  It does not
abstract `p` or the row center to fresh labels.  All three printed axiom sets
are exactly `propext`, `Classical.choice`, and `Quot.sound`.

The result also identifies why the separate witnesses cannot simply be
rewritten to one index: on the separated branch their indices are provably
unequal.  `exists_secondLargeCap_of_noM44` cannot remove this branch because
its conclusion is only a cap-cardinality witness and contains no membership
of either center.

## Kernel-checked finite separation

`stage1_common_cap_incidence_countermodel.lean` supplies a `Fin 12` model with
three closed caps

```text
C0 = {1,2,3,4,5}
C1 = {0,2,6,7,8}
C2 = {0,1,9,10,11}.
```

Every cap has cardinality five, their cardinality sum is `12 + 3`, every
carrier label lies in at least one cap, and every pair of distinct caps meets
in exactly one Moser-vertex label.  With

```text
p          = 0
u-center   = 4
dangerous  = {1,2,3,4}
u-support  = {1,5,6,8}
u          = 5,
```

Lean checks all of the following:

- both exact row supports have cardinality four;
- the row center differs from `p` and is absent from its support;
- `u` belongs to its support and lies outside the dangerous class;
- `u-support` meets the dangerous class in one point and has at least two
  points outside it;
- every cap containing the row center meets `u-support` in at most two points,
  hence leaves at least two support points outside; and
- `p` and the row center each have a cap witness, but no cap contains both.

The aggregate theorem
`current_cap_incidence_boundary_is_satisfiable` and the explicit
`no_common_cap` endpoint are kernel-checked with only the standard core
axioms.  This strengthens the earlier finite-shadow observation into a small
Lean theorem: cap coverage, closed-cap arithmetic, and the currently used
selected-row incidence bounds do not imply ALIGN.

The countermodel does **not** assert Euclidean realizability, strict
convexity, an MEC frame, exact full-radius filters, global `K4`, a quantified
critical-shell system, or no-`M44`.  It therefore shows exactly where a new
proof must use stronger geometry; it is not a K-A-PAIR counterexample.

## Provenance audit

The outer Route-B wrapper constructs all five rows from one chosen
`CriticalShellSystem`, and `live_critical_provenance.lean` retains that fact.
The published `DoubleApexOffSurplusSharedRadiusPair` signature instead accepts
`rows` and `Nonempty (CriticalShellSystem D.A)` independently.  Restoring the
constructor equality is necessary for arguments about blocker fibers and
same-center support rigidity, but it does not itself locate either blocker
center in a cap.  In particular, common provenance cannot collapse the two
cap indices without an additional geometric theorem.

## Required theorem-bank preflight

Before deriving the boundary, the following registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for common/shared cap placement, two-point cap
membership, source-center cap localization, and same-cap second centers.  The
closest declarations are:

- individual carrier coverage by an indexed cap;
- `selectedFourClass_inter_capByIndex_card_le_two`;
- `outsidePair_unique_capCenter`; and
- `DangerousRowSameCapSecondCenter` and the MEC/order cores, all of which take
  their placement or row-pattern fields as hypotheses.

No banked declaration produces a shared cap for these two live centers, and no
already-consumed theorem accepts `URowSeparatedCapPlacement` alone.

## Next theorem

The next honest ALIGN theorem must have one of these shapes:

```text
not URowSeparatedCapPlacement S p q t1 t2 t3 u rows
```

or

```text
URowSeparatedCapPlacement S p q t1 t2 t3 u rows
  -> HasGlobalNestedPairProducer ...
     or MECStraddlingRowCore.Core ...
     or another exact named consumed packet.
```

Proving another individual cap witness, another cap-cardinality lower bound,
or a row/support complement estimate cannot discharge this branch.

## Rigor labels

- **PROVEN / kernel-checked:** the actual-type dichotomy, its equivalence to
  failure of common alignment, and the finite cap-incidence countermodel;
- **PROVEN dependency boundary:** the currently used cap-incidence facts do
  not imply common-cap alignment;
- **NOT CLAIMED:** a counterexample to the full Euclidean/live K-A-PAIR
  theorem; and
- **CONJECTURED:** the omitted MEC/full-filter/all-center-`K4`/no-`M44`
  geometry excludes the separated branch or maps it into a checked consumer.
