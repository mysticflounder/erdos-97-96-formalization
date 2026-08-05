# Endpoint power-matrix audit

## Outcome

The full source-faithful endpoint packet currently yields **no circle-power
matrix certificate** in either audited lane:

- direct `5 × 5` power matrices (rank at most `4`); or
- `4 × 4` common-reference row differences (rank at most `3`, since the
  common quadratic point term cancels).

This is an obstruction/census result, not a contradiction producer and not
Lean closure.  `CirclePowerMatrix.lean` already proves the direct rank and
unique-possible-matching criterion.  The row-difference rank observation is a
mathematical audit analogue, not a currently packaged Lean theorem.

The required theorem-bank registries were checked first.  None of the sibling,
legacy, or older-general inventories contains a power-matrix/rank certificate
that closes this packet.  No `nthdegree docs search --lean` call was needed:
the exact current declaration was found directly in the live source.

## Physical circles and certified entries

Here `on` means certified power zero and `off` means certified power nonzero.
Only the facts actually carried by the packet were used.

| Circle row | Center | Certified on | Certified off | Status |
|---|---|---|---|---|
| retained `O` shell | `O` | `C, M, J` | `O` | physical retained circle |
| `Σ_A = E(M,A)` | `A` | `C, K` | `A, M` | exact critical shell; mandatory equality from `qDeletedK4Class_support_eq_selectedShell` with source `C` and `O.packet.B₂_card` |
| `Σ_B = E(K,B)` | `B` | `C, M` | `B, K` | exact critical shell; mandatory equality from the same theorem with source `M` and `freshPacket.B₂_card` |
| `Σ_X` | `X` | `J, K` | `X` | physical cross-hit shell |
| `E(M,O)` | `O` | its selected four witnesses | `O` | selected four-subset of a radius class, not the full class |
| `E(K,O)` | `O` | its selected four witnesses | `O` | selected four-subset of a radius class, not the full class |

Thus the four erased-row labels do not supply four new circles:
`E(M,A)` is literally `Σ_A`, and `E(K,B)` is literally `Σ_B`.  The packet has
at most six distinct physical circles before unresolved equalities among the
three `O`-centered radii are considered.

The corrected overlap consequences were included exactly:

- `O.packet.B₁ ∩ Σ_A` has cardinality at most `2`; since `B₁.card = 4`, at
  least two selectable `E(M,O)` witnesses are genuinely off `Σ_A`.
- `freshPacket.B₁ ∩ Σ_B` has cardinality at most `2`; since `B₁.card = 4`, at
  least two selectable `E(K,O)` witnesses are genuinely off `Σ_B`.

Each same-arm pair is distinct.  One representative per arm suffices for a
unique-matching search because using both equal-signature columns would create
a second matching by swapping them.  Such a witness is certified distinct from
`O,C,M,K`, but not from every one of `A,B,J,X`; cross-arm witnesses are not
certified distinct from one another.  The census therefore admits a witness
column only beside named columns from which its distinctness is proved.  Other
support roles are recorded as selected/full-shell membership information but
are not invented as globally fresh columns.

Crucially, absence from `E(M,O)` or `E(K,O)` was never interpreted as
off-circle evidence.  Those supports are selected subsets.  By contrast,
omission from the exact `Σ_A`/`Σ_B` shells is legitimate physical
nonmembership.

## Exhaustive census

Four endpoint-identification regimes were checked: labels unmerged, `A = J`,
`X = C`, and both aliases.  In addition, all five partitions relevant to the
unresolved three `O`-centered radii were checked: no asserted equality, each of
the three possible pair equalities, and all three equal.  All 20 combinations
were consistent with the retained facts.

| Endpoint regime | direct minors | direct unique | difference minors | difference unique | minimum new primitive facts |
|---|---:|---:|---:|---:|---:|
| labels unmerged | 3,248 | 0 | 21,840 | 0 | 5 |
| `A = J` | 1,288 | 0 | 12,040 | 0 | 4 |
| `X = C` | 1,288 | 0 | 12,040 | 0 | 4 |
| both aliases | 448 | 0 | 6,440 | 0 | 5 |

The displayed minor counts are for the no-asserted-equality `O`-radius case and
include only certified-distinct anonymous-witness choices.  Named-only counts
are in the JSON.  Every one of the 20 endpoint/radius cases has zero unique
possible matching and hence zero certificate in both lanes.  If all three
`O`-centered circles coincide, only four distinct physical circles remain, so
a five-circle direct or four-differences-plus-reference certificate is
structurally unavailable.

Among nonempty possible-support graphs, the smallest number of current perfect
matchings is `4` in the direct lane and `2` in the difference lane—still not
unique.  Unknown entries were always retained as possible; the sole matching,
if one had existed, would additionally have had to be certified nonzero.

## Minimum missing facts

The table's final column is an exact minimum within the audited primitive
fact-extension language: one new fact costs one and is either “point lies on
this physical circle” or “point lies off this physical circle.”  The direct
search uses the alternating-digraph/topological-order characterization of a
unique matching.  The difference search branches over the underlying shared
circle facts, deduplicates their coupled effects, and validates the completed
matrix.  Neither anonymous overlap role improves the named minimum, and no
row-difference completion beats the direct minimum.  The same minima persist
under every pairwise `O`-radius equality.

For example, in the labels-unmerged regime one minimum five-fact completion is:

- off: `C` from `Σ_X`, and `J` from `E(M,O)`;
- on: `K` on the retained `O` circle, `K` on `E(M,O)`, and `J` on `Σ_A`.

It then uses rows `(O-retained, Σ_A, Σ_B, Σ_X, E(M,O))`, columns
`(O,M,K,C,J)`, and matching nonzeros
`(O-retained,O), (Σ_A,M), (Σ_B,K), (Σ_X,C), (E(M,O),J)`.

With `A = J`, a four-fact minimum is:

- off: `C` from `E(M,O)`;
- on: `O` and `C` on `Σ_X`, and `K` on the retained `O` circle.

The `X = C` regime also has minimum four; the labels-unmerged and double-alias
regimes require five.  These are diagnostics of the first missing incidence
bridges, not claims that the packet proves those facts.

## Source anchors and artifacts

- Direct theorem: `lean/Erdos9796Proof/P97/Census554/CirclePowerMatrix.lean`
  (`powerMatrix_rank_le_four`, `det_ne_zero_of_unique_possible_matching`,
  `false_of_powerMatrix_unique_possible_matching`).
- Exact selected-shell identification:
  `lean/Erdos9796Proof/P97/ATail/FiveCenterDeletionBoundary.lean`
  (`qDeletedK4Class_support_eq_selectedShell`).
- Machine-readable census: `scratch/endpoint_power_matrix_census.json`.
- Reproducible search: `scratch/endpoint_power_matrix_search.py`.

No Lean source was edited and no new proof obligation was introduced.
