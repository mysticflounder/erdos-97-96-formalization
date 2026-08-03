import Mathlib

/-!
  A computationally checked Lean form of the 31-clause finite set-system
  obstruction from `MINIMIZATION-REPORT.md`.  This is deliberately a scratch
  theorem: it fixes the 15-point label universe and does not claim an adapter
  from the live geometric packet.
-/

namespace Problem97

abbrev U15 := Fin 15

def U : Finset U15 := Finset.univ

def I0 : Finset U15 := {0, 1, 2, 3}
def I1 : Finset U15 := {4, 5, 6, 7}
def I2 : Finset U15 := {8, 9, 10, 11}

def richOptions (interior : Finset U15) (apex : U15) : Finset (Finset U15) :=
  (U.powerset.filter (fun extra =>
      extra.card = 2 ∧ Disjoint extra (interior ∪ {apex}))).image
    (fun extra => interior ∪ extra)

def kOptions (center : U15) : Finset (Finset U15) :=
  U.powerset.filter (fun K => K.card = 4 ∧ center ∉ K)

abbrev R0 := (richOptions I0 12).attach
abbrev R1 := (richOptions I1 13).attach
abbrev R2 := (richOptions I2 14).attach
abbrev K7 := (kOptions 7).attach
abbrev K8 := (kOptions 8).attach

def D1332 : Finset U15 := (U.erase 7).erase 12
def D1334 : Finset U15 := {0, 1, 2, 3, 4, 5, 6, 14}
def D1335 : Finset U15 := {0, 1, 2, 3, 8, 9, 10, 11, 12, 13}
def D1381 : Finset U15 := (U.erase 8).erase 12
def D1383 : Finset U15 := {0, 1, 2, 3, 4, 5, 6, 7, 12, 14}
def D1384 : Finset U15 := {0, 1, 2, 3, 9, 10, 11, 13}
def D1569 : Finset U15 := {0, 1, 2, 3, 4, 5, 6, 7, 14}
def D1570 : Finset U15 := {0, 1, 2, 3, 8, 9, 10, 11, 13}
def D1613 : Finset U15 := {4, 5, 6, 7, 8, 9, 10, 11, 12}

def atMostOne (X Y D : Finset U15) : Prop := (X ∩ Y ∩ D).card ≤ 1

def core31 (r0 : R0) (r1 : R1) (r2 : R2) (k7 : K7) (k8 : K8) : Prop :=
  atMostOne r0.1 r1.1 D1569 ∧
  atMostOne r0.1 r2.1 D1570 ∧
  atMostOne r1.1 r2.1 D1613 ∧
  atMostOne k7.1 r0.1 D1332 ∧
  atMostOne k7.1 r1.1 D1334 ∧
  atMostOne k7.1 r2.1 D1335 ∧
  atMostOne k8.1 r0.1 D1381 ∧
  atMostOne k8.1 r1.1 D1383 ∧
  atMostOne k8.1 r2.1 D1384

instance core31Decidable (r0 : R0) (r1 : R1) (r2 : R2)
    (k7 : K7) (k8 : K8) : Decidable (core31 r0 r1 r2 k7 k8) := by
  unfold core31 at *
  unfold atMostOne at *
  infer_instance

def ExistsK8 (r0 : R0) (r1 : R1) (r2 : R2) (k7 : K7) : Prop :=
  ∃ k8 : K8, core31 r0 r1 r2 k7 k8

instance existsK8Decidable (r0 : R0) (r1 : R1) (r2 : R2) (k7 : K7) :
    Decidable (ExistsK8 r0 r1 r2 k7) := by
  unfold ExistsK8
  exact Fintype.decidableExistsFintype

def ExistsK7 (r0 : R0) (r1 : R1) (r2 : R2) : Prop :=
  ∃ k7 : K7, ExistsK8 r0 r1 r2 k7

instance existsK7Decidable (r0 : R0) (r1 : R1) (r2 : R2) :
    Decidable (ExistsK7 r0 r1 r2) := by
  unfold ExistsK7
  exact Fintype.decidableExistsFintype

def ExistsR2 (r0 : R0) (r1 : R1) : Prop :=
  ∃ r2 : R2, ExistsK7 r0 r1 r2

instance existsR2Decidable (r0 : R0) (r1 : R1) : Decidable (ExistsR2 r0 r1) := by
  unfold ExistsR2
  exact Fintype.decidableExistsFintype

def ExistsR1 (r0 : R0) : Prop :=
  ∃ r1 : R1, ExistsR2 r0 r1

instance existsR1Decidable (r0 : R0) : Decidable (ExistsR1 r0) := by
  unfold ExistsR1
  exact Fintype.decidableExistsFintype

theorem no_core31_witness :
    ¬ ∃ r0 : R0, ExistsR1 r0 := by
  native_decide

end Problem97
