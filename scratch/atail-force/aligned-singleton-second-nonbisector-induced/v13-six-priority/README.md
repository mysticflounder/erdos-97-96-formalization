# v13 six-class structural-priority search

Terminal status: `UNKNOWN_NO_VALIDATED_CORE`.

This scratch lane hash-validates the pinned v13 survivor and reuses
`exact_euclidean_subset_core_miner.py` for the exact geometry encoding.  It
ranks all `C(19,6) = 27,132` quotient-class subsets before invoking a solver.
The quotient tuple is only the final deterministic tie-break.

The descending priority tuple is:

1. independent rank of the equality graph on squared-distance variables;
2. number of nontrivial equidistance-center components;
3. total and pair-count overlap between different center-family supports;
4. largest connected leaf family around one center;
5. repeated use of a squared-distance variable;
6. pairwise overlap of equality endpoint supports;
7. raw induced equality count;
8. negative redundant-equality count; and
9. active equality vertex count.

The top-16 run used 20 seconds per Z3/cvc5 query.  Eight candidates were exact
Z3 `SAT`, with their coordinate models substituted back through every encoded
gauge, strict-convexity, distinctness, and positive-row equality constraint.
Eight candidates were `UNKNOWN` from both Z3 and cvc5.  The unique top
candidate was also retried at 60 seconds per engine and remained `UNKNOWN`.
There was no UNSAT to replay or equality-shrink.

Top candidate:

- quotient subset `(0,1,5,6,7,18)`;
- aliases `{a0,escape}`, `{a1,s3,p3,be}`, `{p2}`, `{b1}`, `{p1,x}`,
  `{other,r4,e3}`;
- source equality indices `0,1,5,9,28,30,32`;
- seven recorded equalities of independent distance-variable rank five;
- two rank-two three-leaf center families (centers `0` and `6`) coupled through
  the center-`1` equality.

Artifacts:

- `rank_and_check_v13_six.py`: hash-gated driver;
- `v13-six-structural-ranking.json`: all 27,132 ranked feature rows;
- `v13-six-priority-search.json`: top-16 run;
- `v13-six-priority-search-rank1-long.json`: 60-second rank-1 retry;
- `v13-six-priority-search-exact-sat-witnesses.json`: eight exact algebraic
  coordinate witnesses, using SMT-LIB `root-obj` values.

Trust boundary: this is exact external Z3/cvc5 discovery evidence, not a
Lean/kernel proof.  SAT witnesses only the induced positive-equality
abstraction; pinned false-row disequalities and nonlocal CEGAR facts are
omitted.
