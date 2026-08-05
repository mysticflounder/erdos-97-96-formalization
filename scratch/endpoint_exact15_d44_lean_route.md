# Exact-15 D44 endpoint Lean route

## Verdict

The D44 deductions in `scratch/endpoint_n15_coupling_report.md` are valid.
They do not use either endpoint role coincidence (`A = J` or `X = C`), nor the
cross-hit hypothesis.  The strongest common producer should therefore sit
above both leaves.

No matching theorem was found in the mandated theorem-bank registries.  The
closest banked U5 result is only the existing two-row overlap upper bound.

## Proposed source-clean producer

In the namespace and variables of `FrontierLiveClosure.lean`, the useful
statement is:

```lean
theorem endpointFresh_exactFifteen_d44_rowCoupling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (hcard : D.A.card = 15)
    {otherRadius : ℝ}
    (hotherPos : 0 < otherRadius)
    (hotherNe : radius ≠ otherRadius)
    (hotherFour :
      4 ≤ (SelectedClass D.A S.oppApex1 otherRadius).card) :
    C.freshPacket.B₁ = Q.row.support ∧
      Q.K ∈ O.packet.B₁ ∧
      C.freshPacket.B₁ ∩
          (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support =
        {O.kept, O.deleted}
```

`hotherPos`, `hotherNe`, and `hotherFour` are exactly the D44-arm premise,
normalized so that `radius` is the retained class and `otherRadius` is its
companion.  They can be obtained by case-splitting
`C.allLarge.apex_rich S.oppIndex1`; in the two-radius arm, classify `Q.row`
with
`selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`
and swap the two radii if necessary.

The theorem needs no `K_mem_J_shell`, `hAJ`, or `hXC` argument.

## Proof skeleton with existing declarations

Use `i := S.oppIndex1`,

```lean
T := SelectedClass D.A S.oppApex1 radius
U := SelectedClass D.A S.oppApex1 otherRadius
I := S.capInteriorByIndex S.oppIndex1
SigmaB := (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
```

1. Exact cap data:

```lean
have hcap : (S.capByIndex i).card = 6 :=
  ATailExactFifteenApexProfile.capByIndex_card_eq_six_of_card_eq_fifteen
    S hcard C.allLarge.cap_card_ge_six i
have hIcard : I.card = 4 :=
  ATailExactFifteenApexProfile.capInteriorByIndex_card_eq_four_of_card_eq_fifteen
    S hcard C.allLarge.cap_card_ge_six i
```

2. The retained class is K4 because `Q.row.radius = radius`:

```lean
have hTfour : 4 ≤ T.card := by
  simpa only [EndpointFreshFirstApexRowSource.row_radius_eq] using
    ATailExactFifteenApexProfile.selectedFourClass_selectedClass_card_ge_four
      Q.row
```

Then obtain `T.card = 4`, `U.card = 4`, and the two-slice partition from:

- `ATailExactFifteenApexProfile.twoRichClasses_card_eq_four_of_cap_card_eq_six`;
- `ATailExactFifteenApexProfile.twoRichClassSlices_partition_of_capInterior_card_eq_four`.

The latter gives

```lean
(T ∩ I).card = 2
(U ∩ I).card = 2
Disjoint (T ∩ I) (U ∩ I)
I = (T ∩ I) ∪ (U ∩ I)
```

3. Normalize endpoint roles:

```lean
have hQC : Q.C = O.kept := by
  rw [Q.C_eq_fiber_source₁, E.fiber_source₁_eq_first, C.walk_first_eq]
have hQK : Q.K = C.fresh := by
  rw [Q.K_eq_fiber_source₂, E.fiber_source₂_eq_next, C.walk_next_eq]
```

`O.kept_mem_radius`, `O.deleted_mem_radius`,
`O.kept_mem_capInterior`, and `O.deleted_mem_capInterior` put the two distinct
points `O.kept,O.deleted` in `T ∩ I`.  Since this slice has card two,

```lean
T ∩ I = {O.kept, O.deleted}.
```

The fields `C.fresh_mem_capInterior`, `C.fresh_ne_kept`, and
`C.fresh_ne_deleted`, together with the partition, then force

```lean
Q.K ∈ U.
```

This is the key finite-exhaustion step; no extra geometric premise is hidden
here.

4. `Q.row.support = T` follows from
`ATailExactFifteenApexProfile.selectedFourClass_support_subset_selectedClass
Q.row`, `Q.row_radius_eq`, `Q.row.support_card`, and `T.card = 4` via
`Finset.eq_of_subset_of_card_le`.

5. Convert the two q-deleted first rows into selected four-classes:

```lean
let rowM :=
  ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
    O.packet.row₁ O.packet.B₁_card
let rowK :=
  ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
    C.freshPacket.row₁ C.freshPacket.B₁_card
```

Classify each using
`selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`.
The `T` alternative for `rowM` contradicts
`O.packet.row₁.q_not_mem`, because `O.deleted ∈ T`.  Hence

```lean
O.packet.B₁ = U,
```

and therefore `Q.K ∈ O.packet.B₁`.  The `U` alternative for `rowK`
contradicts `C.freshPacket.row₁.q_not_mem`, because `Q.K = C.fresh` and
`Q.K ∈ U`.  Hence

```lean
C.freshPacket.B₁ = T = Q.row.support.
```

6. Normalize the fresh packet's second row with the exact existing theorem:

```lean
have hB₂ : C.freshPacket.B₂ = SigmaB :=
  ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
    O.deleted_mem_A C.freshPacket.row₂ C.freshPacket.B₂_card
```

After rewriting the just-proved first-row equality and `hB₂`,
`C.freshPacket.overlap_le_two` gives

```lean
(T ∩ SigmaB).card ≤ 2.
```

`C.reverse_mem` supplies `O.kept ∈ SigmaB`.  Membership of `O.deleted` in
`SigmaB` follows by reading the right-hand singleton pair in
`C.reverseShell_inter_cap_eq`.  Both points are already in `T`, so
`{O.kept,O.deleted} ⊆ T ∩ SigmaB`; their distinctness is
`O.sources_ne`.  The overlap upper bound now gives, again by
`Finset.eq_of_subset_of_card_le`,

```lean
T ∩ SigmaB = {O.kept, O.deleted}.
```

This proves the third conjunct.  The same proof also gives the free extra
fact `Disjoint O.packet.B₁ C.freshPacket.B₁`, by distinct-radius
disjointness of `U` and `T`.

## Precisely what is still missing

There are two distinct scope gaps:

1. **To apply this producer to the live general leaves:** they do not assume
   `D.A.card = 15`.  Thus exact-15 D44 coupling is a specialized cardinality
   producer, not a proof of either general endpoint leaf.
2. **Even inside exact-15 D44:** the three row facts do not produce the exact
   premise consumed by the already-proved endpoint closers.  The missing
   premises are, respectively,

```lean
EndpointFreshFiveRoleKalmanson.FirstCenterEqFreshSourcePlacement Q
EndpointFreshFiveRoleKalmanson.SecondCenterEqFirstSourcePlacement Q
```

for

```lean
EndpointFreshFiveRoleKalmanson.false_of_firstCenterEqFreshSource_of_crossHit_of_placement
EndpointFreshFiveRoleKalmanson.false_of_secondCenterEqFirstSource_of_crossHit_of_placement.
```

Equivalently, a third common-incidence or banked endpoint metric-shadow
producer strong enough to bypass those placement types would also close the
specialized leaf.  The D44 equalities alone provide neither.

## Bank audit

Searched the four required registries (including their JSON inventories) for
`ExactFifteen`, exact-fifteen spelling variants,
`qDeletedK4Class_support_eq_selectedShell`, and both endpoint leaf names.  No
matching external producer exists.  This producer is therefore not a duplicate
of the registered `p97-rvol`, legacy `erdos/97`, or older
`erdos-general-theorem/97` banks.

No Lean source file was edited and no obligation was introduced.
