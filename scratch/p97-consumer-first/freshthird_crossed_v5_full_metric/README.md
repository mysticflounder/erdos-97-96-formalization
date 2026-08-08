# FreshThird crossed-row v5 full metric campaign

Date: 2026-08-08. This directory is scratch-only diagnostic output. It is not
a Lean proof, a source-level producer, or a closure claim.

## Packet and explicit subcase

`campaign.py` models exactly the audited 13 roles
`p1,p2,r1,r2,s1,s2,A,F,C0,O,X,Y,W` as points in `R²`, using squared
Euclidean distances. The shared-fourth subcase is explicit: `W` is the fourth
support in both the `C0` and `O` rows. The two orientation cases are

* `XY`: `(U,V) = (X,Y)`;
* `YX`: `(U,V) = (Y,X)`.

The equalities are precisely the supplied F, C0, O, and A equal-radius
relations. The disequalities are precisely `d(C0,V) ≠ d(C0,U)`,
`d(O,U) ≠ d(O,V)`, and `d(A,p1) ≠ d(A,r1)`.

Distinctness is limited to the audited packet: p/r/s support nonaliases,
X/Y outside-first-cap nonaliases against p/r/s/F/O, W outside-cap and away
from named support points and F/C0/O, row-center/own-support nonaliases, and
`F ≠ O`, `C0 ≠ F,O`. No commonRadius, blocker equalities, arbitrary cyclic
order, full pairwise distinctness, or extra shared-fourth provenance is used.

## Run and status

From the repository root:

```text
uv run python scratch/p97-consumer-first/freshthird_crossed_v5_full_metric/campaign.py
```

The script first runs tiny known SAT/UNSAT smoke tests, then emits portable
QF_NRA SMT-LIB2 for both orientations and cross-checks Z3 with cvc5
(`--tlimit=10000`). The unpinned nonlinear cvc5 searches timed out, while
the cvc5 replays pinned to the saved rational witnesses returned SAT. Z3
returned SAT for both orientations. The saved rational witnesses pass all 70
exact fraction checks (`results/rational_witness_{XY,YX}.json`), and their
pinned SMT artifacts are independently SAT in both solvers. Z3's first model
uses algebraic coordinates; it is retained as diagnostic only and is not
mistaken for an exact rational witness.

Solver SAT is only a candidate realization of this bounded encoding. Even if
both orientations are SAT, this does not establish source ingress, a universal
theorem, or a Lean promotion. If a solver is unknown, unavailable, or the
replay disagrees, report that status directly.

## Theorem-bank search

The required scoped agentic searches are saved in `theorem_search_1.txt` and
`theorem_search_2.txt`, with source checks in `theorem_show_*.txt`. The closest
indexed motifs are the exact-support blocker alternatives
`sharedFourth_or_oppositeFourth_blocker_ne_common` and its converse, plus the
conditional strict-Kalmanson consumer
`false_of_three_selected_rows_bridged_late_pair`. These are search leads only:
the present 13-role packet deliberately does not assume blocker equalities,
Kalmanson order, or the premises of those consumers.

Artifacts: `artifacts/shared_fourth_{XY,YX}.smt2`,
`artifacts/rational_witness_{XY,YX}.smt2`, `results/summary.json`, and the
saved witness/model files.
