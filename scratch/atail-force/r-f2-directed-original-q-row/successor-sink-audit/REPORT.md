# Original-q outside-middle successor sink audit

Date: 2026-07-16

Status: **NO EXISTING DIRECT `False` CONSUMER. THE NEW SUCCESSOR HAS THE
OPPOSITE SOURCE POLARITY FROM THE OLD TWO-OFF-LIVE SUCCESSOR. ROUTINE
RECLASSIFICATION ONLY ADVANCES.**

## Scope and verdict

This audit concerns the checked packet

```text
OriginalQOutsideMiddleSuccessor C G
```

from
`r-f2-directed-original-q-row/OriginalQOutsideMiddleSplit.lean`.
It changes no production Lean, closure documentation, proof-blueprint state,
protected file, or unique-row lane.

The packet is genuine progress: it preserves a point from the actual
original-`q` generated support and uses the retained live and physical
second-apex rows to build a new `CommonDeletionTwoCenterPacket`.
It is not a terminal packet.

The most important negative result is exact:

```text
new outside-middle source notin old C.B2
```

whereas the old `OffLiveCommonDeletionSuccessor` route requires

```text
old two-off-live successor source in old C.B2.
```

Therefore the old second-apex robustness theorem and its critical-deletion
sink cannot be applied to the new successor.

## Required theorem-bank preflight

The following registries were checked before assessing a new consumer:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- common-deletion packets and critical deletions at a fixed center;
- generated rows with a point outside an opposite cap;
- selected rows centered in a strict ordered cap;
- two-center common outside-pair consumers;
- second-apex critical reorientation; and
- continuation cycles and cap-rank descent.

The closest banked declarations are:

```text
CapSelectedRowCounting.outsidePair_unique_capCenter
CapSelectedRowCounting.orderedCap_outsidePairCount_sum_le
secondApexCritical_reorients_to_firstApexUniqueFour
sameCenter_radius_eq_or_support_disjoint
commonDeletion_successor_or_alignedCriticalPair
alignedRCommonDeletionBranch
```

None matches the new packet as `False`.

The sibling `p97-rvol` declarations
`no_oppCap2_escape` and `oppCap2_endpointEscape_false` are not adapters for
this lane. They assume `D.IsM44` and an exact row centered at the physical
first apex. The live A-TAIL parent has the opposite no-`IsM44` branch, and
the original-`q` generated row is centered at a named strict
`oppCap2` point, not at that apex.

## Exact semantics of the new successor

For

```lean
N : OriginalQOutsideMiddleSuccessor C G
```

the checked fields give:

```text
N.source in G.generated.support
N.source notin {q,t1,t2,t3}
N.source notin C.B2

N.successor :
  CommonDeletionTwoCenterPacket D W.H N.source p S.oppApex2
```

The two survival directions are important:

1. the live row at `p` survives deletion of `N.source` because the source is
   outside the live row;
2. the old physical second-apex row `C.B2` survives that deletion because
   the source is outside `C.B2`.

`nonempty_commonDeletionTwoCenterPacket` then selects exact q-deleted rows
for the new packet. Its selected second row is not definitionally the old
`C.B2`, and the packet does not retain a radius equality with `C.row2`.

The packet does retain the generated-row provenance through `G`, including
the original deleted source `q`, the named generated center, its strict-cap
placement, the common critical system, and the q-deleted/q-critical
constructor. In the q-deleted constructor, however, the selected four-row is
still a trimmed four-subset; it is not the complete radius filter.

### Actual-blocker polarity

Because deletion of `N.source` survives at both packet centers, the standard
critical-map adapter gives:

```text
W.H.centerAt N.source _ != p
W.H.centerAt N.source _ != S.oppApex2.
```

Thus a proposed theorem aligning this source's actual blocker with either
packet center has the wrong implication direction. In particular, one must
not try to prove that `N.source` itself is deletion-critical at the physical
second apex.

## Why the old two-off-live sink does not apply

`OffLiveCommonDeletionSuccessor W C` stores an
`OffLiveSecondRowFreshSource W C`, whose load-bearing field is:

```text
source in C.B2.
```

That membership drives both arms of
`OffLiveCommonDeletionSuccessor.ofPacket`:

- if the old and new second-apex radii agree, the source is a fifth ambient
  point on that radius;
- if the radii differ, the two selected supports are disjoint.

Hence `OffLiveCommonDeletionSuccessor.secondApexFullyDeletionRobust` follows,
and only then can
`false_of_offLiveCommonDeletionSuccessor_and_criticalDeletion` consume a
`HasCriticalDeletionAt D S.oppApex2` witness.

For `OriginalQOutsideMiddleSuccessor`, the defining field is instead:

```text
source notin C.B2.
```

In the equal-radius case there is no fifth point: the new source is not known
to lie at the old second-apex radius. The new selected row may simply reuse
the same exact four-point radius class. Therefore neither
`secondApexFullyDeletionRobust` nor the `HasCriticalDeletionAt` contradiction
is available.

This is not a missing adapter. It is a missing mathematical fact.

## Second-apex criticality and reorientation

`secondApexCritical_reorients_to_firstApexUniqueFour` requires:

```text
CriticalSelectedFourClass D.A z S.oppApex2
and
not HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2.
```

Its conclusion is:

```text
Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H),
```

not `False`.

For the new source, the required deletion failure is the negation of a field
already used to construct `N.successor`: deletion of `N.source` survives at
`S.oppApex2`. A different deletion-critical source at the physical apex could
still reorient, but that would only advance to the already-displayed swapped
`FA-UNIQ4` frontier.

The older two-off-live pair arm legitimately uses this reorientation because
it produces a different prescribed critical source in `C.B2`. That argument
does not transport to the outside-middle source.

## Ordered-cap and MEC consumers

The retained generated center is in `strictSecondCap S`. The newer cap-escape
work can additionally produce a generated support point outside
`S.oppCap2`, or close a special q-critical arm. Even with that stronger cap
placement, the current ordered-cap bank does not close the outside-middle
successor.

`outsidePair_unique_capCenter` needs:

```text
two distinct centers in one ordered cap
and
the same two distinct points outside that cap on both circles.
```

The successor supplies one generated support point outside the old live and
middle rows. Its new survival rows omit the deleted source; they do not put
that point on a second circle. One outside point is not a common outside
pair, and support omission cannot be converted into a metric equality.

The ordered-cap counting theorem has the same mismatch: it bounds repeated
outside pairs after those pairs have been produced. It does not produce a
second shared point or identify the successor's new second-apex radius with
the old one.

No checked MEC theorem currently localizes the actual blocker of the new
source, forces the source onto the old second-apex radius, or supplies a
monotone boundary-rank change.

## Origin and recursion audit

`RCommonDeletionOrigin` currently has exactly three constructors:

```text
anchored
reciprocal
spent.
```

None records a source selected from an original-`q` generated row. Adding a
plain fourth constructor would preserve provenance but would not prove
progress: the current origin type has no well-founded measure, and
`CommonDeletionTwoCenterPacket` itself has no rank or descent field.

The generic continuation theorem
`alignedPrescribedPair_or_successorCycle` proves only:

```text
an aligned prescribed pair at some surviving source
or
a genuine periodic common-deletion successor orbit.
```

In the retained live-center setting, a first-center aligned pair is always
available because the live critical system already maps every live-row
source to `p`. This excludes the particular `no_aligned` cycle record, but it
does not yield `False`; the alignment repeats data already installed in
`W`.

The exact 24-vertex successor regression is a separate guardrail. It has
global finite K4 data, a total critical-shell assignment, common-deletion
packets, and a periodic successor orbit. It is not Euclidean and omits
convexity, MEC/cap order, and the original-`q` generated-row provenance. It
therefore refutes geometry-free termination, not a future theorem which
visibly consumes the complete parent geometry.

## Existing routine continuation

The weakest existing theorem that accepts the new packet is simply:

```lean
alignedRCommonDeletionBranch S W N.successor hqSurplus
```

Its output is one of:

```text
twoOffLive
f1
f2LiveHeavy
f2SupportHeavy
f2Mixed
f3.
```

This is a checked finite reclassification. It only advances, can revisit the
same unresolved F2 surfaces, and forgets the generated origin unless that
origin is carried alongside it. Wiring only this theorem would enlarge the
consumer DAG without closing an arm.

Likewise, `commonDeletion_successor_or_alignedCriticalPair` only advances to
another successor or an aligned pair. It is not a sink.

## Weakest honest next theorem

The next theorem should be a direct negative consumer on the **full
generated-source origin**, not a positive selected-support incidence and not
a bare recursive-origin constructor.

Architecturally, its conclusion should have the following form (schematic
Lean, with the existing full-parent arguments retained outside):

```lean
theorem false_of_originalQOutsideMiddleSuccessor
    (origin : RCommonDeletionOrigin S W F deleted p C)
    (f2 : exact live-heavy or mixed F2 witness for C)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (N : OriginalQOutsideMiddleSuccessor C G) :
    False
```

At the actual integration point this theorem must retain the arguments of
`CommonCriticalMapClosingProducer`, in particular the concrete common
critical system, the chosen frontier, the second-large-cap witness, and the
MEC/cap/live-row data. The reduced `OriginalQOutsideMiddleSuccessor` type by
itself has already projected away the frontier origin and the explicit
second-large-cap witness. Claiming it impossible from that reduced type alone
would be a stronger theorem than the planned parent route requires.

This direct-`False` shape is the weakest honest closure target because:

1. the local exact parabola models rule out pretending that a uniform named
   selected-support hit is source-implied;
2. the generic successor regression rules out a geometry-free recursive
   descent theorem;
3. the existing cap-order sinks require a second common outside point which
   is not present; and
4. the current origin/radius packets contain no monotone measure.

A proof of this theorem would close the outside-middle arm itself. It would
not, alone, close a production `sorry`: the confined/both-hit alternative,
the other F2 constructors, and the remaining frontier arms still have to be
eliminated and wired into `false_of_twoLargeCaps_commonCriticalMap`.

If a direct proof is not found, the only honest incremental alternative is
to expose one new theorem with an immediate consumer, for example a
branch-specific common-outside-pair or a genuine global rank drop. Merely
adding a `generated` constructor to `RCommonDeletionOrigin`, or re-running
`alignedRCommonDeletionBranch`, is not closure progress.

## Countermodel boundaries

- **EXACT WITHIN A LOCAL ALGEBRAIC MODEL:** the parabola constructions realize
  source-faithful q-critical and q-deleted generated rows while avoiding the
  proposed uniform named hits. They do not model global K4, a total critical
  system, or MEC/cap geometry.
- **KERNEL-CHECKED FINITE ABSTRACTION:** the 24-vertex common-deletion model
  has a genuine periodic successor orbit and no critical deletion at either
  fixed center. It is not a Euclidean convex/MEC realization and does not
  carry the generated-source origin.
- **NOT COUNTERMODELED:** a direct contradiction which retains the full
  `CommonCriticalMapClosingProducer` surface and the exact generated-source
  provenance.

## Validation scope

This was a source and theorem-bank audit only. No Lean source was changed and
no full or focused Lake build was run. The cited Lean declarations are the
current checked scratch/production interfaces; this report does not promote
their conjunction to a new theorem.
