# Non-equilateral parent producer audit

## Outcome

The proposed universal producer

```text
NonEquilateralOutput H P -> StrictOppCap1CommonHit P
```

did not survive the choice-order audit.  The checked row/cap hypotheses do
not force a common hit.  The strongest kernel-checked conclusion obtained in
this lane is a support dichotomy:

```text
row1 has at least two surplus-cap members
or row2 has at least two surplus-cap members
or the two rows have distinct, mutually exclusive strict-oppCap1 witnesses.
```

This changes the producer target.  The next proof must either eliminate a
surplus-heavy native row or use the favorable-system/choice-first surface to
extract further geometry from the two distinct strict witnesses.  Continuing
to mine a common hit for every arbitrary global-K4 row choice is too strong.

## Kernel-checked declarations

The file
`NonEquilateralParentProducer.lean` proves:

- `strictOppCap1Region`: the normalized strict first-opposite-cap region;
- `mem_surplusCap_or_strictOppCap1_of_mem_A_of_not_mem_oppCap2`: every
  carrier point outside `oppCap2` lies in the surplus cap or strict
  `oppCap1`;
- `selectedRow_surplusHeavy_or_strictOppCap1Hit`: a selected row with at
  least two points outside `oppCap2` has at least two surplus hits or a
  strict first-cap hit;
- `NonEquilateralSupportDichotomy`: the exact two-row output proposition;
- `nonEquilateralSupportDichotomy`: every `NonEquilateralOutput H P`
  satisfies that proposition.

The last theorem uses the existing terminal
`false_of_nonEquilateral_of_strictOppCap1CommonHit` only to prove that the
two strict witnesses are mutually exclusive.  It does not assume or produce
a common hit.

The file also kernel-checks the choice-order correction:

- `RoutedBranchEliminator` pairs one realized routed branch with its one
  required consumer;
- `ChoiceFirstFrontierContinuationContent` selects one concrete
  `FrontierContinuationDispatch` before asking for that branch consumer;
- `false_of_criticalPairFrontier_of_choiceFirstContinuationContent` closes
  the selected frontier;
- `routedBranchEliminator_of_callbacks` shows that three callbacks for one
  chosen dispatch imply the branch-only surface;
- `choiceFirstContinuationContent_of_universalEliminators` shows that the old
  `FrontierContinuationEliminators` implies the weaker choice-first surface.

There is intentionally no second full-parent interface here.

## Relation to `FavorableSystemParentSurface`

The canonical parent refactor is
`scratch/atail-force/critical-system-rebase/FavorableSystemParentSurface.lean`.
It has the more important choice-order improvement: after the geometric
frontier is fixed, it may choose a favorable `CriticalShellSystem` and rebase
the frontier to that system before selecting a continuation dispatch.

The two local interfaces compare as follows.

- `ChosenContinuationEliminators P` in the favorable-system file asks for all
  three callbacks at the already selected `P`.
- `RoutedBranchEliminator P.branch` here asks only for the callback paired
  with one realized branch.
- `routedBranchEliminator_of_callbacks` proves the first implies the second.
- The converse is not available: branch-only content deliberately does not
  manufacture callbacks for unrealized arms.
- The favorable-system surface is strictly more flexible in its critical
  system choice.  The fixed-system choice-first helper in this file does not
  replace it.

Thus this artifact plugs into the canonical surface in either of two ways:

1. retain `ChosenContinuationEliminators`; use
   `nonEquilateralSupportDichotomy` inside its non-equilateral callback and
   prove consumers for the resulting support arms; or
2. later weaken the canonical chosen-dispatch payload to a branch-only
   payload, using the checked `RoutedBranchEliminator` pattern.

## Exact regression

`verify_cap_profile_regression.py` extends the rational 11-point regression
from `non-equilateral-continuation` and checks, with exact fractions:

- 11 distinct points in strict convex position;
- the parent selected four-class at `O2`;
- two unchanged mutual equal-radius rows from the local model;
- omitted parent apex and disjoint local row supports;
- a full structural `CapTriple`, including exact signed-area
  `OnArcOpposite` membership for every point;
- cap sizes `(C1,C2,C3) = (5,4,5)` and selected
  `(surplus,oppCap1,oppCap2) = (5,5,4)`;
- a genuine second large cap and failure of the selected `(m,4,4)` profile;
- zero row overlap, a row2 surplus-heavy set-theoretic profile (four hits),
  and three row1 strict-first-cap hits.

This structural labeling does **not** instantiate the native continuation
packet used by `nonEquilateralSupportDichotomy`: the row centers `z1,z2` are
the two endpoints of `oppCap2`, while strict `oppCap2` is `{kL,kR}`.  Thus it
does not refute a theorem about the actual native branch and must not be cited
as a realization of either arm of that Lean dichotomy.

This is not a full `CounterexampleData` model.  It does **not** validate the
MEC promotion carried by `SurplusCapPacket`, global K4, a total
`CriticalShellSystem`, no-removable-vertex data, or the live U1 telescope.
It is therefore only a coexistence regression for the local rows and a
structural cap profile.  It guards deductions which ignore strict-center
placement, not a theorem on the full native packet or the final theorem.

## Common-deletion compatibility

A generic `CommonDeletionTwoCenterPacket` does not supply the data used by
the non-equilateral terminal: it does not retain mutual native-row center
hits, equality of the two native row radii, a third equidistant apex, or
same-`oppCap2` placement of both centers.  In the cross-generated escape
surface, the fresh source is outside `oppCap2`, so the same-cap ordered
separation theorem is unavailable.  The non-equilateral consumer therefore
does not directly generalize to the cross common-deletion packets.

## Bank preflight

The required theorem-bank and nthdegree searches found the existing cap row
counting theorems, critical-map packets, generic U5 bisector kernels, and the
current continuation consumers.  No indexed declaration produced a common
native-row hit or eliminated the support dichotomy above.  In particular,
`NoM44SupportLocalization` records only cap-cardinality/localization facts;
it does not force native-row overlap.

## Validation

From `lean/`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/non-equilateral-parent-producer \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/NonEquilateralParentProducer.olean \
  ../scratch/atail-force/non-equilateral-parent-producer/NonEquilateralParentProducer.lean
```

Every printed declaration reports only:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` dependency.

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/non-equilateral-parent-producer/verify_cap_profile_regression.py
```

The exact validator reports both local and structural cap-profile `PASS`.
