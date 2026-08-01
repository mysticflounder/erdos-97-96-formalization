# Fixed dual-row QF_NRA encoding ledger

## Input frozen from the incidence survivor

The input is `../dual-row-cegar/n17-profile-6-8-6/witness.json`.  Its fixed
cyclic order is

`a1,t3,t2,t4,t1,a2,r1,p1,q2,p2,q1,r2,a3,s3,s1,s4,s2`.

There are 17 named carrier points and therefore 34 real coordinate variables.
The orientation-preserving similarity gauge

- `a1 = (0,0)`, and
- `t3 = (1,0)`

is four scalar equalities.  It removes two translations, one rotation, and
the otherwise free positive scale.  Thus 30 scalar coordinate degrees of
freedom remain before the row equations.  This is only a variable count, not
an assertion that the nonlinear equations have full Jacobian rank.

## ENCODED

1. One shared coordinate pair for every named point in both packet layers.
2. All 136 named-point squared-distance disequalities.
3. The fixed strict convex cyclic order, as negative signed area (the
   project's `IsCcwConvexPolygon` convention) for all
   `C(17,3) = 680` increasing triples.  This is stronger than merely checking
   the three five-point theorem guards: it asks for one strictly convex
   realization of the entire reported order.
4. Each exact four-point row is encoded by three squared-distance equalities
   tying its four support points to one radius about its named center.
5. Both five-row layers are retained as separately labelled constraints:

   | layer.role | center | support |
   |---|---|---|
   | collision.common | p2 | t1,q1,q2,s4 |
   | collision.apex1 | a1 | t2,q1,q2,s3 |
   | collision.opposite | q2 | a2,r1,r2,a3 |
   | collision.apex2 | a2 | r2,q1,s1,s2 |
   | collision.apex3 | a3 | t3,t4,a2,s1 |
   | outside.common | p2 | t1,q1,q2,s4 |
   | outside.apex1 | a1 | t1,t3,r1,r2 |
   | outside.opposite | q2 | a2,r1,r2,a3 |
   | outside.apex2 | a2 | p2,r1,q2,s4 |
   | outside.apex3 | a3 | t3,t4,p2,s1 |

6. Only `outside.common = collision.common` and
   `outside.opposite = collision.opposite` are canonical aliases.  Their row
   equation occurrences remain labelled by layer, but their coordinate
   polynomials are duplicates.  Same-named apex centers do **not** alias their
   supports across layers.
7. The outside choice is fixed exactly as reported:
   `Q.source = a1`, `Q.otherOutsidePoint = t2`, deleted point `a1`.
   The collision deleted point is `p1`.  The defining first collision shell
   is retained as a separately labelled contextual row centered at `q1` with
   support `a1,t2,p1,p2`; it contributes three further equalities and is not
   counted among the ten deletion-survivor rows.
8. The diagnostic equality is
   `distSq(q2,a1) = distSq(q2,t2)`, where `q2` is the fixed opposite-row
   center.  It is tested in separate equality and disequality queries and is
   never part of the base formula.

## Equality and constraint counts

- Gauge equalities: 4.
- Ten-packet-row equality occurrences: `10 * 3 = 30`.
- Contextual first-collision-shell equality occurrences: 3.
- Syntactically unique row-equality polynomials after the two licensed
  cross-layer aliases and the coincident consequences of the two distinct
  `a3` rows: 22 among the ten packet rows, or 25 after adding the contextual
  first-collision shell.
- Total unique encoded equalities in the full base formula: 29 including
  gauge.
- Named-point disequalities: 136.
- Strict-convex-order inequalities: 680.

Subtracting 25 from the 30 post-gauge coordinate variables gives a naive
five-dimensional residual count only if those 25 nonlinear equations are
independent.  No such rank claim is made or used.

## OMITTED

- All unreported distance equalities and inequalities.  In particular, a
  four-point selected row is not treated as a complete radius class.
- Complementary unequal-radius clauses for points outside a reported support.
- Any identification between collision and outside apex rows solely because
  their centers share the names `a1`, `a2`, or `a3`.
- Boolean blocker/source facts not expressible by the displayed row equations,
  except insofar as they fixed the reported row centers and outside choice.
- MEC, nonobtuse-apex, diameter, critical-shell, and full
  `CounterexampleData` hypotheses.
- The two crossed-membership outside constructors.
- Arbitrary-`n` promotion, Lean proof terms, kernel checking, or a certificate
  for an external solver's UNSAT result.

## Verdict discipline

Before importing Z3, the executable replays known instances of the production
theorem `false_of_six_ccw_three_shell_equalities_013_235_415`.  The frozen
witness has two direct six-point matches, so it is rejected at that preflight
and no final QF_NRA search is warranted.  The formula builder remains for a
future Kalmanson-refined witness.

Every solver call is capped at 30 seconds.  A Z3 `unknown` causes SMT-LIB2
emission and a bounded `cvc5 --nl-cov` cross-check.  SAT is accepted only
after substituting the model into every asserted polynomial relation.  UNSAT
without a checkable certificate remains trusted external QF_NRA evidence;
timeout/unknown remains `UNKNOWN`.
