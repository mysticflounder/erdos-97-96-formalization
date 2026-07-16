# R-branch fixed-row descent producer audit

## Outcome

The simultaneous-double-survival arm of
`ATailCriticalPairFrontier.FirstApexSplit` now has a source-current,
kernel-checked normal form in
`DoubleSurvivalBranchProducer.lean`.

This is a concrete strengthening of the earlier subcarrier descent, not an
ambient uniqueness lift:

- the descent retains every erased off-surplus first-apex co-radial pair;
- one **fixed second-apex radius class** is retained through every descent
  step;
- that fixed class is retained as an equal `Finset`, not merely as another
  existential K4 witness; and
- the descent terminates at a carrier with a unique card-four or card-five
  first-apex radius.

The R branch is not closed by this file.  It is reduced to one exact
transition boundary: a selected row centered in the strict surplus interior
must contain both members of some retained erased pair.

## Kernel-checked declarations

### Fixed-row one-step descent

`biApex_fixedSecondRow_step_or_firstApex_terminal` takes

- local first-apex K4 on `B`;
- a fixed radius `rho2`; and
- `4 <= (SelectedClass B S.oppApex2 rho2).card`.

It selects a distinct off-surplus co-radial pair `q,w`.  On the recursive arm
it proves

```lean
SelectedClass ((B.erase q).erase w) S.oppApex2 rho2 =
  SelectedClass B S.oppApex2 rho2
```

together with first-apex double survival and the exact two-point card drop.
On the terminal arm it proves the same fixed-row equality together with the
unique card-four/card-five first-apex row.

The equality is possible because the construction chooses `q,w` outside the
supplied fixed second-apex class; no row-reselection occurs during descent.

### Terminating descent

`exists_firstApex_terminal_with_history_and_fixedSecondRow` iterates that
step.  Its output `FirstApexTerminalWithHistory D S B rho2` contains:

- a terminal carrier `C subset B`;
- a cumulative `PairErasureHistory S B C`;
- local first-apex K4 on `C`;
- the exact fixed-row identity

  ```lean
  SelectedClass C S.oppApex2 rho2 =
    SelectedClass B S.oppApex2 rho2;
  ```

- a unique card-four/card-five first-apex terminal row; and
- survival of the same fixed second-apex row after deleting the terminal
  pair.

`PairErasureHistory.prepend_pair` is the inductive history lemma.  It proves
that every point of `B \ C` is off the surplus cap and has a distinct mate in
`B \ C` at the same distance from `S.oppApex1`.

### Source-exact R normal form

`exists_doubleSurvivalBranchNormalForm` consumes

```lean
F : CriticalPairFrontier D S r H
hfirstDouble :
  HasNEquidistantPointsAt 4
    ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
```

and uses `F.secondApexDouble` for the simultaneous second-apex witness.  It
produces `DoubleSurvivalBranchNormalForm F`, containing:

- the original R-branch proof;
- a fixed second-apex radius and its terminal fixed-row descent;
- the full ambient erased-pair history, including the original frontier pair;
  and
- an explicit nonempty co-radial erased pair.

This is exactly the R arm of `F.firstApexSplit`; it does not use the unique-row
arm or any card-11 census result.

## Exact remaining transition

`StrictSurplusRowCapturesErasedPair N` asks for:

- any co-radial pair in the retained ambient erased history;
- a center `z` in `S.capInteriorByIndex S.surplusIdx`;
- a global `SelectedFourClass D.A z`; and
- membership of both erased-pair points in that row.

`false_of_strictSurplusRowCapturesErasedPair` proves this packet impossible by
calling the existing
`RobustLiveBankAdapter.false_of_surplusInterior_row_contains_marginalPair`.
The erased history supplies ambient membership, off-surplus status,
first-apex co-radiality, and distinctness.  The capture packet supplies only
the genuinely missing second-center incidence.

`DoubleSurvivalBranchClosureProducer` packages the normal form plus that one
transition, and `false_of_doubleSurvivalBranchClosureProducer` is its final
contradiction consumer.

The next load-bearing theorem should therefore produce, for the normal form,

```lean
Nonempty (StrictSurplusRowCapturesErasedPair N)
```

or a weaker theorem which constructs its fields.  Global K4 alone constructs
`row` once `z` is known, but it does not prescribe either erased-pair support
membership.

## B0 versus ambient limitation

Let

```lean
B0 := (D.A.erase F.pair.q).erase F.pair.w
```

The fixed second-apex row is preserved exactly from `B0` through the later
descent.  It is **not** proved equal to its ambient `D.A` class.

This distinction is forced by the live source.  `F.secondApexDouble` chooses
its radius only after `F.pair.q` and `F.pair.w` have been erased.  It gives no
proof that either original frontier source avoids that radius in `D.A`.
Consequently, promoting

```lean
SelectedClass C S.oppApex2 rho2 = SelectedClass B0 S.oppApex2 rho2
```

to equality with `SelectedClass D.A S.oppApex2 rho2` would be an unsupported
ambient lift.  The normal form keeps the fixed-row theorem relative to `B0`
and separately prepends the original pair only to the ambient erasure
history.

This is also the concrete theorem/countermodel boundary: an incidence-only
argument may keep a four-point second-apex row unchanged on every later
carrier while assigning every strict-surplus selected row away from each
erased pair.  The current hypotheses contain no prescribed support edge that
rules out that assignment.  This is not claimed as a Euclidean counterexample
to Problem 97; it shows only why the final row-incidence field is not a
bookkeeping consequence of the fixed-row descent.

## Theorem-bank preflight

The required registries were checked before introducing the local lemmas:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and its JSON inventory;
- `certificates/erdos97_legacy_general_n_mining.md` and its JSON inventory;
  and
- `certificates/erdos_general_theorem_p97_mining.md` and its JSON inventory.

The focused indexed searches were:

```text
nthdegree docs search --lean \
  "simultaneous double deletion preserves one fixed second apex selected class through subcarrier descent"

nthdegree docs search --lean \
  "strict surplus interior selected row contains both members of an erased coradial pair"
```

The first search returned the production pair-selection and second-apex split
lemmas already used here.  Neither search nor the registries supplied the
fixed-row descent theorem or the missing strict-surplus row-incidence
producer.

## Predecessor source-current repair

The focused validation initially exposed a proof-script drift in
`scratch/atail-force/double-survivor-consumer/DoubleSurvivorConsumer.lean`:
`DoubleSecondApexFrontier.toCriticalPairFrontier` predated the production
`secondApexDouble` field.  The adapter now copies `F.secondApexDouble`, and a
fresh direct check of the predecessor exits `0` with only `propext`,
`Classical.choice`, and `Quot.sound`.  This was a stale constructor script,
not a mathematical gap in either descent.

## Validation

The unimported robust-bank dependencies were compiled to
`/tmp/p97-double-survival-branch`.  The final direct check from `lean/` was:

```bash
env LEAN_PATH=/tmp/p97-double-survival-branch \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/double-survival-branch-producer/DoubleSurvivalBranchProducer.lean
```

It exited `0`.  Every printed endpoint depends exactly on:

```text
propext, Classical.choice, Quot.sound
```

The scratch directory contains no `sorry`, `sorryAx`, `admit`, or
`native_decide`.  No production Lean file, `SurplusM44`,
`SevenPointTwinFourCircleCollision`, unique-row file, or `(6,5,4)` file was
edited.
