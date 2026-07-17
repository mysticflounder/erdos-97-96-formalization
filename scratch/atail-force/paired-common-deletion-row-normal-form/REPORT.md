# Paired common-deletion row normal form

Date: 2026-07-17

Status: **PROVEN in scratch; source-clean; kernel closure is the core three
axioms only.** No production or plan file was edited in this lane.

## Question checked

`LargeCapUniqueFiveTwoCommonDeletionSources` stores `firstPacket` and
`secondPacket` through the existential constructor
`nonempty_commonDeletionTwoCenterPacket`.  At first sight their `B₁` and `B₂`
supports could therefore be arbitrary four-point subsets.  This lane checks
whether the stored rows are nevertheless forced to be canonical.

They are.  No constructor refactor is mathematically necessary.

## Required theorem-bank preflight

Before writing the scratch proof I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially
  **Sibling `p97-rvol` banks**;
- `certificates/p97_rvol_general_n_mining.md`;
- `certificates/erdos97_legacy_general_n_mining.md`;
- `certificates/erdos_general_theorem_p97_mining.md`; and
- the indexed Lean corpora with:

  ```text
  nthdegree docs search --lean "common deletion two centers exact five support erase deleted source shared three"
  nthdegree docs search --lean "selectedAt support exact radius class erase source critical shell system"
  nthdegree docs search --lean "mutual membership two critical rows common blocker distinct deleted sources"
  ```

The current-repository hits that matter are:

- `cross_survival_unique_radius_and_exact_support`;
- `cross_deletion_survives_iff_not_mem_selected_support`;
- `CommonDeletionTwoCenterPacket`; and
- `nonempty_twoCommonDeletionSources_of_unusedCriticalRow`.

The sibling bank also surfaced
`U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility`, but it needs
the additional dangerous-triple / exact shared-center incidence packet.  The
present two-source packet does not produce those antecedents.  None of the
three bank registries exposes a consumer whose hypotheses are merely the two
common deletions plus their shared centers.

The corpus footer reported a 2026-07-17 index.  Every theorem actually used
below was still read and elaborated from the current source rather than
trusted from the index snippet.

## Kernel-checked normal form

The proof file is
`PairedCommonDeletionRowNormalForm.lean` in this directory.

For a packet `P`, write

```text
K = (H.selectedAt P.unusedRow.unused.point ...).support
C = SelectedClass D.A S.oppApex2 profile.radius
x = P.first
y = P.second.
```

The following facts are **PROVEN**.

1. The arbitrary stored actual-blocker radii are forced to be the retained
   critical radius.

2. Both stored actual-blocker supports are forced extensionally to be `K`:

   ```text
   P.firstPacket.B₁  = K
   P.secondPacket.B₁ = K.
   ```

   The proof uses source criticality, not the way the existential constructor
   happened to choose its row.

3. The arbitrary stored physical-apex radii are forced to be
   `profile.radius` by `profile.unique_K4_radius`.

4. Both stored physical-apex supports are the complete deleted exact-five
   classes:

   ```text
   P.firstPacket.B₂  = C.erase x
   P.secondPacket.B₂ = C.erase y.
   ```

   Cardinality is essential here: the stored support has card four, while
   deleting its source from the exact five-point class also leaves card four.

5. The physical rows mutually contain the other deleted source:

   ```text
   y ∈ P.firstPacket.B₂
   x ∈ P.secondPacket.B₂.
   ```

6. Their shared support has an exact description and cardinality:

   ```text
   P.firstPacket.B₂ ∩ P.secondPacket.B₂ = (C.erase x).erase y
   (P.firstPacket.B₂ ∩ P.secondPacket.B₂).card = 3.
   ```

7. The three-point shared physical core cannot be contained in `K`, because
   each `CommonDeletionTwoCenterPacket` bounds `K ∩ B₂` by two.  Hence a
   third point `z` exists with

   ```text
   z ∈ C
   z ≠ x
   z ≠ y
   z ∉ K,
   ```

   and deleting `z` preserves K4 at both the actual blocker and the physical
   apex.  This is the theorem `exists_third_commonDeletionSource`.

The third source is new mathematical information beyond the two strict-cap
sources: the exact-five / two-circle normal form automatically renews the
common deletion once more.

## What is not proved

The following claims remain **CONJECTURED or absent**, and the proof file does
not state them:

- the third common-deletion source lies in the strict cap interior;
- either source belongs to the actual critical row sourced at the other
  source (`H.selectedAt x ...` or `H.selectedAt y ...`);
- the third source supplies the named dangerous-triple fields required by a
  banked U5 contradiction;
- a paired nonreturn / well-founded-progress theorem; or
- `False` from this normal form alone.

In particular, mutual membership of `x` and `y` has been proved only in the
two physical-apex rows.  It must not be relabeled as mutual membership in the
source-indexed actual critical rows.

## Minimal production action

No change to `nonempty_commonDeletionTwoCenterPacket` or to the stored packet
fields is needed.  The existing arbitrary witnesses are canonical by theorem.

The minimal production promotion is therefore a small theorem module adjacent
to `LargeCapUniqueFiveLowHit` containing the support/radius normalizations and
`exists_third_commonDeletionSource`.  If a downstream consumer wants the
equalities as structure fields, adding cached fields is only an elaboration
convenience; it is not a constructor or proof-shape refactor.

The next real consumer must use one of the still-missing source-indexed facts:

- derive a named cross-incidence from the actual critical row at `x`, `y`, or
  the third source; or
- prove that repeatedly renewing the common-deletion source cannot return
  without cap/MEC progress.

## Validation

Because this tracked scratch directory is outside the Lake source tree, the
file was elaborated directly against the project environment:

```text
cd lean
lake env lean ../scratch/atail-force/paired-common-deletion-row-normal-form/PairedCommonDeletionRowNormalForm.lean
```

The command exited 0.  The four explicit `#print axioms` checks report exactly:

```text
propext, Classical.choice, Quot.sound
```

for:

- `firstPacket_B₁_eq_actualCriticalSupport`;
- `firstPacket_B₂_eq_physicalClass_erase_first`;
- `physical_support_inter_card_eq_three`; and
- `exists_third_commonDeletionSource`.

The file contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or solver-generated trust boundary.
