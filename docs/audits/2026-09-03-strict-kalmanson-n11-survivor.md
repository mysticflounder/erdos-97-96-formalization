# Strict all-center Kalmanson survivor at n = 11

Date: 2026-09-03 PT

## Verdict

**EMPIRICALLY VERIFIED.** There is an exact integer distance table on eleven
ordered labels and a four-member row at every center such that:

- all 33 displayed row equalities hold;
- all 660 strict Kalmanson comparisons hold;
- all 495 strict triangle comparisons hold; and
- a four-point Cayley--Menger determinant is nonzero.

This finite witness refutes the unrestricted all-center strict-Kalmanson
impossibility conjecture at `n = 11`. It does not refute P97: the distance table
is not the distance table of eleven points in the Euclidean plane. The result
instead isolates Euclidean realizability as an additional necessary ingredient.

## Recovered source and normalization

The newer Pro-agent survivor announced in conversation messages `#10544` and
`#10718` was not delivered: the latter had `attachments: null`, and the follow-up
request `#10758` did not produce bytes during this audit. Persistent-memory search
instead recovered an older, independent Round170 survivor:

| Artifact | SHA-256 |
|---|---|
| `/Users/adam/scratch/round170_n11_schema_projection_result.json` | `72bc4dac36f276fa446bfed56d71f21a6aad1790beddaf915ea39dd0f1af9e3d` |
| `/Users/adam/scratch/round170_n11_metric_skeleton.smt2` | `526ac79236342afa40b4cd919be024a26633dc029e234153dc5363b799de8b92` |
| `/Users/adam/scratch/round170_n11_metric_skeleton_result.json` | `a17e973aa10442dae54b812c74c61fa278f3aef72416a29427dee85d783b6382` |

The result envelope fixes the label order

```text
[O, S0, S1, S2, S3, T, Q0, V, Q1, U, Q2]
```

and gives 55 positive rational distances whose denominators divide 128. Scaling
every distance by 128 produces the self-contained integer certificate
[`certificates/p97_strict_kalmanson_n11_survivor.json`](../../certificates/p97_strict_kalmanson_n11_survivor.json).
Its raw-file SHA-256 is
`fb822efa58769abaa1657fea291dba96c207e46958a81ce90eeb0b4070221fb5`;
the 607-byte compact sorted JSON content has SHA-256
`8181f53e5d93e6f69e91a972ed090b7a83a7b014b3f2c0a62aabda851b999e89`.

The legacy result records SAT from Z3 and cvc5, but carries neither solver-model
bytes nor proof bytes. Those omissions do not affect validation of the retained
SAT witness: every relevant assertion is checked directly from the normalized
certificate below. They do mean that the old solver execution itself is not a
modern proof-carrying piqd run.

## Exact replay

The solver-free verifier is
[`scripts/verify_strict_kalmanson_survivor.py`](../../scripts/verify_strict_kalmanson_survivor.py),
SHA-256
`950bfb0c4398c82010d4c8747cb32539469cec5f5a61c4b5db25c20a0c4a5265`.
Run it from the repository root with:

```bash
uv run python scripts/verify_strict_kalmanson_survivor.py \
  certificates/p97_strict_kalmanson_n11_survivor.json
```

It returns `PASS` with the following exact results:

| Check | Count | Minimum slack |
|---|---:|---:|
| Row equality comparisons | 33 | 0, as required |
| Strict Kalmanson comparisons | 660 | 1 |
| Strict triangle comparisons | 495 | 1 |

Every selected row radius is 63. On the probe `[0,1,2,3]`, the integer
Cayley--Menger determinant is `38,070,362,232`; before scaling it is
`4,758,795,279 / 549,755,813,888`.

An independent implementation, which did not import the retained verifier,
replayed the full table and found the same counts, slacks, and probe determinant.
It also checked all 330 four-subsets: 301 determinants are positive, 29 are
negative, and none is zero. Thus even the first probe already rules out a planar
Euclidean realization of the abstract metric table.

The governed replay record is
`scratch/runs/strict-kalmanson-n11-survivor-20260903/run-0001/artifacts/verification.json`
(SHA-256 `990608824e4c23f9069313545baa3f1d93f6343f893960122c6bf632129b386a`).
Its run manifest has self-hash
`8d8fe0f0699ab5fccbf2d8323179280fb12af509e6b170dd11ab94de7e70dbfc`.
The focused verifier suite, including this certificate as an end-to-end fixture,
passes 19 tests; Ruff reports no findings.

## Euclidean obstruction already present in the rows

The row graph contains four ordered copies of the three-equilateral-chain motif.
One copy uses

```text
A = O  = 0    B = S0 = 1    C = S1 = 2
D = Q0 = 6    E = S3 = 4    F = Q2 = 10
```

with the required memberships

```text
{B,C,D} subset row(A)
{A,C,F} subset row(B)
{A,D,E} subset row(C)
{C,D,F} subset row(E).
```

The theorem `Problem97.false_of_three_equilateral_chain_and_f_ne_c` in
`P97/ATail/ThreeEquilateralChainCollision.lean` proves that these equal-distance
relations cannot be realized by six distinct planar points. Commit
`ab8480418f33090742afd7606ee5018f7be4361d` adds the row-facing theorem
`Problem97.false_of_realizes_three_equilateral_chain`, which obtains the eight
metric equalities from the twelve memberships with
`Census554.EqualityCore.Realizes.equidist` and obtains point distinctness from
injectivity. Focused Lean compilation and an independent elaboration passed;
`#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound`.

## Claim boundary

This audit does **not** authenticate the distinct newer Pro-agent model whose
reported probe determinant was `767,736,288`. It also does not authenticate the
reported 375,144-clause augmented `n = 11` UNSAT bank. Those artifacts still need
their own byte-level custody, replay, and proof checks.

Accordingly, the correct research statement is now:

- the pure all-center strict-Kalmanson impossibility is false by `n = 11` within
  the abstract distance-table model;
- the finite `n <= 10` boundary remains a separate computational theorem-bank
  question; and
- a general P97 argument must use a genuinely Euclidean constraint, with the
  three-equilateral-chain collision supplying one concrete such constraint.
