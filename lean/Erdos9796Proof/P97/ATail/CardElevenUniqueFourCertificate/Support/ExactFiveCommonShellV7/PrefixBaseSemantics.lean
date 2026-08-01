/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.PrefixSemanticCore
import Erdos9796Proof.P97.Census554.CoverIndexBridge

/-!
# Census554 base-prefix semantics for the exact-five V7 packet

This file authenticates the inherited Census554 base block against the live
selected cube.  It deliberately proves the family-generic statement for all
`207969` base clauses; a retained-core consumer may restrict it to the
`29295` occurrences named by the external core map.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge

/-- The one-based DIMACS valuation extending the selected cube through all
Sinz auxiliary variables in the inherited Census554 base encoding. -/
noncomputable def CanonicalPacket.baseValuation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : Nat → Bool :=
  finalAssign P.baseIndex

/-- Every selected row variable is true in the packet's base valuation. -/
theorem CanonicalPacket.baseValuation_chosen
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    {p : Nat} (hp : p < 11) :
    P.baseValuation (xVar p (P.baseIndex p)) = true := by
  exact finalAssign_coverIndex_chosen_of_cubeOk hP hp

/-- On a valid candidate variable, the packet valuation is true exactly for
the candidate selected by the live cube. -/
theorem CanonicalPacket.baseValuation_x_iff
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    {p i : Nat} (hp : p < 11) (hi : i < candCount p) :
    P.baseValuation (xVar p i) = true ↔ i = P.baseIndex p := by
  rw [CanonicalPacket.baseValuation, finalAssign_x P.baseIndex hp hi]
  exact baseAssign_iff P.baseIndex
    (fun q hq => coverIndex_lt_of_cubeOk hP hq) hp hi

/-- The live selected cube satisfies every inherited Census554 base DIMACS
clause, hence in particular all `29295` retained base occurrences. -/
theorem CanonicalPacket.baseDimacs_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube) :
    ∀ c ∈ baseDimacs, evalClauseD P.baseValuation c = true := by
  exact finalAssign_coverIndex_baseDimacs_sat_of_cubeOk hP

/-- Zero-based `Std.Sat.CNF` form of `CanonicalPacket.baseDimacs_sat`. -/
theorem CanonicalPacket.baseCnf_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube) :
    Std.Sat.CNF.eval (fun n => P.baseValuation (n + 1)) baseCnf = true := by
  exact finalAssign_coverIndex_baseCnf_sat_of_cubeOk hP

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.baseDimacs_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.baseCnf_sat
