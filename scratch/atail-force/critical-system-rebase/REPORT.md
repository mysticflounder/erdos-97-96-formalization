# Critical-system rebase audit

Status: **SOURCE-CURRENT SCRATCH; KERNEL CHECKED.**

## Result

The survivor pair and both apex deletion facts in a
`CriticalPairFrontier D S r H` are independent of the chosen
`CriticalShellSystem H`.  `CriticalSystemRebase.lean` proves:

- `rebaseSurvivorPairCriticalSystem`: the same `q,w`, marginal membership,
  distinctness, and deletion-survival witnesses form a relocation packet for
  every other system `H'`;
- `rebaseCriticalPairFrontierSystem`: the complete frontier transports to
  `H'` without changing the pair or either apex split;
- `nonempty_rebaseCriticalPairFrontierSystem`: frontier existence at one
  system implies frontier existence at every system; and
- `overrideCriticalPairFrontierAt`: after selecting the geometric frontier,
  one may use the existing certified pointwise critical-shell override and
  transport the same frontier to the overridden system.

Every printed endpoint uses only `propext`, `Classical.choice`, and
`Quot.sound`.

## Closure impact

This proves that the source-order can be refactored honestly:

```text
select geometric survivor pair/frontier
  -> choose or sourcewise-override a critical system
  -> run the blocker/continuation classifier
```

Consequently, failure to prove an incidence for an *arbitrary* retained
critical-map choice is not evidence that no favorable critical shell exists.
The choice-late presentation is the useful construction order when a proof
wants a favorable shell rather than a uniform incidence theorem.

The file does **not** construct a favorable system.  A pointwise override
still requires a certified `CriticalSelectedFourClass` and its deletion-
failure proof.  The remaining mathematical question is existence of an
override whose selected shell supplies the branch terminal, not transport of
the already selected frontier.

## Choice-first parent surface

`FavorableSystemParentSurface.lean` also removes a second unnecessary
universal quantifier.  The earlier `FrontierContinuationEliminators F` asks
for callbacks for every trimmed second-apex row and every pair of globally
selected continuation rows.  The dispatcher and parent only need one concrete
choice.  The checked replacement asks for:

```text
one favorable critical system Hfav
+ one FrontierContinuationDispatch at the rebased frontier
+ callbacks for that dispatch's three routed propositions
```

`false_of_chosenContinuationEliminators` closes the selected routed branch,
and
`commonCriticalMapClosingProducer_of_favorableSystemContent` converts this
dependent-choice contract to the existing direct-`False` parent producer.  It
preserves the full parent hypothesis telescope.  This contract stores less
data, but it is not logically weaker: after composition with the closer it is
equivalent to `False`, as is the universal contract by `False.elim`.

## Branch-only correction

`FavorableRoutedBranchSurface.lean` makes the stored payload branch-local.
Even after choosing one dispatch, `ChosenContinuationEliminators` supplies
callbacks for all three mutually exclusive routed propositions.  The actual
parent needs only:

```text
one favorable critical system Hfav
+ one FrontierContinuationDispatch at the rebased frontier
+ the consumer selected by that dispatch's carried branch
```

`FavorableRoutedBranchContent` states this contract using
`ChoiceFirstFrontierContinuationContent`, and
`commonCriticalMapClosingProducer_of_favorableRoutedBranchContent` reaches the
same parent direct-`False` surface.  The older three-callback content implies
the branch-only surface by
`favorableRoutedBranchContent_of_favorableSystemContent`.  The later
chosen-tuple audit proves the exact fixed-dispatch result
`routedBranchEliminator_iff_allAlternativesImpossible`: because the dispatch
already carries one exhaustive routed branch, its branch-local eliminator,
all three callbacks, and `False` are propositionally equivalent.  The
branch-local form is therefore an operational normal form, not a mathematical
weakening.

`LateCriticalSystemSurface.lean` then exposes an equivalent operational order.
`GeometricFrontierContinuation` contains the trimmed second-apex row,
continuation centers, and global continuation rows with no dependency on a
critical system.  It can be routed at any later `Hfav`.  The two local adapter
theorems prove equivalence between:

```text
choose Hfav, then one choice-first dispatch
```

and

```text
choose continuation geometry, then Hfav, then route it
```

`commonCriticalMapClosingProducer_of_lateCriticalSystemParentContent` carries
the latter order through the full parent telescope.  This does not weaken the
mathematical obligation further, but it permits sourcewise shell overrides to
depend on the concrete continuation labels, which is the useful order for the
LowHit, common-deletion, and reverse-mixed consumers.

This changes the correct mining object.  A local regression showing that one
arbitrary selected row or critical map survives does not refute existence of a
different favorable choice.  Future producer work should select the frontier,
critical system, and continuation rows dependently, then close only the branch
actually returned.

## Outer-existential correction

`ExistentialParentSurface.lean` audits the remaining outer quantifiers.  The
direct parent adapter does not receive an arbitrary second-large-cap index,
K4 radius, or frontier: it constructs one witness of each existential and
uses only that tuple.  Therefore a proof can follow the parent's existential
choice order instead of constructing the universal outer surface
`LateCriticalSystemParentContent`.

The exact chosen-data contract is

```text
one second-large-cap index j
+ one positive first-apex K4 radius r
+ one CriticalPairFrontier F at r
+ one GeometricFrontierContinuation G
+ one late favorable CriticalShellSystem Hfav
+ the eliminator for (G.toDispatch Hfav).branch
```

This is packaged as `ChosenLateCriticalSystemParentContent`.
`false_of_twoLargeCaps_of_chosenLateContent` consumes it directly, without
first constructing the universally quantified
`CommonCriticalMapClosingProducer`.  Conversely,
`chosenParentContent_of_universalLateContent` proves that the older universal
surface implies the chosen surface by taking exactly the existential
witnesses already used in the parent proof.  This one-way adapter is not a
strict-strength result: both closing content propositions imply `False`, and
`False` reconstructs either proposition by elimination.

The downstream kernel audit makes this exact with
`chosenParentContent_iff_false`,
`universalLateContent_of_chosenParentContent`, and
`chosenParentContent_iff_universalLateContent` in
`chosen-tuple-selector/ChosenTupleSelector.lean`.

This is now the smallest choice-explicit full-parent proof shape.  It permits
a proof implementation to focus on one second large cap, K4 radius, frontier
pair, continuation geometry, and late system, but selection itself contributes
no mathematical force.  The chosen-tuple audit proves
`routedBranchEliminator_iff_false` from the carried branch alone.  Branch-local
normal forms remain useful for candidate constructions and regressions; a
selected tuple is useful only when additional geometry actually contradicts
its routed branch.

## Validation

From `lean/`:

```bash
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/critical-system-rebase/CriticalSystemRebase.lean

LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/critical-system-rebase -M 16384 \
  ../scratch/atail-force/critical-system-rebase/FavorableSystemParentSurface.lean

LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R .. -M 16384 \
  ../scratch/atail-force/critical-system-rebase/FavorableRoutedBranchSurface.lean

LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R .. -M 16384 \
  ../scratch/atail-force/critical-system-rebase/LateCriticalSystemSurface.lean

LEAN_PATH=/tmp/p97-joint-transition-oleans:/tmp/p97-mixed-parent-coupling \
  lake env lean -R ../scratch/atail-force/critical-system-rebase -M 16384 \
  ../scratch/atail-force/critical-system-rebase/ExistentialParentSurface.lean
```

The command exits `0`; the source has no `sorry`, `admit`, declared axiom,
`unsafe`, or `native_decide`.
