/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Finite code for the card-eleven `(6,4,4)` cap-selected branch

This file defines the fixed eleven-label incidence surface used by the
general-`m` pinned-surplus certificate.  The finite theorem is deliberately
stated without the two prose-only local row exclusions `(2,1,0,1)` and
`(2,2,0,0)`. The retained premises have proved geometric kernels; their
profile-specific carrier adapters are tracked separately. In particular,
`CrossSeparationOK`, `Q3OK`, and `CapSelectedCountsOK` are not claimed here to
have complete source producers.

Distance equalities are represented by a finite color on oriented edges.
Rows and edge reversal must preserve colors.  A later bridge instantiates the
color by the finite quotient of `EqualityCore.EdgeClosure`, so color equality
can be transported back to an actual closure proof.
-/

namespace Problem97
namespace Census554
namespace CapSelectedFiniteCode

open EqualityCore

/-- The fixed carrier type in the forced card-eleven branch. -/
abbrev Label := Fin 11

/-- Boolean incidence matrix for one selected four-class at every center. -/
abbrev PatternCode := Label -> Label -> Bool

/-- The row decoded from a Boolean incidence matrix. -/
def row (P : PatternCode) (center : Label) : Finset Label :=
  Finset.univ.filter fun point => P center point

@[simp] theorem mem_row_iff (P : PatternCode) (center point : Label) :
    point ∈ row P center ↔ P center point = true := by
  simp [row]

/-- The row pattern consumed by the generic Census554 core structures. -/
def rowPattern (P : PatternCode) : RowPattern Label :=
  row P

/-- The three Moser labels. -/
def moser : Finset Label := {0, 1, 2}

/-- The six-point surplus cap, including its two Moser endpoints. -/
def capS : Finset Label := {1, 2, 3, 4, 5, 6}

/-- Strict interior labels of the surplus cap. -/
def intS : Finset Label := {3, 4, 5, 6}

/-- The first four-point non-surplus cap. -/
def capO1 : Finset Label := {0, 2, 7, 8}

/-- Strict interior labels of the first non-surplus cap. -/
def intO1 : Finset Label := {7, 8}

/-- The second four-point non-surplus cap. -/
def capO2 : Finset Label := {0, 1, 9, 10}

/-- Strict interior labels of the second non-surplus cap. -/
def intO2 : Finset Label := {9, 10}

/-- Position of a canonical label in the direct CCW boundary order
`0, O2, 1, S, 2, O1`. -/
def hullIndex : Label -> Fin 11
  | 0 => 0
  | 1 => 3
  | 2 => 8
  | 3 => 4
  | 4 => 5
  | 5 => 6
  | 6 => 7
  | 7 => 9
  | 8 => 10
  | 9 => 1
  | 10 => 2

/-- Positive cyclic displacement in the canonical hull order. -/
def cyclicOffset (a b : Label) : Nat :=
  ((hullIndex b).val + 11 - (hullIndex a).val) % 11

@[simp] theorem cyclicOffset_self (a : Label) : cyclicOffset a a = 0 := by
  unfold cyclicOffset
  have hval :
      (hullIndex a).val + 11 - (hullIndex a).val = 11 := by
    omega
  rw [hval]

/-- Strict cyclic betweenness in the canonical hull order. -/
def CyclicBetween (a b x : Label) : Prop :=
  0 < cyclicOffset a x ∧ cyclicOffset a x < cyclicOffset a b

/-- Alternation of two endpoint pairs on the canonical hull. -/
def CyclicSeparated (a b x y : Label) : Prop :=
  (CyclicBetween a b x ∧ ¬ CyclicBetween a b y) ∨
    (¬ CyclicBetween a b x ∧ CyclicBetween a b y)

/-- Five distinct labels occur in this cyclic order. -/
def CyclicFive (a x b c y : Label) : Prop :=
  0 < cyclicOffset a x ∧
    cyclicOffset a x < cyclicOffset a b ∧
    cyclicOffset a b < cyclicOffset a c ∧
    cyclicOffset a c < cyclicOffset a y

/-- Five labels occur in the required cyclic order in either orientation of
the canonical convex boundary. -/
def CyclicFiveUpToOrientation (a x b c y : Label) : Prop :=
  CyclicFive a x b c y ∨ CyclicFive a y c b x

/-- Six distinct labels occur in this cyclic order. -/
def CyclicSix (a b c x y d : Label) : Prop :=
  0 < cyclicOffset a b ∧
    cyclicOffset a b < cyclicOffset a c ∧
    cyclicOffset a c < cyclicOffset a x ∧
    cyclicOffset a x < cyclicOffset a y ∧
    cyclicOffset a y < cyclicOffset a d

/-- Six labels occur in the required cyclic order in either orientation of
the canonical convex boundary. -/
def CyclicSixUpToOrientation (a b c x y d : Label) : Prop :=
  CyclicSix a b c x y d ∨ CyclicSix a d y x c b

theorem CyclicFiveUpToOrientation.a_ne_b {a x b c y : Label}
    (h : CyclicFiveUpToOrientation a x b c y) : a ≠ b := by
  intro hab
  rcases h with h | h
  · simp [CyclicFive, hab] at h
  · simp [CyclicFive, hab] at h

theorem CyclicFiveUpToOrientation.x_ne_y {a x b c y : Label}
    (h : CyclicFiveUpToOrientation a x b c y) : x ≠ y := by
  intro hxy
  rcases h with h | h
  · simp [CyclicFive, hxy] at h
    omega
  · simp [CyclicFive, hxy] at h
    omega

theorem CyclicSixUpToOrientation.a_ne_b {a b c x y d : Label}
    (h : CyclicSixUpToOrientation a b c x y d) : a ≠ b := by
  intro hab
  rcases h with h | h
  · simp [CyclicSix, hab] at h
  · simp [CyclicSix, hab] at h

/-- The one-hit constraints at the three Moser centers. -/
def MoserOneHitOK (P : PatternCode) : Prop :=
  ((row P 0 ∩ capO1.erase 0).card ≤ 1 ∧
      (row P 0 ∩ capO2.erase 0).card ≤ 1) ∧
    ((row P 1 ∩ capS.erase 1).card ≤ 1 ∧
      (row P 1 ∩ capO2.erase 1).card ≤ 1) ∧
    ((row P 2 ∩ capS.erase 2).card ≤ 1 ∧
      (row P 2 ∩ capO1.erase 2).card ≤ 1)

/-- Every row is a center-free four-set, and a non-Moser center uses at most
two Moser labels. -/
def LocalRowsOK (P : PatternCode) : Prop :=
  (∀ center, (row P center).card = 4 ∧ center ∉ row P center) ∧
    MoserOneHitOK P ∧
    ∀ center, center ∉ moser -> (row P center ∩ moser).card ≤ 2

/-- Distinct selected rows meet in at most two labels. -/
def RowIntersectionsOK (P : PatternCode) : Prop :=
  ∀ left right, left ≠ right ->
    (row P left ∩ row P right).card ≤ 2

/-- Any pair of labels is selected at no more than two distinct centers. -/
def PairCenterCountOK (P : PatternCode) : Prop :=
  ∀ left right, left ≠ right ->
    ((Finset.univ : Finset Label).filter fun center =>
      left ∈ row P center ∧ right ∈ row P center).card ≤ 2

/-- Every shared pair of distinct labels alternates across its two distinct
centers in the canonical convex order. -/
def CrossSeparationOK (P : PatternCode) : Prop :=
  ∀ c d a b, c ≠ d -> a ≠ b ->
    a ∈ row P c -> b ∈ row P c ->
    a ∈ row P d -> b ∈ row P d ->
    CyclicSeparated c d a b

/-- The three explicit K-Q3 joint exclusions at the Moser centers. -/
def Q3OK (P : PatternCode) : Prop :=
  (row P 0 ∩ row P 1 ∩ intO2 = ∅) ∧
    ((row P 0 ∩ row P 1 ∩ intS = ∅) ∨
      (row P 0 ∩ row P 1 ∩ intO1 = ∅)) ∧
  (row P 0 ∩ row P 2 ∩ intO1 = ∅) ∧
    ((row P 0 ∩ row P 2 ∩ intS = ∅) ∨
      (row P 0 ∩ row P 2 ∩ intO2 = ∅)) ∧
  (row P 1 ∩ row P 2 ∩ intS = ∅) ∧
    ((row P 1 ∩ row P 2 ∩ intO1 = ∅) ∨
      (row P 1 ∩ row P 2 ∩ intO2 = ∅))

/-- Equality in the cap pair-count forces exact cap-hit counts at all six
surplus-cap centers. -/
def CapSelectedCountsOK (P : PatternCode) : Prop :=
  ∀ center, center ∈ capS ->
    (row P center ∩ capS).card =
      if center = 1 ∨ center = 2 then 1 else 2

/-- All incidence and convex-order constraints used by the finite search. -/
def IncidenceOK (P : PatternCode) : Prop :=
  LocalRowsOK P ∧
    RowIntersectionsOK P ∧
    PairCenterCountOK P ∧
    CrossSeparationOK P ∧
    Q3OK P ∧
    CapSelectedCountsOK P

/-- Pinned-surplus and source-indexed critical-shell constraints. -/
def PinnedShellOK (P : PatternCode) (blocker : Label -> Label)
    (pinSource deleted : Label) : Prop :=
  pinSource ∈ intS ∧
    deleted ∈ intS ∧
    pinSource ≠ deleted ∧
    row P 1 = {0, 7, 8, pinSource} ∧
    deleted ∈ row P 0 ∧
    (∀ q, blocker q ≠ q ∧ q ∈ row P (blocker q)) ∧
    (∀ q, q ∈ row P 1 -> blocker q = 1) ∧
    blocker deleted ≠ 1

/-- A center is exact whenever it is selected as some source's critical-shell
blocker. -/
def ExactCenter (blocker : Label -> Label) (center : Label) : Prop :=
  ∃ source, blocker source = center

/-- Seven-bit colors for oriented distance edges. There are only 121 oriented
edges, so seven bits suffice for a canonical equality-closure coloring. -/
abbrev EdgeColor := Edge Label -> BitVec 7

/-- Reversal and every selected row preserve the edge color. -/
def RespectsRows (P : PatternCode) (color : EdgeColor) : Prop :=
  (∀ a b, color (a, b) = color (b, a)) ∧
    ∀ center a b, a ∈ row P center -> b ∈ row P center ->
      color (center, a) = color (center, b)

/-- Color equality shorthand used by all finite core records. -/
def ColorEq (color : EdgeColor) (e f : Edge Label) : Prop :=
  color e = color f

/-- Color form of a duplicate-center core. -/
structure DuplicateCenterColorCore (color : EdgeColor) where
  p : Label
  q : Label
  r : Label
  a : Label
  b : Label
  hpq : p ≠ q
  hpr : p ≠ r
  hqr : q ≠ r
  hab : a ≠ b
  ap_aq : ColorEq color (a, p) (a, q)
  ap_ar : ColorEq color (a, p) (a, r)
  bp_bq : ColorEq color (b, p) (b, q)
  bp_br : ColorEq color (b, p) (b, r)

/-- Color form of an exact-row off-circle core. -/
structure ExactOffCircleColorCore (P : PatternCode)
    (blocker : Label -> Label) (color : EdgeColor) where
  c : Label
  a : Label
  z : Label
  source : Label
  center_eq : blocker source = c
  ha : a ∈ row P c
  hz : z ∉ row P c
  hacz : ColorEq color (c, a) (c, z)

/-- Color form of an equal-`K4` core. -/
structure EqualK4ColorCore (color : EdgeColor) where
  p : Label
  t1 : Label
  t2 : Label
  t3 : Label
  hpt1 : p ≠ t1
  pt1_pt2 : ColorEq color (p, t1) (p, t2)
  pt1_pt3 : ColorEq color (p, t1) (p, t3)
  pt1_t1t2 : ColorEq color (p, t1) (t1, t2)
  pt1_t1t3 : ColorEq color (p, t1) (t1, t3)
  pt1_t2t3 : ColorEq color (p, t1) (t2, t3)

/-- Color form of the equilateral-bisector collision core. -/
structure EquilateralBisectorColorCore (color : EdgeColor) where
  p : Label
  a : Label
  b : Label
  c : Label
  x : Label
  hpa : p ≠ a
  hpx : p ≠ x
  hcb : c ≠ b
  pa_pb : ColorEq color (p, a) (p, b)
  pa_pc : ColorEq color (p, a) (p, c)
  pa_ab : ColorEq color (p, a) (a, b)
  pa_ax : ColorEq color (p, a) (a, x)
  pa_bx : ColorEq color (p, a) (b, x)
  cx_ca : ColorEq color (c, x) (c, a)

/-- Color form of the three-triad collision core. -/
structure ThreeTriadColorCore (color : EdgeColor) where
  A : Label
  B : Label
  C : Label
  D : Label
  E : Label
  hAB : A ≠ B
  BC_BD : ColorEq color (B, C) (B, D)
  BD_DA : ColorEq color (B, D) (D, A)
  CA_CD : ColorEq color (C, A) (C, D)
  CD_CE : ColorEq color (C, D) (C, E)
  EA_EB : ColorEq color (E, A) (E, B)
  EB_ED : ColorEq color (E, B) (E, D)

/-- Color form of the seven-role surplus-source collision core. -/
structure SurplusSourceColorCore (color : EdgeColor) where
  O : Label
  A : Label
  B : Label
  C : Label
  U : Label
  V : Label
  W : Label
  hOA : O ≠ A
  OA_OB : ColorEq color (O, A) (O, B)
  OB_OC : ColorEq color (O, B) (O, C)
  CA_CO : ColorEq color (C, A) (C, O)
  UA_UB : ColorEq color (U, A) (U, B)
  BU_BA : ColorEq color (B, U) (B, A)
  BC_BA : ColorEq color (B, C) (B, A)
  CV_CO : ColorEq color (C, V) (C, O)
  VB_VO : ColorEq color (V, B) (V, O)
  WU_WO : ColorEq color (W, U) (W, O)
  WC_WO : ColorEq color (W, C) (W, O)
  WV_WO : ColorEq color (W, V) (W, O)

/-- Color form of the six-row anchor collision core. -/
structure SixRowAnchorColorCore (color : EdgeColor) where
  O : Label
  A : Label
  B : Label
  C : Label
  U : Label
  V : Label
  hOA : O ≠ A
  OB_OC : ColorEq color (O, B) (O, C)
  AB_AO : ColorEq color (A, B) (A, O)
  AU_AO : ColorEq color (A, U) (A, O)
  BC_BA : ColorEq color (B, C) (B, A)
  UV_UO : ColorEq color (U, V) (U, O)
  CU_CA : ColorEq color (C, U) (C, A)
  CV_CA : ColorEq color (C, V) (C, A)
  VB_VA : ColorEq color (V, B) (V, A)
  VC_VA : ColorEq color (V, C) (V, A)

/-- Color form of the seven-point orbit collision core. -/
structure SevenPointOrbitColorCore (color : EdgeColor) where
  O : Label
  A : Label
  B : Label
  C : Label
  U : Label
  V : Label
  W : Label
  hOA : O ≠ A
  OA_OB : ColorEq color (O, A) (O, B)
  OA_OC : ColorEq color (O, A) (O, C)
  AO_AB : ColorEq color (A, O) (A, B)
  AO_AV : ColorEq color (A, O) (A, V)
  AO_AW : ColorEq color (A, O) (A, W)
  BC_BU : ColorEq color (B, C) (B, U)
  BC_BV : ColorEq color (B, C) (B, V)
  CA_CV : ColorEq color (C, A) (C, V)
  UC_UW : ColorEq color (U, C) (U, W)
  VA_VU : ColorEq color (V, A) (V, U)
  VA_VW : ColorEq color (V, A) (V, W)
  WO_WB : ColorEq color (W, O) (W, B)
  WO_WU : ColorEq color (W, O) (W, U)

/-- Color form of the seven-point circle-network collision core. -/
structure SevenPointCircleNetworkColorCore (color : EdgeColor) where
  O : Label
  A : Label
  B : Label
  C : Label
  U : Label
  V : Label
  W : Label
  hOA : O ≠ A
  OA_OB : ColorEq color (O, A) (O, B)
  OA_OU : ColorEq color (O, A) (O, U)
  AO_AV : ColorEq color (A, O) (A, V)
  BO_BC : ColorEq color (B, O) (B, C)
  BO_BW : ColorEq color (B, O) (B, W)
  CA_CU : ColorEq color (C, A) (C, U)
  CA_CW : ColorEq color (C, A) (C, W)
  UB_UV : ColorEq color (U, B) (U, V)
  UB_UW : ColorEq color (U, B) (U, W)
  VB_VW : ColorEq color (V, B) (V, W)
  WO_WU : ColorEq color (W, O) (W, U)

/-- Color form of the convex perpendicular-bisector core. -/
structure PerpBisectorColorCore (color : EdgeColor) where
  a : Label
  b : Label
  p : Label
  q : Label
  r : Label
  hab : a ≠ b
  hpq : p ≠ q
  hpr : p ≠ r
  hqr : q ≠ r
  pa_pb : ColorEq color (p, a) (p, b)
  qa_qb : ColorEq color (q, a) (q, b)
  ra_rb : ColorEq color (r, a) (r, b)

/-- Color form of the order-sensitive five-point core. -/
structure ConvexFivePointColorCore (color : EdgeColor) where
  a : Label
  x : Label
  b : Label
  c : Label
  y : Label
  cyclic : CyclicFiveUpToOrientation a x b c y
  xa_xb : ColorEq color (x, a) (x, b)
  ya_yb : ColorEq color (y, a) (y, b)
  cb_cx : ColorEq color (c, b) (c, x)
  cb_cy : ColorEq color (c, b) (c, y)

/-- Color form of the order-sensitive convex rhombus core. -/
structure ConvexRhombusColorCore (color : EdgeColor) where
  a : Label
  b : Label
  c : Label
  x : Label
  y : Label
  d : Label
  cyclic : CyclicSixUpToOrientation a b c x y d
  ab_bc : ColorEq color (a, b) (b, c)
  ab_cd : ColorEq color (a, b) (c, d)
  ab_da : ColorEq color (a, b) (d, a)
  ab_by : ColorEq color (a, b) (b, y)
  ab_cy : ColorEq color (a, b) (c, y)
  ab_xd : ColorEq color (a, b) (x, d)
  ab_xa : ColorEq color (a, b) (x, a)

/-- The twelve finite obstruction families checked by the cap-selected
certificate. -/
def ColorCoreAlternative (P : PatternCode) (blocker : Label -> Label)
    (color : EdgeColor) : Prop :=
  Nonempty (DuplicateCenterColorCore color) ∨
  Nonempty (ExactOffCircleColorCore P blocker color) ∨
  Nonempty (EqualK4ColorCore color) ∨
  Nonempty (EquilateralBisectorColorCore color) ∨
  Nonempty (ThreeTriadColorCore color) ∨
  Nonempty (SurplusSourceColorCore color) ∨
  Nonempty (SixRowAnchorColorCore color) ∨
  Nonempty (SevenPointOrbitColorCore color) ∨
  Nonempty (SevenPointCircleNetworkColorCore color) ∨
  Nonempty (PerpBisectorColorCore color) ∨
  Nonempty (ConvexFivePointColorCore color) ∨
  Nonempty (ConvexRhombusColorCore color)

/-- Closure-core form of the same alternative.  The ordered branches retain
their finite cyclic-order witnesses for the geometric labeling bridge. -/
def ClosureCoreAlternative (P : PatternCode) (blocker : Label -> Label) : Prop :=
  Nonempty (DuplicateCenterCore (rowPattern P)) ∨
  (∃ source, ∃ core : ExactOffCircleCore (rowPattern P),
    core.c = blocker source) ∨
  Nonempty (EqualK4Core (rowPattern P)) ∨
  Nonempty (EquilateralBisectorCollisionCore (rowPattern P)) ∨
  Nonempty (ThreeTriadCollisionCore (rowPattern P)) ∨
  Nonempty (SurplusSourceCollisionCore (rowPattern P)) ∨
  Nonempty (SixRowAnchorCollisionCore (rowPattern P)) ∨
  Nonempty (SevenPointOrbitCollisionCore (rowPattern P)) ∨
  Nonempty (SevenPointCircleNetworkCollisionCore (rowPattern P)) ∨
  Nonempty (PerpBisectorCore (rowPattern P)) ∨
  (∃ core : ConvexFivePointCore.Core (rowPattern P),
    CyclicFiveUpToOrientation core.a core.x core.b core.c core.y) ∨
  ∃ core : ConvexRhombusCore.Core (rowPattern P),
    CyclicSixUpToOrientation core.a core.b core.c core.x core.y core.d

/-- Any sound edge-closure coloring transports a finite color core into the
existing generic Census554 closure-core surface. -/
theorem closureCoreAlternative_of_colorCoreAlternative
    {P : PatternCode} {blocker : Label -> Label} {color : EdgeColor}
    (hclosure : ∀ {e f}, ColorEq color e f ->
      EdgeClosure (rowPattern P) e f)
    (hcore : ColorCoreAlternative P blocker color) :
    ClosureCoreAlternative P blocker := by
  rcases hcore with hduplicate | hexact | hequalK4 | hequilateral |
    hthree | hsurplus | hsix | horbit | hnetwork | hperp | hfive | hrhombus
  · left
    rcases hduplicate with ⟨core⟩
    exact ⟨{
      p := core.p, q := core.q, r := core.r, a := core.a, b := core.b
      hpq := core.hpq, hpr := core.hpr, hqr := core.hqr, hab := core.hab
      ap_aq := hclosure core.ap_aq, ap_ar := hclosure core.ap_ar
      bp_bq := hclosure core.bp_bq, bp_br := hclosure core.bp_br }⟩
  · right; left
    rcases hexact with ⟨core⟩
    refine ⟨core.source, {
      c := core.c, a := core.a, z := core.z
      ha := core.ha, hz := core.hz, hacz := hclosure core.hacz }, ?_⟩
    exact core.center_eq.symm
  · right; right; left
    rcases hequalK4 with ⟨core⟩
    exact ⟨{
      p := core.p, t₁ := core.t1, t₂ := core.t2, t₃ := core.t3
      hpt₁ := core.hpt1, hp₁p₂ := hclosure core.pt1_pt2
      hp₁p₃ := hclosure core.pt1_pt3, hp₁₁₂ := hclosure core.pt1_t1t2
      hp₁₁₃ := hclosure core.pt1_t1t3, hp₁₂₃ := hclosure core.pt1_t2t3 }⟩
  · right; right; right; left
    rcases hequilateral with ⟨core⟩
    exact ⟨{
      p := core.p, a := core.a, b := core.b, c := core.c, x := core.x
      hpa := core.hpa, hpx := core.hpx, hcb := core.hcb
      pa_pb := hclosure core.pa_pb, pa_pc := hclosure core.pa_pc
      pa_ab := hclosure core.pa_ab, pa_ax := hclosure core.pa_ax
      pa_bx := hclosure core.pa_bx, cx_ca := hclosure core.cx_ca }⟩
  · right; right; right; right; left
    rcases hthree with ⟨core⟩
    exact ⟨{
      A := core.A, B := core.B, C := core.C, D := core.D, E := core.E
      hAB := core.hAB, BC_BD := hclosure core.BC_BD
      BD_DA := hclosure core.BD_DA, CA_CD := hclosure core.CA_CD
      CD_CE := hclosure core.CD_CE, EA_EB := hclosure core.EA_EB
      EB_ED := hclosure core.EB_ED }⟩
  · right; right; right; right; right; left
    rcases hsurplus with ⟨core⟩
    exact ⟨{
      O := core.O, A := core.A, B := core.B, C := core.C
      U := core.U, V := core.V, W := core.W, hOA := core.hOA
      OA_OB := hclosure core.OA_OB, OB_OC := hclosure core.OB_OC
      CA_CO := hclosure core.CA_CO, UA_UB := hclosure core.UA_UB
      BU_BA := hclosure core.BU_BA, BC_BA := hclosure core.BC_BA
      CV_CO := hclosure core.CV_CO, VB_VO := hclosure core.VB_VO
      WU_WO := hclosure core.WU_WO, WC_WO := hclosure core.WC_WO
      WV_WO := hclosure core.WV_WO }⟩
  · right; right; right; right; right; right; left
    rcases hsix with ⟨core⟩
    exact ⟨{
      O := core.O, A := core.A, B := core.B, C := core.C
      U := core.U, V := core.V, hOA := core.hOA
      OB_OC := hclosure core.OB_OC, AB_AO := hclosure core.AB_AO
      AU_AO := hclosure core.AU_AO, BC_BA := hclosure core.BC_BA
      UV_UO := hclosure core.UV_UO, CU_CA := hclosure core.CU_CA
      CV_CA := hclosure core.CV_CA, VB_VA := hclosure core.VB_VA
      VC_VA := hclosure core.VC_VA }⟩
  · right; right; right; right; right; right; right; left
    rcases horbit with ⟨core⟩
    exact ⟨{
      O := core.O, A := core.A, B := core.B, C := core.C
      U := core.U, V := core.V, W := core.W, hOA := core.hOA
      OA_OB := hclosure core.OA_OB, OA_OC := hclosure core.OA_OC
      AO_AB := hclosure core.AO_AB, AO_AV := hclosure core.AO_AV
      AO_AW := hclosure core.AO_AW, BC_BU := hclosure core.BC_BU
      BC_BV := hclosure core.BC_BV, CA_CV := hclosure core.CA_CV
      UC_UW := hclosure core.UC_UW, VA_VU := hclosure core.VA_VU
      VA_VW := hclosure core.VA_VW, WO_WB := hclosure core.WO_WB
      WO_WU := hclosure core.WO_WU }⟩
  · right; right; right; right; right; right; right; right; left
    rcases hnetwork with ⟨core⟩
    exact ⟨{
      O := core.O, A := core.A, B := core.B, C := core.C
      U := core.U, V := core.V, W := core.W, hOA := core.hOA
      OA_OB := hclosure core.OA_OB, OA_OU := hclosure core.OA_OU
      AO_AV := hclosure core.AO_AV, BO_BC := hclosure core.BO_BC
      BO_BW := hclosure core.BO_BW, CA_CU := hclosure core.CA_CU
      CA_CW := hclosure core.CA_CW, UB_UV := hclosure core.UB_UV
      UB_UW := hclosure core.UB_UW, VB_VW := hclosure core.VB_VW
      WO_WU := hclosure core.WO_WU }⟩
  · right; right; right; right; right; right; right; right; right; left
    rcases hperp with ⟨core⟩
    exact ⟨{
      a := core.a, b := core.b, p := core.p, q := core.q, r := core.r
      hab := core.hab, hpq := core.hpq, hpr := core.hpr, hqr := core.hqr
      pa_pb := hclosure core.pa_pb, qa_qb := hclosure core.qa_qb
      ra_rb := hclosure core.ra_rb }⟩
  · right; right; right; right; right; right; right; right; right; right; left
    rcases hfive with ⟨core⟩
    refine ⟨{
      a := core.a, x := core.x, b := core.b, c := core.c, y := core.y
      hab := core.cyclic.a_ne_b, hxy := core.cyclic.x_ne_y,
      xa_xb := hclosure core.xa_xb
      ya_yb := hclosure core.ya_yb, cb_cx := hclosure core.cb_cx
      cb_cy := hclosure core.cb_cy }, core.cyclic⟩
  · right; right; right; right; right; right; right; right; right; right; right
    rcases hrhombus with ⟨core⟩
    refine ⟨{
      a := core.a, b := core.b, c := core.c, x := core.x
      y := core.y, d := core.d, hab := core.cyclic.a_ne_b
      ab_bc := hclosure core.ab_bc, ab_cd := hclosure core.ab_cd
      ab_da := hclosure core.ab_da, ab_by := hclosure core.ab_by
      ab_cy := hclosure core.ab_cy, ab_xd := hclosure core.ab_xd
      ab_xa := hclosure core.ab_xa }, core.cyclic⟩

end CapSelectedFiniteCode
end Census554
end Problem97
