/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedStrictInteriorParentNormalForm

/-!
# arm2 SI1 collision kill — card≥5 first-apex branch (residual isolation)

Scratch analysis file (session fd7b0078, 2026-07-19).  Target:
`RetainedInteriorBlockerCollision R → False` in the card≥5 first-apex branch
(SelectedClass D.A oppApex1 radius has card ≥ 5), the bellwether SI1 case of
`FrontierCoupledStrictInteriorNormalForm R → False` (arm2).

Regime guard (card-agnostic exact-seven, cap.card = 7 ⟹ |A| ≥ 12; interior 5
is tight).  NO fixed |A|, NO (5,5,4), NO Census-554.

## What is PROVEN here (sorry-free, `Card5CollisionExtract`)

Everything the LOCAL winding / cap-localization machinery yields, extracted
into one explicit record via the already-landed 0-sorry lemmas of
`RetainedStrictInteriorPairSelector`:

* the shared collision blocker `bc = centerAt source₁` is itself a strict
  interior point of the SAME first opposite cap as the two sources
  (`RetainedInteriorBlockerCollision.blocker_mem_capInterior`, which invokes
  `commonFirstApexPair_center_mem_firstCapInterior`);
* the sources are co-radial from the first apex `oppApex1` and co-radial from
  `bc`;
* the exact critical shell of `source₁` meets the first cap in exactly the two
  sources, so its two OTHER members form an *outside pair* `{a,b}` of the first
  cap, both co-radial from `bc` at the shell radius
  (`RetainedInteriorBlockerCollision.shell_inter_cap_eq_sources`);
* the first opposite cap has card ≥ 5
  (`RetainedInteriorBlockerCollision.firstCap_card_ge_five`).

## The residual (open) and WHY the local machinery stops here

The only 0-sorry closing engine for a co-radial outside pair is
`outsidePair_unique_capCenter` (`CapSelectedRowCounting`): an outside pair of a
convex cap co-radial from TWO DISTINCT members of that cap is impossible.  The
collision supplies ONE such member of the first cap (the blocker `bc`); the
apex `oppApex1 = oppositeVertexByIndex oppIndex1` is co-radial from the sources
but is NOT a member of the first cap (it is the OPPOSITE apex — it is a member
of every cap EXCEPT the first).  So the engine has no second first-cap center
and does not fire.  The `false_of_transitionReverseOutsidePair_coRadial_firstApex`
terminal is exactly this engine used on the SECOND cap, where `oppApex1` IS the
left outer vertex; that setup does not transport to the first-cap collision.

This is not a Lean-plumbing gap: the full local system is SATISFIABLE in strict
convex position (exact-rational 13-point witness,
`scratch/atail-arm2-analysis/fixed_order_convex.py`, all 14 checks pass — the
sources and blocker realise the straddle order `(cL, s1, bc, s2, cR)` inside one
cap, so the winding "opposite strict sides of line(oppApex1, bc)" conclusion is
CONSISTENT, not contradictory).  Hence `D.convex` provably cannot close the
branch; the missing input is genuinely global — the `D.K4` incidence forced on
the freely-placed shell/frontier members, the irreducible (Q)-flavoured core.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailArm2SI1CollisionResidual

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : FrontierCommonDeletionParentResidual F}

/-- Maximal local extract of a strict-interior blocker collision.  All fields
are unconditional consequences of the collision (no frontier-class cardinality
hypothesis is needed for the extraction itself). -/
structure Card5CollisionExtract (P : RetainedInteriorBlockerCollision R) : Prop where
  /-- The shared blocker lies in the same first opposite-cap strict interior. -/
  blocker_mem_capInterior :
    H.centerAt P.source₁ P.source₁_mem_A ∈ S.capInteriorByIndex S.oppIndex1
  /-- Both sources are co-radial from the robust first apex. -/
  sources_coRadial_firstApex :
    dist S.oppApex1 P.source₁ = dist S.oppApex1 P.source₂
  /-- Both sources are co-radial from the shared blocker. -/
  sources_coRadial_blocker :
    dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₁ =
      dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₂
  /-- The first opposite cap is automatically large. -/
  cap_card_ge_five : 5 ≤ (S.capByIndex S.oppIndex1).card
  /-- The two OTHER shell members are a genuine outside pair of the first cap,
  both co-radial from the blocker at the common shell radius. -/
  outsidePair_exists :
    ∃ a b : ℝ², a ≠ b ∧ a ∈ D.A ∧ b ∈ D.A ∧
      a ∉ S.capByIndex S.oppIndex1 ∧ b ∉ S.capByIndex S.oppIndex1 ∧
      dist (H.centerAt P.source₁ P.source₁_mem_A) a =
        dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₁ ∧
      dist (H.centerAt P.source₁ P.source₁_mem_A) b =
        dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₁

/-- Every strict-interior blocker collision produces its maximal local extract.
Sorry-free: this is exactly how far the local winding / cap-localization
machinery reaches. -/
theorem card5CollisionExtract_of_collision
    (P : RetainedInteriorBlockerCollision R) :
    Card5CollisionExtract P := by
  classical
  set bc := H.centerAt P.source₁ P.source₁_mem_A with hbcdef
  set shell := (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell
    with hshelldef
  -- blocker localisation and co-radialities (all already proven upstream)
  have hblockerI : bc ∈ S.capInteriorByIndex S.oppIndex1 :=
    P.blocker_mem_capInterior
  have hfirstEq : dist S.oppApex1 P.source₁ = dist S.oppApex1 P.source₂ :=
    (mem_selectedClass.mp P.source₁_mem_radius).2.trans
      (mem_selectedClass.mp P.source₂_mem_radius).2.symm
  have hs1shell : dist bc P.source₁ = shell.radius :=
    shell.support_eq_radius P.source₁ shell.q_mem_support
  have hs2shell : dist bc P.source₂ = shell.radius :=
    shell.support_eq_radius P.source₂ P.source₂_mem_source₁_shell
  have hblockerEq : dist bc P.source₁ = dist bc P.source₂ :=
    hs1shell.trans hs2shell.symm
  -- the outside pair: shell minus first cap = the two non-source members
  have hinter :
      shell.support ∩ S.capByIndex S.oppIndex1 = {P.source₁, P.source₂} :=
    P.shell_inter_cap_eq_sources
  have hsplit :=
    Finset.card_sdiff_add_card_inter shell.support (S.capByIndex S.oppIndex1)
  rw [hinter, shell.support_card] at hsplit
  have hpairCard : ({P.source₁, P.source₂} : Finset ℝ²).card = 2 := by
    simp [P.sources_ne]
  rw [hpairCard] at hsplit
  have houtCard : (shell.support \ S.capByIndex S.oppIndex1).card = 2 := by
    omega
  rw [Finset.card_eq_two] at houtCard
  obtain ⟨a, b, hab, houtEq⟩ := houtCard
  have hmem_out : ∀ z ∈ ({a, b} : Finset ℝ²),
      z ∈ D.A ∧ z ∉ S.capByIndex S.oppIndex1 ∧ dist bc z = shell.radius := by
    intro z hz
    rw [← houtEq] at hz
    rcases Finset.mem_sdiff.mp hz with ⟨hzShell, hzOut⟩
    exact ⟨shell.support_subset_A hzShell, hzOut,
      shell.support_eq_radius z hzShell⟩
  obtain ⟨haA, haOut, haR⟩ := hmem_out a (by simp)
  obtain ⟨hbA, hbOut, hbR⟩ := hmem_out b (by simp)
  refine
    { blocker_mem_capInterior := hblockerI
      sources_coRadial_firstApex := hfirstEq
      sources_coRadial_blocker := hblockerEq
      cap_card_ge_five := P.firstCap_card_ge_five
      outsidePair_exists := ⟨a, b, hab, haA, hbA, haOut, hbOut, ?_, ?_⟩ }
  · rw [haR, ← hs1shell]
  · rw [hbR, ← hs1shell]

/-- **RESIDUAL (open, card≥5 first-apex branch).**

Goal state: `False`, from a strict-interior blocker collision `P` whose robust
first-apex frontier class has card ≥ 5.  The maximal local extract
(`Card5CollisionExtract P`, sorry-free above) is available but does NOT close
it: the collision is realised by an exact-rational strict-convex 13-point
witness, so no consequence of `D.convex` derives `False`.

The one missing geometric fact is global.  The shell outside pair `{a,b}` is
co-radial from the single first-cap center `bc`; the proven closing engine
`outsidePair_unique_capCenter` needs a SECOND first-cap center co-radial from
`{a,b}`, and none is locally forced (the apex `oppApex1` is co-radial from the
sources but is not a first-cap member).  Excluding the straddle configuration
requires the `D.K4` incidence carried by the freely-placed frontier and shell
members — the irreducible (Q) surplus-cap-escape content, not a local lever.

Card=4 sub-branch (separate): robustness then supplies a SECOND ≥4-radius at
`oppApex1`; that sub-branch is likewise convex-realisable per the arm2 analysis
(`ARM2_WALK_UNIFICATION.md`) and is not addressed here. -/
theorem retainedInteriorBlockerCollision_card_ge_five_false
    (P : RetainedInteriorBlockerCollision R)
    (hcard5 : 5 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    False := by
  sorry

-- Axiom audit: the local extract is kernel-clean; the residual carries sorryAx.
#print axioms card5CollisionExtract_of_collision
#print axioms retainedInteriorBlockerCollision_card_ge_five_false

end ATailArm2SI1CollisionResidual
end Problem97
