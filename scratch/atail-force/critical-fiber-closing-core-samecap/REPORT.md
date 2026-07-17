# Critical-fiber closing-core same-cap producer audit

Date: 2026-07-17

Status: **EXACT SOURCE-FAITHFUL `sameCap` ROUTE NORMALIZED AND
KERNEL-CHECKED. THE PRODUCER IS NOT PROVED. IT IS REFUTED BY THE CURRENT
FINITE CRITICAL-MAP + `BothOff` CAP-LOCALIZATION ABSTRACTION, BUT NOT BY THE
FULL EUCLIDEAN PARENT. NO PRODUCTION `sorry` IS CLOSED.**

## Question

Start from

```lean
R : FrontierCommonDeletionParentResidual F
P : FrontierCommonDeletionCriticalFiber R
```

and the checked `BothOff` cap localization.  Determine the strongest honest
route to the production constructor

```lean
CriticalFiberClosingCore.sameCap P
```

under two non-negotiable provenance conditions:

1. the outside pair is the two actual sources of `P`; and
2. the second center is either `S.oppApex1` itself or an actual
   `H.centerAt J hJ` whose exact selected row contains both sources.

## Required theorem-bank preflight

Before defining the normalized route, this lane checked all registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean searches covered same-cap source-faithful bisectors, common
blocker fibers, exact common critical shells, two cap centers equidistant
from one outside pair, and actual critical rows through a common pair.

The relevant reusable declarations are consumers or local projections:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `ATailTwoCenterCapLocalization.false_of_two_cap_centers_equidistant_outside_pair`;
- `ATailCriticalFiberClosingCore.SameCapCollisionPairCore.false`;
- `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair`;
- the archived `samecap_wrongSide_*` family, which requires a named ordered-cap
  incompatible edge and endpoint-use data absent here.

No banked theorem derives a second source-realized center through the two
actual sources of a common critical fiber.  In particular, the U5
double-bisector consumers require a larger named incidence packet and do not
produce it from `P`.

## Kernel-checked exact normalization

`CriticalFiberClosingCoreSameCap.lean` defines two propositions for one fixed
chosen fiber.

### First-apex route

```lean
FirstApexSameCapRoute P
```

means that for one indexed cap:

```text
A := centerAt source1 is in the cap
O := S.oppApex1 is in the cap
source1 and source2 are both outside the cap
dist O source1 = dist O source2.
```

The distinction `O != A` is already supplied by
`P.commonBlocker_ne_firstApex`.

### Actual-row route

```lean
ActualRowSameCapRoute P
```

means that for one indexed cap and one actual source `J`:

```text
A and centerAt J are in the cap
centerAt J != A
source1 and source2 are both outside the cap
source1 and source2 are both in selectedAt J's exact support.
```

The main checked equivalence is

```lean
nonempty_sameCapCollisionPairCore_iff_sourceFaithfulRoute
    (P : FrontierCommonDeletionCriticalFiber R) :
    Nonempty (SameCapCollisionPairCore P) <->
      FirstApexSameCapRoute P or ActualRowSameCapRoute P.
```

The forward direction removes the apparent orientation freedom in
`SameCapCollisionPairCore`: whichever order the core uses, its pair is
definitionally normalized back to `P.source1.1,P.source2.1`.  The reverse
direction constructs the production core with exactly those two sources.

The parent-level adaptive target is

```lean
ParentSameCapRoute R :=
  exists P : FrontierCommonDeletionCriticalFiber R,
    FirstApexSameCapRoute P or ActualRowSameCapRoute P.
```

The checked theorem

```lean
nonempty_parentSameCapCore_iff_parentSameCapRoute
```

shows that this is exactly the existence of a sigma packet
`Sigma P, SameCapCollisionPairCore P`.  Finally,

```lean
nonempty_closingCore_of_parentSameCapRoute
```

embeds it through the production `sameCap` constructor without changing the
chosen fiber.  This is the narrowest exact coverage theorem for this side of
the closing contract.

## What the checked `BothOff` cap localization actually supplies

The localization does not reach either normalized route.

### Moser-vertex common blocker

For each of two adjacent caps it proves that the common shell has at most one
cap-side point and at least three outside points.  It proves only

```text
source1 outside or source2 outside.
```

It does not prove that **both actual sources** are outside the same cap.  It
also supplies neither `O`-equidistance nor an actual `J`-row through both
sources.

### Strict-interior common blocker

For the unique cap containing the blocker it gives:

```text
source1 outside
or source2 outside
or both sources inside and exactly exhaust the cap-side common shell.
```

Again, the two-outside-source case is not forced.  Even when that favorable
case happens, the localization gives no second source-realized center.

The two `BothOff` inequalities only say that neither source has the retained
frontier radius from `O`.  They neither imply nor refute equality of the two
distances from `O`; hence they do not decide the first-apex route.

## Exact finite regression

`BothOffSameCapFiniteBoundary.lean` is a kernel-checked finite incidence and
cap-localization model.  It is **not** a Euclidean counterexample to `R`.
It simultaneously retains:

- a total fixed-point-free blocker map;
- exact four-point rows and equal-support locking on blocker fibers;
- two distinct actual sources with one common blocker and one common exact
  support;
- membership of both sources in that support, the finite analogue of both
  prescribed deletions being critical at the blocker;
- a five-point retained robust class which remains four-large after every
  one-point deletion;
- both collision sources off that retained class;
- an interior modeled cap containing the common blocker;
- both actual collision sources outside that cap; and
- exactly two common-shell points outside the cap, namely the two sources.

Nevertheless, the checked theorem

```lean
no_sourceFaithfulSameCapSecondCenter_checked
```

proves that no second center in the modeled cap is both distinct from the
common blocker and source-faithful.  Here source-faithful has exactly the two
permitted forms:

```text
the robust center itself contains both sources in its row
or
the center is blocker J and criticalSupport J contains both sources.
```

Thus even the favorable interior/two-actual-sources-outside subcase does not
produce `sameCap` from the current finite critical-map and cap-localization
surface.

## Classification and contract verdict

- **PROVED:** the exact fixed-fiber and adaptive-parent normalization of the
  production `sameCap` constructor.
- **PROVED:** either normalized route is already terminal through the existing
  production consumer.
- **REFUTED WITHIN THE CURRENT FINITE ABSTRACTION:** deriving either route
  from blocker-fiber incidence, exact-support locking, deletion robustness,
  `BothOff`, and the favorable cap-localization data alone.
- **UNRESOLVED FOR THE FULL EUCLIDEAN PARENT:** `ParentSameCapRoute R`.

The precise missing lemma, if this branch is retained, is therefore

```lean
ParentSameCapRoute R
```

and its proof must use full geometry absent from the regression: actual
cyclic cap order, MEC placement/full radius filters, no-`IsM44`, or another
new global coupling theorem.  It cannot be obtained by another anonymous
outside-pair extraction or by scanning the current critical rows.

No correction to the production `CriticalFiberClosingCore` contract is
needed: its `sameCap` constructor already has the right provenance.  The plan
should, however, stop treating the checked `BothOff` cap localization as a
likely producer of that constructor.  `sameCap` is an optional terminal
available only after proving `ParentSameCapRoute R`; otherwise the active
`BothOff` work must pursue the ordered constructor or direct `False`.

## Validation and scope

Both owned Lean files elaborate without `sorry`, `admit`, declared axioms,
`native_decide`, unsafe code, or linter suppression.  Every printed theorem
has axiom closure contained in:

```text
propext
Classical.choice
Quot.sound
```

Only files under
`scratch/atail-force/critical-fiber-closing-core-samecap/` were created.  No
production file, plan document, generated blueprint, protected unique-row
artifact, `SurplusM44`, or shell-curvature file was modified.
