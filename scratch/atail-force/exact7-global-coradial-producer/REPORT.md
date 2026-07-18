# Exact-seven global co-radial producer audit

Date: 2026-07-18

Status: **THE EXACT-SEVEN LEAF IS NOT CLOSED.  NO EXISTING GLOBAL ROW OR
FIBER THEOREM PRODUCES THE REQUIRED FIRST-APEX EQUALITY.  THE PURE
INCIDENCE/RADIUS-COLOR ROUTE IS REFUTED BY AN EXACT FINITE ABSTRACT MODEL,
BUT ONE SOURCE-FAITHFUL ROLE FIXTURE IS EXACT-QF_LRA UNSAT AFTER TRIANGLE AND
STRICT KALMANSON CLOSURE.  EXHAUSTIVE ROLE COVERAGE IS THE NEXT LIVE TEST.**

This lane owns only
`scratch/atail-force/exact7-global-coradial-producer/`.  It does not edit
production Lean, shared closure documents, proof-blueprint state,
`ShellCurvature`, `SurplusM44`, protected card-five/555/654 work, or git.

## Required theorem-bank preflight

Before proposing a new finite or row-incidence theorem, I checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered a transition reverse
outside pair in a retained first-apex fiber, common-blocker fibers,
equal-center support transport, source-as-successor blockers, and exact-seven
cap rows.  The closest current declarations are:

- `firstApexCoRadialOccurrence_of_namedRowOccurrence`;
- `false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence`;
- `RetainedRadiusCollision.firstApex_equidistant`;
- `FrontierCommonDeletionCriticalFiber` and its closing-core consumers;
- `blocker_row_support_eq_shell`; and
- `firstApex_dist_eq` for the original frontier pair.

None identifies the two members of the exact-seven reverse outside pair with
the two sources of a retained-radius blocker fiber, places the complete pair
in either named first-apex row, or proves that the pair lies in any common
first-apex radius class.  The indexed U5 and two-large-cap declarations are
downstream consumers with additional named cross-row incidences; they do not
produce this equality.

## Exact source-to-consumer map

The checked exact-seven occurrence theorem is

```lean
exists_source_blocker_eq_transition_successor_of_secondCap_card_eq_seven
```

from
`card-ge-seven-periodthree-occurrence-audit/ExactSevenSourceBlockerOccurrence.lean`.
For

```lean
A : FullParentExactFiveAllReverseData L profile continuation
h7 : S.oppCap2.card = 7
```

it returns a physical source `q` with

```lean
H.centerAt q.1 (PhysicalVertex.mem_A q) =
  (A.transition.successor q).1.
```

The checked successor-terminal theorem

```lean
exists_predecessor_outsidePair_normalForm_of_center_eq_successor
```

then chooses the predecessor `p` and the exact outside pair `{a,b}` of the
row at `q`.  It proves:

1. `transition.successor p = q`;
2. the row is centered at `transition.successor q`;
3. its physical-cap intersection is exactly `{p,q}`;
4. its outside residual is exactly `{a,b}`, with `a != b`;
5. deleting `q` destroys K4 at that center;
6. deleting the center preserves K4 there; and
7. `dist S.oppApex1 a = dist S.oppApex1 b` immediately gives `False`.

Production already packages the same endpoint as

```lean
FirstApexCoRadialTransitionReversePairOccurrence A
```

and consumes it with

```lean
false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence A.
```

Thus no new consumer, row packet, or slot normalization is needed.

## Smallest genuine global producer

After the exact-seven occurrence is exposed, the narrow pointwise producer is
the following theorem shape:

```lean
-- Architectural statement, not an added Lean declaration.
theorem firstApex_coRadial_outsidePair_of_exactSevenCollision
    (A : FullParentExactFiveAllReverseData L profile continuation)
    (q : PhysicalVertex profile)
    (hcenter :
      H.centerAt q.1 (PhysicalVertex.mem_A q) =
        (A.transition.successor q).1) :
    exists p : PhysicalVertex profile, exists a b : Real^2,
      A.transition.successor p = q /\
      transitionReverseOutsidePair A.transition p = {a,b} /\
      a != b /\
      dist S.oppApex1 a = dist S.oppApex1 b
```

The predecessor and exact pair are already derivable, so the only new
mathematical conclusion is the last equality.  Composing this pointwise
theorem with the checked exact-seven occurrence closes the exact-seven leaf.

A named-row containment theorem is stronger and choice-dependent.  A bare
critical-fiber theorem is weaker but unconnected: first-apex robustness gives
an anonymous repeated-blocker fiber, with no theorem identifying its sources
with `{a,b}`.  Therefore the pointwise equality above, or direct `False` from
the same inputs, is the correct load-bearing contract.

## Exact finite abstract countermodel

`verify_global_marginal_countermodel.py` checks a fifteen-label finite model
with cap profile `(5,6,7)`.  The physical cap order is

```text
2, 11, 14, 12, 4, 13, 0.
```

The period-three sources are `(11,12,13)`, their reverse-row centers are
`(14,4,12)`, and

```text
blocker(11) = 12 = successor(11).
```

The three exact `2+2` reverse rows have outside pairs

```text
{3,9}, {8,10}, {6,7}.
```

The collision-normal-form pair is `{6,7}`: it belongs to the reverse row on
the predecessor edge `13 -> 11`, whose center is `12`.

The fixture retains all of the following exactly in its finite abstraction:

- the standard three-cap partition and exact physical cap cardinality seven;
- a retained original first-apex frontier pair;
- retained and double-deletion first-apex four-rows, with two strict-cap hits
  each and the exact role cover from `FirstApexShellRolePacket`;
- two disjoint first-apex radius classes and one exact-five second-apex class,
  hence single-deletion robustness at both apices;
- the first-apex/second-apex two-circle marginal intersection bound;
- the stored two common-deletion rows and their overlap bounds;
- a total fixed-point-free blocker map omitting both robust apices;
- complete exact-card-four support locking at every blocker value;
- source membership and deletion criticality for every critical source;
- the cap-local at-most-two support bound at every cap-centered row;
- the global all-reverse transition and exact `2+2` row decomposition;
- pairwise-distinct reverse centers and outside pairs;
- one K4 row centered at every carrier point, support-locked at blocker
  centers; and
- strong connectivity of that selected-row graph.

The script also declares complete abstract radius partitions at every center
and exhausts all `32766` nonempty proper carrier subsets.  None has a
four-point radius class at every one of its own centers.  Thus the fixture
satisfies the full minimality condition **inside this declared abstract
radius system**, not merely the one-row connectivity consequence.

Nevertheless every reverse outside pair uses two different first-apex
radius colors.  In particular, the exact-seven collision does not produce the
required equality.

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-exact7-global-uv \
uv run --no-project python \
  scratch/atail-force/exact7-global-coradial-producer/\
  verify_global_marginal_countermodel.py
```

The verdict is:

```text
PASS: exact finite exact-seven global-marginal countermodel
status=EXACT_FINITE_ABSTRACT_RADIUS_MINIMAL_NOT_EUCLIDEAN_NOT_GLOBAL_NOM44
proper_abstract_k4_subset=none_exhaustive_32766
```

This is not a symmetric planar distance table, an MEC realization, or a model
of global `noM44` over every alternative support triangle.  It refutes the
producer only from the listed finite incidence/radius-color consequences.
It does not refute the theorem on the complete Euclidean parent.

## Linear convex-order lift gate

`solve_linear_distance_shadow.py` asks whether that same finite fixture can
be realized by one symmetric rational distance table satisfying:

- all source-forced critical-shell equalities and exact filters;
- the exact-five physical-apex class;
- the two displayed distinct-radius first-apex four-rows;
- existential K4 rows at the only two otherwise-unlocked centers;
- all strict triangle inequalities; and
- both strict Kalmanson inequalities for every cyclic quadruple in the shared
  fifteen-point boundary order.

The homogeneous strict system is normalized to unit slack.  Z3 decides it
exactly as QF_LRA and returns:

```text
PASS: fixed exact-seven fixture is exact-QF_LRA UNSAT
status=EXACT_QF_LRA_UNSAT_FIXED_FIXTURE_NOT_COVERAGE
distance_variables=105
assertions=4365
```

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-exact7-global-uv \
uv run --no-project --with z3-solver python \
  scratch/atail-force/exact7-global-coradial-producer/\
  solve_linear_distance_shadow.py
```

This UNSAT result is **not** a proof of the leaf.  The fixture made one
specific choice of retained first-apex rows, critical supports, and role
identities.  Production permits other source-faithful choices, larger
adjacent caps, and both the same-radius and distinct-radius first-apex arms.
The result only says that the finite countermodel cannot be promoted to a
Kalmanson countermodel with those choices.  It is positive evidence that the
exact-seven role collision may make the linear geometry load-bearing.

## Next closure step

The next bounded task is an exact-seven **role-coverage gate**, not another
local theorem:

1. normalize the five physical-interior roles using the proved
   source-as-successor-blocker collision;
2. enumerate, modulo the remaining dihedral symmetry, every source-faithful
   placement of the retained frontier pair, retained/double first-apex rows,
   and three complete reverse supports into the three cap-role domains;
3. retain the same complete critical support whenever blocker fibers collide;
4. split the first-apex rows into the production same-radius and
   distinct-radius arms;
5. test every normalized schema with exact triangle plus strict Kalmanson
   closure; and
6. if all schemas are UNSAT, extract rational Farkas certificates and prove a
   finite coverage theorem before wiring direct `False` from the full parent.

If even one source-faithful schema is QF_LRA SAT, the exact-seven producer
must consume genuinely nonlinear planar/MEC geometry, global `noM44`, or
additional full-filter provenance.  The abstract countermodel shows that
more blocker-map counting or selected-row minimality alone cannot finish it.

## Validation and epistemic ledger

- **PROVEN in current source / checked predecessor scratch:** exact-seven
  source-as-successor occurrence, predecessor outside-pair normal form, and
  the existing co-radial consumer.
- **EXACTLY REFUTED in a finite abstract radius system:** forcing the equality
  from the enumerated incidence, support-lock, robust-apex, and abstract
  minimality consequences.
- **EXACT QF_LRA UNSAT for one fixed role fixture:** its triangle/Kalmanson
  lift.  This is not role coverage.
- **OPEN:** the pointwise full-parent co-radial producer and direct exact-seven
  `False`.
- **Production `sorry` closed:** none.

No new Lean declaration was introduced, so there is no new kernel theorem or
axiom closure to report in this lane.
