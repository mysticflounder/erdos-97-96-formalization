# Exact-12 nextRow static equality closure: implementation goal

Date: 2026-08-10

Status: the deterministic compiler and fresh fail-closed runner are implemented
and focused Python replay tests are green. The Lean auxiliary valuation, a
terminal UNSAT artifact, a universal lift, and Lean `sorry` closure remain open.

## Goal

Close the exact-12 `nextRowOnlyHit` child of
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
through one source-faithful, authenticated terminal SAT path. The first
implementation milestone is to move the dominant duplicate-center equality
closure from a repeatedly rediscovered CEGAR cut family into the initial CNF,
without changing any historical formula or artifact schema.

The route is complete only if all of the following land:

1. a fresh finite formula schema and deterministic Python compiler;
2. a source valuation theorem for every new auxiliary variable and clause;
3. exact Python/Lean agreement on variable allocation and clause order;
4. an authenticated typed source-order bank whose cuts are accepted by the
   existing mathematical consumer;
5. a terminal assumption-free UNSAT formula with a checked DRAT/RUP artifact;
6. exact terminal-DIMACS equality at the Lean ingress;
7. wiring into the live exact-12 nextRow leaf; and
8. a fresh proof-blueprint spine and transitive axiom audit.

Infrastructure, SAT survivor elimination, detector-clean models, iteration
limits, and green local builds are intermediate evidence, not closure.

## Why the earlier shared-triple description was wrong

The source-faithful base formula already contains C2: two selected row supports
at distinct centers may intersect in at most two labels. Therefore a direct
clause forbidding two selected supports that contain one common triple is
already present and adds no strength.

The dominant `equality-duplicate-center` certificates use **transitive metric
edge equality**, often through rows at several different centers. They are not
direct support-intersection conflicts. The eager formula must encode this
closure relation, not duplicate C2.

## Fresh formula contract

Python schema:
`p97_rigid221_exact12_next_row_static_equality.v1`.

For the twelve finite labels, let `E` be the 66 unordered label pairs. After
the frozen source-faithful base and one nextRow cell have been compiled, add:

- one variable `eq(e,f)` for each unordered pair of distinct edges in `E`:
  2,145 variables;
- for every candidate choice and every pair of its four incident edges, a row
  implication `¬choice ∨ eq(e,f)`: 18,240 clauses;
- the three symmetric transitivity clauses for every three distinct edges:
  137,280 clauses; and
- for every two candidate centers and every three other labels, one four-literal
  clause forbidding both centers from being equidistant from that triple:
  7,920 clauses.

Total extension: 2,145 variables and 163,440 clauses.

Only this duplicate-center family belongs to v1. Equal-K4, equilateral
bisector, three-triad, perpendicular-bisector, and ordered-metric cuts require
separate source licenses and fresh formula revisions; the scratch benchmark's
optional clauses are not silently inherited.

## Two valuations and their roles

The independent Python replay uses the **minimal row-generated equivalence
closure**. It is canonical and allows an exact differential check:

- the closure valuation satisfies all row and transitivity clauses; and
- it satisfies all duplicate-center clauses exactly when the existing
  duplicate-center detector finds no core.

The Lean source bridge may use the stronger **actual squared-distance equality**
valuation. Selected metric rows imply the row clauses, equality is transitive,
and the existing duplicate-center geometry kernel rules out every forbidden
triple. This theorem is the necessary ingress contract from a live geometric
counterexample to a satisfying assignment of the extended finite formula.

The existing checked-nogood theorem
`GenericRowNogoodCertificate.DuplicateCenterNogood.not_realizes_of_positiveCheck`
licenses individual closure certificates. It is provenance for the geometry,
but it does not by itself prove the new whole-formula valuation theorem.

## Runner and artifact isolation

Historical nextRow v1-v5 jobs, journals, manifests, CNFs, and proofs remain
byte-for-byte historical. The static formula must use:

- a new run schema;
- a new record schema;
- a new output namespace;
- a manifest entry for this compiler's exact source bytes;
- initial/final CNF hashes, clause-delta hash, and relation-variable-map hash;
  and
- no implicit resume or bootstrap from an older journal.

The existing authenticated source-order bank may be reused only by replaying it
against the new choice-variable map and binding its digest in the fresh job.
Each admitted cut has a generated Lean nogood declaration. The historical
nextRow terminal consumer does **not** consume the stronger static formula, so
fresh records leave `terminal_formula_consumer` null and authenticate the
status `AWAITING_LEAN_STATIC_AUXILIARY_VALUATION`. Structural stages without a
typed Lean consumer must not be admitted into a proof-bearing terminal formula;
they are fail-closed survivor classifications until their own source theorem
and consumer exist.

The fresh runner schemas are:

- job: `p97_rigid221_exact12_next_row_static_cegar_job.v1`;
- cut: `p97_rigid221_exact12_next_row_static_source_order_cut.v1`; and
- run: `p97_rigid221_exact12_next_row_static_cegar_run.v1`.

After complete SAT replay, the runner first looks for an authenticated
source-order bank cut. If none exists, `equality-duplicate-center` is a static
formula invariant failure, every other detected stage is
`UNADMITTED_STRUCTURAL_SURVIVOR`, and a detector miss is
`STRUCTURALLY_UNRESOLVED`. In all three cases it writes the survivor and learns
nothing. Even fresh identical-CNF DRAT verification is reported as
`UNSAT_DRAT_VERIFIED_AWAITING_LEAN_STATIC_VALUATION` until the Lean bridge lands.

## Implementation sequence

1. **Done:** land the deterministic compiler, frozen counts/hashes,
   single-install guard, and canonical closure evaluator.
2. **Done:** differential-test a known duplicate-center cube and a preserved
   detector-clean scratch survivor; test deterministic ordering and schema
   isolation.
3. **Done:** add a fresh nextRow runner that installs the extension immediately
   after compiling the cell and before hashing the initial CNF.
4. **Implemented, awaiting live-bank canary:** replay only the existing
   generated Lean-backed source-order bank against the fresh formula and
   capture every other stage without learning.
5. Run one bounded one-cell canary. After every wave, search the survivors and
   recurring cores for a general source theorem before spending more compute.
6. If the canary reaches terminal UNSAT, rerun the exact formula locally with
   proof tracing and prepare formula-specific compact-RUP ingress. If it reaches
   an untyped stage, stop and name exactly that missing predicate/theorem.
7. Prove the Lean auxiliary-valuation bridge and exact formula equality.
8. Expand only after the one-cell contract is green; then use at most the
   authorized twelve concurrent exact-12 cells.
9. Wire the checked terminal result into the live nextRow leaf and refresh the
   proof spine.

## Parallel general-cardinality target

This exact-12 route cannot close either `card ≥ 13` child. In parallel, the
mathematical target remains one endpoint-parametric missing-incidence producer
that can feed both unbounded children. Its progress and closure claims must stay
separate from this finite formula.

## Stop conditions

Stop a compute wave and return to theorem production when:

- the first survivor is rejected only by an untyped structural stage;
- repeated survivors expose the same source predicate without broader cuts;
- a formula or certificate hash drifts under fresh replay;
- a terminal solver result cannot be reproduced with exact proof bytes; or
- the ongoing Lean refactor changes the live consumer contract.

At such a stop, the deliverable is the smallest source-entitled missing
predicate and its exact Lean consumer, not a larger iteration budget.
