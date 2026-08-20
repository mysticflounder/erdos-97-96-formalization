/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenDirectConvexFiveFullBank
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# Missing cyclic cuts of the exact-seventeen convex-five bank

The direct bank uses the fixed cut of `Fin 17`.  This module rotates that cut
to the role `y`, proves the source theorem through `hneg_cyclicShift`, and
emits precisely the wrapping occurrences absent from the direct bank.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCyclicConvexFiveFullBank

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenConvexFiveSourceBridge
open ATailBlockerVExactSeventeenDirectConvexFiveFullBank
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

/-- Four positive offsets from a cyclic cut at `y`. -/
structure CyclicConvexFiveData where
  cut : Label
  c : Label
  b : Label
  x : Label
  a : Label
deriving DecidableEq, Repr

def CyclicConvexFiveData.Valid (data : CyclicConvexFiveData) : Prop :=
  0 < data.c ∧ data.c < data.b ∧
    data.b < data.x ∧ data.x < data.a

def CyclicConvexFiveData.check (data : CyclicConvexFiveData) : Bool :=
  decide (0 < data.c ∧ data.c < data.b ∧
    data.b < data.x ∧ data.x < data.a)

theorem CyclicConvexFiveData.validOfCheck (data : CyclicConvexFiveData)
    (hcheck : data.check = true) : data.Valid := by
  simpa [CyclicConvexFiveData.check, CyclicConvexFiveData.Valid] using hcheck

def CyclicConvexFiveData.placed
    (data : CyclicConvexFiveData) : DirectConvexFiveData :=
  { a := data.a + data.cut
    x := data.x + data.cut
    b := data.b + data.cut
    c := data.c + data.cut
    y := data.cut }

/-- Reversal after a cyclic shift is another cyclic shift by the reversed
last role.  The finite identity is isolated so the geometric proof below is
ordinary source reasoning. -/
theorem rev_add_diff :
    ∀ {z a cut : Label}, z < a →
      (⟨a.val - z.val, by omega⟩ : Label) + Fin.rev (a + cut) =
        Fin.rev (z + cut) := by
  native_decide

private theorem forwardOrientation (data : CyclicConvexFiveData)
    (hvalid : data.Valid) {pointOf : Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf) :
    0 < signedArea2 (pointOf data.placed.a) (pointOf data.placed.x)
        (pointOf data.placed.b) ∧
      0 < signedArea2 (pointOf data.placed.b) (pointOf data.placed.c)
        (pointOf data.placed.y) := by
  simp only [CyclicConvexFiveData.Valid, Fin.lt_def] at hvalid
  have hshift : ∀ {i j k : Label}, i < j → j < k →
      signedArea2 (pointOf (i + data.cut)) (pointOf (j + data.cut))
        (pointOf (k + data.cut)) < 0 :=
    hneg_cyclicShift (φ := pointOf) (hneg_of_ccw hinj hccw) data.cut
  have hfirst := hshift hvalid.2.2.1 hvalid.2.2.2
  have hsecond := hshift hvalid.1 hvalid.2.1
  constructor
  · simp only [CyclicConvexFiveData.placed]
    rw [signedArea2_swap13]
    linarith
  · have hsecond' : signedArea2 (pointOf data.cut)
        (pointOf (data.c + data.cut)) (pointOf (data.b + data.cut)) < 0 := by
      simpa only [Fin.zero_add] using hsecond
    simp only [CyclicConvexFiveData.placed]
    rw [signedArea2_swap13]
    linarith

private theorem reverseOrientation (data : CyclicConvexFiveData)
    (hvalid : data.Valid) {pointOf : Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf) :
    signedArea2 (pointOf (Fin.rev data.placed.a))
        (pointOf (Fin.rev data.placed.x))
        (pointOf (Fin.rev data.placed.b)) < 0 ∧
      signedArea2 (pointOf (Fin.rev data.placed.b))
        (pointOf (Fin.rev data.placed.c))
        (pointOf (Fin.rev data.placed.y)) < 0 := by
  simp only [CyclicConvexFiveData.Valid, Fin.lt_def] at hvalid
  let dx : Label := ⟨data.a.val - data.x.val, by omega⟩
  let db : Label := ⟨data.a.val - data.b.val, by omega⟩
  let dc : Label := ⟨data.a.val - data.c.val, by omega⟩
  let da : Label := data.a
  let reverseCut : Label := Fin.rev (data.a + data.cut)
  have hshift : ∀ {i j k : Label}, i < j → j < k →
      signedArea2 (pointOf (i + reverseCut)) (pointOf (j + reverseCut))
        (pointOf (k + reverseCut)) < 0 :=
    hneg_cyclicShift (φ := pointOf) (hneg_of_ccw hinj hccw) reverseCut
  have hzeroDx : (0 : Label) < dx := by
    simp only [dx, Fin.mk_lt_mk]
    exact Nat.sub_pos_iff_lt.mpr hvalid.2.2.2
  have hdxDb : dx < db := by
    simp only [dx, db, Fin.mk_lt_mk]
    omega
  have hdbDc : db < dc := by
    simp only [db, dc, Fin.mk_lt_mk]
    omega
  have hdcDa : dc < da := by
    simp only [dc, da, Fin.mk_lt_mk]
    exact Nat.sub_lt
      (hvalid.1.trans (hvalid.2.1.trans
        (hvalid.2.2.1.trans hvalid.2.2.2))) hvalid.1
  have hzeroA : (0 : Label) < data.a :=
    hvalid.1.trans (hvalid.2.1.trans (hvalid.2.2.1.trans hvalid.2.2.2))
  have hxId := rev_add_diff (cut := data.cut) hvalid.2.2.2
  have hbId := rev_add_diff (cut := data.cut)
    (hvalid.2.2.1.trans hvalid.2.2.2)
  have hcId := rev_add_diff (cut := data.cut)
    (hvalid.2.1.trans (hvalid.2.2.1.trans hvalid.2.2.2))
  have hyId := rev_add_diff (cut := data.cut) hzeroA
  have hyId' : data.a + reverseCut = Fin.rev data.cut := by
    simpa only [reverseCut, Nat.sub_zero, Fin.zero_add] using hyId
  constructor
  · have h := hshift hzeroDx hdxDb
    simpa only [CyclicConvexFiveData.placed, reverseCut, dx, db,
      Fin.zero_add, hxId, hbId] using h
  · have h := hshift hdbDc hdcDa
    simpa only [CyclicConvexFiveData.placed, reverseCut, db, dc, da,
      hbId, hcId, hyId', Fin.zero_add] using h

def CyclicConvexFiveData.occurrence (data : CyclicConvexFiveData)
    (hvalid : data.Valid) : ConvexFiveSourceOccurrence :=
  { hits := data.placed.hits
    forwardChoices := data.placed.forwardChoices
    reverseChoices := data.placed.reverseChoices
    forwardData := data.placed.forwardPointData
    reverseData := data.placed.reversePointData
    forwardOrientation := forwardOrientation data hvalid
    reverseOrientation := reverseOrientation data hvalid }

theorem CyclicConvexFiveData.occurrence_check
    (data : CyclicConvexFiveData) (hvalid : data.Valid) :
    (data.occurrence hvalid).check = true := by
  simp [CyclicConvexFiveData.occurrence, ConvexFiveSourceOccurrence.check,
    DirectConvexFiveData.forwardPointData,
    DirectConvexFiveData.reversePointData,
    DirectConvexFiveData.forwardChoices,
    DirectConvexFiveData.reverseChoices,
    DirectConvexFiveData.hits, ConvexFivePointData.check,
    ATailFrontierLiveClosure.GenericRowNogoodCertificate.checkPath,
    ATailFrontierLiveClosure.GenericRowNogoodCertificate.checkStepChain,
    ATailFrontierLiveClosure.GenericRowNogoodCertificate.checkPrimitiveStep,
    ATailFrontierLiveClosure.GenericRowNogoodCertificate.PrimitiveEqualityStep.source,
    ATailFrontierLiveClosure.GenericRowNogoodCertificate.PrimitiveEqualityStep.target]
  constructor
  · intro heq
    have := congrArg (fun z => z - data.cut) heq
    exact (ne_of_gt (hvalid.2.2.1.trans hvalid.2.2.2))
      (by simpa [CyclicConvexFiveData.placed] using this)
  · intro heq
    have := congrArg (fun z => z - data.cut) heq
    exact (ne_of_gt (hvalid.1.trans (hvalid.2.1.trans hvalid.2.2.1)))
      (by simpa [CyclicConvexFiveData.placed] using this)

private abbrev orientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

def CyclicConvexFiveData.clause (data : CyclicConvexFiveData)
    (direction : Orientation) : Std.Sat.CNF.Clause Atom :=
  nogoodClause 0 (orientedHits data.placed.hits 0 direction)

theorem sourceAssign_cyclicConvexFiveClause
    {A : Finset ℝ²} (source : SourceRealization A)
    (data : CyclicConvexFiveData) (hvalid : data.Valid)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (data.clause direction) = true := by
  simpa [CyclicConvexFiveData.clause, convexFiveOccurrenceClause,
    CyclicConvexFiveData.occurrence] using
    sourceAssign_convexFiveOccurrenceClause source (data.occurrence hvalid)
      (data.occurrence_check hvalid) 0 direction

private def dataOfCutAndOffsets
    (cut : Label) : List Label → CyclicConvexFiveData
  | [c, b, x, a] => ⟨cut, c, b, x, a⟩
  | _ => ⟨cut, 0, 0, 0, 0⟩

def cyclicConvexFiveMissingData : List CyclicConvexFiveData :=
  (labels.flatMap fun cut =>
    (positiveOffsets.sublistsLen 4).map (dataOfCutAndOffsets cut)).filter
      fun data => data.check && decide (17 ≤ data.cut.val + data.a.val)

theorem valid_of_mem_cyclicConvexFiveMissingData
    {data : CyclicConvexFiveData}
    (hdata : data ∈ cyclicConvexFiveMissingData) : data.Valid := by
  have hcheck := (List.mem_filter.mp hdata).2
  simp only [Bool.and_eq_true] at hcheck
  exact data.validOfCheck hcheck.1

def cyclicConvexFiveMissingClauses : Std.Sat.CNF Atom :=
  cyclicConvexFiveMissingData.flatMap fun data =>
    directions.map data.clause

theorem cyclicConvexFiveMissingData_length :
    cyclicConvexFiveMissingData.length = 24752 := by
  native_decide

theorem cyclicConvexFiveMissingClauses_length :
    cyclicConvexFiveMissingClauses.length = 49504 := by
  native_decide

theorem sourceAssign_cyclicConvexFiveMissingClauses
    {A : Finset ℝ²} (source : SourceRealization A) :
    ∀ clause ∈ cyclicConvexFiveMissingClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [cyclicConvexFiveMissingClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨data, hdata, direction, _hdirection, rfl⟩
  exact sourceAssign_cyclicConvexFiveClause source data
    (valid_of_mem_cyclicConvexFiveMissingData hdata) direction

#print axioms sourceAssign_cyclicConvexFiveClause
#print axioms sourceAssign_cyclicConvexFiveMissingClauses

end ATailBlockerVExactSeventeenCyclicConvexFiveFullBank
end Problem97
