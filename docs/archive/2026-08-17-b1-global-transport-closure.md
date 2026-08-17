# [REFUTED] Closure Plan: B1 Global Transport Producer (`b1_globalGapOrClosedTerminal_of_counterexample`)

> [!CAUTION]
> **STATUS: REFUTED / REJECTED (2026-08-17)**
> This plan is mathematically defective as reviewed in [`docs/plans/2026-08-17-b1-global-transport-closure-review.md`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/docs/plans/2026-08-17-b1-global-transport-closure-review.md).
> 
> **Reasons for Refutation**:
> 1. **Branches 1 & 2 are provably empty/false**: `b1_live_bisectorSet_eq_pair` (`B1Live.lean:161`) proves that the set of carriers on the perpendicular bisector $\operatorname{PB}(q_1, q_2)$ is strictly equal to $\{\text{blocker}, S.\text{oppApex2}\}$. No third carrier on the bisector exists, and the fiber cardinality is exactly 2.
> 2. **Branch 3 is logically equivalent to the full theorem**: `b1_live_escape_small_overlap` constructs an escape point with overlap $\le 2$, so asserting Branch 3 (overlap $\ge 3$) implies `False`. Proving Branch 3 from B1 binders is logically equivalent to proving `False` directly from the B1 binders.
> 3. The proposed Phase 2 split moved the `sorry` into the unproved branch without resolving the core open problem.
> 
> Retained in `docs/archive/` for historical record.

---

**Date**: 2026-08-17  
**Target Declaration**: [`Problem97.ATailFrontierLiveClosure.b1_globalGapOrClosedTerminal_of_counterexample`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L142)  
**File**: [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:142`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L142)  
**Publication Root**: [`Problem97.erdos97_rhs`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/Erdos9796.lean)  

---

## 1. Executive Summary & Frontier Context

The live proof spine rooted at `Problem97.erdos97_rhs` comprises **37 open on-spine obligations** across 5 primary structural clusters:
1. **B1 / B-Family Collision**: [`TwoDeletionCollision.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean) (3 sorries)
2. **Rigid 2+2+1 Placement & Source-Heavy**: [`Rigid221Placement.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean), [`Rigid221Closure.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean), [`Rigid221SourceHeavy.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean) (15 sorries)
3. **Tri-Apex Retained Omission Core**: [`TriApexEndpointRetainedOmission.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean) (9 sorries)
4. **Two-Source Canonical Surface & Fresh-Third**: [`TwoSourceCanonicalSurface.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean), [`TwoSourceFreshThirdResidual.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean) (6 sorries)
5. **Post-Card-11 & Swapped Residuals**: [`Rigid221Closure.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean) (4 sorries)

---

## 2. Technical Specification

### Target Statement
```lean
theorem b1_globalGapOrClosedTerminal_of_counterexample
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    B1GlobalGapOrClosedTerminal C
```

### Definition of `B1GlobalGapOrClosedTerminal`
From [`B1Live.lean:723`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1Live.lean#L723):
```lean
def B1GlobalGapOrClosedTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  -- Branch 1: A third carrier point on the perpendicular bisector PB(q₁, q₂)
  (∃ c : ℝ²,
      c ∈ D.A ∧
      c ≠ (lateFirstApexSystem C.R).centerAt C.first.deleted.1 C.first.deleted.2 ∧
      c ≠ S.oppApex2 ∧
      dist c C.first.deleted.1 = dist c C.second.deleted.1) ∨
  -- Branch 2: At least 3 carrier points on PB(q₁, q₂)
  (3 ≤ (D.A.filter (fun p ↦ dist p C.first.deleted.1 = dist p C.second.deleted.1)).card) ∨
  -- Branch 3: Support overlap lower bound (≥ 3) with every cap interior point
  (∀ (t : ℝ²),
      t ∈ (SelectedClass D.A S.oppApex2 C.rho ∩ S.capInteriorByIndex S.oppIndex2) →
      ∀ (htA : t ∈ D.A),
        t ≠ C.first.deleted.1 →
        t ≠ C.second.deleted.1 →
        t ∉ ((lateFirstApexSystem C.R).selectedAt C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support →
        (lateFirstApexSystem C.R).centerAt t htA ≠ (lateFirstApexSystem C.R).centerAt C.first.deleted.1 C.first.deleted.2 →
        3 ≤ (((lateFirstApexSystem C.R).selectedAt t htA).toCriticalFourShell.support ∩
             ((lateFirstApexSystem C.R).selectedAt C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support).card)
```
