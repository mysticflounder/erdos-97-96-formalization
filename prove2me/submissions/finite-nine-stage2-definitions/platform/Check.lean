/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_Foundation
import Definitions.Def_Erdos9796Counting_MEC_Basic
import Definitions.Def_Erdos9796Counting_Moser_Triangle
import Definitions.Def_Erdos9796Counting_Moser_TriangleNonObtuse
import Definitions.Def_Erdos9796Counting_Cap_Structure
import Definitions.Def_Erdos9796Counting_Cap_PartitionFromMEC
import Definitions.Def_Erdos9796Counting_CircumscribedMECPacket

/-! Definition-only aliases required by the authenticated `Batch3N9` endpoint source. -/

open scoped EuclideanGeometry

namespace Batch3N9
namespace Problem97

export _root_.Problem97 (CapTriple CircumscribedMECPacket ConvexIndep MoserTriangle)

abbrev HasNEquidistantProperty := _root_.Erdos97.HasNEquidistantProperty

namespace MEC

export _root_.Problem97.MEC (mec NonObtuseCircumscribedMoserTriangle)

end MEC
end Problem97
end Batch3N9
/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/


/-! Definition-only endpoint shell extracted from the authenticated finite-nine source. -/

set_option backward.isDefEq.respectTransparency false
open scoped EuclideanGeometry InnerProductSpace
open Finset

namespace Batch3N9
namespace Problem97

structure FiniteEndpointShell (A : Finset ℝ²) where
  hne : A.Nonempty
  hcard9 : A.card = 9
  hconv : ConvexIndep A
  hK4 : HasNEquidistantProperty 4 A
  hnoncol : ¬ Collinear ℝ (A : Set ℝ²)
  hbd : 3 ≤ (A.filter (fun p =>
    dist p (Problem97.MEC.mec A hne).center =
      (Problem97.MEC.mec A hne).radius)).card
  MT : Problem97.MEC.NonObtuseCircumscribedMoserTriangle A hne hnoncol
  hCirc : ∃ h12 h23 h13,
    MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩
  CP : Problem97.CapTriple A (MT.toMoserTriangle.toStructural hCirc)
  hcapSum12 : CP.C1.card + CP.C2.card + CP.C3.card = 12
  Packet : Problem97.CircumscribedMECPacket A (MT.toMoserTriangle.toStructural hCirc)

namespace FiniteEndpointShell

@[reducible] def triangle {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MoserTriangle A :=
  S.MT.toMoserTriangle.toStructural S.hCirc
@[reducible] def triangle2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MoserTriangle A :=
  { v1 := S.triangle.v2
    v2 := S.triangle.v3
    v3 := S.triangle.v1
    v1_mem := S.triangle.v2_mem
    v2_mem := S.triangle.v3_mem
    v3_mem := S.triangle.v1_mem
    v12_ne := S.triangle.v23_ne
    v13_ne := S.triangle.v12_ne.symm
    v23_ne := S.triangle.v13_ne.symm }
@[reducible] def triangle3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MoserTriangle A :=
  { v1 := S.triangle.v3
    v2 := S.triangle.v1
    v3 := S.triangle.v2
    v1_mem := S.triangle.v3_mem
    v2_mem := S.triangle.v1_mem
    v3_mem := S.triangle.v2_mem
    v12_ne := S.triangle.v13_ne.symm
    v13_ne := S.triangle.v23_ne.symm
    v23_ne := S.triangle.v12_ne }
@[reducible] def packet2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CircumscribedMECPacket A S.triangle2 :=
  { center := S.Packet.center
    radius := S.Packet.radius
    radius_pos := S.Packet.radius_pos
    moser_on_boundary_1 := S.Packet.moser_on_boundary_2
    moser_on_boundary_2 := S.Packet.moser_on_boundary_3
    moser_on_boundary_3 := S.Packet.moser_on_boundary_1
    inner_at_v1 := S.Packet.inner_at_v2
    inner_at_v2 := S.Packet.inner_at_v3
    inner_at_v3 := S.Packet.inner_at_v1
    disk_contains_A := S.Packet.disk_contains_A }
@[reducible] def packet3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CircumscribedMECPacket A S.triangle3 :=
  { center := S.Packet.center
    radius := S.Packet.radius
    radius_pos := S.Packet.radius_pos
    moser_on_boundary_1 := S.Packet.moser_on_boundary_3
    moser_on_boundary_2 := S.Packet.moser_on_boundary_1
    moser_on_boundary_3 := S.Packet.moser_on_boundary_2
    inner_at_v1 := S.Packet.inner_at_v3
    inner_at_v2 := S.Packet.inner_at_v1
    inner_at_v3 := S.Packet.inner_at_v2
    disk_contains_A := S.Packet.disk_contains_A }
@[reducible] noncomputable def I1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Finset ℝ² :=
  (S.CP.C1.erase S.MT.toMoserTriangle.v2).erase S.MT.toMoserTriangle.v3
@[reducible] noncomputable def I2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Finset ℝ² :=
  (S.CP.C2.erase S.MT.toMoserTriangle.v3).erase S.MT.toMoserTriangle.v1
@[reducible] noncomputable def I3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Finset ℝ² :=
  (S.CP.C3.erase S.MT.toMoserTriangle.v1).erase S.MT.toMoserTriangle.v2

end FiniteEndpointShell
end Problem97
end Batch3N9
/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/


/-! Definition-only N4 witness forms and public exclusion predicates. -/

set_option backward.isDefEq.respectTransparency false
open scoped EuclideanGeometry
open Finset

namespace Batch3N9
namespace Problem97
namespace FiniteEndpointShell

@[reducible] noncomputable def witnessClassAt_v1 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) : Finset ℝ² :=
  A.filter (fun x => dist S.triangle.v1 x = r)
@[reducible] noncomputable def witnessClassAt_v2 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) : Finset ℝ² :=
  A.filter (fun x => dist S.triangle.v2 x = r)
@[reducible] noncomputable def witnessClassAt_v3 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) : Finset ℝ² :=
  A.filter (fun x => dist S.triangle.v3 x = r)

def IsFormA_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x y : ℝ²,
    x ∈ S.I2 ∧
    y ∈ S.I3 ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C2 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C3 = ({y} : Finset ℝ²))
def IsFormB_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x : ℝ²,
    x ∈ S.I2 ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C2 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²))
def IsFormC_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ y : ℝ²,
    y ∈ S.I3 ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²)) ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C3 = ({y} : Finset ℝ²))
def IsFormA_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x y : ℝ²,
    x ∈ S.I3 ∧
    y ∈ S.I1 ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C3 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C1 = ({y} : Finset ℝ²))
def IsFormB_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x : ℝ²,
    x ∈ S.I3 ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C3 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
def IsFormC_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ y : ℝ²,
    y ∈ S.I1 ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)) ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C1 = ({y} : Finset ℝ²))
def IsFormA_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x y : ℝ²,
    x ∈ S.I1 ∧
    y ∈ S.I2 ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C1 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C2 = ({y} : Finset ℝ²))
def IsFormB_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x : ℝ²,
    x ∈ S.I1 ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C1 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²))
def IsFormC_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ y : ℝ²,
    y ∈ S.I2 ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²)) ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C2 = ({y} : Finset ℝ²))

abbrev N4dExcludesFormA_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (_hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormA_v1 r → False

abbrev N4dExcludesFormB_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (_hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormB_v1 r → False

abbrev N4dExcludesFormC_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (_hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormC_v1 r → False

abbrev N4dExcludesFormA_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (_hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormA_v2 r → False

abbrev N4dExcludesFormB_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (_hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormB_v2 r → False

abbrev N4dExcludesFormC_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (_hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormC_v2 r → False

abbrev N4dExcludesFormA_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (_hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormA_v3 r → False

abbrev N4dExcludesFormB_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (_hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormB_v3 r → False

abbrev N4dExcludesFormC_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (_hr : 0 < r) (_hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (_hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormC_v3 r → False

end FiniteEndpointShell
end Problem97
end Batch3N9
/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/


/-! Definition-only final N4/N8 interface used by the nine public child statements. -/

set_option backward.isDefEq.respectTransparency false
open scoped EuclideanGeometry
open Finset

namespace Batch3N9
namespace Problem97
namespace FiniteEndpointShell

def N4eCapContainment {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v1 x = r)).card →
      A.filter (fun x => dist S.triangle.v1 x = r) ⊆ S.CP.C1) ∧
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v2 x = r)).card →
      A.filter (fun x => dist S.triangle.v2 x = r) ⊆ S.CP.C2) ∧
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v3 x = r)).card →
      A.filter (fun x => dist S.triangle.v3 x = r) ⊆ S.CP.C3)

@[reducible] noncomputable def capByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.CP.C1
  | 1 => S.CP.C2
  | _ => S.CP.C3
@[reducible] noncomputable def capInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I1
  | 1 => S.I2
  | _ => S.I3

end FiniteEndpointShell
end Problem97
end Batch3N9
open scoped EuclideanGeometry

#check Batch3N9.Problem97.ConvexIndep
#check Batch3N9.Problem97.HasNEquidistantProperty
#check Batch3N9.Problem97.FiniteEndpointShell
#check Batch3N9.Problem97.FiniteEndpointShell.triangle
#check Batch3N9.Problem97.FiniteEndpointShell.I1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v1
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v2
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v2
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v2
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v3
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v3
#check Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v3
#check Batch3N9.Problem97.FiniteEndpointShell.N4eCapContainment
#check Batch3N9.Problem97.FiniteEndpointShell.capInteriorByIndex

#print axioms Batch3N9.Problem97.FiniteEndpointShell
#print axioms Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v1
#print axioms Batch3N9.Problem97.FiniteEndpointShell.N4eCapContainment
#print axioms Batch3N9.Problem97.FiniteEndpointShell.capInteriorByIndex
