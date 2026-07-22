# Original first-apex unique-radius arm: source-route audit

Date: 2026-07-22

Status: **SOURCE-CURRENT AUDIT PLUS KERNEL-CHECKED THREE-LEAF RESIDUAL
DISPATCH. NO PRODUCTION `sorry` IS CLOSED. THE LIVE THEOREM IS AN HONEST
PARENT TERMINAL, BUT IT CONFLATES EXACT FOUR, EXACT-FIVE DISTINCT BLOCKERS,
AND EXACT-FIVE COINCIDENT BLOCKER.**

## Audited target

The only source hole audited here is

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_originalFrontierUniqueRadiusArm
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False
```

`OriginalFrontierUniqueRadiusArm F` is exactly

```lean
((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
  (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
∀ rho, 0 < rho →
  4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius.
```

The field `hfour` is therefore logically redundant. The remaining parent
fields are not redundant merely because the current local reductions do not
yet consume all of them: a successful direct contradiction is expected to
need global minimality, MEC/cap geometry, or the global no-`IsM44` condition.

## Preflight

Before recommending a new producer, this audit checked the theorem-bank
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered unique positive K4
radii, exact four/five apex classes, prescribed deletion, short opposite
caps, critical-system override/rebase, and the named FA-UNIQ consumers. The
closest reusable results are conditional consumers or the already-present
cap one-hit/counting lemmas. No indexed declaration proves the live parent
contradiction.

In particular, sibling
`short_endpoint_shell_meets_adjacent_cap_card_le_one` is the same one-hit
geometry already available locally. The sibling long-apex shell bound has
positive `IsM44`, the wrong polarity for this branch.

## Kernel-checked deletion normal form

`UniqueArmDeletionNormalForm.lean` compiles with warnings as errors and proves
the exact split:

```lean
uniqueArm_deletionNormalForm :
  (class.card = 4 ∧
    ∀ x ∈ class,
      ¬ HasNEquidistantPointsAt 4 (D.A.erase x) S.oppApex1) ∨
  (class.card = 5 ∧
    FullyDeletionRobustAt D S.oppApex1 ∧
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1).
```

The component declarations are:

- `frontier_radius_pos`;
- `uniqueFour_every_classMember_blocks_firstApex`;
- `uniqueFour_firstApex_not_fullyDeletionRobust`;
- `uniqueFive_firstApex_fullyDeletionRobust`; and
- `uniqueArm_retainedPair_doubleDeletion_blocks_firstApex`.

Every printed axiom closure contains only
`propext`, `Classical.choice`, and `Quot.sound`.

This normal form is stronger than merely observing `card = 4 ∨ card = 5`:
the two arms have opposite singleton-deletion polarity. They should not be
sent through one anonymous row producer.

## Kernel-checked three-leaf public dispatch

`OriginalUniqueResidualDispatch.lean` packages the full public parent fields
and proves

```lean
originalUniqueRadiusArm_residual_dispatch :
  Nonempty (OriginalUniqueFourResidual F) ∨
    Nonempty (OriginalUniqueFiveDistinctBlockersResidual F) ∨
    Nonempty (OriginalUniqueFiveCoincidentBlockerResidual F)
```

from exactly `F`, `D.Minimal`, global no-`IsM44`, `9 < D.A.card`, and
`OriginalFrontierUniqueRadiusArm F`. It introduces no terminal hypothesis.

The exact-four leaf retains:

- every parent field;
- exact class cardinality and unique-radius data;
- deletion blocking for every class member;
- a selected pair in the strict physical cap interior; and
- T1 localization of every non-apex carrier bisector center for that pair.

The exact-five leaves first reselect a strict-interior pair whose simultaneous
deletion still preserves K4 at the second apex. Both retain full parent fields,
first-apex singleton robustness, and first-apex double-deletion blocking for
both the original and reselected pairs. The equality split then adds only
proved consequences:

- `OriginalUniqueFiveDistinctBlockersResidual` stores distinct blockers and
  T5's directed cross-deletion survival;
- `OriginalUniqueFiveCoincidentBlockerResidual` stores equal blockers, mutual
  cross membership, T1 localization of the common blocker to the strict cap
  interior and off the surplus cap, and D's exclusion of every third carrier
  bisector center.

The dispatcher compiles with `-DwarningAsError=true`. Its printed axiom
closure is exactly `propext`, `Classical.choice`, and `Quot.sound`; there is
no `sorryAx`.

## Exact-four arm

### Proven source facts

For every member of the unique exact four-class, deletion at the first apex
is blocked. Production `CriticalShellSystem.overrideExactSelectedClass` can
therefore install the first apex as the selected blocker for all four class
members. Production `CriticalSystemRebase` transports the same frontier pair
to that system.

The checked endpoint-blocker audit strengthens this: there is a valid critical
system in which both retained sources have blocker `S.oppApex1`, while the
required inequalities from `S.oppApex2` remain true. Thus selector landing at
the first apex is genuine, not an artifact.

### Invalid routes

Any claimed exact-four theorem of the form

```text
for the arbitrary supplied H,
H.centerAt q ≠ S.oppApex1
```

is false on the conditional live surface. Likewise, producing
`ExistsSurplusPairCriticalBlocker` is not a smaller task: its existing
consumer refutes that packet immediately from the frontier pair. It is an
ex-falso endpoint, analogous to the retired double-apex pair target.

### Honest remaining theorem

The exact-four closer should therefore be direct and choice-invariant:

```lean
-- OPEN / CONJECTURED
false_of_originalUniqueFourResidual
    (R : OriginalUniqueFourResidual F) : False
```

The proof must consume geometry not present in the local exact-class
abstraction: global minimality/total K4, the full MEC cap order, or a genuine
alternative support packet contradicted by `hNoM44`. A checked exact local
convex model realizes the endpoint one-hit pattern sharply, so cap-local
counting alone is insufficient.

## Exact-five arm

### Proven source facts

The first apex is fully singleton-deletion robust, but the retained pair's
double deletion is blocked there. Exact card five also permits choosing a
better frontier pair inside the strict interior of the physical opposite cap:

```lean
exists_cardFiveInteriorDoubleDeletionPair
CardFiveInteriorDoubleDeletionPair.toCriticalPairFrontier
```

Those scratch declarations preserve second-apex double-deletion survival and
make the cap-local bisector results applicable. On that interior frontier:

- distinct actual blockers force at least one directed cross-deletion
  survival (`cross_survival_of_distinct_blockers`);
- coincident blockers saturate the frontier pair's carrier bisector, excluding
  every third carrier bisector center
  (`coincident_blocker_no_third_bisector_center`); and
- every non-apex carrier bisector center is localized to the same strict cap
  interior (`interior_pair_bisector_center_mem_capInterior`).

### Invalid routes

The older packets `CardFiveDistinctCapLocalCrossHypothesis` and the residual
selected-row-through-pair packet are independently refuted by their existing
consumers. Asking to produce them merely restates the branch contradiction.
The interior-frontier construction must also not call
`false_of_originalFrontierUniqueRadiusArm` recursively; that would be a
circular re-presentation of the same hole.

### Honest remaining theorems

The exact-five closer should consume the two checked residual structures
directly:

```lean
-- OPEN / CONJECTURED
false_of_originalUniqueFiveDistinctBlockersResidual
    (R : OriginalUniqueFiveDistinctBlockersResidual F) : False

-- OPEN / CONJECTURED
false_of_originalUniqueFiveCoincidentBlockerResidual
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) : False
```

These signatures are exact because the dependent blocker notation and all
proved T1/T5/D consequences are already contained in the checked structures.
The mathematical work is now only the three direct contradictions. Do not add
another conditional occurrence structure unless it is the immediate
antecedent of a source-clean terminal and is independently realizable on the
branch surface.

The coincident arm is structurally narrower; the distinct arm already has the
directed survival fact but still needs a genuinely global consumer. Neither
is closed by the current theorem bank.

## Recommended production shape

The current public theorem is not overstrong: it is called both by the root
frontier dispatcher and by packet reorientation/redesignation paths, so it
must remain packet-generic. Its eventual implementation should call the
checked three-leaf dispatcher and invoke one direct closer per constructor.
Cap redesignation does not simplify this step: its fresh frontier's common-
deletion branch contradicts the cap size, while its other branch is precisely
the same unique-radius obligation. Calling the public theorem again on the
fresh or interior frontier would be circular.

```lean
theorem false_of_originalFrontierUniqueRadiusArm ... (hunique : ...) : False := by
  rcases originalUniqueRadiusArm_residual_dispatch
      F hmin hNoM44 hcard hunique with hfour | hdistinct | hcoincident
  · exact false_of_originalUniqueFourResidual hfour.some
  · exact false_of_originalUniqueFiveDistinctBlockersResidual hdistinct.some
  · exact false_of_originalUniqueFiveCoincidentBlockerResidual hcoincident.some
```

This is the shortest source-valid architecture. It does not itself close the
hole; the three direct branch theorems are the mathematical work.

## Effect on exact five and live closure

The production exact-five robust child no longer has a textual `sorry`; cap
redesignation routes it through this unique-radius theorem. Therefore proving
only another exact-five child adapter does **not** remove a source hole.
Closing `false_of_originalFrontierUniqueRadiusArm` does remove one of the two
current A-TAIL source sorries and makes the already-source-clean exact-five
path independent of `sorryAx` from this branch.

The other independent A-TAIL source hole remains
`false_of_frontierLargeOppositeCapsBiApexRobustResidual`.

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** the exact deletion normal form, the full
  three-leaf residual dispatcher, and all fields stored in its residuals.
- **PROVEN IN EXISTING CHECKED SCRATCH:** selector dependence in exact four;
  the strict-interior pair construction; the distinct-blocker directed
  survival; and the coincident-blocker bisector saturation.
- **SOURCE-GROUNDED NEGATIVE AUDIT:** no banked theorem closes either direct
  branch, and the named older producer packets are conditional consumers or
  ex-falso endpoints.
- **CONJECTURED / OPEN:** the three direct residual contradictions and hence
  the public unique-radius theorem.
- **NOT CLAIMED:** that the public theorem is false, that a full
  `CounterexampleData` model exists, or that no future global MEC/minimality
  argument can close it.

## Validation

From `lean/`:

```bash
lake env lean -M 8192 -DwarningAsError=true -R "$AUDIT" \
  -o "$AUDIT/UniqueArmDeletionNormalForm.olean" \
  -i "$AUDIT/UniqueArmDeletionNormalForm.ilean" \
  "$AUDIT/UniqueArmDeletionNormalForm.lean"

BASE=$(lake env printenv LEAN_PATH)
lake env env LEAN_PATH="$AUDIT:$UNIQUE_ROW:$BASE" lean \
  -M 8192 -DwarningAsError=true -R "$AUDIT" \
  -o "$AUDIT/OriginalUniqueResidualDispatch.olean" \
  -i "$AUDIT/OriginalUniqueResidualDispatch.ilean" \
  "$AUDIT/OriginalUniqueResidualDispatch.lean"
```

Here `AUDIT=../scratch/atail-force/unique-arm-route-audit` and
`UNIQUE_ROW=../scratch/atail-force/unique-row-producer`. Both commands exit
successfully. The files contain no `sorry`, `admit`, custom axiom, `unsafe`,
or `native_decide` declaration.
