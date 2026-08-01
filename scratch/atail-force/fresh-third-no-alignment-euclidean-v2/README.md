# Fresh-third equal-blocker Euclidean diagnostic v2

Status: **UNKNOWN** (external bounded diagnostic, not a theorem result).

The recorded command was:

```bash
uv run python scratch/atail-force/fresh-third-no-alignment-euclidean-v2/model.py \
  --timeout-ms 250 --max-cases 500
```

with Z3 4.16.0. It checked 343 prioritized branches: 3 were UNSAT and
340 timed out. No SAT branch was found. This is not exhaustive: the exact
alias/order union has 1,268,640 branches.

## Scope

This is an exact rational-coefficient QF_NRA encoding of **local named
roles**, not a full fixed-cardinality carrier. In particular, it does not
materialize the live `n = 17` carrier or the rolewise closed-cap profile
`(6,8,6)` (strict interiors `(4,6,4)`).

The named carrier points are the three Moser apices `a1,a2,a3`, the six
sources `p1,p2,r1,r2,q1,q2`, and the blocker values `bp,br,bq`. The caller
specialization is `source = q1`; it is not asserted as a property of the
more general producer.

Every source-permitted blocker/source alias is enumerated. There are 95
maps after enforcing pairwise-distinct blocker values:

* `bp` is fresh or aliases one of `r1,r2,q1,q2`;
* `br` is fresh or aliases one of `p1,p2,q1,q2`;
* `bq` is fresh or aliases one of `p1,p2,r1,r2`.

No unproved foreign blocker/source inequality is guessed. In particular,
the sorry-backed `false_of_crossBlockerCoincidence` is not used.

For each alias map the encoder branches over cyclic orders of all distinct
named carrier representatives. All six sources and the proved retained
blockers `bp,br` are strictly on the first-cap arc from `a2` to `a3`
opposite `a1`. A fresh `bq`, whose first-cap placement is not retained by
the caller interface, is enumerated on all three structural arcs. Strict
positive orientation of every cyclicly ordered triple is the exact finite
`ConvexIndep` condition for these distinct named representatives.

The metric projection includes:

* the three positive, pairwise-distinct first-apex radii and their three
  source-pair equalities;
* the three positive blocker-row radii and equal-distance equations;
* the two q-row foreign-pair omission disjunctions;
* the non-obtuse inequalities for the Moser triangle;
* a positive MEC radius, boundary equality for all three apices, and
  closed-disk containment for every named carrier representative.

The first omitted source-backed strengthening is the unnamed carrier
content needed to realize the full `n = 17`, closed-cap `(6,8,6)` profile.
Later omissions include the unnamed members completing each exact-four
row and carrier-wide K4-free, q-free, deletion, minimality, no-M44, and
tri-apex predicates.

## Lean source map

* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7401-7443`:
  two retained collision packets, unequal first-apex radii, disjoint
  source pairs, distinct collision blockers, and the live robust residual.
* `lean/Erdos9796Proof/P97/ATail/RetainedStrictInteriorPairSelector.lean:68-89`:
  each collision's two strict-cap sources, source inequality, and common
  blocker.
* `lean/Erdos9796Proof/P97/ATail/RetainedStrictInteriorPairSelector.lean:216-249`:
  `bp` and `br` are carrier points in that same strict first-cap interior
  and satisfy the relevant equal-distance equation.
* `lean/Erdos9796Proof/P97/ATail/RetainedStrictInteriorPairSelector.lean:311-343`:
  a retained blocker differs from both of its own source endpoints.
* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7455-7475`:
  cap-eight source witness, strict first-cap membership, exclusion from
  the four collision sources, blocker inequalities, exact-four support,
  and two cross-pair deletion views.
* `lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean:494-545`:
  deletion survival is exactly endpoint omission from the selected row.
* `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:67-111`:
  fresh-third sources are carrier points, mutually distinct and distinct
  from all four collision sources; their common blocker differs from the
  two collision blockers.
* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7690-7719`:
  the two cap sources share a first-apex radius.
* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7933-7985`:
  equal blockers plus mutual membership produce the fresh-third fiber.
* `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:8861-8898`:
  specialized equal-blocker caller; here the chosen cap source is `q1`.
* `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332-354` and
  `:463-479`: promoted non-obtuse Moser triangle and indexed strict-cap
  definition.
* `lean/Erdos9796Proof/P97/Moser/Triangle.lean:59-86` and
  `lean/Erdos9796Proof/P97/Moser/TriangleNonObtuse.lean:667-684`:
  carrier/boundary status of the three apices and their non-obtuse
  inequalities.

## Trust boundary

Z3 is outside Lean's kernel. `UNKNOWN` means only that this bounded run did
not decide the local necessary-condition projection. The 3 branch-local
UNSAT results do not imply global UNSAT. Even exhaustive UNSAT of this local
projection would still require a source audit before use; it would not by
itself close `false_of_twoCapSources_firstFiber` or its downstream theorem.
