# Scratch card-17 bound

## Result

`Card17Bound.lean` kernel-checks the counting lemma

```lean
card_le_seventeen_of_secondOpposite_exactBudget
```

from `6 ≤ S.oppCap2.card` and the exact budget
`S.oppCap2.card + 6 = D.A.card`.  The growth-arm wrapper

```lean
card_le_seventeen_of_secondOpposite_growthArm
```

uses `P.surface.capGrowth`, an explicit identification with
`ExactFourRobustCapGrowth.secondOpposite profile`, `S.capSum`, and the exact
fields of `ExactFourSecondOppositeCapGrowth`.

The proof obtains a `FaithfulCarrierPattern D.A` from
`exists_faithfulCarrierPattern_of_globalK4 D.K4 P.u.2`, extracts ordered-cap
data for `S.oppIndex2` with `S.capByIndex_cgn4g_capData`, identifies its image
with `S.oppCap2`, and applies
`CapSelectedRowCounting.orderedCap_card_add_four_le_choose_outside`.  The exact
budget makes the outside carrier have card 6, so

```text
|oppCap2| + 4 ≤ choose 6 2 = 15,
```

hence `|oppCap2| ≤ 11` and `D.A.card = |oppCap2| + 6 ≤ 17`.

## Check

Run from the Lake root `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/rigid221-sourceheavy-anchor/card17-bound/Card17Bound.lean
```

Exit status: 0.  The three `#print axioms` checks report only `propext`,
`Classical.choice`, and `Quot.sound`; none depends on `sorryAx`.

## Blocker at the active anchor

The active `secondOppositeLarge` constructor retains only
`6 ≤ S.oppCap2.card`.  `P.surface.capGrowth` is a three-way inductive value:
`surplus`, `firstOpposite`, or `secondOpposite`.  The lower bound on
`S.oppCap2.card` does not eliminate the first two constructors, and only the
third carries `S.oppCap2.card + 6 = D.A.card`.  Therefore the unconditional
active-anchor statement `D.A.card ≤ 17` is not derivable from the named inputs
currently exposed; it needs a proof that `P.surface.capGrowth` is the
`secondOpposite` arm (or an independently supplied exact budget).

No production files were edited.
