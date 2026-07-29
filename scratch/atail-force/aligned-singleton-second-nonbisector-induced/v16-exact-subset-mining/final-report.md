# v16 exact induced-subset mining

## Terminal result

`NO_VALIDATED_UNSAT_CORE_IN_EXHAUSTIVE_FOUR_FIVE_OR_RANKED_SIX_PREFIX`

The source survivor is schema v16, `ALIVE`, with 19 quotient classes and 38
positive quotient equalities.  All claims below concern the exact induced
positive-equality Euclidean abstraction.  They do not classify the full CEGAR
formula and are not Lean/kernel closure.

## Exhaustive four- and five-class census

| subset size | total | exact SAT | UNSAT | UNKNOWN |
|---|---:|---:|---:|---:|
| 4 | 3,876 | 3,876 | 0 | 0 |
| 5 | 11,628 | 11,628 | 0 | 0 |

For size four, 3,335 subsets were discharged by the exact shared-zero-equality
shortcut and 541 by exact solver checks.  For size five, the corresponding
counts were 8,174 and 3,454.  Ten initially doubly-UNKNOWN five-tuples were
resolved by exact rational or exact algebraic model substitution; the final
five-class census has no UNKNOWN.

Primary artifact: `five-exact-resolution.json`
(SHA-256 `74d26109c073613fa6c33506d170622a889a21adcfe8b2b375e2ffdfe3e1309b`).

## Bounded structurally ranked six-class search

All `C(19,6) = 27,132` subsets were ranked; 13,126 have at least one induced
positive equality.  The deterministic descending score is:

1. independent equality rank;
2. multi-center component count;
3. cross-center support overlap;
4. cross-center overlap pairs;
5. maximum center-leaf component;
6. distance-edge reuse excess;
7. equation-pair support overlap;
8. induced equality count;
9. negative redundant equality count;
10. active equality vertex count;

with the quotient tuple used only as a final lexicographic tie-break.

The bounded solver prefix contains ranks 1--24.  Its raw short-run census was
8 SAT, 0 UNSAT, and 16 doubly-UNKNOWN.  Exact rational replay subsequently
resolved ranks 1 and 2, so the final bounded-prefix census is:

| checked | exact SAT | validated UNSAT | fail-closed UNKNOWN |
|---:|---:|---:|---:|
| 24 | 10 | 0 | 14 |

Ranking artifact: `v16-six-structural-ranking.json`
(SHA-256 `6b4d7348c28f157b3801c96c9ff8dc020769a200f6c890fae4040a6a0e1ad84f`).
Raw prefix artifact: `v16-six-priority-search-top24.json`
(SHA-256 `8ce8aabf080debf6934613e90841eb4e03b3eabf219ee3f47a917f1b46868572`).

### Leading exact SAT schema

Ranks 1 and 2 share the ordered roles `(A,B,C,D,E,F)` and equality schema

`AE=CE`, `BC=BE=BF`, `BD=CD=DE`.

- Rank 1: classes `(3,5,9,10,11,13)`, source equalities
  `(13,19,20,22,23,24,36)`.
- Rank 2: classes `(3,5,9,10,11,16)`, source equalities
  `(13,19,21,22,23,25,36)`.

The normalized rational parameters `t=3/2`, `u=-25/16`, `v=2` produce a
strictly convex witness.  Exact Fraction replay gives minimum signed
orientation `744/57265` and minimum squared distance `4/65`.  Coordinate-pinned
Z3 and cvc5 both return SAT for both ranks.

Replay artifact: `six-rank1-rank2-resolution.json`
(SHA-256 `4bc7ca0eec5b55d4201dd51ca5c38bb8bb57284c38e97cd834d5b070b46f0a5f`).

## UNSAT/minimality/crosscheck ledger

No four-, five-, or tested six-class subset produced UNSAT.  Therefore no
order/equality literal deletion-minimization, normalized UNSAT replay, or
Singular identity check was triggered.  The 14 unresolved six-class candidates
remain `UNKNOWN_FAIL_CLOSED`; they are not evidence of infeasibility.

## One deep Lean theorem-bank search

Exactly one agentic merged-Lean search was run after identifying the leading
six-point role schema.  It found no declaration with the exact equalities
`AE=CE`, `BC=BE=BF`, `BD=CD=DE`.  This negative result is independently
consistent with the exact SAT witness.

The returned near hits were source-checked and are different schemas:

- `ATail/SixPointEuclideanObstruction.lean` is imported by
  `ATail/FrontierLiveClosure.lean`;
- `Census554/SixPointCircleChainCollision.lean`,
  `SixPointTwoPairCollision.lean`, and `ConvexRhombusCore.lean` are imported by
  `Census554/GeneralCarrierBridge.lean`;
- `SixPointNestedCenterOrderCore.lean` and
  `SixPointTwoCircleOrderCore.lean` have no direct in-repository importer found.

Because the exact schema is satisfiable, an incompatibility theorem would be
false.  The only sound new theorem shape would be an existence/compatibility
witness theorem asserting six strictly convex points with precisely these
equalities; it is not currently a contradiction consumer, so no Lean promotion
is recommended.

Search log: `theorem-search.txt`
(SHA-256 `b04f5ff93d261b5d2508ab2a22e047b7619be4607b5176c259f327da17f6779d`).

## Trust boundary

The exhaustive 4/5 result and the resolved six-point witnesses are externally
exact: rational arithmetic or exact Z3 algebraic model substitution, with
coordinate-pinned cross-engine replay where recorded.  The six search is only
a bounded priority prefix, and 14 checked formulas remain UNKNOWN.  No
production Lean source, production documentation, or `cegar.py` was edited.
