/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Fin.Tuple.Reflection

/-!
# Finite incidence shadow for the FreshThird synchronization gap

This is not a geometric model and not a P97 counterexample.  It verifies that
the finite blocker-map and selected-row incidence laws isolated in the adjacent
audit note do not by themselves force a distinct row meeting the `Q` row in
three points.
-/

namespace Problem97
namespace FreshThirdFirstNonHitSyncV2
namespace IncidenceCounterpattern

abbrev Vertex := Fin 15

def blocker : Vertex → Vertex :=
  ![1, 0, 0, 2, 3, 3, 4, 6, 6, 10, 11, 9, 5, 7, 8]

def row : Vertex → Finset Vertex :=
  ![{1, 2, 4, 7}, {0, 3, 5, 8}, {3, 6, 9, 12}, {4, 5, 10, 13},
    {6, 0, 11, 7}, {12, 1, 10, 8}, {7, 8, 12, 13}, {13, 2, 9, 8},
    {14, 3, 11, 7}, {11, 4, 12, 8}, {9, 0, 3, 11}, {10, 7, 8, 14},
    ∅, ∅, ∅]

def blockerImage : Finset Vertex := Finset.univ.image blocker

def fiber (center : Vertex) : Finset Vertex := Finset.univ.filter fun s ↦ blocker s = center

def qRow : Finset Vertex := row 6

/-- Exact verification of the finite incidence claims used by the audit note. -/
theorem verifies_exported_incidence_shadow :
    (∀ s, blocker s ≠ s) ∧
    blockerImage.card = 12 ∧
    12 ∉ blockerImage ∧ 13 ∉ blockerImage ∧ 14 ∉ blockerImage ∧
    fiber 0 = {1, 2} ∧ fiber 3 = {4, 5} ∧ fiber 6 = {7, 8} ∧
    (∀ center ∈ blockerImage, (row center).card = 4 ∧ center ∉ row center) ∧
    (∀ s, s ∈ row (blocker s)) ∧
    (∀ c ∈ blockerImage, ∀ d ∈ blockerImage, c ≠ d →
      ((row c) ∩ row d).card ≤ 2) ∧
    qRow = {7, 8, 12, 13} ∧
    7 ∉ row (blocker 9) ∧
    7 ∈ row (blocker 10) ∧ 8 ∈ row (blocker 10) ∧
    row (blocker 10) ∩ qRow = {7, 8} ∧
    ¬ ∃ center ∈ blockerImage,
      center ≠ 6 ∧ 3 ≤ ((row center) ∩ qRow).card := by
  decide

/-- Four-omission variant.  The extra omission forces the expected fourth double
fiber, but that fiber's row still has only one `Q`-row point.  Thus the pure
finite-map multiplicity conclusion also needs a genuinely geometric incidence
consumer. -/
def blockerFourOmissions : Vertex → Vertex :=
  ![1, 0, 0, 2, 3, 3, 4, 6, 6, 10, 11, 9, 5, 7, 7]

def rowFourOmissions : Vertex → Finset Vertex :=
  ![{1, 2, 4, 7}, {0, 3, 5, 8}, {3, 6, 9, 12}, {4, 5, 10, 13},
    {6, 0, 11, 7}, {12, 1, 10, 8}, {7, 8, 12, 13}, {13, 14, 2, 9},
    {14, 3, 11, 7}, {11, 4, 12, 8}, {9, 0, 3, 11}, {10, 7, 8, 14},
    ∅, ∅, ∅]

def blockerImageFourOmissions : Finset Vertex := Finset.univ.image blockerFourOmissions

def fiberFourOmissions (center : Vertex) : Finset Vertex :=
  Finset.univ.filter fun s ↦ blockerFourOmissions s = center

/-- Exact verification that the fourth collision fiber remains unsynchronized
with the `Q` row. -/
theorem four_omissions_force_only_unsynchronized_fourth_fiber :
    (∀ s, blockerFourOmissions s ≠ s) ∧
    blockerImageFourOmissions.card = 11 ∧
    8 ∉ blockerImageFourOmissions ∧ 12 ∉ blockerImageFourOmissions ∧
      13 ∉ blockerImageFourOmissions ∧ 14 ∉ blockerImageFourOmissions ∧
    fiberFourOmissions 0 = {1, 2} ∧
      fiberFourOmissions 3 = {4, 5} ∧
      fiberFourOmissions 6 = {7, 8} ∧
      fiberFourOmissions 7 = {13, 14} ∧
    (∀ center ∈ blockerImageFourOmissions,
      (rowFourOmissions center).card = 4 ∧ center ∉ rowFourOmissions center) ∧
    (∀ s, s ∈ rowFourOmissions (blockerFourOmissions s)) ∧
    (∀ c ∈ blockerImageFourOmissions, ∀ d ∈ blockerImageFourOmissions,
      c ≠ d → ((rowFourOmissions c) ∩ rowFourOmissions d).card ≤ 2) ∧
    ¬ ∃ center ∈ blockerImageFourOmissions,
      center ≠ 6 ∧ 3 ≤ ((rowFourOmissions center) ∩ qRow).card := by
  decide

end IncidenceCounterpattern
end FreshThirdFirstNonHitSyncV2
end Problem97
