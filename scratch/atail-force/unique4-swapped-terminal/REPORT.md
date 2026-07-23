# Unique-four swapped-terminal audit

Date: 2026-07-22

Scope: scratch only. This lane asked whether the swapped-first-apex
constructor of `ExactFourPhysicalConsumerOutcome` can be closed while
retaining the original `OriginalUniqueFourResidual` and its
`ExactFourPhysicalCommonDeletionIngress`, rather than rebasing and returning
to the same open theorem.

## Preflight

The theorem-bank registries required by `AGENTS.md` and the indexed Lean
corpus were searched before proving new local facts. The closest applicable
bank is:

```lean
ATailContinuationBankMatchScratch
  .biApex_two_by_two_survival_normal_form

ATailContinuationBankMatchScratch
  .biApex_three_center_two_deletion_coupling
```

No existing theorem was found that consumes either bank output together with
the original exact-four residual and proves `False`.

## PROVEN: source-faithful coupling

`SwappedExactFourCoupling.lean` proves, without `sorryAx`, that the swapped
constructor is not merely another independent copy of the original branch.
Keeping the original residual `R`, its ingress, and the swapped frontier
gives all of the following.

1. The ingress row at the physical second apex is the complete swapped
   unique exact-four class:

   ```lean
   ingress.packet.B₂ = (swappedPhysicalSecondClass X).support
   ```

2. The original retained pair avoids the swapped exact class.

3. The swapped retained pair avoids the original exact class.

4. The two retained pairs are disjoint and their union has cardinality four.

5. The ingress's other center is distinct from both physical apices.

6. The original exact class contains at least two points in the strict first
   opposite-cap part, and the swapped exact class contains at least two
   points in the strict second opposite-cap part.

7. The two exact classes meet in at most two points.

These facts are packaged as:

```lean
CoupledSwappedExactFourSurface R
```

and produced by:

```lean
nonempty_coupledSwappedExactFourSurface
```

The proof crucially uses complete ambient exact classes and both
double-deletion frontiers; it does not identify arbitrary selected rows with
ambient classes.

## PROVEN: the continuation bank applies, but is nonterminal

From the two strict-cap cardinality bounds one can choose distinct

```text
a,b   in the original first-apex exact class and strict oppCap1,
z₁,z₂ in the swapped second-apex exact class and strict oppCap2.
```

The existing two-by-two continuation theorem then yields exactly four arms:

```lean
Nonempty (CommonDeletionTwoCenterPacket D H a z₁ z₂) ∨
Nonempty (CommonDeletionTwoCenterPacket D H b z₁ z₂) ∨
Nonempty (CrossedCriticalNormalForm D H K₁ a b z₁ z₂) ∨
Nonempty (CrossedCriticalNormalForm D H K₁ b a z₁ z₂)
```

This does not close the branch:

- a `CommonDeletionTwoCenterPacket` supplies two q-deleted rows and an
  intersection upper bound, but not the two common outside support points
  required by
  `false_of_two_strictOppCap2_rows_common_outside_pair`;
- a `CrossedCriticalNormalForm` supplies the two crossed survivals, two
  critical rows, and forced cross omissions, but no dangerous-triple packet,
  common outside pair, or named metric tail consumed by a terminal; and
- `biApex_three_center_two_deletion_coupling` only changes which two centers
  share a deletion. It also produces a `CommonDeletionTwoCenterPacket`, not
  `False`.

No adapter to these already-nonterminal outputs was added.

## EMPIRICALLY VERIFIED: full linear cap order does not close the surface

`audit_coupled_surface_lra.py` enumerates source-shaped exact-four supports on
an eleven-role cyclic boundary and checks:

- all triangle inequalities;
- both strict Kalmanson inequalities for every cyclic quadruple;
- a unique complete exact-four class at each physical apex;
- the proved two-strict-point cap distributions;
- the cap-chain one-hit condition for every row center (at most one
  equal-radius hit on each side in every incident cap), including the exact
  endpoint one-hit restrictions at both physical apices;
- intersection at most two, hence room for disjoint retained pairs;
- deletion of an original-class point while the second class survives; and
- a third-center unique exact-four ingress row with overlap at most two.

Run:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --offline --with z3-solver \
  python -B \
  scratch/atail-force/unique4-swapped-terminal/audit_coupled_surface_lra.py
```

The exact QF_LRA result is `SAT`. One reported fixture is:

```text
first_support  = (1, 5, 6, 7)
second_support = (0, 5, 8, 9)
deleted        = 1
third center   = 3
third support  = (2, 4, 5, 10)
```

Evidence boundary: this is exact only within the displayed finite
distance/Kalmanson abstraction. It is not a Euclidean coordinate
realization, a `CounterexampleData`, a globally coherent
`CriticalShellSystem`, or a model of minimality/no-M44. It rules out treating
the currently proved incidence plus full linear cap-order inequalities as an
automatic contradiction.

## BLOCKED: first exact terminal coverage gap

After applying the existing continuation theorem, the first missing
source-level result is a **terminal coverage theorem**, not another
normal-form producer:

```lean
false_of_coupledSwapped_twoByTwoOutcome
    (R : OriginalUniqueFourResidual F)
    (C : CoupledSwappedExactFourSurface R)
    {a b z₁ z₂ : ℝ²}
    (ha hb hz₁ hz₂ : -- the four strict-cap memberships)
    (hout :
      Nonempty (CommonDeletionTwoCenterPacket D H a z₁ z₂) ∨
      Nonempty (CommonDeletionTwoCenterPacket D H b z₁ z₂) ∨
      Nonempty (CrossedCriticalNormalForm D H K₁ a b z₁ z₂) ∨
      Nonempty (CrossedCriticalNormalForm D H K₁ b a z₁ z₂)) :
    False
```

For either same-column arm, the narrowest currently known terminal would be
fed by the still-unproved source implication

```text
there are distinct u,v outside oppCap2 that lie in both q-deleted rows.
```

For either crossed arm, the first missing implication is an occurrence of a
currently terminal packet: either such a two-row common outside pair, a
dangerous-triple incidence packet, or a named Kalmanson/shell-curvature
metric tail. None is supplied by the crossed normal form or by the retained
original ingress.

The QF_LRA fixture shows that this missing implication must use information
beyond the present finite incidence and linear cap-order surface: nonlinear
Euclidean/MEC geometry, globally coherent full-fiber provenance, global
minimality/K4, or no-M44.

## Validation

From `lean/`:

```bash
LEAN_PATH="../scratch/atail-force/unique4-swapped-terminal:\
../scratch/atail-force/unique4-source-closer:\
../scratch/atail-force/unique4-late-choice-terminal:\
../scratch/atail-force/unique4-uniform-route-audit:\
../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
../scratch/atail-force/card-five-interior-critical-frontier:\
../scratch/atail-force/card-five-interior-bisector-localization:\
../scratch/atail-force/biapex-continuation-grid:$LEAN_PATH" \
lake env lean --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-swapped-terminal/SwappedExactFourCoupling.olean \
  ../scratch/atail-force/unique4-swapped-terminal/SwappedExactFourCoupling.lean
```

All printed declarations report only:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`.
