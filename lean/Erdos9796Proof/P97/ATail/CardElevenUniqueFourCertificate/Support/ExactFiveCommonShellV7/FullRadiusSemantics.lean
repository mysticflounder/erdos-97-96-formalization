/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.FullRadiusAtoms
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.FullSourceChoiceSemantics

/-!
# Semantic valuation for the exact-five full-radius G3 encoding

This file assigns the literal geometric meaning to every DIMACS variable
through `49360`.  In particular, the helper variables for local four-classes
and source-deleted pairs are interpreted by their mathematical existential
content, rather than as unconstrained Tseitin atoms.

Clause-family soundness and the retained-core ledger are proved in downstream
modules.  Keeping the valuation separate makes the checker ingress independent
of the finite clause ordering.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554

attribute [local instance] Classical.propDecidable

/-- Metric meaning of a center-local equality atom. -/
def CanonicalPacket.localEqHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalEqRow) : Prop :=
  dist (L.pointOf row.center) (L.pointOf row.left) =
    dist (L.pointOf row.center) (L.pointOf row.right)

/-- Metric meaning of an equality between two unoriented carrier edges. -/
def CanonicalPacket.globalEqHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : GlobalEqRow) : Prop :=
  dist (L.pointOf row.1.1) (L.pointOf row.1.2) =
    dist (L.pointOf row.2.1) (L.pointOf row.2.2)

/-- A source is assigned to this center by the source-indexed shadow. -/
def CanonicalPacket.sourceCenterHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (row : SourceCenterRow) : Prop :=
  shadow.centerOf row.source = row.center

/-- A center is used when at least one source is assigned to it. -/
def CanonicalPacket.usedCenterHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (center : Label) : Prop :=
  ∃ source, shadow.centerOf source = center

/-- Every center used by the source-indexed shadow carries the whole critical
four-shell, not merely the independently selected four-subset.  This is the
negative metric fact needed by the full-radius clauses. -/
theorem CanonicalPacket.exactAt_usedCenter
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (center : Label) (hused : P.usedCenterHolds shadow center) :
    Census554.EqualityCore.ExactAt P.cube.cube L.pointOf center := by
  rcases hused with ⟨source, hsource⟩
  have hcenter :
      L.pointOf center =
        H.centerAt (L.pointOf source) (L.mem_carrier source) := by
    rw [← hsource]
    exact shadow.center_point_eq source
  let K : SelectedFourClass A
      (H.centerAt (L.pointOf source) (L.mem_carrier source)) :=
    { support := (P.cube.classAt center).support
      support_subset_A := (P.cube.classAt center).support_subset_A
      support_card := (P.cube.classAt center).support_card
      radius := (P.cube.classAt center).radius
      radius_pos := (P.cube.classAt center).radius_pos
      support_eq_radius := by
        intro z hz
        simpa [← hcenter] using
          (P.cube.classAt center).support_eq_radius z hz
      center_not_mem := by
        simpa [← hcenter] using (P.cube.classAt center).center_not_mem }
  have hsupport :
      K.support =
        (H.selectedAt (L.pointOf source)
          (L.mem_carrier source)).toCriticalFourShell.support :=
    H.selectedFourClass_support_eq_shell
      (L.pointOf source) (L.mem_carrier source) K
  intro a ha z hz hdist
  have haClass :
      L.pointOf a ∈ (P.cube.classAt center).support :=
    P.cube.mem_cube_iff.mp ha
  have haShell :
      L.pointOf a ∈
        (H.selectedAt (L.pointOf source)
          (L.mem_carrier source)).toCriticalFourShell.support := by
    rw [← hsupport]
    exact haClass
  have hzRadius :
      dist
          (H.centerAt (L.pointOf source) (L.mem_carrier source))
          (L.pointOf z) =
        (H.selectedAt (L.pointOf source)
          (L.mem_carrier source)).toCriticalFourShell.radius := by
    calc
      dist
          (H.centerAt (L.pointOf source) (L.mem_carrier source))
          (L.pointOf z) =
          dist
            (H.centerAt (L.pointOf source) (L.mem_carrier source))
            (L.pointOf a) := by simpa [← hcenter] using hdist
      _ =
          (H.selectedAt (L.pointOf source)
            (L.mem_carrier source)).toCriticalFourShell.radius :=
        (H.selectedAt (L.pointOf source)
          (L.mem_carrier source)).toCriticalFourShell.support_eq_radius
            (L.pointOf a) haShell
  apply hz
  apply P.cube.mem_cube_iff.mpr
  rw [hsupport]
  exact
    (H.selectedAt (L.pointOf source)
      (L.mem_carrier source)).toCriticalFourShell.off_row_named_label_forbidden
        (L.mem_carrier z) hzRadius

/-- A true source choice certifies its decoded source-center map atom. -/
theorem CanonicalPacket.sourceChoiceHolds_sourceCenterHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source)
    (hchoice : P.sourceChoiceHolds shadow source choice) :
    P.sourceCenterHolds shadow
      ⟨source, (sourceChoiceAt source choice).1⟩ :=
  hchoice.1

/-- Every true source-center map atom makes the target center used. -/
theorem CanonicalPacket.sourceCenterHolds_usedCenterHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (row : SourceCenterRow)
    (hrow : P.sourceCenterHolds shadow row) :
    P.usedCenterHolds shadow row.center :=
  ⟨row.source, hrow⟩

/-- Two members of the selected cube row satisfy their local equality atom. -/
theorem CanonicalPacket.localEqHolds_of_mem_cube
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalEqRow)
    (hleft : row.left ∈ P.cube.cube row.center)
    (hright : row.right ∈ P.cube.cube row.center) :
    P.localEqHolds row :=
  P.cube.equidist_of_mem_cube row.center row.left row.right hleft hright

/-- Full-shell exactness rejects a local equality from a row member to an
outside label. -/
theorem CanonicalPacket.not_localEqHolds_of_exactAt
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalEqRow)
    (hexact :
      Census554.EqualityCore.ExactAt P.cube.cube L.pointOf row.center)
    (hleft : row.left ∈ P.cube.cube row.center)
    (hright : row.right ∉ P.cube.cube row.center) :
    ¬ P.localEqHolds row := by
  intro h
  exact hexact row.left hleft row.right hright h.symm

/-- Metric equality atoms are transitively closed. -/
theorem CanonicalPacket.localEqHolds_trans
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (center left middle right : Label)
    (hleft : P.localEqHolds ⟨center, left, middle⟩)
    (hright : P.localEqHolds ⟨center, middle, right⟩) :
    P.localEqHolds ⟨center, left, right⟩ :=
  hleft.trans hright

/-- Four listed labels have one common distance from the listed center.

The finite decoder proves that every `LocalFourRow.support` has length four.
The anchor formulation is exactly the three-star equality used by the CNF. -/
def CanonicalPacket.localFourHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : LocalFourRow) : Prop :=
  ∀ point ∈ row.support,
    dist (L.pointOf row.center) (L.pointOf (row.support.getD 0 0)) =
      dist (L.pointOf row.center) (L.pointOf point)

/-- After deleting `q`, there remains a four-point same-radius witness at
`center` containing `first` and `second`. -/
def CanonicalPacket.qDeletedPairHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (row : QDeletedPairRow) : Prop :=
  ∃ candidate ∈ encoderLocalFourRows,
    candidate.center = row.center ∧
      row.deleted ∉ candidate.support ∧
      row.first ∈ candidate.support ∧
      row.second ∈ candidate.support ∧
      P.localFourHolds candidate

/-- Boolean meaning of one decoded variable. -/
noncomputable def CanonicalPacket.fullRadiusMeaningValue
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) : G3VarMeaning → Bool
  | .prefixVar index =>
      P.fullSourceChoiceValuation shadow (1 + index.val)
  | .localEquality index =>
      decide (P.localEqHolds (localEqRow index))
  | .sourceCenter index =>
      decide (P.sourceCenterHolds shadow (sourceCenterRow index))
  | .usedCenter index =>
      decide (P.usedCenterHolds shadow index)
  | .globalEquality index =>
      decide (P.globalEqHolds (globalEqRow index))
  | .localFour index =>
      decide (P.localFourHolds (localFourRow index))
  | .qDeletedPair index =>
      decide (P.qDeletedPairHolds (qDeletedPairRow index))
  | .selector route =>
      decide (route = selected)

/-- Total G3 valuation.  Variables outside the authenticated `1..49360`
surface are false and therefore cannot be smuggled into the checker bridge. -/
noncomputable def CanonicalPacket.fullRadiusValuation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (varIndex : Nat) : Bool :=
  match decodeG3Var varIndex with
  | some meaning => P.fullRadiusMeaningValue shadow selected meaning
  | none => false

@[simp] theorem CanonicalPacket.fullRadiusValuation_encodeG3Var
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (meaning : G3VarMeaning) :
    P.fullRadiusValuation shadow selected (encodeG3Var meaning) =
      P.fullRadiusMeaningValue shadow selected meaning := by
  simp [CanonicalPacket.fullRadiusValuation, decodeG3Var_encodeG3Var]

@[simp] theorem CanonicalPacket.fullRadiusValuation_prefix
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : Fin 41004) :
    P.fullRadiusValuation shadow selected (1 + index.val) =
      P.fullSourceChoiceValuation shadow (1 + index.val) := by
  simpa [encodeG3Var, CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected (.prefixVar index)

/-- Raw-index form of `fullRadiusValuation_prefix`.  This is convenient for
the inherited encoder variables, whose arithmetic descriptions are naturally
stated directly in DIMACS coordinates. -/
theorem CanonicalPacket.fullRadiusValuation_eq_fullSourceChoice_of_lt
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) {varIndex : Nat}
    (hpos : 0 < varIndex) (hlt : varIndex < 41005) :
    P.fullRadiusValuation shadow selected varIndex =
      P.fullSourceChoiceValuation shadow varIndex := by
  let index : Fin 41004 := ⟨varIndex - 1, by omega⟩
  have hindex : 1 + index.val = varIndex := by
    simp only [index]
    omega
  rw [← hindex]
  exact P.fullRadiusValuation_prefix shadow selected index

@[simp] theorem CanonicalPacket.fullRadiusValuation_localEquality
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : Fin 495) :
    P.fullRadiusValuation shadow selected
        (encodeG3Var (.localEquality index)) =
      decide (P.localEqHolds (localEqRow index)) := by
  simpa [CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected
      (.localEquality index)

@[simp] theorem CanonicalPacket.fullRadiusValuation_sourceCenter
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : Fin 92) :
    P.fullRadiusValuation shadow selected
        (encodeG3Var (.sourceCenter index)) =
      decide (P.sourceCenterHolds shadow (sourceCenterRow index)) := by
  simpa [CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected
      (.sourceCenter index)

@[simp] theorem CanonicalPacket.fullRadiusValuation_usedCenter
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : Fin 11) :
    P.fullRadiusValuation shadow selected
        (encodeG3Var (.usedCenter index)) =
      decide (P.usedCenterHolds shadow index) := by
  simpa [CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected (.usedCenter index)

@[simp] theorem CanonicalPacket.fullRadiusValuation_globalEquality
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : Fin 1485) :
    P.fullRadiusValuation shadow selected
        (encodeG3Var (.globalEquality index)) =
      decide (P.globalEqHolds (globalEqRow index)) := by
  simpa [CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected
      (.globalEquality index)

@[simp] theorem CanonicalPacket.fullRadiusValuation_localFour
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : Fin 2310) :
    P.fullRadiusValuation shadow selected
        (encodeG3Var (.localFour index)) =
      decide (P.localFourHolds (localFourRow index)) := by
  simpa [CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected (.localFour index)

@[simp] theorem CanonicalPacket.fullRadiusValuation_qDeletedPair
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (index : Fin 3960) :
    P.fullRadiusValuation shadow selected
        (encodeG3Var (.qDeletedPair index)) =
      decide (P.qDeletedPairHolds (qDeletedPairRow index)) := by
  simpa [CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected
      (.qDeletedPair index)

@[simp] theorem CanonicalPacket.fullRadiusValuation_selector
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected route : G3Case) :
    P.fullRadiusValuation shadow selected (g3SelectorVar route) =
      decide (route = selected) := by
  simpa [encodeG3Var, CanonicalPacket.fullRadiusMeaningValue] using
    P.fullRadiusValuation_encodeG3Var shadow selected (.selector route)

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.fullRadiusValuation_prefix
