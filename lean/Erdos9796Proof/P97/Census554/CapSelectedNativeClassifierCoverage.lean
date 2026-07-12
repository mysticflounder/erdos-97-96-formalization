/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound

/-!
# Coverage of the native card-eleven classifier

This file proves that a proof-facing admissible pattern traces a branch through
the native domain search. The search may reorder domains and filter future row
lists, but those operations preserve the distinguished semantic row for every
unassigned center.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNativeClassifierCoverage

open CapSelectedFiniteCode
open CapSelectedNativeClassifier
open CapSelectedNativeClassifierSound
open CapSelectedNativeClassifierFacts

/-- Insertion into the domain-size ordering only permutes the input domains. -/
theorem insertDomain_perm (domain : Domain) :
    ∀ domains, (insertDomain domain domains).Perm (domain :: domains) := by
  intro domains
  induction domains with
  | nil => simp [insertDomain]
  | cons next rest ih =>
      simp only [insertDomain]
      split
      · exact List.Perm.refl _
      · exact (List.Perm.cons next ih).trans
          (List.Perm.swap domain next rest)

/-- Sorting domains by current size preserves the domain multiset. -/
theorem sortDomains_perm (domains : List Domain) :
    (sortDomains domains).Perm domains := by
  induction domains with
  | nil => simp [sortDomains]
  | cons domain domains ih =>
      change
        (insertDomain domain (sortDomains domains)).Perm (domain :: domains)
      exact (insertDomain_perm domain (sortDomains domains)).trans
        (List.Perm.cons domain ih)

/-- If no duplicate-free semantic prefix has a core, the distinguished
semantic rows trace a false branch through `allKilled`. -/
theorem allKilled_eq_false_of_semanticTrace
    {P : PatternCode} (hinc : IncidenceOK P)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCore (centers.map (rowOfPattern P)) = false) :
    ∀ fuel (assignedCenters : List Label) (domains : List Domain),
      assignedCenters.Nodup →
      (domains.map Domain.center).Nodup →
      (∀ domain, domain ∈ domains →
        ∃ center : Label,
          center ∉ assignedCenters ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows) →
      allKilled fuel (assignedCenters.map (rowOfPattern P)) domains = false := by
  intro fuel
  induction fuel with
  | zero =>
      intro assignedCenters domains hassigned _hdomains _hcarry
      simpa [allKilled] using hnoCore assignedCenters hassigned
  | succ fuel ih =>
      intro assignedCenters domains hassigned hdomains hcarry
      have hprefix := hnoCore assignedCenters hassigned
      cases hsort : sortDomains domains with
      | nil =>
          simp [allKilled, hprefix, hsort]
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
            rowOfPattern P center ::
              assignedCenters.map (rowOfPattern P)
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
              allKilled fuel
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
                let assigned :=
                  rowOfPattern P center ::
                    assignedCenters.map (rowOfPattern P)
                let remaining :=
                  rest.map (restrictDomain assigned)
                if remaining.any fun next => next.rows.isEmpty then
                  true
                else
                  allKilled fuel assigned remaining
              else
                true) = false := by
            simpa [hcompatible, nextAssigned, nextDomains, hnoneEmpty] using
              hrecursive
          have hallFalse :
              domain.rows.all (fun row =>
                if compatibleWith
                    (assignedCenters.map (rowOfPattern P)) row then
                  let assigned :=
                    row :: assignedCenters.map (rowOfPattern P)
                  let remaining :=
                    rest.map (restrictDomain assigned)
                  if remaining.any fun next => next.rows.isEmpty then
                    true
                  else
                    allKilled fuel assigned remaining
                else
                  true) = false := by
            rw [List.all_eq_false]
            refine ⟨rowOfPattern P center, hrow, ?_⟩
            exact Bool.eq_false_iff.mp hbranch
          simpa [allKilled, hprefix, hsort] using hallFalse

set_option linter.style.nativeDecide false in
theorem variableCenters_nodup : variableCenters.Nodup := by
  native_decide

theorem variableCenter_lt_eleven {center : Nat}
    (hcenter : center ∈ variableCenters) : center < 11 := by
  simp [variableCenters] at hcenter
  omega

theorem variableCenter_ne_one {center : Nat}
    (hcenter : center ∈ variableCenters) : center ≠ 1 := by
  simp [variableCenters] at hcenter
  omega

set_option maxRecDepth 10000 in
/-- If no semantic prefix contains an executable core, an admissible pattern
forces its placement check to return false. -/
theorem placementCheck_eq_false_of_no_semanticPrefixCore
    {P : PatternCode} {blocker : Label → Label}
    {pinSource deleted : Label}
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCore (centers.map (rowOfPattern P)) = false) :
    placementCheck pinSource.val deleted.val = false := by
  have hfixed :
      rowOfPattern P 1 = fixedPinnedRow pinSource.val :=
    rowOfPattern_eq_fixedPinnedRow hpin
  have hfixedLocal :
      localCandidateOK (fixedPinnedRow pinSource.val).center deleted.val
        (fixedPinnedRow pinSource.val).support = true := by
    have hlocalSpec :=
      localCandidateSpec_of_incidenceOK_pinnedShellOK hinc hpin 1
    have hlocalMask :
        localCandidateOK (1 : Label).val deleted.val (rowMaskOf P 1) = true :=
      (localCandidateOK_maskOfFinset_iff 1 deleted (row P 1)).2
        hlocalSpec
    have hlocalRow :
        localCandidateOK (rowOfPattern P 1).center deleted.val
          (rowOfPattern P 1).support = true := by
      simpa [rowOfPattern] using hlocalMask
    simpa [hfixed] using hlocalRow
  let fixed : Row := fixedPinnedRow pinSource.val
  let initialDomains : List Domain :=
    variableCenters.map fun center =>
      restrictDomain [fixed]
        { center, rows := candidateRows center deleted.val }
  have hdomainCenters :
      (initialDomains.map Domain.center).Nodup := by
    simpa [initialDomains, List.map_map, Function.comp_def,
      restrictDomain] using variableCenters_nodup
  have hcarry :
      ∀ domain, domain ∈ initialDomains →
        ∃ center : Label,
          center ∉ ([1] : List Label) ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows := by
    intro domain hdomain
    rcases List.mem_map.mp hdomain with ⟨centerNat, hcenterNat, rfl⟩
    let center : Label :=
      ⟨centerNat, variableCenter_lt_eleven hcenterNat⟩
    have hcenterNe : center ≠ 1 := by
      intro heq
      exact variableCenter_ne_one hcenterNat
        (congrArg Fin.val heq)
    have hcenterFresh : center ∉ ([1] : List Label) := by
      simp [hcenterNe]
    have hcandidate :
        rowOfPattern P center ∈ candidateRows center.val deleted.val :=
      rowOfPattern_mem_candidateRows hinc hpin center
    have hcompatible :
        compatibleWith (([1] : List Label).map (rowOfPattern P))
          (rowOfPattern P center) = true :=
      compatibleWith_encodedRows hinc (by simp) hcenterFresh
    have hcompatibleFixed :
        compatibleWith [fixed] (rowOfPattern P center) = true := by
      simpa [fixed, hfixed] using hcompatible
    refine ⟨center, hcenterFresh, rfl, ?_⟩
    exact List.mem_filter.mpr ⟨hcandidate, hcompatibleFixed⟩
  have hnoneEmpty :
      initialDomains.any (fun domain => domain.rows.isEmpty) = false := by
    rw [List.any_eq_false]
    intro domain hdomain
    rcases hcarry domain hdomain with
      ⟨center, _hfresh, _hval, hrow⟩
    have hnonempty : domain.rows.isEmpty = false :=
      List.isEmpty_eq_false_iff_exists_mem.mpr
        ⟨rowOfPattern P center, hrow⟩
    simpa [hnonempty]
  have hsearch :
      allKilled variableCenters.length
          (([1] : List Label).map (rowOfPattern P))
          initialDomains = false :=
    allKilled_eq_false_of_semanticTrace hinc hnoCore
      variableCenters.length [1] initialDomains (by simp)
      hdomainCenters hcarry
  have hsearchFixed :
      allKilled variableCenters.length [fixed] initialDomains = false := by
    simpa [fixed, hfixed] using hsearch
  simp [placementCheck, hfixedLocal, initialDomains, fixed,
    hnoneEmpty, hsearchFixed]

/-- A successful native placement replay produces an executable core on some
duplicate-free prefix of the proof-facing pattern. -/
theorem exists_semanticPrefixCore_of_placementCheck
    {P : PatternCode} {blocker : Label → Label}
    {pinSource deleted : Label}
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hcheck : placementCheck pinSource.val deleted.val = true) :
    ∃ centers : List Label,
      centers.Nodup ∧
        hasPrefixCore (centers.map (rowOfPattern P)) = true := by
  by_contra hnone
  have hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCore (centers.map (rowOfPattern P)) = false := by
    intro centers hcenters
    cases hcore : hasPrefixCore (centers.map (rowOfPattern P)) with
    | false => rfl
    | true =>
        exfalso
        exact hnone ⟨centers, hcenters, hcore⟩
  have hfalse :=
    placementCheck_eq_false_of_no_semanticPrefixCore hinc hpin hnoCore
  simp [hcheck] at hfalse

end CapSelectedNativeClassifierCoverage
end Census554
end Problem97
