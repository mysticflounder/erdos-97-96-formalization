import MirrorIndexedAgreement
import DirectOuterBindingIntegrity
import P4MirrorOuterOccurrenceBridge.Main

/-!
# Mirror satisfaction for the three outer P4 families

The generated occurrence bridge uses a valuation that is intentionally false
on compact variables absent from its three selected families.  The common P4
mirror valuation can differ there, so this module transfers satisfaction only
at literals that actually occur in the authenticated 10,614-clause bridge.
-/

namespace Problem97.P4MirrorValuationScratch

open P4CompactAtomBindingScratch
open P4DirectOuterArcAdapterScratch
open P4DirectOuterBindingIntegrityScratch
open P4MirrorOuterOccurrenceBridgeScratch
open P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoCurvatureScratch
open ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

private theorem asLabel_eq_label (n : Nat) :
    P4DirectOuterValuationScratch.asLabel n =
      P4DirectOuterBindingIntegrityScratch.label n := by
  apply Fin.ext
  rfl

private theorem fourPointFinset_eq_rowSupport
    (point0 point1 point2 point3 : Nat) :
    P4DirectOuterValuationScratch.fourPointFinset
        point0 point1 point2 point3 =
      {P4DirectOuterBindingIntegrityScratch.label point0,
        P4DirectOuterBindingIntegrityScratch.label point1,
        P4DirectOuterBindingIntegrityScratch.label point2,
        P4DirectOuterBindingIntegrityScratch.label point3} := by
  simp only [P4DirectOuterValuationScratch.fourPointFinset,
    asLabel_eq_label]

private theorem bitMaskFinset_eq_maskAtom (mask : Nat) :
    bitMaskFinset mask = maskAtom mask := by
  rfl

theorem mirrorMembershipVal_iff_rowMem
    (Q : ExactTwoBoundaryCore R distribution) (center point : Fin 11) :
    mirrorMembershipVal Q ⟨center, point⟩ ↔
      rowMem Q mirrorIndex center point := by
  simp only [mirrorMembershipVal, membershipVal, reflectMembershipAtom,
    selectedRowSupport, selectedRow, Finset.mem_filter, Finset.mem_univ,
    true_and, rowMem]
  change
    shiftedBoundary Q (reflFin point) ∈
        (Q.carrierPattern.classAt
          (shiftedBoundary Q (reflFin center)) _).support ↔
      Q.boundary (mirrorIndex point) ∈
        (Q.carrierPattern.classAt
          (Q.boundary (mirrorIndex center)) _).support
  rw [classAt_support_congr Q.carrierPattern
    (shiftedBoundary_mem Q (reflFin center))
    (boundary_mem_carrier Q (mirrorIndex center))
    (shiftedBoundary_reflFin Q center), shiftedBoundary_reflFin Q point]

theorem mirrorCompactVal_membership_of_binding
    (P : P4MirrorBoundaryPacket R profile distribution)
    {dense : Nat} {atom : MembershipAtom}
    (h : MembershipBinding dense atom) :
    mirrorCompactVal P dense ↔ mirrorMembershipVal P.core atom := by
  unfold MembershipBinding membershipBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      rcases binding with
        ⟨bindingDense, sourceId, sourceName, family, parameters⟩
      cases parameters with
      | membership center point =>
          change decide (membershipAtom center point = atom) = true at h
          have hatom : membershipAtom center point = atom :=
            of_decide_eq_true h
          subst atom
          simp [mirrorCompactVal, hlookup, AtomParameters.interpret,
            mirrorAdapter, membershipAtom, asLabel_eq_label,
            mirrorMembershipVal_iff_rowMem]
      | radiusEquality center left right => simp at h
      | firstApexClass point => simp at h
      | blockerChoice source center => simp at h
      | criticalSupport source point => simp at h
      | rowSupport center point0 point1 point2 point3 => simp at h
      | outerArc center side mask => simp at h

theorem mirrorCompactVal_row_of_binding
    (P : P4MirrorBoundaryPacket R profile distribution)
    {dense : Nat} {atom : RowSupportAtom}
    (h : RowBinding dense atom) :
    mirrorCompactVal P dense ↔ mirrorRowSupportVal P.core atom := by
  unfold RowBinding rowBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      rcases binding with
        ⟨bindingDense, sourceId, sourceName, family, parameters⟩
      cases parameters with
      | membership center point => simp at h
      | radiusEquality center left right => simp at h
      | firstApexClass point => simp at h
      | blockerChoice source center => simp at h
      | criticalSupport source point => simp at h
      | rowSupport center point0 point1 point2 point3 =>
          change decide
            (rowAtom center point0 point1 point2 point3 = atom) = true at h
          have hatom : rowAtom center point0 point1 point2 point3 = atom :=
            of_decide_eq_true h
          subst atom
          simp [mirrorCompactVal, hlookup, AtomParameters.interpret,
            mirrorAdapter, rowAtom, fourPointFinset_eq_rowSupport,
            asLabel_eq_label]
      | outerArc center side mask => simp at h

theorem mirrorCompactVal_outer_of_binding
    (P : P4MirrorBoundaryPacket R profile distribution)
    {dense : Nat} {atom : OuterArcAtom}
    (h : OuterBinding dense atom) :
    mirrorCompactVal P dense ↔ mirrorOuterArcVal P.core atom := by
  unfold OuterBinding outerBindingBool at h
  cases hlookup : bindingAt dense with
  | none => simp [hlookup] at h
  | some binding =>
      simp only [hlookup] at h
      rcases binding with
        ⟨bindingDense, sourceId, sourceName, family, parameters⟩
      cases parameters with
      | membership center point => simp at h
      | radiusEquality center left right => simp at h
      | firstApexClass point => simp at h
      | blockerChoice source center => simp at h
      | criticalSupport source point => simp at h
      | rowSupport center point0 point1 point2 point3 => simp at h
      | outerArc center side mask =>
          change decide (outerAtom center side mask = atom) = true at h
          have hatom : outerAtom center side mask = atom :=
            of_decide_eq_true h
          subst atom
          cases side <;>
            simp [mirrorCompactVal, hlookup, AtomParameters.interpret,
              mirrorAdapter, outerAtom, directSide, maskAtom, bitMaskFinset,
              bitMaskFinset_eq_maskAtom, asLabel_eq_label,
              P4DirectOuterValuationScratch.toSourceSide]

def outerAtomBindingBool (n : Nat) : Bool :=
  match atomOfVar n with
  | .membership atom => membershipBindingBool n atom
  | .row atom => rowBindingBool n atom
  | .arc atom => outerBindingBool n atom
  | .unused => false

def mirrorOuterBridgeBindingsOK : Bool :=
  bridgeClauses.all fun clause =>
    clause.all fun literal => outerAtomBindingBool literal.natAbs

theorem mirrorOuterBridgeBindingsOK_true :
    mirrorOuterBridgeBindingsOK = true := by
  native_decide

theorem mirrorOuterBridge_literalIndex_lt :
    ∀ clause ∈ bridgeClauses, ∀ literal ∈ clause,
      literal.natAbs < 10000 := by
  have hcheck : bridgeClauses.all (fun clause =>
      clause.all (fun literal => decide (literal.natAbs < 10000))) = true := by
    native_decide
  intro clause hclause literal hliteral
  have hclauseCheck := List.all_eq_true.mp hcheck clause hclause
  exact of_decide_eq_true
    (List.all_eq_true.mp hclauseCheck literal hliteral)

theorem mirrorTotalVal_agree_outerAtom_of_binding
    (P : P4MirrorBoundaryPacket R profile distribution)
    {n : Nat} (hsmall : n < 10000)
    (hbinding : outerAtomBindingBool n = true) :
    mirrorTotalVal P n ↔ mirrorVal distribution P.core n := by
  rw [mirrorTotalVal_of_lt P hsmall]
  cases hatom : atomOfVar n with
  | membership atom =>
      have h : MembershipBinding n atom := by
        simpa [outerAtomBindingBool, hatom] using hbinding
      simpa [mirrorVal, hatom] using
        mirrorCompactVal_membership_of_binding P h
  | row atom =>
      have h : RowBinding n atom := by
        simpa [outerAtomBindingBool, hatom] using hbinding
      simpa [mirrorVal, hatom] using
        mirrorCompactVal_row_of_binding P h
  | arc atom =>
      have h : OuterBinding n atom := by
        simpa [outerAtomBindingBool, hatom] using hbinding
      simpa [mirrorVal, hatom] using
        mirrorCompactVal_outer_of_binding P h
  | unused =>
      simp [outerAtomBindingBool, hatom] at hbinding

theorem litSat_congr {valuation₁ valuation₂ : Nat → Prop} {literal : Int}
    (h : valuation₁ literal.natAbs ↔ valuation₂ literal.natAbs) :
    P5OccurrenceBridgeScratch.litSat valuation₁ literal ↔
      P5OccurrenceBridgeScratch.litSat valuation₂ literal := by
  unfold P5OccurrenceBridgeScratch.litSat
  by_cases hliteral : 0 ≤ literal
  · have heq : literal.toNat = literal.natAbs := by
      apply Nat.cast_injective (R := Int)
      rw [Int.toNat_of_nonneg hliteral, Int.natAbs_of_nonneg hliteral]
    simpa only [if_pos hliteral, heq] using h
  · have hneg : 0 ≤ -literal := by omega
    have heq : (-literal).toNat = literal.natAbs := by
      apply Nat.cast_injective (R := Int)
      rw [Int.toNat_of_nonneg hneg, ← Int.natAbs_neg literal,
        Int.natAbs_of_nonneg hneg]
    simpa only [if_neg hliteral, heq] using not_congr h

theorem clauseSat_congr {valuation₁ valuation₂ : Nat → Prop}
    {clause : List Int}
    (h : ∀ literal ∈ clause,
      valuation₁ literal.natAbs ↔ valuation₂ literal.natAbs) :
    P5OccurrenceBridgeScratch.clauseSat valuation₁ clause ↔
      P5OccurrenceBridgeScratch.clauseSat valuation₂ clause := by
  constructor <;> rintro ⟨literal, hliteral, hsatisfied⟩
  · exact ⟨literal, hliteral, (litSat_congr (h literal hliteral)).mp hsatisfied⟩
  · exact ⟨literal, hliteral, (litSat_congr (h literal hliteral)).mpr hsatisfied⟩

/-- All 10,614 authenticated mirror outer-family clauses hold under the common
source-faithful mirror valuation. -/
theorem mirrorOuterBridgeClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause := by
  intro clause hclause
  have hsatisfied :=
    authenticated_bridgeClauses_sat
      (distribution := distribution) P.core
      (mirrorVal_agreement distribution P.core) clause hclause
  apply (clauseSat_congr
    (valuation₁ := mirrorTotalVal P)
    (valuation₂ := mirrorVal distribution P.core) ?_).mpr hsatisfied
  intro literal hliteral
  have hclauseBindings :=
    List.all_eq_true.mp mirrorOuterBridgeBindingsOK_true clause hclause
  have hbinding :=
    List.all_eq_true.mp hclauseBindings literal hliteral
  exact mirrorTotalVal_agree_outerAtom_of_binding P
    (mirrorOuterBridge_literalIndex_lt clause hclause literal hliteral)
    hbinding

end Problem97.P4MirrorValuationScratch
