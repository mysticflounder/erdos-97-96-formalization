# Lean consumer for finite Kalmanson/Farkas cores

Date: 2026-07-17

Status: **SCRATCH INFRASTRUCTURE; KERNEL-CHECKED; NO NEW PRODUCER OR COVERAGE
CLAIM.**

## Result

`KalmansonFarkasConsumer.lean` provides a generic checker for finite
homogeneous linear infeasibility certificates.  A certificate contains:

- finitely many strict linear forms `0 < S_i(x)`;
- finitely many equality forms `E_j(x) = 0`;
- nonnegative strict multipliers, at least one positive;
- arbitrary equality multipliers; and
- a coefficientwise proof that the weighted sum of all forms is zero.

`HomogeneousFarkasCore.false_of_realization` proves that such a system has no
real realization.  The proof checks the weighted sum inside Lean; it does not
trust the solver's UNSAT verdict or an unverified floating-point calculation.

This is the intended endpoint for a corrected full-linear Kalmanson search:
the search may discover a rational dual vector and serialize the coefficient
arrays, while Lean reconstructs each strict Kalmanson inequality from
`CapCrossingKalmanson` and each equality from selected-shell support.

## Smoke certificate

`false_of_fin12_four_constraint_core` kernel-checks the deletion-minimal
`Fin 12` core from `../biapex-full-kalmanson/fin12_full_kalmanson_mus.json`:

```text
row 0: d01 = d02
row 0: d01 = d03
row 1: d12 = d13
order 0 < 1 < 2 < 3:
  d03 + d12 < d02 + d13
```

Using strict form `d02 + d13 - d03 - d12`, equality forms

```text
d01 - d02
d01 - d03
d12 - d13
```

and multipliers `1; 1, -1, 1`, every coefficient cancels.  The strict
inequality comes from the production theorem
`CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw`; the other
three constraints are explicit row-distance equalities.

`false_of_fin12_selected_rows_four_constraint_core` also checks the complete
adapter from two `SelectedFourClass` values and five support-membership facts
to those three equalities, then invokes the same certificate.

`fin12_four_constraint_core.json` records the same normalized input shape for
an emitter or search integration.

## Integration contract

For each solver core, an emitter should:

1. enumerate every unordered distance term used by the core;
2. write one coefficient vector per strict Kalmanson/triangle inequality;
3. write one vector per selected-row equality;
4. omit strict constraints whose dual multiplier is zero;
5. serialize exact rational multipliers as Lean rational literals;
6. discharge `strictWeight_nonneg`, `some_strictWeight_pos`, and
   `coefficient_cancel` with `norm_num`; and
7. prove each instantiated form from production geometry or row support before
   calling `false_of_realization`.

For very small cores, generated Lean may instead bind the same inequalities
and equalities and call `linarith`; the matrix form is preferable when we want
the external certificate itself to be inspectable and independently replayed.

This checker is not a coverage theorem.  It converts one already-extracted
infeasible finite core into a kernel-checked contradiction.  A separate
coverage layer must prove that every live residual reaches one of these cores.

## Validation

Run from `lean/`:

```bash
lake env lean -R .. -M 16384 -s 65536 \
  ../scratch/atail-force/kalmanson-farkas-consumer/KalmansonFarkasConsumer.lean
```

The command succeeds.  The generic checker, direct smoke theorem, and
selected-row wrapper all close over the standard project trio only:
`propext`, `Classical.choice`, and `Quot.sound`.
