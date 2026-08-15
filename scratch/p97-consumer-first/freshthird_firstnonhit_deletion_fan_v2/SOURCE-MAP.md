# Source map

Line numbers are from the live worktree inspected for this audit.

| Declaration | Path and lines | Use | Q connection? |
|---|---|---|---|
| `exists_retainedFirstApex_mutualDeletionPair_threeLocationCases` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:2291-2342` | Exact three-arm retained pair: class membership, distinctness, mutual deletion survival, distinct centers, location case | No `Q` parameter or Q term |
| `retainedFirstApex_selectedClass_eq_fourPoints_of_oppositeAdjacent` | same:2344-2455 | Opposite-adjacent arm gives exact support `{P.source₁,P.source₂,z,w}` | No `Q` parameter or Q term |
| `sourceFaithfulDeletionFan_of_triApexAllLargeContext` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:1017-1052` | Per-support indexed blocker cap, blocked deletion, and center/small-overlap dichotomy | Applies to an arbitrary selected-four row; no Q |
| `nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan` | same:1368-1395 | Fan's global non-robust or mutual-cross-deletion outcome | No Q |
| `freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:2094-2118` | A Q-indexed deletion-survival consequence already used by v1 | Q connection, but no retained-fan anchor |
| `exists_selectedRow_overlap_card_ge_three_of_blocked_deletions` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:2143-2164` | Consumer of an explicit blocked subset of cardinality at least three | Requires a supplied target row and blocked subset; fan theorem does not supply Q overlap |
| `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three` | same:2466-2480 | Open target; arbitrary carrier source, center inequality with Q, Q-shell intersection at least three | This is the missing consumer producer |

The preceding source docstring at `TwoSourceFreshThirdResidual.lean:2168-2173`
explicitly describes the retained-pair producer as not asserting a
contradiction and identifies the remaining work as connecting a location arm
to the canonical `Q` row.  This is an independent source-level confirmation of
the duplicate gate, not an inferred limitation of the finite encoding.

The retained theorem's actual context includes `P`, `F`, `R`, `T`, and the
frontier/interior hypotheses, while the Q-specific target separately includes
`C`, `Q`, `hingress`, `data`, and `secondInteraction`.  The theorem statements
do not identify those role packages.

## Projection-loss audit

The schema does not invent coordinates, carrier closure, cap order, radius
equations, identities of unnamed shell points, or any relation between P and
Q.  In particular, it does not silently promote `P.source₁/P.source₂` to
`Q.source₁/Q.source₂`; doing so would be the exact unsupported bridge this
audit was checking for.
