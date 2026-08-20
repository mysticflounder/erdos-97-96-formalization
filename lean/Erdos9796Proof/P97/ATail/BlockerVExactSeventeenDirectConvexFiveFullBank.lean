/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenConvexFiveSourceBridge

/-!
# Full positional convex-five bank at exact seventeen

This module blocks every seven-hit convex-five core whose five roles occur in
the strict boundary order `y < c < b < x < a`.  Unlike the model-by-model
refinements, the bank is enumerated directly from the seventeen boundary
positions and its source validity is proved uniformly.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenDirectConvexFiveFullBank

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenConvexFiveSourceBridge
open ATailFrontierLiveClosure.GenericRowNogoodCertificate

structure DirectConvexFiveData where
  a : Label
  x : Label
  b : Label
  c : Label
  y : Label
deriving DecidableEq, Repr

def DirectConvexFiveData.Valid (data : DirectConvexFiveData) : Prop :=
  data.y < data.c ∧ data.c < data.b ∧ data.b < data.x ∧ data.x < data.a

def DirectConvexFiveData.check (data : DirectConvexFiveData) : Bool :=
  decide (data.y < data.c ∧ data.c < data.b ∧
    data.b < data.x ∧ data.x < data.a)

theorem DirectConvexFiveData.validOfCheck (data : DirectConvexFiveData)
    (hcheck : data.check = true) : data.Valid := by
  simpa [DirectConvexFiveData.check, DirectConvexFiveData.Valid] using hcheck

def DirectConvexFiveData.hits (data : DirectConvexFiveData) : List Hit :=
  [(data.x, data.a), (data.x, data.b),
    (data.y, data.a), (data.y, data.b),
    (data.c, data.b), (data.c, data.x), (data.c, data.y)]

def DirectConvexFiveData.forwardChoices
    (data : DirectConvexFiveData) : List (RowChoice Label) :=
  [{ center := data.x, support := {data.a, data.b} },
    { center := data.y, support := {data.a, data.b} },
    { center := data.c, support := {data.b, data.x, data.y} }]

def DirectConvexFiveData.reverseChoices
    (data : DirectConvexFiveData) : List (RowChoice Label) :=
  [{ center := Fin.rev data.x,
      support := {Fin.rev data.a, Fin.rev data.b} },
    { center := Fin.rev data.y,
      support := {Fin.rev data.a, Fin.rev data.b} },
    { center := Fin.rev data.c,
      support := {Fin.rev data.b, Fin.rev data.x, Fin.rev data.y} }]

def DirectConvexFiveData.forwardPointData
    (data : DirectConvexFiveData) : ConvexFivePointData Label :=
  { a := data.a
    x := data.x
    b := data.b
    c := data.c
    y := data.y
    xa_xb := ⟨(data.x, data.a), [.row data.x data.a data.b],
      (data.x, data.b)⟩
    ya_yb := ⟨(data.y, data.a), [.row data.y data.a data.b],
      (data.y, data.b)⟩
    cb_cx := ⟨(data.c, data.b), [.row data.c data.b data.x],
      (data.c, data.x)⟩
    cb_cy := ⟨(data.c, data.b), [.row data.c data.b data.y],
      (data.c, data.y)⟩ }

def DirectConvexFiveData.reversePointData
    (data : DirectConvexFiveData) : ConvexFivePointData Label :=
  { a := Fin.rev data.a
    x := Fin.rev data.x
    b := Fin.rev data.b
    c := Fin.rev data.c
    y := Fin.rev data.y
    xa_xb := ⟨(Fin.rev data.x, Fin.rev data.a),
      [.row (Fin.rev data.x) (Fin.rev data.a) (Fin.rev data.b)],
      (Fin.rev data.x, Fin.rev data.b)⟩
    ya_yb := ⟨(Fin.rev data.y, Fin.rev data.a),
      [.row (Fin.rev data.y) (Fin.rev data.a) (Fin.rev data.b)],
      (Fin.rev data.y, Fin.rev data.b)⟩
    cb_cx := ⟨(Fin.rev data.c, Fin.rev data.b),
      [.row (Fin.rev data.c) (Fin.rev data.b) (Fin.rev data.x)],
      (Fin.rev data.c, Fin.rev data.x)⟩
    cb_cy := ⟨(Fin.rev data.c, Fin.rev data.b),
      [.row (Fin.rev data.c) (Fin.rev data.b) (Fin.rev data.y)],
      (Fin.rev data.c, Fin.rev data.y)⟩ }

private theorem forwardOrientation (data : DirectConvexFiveData)
    (hvalid : data.Valid) {pointOf : Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf) :
    0 < signedArea2 (pointOf data.a) (pointOf data.x) (pointOf data.b) ∧
      0 < signedArea2 (pointOf data.b) (pointOf data.c) (pointOf data.y) := by
  have hfirst := hneg_of_ccw hinj hccw hvalid.2.2.1 hvalid.2.2.2
  have hsecond := hneg_of_ccw hinj hccw hvalid.1 hvalid.2.1
  constructor <;> rw [signedArea2_swap13] <;> linarith

private theorem reverseOrientation (data : DirectConvexFiveData)
    (hvalid : data.Valid) {pointOf : Label → ℝ²}
    (hinj : Function.Injective pointOf)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon pointOf) :
    signedArea2 (pointOf (Fin.rev data.a)) (pointOf (Fin.rev data.x))
        (pointOf (Fin.rev data.b)) < 0 ∧
      signedArea2 (pointOf (Fin.rev data.b)) (pointOf (Fin.rev data.c))
        (pointOf (Fin.rev data.y)) < 0 := by
  constructor
  · exact hneg_of_ccw hinj hccw
      (Fin.rev_lt_rev.mpr hvalid.2.2.2)
      (Fin.rev_lt_rev.mpr hvalid.2.2.1)
  · exact hneg_of_ccw hinj hccw
      (Fin.rev_lt_rev.mpr hvalid.2.1)
      (Fin.rev_lt_rev.mpr hvalid.1)

def DirectConvexFiveData.occurrence (data : DirectConvexFiveData)
    (hvalid : data.Valid) : ConvexFiveSourceOccurrence :=
  { hits := data.hits
    forwardChoices := data.forwardChoices
    reverseChoices := data.reverseChoices
    forwardData := data.forwardPointData
    reverseData := data.reversePointData
    forwardOrientation := forwardOrientation data hvalid
    reverseOrientation := reverseOrientation data hvalid }

theorem DirectConvexFiveData.occurrence_check
    (data : DirectConvexFiveData) (hvalid : data.Valid) :
    (data.occurrence hvalid).check = true := by
  simp [DirectConvexFiveData.occurrence, ConvexFiveSourceOccurrence.check,
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
  exact ⟨ne_of_gt (hvalid.2.2.1.trans hvalid.2.2.2),
    ne_of_gt (hvalid.1.trans (hvalid.2.1.trans hvalid.2.2.1))⟩

private abbrev orientedHits :=
  ATailBlockerVExactSeventeenSixteenthModelRefinements.orientedHits

def DirectConvexFiveData.clause (data : DirectConvexFiveData)
    (direction : Orientation) : Std.Sat.CNF.Clause Atom :=
  nogoodClause 0 (orientedHits data.hits 0 direction)

theorem sourceAssign_directConvexFiveClause
    {A : Finset ℝ²} (source : SourceRealization A)
    (data : DirectConvexFiveData) (hvalid : data.Valid)
    (direction : Orientation) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (data.clause direction) = true := by
  simpa [DirectConvexFiveData.clause, convexFiveOccurrenceClause,
    DirectConvexFiveData.occurrence] using
    sourceAssign_convexFiveOccurrenceClause source (data.occurrence hvalid)
      (data.occurrence_check hvalid) 0 direction

private def dataOfPoints : List Label → DirectConvexFiveData
  | [y, c, b, x, a] => ⟨a, x, b, c, y⟩
  | _ => ⟨0, 0, 0, 0, 0⟩

def directConvexFiveData : List DirectConvexFiveData :=
  ((labels.sublistsLen 5).map dataOfPoints).filter
    DirectConvexFiveData.check

theorem valid_of_mem_directConvexFiveData {data : DirectConvexFiveData}
    (hdata : data ∈ directConvexFiveData) : data.Valid := by
  have hcheck := (List.mem_filter.mp hdata).2
  exact data.validOfCheck hcheck

def directConvexFiveFullBankClauses : Std.Sat.CNF Atom :=
  directConvexFiveData.flatMap fun data =>
    directions.map data.clause

theorem directConvexFiveData_length : directConvexFiveData.length = 6188 := by
  native_decide

theorem directConvexFiveFullBankClauses_length :
    directConvexFiveFullBankClauses.length = 12376 := by
  native_decide

theorem sourceAssign_directConvexFiveFullBankClauses
    {A : Finset ℝ²} (source : SourceRealization A) :
    ∀ clause ∈ directConvexFiveFullBankClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [directConvexFiveFullBankClauses, List.mem_flatMap,
    List.mem_map] at hclause
  rcases hclause with ⟨data, hdata, direction, _hdirection, rfl⟩
  exact sourceAssign_directConvexFiveClause source data
    (valid_of_mem_directConvexFiveData hdata) direction

#print axioms sourceAssign_directConvexFiveClause
#print axioms sourceAssign_directConvexFiveFullBankClauses

end ATailBlockerVExactSeventeenDirectConvexFiveFullBank
end Problem97
