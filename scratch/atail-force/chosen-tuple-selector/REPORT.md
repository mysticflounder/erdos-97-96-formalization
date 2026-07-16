# Chosen continuation tuple audit

Date: 2026-07-15

Status: **KERNEL-CHECKED EXACT CHOICE FACTORIZATION, FIXED-DISPATCH AND
FULL-PARENT PROP EQUIVALENCES; NO CLOSING TUPLE PRODUCED.**

This directory audits the current choice-explicit full-parent surface in
`critical-system-rebase/ExistentialParentSurface.lean`.  It is scratch-only
and does not edit production Lean, shared closure documents, `SurplusM44`, or
the user-owned unique-row lane.

## Exact epistemic correction

For one fixed pair of continuation rows, write the routed alternatives as
`Cross`, `NonEquilateral`, and `Equilateral`.  The existing definition is
logically

```text
RoutedBranchEliminator branch =
  (Cross ∧ (Cross -> False))
  or (NonEquilateral ∧ (NonEquilateral -> False))
  or (Equilateral ∧ (Equilateral -> False)).
```

Consequently the new theorem

```lean
routedBranchEliminator_iff_false
```

proves, for every
`branch : RoutedContinuationBranch H P`, that

```lean
RoutedBranchEliminator branch ↔ False.
```

It needs only the type of the fixed rows and the routed proof term.  It uses
no frontier nonemptiness, cap cardinality, MEC placement, no-`IsM44`, live U1
data, or other parent hypothesis.

The theorem

```lean
routedBranchEliminator_iff_allAlternativesImpossible
```

also proves equivalence with the three callbacks

```text
(Cross -> False)
and (NonEquilateral -> False)
and (Equilateral -> False)
```

for that same fixed `P`.  The forward direction first obtains `False`; the
reverse direction applies the stored exhaustive routed disjunction.  Thus the
branch-local presentation may be operationally convenient, but it is **not a
mathematically weaker payload than all three callbacks at the already chosen
dispatch**.

The same rigor correction applies to the outer surface.  For fixed parent
parameters, the new theorems

```lean
chosenParentContent_iff_false
universalLateContent_of_chosenParentContent
chosenParentContent_iff_universalLateContent
```

prove

```text
ChosenLateCriticalSystemParentContent ↔ False
ChosenLateCriticalSystemParentContent ↔ LateCriticalSystemParentContent.
```

The reverse implication from chosen to universal content is ex falso:
`false_of_twoLargeCaps_of_chosenLateContent` first closes the parent, and
`False.elim` then supplies every universally quantified callback.  The
existing `chosenParentContent_of_universalLateContent` supplies the other
direction.  There is no type-level obstruction.

Therefore neither the branch-only payload nor the existential full-parent
surface is a logically weaker proposition under the fixed parent telescope.
The different quantifier order remains operationally meaningful for direct
proof construction and theorem discovery: one may aim to exhibit one tuple
instead of explicitly defining callbacks for every tuple.  But that is a
proof-search/interface distinction, not an implication-strength claim in
`Prop`.  No direct construction of the universal callbacks from selected
geometric data has been proved; their reverse adapter intentionally factors
through `False`.

## Exact factorization of the outer choices

Independently of that full-`Prop` equivalence,
`chosenParentContent_iff_independent_cap_and_continuation` factors the
internal existential expression of
`ChosenLateCriticalSystemParentContent` as

```text
SecondLargeCapChoice CP i
and
ChosenFrontierClosingContinuation D S Hinitial.
```

The chosen second-cap index `j`, its inequality `j != i`, and its cardinality
proof are not used by the radius, frontier, second-apex row, continuation
rows, late critical system, routed proposition, or eliminator.  Under the
current type, choosing a more favorable second large cap cannot affect which
continuation branch is reached.  A future proof which needs that geometry
must add an explicit role map from `CP.capAt j` into the selected tuple.

The continuation choice is also exact.  The definition

```lean
geometricContinuationOfChoices
```

constructs a `GeometricFrontierContinuation F` from any

```text
K : FrontierSecondApexRow F
P : TwoContinuationRows (rebasePacket D S) K.row.
```

All four inequalities saying that `P.z₁,P.z₂` differ from the frontier
sources follow from support membership and `K.q_not_mem/K.w_not_mem`.
`nonempty_geometricContinuation_iff_explicit_row_choices` proves the converse
as well.

There is a further API fact worth keeping visible: a
`FrontierSecondApexRow F` stores only a selected row at `S.oppApex2` which
omits `F.pair.q,w`.  Its type does not identify the row radius or support
with the concrete twice-erased witness in `F.secondApexDouble`.  The standard
constructor obtains such a row by trimming that witness, but the existential
parent surface is permitted to choose any row satisfying the two omissions.

## Selection freedom by layer

The available choices currently contribute the following information.

1. **Second-large-cap index.** It supplies only an independent cardinality
   witness.  No selected point, row, center, radius, or frontier role depends
   on it.
2. **First-apex radius and frontier.** The frontier selects its retained
   source pair and carries the twice-erased second-apex existence theorem.
   No current theorem selects a frontier whose later continuation is known
   to close.
3. **Trimmed second-apex row.** The existential API may choose any selected
   second-apex row omitting the two frontier sources, not only the canonical
   trimmed witness.
4. **Continuation centers and global rows.** Any two distinct strict-cap
   support points of that row and any global-K4 rows at those centers are
   admissible.  Global K4 controls existence, not the support incidences
   required by the closed consumers.
5. **Late critical system.** It can be chosen after all labels are known and
   can install certified shells by pointwise override.  It does not alter the
   cross-survival or equilateral geometry.  In the non-equilateral arm it
   changes the retained critical-map packaging, but no current override
   theorem forces the missing reverse incidence or terminal cap placement.

The theorem-bank and source audit found no theorem which jointly selects
these layers into a closed branch.

## Narrow positive adapter

The smallest concrete closed selection formalized here is

```lean
NonEquilateralCommonHitChoice F
```

It contains one explicit frontier-compatible second-apex row, one pair of
continuation rows, one late system, the actual
`NonEquilateralOutput`, and one `StrictOppCap1CommonHit`.  The existing theorem
`false_of_nonEquilateral_of_strictOppCap1CommonHit` eliminates precisely that
selected tuple.  The checked adapters are

```lean
NonEquilateralCommonHitChoice.routedEliminator
NonEquilateralCommonHitChoice.lateCriticalSystemBranchContent
chosenParentContent_of_nonEquilateralCommonHitTuple
```

The last theorem gives an operational proof of the exact existential
full-parent content without explicitly constructing callbacks for alternative
cap indices, radii, frontiers, rows, or systems.  This demonstrates that a
deliberately chosen tuple hitting an existing consumer would be enough for a
direct proof, without asserting a logical weakening relative to the
universal content proposition.

It does **not** produce that tuple.  Indeed, the actual non-equilateral
support theorem proves only a surplus-heavy row or two distinct exclusive
strict-cap witnesses.  It does not produce a strict common hit.  The
`RoutedBranchEliminator ↔ False` result explains why a pure choice theorem
cannot fill this final field: any successful inhabitant is already the
contradiction being sought.

The exact missing ingredient is therefore a content theorem, not more
existential packaging:

> exhibit one explicit admissible tuple together with a terminal antecedent
> consumed by its realized branch, using a genuine link from the parent
> cap/MEC/global-K4 data to the selected row supports.

For the concrete adapter above that antecedent is
`StrictOppCap1CommonHit`.  Other valid branch-specific choices remain the
documented omission/distinct-radius packet in cross survival or the
LowHit/reverse-mixed terminal antecedents in the equilateral branch.

## Exact finite regression

`TupleSelectionCountermodel.lean` is a kernel-checked finite incidence
shadow, not a Euclidean counterexample.  It contains:

- a `(5,5,5)` three-cap profile;
- a four-point apex row omitting two frontier sources;
- two distinct continuation centers on that apex row;
- two four-point continuation rows which contain each other's centers and
  omit the apex; and
- two syntactic choices at each of the six layers: second cap, radius,
  frontier, apex row, continuation rows, and critical system.

Every tuple routes to the same abstract non-equilateral profile.  For all
choices, the apex row contains the deleted continuation center, so there is
no alternate apex omission, and the two continuation rows have distinct
strict-first-cap witnesses rather than a strict common hit.  The aggregate
theorem is

```lean
every_tuple_remains_open
```

This is **PROVEN within the displayed finite incidence abstraction**.  It is
not a `CounterexampleData`, does not encode Euclidean distances, convex/MEC
order, global K4 semantically, or a total deletion-critical shell system, and
therefore does not refute a geometric parent producer.  It is a regression
against the invalid inference that several nonempty choice sets alone force
one choice into a closed sink.

## Theorem-bank preflight

Before deriving these declarations, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean-corpus searches covered selected four-classes,
continuation rows, deletion-surviving apex radii, two-large-cap selection,
critical frontiers, and cap-local row placement.  The closest reusable
results were the existing global-K4 row existence theorem, the frontier's
double-deletion pair selection, and the already catalogued branch consumers.
The sibling U1/U5 banks still require explicit row placement/incidence data.
The older C5D3B candidates carrying stronger large-cap localization assume
`D.IsM44`, opposite to this lane's no-`IsM44` parent surface.  No registry or
indexed declaration supplies the selected closed tuple.

## Validation and rigor

From `lean/`, both files were checked as deliberate single-file scratch
validations against the current project toolchain and source-derived scratch
oleans:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/chosen-tuple-selector \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/ChosenTupleSelector.olean \
  ../scratch/atail-force/chosen-tuple-selector/ChosenTupleSelector.lean

LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/chosen-tuple-selector \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/TupleSelectionCountermodel.olean \
  ../scratch/atail-force/chosen-tuple-selector/TupleSelectionCountermodel.lean
```

Both commands exited successfully.  Every printed declaration uses only
`propext`, `Classical.choice`, and `Quot.sound` (some finite helper theorems
use a strict subset).  There is no `sorryAx`, `admit`, declared axiom,
`native_decide`, or generated solver trust boundary.

- **PROVEN:** fixed-dispatch eliminator equivalence to `False`; equivalence
  to the three fixed-dispatch callbacks; chosen full-parent content
  equivalence to `False` and to universal late content; outer
  cap/continuation expression factorization; exact explicit K/P continuation
  choice; and the narrow non-equilateral direct adapter.
- **PROVEN WITHIN A FINITE INCIDENCE ABSTRACTION:** multiplicity of all six
  choices does not force apex omission or a strict common hit.
- **OPEN:** production of any terminal-bearing selected tuple from the full
  Euclidean parent hypotheses.
- **NOT RUN:** production target, full `lake-build`, proof-blueprint refresh,
  and publication gates; this lane is scratch-only.
