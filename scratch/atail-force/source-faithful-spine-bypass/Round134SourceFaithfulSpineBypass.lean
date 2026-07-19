import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Round 134: source-faithful Route-B spine bypass

This scratch module moves the existing aggregate metric residual to the outer
Route-B boundary.  The five source rows and the sixth record001 `f2` row are
definitions of one concrete `CriticalShellSystem`, rather than independent
arguments.  A producer for the single aggregate residual then closes the outer
leaf without entering any of the eight current local sorry branches.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Round134

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Exact source-faithful context produced by the outer Route-B caller.

Only genuine outer inputs and the successive `q,p,t1,t2,t3,u` witnesses are
stored.  Pairwise distinctness, live data, the five rows, and the extra `f2`
row are derived below, so their provenance cannot drift. -/
structure SourceFaithfulLiveContext
    (D : CounterexampleData)
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3) : Type where
  minimal : D.Minimal
  carrier_card_gt_nine : 9 < D.A.card
  no_removable : ∀ x : ℝ², ¬ IsRemovableVertex D.A x
  no_M44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44
  triangle_eq : M = MT.toMoserTriangle.toStructural hCirc
  surplus_card : 4 < (CP.capAt i).card
  opposite_not_exact : ¬ CP.OppositePairExactAt i
  critical : CriticalShellSystem D.A
  q : ℝ²
  q_mem_cap : q ∈ CP.capAt i
  q_not_moser : q ∉ M.verts
  p : ℝ²
  local_no_qfree : U3LocalizedNoQFreePacket D q p
  t1 : ℝ²
  t2 : ℝ²
  t3 : ℝ²
  fixed : U3FixedTriplePacket D q p t1 t2 t3
  u : ℝ²
  selected :
    U5SelectedCandidateSkeleton D q p ({t1, t2, t3} : Finset ℝ²) u

namespace SourceFaithfulLiveContext

variable
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    {MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol}
    {hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩}
    {M : MoserTriangle D.A} {CP : CapTriple D.A M} {i : Fin 3}
    (C : SourceFaithfulLiveContext D MT hCirc CP i)

theorem q_mem_A : C.q ∈ D.A :=
  CP.capAt_subset_A i C.q_mem_cap

theorem t1_mem_A : C.t1 ∈ D.A := by
  have htSkeleton : C.t1 ∈ D.skeleton C.q :=
    (Finset.mem_erase.mp C.fixed.t1_mem).2
  have htErase : C.t1 ∈ D.A.erase C.q := by
    simpa [CounterexampleData.skeleton] using htSkeleton
  exact (Finset.mem_erase.mp htErase).2

theorem t2_mem_A : C.t2 ∈ D.A := by
  have htSkeleton : C.t2 ∈ D.skeleton C.q :=
    (Finset.mem_erase.mp C.fixed.t2_mem).2
  have htErase : C.t2 ∈ D.A.erase C.q := by
    simpa [CounterexampleData.skeleton] using htSkeleton
  exact (Finset.mem_erase.mp htErase).2

theorem t3_mem_A : C.t3 ∈ D.A := by
  have htSkeleton : C.t3 ∈ D.skeleton C.q :=
    (Finset.mem_erase.mp C.fixed.t3_mem).2
  have htErase : C.t3 ∈ D.A.erase C.q := by
    simpa [CounterexampleData.skeleton] using htSkeleton
  exact (Finset.mem_erase.mp htErase).2

theorem u_mem_A : C.u ∈ D.A := by
  have huSkeleton : C.u ∈ D.skeleton C.q :=
    (Finset.mem_erase.mp C.selected.candidate_mem).2
  have huErase : C.u ∈ D.A.erase C.q := by
    simpa [CounterexampleData.skeleton] using huSkeleton
  exact (Finset.mem_erase.mp huErase).2

/-- The live packet is reconstructed, not stored independently. -/
def liveData :
    U1LargeCapRouteBTailLiveData D C.p C.q C.t1 C.t2 C.t3 C.u where
  dangerous := u5DangerousTriple_of_u3FixedTriplePacket C.fixed
  exactQDeletedRadius :=
    C.local_no_qfree.exact_radius_class_card_eq_three C.fixed
  selected := C.selected

/-- Base-six distinctness is reconstructed from fixed-triple and selected
candidate provenance. -/
theorem base_pairwise :
    List.Pairwise (fun x y : ℝ² => x ≠ y)
      [C.p, C.q, C.t1, C.t2, C.t3, C.u] := by
  have hu_ne_p : C.u ≠ C.p :=
    (Finset.mem_erase.mp C.selected.candidate_mem).1
  have huSkeleton : C.u ∈ D.skeleton C.q :=
    (Finset.mem_erase.mp C.selected.candidate_mem).2
  have huErase : C.u ∈ D.A.erase C.q := by
    simpa [CounterexampleData.skeleton] using huSkeleton
  have hu_ne_q : C.u ≠ C.q := (Finset.mem_erase.mp huErase).1
  have hu_not : C.u ∉ ({C.t1, C.t2, C.t3} : Finset ℝ²) :=
    C.selected.candidate_notin_T
  have hu_ne_t1 : C.u ≠ C.t1 := by
    intro hu
    exact hu_not (by simp [hu])
  have hu_ne_t2 : C.u ≠ C.t2 := by
    intro hu
    exact hu_not (by simp [hu])
  have hu_ne_t3 : C.u ≠ C.t3 := by
    intro hu
    exact hu_not (by simp [hu])
  exact U1Depth5.baseSix_pairwise_of_fixedTriple_and_selected
    C.fixed.base_distinct hu_ne_p hu_ne_q hu_ne_t1 hu_ne_t2 hu_ne_t3

/-- The five live rows, definitionally selected from the one concrete critical
system stored by the context. -/
def rows :
    U1Depth5.CriticalSourceRows D C.q C.t1 C.t2 C.t3 C.u :=
  U1Depth5.CriticalSourceRows.ofCriticalShellSystem C.critical
    C.q_mem_A C.t1_mem_A C.t2_mem_A C.t3_mem_A C.u_mem_A

/-- The sixth `f2` row, definitionally selected from the same critical system
at the actual `t2[0]` source produced by `rows`. -/
def f2CriticalRow :
    U1Depth5.CriticalRowPacket D
      (C.rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 }) :=
  U1Depth5.CriticalRowPacket.ofCriticalShellSystem C.critical
    (C.rows.pointOfChoice_mem
      { source := U1Depth5.CriticalSource.t2, slot := 0 })

@[simp] theorem qRow_center_eq_critical_centerAt :
    C.rows.qRow.center = C.critical.centerAt C.q C.q_mem_A := rfl

@[simp] theorem t2Row_center_eq_critical_centerAt :
    C.rows.t2Row.center = C.critical.centerAt C.t2 C.t2_mem_A := rfl

@[simp] theorem f2_center_eq_critical_centerAt :
    C.f2CriticalRow.center =
      C.critical.centerAt
        (C.rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
        (C.rows.pointOfChoice_mem
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) := rfl

/-- The center congruence used by the current live leaf now follows from
definitionally shared critical-map provenance. -/
theorem f2Center_eq_rowAt_center
    (source : U1Depth5.CriticalSource)
    (hsource :
      C.rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        C.rows.sourcePoint source) :
    C.f2CriticalRow.center = (C.rows.rowAt source).center := by
  have hsub :
      (⟨C.rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 },
        C.rows.pointOfChoice_mem
          { source := U1Depth5.CriticalSource.t2, slot := 0 }⟩ :
        {x : ℝ² // x ∈ D.A}) =
      ⟨C.rows.sourcePoint source, (C.rows.rowAt source).source_mem⟩ := by
    exact Subtype.ext hsource
  have hcongr := congrArg
    (fun x : {x : ℝ² // x ∈ D.A} =>
      C.critical.centerAt x.1 x.2)
    hsub
  cases source <;>
    simpa [rows, f2CriticalRow,
      U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
      U1Depth5.CriticalRowPacket.ofCriticalShellSystem,
      U1Depth5.CriticalSourceRows.rowAt,
      U1Depth5.CriticalSourceRows.sourcePoint] using hcongr

/-- The selected-label congruence used by the current live leaf also follows
from the same definitional provenance. -/
theorem f2Selected_l1_eq_rowAt_l1
    (source : U1Depth5.CriticalSource)
    (hsource :
      C.rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        C.rows.sourcePoint source) :
    C.f2CriticalRow.selected.l1 = (C.rows.rowAt source).selected.l1 := by
  have hsub :
      (⟨C.rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 },
        C.rows.pointOfChoice_mem
          { source := U1Depth5.CriticalSource.t2, slot := 0 }⟩ :
        {x : ℝ² // x ∈ D.A}) =
      ⟨C.rows.sourcePoint source, (C.rows.rowAt source).source_mem⟩ := by
    exact Subtype.ext hsource
  have hcongr := congrArg
    (fun x : {x : ℝ² // x ∈ D.A} =>
      (C.critical.selectedAt x.1 x.2).l1)
    hsub
  cases source <;>
    simpa [rows, f2CriticalRow,
      U1Depth5.CriticalSourceRows.ofCriticalShellSystem,
      U1Depth5.CriticalRowPacket.ofCriticalShellSystem,
      U1Depth5.CriticalSourceRows.rowAt,
      U1Depth5.CriticalSourceRows.sourcePoint] using hcongr

/-- Smallest existing single aggregate sink at the current tail-local
boundary, now indexed by the actual source-faithful rows. -/
abbrev AggregateMetricResidual : Prop :=
  U1LargeCapRouteBTailMetricResidualTarget (p := C.p) C.rows

/-- An aggregate metric residual on the actual rows closes immediately through
the already banked sorry-free consumer. -/
theorem false_of_aggregateMetricResidual
    (R : C.AggregateMetricResidual) : False :=
  U1LargeCapRouteBTailMetricResidualTarget.false C.fixed C.base_pairwise R

end SourceFaithfulLiveContext

/-- One producer contract at the outer boundary replaces the eight local
DoubleApex/LIVE-C holes.  It is quantified over exact contexts so a proof may
use minimality, cap geometry, and both actual row definitions. -/
abbrev SourceFaithfulAggregateProducer
    (D : CounterexampleData)
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3) : Prop :=
  ∀ C : SourceFaithfulLiveContext D MT hCirc CP i,
    C.AggregateMetricResidual

/-- Conditional outer coordinator.  It repeats the genuine witness-selection
chain of `u1_largeCap_routeB_tail_false`, packages the resulting concrete
critical system source-faithfully, and calls the one aggregate producer. -/
theorem u1_largeCap_routeB_tail_false_of_sourceFaithfulAggregate
    (D : CounterexampleData)
    (hmin : D.Minimal)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (Hcritical : CriticalShellSystem D.A)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) {i : Fin 3}
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (produce : SourceFaithfulAggregateProducer D MT hCirc CP i) :
    False := by
  classical
  rcases CP.exists_nonMoser_mem_capAt_of_card_gt_four hsurplus with
    ⟨q, hqCap, hqNonMoser⟩
  have hqA : q ∈ D.A := CP.capAt_subset_A i hqCap
  rcases exists_localizedNoQFreePacket_of_not_removable_mem hqA
      (hnoRem q) with
    ⟨p, hlocalNoQFree⟩
  rcases hlocalNoQFree.exists_fixedTriplePacket with
    ⟨t1, t2, t3, hfixed⟩
  let hdanger : U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²) :=
    u5DangerousTriple_of_u3FixedTriplePacket hfixed
  rcases hdanger.exists_selectedCandidateSkeleton_of_card_gt_nine hcard with
    ⟨u, hselected⟩
  let C : SourceFaithfulLiveContext D MT hCirc CP i := {
    minimal := hmin
    carrier_card_gt_nine := hcard
    no_removable := hnoRem
    no_M44 := hNoM44
    triangle_eq := hM
    surplus_card := hsurplus
    opposite_not_exact := hnotOppExact
    critical := Hcritical
    q := q
    q_mem_cap := hqCap
    q_not_moser := hqNonMoser
    p := p
    local_no_qfree := hlocalNoQFree
    t1 := t1
    t2 := t2
    t3 := t3
    fixed := hfixed
    u := u
    selected := hselected
  }
  exact C.false_of_aggregateMetricResidual (produce C)

/- The joint import of `U1LargeCapRouteBTail` and the later exact-five parent
assembler is intentional: these checks certify that the later source-faithful
interfaces are available at this scratch boundary.  No exact-six gate is used
or restated here. -/

#check ATailOrientedPhysicalApexIngress.CriticalPairFrontier.false_of_parentResidualConsumers
#check ATailParentExactFiveAssembler.exactTwoFourRadii_or_largeRadiusCommonDeletion_or_exactFiveRelation
#check ATailParentExactFiveAssembler.false_of_fullParentExactFive_of_relationConsumers

end

end Round134
end Problem97

#print axioms Problem97.Round134.SourceFaithfulLiveContext.f2Center_eq_rowAt_center
#print axioms Problem97.Round134.SourceFaithfulLiveContext.f2Selected_l1_eq_rowAt_l1
#print axioms Problem97.Round134.SourceFaithfulLiveContext.false_of_aggregateMetricResidual
#print axioms Problem97.Round134.u1_largeCap_routeB_tail_false_of_sourceFaithfulAggregate

