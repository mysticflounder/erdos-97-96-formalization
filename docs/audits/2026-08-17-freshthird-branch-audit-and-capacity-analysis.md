# Problem 97 ATail: FreshThird Branch Audit & Global Capacity Analysis

> **Status refresh (2026-08-28): NUMERICAL/STRUCTURAL EVIDENCE ONLY.** This is
> a dated branch audit, not a closure or promotion claim. Phrases below such as
> “kernel equivalence,” “interderivable,” “realizable,” and “confirmed” record
> the original exploratory assessment; the named FreshThird residuals still
> include `sorry`-backed leaves in the current source.

**Date**: 2026-08-17

**Module**: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`

**Files Audited**:
- [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceRetainedMinimalCore.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceRetainedMinimalCore.lean)
- [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshCanonicalOverride.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshCanonicalOverride.lean)
- [`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean)
- [`lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean`](../../lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean)
- [`lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean`](../../lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean)

---

## 1. Executive Summary

This document records the audit findings on the `FreshThird` branch of the Problem 97 ATail terminal formalization, explains the status of the top-down Global Center Capacity approach, and details the active resolution of the local `FreshThird` residual in `TwoSourceFreshThirdResidual.lean`.

---

## 2. FreshThird Structural Discovery

1. **Kernel Equivalence**:
   - `false_of_freshThird_firstNonHit` is interderivable with Level-5 `false_of_capSourceThirdCanonicalRowSurface` via `TwoSourceFreshCanonicalOverride.false_of_freshCanonicalRowOverride` (100% sorry-free).
2. **Failure Mechanism of Named SAT/SMT Waves (v1–v7)**:
   - Any point $q \in D.A$ outside the three named shells ($\text{sh}(b_P), \text{sh}(b_R), \text{sh}(b_S)$) can be overridden by $H.\text{overrideAt}$ to manufacture a blocker fiber $Q$ that is a non-hit against the cap-1 source.
   - Because $|A| \ge 17 > 12$, such a point $q$ always exists.
   - The numerical realization audit of 2026-08-16 confirmed that the Level-5 named point set is strictly convexly realizable in $\mathbb{R}^2$ (`realization_named37.json` and `realization_extended81.json`). Local incidence SAT solvers cannot find a contradiction without carrier-wide invariants.

---

## 3. Global Center Capacity Analysis

### Formal Foundations (Already Proven in Lean):
1. **Cover Bound**:
   $$|A| \le 4 \cdot |\text{notRobustCenters}(D.A)|$$
   via `MinimalUniqueFourCover.card_le_four_mul_notRobustCenters`.
2. **Apex Deletion-Robustness**:
   Under tri-apex robustness $T$, all three Moser vertices $v_1, v_2, v_3$ satisfy `ApexRichClassStructure`, hence `FullyDeletionRobustAt`. By `MinimalUniqueFourCover.not_isUniqueFourCenter_of_fullyDeletionRobust`, none of the three apexes is a unique-four center.
3. **Cap-Interior Localization**:
   All unique-four centers must reside in the strict interiors of the three caps:
   $$\text{notRobustCenters}(D.A) \subseteq \bigcup_{i=0}^2 S.\text{capInteriorByIndex } i$$
4. **Circle-Cap Bound**:
   Every critical 4-shell circle meets any strictly convex cap arc in at most 2 points (`criticalFourShell_inter_selectedClass_card_le_two`).

### The Mathematical Gap in Pure Global Counting:
- The total size of the three cap interiors is $|A| - 3$.
- Substituting this bound gives $|A| \le 4(|A| - 3) = 4|A| - 12 \implies 3|A| \ge 12 \implies |A| \ge 4$, which is trivially satisfied by $|A| \ge 17$.
- To obtain $|A| \le 16$, one would need to prove that the geometry of $(2,1,1)$ circle packings across three convex arcs limits the number of distinct not-robust centers to $\le 4$. Because no such geometric packing theory is formalized in Lean, this route is currently non-trivial to close directly.

---

## 4. Local Resolution Progress (`TwoSourceFreshThirdResidual.lean`)

In [`TwoSourceFreshThirdResidual.lean`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L3347), the theorem `false_of_freshThirdEqualCenter_noncanonicalInteractions` has been restructured:

1. **Mixed Interaction Cases (Closed)**:
   - `distinctBlockersDifferentCaps × sameCapWithInternalFiberSource` and `sameCapWithInternalFiberSource × distinctBlockersDifferentCaps` are closed by cap-interior disjointness (`S.capInteriorByIndex_ne_of_mem_of_mem_ne`).
2. **Coherent Cases**:
   - `distinctBlockersDifferentCaps × distinctBlockersDifferentCaps`: source centers in distinct caps.
   - `sameCapWithInternalFiberSource × sameCapWithInternalFiberSource`: source centers in the same non-canonical cap.
   - Both are reduced to the 6-way pinned center ingress from `exists_freshThirdEqualCenter_pinnedCenter_sixWayIngress`.

---

## 5. Verification Status

- Verified cleanly with `lake-build` (10,865 jobs, exit code 0).
- `proof-blueprint` index and call-graph synchronized (`docs/live-blueprint.md` updated).
