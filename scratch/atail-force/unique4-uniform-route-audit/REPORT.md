# Exact-four uniform-route audit

Date: 2026-07-22

Scope: `OriginalUniqueFourResidual F` and the late-first-apex critical system.
This lane does not run another literal CEGAR search and does not modify
production Lean or shared closure documents.

## Result

There is currently **no source-proved finite upper bound, hereditary
reduction, or cardinality-independent checked-bank occurrence theorem** for
the exact-four residual.

One useful cardinality fact is source-proved and now kernel checked:

```lean
Problem97.ATailUniqueFourUniformRouteAuditScratch.carrier_card_ge_eleven
    (R : OriginalUniqueFourResidual F) :
    11 ≤ D.A.card
```

The proof is in
[`UniqueFourCardinalityBoundary.lean`](UniqueFourCardinalityBoundary.lean).
It uses `SurplusCapPacket.capSum`,
`SurplusCapPacket.surplus_card_gt_four`, and
`ATailOrientedPhysicalApexIngress.oppositeCaps_card_ge_four`.  If the carrier
had cardinality ten, the cap sum would force both opposite caps to have
cardinality four, making the displayed packet an `IsM44` witness and
contradicting `R.noM44`.

This is a **lower** bound.  No current theorem found in source, the required
bank registries, or the indexed Lean corpus supplies the missing upper bound

```lean
OriginalUniqueFourResidual F → D.A.card ≤ 11.
```

Moreover, the two current card-eleven finite projections are still
`VERIFIED_SAT_PROJECTION`, so there is not yet a fixed-card contradiction to
lift.  The correct next uniform target is therefore a disjunction between the
card-eleven base case and an occurrence of an already-checked,
extension-stable consumer.  It must use source information absent from the
current finite shadows: nonlinear Euclidean realization, MEC/cap geometry
and `noM44`, or full deletion/minimality provenance.

## Live source surface

The exact-four branch is the live leaf

```lean
Problem97.ATailFrontierLiveClosure.false_of_originalFrontierUniqueRadiusArm
```

through

```lean
Problem97.ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F.
```

The residual retains:

- `R.minimal : D.Minimal`;
- `R.noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44`;
- `R.carrier_card_gt_nine : 9 < D.A.card`;
- one complete first-apex radius class of cardinality four;
- uniqueness of the positive K4 radius at that apex;
- deletion-criticality of every member of that class at the first apex;
- two distinct points of the class in the strict first opposite cap; and
- localization of every other carrier bisector center of that pair to the
  same strict cap.

The retained `F : CriticalPairFrontier D S radius H` separately carries the
fixed critical system, the original frontier pair, survival after deleting
that pair at the second apex, and the full carrier/MEC/cap packet.  The strict
interior pair in `R` must not be silently identified with the frontier pair.

The source-clean late choice in
`unique4-late-choice-terminal/UniqueFourLateChoiceTerminal.lean` gives:

```text
lateFirstApexSystem
lateFirstApexResidual
lateFirstApexSystem_centerAt_eq
lateFirstApexSystem_support_eq_class
lateFirstApexSystem_centerAt_eq_iff_mem_class
lateFirstApex_actualBlockerFiber_points_eq_class
lateFirstApex_actualBlockerFiber_card_eq_four
```

Thus the actual blocker fiber at the first apex is exactly the four-point
class.  This does not bound the remaining blocker fibers or the carrier.

## What is proved about cardinality

### PROVEN: `11 ≤ |A|`

The new Lean proof establishes the exact lower boundary.  A companion adapter

```lean
carrier_card_eq_eleven_of_card_le_eleven
    (R : OriginalUniqueFourResidual F)
    (hupper : D.A.card ≤ 11) :
    D.A.card = 11
```

records what a future upper-bound theorem would buy.

Focused warnings-as-errors elaboration succeeds.  Both declarations have
axiom closure exactly

```text
propext
Classical.choice
Quot.sound
```

with no `sorry`, `admit`, `native_decide`, unsafe declaration, or new axiom.

### NOT FOUND: any source upper bound

The only nearby cap-cardinality upper bounds found require the positive
`S.IsM44` hypothesis.  They have the wrong polarity for `R.noM44`.
`exists_secondLargeCap_of_noM44` instead gives another lower bound.  The
general ordered-cap pair inequality

```lean
CapSelectedRowCounting.orderedCap_card_add_four_le_choose_outside
```

is compatible with arbitrarily large balanced cap profiles.  Nothing found
turns the unique four-class at one apex into a carrier upper bound.

The smallest pure cardinality theorem that would make a completed card-eleven
certificate uniform is precisely

```lean
theorem carrier_card_le_eleven
    (R : OriginalUniqueFourResidual F) :
    D.A.card ≤ 11
```

but this is currently **CONJECTURED**, and the audit found no evidence that it
is easier than the branch itself.

## Why a hereditary reduction is unavailable

K4 is not hereditary under deleting unrelated carrier points.  The current
source theorem makes the obstruction exact:

```lean
Problem97.FaithfulCarrierPattern.eq_carrier_of_nonempty_closed
```

says that a nonempty subset of a minimal carrier which contains every chosen
row centered at one of its members is the whole carrier.  Its contraposition
is already packaged as

```lean
Problem97.FaithfulCarrierPattern.exists_row_escape_of_proper_subset.
```

The more primitive minimality statement is

```lean
Problem97.ATailGlobalMinimalDeletion
  .not_hasNEquidistantProperty_of_nonempty_proper_subset.
```

Therefore a proposed eleven-point hereditary core cannot merely be selected
from a larger carrier: either a chosen row escapes it, or, if every row stays
inside, it was the whole carrier already.

A valid bounded-closure theorem would have to prove something as strong as

```lean
∃ P : FaithfulCarrierPattern D.A, ∃ B : Finset ℝ²,
  B.Nonempty ∧ B ⊆ D.A ∧ B.card ≤ 11 ∧
  ∀ c, ∀ hc : c ∈ B,
    (P.classAt c _).support ⊆ B.
```

By `eq_carrier_of_nonempty_closed`, that statement immediately implies
`D.A.card ≤ 11`; it is not a cheaper form of the missing bound.

## Current finite-card status

The current artifacts

```text
unique-arm-whole-carrier-source-audit/n11_opp1_4.result.json
unique-arm-whole-carrier-source-audit/n11_opp1_5.result.json
```

both report

```text
solver_status    = SAT
epistemic_status = EXACT_CNF_FOR_DOCUMENTED_FINITE_PROJECTION
```

Their current semantic replays match the result-file SHA-256 values and report
`VERIFIED_SAT_PROJECTION`.  Each replay checks all encoded constraints plus:

- eight Kalmanson schemas over 3,324 embeddings;
- three signed U5 schemas over 720,720 embeddings; and
- one planar schema over 332,640 injections.

These are not source countermodels.  The projection deliberately omits most
deletion-survival assertions, nonlinear Euclidean coordinates, MEC/nonobtuse
geometry, full alternative-triangle content of `noM44`, and full `D.Minimal`.
They do prove that the currently installed bank does not yet close even the
card-eleven projection.

There is one tooling synchronization defect to keep separate from the
mathematical status: `verify_exact_four_outer.py` still requires the obsolete
schema string `p97-late-choice-exact-four-full-partition-v1`, whereas the
current results use `p97-late-choice-exact-four-row-projection-v1`.  Thus that
specific verifier currently fails closed on the new files.  The matching
`.replay.current.json` artifacts remain the current replay evidence; the old
`.replay.json` files are stale.

## Existing extension-stable consumers

The exact-four Kalmanson port supplies five cardinality-generic consumers:

```text
false_of_endpoint_k2_endpoint_k1_three_selected_rows
false_of_endpoint_k2_endpoint_k1_three_selected_rows_long
false_of_one_k1_three_cyclic_selected_rows
false_of_four_k2_five_selected_row_equalities
false_of_one_k2_two_k1_three_selected_rows
```

The U5 registry contains 96 source-proved declarations normalized to 93
signed schemas.  The closest three-center consumer is

```lean
Problem97.ATailTetrahedronBankAdapterScratch
  .false_of_three_selected_classes_tetrahedron
```

but its occurrence requires five additional positive incidences not forced by
the three named exact-four rows.  The existing planar endpoint is

```lean
Problem97.PlanarRankTwoDistanceIdentityScratch
  .false_of_six_distance_squares_of_determinant_ne_zero.
```

All of these are valid for arbitrary carrier cardinality once their finite
antecedent occurs.  The missing theorem is occurrence, not another consumer.

## Precise uniform target

After the fixed card-eleven projection has actually been closed by a finite
bank, the smallest useful source-level lift is the following theorem shape:

```lean
/-- `ExactFourCheckedOccurrence R` is the finite disjunction of the exact,
extension-stable antecedents of the installed Kalmanson, signed-U5, and
planar consumers, transported through the late-first-apex system. -/
theorem cardEleven_or_checkedOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    D.A.card = 11 ∨ ExactFourCheckedOccurrence R
```

This statement is **CONJECTURED**.  It is preferable to a bare
`D.A.card ≤ 11` target because it allows larger carriers to close through an
extension-stable local occurrence rather than claiming they do not exist.

Acceptance requirements for `ExactFourCheckedOccurrence` are strict:

1. every constructor is exactly the antecedent of an existing source-clean
   `False` theorem;
2. all role maps are injective and preserve cyclic order or its checked
   reflection;
3. negative U5 atoms mean selected-row nonmembership, not absence from a
   complete ambient radius class;
4. the occurrence is derived from the actual late critical system, not an
   independently reassigned row family; and
5. the proof visibly consumes at least one source field missing from the
   current SAT projections.

Before the card-eleven projection closes, the honest immediate target is the
slightly weaker research statement

```lean
D.A.card = 11 ∨ ExactFourCheckedOccurrence R ∨
  Nonempty (ExactFourNamedGeometricResidual R),
```

where the final constructor must name one genuinely Euclidean/MEC/minimality
residual rather than an unconstrained catch-all.  A source proof of that
trichotomy would isolate what the next finite run must encode without
overclaiming closure.

## Regression gates

The uniform theorem must beat the following increasingly strong negative
tests.

1. **Current card-eleven SAT projections.**  They satisfy the documented full
   radius-partition, critical-map, late-fiber, selected-connectivity, and bank
   layers.  They are finite structural regressions, not Euclidean source
   models.
2. **All-even strict-Kalmanson family.**  For every even `n ≥ 12`,
   `aggregate-positive-contour-discovery/TIGHT_GRAPH_UNIFORM_ATTACK.md`
   constructs exactly-four selected rows with strong connectivity, pair
   alternation, and strict circular-split Kalmanson inequalities.  Its
   documented four-point determinant proves the family is uniformly
   non-Euclidean.  It refutes a pure selected-row/Kalmanson lift, not a source
   theorem.
3. **Unbounded critical-cover family.**  Propositions 189–190 of
   `/opt/nfs/verified-results.md` construct abstract systems for every
   `m ≥ 8` with unique exact quartets, critical cover/cycles, pair-capacity
   bounds, and even universal arbitrary-selection strong connectivity.  They
   are explicitly not Euclidean and do not satisfy the full live residual.
   They show that critical cover plus the strongest current connectivity
   shadow cannot prove a carrier upper bound.
4. **Local exact Euclidean/MEC fixture.**  The 12-point model checked by
   `unique4-direct-false/verify_exact_local_boundary.py` realizes the local
   exact-four/MEC packet but fails global all-center K4.  Any theorem using
   only that local geometry is false.

These gates identify the necessary new leverage: actual global Euclidean
realization coupled to complete critical fibers and the MEC/no-`IsM44`
packet, or full source minimality beyond its selected-connectivity shadow.

## Required preflight completed

Before this audit, the following were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for exact-four carrier
  bounds, hereditary K4 closure, critical fibers, and existing U5/Kalmanson
  consumers.

No matching upper-bound, hereditary-reduction, or source occurrence theorem
was found.

## Recommendation

Do not spend more compute on literal larger-card CEGAR from the present row
surface.  First close the two current card-eleven projections by adding a
source-faithful nonlinear/MEC/minimality layer or by extracting a new checked
local consumer.  In parallel theorem work, target
`cardEleven_or_checkedOccurrence`, not `carrier_card_le_eleven`, and require
the occurrence proof to expose the source field that rules out the three
regression families above.
