/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.ErasedClassifierCoverage
import Erdos9796Proof.P97.Census554.CapSelectedNativeClosureSound

/-!
# ERASE native closure soundness

Turns a successful parameterized native replay into the existing
`ClosureCoreAlternative` consumed by the canonical geometric contradiction.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.EqualityCore
open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierSound
open Census554.CapSelectedNativeClosureSound

/-- Soundness of the exact off-circle detector at an arbitrary seed center. -/
theorem exactSeedOffCircleCoreAt_sound
    {P : PatternCode} (centers : List Label) (c₀ : Label)
    (hcore : exactSeedOffCircleCoreAt c₀.val
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P))))
      (rowOfPattern P c₀).support = true) :
    ∃ core : ExactOffCircleCore (rowPattern P), core.c = c₀ := by
  rw [exactSeedOffCircleCoreAt, List.any_eq_true] at hcore
  rcases hcore with ⟨onCircleNat, honMem, hon⟩
  rw [Bool.and_eq_true, List.any_eq_true] at hon
  rcases hon with ⟨honSupport, offCircleNat, hoffMem, hoff⟩
  rw [Bool.and_eq_true] at hoff
  let onCircle : Label := labelOfMem onCircleNat honMem
  let offCircle : Label := labelOfMem offCircleNat hoffMem
  have honP : P c₀ onCircle = true := by
    rw [← has_rowMaskOf P c₀ onCircle]
    simpa [onCircle, rowOfPattern] using honSupport
  have hoffP : P c₀ offCircle = false := by
    rw [← has_rowMaskOf P c₀ offCircle]
    simpa [offCircle, rowOfPattern] using hoff.1
  refine ⟨{
    c := c₀, a := onCircle, z := offCircle
    ha := (mem_row_iff P c₀ onCircle).2 honP
    hz := ?_
    hacz := ?_ }, rfl⟩
  · intro hmem
    have htrue := (mem_row_iff P c₀ offCircle).1 hmem
    simp [hoffP] at htrue
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [onCircle, offCircle] using hoff.2

/-- A native row found under a seed-center value is the corresponding
semantic row. -/
theorem row_eq_rowOfPattern_of_find?_eq_some
    {P : PatternCode} {centers : List Label} {c₀ : Label} {nativeRow : Row}
    (hfind : (centers.map (rowOfPattern P)).find?
      (fun row => row.center == c₀.val) = some nativeRow) :
    nativeRow = rowOfPattern P c₀ := by
  have hmem := List.mem_of_find?_eq_some hfind
  rcases List.mem_map.mp hmem with ⟨center, _hcenter, rfl⟩
  have hcenterValue := List.find?_some hfind
  have hcenter : center = c₀ := by
    apply Fin.ext
    simpa [rowOfPattern] using hcenterValue
  rw [hcenter]

/-- The seed pin witnesses that the prescribed center is a blocker center. -/
theorem exists_blockerSource_erasedSeedShellOK
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket : Finset Label} {c₀ pin deleted : Label}
    (hshell : ErasedSeedShellOK P blocker centerBucket c₀ pin deleted) :
    ∃ source, blocker source = c₀ := by
  rcases hshell with
    ⟨_hcenter, _hpin, hpinRow, _hne, _hdeletedInterior, _hdeleted,
      _hblocker, hseedBlocker⟩
  exact ⟨pin, hseedBlocker pin hpinRow⟩

/-- End-to-end extraction of a closure-core alternative from a parameterized
prefix detector. -/
theorem closureCoreAlternative_of_hasPrefixCoreAt
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket : Finset Label} {c₀ pin deleted : Label}
    (hshell : ErasedSeedShellOK P blocker centerBucket c₀ pin deleted)
    (centers : List Label)
    (hcore : hasPrefixCoreAt c₀.val
      (centers.map (rowOfPattern P)) = true) :
    ClosureCoreAlternative P blocker := by
  let rows : List Row := centers.map (rowOfPattern P)
  let roots : Array Nat := normalizedRoots (equalityClosure rows)
  let seed : Option Row := rows.find? (fun row => row.center == c₀.val)
  by_cases hduplicate : duplicateCenterCore roots = true
  · left
    exact duplicateCenterCore_sound centers (by
      simpa [roots, rows] using hduplicate)
  have hduplicateFalse : duplicateCenterCore roots = false :=
    Bool.eq_false_iff.mpr hduplicate
  let exactHit : Bool :=
    match seed with
    | some row => exactSeedOffCircleCoreAt c₀.val roots row.support
    | none => false
  change (duplicateCenterCore roots || exactHit ||
    perpendicularBisectorCore roots || convexFivePointCore roots) = true
    at hcore
  by_cases hexact : exactHit = true
  · cases hseed : seed with
    | none => simp [exactHit, hseed] at hexact
    | some nativeRow =>
        have hfind : rows.find? (fun row => row.center == c₀.val) =
            some nativeRow := by
          simpa [seed] using hseed
        have hrow : nativeRow = rowOfPattern P c₀ :=
          row_eq_rowOfPattern_of_find?_eq_some (by
            simpa [rows] using hfind)
        have hhit : exactSeedOffCircleCoreAt c₀.val roots
            nativeRow.support = true := by
          simpa [exactHit, hseed] using hexact
        have hhit' : exactSeedOffCircleCoreAt c₀.val
            (normalizedRoots (equalityClosure
              (centers.map (rowOfPattern P))))
            (rowOfPattern P c₀).support = true := by
          simpa [roots, rows, hrow] using hhit
        rcases exactSeedOffCircleCoreAt_sound centers c₀ hhit' with
          ⟨exactCore, hcenter⟩
        rcases exists_blockerSource_erasedSeedShellOK hshell with
          ⟨source, hsource⟩
        right; left
        exact ⟨source, exactCore, hcenter.trans hsource.symm⟩
  have hexactFalse : exactHit = false := Bool.eq_false_iff.mpr hexact
  by_cases hperp : perpendicularBisectorCore roots = true
  · right; right; right; right; right; right; right; right; right; left
    exact perpendicularBisectorCore_sound centers (by
      simpa [roots, rows] using hperp)
  have hperpFalse : perpendicularBisectorCore roots = false :=
    Bool.eq_false_iff.mpr hperp
  have hfive : convexFivePointCore roots = true := by
    simpa [hduplicateFalse, hexactFalse, hperpFalse] using hcore
  right; right; right; right; right; right; right; right; right; right; left
  exact convexFivePointCore_sound centers (by
    simpa [roots, rows] using hfive)

/-- A successful one-row ERASE placement replay yields the public closure-core
alternative. -/
theorem closureCoreAlternative_of_erasedPlacementCheckAt
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket : Finset Label} {c₀ pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : ErasedSeedShellOK P blocker centerBucket c₀ pin deleted)
    (hcheck :
      erasedPlacementCheckAt c₀.val (rowMaskOf P c₀) deleted.val = true) :
    ClosureCoreAlternative P blocker := by
  rcases exists_semanticPrefixCore_of_erasedPlacementCheckAt
      hinc hshell hcheck with ⟨centers, _hnodup, hcore⟩
  exact closureCoreAlternative_of_hasPrefixCoreAt hshell centers hcore

/-- A successful P4-U placement replay yields the public closure-core
alternative. -/
theorem closureCoreAlternative_of_erasedP4UPlacementCheck
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : P4UErasedShellOK P blocker pin deleted)
    (hcheck : erasedP4UPlacementCheck (rowMaskOf P 0) deleted.val = true) :
    ClosureCoreAlternative P blocker := by
  rcases exists_semanticPrefixCore_of_erasedP4UPlacementCheck
      hinc hshell hcheck with
    ⟨centers, _hnodup, hcore⟩
  exact closureCoreAlternative_of_hasPrefixCoreAt hshell.1 centers hcore

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
