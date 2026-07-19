/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFive
import Erdos9796Proof.P97.SurplusM44Packet.Shard05

/-!
# Unique-five apex versus an alternative short cap

An exact four-cap in any alternative nonobtuse MEC packet forces a
four-point selector class at its opposite apex.  If that apex is the physical
second apex of `LargeCapUniqueFiveSecondApexRadius`, uniqueness identifies the
selector radius with the retained exact-five radius, contradicting the two
class cardinalities.

This terminal requires only one exact four-cap.  It does not require the
alternative packet to have a second four-cap and does not use `noM44`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFiveShortCapTerminal

open ATailLargeCapUniqueFive

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Any same-carrier alternative packet with a short cap opposite the retained
unique-five physical apex is impossible. -/
theorem false_of_shortCap_at_largeCapUniqueFiveApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (T : SurplusCapPacket D.A) (i : Fin 3)
    (hapex : T.oppositeVertexByIndex i = S.oppApex2)
    (hcap : (T.capByIndex i).card = 4) :
    False := by
  rcases T.exists_moserSelectorShapeAt_of_hasNEquidistantProperty
      D.K4 D.convex i hcap with ⟨radius, hradius, hshape⟩
  have hcardFour :
      (SelectedClass D.A S.oppApex2 radius).card = 4 := by
    rw [← hapex]
    exact hshape.1
  have hradiusEq : radius = profile.radius :=
    profile.unique_K4_radius radius hradius (by omega)
  rw [hradiusEq, profile.class_card_eq_five] at hcardFour
  omega

/-- Set-level form exposing the transported row fact before uniqueness closes
it: the new short-cap selector contains both of its strict interior points and
has singleton intersections with the two adjacent caps. -/
theorem exists_shortCap_selectorShape
    {D : CounterexampleData} (T : SurplusCapPacket D.A) (i : Fin 3)
    (hcap : (T.capByIndex i).card = 4) :
    ∃ radius : ℝ, 0 < radius ∧ T.MoserSelectorShapeAt i radius :=
  T.exists_moserSelectorShapeAt_of_hasNEquidistantProperty
    D.K4 D.convex i hcap

#print axioms false_of_shortCap_at_largeCapUniqueFiveApex
#print axioms exists_shortCap_selectorShape

end

end ATailLargeCapUniqueFiveShortCapTerminal
end Problem97
