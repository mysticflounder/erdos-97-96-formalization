# Weighted Kalmanson cut-data soundness bridge

Date: 2026-07-18

Scope: scratch-only Lean-facing bridge for the append-only weighted cut bank
described in `exact6-allcenter-coverage-certificate/REPORT.md`.  This lane does
not edit production Lean, closure documents, or proof-blueprint state.

## Result

[`WeightedKalmansonCutDataSoundness.lean`](WeightedKalmansonCutDataSoundness.lean)
defines a proof-free, cardinality-generic certificate surface:

- `KalmansonKind` distinguishes the two strict cyclic-quadrilateral
  inequalities (`k1` and `k2`);
- `WeightedKalmansonInequality n` stores typed `Fin n` endpoints and a natural
  strict multiplier;
- `WeightedSelectedRowEquality n` stores a typed center/reference/point triple
  and a signed integer multiplier;
- `WeightedKalmansonCutData n` stores both lists plus optional exact-five shell
  metadata; and
- `WeightedKalmansonCutData.check` checks a nonempty strict list, increasing
  endpoint order, positivity of every strict multiplier, optional shell shape,
  and exact zero of every integral abstract-distance coefficient.

Rational Farkas multipliers are represented after clearing one positive common
denominator.  This preserves the strict signs and turns every coefficient into
the integral checker format.

The kernel-checked end-to-end theorem is:

```lean
Problem97.WeightedKalmansonCutDataSoundnessScratch
  .false_of_check_of_rowsMatch
```

Given a convex-independent carrier, one injective CCW boundary enumeration,
one `SelectedFourClass` at every boundary center, a cut whose Boolean checker
returns `true`, and membership of each named reference/point pair in its named
selected row, it concludes `False`.  The proof:

1. interprets the exact integral coefficient vector as a symmetric-distance
   `Finsupp`;
2. evaluates that vector on the concrete boundary;
3. proves every named row expression is zero from
   `SelectedFourClass.support_eq_radius`;
4. converts the resulting list sum into the `Fin`-indexed weighted sum; and
5. applies the existing generic
   `false_of_weighted_kalmanson_cancellation` consumer.

The existing consumer is scratch-only and therefore cannot be imported by a
second scratch module through Lake.  Its already-checked declaration is
reproduced source-faithfully at the top of the file, and the new theorem calls
that declaration.  Production promotion should move the consumer and checker
together into one production predecessor rather than duplicate either theorem.

## First banked cut replay

`continuationOrderCut` is the exact typed form of the externally banked
ten-`K2`/three-row cut:

```text
K2(0,1,10,11)  K2(0,1,11,12)
K2(1,2,10,11)  K2(1,2,11,12)
K2(2,3,11,12)  ...  K2(7,8,11,12)
row(10,0,2) + row(11,2,8) - row(12,0,8)
```

The theorem

```lean
continuationOrderCut_check : continuationOrderCut.check = true
```

is proved by kernel `decide` (not `native_decide`).  It checks all 196 typed
distance coordinates for `n = 14`; no external JSON or Python verifier is in
this theorem's trust boundary.

## Bank preflight

The required registries

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and JSON companion;
- `certificates/erdos97_legacy_general_n_mining.md` and JSON companion; and
- `certificates/erdos_general_theorem_p97_mining.md` and JSON companion

were checked before implementation.  `nthdegree docs search --lean` found the
existing Kalmanson geometry and consumer declarations but no typed weighted-cut
payload or exact coefficient checker to reuse.

## Validation

Focused warnings-as-errors validation:

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/weighted-kalmanson-cut-data-soundness/\
WeightedKalmansonCutDataSoundness.lean
```

Result: pass.

The printed axiom closures of all proof-facing endpoints are exactly:

```text
propext
Classical.choice
Quot.sound
```

This includes:

- `evaluateExpression_distanceBasis`;
- `evaluateExpression_rowEquality_eq_zero`;
- `false_of_check_of_rowsMatch`; and
- `continuationOrderCut_check`.

Source audit of this directory finds no `sorry`, `admit`, new `axiom`,
`native_decide`, or `unsafe` declaration.

## Exact limitation

This bridge checks and consumes one weighted metric cut; it does not prove
finite-outer coverage, a terminal DRAT/LRAT result, or the live parent-to-finite
extraction.  `conditionedShell` is checked metadata only.  Any metric equality
used by a cut must still be present explicitly as a checked selected-row
equality; a future shell-derived metric equality needs its own proof-facing
matching constructor and soundness lemma before such a cut can be accepted.

No production declaration and no source `sorry` is closed by this scratch
checkpoint.
