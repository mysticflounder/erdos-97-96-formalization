# FreshThird aligned Q/core expansion — v3 landing contract

Status: bounded diagnostic theorem mining only.  This v3 namespace is
self-contained and does not import the v2 canary, metric encoders, learned
cuts, or any production artifact.  It makes no claim of geometric realization,
universal lifting, consumer contradiction, or Lean/kernel closure.

## 1. Origin audit

The packet being abstracted is
`FreshThirdAlignedCommonDeletionCorePairPacket` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean`.
The retained source-row fields are the two exact-four
`CapSourceThirdCanonicalRowWitness` rows from
`TwoSourceCanonicalSurface.lean`; their mutual incidence and unequal
first-apex radii/singleton slices are preserved from the v2 contract.

The new Q clause comes from `FreshOutsideFirstBlockerFiber` in
`BlockerMultiplicityGeometry.lean`: its first blocker shell has the two
collision points and exactly two outside-cap points (`source` and
`otherOutsidePoint`).  In this finite naming, that exact row is
`{x0,x1,qFresh,qOther}` = `{P1,P2,qFresh,qOther}`.

The new core clauses come from
`ATAILStageOneMinimalDeletionCore.MinimalDeletionCore` in
`ATail/MinimalDeletionCore.lean`: for each deleted source in `U={x,y}`,
`shellAt` supplies an ambient `CriticalSelectedFourClass` whose support has
exactly four members, and all shell supports indexed by distinct sources are
pairwise disjoint.

## 2. Preserved v2 contract

Each source row has exact support cardinality four and contains both labelled
source points (mutual incidence).  The first-apex radii are distinct and each
aligned first-apex slice is a singleton.  Each row chooses `(x,y)` from the
two retained endpoint pairs, omits those endpoints, survives the double
erase at source-row cardinality four, and carries explicit first-apex-failure
and nonempty-minimal-core source facts.  The common endpoint condition is
`x0=x1 ∨ y0=y1`.

## 3. New v3 clauses

The Q first-fiber row is forced to exactly four members
`{x0,x1,qFresh,qOther}`.  Each row's minimal core is expanded into two
ambient support predicates (one for the selected x endpoint and one for the
selected y endpoint).  Each support is exactly cardinality four, contains its
indexed deleted endpoint, and the two supports for that core are disjoint
pointwise.  The shell supports live over one finite ambient label universe;
this is a structural representation, not a Euclidean or radius realization.

## 4. Exhaustive solver protocol

There are 16 endpoint-choice tuples `(x0,y0,x1,y1)` and exactly 12 satisfying
`x0=x1 ∨ y0=y1`; each of those 12 is fixed and checked.  The harness emits one
QF_LIA SMT2 file per arm plus a positive smoke and three negative smokes:
overfull source row, overfull Q row, and forced overlap of the two core shells.
Z3 is the primary solver.  Every emitted SMT2 file is independently replayed
with cvc5 when available.  Z3/cvc5 `unknown`, timeout, malformed output, or a
status mismatch fails closed.

## 5. Landing and interpretation

All 12 arms are SAT in the finite source-fact abstraction; no arm is UNSAT.
The Q exact-four clause and pairwise-disjoint two-shell clauses therefore do
not by themselves produce a finite obstruction in this schema.  The three
negative smokes are UNSAT only because they explicitly contradict an exact
source clause.  These results are consistency diagnostics, not a theorem,
geometric counterexample, universal consumer lift, or Lean closure result.
