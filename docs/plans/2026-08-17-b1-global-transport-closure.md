# Closure Plan: B1 Global Transport Producer (`b1_globalGapOrClosedTerminal_of_counterexample`)

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

### Why `b1_globalGapOrClosedTerminal_of_counterexample` is the Most Tractable Sorry
- **Complete Consumer**: The downstream consumer theorem [`false_of_b1_global_gap_or_closed_terminal`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1Live.lean#L756) is **100% proved without `sorry`** in [`B1Live.lean:756`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1Live.lean#L756).
- **Narrow Producer Interface**: The producer obligation [`b1_globalGapOrClosedTerminal_of_counterexample`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L142) requires establishing any **one** of three concrete geometric disjuncts packaged in `B1GlobalGapOrClosedTerminal C`.
- **Acyclic Direct Reduction**: It directly discharges the parent collision arm [`false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean#L155) without circular dependencies or solver certificates.

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

---

## 3. Geometric Mechanics

Let $q_1 := C.\text{first.deleted.1}$ and $q_2 := C.\text{second.deleted.1}$.

1. **Perpendicular Bisector Line**:
   - $q_1, q_2 \in \text{SelectedClass } D.A\ S.\text{oppApex2 } C.\rho \implies \operatorname{dist}(S.\text{oppApex2}, q_1) = C.\rho = \operatorname{dist}(S.\text{oppApex2}, q_2)$.  
     Hence, $S.\text{oppApex2} \in \operatorname{PB}(q_1, q_2)$.
   - $C.\text{hblockersEq} \implies \text{blocker} := \text{centerAt}(q_1) = \text{centerAt}(q_2)$.  
     Since $q_1, q_2$ lie on the critical 4-shell centered at $\text{blocker}$, $\operatorname{dist}(\text{blocker}, q_1) = \operatorname{dist}(\text{blocker}, q_2)$.  
     Hence, $\text{blocker} \in \operatorname{PB}(q_1, q_2)$.
   - $C.\text{first.uPacket.actual\_blocker\_ne\_center}_2 \implies \text{blocker} \ne S.\text{oppApex2}$.
   - Thus, the affine line $\mathcal{L} := \overline{S.\text{oppApex2}, \text{blocker}}$ is exactly the perpendicular bisector $\operatorname{PB}(q_1, q_2)$.

2. **Carrier Distribution & Disjunction**:
   - The carrier $D.A$ has $|D.A| \ge 12$.
   - **Case A**: $\exists c \in D.A \cap \mathcal{L}$ with $c \ne S.\text{oppApex2}$ and $c \ne \text{blocker}$.
     This immediately discharges **Branch 1** via `Or.inl ⟨c, hcA, hcNeBlocker, hcNeApex, hcDist⟩`.
   - **Case B**: $(D.A \cap \mathcal{L}) = \{S.\text{oppApex2}, \text{blocker}\}$.
     Then all other carrier points lie strictly off the bisector $\mathcal{L}$. The 4-shells of $q_1$ and $q_2$ in the strict cap interior are forced to overlap in $\ge 3$ points, satisfying **Branch 3**.

---

## 4. Implementation Steps

### Phase 1: Bisector Geometry Helpers
Add to [`TwoDeletionCollision.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean):
1. `oppApex2_mem_deleted_bisector (C : B1GlobalTransportContext)`:
   Proves $\operatorname{dist}(S.\text{oppApex2}, q_1) = \operatorname{dist}(S.\text{oppApex2}, q_2)$.
2. `blocker_mem_deleted_bisector (C : B1GlobalTransportContext)`:
   Proves $\operatorname{dist}(\text{blocker}, q_1) = \operatorname{dist}(\text{blocker}, q_2)$.
3. `oppApex2_ne_blocker (C : B1GlobalTransportContext)`:
   Proves $S.\text{oppApex2} \ne \text{blocker}$.

### Phase 2: Disjunction Dispatcher
Formalize the proof of `b1_globalGapOrClosedTerminal_of_counterexample`:
```lean
theorem b1_globalGapOrClosedTerminal_of_counterexample
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    B1GlobalGapOrClosedTerminal C := by
  by_cases hthird : ∃ c : ℝ², c ∈ D.A ∧
      c ≠ (lateFirstApexSystem C.R).centerAt C.first.deleted.1 C.first.deleted.2 ∧
      c ≠ S.oppApex2 ∧
      dist c C.first.deleted.1 = dist c C.second.deleted.1
  · exact Or.inl hthird
  · -- Case without third carrier on bisector: dispatch to overlap branch
    sorry -- (Or.inr (Or.inr ...))
```

### Phase 3: Verification & Audit
1. Build the module:
   ```bash
   lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision
   ```
2. Verify on-spine reduction:
   ```bash
   proof-blueprint spine
   ```
   Confirm open node count decreases from 37 to 36.
3. Transitive axiom check:
   ```lean
   #print axioms b1_globalGapOrClosedTerminal_of_counterexample
   #print axioms false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision
   ```
   Verify no unapproved axioms or `sorryAx` remain on the B1 collision branch.
