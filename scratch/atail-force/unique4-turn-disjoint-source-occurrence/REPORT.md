# Exact-two turn-disjoint source occurrence audit

Date: 2026-07-22

Status: **SOURCE-CLEAN ROW AND TERMINAL INTERFACES KERNEL-CHECKED. THE UNIFORM
FOUR-ARC OCCURRENCE REMAINS OPEN AND IS BLOCKED AT THE COARSE SELECTED-ROW
LEVEL BY EXACT CYCLIC SAT REGRESSIONS.**

## Result

[`UniqueFourTurnDisjointSourceOccurrence.lean`](UniqueFourTurnDisjointSourceOccurrence.lean)
formalizes the source boundary around the checked aggregate terminal.  It
reuses, rather than duplicates, the landed selected-class adapter in

```text
scratch/atail-force/unique4-selected-class-curvature-adapter/
  SelectedFourClassCurvature.lean
```

The source-clean reductions are:

1. `exactFourFirstApexRow` turns the complete exact first-apex class in
   `OriginalUniqueFourResidual` into a `SelectedFourClass`.
2. `exactFourFirstApexRow_capDistribution` proves its exact `2+1+1` cap
   distribution from `ExactTwoStrictHitDistribution`.
3. `exactFourFirstApexRow_has_globalSelectedQuarterTurnArcs` gives the two
   transported outer quarter-turn arcs for that actual row.
4. `exists_boundary_with_globalK4_selectedQuarterTurnArcs` chooses one actual
   selected four-point equal-radius row at every carrier center from `D.K4`
   and places every row in one common global boundary lift.
5. `IsSelectedRowOuterArc` records exact row provenance for either outer arc.
   Its right-arc constructor also supports moving the arc back by one carrier
   period, with curvature preserved by the production transport theorem.
6. `FourTurnDisjointSelectedRowArcs` is the strict-open-window occurrence packet:
   four actual selected rows, four proven outer arcs in one chart, and the
   three exact turn-support gaps `bᵢ - 1 ≤ aᵢ₊₁`.
7. `false_of_fourTurnDisjointSelectedRowArcs` sends that packet directly to
   `ShellCurvature.false_of_four_turnDisjoint_quarter_turn_arcs` and proves
   `False`.
8. `FourTurnCoveringSelectedRowArcs` and its direct-`False` consumer handle
   the complementary cyclic case in which the four supports partition a
   complete boundary period.  The period start may be any lifted index, and
   the consumer uses `edgeLift_add_period`.

The conditional exact-two theorem

```lean
false_of_exactTwo_of_fourTurnDisjointSelectedRowArcs
```

therefore closes the leaf as soon as the occurrence packet is produced.  It
does not pretend to produce the packet from `R` and the distribution.

## Finite common source shape

The corrected 12-record exact-two quotient has a smaller common coarse schema:
three selected rows suffice.  Two centers in the fixed blocker image
contribute one source-chosen outer arc each; one carrier-wide K4 completion row
contributes both of its outer arcs.  The two fixed sides need not both be
literal left arcs in the fixed CCW chart; quotient reflection is not a free
source operation.  There is no common exact local-offset pattern and no
common exact dihedral row schema.  Seven common provenance schemas occur, and
none uses only two rows.

The file therefore also defines the smaller packet

```lean
FourTurnDisjointLeftSelectedRows D
```

and proves

```lean
false_of_fourTurnDisjointLeftSelectedRows
    (P : FourTurnDisjointLeftSelectedRows D) : False
```

This four-left-arc special case remains checked, but it is no longer the
preferred source target.  The preferred theorem should construct the generic
three-row packet above and permit the completion row to contribute both
sides.  The 12-record observation is exact finite evidence only; it is not
arbitrary-cardinality coverage.

## Exact regression gate

The sibling audit

```text
scratch/atail-force/unique4-global-k4-curvature-packing/
```

contains exact cyclic `n = 11` SAT models for both physical exact-two cap
profiles.  Each profiled model has:

- one nonself selected four-row at every center;
- the exact first-apex `2+1+1` distribution;
- a strongly connected selected-row digraph;
- no four pairwise turn-disjoint outer arcs; and
- an exact rational scalar-turn assignment satisfying both strict
  quarter-turn inequalities at every center and the full turn budget.

Thus no proof may derive the occurrence from only one arbitrary global-K4 row
selection, the `2+1+1` distribution, strong connectivity, and the scalar
curvature inequalities.  This is a regression gate against the overstrong
combinatorial packing lemma initially suggested by the positive 12-record
audit.

These SAT models are not Euclidean realizations and are not models of
`OriginalUniqueFourResidual`.  They omit complete radius partitions, the
actual fixed critical map and its exact supports, deletion criticality, MEC
geometry, and `noM44`.  Consequently they do not refute the full source-level
occurrence theorem.  They show that a valid proof must visibly use additional
fields already retained by `R`/`F`/`H`, such as:

- exact complete classes and two-circle/cyclic-alternation restrictions;
- the fixed critical system and deletion-critical source-to-blocker map;
- universal minimality across row choices rather than one selected graph;
- MEC/cap geometry; or
- the alternative-triangle content of `noM44`.

The first genuinely missing producer is therefore an aggregate disjunction:

```lean
-- Conjectured, not declared with `sorry` in this lane.
exists_threeRow_turnTerminal_of_exactTwo
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (FourTurnDisjointSelectedRowArcs D) ∨
      Nonempty (FourTurnCoveringSelectedRowArcs D)
```

Its proof should choose the single completion row late.  It must not fix an
arbitrary carrier-wide row system and then invoke a packing principle, because
the exact SAT regressions satisfy that weaker interface.

## Hypothesis accounting

| Source input | Kernel-checked consequence in this lane |
|---|---|
| `R.class_card_eq_four` and `frontier_radius_pos F` | actual exact first-apex selected row |
| `ExactTwoStrictHitDistribution R` | exact `2+1+1` support distribution of that row |
| `D.K4` | a selected four-point equal-radius row at every carrier center |
| `D.convex` and the carrier cardinality bound | one common shell boundary indexing |
| selected-class curvature adapter | two transported strict quarter-turn arcs per row |
| four ordered turn-disjoint arcs | direct contradiction via the aggregate terminal |

The missing arrow is the penultimate selection step.  No field is silently
treated as if it supplied that occurrence.

## Theorem-bank preflight

The required registered P97 banks were searched before formalization:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered selected four classes,
global-K4 row choice, centered support ordering, transported quarter-turn
arcs, and four-row occurrence consumers.  The searches found the production
critical-shell transport and the newly landed selected-class adapter, but no
uniform four-arc occurrence theorem.

## Validation

The imports include three untracked scratch modules, so validation first
compiled them into a temporary module directory.  From `lean/`, the replay is:

```bash
mkdir -p /tmp/unique4-turn-disjoint-source-modules

LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:/tmp/unique4-turn-disjoint-source-modules \
lake env lean -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-class-cap-distribution \
  -o /tmp/unique4-turn-disjoint-source-modules/UniqueFourClassCapDistribution.olean \
  ../scratch/atail-force/unique4-class-cap-distribution/UniqueFourClassCapDistribution.lean

lake env lean -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-selected-class-curvature-adapter \
  -o /tmp/unique4-turn-disjoint-source-modules/SelectedFourClassCurvature.olean \
  ../scratch/atail-force/unique4-selected-class-curvature-adapter/SelectedFourClassCurvature.lean

lake env lean -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-turn-disjoint-curvature-terminal \
  -o /tmp/unique4-turn-disjoint-source-modules/TurnDisjointCurvatureTerminal.olean \
  ../scratch/atail-force/unique4-turn-disjoint-curvature-terminal/TurnDisjointCurvatureTerminal.lean

LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:/tmp/unique4-turn-disjoint-source-modules \
lake env lean -DwarningAsError=true \
  -R ../scratch/atail-force/unique4-turn-disjoint-source-occurrence \
  ../scratch/atail-force/unique4-turn-disjoint-source-occurrence/UniqueFourTurnDisjointSourceOccurrence.lean
```

Result: exit 0.  Every printed declaration has axiom closure exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.  No production Lean, shared plan,
proof-blueprint state, or other scratch lane was edited.
