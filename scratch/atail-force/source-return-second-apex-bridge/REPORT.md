# Source-return second-apex bridge audit

Date: 2026-07-17

Status: **kernel-checked structural advance; no direct `False`**.

Owned files:

- `SourceReturnSecondApexBridge.lean`
- this report

No production, plan, generated, FA-UNIQ, `surplusM44`, card-five consumer, or
shell-curvature file was edited.

## Bank preflight

Before deriving the bridge I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- `nthdegree docs search --lean` for source return, common deletion, physical
  second-apex rows, and dangerous/q-critical/q-deleted U5 configurations.

The closest reusable consumers are the U5 q-critical incompatibility families
and the existing `u1TwoLargeCapObstruction`.  None consumes the unconditional
fields below.  The U5 theorems still require named cross-row support incidences
(for example two dangerous points in one q-critical support, a second
q-critical row, or adjacency/common-point fields).  The large-cap obstruction
requires its seven metric equalities.  This bridge does not manufacture those
missing antecedents.

## What was lost by the strict-interior selector

The selector does **not** retain an equality between either selected source and
`F.pair.q` or `F.pair.w`.  Therefore the individual second-apex survival facts
stored on the original frontier pair cannot simply be rewritten onto
`W.first` or `W.second`.

That identity loss is real, but it is not a total loss of the second-apex
coupling.  The parent residual retains an exact four-row
`R.common.packet.B₂` at `S.oppApex2`.  Production already proves

```text
card (B₂ ∩ first-apex off-surplus marginal) ≤ 1.
```

Both `W.first` and `W.second` are distinct points of that marginal.  Hence
`B₂` omits at least one of them.  Its four points then survive deletion of
the omitted source at `S.oppApex2`.

## Kernel-checked implication chain

For a source-return walk `W` (`W.next = W.first`):

1. `W.first` and `W.second` lie in the off-surplus first-apex marginal.
2. The original second-apex row contains at most one of them.
3. Therefore at least one source, call it `q`, is absent from that row.
4. The original row is a `U5QDeletedK4Class D q S.oppApex2 ...`.
5. `R.firstApexFullyDeletionRobust` supplies deletion survival at
   `S.oppApex1`.
6. Thus `q` has a source-exact
   `CommonDeletionTwoCenterPacket D H q S.oppApex1 S.oppApex2`.
7. Source return independently supplies a
   `CommonDeletionTwoCenterPacket` for `q` at `S.oppApex1` and the other
   source's actual blocker.

This is packaged by:

```lean
nonempty_sourceReturnSecondApexBridge
```

The exact support classification is:

```lean
nonempty_sourceReturnOriginalSecondRowOutcome
```

with three constructors:

- first source hits the original row, second source has a physical packet;
- second source hits the original row, first source has a physical packet;
- both sources are omitted, so both have physical packets.

There is no fourth both-hit case.

## Important route correction

The two strict-cap sources cannot be the K-A shared-radius pair.  The theorem

```lean
sourceReturnSources_oppApex2_dist_ne
```

proves

```text
dist S.oppApex2 W.first ≠ dist S.oppApex2 W.second.
```

The proof invokes the existing `oppCap2_escape_gen`: the sources are distinct,
off-surplus, and have the same first-apex radius, so equality of their
second-apex radii is contradictory.  Consequently, trying to recover the old
K-A existential from this selected pair is provably the wrong target.

## Full physical-second-apex endpoint

After selecting one source whose deletion survives at `S.oppApex2`, classify
deletion of the companion source there.

- If the companion deletion is blocked, global K4 produces the existing
  `PhysicalSecondApexCriticalResidual` at that exact source.
- If it survives, the two source radii at `S.oppApex2` are distinct, so
  `double_erase_survives_or_two_disjoint_exact_shells` gives either:
  - joint double deletion at the physical second apex; or
  - two source-exact, support-disjoint critical four-shells.

This exact four-way endpoint is packaged by:

```lean
nonempty_sourceReturnPhysicalSecondApexOutcome
```

Its constructors are:

1. `firstCritical` (while the second source survives);
2. `secondCritical` (while the first source survives);
3. `jointDoubleDeletion`;
4. `disjointExactShells`.

All constructors retain `W`, so the mutual-omission blocker packets, strict
cap membership, common first-apex radius, and actual blocker map remain
available to the next consumer.

## Exact remaining blocker

No current theorem consumes these fields to `False`.

- `PhysicalSecondApexCriticalResidual` is produced and classified in
  `OrientedPhysicalApexIngress.lean`, but current source search finds no
  contradiction consumer for that type.
- `jointDoubleDeletion` still needs a theorem coupling the physical
  second-apex deletion with the source-return mutual-omission rows and full
  cap/MEC order.
- `disjointExactShells` still needs named support incidences or a global
  cap/order exclusion; support-disjointness alone is compatible with the
  finite abstractions.

So the sound next object is not another generic common-deletion packet.  It is
a consumer of the exact four-way physical endpoint above, preferably one that
uses the already-retained strict-cap order and the two source-indexed actual
blockers.

## Validation

Checked from the Lake root with:

```bash
lake env lean \
  ../scratch/atail-force/source-return-second-apex-bridge/SourceReturnSecondApexBridge.lean
```

The file elaborates without errors or warnings.  The four exported theorem
checks report only:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, custom `axiom`, `native_decide`, or `unsafe` in
the scratch Lean file.
