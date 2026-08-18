# B-Family Architectural Closure Plan & Technical Specification

**Sector**: Two-Deletion Collision / B-Family  
**Coordinator Theorem**: [`Problem97.ATailFrontierLiveClosure.false_of_twoDistinctExactFourMutualOmissionJointDeletions`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L1103)  
**Target Files**:
- [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean)
- [`lean/Erdos9796Proof/Geometry/ConvexIndepHull.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/Geometry/ConvexIndepHull.lean)

**Open Leaves on Spine**:
1. **B1**: [`Problem97.ATailFrontierLiveClosure.b1_globalGapOrClosedTerminal_of_counterexample`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L142)
2. **B2**: [`Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L630)
3. **B3**: [`Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L704)

---

## 1. Structural Overview & Call Graph

```mermaid
graph TD
    Coordinator["false_of_twoDistinctExactFourMutualOmissionJointDeletions (L1103)"]
    
    Coordinator -->|β(z₁) = β(z₂)| B1_Coord["false_of_..._blockerCollision (L155)"]
    B1_Coord --> B1_Consumer["false_of_b1_global_gap_or_closed_terminal (B1Live.lean ✓)"]
    B1_Coord --> B1_Producer["b1_globalGapOrClosedTerminal_of_counterexample (L142 💧)"]
    
    Coordinator -->|β(z₁) ≠ β(z₂)| FiveCenters["false_of_..._fiveCenters (L1024)"]
    FiveCenters --> OneWay["false_of_..._oneWayCrossOmission (L930)"]
    OneWay --> FourCenter["false_of_exactFourMutualOmission_fourCenterCommonDeletion (L803)"]
    
    FourCenter -->|3 coincidence arms| B2["false_of_..._blockerCoincidence (L630 💧)"]
    FourCenter -->|4 survival arms| B3["false_of_..._survivalSquare (L704 💧)"]
```

---

## 2. Low-Level Step-by-Step Execution Plan

### STEP 1: Port & Validate B2Arm3 Normal Forms into Production
**Target File**: [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean)  
**Location**: Insert directly after line 627 (before `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`).

#### Substep 1a: Critical Shell Radius Uniqueness & Selection Equality
Insert the following verbatim code:
```lean
/-- **Radius uniqueness at a blocker center.** At `H.centerAt q hq` the only
positive radius carrying four or more ambient points is the chosen critical
shell radius. No exactness, minimality or cap hypothesis is used. -/
theorem criticalShell_radius_unique {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) {s : ℝ} (hs : 0 < s)
    (hfour : 4 ≤ (SelectedClass A (H.centerAt q hq) s).card) :
    s = (H.selectedAt q hq).toCriticalFourShell.radius := by
  classical
  have hqClass : q ∈ SelectedClass A (H.centerAt q hq) s := by
    by_contra hqClass
    refine H.no_qfree_at q hq ⟨s, hs, ?_⟩
    change 4 ≤ (SelectedClass (A.erase q) (H.centerAt q hq) s).card
    rw [selectedClass_erase_card_eq_of_not_mem hqClass]
    exact hfour
  calc
    s = dist (H.centerAt q hq) q := (mem_selectedClass.mp hqClass).2.symm
    _ = (H.selectedAt q hq).toCriticalFourShell.radius :=
      (H.selectedAt q hq).toCriticalFourShell.support_eq_radius q
        (H.selectedAt q hq).toCriticalFourShell.q_mem_support

/-- **Unique-four center.** Every ambient radius class of size at least four
centred at a chosen blocker center *is* that center's canonical critical shell. -/
theorem criticalShell_selectedClass_eq_support {A : Finset ℝ²}
    (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A) {s : ℝ} (hs : 0 < s)
    (hfour : 4 ≤ (SelectedClass A (H.centerAt q hq) s).card) :
    SelectedClass A (H.centerAt q hq) s =
      (H.selectedAt q hq).toCriticalFourShell.support := by
  classical
  have hrad : s = (H.selectedAt q hq).toCriticalFourShell.radius :=
    criticalShell_radius_unique H q hq hs hfour
  ext x
  rw [mem_selectedClass]
  constructor
  · rintro ⟨hxA, hxdist⟩
    exact (H.selectedAt q hq).toCriticalFourShell.off_row_named_label_forbidden
      hxA (hrad ▸ hxdist)
  · intro hx
    exact ⟨(H.selectedAt q hq).toCriticalFourShell.support_subset_A hx,
      ((H.selectedAt q hq).toCriticalFourShell.support_eq_radius x hx).trans
        hrad.symm⟩
```

#### Substep 1b: Blocker Center Erase Equivalence & Fiber Multiplicity
Insert the following verbatim code:
```lean
/-- **Erase criterion at a blocker center.** Deleting `y` preserves a
four-point equidistant class at `H.centerAt q hq` exactly when `y` avoids the
canonical shell of `q`. -/
theorem criticalShell_survives_iff_not_mem_support {A : Finset ℝ²}
    (H : CriticalShellSystem A) (q : ℝ²) (hq : q ∈ A) (y : ℝ²) :
    HasNEquidistantPointsAt 4 (A.erase y) (H.centerAt q hq) ↔
      y ∉ (H.selectedAt q hq).toCriticalFourShell.support :=
  cross_deletion_survives_iff_not_mem_selected_support H hq

/-- **Blocker fibers sit on one circle.** If `y` and `q` have the same chosen
blocker center then `y` lies on the canonical shell of `q`. -/
theorem mem_support_of_centerAt_eq {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) (y : ℝ²) (hy : y ∈ A)
    (hcenter : H.centerAt y hy = H.centerAt q hq) :
    y ∈ (H.selectedAt q hq).toCriticalFourShell.support := by
  by_contra hmem
  refine H.no_qfree_at y hy ?_
  rw [hcenter]
  exact (criticalShell_survives_iff_not_mem_support H q hq y).mpr hmem

/-- **Blocker multiplicity bound.** At most four carrier points share any one
chosen blocker center. -/
theorem blockerFiber_card_le_four {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) :
    (A.filter fun y ↦ ∀ hy : y ∈ A, H.centerAt y hy = H.centerAt q hq).card ≤ 4 := by
  classical
  have hsub :
      (A.filter fun y ↦ ∀ hy : y ∈ A, H.centerAt y hy = H.centerAt q hq) ⊆
        (H.selectedAt q hq).toCriticalFourShell.support := by
    intro y hy
    rcases Finset.mem_filter.mp hy with ⟨hyA, hyc⟩
    exact mem_support_of_centerAt_eq H q hq y hyA (hyc hyA)
  calc
    _ ≤ (H.selectedAt q hq).toCriticalFourShell.support.card :=
      Finset.card_le_card hsub
    _ = 4 := (H.selectedAt q hq).toCriticalFourShell.support_card
```

#### Substep 1c: Core Collision Normal Form
Insert the following verbatim code:
```lean
/-- **Collision normal form.** If a carrier point `c` *is* the chosen blocker
center of some source `x`, then `Row(x)` is the unique ambient radius class of
size at least four centred at `c`, `c` itself is off that class, and single
deletions survive at `c` exactly off that class. -/
theorem criticalShell_collision_normalForm {A : Finset ℝ²}
    (H : CriticalShellSystem A) (x : ℝ²) (hx : x ∈ A) {c : ℝ²}
    (hc : c = H.centerAt x hx) :
    c ∉ (H.selectedAt x hx).toCriticalFourShell.support ∧
      (∀ s : ℝ, 0 < s → 4 ≤ (SelectedClass A c s).card →
          SelectedClass A c s = (H.selectedAt x hx).toCriticalFourShell.support) ∧
      (∀ y : ℝ², HasNEquidistantPointsAt 4 (A.erase y) c ↔
          y ∉ (H.selectedAt x hx).toCriticalFourShell.support) := by
  subst hc
  exact ⟨(H.selectedAt x hx).toCriticalFourShell.center_not_mem_support,
    fun s hs hfour ↦ criticalShell_selectedClass_eq_support H x hx hs hfour,
    fun y ↦ criticalShell_survives_iff_not_mem_support H x hx y⟩
```

#### Substep 1d: Uniform B2 Disjunction Collapse
Insert the following verbatim code:
```lean
/-- **B2 uniform collision normal form.** All three collision arms collapse to one
uniform existential over `x ∈ {u, v, second.deleted}`. -/
theorem b2_collision_uniform_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted : v.1 ∉ ((lateFirstApexSystem R).selectedAt u.1 u.2).toCriticalFourShell.support)
    (_huOmitted : u.1 ∉ ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU : (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠ (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV : (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠ (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex : (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU : (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠ (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV : (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠ (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex : (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (_crossPacket : CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) S.oppApex2)
    (hcollision :
      first.deleted.1 = (lateFirstApexSystem R).centerAt u.1 u.2 ∨
      first.deleted.1 = (lateFirstApexSystem R).centerAt v.1 v.2 ∨
      first.deleted.1 = (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) :
    ∃ x : CarrierVertex D.A,
      first.deleted.1 = (lateFirstApexSystem R).centerAt x.1 x.2 ∧
        first.deleted.1 ∉ ((lateFirstApexSystem R).selectedAt x.1 x.2).toCriticalFourShell.support ∧
        (∀ s : ℝ, 0 < s → 4 ≤ (SelectedClass D.A first.deleted.1 s).card →
            SelectedClass D.A first.deleted.1 s =
              ((lateFirstApexSystem R).selectedAt x.1 x.2).toCriticalFourShell.support) ∧
        (∀ y : ℝ²,
          HasNEquidistantPointsAt 4 (D.A.erase y) first.deleted.1 ↔
            y ∉ ((lateFirstApexSystem R).selectedAt x.1 x.2).toCriticalFourShell.support) := by
  classical
  rcases hcollision with hc | hc | hc
  · exact ⟨u, hc, criticalShell_collision_normalForm (lateFirstApexSystem R) u.1 u.2 hc⟩
  · exact ⟨v, hc, criticalShell_collision_normalForm (lateFirstApexSystem R) v.1 v.2 hc⟩
  · exact ⟨second.deleted, hc,
      criticalShell_collision_normalForm (lateFirstApexSystem R)
        second.deleted.1 second.deleted.2 hc⟩
```

#### Substep 1e: Refactor B2 Coordinator Leaf
In [`TwoDeletionCollision.lean:630`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L630), replace the `sorry` body of `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence` with:
```lean
  obtain ⟨x, hcenter, hnotMem, hunique, hsurvIff⟩ :=
    b2_collision_uniform_normalForm R _hcard _surface rho _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted first second _hdeletedNe
      _hdeletedBlockersNe _hfirstBlockerNeU _hfirstBlockerNeV _hfirstBlockerNeApex
      _hsecondBlockerNeU _hsecondBlockerNeV _hsecondBlockerNeApex _crossPacket _hcollision
  exact false_of_exactFourMutualOmission_center_in_carrier
    R _hcard _surface rho _hrho _hfive u v _huNeV _huClass _hvClass
    first second x hcenter hnotMem hunique hsurvIff
```

---

### STEP 2: Center-in-Convex-Set Semicircle Exclusion Engine
**Target File**: [`lean/Erdos9796Proof/Geometry/ConvexIndepHull.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/Geometry/ConvexIndepHull.lean)  
**Location**: Append to end of file.

```lean
/-- A point `w` of a convex-independent set `A` cannot lie in the convex hull
of any subset of `A \ {w}`. In particular, the center of a circle containing 4
points of `A \ {w}` cannot belong to their convex hull. -/
theorem center_not_mem_convexHull_of_four_points_on_circle
    {A : Set Plane} (hA : EuclideanGeometry.ConvexIndep A)
    {w : Plane} (hw : w ∈ A)
    {T : Finset Plane} (hT_sub : (T : Set Plane) ⊆ A \ {w}) :
    w ∉ convexHull ℝ (T : Set Plane) :=
  convexIndep_not_mem_convexHull_of_finset_subset_diff hA hw hT_sub
```

---

### STEP 3: Close Leaf B2 (`blockerCoincidence`)
**Target File**: [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean)  
**Location**: Insert right above `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`.

```lean
/-- A circle center `z₁ ∈ D.A` whose critical 4-shell `Row(x) ⊆ D.A \ {z₁}`
meets `SelectedClass(S.oppApex2, ρ)` at `x` contradicts convex independence
with the remaining class points `u, v`. -/
theorem false_of_exactFourMutualOmission_center_in_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (x : CarrierVertex D.A)
    (hcenter : first.deleted.1 = (lateFirstApexSystem R).centerAt x.1 x.2)
    (hnotMem : first.deleted.1 ∉ ((lateFirstApexSystem R).selectedAt x.1 x.2).toCriticalFourShell.support)
    (hunique : ∀ s : ℝ, 0 < s → 4 ≤ (SelectedClass D.A first.deleted.1 s).card →
        SelectedClass D.A first.deleted.1 s = ((lateFirstApexSystem R).selectedAt x.1 x.2).toCriticalFourShell.support)
    (hsurvIff : ∀ y : ℝ², HasNEquidistantPointsAt 4 (D.A.erase y) first.deleted.1 ↔
        y ∉ ((lateFirstApexSystem R).selectedAt x.1 x.2).toCriticalFourShell.support) :
    False := by
  classical
  sorry
```

---

### STEP 4: Close Leaf B1 (`b1_globalGapOrClosedTerminal_of_counterexample`)
**Target File**: [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:142`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L142)

Package the escape point $t$ from `b1_live_escape_small_overlap` and connect it to `B1GlobalGapOrClosedTerminal C`:
```lean
theorem b1_globalGapOrClosedTerminal_of_counterexample
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    B1GlobalGapOrClosedTerminal C := by
  classical
  sorry
```

---

### STEP 5: Close Leaf B3 (`survivalSquare`)
**Target File**: [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:704`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L704)

```lean
theorem false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
    ...
    (_crossPacket : CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2) S.oppApex2)
    (hsquare :
      first.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      (first.deleted.1 = S.oppApex2 ∨
       first.deleted.1 = (lateFirstApexSystem R).centerAt u.1 u.2 ∨
       first.deleted.1 = (lateFirstApexSystem R).centerAt v.1 v.2 ∨
       first.deleted.1 = (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2)) :
    False := by
  classical
  sorry
```

---

## 3. Verification Commands for the Executing Agent

After completing each step:

1. **Compile & Typecheck Target**:
   ```bash
   lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision
   ```
2. **Verify Axiom Independence**:
   ```lean
   #print axioms Problem97.ATailFrontierLiveClosure.b2_collision_uniform_normalForm
   ```
   Must print strictly `[propext, Classical.choice, Quot.sound]`.
3. **Blueprint Spine Progress**:
   ```bash
   proof-blueprint spine
   ```
   Confirm open spine obligations reduce from 37 to 34 upon full closure.
