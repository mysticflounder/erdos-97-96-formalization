/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5NativeTheorem
import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound

/-!
# Semantic coverage for the aligned-p5 native classifier

An actual selected-row pattern need not reproduce the classifier's search
order.  This file proves the standard semantic-trace theorem: if every
geometric row occurs in its executable domain, compatible geometric prefixes
survive domain filtering, and the metric prefix checks never fire, then the
closed native search forces one of the four Kalmanson occurrence schemas.
-/

namespace Problem97
namespace ATailAlignedP5NativeCoverageScratch

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifierSound
open ATailAlignedP5NativeClassifierScratch

/-- The exact source obligations needed to trace one proof-facing row pattern
through the executable classifier. -/
structure SemanticTrace (P : PatternCode) : Prop where
  firstRow :
    ∃ extra,
      extra ∈ alignedExtraPoints ∧
        rowOfPattern P 0 = fixedFirstRow extra
  candidate :
    ∀ center : Label,
      rowOfPattern P center ∈ candidateRows center.val
  compatible :
    ∀ (assignedCenters : List Label) (center : Label),
      assignedCenters.Nodup →
      center ∉ assignedCenters →
      compatibleWith (assignedCenters.map (rowOfPattern P))
        (rowOfPattern P center) = true
  metricCore_false :
    ∀ centers : List Label,
      centers.Nodup →
      metricCore (centers.map (rowOfPattern P)) = false

/-- A semantic occurrence is allowed to appear at any duplicate-free search
prefix.  The executable schema itself records the ordered boundary roles. -/
def HasKalmansonOccurrence (P : PatternCode) : Prop :=
  ∃ centers : List Label,
    centers.Nodup ∧
      kalmansonCore (centers.map (rowOfPattern P)) = true

/-- Insertion into the least-domain-first ordering only permutes domains. -/
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

/-- Sorting by current domain size preserves the domain multiset. -/
theorem sortDomains_perm (domains : List Domain) :
    (sortDomains domains).Perm domains := by
  induction domains with
  | nil => simp [sortDomains]
  | cons domain domains ih =>
      change
        (insertDomain domain (sortDomains domains)).Perm (domain :: domains)
      exact (insertDomain_perm domain (sortDomains domains)).trans
        (List.Perm.cons domain ih)

/-- A source-valid semantic row at every unassigned center traces a false
branch through `allKilled` when no prefix contains any executable core. -/
theorem allKilled_eq_false_of_semanticTrace
    {P : PatternCode} (trace : SemanticTrace P)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCore (centers.map (rowOfPattern P)) = false) :
    ∀ fuel (assignedCenters : List Label) (domains : List Domain),
      assignedCenters.Nodup →
      (domains.map
        Census554.CapSelectedNativeClassifier.Domain.center).Nodup →
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
              ((domain :: rest).map
                Census554.CapSelectedNativeClassifier.Domain.center).Nodup :=
            (hperm.map
              Census554.CapSelectedNativeClassifier.Domain.center).nodup_iff.mpr
                hdomains
          have hcentersSorted' :
              domain.center ∉ rest.map
                  Census554.CapSelectedNativeClassifier.Domain.center ∧
                (rest.map
                  Census554.CapSelectedNativeClassifier.Domain.center).Nodup := by
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
            trace.compatible assignedCenters center hassigned hcenterFresh
          let nextAssigned : List Row :=
            rowOfPattern P center ::
              assignedCenters.map (rowOfPattern P)
          let nextDomains : List Domain :=
            rest.map (restrictDomain nextAssigned)
          have hnextCenters :
              (nextDomains.map
                Census554.CapSelectedNativeClassifier.Domain.center).Nodup := by
            simpa [nextDomains, List.map_map, Function.comp_def,
              restrictDomain,
              Census554.CapSelectedNativeClassifier.Domain.center] using
                hcentersSorted'.2
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
              simp [← hcenterVal, ← hotherVal, heq]
            have hotherFresh' :
                otherCenter ∉ center :: assignedCenters := by
              simp [hne, hotherFresh]
            have hotherCompatible :
                compatibleWith
                    ((center :: assignedCenters).map (rowOfPattern P))
                    (rowOfPattern P otherCenter) = true :=
              trace.compatible (center :: assignedCenters) otherCenter
                hassigned' hotherFresh'
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
theorem labels_nodup : labels.Nodup := by
  native_decide

theorem label_lt_eleven {center : Nat} (hcenter : center ∈ labels) :
    center < 11 := by
  simpa [labels] using hcenter

set_option linter.style.nativeDecide false in
theorem variableCenters_nodup : variableCenters.Nodup := by
  native_decide

theorem variableCenter_lt_eleven {center : Nat}
    (hcenter : center ∈ variableCenters) :
    center < 11 := by
  simp [variableCenters] at hcenter
  omega

theorem variableCenter_ne_zero {center : Nat}
    (hcenter : center ∈ variableCenters) :
    center ≠ 0 := by
  simp [variableCenters] at hcenter
  omega

set_option maxRecDepth 10000 in
/-- Every source-valid semantic trace through the aligned classifier contains
one of the four strict-Kalmanson occurrences. -/
theorem hasKalmansonOccurrence_of_semanticTrace
    {P : PatternCode} (trace : SemanticTrace P) :
    HasKalmansonOccurrence P := by
  by_contra hnoOccurrence
  have hnoKalmanson :
      ∀ centers : List Label, centers.Nodup →
        kalmansonCore (centers.map (rowOfPattern P)) = false := by
    intro centers hcenters
    apply Bool.eq_false_iff.mpr
    intro hcore
    apply hnoOccurrence
    exact ⟨centers, hcenters, by simpa using hcore⟩
  have hnoCore :
      ∀ centers : List Label, centers.Nodup →
        hasPrefixCore (centers.map (rowOfPattern P)) = false := by
    intro centers hcenters
    simp [hasPrefixCore, trace.metricCore_false centers hcenters,
      hnoKalmanson centers hcenters]
  rcases trace.firstRow with ⟨extra, hextra, hfirstRow⟩
  have hcheck : placementCheckForExtra extra = true := by
    have hall : alignedExtraPoints.all placementCheckForExtra = true := by
      simpa [placementCheck] using placementCheck_eq_true
    exact List.all_eq_true.mp hall extra hextra
  let fixed : Row := fixedFirstRow extra
  have hfixedLocal :
      localCandidateOK fixed.center fixed.support = true := by
    have hcandidate := trace.candidate 0
    have hmembership :
        fixed ∈ candidateRows 0 := by
      simpa [fixed, hfirstRow] using hcandidate
    rcases List.mem_filterMap.mp hmembership with
      ⟨support, _hsupportRange, hsupport⟩
    by_cases hlocal : localCandidateOK 0 support
    · simp [hlocal] at hsupport
      simpa [fixed, ← hsupport] using hlocal
    · simp [hlocal] at hsupport
  let domains : List Domain :=
    variableCenters.map fun center =>
      restrictDomain [fixed] { center, rows := candidateRows center }
  have hdomainCenters :
      (domains.map
        Census554.CapSelectedNativeClassifier.Domain.center).Nodup := by
    simpa [domains, List.map_map, Function.comp_def, restrictDomain] using
      variableCenters_nodup
  have hcarry :
      ∀ domain, domain ∈ domains →
        ∃ center : Label,
          center ∉ ([0] : List Label) ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows := by
    intro domain hdomain
    rcases List.mem_map.mp hdomain with ⟨centerNat, hcenterNat, rfl⟩
    let center : Label :=
      ⟨centerNat, variableCenter_lt_eleven hcenterNat⟩
    have hcenterFresh : center ∉ ([0] : List Label) := by
      simp [center, variableCenter_ne_zero hcenterNat]
    have hcandidate :
        rowOfPattern P center ∈ candidateRows center.val :=
      trace.candidate center
    have hcompatible :
        compatibleWith (([0] : List Label).map (rowOfPattern P))
          (rowOfPattern P center) = true :=
      trace.compatible [0] center (by simp) hcenterFresh
    have hcompatibleFixed :
        compatibleWith [fixed] (rowOfPattern P center) = true := by
      simpa [fixed, hfirstRow] using hcompatible
    exact ⟨center, hcenterFresh, rfl,
      List.mem_filter.mpr ⟨hcandidate, hcompatibleFixed⟩⟩
  have hnoneEmpty :
      domains.any (fun domain => domain.rows.isEmpty) = false := by
    rw [List.any_eq_false]
    intro domain hdomain
    rcases hcarry domain hdomain with
      ⟨center, _hfresh, _hval, hrow⟩
    simpa [List.isEmpty_eq_false_iff_exists_mem] using
      (show domain.rows.isEmpty = false from
        List.isEmpty_eq_false_iff_exists_mem.mpr
          ⟨rowOfPattern P center, hrow⟩)
  have hsearch :
      allKilled variableCenters.length
          (([0] : List Label).map (rowOfPattern P)) domains = false :=
    allKilled_eq_false_of_semanticTrace trace hnoCore
      variableCenters.length [0] domains (by simp) hdomainCenters hcarry
  have hsearchFixed :
      allKilled variableCenters.length [fixed] domains = false := by
    simpa [fixed, hfirstRow] using hsearch
  have hplacement : placementCheckForExtra extra = false := by
    simp only [placementCheckForExtra]
    rw [show alignedExtraPoints.contains extra = true by
      exact List.contains_iff_mem.mpr hextra]
    simp [fixed, hfixedLocal, domains, hnoneEmpty, hsearchFixed]
  exact Bool.false_ne_true (hplacement ▸ hcheck)

end ATailAlignedP5NativeCoverageScratch
end Problem97
