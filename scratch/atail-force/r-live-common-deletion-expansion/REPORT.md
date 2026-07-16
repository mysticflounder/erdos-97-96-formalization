# Live-row common-deletion expansion audit

## Outcome

The collapsed dangerous row does **not** turn the anchored
`CommonDeletionTwoCenterPacket` into `False`.  It forces the generic
common-deletion expansion to stop immediately in its first-center aligned
prescribed-pair arm.

For every packet

```text
C : CommonDeletionTwoCenterPacket D W.H deleted p center₂
```

under a `LiveDangerousRetainingSystem W`, the kernel-checked result is:

```text
C.B₁ = {q, t1, t2, t3}
deleted ∉ {q, t1, t2, t3}

and there are distinct fresh sources a,b in {q,t1,t2,t3} such that
  deletion of a is critical at p,
  deletion of b is critical at p,
  both prescribed critical supports are C.B₁,
  W.centerAt a = W.centerAt b = p, and
  W.selectedAt(a).support = W.selectedAt(b).support = {q,t1,t2,t3}.
```

This is the structure `LiveFirstCenterAlignment`.

The aligned pair repeats data already installed in `W`: both sources are in
the live dangerous class, the collapsed system already sends both to `p`, and
both selected supports are already the live dangerous row.  It supplies no
new second-center incidence and maps to no existing `False` consumer.

## Effect on `CommonDeletionSuccessorCycle`

`CommonDeletionSuccessorCycle C` contains the field

```text
no_aligned :
  ∀ s, ¬ HasAlignedPrescribedPairAt C s
```

but the live-row theorem proves

```text
∀ s, HasAlignedPrescribedPairAt C s
```

at index `0`, the first center `p`.  Therefore
`not_nonempty_commonDeletionSuccessorCycle` rules out this named cycle
normal form.

This does **not** prove that recursive common-deletion edges cannot revisit a
source.  It only proves that the generic cycle theorem, which is constructed
under a global absence of aligned pairs, cannot enter its cycle branch here:
the automatic first-center alignment is always present.

## Exact first missing antecedent

The automatic `p`-alignment can be bypassed if the expansion exposes two
fresh sources outside the live dangerous row.  The exact local antecedent
formalized in this lane is

```text
2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
  {q, t1, t2, t3}).card)
```

Under this hypothesis,
`successor_or_secondCenterAlignment_of_two_off_live_sources` proves:

```text
either
  an off-live source gives a successor CommonDeletionTwoCenterPacket
  at the same centers p and center₂,
or
  two distinct sources are deletion-critical at center₂ and form
  AlignedPrescribedCriticalPair C 1.
```

The current packet fields guarantee three fresh sources in the whole row
union, but do not guarantee that two of them are outside the live dangerous
row.  That two-off-live cardinality statement is therefore the first missing
producer antecedent for escaping the tautological index-`0` alignment.

The remaining terminal obligation is then provenance-aware:

1. turn an off-live recursive successor into strict progress that cannot
   recur; or
2. consume the index-`1` second-center aligned pair using the retained
   cap/MEC placement.

No existing theorem-bank declaration consumes only the automatic
`LiveFirstCenterAlignment`.  In particular, the banked U5 incompatibilities
require additional named incidence/confinement data, and the production
two-large-cap route still depends on
`DoubleApexOffSurplusSharedRadiusPair`.

## Kernel-checked declarations

`LiveCommonDeletionExpansion.lean` proves:

- `commonDeletion_firstRow_eq_liveBase`;
- `commonDeletion_deleted_not_mem_liveBase`;
- `livePrescribedCriticalAt`;
- `nonempty_liveFirstCenterAlignment`;
- `deletion_survives_liveFirstCenter_of_not_mem_liveBase`;
- `successor_or_secondCenterAlignment_of_two_off_live_sources`;
- `hasAlignedPrescribedPairAt_every_survivor`;
- `not_nonempty_commonDeletionSuccessorCycle`; and
- `anchored_commonDeletion_forces_liveFirstCenterAlignment`.

Every printed declaration reports only:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` dependency.

## Theorem-bank preflight

The required registries were searched before adding the connector:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered common deletion,
prescribed critical pairs, the live dangerous row, and same-center critical
support.  They found the existing generic expansion, blocker-alignment
adapters, U5 banks, and the production two-large-cap route, but no terminal
consumer for this automatic first-center pair.

## Validation

From `lean/`:

```bash
env LEAN_PATH=/tmp/p97-r-live-common-deletion-oleans:/tmp/p97-r-orbit-entry-oleans:/tmp/p97-joint-transition-oleans \
  lake env lean -R .. -M 16384 \
  -o /tmp/p97-r-live-common-deletion-oleans/LiveCommonDeletionExpansion.olean \
  ../scratch/atail-force/r-live-common-deletion-expansion/LiveCommonDeletionExpansion.lean
```

The direct single-file check completed successfully.  No full `lake-build`
was run in this lane.
