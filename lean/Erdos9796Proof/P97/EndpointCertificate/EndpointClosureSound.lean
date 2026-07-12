/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.EndpointClassifierSound

/-!
# Endpoint closure soundness (card-eleven extension lane)

Coverage and closure-assembly layers of the endpoint transport (items 6–7 of
`docs/audits/2026-07-11-endpoint-classifier-transport-map.md`).  Produces the
two final closure-core theorems
`closureCoreAlternative_of_incidenceOK_endpointLeft/RightShellOK`, both targeting
the unchanged `ClosureCoreAlternative P blocker`.

* Left family reuses the committed native search (`allKilled`, `hasPrefixCore`,
  `variableCenters`, `exactPinnedOffCircleCore_sound`) verbatim — only seed and
  fixed-row swaps.
* Right family runs against the forked search (`allKilledRight`,
  `hasPrefixCoreRight`, `variableCentersRight`) and mirrors the exact off-circle
  detector soundness with center literal `1 → 2`.

Everything imports committed modules only; nothing in `Census554/` is modified.
-/

namespace Problem97

namespace EndpointCertificate

namespace EndpointNativeClassifier

open Census554.EqualityCore
open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound
open Census554.CapSelectedNativeClassifierCoverage
open Census554.CapSelectedNativeClosureSound

/- ## Left coverage (reuses the committed search) -/

set_option maxRecDepth 10000 in
/-- If no semantic prefix contains an executable core, a left endpoint-shell
admissible pattern forces its placement check to return false. -/
theorem endpointLeftPlacementCheck_eq_false_of_no_semanticPrefixCore
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCore (centers.map (rowOfPattern P)) = false) :
    endpointLeftPlacementCheck escapee.val fourth.val deleted.val = false := by
  have hfixed :
      rowOfPattern P 1 = fixedEndpointLeftRow escapee.val fourth.val :=
    rowOfPattern_eq_fixedEndpointLeftRow hshell
  have hfixedLocal :
      localCandidateOK (fixedEndpointLeftRow escapee.val fourth.val).center
        deleted.val
        (fixedEndpointLeftRow escapee.val fourth.val).support = true := by
    have hlocalSpec :=
      localCandidateSpec_of_incidenceOK_endpointLeftShellOK hinc hshell 1
    have hlocalMask :
        localCandidateOK (1 : Label).val deleted.val (rowMaskOf P 1) = true :=
      (localCandidateOK_maskOfFinset_iff 1 deleted (row P 1)).2 hlocalSpec
    have hlocalRow :
        localCandidateOK (rowOfPattern P 1).center deleted.val
          (rowOfPattern P 1).support = true := by
      simpa [rowOfPattern] using hlocalMask
    simpa [hfixed] using hlocalRow
  let fixed : Row := fixedEndpointLeftRow escapee.val fourth.val
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
      exact variableCenter_ne_one hcenterNat (congrArg Fin.val heq)
    have hcenterFresh : center ∉ ([1] : List Label) := by
      simp [hcenterNe]
    have hcandidate :
        rowOfPattern P center ∈ candidateRows center.val deleted.val :=
      rowOfPattern_mem_candidateRows_endpointLeft hinc hshell center
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
      allKilled variableCenters.length
          (([1] : List Label).map (rowOfPattern P))
          initialDomains = false :=
    allKilled_eq_false_of_semanticTrace hinc hnoCore
      variableCenters.length [1] initialDomains (by simp)
      hdomainCenters hcarry
  have hsearchFixed :
      allKilled variableCenters.length [fixed] initialDomains = false := by
    simpa [fixed, hfixed] using hsearch
  simp [endpointLeftPlacementCheck, hfixedLocal, initialDomains, fixed,
    hnoneEmpty, hsearchFixed]

/-- A successful left endpoint placement replay produces an executable core on
some duplicate-free prefix of the proof-facing pattern. -/
theorem exists_semanticPrefixCore_of_endpointLeftPlacementCheck
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted)
    (hcheck : endpointLeftPlacementCheck escapee.val fourth.val deleted.val
      = true) :
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
    endpointLeftPlacementCheck_eq_false_of_no_semanticPrefixCore hinc hshell
      hnoCore
  simp [hcheck] at hfalse

/- ## Right search-trace lemma and variable-center facts -/

/-- Right-family analog of `allKilled_eq_false_of_semanticTrace`; identical proof
text with `allKilled`/`hasPrefixCore` replaced by their right-family variants. -/
theorem allKilledRight_eq_false_of_semanticTrace
    {P : PatternCode} (hinc : IncidenceOK P)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreRight (centers.map (rowOfPattern P)) = false) :
    ∀ fuel (assignedCenters : List Label) (domains : List Domain),
      assignedCenters.Nodup →
      (domains.map Domain.center).Nodup →
      (∀ domain, domain ∈ domains →
        ∃ center : Label,
          center ∉ assignedCenters ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows) →
      allKilledRight fuel (assignedCenters.map (rowOfPattern P)) domains
        = false := by
  intro fuel
  induction fuel with
  | zero =>
      intro assignedCenters domains hassigned _hdomains _hcarry
      simpa [allKilledRight] using hnoCore assignedCenters hassigned
  | succ fuel ih =>
      intro assignedCenters domains hassigned hdomains hcarry
      have hprefix := hnoCore assignedCenters hassigned
      cases hsort : sortDomains domains with
      | nil =>
          simp [allKilledRight, hprefix, hsort]
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
              allKilledRight fuel
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
                  allKilledRight fuel assigned remaining
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
                    allKilledRight fuel assigned remaining
                else
                  true) = false := by
            rw [List.all_eq_false]
            refine ⟨rowOfPattern P center, hrow, ?_⟩
            exact Bool.eq_false_iff.mp hbranch
          simpa [allKilledRight, hprefix, hsort] using hallFalse

set_option linter.style.nativeDecide false in
theorem variableCentersRight_nodup : variableCentersRight.Nodup := by
  native_decide

theorem variableCentersRight_lt_eleven {center : Nat}
    (hcenter : center ∈ variableCentersRight) : center < 11 := by
  simp [variableCentersRight] at hcenter
  omega

theorem variableCentersRight_ne_two {center : Nat}
    (hcenter : center ∈ variableCentersRight) : center ≠ 2 := by
  simp [variableCentersRight] at hcenter
  omega

/- ## Right coverage -/

set_option maxRecDepth 10000 in
/-- Right-family analog of the no-core placement-check falsity lemma. -/
theorem endpointRightPlacementCheck_eq_false_of_no_semanticPrefixCore
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted)
    (hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreRight (centers.map (rowOfPattern P)) = false) :
    endpointRightPlacementCheck escapee.val fourth.val deleted.val = false := by
  have hfixed :
      rowOfPattern P 2 = fixedEndpointRightRow escapee.val fourth.val :=
    rowOfPattern_eq_fixedEndpointRightRow hshell
  have hfixedLocal :
      localCandidateOK (fixedEndpointRightRow escapee.val fourth.val).center
        deleted.val
        (fixedEndpointRightRow escapee.val fourth.val).support = true := by
    have hlocalSpec :=
      localCandidateSpec_of_incidenceOK_endpointRightShellOK hinc hshell 2
    have hlocalMask :
        localCandidateOK (2 : Label).val deleted.val (rowMaskOf P 2) = true :=
      (localCandidateOK_maskOfFinset_iff 2 deleted (row P 2)).2 hlocalSpec
    have hlocalRow :
        localCandidateOK (rowOfPattern P 2).center deleted.val
          (rowOfPattern P 2).support = true := by
      simpa [rowOfPattern] using hlocalMask
    simpa [hfixed] using hlocalRow
  let fixed : Row := fixedEndpointRightRow escapee.val fourth.val
  let initialDomains : List Domain :=
    variableCentersRight.map fun center =>
      restrictDomain [fixed]
        { center, rows := candidateRows center deleted.val }
  have hdomainCenters :
      (initialDomains.map Domain.center).Nodup := by
    simpa [initialDomains, List.map_map, Function.comp_def,
      restrictDomain] using variableCentersRight_nodup
  have hcarry :
      ∀ domain, domain ∈ initialDomains →
        ∃ center : Label,
          center ∉ ([2] : List Label) ∧
          center.val = domain.center ∧
          rowOfPattern P center ∈ domain.rows := by
    intro domain hdomain
    rcases List.mem_map.mp hdomain with ⟨centerNat, hcenterNat, rfl⟩
    let center : Label :=
      ⟨centerNat, variableCentersRight_lt_eleven hcenterNat⟩
    have hcenterNe : center ≠ 2 := by
      intro heq
      exact variableCentersRight_ne_two hcenterNat (congrArg Fin.val heq)
    have hcenterFresh : center ∉ ([2] : List Label) := by
      simp [hcenterNe]
    have hcandidate :
        rowOfPattern P center ∈ candidateRows center.val deleted.val :=
      rowOfPattern_mem_candidateRows_endpointRight hinc hshell center
    have hcompatible :
        compatibleWith (([2] : List Label).map (rowOfPattern P))
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
      allKilledRight variableCentersRight.length
          (([2] : List Label).map (rowOfPattern P))
          initialDomains = false :=
    allKilledRight_eq_false_of_semanticTrace hinc hnoCore
      variableCentersRight.length [2] initialDomains (by simp)
      hdomainCenters hcarry
  have hsearchFixed :
      allKilledRight variableCentersRight.length [fixed] initialDomains
        = false := by
    simpa [fixed, hfixed] using hsearch
  simp [endpointRightPlacementCheck, hfixedLocal, initialDomains, fixed,
    hnoneEmpty, hsearchFixed]

/-- Right-family analog of the semantic-prefix-core existence lemma. -/
theorem exists_semanticPrefixCore_of_endpointRightPlacementCheck
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted)
    (hcheck : endpointRightPlacementCheck escapee.val fourth.val deleted.val
      = true) :
    ∃ centers : List Label,
      centers.Nodup ∧
        hasPrefixCoreRight (centers.map (rowOfPattern P)) = true := by
  by_contra hnone
  have hnoCore : ∀ centers : List Label, centers.Nodup →
      hasPrefixCoreRight (centers.map (rowOfPattern P)) = false := by
    intro centers hcenters
    cases hcore : hasPrefixCoreRight (centers.map (rowOfPattern P)) with
    | false => rfl
    | true =>
        exfalso
        exact hnone ⟨centers, hcenters, hcore⟩
  have hfalse :=
    endpointRightPlacementCheck_eq_false_of_no_semanticPrefixCore hinc hshell
      hnoCore
  simp [hcheck] at hfalse

/- ## Blocker-source witnesses -/

/-- Left endpoint-shell exactness supplies a source (label `7`) whose blocker is
center `1`. -/
theorem exists_blockerSource_endpointLeft
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted) :
    ∃ source, blocker source = 1 := by
  rcases hshell with
    ⟨_he, _hf, _hdeletedInterior, _hne, hrow, _hdeleted, _hblocker,
      hpinnedBlocker, _hdeletedBlocker⟩
  refine ⟨7, hpinnedBlocker 7 ?_⟩
  rw [hrow]
  simp

/-- Right endpoint-shell exactness supplies a source (label `9`) whose blocker is
center `2`. -/
theorem exists_blockerSource_endpointRight
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted) :
    ∃ source, blocker source = 2 := by
  rcases hshell with
    ⟨_he, _hf, _hdeletedInterior, _hne, hrow, _hdeleted, _hblocker,
      hpinnedBlocker, _hdeletedBlocker⟩
  refine ⟨9, hpinnedBlocker 9 ?_⟩
  rw [hrow]
  simp

/- ## Right-family exact detector soundness -/

/-- Soundness of the right-family exact off-circle detector at center `2`.
Mirror of `exactPinnedOffCircleCore_sound` with center literal `1 → 2`. -/
theorem exactEndpointOffCircleCoreAt2_sound
    {P : PatternCode} (centers : List Label)
    (hcore : exactEndpointOffCircleCoreAt2
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P))))
      (rowOfPattern P 2).support = true) :
    ∃ core : ExactOffCircleCore (rowPattern P), core.c = 2 := by
  rw [exactEndpointOffCircleCoreAt2, List.any_eq_true] at hcore
  rcases hcore with ⟨onCircleNat, honMem, hon⟩
  rw [Bool.and_eq_true, List.any_eq_true] at hon
  rcases hon with ⟨honSupport, offCircleNat, hoffMem, hoff⟩
  rw [Bool.and_eq_true] at hoff
  let onCircle : Label := labelOfMem onCircleNat honMem
  let offCircle : Label := labelOfMem offCircleNat hoffMem
  have honP : P 2 onCircle = true := by
    rw [← has_rowMaskOf P 2 onCircle]
    simpa [onCircle, rowOfPattern] using honSupport
  have hoffP : P 2 offCircle = false := by
    rw [← has_rowMaskOf P 2 offCircle]
    simpa [offCircle, rowOfPattern] using hoff.1
  refine ⟨{
    c := 2, a := onCircle, z := offCircle
    ha := (mem_row_iff P 2 onCircle).2 honP
    hz := ?_
    hacz := ?_ }, rfl⟩
  · intro hmem
    have htrue := (mem_row_iff P 2 offCircle).1 hmem
    simp [hoffP] at htrue
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [onCircle, offCircle] using hoff.2

/-- A native row found at center value `2` is the semantic row at label `2`.
Mirror of `row_eq_rowOfPattern_one_of_find?_eq_some`. -/
theorem row_eq_rowOfPattern_two_of_find?_eq_some
    {P : PatternCode} {centers : List Label} {nativeRow : Row}
    (hfind : (centers.map (rowOfPattern P)).find?
      (fun row => row.center == 2) = some nativeRow) :
    nativeRow = rowOfPattern P 2 := by
  have hmem := List.mem_of_find?_eq_some hfind
  rcases List.mem_map.mp hmem with ⟨center, _hcenter, rfl⟩
  have hcenterValue := List.find?_some hfind
  have hcenter : center = (2 : Label) := by
    apply Fin.ext
    simpa [rowOfPattern] using hcenterValue
  rw [hcenter]

/- ## Closure-core extraction -/

/-- End-to-end extraction of a public closure-core alternative from the native
prefix detector, left endpoint family. -/
theorem closureCoreAlternative_of_hasPrefixCore_endpointLeft
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted)
    (centers : List Label)
    (hcore : hasPrefixCore (centers.map (rowOfPattern P)) = true) :
    ClosureCoreAlternative P blocker := by
  let rows : List Row := centers.map (rowOfPattern P)
  let roots : Array Nat := normalizedRoots (equalityClosure rows)
  let pinned : Option Row := rows.find? (fun row => row.center == 1)
  by_cases hduplicate : duplicateCenterCore roots = true
  · left
    exact duplicateCenterCore_sound centers (by
      simpa [roots, rows] using hduplicate)
  have hduplicateFalse : duplicateCenterCore roots = false :=
    Bool.eq_false_iff.mpr hduplicate
  let exactHit : Bool :=
    match pinned with
    | some row => exactPinnedOffCircleCore roots row.support
    | none => false
  change (duplicateCenterCore roots || exactHit ||
    perpendicularBisectorCore roots || convexFivePointCore roots) = true
    at hcore
  by_cases hexact : exactHit = true
  · cases hpinned : pinned with
    | none => simp [exactHit, hpinned] at hexact
    | some nativeRow =>
        have hfind : rows.find? (fun row => row.center == 1) =
            some nativeRow := by
          simpa [pinned] using hpinned
        have hrow : nativeRow = rowOfPattern P 1 :=
          row_eq_rowOfPattern_one_of_find?_eq_some (by
            simpa [rows] using hfind)
        have hhit : exactPinnedOffCircleCore roots nativeRow.support = true := by
          simpa [exactHit, hpinned] using hexact
        have hhit' : exactPinnedOffCircleCore
            (normalizedRoots (equalityClosure
              (centers.map (rowOfPattern P))))
            (rowOfPattern P 1).support = true := by
          simpa [roots, rows, hrow] using hhit
        rcases exactPinnedOffCircleCore_sound centers hhit' with
          ⟨exactCore, hcenter⟩
        rcases exists_blockerSource_endpointLeft hshell with ⟨source, hsource⟩
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

/-- End-to-end extraction of a public closure-core alternative from the native
prefix detector, right endpoint family (keyed to center `2`). -/
theorem closureCoreAlternative_of_hasPrefixCoreRight_endpointRight
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted)
    (centers : List Label)
    (hcore : hasPrefixCoreRight (centers.map (rowOfPattern P)) = true) :
    ClosureCoreAlternative P blocker := by
  let rows : List Row := centers.map (rowOfPattern P)
  let roots : Array Nat := normalizedRoots (equalityClosure rows)
  let pinned : Option Row := rows.find? (fun row => row.center == 2)
  by_cases hduplicate : duplicateCenterCore roots = true
  · left
    exact duplicateCenterCore_sound centers (by
      simpa [roots, rows] using hduplicate)
  have hduplicateFalse : duplicateCenterCore roots = false :=
    Bool.eq_false_iff.mpr hduplicate
  let exactHit : Bool :=
    match pinned with
    | some row => exactEndpointOffCircleCoreAt2 roots row.support
    | none => false
  change (duplicateCenterCore roots || exactHit ||
    perpendicularBisectorCore roots || convexFivePointCore roots) = true
    at hcore
  by_cases hexact : exactHit = true
  · cases hpinned : pinned with
    | none => simp [exactHit, hpinned] at hexact
    | some nativeRow =>
        have hfind : rows.find? (fun row => row.center == 2) =
            some nativeRow := by
          simpa [pinned] using hpinned
        have hrow : nativeRow = rowOfPattern P 2 :=
          row_eq_rowOfPattern_two_of_find?_eq_some (by
            simpa [rows] using hfind)
        have hhit : exactEndpointOffCircleCoreAt2 roots nativeRow.support
            = true := by
          simpa [exactHit, hpinned] using hexact
        have hhit' : exactEndpointOffCircleCoreAt2
            (normalizedRoots (equalityClosure
              (centers.map (rowOfPattern P))))
            (rowOfPattern P 2).support = true := by
          simpa [roots, rows, hrow] using hhit
        rcases exactEndpointOffCircleCoreAt2_sound centers hhit' with
          ⟨exactCore, hcenter⟩
        rcases exists_blockerSource_endpointRight hshell with ⟨source, hsource⟩
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

/- ## Final closure-core theorems -/

/-- The card-eleven left endpoint seed forces the public closure-core
alternative. -/
theorem closureCoreAlternative_of_incidenceOK_endpointLeftShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointLeftShellOK P blocker escapee fourth deleted) :
    ClosureCoreAlternative P blocker := by
  have hcheck :
      endpointLeftPlacementCheck escapee.val fourth.val deleted.val = true :=
    endpointLeftPlacementCheck_of_seed hshell.1 hshell.2.1 hshell.2.2.1
      hshell.2.2.2.1
  rcases exists_semanticPrefixCore_of_endpointLeftPlacementCheck hinc hshell
    hcheck with ⟨centers, _hnodup, hcore⟩
  exact closureCoreAlternative_of_hasPrefixCore_endpointLeft hshell centers hcore

/-- The card-eleven right endpoint seed forces the public closure-core
alternative. -/
theorem closureCoreAlternative_of_incidenceOK_endpointRightShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {escapee fourth deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : EndpointRightShellOK P blocker escapee fourth deleted) :
    ClosureCoreAlternative P blocker := by
  have hcheck :
      endpointRightPlacementCheck escapee.val fourth.val deleted.val = true :=
    endpointRightPlacementCheck_of_seed hshell.1 hshell.2.1 hshell.2.2.1
      hshell.2.2.2.1
  rcases exists_semanticPrefixCore_of_endpointRightPlacementCheck hinc hshell
    hcheck with ⟨centers, _hnodup, hcore⟩
  exact closureCoreAlternative_of_hasPrefixCoreRight_endpointRight hshell centers
    hcore

end EndpointNativeClassifier

end EndpointCertificate

end Problem97
