/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RetainedKalmansonDecoder
import CardElevenExactTwoBoundaryPackets

/-!
# Indexed source valuation for the p5 exact-two dense CNF

This module interprets every dense Boolean atom of the selected p5 formula
`p5.greedy-family-largest-seed0.json` (616 variables: `m_c_p`, `eq_c_l_r`,
`class_p`) over an actual exact-two boundary core, and records one
satisfaction predicate per retained clause family.

The interpretation is parameterized by an index transport `σ : Label →
Label`: the direct branch evaluates CNF index `i` at boundary position `i`
(`σ = directIndex = id`), the mirror branch at boundary position `-i`
(`σ = mirrorIndex`, the reflection `ρ(i) = -i mod 11` that fixes the first
apex and reverses the boundary cycle).

Atom interpretation (all indices transported through `σ`):

* `m_c_p`   ↦ `rowMem`: the boundary point at `p` lies in the selected
  four-row of the boundary point at `c`;
* `eq_c_l_r` ↦ `radiusEq`: the boundary points at `l` and `r` are
  equidistant from the boundary point at `c`;
* `class_p` ↦ `classHit`: the boundary point at `p` lies in the
  distinguished first-apex selected class.

No solver-selected row assignment appears anywhere: every atom value is a
geometric membership or metric equality of the packet's own fields.

This file contains the definitions, the atom-level bridge lemmas, and the
per-family satisfaction predicates only.  It proves no satisfaction
statement, replays no UNSAT certificate, and closes no production `sorry`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Every boundary point of an exact-two core lies in the carrier. -/
theorem boundary_mem_carrier (Q : ExactTwoBoundaryCore R distribution)
    (i : Label) : Q.boundary i ∈ D.A := by
  rw [← Q.boundary_image]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

/-- Direct-branch index transport: CNF index `i` is boundary position `i`. -/
def directIndex : Label → Label := id

/-- Mirror-branch index transport `ρ(i) = -i mod 11`: fixes the first apex
and reverses the boundary cycle. -/
def mirrorIndex : Label → Label := fun i => -i

@[simp] theorem directIndex_apply (i : Label) : directIndex i = i := rfl

@[simp] theorem mirrorIndex_zero : mirrorIndex 0 = 0 := by decide

theorem mirrorIndex_injective : Function.Injective mirrorIndex :=
  fun _ _ h => neg_injective h

@[simp] theorem mirrorIndex_mirrorIndex (i : Label) :
    mirrorIndex (mirrorIndex i) = i := neg_neg i

/- ## Dense-atom interpretation -/

/-- Interpretation of the dense atom `m_c_p`: the boundary point at
transported index `p` lies in the selected four-row of the boundary point
at transported index `c`. -/
def rowMem (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (c p : Label) : Prop :=
  Q.boundary (σ p) ∈
    (Q.carrierPattern.classAt (Q.boundary (σ c))
      (boundary_mem_carrier Q (σ c))).support

/-- Interpretation of the dense atom `eq_c_l_r`: the boundary points at
transported indices `l` and `r` are equidistant from the boundary point at
transported index `c`. -/
def radiusEq (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (c l r : Label) : Prop :=
  dist (Q.boundary (σ c)) (Q.boundary (σ l)) =
    dist (Q.boundary (σ c)) (Q.boundary (σ r))

/-- Interpretation of the dense atom `class_p`: the boundary point at
transported index `p` lies in the distinguished first-apex selected
class. -/
def classHit (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (p : Label) : Prop :=
  Q.boundary (σ p) ∈ SelectedClass D.A S.oppApex1 radius

/-- The stored dense `eq` atom is unordered: swapping the two compared
points is the symmetry of real equality. -/
theorem radiusEq_comm (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (c l r : Label) :
    radiusEq Q σ c l r ↔ radiusEq Q σ c r l :=
  eq_comm

/-- The `m` atom interpretation is exactly the Boolean `patternCode` of the
transported boundary, so every Kalmanson schema consumer applies without
translation. -/
theorem rowMem_iff_patternCode (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (c p : Label) :
    rowMem Q σ c p ↔
      patternCode (fun i => Q.boundary (σ i))
        (fun i => boundary_mem_carrier Q (σ i)) Q.carrierPattern c p =
        true := by
  unfold rowMem
  exact (patternCode_eq_true_iff (fun i => Q.boundary (σ i))
    (fun i => boundary_mem_carrier Q (σ i)) Q.carrierPattern c p).symm

/-- The `class` atom interpretation, unfolded to its defining metric
equality; carrier membership is automatic. -/
theorem classHit_iff_dist (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (p : Label) :
    classHit Q σ p ↔ dist S.oppApex1 (Q.boundary (σ p)) = radius := by
  unfold classHit
  rw [mem_selectedClass]
  exact and_iff_right (boundary_mem_carrier Q (σ p))

/- ## Fixed CNF cap layout

The encoder's p5 `(5,5,4)` aligned layout (`exact_four_outer.py`,
`opp1_card = 5`): first apex `0`, second apex `4`, surplus vertex `8`;
`closed_caps` insertion order fixes cap index `0/1/2` =
surplus/first-opposite/second-opposite.  These are CNF index sets: on the
mirror branch the same CNF sets are evaluated at reflected boundary
positions through `mirrorIndex`. -/

/-- CNF positions of the three closed caps. -/
def cnfCapPositions : Fin 3 → Finset Label
  | 0 => {0, 1, 2, 3, 4}
  | 1 => {4, 5, 6, 7, 8}
  | 2 => {8, 9, 10, 0}

/-- CNF endpoint centers of the three closed caps. -/
def cnfCapEndpoints : Fin 3 → Finset Label
  | 0 => {0, 4}
  | 1 => {4, 8}
  | 2 => {8, 0}

/-- CNF positions of the strict first-opposite interior. -/
def cnfStrictFirstOpposite : Finset Label := {5, 6, 7}

/- ## Per-family satisfaction predicates

One predicate per retained family of the selected p5 formula, named after
the family and quantified over the family's full emittable instance set
(families 17 and 18 over the retained schema/orientation set).  Every
authenticated retained clause is an instance of exactly one predicate. -/

/-- Family `radius_partition_transitivity`: per center, radius equality is
transitive.  With `radiusEq_comm` this subsumes all three emitted clause
directions per target triple. -/
def RadiusPartitionTransitivitySat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Prop :=
  ∀ c x y z : Label,
    radiusEq Q σ c x y → radiusEq Q σ c y z → radiusEq Q σ c x z

/-- Family `row_at_least_4`: every 7-subset of the ten non-center CNF
indices meets the selected row of the center. -/
def RowAtLeastFourSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Prop :=
  ∀ c : Label, ∀ T : Finset Label, c ∉ T → T.card = 7 →
    ∃ p ∈ T, rowMem Q σ c p

/-- Family `selected_row_subset_radius_class`: two members of one selected
row are equidistant from its center. -/
def SelectedRowSubsetRadiusClassSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ c l r : Label, rowMem Q σ c l → rowMem Q σ c r → radiusEq Q σ c l r

/-- Family `mutual_triangle_cross_center_radius_transport`: mutual row
membership of `a` and `mid` with a common `bc` transports the two radii to
one equality at `bc`. -/
def MutualTriangleCrossCenterRadiusTransportSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ a mid bc : Label,
    rowMem Q σ a mid → rowMem Q σ a bc →
    rowMem Q σ mid a → rowMem Q σ mid bc →
    radiusEq Q σ bc a mid

/-- Family `full_class_cyclic_alternation`: two centers cannot share an
equidistant pair when the pair does not linearly alternate with the
centers (the four non-alternating index arrangements). -/
def FullClassCyclicAlternationSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ l r p q : Label, l < r → p < q →
    p ≠ l → p ≠ r → q ≠ l → q ≠ r →
    ((l < p ∧ p < r) ↔ (l < q ∧ q < r)) →
    ¬(radiusEq Q σ l p q ∧ radiusEq Q σ r p q)

/-- Family `first_apex_not_in_own_class`: the first apex is not in its own
selected class. -/
def FirstApexNotInOwnClassSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Prop :=
  ¬classHit Q σ 0

/-- Family `first_apex_row_eq_class`: at every non-apex CNF index, first
apex row membership coincides with distinguished class membership.  The
two `point = 0` emitter instances use the non-retained diagonal atom
`m_0_0` and are outside the dense variable set, hence outside every
retained clause. -/
def FirstApexRowEqClassSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Prop :=
  ∀ p : Label, p ≠ 0 → (rowMem Q σ 0 p ↔ classHit Q σ p)

/-- Family `exact_two_strict_hits_at_least_2`: of the three strict
first-opposite CNF positions, every pair contains a class hit. -/
def ExactTwoStrictHitsAtLeastTwoSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ i ∈ cnfStrictFirstOpposite, ∀ j ∈ cnfStrictFirstOpposite,
    i ≠ j → (classHit Q σ i ∨ classHit Q σ j)

/-- Family `exact_two_left_adjacent_hit_at_least_1`: the surplus closed cap
(the encoder's LEFT adjacent cap, CNF positions `{0,…,4}`) contains a
class hit.  The Lean-side distribution field with this content is the
CROSSED-named `right_adjacent_hit_eq_one`. -/
def ExactTwoLeftAdjacentHitAtLeastOneSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∃ p ∈ cnfCapPositions 0, classHit Q σ p

/-- Family `exact_two_right_adjacent_hit_at_least_1`: the second-opposite
closed cap (the encoder's RIGHT adjacent cap, CNF positions `{8,9,10,0}`)
contains a class hit.  The Lean-side distribution field with this content
is the CROSSED-named `left_adjacent_hit_eq_one`. -/
def ExactTwoRightAdjacentHitAtLeastOneSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∃ p ∈ cnfCapPositions 2, classHit Q σ p

/-- Families `selected_row_endpoint_own_cap_at_most_one_{0,1,2}`: the
selected row of a cap endpoint center contains at most one other position
of its own closed cap. -/
def SelectedRowEndpointOwnCapAtMostOneSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (k : Fin 3) : Prop :=
  ∀ c ∈ cnfCapEndpoints k, ∀ p ∈ cnfCapPositions k,
    ∀ q ∈ cnfCapPositions k,
    p ≠ c → q ≠ c → p ≠ q →
      ¬(rowMem Q σ c p ∧ rowMem Q σ c q)

/-- Families `selected_row_own_cap_at_most_two_{0,1,2}`: the selected row
of any cap-position center contains at most two other positions of its own
closed cap. -/
def SelectedRowOwnCapAtMostTwoSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (k : Fin 3) : Prop :=
  ∀ c ∈ cnfCapPositions k, ∀ p₁ ∈ cnfCapPositions k,
    ∀ p₂ ∈ cnfCapPositions k, ∀ p₃ ∈ cnfCapPositions k,
    p₁ ≠ c → p₂ ≠ c → p₃ ≠ c → p₁ ≠ p₂ → p₁ ≠ p₃ → p₂ ≠ p₃ →
      ¬(rowMem Q σ c p₁ ∧ rowMem Q σ c p₂ ∧ rowMem Q σ c p₃)

/- ## Kalmanson cut families -/

/-- One Kalmanson row-instance CNF cut is satisfied: not every membership
literal of the embedded schema instance is true. -/
def kalmansonCutSat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (targets : List Label)
    (schema : List Membership) : Prop :=
  ¬ ∀ membership ∈ schema,
      rowMem Q σ (rolePoint targets membership.1)
        (rolePoint targets membership.2)

/-- Every strictly increasing embedding of a role tuple satisfies the
schema's cut. -/
def kalmansonFamilySat (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (roleCount : Nat)
    (schema : List Membership) : Prop :=
  ∀ targets : List Label, targets.length = roleCount →
    targets.IsChain (· < ·) → kalmansonCutSat Q σ targets schema

/-- Cut satisfaction is the falsity of the corresponding Boolean
`schemaAt` occurrence over the transported `patternCode`. -/
theorem kalmansonCutSat_iff_not_schemaAt
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (targets : List Label) (schema : List Membership) :
    kalmansonCutSat Q σ targets schema ↔
      ¬(schemaAt
          (patternCode (fun i => Q.boundary (σ i))
            (fun i => boundary_mem_carrier Q (σ i)) Q.carrierPattern)
          targets schema = true) := by
  unfold kalmansonCutSat rowMem
  simp only [schemaAt, List.all_eq_true, patternCode_eq_true_iff]

/-- The four seeded-cut schema instances (`run_seeded_full_linear_cegar.py`
seed records), each in its forward and ordinary linearly reflected
orientation, with their role counts. -/
def seededCutSchemas : List (Nat × List Membership) :=
  [(8, p4FourEndpointK2Schema),
    (8, reflectSchema 8 p4FourEndpointK2Schema),
    (6, p5TwoK1TwoK2Schema),
    (6, reflectSchema 6 p5TwoK1TwoK2Schema),
    (6, p5TriangleASchema),
    (6, reflectSchema 6 p5TriangleASchema),
    (6, p5TriangleBSchema),
    (6, reflectSchema 6 p5TriangleBSchema)]

/-- Family `seeded_full_linear_kalmanson_cut`: every increasing embedding
of every seeded schema instance, in both emitted orientations, is cut. -/
def SeededFullLinearKalmansonCutSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ entry ∈ seededCutSchemas, kalmansonFamilySat Q σ entry.1 entry.2

/-- The 18 kernel-only-bank schema/orientation instances retained by the
reduced p5 core (normalized and reflected for schemas 0,1,2,3,4,6,7,9;
reflected only for schemas 5 and 8), with their role counts. -/
def retainedBankSchemas : List (Nat × List Membership) :=
  [(6, schema0), (6, reflectSchema 6 schema0),
    (6, schema1), (6, reflectSchema 6 schema1),
    (4, schema2), (4, reflectSchema 4 schema2),
    (6, schema3), (6, reflectSchema 6 schema3),
    (5, schema4), (5, reflectSchema 5 schema4),
    (5, reflectSchema 5 schema5),
    (6, schema6), (6, reflectSchema 6 schema6),
    (7, schema7), (7, reflectSchema 7 schema7),
    (8, reflectSchema 8 schema8),
    (6, schema9), (6, reflectSchema 6 schema9)]

/-- Family `verified_kalmanson_order_schema_cut`, quantified over the
RETAINED schema/orientation set only: every increasing embedding of every
retained kernel-only-bank instance is cut.  Non-retained orientations are
absent from the reduced core and are never needed by composition. -/
def VerifiedKalmansonOrderSchemaCutSat
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) : Prop :=
  ∀ entry ∈ retainedBankSchemas, kalmansonFamilySat Q σ entry.1 entry.2

/- ## Aggregate satisfaction target -/

/-- Full dense-formula satisfaction: one field per retained family of the
selected p5 formula, each quantified over the family's full emittable
instance set (families `seeded_full_linear_kalmanson_cut` and
`verified_kalmanson_order_schema_cut` over the retained schema/orientation
set).  A record of this structure together with the authenticated trimmed
occurrence map yields a satisfying assignment of every trimmed CNF
clause. -/
structure DenseFamilySatisfaction
    (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Prop where
  radius_partition_transitivity : RadiusPartitionTransitivitySat Q σ
  row_at_least_4 : RowAtLeastFourSat Q σ
  selected_row_subset_radius_class : SelectedRowSubsetRadiusClassSat Q σ
  mutual_triangle_cross_center_radius_transport :
    MutualTriangleCrossCenterRadiusTransportSat Q σ
  full_class_cyclic_alternation : FullClassCyclicAlternationSat Q σ
  first_apex_not_in_own_class : FirstApexNotInOwnClassSat Q σ
  first_apex_row_eq_class : FirstApexRowEqClassSat Q σ
  exact_two_strict_hits_at_least_2 : ExactTwoStrictHitsAtLeastTwoSat Q σ
  exact_two_left_adjacent_hit_at_least_1 :
    ExactTwoLeftAdjacentHitAtLeastOneSat Q σ
  exact_two_right_adjacent_hit_at_least_1 :
    ExactTwoRightAdjacentHitAtLeastOneSat Q σ
  selected_row_endpoint_own_cap_at_most_one :
    ∀ k : Fin 3, SelectedRowEndpointOwnCapAtMostOneSat Q σ k
  selected_row_own_cap_at_most_two :
    ∀ k : Fin 3, SelectedRowOwnCapAtMostTwoSat Q σ k
  seeded_full_linear_kalmanson_cut : SeededFullLinearKalmansonCutSat Q σ
  verified_kalmanson_order_schema_cut :
    VerifiedKalmansonOrderSchemaCutSat Q σ

/-- Direct-branch satisfaction target. -/
abbrev DirectSatisfaction (Q : ExactTwoBoundaryCore R distribution) : Prop :=
  DenseFamilySatisfaction Q directIndex

/-- Mirror-branch satisfaction target: every CNF index is evaluated at the
reflected boundary position `ρ(i) = -i`. -/
abbrev MirrorSatisfaction (Q : ExactTwoBoundaryCore R distribution) : Prop :=
  DenseFamilySatisfaction Q mirrorIndex

end P5IndexedSourceScratch
end Problem97

#print axioms Problem97.P5IndexedSourceScratch.rowMem_iff_patternCode
#print axioms Problem97.P5IndexedSourceScratch.classHit_iff_dist
#print axioms Problem97.P5IndexedSourceScratch.kalmansonCutSat_iff_not_schemaAt
