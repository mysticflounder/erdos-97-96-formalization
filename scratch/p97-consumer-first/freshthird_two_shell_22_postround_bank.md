# FreshThird exact 2+2 post-round theorem-bank audit

Date: 2026-08-07

## Round verdict

The exact-rational endpoint-row probe was run for all four cyclic-order arms and
both endpoint choices (`qBetween`/`qOutside`).  All eight instances were SAT:

```text
sat = 8, unsat = 0, unknown = 0
```

The model included the named source/fresh shell equalities, endpoint-row
equal-radius equations, strict triangle inequalities, and the five-point
Kalmanson constraints.  Thus the current named local metric/Kalmanson layer
does not refute the exact 2+2 branch.  This is an under-approximation and is not
a universal countermodel or a Lean closure.

## What is now proved on the spine

`TwoSourceFreshThirdResidual.lean` now supplies two source-level producers:

- `freshThird_orderSelectedEndpointCapSplitSurvivingRow_exists_two_outside_freshShell`
  (line ~1306): the selected endpoint row has at least two points outside the
  fresh exact-four shell;
- `freshThird_orderSelectedEndpointCapSplitSurvivingRow_escape_or_exactTwoTwo`
  (line ~1590): the row either escapes the union of the source/fresh shells, or
  its four support points split as disjoint exact `2+2` intersections.

The private `fourPointSupport_twoShellCover_exactSplit` helper proves the latter
cardinality split.  These are genuine ingress/narrowing lemmas, but neither
branch currently proves the live target
`false_of_freshThird_commonRadius_distinctCaps_survivingRow`, which remains a
`sorry`.

## Existing consumers and the missing bridge

The strongest directly reachable terminal is
`false_of_freshThirdSharedLatePairPacket`
(`TwoSourceFreshThirdFiber.lean:351`).  It closes a
`FreshThirdSharedLatePairPacket`, i.e. two ordered selected rows sharing the
two late points.  The exact 2+2 producer does not currently construct that
packet.  The first concrete bridge to prove is therefore:

```text
exact 2+2 shell-cover branch
  -> ordered indices + two selected rows sharing the late pair
  -> FreshThirdSharedLatePairPacket
  -> false_of_freshThirdSharedLatePairPacket
```

Other reachable consumers are less immediate: the endpoint-deletion consumer
`false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions`
requires four blocked endpoint-deletion assumptions, and the existing
Kalmanson producer/consumer chain requires an ordered shared-pair packet not
provided by the 2+2 branch.  The direct common-radius target therefore still
needs either this packet adapter or a new universal metric theorem (with a
source-level ingress and Lean replay) that refutes every order arm and endpoint
choice.

## Indexed theorem-bank results

Agentic Lean search found the following current-source declarations:

- `selectedFourClass_inter_capByIndex_card_le_two`
  (`P97/CapSelectedRowCounting.lean:305`): generic selected-four/cap
  intersection bound;
- `exists_freshThird_selectedRow_escape_tripleShellSeed`
  (`ATail/TwoSourceTripleShellEscape.lean:159`): global K4/minimality escape
  producer, but for a triple-shell seed rather than the fixed 2+2 row;
- `freshThird_canonicalSource_differentFreshCap_sharedPairCyclicPacket`
  (`ATail/TwoSourceCanonicalSurface.lean:933`): cyclic packet producer once a
  shared pair is already available;
- `false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions`
  (`ATail/TwoSourceFreshThirdFiber.lean:3106`): four-obstruction consumer;
- `nonempty_pairedCommonDeletionOutcome`
  (`ATail/PairedCommonDeletionNormalForm.lean:541`): related paired-deletion
  dichotomy (useful precedent, not a direct FreshThird adapter).

The sibling RVOL theorem bank also contains common-pair and two-off-row-circle
producers (`C5D3B.qAllowedSelected_full_rowOffProfiles_common_pair`,
`C5D3B.qAllowedSelected_two_rowOffProfile_eq_common_or_pair_other_center`,
`C5D3B.exists_two_off_rowCircle_of_sameSideTerminal`, and
`freshWitness_mem_offRowCircle_and_exists_second_of_sameSideTerminal`).  They
are source-reachable only in the historical RVOL sibling modules, not
import-reachable in this spine, and their packet types do not match the current
`BoundaryIndexing`/`SelectedFourClass` interface.  No direct adapter was found.
The legacy/general theorem-bank JSONs contain no matching FreshThird or exact
2+2 declaration.

## Closure status and next action

No `sorry` was closed by this round.  The productive next step is the universal
2+2-to-consumer bridge above.  If that bridge fails, the alternative is a new
exact-rational UNSAT encoding of the *full* FreshThird packet (including all
auxiliary rows and order coverage), followed by a source-level bounded-core
lift and kernel replay.  Re-running the current eight local probes or adding
more fixed-`n` cases is not a closure route.

## Coordination note (post-round)

The parallel pair audit independently confirms the same smallest missing adapter:
from the exact `2+2` shell-cover branch, derive an ordered pair of selected rows
whose common two-point intersection is strictly later than both row centers, then
construct `FreshThirdSharedLatePairPacket` and apply
`false_of_freshThirdSharedLatePairPacket`.  This is a producer/consumer bridge,
not a new finite search target.

The alternative outside-seed blocker arm still lacks a direct consumer adapter.
The current source theorem
`sourceDeletionSurvival_or_blockerVertex_eq_mutualPair` only yields a disjunction
(one source deletion survives, or the blocker is one of the mutual-pair
vertices); it does not yet manufacture the four blocked-deletion hypotheses
required by
`false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions`, nor
the same-arc two-hit hypotheses required by
`false_of_selectedClass_and_row_two_shared_on_one_arc`.  A valid next producer
must add one of those clauses universally over the selected endpoint row and
its outside-seed blocker.

## Consumer-bank recheck: pinned endpoint residual

The import-reachable theorem bank was rechecked against the strengthened
`false_of_freshThird_pinnedEndpoint_globalResidual` interface, including the
universal positive-radius bound `hmult`. No existing theorem consumes the pair
`(hterminal, hmult)` directly. The closest consumers remain:

* `false_of_freshThird_canonicalDifferentCap_of_endpointDeletionObstructions`
  (and its `_of_orderSelectedEndpointDeletionObstructions` variant), which need
  four/two explicit blocked-deletion hypotheses;
* `false_of_freshThirdSharedLatePairPacket` and
  `false_of_freshThirdSharedPairNonalternationPacket`, which need an ordered
  shared-pair/nonalternation packet; and
* `false_of_selectedClass_and_row_two_shared_on_one_arc`, which needs same-arc
  two-hit data.

`sourceDeletionSurvival_or_blockerVertex_eq_mutualPair` and the analogous
`endpointFresh_exists_pinnedCenter_universal_escape_dichotomy` are producers
only; neither yields a contradiction from `hmult`. Thus the missing source
lemma is unchanged: universally convert each outside-seed/off-endpoint blocker
arm plus `hmult` into one of those three consumer packets. No direct bank
closure is currently available.
