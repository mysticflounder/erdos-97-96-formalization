# PentagonBlocker refactor pilot v2 — 2026-09-03

## Goal
Use the current `P97-R221-PENTAGONBLOCKER` leaf as the pilot for a refactor that reduces multiple publish-reachable `sorryAx` roots, not merely one branch-specific proof.

Primary live target requested for current-source audit:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`.

## Critical correction from historical source audit
The initial idea of extracting a new pure common-circle / midpoint-cycle contradiction is wrong.

Historical exact rational models realize the local pentagon trace + apex-circle/bisector packet. In particular the off-class pentagon lane produced a rational strictly convex local realization with the physical five-circle, the named `u/xv` shells, off-class blocker, both saturated bisectors, and the forced second-cap order. Therefore local circle/incidence/order data alone do not contradict the configuration.

Accordingly, the missing layer is not another geometry theorem. The repository already has strong cardinality-generic metric consumers. The recurring deficiency is the producer that maps live branch provenance to the **positive selected-row incidences and one common boundary order** required by those consumers.

## Existing reusable consumer banks
Do not duplicate these unless the current packet produces a genuinely new metric motif:

- `KalmansonThreeEqualitySchemas`
- `KalmansonFourEqualitySchemas`
- `CapCrossingKalmanson`
- `TwoCenterBisectorParity`
- `GenericRowNogoodCertificate`
- `selectedFourClass_shared_pair_separated`

These already provide cardinality-independent strict Kalmanson / equal-distance / shared-pair contradictions once the ordered roles and support memberships are supplied.

## Historical source-clean pentagon invariants worth reusing
The old pentagon work established several nontrivial source-facing facts. The current-source audit must identify which remain available under the current leaf and factor them rather than reproving them:

1. Exact directed C5 traces of the five physical sources against their actual selected rows.
2. Pairwise distinctness of the five actual blocker centers from trace + equal-support propagation.
3. Forced strict second-cap order `u < c < xv < xu` up to reversal.
4. The reselected-row strict physical triple bound (`<= 1` against `{u,xu,xv}`).
5. Common-deletion fan producers: omitted physical points give two-center deletion packets at the actual blocker and physical apex.
6. Crossed-row/deletion adapters converting survival/obstruction data to exact positive/negative selected-row incidences.
7. Fixed-pair bi-survival and three-concrete-exact-row exporters.
8. Named source/deletion six-arm survival interfaces and exact physical-cycle blocker ingress in exact-12 lanes.

These are producer ingredients, not terminal contradictions.

## Refactor architecture

### Layer O — neutral ordered selected-row occurrence packet
Factor a low-level, branch-agnostic structure in the lowest acyclic module that can be consumed by existing Kalmanson/bisector banks. Exact field list should be determined from the first actual consumer, but conceptually it should retain:

- one `BoundaryIndexing A` (or equivalent injective/image-surjective CCW boundary);
- explicit named row centers and support roles;
- the `SelectedFourClass` / critical-shell rows that witness each radial equality;
- positive support memberships, not merely omissions/survival predicates;
- distinctness proofs for centers/support roles;
- `B.indexOf` or equivalent role-index identities;
- a finite direct/reflected cyclic-order outcome sufficient to invoke the consumer.

It should **not** carry Rigid221 historical provenance, deletion-source records, exact-cardinality labels, or coordinator structures unless the consumer uses them.

Potential name family (not binding until source audit):
`OrderedSelectedRowsOccurrence`, with specialized arities such as `ThreeRowSixRoleOccurrence` or `TwoCenterPairOccurrence` only if they match existing consumers exactly.

### Layer P — branch provenance adapters
`Rigid221SourceHeavy`, `Rigid221Placement`, TwoDeletion, and TwoSource should each prove small adapters from their source-rich packets into Layer O.

The adapter is where deletion survival, actual-blocker identity, cap localization, critical-shell exactness, and source provenance are converted into:
- explicit selected rows;
- positive support memberships;
- role distinctness;
- boundary positions/order.

No new Euclidean proof belongs here.

### Layer C — existing metric consumers
Invoke the existing Kalmanson / two-center / weighted-cancellation theorem. The live leaf becomes a thin call chain:

`source packet -> occurrence adapter -> existing consumer -> False`.

### Layer K — coordinators
`Rigid221SourceHeavy`, `Rigid221Closure`, and `TwoSourceClosure` should remain thin dispatchers. Do not add another unconsumed residual structure in a coordinator.

## Why this refactor can close more than PentagonBlocker

### Rigid221Placement (five registered roots)
The Aug-8 audit concluded that all five placement sorries share essentially the same first missing bridge: source-faithful placement from `ExactFourRigid221PhysicalApexSourceEqUContext` / minimal-core data to a boundary order plus explicit selected-row incidences/equalities. Exact-12/15/16/Kalmanson theorem banks are already consumers.

A correctly factored Layer O plus placement adapters could therefore serve:
- `...minimalCore`;
- `...sourceEqU_blockerDeleted`;
- `...blockerV_sourceRowHeavy`;
- `...blockerVRow_oppositeRowHeavy`;
- `...blockerVRow_sparseRows`.

Not all five are expected to close immediately, but this attacks their shared blocker instead of five independent leaves.

### TwoSource
The current audit already identifies a shared occurrence problem: normal forms expose omissions and collision packets, while Kalmanson sinks require positive cross-incidences and one cyclic role order. The same neutral ordered-row packet can become the target of the TwoSource occurrence theorem.

### TwoDeletion
TwoDeletion's blocker-coincidence/survival-square leaves are more deletion-centric, but their downstream contradictions also repeatedly need neutral three-center / two-center deletion rows plus positive crossed incidences. Use a sibling neutral packet for deletion geometry rather than the historical provenance-heavy structures.

Suggested low-level sibling structures:
- `ThreeCenterOneDeletionRows`;
- `TwoCenterTwoDeletionFixedRows`.

Only add these if a live TwoDeletion consumer can immediately use them.

### Exact-five / B1
Reuse only if the same occurrence/order kernel literally applies. Do not over-generalize Layer O merely because those branches also mention rows and caps.

## Concrete implementation order

1. **Current-source literal audit of PentagonBlockerDeleted.** Identify exact hypotheses, parent, current HEAD, historical producer availability, and nearest existing cardinality-generic consumer.
2. **Choose consumer first.** Write its literal minimal ingress: row arity, support membership count, role distinctness, boundary order.
3. **Factor only that occurrence packet.** Put it below `Rigid221SourceHeavy`; prove a generic consumer adapter if the existing theorem's signature is cumbersome.
4. **Build Pentagon provenance adapter.** Reuse existing five-cycle traces/blocker injectivity/forced order/deletion-row exporters. The adapter must end in the selected existing consumer, not another residual.
5. **Rewire `P97-R221-PENTAGONBLOCKER`.** Verify parent consumer and publication-root `sorryAx` decrement.
6. **Immediately reuse against Placement.** For each of the five placement roots, compute which packet fields are already derivable and which single source fact remains. Refactor common derivations into one placement occurrence producer.
7. **Apply to TwoSource.** State the shared occurrence theorem directly in terms of the neutral packet; avoid another branch-specific Kalmanson wrapper.
8. **Then revisit TwoDeletion.** Factor deletion-neutral packet only if blockerCoincidence/survivalSquare can directly consume it.

## Acceptance criteria for any refactor
A change counts toward this plan only if at least one is true:

- it removes a publish-reachable `sorryAx` root immediately; or
- it is a source-clean low-level packet/consumer used by at least two identified live roots, with the exact missing field for each recorded.

For every claimed closure:
- exact commit + clean/dirty status;
- focused build;
- `#print axioms` for new packet/adapter/consumer;
- direct parent compilation;
- obligation-registry/reachability diff;
- no new `sorry`/`admit`/native trust unless the project explicitly accepts an existing finite-certificate boundary.

## Routes explicitly retired for this pilot

- New local midpoint/common-circle contradiction from the pentagon trace alone: refuted by exact rational local realization.
- Bare blocker-cycle -> Kalmanson cycle: historically refuted; blocker-cycle API lacks the ordered positive pair incidences.
- Pure cap counting / fiber counting as the terminal: historical incidence shadows survive.
- More conditional theorem-bank schemas without a source occurrence producer.
- Fixed-cardinality certificate presented as closure of an arbitrary-cardinality leaf.

## Work dispatched in nthdegree
- #9800: current target/parent/import/reuse audit.
- #9801: split exact packet reconstruction and cross-sorry reuse audit.
- #9802: literal theorem signature/context request.
- #9806: correction based on historical realizability; redirect to existing Kalmanson/bisector consumer and minimal source occurrence ingress.

No source edit should start until the current live target's nearest consumer and literal missing occurrence packet are identified. This is a consumer-first gate, not a delay: it prevents the wrapper inflation that created many of the current `NORMAL_FORM_CLOSED_TERMINAL_OPEN` obligations.
