# [DATED AUDIT] `RemovableVertexOfLarge` proof-architecture review

**Original review:** 2026-08-10<br>
**Independent re-analysis:** 2026-08-11

This review asks a narrower and more useful question than “how many `sorry`s are
left?”:

> Which open declarations represent distinct mathematical mechanisms, and which
> are artifacts of case decomposition, interface mismatch, or cardinality
> specialization?

The answer is not the original slogan “35 leaves collapse to 22 records, then
9 families, with one intrinsically hard core.”  The leaf inflation is real, but
that slogan confuses source signatures with mathematical content.  The present
source supports roughly **three research programs**, each with internal
substructure; it does not support reducing the whole frontier to one known
missing lemma.

## Status and scope

No Lean build, `proof-blueprint` refresh, or transitive axiom audit was run for
this review.  The worktree changed after the cached spine was mined.  Therefore:

- **VERIFIED (source)** means that the declaration, its hypotheses, and its
  source-level call structure were inspected;
- **SNAPSHOT** means a fact about the cached 35-leaf frontier used by the
  original review, not necessarily the current live spine;
- **HEURISTIC** means a decomposition suggested by the present interfaces;
- **CONJECTURED** means a new mathematical theorem or adapter that does not yet
  exist source-cleanly.

In particular, “source-clean” below is local to the named declaration.  It is
not a claim of transitive `sorryAx`-freedom unless explicitly stated.

## 1. Verdict

The report was trying to do the right thing: quotient a large Lean frontier by
the mathematical ideas that would close many leaves at once.  Its strongest
conclusion, however, was too aggressive.

1. **The 35 → 22 arithmetic is a defensible source-signature census of one
   cached snapshot, not a mathematical quotient.**  The 22 classes group
   declarations with similar parameters and packet interfaces.  A common
   record may remove boilerplate without supplying a common proof.
2. **The claimed 9-family quotient is not reproducible from the document.**
   Its table has six aggregate rows and no per-leaf artifact from which nine
   families can be recovered.  It should not be labeled `VERIFIED`.
3. **There is more than one genuine mathematical core.**  At minimum the source
   separates:
   - the unique-radius / `Rigid221` / pentagon program;
   - source-faithful common-deletion and escaping-row dynamics;
   - the saturated two-radius exact-four collision/grid program.
4. **The all-low-hits hub is already a substantial consolidation.**  Its 14
   cached leaves should not be treated as 14 unrelated terminal mechanisms.
   The checked selector reduces them to a small number of stronger producer
   problems, but the source does not yet contain one invariant that closes all
   of them.
5. **Card 11 is an adapter precedent, not evidence of a uniform theorem.**  It
   shows that the top-level packet interface is usable.  Its proof relies on
   fixed labels, a `(5,5,4)` profile, and frozen finite clause banks that do not
   generalize merely by abstracting a record.

The correct strategic conclusion is therefore:

> Stop extending cardinality and coincidence case trees.  Work on a few
> mechanism-level positive producers, and refactor records only where doing so
> is necessary to state or reuse those producers.

This is a research plan, not a proof of `RemovableVertexOfLarge`.

## 2. Verified proof architecture

The top funnel is already reasonably factored:

```text
removableVertexOfLarge_of_nonIsM44
├─ |A| = 11
│  └─ false_of_criticalPairFrontier_of_card_eq_eleven
└─ post-card-11 branch
   └─ false_of_twoLargeCaps_commonCriticalMap
      ├─ exists_criticalPairFrontier_of_K4
      └─ false_of_criticalPairFrontier
         └─ CriticalPairFrontier.false_of_parentResidualConsumers
            ├─ OriginalFrontierUniqueRadiusArm
            └─ FrontierCommonDeletionParentResidual
```

The relevant source interfaces are:

- [`CriticalPairFrontier`](../../lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean)
  stores the survivor-pair packet, first-apex split, second-apex four-point
  class, and second-apex split.
- `exists_criticalPairFrontier_of_K4` is the cardinality-independent producer.
  K4 plus the surplus-cap one-hit bound yields a positive-radius selected class
  of cardinality at least four and hence a critical-pair frontier.
- `CriticalPairFrontier.originalUnique_or_commonDeletionParent` supplies the
  reusable parent dichotomy.
- `CriticalPairFrontier.false_of_parentResidualConsumers` is already the
  generic two-consumer assembler.  Adding another wrapper with the same two
  consumer hypotheses would rename the gap rather than close it.
- [`false_of_criticalPairFrontier`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Coordinator.lean)
  routes the packet into those two arms.

This architecture is not the principal problem.  The missing mathematics lies
inside the consumers.

## 3. What the cached 35-leaf census actually says

The original snapshot admits the following independently reconstructed
arithmetic:

| Source-signature partition | Leaves | Interface-record classes |
|---|---:|---:|
| flat mutual-omission terminals | 5 | 3 |
| `SourceEqU` / `Rigid221` pentagon chain | 12 | 5 |
| TriApex reverse-hit / fresh-endpoint walk | 7 | 3 |
| TriApex paired common deletion | 2 | 2 |
| TwoSource radius/fiber terminals | 5 | 5 |
| singleton routes | 4 | 4 |
| **Total** | **35** | **22** |

This table is useful for engineering, but it has two limitations.

First, “same interface-record class” does not imply “same proof.”  For example,
the TriApex leaves preserve different source-return, blocker, cap-order, or
two-radius information even when their outer packets look alike.

Second, several important properties cut across this partition:

- membership in the `OriginalUniqueFourResidual` lane;
- membership in the 14-leaf all-low-hits hub;
- the cardinality tower used by a leaf;
- whether the missing declaration is a positive producer, a contradiction
  consumer, or an adapter into an already-open consumer.

These should be stored as orthogonal tags, not forced into a single “number of
families.”  A future census should be a checked table with one row per frontier
leaf and columns for all four levels:

```text
frontier leaf → mechanism family → configuration record → terminal theorem
```

Until that artifact exists, 35 and 22 are snapshot bookkeeping; 9 is an
under-specified interpretation.

## 4. Where decomposition inflation is real

Three source patterns genuinely inflate the frontier.

### 4.1 Cardinality towers

The unique-four route repeatedly proves a bound for one cardinality and then
opens the next case.  Such lemmas can be useful finite evidence, but the chain
does not terminate unless one of the following appears:

- a cardinality-independent obstruction;
- a monotone argument closing every larger cardinality;
- a finite upper bound together with checked closure of every remaining size.

The present chain provides none of these globally.  Extending it by another
size is not consolidation.

### 4.2 Role-coincidence fanout

The reverse-hit endpoint walk splits on identities among sources, centers,
actual blockers, and fresh endpoints.  Some of those splits are mathematically
necessary because they preserve different incidence data.  Others are adapters
to a common deletion-fan construction.  The right response is to identify the
strongest data common to the useful branches, not to create one record whose
fields are a disjunction of every terminal case.

### 4.3 Repeated packet construction

TriApex and TwoSource files repeatedly construct selected four-rows,
six-point two-row seeds, escaping rows, and source-faithful deletion fans.
These repetitions indicate a reusable producer boundary.  They do not by
themselves show that the final contradictions are identical.

The original review's line-count, depth, symbol-count, and import-order claims
are omitted here.  They are either snapshot-dependent, under-specified, or not
evidence of mathematical acyclicity.  Declaration-call acyclicity must be
checked in the dependency graph; import order does not prove it.

## 5. The all-low-hits hub

The source contains a real, mathematically meaningful first quotient.  In
[`false_of_frontierAllLargeCapsTriApex_all_low_hits`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Coordinator.lean),
`nonempty_retainedInteriorPairOutcome` chooses two retained strict-cap points
and splits on their actual blockers:

```text
retained pair
├─ blockers distinct
│  └─ retained directed omission
└─ blockers equal
   ├─ most subcases reduce back to a directed omission
   └─ saturated residual:
      two distinct radii, both selected classes exactly four,
      both strict-cap intersections exactly two,
      and an equal-blocker pair at each radius
```

Thus the cached 14-leaf hub is better understood as follows:

- **directed-omission dynamics:** seven reverse-hit/fresh-endpoint leaves and
  two paired-common-deletion leaves;
- **saturated two-radius collision:** five TwoSource leaves whose positive goal
  is a rich-apex three-hit, contradicting the all-low upper bound of two.

This is already much stronger than the old “three unrelated mechanism groups”
description.  It still does not yield a one-line common contradiction.

### 5.1 A common seed that is real but insufficient

Through their downstream constructions, both root outcomes can produce a
strict-cap common-deletion seed with faithful source information.  The
collision outcome itself records blocker coincidence, not the complete
deletion packet.  The relevant constructions live in
[`RetainedStrictInteriorPairSelector.lean`](../../lean/Erdos9796Proof/P97/ATail/RetainedStrictInteriorPairSelector.lean),
[`RetainedMatchingGeometricReduction.lean`](../../lean/Erdos9796Proof/P97/ATail/RetainedMatchingGeometricReduction.lean),
and [`CommonDeletionTwoCenter.lean`](../../lean/Erdos9796Proof/P97/ATail/CommonDeletionTwoCenter.lean).

A useful normalized record would retain:

- the deleted strict-cap point and its source;
- source membership at the first apex;
- source/deleted-point inequality and source-shell omission;
- the source-faithful `CommonDeletionTwoCenterPacket`.

This record would erase an implementation case split.  It would not close the
branch: one packet forgets the collision branch's two-source common blocker and
the omission branch's same-radius source-return structure.  There is no generic
contradiction from one such packet in the current source.

### 5.2 Research target A: source-faithful six-seed boundary

**Status: CONJECTURED.**

The strongest realistic shared producer currently visible is a theorem of the
following shape:

> Given two selected four-rows whose supports overlap in the designated two
> source points, together with the required cap/source order, their union is a
> six-point seed containing a low-multiplicity center with an escaping selected
> row and a source-faithful selected-four deletion fan.

The ingredients already appear as `SourceFaithfulSelectedFourDeletionFan`,
`sourceFaithfulDeletionFan_of_triApexAllLargeContext`, the endpoint fresh
two-shell seed, and the FreshThird cross-row two-shell seed in
[`TriApexEndpointRetainedOmission.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean),
[`TwoSourceFirstFiberCollision.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean),
and [`TwoSourceFreshThirdResidual.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean).

**Success gate:** source-clean adapters from both the reverse-endpoint
shared-blocker route and the FreshThird/FirstFiber route, followed by a
non-circular consumer.  Merely constructing the six-set is not closure; the
consumer must preserve cap placement, source identities, and order/cycle data.

### 5.3 Research target B: source-exact multi-center deletion fan

**Status: CONJECTURED.**

`PairedApexClassJointDeletion` and the richer FirstFiber boundaries carry more
than the common seed: several provenance-tracked centers and exact deleted
rows.  A shared theorem should retain at least four or five such centers and
conclude a cross-row blocker collision, a forbidden injectivity pattern, or a
closed geometric configuration.

**Success gate:** the theorem consumes both a paired-common-deletion terminal
and a TwoSource multi-center terminal without calling either terminal as an
assumption.  A record that merely bundles their hypotheses does not pass.

### 5.4 Research target C: two-radius signed/omission grid

**Status: CONJECTURED.**

`PairedTwoRadiusGrid` and
`exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`
share two exact-four cap rows, but that denominator is too weak.  The former
also has disjoint retained shells and reflection/order data; the latter has two
equal-blocker collision rows, cross omissions, and localized cycles.

The next abstraction should therefore be a signed or directed two-radius grid,
with adapters that preserve those facts and a positive conclusion of a
rich-apex hit of cardinality at least three.

**Success gate:** produce the three-hit directly from the grid data.  The
existing high-hit theorem in the coordinator is not an admissible producer
because it is currently obtained by `False.elim` from the all-low contradiction
it is meant to close.

## 6. The unique-radius / `Rigid221` program

The other major arm is not subsumed by the all-low analysis.  Its SourceEqU,
pentagon, mutual-omission, and joint-deletion leaves are variations on a common
geometry, but no uniform producer is present.

The local theorem
`false_of_twoDistinctExactFourMutualOmissionJointDeletions` is useful evidence:
for fixed rows, sources, radii, and two distinct deleted vertices it closes via
a blocker-collision/five-center split.  It is a **local conditional sink**, not
a global producer of those witnesses.

Two credible research formulations remain.

### 6.1 Direct uniform pentagon obstruction

**Status: CONJECTURED.**

Prove a cardinality-independent contradiction from the normalized
`OriginalUniqueFourResidual`/`Rigid221` data—equivalently, a theorem forcing the
required deleted-row blocker off its selected class or producing the forbidden
incidence cycle without splitting on `|A| = 12, 13, 14, …`.

**Success gate:** one theorem replaces the cardinality ladder and does not
depend transitively on one of its sorried terminal consumers.

### 6.2 Varying-source witness family

**Status: CONJECTURED.**

Define a `MutualOmissionFamily` over several source rows, with their
joint-deletion witnesses, and prove either:

- two rows collide in a way accepted by the existing local sink; or
- the deleted-vertex/blocker map is injective, giving a finite cardinality
  contradiction.

This is the real missing adapter behind attempts to reuse
`false_of_twoDistinctExactFourMutualOmissionJointDeletions` globally.

**Success gate:** a source-clean producer of the sink's hypotheses for arbitrary
prescribed rows, or a stronger family theorem that closes directly.  Five
wrappers that each postulate the required witness do not count.

## 7. What card 11 does—and does not—show

[`false_of_criticalPairFrontier_of_card_eq_eleven`](../../lean/Erdos9796Proof/P97/ATail/FiniteN11Frontier.lean)
uses the generic parent assembler with fixed-card consumers.  This verifies an
important architectural point: `CriticalPairFrontier` and its parent dichotomy
are expressive enough to host the source-level fixed-card closure.

It does not expose a hidden general theorem.  The unique-radius exact-five
common-center branch uses `Card11CapLabeling`, a canonical packet, labels 6–8,
the `(5,5,4)` profile, and frozen G3 clause banks.  Those are card-11 data.  The
common-deletion branch likewise supplies a fixed-card consumer, not a uniform
one.

Consequently:

- a cardinality-indexed version of `false_of_parentResidualConsumers` is only
  an interface until both indexed consumers are proved;
- no source-based bypass around `CriticalPairFrontier` is presently justified;
- any real top-funnel consolidation must add new geometry, not another
  dispatcher.

## 8. Recommended work order

The hardest mathematical producers should be tested before a broad record
refactor.  Otherwise the project risks making the open frontier prettier
without shrinking it.

| Priority | Work item | Evidence home | Completion gate |
|---|---|---|---|
| P0 | State and attack the two-radius signed/omission-grid producer | `PairedTwoRadiusGrid`; `TwoSourceAlignedLowHits` | direct rich three-hit, with no appeal to the all-low contradiction |
| P0 | State and attack the source-faithful six-seed boundary | TriApex endpoint; FirstFiber; FreshThird | two independent adapters plus a non-circular consumer |
| P0 | Choose between the direct uniform pentagon theorem and a varying-source witness family | `Rigid221Placement`; `Rigid221SourceHeavy`; `TwoDeletionCollision` | closes more than one cardinality/role leaf through a new producer |
| P1 | Isolate a source-exact multi-center deletion-fan theorem | paired common deletion; TwoSource first fiber | one theorem consumes both mechanisms without assuming their terminals |
| P2 | Introduce normalized records only for abstractions used by P0/P1 | common-deletion seed; six-seed; two-radius grid | adapters reduce duplicated construction and preserve all data used downstream |
| P2 | Add a checked frontier-classification artifact | `docs/` or `certificates/` | one row per leaf, exact build/commit, four-level classification, stale-state warning |

Finite SAT or certificate work is appropriate after one of these abstractions
has a fixed finite boundary and a proof-checking ingress.  A green finite case
is evidence or a fixed-card consumer; it is not a universal closure.

## 9. Final assessment

The original review correctly diagnosed severe decomposition inflation and
correctly looked for shared theorem boundaries.  It was inaccurate in treating
its source-signature census as a verified mathematical quotient and in saying
that only one hard combinatorial obligation remained.

The defensible replacement is:

- **SNAPSHOT:** 35 cached frontier leaves can be classified into 22 outer
  interface-record shapes;
- **VERIFIED (source):** the top funnel and all-low retained-pair selector
  already provide meaningful consolidation;
- **HEURISTIC:** the open frontier is best organized around about three research
  programs, with two or three producer boundaries inside the all-low arm;
- **CONJECTURED:** a uniform pentagon theorem, source-faithful six-seed theorem,
  source-exact multi-center fan, or signed two-radius grid could collapse large
  parts of the frontier;
- **NOT ESTABLISHED:** that any one of these statements is true, that the cached
  35-leaf set is the current live spine, or that `RemovableVertexOfLarge` is
  close to unconditional closure.

That is the level at which further research should proceed.
