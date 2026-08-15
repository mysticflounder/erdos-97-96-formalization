# FreshThird pinned-query implementation audit

## Verdict

The Python module is still a synthetic fixture, not a source exporter. The
smallest safe replacement is a Lean-owned conditional-packet export view plus
a Python artifact consumer. Changing the Python constants or choosing values
from Lean propositions would violate the requested provenance rules. Until the
Lean view exists and every required field is extracted, the query must fail
closed with `SYNTHETIC_SCHEMA_FIXTURE_NOT_SOURCE_EXPORTED` (or a more specific
missing-extraction diagnostic).

This audit concerns only the conditional
`FreshThirdPinnedEndpointOutsideSeedQueryPacket`; it does not establish active
FirstNonHit ingress or any closure.

## Current implementation

`census/p97_search/freshthird_firstnonhit_pinned_endpoint_fan_query.py:1-8`
explicitly describes a scaffold, and `:36-65` hard-codes the synthetic status,
30-role universe, aliases, and extra roles. `_coordinates` and the metric-row
builder (`:143-200`, `:250-430`) manufacture rational coordinates and metric
facts. `build_packet`/validation (`:430-735`) therefore cannot be made
source-faithful by a validator-only change. The tests encode the same fixture
contract: both synthetic arms, empty `source_entitled`, synthetic `hrow_at`,
and untrusted metric data (`test_...py:21-59`).

The current `PRODUCER` string names
`FreshThirdPinnedEndpointOutsideSeedQueryPacket.ofSource`, but that declaration
is a constructor requiring conditional hypotheses; it is not an active
FirstNonHit producer or an existing exported packet.

## Reusable exporter pattern

Reuse the durable Lean pattern in
`lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefgExport.lean:20-36`:
define the canonical source-owned text in Lean, then have a tiny `main` write
that exact text with `IO.FS.writeFile`. Reuse the Python module's existing
canonical JSON/hash primitives after ingesting the Lean artifact.

This pattern supplies ownership and deterministic bytes, not extraction: no
existing P97 exporter found here provides a JSON view of arbitrary `ℝ²`,
`Finset`, dependent proofs, or a packet structure. Do not implement the missing
extraction in Python.

## Source facts available

The packet structure carries the requested conditional facts at
`TwoSourceFreshThirdResidual.lean:5437-5523`: exact-row and seed-overlap
equalities, endpoint naming, cyclic-order predicates, seed membership and
multiplicity, endpoint/cap labels, row-cap cardinality inequalities, seed
cardinality, and the indexed fan. Deletion polarity is split: the fan carries
canonical blocker `¬ HasNEquidistantPointsAt` obligations, while `hrowAt`
carries support-avoidance (`deleted ∉ support`) rather than a pre-serialized
numeric or theorem tag. The export must preserve that distinction.

Canonical rows can be named from `H.selectedAt`: the derived blocker row is
explicitly `CriticalSelectedFourClass` at
`FreshThirdPinnedFanPacket.lean:101-127`, and its four labels plus exact support
equality are available in `U1CarrierInjection.lean:731-753`. These are the
permitted row sources. The four indexed fan sources and their canonical blocker
centers are likewise available from `FreshThirdPinnedFanPacket.lean:50-117`.

## Required fail-closed gates

1. **No arbitrary K/DRow export.** `DRow` in the source packet is
   `SelectedFourClass D.A (B.boundary id)` (`TwoSourceFreshThirdResidual.lean:5440-5443`),
   and `orderedRowAt` explicitly accepts that arbitrary row (`:5498-5518`).
   The off-endpoint terminal branch also quantifies an arbitrary `K`
   (`:5608-5619`). There is no current equality to an `H.selectedAt` exact row.
   Add a conditional export adapter requiring a named canonical
   `H.selectedAt` row plus equality of its center/support to the row used by
   `hrowAt`; otherwise reject the packet. Never serialize arbitrary `K` rows.

2. **Full deletion witness provenance.** The fan is proposition-valued and its
   per-source packet contains existential `blockerCap` data. The available
   derived canonical row/packet is only a theorem (`:119-127`). The normalized
   witnesses retain one center-blocker witness or existential repeated-cap and
   mutual-cross pairs (`FreshThirdPinnedFanPacket.lean:153-203`). Add an
   explicit four-entry Lean export witness, each with source index, canonical
   blocker row/center, cap label, deletion-blocked polarity, and the relevant
   support/equality or cross-deletion pair proof. Reject if any entry is absent;
   do not use `Classical.choice` in the exporter to invent a stable record.

3. **Named aliases and role bound.** Build roles from Lean-owned point labels
   and support equalities, including the exact six-point seed, and represent
   repeated points by references/aliases. Remove `EXTRA_ROLES` and the fixed
   synthetic universe. Count the resulting unique named roles and reject when
   the count exceeds 30. A Python coordinate comparison cannot establish an
   alias.

4. **Metric representation.** The Lean sources expose radius/support
   equalities (`SelectedFourClass.support_eq_radius` and
   `CriticalFourShell.support_eq`), but the points and radii are arbitrary
   `ℝ²`/`ℝ`; there is no current deterministic numeric or rational serializer.
   Therefore the current `metric_witness.coordinates`, `radius_squared`, and
   fabricated inequalities cannot be source-entitled. Add a Lean symbolic
   metric-relation view (named role pairs plus equality/inequality polarity),
   or omit/reject the packet. Do not emit decimal/rational coordinates.

5. **Boundary and cyclic order.** `BoundaryIndexing` stores `n`, a `Fin n → ℝ²`
   boundary, `indexOf`, injectivity, and `point_eq`, but no exporter exists
   (`GeneralCarrierBridge.lean:60-70`). The Lean view must serialize the actual
   `Fin` values and all four-arm `hrowAt` order/deletion polarity from the
   packet, with no synthetic arm selection. Reject if the boundary indices or
   arm cannot be extracted.

## Smallest bounded change sequence

1. Add one Lean companion export module importing the two packet files. Define a
   source export view for the conditional packet only: canonical H-selected
   rows/labels, alias equalities, seed membership, four explicit deletion
   witnesses, cap labels, boundary indices, hrowAt cyclic order, deletion
   polarity, and symbolic metric relations. Include a source declaration/hash
   and a deterministic canonical text/JSON serialization using the exporter
   pattern above.
2. Add the two source-side adapter obligations that are currently missing:
   canonicalization of `DRow`/`hrowAt` (or a closed rejection), and explicit
   per-source deletion/cap witness data. Keep the existing packet constructor
   conditional; do not add an ingress theorem or alter closure consumers.
3. Replace Python `build_packet(arm)` with a reader for the Lean artifact. Remove
   hard-coded coordinates, extra roles, synthetic branch data, and
   `source_entitled=[]`. Preserve canonical JSON/hash validation, but require
   the source view, exact-four row count, role bound, aliases, provenance,
   cap labels, hrowAt order, metric relations, and deletion polarity.
4. Rewrite tests around one conditional source artifact: deterministic export
   replay, exact-four/canonical-row acceptance, alias/provenance preservation,
   role-count rejection, and fail-closed cases for arbitrary `DRow`/`K`, missing
   deletion witness, missing metric relation, malformed `Fin` order, and hash
   tampering. Remove the current endpoint/off-endpoint synthetic fixtures and
   float-coordinate assertions.
5. Only after those source-side gates exist, run the focused exporter/query
   tests. This audit ran no builds or tests and made no source edits.
