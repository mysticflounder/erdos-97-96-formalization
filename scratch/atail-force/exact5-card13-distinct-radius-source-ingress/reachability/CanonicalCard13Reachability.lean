/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Fin13StaticReachability
import DirectFlatSourceIngress
import GlobalMinimalityConnectivityAudit

/-!
# Canonical card-13 selected rows supply all three reachability packets

This file transports the existing minimality/`ReflTransGen` theorem through
the actual asymmetric canonical frame and its `m`, `g0`, and `g1` semantic row
families.  It constructs three recurrence packets but deliberately does not
flatten their 1,092 assertion instances.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCard13DistinctRadiusSourceIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Choose the unique canonical label of a carrier point.  The fallback branch
is irrelevant on carrier points but makes the function total on the plane. -/
def canonicalIndexOf
    {A : Finset ℝ²} (point : Label → ℝ²)
    (himage : Finset.univ.image point = A) (x : ℝ²) : Label :=
  if hx : x ∈ A then
    Classical.choose (Finset.mem_image.mp (himage ▸ hx))
  else
    0

theorem point_canonicalIndexOf_of_mem
    {A : Finset ℝ²} (point : Label → ℝ²)
    (himage : Finset.univ.image point = A) {x : ℝ²} (hx : x ∈ A) :
    point (canonicalIndexOf point himage x) = x := by
  simp only [canonicalIndexOf, dif_pos hx]
  exact (Classical.choose_spec (Finset.mem_image.mp (himage ▸ hx))).2

theorem canonicalIndexOf_point
    {A : Finset ℝ²} (point : Label → ℝ²)
    (hinjective : Function.Injective point)
    (himage : Finset.univ.image point = A) (i : Label) :
    canonicalIndexOf point himage (point i) = i := by
  apply hinjective
  apply point_canonicalIndexOf_of_mem point himage
  rw [← himage]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

/-- Transport a selected class along equality of its center. -/
def transportSelectedClass
    {A : Finset ℝ²} {center target : ℝ²}
    (K : SelectedFourClass A center) (hcenter : center = target) :
    SelectedFourClass A target :=
  hcenter ▸ K

@[simp] theorem transportSelectedClass_support
    {A : Finset ℝ²} {center target : ℝ²}
    (K : SelectedFourClass A center) (hcenter : center = target) :
    (transportSelectedClass K hcenter).support = K.support := by
  subst target
  rfl

/-- Turn a canonical all-center selected-row family into the physical faithful
pattern consumed by the existing minimality connectivity theorem. -/
def faithfulPatternOfCanonicalRows
    {D : CounterexampleData}
    (point : Label → ℝ²) (himage : Finset.univ.image point = D.A)
    (row : ∀ center : Label, SelectedFourClass D.A (point center)) :
    FaithfulCarrierPattern D.A := by
  let indexOf : ℝ² → Label := canonicalIndexOf point himage
  let classAt : ∀ center : ℝ², center ∈ D.A →
      SelectedFourClass D.A center := fun center hcenter =>
    transportSelectedClass (row (indexOf center))
      (point_canonicalIndexOf_of_mem point himage hcenter)
  have hzero : point 0 ∈ D.A := by
    rw [← himage]
    exact Finset.mem_image.mpr ⟨0, Finset.mem_univ _, rfl⟩
  let gaugeWitness : ℝ² :=
    Classical.choose (classAt (point 0) hzero).support_nonempty
  have hgaugeWitness :
      gaugeWitness ∈ (classAt (point 0) hzero).support :=
    Classical.choose_spec (classAt (point 0) hzero).support_nonempty
  exact {
    gaugeCenter := point 0
    gaugeCenter_mem := hzero
    classAt := classAt
    gaugeWitness := gaugeWitness
    gaugeWitness_mem := hgaugeWitness
  }

theorem faithfulPatternOfCanonicalRows_classAt_support
    {D : CounterexampleData}
    (point : Label → ℝ²) (hinjective : Function.Injective point)
    (himage : Finset.univ.image point = D.A)
    (row : ∀ center : Label, SelectedFourClass D.A (point center))
    (center : Label) :
    ((faithfulPatternOfCanonicalRows point himage row).classAt
      (point center) (by
        rw [← himage]
        exact Finset.mem_image.mpr ⟨center, Finset.mem_univ _, rfl⟩)).support =
      (row center).support := by
  change (transportSelectedClass
      (row (canonicalIndexOf point himage (point center))) _).support =
    (row center).support
  rw [transportSelectedClass_support,
    canonicalIndexOf_point point hinjective himage]

/-- Pull the existing physical selected-witness reachability theorem back
through a bijective canonical card-13 frame. -/
theorem canonicalSelectedRows_reflTransGen
    {D : CounterexampleData} (hmin : D.Minimal)
    (point : Label → ℝ²) (hinjective : Function.Injective point)
    (himage : Finset.univ.image point = D.A)
    (row : ∀ center : Label, SelectedFourClass D.A (point center))
    (source target : Label) :
    Relation.ReflTransGen
      (fun center next => point next ∈ (row center).support) source target := by
  let pattern := faithfulPatternOfCanonicalRows point himage row
  have hpointMem : ∀ i : Label, point i ∈ D.A := by
    intro i
    rw [← himage]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  have hphysical :=
    GlobalMinimalityConnectivityAudit.selectedWitnessEdge_reflTransGen
      hmin pattern (hpointMem source) (hpointMem target)
  have hpull : Relation.ReflTransGen
      (fun center next => point next ∈ (row center).support)
      (canonicalIndexOf point himage (point source))
      (canonicalIndexOf point himage (point target)) :=
    hphysical.lift (canonicalIndexOf point himage) (by
      intro physicalCenter physicalTarget hedge
      rcases hedge with ⟨hcenter, htarget⟩
      have htargetA : physicalTarget ∈ D.A :=
        (pattern.classAt physicalCenter hcenter).support_subset_A htarget
      have hclassSupport :
          (pattern.classAt physicalCenter hcenter).support =
            (row (canonicalIndexOf point himage physicalCenter)).support := by
        change (transportSelectedClass
          (row (canonicalIndexOf point himage physicalCenter)) _).support = _
        exact transportSelectedClass_support _ _
      rw [hclassSupport] at htarget
      rw [point_canonicalIndexOf_of_mem point himage htargetA]
      exact htarget)
  simpa only [canonicalIndexOf_point point hinjective himage] using hpull

/-- The actual semantic selected class behind one of the three direct-source
families. -/
def directSemanticClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (family : Fin 3) (center : Label) :
    SelectedFourClass D.A (P.point center) :=
  if family = 0 then T.main center
  else if family = 1 then C.left center
  else C.right center

@[simp] theorem directSourceRowMember_eq_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (family : Fin 3)
    (center point : Label) :
    directSourceRowMember C family center point =
      decide (P.point point ∈ (directSemanticClass C family center).support) := by
  by_cases hzero : family = 0
  · simp [directSourceRowMember, directSemanticClass, hzero]
  by_cases hone : family = 1
  · simp [directSourceRowMember, directSemanticClass, hone]
  · simp [directSourceRowMember, directSemanticClass, hzero, hone]

/-- Minimality supplies strong connectivity for each actual direct-source row
family, with no relationship assumed between the three row choices. -/
theorem directSourceRowMember_reflTransGen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (hmin : D.Minimal) (C : CanonicalCoverFamilies T)
    (family : Fin 3) (source target : Label) :
    Relation.ReflTransGen
      (fun center point => directSourceRowMember C family center point = true)
      source target := by
  have hindexed := canonicalSelectedRows_reflTransGen hmin P.point
    P.point_injective P.point_image (directSemanticClass C family) source target
  exact hindexed.mono fun center point hpoint => by
    simpa only [directSourceRowMember_eq_selectedClass, decide_eq_true_eq] using hpoint

/-- All three recurrence packets required by one asymmetric direct-source
surface. -/
structure CanonicalThreeFamilyReachabilityPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) : Type where
  main : Fin13StaticReachabilityPacket (directSourceRowMember C 0)
  coverLeft : Fin13StaticReachabilityPacket (directSourceRowMember C 1)
  coverRight : Fin13StaticReachabilityPacket (directSourceRowMember C 2)

/-- Construct the unflattened `m`/`g0`/`g1` recurrence ingress. -/
def canonicalThreeFamilyReachabilityPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (hmin : D.Minimal) (C : CanonicalCoverFamilies T) :
    CanonicalThreeFamilyReachabilityPacket C := {
  main := fin13StaticReachabilityPacketOfSelectedRows _
    (directSourceRowMember_reflTransGen hmin C 0)
  coverLeft := fin13StaticReachabilityPacketOfSelectedRows _
    (directSourceRowMember_reflTransGen hmin C 1)
  coverRight := fin13StaticReachabilityPacketOfSelectedRows _
    (directSourceRowMember_reflTransGen hmin C 2)
}

theorem nonempty_canonicalThreeFamilyReachabilityPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (hmin : D.Minimal) (C : CanonicalCoverFamilies T) :
    Nonempty (CanonicalThreeFamilyReachabilityPacket C) :=
  ⟨canonicalThreeFamilyReachabilityPacket hmin C⟩

#print axioms canonicalSelectedRows_reflTransGen
#print axioms directSourceRowMember_reflTransGen
#print axioms canonicalThreeFamilyReachabilityPacket
#print axioms nonempty_canonicalThreeFamilyReachabilityPacket

end

end ExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
