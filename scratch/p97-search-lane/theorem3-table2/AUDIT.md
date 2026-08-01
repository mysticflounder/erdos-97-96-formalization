# Fishburn--Reeds Theorem 3 / Lemma 2 / Table 2 audit

Date: 2026-07-28

Scope: scratch-only audit.  No production source was modified.  The source is
`/opt/nfs/1-s2.0-092577219290026O-main.pdf`, SHA-256
`ca4a813a003b6c1cdfda842ccfe595b2455390022edc4578e4c06a02a8bbdaac`.
Printed pages 87--90 are PDF pages 7--10.

## Exact dependency and ranges

- A cut matrix is an `alpha x beta` 0--1 matrix for a convex-polygon cut
  `{A,B}`; a 1 marks a unit cross-cut distance.  Every rectangular submatrix
  of a cut matrix is a cut matrix.
- Lemma 1: a matrix containing one of Figure 4's P1--P4 patterns is not a cut
  matrix.  Its proof is omitted in the paper.
- Pattern feasible means containing none of P1--P4 among submatrices.  Lemma 1
  gives `cut matrix -> pattern feasible`; the converse is explicitly unknown.
- `g(alpha,beta)` is the maximum number of 1s in a pattern-feasible matrix.
- Theorem 3: if every row and column of an `alpha x beta` cut matrix has at
  least three 1s, then `alpha + beta >= 20`.
- Lemma 2 is the same conclusion for a pattern-feasible matrix and is the
  combinatorial consumer used to finish Theorem 3.

Table 2 claims `g` for `alpha <= beta <= 15`, `alpha <= 6`, and claims
`g(alpha,beta+1)=g(alpha,beta)+1` for `alpha <= 6`, `beta >= 15`.
The nontrivial rows are:

```
alpha=4, beta=4..15:  9 10 12 13 14 15 16 17 18 19 20 21
alpha=5, beta=5..15: 12 14 15 17 18 20 21 22 23 24 25
alpha=6, beta=6..15: 15 17 18 20 21 22 24 26 28 30
```

The Table-2 range does not prove Lemma 2 by itself.  The paper additionally
uses `g(7,7)=18` and
`g(7,beta+1) <= g(7,beta)+3` for `beta >= 7`.  It then lists the six remaining
cases

```
(8,8), (8,9), (8,10), (8,11), (9,9), (9,10).
```

Only the 9-by-9 argument is described, and even there the paper invokes
`g(3,8)=11`, `g(4,8)=14`, `g(5,8)=17`, `g(6,8)=18` plus a stronger equality
condition.  It says that many proof details are suppressed.

## Candidate Figure-4 predicate

`verify_table2.py` intentionally does not import the production census bank.
It emits one negative clause per occurrence of:

- P1: a 2-by-2 all-one rectangle;
- both printed 3-by-3, five-cell P2 variants;
- the full lettered P3 family, including row order R2 and the transpose;
- the two printed P4 monotone-cycle variants for every `k >= 3`.

Only these paper patterns are present.  In particular, the encoder excludes
the census-only circle/fiber/cap rules and excludes auxiliary P4 `B_col`.
Production `R-P3` now covers the full independently certified source family,
including R2 in both inner-column cases and the transposed orientation.  The
encoder here remains intentionally independent of that production scanner;
`audit_predicate.py` expands the fixed source templates separately.

`audit_predicate.py` independently expands P3 into fixed
R1/R2/R3-times-C1/C2 templates plus transposes.  It agrees that both printed
Figure-5 6-by-8 matrices have zero hits under the candidate predicate.

This predicate must still be called a **candidate transcription**: the
certificate-backed 6-by-8 result below disagrees with the paper.

## Certificate-producing verification

For a claimed value `g`, the verifier runs:

1. predicate plus `sum(x) >= g`, expected SAT;
2. predicate plus `sum(x) >= g+1`, expected UNSAT.

The SAT assignment is decoded and checked directly for its 1-count and all
pattern occurrences.  CaDiCaL emits a DRAT proof for UNSAT, which is checked by
`drat-trim`.  The CNF uses semantic cell variables and a one-way witness-DP
encoding of the lower cardinality bound.

Reproduction:

```bash
uv run python scratch/p97-search-lane/theorem3-table2/verify_table2.py \
  2x2 3x3 4x4 4x6 5x8 6x6 6x7 --timeout 120

uv run python scratch/p97-search-lane/theorem3-table2/verify_table2.py \
  6x8=19 --timeout 300
```

The first command certified the printed values `3,6,9,12,17,15,17`.
Every upper DRAT passed `drat-trim`.  Exact manifests, CNF hashes, witnesses,
proofs, and checker logs are under `runs/a*-b*-g*/`.

All 75 finite entries printed in Table 2 are in principle instances of the
same finite CNF check.  The infinite tail recurrence is not a single finite
CNF claim; it needs a separate mathematical stabilization argument.  The
listed post-Table cases and Lemma 2 for each `alpha+beta <= 19` can instead be
encoded directly by adding row- and column-degree-at-least-three constraints;
that direct route has now been completed below.

Trust boundary: these are certificate-checked CNF results conditional on the
Python CNF generator and candidate Figure-4 transcription.  They are not Lean
kernel proofs and do not by themselves certify Lemma 1's geometry.  The
geometric P1--P4 proofs, including P3 R2, are separate audited inputs when this
combinatorial result is applied to P97 cut matrices.

## 6-by-8 discrepancy

The printed Table 2 claims `g(6,8)=18`.  Under the candidate transcription,
the verifier instead certifies the exact value

```
g_candidate(6,8) = 19.
```

A 19-one witness is:

```
00011011
01100101
10000001
10000110
10101000
11010000
```

The independent fixed-template scanner finds zero P1, P2, P3, or P4
occurrences.  Its row-degree sequence is `(4,4,2,3,3,3)` and its column-degree
sequence is `(4,2,2,2,2,2,2,3)`, so it does not itself contradict Lemma 2.
The durable independent-scan output is `predicate-audit.json`, SHA-256
`e21d3478199cf595d738b0cb13bbadeecfe949613403e0b2724610950fd39dfa`.
The `sum >= 20` CNF has SHA-256
`a7160501ce2a1893f08ba932cb41b00546f2718169ed470b1d5a1199cfa3a36b`
and its DRAT checks.  See `runs/a6-b8-g19/`.

Adding a one-axis reversal is not a valid repair.  `symmetry_audit.py` records:

| matrix | native | row reversed | column reversed | both reversed |
|---|---:|---:|---:|---:|
| printed Figure-5 left 6x8 | 0 | 64 | 64 | 0 |
| printed Figure-5 right 6x8 | 0 | 98 | 98 | 0 |
| 19-one witness | 0 | 182 | 182 | 0 |

Thus either proposed one-axis closure rejects both of the paper's own
maximizers.  The live discrepancy is between the detailed Figure-4
transcription and the Table-2 claim (or the claim itself), not an omitted
global symmetry.  The full coordinate audit is `symmetry-audit.json`, SHA-256
`f3f2d1f31ed5fdfa4684c2a35bf00bbb09ca090ba26d5bc28963a152698846d3`.

## Direct Lemma-2 sweep (separate from Table 2)

`verify_lemma2.py` directly encodes the negation of Lemma 2.  It uses the same
candidate source P1/P2/full-P3/source-P4 predicate, then adds
`degree(row) >= 3` and `degree(column) >= 3` for every row and column.  Each
degree constraint uses the transparent prime-clause encoding: for `n` cells,
every `(n-2)`-subset has a positive clause.  There are no cardinality
auxiliaries in this lane.

Up to transpose, every possible counterexample to Lemma 2 is one of

```
3 <= alpha <= beta, alpha + beta <= 19.
```

There are 56 such pairs.  (`alpha < 3` cannot have column degree three.)  The
complete sweep certified all 56 UNSAT, and every CaDiCaL DRAT was independently
accepted by `drat-trim`.  This includes all six cases merely listed by the
paper and the largest 9-by-10 case.  No Table-2 value or recurrence is consumed.

Reproduction:

```bash
uv run python scratch/p97-search-lane/theorem3-table2/verify_lemma2.py \
  --all-under-20 --timeout 600 \
  > scratch/p97-search-lane/theorem3-table2/lemma2-runs/all-under-20-hardened.log
```

Durable artifacts:

- `lemma2-runs/summary.json`: 56/56
  `CERTIFIED-UNSAT-CANDIDATE-TRANSCRIPTION`, SHA-256
  `1033b8a5259b00aa0995d530ada445d0406c5906d8566a7e66cd40575aefa749`;
- `lemma2-runs/all-under-20-hardened.log`: complete post-hardening per-case
  run log, SHA-256
  `49002b99446dc7947f6a7dd57e0e8ed75743dd6a85d78db3b99514fc06221836`;
- each `lemma2-runs/aA-bB/` contains the CNF, DRAT, solver log,
  `drat.check`, and `result.json`;
- verifier SHA-256:
  `682fbe9cc733927f625a3df216fb346a291997b1668853f177ba2cd5a8fa8dbb`;
- imported generator/solver/checker SHA-256 (`verify_table2.py`):
  `a9d1fcf7e483b54d361967a5be391fa65d9e188080f5dcc3c64c8166668c08ff`.

The independent skeptic audit found that the first checker parser accepted an
unanchored output substring without also requiring exit code zero.  The current
parser is fail-closed: it requires checker return code zero and a standalone
`s VERIFIED` line.  The hardened full sweep again certified all 56 cases, and
the skeptic independently replayed all 56 stored proofs successfully.  See
`LEMMA2-SKEPTIC-2026-07-28.md`.

The largest instance, 9-by-10, has 90 semantic variables and 358,859 clauses;
CaDiCaL took about 30 seconds and `drat-trim` about 60 seconds locally.  Across
all cases the recorded solver time was about 61 seconds and proof-check time
about 116 seconds.

This closes the finite combinatorial implication **conditional on the
candidate transcription and CNF generator/checker trust**.  It deliberately
does not resolve the disagreement with printed Table 2.  Combined with the
separate audited P1--P4 geometric proofs, including the now-certified full P3
R2 family, it supplies the Fishburn--Reeds Theorem-3 conclusion for P97
C2-read same-distance cut matrices: minimum row and column degree three implies
`alpha + beta >= 20`.  That combined conclusion remains outside the Lean
kernel and retains the usual cut-matrix consumer hypotheses.

## Remaining trust boundaries

1. **Combinatorial audit bridge:** resolve why the printed Figure-4 predicate,
   as presently decoded and independently scanned, has exact
   `g_candidate(6,8)=19` while Table 2 prints 18.  Until this is resolved,
   Table 2 cannot be imported as a verified exact bank.  This discrepancy does
   not block the direct Lemma-2 sweep, which consumes no Table-2 value.
2. **Kernel bridge:** the direct finite implication is checked by
   CaDiCaL/DRAT plus independently audited Python encoders.  It is not yet an
   LRAT/Lean theorem.

The direct 56-case sweep removes the formerly separate Lemma-2 completeness
bridge: the alpha=7 recurrence and six suppressed cases are no longer needed
for this certificate-backed combinatorial route.  The formerly open P3-R2
geometric-consumer bridge is also closed by the independent R2 proof and
production `R-P3` admission.
