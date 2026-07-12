/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedClosureColor
import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound
import Erdos9796Proof.P97.Census554.SeparationCertificate

/-!
# Checked row-nogood certificates for the cap-selected classifier

The external miner records small sets of exact center/support choices together
with closure paths made only from row equalities and edge reversal. This module
defines the proof-free certificate format and proves its checker sound.

The generated payload is deliberately separate. A successful Boolean replay
here yields an existing `ClosureCoreAlternative`; the Python miner is not part
of the proof's trusted boundary.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNogoodCertificate

open EqualityCore
open CapSelectedFiniteCode
open CapSelectedNativeClassifier
open CapSelectedNativeClassifierFacts
open CapSelectedNativeClassifierSound
open SeparationCore.SeparationCertificate

/-- One concrete center/support choice used by a row nogood. Only the pinned
row may be marked exact in the cap-selected search. -/
structure RowChoice where
  center : Label
  support : Finset Label
  exact : Bool
deriving DecidableEq

/-- A proof-facing pattern realizes every concrete row choice in a nogood. -/
def RowsMatch (P : PatternCode) (choices : List RowChoice) : Prop :=
  ∀ choice, choice ∈ choices -> row P choice.center = choice.support

/-- Every row marked exact by a certificate has a blocker source. -/
def ExactChoicesSound (blocker : Label -> Label)
    (choices : List RowChoice) : Prop :=
  ∀ choice, choice ∈ choices -> choice.exact = true ->
    ExactCenter blocker choice.center

/-- A primitive closure step is supported by the concrete rows in a nogood. -/
def checkPrimitiveStep (choices : List RowChoice) :
    PrimitiveEqualityStep -> Bool
  | .row center first second =>
      choices.any fun choice =>
        decide (choice.center = center /\
          first ∈ choice.support /\ second ∈ choice.support)
  | .flip _ _ => true

/-- Executably check a closure path using only the rows named by a nogood. -/
def checkStepChain (choices : List RowChoice) :
    Edge Label -> List PrimitiveEqualityStep -> Edge Label -> Bool
  | first, [], last => decide (first = last)
  | first, step :: steps, last =>
      decide (first = step.source) && checkPrimitiveStep choices step &&
        checkStepChain choices step.target steps last

/-- Check a path's stated endpoints and every primitive step. -/
def checkPath (choices : List RowChoice) (path : ClosurePathData)
    (first last : Edge Label) : Bool :=
  (decide (path.first = first) && decide (path.last = last)) &&
    checkStepChain choices path.first path.steps path.last

/-- A row step supported by matching concrete choices generates an equality
closure in the proof-facing pattern. -/
theorem edgeClosure_of_checkPrimitiveStep
    {P : PatternCode} {choices : List RowChoice}
    (hrows : RowsMatch P choices) (step : PrimitiveEqualityStep)
    (hcheck : checkPrimitiveStep choices step = true) :
    EdgeClosure (rowPattern P) step.source step.target := by
  cases step with
  | row center first second =>
      rw [checkPrimitiveStep, List.any_eq_true] at hcheck
      rcases hcheck with ⟨choice, hchoice, hcheck⟩
      have hdata :
          choice.center = center /\
            first ∈ choice.support /\ second ∈ choice.support :=
        of_decide_eq_true hcheck
      change EdgeClosure (rowPattern P) (center, first) (center, second)
      rw [← hdata.1]
      have hrow := hrows choice hchoice
      exact EdgeClosure.row choice.center first second
        (by simpa [rowPattern, hrow] using hdata.2.1)
        (by simpa [rowPattern, hrow] using hdata.2.2)
  | flip first second =>
      exact EdgeClosure.flip first second

/-- Every checked step chain produces the equality closure it records. -/
theorem edgeClosure_of_checkStepChain
    {P : PatternCode} {choices : List RowChoice}
    (hrows : RowsMatch P choices) {first last : Edge Label}
    {steps : List PrimitiveEqualityStep}
    (hcheck : checkStepChain choices first steps last = true) :
    EdgeClosure (rowPattern P) first last := by
  induction steps generalizing first with
  | nil =>
      simp only [checkStepChain, decide_eq_true_eq] at hcheck
      subst last
      exact EdgeClosure.refl first
  | cons step steps ih =>
      simp only [checkStepChain, Bool.and_eq_true,
        decide_eq_true_eq] at hcheck
      rcases hcheck with ⟨⟨hfirst, hstep⟩, htail⟩
      subst first
      exact EdgeClosure.trans
        (edgeClosure_of_checkPrimitiveStep hrows step hstep)
        (ih htail)

/-- Soundness of a checked closure path with prescribed endpoints. -/
theorem edgeClosure_of_checkPath
    {P : PatternCode} {choices : List RowChoice}
    (hrows : RowsMatch P choices) (path : ClosurePathData)
    {first last : Edge Label}
    (hcheck : checkPath choices path first last = true) :
    EdgeClosure (rowPattern P) first last := by
  simp only [checkPath, Bool.and_eq_true, decide_eq_true_eq] at hcheck
  rcases hcheck with ⟨⟨hfirst, hlast⟩, hsteps⟩
  subst first
  subst last
  exact edgeClosure_of_checkStepChain hrows hsteps

/-- A checked path also gives equality in the canonical closure coloring. -/
theorem colorEq_of_checkPath
    {P : PatternCode} {choices : List RowChoice}
    (hrows : RowsMatch P choices) (path : ClosurePathData)
    {first last : Edge Label}
    (hcheck : checkPath choices path first last = true) :
    ColorEq (CapSelectedClosureColor.color (rowPattern P)) first last :=
  CapSelectedClosureColor.colorEq_of_edgeClosure
    (edgeClosure_of_checkPath hrows path hcheck)

/-- Proof-free duplicate-center core. -/
structure DuplicateCenterData where
  p : Label
  q : Label
  r : Label
  a : Label
  b : Label
  ap_aq : ClosurePathData
  ap_ar : ClosurePathData
  bp_bq : ClosurePathData
  bp_br : ClosurePathData
deriving DecidableEq, Repr

def DuplicateCenterData.check (choices : List RowChoice)
    (data : DuplicateCenterData) : Bool :=
  decide (data.p ≠ data.q /\ data.p ≠ data.r /\
      data.q ≠ data.r /\ data.a ≠ data.b) &&
    checkPath choices data.ap_aq (data.a, data.p) (data.a, data.q) &&
    checkPath choices data.ap_ar (data.a, data.p) (data.a, data.r) &&
    checkPath choices data.bp_bq (data.b, data.p) (data.b, data.q) &&
    checkPath choices data.bp_br (data.b, data.p) (data.b, data.r)

/-- Proof-free exact-row off-circle core. -/
structure ExactOffCircleData where
  c : Label
  a : Label
  z : Label
  hacz : ClosurePathData
deriving DecidableEq, Repr

def ExactOffCircleData.check (choices : List RowChoice)
    (data : ExactOffCircleData) : Bool :=
  choices.any (fun choice => decide (
      choice.center = data.c /\ choice.exact = true /\
        data.a ∈ choice.support /\ data.z ∉ choice.support)) &&
    checkPath choices data.hacz (data.c, data.a) (data.c, data.z)

/-- Proof-free perpendicular-bisector core. -/
structure PerpBisectorData where
  a : Label
  b : Label
  p : Label
  q : Label
  r : Label
  pa_pb : ClosurePathData
  qa_qb : ClosurePathData
  ra_rb : ClosurePathData
deriving DecidableEq, Repr

def PerpBisectorData.check (choices : List RowChoice)
    (data : PerpBisectorData) : Bool :=
  decide (data.a ≠ data.b /\ data.p ≠ data.q /\
      data.p ≠ data.r /\ data.q ≠ data.r) &&
    checkPath choices data.pa_pb (data.p, data.a) (data.p, data.b) &&
    checkPath choices data.qa_qb (data.q, data.a) (data.q, data.b) &&
    checkPath choices data.ra_rb (data.r, data.a) (data.r, data.b)

/-- Proof-free order-sensitive five-point core. -/
structure ConvexFivePointData where
  a : Label
  x : Label
  b : Label
  c : Label
  y : Label
  xa_xb : ClosurePathData
  ya_yb : ClosurePathData
  cb_cx : ClosurePathData
  cb_cy : ClosurePathData
deriving DecidableEq, Repr

instance cyclicFiveUpToOrientationDecidable
    (a x b c y : Label) :
    Decidable (CyclicFiveUpToOrientation a x b c y) := by
  unfold CapSelectedFiniteCode.CyclicFiveUpToOrientation
    CapSelectedFiniteCode.CyclicFive CapSelectedFiniteCode.cyclicOffset
  infer_instance

def ConvexFivePointData.check (choices : List RowChoice)
    (data : ConvexFivePointData) : Bool :=
  decide (CyclicFiveUpToOrientation data.a data.x data.b data.c data.y) &&
    checkPath choices data.xa_xb (data.x, data.a) (data.x, data.b) &&
    checkPath choices data.ya_yb (data.y, data.a) (data.y, data.b) &&
    checkPath choices data.cb_cx (data.c, data.b) (data.c, data.x) &&
    checkPath choices data.cb_cy (data.c, data.b) (data.c, data.y)

/-- Proof-free order-sensitive convex-rhombus core. -/
structure ConvexRhombusData where
  a : Label
  b : Label
  c : Label
  x : Label
  y : Label
  d : Label
  ab_bc : ClosurePathData
  ab_cd : ClosurePathData
  ab_da : ClosurePathData
  ab_by : ClosurePathData
  ab_cy : ClosurePathData
  ab_xd : ClosurePathData
  ab_xa : ClosurePathData
deriving DecidableEq, Repr

instance cyclicSixUpToOrientationDecidable
    (a b c x y d : Label) :
    Decidable (CyclicSixUpToOrientation a b c x y d) := by
  unfold CapSelectedFiniteCode.CyclicSixUpToOrientation
    CapSelectedFiniteCode.CyclicSix CapSelectedFiniteCode.cyclicOffset
  infer_instance

def ConvexRhombusData.check (choices : List RowChoice)
    (data : ConvexRhombusData) : Bool :=
  decide (CyclicSixUpToOrientation data.a data.b data.c data.x data.y data.d) &&
    checkPath choices data.ab_bc (data.a, data.b) (data.b, data.c) &&
    checkPath choices data.ab_cd (data.a, data.b) (data.c, data.d) &&
    checkPath choices data.ab_da (data.a, data.b) (data.d, data.a) &&
    checkPath choices data.ab_by (data.a, data.b) (data.b, data.y) &&
    checkPath choices data.ab_cy (data.a, data.b) (data.c, data.y) &&
    checkPath choices data.ab_xd (data.a, data.b) (data.x, data.d) &&
    checkPath choices data.ab_xa (data.a, data.b) (data.x, data.a)

/-- The monotone core families used by the compact row-nogood miner. -/
inductive CoreData where
  | duplicateCenter (data : DuplicateCenterData)
  | exactOffCircle (data : ExactOffCircleData)
  | perpBisector (data : PerpBisectorData)
  | convexFivePoint (data : ConvexFivePointData)
  | convexRhombus (data : ConvexRhombusData)
deriving DecidableEq, Repr

def CoreData.check (choices : List RowChoice) : CoreData -> Bool
  | .duplicateCenter data => data.check choices
  | .exactOffCircle data => data.check choices
  | .perpBisector data => data.check choices
  | .convexFivePoint data => data.check choices
  | .convexRhombus data => data.check choices

/-- A complete compact nogood certificate. -/
structure NogoodData where
  rows : List RowChoice
  core : CoreData
deriving DecidableEq

/-- Exact flags are restricted to the fixed pinned center. -/
def exactChoicesPinned (choices : List RowChoice) : Bool :=
  choices.all fun choice =>
    decide (choice.exact = true -> choice.center = (1 : Label))

/-- Closed structural validation of one nogood certificate. -/
def NogoodData.check (data : NogoodData) : Bool :=
  exactChoicesPinned data.rows && data.core.check data.rows

/-- Executable match of a concrete row choice against a native row. -/
def RowChoice.matchesRow (choice : RowChoice) (nativeRow : Row) : Bool :=
  decide (nativeRow.center = choice.center.val) &&
    decide (nativeRow.support = maskOfFinset choice.support)

/-- A native prefix contains every center/support choice of the nogood. -/
def NogoodData.matchesRows (data : NogoodData) (assigned : List Row) : Bool :=
  data.rows.all fun choice => assigned.any (choice.matchesRow ·)

/-- A checked bank is structurally sound certificate by certificate. -/
def checkBank (bank : List NogoodData) : Bool :=
  bank.all NogoodData.check

/-- The current native prefix contains at least one certified nogood. -/
def hasNogood (bank : List NogoodData) (assigned : List Row) : Bool :=
  bank.any fun data => data.matchesRows assigned

/-- The five compact certificate branches before embedding them into the
twelve-branch public finite-core interface. -/
def CompactColorCoreAlternative (P : PatternCode)
    (blocker : Label -> Label) (color : EdgeColor) : Prop :=
  Nonempty (DuplicateCenterColorCore color) ∨
  Nonempty (ExactOffCircleColorCore P blocker color) ∨
  Nonempty (PerpBisectorColorCore color) ∨
  Nonempty (ConvexFivePointColorCore color) ∨
  Nonempty (ConvexRhombusColorCore color)

/-- A checked compact core produces one of the five proof-facing color-core
branches. -/
theorem CoreData.compactColorCoreAlternative_of_check
    {P : PatternCode} {blocker : Label -> Label}
    {choices : List RowChoice} (hrows : RowsMatch P choices)
    (hexact : ExactChoicesSound blocker choices) (data : CoreData)
    (hcheck : data.check choices = true) :
    CompactColorCoreAlternative P blocker
      (CapSelectedClosureColor.color (rowPattern P)) := by
  cases data with
  | duplicateCenter data =>
      simp only [CoreData.check, DuplicateCenterData.check,
        Bool.and_eq_true] at hcheck
      rcases hcheck with ⟨⟨⟨⟨hinequalities, hap_aq⟩, hap_ar⟩,
        hbp_bq⟩, hbp_br⟩
      have hne : data.p ≠ data.q /\ data.p ≠ data.r /\
          data.q ≠ data.r /\ data.a ≠ data.b :=
        of_decide_eq_true hinequalities
      left
      exact ⟨{
        p := data.p, q := data.q, r := data.r, a := data.a, b := data.b
        hpq := hne.1, hpr := hne.2.1, hqr := hne.2.2.1
        hab := hne.2.2.2
        ap_aq := colorEq_of_checkPath hrows data.ap_aq hap_aq
        ap_ar := colorEq_of_checkPath hrows data.ap_ar hap_ar
        bp_bq := colorEq_of_checkPath hrows data.bp_bq hbp_bq
        bp_br := colorEq_of_checkPath hrows data.bp_br hbp_br }⟩
  | exactOffCircle data =>
      simp only [CoreData.check, ExactOffCircleData.check,
        Bool.and_eq_true] at hcheck
      rcases hcheck with ⟨hrowChoice, hpath⟩
      rw [List.any_eq_true] at hrowChoice
      rcases hrowChoice with ⟨choice, hchoice, hchoiceData⟩
      have hdata : choice.center = data.c /\ choice.exact = true /\
          data.a ∈ choice.support /\ data.z ∉ choice.support :=
        of_decide_eq_true hchoiceData
      have hrow : row P data.c = choice.support := by
        rw [← hdata.1]
        exact hrows choice hchoice
      rcases hexact choice hchoice hdata.2.1 with ⟨source, hsource⟩
      right; left
      exact ⟨{
        c := data.c, a := data.a, z := data.z, source := source
        center_eq := hsource.trans hdata.1
        ha := by simpa [hrow] using hdata.2.2.1
        hz := by simpa [hrow] using hdata.2.2.2
        hacz := colorEq_of_checkPath hrows data.hacz hpath }⟩
  | perpBisector data =>
      simp only [CoreData.check, PerpBisectorData.check,
        Bool.and_eq_true] at hcheck
      rcases hcheck with ⟨⟨⟨hinequalities, hpa_pb⟩, hqa_qb⟩,
        hra_rb⟩
      have hne : data.a ≠ data.b /\ data.p ≠ data.q /\
          data.p ≠ data.r /\ data.q ≠ data.r :=
        of_decide_eq_true hinequalities
      right; right; left
      exact ⟨{
        a := data.a, b := data.b, p := data.p, q := data.q, r := data.r
        hab := hne.1, hpq := hne.2.1, hpr := hne.2.2.1
        hqr := hne.2.2.2
        pa_pb := colorEq_of_checkPath hrows data.pa_pb hpa_pb
        qa_qb := colorEq_of_checkPath hrows data.qa_qb hqa_qb
        ra_rb := colorEq_of_checkPath hrows data.ra_rb hra_rb }⟩
  | convexFivePoint data =>
      simp only [CoreData.check, ConvexFivePointData.check,
        Bool.and_eq_true] at hcheck
      rcases hcheck with ⟨⟨⟨⟨hcyclic, hxa_xb⟩, hya_yb⟩,
        hcb_cx⟩, hcb_cy⟩
      right; right; right; left
      exact ⟨{
        a := data.a, x := data.x, b := data.b, c := data.c, y := data.y
        cyclic := of_decide_eq_true hcyclic
        xa_xb := colorEq_of_checkPath hrows data.xa_xb hxa_xb
        ya_yb := colorEq_of_checkPath hrows data.ya_yb hya_yb
        cb_cx := colorEq_of_checkPath hrows data.cb_cx hcb_cx
        cb_cy := colorEq_of_checkPath hrows data.cb_cy hcb_cy }⟩
  | convexRhombus data =>
      simp only [CoreData.check, ConvexRhombusData.check,
        Bool.and_eq_true] at hcheck
      rcases hcheck with
        ⟨⟨⟨⟨⟨⟨⟨hcyclic, hab_bc⟩, hab_cd⟩, hab_da⟩, hab_by⟩,
          hab_cy⟩, hab_xd⟩, hab_xa⟩
      right; right; right; right
      exact ⟨{
        a := data.a, b := data.b, c := data.c, x := data.x
        y := data.y, d := data.d
        cyclic := of_decide_eq_true hcyclic
        ab_bc := colorEq_of_checkPath hrows data.ab_bc hab_bc
        ab_cd := colorEq_of_checkPath hrows data.ab_cd hab_cd
        ab_da := colorEq_of_checkPath hrows data.ab_da hab_da
        ab_by := colorEq_of_checkPath hrows data.ab_by hab_by
        ab_cy := colorEq_of_checkPath hrows data.ab_cy hab_cy
        ab_xd := colorEq_of_checkPath hrows data.ab_xd hab_xd
        ab_xa := colorEq_of_checkPath hrows data.ab_xa hab_xa }⟩

/-- Embed the compact monotone detector surface into the public twelve-core
alternative. -/
theorem colorCoreAlternative_of_compactColorCoreAlternative
    {P : PatternCode} {blocker : Label -> Label} {color : EdgeColor}
    (hcore : CompactColorCoreAlternative P blocker color) :
    ColorCoreAlternative P blocker color := by
  rcases hcore with hduplicate | hexact | hperp | hfive | hrhombus
  · exact Or.inl hduplicate
  · exact Or.inr (Or.inl hexact)
  · right; right; right; right; right; right; right; right; right; left
    exact hperp
  · right; right; right; right; right; right; right; right; right; right; left
    exact hfive
  · right; right; right; right; right; right; right; right; right; right; right
    exact hrhombus

/-- A checked and realized nogood yields the existing proof-facing closure-core
alternative. -/
theorem NogoodData.closureCoreAlternative_of_check
    {P : PatternCode} {blocker : Label -> Label} (data : NogoodData)
    (hrows : RowsMatch P data.rows)
    (hexact : ExactChoicesSound blocker data.rows)
    (hcheck : data.check = true) : ClosureCoreAlternative P blocker := by
  have hcoreCheck : data.core.check data.rows = true := by
    have hcheck' : exactChoicesPinned data.rows = true /\
        data.core.check data.rows = true := by
      simpa only [NogoodData.check, Bool.and_eq_true] using hcheck
    exact hcheck'.2
  have hcompact := data.core.compactColorCoreAlternative_of_check
    hrows hexact hcoreCheck
  exact closureCoreAlternative_of_colorCoreAlternative
    CapSelectedClosureColor.edgeClosure_of_colorEq
    (colorCoreAlternative_of_compactColorCoreAlternative hcompact)

/-- The pinned-shell hypotheses make center `1` exact. -/
theorem exactCenter_one_of_pinnedShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hpin : PinnedShellOK P blocker pinSource deleted) :
    ExactCenter blocker 1 := by
  rcases hpin with ⟨_hpinSource, _hdeleted, _hne, hpinnedRow,
    _hdeletedRow, _hblocker, hpinnedBlocker, _hdeletedBlocker⟩
  refine ⟨0, hpinnedBlocker 0 ?_⟩
  rw [hpinnedRow]
  simp

/-- The certificate's exact-flag check and the pinned-shell premise discharge
all exact-center side conditions. -/
theorem exactChoicesSound_of_pinnedShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label} {choices : List RowChoice}
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hcheck : exactChoicesPinned choices = true) :
    ExactChoicesSound blocker choices := by
  rw [exactChoicesPinned, List.all_eq_true] at hcheck
  intro choice hchoice hexact
  have himp := of_decide_eq_true (hcheck choice hchoice)
  rw [himp hexact]
  exact exactCenter_one_of_pinnedShellOK hpin

/-- Eleven-bit support encoding is injective on canonical label finsets. -/
theorem maskOfFinset_injective : Function.Injective maskOfFinset := by
  intro left right hmask
  apply Finset.ext
  intro point
  have hbit := congrArg (fun mask => has mask point.val) hmask
  simpa only [has_maskOfFinset, decide_eq_decide] using hbit

/-- A native semantic row matching one concrete choice realizes that choice
in the proof-facing pattern. -/
theorem RowChoice.row_eq_of_matchesRowOfPattern
    {P : PatternCode} (choice : RowChoice) (center : Label)
    (hmatch : choice.matchesRow (rowOfPattern P center) = true) :
    row P choice.center = choice.support := by
  simp only [RowChoice.matchesRow, Bool.and_eq_true,
    decide_eq_true_eq] at hmatch
  have hcenter : center = choice.center := Fin.ext hmatch.1
  subst center
  apply maskOfFinset_injective
  simpa [rowOfPattern, rowMaskOf] using hmatch.2

/-- Matching a nogood against encoded semantic rows recovers `RowsMatch`. -/
theorem NogoodData.rowsMatch_of_matchesSemanticRows
    {P : PatternCode} (data : NogoodData) (centers : List Label)
    (hmatch : data.matchesRows
      (centers.map (rowOfPattern P)) = true) :
    RowsMatch P data.rows := by
  rw [NogoodData.matchesRows, List.all_eq_true] at hmatch
  intro choice hchoice
  have hexists := hmatch choice hchoice
  rw [List.any_eq_true] at hexists
  rcases hexists with ⟨nativeRow, hnativeRow, hrowMatch⟩
  rcases List.mem_map.mp hnativeRow with ⟨center, _hcenter, rfl⟩
  exact choice.row_eq_of_matchesRowOfPattern center hrowMatch

/-- End-to-end soundness of a checked static nogood bank on a semantic native
prefix. -/
theorem closureCoreAlternative_of_checkedBankMatch
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label} (bank : List NogoodData)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hbank : checkBank bank = true) (centers : List Label)
    (hmatch : hasNogood bank (centers.map (rowOfPattern P)) = true) :
    ClosureCoreAlternative P blocker := by
  rw [hasNogood, List.any_eq_true] at hmatch
  rcases hmatch with ⟨data, hdata, hdataMatch⟩
  have hdataCheck : data.check = true :=
    List.all_eq_true.mp hbank data hdata
  have hrows := data.rowsMatch_of_matchesSemanticRows centers hdataMatch
  have hexactPinned : exactChoicesPinned data.rows = true := by
    have hcheck' : exactChoicesPinned data.rows = true /\
        data.core.check data.rows = true := by
      simpa only [NogoodData.check, Bool.and_eq_true] using hdataCheck
    exact hcheck'.1
  have hexact := exactChoicesSound_of_pinnedShellOK hpin hexactPinned
  exact data.closureCoreAlternative_of_check hrows hexact hdataCheck

end CapSelectedNogoodCertificate
end Census554
end Problem97
