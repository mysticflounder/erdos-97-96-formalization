# Exact-17 FreshThird six-center canary results

## Classification and outcome

This is a bounded theorem-discovery canary, not a proof consumer or producer.
The full exact-17 formula is **SAT** in Z3 4.16.0.  Its emitted assignment
passes an independent ordinary-Python evaluation of every encoded clause.
cvc5 1.3.3 returned `unknown` on a separate 30-second unpinned search, then
returned **SAT** on the full formula with every variable fixed to the Z3
assignment.  Thus two solvers accept the concrete assignment, but only Z3
performed the unpinned search.

The ingress is the paired assumption

```text
C : TwoCapSourceThirdCanonicalRowSurface P Pρ
TwoCapSourcesSixCenterSourceProvenanceBoundary
  Q C.firstSource C.secondSource
D.A.card = 17
```

under the surrounding `TwoSourceClosure` ambient hypotheses, including `T`.
The boundary abbreviation by itself does not contain the cap-source witness
fields.  `INGRESS-CONTRACT.md` records the pre-run contract.

## Field-by-field source-origin contract

| Encoded finite field | Lean source and interpretation |
|---|---|
| one blocker and one exact four-point full shell for every carrier source | `CriticalShellSystem.shellAt`, `U1CarrierInjection.lean:1108-1125`; `CriticalFourShell.center_mem`, `support_eq`, `support_card`, and `q_mem_support`, lines 638-652 |
| blocker is a carrier point different from its source; shell contains the source and omits its center | `center_mem : center ∈ A.erase q`, `CriticalFourShell.q_mem_support`, and `center_not_mem_support`, `U1CarrierInjection.lean:638-652,680-691` |
| every actual-blocker fiber has cardinality at most four | proved `actualBlockerFiber_card_le_four`, `ATail/SurvivalCover.lean:85-114` |
| same-center canonical shells are equal or disjoint | derived directly from the exact full-radius-class field `CriticalFourShell.support_eq`: equal radii give the same filter and unequal radii give disjoint filters; no identities between different physical radius classes are added |
| selected rows at distinct centers intersect in at most two physical points | `SelectedFourClass.inter_card_le_two`, `U1CarrierInjection.lean:468-477`; for deleted rows, `U5QDeletedK4Class.inter_card_le_two`, `U5GlobalIncidenceSupport.lean:405-417` |
| a deleted row whose center is an actual blocker is the corresponding canonical shell | `selectedFourClass_support_eq_shell`, `U1CarrierInjection.lean:1185-1208`, and `qDeletedK4Class_support_eq_selectedShell`, `ATail/FiveCenterDeletionBoundary.lean:46-56` |
| six exact-four rows at six distinct centers, each omitting the common deleted point and its center | `SixSurvivorExactRowsBoundary`, `TwoSourceClosure.lean:970-992`, with deleted-row support facts from `FiveCenterDeletionBoundary.lean:26-44,72-80` |
| centers are the two collision blockers, three named Moser apices, and the surviving cap-source blocker | the indexed arguments of `SixSurvivorExactRowsSourceProvenanceBoundary`, `TwoSourceClosure.lean:1504-1519` |
| exact B0/B1/B5 provenance | the fields at `TwoSourceClosure.lean:1512-1519`: B0 contains both `Pρ` sources; B1 is exactly `{P.source₁,P.source₂,Q.source,Q.otherOutsidePoint}`; B5 contains the surviving cap source; the common deleted source is absent from B0/B1/B5 |
| collision-pair blocker equalities and proved pair distinctness/disjointness | the two retained-pair and `FreshOutsideFirstBlockerFiber` input structures; only those equalities and inequalities used by the boundary are encoded, with no new cross-fiber equality |
| two distinct oriented cap sources, both in the strict interior of the designated first cap | `TwoCapSourceThirdCanonicalRowSurface.sources_ne` and the two `CapSourceThirdCanonicalRowWitness` fields, `FrontierLiveClosure/TwoSourceCanonicalSurface.lean:110-144`; the boundary disjunction identifies these physically with the common deleted source and the surviving B5 source, up to orientation |
| closed cap profile `(8,6,6)` at exact 17 | proved `twoCapSourceSurface_exact_seventeen_cap_profile`, `TwoSourceClosure.lean:168-179`; it uses `C.cap_card_ge_eight` and the all-cap lower bound supplied by ambient `T` |
| exact closed-cap point composition | Moser apices have membership counts/patterns `0,1,1`, `1,0,1`, `1,1,0` by `CapTriple` fields, `Cap/Structure.lean:172-189`; every non-Moser carrier point lies in exactly one cap by `nonmoser_in_one`, lines 190-194 |
| strict cap composition and sizes `(6,4,4)` | `capInteriorByIndex` erases the two endpoint apices, `Cap/PartitionFromMEC.lean:495-501`; `capInteriorByIndex_card_add_two`, `ATail/CapApexRadiusRigidity.lean:29-43` |
| B3 and B4 meet each retained pair in at most one point | proved `SixSurvivorExactRowsBoundary.physicalRows_inter_retainedPairs_card_le_one`, `TwoSourceClosure.lean:1540-1555`; these are four upper bounds, not positive containments |

The point assignments `deleted=0`, boundary centers `1..6`, and named apices
`3,4,5` are symmetry normalizations of already-proved distinct physical
points.  All other roles remain integer-valued physical points.  No role
distinctness or membership is imposed unless it follows from a cited field or
from the exact cardinality of a cited physical set.  Physical aliasing is
therefore preserved.

## Explicit omissions

- No coordinates, distances, radius values, circle realizability, convexity,
  MEC geometry, or proof that the abstract blockers satisfy `NoQFree`.
- No `TriApexAllLargeContext.apex_rich` rows.  That conclusion is an
  existential alternative over actual physical radii; this Boolean row model
  has no faithful radius-class universe in which to express it.
- No cap index for a blocker center, boundary position, cyclic order, arc
  orientation, crossing ledger, or adjacency graph.
- No `U5DangerousTriple`.  Its structure requires a named noncollinear
  three-point set in `(D.skeleton q).erase p`, all at radius `dist p q`
  (`U5GlobalIncidenceBasic.lean:30-40`).  The paired ingress and retained-pair
  cut do not produce that packet.
- No universal lift from exact 17, no construction of the assumed boundary,
  and no downstream contradiction.

Consequently the following bank candidates are not source-entitled clauses:
`criticalShellCenter_mem_capInteriorByIndex_of_two_hits`,
`equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair`,
`exists_blockerCenter_capIndex_and_boundaryPosition`,
`exists_repeatedBlockerCap_pair_outcome`,
`selectedFourClass_sharedPairCyclicSeparation_atBoundary` /
`selectedFourClass_shared_pair_separated`, and
`opposedOrderCrossingLedger_contradiction`.  Each needs at least one omitted
premise (named cap hits, common radius, boundary indexing/order, richness, or
an assembled crossing ledger).

The exact missing ingress for a U5/adjacency experiment is a source-clean Lean
theorem producing `U3FixedTriplePacket` or `U5DangerousTriple` from this live
FreshThird boundary, plus the corresponding selected-class adjacency data if
an adjacency conclusion is desired.  Without that theorem, encoding U5 would
invent both membership and noncollinearity.

## Independent controls

All ten controls were built as small independent formulas and returned UNSAT
in both Z3 and cvc5:

| Negated source clause | Z3 | cvc5 |
|---|---:|---:|
| overfull B0 | UNSAT | UNSAT |
| source missing from its own shell | UNSAT | UNSAT |
| center illegally in its own shell | UNSAT | UNSAT |
| distinct-center B0/B1 intersection at least three | UNSAT | UNSAT |
| first closed cap has the wrong cardinality | UNSAT | UNSAT |
| a non-Moser point belongs to zero or two caps | UNSAT | UNSAT |
| a cap source is outside the strict first cap | UNSAT | UNSAT |
| an apex belongs to its opposite cap | UNSAT | UNSAT |
| B3 contains both retained P endpoints | UNSAT | UNSAT |
| B4 contains both retained Pρ endpoints | UNSAT | UNSAT |

The old n=15 cap arithmetic check is also UNSAT in both solvers because the
live lower bounds give `8+6+6 > 15+3`.  Exact 15 is outside this residual, so
that result is an invalid-scope/vacuity control only.

## Mined forced clauses and failed candidates

The following are forced *within the cited abstraction*:

1. At exact 17 the strict cap sizes are `(6,4,4)`.  Negating this in the full
   model is UNSAT in Z3; it is also an immediate source-level consequence of
   the proved closed profile and `capInteriorByIndex_card_add_two`.
2. Removing the two distinct cap sources from the six-point strict first-cap
   interior leaves exactly four points.  The full-model negation is UNSAT in
   Z3, and an independent arithmetic/membership encoding is UNSAT in both
   solvers.  A concrete exact-17 Lean candidate is

   ```lean
   (((S.capInteriorByIndex S.oppIndex1).erase C.firstSource.1).erase
       C.secondSource.1).card = 4
   ```

   under `C` and `D.A.card = 17`.  This is exact-17 bookkeeping, not a
   general-n theorem.
3. Seventeen sources with blocker fibers of size at most four use at least
   five physical blocker centers.  The negation is UNSAT in both solvers.  It
   is the pigeonhole consequence of the already-proved fiber bound.
4. A smaller general finite-set motif was isolated: **four exact four-point
   rows with every pairwise intersection at most two have union cardinality
   at least seven**.  The union-at-most-six projection is UNSAT in both
   solvers; four rows on seven points are SAT in both, and three rows on six
   points are SAT in both.  Thus both the union bound and the threshold of four
   rows are sharp.  This is a candidate general Lean bookkeeping lemma, not a
   promoted theorem and not by itself a FreshThird contradiction.

No positive B3/B4 retained-pair containment is forced.  For each of B3 and B4
and for each retained pair, the model is SAT both with zero endpoints and with
exactly one endpoint.  It is also SAT with B3 and B4 simultaneously avoiding
either retained pair.  The proved `card <= 1` cuts therefore cannot be
strengthened to a positive hit in this abstraction.

No U5 dangerous-triple or adjacency motif was queried because the necessary
source packet is absent, as recorded above.

## Compact witness

`model.json` contains this representative assignment:

```text
roles: p1=6, p2=1, Q.other=14, Q.source=15,
       rho1=16, rho2=3, survivingSource=2

B0={3,9,15,16}       B1={1,6,14,15}
B2={10,14,15,16}     B3={12,13,15,16}
B4={4,6,15,16}       B5={1,2,15,16}

closed caps:
C0={0,2,4,5,9,11,13,15}
C1={1,3,5,6,10,14}
C2={3,4,7,8,12,16}
```

Its strict cap interiors have sizes `(6,4,4)`, the first-interior remainder
after the two cap sources has size four, the maximum blocker fiber is three,
and the maximum row intersection is two.  These additional witness statistics
are not forced unless listed in the preceding section.

## Reproduction and trust boundary

From this directory:

```bash
uv run --with z3-solver python canary.py > latest-run.log 2>&1
uv run --with ruff ruff check canary.py
uv run python -m py_compile canary.py
jq '{base, controls, forced_clauses, retained_pair_discovery, row_union_projection}' run-results.json
```

Trust consists of Z3's unpinned SAT answer, ordinary-Python readback of the
emitted assignment, cvc5 acceptance of that pinned full assignment, and
two-solver agreement on the small controls/projections.  The unpinned cvc5
result remains `unknown`; there is no translated SMT certificate or Lean
proof.  SAT says only that the retained exact-17 incidence and cap-composition
constraints coexist abstractly.  Nothing here constructs a Euclidean
configuration, proves a universal theorem, closes the live FreshThird branch,
or discharges any Lean `sorry`.
