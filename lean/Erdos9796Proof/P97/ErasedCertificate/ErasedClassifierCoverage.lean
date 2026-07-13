/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.ErasedClassifierSound
import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierCoverage

/-!
# Coverage of the ERASE native classifier

Traces a semantic admissible pattern through the parameterized DFS.  The
P4-U specialization starts from the three forced semantic rows at centers
`0`, `1`, and `2`.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound
open Census554.CapSelectedNativeClassifierCoverage

/-- Parameterized analogue of the committed semantic-trace theorem. -/
theorem allKilledAt_eq_false_of_semanticTrace
    {P : PatternCode} (hinc : IncidenceOK P) (c₀ : Nat)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreAt c₀ (centers.map (rowOfPattern P)) = false) :
    ∀ fuel (assignedCenters : List Label) (domains : List Domain),
      assignedCenters.Nodup →
      (domains.map Domain.center).Nodup →
      (∀ domain, domain ∈ domains →
        ∃ center : Label,
          center ∉ assignedCenters ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows) →
      allKilledAt c₀ fuel (assignedCenters.map (rowOfPattern P)) domains =
        false := by
  intro fuel
  induction fuel with
  | zero =>
      intro assignedCenters domains hassigned _hdomains _hcarry
      simpa [allKilledAt] using hnoCore assignedCenters hassigned
  | succ fuel ih =>
      intro assignedCenters domains hassigned hdomains hcarry
      have hprefix := hnoCore assignedCenters hassigned
      cases hsort : sortDomains domains with
      | nil =>
          simp [allKilledAt, hprefix, hsort]
      | cons domain rest =>
          have hperm : (domain :: rest).Perm domains := by
            rw [← hsort]
            exact sortDomains_perm domains
          have hcentersSorted :
              ((domain :: rest).map Domain.center).Nodup :=
            (hperm.map Domain.center).nodup_iff.mpr hdomains
          have hcentersSorted' :
              domain.center ∉ rest.map Domain.center ∧
                (rest.map Domain.center).Nodup := by
            simpa only [List.map_cons, List.nodup_cons] using hcentersSorted
          have hcarrySorted :
              ∀ other, other ∈ domain :: rest →
                ∃ center : Label,
                  center ∉ assignedCenters ∧
                  center.val = other.center ∧
                  rowOfPattern P center ∈ other.rows := by
            intro other hother
            exact hcarry other (hperm.mem_iff.mp hother)
          rcases hcarrySorted domain (by simp) with
            ⟨center, hcenterFresh, hcenterVal, hrow⟩
          have hassigned' : (center :: assignedCenters).Nodup := by
            rw [List.nodup_cons]
            exact ⟨hcenterFresh, hassigned⟩
          have hcompatible :
              compatibleWith (assignedCenters.map (rowOfPattern P))
                (rowOfPattern P center) = true :=
            compatibleWith_encodedRows hinc hassigned hcenterFresh
          let nextAssigned : List Row :=
            rowOfPattern P center :: assignedCenters.map (rowOfPattern P)
          let nextDomains : List Domain :=
            rest.map (restrictDomain nextAssigned)
          have hnextCenters :
              (nextDomains.map Domain.center).Nodup := by
            simpa [nextDomains, List.map_map, Function.comp_def,
              restrictDomain] using hcentersSorted'.2
          have hnextCarry :
              ∀ other, other ∈ nextDomains →
                ∃ otherCenter : Label,
                  otherCenter ∉ center :: assignedCenters ∧
                  otherCenter.val = other.center ∧
                  rowOfPattern P otherCenter ∈ other.rows := by
            intro restricted hrestricted
            rcases List.mem_map.mp hrestricted with
              ⟨other, hother, rfl⟩
            rcases hcarrySorted other (by simp [hother]) with
              ⟨otherCenter, hotherFresh, hotherVal, hotherRow⟩
            have hne : otherCenter ≠ center := by
              intro heq
              apply hcentersSorted'.1
              apply List.mem_map.mpr
              refine ⟨other, hother, ?_⟩
              simpa [← hcenterVal, ← hotherVal, heq]
            have hotherFresh' :
                otherCenter ∉ center :: assignedCenters := by
              simp [hne, hotherFresh]
            have hotherCompatible :
                compatibleWith
                    ((center :: assignedCenters).map (rowOfPattern P))
                    (rowOfPattern P otherCenter) = true :=
              compatibleWith_encodedRows hinc hassigned' hotherFresh'
            refine ⟨otherCenter, hotherFresh', ?_, ?_⟩
            · simpa [restrictDomain] using hotherVal
            · simpa [restrictDomain, nextAssigned, hotherRow,
                hotherCompatible]
          have hrecursive :
              allKilledAt c₀ fuel
                  ((center :: assignedCenters).map (rowOfPattern P))
                  nextDomains = false :=
            ih (center :: assignedCenters) nextDomains hassigned'
              hnextCenters hnextCarry
          have hnoneEmpty :
              nextDomains.any (fun next => next.rows.isEmpty) = false := by
            rw [List.any_eq_false]
            intro next hnext
            rcases hnextCarry next hnext with
              ⟨nextCenter, _hfresh, _hval, hnextRow⟩
            simpa [List.isEmpty_eq_false_iff_exists_mem] using
              (show next.rows.isEmpty = false from
                List.isEmpty_eq_false_iff_exists_mem.mpr
                  ⟨rowOfPattern P nextCenter, hnextRow⟩)
          have hbranch :
              (if compatibleWith
                    (assignedCenters.map (rowOfPattern P))
                    (rowOfPattern P center) then
                let assigned := rowOfPattern P center ::
                  assignedCenters.map (rowOfPattern P)
                let remaining := rest.map (restrictDomain assigned)
                if remaining.any fun next => next.rows.isEmpty then
                  true
                else
                  allKilledAt c₀ fuel assigned remaining
              else
                true) = false := by
            simpa [hcompatible, nextAssigned, nextDomains, hnoneEmpty] using
              hrecursive
          have hallFalse :
              domain.rows.all (fun row =>
                if compatibleWith
                    (assignedCenters.map (rowOfPattern P)) row then
                  let assigned := row ::
                    assignedCenters.map (rowOfPattern P)
                  let remaining := rest.map (restrictDomain assigned)
                  if remaining.any fun next => next.rows.isEmpty then
                    true
                  else
                    allKilledAt c₀ fuel assigned remaining
                else
                  true) = false := by
            rw [List.all_eq_false]
            refine ⟨rowOfPattern P center, hrow, ?_⟩
            exact Bool.eq_false_iff.mp hbranch
          simpa [allKilledAt, hprefix, hsort] using hallFalse

/-- The parameterized variable-center list has no duplicates. -/
theorem variableCentersAt_nodup (c₀ : Nat) :
    (variableCentersAt c₀).Nodup := by
  exact (show (List.range 11).Nodup from List.nodup_range).filter _

/-- Every parameterized variable center is an eleven-label value. -/
theorem variableCenterAt_lt_eleven {c₀ center : Nat}
    (hcenter : center ∈ variableCentersAt c₀) : center < 11 := by
  simp [variableCentersAt, labels] at hcenter
  omega

/-- The fixed seed center is absent from its variable-center list. -/
theorem variableCenterAt_ne_seed {c₀ center : Nat}
    (hcenter : center ∈ variableCentersAt c₀) : center ≠ c₀ := by
  simp [variableCentersAt, labels] at hcenter
  omega

set_option maxRecDepth 10000 in
/-- If no semantic prefix contains a parameterized core, a one-row ERASE
shell forces its placement check to return false. -/
theorem erasedPlacementCheckAt_eq_false_of_no_semanticPrefixCore
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket : Finset Label} {c₀ pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : ErasedSeedShellOK P blocker centerBucket c₀ pin deleted)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreAt c₀.val (centers.map (rowOfPattern P)) = false) :
    erasedPlacementCheckAt c₀.val (rowMaskOf P c₀) deleted.val = false := by
  let fixed : Row := rowOfPattern P c₀
  have hfixedLocal :
      localCandidateOK c₀.val deleted.val (rowMaskOf P c₀) = true := by
    exact (localCandidateOK_maskOfFinset_iff c₀ deleted (row P c₀)).2
      (localCandidateSpec_of_incidenceOK_erasedSeedShellOK
        hinc hshell c₀)
  let initialDomains : List Domain :=
    (variableCentersAt c₀.val).map fun center =>
      restrictDomain [fixed]
        { center, rows := candidateRows center deleted.val }
  have hdomainCenters :
      (initialDomains.map Domain.center).Nodup := by
    simpa [initialDomains, List.map_map, Function.comp_def,
      restrictDomain] using variableCentersAt_nodup c₀.val
  have hcarry :
      ∀ domain, domain ∈ initialDomains →
        ∃ center : Label,
          center ∉ ([c₀] : List Label) ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows := by
    intro domain hdomain
    rcases List.mem_map.mp hdomain with ⟨centerNat, hcenterNat, rfl⟩
    let center : Label :=
      ⟨centerNat, variableCenterAt_lt_eleven hcenterNat⟩
    have hcenterNe : center ≠ c₀ := by
      intro heq
      exact variableCenterAt_ne_seed hcenterNat (congrArg Fin.val heq)
    have hcenterFresh : center ∉ ([c₀] : List Label) := by
      simp [hcenterNe]
    have hcandidate :
        rowOfPattern P center ∈ candidateRows center.val deleted.val :=
      rowOfPattern_mem_candidateRows_erased hinc hshell center
    have hcompatible :
        compatibleWith (([c₀] : List Label).map (rowOfPattern P))
          (rowOfPattern P center) = true :=
      compatibleWith_encodedRows hinc (by simp) hcenterFresh
    have hcompatibleFixed :
        compatibleWith [fixed] (rowOfPattern P center) = true := by
      simpa [fixed] using hcompatible
    refine ⟨center, hcenterFresh, rfl, ?_⟩
    exact List.mem_filter.mpr ⟨hcandidate, hcompatibleFixed⟩
  have hnoneEmpty :
      initialDomains.any (fun domain => domain.rows.isEmpty) = false := by
    rw [List.any_eq_false]
    intro domain hdomain
    rcases hcarry domain hdomain with ⟨center, _hfresh, _hval, hrow⟩
    simpa [List.isEmpty_eq_false_iff_exists_mem] using
      (show domain.rows.isEmpty = false from
        List.isEmpty_eq_false_iff_exists_mem.mpr
          ⟨rowOfPattern P center, hrow⟩)
  have hsearch :
      allKilledAt c₀.val (variableCentersAt c₀.val).length
          (([c₀] : List Label).map (rowOfPattern P))
          initialDomains = false :=
    allKilledAt_eq_false_of_semanticTrace hinc c₀.val hnoCore
      (variableCentersAt c₀.val).length [c₀] initialDomains (by simp)
      hdomainCenters hcarry
  have hsearchFixed :
      allKilledAt c₀.val (variableCentersAt c₀.val).length
        [fixed] initialDomains = false := by
    simpa [fixed] using hsearch
  have hnoneEmptyFixed :
      ∀ center ∈ variableCentersAt c₀.val,
        ¬ (restrictDomain
            [{ center := c₀.val, support := rowMaskOf P c₀ }]
            { center, rows := candidateRows center deleted.val }).rows = [] := by
    simpa [initialDomains, fixed, rowOfPattern, List.any_eq_false] using
      hnoneEmpty
  have hsearchFixed' :
      allKilledAt c₀.val (variableCentersAt c₀.val).length
        [{ center := c₀.val, support := rowMaskOf P c₀ }]
        ((variableCentersAt c₀.val).map fun center =>
          restrictDomain
            [{ center := c₀.val, support := rowMaskOf P c₀ }]
            { center, rows := candidateRows center deleted.val }) = false := by
    simpa [initialDomains, fixed, rowOfPattern] using hsearchFixed
  simp [erasedPlacementCheckAt, hfixedLocal, hsearchFixed']
  exact hnoneEmptyFixed

/-- A successful one-row ERASE replay yields a duplicate-free semantic prefix
with a parameterized native core. -/
theorem exists_semanticPrefixCore_of_erasedPlacementCheckAt
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket : Finset Label} {c₀ pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : ErasedSeedShellOK P blocker centerBucket c₀ pin deleted)
    (hcheck :
      erasedPlacementCheckAt c₀.val (rowMaskOf P c₀) deleted.val = true) :
    ∃ centers : List Label,
      centers.Nodup ∧
        hasPrefixCoreAt c₀.val (centers.map (rowOfPattern P)) = true := by
  by_contra hnone
  have hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreAt c₀.val (centers.map (rowOfPattern P)) = false := by
    intro centers hcenters
    cases hcore : hasPrefixCoreAt c₀.val
        (centers.map (rowOfPattern P)) with
    | false => rfl
    | true => exact False.elim (hnone ⟨centers, hcenters, hcore⟩)
  have hfalse :=
    erasedPlacementCheckAt_eq_false_of_no_semanticPrefixCore
      hinc hshell hnoCore
  simp [hcheck] at hfalse

set_option linter.style.nativeDecide false in
theorem p4uVariableCenters_nodup : p4uVariableCenters.Nodup := by
  native_decide

theorem p4uVariableCenter_lt_eleven {center : Nat}
    (hcenter : center ∈ p4uVariableCenters) : center < 11 := by
  simp [p4uVariableCenters] at hcenter
  omega

theorem p4uVariableCenter_not_mem_fixed {center : Nat}
    (hcenter : center ∈ p4uVariableCenters) :
    (Fin.ofNat 11 center) ∉ ([2, 1, 0] : List Label) := by
  simp [p4uVariableCenters] at hcenter
  rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    decide

set_option maxRecDepth 10000 in
/-- If no semantic prefix has a core, a P4-U shell forces its specialized
placement check to return false. -/
theorem erasedP4UPlacementCheck_eq_false_of_no_semanticPrefixCore
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : P4UErasedShellOK P blocker pin deleted)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreAt 0 (centers.map (rowOfPattern P)) = false) :
    erasedP4UPlacementCheck (rowMaskOf P 0) deleted.val = false := by
  let seed : Row := rowOfPattern P 0
  have hfixed₁ : rowOfPattern P 1 = firstOppExactCapRow :=
    rowOfPattern_eq_firstOppExactCapRow hshell
  have hfixed₂ : rowOfPattern P 2 = secondOppExactCapRow :=
    rowOfPattern_eq_secondOppExactCapRow hshell
  have hlocal (center : Label) :
      localCandidateOK (rowOfPattern P center).center deleted.val
        (rowOfPattern P center).support = true := by
    have hspec :=
      localCandidateSpec_of_incidenceOK_erasedSeedShellOK hinc hshell.1 center
    have hmask :=
      (localCandidateOK_maskOfFinset_iff center deleted (row P center)).2 hspec
    simpa [rowOfPattern, rowMaskOf] using hmask
  have hcompatible₁ :
      compatibleWith [seed] firstOppExactCapRow = true := by
    have h := compatibleWith_encodedRows hinc
      (centers := ([0] : List Label)) (center := 1) (by simp) (by simp)
    simpa [seed, hfixed₁] using h
  have hcompatible₂ :
      compatibleWith [firstOppExactCapRow, seed] secondOppExactCapRow = true := by
    have h := compatibleWith_encodedRows hinc
      (centers := ([1, 0] : List Label)) (center := 2) (by simp) (by simp)
    simpa [seed, hfixed₁, hfixed₂] using h
  let assignedCenters : List Label := [2, 1, 0]
  let assigned : List Row := assignedCenters.map (rowOfPattern P)
  let initialDomains : List Domain :=
    p4uVariableCenters.map fun center =>
      restrictDomain assigned
        { center, rows := candidateRows center deleted.val }
  have hassigned : assignedCenters.Nodup := by
    simp [assignedCenters]
  have hdomainCenters :
      (initialDomains.map Domain.center).Nodup := by
    simpa [initialDomains, List.map_map, Function.comp_def,
      restrictDomain] using p4uVariableCenters_nodup
  have hcarry :
      ∀ domain, domain ∈ initialDomains →
        ∃ center : Label,
          center ∉ assignedCenters ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows := by
    intro domain hdomain
    rcases List.mem_map.mp hdomain with ⟨centerNat, hcenterNat, rfl⟩
    let center : Label := ⟨centerNat, p4uVariableCenter_lt_eleven hcenterNat⟩
    have hcenterFresh : center ∉ assignedCenters := by
      simpa [center, assignedCenters, Fin.ofNat,
        Nat.mod_eq_of_lt (p4uVariableCenter_lt_eleven hcenterNat)] using
        p4uVariableCenter_not_mem_fixed hcenterNat
    have hcandidate :
        rowOfPattern P center ∈ candidateRows center.val deleted.val :=
      rowOfPattern_mem_candidateRows_p4u hinc hshell center
    have hcompatible :
        compatibleWith assigned (rowOfPattern P center) = true := by
      simpa [assigned] using
        compatibleWith_encodedRows hinc hassigned hcenterFresh
    refine ⟨center, hcenterFresh, rfl, ?_⟩
    exact List.mem_filter.mpr ⟨hcandidate, hcompatible⟩
  have hnoneEmpty :
      initialDomains.any (fun domain => domain.rows.isEmpty) = false := by
    rw [List.any_eq_false]
    intro domain hdomain
    rcases hcarry domain hdomain with ⟨center, _hfresh, _hval, hrow⟩
    simpa [List.isEmpty_eq_false_iff_exists_mem] using
      (show domain.rows.isEmpty = false from
        List.isEmpty_eq_false_iff_exists_mem.mpr
          ⟨rowOfPattern P center, hrow⟩)
  have hsearch :
      allKilledAt 0 p4uVariableCenters.length assigned initialDomains = false :=
    allKilledAt_eq_false_of_semanticTrace hinc 0 hnoCore
      p4uVariableCenters.length assignedCenters initialDomains
      hassigned hdomainCenters hcarry
  have hassignedRows :
      assigned = [secondOppExactCapRow, firstOppExactCapRow, seed] := by
    simp [assigned, assignedCenters, seed, hfixed₁, hfixed₂]
  let fixedDomains : List Domain :=
    p4uVariableCenters.map fun center =>
      restrictDomain [secondOppExactCapRow, firstOppExactCapRow, seed]
        { center, rows := candidateRows center deleted.val }
  have hdomains : initialDomains = fixedDomains := by
    simp [initialDomains, fixedDomains, hassignedRows]
  have hsearchFixed :
      allKilledAt 0 p4uVariableCenters.length
        [secondOppExactCapRow, firstOppExactCapRow, seed]
        fixedDomains = false := by
    simpa [hdomains, hassignedRows] using hsearch
  have hnoneEmptyFixed :
      fixedDomains.any (fun domain => domain.rows.isEmpty) = false := by
    simpa [hdomains] using hnoneEmpty
  have hlocal₀ := hlocal 0
  have hlocal₀' :
      localCandidateOK 0 deleted.val (rowMaskOf P 0) = true := by
    simpa [rowOfPattern] using hlocal₀
  have hlocal₁ :
      localCandidateOK firstOppExactCapRow.center deleted.val
        firstOppExactCapRow.support = true := by
    simpa [hfixed₁] using hlocal 1
  have hlocal₂ :
      localCandidateOK secondOppExactCapRow.center deleted.val
        secondOppExactCapRow.support = true := by
    simpa [hfixed₂] using hlocal 2
  have hcompatible₁' :
      compatibleWith [{ center := 0, support := rowMaskOf P 0 }]
        firstOppExactCapRow = true := by
    simpa [seed, rowOfPattern] using hcompatible₁
  have hcompatible₂' :
      compatibleWith
        [firstOppExactCapRow, { center := 0, support := rowMaskOf P 0 }]
        secondOppExactCapRow = true := by
    simpa [seed, rowOfPattern] using hcompatible₂
  have hnoneEmptyFixed' :
      ∀ center ∈ p4uVariableCenters,
        ¬ (restrictDomain
            [secondOppExactCapRow, firstOppExactCapRow,
              { center := 0, support := rowMaskOf P 0 }]
            { center, rows := candidateRows center deleted.val }).rows = [] := by
    simpa [fixedDomains, seed, rowOfPattern, List.any_eq_false] using
      hnoneEmptyFixed
  have hsearchFixed' :
      allKilledAt 0 p4uVariableCenters.length
        [secondOppExactCapRow, firstOppExactCapRow,
          { center := 0, support := rowMaskOf P 0 }]
        (p4uVariableCenters.map fun center =>
          restrictDomain
            [secondOppExactCapRow, firstOppExactCapRow,
              { center := 0, support := rowMaskOf P 0 }]
            { center, rows := candidateRows center deleted.val }) = false := by
    simpa [fixedDomains, seed, rowOfPattern] using hsearchFixed
  simp [erasedP4UPlacementCheck, hlocal₀', hlocal₁, hlocal₂,
    hcompatible₁', hcompatible₂', hsearchFixed']
  exact hnoneEmptyFixed'

/-- A successful P4-U replay yields a duplicate-free semantic prefix with a
parameterized native core. -/
theorem exists_semanticPrefixCore_of_erasedP4UPlacementCheck
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : P4UErasedShellOK P blocker pin deleted)
    (hcheck : erasedP4UPlacementCheck (rowMaskOf P 0) deleted.val = true) :
    ∃ centers : List Label,
      centers.Nodup ∧
        hasPrefixCoreAt 0 (centers.map (rowOfPattern P)) = true := by
  by_contra hnone
  have hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreAt 0 (centers.map (rowOfPattern P)) = false := by
    intro centers hcenters
    cases hcore : hasPrefixCoreAt 0 (centers.map (rowOfPattern P)) with
    | false => rfl
    | true => exact False.elim (hnone ⟨centers, hcenters, hcore⟩)
  have hfalse :=
    erasedP4UPlacementCheck_eq_false_of_no_semanticPrefixCore
      hinc hshell hnoCore
  simp [hcheck] at hfalse

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
