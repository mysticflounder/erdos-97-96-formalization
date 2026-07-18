# Exact-six mutual repeated-outside-pair audit

Date: 2026-07-18

Status: **THE REPEATED-OUTSIDE-PAIR ROUTE DOES NOT CLOSE THE EXACT-SIX
MUTUAL SIBLING FROM THE CURRENT GLOBAL FINITE/ORDINAL SURFACE.  A NEW
KERNEL-CHECKED FINITE BOUNDARY RETAINS THE TOTAL COMMON CRITICAL MAP,
EXACT CAP SIX, BI-APEX ROBUST FIVE-POINT CLASSES, SELECTED-ROW MINIMALITY,
THE PRODUCTION SECOND-FIBER/LARGER-FIBER THEOREM, AND RETAINED-RADIUS
BOUNDARY ALTERNATION.  IT HAS TWO DISTINCT REPEATED BLOCKER VALUES IN ONE
SIX-POINT CAP, BUT THEIR ROWS SHARE ONLY ONE OUTSIDE POINT.  NO PRODUCTION
`sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-mutual-repeated-outside-pair/`.  It does not
edit production Lean, closure documents, generated blueprint state, git,
`ShellCurvature`, `SurplusM44`, or protected card-five/555/654 work.

## Exact target audited

The desired endpoint remains the direct theorem

```lean
theorem false_of_fullParentExactFiveMutualData_of_secondCap_card_eq_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier
      D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile)
    (hcap : S.oppCap2.card = 6) : False
```

The attempted consumer was
`CapSelectedRowCounting.outsidePair_unique_capCenter`: find two distinct
actual blocker centers in one ordered cap whose source-faithful exact rows
share two distinct points outside that cap.

## Required theorem-bank preflight

Before deriving a new finite incidence object, the lane checked every
registry required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-six mutual
omission, repeated blocker fibers, same-cap source-faithful rows, shared
outside pairs, and retained-radius collisions.  The closest reusable
production declarations are:

```text
ATailBiApexBlockerMultiplicity.
  second_fiber_or_larger_first_fiber_of_two_omissions
ATailBiApexBlockerMultiplicity.FrontierBiApexRobustResidual.
  exists_two_fibers_or_larger_fiber
ATailCriticalFiberRetainedRadiusSelector.RetainedRadiusCollision.
  alternates_between_firstApex_and_commonBlocker
CapSelectedRowCounting.outsidePair_unique_capCenter
ATailTwoCenterCapLocalization.
  false_of_two_cap_centers_equidistant_outside_pair
```

No indexed theorem turns blocker multiplicity, cap placement, or boundary
alternation into a positive two-point intersection of two different exact
critical rows.

## What blocker multiplicity actually gives

The generic production theorem says that a finite blocker endomap omitting
both physical apices has either:

1. a second nontrivial fiber at a blocker value different from the first; or
2. a third source in the first fiber.

The robust-parent wrapper first obtains one repeated fiber and applies this
finite theorem.  This is a real aggregate consequence of the full common
critical map, but its conclusion contains no cap placement and no
cross-fiber row incidence.

`RepeatedOutsidePairFiniteBoundary.lean` imports and instantiates that exact
production theorem as `production_blockerMultiplicity_checked`; the audit
does not replace it with a weaker hand-written proxy.

## Kernel-checked exact finite boundary

The boundary has fourteen labels and cap profile `(5,6,6)`.  Its physical
second cap is

```text
{0,2,3,4,6,10}
```

with strict interior `{3,4,6,10}` and exact-five second-apex class
`{2,3,4,6,8}`.  Hence the physical exact-five interior is exactly
`{3,4,6}`; the deleted, continuation-second, and partner sources are
`4,3,6`, while unused source `10` lies in the physical interior and outside
the exact-five class.

The total source-indexed blocker map is

```text
[13,13,9,2,2,3,5,2,3,2,8,4,5,6].
```

It omits both apex values `0,1`.  Its repeated fibers include

```text
13 : {0,1}
 2 : {3,4,7,9}
 3 : {5,8}
 5 : {6,12}.
```

Thus the stronger **second repeated fiber** arm occurs several times; the
model is not hiding in the single-larger-fiber alternative.

The exact row at center `c` is the cyclic shift of `{1,2,5,7}` by `c`.
This is a Sidon support design modulo fourteen, so any two distinct rows
intersect in at most one point.  Every row:

- has exactly four points;
- omits its center;
- contains every source assigned to that center by the blocker map;
- is locked on equal blocker fibers;
- respects the cap two-hit bound whenever its center lies in that cap; and
- contains the next point of a Hamiltonian selected-row cycle.

The last property proves in Lean that every nonempty set closed under all
selected rows is the whole carrier.  This retains the selected-witness
strong-connectivity consequence of global minimality.

The two robust apex classes each have five points and survive every
one-point deletion.  The named exact-six mutual surface is also present:
the unused row omits both continuation sources, the partner and deleted
sources omit each other, the unused and partner blockers are distinct, and
deleting the chosen endpoint preserves both named blocker rows.

## The decisive repeated-fiber check

The two repeated blocker values `13` and `2` both lie in the six-point first
opposite cap

```text
{1,2,7,9,12,13}.
```

Nevertheless their exact rows satisfy

```text
criticalSupport 0 ∩ criticalSupport 3 = {deleted} = {4},
```

and `4` is outside that cap.  Thus even two distinct repeated blocker
fibers in one exact six-point cap give only **one** shared outside point, not
the pair required by `outsidePair_unique_capCenter`.

The live mutual-arm blockers are also favorably placed: blockers `8` and
`5` lie together in the surplus cap, while their sources `10` and `6` are
outside it.  Their rows again share only `{10}`.

The file proves the global statement

```lean
theorem no_repeatedOutsidePair_checked :
    ¬ HasRepeatedOutsidePair
```

over every pair of source-indexed blocker rows and every displayed cap.

## Retained-radius geometry was also tested

The first-apex exact-five class is `{1,2,4,5,7}`.  Its only blocker
collision is the pair `{4,7}` at blocker `2`.  The explicit cap-partition
boundary order satisfies exactly the production bisector alternation

```text
btw firstApex blocker source₁ ↔ ¬ btw firstApex blocker source₂
```

for every collision inside that retained class.  Therefore adding the
currently exported ordinal consequence of Euclidean equal-distance
geometry does not force a second shared row point either.

## Verdict and first genuinely missing premise

The direct exact-six mutual theorem is **not proved**.  The regression is
not a Euclidean `CounterexampleData` model, so it does not refute that
theorem.  It does rule out the proposed derivation from:

- exact cap six and the cap partition;
- a total source-faithful common critical map;
- two omitted apex blocker values;
- the second-fiber/larger-fiber theorem;
- same-cap placement of distinct repeated blocker values;
- selected-row strong connectivity;
- cap two-hit and pairwise-circle-intersection bounds; and
- retained-radius boundary alternation.

The first missing premise must therefore be a genuinely stronger geometric
coupling between **different blocker fibers**.  It must use information not
present in this boundary, such as nonlinear Euclidean circle realizability,
complete exact-radius filters, MEC/non-obtuse support-triangle geometry, or
`noM44`, to force a positive cross-fiber incidence or a direct
contradiction.  Merely producing another repeated fiber, locating two
blocker values in one cap, or adding another selected-row closure theorem
cannot feed `outsidePair_unique_capCenter`.

A proof-grade next test for this route would encode the two repeated fibers
and all their full shell equalities in actual Euclidean coordinates together
with convex/MEC inequalities.  Until that nonlinear gate rules out the
fixture shape, the repeated-outside-pair route should be treated as blocked
at the finite/ordinal layer, not as the next Lean producer.

## Validation

The finite boundary was elaborated directly against the current Lake
environment with warnings treated as errors:

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/exact6-mutual-repeated-outside-pair/\
RepeatedOutsidePairFiniteBoundary.lean
```

Every printed theorem depends only on a subset of:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `admit`, `native_decide`, or unsafe
declaration.

The deterministic finite search/replay was run with:

```bash
UV_CACHE_DIR=/tmp/p97-mutual-uv uv run --no-project python \
  scratch/atail-force/exact6-mutual-repeated-outside-pair/search_fixture.py
```

and returned `FOUND`, four explicit repeated blocker values, the same-cap
repeated-fiber row intersection `[4]`, and
`repeated_outside_pair_hits = []`.

Epistemic status:

- **PROVEN / KERNEL-CHECKED:** all declarations in the Lean boundary,
  including the imported production multiplicity consequence and global
  absence of the repeated-outside-pair antecedent.
- **EXACT WITHIN THE STATED FINITE INCIDENCE/CAP/ORDER ABSTRACTION:** the
  replayed fixture.
- **NOT CLAIMED:** Euclidean realizability, a `CounterexampleData` model, or
  closure of the production exact-six mutual theorem.
