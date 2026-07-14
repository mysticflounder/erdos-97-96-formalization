# ATAIL Stage-I aligned-incidence assessment

Date: 2026-07-13

## Verdict

The weakest direct Stage-I packet is now explicit and kernel-checked in
`stage1_aligned_incidence_boundary.lean`.  It is exactly
`LiveArcOvertakeFields` with the independent cyclic-order field removed:

```text
choose dangerous labels A,C,D,E;
centerAt(p) = A and C lies in the selected p-critical support;
uRow.center = D and A,E lie in uRow.support.
```

The checked projection proves that this packet already implies

```text
|uRow.support intersect {q,t1,t2,t3}| = 2.
```

The lower bound comes from the named hits `A,E`; the reverse bound is the
two-circle intersection theorem, since the dangerous permutation also forces
the `u`-row center to differ from `p`.  Adding the cyclic field reconstructs
`LiveArcOvertakeFields` definitionally.
Thus Stage I should target this packet (or an exact named consumed alternate),
not merely the numerical lower bound.

No derivation of this packet from the present pair/live hypotheses was found.
More sharply, `stage1_one_hit_incidence_countermodel.lean` kernel-checks a
finite common-provenance incidence model in which every Stage-I incidence
alignment above holds **except** the second `u`-row hit.  The `u`-row
intersection with the dangerous base has cardinality exactly one.  Therefore
common provenance plus the current exact-row incidence consequences cannot
force the missing hit.

This is not a counterexample to the live geometric theorem.  It proves a
precise dependency statement: any proof of the second hit must visibly use
metric/MEC/cap/no-`M44` geometry omitted by the incidence abstraction, or
produce an already-consumed alternate.

## Required theorem-bank preflight

Before introducing either checked file, the following required registries
were inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling-bank and U5-incidence sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for critical-row/dangerous-class intersection
lower bounds, same-center common supports, blocker-center localization,
no-removable/cap intersection, and source membership.  The closest declarations
are:

- `U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two`;
- `U5QAllowedK4Class.not_dangerous_triple_subset_of_ne_center`;
- `U5QCriticalTripleClass.two_triple_points_incompatibility`;
- `SelectedFourClass.inter_card_le_two`;
- `CriticalShellSystem.source_mem_selectedFourClass`; and
- `CriticalShellSystem.selectedFourClass_support_eq_shell`.

These are upper bounds, rigidity transports, or contradiction consumers whose
positive incidences are hypotheses.  None produces a second dangerous hit or
localizes the p-critical blocker center in the dangerous base.

## Exact live interface boundary

`DoubleApexOffSurplusSharedRadiusPair` receives the following relevant inputs:

```text
hcritical : Nonempty (CriticalShellSystem D.A)
rows      : CriticalSourceRows D q t1 t2 t3 u
hlocalNoQFree, hfixed, H
the MEC/cap/two-large-cap/no-M44/cardinality fields.
```

The `rows` and `hcritical` arguments are independent on this signature.  The
outer construction can retain the stronger provenance equality saying that
all five rows came from one chosen system.  The countermodel below assumes
that stronger equality anyway, so restoring provenance is useful for a live
proof but cannot by itself create the second hit.

The formalized Stage-I packet deliberately remains faithful to the existing
pair surface: the critical row selected for source `p` and the supplied
`u` row need not come from the same system.  It asks only for the exact
incidences consumed downstream.

## Kernel-checked one-hit countermodel

The finite carrier is `Fin 12`, with live labels

```text
p=0, A=t2=1, C=t1=2, D=q=3, E=t3=4, u=5,
B={1,2,3,4}.
```

The five distinct row supports are

```text
center 0: {1,2,3,4}
center 1: {0,2,6,7}
center 2: {3,8,9,10}
center 3: {1,5,6,8}
center 4: {0,5,9,11}.
```

The common blocker assignment is

```text
source 0      -> center 1
sources 1..4 -> center 0
source 5      -> center 3
sources 6,7  -> center 1
sources 8..10 -> center 2
source 11     -> center 4.
```

Lean checks all of the following by kernel reduction:

- every support has cardinality four;
- every source lies in its selected support;
- no center lies in its selected support;
- sources with the same blocker center have identical supports;
- supports at distinct centers intersect in at most two points;
- the four dangerous supplied rows are the common center-`p` row;
- the supplied `u` row is the same row selected by the common system;
- the p-critical row is centered at `A` and contains `C`; and
- the u-row is centered at `D` and meets `B` exactly in `{A}`.

Consequently both

```text
not (2 <= |uRow.support intersect B|)
```

and the absence of any second dangerous support member distinct from `A` are
kernel theorems in this abstraction.

The model does **not** assert Euclidean realizability, full radius-filter
exactness, convex independence, the MEC frame, cap definitions, or no-`M44`.
It therefore does not separate those omitted geometric fields individually.
It does separate all of them collectively from the already-exhausted
incidence/common-provenance route.

## Live MEC/no-`M44` dependency cut

The cap-facing fallback has already been formalized in
`outside_source_cap_multiplicity.lean`; no new consumer adapter is needed.
For any `SurplusCapPacket S` on the live carrier,
`current_KA_outsideSource_boundary` proves all of the following from
`hfixed`, `hlocalNoQFree`, `rows`, and `H`:

```text
u is a carrier source outside B = {q,t1,t2,t3};
u belongs to uRow.support;
uRow.center is a carrier point different from p;
2 <= |uRow.support \ B|;
exists kp, p in cap[kp];
exists kc, uRow.center in cap[kc];
for every k containing uRow.center,
  |uRow.support intersect cap[k]| <= 2 and
  2 <= |uRow.support \ cap[k]|.
```

The first missing live antecedent is therefore not cap coverage.  It is the
index identification

```text
exists k,
  p in cap[k] and uRow.center in cap[k].
```

The present library gives independent witnesses `kp` and `kc`; no theorem in
the MEC/cap sources or the three required theorem-bank registries proves
`kp = kc` for this live pair.  In particular,
`exists_secondLargeCap_of_noM44` uses no-`M44` only to produce a second cap
whose cardinality is at least five.  Its conclusion contains no membership
information about `p`, `uRow.center`, or `uRow.support`.  The ordered-cap row
bound `selectedFourClass_inter_capByIndex_card_le_two` starts only after the
center-membership premise has already been supplied.  The card-eleven
`IsM44` exact-hit theorems are unavailable on this branch because `IsM44` is
the explicitly negated exit.

Even after common-cap placement, a second field is needed:

```text
uRow.support \ B subset cap[k].
```

Together these are exactly the already-defined proposition
`URowCommonCapOffDangerousConfinement`.  The checked theorem
`uRowCapMultiplicity_of_commonCap_offDangerousConfinement` turns it into
`URowCapMultiplicityFields`; the checked same-cap consumer then yields
`DangerousRowSameCapSecondCenter` and `False`.  A fresh Lean check of
`outside_source_cap_multiplicity.lean` exits successfully, and all printed
endpoint axiom sets are exactly `propext`, `Classical.choice`, and
`Quot.sound`.

Thus the producer plan is a two-step geometric lift, in dependency order:

1. prove common-cap placement for `p` and `uRow.center`, or emit a named
   alternate when it fails;
2. on that common cap, prove off-dangerous confinement, or emit a named
   alternate when it fails.

The combined producer theorem is genuine new global geometry.  More mining
rounds are not needed to state or wire it, and marginal cap-count lemmas
cannot substitute for either coupling field.

## Next Stage-I theorem

The next load-bearing result should have the following shape on the actual
outer live surface:

```text
LiveArcOvertakeStageOneFields
or an exact existing five-row/global-nested-pair/cap alternate.
```

Its proof must use at least one omitted geometric ingredient.  Proving only
the cardinal lower bound is not the complete endpoint: the same hit must be
the p-critical center `A`, the p-critical support must contain another
dangerous point `C`, and the `u`-row center must be the dangerous point `D`.
The checked Stage-I structure is the faithful bundle of those requirements.

## Validation

Direct single-file Lean checks passed for both new files.  Their printed axiom
sets contain only `propext`, `Classical.choice`, and `Quot.sound`; neither file
contains `sorry`, `admit`, or `native_decide`.

Epistemic labels:

- **PROVEN / kernel-checked:** the Stage-I packet projection and finite
  incidence countermodel;
- **PROVEN dependency boundary:** common provenance and exact-row incidence
  consequences alone do not imply the second hit;
- **NOT CLAIMED:** a counterexample to the live Euclidean theorem;
- **CONJECTURED:** the remaining live MEC/cap/full-filter/no-`M44` data force
  the Stage-I packet or a named alternate.
