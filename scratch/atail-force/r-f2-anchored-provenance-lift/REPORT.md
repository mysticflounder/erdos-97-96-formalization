# Anchored provenance lift into F2

## Scope

This scratch lane starts from:

- `R : CoherentRCommonDeletionPacket T P W.H`;
- `A : AnchoredSourceCriticalTransition R`;
- `R.firstCenter = p`;
- `q ∈ S.surplusCap`; and
- the off-surplus `RowExternalCommonDeletionSource A` supplied by
  `exists_offSurplus_sharedRowSource`.

It retains that provenance while applying the existing F2 strict-cell normal
form to the actual shared-row successor. No production file, closure document,
protected file, other scratch lane, or proof-blueprint state was changed.

## Theorem-bank preflight

Before adding the wrapper, I checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

I also ran focused `nthdegree docs search --lean` queries for:

- an anchored source-critical transition with an off-surplus shared-row
  common-deletion source and F2 strict-cell normal form; and
- a coherent shared-row source with fixed first-apex marginal, exact row
  support, and second-apex radius data.

No existing theorem packages this combined object. The reusable components
are the current in-repository producers and adapters:

- `exists_offSurplus_sharedRowSource`;
- `RowExternalCommonDeletionSource.toSharedRowCommonDeletionPacket`;
- `LiveDangerousRetainingSystem.coherent_source_center_eq_p_iff_mem_dangerousTriple`;
- `LiveDangerousRetainingSystem.coherent_sourceRow_support_eq_base_of_center_eq_p`;
- `secondApexRow_inter_fixedMarginal_card_le_one`; and
- `resolvedF2StrictCellNormalForm`.

## Exact aligned packet

The original shared-row packet has first center `R.firstCenter`. The F2
normal form is indexed by the named live center `p`. Under
`R.firstCenter = p`, `alignedSharedRowPacket` retypes the same packet without
selecting any new support:

```text
C.B₁ = R.sourceRow.support
C.B₂ = R.secondApexRow.support.
```

Its first q-deleted row copies the exact support, cardinality, radius,
positive-radius witness, and same-radius proof from
`X.firstRowXDeleted`; its second row is exactly
`X.secondRowXDeleted`.

The theorem

```text
exists_offSurplus_alignedSharedRowPacket
```

uses the actual existential producer and proves that some `X` satisfies:

```text
X.point ∉ S.surplusCap
C.B₁ = {q,t1,t2,t3}
C.B₂ = R.secondApexRow.support
X.point ∉ {q,t1,t2,t3}
R.deleted ∉ {q,t1,t2,t3}
R.sourcePair.x ∈ {t1,t2,t3}.
```

Thus the aligned common-deletion packet is an unconditional anchored
producer. The F2 classification of that packet remains a separate upstream
hypothesis.

## Provenance-bearing F2 normal form

`AnchoredProvenanceF2NormalForm W R A X hcenter` retains the original
`R`, `A`, and `X` as parameters and records both:

```text
TwoLiveExactCoverSecondApexProfile ... S C
ResolvedF2StrictCellNormalForm S W C.
```

`anchoredProvenanceF2NormalForm` constructs it from the actual F2 profile.
Therefore the complete live-heavy, support-heavy, and mixed split is
available without forgetting the anchored source history.

The wrapper proves the following exact named-point facts.

### Fixed first-apex marginal

The three points

```text
X.point, R.deleted, R.sourcePair.x
```

are pairwise distinct and all lie in:

```text
SelectedClass D.A S.oppApex1 radius \ S.surplusCap.
```

Hence all three have first-apex distance `radius`. The wrapper also keeps:

```text
5 ≤ card ((SelectedClass D.A S.oppApex1 radius) \ S.surplusCap)
6 ≤ card (SelectedClass D.A S.oppApex1 radius).
```

Applying the existing one-hit classifier to the new source gives both exact
alternatives:

```text
X.point strict-oppCap1 or R.sourcePair.x strict-oppCap1
X.point strict-oppCap1 or R.deleted strict-oppCap1.
```

### Current source roles

At the aligned first center `p`:

```text
R.sourcePair.x ∈ {t1,t2,t3}
R.sourcePair.x ≠ q
dist p R.sourcePair.x = R.sourceRow.radius
dist p X.point ≠ R.sourceRow.radius
dist p R.deleted ≠ R.sourceRow.radius.
```

Consequently:

```text
dist p X.point ≠ dist p R.sourcePair.x
dist p R.deleted ≠ dist p R.sourcePair.x.
```

The deletion behavior is retained exactly:

```text
deleting X.point preserves K4 at p and S.oppApex2
deleting R.deleted preserves K4 at p and S.oppApex2
deleting R.sourcePair.x is critical at p
deleting R.sourcePair.x preserves K4 at S.oppApex2.
```

The original anchored cross-incidence also survives:

```text
R.sourcePair.x is outside the selected critical support at R.deleted.
```

Finally:

```text
p ∈ T.carrier or p = R.deleted.
```

### Exact row and cell placement

The first row is the live row and the second row is the retained
second-apex row:

```text
C.B₁ = {q,t1,t2,t3}
C.B₂ = R.secondApexRow.support.
```

All three named points are outside `C.B₂`:

```text
X.point ∉ C.B₂
R.deleted ∉ C.B₂
R.sourcePair.x ∉ C.B₂.
```

Therefore each avoids all four F2 cells:

```text
liveOnlyCell
supportOnlyCell
bothCell
outsideBothCell.
```

This does not erase the fresh source's critical role:

```text
X.point ∈ deletedCriticalSupport C.
```

The two row-count facts are:

```text
card (SelectedClass D.A S.oppApex1 radius ∩ C.B₁) ≤ 2
card (((SelectedClass D.A S.oppApex1 radius \ S.surplusCap) ∩ C.B₂)) ≤ 1.
```

Every actual second-row point satisfies:

```text
z ∈ C.B₂ -> dist S.oppApex2 z = R.secondApexRow.radius.
```

## Exact negative boundary

The current interfaces do **not** prove any of:

```text
dist S.oppApex2 X.point ≠ R.secondApexRow.radius
dist S.oppApex2 R.deleted ≠ R.secondApexRow.radius
dist S.oppApex2 R.sourcePair.x ≠ R.secondApexRow.radius.
```

Their nonmembership in `C.B₂` is insufficient. `SelectedFourClass` stores a
chosen exact four-point support on a circle; it does not identify that support
with the full ambient radius class. Turning support nonmembership into a
distance inequality would invent a converse that the structure does not
provide.

The anchored packet also does not determine whether `R.deleted` or
`R.sourcePair.x` belongs to the fresh source's
`deletedCriticalSupport C`. The only checked cross-incidence is that
`R.sourcePair.x` avoids the *current deleted point's* selected critical
support.

Finally, anchored provenance does not itself prove that the aligned packet is
F2. The wrapper consumes an actual
`TwoLiveExactCoverSecondApexProfile`; it does not manufacture one. Nor does
the resolved live-heavy/support-heavy/mixed split make any branch
contradictory.

Accordingly, this lane does not close a production `sorry`. It repairs the
provenance loss before the generic F2 split and exposes the exact remaining
branch obligations.

## Validation

The authoritative project toolchain is `lean/lean-toolchain`, currently:

```text
leanprover/lean4:v4.27.0
```

and the direct environment reported:

```text
Lean 4.27.0, arm64-apple-darwin24.6.0
commit db93fe1608548721853390a10cd40580fe7d22ae
```

The bounded validation used direct Lean, not the project `lake-build`
wrapper:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$(lake env printenv LEAN_PATH)" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-anchored-provenance-lift-oleans/AnchoredProvenanceF2Lift.olean \
  ../scratch/atail-force/r-f2-anchored-provenance-lift/AnchoredProvenanceF2Lift.lean
```

It exited successfully. Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`. No full build was run.
