# Global-mutual third-source producer audit

Date: 2026-07-18

Status: **THE REQUESTED THIRD-SOURCE ROW IS NOT FORCED BY THE COMPLETE
CURRENT FINITE PROJECTION OF THE FULL-PARENT EQUAL-BLOCKER ARM. A NEW
KERNEL-CHECKED 14-LABEL REGRESSION RETAINS BOTH CAP-SIX BOUNDS, BI-APEX
DELETION ROBUSTNESS, THE EXACT MUTUAL/EQUAL-BLOCKER SOURCE IDENTITIES,
SUPPORT LOCKING, PHYSICAL-CAP DISTANCE INJECTIVITY, AND THE SELECTED-ROW
STRONG-CONNECTIVITY CONSEQUENCE OF GLOBAL MINIMALITY, WHILE NO DISTINCT
BLOCKER ROW CONTAINS THE FIBER PAIR. THIS IS NOT A EUCLIDEAN COUNTEREXAMPLE;
THE REAL FULL-GEOMETRY THEOREM REMAINS OPEN. NO PRODUCTION `sorry` IS
CLOSED.**

This lane owns only
`scratch/atail-force/global-mutual-third-source-producer/`. It does not edit
production Lean, closure docs, proof-blueprint state, git state,
`ShellCurvature`, `SurplusM44`, or the exact-five producer lanes.

## Exact target

The input is the equal-blocker outcome

```lean
M : FullParentExactFiveMutualData L profile
Q : FullParentMutualEqualBlockerShell M
```

with production fiber `Q.criticalFiber`.  Write its two actual sources as
`u,p` and their common blocker as `a`.  The proposed smallest terminal
producer asks for a genuinely third source `J` such that

```text
u,p are both in selectedAt J's exact support;
centerAt J != a; and
some indexed cap contains a and centerAt J while excluding u and p.
```

Those fields instantiate the existing
`CriticalFiberClosingCore.sameCap` / `SameCapCollisionPairCore.false`
consumer directly.  No new packet or conditional consumer is needed.

## Required bank preflight

Before constructing the regression, this lane checked every theorem-bank
registry required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered a third actual
critical source through an equal-blocker pair, source-indexed common-pair
centers, same-cap outside-pair consumers, and global minimality producers.
The nearest declarations remain:

- `ATailCriticalFiberClosingCore.SameCapCollisionPairCore.false`;
- `ATailRetainedCollisionCapLocalization.actualRow_center_eq_commonBlocker_of_sameCap_outside_sources`;
- `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair`;
- `ATailBiApexBlockerMultiplicity.FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber`;
- `ATailLargeCapUniqueFiveCommonDeletionNormalForm.exists_third_commonDeletionSource`; and
- the global-minimal-deletion scratch trichotomy.

None produces the requested row for this source pair.

Two apparent matches have the wrong polarity:

1. `exists_third_commonDeletionSource` produces a third point outside one
   actual critical support, so its deletion preserves K4.  It does not put
   the old pair in the third point's actual row.
2. The retained-radius third-center theorems require the pair to be
   co-radial from the first apex.  The checked full MEC/cap theorem
   `equalBlocker_firstApex_dist_ne` proves that this exact-five pair has
   unequal first-apex distances.

## Kernel-checked finite boundary

The new artifact is `ThirdSourceFiniteBoundary.lean`.  It is an exact finite
incidence/cap model, not a Euclidean realization.  Its labels retain the
actual source roles:

```text
deleted = 3
unused source = 4
continuation first/second = 3,11
mutual partner = 12
common blocker = 6.
```

### Full parent-facing finite surface

The checked model simultaneously retains:

- a 14-point carrier with cap profile `(5,6,6)` and the exact three endpoint
  overlaps;
- both opposite-cap lower bounds `6`;
- two five-point physical-apex classes, each surviving every one-point
  deletion;
- exact four-point apex rows after deleting the mutual endpoint;
- a total fixed-point-free blocker map omitting both physical apices;
- one exact four-point selected row for every carrier center;
- own-source membership and equal-blocker support locking;
- the actual equal-blocker fiber `unusedSource,partner`;
- mutual omission of `deleted` from both equal-blocker rows and omission of
  `partner` from the deleted source's row;
- the exact physical-cap roles: the unused source is in the cap but off the
  physical radius class, while the deleted point, continuation sources, and
  partner are physical vertices;
- the one-hit intersection between the common critical support and the
  physical-vertex set;
- a favorable nonphysical cap already containing the common blocker while
  excluding both fiber sources;
- an injective finite rank on the physical cap, mirroring the proved
  first-apex distance injectivity used by `EqualBlockerTerminal.lean`; and
- a constructive Hamiltonian selected-row cycle.  Consequently every
  nonempty row-closed subset is the full carrier, the exact selected-witness
  consequence of global minimality.

The strong-connectivity proof is not a brute-force subset assumption.  Lean
checks the Hamiltonian cycle and derives row closure constructively.

### Exact negative result

The kernel checks both

```lean
no_distinctBlocker_row_contains_equalBlockerPair_checked
no_sameCapThirdSource_checked.
```

The first is stronger than the requested incidence negation: the common
blocker's row is the only actual critical row containing both fiber sources.
The second records the complete absence of the desired genuinely third
same-cap source.

Thus the following data do **not** force the producer:

```text
cap cardinalities
+ two-apex deletion robustness
+ exact source names and mutual omission
+ total critical-map support locking
+ physical-cap distance order
+ selected-row strong connectivity/minimality projection.
```

## What the regression does and does not prove

**PROVED / EXACT WITHIN THE DISPLAYED FINITE ABSTRACTION:** every field listed
above is compatible with the absence of a third row through the pair.

**NOT PROVED:** a Euclidean `CounterexampleData` realization, compatibility
with all strict Kalmanson inequalities, the minimum-enclosing-circle metric,
or the quantified production hypothesis `R.noM44` over every possible
support triangle.

Therefore the actual theorem

```lean
false_of_fullParentMutualEqualBlockerShell Q : False
```

is not refuted.  What is refuted is any proof that merely projects the parent
to the finite fields above and then invokes support counting, blocker
multiplicity, selected-row closure, or another generic minimal-deletion
adapter.

## Exact next omitted ingredient

The next proof must visibly use an unprojected global geometric fact.  The
smallest honest possibilities are:

1. a nonlinear MEC/cap-order theorem forcing the pair to recur as an exact
   radius pair at a second actual blocker and locating that blocker with the
   common blocker in a nonphysical cap; or
2. a direct use of the quantified `R.noM44` hypothesis on a newly constructed
   support triangle which makes the equal-blocker configuration impossible.

Global K4/minimality by itself is exhausted at the row-closure surface: it
forces reachability, not reuse of a prescribed unordered pair.  Likewise,
more equal-support locking can only reproduce the common blocker.

The recommended theorem target is therefore direct `False` from the complete
`M/Q/L` telescope.  A third-source existential is acceptable only if its
proof explicitly consumes one of the two global geometric ingredients above;
it should not be introduced as another conditional packet.

## Validation

Fresh focused elaboration succeeded:

```bash
cd lean
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/global-mutual-third-source-producer/\
  ThirdSourceFiniteBoundary.lean
```

The current predecessor and full-geometry localization were also freshly
rechecked through a temporary scratch olean path:

```text
GlobalMutualPairCloser.lean: exit 0
EqualBlockerTerminal.lean: exit 0
ThirdSourceFiniteBoundary.lean: exit 0
```

Every printed theorem in the new file has only the standard axiom closure
`propext`, `Classical.choice`, and/or `Quot.sound`; no theorem reaches
`sorryAx`.  The file contains no `sorry`, `admit`, declared axiom,
`native_decide`, or unsafe declaration.
