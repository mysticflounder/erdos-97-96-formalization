# ATAIL unique-row producer: card-five distinct-blocker boundary

Date: 2026-07-14

Status: **CHECKED CONDITIONAL ADAPTER; UNCONDITIONAL PRODUCER OPEN.**

This work is isolated to `scratch/atail-force/unique-row-producer/`.  It does
not edit `U1LargeCapRouteBTail.lean`, `ATail/CriticalPairFrontier.lean`, the
closure documents, or any production metric-core module.

## Result

`card_five_distinct_cap_local_producer.lean` proves the conditional adapter

```text
cardFiveCapOrMutualFields_of_frontier_distinct_capLocalCross
```

from a production `CriticalPairFrontier` in the exact card-five branch.  Once
the caller has split to distinct blockers, the complete existing
`CardFiveCapOrMutualFields` packet follows from one additional proposition:

```text
(w is in the selected shell sourced at q
  and centerAt(q) is in the surplus cap)
or
(q is in the selected shell sourced at w
  and centerAt(w) is in the surplus cap).
```

This proposition is named
`CardFiveDistinctCapLocalCrossHypothesis`.  It is the exact first missing live
hypothesis on the distinct-blocker arm.  The frontier pair already supplies:

- both carrier memberships;
- both memberships in the first-apex selected class;
- pair distinctness;
- both off-surplus facts; and
- the same pair for all dependent fields.

The branch split supplies blocker-center distinctness.  No second cross hit,
orientation field, or fresh pair choice is required.  The companion theorem

```text
false_of_frontier_cardFive_distinct_capLocalCross
```

feeds the constructed packet to the existing card-five consumer and closes
the branch immediately.  This is not itself the requested producer: its new
antecedent is exactly the source-indexed metric-incidence fact that remains to
be proved from the live hypotheses.

## Why this is the exact boundary

Production `CriticalPairFrontier` proves

```text
K4 after cross deletion iff the opposite source is absent from the selected shell.
```

Thus the robust-survival arm has the wrong polarity for the desired directed
cross hit.  On the non-survival arm, cross membership follows, but no live
field places that row's blocker in `S.surplusCap`.  Ordered-cap uniqueness is
a consumer of precisely that localization; it does not produce it.

The exact missing live statement is therefore not another finite-set adapter.
It is a geometric source-to-cap transport theorem coupling an actual frontier
blocker to the MEC surplus cap, on at least one directed cross-hit arm.  No
such field occurs in `CriticalPairFrontier`, `SurvivorPairRelocationPacket`,
or the named U1 live-data packets.

## Independent second-apex split

The other half of the dependent frontier does not supply the missing row.

- In the double-deletion-survival arm, `P.oppApex2_dist_ne` says the two
  sources have different radii at `S.oppApex2`, so this apex is not another
  center for the common pair.  At either actual source blocker, the exact
  survival criterion has the opposite polarity: survival after deleting the
  other source is equivalent to that source being absent from the chosen
  shell.
- In the blocked arm, the frontier constructs two disjoint exact four-shells
  centered at `S.oppApex2`, one through each source and at their two distinct
  radii.  Hence neither shell contains the common pair.  The existing
  cap-growth consequence forces the opposite cap to have size at least six
  and the carrier to have size at least twelve, but it does not create a
  cross-source shell membership or a surplus-cap blocker.

Thus retaining both apex splits on the same pair is essential bookkeeping,
but neither second-apex arm maps to any of the three accepted unique-row
outputs without a new coupling theorem.

## Full-global-row audit

The later audit of the global selected-row surface does not remove this
antecedent.

- `Census554.GeneralCarrierBridge.blocker_row_support_eq_shell` identifies a
  faithful carrier row at a chosen blocker with that source's exact critical
  shell.  It transports an already-chosen blocker row; it does not place the
  blocker in a cap or add the opposite frontier source to the shell.
- `CapSelectedRowCounting.orderedCap_card_add_four_le_choose_outside` is an
  aggregate outside-pair count.  It gives no coverage theorem for the
  particular pair in the frontier and no source-to-blocker localization.
- The sharp equality-case statements
  `exists_orderedSurplusCapSix_with_selected_hitCounts` and
  `selectedClass_support_inter_surplusCap_card_eq` require `S.IsM44`.  The live
  K-A-PAIR branch assumes `hNoM44`, so these declarations cannot be mapped to
  the current hypotheses.
- The current critical-map fiber theorems give upper bounds on sources per
  blocker and lower bounds on the number of blocker centers.  They do not
  force an image center into `S.surplusCap`, and even cap localization alone
  would not identify a shell containing the prescribed pair.

Thus the faithful-carrier route reaches exactly the same first missing field
as the direct frontier route.  It is not an alternate producer.

## Other two accepted outputs

The same preflight fixes the first missing field for the other accepted
unique-row outputs.

- **Card four:** `ExistsSurplusPairCriticalBlocker` needs a
  choice-invariant deletion-blocking shell centered at a non-apex point of the
  surplus cap and containing the two selected off-cap points.  The card-four
  apex shell is deletion-blocking but has center equal to the apex.  Moreover,
  `CriticalShellSystem.overrideAt` can make an arbitrary selector choose that
  apex shell for both sources, so a theorem about every supplied selector is
  false.  The missing result must existentially produce a favorable geometric
  blocker, independent of the selector.
- **Card five, coincident blocker:** the checked four-shell classifier leaves
  two residual members.  The accepted terminal packet needs one residual
  member `x` and a `SelectedFourClass D.A x` whose support contains the common
  pair.  Global K4 supplies some selected class centered at `x`, but it does
  not select the radius through either common point.  Exact-shell provenance
  at the common blocker does not change the center to `x`.

These are source-indexed metric-incidence statements.  None follows from the
current finite support, blocker-map, or faithful-carrier interfaces.

## Required theorem-bank preflight

The following registries were searched before writing the scratch theorem:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The exhaustive inventories contain no declaration producing a frontier
blocker in the surplus cap or a selected source row containing the opposite
frontier point from the current hypotheses.  The closest surfaces fail at
their first antecedent as follows.

- `exists_shortCap_point_two_off_four_carrier_of_minimal_u3` requires the old
  `IsM44`, `U2Statement`, `Minimal`, and `U3ShortCapSaturation` package.  The
  live branch assumes `hNoM44`, and the theorem does not identify its selected
  center with either frontier blocker.
- `U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility` is a
  contradiction consumer.  It assumes both mutual dangerous-source hits and
  an additional exact row at a shared witness; none is produced by the
  frontier.
- The sibling-bank theorem `u1TwoLargeCapObstruction` consumes a fixed
  five-point pattern with seven distance equalities and one point inequality.
  Its registry entry has `source_reachable: false`; after importing
  `Erdos9796Proof.P97.U1LargeCapRouteBTail`, Lean reports the advertised fully
  qualified constant as unknown.  It is therefore a proved sibling-source
  candidate, not a currently import-reachable local consumer.  Even after an
  explicit import/port, the frontier supplies only the first-apex pair
  equality and no theorem producing the remaining row equalities.
- The older `SurplusCapBlockerCore.lean` contains only abstract statement and
  certificate interfaces, not a proof of its blocker-core statement or a
  theorem in the current `ℝ²` packet vocabulary.
- `qfreeK4_of_blocker_core` packages a surviving class after assuming its
  card-four fact, an avoided seed, and strict cap-interior center placement.
  It does not produce the required center placement and has the survival,
  rather than cross-hit, polarity.

Indexed searches were also run across every configured Lean corpus with
`nthdegree docs search --lean`, using concept and name-filtered queries for:

- surplus-cap blockers whose selected shell contains an off-cap pair;
- card-five mutual critical-source incidence and cap-local blockers;
- coincident-blocker residual members whose selected class contains the
  common pair;
- source-indexed blocker-to-Moser-cap transport;
- `*mutual*`, `*blocker*`, and `*u1TwoLargeCapObstruction*` declarations.

The corpora were freshly indexed again at 2026-07-14 21:47 UTC.  The closest hits
were the same consumers and exact-support adapters listed above; none supplies
`CardFiveDistinctCapLocalCrossHypothesis`.

## Validation

The parent scratch consumer was elaborated into an isolated `.olean` inside
this owned directory, then the producer file was checked from the Lake root
with the owned directory prepended to `LEAN_PATH`.  Both checks passed.

The printed axiom closure of both new public theorems is exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, named axiom, or new open declaration.

Rigor labels:

- **PROVEN ADAPTER, NOT PRODUCER:** the conditional construction of the existing
  `CardFiveCapOrMutualFields` packet from the frontier, blocker distinctness,
  and one cap-local directed cross hit.
- **PROVEN:** the existing consumer closes immediately from that packet.
- **NOT FOUND / OPEN:** a theorem deriving the cap-local directed cross hit
  from the current live K-A-PAIR hypotheses.
- **NOT FOUND / OPEN:** either of the two alternative accepted source-indexed
  metric-incidence producers described above.
- **NOT CLAIMED:** closure of K-A-PAIR or production readiness of this
  scratch-only module.
