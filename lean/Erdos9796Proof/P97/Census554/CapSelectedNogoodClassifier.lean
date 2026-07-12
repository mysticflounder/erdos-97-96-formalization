/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierCoverage
import Erdos9796Proof.P97.Census554.CapSelectedNogoodCertificate

/-!
# Static-nogood replay for the cap-selected classifier

This search has the same row enumeration and compatibility pruning as the
native classifier, but a prefix closes only when it contains a member of a
checked static nogood bank. The semantic trace theorem then exposes the
matched certificate directly, avoiding a proof of the internal union-find
implementation.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNogoodClassifier

open CapSelectedFiniteCode
open CapSelectedNativeClassifier
open CapSelectedNativeClassifierFacts
open CapSelectedNativeClassifierSound
open CapSelectedNativeClassifierCoverage
open CapSelectedNogoodCertificate

/-- Recursive DFS replay using only the checked static nogood bank. -/
def allCertified (bank : List NogoodData) :
    Nat -> List Row -> List Domain -> Bool
  | 0, assigned, _ => hasNogood bank assigned
  | fuel + 1, assigned, domains =>
      if hasNogood bank assigned then
        true
      else
        match sortDomains domains with
        | [] => false
        | domain :: rest =>
            domain.rows.all fun row =>
              if compatibleWith assigned row then
                let nextAssigned := row :: assigned
                let nextDomains := rest.map (restrictDomain nextAssigned)
                if nextDomains.any fun next => next.rows.isEmpty then
                  true
                else
                  allCertified bank fuel nextAssigned nextDomains
              else
                true

/-- One ordered pin/deletion placement is covered by the static bank. -/
def placementCertificateCheck (bank : List NogoodData)
    (pinSource deleted : Nat) : Bool :=
  let fixed := fixedPinnedRow pinSource
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := variableCenters.map fun center =>
      restrictDomain assigned { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allCertified bank variableCenters.length assigned domains

/-- If no duplicate-free semantic prefix contains a bank member, the
distinguished rows trace a false branch through the static replay. -/
theorem allCertified_eq_false_of_semanticTrace
    {P : PatternCode} (hinc : IncidenceOK P) (bank : List NogoodData)
    (hnoNogood : ∀ centers : List Label, centers.Nodup ->
      hasNogood bank (centers.map (rowOfPattern P)) = false) :
    ∀ fuel (assignedCenters : List Label) (domains : List Domain),
      assignedCenters.Nodup ->
      (domains.map Domain.center).Nodup ->
      (∀ domain, domain ∈ domains ->
        ∃ center : Label,
          center ∉ assignedCenters /\
          center.val = domain.center /\
          rowOfPattern P center ∈ domain.rows) ->
      allCertified bank fuel
        (assignedCenters.map (rowOfPattern P)) domains = false := by
  intro fuel
  induction fuel with
  | zero =>
      intro assignedCenters domains hassigned _hdomains _hcarry
      simpa [allCertified] using hnoNogood assignedCenters hassigned
  | succ fuel ih =>
      intro assignedCenters domains hassigned hdomains hcarry
      have hprefix := hnoNogood assignedCenters hassigned
      cases hsort : sortDomains domains with
      | nil =>
          simp [allCertified, hprefix, hsort]
      | cons domain rest =>
          have hperm : (domain :: rest).Perm domains := by
            rw [← hsort]
            exact sortDomains_perm domains
          have hcentersSorted :
              ((domain :: rest).map Domain.center).Nodup :=
            (hperm.map Domain.center).nodup_iff.mpr hdomains
          have hcentersSorted' :
              domain.center ∉ rest.map Domain.center /\
                (rest.map Domain.center).Nodup := by
            simpa only [List.map_cons, List.nodup_cons] using hcentersSorted
          have hcarrySorted :
              ∀ other, other ∈ domain :: rest ->
                ∃ center : Label,
                  center ∉ assignedCenters /\
                  center.val = other.center /\
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
              ∀ other, other ∈ nextDomains ->
                ∃ otherCenter : Label,
                  otherCenter ∉ center :: assignedCenters /\
                  otherCenter.val = other.center /\
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
              simp [← hcenterVal, ← hotherVal, heq]
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
              allCertified bank fuel
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
                  allCertified bank fuel assigned remaining
              else
                true) = false := by
            simpa [hcompatible, nextAssigned, nextDomains,
              hnoneEmpty] using hrecursive
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
                    allCertified bank fuel assigned remaining
                else
                  true) = false := by
            rw [List.all_eq_false]
            refine ⟨rowOfPattern P center, hrow, ?_⟩
            exact Bool.eq_false_iff.mp hbranch
          simpa [allCertified, hprefix, hsort] using hallFalse

set_option maxRecDepth 10000 in
/-- If no semantic prefix contains a bank member, an admissible pattern makes
its placement replay return false. -/
theorem placementCertificateCheck_eq_false_of_no_semanticNogood
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label} (bank : List NogoodData)
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hnoNogood : ∀ centers : List Label, centers.Nodup ->
      hasNogood bank (centers.map (rowOfPattern P)) = false) :
    placementCertificateCheck bank pinSource.val deleted.val = false := by
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
      ∀ domain, domain ∈ initialDomains ->
        ∃ center : Label,
          center ∉ ([1] : List Label) /\
          center.val = domain.center /\
          rowOfPattern P center ∈ domain.rows := by
    intro domain hdomain
    rcases List.mem_map.mp hdomain with ⟨centerNat, hcenterNat, rfl⟩
    let center : Label :=
      ⟨centerNat, variableCenter_lt_eleven hcenterNat⟩
    have hcenterNe : center ≠ 1 := by
      intro heq
      exact variableCenter_ne_one hcenterNat (congrArg Fin.val heq)
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
    simp [hnonempty]
  have hsearch :
      allCertified bank variableCenters.length
          (([1] : List Label).map (rowOfPattern P))
          initialDomains = false :=
    allCertified_eq_false_of_semanticTrace hinc bank hnoNogood
      variableCenters.length [1] initialDomains (by simp)
      hdomainCenters hcarry
  have hsearchFixed :
      allCertified bank variableCenters.length [fixed]
        initialDomains = false := by
    simpa [fixed, hfixed] using hsearch
  simp [placementCertificateCheck, hfixedLocal, initialDomains, fixed,
    hnoneEmpty, hsearchFixed]

/-- A successful static replay exposes a duplicate-free semantic prefix that
contains a checked row nogood. -/
theorem exists_semanticNogood_of_placementCertificateCheck
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label} (bank : List NogoodData)
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hcheck : placementCertificateCheck bank
      pinSource.val deleted.val = true) :
    ∃ centers : List Label, centers.Nodup /\
      hasNogood bank (centers.map (rowOfPattern P)) = true := by
  by_contra hnone
  have hnoNogood : ∀ centers : List Label, centers.Nodup ->
      hasNogood bank (centers.map (rowOfPattern P)) = false := by
    intro centers hcenters
    cases hmatch : hasNogood bank (centers.map (rowOfPattern P)) with
    | false => rfl
    | true =>
        exfalso
        exact hnone ⟨centers, hcenters, hmatch⟩
  have hfalse := placementCertificateCheck_eq_false_of_no_semanticNogood
    bank hinc hpin hnoNogood
  simp [hcheck] at hfalse

/-- End-to-end finite bridge: a checked bank and a successful static replay
produce the public closure-core alternative. -/
theorem closureCoreAlternative_of_placementCertificateCheck
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label} (bank : List NogoodData)
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hbank : checkBank bank = true)
    (hcheck : placementCertificateCheck bank
      pinSource.val deleted.val = true) :
    ClosureCoreAlternative P blocker := by
  rcases exists_semanticNogood_of_placementCertificateCheck
      bank hinc hpin hcheck with ⟨centers, _hnodup, hmatch⟩
  exact closureCoreAlternative_of_checkedBankMatch
    bank hpin hbank centers hmatch

end CapSelectedNogoodClassifier
end Census554
end Problem97
