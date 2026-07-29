# D–E Session-3 named-local encoding specification

Status: diagnostic/CEGAR package, **not** a theorem-complete finite model.

## 1. Live frontier and scope

The two consumers are
`false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`
and
`false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`
at `FrontierLiveClosure.lean:6121–6138`.  Their input structures are declared
at `FirstApexUniqueRadiusResidual.lean:150–225`.

The encoder names only witnesses already supplied by those structures:

- `a1,a2`: the two physical apices;
- `q,w`: the interior critical pair;
- `u1,u2,u3`: the other three existentially chosen members of the exact-five
  first-apex class;
- `bq,bw`: the D3 obstruction centers;
- `b`: the D4 common obstruction center;
- `s1,s2`: the two remaining existentially chosen members of the D4 shared
  exact-four row;
- `c3`: a smoke-only fresh carrier probe.

These names never exhaust `D.A`.  There is no `Fin n`, closed point list, or
exact carrier-cardinality clause.  `carrierCard_ge(10)` records only
`9 < D.A.card`; the monotone atoms through 16 leave all upper cardinalities
open.  Thus there is deliberately no `n=10..15` run matrix: repeating the same
open named-local projection under six labels would be cosmetic, while closing
the universe at any such `n` would be unsound.

Minimality and no-M44 are omitted: this propositional layer has no faithful
finite representation of either hypothesis.

## 2. Clause tags

- `[HYP]`: direct residual fields—exact-five count, deletion robustness,
  double-deletion obstruction/survival, blocker failure, D3 directed survival,
  and D4 common-center membership/nonmembership facts.
- `[BANKED]`: proved D-package consequences from
  `lean/scratch/d-package-bank/DPackageBank.lean`: D3 four-center
  distinctness, partner omission, three-row packet/intersection setting; D4
  common-center distinctness, shared row, global cover projection, and the
  associated named-local consequences.  This includes the named `a2`
  instance of D4's universal no-third-bisector residual: the residual field
  supplies the universal implication, while applying it to `a2` also uses
  banked carrier-membership and distinctness facts.
- `[GEOM]`: if two row centers are distinct, any three named common row points
  are forbidden; if three carrier points are pairwise distinct, they cannot
  all lie on the perpendicular bisector of `qw`.
- `[DERIVED]`: `K2(q,w;c) -> K1(q;c) ∧ K1(w;c)` and the facts that `a1`
  and, in D4, the common row center `b` bisect `q,w`.
- `[DEF]`: Tseitin definitions for named row intersections.
- `[COUNT]`: monotonicity of symbolic lower-bound atoms.

The exact-five and exact-four upper bounds are represented as global count
atoms or existentially named row members, never as “all local labels not shown
are absent.”  The `circleIntersection.atMostTwo` clauses range only over the
named probes, which is a sound projection of the global geometric theorem.

## 3. Official runs

All four runs are expected to be SAT; a model is checked against the emitted
CNF before it is recorded.

| run | delta over `base-E` |
|---|---|
| `base-E` | shared exact-five E hypotheses only |
| `D3-left` | `K1(A\\{w},bq)`, four distinct centers, left three-row packet |
| `D3-right` | symmetric `K1(A\\{q},bw)` packet |
| `D4` | common blocker, mutual membership/shared row, named global cover, exactly-two named bisectors |

A SAT verdict means only that this named-local projection has not exposed an
incidence contradiction.  It is not a geometric realization and does not
close either Lean leaf.

## 4. D4 smoke gate

The positive fixture is D4’s two distinct bisectors `a1,b`, plus a fresh
carrier probe `c3` distinct from both; it must be SAT.  Adding
`bis(q,w;c3)` must be UNSAT, and CaDiCaL’s DRAT is checked by `drat-trim`.

The load-bearing dependency check removes only
`[GEOM] perpBisector.carrier_atMostTwo`; with the third bisector still asserted,
the formula must return SAT.  The direct D4 no-third unit is omitted from this
smoke fixture.  Consequently the certified UNSAT is forced by the same general
strict-convexity/perpendicular-bisector bound used in
`b1_bisectorSet_eq_pair` (`BFamilyBank.lean:1018–1034`), not by assuming the
desired conclusion.

## 5. Trust boundary and first blocker

DRAT certifies only the emitted smoke CNF.  Clause-to-mathematics fidelity is
still an audit obligation; official SAT models are abstract incidence
assignments, not Euclidean realizations.  The first completeness blocker is
cardinality: the live leaves provide `|D.A| > 9` but no finite upper bound or
cutoff.  A theorem-level closure therefore needs a cardinality-free symbolic
certificate or a separately proved cutoff before any finite carrier census
can be promoted.
