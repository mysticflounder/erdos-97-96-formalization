# Lemma 2 direct-certificate skeptic audit

Date: 2026-07-28

## Verdict

**CERTIFIED**, for the finite combinatorial statement encoded by the current
candidate source transcription:

> There is no P1--P4-pattern-feasible `alpha x beta` 0--1 matrix with at least
> three 1s in every row and every column when `alpha + beta <= 19`.

This is a certificate-backed Python/CNF result, not a Lean theorem.  It remains
conditional on the Figure-4 transcription and the Python generator.  It does
not by itself prove that every geometric P97 cut matrix avoids the full
transcribed P3 family, and it does not resolve the separate printed
`g(6,8)=18` versus candidate `g(6,8)=19` discrepancy.

At the beginning of this audit, `check_drat` accepted an unanchored output
substring and did not require checker exit code zero.  Another agent hardened
the shared `verify_table2.py` during the audit.  This verdict is for the current
implementation, SHA-256
`a9d1fcf7e483b54d361967a5be391fa65d9e188080f5dcc3c64c8166668c08ff`,
whose `verified` field requires both return code zero and an exact standalone
`s VERIFIED` line.

## Coverage

`all_cases()` is exactly

```text
3 <= alpha <= beta,  alpha + beta <= 19.
```

For fixed `alpha = 3,...,9`, the numbers of `beta` values are respectively
`14,12,10,8,6,4,2`, totaling 56.  There are no missing or extra summary rows or
artifact directories.

The WLOG restriction `alpha <= beta` is valid:

- row/column degree-at-least-three is invariant under transpose;
- P1 is self-transpose;
- the two P2 templates exchange under transpose;
- P3 explicitly unions the first source orientation with its transpose; and
- each of the two source P4 templates is self-transpose.

I also compared the generated pattern sets with their transposes for `3x16`,
`6x8`, and `9x10`; all were equal.  If either dimension is below 3, the degree
condition on the opposite axis is impossible.

## Source-pattern semantics

The Figure-4 source page shows P1, the two P2 shapes, two lettered P3
orientations, and exactly two P4 shapes.

The P3 generator enforces

```text
ra < rb < rd,  ra < rc < rd,
c1 < ck <= ch < c2.
```

Thus it includes all three relative row cases `rb < rc`, `rb = rc`, and
`rb > rc`, including the crossed R2 case, and both `ck = ch` and `ck < ch`.
It then generates the transposed source orientation and deduplicates only
identical forbidden cell sets.  In particular, a crossed first-orientation
`6x8` occurrence produces

```text
-1 -2 -12 -17 -27 -28 0
```

and its transposed-orientation analogue produces

```text
-1 -3 -9 -20 -26 -28 0.
```

P4 is generated only from variants `A` and `B` in `p4_relative`; no `B_col`
rule or production census rule is imported or emitted.

## Degree clauses and independent clause census

For `n` variables, `add_at_least_three` emits every positive
`(n-2)`-subset.  These clauses say that no `n-2` cells may all be false, which
is exactly `sum >= 3`.  Hence each row contributes `C(beta,2)` clauses and each
column contributes `C(alpha,2)` clauses.  There are no auxiliary variables.

I independently expanded P1, both P2 templates, all six fixed P3 order-type
templates and their transposes, both P4 templates for every applicable `k`,
and the degree clauses.  The resulting clause multisets matched the stored CNFs
exactly:

| case | P1 | P2 | P3 | P4 | row degree | column degree | total |
|---|---:|---:|---:|---:|---:|---:|---:|
| `3x3` | 9 | 2 | 1 | 2 | 9 | 9 | 32 |
| `6x8` | 420 | 2,240 | 8,750 | 5,068 | 168 | 120 | 16,766 |
| `9x10` | 1,620 | 20,160 | 154,980 | 181,334 | 405 | 360 | 358,859 |

The `3x3` CNF includes the expected P1 clause
`-1 -2 -4 -5 0`, P2 clause `-1 -2 -6 -7 -9 0`, P3 clause
`-1 -2 -4 -6 -8 -9 0`, and unit degree clauses.  In `6x8`, the first row and
column degree clauses are `1 2 3 4 5 6 0` and `1 9 17 25 0`.  In `9x10`,
the corresponding clauses are `1 2 3 4 5 6 7 8 0` and
`1 11 21 31 41 51 61 0`.

## Solver/checker fail-closed behavior

CaDiCaL status is derived from its process exit code: 10 is SAT, 20 is UNSAT,
0 is UNKNOWN, and every other exit is an error.  Text such as
`s UNSATISFIABLE` cannot alone create an UNSAT status.  Timeouts raise and abort
the run rather than creating a certified result.

The current DRAT parser requires:

```text
returncode == 0
and an output line whose stripped contents are exactly "s VERIFIED".
```

A deliberately empty proof for the nontrivial `6x8` CNF returned 1 with
`s NOT VERIFIED` and was rejected.  Consequently neither solver nor proof
checker parsing has a status-only false-pass route in the current code.

## Artifact and replay audit

There are two distinct, valid snapshots:

1. The pre-hardening snapshot initially audited here had
   `summary.json` SHA-256
   `048c1210c45224683db4fb078446f813141955ea5b9843e88b1a5956a0a99bfb`
   and `all-under-20.log` SHA-256
   `32382ec0bc38063ff4396941c025eae5b44eb96e0bbbc8ede56fbe2fab43cb41`.
   Those are the original hashes recorded in `AUDIT.md`.
2. After the DRAT parser was hardened, the complete 56-case suite was rerun.
   The current artifact set is:

```text
verify_lemma2.py
682fbe9cc733927f625a3df216fb346a291997b1668853f177ba2cd5a8fa8dbb

verify_table2.py
a9d1fcf7e483b54d361967a5be391fa65d9e188080f5dcc3c64c8166668c08ff

lemma2-runs/summary.json
1033b8a5259b00aa0995d530ada445d0406c5906d8566a7e66cd40575aefa749

lemma2-runs/all-under-20-hardened.log
49002b99446dc7947f6a7dd57e0e8ed75743dd6a85d78db3b99514fc06221836
```

I independently checked that the hardened log has exactly 56 case rows plus
its trailer; every case row is structurally equal as parsed JSON to the
corresponding current summary row; and the trailer names 56 cases and the
current summary hash above.  All 56 current summaries have status
`CERTIFIED-UNSAT-CANDIDATE-TRANSCRIPTION`.

For all 56 cases in the hardened rerun:

- the summary row, log row, result coordinates, variable count, clause count,
  status, and rounded timings agree;
- the CNF header agrees with the actual number of clause lines;
- the actual CNF SHA-256 agrees with `result.json`;
- solver return code is 20 and the stored solver log is exactly
  `s UNSATISFIABLE`;
- checker return code is 0, `verified` is true, and the checker log contains
  exactly one standalone `s VERIFIED` and no `NOT VERIFIED`; and
- the CNF, nonempty DRAT, solver log, checker log, and result manifest all
  exist.

I freshly reran CaDiCaL on `3x3`, `6x8`, and `9x10`; all returned 20.  I also
freshly replayed every one of the 56 stored proofs directly with `drat-trim`:
56 returned zero and none failed.  That direct replay is independent of both
the pre-hardening and hardened Python status parsers.  The subsequent hardened
full rerun likewise recorded CaDiCaL return code 20 and fail-closed
`drat-trim` acceptance for every case.

The current hardened 56/56 claim and hash set are therefore supported.  The
old summary and log hashes identify the earlier snapshot only and must not be
used as hashes of the current rerun.

## Provenance recommendation fulfilled

`verify_lemma2.py` imports the pattern generator, solver runner, and DRAT
checker from `verify_table2.py`.  `AUDIT.md` now pins the dependency hash as
well as the primary verifier hash, so the reproduction manifest records both
pieces of executable verifier provenance.  The earlier non-blocking
recommendation is fulfilled.
