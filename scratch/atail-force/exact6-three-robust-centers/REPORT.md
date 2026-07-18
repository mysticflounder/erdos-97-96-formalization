# Exact-six three-robust-centers audit

Date: 2026-07-18

Status: **THE THIRD ROBUST CENTER DOES NOT CLOSE THE NONTRIVIAL
MINIMAL-DELETION-CORE ARM AT THE FINITE/ORDERED-INCIDENCE LAYER. A NEW
KERNEL-CHECKED FINITE BOUNDARY RETAINS THREE DISTINCT OMITTED CARRIER
CENTERS, TWO DISJOINT FOUR-POINT CLASSES AT THE FRESH CENTER, EXACT CAP SIX,
THE TOTAL SOURCE-FAITHFUL CRITICAL MAP, TWO-CIRCLE/CAP INTERSECTION BOUNDS,
AND SELECTED-ROW MINIMALITY. IT STILL HAS NEITHER EXISTING TERMINAL
ANTECEDENT. NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-three-robust-centers/`. It does not edit
production Lean, closure documents, proof-blueprint state, git state,
`ShellCurvature`, `SurplusM44`, or protected card-five/555/654 files.

## Exact live question

The checked exact-six minimal-core normal form proves that a nontrivial
`MinimalDeletionCore D.A V center` makes `center` fully deletion-robust. The
full parent already carries deletion robustness at both physical apices.
This audit asks whether the resulting three robust centers force a terminal
contradiction through the total `CriticalShellSystem`.

There is an important preliminary split.

- The core theorem proves `center != S.oppApex2`.
- It does **not** prove `center != S.oppApex1`. The first apex is outside the
  deleted strict-interior physical set, so the global-minimality constructor
  does not exclude it as the fresh center.

Thus the live output does not unconditionally contain three distinct robust
centers. If `center = S.oppApex1`, it returns to the existing bi-apex robust
surface without adding another omitted blocker value. The finite boundary
below tests the stronger genuinely-three-distinct branch.

## Required theorem-bank preflight

Before deriving a new finite incidence object, this lane checked every
registry required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered three robust centers,
three omitted blocker values, large blocker fibers, exact cap six,
minimal-deletion cores, shared outside pairs, and distinct actual centers
through a prescribed source pair. The relevant current production results
are:

- `FullyDeletionRobustAt.centerAt_ne`;
- `FullyDeletionRobustAt.exists_distinct_sources_same_blocker`;
- `second_fiber_or_larger_first_fiber_of_two_omissions`;
- `FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber`;
- `qBlockerFiber_card_le_four`;
- `SameCapCollisionPairCore.false`; and
- `CapSelectedRowCounting.outsidePair_unique_capCenter`.

No indexed theorem consumes three omitted blocker values themselves. The
multi-center certificate bank also remains inapplicable: it lacks the live
geometric realization/persistence bridge recorded in the bank registry.

## Kernel-checked strengthened boundary

`ThreeRobustCentersFiniteBoundary.lean` uses fourteen labels and the existing
exact-six `(5,6,6)` cap profile. Its three robust-center labels are:

```text
firstApex   = 0
secondApex  = 1
freshCenter = 10.
```

All three are distinct and omitted by the total blocker map. The fresh center
lies in the four-point strict interior of the physical six-point cap and is
outside the physical exact-five radius class, matching the live location
available after deleting the physical vertices.

The boundary adds a two-source core `{3,4}` with two disjoint exact-size-four
supports at the fresh center:

```text
freshShellOne = {1,3,11,12}
freshShellTwo = {0,4,5,9}.
```

Each source lies in its own shell, the other source lies outside it, both
shells omit the fresh center, and deleting any one carrier label leaves an
entire four-point shell. This is exactly the finite deletion-survival content
used by

```lean
fullyDeletionRobustAt_of_minimalDeletionCore_card_ge_two.
```

The fixture simultaneously retains:

- one source-faithful exact four-point critical row at every represented
  center;
- total blocker support locking and source membership;
- exact `(5,6,6)` cap cardinalities and the physical exact-five class;
- five-point deletion-robust classes at both physical apices;
- cap two-hit bounds for every critical row;
- intersection at most one for distinct critical rows;
- intersection at most two between either fresh shell and every distinct
  critical row and both physical five-point classes; and
- the selected-witness consequence of global minimality: every nonempty
  row-closed set is the whole carrier.

## Blocker multiplicity is already exhausted

Three omitted values add only blocker-fiber deficiency. In this boundary the
map has substantially more multiplicity than the weakest theorem can force:

```text
fiber 2  has cardinality 4
fibers 3, 5, and 13 each have cardinality 2.
```

This saturates the exact critical-shell upper bound of four on one fiber and
also provides three additional nontrivial fibers. Hence a stronger finite-map
classification into “one four-source fiber / one three-source plus one
two-source fiber / three two-source fibers” would still be nonterminal. It
would merely describe cases already realized here.

The file then kernel-checks both relevant failures:

```lean
no_repeatedOutsidePair_checked
no_twoCriticalCentersThroughCorePair_checked
```

So even with maximal blocker multiplicity:

1. no two distinct same-cap critical centers have the two common outside
   points needed by `outsidePair_unique_capCenter`; and
2. the two unequal-radius core sources do not occur together in critical
   rows at two distinct centers, so `SameCapCollisionPairCore.false` cannot
   fire.

This is why the lane does **not** introduce a three-omission multiplicity
adapter. Such an adapter would have no immediate geometric consumer and the
checked boundary already realizes its strongest possible fiber shapes.

## Sharp remaining input

The nontrivial minimal-core arm needs information absent from the finite
critical-map/order projection. A terminal theorem must visibly use at least
one of:

1. nonlinear Euclidean/full-radius information coupling one fresh-center
   shell to a distinct actual critical center;
2. MEC/non-obtuse support-triangle geometry that forces two members of one
   fresh shell outside a common cap containing another center;
3. the full `R.noM44` hypothesis to construct a forbidden support triangle;
   or
4. a genuinely global minimality theorem stronger than selected-row closure,
   forcing either repeated use of a prescribed pair or a proper witness-closed
   carrier subset.

The smallest positive endpoint remains one of the two existing terminals,
not a new packet:

- force a repeated outside pair at two distinct same-cap actual centers; or
- force the two nontrivial-core sources onto a row at a second actual center
  with the required cap placement.

Until a theorem supplies one of those through full Euclidean/MEC/`noM44`
data, the third robust center is a regression-tested nonterminal return.

## Validation

The owned Lean file was elaborated directly as an isolated scratch module
against the current production oleans with warnings treated as errors:

```text
cd lean
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/exact6-three-robust-centers/\
ThreeRobustCentersFiniteBoundary.lean
```

The command exited successfully. Every printed theorem has axiom closure
contained in:

```text
propext
Classical.choice
Quot.sound
```

The owned source contains no `sorry`, `admit`, declared axiom,
`native_decide`, or unsafe declaration. The finite decisions use kernel
`decide`, with a local heartbeat allowance for the bounded quantifiers.

Epistemic status:

- **PROVEN / KERNEL-CHECKED:** every declaration in the owned Lean file.
- **EXACT WITHIN THE DISPLAYED FINITE INCIDENCE/CAP/ORDER ABSTRACTION:** the
  three-center compatibility and absence of both terminal antecedents.
- **NOT CLAIMED:** Euclidean realizability, a `CounterexampleData` model, the
  quantified `noM44` parent, or closure of the exact-six minimal-core arm.
- **PRODUCTION `sorry` CLOSED:** none.
