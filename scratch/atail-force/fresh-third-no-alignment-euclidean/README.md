# Equal-blocker first-fiber Euclidean diagnostic

This is the smallest coordinate-level diagnostic for the six distinct
strict-first-cap sources in the live equal-blocker specialization of
`false_of_twoCapSources_firstFiber`:

```text
p1, p2, r1, r2, q1 = source, q2 = source'
```

It is diagnostic only.  It does not prove or close
`false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow`.
The equality `source = q1` is present in the first-fiber constructor
`freshThirdBlockerFiber_of_mutualCrossMembership`, but the generic open theorem
takes `source` and `Q` independently and does not retain that equality.  The
frontend therefore audits the specialized caller, not every instance of the
generic leaf.

Run:

```bash
uv run python \
  scratch/atail-force/fresh-third-no-alignment-euclidean/model.py \
  --output scratch/atail-force/fresh-third-no-alignment-euclidean/result.json
```

The default run replays an exact rational witness in one of the 120 enumerated
order cases.  One such case is enough to establish `SAT` for the existential
union.  `--all-orders` instead asks Z3 to classify all 120 cases; this broader
search is not required for the diagnostic verdict and may time out.

## Result

Z3 4.16.0 returns `SAT` on the exact rational witness replay.  The coordinates
and selected cyclic order are recorded in `result.json`; all values are
integers, so this is an exact model rather than a decimal approximation.

## Source map

The four retained collision sources are pairwise distinct and lie in
`S.capInteriorByIndex S.oppIndex1` by the two collision packets,
`hpairsDisjoint`, and the two exact first-apex intersection hypotheses in
`FrontierLiveClosure.lean:7390-7422`.  The two cap sources are distinct,
outside both collision pairs, and lie in that same strict cap interior by
`FirstFiberCapSourceWitness` and the arguments of
`false_of_twoCapSources_firstFiber` (`FrontierLiveClosure.lean:7457-7478`,
`8867-8891`).

At `a1 = S.oppApex1`, the `p` pair, `r` pair, and `q` pair have three
different positive radii.  The first two equalities and their inequality are
the retained collision-radius hypotheses; the q equality is
`hsourceRadius`/`hsourceRadius'`, and the source exclusions rule out equality
with either collision radius.  The equal blocker values give the three row
equalities at `bp`, `br`, and `bq`
(`RetainedStrictInteriorPairSelector.lean:69-89`,
`BlockerMultiplicityGeometry.lean:70-108`).

Each `CrossPairDeletionView` in the `q1` cap-source witness omits at least one
endpoint from the p pair and at least one endpoint from the r pair.  Because
the selected q1 row is the exact positive-distance shell at `bq`, the model
encodes those facts as two disjunctions of squared-distance inequalities.

All six sources occur on one strict cap arc, but their relative order is not
known and they need not be adjacent.  The script therefore enumerates the 120
cyclic orders obtained by fixing `p1` as the start and retaining both
orientations.  For each checked order, every ordered triple has positive signed
area.  The recorded exact witness realizes the enumerated case
`p1 < q1 < q2 < p2 < r2 < r1`; this is a satisfiable case, not an assertion
that the live configuration has that order.

The no-alignment hypothesis contributes no additional condition in this
specialization: its positive packet requires the blockers of `source` and
`q1` to be distinct, while `source = q1` makes them definitionally equal.

## Trust boundary and first omitted predicate

The variables `a1`, `a2`, `bp`, `br`, and `bq` are actual Euclidean point
coordinates, so all row claims are genuine squared-distance equations.
Only the induced convex cyclic order of the six proven-distinct cap sources
is imposed.  The frontend does not guess aliases or relative boundary order
for the blocker/apex carrier points.

The first source-backed geometric strengthening left for a larger stage is an
alias-aware convex-independence/cyclic-order encoding for every *distinct*
named blocker and apex together with the six sources.  That requires branching
over permitted point aliases and orders.  In the specialized caller `bp`,
`br`, and `bq` are also in the first strict cap interior, but the present stage
does not encode their cap placement.  Cap endpoints and unnamed points would
then be needed to express the full strict-cap interval rather than only its
induced six-source order.

The exact-four rows' unnamed witnesses, the common-deletion packets, global
K4/q-free consequences, minimality, and no-M44 data are also omitted.  Thus a
`SAT` result means only that this relaxation survives.  An `UNSAT` result
would concern only this frontend and would still need an independent
source-fidelity audit and a kernel-checked Lean proof before any theorem-level
claim.
