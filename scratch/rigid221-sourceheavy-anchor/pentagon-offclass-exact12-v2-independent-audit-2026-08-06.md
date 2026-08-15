# Independent audit: pentagon off-class exact-12 v2

Date: 2026-08-06 (PDT)

Scope: `scratch/pentagon-offclass-exact12-v2`, the source-clean producers in
`scratch/PentagonOffClassProducerProbe.lean`, and the ingress to
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`.
No production file was edited.

## Verdict

The present artifacts are **not a finite obstruction**, kernel-checkable or
otherwise.  The base `d = 0, v = 2` incidence instance is SAT.  The structural
CEGAR has continued to find SAT row cubes and learn row-only nogoods; its
persisted status reached `ITERATION_LIMIT`, not `UNSAT`.  During this audit a
separate live process was extending the same journal, so raw iteration totals
after the recorded checkpoints are volatile.  This does not affect the
conclusion: no terminal DRAT/LRAT certificate exists in the campaign, and the
universal source theorem does not yet reduce to exact cardinality 12.

The approach *could* become a kernel-checkable finite obstruction if all of the
following are supplied:

1. a checked exact-12 case ingress plus a checked contradiction for the
   non-exact-12 branch;
2. a checked relabeling/coverage theorem for every named-point placement and
   every admissible global cyclic order;
3. an exhaustive UNSAT result for every resulting finite case;
4. a frozen encoding-soundness theorem, including soundness of every learned
   row/order cut; and
5. kernel replay of the terminal certificates (for example LRAT replay in
   Lean), rather than Python replay plus `drat-trim` alone.

At present items 1--5 are all incomplete.  SAT survivors are useful theorem-
mining evidence, but they are not a Euclidean model and are not closure.

## Registry-first check

The required registries were checked before inspecting the scratch campaign:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

No registry contains the exact `Rigid221`, `sourceHeavy`, pentagon-off-class,
or exact-12 target/consumer.  Lean-corpus searches likewise find the live
theorem itself but no existing theorem with the required source-blocker
endomap or exact-12 terminal contract.

The nearest banked three-row terminal is the source-proved sibling theorem

`Problem97.U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`

from `RVOL.P97.U5GlobalIncidenceQCriticalExactTetrahedron`.  Its statement
requires three **exact** q-deleted K4 classes and a specified tetrahedron of
cross-incidences.  The exact-12 ingress's three-center alternative gives only
three pairwise-distinct centers with `HasNEquidistantPointsAt 4` after one
deletion.  It does not give exact q-deleted classes or the tetrahedron
incidences, so this bank theorem is not a current consumer.  The registry also
marks it as no local exact-name or statement-shape match.

`ATail/FiveCenterDeletionBoundary.lean` confirms the general boundary: even a
five-center deletion-survival packet is normalized to exact rows and is
explicitly classified as “checked normalization, not a contradiction.”  Thus
three surviving centers alone cannot be treated as contradictory.

## Exact-12 source ingress

The live leaf is at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean:3591`.
It assumes the full off-class pentagon packet and concludes `False` by `sorry`.
It has no `D.A.card = 12` premise.

The concrete checked ingress currently available is

`pentagonOffClass_threeCenterDeletion_or_card_eq_twelve_probe`

at `scratch/PentagonOffClassProducerProbe.lean:1563`.  The live target supplies
its four inputs (`P`, `packet`, `hxvA`, and the `u`-in-`xv`-row fact).  Its
conclusion is exactly

```text
D.A.card = 12
OR
one deletion (u or xv) preserves K4 at oppApex2 and at two further
pairwise-distinct actual blocker centers, both different from oppApex2.
```

This is a genuine source theorem, but it is a disjunction, not an exact-12
reduction.  It proves the lower-cardinality boundary honestly: if the carrier
is larger than 12, a two-color/fiber argument produces the three-center
deletion-survival branch.

Once `D.A.card = 12` is available, the remaining exact-12 source interface is
substantially better:

- `pentagonOffClass_card_twelve_exact_cap_profile_probe` proves cap profile
  `(5,4,6)`, exact strict second-cap interior
  `{u, centerAt(xv), xv, xu}`, and `ExactFourSecondOppositeCapGrowth`;
- `pentagonOffClass_exact_physical_cycle_traces_probe` proves the five exact
  physical-class row intersections forming
  `u-xu-deleted-v-xv-u`; and
- `pentagonOffClass_physical_cycle_actualBlockers_injective_probe` proves the
  five corresponding actual blocker centers are pairwise distinct.

The producer file was elaborated directly during this audit.  It completed
with only linter warnings.  Its `#print axioms` output for all four ingress
theorems above contains only `propext`, `Classical.choice`, and `Quot.sound`;
there is no `sorryAx` in these producers.

### The missing universal lift

A finite exact-12 contradiction would lift to the live universal leaf only
after the right branch of
`pentagonOffClass_threeCenterDeletion_or_card_eq_twelve_probe` is discharged.
The concrete missing source theorem should therefore consume that branch, for
example a theorem with the contract

```text
false_of_pentagonOffClass_threeCenterDeletionSurvival
  (the live off-class pentagon hypotheses)
  (deleted = u or deleted = xv)
  (two outside-row sources with distinct blockers, both off oppApex2)
  (K4 survives deletion at those two blockers and oppApex2) : False
```

Equivalently, a stronger source theorem proving `D.A.card = 12` from all live
off-class hypotheses would suffice, but no such theorem was found.  The
three-center consumer is the statement aligned with the checked ingress and
does not discard its informative alternative.  If one can first upgrade its
three K4 witnesses to exact q-deleted rows and prove the tetrahedron
cross-incidences, the banked
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility` is a
concrete possible terminal; those upgrades are presently missing.

## Finite model audit

### Base instance

`probe.py` freezes the cap order as `(surplus, theorem opp2, theorem opp1) =
(5,6,4)`, labels `u,c,xv,xu = 6,7,8,9`, fixes the physical apex at label 1,
and enumerates ordered placements of `d,v` among
`{0,2,3,4,5,10,11}`.

The loop has 42 possible ordered placements, but it stops at the first SAT
case.  `summary.json` therefore records:

```text
status = SAT
placements_tested = 1
placements_total = 42
only tested case = d0-v2
variables = 39,733
clauses = 315,923
```

The persisted assignment is total and satisfies every DIMACS clause.  The
independent semantic validator passed all encoded cap, row, overlap, physical
cycle, and blocker-map assertions.  An independent `z3 -dimacs` run also
returned `SATISFIABLE`.  These checks establish SAT of the encoded abstraction;
they do not establish Euclidean realizability.

The model deliberately omits coordinates/global distance equalities, global
strict-convex-order and Kalmanson constraints, MEC/cap semantics beyond the
labeled incidence consequences, raw minimality, full all-radii/no-qfree
semantics, source-heavy deletion fans, and a formal completeness theorem.
Omitting constraints is compatible with a future sound UNSAT obstruction only
if Lean proves that every retained encoded clause is source-entitled.  That
source-to-CNF implication is not currently formalized.

### CEGAR cuts

`structural_cegar.py` decodes only the twelve selected row supports and passes
`MetricRow(center, support, exact = false)` values to its metric detectors.
Every learned CNF clause is a row-choice nogood.  No learned clause contains a
source-to-actual-blocker variable.  Consequently the CEGAR can mine row metric
obstructions, but it cannot see or rule out a source-sensitive blocker-endomap
pattern.

The order-independent path uses replayed equality/metric cores.  The
order-aware path calls `ordered_cover`, which checks 24 hard-coded
cap-compatible label orders.  For each individual ordered-cover journal record
inspected, all 24 orders were present and distinct; the audit found 23 such
records in the stable 2,000-cut checkpoint, each with exactly the expected
24-order set.  This is good per-cube evidence.

It is not global coverage.  An ordered cut excludes one exact labeled subset
of row choices after all 24 orders fail for that cube.  It does not exclude all
row cubes, all named-point placements, or symmetry images not explicitly
generated.  Journal replay is Python validation, and the finite-order
enumeration has no current Lean theorem connecting every source configuration
to exactly one of those 24 label orders.

At the stable 2,000-iteration checkpoint the summary was
`ITERATION_LIMIT` with 2,000 learned clauses, not `UNSAT`.  The CNF persisted
after the first 1,999 cuts was independently solved SAT during this audit.  A
concurrent campaign then resumed the same journal toward 5,000 iterations;
this report intentionally does not claim a terminal status from a moving
artifact.  There was no `terminal.drat` at the checked checkpoint.

### Persistent blocker-fiber signal

The row-only nature of the cuts is visible in a post-1,999-cut SAT assignment.
Its actual-blocker map was

```text
0->9, 1->5, 2->4, 3->6, 4->6, 5->6,
6->8, 7->4, 8->7, 9->3, 10->6, 11->5.
```

The fiber over center 6 is `{3,4,5,10}`, exactly the selected row support at
center 6.  The second-cap sources outside the `xv` row are `{0,2,7,9}`, and
each enters that saturated fiber within at most two blocker steps.  This same
endomap pattern survived extensive row-only CEGAR because the detector drops
the blocker variables.  It is a useful source-theorem target, not itself a
contradiction.  No registry theorem was found that consumes this saturated
actual-blocker fiber.

## Symmetry and coverage gaps

1. **Placement coverage:** only `d=0,v=2` was run by `probe.py`; the other 41
   placements were not tested.  Even quotienting by the evident permutations
   inside the three surplus labels and two first-opposite labels leaves at
   least 14 ordered cap-role placement types.  No checked action shows that the
   tested type represents them.
2. **Role asymmetry:** `d` and `v` occupy directed, different positions in the
   five-cycle.  Swapping them is not an available symmetry without a theorem.
3. **Order coverage:** the 24 orders cover permutations of the two-point
   first-opposite interior, the three-point surplus interior, and the two
   orientations of the forced four-point second-cap order for the fixed label
   placement.  A checked global-order stitching/relabeling theorem from the
   source cap packet is absent.
4. **Cube coverage:** learned cuts are exact row-support nogoods.  Reaching an
   iteration limit leaves the remaining finite cube space unclassified.
5. **Blocker coverage:** cuts ignore the actual-blocker endomap, deletion-fan
   structure, and source-heavy predicates even though these are source data.
6. **Certificate trust:** Python validates JSON cores and `drat-trim` can
   validate a terminal DRAT proof, but neither validates the source reduction
   in the Lean kernel.  There is currently no terminal proof to replay anyway.
7. **Universal cardinality:** exact 12 is only one branch of a checked source
   disjunction.  The non-exact branch remains mathematically live.

## Recommended proof-facing next step

Do not promote the present finite run as an obstruction.  The highest-leverage
source step is to target the missing three-center deletion-survival consumer
above, attempting first to extract the exact q-deleted rows and tetrahedron
incidences required by the existing U5 bank theorem.  In parallel, the finite
campaign should quotient or enumerate all named-point placement orbits and add
source-sensitive blocker-endomap predicates; otherwise more row-only CEGAR
cuts can keep moving among SAT abstractions without addressing the live source
structure.

Only after that source lift exists is it worthwhile to freeze a complete
exact-12 Boolean encoding and export terminal LRAT certificates for Lean
replay.
