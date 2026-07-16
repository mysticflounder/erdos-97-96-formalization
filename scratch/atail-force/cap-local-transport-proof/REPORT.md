# Card-five cap-local transport proof audit

Date: 2026-07-14

Status: **ACTUAL FRONTIER BRANCH CONSUMER KERNEL-CHECKED; DIRECT PRODUCER
STILL OPEN.**

This lane owns only
`scratch/atail-force/cap-local-transport-proof/`.  It does not edit the
production tree, the unique-row scratch lane, closure documentation, or git
state.

## Exact result

The surplus-cap localization in
`CardFiveDistinctCapLocalCrossHypothesis` is stronger than ordered-cap
uniqueness actually needs.  The source pair can be closed whenever one
directed-cross orientation has an indexed cap `k` with

```text
oppApex1 in capByIndex(k)
blocker(source) in capByIndex(k)
source and opposite source both outside capByIndex(k)
opposite source in selectedAt(source).support.
```

This is recorded as `CapSeparatedDirectedCrossHypothesis` in
`CapSeparatedDirectedCross.lean`.  The actual-frontier theorem

```text
false_of_frontier_cardFive_capSeparatedDirectedCross
```

consumes a production `CriticalPairFrontier`, positivity of its first-apex
radius, exact first-apex class cardinality five, and that adaptive-cap field,
and returns `False`.  Blocker-center distinctness is not needed; the theorem
therefore eliminates either directed-cross orientation before the
distinct/coincident blocker split.

The proof uses only current production facts:

1. exact cardinality five leaves a four-point first-apex class after deleting
   either source, so the source's actual critical blocker differs from the
   first apex;
2. the frontier marginal puts both sources in the same first-apex radius;
3. directed cross membership puts them in the same blocker radius; and
4. `CapSelectedRowCounting.outsidePair_unique_capCenter` forbids two distinct
   centers in one ordered cap from being equidistant from the same distinct
   pair outside that cap.

The theorem

```text
capSeparatedDirectedCross_of_surplusCapLocalCross
```

proves that the old surplus-cap-local field implies the new field by choosing
`k = S.surplusIdx`.  Thus the new producer target is a genuine weakening: it
also permits the other indexed cap containing the first apex, or any
definitionally equivalent indexed-cap witness, rather than requiring the
blocker to land in the distinguished surplus cap.

## Remaining producer boundary

The current `CriticalPairFrontier` does not itself produce the adaptive-cap
field.

- `cross_deletion_survives_or_cross_membership` gives the directed cross only
  on the non-survival arm; the robust arm has the opposite polarity.
- The pair marginal proves both sources are outside `S.surplusCap`, but gives
  no blocker membership in any indexed cap shared with the first apex.
- Carrier cap coverage can place a blocker in some cap, but it does not show
  that this cap also contains the first apex or excludes both prescribed
  sources.

Consequently the exact first missing antecedent on a directed-cross arm is
now weaker than `blocker(source) in surplusCap`:

```text
exists indexed cap shared by oppApex1 and blocker(source)
  that contains neither frontier source.
```

If this field fails, every cap shared by the first apex and blocker must
contain at least one source, or the apex and blocker share no indexed cap.
Those are respectively same-cap continuation and cross-cap continuation
shapes; the archived source-pushout/rank/lap results consume substantially
more order data and do not close either shape from the current frontier.

## Required theorem-bank preflight

Before deriving the adaptive consumer, the following registries and their
declaration inventories were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed searches through `nthdegree docs search --lean` covered card-five
distinct blockers, cap-local directed cross incidence, critical-source
blocker transport, same-cap blocker edges, perpendicular-bisector cap
placement, source pushout, rank drop, and strict-lap nonreturn.

No declaration produces the adaptive-cap field from a
`CriticalPairFrontier`.  The closest results are all consumer-side:

- `outsidePair_unique_capCenter`, used here;
- `blocker_centers_eq_of_five_le_of_mutual_cross_membership`, which needs
  both directed hits;
- sibling `SameCapIncompatibleEdge` / `source_pushout_left/right`, which need
  an already-packaged same-cap edge, endpoint choice, minor-cap chain, and
  endpoint inequalities; and
- `strictLapPacket_nonreturn`, which needs a fully produced global strict-lap
  packet.

The sibling `u1TwoLargeCapObstruction` remains a fixed metric-pattern
consumer and does not produce either blocker cap placement or this directed
cross.

## Validation

After the user-controlled refactor lane cleared direct scratch validation,
the owned file was checked from `lean/` with

```text
lake env lean -M 16384 \
  ../scratch/atail-force/cap-local-transport-proof/CapSeparatedDirectedCross.lean
```

The command exited zero.  Both printed public endpoints have axiom closure
exactly

```text
propext, Classical.choice, Quot.sound
```

The file has no textual `sorry`, `admit`, named `axiom`, `unsafe`, or
`native_decide`.

Rigor labels:

- **PROVEN / kernel-checked:** the adaptive indexed-cap branch consumer;
- **PROVEN / kernel-checked:** the old surplus-cap-local field implies the
  adaptive field;
- **NOT FOUND / OPEN:** an unconditional producer of the adaptive field from
  the current frontier/live hypotheses; and
- **NOT CLAIMED:** closure of the robust cross-deletion-survival arm or of
  K-A-PAIR as a whole.
