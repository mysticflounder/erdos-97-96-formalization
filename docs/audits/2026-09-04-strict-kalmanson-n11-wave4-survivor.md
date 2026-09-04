# Strict-Kalmanson n=11 Wave-4 survivor authentication

**Local date:** 2026-09-04

**Result:** exact abstract survivor independently replayed; original producer custody remains partial

## Result

The Pro-consult handoff delivered a complete support table and integer distance
matrix for the n=11 survivor described in conversation message `#10544`. The
data were transcribed into
`certificates/p97_strict_kalmanson_n11_wave4_survivor.json` and checked by the
existing solver-free exact verifier.

The certificate passes:

```text
n                              11
row equality comparisons       33
strict triangle comparisons    495
strict Kalmanson comparisons   660
minimum triangle slack         1
minimum Kalmanson slack        1
common selected-row radius     33
Cayley-Menger det. [0,1,2,3]   767,736,288
certificate SHA-256            9d1143aadea6953c76ff559c51adf20e9b61221003732667b30f4040690fa764
```

All 330 four-point Cayley-Menger determinants are nonzero: 300 are positive
and 30 are negative. Their range is `-975026402` through `41556351448`.
The single announced probe already rejects a planar realization; the complete
scan is an additional consistency check.

## Relation to the retained Round170 survivor

This certificate and
`certificates/p97_strict_kalmanson_n11_survivor.json` have exactly the same
eleven selected rows. They are different abstract metrics:

| certificate | common row radius | probe determinant |
|---|---:|---:|
| Round170 | 63 | 38,070,362,232 |
| Wave-4 reconstruction | 33 | 767,736,288 |

Because the row assignments coincide, both contain the same four ordered
three-equilateral-chain embeddings:

```text
(A,B,C,D,E,F) = (0,1,2,6,4,10)
(A,B,C,D,E,F) = (3,5,7,9,8,10)
(A,B,C,D,E,F) = (6,4,2,0,1,10)
(A,B,C,D,E,F) = (9,8,7,3,5,10)
```

The Lean theorem `Problem97.false_of_realizes_three_equilateral_chain`
therefore rejects this row assignment in the Euclidean plane independently of
which abstract strict-Kalmanson metric witnesses it.

## Custody boundary

The source handoff is nthdegree file `01M1NH9KZQND42PE5JW1VNRA1J`, delivered
as
`consult-01M1NF10ZKYYFHAMNDG1DH04RM-n11-kalmanson-artifact-forensics--01M1NH9KZQND42PE5JW1VNRA1J.md`.
Its locally delivered bytes have SHA-256
`ef64ad45b0d083d00a1a01fb78835ca3f6da66ed1023758d9e83eed814e9066b`.
The document asserts earlier archive and support-table hashes, but it does not
contain those source artifacts. Those provenance claims are not promoted here.

The retained certificate authenticates the mathematical witness data through
independent exact replay. It does not authenticate the missing 42,504-clause
base, the announced 375,144-clause bank SHA, the 109/110 earlier cell results,
or the final case-20 `EXACT_MASTER_UNSAT` counters.

## Reproduction

```bash
uv run python scripts/verify_strict_kalmanson_survivor.py \
  certificates/p97_strict_kalmanson_n11_wave4_survivor.json
uv run pytest -q \
  scripts/test_verify_strict_kalmanson_n11_wave4_survivor.py
uv run --with ruff ruff check \
  scripts/test_verify_strict_kalmanson_n11_wave4_survivor.py
```

The focused four-test suite pins every count and slack above, the certificate
digest, the exact four motif embeddings, and the comparison with the retained
Round170 rows and metric.

## Consequence

There are now two independently replayable integer metrics realizing the same
all-center n=11 row assignment while satisfying strict Kalmanson and strict
triangle inequalities. Thus the abstract counterexample is not tied to one
distance table. The row assignment is nevertheless forbidden for distinct
planar points by the source-clean Euclidean chain theorem. The pure
strict-Kalmanson impossibility is false at n=11; the claimed Euclidean-augmented
finite closure remains unauthenticated.
