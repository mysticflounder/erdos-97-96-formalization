# FirstFiber source-faithful witness and closure plan

Status: executable planning document; this is not a closure claim.

Execution checkpoint (2026-08-18): the source-adapter gate is landed in
commits `08c84181` and `325ac8a3`. It checks the cap-cardinality identity,
deleted/center separation, arm/deletion consistency, all four collision-arm
labels, declared Lean-source bytes, and optional coverage of all eight role
pairs. Its focused tests pass, including an eight-packet smoke artifact bound
to the current Lean source hash. No source-faithful packet producer or solver
job has been promoted yet. A concurrent direct Lean proof attempt remains
unverified and currently fails type checking; it also supplies collision
endpoints where the downstream consumer requires a genuinely escaping point.

The first Lean ingress slice is now landed as `49e03929` in
`FirstFiberFinitePacketIngress.lean`. It reindexes one genuine five-row
deletion boundary, requires an explicit bijective order, and proves a named
slot bound of 26 for that packet. Combining the two outside-deletion packets
and the four collision-row arms still needs a local-core coverage theorem; the
module intentionally makes no full-carrier or `MetricCoreAlternative` claim.
The follow-up union constructor is also landed in `53708cdf`: it retains both
packets and exposes the anonymous complement explicitly, with a conservative
named-slot bound of 52. This is an overflow-safe source packet, not a
cardinality reduction.
The ingress now also carries explicit `OutsideDeletionArm`,
`CollisionRowsArm`, and eight-pair bookkeeping, landed in `ce2803ef`; these
labels are metadata only until a source theorem supplies the corresponding
packet for every role pair.
The role API is now consumer-ready in `295306f9`: `rolePair_decompose`
enumerates all eight arm pairs, and `RoleCombinationPacket` bundles the two
arm packets with their overflow-preserving union.  This is still a
source-neutral constructor; it does not assert that the live residual supplies
all eight packets, nor does it provide a finite carrier bound.
The first source-specific bridge is now landed in `dcd238d7` and made
import-reachable by `38faf73a`.  Given the two outside-row choices and the
four collision-row choices, it selects the supplied arm and constructs the
corresponding paired packet with explicit center-cardinality, order, and
profile hypotheses.  The theorem returns packet data only; the live residual
still has no finite-cardinality lift or metric consumer at this point.
The bridge now also derives the actual convex `BoundaryIndexing` and identity
order in `4218b49e`, returning an existentially indexed packet.  This removes
an arbitrary-order input from the computational interface, while retaining
the explicit five-center cardinality premises that the source has not yet
proved uniformly.
The raw-boundary wrapper in `c582b7c9` now consumes the live deleted-point
equality directly and reuses the two existing `hcentersP`/`hcentersPρ`
cardinality facts.  Thus the remaining source ingress is no longer a role or
serialization mismatch; it is the missing finite obstruction/metric consumer
that would use the resulting overflow-safe packet.
The same lane now exposes a source-safe faithful-boundary adapter and the
conditional consumer `false_of_firstFiberOutsideFaithfulCarrierBoundary_metricCore`
in `62de534d`.  The metric-core premise remains explicit: this is a real
Lean landing for a future exact solver result, not a claim that the current
packet already contains a core.
The finite-scope theorem is now import-reachable through `de53d132`.  Its
`BoundedNamedSlotEncoding` injects the combined packet's named support into
`Fin 52`, uses `none` exactly for the explicit overflow complement, and proves
the membership and injectivity replay facts.  This is the theorem needed to
define a bounded diagnostic quotient; it still says nothing about omitted
full-row incidences or metric-core existence.
The composition lemmas in `66e14aef` now package the source role existential
with its bounded named-slot encoding.  This is the formal ingress contract for
a diagnostic solver: a model may reason over the 52 named slots plus explicit
overflow, but any UNSAT result remains scoped until a replay theorem connects
its certificate to a full source consumer.
The replay-facing maps are now landed in `37609ba9`.  For an explicitly named
support, `namedSetMap` preserves support cardinality and `mapIndexedExactRow`
preserves the four-row support and center exclusion after projection.  Deleted
points are replayed as omitted named labels only when the source proves that
they are not in the selected support; the maps never infer nonmembership from
the overflow complement.  This closes the serialization gap for row replay,
but it is still not a coverage theorem or a `MetricCoreAlternative` producer.
The packet-level replay contract is now landed in `782054f1`.  It requires
namedness of every row center and support explicitly, maps the five rows with
`List.pmap`, and replays output length, support cardinality, and center
exclusion.  The explicit row-center premise is intentional: the generic
`IndexedPacket` record does not identify each row with a corresponding entry
in its center list, so the replay layer must not infer that alignment.
The role-packet adapters are now landed in `d85543cc`.  The left and right
packets of every `RoleCombinationPacket` inherit named row centers and
supports from `combinedPacket.namedSlots_eq`; the adapter therefore returns
both mapped five-row lists with no caller-supplied hidden alignment premise.
This completes the source-to-bounded-row replay bridge, while leaving the
metric obstruction and arbitrary-cardinality coverage obligations open.
The deletion replay check is now included in `f08bf1a7`: the role contract
requires the deleted label itself to be named, and every mapped row is proved
to omit its mapped deleted label.  This closes the packet-level omission
invariant needed by a DIMACS model decoder; it still does not assert any
nonmembership for anonymous overflow points.
The composed diagnostic ingress is now landed in `f963cf11`: from indexed role
packet existence it produces an explicit bounded encoding and both mapped
five-row lists, with their lengths and replay equalities.  This is the first
complete source-to-bounded-replay theorem in the lane.  Its scope is still
diagnostic: it supplies no finite upper bound on `D.A.card`, no coverage of
unnamed points, and no metric-core alternative.
The proof-blueprint index confirms this declaration is indexed but not yet
spine-reachable: `TwoSourceFirstFiberCollision.lean` still contains a
foreign-dirty, unverified replacement for the live `sorry` and does not import
the bounded module.  The next integration step is owner-owned consumer wiring,
not another solver wave.
The import-safe consumer itself is now banked in `437bfff8` as
`FirstFiberMetricCoreConsumer.false_of_firstFiberFaithfulCarrierBoundary_metricCore`.
It has no FirstFiber-target import and no trust additions; once the target owner
imports it, a source-produced faithful boundary plus a `MetricCoreAlternative`
has a direct kernel consumer.
The frontier coordinator now imports that module in `f808b178`, making the
consumer available from the aggregate tree.  The aggregate targeted build is
currently blocked by pre-existing errors in the foreign-dirty
`TwoSourceFreshThirdResidual.lean`; the new consumer itself remains direct-file
clean.  This is an infrastructure/build blocker, not a metric-core closure.
The exact-row consumer was tightened in `6e5014af`: its metric-core witness
must contain a faithful boundary whose `rows` field is exactly the supplied
outside-row packet.  This prevents a solver artifact for an unrelated faithful
boundary from being accepted as the consumer's core.
The consumer-first contract was made explicit in the source-safe module after
the target audit: `false_of_firstFiberExactRows_metricCoreCoverage` constructs
the faithful carrier directly from the exact-row packet and reduces closure to
one universal coverage premise, namely that every faithful carrier with those
five rows has a `MetricCoreAlternative`.  This is the theorem to give the
finite miner; it is deliberately not a closure claim, because no source
hypothesis currently supplies that coverage premise.
The follow-up source search checked the existing six-point two-pair,
perpendicular-bisector, and five-row circle-order cores.  The outside packet
does not provide their required cross-row memberships or cyclic inequalities,
so none can be instantiated solver-free.  The only immediately reusable
candidate is the generic five-row cyclic consumer in the round-19 scratch
adapter; it should be promoted only if a source packet supplies all fifteen
support memberships and the ordered spine.  Otherwise the bounded miner must
search for a new core schema with an explicit replay theorem.

### Order and metric-ingress audit (2026-08-19)

`FirstFiberOrderProjection.lean` is now landed in `f0e04de1`.  Its named-slot
projection uses the increasing boundary order of the named support, proves
injectivity, and provides the strict-order replay facts needed by any bounded
cyclic consumer.  This is an ingress theorem only: it does not identify the
bounded quotient with the full carrier or supply a metric core.

The metric route is currently blocked by a source-contract defect found before
any new solve.  The Python adapter projects each exact five-row packet without
carrying its deleted label, while the cvc5 encoder applies exact off-circle
constraints to every carrier index.  For a q-deleted exact row, the deleted
point is only absent from the selected four-set; its nonmembership in the full
circle is not proved.  The adapter and encoder must therefore carry the deleted
label and exempt it from exact exclusions (or use selected-subset semantics),
with a regression test, before a FirstFiber metric result can be considered
source-faithful.

### Diagnostic normalization probe (2026-08-19)

A standalone Lean probe (`lean/scratch/FirstFiberOutsidePairProofProbe.lean`)
typechecks the following source-side normalization composition:

1. derive the cap placement of the source blocker from
   `blocker_mem_capInterior`;
2. derive its distinctness from the first-blocker center using
   `source_witness.2.2.2.1`;
3. use `deleted_eq_outsidePoint` to inject `outsideExactRows` into the two-arm
   `FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual` packet;
4. normalize that packet with
   `firstFiberOutsidePair_exactRows_or_crossedThreeRows`;
5. pass the normalized packet to the existing collision-deletion coordinator.

This probe is **not a closure proof**: the coordinator's two exact-row arms
call the live target theorem back, so using it at the target would be circular.
The probe establishes only that the deleted-point normalization is type-correct.
The target still needs a non-circular contradiction consumer (or a new
source-level producer).  The metric-core and U3 lanes therefore remain open.

## Objective

Resolve the live FirstFiber outside-pair obligation

`false_of_capSource_firstFiber_outsidePairDeletionExactRows`

in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean`.

There are two acceptable terminal outcomes:

1. produce a finite, source-faithful Euclidean witness that survives exact replay; or
2. produce a finite obstruction whose coverage and arbitrary-cardinality lift are proved in Lean and which consumes the named live theorem.

An abstract fixed-cardinality SAT result is neither outcome. It is discovery evidence until its source ingress, coverage, and replay contract are complete.

## Current diagnosis

The existing `FirstFiberFinitePacket` extractor is source-clean and reindexes the whole carrier, but it does not provide a concrete `CounterexampleData` instance or a finite upper bound on `D.A.card`. The live residual has two outside-point deletion arms and four five-center exact-row arms. Choosing one from each gives a bounded named projection:

- ten exact-row supports, each of size four;
- at most two deleted points;
- at most ten row centers before source-side deduplication;
- at most 52 named slots in the conservative combined packet.

This is a projection of the source data, not a claim that the full carrier has at most 52 points. A later role-specific theorem may lower the bound after proving center sharing, but the solver must retain an overflow/anonymous remainder state and must never infer nonmembership from omission from the projection.

## Phase 0 — Freeze the proof contract

Before generating a new CNF, record:

- the source revision and declaration hash for the live theorem;
- the eight role combinations: two outside deletions times four exact-row arms;
- the exact hypotheses available at each role combination;
- which rows are full carrier circle classes and which are only selected four-subsets;
- the intended Lean consumer, or a new consumer name if no existing theorem accepts the obstruction;
- the cardinality scope of every finite encoding.

The contract must state that a solver model is a candidate until independently replayed. An UNSAT result is scoped to the encoded quotient unless a Lean coverage theorem maps every live instance into that quotient.

The production ingress must be import-reachable from the proof tree; the existing scratch extractor is evidence, not a landed bridge. The validator must cross-check each arm against its deleted-point identity, hash the declared Lean source bytes and compare the digest rather than merely checking its shape, verify profile/cardinality consistency, and check deleted-point/center distinctness. It must also state whether every named object belongs to the full carrier or only to the bounded projection.

## Phase 1 — Build the bounded named-support ingress

Add a source-side adapter for each of the eight role combinations. It should:

1. call the existing indexed-packet extractors;
2. assign stable role IDs to centers, supports, deleted points, and the two outside points;
3. deduplicate names while retaining an injective map from every named source object;
4. retain the active/overflow distinction for all unnamed carrier points;
5. preserve cyclic order restricted to named points;
6. preserve center exclusion, support cardinality four, deleted omission, center distinctness, and every exactness fact proved at the source;
7. expose provenance identifying the live arm and the Lean declaration.

The adapter must not assert that an omitted point is outside a circle unless the source supplies that nonmembership. It must not turn an arbitrary four-subset from a deletion certificate into a full shell class.

The adapter must transport the actual cyclic boundary order, rather than installing an arbitrary local order, and must expose the relation between the profile and `n` whenever a profile assumption is used. The eight-arm coverage theorem must be checked by a finite exhaustive adapter test and by a Lean theorem, not inferred from the Python role count.

The first Lean milestone is a theorem saying that every live instance yields one of these eight packets, with an explicit role map and overflow set. This is the ingress theorem required before a production UNSAT claim.

## Phase 2 — Encode only source-entitled constraints

The first solver should be a cardinality-independent role quotient, not an exact-17 census. Its state should include:

- equality and inequality facts for named squared distances;
- row-center incidence and center exclusion;
- the two deletion identities and outside-pair roles;
- exact four-support constraints where the source proves a full class;
- three-valued membership facts for unknown circle incidences;
- cyclic order and convexity constraints on named points;
- pinned multiplicity constraints already admitted by the source;
- cap/source roles and all universal side conditions that feed the target.

Every relaxation must be tagged. A relaxed clause may generate a conjecture but cannot be used for Lean promotion.

Use raw DIMACS through the governed piqd boundary. Pin the encoder source, role-map schema, variable map, clause count, and manifest. Before a large run, validate:

- hand-built positive and negative source packets;
- role permutations and reversed cyclic order;
- overflow points;
- duplicate-center rejection;
- full-class versus selected-subset semantics;
- model decoding and clause replay.

## Phase 3 — Add a geometry-realization lane

Run a separate exact-realization model for the active named roles. Its variables should include coordinates, squared distances, convex orientation, and all source-required equalities/inequalities. For a genuine full counterexample search, include a complete finite carrier and every global K4/minimality condition for the selected cardinality.

The realization lane must:

- use exact rational or algebraic replay after proposal generation;
- cross-check any SAT/SMT model with an independent solver where practical;
- reject floating-point-only witnesses;
- verify every circle row, deletion condition, cap condition, and convex-independence condition;
- emit a complete source object that Lean can consume, or explicitly mark the result diagnostic.

This lane answers the user's witness question directly: a full coordinate model can return a genuine witness. The current weak incidence models cannot, because they omit coordinates and source-wide conditions.

## Phase 4 — CEGAR and theorem mining

For each wave:

1. validate every SAT model independently;
2. classify it as full source-faithful, source-mapped quotient, or diagnostic-only;
3. mine only minimal cuts whose premises are source-proved;
4. attach each candidate theorem to a named Lean consumer before banking it;
5. reject cuts that depend on an exact cardinality with no lift;
6. run a cross-wave motif check after the wave completes, but search the Lean corpus only for concrete candidates;
7. publish a successor CNF only after the Lean theorem, source adapter, and replay validator agree on the same variable map.

Prioritize motifs that already have consumers: two-triple row obstructions, Kalmanson cancellations, metric-core alternatives, radial/power-pattern contradictions, and pinned-multiplicity consequences. A new producer with no consumer is discovery output, not closure progress.

For UNSAT, require an authenticated DRAT/LRAT or other exact proof artifact, independent clause replay, and a written scope statement. For SAT, require complete model replay and source reconstruction. For UNKNOWN, preserve the run and add no theorem.

## Phase 5 — Consumer-first Lean promotion

Select the smallest consumer that can absorb the first stable obstruction. If an existing theorem such as `GeneralCarrierBridge.false_of_metricCoreAlternative` fits, prove the adapter into that theorem. Otherwise introduce one local combined-row consumer rather than adding another terminal leaf.

The promotion bundle must contain:

- the source ingress theorem;
- the role-quotient coverage theorem for all eight arms;
- the overflow/cardinality argument;
- the exact obstruction theorem;
- certificate replay in Lean;
- the consumer invocation;
- proof-blueprint spine wiring;
- an axiom and `sorryAx` audit.

The final theorem must quantify over arbitrary carrier size. Exact-17, exact-18, or any other fixed census may remain as regression coverage, but cannot be presented as the universal closure.

## Phase 6 — Compute schedule and stop rules

1. Run a small source-mapped smoke packet for each of the eight arms.
2. Run the bounded role quotient with at most 12 solver cores per job and a fixed, recorded timeout.
3. Run the exact-realization lane only on decoded SAT candidates or on a deliberately scoped exact-cardinality diagnostic.
4. After the first authenticated wave, mine motifs and promote the best consumer before widening the wave.
5. Do not launch another broad fixed-n wave when the previous wave produced only SAT shadows, UNKNOWN results, or producers without consumers.
6. Stop and revise the encoder if a model violates the source replay, if a clause depends on omitted nonmembership, or if a finite UNSAT claim has no coverage theorem.

## Milestones

**M1 — Source ingress:** eight role packets, overflow semantics, and Lean coverage theorem.

**M2 — Encoder validation:** source-mapped smoke tests, exact variable-map audit, and authenticated piqd package.

**M3 — First wave:** one bounded quotient wave with complete SAT/UNSAT/UNKNOWN custody.

**M4 — Geometry replay:** at least one decoded SAT candidate either becomes a complete Euclidean witness or is rejected by an exact source condition.

**M5 — Consumer promotion:** one source-proved obstruction is replayed in Lean and consumes an existing live branch without a new unconnected `sorry`.

**M6 — Closure decision:** either the universal theorem is closed, or the project has a formally documented genuine witness/remaining obstruction and a revised target.

## Deliverables

- this plan and an updated closure-plan entry;
- one source ingress module and tests;
- one encoder manifest, role-map schema, and validator;
- piqd receipts, solver proof/model artifacts, and exact replay reports;
- one Lean producer/consumer bridge with trust audit;
- a wave report separating universal proof progress from diagnostic finite computation.

The governing principle is:

`source ingress -> bounded quotient -> exact replay -> Lean consumer -> arbitrary-cardinality lift`.

Skipping any arrow yields useful research data but not a closed proof.
