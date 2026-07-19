# Large-opposite-caps bi-apex robust residual audit

Date: 2026-07-17

Status: **THE SURVIVAL-COVER PRODUCER AND ITS PHYSICAL-SECOND-APEX CONSUMER
ARE ALREADY CLOSED.  THE LIVE RESIDUAL IS THE CAP-STRENGTHENED BI-APEX ROBUST
ENDPOINT `L`.  NO EXISTING CONSUMER CLOSES `L` BY PROJECTION.  THE EXACT
MISSING INGREDIENT IS A GLOBAL, SOURCE-FAITHFUL CROSS-ROW/CAP-ORDER COUPLING;
NO PRODUCTION `sorry` IS CLOSED BY THIS AUDIT.**

## Scope correction

The earlier version of this report treated the source-indexed survival cover
as the active producer problem.  That status is obsolete.  The card-at-least-
fourteen cover producer and the uniform physical-second-apex consumer are both
complete.  Their robust output is not an unfinished cover arm; it is the live
large-cap geometry endpoint.

This report therefore audits only

```lean
B : FrontierBiApexRobustResidual R
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

and the complete indices `R`, `F`, `S`, `H`, and `D` retained by those types.
It does not propose another survival-cover packet.

The existing `SurvivalCoverGeometry.lean` and
`verify_finite_regression.py` in this directory are historical cover-lane
artifacts.  They remain useful regression evidence for the old finite
survival-cover surface, but they are not the authoritative statement of the
current proof target.

## Exact live surface

The public robust target is direct contradiction on the strengthened branch:

```lean
theorem false_of_largeOppositeCapsBiApexRobust
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : False
```

The indices and fields retained at this boundary include:

- global K4 and convexity through `D`;
- the complete MEC-derived cap partition through `S`;
- one complete source-indexed `CriticalShellSystem` through `H`;
- the retained first-apex critical pair and both of its second-apex deletion
  survival facts through `F`;
- global cardinal minimality, no `IsM44`, the retained first-apex radius
  lower bound, and the physical two-center common-deletion packet through
  `R`;
- full deletion robustness at the physical second apex through
  `B.secondApex_robust`;
- full deletion robustness at the first apex through
  `B.firstApex_robust`; and
- `6 <= S.oppCap1.card`, `6 <= S.oppCap2.card`, and hence
  `14 <= D.A.card` through `L`.

The two cap-six inequalities are load-bearing.  A theorem quantified only
over a bare `B` is overstrong because the generic `B` type also admits the
small-cap cases already dispatched earlier on the live branch.

The fixed initial critical system should not be treated as part of the public
proof-search contract.  The available rebase ladder permits choosing a
favorable late critical system if an internal proof uses
`CriticalFiberClosingCore`.  The public target remains direct `False` on
`L`.

## Exact robust-second-apex normalization

The checked robust-second-apex geometry proves

```lean
FullyDeletionRobustAt D S.oppApex2
  <-> SecondApexDeletionRobustRadiusClassification D S
```

with exactly two alternatives:

1. one positive radius class at `S.oppApex2` of cardinality at least five; or
2. two distinct positive K4 radii at `S.oppApex2`, represented by two
   support-disjoint exact four rows, with `6 <= S.oppCap2.card`.

This is a lossless normalization of `B.secondApex_robust`, not a
contradiction.  Both alternatives remain compatible with the anonymous
cap/MEC and selected-row marginals.  In particular, the large opposite-cap
bounds add boundary positions but do not manufacture a positive cross-row
support membership.

## Existing-consumer audit

No direct existing consumer closes the normalized robust endpoint.

### Survival-cover consumer

The source-faithful cover producer and physical-second-apex uniform consumer
are already complete.  On their robust arm they return this same endpoint;
reapplying them only cycles.  No further cover mining is needed.

### Large-radius arm

The checked large-radius reductions eliminate the anonymous shared-pair
residual and reduce to established continuations:

1. `FullyDeletionRobustAt D S.oppApex2` again;
2. protected swapped `FA-UNIQ4`; or
3. `LargeCapUniqueFiveSecondApexRadius`.

The third item is the distinct **large-cap exact-five-radius residual**: the
physical radius class is exactly five while `oppCap2.card >= 6`. It is not the
protected swapped `FA-UNIQ5` cap-five branch. The checked unused-sixth-point
and ordered-critical-shell/K4-escape refinements apply to it, but their final
cap/block consumer remains open. The first item is exactly the robust residual
under audit. Thus the large-radius transition is useful normalization but not
a terminal.

### Two-distinct-radii arm

The checked global-minimality transition uses the two disjoint rows
essentially and produces either a source-faithful collision continuation, an
installed singleton critical shell, or a fresh fully deletion-robust center.
The coupled physical two-radius reducer can also return the protected original
unique arm or another common-deletion packet.  None is direct `False`, and
re-expanding the common-deletion packet can return to bi-apex robustness.

Consequently another minimal-deletion decomposition does not supply a
well-founded measure by itself.

### Bi-apex blocker multiplicity

Production uses the two robust apices as two omitted values of the retained
critical blocker endomap and proves that there are either:

- two distinct nontrivial blocker fibers; or
- at least three distinct sources in one blocker fiber.

This is the strongest unconditional finite-map consequence of the bi-apex
surface.  In the first arm it gives two distinct exact critical rows, each
with its own source pair.  In the second arm support locking gives one exact
four-shell containing three sources.  Neither arm supplies a second center
for a chosen pair or a positive membership of that pair in a genuinely
different actual row.

### `CriticalFiberClosingCore`

The production consumer

```lean
ATailCriticalFiberClosingCore.false_of_criticalFiberClosingCore
```

is complete.  What is missing is not its elimination step but an occurrence
theorem from the full large-cap `L` surface.  Its two constructors require
either:

- an ordered cross-row packet with a physical-apex equality, one actual
  source-indexed cross hit, and a compatible six-role cyclic order; or
- two distinct centers in one indexed cap equidistant from the same outside
  pair.

The raw multiplicity and robust-radius classifications provide neither
constructor.  A fixed-initial-`H` theorem producing this core is
propositionally sufficient but operationally overconstrained; if this route
is used, the proof should choose the favorable critical system after seeing
the complete `L` geometry.

### Kalmanson and other metric consumers

The convex-quadrilateral/Kalmanson inequalities are valid consumers once
named shell equalities and a compatible cyclic placement are present.
Deletion robustness supplies K4 after deleting a source, equivalently a
support omission for the selected critical row at that source's actual
blocker.  It does not turn that omission into positive membership of a
prescribed pair.

Therefore neither the ordinal strict-cycle consumer nor the specialized
linear Kalmanson terminals can be instantiated directly from the robust
classification.  The cap-order bridge is sound, but a source-faithful row
occurrence is still missing before it becomes load-bearing.

## Exact missing global coupling

The smallest observable gap is one **positive, source-faithful cross-row
overlap for a named pair, bundled with the cap/boundary placement that feeds
an existing terminal**.  An isolated cross-hit conjecture is not enough: the
exact rational order regressions show that several local order types remain
realizable after one extra equality.

A successful proof of `false_of_largeOppositeCapsBiApexRobust L` must use a
fact absent from the finite row/deletion marginals, such as full radius
filters, MEC/cap geometry, or global source-indexed critical provenance, to
produce one of the following immediately consumable alternatives:

1. choose a blocker-collision pair which is also aligned in a physical-apex
   radius class, then produce a genuinely distinct actual row containing the
   same pair and localize the resulting centers/order;
2. on the retained source-return joint-deletion branch, force one prescribed
   pair into one of the source-exact q-deleted rows and route it directly to a
   U5, Kalmanson, or two-circle terminal; or
3. prove a direct cap/MEC contradiction of the triple-fiber placement or the
   robust two-radius minimal-deletion continuation without forgetting `F`,
   `R`, `B.secondApex_robust`, or either cap-six bound.

Among current consumers, the first alternative is the shortest established
terminal interface.  The theorem must choose the favorable pair after
inspecting the full geometry; it must not quantify over an arbitrary
preselected blocker fiber.

## Mining boundary

Further mining of survival colors, blocker-fiber counts, anonymous selected
rows, or another second-apex radius split is mining the wrong object.  The
fixed `(5,5,5)` / `(6,5,4)` and corrected 101-shadow banks are useful local
regression gates, but they are not coverage of the live `card >= 14`,
two-cap-six surface.

Any resumed computational search should therefore target an occurrence of an
**existing consumer antecedent** on a cap-size-parametric representation of
`L`, retaining:

- the named source and actual blocker map;
- the two physical-apex robustness facts;
- the retained frontier/common-deletion provenance;
- both cap-six bounds and cyclic boundary order; and
- the positive cross-row membership or full linear Kalmanson certificate to
  be replayed immediately.

A new certificate counts as progress only if it covers an orbit/schema on
that live surface or isolates one explicitly geometric residual.  A new
literal selected-row core without an occurrence theorem does not advance
closure.

## Validation and epistemic status

- **SOURCE-CURRENT:** the live `R`/`F`/`B` fields, cap-strengthened `L`
  surface, robust-radius classification, bi-apex multiplicity theorem, and
  named consumers were checked against the current working tree.
- **BANK PREFLIGHT COMPLETE:** the registries required by `AGENTS.md` and
  focused indexed Lean searches were checked before this audit.
- **PROVEN BY EXISTING CHECKED WORK:** the cover producer/consumer, robust
  radius normalization, large-radius reduction, two-radius transition,
  blocker multiplicity, and terminal consumers cited above.
- **OPEN:** the direct theorem
  `false_of_largeOppositeCapsBiApexRobust L` and every displayed occurrence
  alternative.
- **NOT RUN:** Lean, Lake, axiom checks, proof-blueprint, and full builds, per
  the active no-build instruction.
- **NO CLOSURE CLAIM:** no production source, shared document, protected
  lane, or source `sorry` changed.
