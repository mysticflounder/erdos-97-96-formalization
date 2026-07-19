# Off-radius frontier source and directed blocker audit

Date: 2026-07-17

Status: **CHECKED-SCRATCH PARTIAL NONRETURN. THE CROSS-MEMBERSHIP ARM HAS A
DIRECT THREE-CENTER TERMINAL FOR FULL REVERSE RETURN. THE
COMPANION-COMMON-DELETION ARM DOES NOT: IT PRODUCES A TWO-SOURCE OMISSION FORK,
AND FULL REVERSE RETURN ONLY FORCES THE NEW ACTUAL BLOCKER OUTSIDE THE SURPLUS
CAP.**

This audit owns only
`scratch/atail-force/offradius-directed-nonreturn/`. It does not change
production Lean or planning documents.

## Exact input

Let

```text
F : CriticalPairFrontier D S radius H
R : FrontierCommonDeletionParentResidual F
normal : FrontierCommonDeletionConsumerNormalForm R
```

and let `z` be the source from either off-radius constructor of
`FrontierRefinedEscapeOutcome normal`:

1. `originalOffRadiusCommonDeletion`, where `z = normal.escape.point`; or
2. `companionOffRadiusCommonDeletion`, where `z` is the distinct companion
   escape extracted from an on-radius surplus escape.

Both constructors retain exactly the same source-indexed facts used here:

```text
z != F.pair.q
z != F.pair.w
z notin H.selectedAt(F.pair.q).support
CommonDeletionTwoCenterPacket D H z S.oppApex1
  (H.centerAt F.pair.q ...)
```

In particular, the actual blocker selected at `z` is distinct from both
`S.oppApex1` and the actual blocker selected at `F.pair.q`.

The same `normal` retains one of:

```text
CROSS:
  F.pair.w in H.selectedAt(F.pair.q).support

COMPANION:
  CommonDeletionTwoCenterPacket D H F.pair.w S.oppApex1
    (H.centerAt F.pair.q ...)
```

The analysis never projects either packet to an anonymous generic recursion.

## Theorem-bank preflight

Before deriving a new local result, the audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- current production modules `CriticalPairFrontier`,
  `ThirdCenterCommonPair`, `CommonDeletionTwoCenter`,
  `LargeCapUniqueFiveLowHit`, and
  `LargeCapUniqueFiveCommonDeletionNormalForm`; and
- the existing common-deletion and paired-nonreturn scratch audits.

Focused indexed searches included:

```text
common deletion two centers two sources critical shell convex cap contradiction
two distinct sources deletion preserves equidistant four at same two centers
shared radius pair two centers common deletion
off surplus point blocker cap selected row outside pair unique center
```

The closest current consumers are:

- `false_of_thirdActualCenter_selectedRow_contains_frontierPair`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `cross_deletion_survives_iff_not_mem_selected_support`; and
- the exact-five paired common-deletion normal forms.

No bank theorem makes a generic `CommonDeletionTwoCenterPacket` contradictory.
The existing paired-nonreturn audit also has an exact finite-metric two-cycle,
so generic recursion or an anonymous decreasing-rank claim remains prohibited.

## Checked positive results

`OffRadiusDirectedNonreturn.lean` proves six declarations without `sorryAx`.

### 1. Cap-order localization of a complete return

```lean
sourceBlocker_not_mem_surplusCap_of_frontierPair_membership
```

If one source's actual critical row contains both original frontier points,
and its blocker is distinct from the first apex, then that blocker is outside
the surplus cap.

The proof is the exact ordered-cap consumer. Both frontier points lie outside
the surplus cap and are equidistant from `S.oppApex1`. If the new blocker were
also in the cap, its row memberships would give a second distinct cap center
equidistant from the same outside pair, contradicting
`outsidePair_unique_capCenter`.

This result uses actual cap order and convexity. It is not an incidence-only
shadow statement.

### 2. CROSS arm: complete reverse return is impossible

```lean
false_of_crossMembership_offRadius_fullReturn
```

On the directed cross-membership arm, the first apex and `q`'s actual blocker
are already two distinct carrier centers equidistant from the frontier pair
`q,w`. If the actual critical row sourced at `z` also contains both `q,w`,
then `z`'s actual blocker is a third distinct carrier center on the same
perpendicular bisector. The production third-center theorem gives `False`.

The exact unconditional consequence is:

```lean
crossMembership_offRadius_nonreturn :
  q notin H.selectedAt(z).support or
  w notin H.selectedAt(z).support
```

This applies unchanged to both off-radius constructors.

### 3. COMPANION arm: two-source omission fork

```lean
companionCommonDeletion_two_source_omission_fork
```

The off-radius source `z` and the original companion `w` are distinct, and
both are absent from the actual critical support sourced at `q`:

```text
z != w
z notin H.selectedAt(q).support
w notin H.selectedAt(q).support
```

The first omission is a field of the off-confinement escape. The second is
the exact source/deletion equivalence applied to the retained companion
common-deletion packet.

This is a fork, not a contradiction. It is compatible with the already
validated common-deletion successor cycles.

### 4. COMPANION arm: the exact missing cap-placement field

```lean
companionCommonDeletion_fullReturn_localizes_sourceBlocker
```

If `H.selectedAt(z)` contains both `q` and `w`, then

```text
H.centerAt(z) notin S.surplusCap.
```

Equivalently, a theorem placing `H.centerAt(z)` in the surplus cap would turn
the complete reverse return into an immediate ordered-cap contradiction.
Without that placement, a full return is not excluded.

### 5. Exact coupled normal form

```lean
nonempty_offRadiusDirectedOutcome
```

This packages the two conclusions while retaining the common parent `R`, the
concrete off-radius source, its concrete common-deletion packet, and
`normal.directed`:

- `crossNonreturn`: directed cross membership plus a reverse omission; or
- `companionFork`: the two forward omissions plus the full-return blocker
  localization theorem.

Both refined off-radius constructors instantiate this theorem directly.

## Closure verdict

No current assumptions force `False` on both directed arms.

- **CROSS is one exact reverse-incidence producer from closure.** Supplying
  both reverse memberships is already contradictory, so the proven
  nonreturn disjunction is the sharp unconditional statement.
- **COMPANION remains open.** The source-faithful output is the two-source
  omission fork. A full reverse return is allowed only with `H.centerAt(z)`
  outside the surplus cap; no current theorem forces that blocker back into
  the surplus cap or otherwise consumes this outside-blocker configuration.

Therefore the smallest honest next producer is not another generic
common-deletion successor. It is one of:

1. a cap/MEC theorem placing the off-radius source's actual blocker in the
   surplus cap on the companion arm, followed immediately by the checked
   ordered-cap terminal; or
2. a direct global theorem excluding the source-tagged packet consisting of
   `z,w notin H.selectedAt(q).support` together with both common deletions at
   the fixed center pair.

Neither statement is currently proved. The report deliberately does not
claim that K-A-PAIR or a production `sorry` has closed.

## Validation

From `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/offradius-directed-nonreturn/\
OffRadiusDirectedNonreturn.lean
```

The command exited successfully. Every printed declaration depends only on:

```text
propext, Classical.choice, Quot.sound
```

The scratch Lean file contains no `sorry`, `admit`, declared axiom,
`native_decide`, `unsafe`, heartbeat override, or lint suppression. No full
project build was run for this isolated scratch audit.
