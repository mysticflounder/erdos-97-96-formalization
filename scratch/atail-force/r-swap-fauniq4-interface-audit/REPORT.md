# Swapped FA-UNIQ4 interface audit

Date: 2026-07-16

Status: **KERNEL-CHECKED LOCAL RECLASSIFICATION AND FULL-PARENT GEOMETRY
REBASE; NO PRODUCTION SORRY CLOSED.**

## Verdict

The reciprocal critical alternative is honestly a fresh, packet-polymorphic
`FA-UNIQ4` branch after the fixed-surplus swap.  The earlier reduction was
correct about the local branch shape, but its reports blurred two different
claims:

1. **Proven:** the fresh swapped frontier has the exact card-four
   first-apex branch fields.
2. **Not yet a closure theorem:** the user-owned full-parent
   `FA-UNIQ4` direct-`False` eliminator does not yet exist.

The audit found no additional geometric transport producer between those two
claims.  The packet-specific part of the live parent telescope can be rebased
to the swapped packet using its own embedded MEC witness and cap triple.
What remains is the actual `FA-UNIQ4` contradiction.

Accordingly, the right status is:

```text
reciprocal critical arm
  -> checked swapped FA-UNIQ4 branch
  -> pending user-owned full-parent FA-UNIQ4 eliminator
```

It should not be described as a closed arm, but the distinct positive
second-apex-radius producer is not an independent obligation.

## Kernel-checked local interface

`SwappedFAUniq4InterfaceAudit.lean` adds
`PacketGenericFAUniq4Fields` and proves
`packetGenericFAUniq4Fields_of_swapped`.

For the fresh frontier it supplies:

- a positive radius;
- first-apex selected-class cardinality exactly four;
- uniqueness of that positive four-capable radius;
- failure after deleting either frontier source separately at the first
  apex;
- failure after deleting both sources at the first apex; and
- survival after deleting both sources at the second apex.

Thus it matches the exact card-four branch exposed by
`firstApex_trichotomy_with_secondApex_double_survival`, not merely the
weaker raw right arm of `FirstApexSplit`.

The theorem `firstApexSplit_uniqueFour_of_swapped` constructs the exact
production `FirstApexSplit` right-arm proof.

The theorem `physical_branch_fields_of_swapped` translates the fields back
to the old physical orientation:

```text
fresh pair co-radial at old oppApex2;
both single deletions block K4 at old oppApex2;
the double deletion blocks K4 at old oppApex2;
the double deletion preserves K4 at old oppApex1.
```

The fresh pair is not the old reciprocal pair.  The earlier swap audit proves
same-pair transport impossible.  Any future eliminator that requires identity
with the old pair or retained reciprocal-history fields is therefore too
strong and cannot consume this branch.

## What is packet-polymorphic

The following geometry is quantified over an arbitrary
`S : SurplusCapPacket D.A` and applies directly to `X.packet`:

- `CriticalPairFrontier`, `FirstApexSplit`, and the second-apex double
  survival field;
- card-four radius uniqueness and the derived single/double deletion
  blockers;
- the card-four strict-interior-pair counting in the unique-row lane;
- cap ordering and cap-selected-row geometry obtained from the packet's own
  embedded MEC/partition;
- carrier convexity, global K4, carrier cardinality, no-removable-vertex
  hypotheses, and the global no-`IsM44` statement;
- `CriticalShellSystem D.A`, including the dangerous-retaining system; and
- the U1 live rows, fixed triple, localized no-q-free packet, base
  distinctness, and exact dangerous support, none of which is indexed by the
  surplus packet.

## What changes orientation

The swapped packet is not definitionally the original
`leafSurplusPacket MT hCirc CP i ...`.  Its non-surplus cap/apex roles and
the underlying triangle/cap labels are transposed.

Therefore these exact original terms must not be reused without an adapter:

- the original `MT`, `CP`, and numeric cap index `i`;
- the original chosen second-large-cap index `j`;
- directional `oppCap1` versus `oppCap2` statements; and
- any theorem fixed to the old physical frontier pair.

The honest strategy is to instantiate the future universally quantified
full-parent theorem with the swapped packet's own:

```text
triangleNonObtuse
hCirc
partition
surplusIdx
```

rather than pretending the original CP labels are unchanged.

## Checked full-parent rebase

The audit proves:

- `swapped_surplusApex_eq`: the physical surplus apex is unchanged;
- `swapped_triangle_verts_eq`: the physical Moser-vertex set is unchanged;
- `leafSurplusPacket_of_embedded_data_eq`: every surplus packet, including
  the swapped one, is exactly the leaf packet reconstructed from its own
  embedded MEC/cap data;
- `rebase_leaf_geometry_of_swapped`: from physical surplus membership,
  non-Moser placement, and global no-`IsM44`, the swapped packet has:
  - `q` in its designated surplus cap;
  - surplus-cap cardinality greater than four;
  - `q` outside its Moser vertices;
  - non-exact opposite caps; and
  - a second cap of cardinality at least five; and
- `rebase_leaf_geometry_of_swapped_from_live_parent`: the preceding fields
  follow directly from the exact source-current
  `(MT, hCirc, CP, i, hM, hqCap, hsurplus, hqNonMoser, hNoM44)` parent
  hypotheses.

The original `j` is deliberately not transported.  The rebase reruns
`exists_secondLargeCap_of_noM44` on the swapped embedded cap triple, which is
the correct orientation-independent construction.

This removes the suspected full-parent geometry gap.  The remaining
interface requirement is simple: the eventual `FA-UNIQ4` eliminator must be
universally quantified over its full-parent MEC/CP inputs, or equivalently
accept the rebased packet surface.  A theorem hard-coded to one previously
chosen leaf packet or one frontier pair would not be reusable.

## Consequence for the coordinator

`ReciprocalSwapIntegration.lean` remains an honest coordinator reduction.
Its swapped arm is a validated dependency edge, not a contradiction.

Documentation should avoid the stronger phrases “the arm closes through
FA-UNIQ4” or “already resolved” until the user-owned direct-`False` theorem
is kernel-checked and invoked.  The accurate phrase is:

```text
the reciprocal critical arm is reduced to a full-parent-rebasable,
packet-generic FA-UNIQ4 branch.
```

## Validation

Direct single-file validation, from `lean/`:

```text
env LEAN_PATH=/private/tmp/p97-r-reciprocal-swap-reduction-oleans:
  /private/tmp/p97-joint-transition-oleans:
  /private/tmp/p97-r-orbit-entry-oleans
lake env lean -R .. -M 16384
  -o /private/tmp/p97-r-swap-fauniq4-interface-audit/SwappedFAUniq4InterfaceAudit.olean
  ../scratch/atail-force/r-swap-fauniq4-interface-audit/SwappedFAUniq4InterfaceAudit.lean
```

Exit status: `0`.

Every printed declaration depends only on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, `sorryAx`, declared axiom, or
`native_decide`.  No production module, protected unique-row file,
`SurplusM44`, `SevenPointTwinFourCircleCollision.lean`,
`docs/live-blueprint.md`, full Lake build, or proof-blueprint state was
touched.

Lean source SHA-256:

```text
96ed758362a4342075c365c380a35b13e38130f3ce7f8d14f185c5b74843eece
```
