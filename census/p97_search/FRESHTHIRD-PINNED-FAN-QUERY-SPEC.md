# FreshThird pinned-fan bounded-query specification

Status is split deliberately:

* **CONDITIONAL SOURCE NORMALIZATION: CHECKED.** These declarations normalize
  an already supplied pinned fan; they do not provide the active FirstNonHit
  ingress.  `FreshThirdPinnedFanPacket.lean` contains the source-clean,
  arbitrary-cardinality fan normalization
  `IndexedSourceFaithfulSelectedFourFan.centerBlocker_or_noCenterBlockerWitness`.
  `TwoSourceFreshThirdResidual.lean` adds the canonical-row form
  `SourceFaithfulFanNoCenterBlockerRowWitness`, together with
  `sourceFaithfulFan_noCenterBlockerRowWitness` and
  `centerBlocker_or_sourceFaithfulFanNoCenterBlockerRowWitness`.  The checked
  `robustSeparatedOutcome` adapter now synchronizes that canonical-row packet
  with the four-omission blocker-multiplicity producer whenever the pinned
  center is fully robust and distinct from the three rich apices.  Direct Lean
  elaboration is green, and the new synchronization theorems are `sorryAx`-
  free.
* **INGRESS: OPEN.** This is conditional pinned residual normalization.  The
  active FirstNonHit ingress that would produce the pinned fan is still missing.
* **UNSAT/CLOSURE: OPEN.** There is no UNSAT result and this does not close the
  target theorem or establish a live proof-spine result.

The current Python implementation is deliberately labelled
`SYNTHETIC_SCHEMA_FIXTURE_NOT_SOURCE_EXPORTED`.  Its two fixtures test only
schema serialization, exact-rational self-consistency, hashes, and tamper
rejection.  Every hard-coded role assignment, blocker relation, `hrowAt` arm,
cap count, and escape slot remains synthetic; `field_provenance.source_entitled`
is empty.  No solver or CEGAR run over those fixtures is source-backed.

The synthetic query remains fail-closed.  No CEGAR run should be started from
it.

## Prospective consumer and current spine status

The immediate downstream target of this design is
`false_of_freshThird_pinnedEndpoint_outsideSeedResidual`.  The current
`FreshThirdPinnedEndpointOutsideSeedQueryPacket.ofSource` constructor packages
that theorem's already-strengthened explicit hypotheses, including a
`SourceFaithfulSelectedFourDeletionFan`; it does not derive those hypotheses
from the active FirstNonHit interface.  The new fan normalization also does not
derive that ingress.  A result for this conditional packet,
raw W4, a fixed carrier cardinality, or a projection that forgets metric
geometry does not by itself discharge the live route.

At the current proof-blueprint snapshot this theorem is off the kernel spine
of `Problem97.erdos97_rhs`.  The query is therefore a prospective direct-
closure campaign for the FirstNonHit route, not current on-spine closure.  A
future promotion must re-establish a real published-spine consumer.

The new no-center-blocker row witness retains all of the following source data:

* `center_ne_actualBlocker`;
* a same-cap pair with equal blockers or a canonical cross omission; and
* a mutual-cross pair with both canonical omissions and distinct blockers.

It uses only the four canonical `selectedAt` rows, translating raw deletion
survivals into support omissions.  It introduces no arbitrary `K` witnesses and
no ambient cardinality bound.  The exhaustive checked source split is now:

1. the pinned center is nonrobust;
2. it equals one of the three rich apices; or
3. it is robust and separated, in which case the canonical no-center fan rows
   and the four-omission multiplicity outcome hold simultaneously.

This still does not close the target.  The first two arms need geometric
consumers, and the third needs a theorem turning a new/enlarged blocker fiber
into actual selected-row incidence or another existing terminal.

Within the robust-separated arm, the checked
`geometricMultiplicity_or_qFiberThirdSource` adapter now normalizes the raw
four-omission alternatives to a named `P`/`Pρ` cross hit, the existing
`GeometricMultiplicityResidual P Pρ`, or a third source in the current `Q`
blocker fiber.  This is a source-clean case reduction, not a contradiction;
the simultaneous canonical fan witness remains available to future consumers.

## Intrinsic finite role universe

The prospective named-role object is intrinsic to an arbitrary carrier; it is
not an exact-`n` reduction.  Before quotienting coincident roles it has at most thirty
roles, justified by the six seed points, four fan-row points, four `DRow`
points, four actual blocker centers, and up to twelve non-source canonical
blocker-row points (`6 + 4 + 4 + 4 + 12 = 30` before quotienting overlaps):

| family | maximum | source |
| --- | ---: | --- |
| two-shell seed points | 6 | `freshThirdCrossRowTwoShellSeed` |
| fan-row points | 4 | `Row.support` |
| `DRow` points | 4 | `DRow.support` (omitted when identified with `Row`) |
| actual blocker centers | 4 | one canonical blocker per fan-row point |
| non-source canonical blocker-row points | up to 12 | three per exact blocker row |

All equalities between roles are retained as an explicit quotient pattern.
Distinctness may be asserted only when it follows from source data or exact
finite-set cardinality.

## Remaining live source extractor

The checked fan normalization is not the active FirstNonHit ingress.  Before
production computation, a new Lean ingress theorem must still extract one
bounded packet from every instance of the active FirstNonHit residual and prove
all of the following without a cardinality upper bound on the ambient carrier.
The current conditional `ofSource` constructor does not satisfy this
milestone.  The finite image must use only the four canonical `selectedAt`
rows; it may not introduce arbitrary `K` witnesses or invent a carrier
completion.

1. the endpoint/off-endpoint branch and the corresponding identity between
   `Row` and `DRow`;
2. exact four-element support for every selected row represented in the
   packet;
3. membership facts from all four deletion-fan packets and their translation
   into omissions from the corresponding canonical `selectedAt` rows;
4. the blocker-cap index and cap-interior membership for every actual blocker;
5. the exact support equality in the equal-center arm, or the source-proved
   overlap bound in the distinct-center arm;
6. the four `hrowAt` alternatives, endpoint names, cap counts, and named
   cyclic boundary order;
7. the escaping witness outside the six-point seed;
8. every metric equality defining a selected class, and every strict
   inequality or non-incidence used by a learned cut; and
9. the finite instances of `hmult` needed by the represented centers and
   radii.

The conditional packet supplies only a prospective arbitrary-carrier role
representation.  Sound extraction from every active FirstNonHit instance is
still unproved.  Enumeration code must not invent a carrier completion or
treat unrepresented points as absent.

## First conditional literature reduction

Given the current pinned packet, its endpoint row `DRow` has center outside the
distinguished first cap.  Lean therefore proves the exhaustive dichotomy

```text
two DRow witnesses lie in the first cap and form a genuine cap-witness pair
or
the first-cap intersection of DRow.support has cardinality at most one.
```

The first arm is represented by `SelectedFourCapWitnessPacket` and forgets to
the existing `Dumitrescu.IsCapWitnessPair`.  The second arm is not a
contradiction.  Neither arm repairs the missing FirstNonHit-to-packet ingress,
so the second arm is not yet an authorized bounded-query domain.  A future
query may not replace the dichotomy by a fabricated two-plus-two split or a
fixed cap assignment.

The source also supplies a canonical boundary order for all four points of
`DRow.support`: `BoundaryIndexing.selectedFourSupportOrder` sorts their actual
boundary indices, and `image_boundary_selectedFourSupportOrder` proves exact
support coverage.  This is enough to enumerate the row's cyclic order, but not
to choose a particular cap pair or crossing pairing.  Those identifications
must remain explicit query variables and be replayed from proved membership
facts.

## Encoding boundary

The first smoke encoding must include exact geometry.  An incidence/order-only
encoding is known to admit an abstract equal-blocker survivor with the common
row points on opposite arcs, so its SAT result would not guide the production
route.

Discovery may use SAT, SMT, algebraic solvers, or piqd.  Every promoted cut
must be serialized as an instance of a proved theorem family and replayed
against the extracted packet.  Numerical coordinates and raw solver clauses
are proposal evidence only.

The encoding must preserve, rather than recompute heuristically:

* the role quotient and all source-proved disequalities;
* exact squared-distance equalities for each represented row;
* the boundary orientation/order atoms used by Lean consumers;
* cap membership and cardinality constraints attached by `hrowAt`;
* fan blocker identities, deletion omissions, and overlap bounds; and
* endpoint/off-endpoint provenance.

The initial fixture must also preserve existential blocker-cap choices.  In
particular, same-cap blocker centers do not imply that either selected support
pair lies in that cap.  A deletion omission gives distance disequality only;
it does not orient the omitted point as inside or outside the selected circle.
The rejected initial fixture asserted both kinds of unsupported data and is
not production evidence.

Ptolemy is a conditional consumer.  A selected row supplies cosphericity and
now has a canonical boundary order, but the equality theorem additionally
requires an independently sourced crossing point and two opposite-angle
hypotheses for the selected pairing.  Those crossing atoms must be replayed
from the packet, not inferred from cosphericity alone.

## Verdicts

* `SAT`: a diagnostic survivor.  Replay it against the exact packet and mine
  the smallest missing source-entitled predicate.
* `UNSAT` without replay and total coverage: diagnostic only.
* replayed cuts plus complete finite coverage: a bounded obstruction, still
  requiring the Lean extractor and kernel-checked coverage theorem.
* source extractor plus kernel-checked total coverage with `sorryAx`-free
  transitive dependencies: a candidate for promotion review only.  Wiring also
  requires final-consumer reachability, fresh spine evidence, provenance/replay
  validation, and independent promotion verification.

## Implementation milestones

1. Close or strictly reduce the three checked conditional-packet branches:
   nonrobust center, rich-apex/D44 equality, and robust-separated multiplicity.
2. Prove the active FirstNonHit-to-bounded-packet ingress and its arbitrary-
   cardinality descent or recurrence theorem.
3. Then implement a Lean-backed export or theorem-backed durable serialization of
   actual endpoint and off-endpoint packets, using the intrinsic `Fin 4` fan
   index rather than fixed synthetic slots.
4. Add exact replay validation and at least one checked source-export fixture;
   retain the current synthetic fixtures only as parser tests.
5. Only after source ingress and replay are complete, run bounded theorem-family
   CEGAR; mine only each wave's new data.  The current synthetic query remains
   fail-closed and is not an authorized CEGAR input.
6. Generate Boolean coverage and prove its Lean replay theorem.
7. Wire the live consumer, then run targeted build, axiom, and proof-spine
   audits.
