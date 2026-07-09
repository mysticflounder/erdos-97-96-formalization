/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.MultiCenter.GeneralN

/-!
# Multi-center census: realization-facing finite inventories

This file starts the realization layer that will consume the finite class
alphabet from `GeneralN`.  It does not assert any geometric realization
theorem.  Instead, it provides the reusable interface for turning an actual
realizability predicate on `LocalJointClassCode` into a finite inventory
record, and proves the inventory consequences of one-step persistence.
-/

namespace Problem97
namespace MultiCenter

/-- A predicate saying that a finite local class key is realized at parameter
`n`.  The eventual geometric layer should instantiate this predicate with the
actual tail/census realization condition. -/
abbrev CodeRealizationPredicate :=
  Nat -> LocalJointClassCode -> Prop

/-- The finite inventory cut out by a realization predicate at parameter `n`. -/
noncomputable def inventoryOf (realized : CodeRealizationPredicate)
    (n : Nat) : Finset LocalJointClassCode := by
  classical
  exact (Finset.univ : Finset LocalJointClassCode).filter (realized n)

theorem mem_inventoryOf {realized : CodeRealizationPredicate}
    {n : Nat} {code : LocalJointClassCode} :
    code ∈ inventoryOf realized n ↔ realized n code := by
  classical
  simp [inventoryOf]

/-- One-step persistence of the underlying realization predicate. -/
def PredicateStepPersistent (realized : CodeRealizationPredicate) : Prop :=
  ∀ n code, realized n code -> realized (n + 1) code

/-- Predicate-level form of global-to-local soundness. -/
def PredicateGlobalSubsetsLocal
    (localPred globalPred : CodeRealizationPredicate) : Prop :=
  ∀ n code, globalPred n code -> localPred n code

/-- Predicate-level local-to-global completion above a threshold. -/
def PredicateLocalCompletesGlobalFrom
    (localPred globalPred : CodeRealizationPredicate) (N : Nat) : Prop :=
  ∀ n code, N ≤ n -> localPred n code -> globalPred n code

/-- Predicate-level local-to-global completion at every parameter. -/
def PredicateLocalCompletesGlobal
    (localPred globalPred : CodeRealizationPredicate) : Prop :=
  ∀ n code, localPred n code -> globalPred n code

/-- A realization-facing finite inventory together with its meaning.

This is the shape expected from either a hand-written geometric realization
definition or a certificate import: `inventory n` is the finite set of keys
present at parameter `n`, and `mem_inventory` states exactly which realization
predicate it represents. -/
structure CodeInventory where
  realized : CodeRealizationPredicate
  inventory : Nat -> Finset LocalJointClassCode
  mem_inventory : ∀ n code, code ∈ inventory n ↔ realized n code

namespace CodeInventory

/-- The canonical `CodeInventory` obtained by filtering the finite local-code
alphabet by a realization predicate. -/
noncomputable def ofPredicate (realized : CodeRealizationPredicate) :
    CodeInventory where
  realized := realized
  inventory := inventoryOf realized
  mem_inventory := by
    intro n code
    exact mem_inventoryOf

/-- Predicate-level persistence gives inventory-level persistence. -/
theorem stepPersistent (R : CodeInventory)
    (hstep : PredicateStepPersistent R.realized) :
    StepPersistent R.inventory := by
  intro n code hcode
  rw [R.mem_inventory] at hcode ⊢
  exact hstep n code hcode

/-- A persistent realization inventory is eventually stable. -/
theorem exists_stabilizesAt (R : CodeInventory)
    (hstep : PredicateStepPersistent R.realized) :
    ∃ N, StabilizesAt R.inventory N :=
  exists_stabilizesAt_of_stepPersistent_localJointClassCode
    (R.stepPersistent hstep)

/-- The semantic `JointClass` inventory induced by a code inventory. -/
noncomputable def semanticInventory (R : CodeInventory) : Nat -> Finset JointClass :=
  localJointClassCodeSemanticInventory R.inventory

/-- Predicate-level persistence gives eventual stability of the semantic
`JointClass` inventory as well. -/
theorem exists_stabilizesAt_semanticInventory (R : CodeInventory)
    (hstep : PredicateStepPersistent R.realized) :
    ∃ N, StabilizesAt R.semanticInventory N :=
    exists_stabilizesAt_localJointClassCodeSemanticInventory
      (R.stepPersistent hstep)

/-- Predicate-level global-to-local soundness gives inventory inclusion. -/
theorem globalSubsetsLocal (L G : CodeInventory)
    (h : PredicateGlobalSubsetsLocal L.realized G.realized) :
    GlobalSubsetsLocal L.inventory G.inventory := by
  intro n code hcode
  rw [G.mem_inventory] at hcode
  rw [L.mem_inventory]
  exact h n code hcode

/-- Predicate-level local-to-global completion gives inventory inclusion above
the same threshold. -/
theorem localCompletesGlobalFrom (L G : CodeInventory) {N : Nat}
    (h : PredicateLocalCompletesGlobalFrom L.realized G.realized N) :
    LocalCompletesGlobalFrom L.inventory G.inventory N := by
  intro n hn code hcode
  rw [L.mem_inventory] at hcode
  rw [G.mem_inventory]
  exact h n code hn hcode

/-- All-parameter local-to-global completion specializes to completion above
any threshold. -/
theorem localCompletesGlobalFrom_of_localCompletesGlobal
    (L G : CodeInventory) {N : Nat}
    (h : PredicateLocalCompletesGlobal L.realized G.realized) :
    PredicateLocalCompletesGlobalFrom L.realized G.realized N := by
  intro n code _hn hlocal
  exact h n code hlocal

/-- Predicate-level soundness and completion identify the local and global
inventories above the completion threshold. -/
theorem equalInventoriesFrom_of_predicateCompletion
    (L G : CodeInventory) {N : Nat}
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion : PredicateLocalCompletesGlobalFrom L.realized G.realized N) :
    EqualInventoriesFrom G.inventory L.inventory N :=
  equalInventoriesFrom_of_globalSubsetsLocal_of_completion
    (globalSubsetsLocal L G hglobalLocal)
    (localCompletesGlobalFrom L G hcompletion)

/-- If the local code inventory is stable and the predicates satisfy
global-to-local soundness plus local-to-global completion above `N`, then the
global code inventory is stable from `N`. -/
theorem global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletion
    (L G : CodeInventory) {N : Nat}
    (hlocal : StabilizesAt L.inventory N)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion : PredicateLocalCompletesGlobalFrom L.realized G.realized N) :
    StabilizesAt G.inventory N :=
  global_stabilizesAt_of_local_stabilizesAt_of_completion hlocal
    (globalSubsetsLocal L G hglobalLocal)
    (localCompletesGlobalFrom L G hcompletion)

/-- If local stability and predicate completion begin at different thresholds,
the global code inventory is stable from their maximum. -/
theorem global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom
    (L G : CodeInventory) {localThreshold completionThreshold : Nat}
    (hlocal : StabilizesAt L.inventory localThreshold)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion :
      PredicateLocalCompletesGlobalFrom L.realized G.realized completionThreshold) :
    StabilizesAt G.inventory (max localThreshold completionThreshold) :=
  global_stabilizesAt_of_local_stabilizesAt_of_completionFrom hlocal
    (globalSubsetsLocal L G hglobalLocal)
    (localCompletesGlobalFrom L G hcompletion)

/-- The same completion route locks the semantic `JointClass` projection of
the global inventory. -/
theorem global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletion
    (L G : CodeInventory) {N : Nat}
    (hlocal : StabilizesAt L.inventory N)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion : PredicateLocalCompletesGlobalFrom L.realized G.realized N) :
    StabilizesAt G.semanticInventory N :=
  stabilizesAt_mapInventory LocalJointClassCode.toJointClassEmbedding
    (global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletion
      L G hlocal hglobalLocal hcompletion)

/-- The different-threshold completion route also locks the semantic
`JointClass` projection of the global inventory. -/
theorem global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom
    (L G : CodeInventory) {localThreshold completionThreshold : Nat}
    (hlocal : StabilizesAt L.inventory localThreshold)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion :
      PredicateLocalCompletesGlobalFrom L.realized G.realized completionThreshold) :
    StabilizesAt G.semanticInventory (max localThreshold completionThreshold) :=
  stabilizesAt_mapInventory LocalJointClassCode.toJointClassEmbedding
    (global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom
      L G hlocal hglobalLocal hcompletion)

/-- If the local realization predicate is persistent, every global class is
local, and every local class completes globally, then the global code inventory
is eventually stable. -/
theorem exists_global_stabilizesAt_of_local_stepPersistent_of_predicateCompletion
    (L G : CodeInventory)
    (hstep : PredicateStepPersistent L.realized)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion : PredicateLocalCompletesGlobal L.realized G.realized) :
    ∃ N, StabilizesAt G.inventory N := by
  rcases L.exists_stabilizesAt hstep with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  exact global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletion
    L G hN hglobalLocal
    (localCompletesGlobalFrom_of_localCompletesGlobal L G hcompletion)

/-- Local persistence, global-to-local soundness, and threshold completion
give eventual stability of the global code inventory. -/
theorem exists_global_stabilizesAt_of_local_stepPersistent_of_predicateCompletionFrom
    (L G : CodeInventory) {completionThreshold : Nat}
    (hstep : PredicateStepPersistent L.realized)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion :
      PredicateLocalCompletesGlobalFrom L.realized G.realized completionThreshold) :
    ∃ N, StabilizesAt G.inventory N := by
  rcases L.exists_stabilizesAt hstep with ⟨localThreshold, hlocal⟩
  refine ⟨max localThreshold completionThreshold, ?_⟩
  exact global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom
    L G hlocal hglobalLocal hcompletion

/-- The all-parameter completion route also gives eventual stability of the
semantic global `JointClass` inventory. -/
theorem exists_global_semanticStabilizesAt_of_local_stepPersistent_of_predicateCompletion
    (L G : CodeInventory)
    (hstep : PredicateStepPersistent L.realized)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion : PredicateLocalCompletesGlobal L.realized G.realized) :
    ∃ N, StabilizesAt G.semanticInventory N := by
  rcases L.exists_stabilizesAt hstep with ⟨N, hN⟩
  refine ⟨N, ?_⟩
  exact global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletion
    L G hN hglobalLocal
    (localCompletesGlobalFrom_of_localCompletesGlobal L G hcompletion)

/-- Threshold completion is also enough for eventual stability of the semantic
global `JointClass` inventory. -/
theorem exists_global_semanticStabilizesAt_of_local_stepPersistent_of_predicateCompletionFrom
    (L G : CodeInventory) {completionThreshold : Nat}
    (hstep : PredicateStepPersistent L.realized)
    (hglobalLocal : PredicateGlobalSubsetsLocal L.realized G.realized)
    (hcompletion :
      PredicateLocalCompletesGlobalFrom L.realized G.realized completionThreshold) :
    ∃ N, StabilizesAt G.semanticInventory N := by
  rcases L.exists_stabilizesAt hstep with ⟨localThreshold, hlocal⟩
  refine ⟨max localThreshold completionThreshold, ?_⟩
  exact global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom
    L G hlocal hglobalLocal hcompletion

end CodeInventory

/-- A persistent realization predicate cuts out an eventually stable finite
inventory. -/
theorem exists_stabilizesAt_inventoryOf
    {realized : CodeRealizationPredicate}
    (hstep : PredicateStepPersistent realized) :
    ∃ N, StabilizesAt (inventoryOf realized) N :=
  (CodeInventory.ofPredicate realized).exists_stabilizesAt hstep

/-- A persistent realization predicate also gives eventual stability after
projecting the code inventory to semantic `JointClass` values. -/
theorem exists_stabilizesAt_semanticInventoryOf
    {realized : CodeRealizationPredicate}
    (hstep : PredicateStepPersistent realized) :
    ∃ N, StabilizesAt
      (localJointClassCodeSemanticInventory (inventoryOf realized)) N :=
  (CodeInventory.ofPredicate realized).exists_stabilizesAt_semanticInventory hstep

/-- A profile-level realization surface for the multi-center census.

The fields are intentionally mathematical rather than artifact-specific:
`profileOccursAtN n P` says that profile `P` is available at ambient
cardinality `n`, and `realizesJointClass P C` says that profile `P` globally
realizes the semantic class `C`. -/
structure ProfileRealizationSurface where
  profileOccursAtN : Nat -> JointProfile -> Prop
  realizesJointClass : JointProfile -> JointClass -> Prop

namespace ProfileRealizationSurface

/-- The LOCAL predicate induced by profile occurrence and local admissibility. -/
def localRealized (surface : ProfileRealizationSurface) :
    CodeRealizationPredicate :=
  fun n code =>
    ∃ profile, surface.profileOccursAtN n profile ∧
      code.toJointClass.LocallyAdmissible profile

/-- The GLOBAL predicate induced by profile occurrence and global realization. -/
def globalRealized (surface : ProfileRealizationSurface) :
    CodeRealizationPredicate :=
  fun n code =>
    ∃ profile, surface.profileOccursAtN n profile ∧
      surface.realizesJointClass profile code.toJointClass

/-- The finite LOCAL code inventory of a profile realization surface. -/
noncomputable def localInventory
    (surface : ProfileRealizationSurface) : Nat -> Finset LocalJointClassCode :=
  inventoryOf (localRealized surface)

/-- The finite GLOBAL code inventory of a profile realization surface. -/
noncomputable def globalInventory
    (surface : ProfileRealizationSurface) : Nat -> Finset LocalJointClassCode :=
  inventoryOf (globalRealized surface)

/-- LOCAL code inventory packaged with its realization predicate. -/
noncomputable def localCodeInventory
    (surface : ProfileRealizationSurface) : CodeInventory where
  realized := localRealized surface
  inventory := localInventory surface
  mem_inventory := by
    intro n code
    exact mem_inventoryOf

/-- GLOBAL code inventory packaged with its realization predicate. -/
noncomputable def globalCodeInventory
    (surface : ProfileRealizationSurface) : CodeInventory where
  realized := globalRealized surface
  inventory := globalInventory surface
  mem_inventory := by
    intro n code
    exact mem_inventoryOf

/-- A profile-extension principle sufficient for one-step LOCAL persistence. -/
def ProfileStepExtends (surface : ProfileRealizationSurface) : Prop :=
  ∀ n profile, surface.profileOccursAtN n profile ->
    ∃ next_profile, surface.profileOccursAtN (n + 1) next_profile ∧
      ∀ cls : JointClass,
        cls.LocallyAdmissible profile -> cls.LocallyAdmissible next_profile

/-- Adding one cap label supplies profile extension when the occurrence
predicate is closed under that concrete cap extension. -/
theorem profileStepExtends_of_extendCap
    (surface : ProfileRealizationSurface) (target : JointCap)
    (hoccurs :
      ∀ n profile, surface.profileOccursAtN n profile ->
        surface.profileOccursAtN (n + 1) (profile.extendCap target)) :
    ProfileStepExtends surface := by
  intro n profile hprofile
  refine ⟨profile.extendCap target, hoccurs n profile hprofile, ?_⟩
  intro cls hlocal
  exact JointClass.locallyAdmissible_extendCap target hlocal

/-- GLOBAL realization is sound for LOCAL admissibility. -/
def GlobalSound (surface : ProfileRealizationSurface) : Prop :=
  ∀ {profile cls}, surface.realizesJointClass profile cls ->
    cls.LocallyAdmissible profile

/-- LOCAL classes complete globally above a threshold. -/
def CompletesGlobalFrom (surface : ProfileRealizationSurface)
    (threshold : Nat) : Prop :=
  ∀ {n profile cls}, threshold ≤ n -> surface.profileOccursAtN n profile ->
    cls.LocallyAdmissible profile -> surface.realizesJointClass profile cls

/-- LOCAL classes complete globally at every profile. -/
def CompletesGlobal (surface : ProfileRealizationSurface) : Prop :=
  ∀ {profile cls}, cls.LocallyAdmissible profile ->
    surface.realizesJointClass profile cls

set_option linter.constructorNameAsVariable false in
/-- Profile extension gives one-step persistence of the induced LOCAL
realization predicate. -/
theorem localRealized_stepPersistent {surface : ProfileRealizationSurface}
    (hstep : ProfileStepExtends surface) :
    PredicateStepPersistent (localRealized surface) := by
  intro n code hcode
  rcases hcode with ⟨profile, hprofile, hlocal⟩
  rcases hstep n profile hprofile with
    ⟨next_profile, hnext, hprofile_next⟩
  exact ⟨next_profile, hnext, hprofile_next code.toJointClass hlocal⟩

set_option linter.constructorNameAsVariable false in
/-- The induced LOCAL inventory is one-step persistent. -/
theorem localInventory_stepPersistent {surface : ProfileRealizationSurface}
    (hstep : ProfileStepExtends surface) :
    StepPersistent (localInventory surface) := by
  intro n code hcode
  rw [localInventory, mem_inventoryOf] at hcode ⊢
  exact localRealized_stepPersistent hstep n code hcode

set_option linter.constructorNameAsVariable false in
/-- The induced LOCAL inventory is eventually stable. -/
theorem exists_localInventory_stabilizesAt
    {surface : ProfileRealizationSurface}
    (hstep : ProfileStepExtends surface) :
    ∃ threshold, StabilizesAt (localInventory surface) threshold :=
  exists_stabilizesAt_inventoryOf (localRealized_stepPersistent hstep)

set_option linter.constructorNameAsVariable false in
/-- GLOBAL soundness gives the predicate-level GLOBAL-subset-LOCAL inclusion. -/
theorem predicateGlobalSubsetsLocal_of_globalSound
    {surface : ProfileRealizationSurface} (hsound : GlobalSound surface) :
    PredicateGlobalSubsetsLocal
      (localRealized surface) (globalRealized surface) := by
  intro n code hglobal
  rcases hglobal with ⟨profile, hprofile, hrealized⟩
  exact ⟨profile, hprofile, hsound hrealized⟩

set_option linter.constructorNameAsVariable false in
/-- Threshold completion gives predicate-level LOCAL-to-GLOBAL completion above
the same threshold. -/
theorem predicateLocalCompletesGlobalFrom_of_completion
    {surface : ProfileRealizationSurface} {threshold : Nat}
    (hcompletion : CompletesGlobalFrom surface threshold) :
    PredicateLocalCompletesGlobalFrom
      (localRealized surface) (globalRealized surface) threshold := by
  intro n code hn hlocal
  rcases hlocal with ⟨profile, hprofile, hlocal_profile⟩
  exact ⟨profile, hprofile, hcompletion hn hprofile hlocal_profile⟩

set_option linter.constructorNameAsVariable false in
/-- All-parameter completion gives predicate-level LOCAL-to-GLOBAL completion. -/
theorem predicateLocalCompletesGlobal_of_completion
    {surface : ProfileRealizationSurface}
    (hcompletion : CompletesGlobal surface) :
    PredicateLocalCompletesGlobal
      (localRealized surface) (globalRealized surface) := by
  intro n code hlocal
  rcases hlocal with ⟨profile, hprofile, hlocal_profile⟩
  exact ⟨profile, hprofile, hcompletion hlocal_profile⟩

set_option linter.constructorNameAsVariable false in
/-- Threshold completion plus LOCAL stability locks the packaged GLOBAL code
inventory. -/
theorem globalCodeInventory_stabilizesAt_of_local_stabilizesAt_of_completion
    {surface : ProfileRealizationSurface} {threshold : Nat}
    (hlocal : StabilizesAt (localCodeInventory surface).inventory threshold)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobalFrom surface threshold) :
    StabilizesAt (globalCodeInventory surface).inventory threshold :=
  CodeInventory.global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletion
    (localCodeInventory surface) (globalCodeInventory surface)
    hlocal
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobalFrom_of_completion hcompletion)

set_option linter.constructorNameAsVariable false in
/-- The same threshold completion route locks the semantic GLOBAL inventory. -/
theorem globalSemanticInventory_stabilizesAt_of_local_stabilizesAt_of_completion
    {surface : ProfileRealizationSurface} {threshold : Nat}
    (hlocal : StabilizesAt (localCodeInventory surface).inventory threshold)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobalFrom surface threshold) :
    StabilizesAt (globalCodeInventory surface).semanticInventory threshold :=
  CodeInventory.global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletion
    (localCodeInventory surface) (globalCodeInventory surface)
    hlocal
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobalFrom_of_completion hcompletion)

set_option linter.constructorNameAsVariable false in
/-- Threshold completion plus LOCAL stability locks the packaged GLOBAL code
inventory from the maximum of the two thresholds. -/
theorem globalCodeInventory_stabilizesAt_of_local_stabilizesAt_of_completionFrom
    {surface : ProfileRealizationSurface}
    {localThreshold completionThreshold : Nat}
    (hlocal :
      StabilizesAt (localCodeInventory surface).inventory localThreshold)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobalFrom surface completionThreshold) :
    StabilizesAt (globalCodeInventory surface).inventory
      (max localThreshold completionThreshold) :=
  CodeInventory.global_stabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom
    (localCodeInventory surface) (globalCodeInventory surface)
    hlocal
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobalFrom_of_completion hcompletion)

set_option linter.constructorNameAsVariable false in
/-- The different-threshold completion route also locks the semantic GLOBAL
inventory from the maximum of the two thresholds. -/
theorem globalSemanticInventory_stabilizesAt_of_local_stabilizesAt_of_completionFrom
    {surface : ProfileRealizationSurface}
    {localThreshold completionThreshold : Nat}
    (hlocal :
      StabilizesAt (localCodeInventory surface).inventory localThreshold)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobalFrom surface completionThreshold) :
    StabilizesAt (globalCodeInventory surface).semanticInventory
      (max localThreshold completionThreshold) :=
  CodeInventory.global_semanticStabilizesAt_of_local_stabilizesAt_of_predicateCompletionFrom
    (localCodeInventory surface) (globalCodeInventory surface)
    hlocal
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobalFrom_of_completion hcompletion)

set_option linter.constructorNameAsVariable false in
/-- Local profile extension plus all-parameter completion gives eventual
stability of the packaged GLOBAL code inventory. -/
theorem exists_globalCodeInventory_stabilizesAt_of_local_stepExtends_of_completion
    {surface : ProfileRealizationSurface}
    (hstep : ProfileStepExtends surface)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobal surface) :
    ∃ threshold, StabilizesAt (globalCodeInventory surface).inventory threshold :=
  CodeInventory.exists_global_stabilizesAt_of_local_stepPersistent_of_predicateCompletion
    (localCodeInventory surface) (globalCodeInventory surface)
    (localRealized_stepPersistent hstep)
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobal_of_completion hcompletion)

set_option linter.constructorNameAsVariable false in
/-- Local profile extension plus threshold completion gives eventual stability
of the packaged GLOBAL code inventory. -/
theorem exists_globalCodeInventory_stabilizesAt_of_local_stepExtends_of_completionFrom
    {surface : ProfileRealizationSurface} {completionThreshold : Nat}
    (hstep : ProfileStepExtends surface)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobalFrom surface completionThreshold) :
    ∃ threshold, StabilizesAt (globalCodeInventory surface).inventory threshold :=
  CodeInventory.exists_global_stabilizesAt_of_local_stepPersistent_of_predicateCompletionFrom
    (localCodeInventory surface) (globalCodeInventory surface)
    (localRealized_stepPersistent hstep)
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobalFrom_of_completion hcompletion)

set_option linter.constructorNameAsVariable false in
/-- Local profile extension plus all-parameter completion gives eventual
stability of the semantic GLOBAL inventory. -/
theorem exists_globalSemanticInventory_stabilizesAt_of_local_stepExtends_of_completion
    {surface : ProfileRealizationSurface}
    (hstep : ProfileStepExtends surface)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobal surface) :
    ∃ threshold,
      StabilizesAt (globalCodeInventory surface).semanticInventory threshold :=
  CodeInventory.exists_global_semanticStabilizesAt_of_local_stepPersistent_of_predicateCompletion
    (localCodeInventory surface) (globalCodeInventory surface)
    (localRealized_stepPersistent hstep)
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobal_of_completion hcompletion)

open CodeInventory in
set_option linter.constructorNameAsVariable false in
/-- Local profile extension plus threshold completion gives eventual stability
of the semantic GLOBAL inventory. -/
theorem exists_globalSemanticInventory_stabilizesAt_of_local_stepExtends_of_completionFrom
    {surface : ProfileRealizationSurface} {completionThreshold : Nat}
    (hstep : ProfileStepExtends surface)
    (hsound : GlobalSound surface)
    (hcompletion : CompletesGlobalFrom surface completionThreshold) :
    ∃ threshold,
      StabilizesAt (globalCodeInventory surface).semanticInventory threshold :=
  exists_global_semanticStabilizesAt_of_local_stepPersistent_of_predicateCompletionFrom
    (localCodeInventory surface) (globalCodeInventory surface)
    (localRealized_stepPersistent hstep)
    (predicateGlobalSubsetsLocal_of_globalSound hsound)
    (predicateLocalCompletesGlobalFrom_of_completion hcompletion)

end ProfileRealizationSurface

end MultiCenter
end Problem97
