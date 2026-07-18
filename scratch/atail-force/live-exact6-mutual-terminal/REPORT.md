# Exact-six full-parent mutual terminal audit

Date: 2026-07-18

Status: **THE EXACT-SIX ASSUMPTION CLOSES THE ALL-REVERSE SIBLING, BUT IT
DOES NOT CLOSE THE ARBITRARY MUTUAL-OMISSION SIBLING THROUGH ANY CURRENT
PRODUCTION OR SCRATCH TERMINAL.  THE REMAINING THEOREM SHOULD STAY A DIRECT
FULL-PARENT `False`; ANOTHER CONDITIONAL PACKET WOULD ONLY RESTATE THE
MISSING POSITIVE INCIDENCE.  NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/live-exact6-mutual-terminal/`.  It does not edit
production Lean, closure documents, generated blueprint state, git state,
`ShellCurvature`, `SurplusM44`, or any protected card-five/555/654 lane.

## Exact live boundary

Production now proves

```lean
false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six
```

and the immediate dispatcher

```lean
false_of_fullParentExactFive_of_secondCap_card_eq_six_and_mutualConsumer
```

in `ParentExactFiveExactSix.lean`.  The first theorem uses the four-point
strict interior of a six-point closed cap: three distinct period-three
sources and the all-reverse straddling blockers require at least five
strict-cap positions.

After that proof, the exact remaining theorem is

```lean
-- Architectural statement; deliberately not introduced as another open
-- declaration in this scratch lane.
theorem false_of_fullParentExactFiveMutualData_of_secondCap_card_eq_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {firstRadius : ℝ} {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile)
    (hcap : S.oppCap2.card = 6) : False
```

This is exactly the `mutualFalse` input of the production dispatcher.  It
retains the complete `F₀/R/B/L`, the same critical system `H`, the
origin-tagged exact-five continuation, the arbitrary mutual pair, both
large-cap bounds, minimality, and `noM44`.

## Required theorem-bank preflight

Before considering another finite-pattern, row-incidence, or metric theorem,
this lane checked every registry required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-six mutual
omission, full-parent mutual data, common-deletion packet pairs, same-cap
outside pairs, collision sources, and the general-n/U5 mutual families.  The
closest sinks remain:

```text
FullParentMutualSourcePairSameCapCollision.false
SameCapCollisionPairCore.false
OrderedCrossRowCore.false
ATailRetainedCollisionCapLocalization.
  false_of_distinct_actualRow_contains_collisionSources
CapSelectedRowCounting.outsidePair_unique_capCenter
U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
```

Every one needs a positive shared-pair or cross-row incidence not supplied by
`M` and not created by `S.oppCap2.card = 6`.

## Complete current blocker split

`GlobalMutualPairCloser.lean` chooses one endpoint `deleted` of the mutual
pair which is absent from both the partner's selected support and the
continuation unused-source support.  Deleting it preserves K4 at both
physical apices and both actual blockers.  The only unresolved collision is
between the continuation blocker and partner blocker.

### Distinct blockers

The checked distinct arm gives two source-faithful
`CommonDeletionTwoCenterPacket`s for the same deletion and canonically
identifies the three relevant rows:

```text
continuation-blocker row = selectedAt(unused source).support
partner-blocker row      = selectedAt(partner).support
physical-second row      = exact-five class erase deleted.
```

Exact six does not force a positive intersection of the first two rows.  The
existing exact `(5,6,6)` incidence/cap fixture in
`global-mutual-distinct-blocker-terminal/verify_scope_model.py` retains the
canonical four-center surface while the blocker rows intersect in exactly
one point and both reciprocal source-pair cross incidences are false.

Accordingly the first existing terminal antecedent is still the full packet

```lean
FullParentMutualSourcePairSameCapCollision Q
```

which needs both reciprocal source-row memberships and a common cap
containing both blockers while excluding both sources.  The cardinality
identity `S.oppCap2.card = 6` supplies none of those positive fields.

### Equal blockers

The checked equal arm gives an actual production
`FrontierCommonDeletionCriticalFiber R` whose sources are the continuation
unused point and the mutual partner.  Both sources lie in the six-point
physical closed cap, but they are not co-radial from either physical apex:

- physical-cap endpoint injectivity separates their first-apex distances;
- the unused source is outside the physical exact-five class while the
  partner belongs to it, so their second-apex distances differ.

Thus neither physical apex supplies the distinct second center needed by a
same-cap terminal.

The exact Lean finite boundary
`global-mutual-third-source-producer/ThirdSourceFiniteBoundary.lean` already
has

```text
physicalSecondCap.card = 6
physicalInterior.card = 4
physicalVertices = {deleted, continuationSecond, partner}
```

and retains exact-five source identities, total support locking, both
five-point apex classes, deletion robustness, selected-row strong
connectivity, first-apex rank injectivity, and a favorable common-cap
placement.  It nevertheless proves that no distinct actual blocker row
contains the fiber pair and that no same-cap third-source completion exists.

Therefore the existing terminal remains either:

1. a genuinely distinct actual row through both fiber sources, with its
   center in a common nonphysical cap; or
2. the larger ordered cross-row packet with a new outside-cap source,
   positive cross membership, and compatible cyclic placement.

Neither is a consequence of the current exact-six finite projection.

## Fresh regression replay

The two outcome boundaries were replayed against the current tree.

The focused production target was also rebuilt with blueprint refresh
disabled:

```text
LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.ParentExactFiveExactSix
Build completed successfully (8115 jobs).
```

The target introduced no new warning in the exact-six module; the build
replayed inherited repository warnings.

Distinct-blocker fixture:

```text
PASS: canonical four-center incidence/cap scope is compatible
blocker-row intersection = [1]
source-pair cross incidences = False False
scope only: not Euclidean and not a CounterexampleData realization
```

Equal-blocker fixture:

```text
ThirdSourceFiniteBoundary.lean: exit 0
all printed declarations: propext, Classical.choice, Quot.sound only
no sorryAx
```

These are exact within their stated finite abstractions.  They are **not**
Euclidean `CounterexampleData` realizations and do not refute the direct
theorem above.  They do refute a proof which merely projects exact six,
selected supports, blocker identities, cap membership, deletion robustness,
or selected-row closure and then asserts the missing terminal incidence.

## What a closing proof must add

The direct exact-six mutual theorem remains plausible only through a global
ingredient omitted by both checked boundaries.  A successful proof must use
the complete `L/M` telescope to obtain one of the following without adding a
new open packet:

1. **A repeated outside pair.**  Global K4 plus exact-six cap order forces two
   distinct same-cap actual blockers whose source-faithful rows share two
   named points outside that cap; this feeds
   `outsidePair_unique_capCenter` immediately.
2. **A distinct bisector center through the equal-blocker fiber.**  The total
   critical map, nonlinear Euclidean/MEC geometry, and exact-six placement
   force a second actual row through both fiber sources; the existing
   critical-fiber terminal closes it.
3. **A new support triangle.**  The complete mutual configuration constructs
   a genuine `IsM44` packet for a different non-obtuse MEC support triangle;
   `R.noM44` then closes directly.
4. **Direct nonlinear incompatibility.**  A full Euclidean/MEC/full-filter
   argument rules out the mutual packet without first manufacturing a local
   support packet.

Pure support counting, another deletion continuation, selected-witness
strong connectivity, or another conditional consumer is already exhausted
at this boundary.  The recommended theorem target is the direct `False`
statement above.

## Epistemic ledger

| Claim | Status |
| --- | --- |
| exact-six all-reverse branch is false | **PROVEN / KERNEL-CHECKED in production** |
| arbitrary mutual branch reaches the blocker dichotomy | **PROVEN / KERNEL-CHECKED in scratch** |
| exact six forces either existing terminal antecedent | **NOT PROVED; FALSE IN THE STATED FINITE ABSTRACTIONS** |
| direct exact-six full-parent mutual theorem | **OPEN / CONJECTURED** |
| finite boundaries are Euclidean `CounterexampleData` models | **NOT CLAIMED** |
| production `sorry` closed by this lane | **NONE** |
