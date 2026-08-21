# Problem 97 ATail: Spine Leverage Analysis & Closure Roadmap

**Date**: 2026-08-17  
**Build Status**: `lake-build` verified clean (10,865 jobs, exit code 0)  
**Spine Target**: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`  
**Active On-Spine Sorries**: 34 effective *(as recorded 2026-08-17; superseded — see the correction note below)*  

> **Correction, 2026-08-20.** Two problems with this document's counts were found
> while auditing the repository against `docs/dead-ends.md`.
>
> First, `false_of_crossBlockerCoincidence` was marked CLOSED at §2 Cluster A. It
> is open — see that entry for the corrected status and for where the abandoned
> proof attempt was recovered to. Because the whole execution sequence in §5 is
> ordered on Cluster A closing first, re-derive that sequence before following
> it.
>
> Second, the leaf counts here disagree with each other and with the build. The
> header says 34; the §2 cluster list sums to 34 (5+9+17+3); the §2 cluster table
> sums to 31 (6+9+13+3). A fresh `proof-blueprint spine` reports **36 leaves**
> (37 open obligations = 36 `sorry`-carrying leaves plus the `sorryAx` node),
> split **Cluster A 6, Cluster B 9, Cluster C 18, Cluster D 3**. The table's 6
> for Cluster A was right and the list's 5 was not; both figures for Cluster C
> are low. Only the Cluster A heading and entry are corrected inline below —
> treat every other count in this document as stale and take
> `proof-blueprint spine` as the roster authority.

---

## 1. Executive Summary

This document presents a topological analysis of the 34 remaining effective `sorry` declarations on the live Problem 97 ATail kernel spine. The spine sorries partition cleanly into **4 structural clusters**. 

The **highest-leverage immediate target** is **Cluster A (`TwoSourceExactCollisionRowsTerminal` / Level 5)**, which contains 5 sorries. Because `TwoSourceFreshCanonicalOverride.false_of_freshCanonicalRowOverride` is completely sorry-free, closing Cluster A terminates the entire Level-5 and FreshThird branches of the proof tree.

---

## 2. Global Topological Breakdown- **Total on-spine declarations with `sorry`**: **34** (down from 35)
- **Direct on-spine sorry count**: 34 unclosed proof obligations
- **Breakdown by structural cluster**:
  - **Cluster A (Level 5 / TwoSource Collision Resolution)**: **5 sorries** (reduced from 6)
  - **Cluster B (TriApex Endpoint Retained Omission)**: **9 sorries**
  - **Cluster C (Rigid221 Pentagons & Exact-17/12 Back-Edges)**: **17 sorries**
  - **Cluster D (Two-Deletion Collision Terminal)**: **3 sorries**

---

## 2. Detailed Breakdown by Cluster

### Cluster A: Level 5 / TwoSource Closure (6 sorries remaining)

Located in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/`:
1. `TwoSourceCanonicalSurface.lean`:
   - [ ] `false_of_crossBlockerCoincidence` (line 136) — **OPEN.** Corrected
     2026-08-20. This entry previously read "CLOSED (verified via
     `proof-blueprint`)", which was wrong in both directions: the theorem is a
     literal `sorry` at `TwoSourceCanonicalSurface.lean:136`, and
     `proof-blueprint spine` lists it among the open obligations rather than
     confirming closure. A 2917-line four-branch proof attempt existed in a
     working tree on 2026-08-17 but was never committed and never
     kernel-checked; it is recoverable from the git ref
     `refs/recovered/crossblocker-proof-20260817`. Its endgame derives `False`
     from two proofs of the same proposition, so read
     `docs/audits/2026-08-20-dead-ends-registry-repo-audit.md` §4.1a before
     resuming it, and do **not** act on the perf-hardening follow-up in
     `docs/audits/2026-08-17-false-of-cross-blocker-coincidence-audit.md`.
2. `TwoSourceClosure.lean`:
   - [ ] `false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual` (line 3205)
3. `TwoSourceFirstFiberCollision.lean`:
   - [ ] `false_of_capSource_firstFiber_outsidePairDeletionExactRows` (line 2650)
4. `TwoSourceFreshThirdResidual.lean`:
   - [ ] `false_of_freshThird_firstNonHit_alignedRetained` (line 3053)
   - [ ] `false_of_freshThird_firstNonHit_commonRadius` (line 3071)
   - [ ] `false_of_freshThirdEqualCenter_noncanonicalInteractions` (line 3244)]
    ClusterC --> C3[Rigid221Closure.lean: 1]

    ClusterD --> D1[TwoDeletionCollision.lean: 3]

| Cluster | Focus Domain | Files | Sorry Count | Impact when Closed |
| :--- | :--- | :--- | :---: | :--- |
| **Cluster A** | Level 5 & FreshThird | `TwoSourceCanonicalSurface.lean`<br>`TwoSourceClosure.lean`<br>`TwoSourceFirstFiberCollision.lean`<br>`TwoSourceFreshThirdResidual.lean` | **6** | Eliminates the entire Level-5 / FreshThird branch; validates `false_of_capSourceThirdCanonicalRowSurface`. |
| **Cluster B** | Tri-Apex Endpoints | `TriApexEndpointRetainedOmission.lean` | **9** | Closes apex-class joint deletion and reverse-hit fresh endpoint cross-hits. |
| **Cluster C** | Rigid 221 & Pentagons | `Rigid221SourceHeavy.lean`<br>`Rigid221Placement.lean`<br>`Rigid221Closure.lean` | **13** | Resolves 12-point carrier ingress, pentagon blocker deletions, and source-heavy branches. |
| **Cluster D** | Two-Deletion Collision | `TwoDeletionCollision.lean` | **3** | Resolves B1 global gap and 4-center common deletion square. |

---

## 3. Deep Dive: Cluster A (Level 5 / TwoSource)

Cluster A represents the core terminal for counterexamples where Cap 1 has cardinality $\ge 8$ (Level 5).

### 1. The Kernel Equivalence Bridge
- **Foundational Result**: `TwoSourceFreshCanonicalOverride.false_of_freshCanonicalRowOverride` (100% sorry-free in Lean) proves that any manufactured `FreshThird` blocker fiber $Q$ outside the three named shells reduces directly to Level 5 (`false_of_capSourceThirdCanonicalRowSurface`).
- **Significance**: Any closure achieved in Level 5 transitively closes the `FreshThird` residual branch.

### 2. Detailed Roster of the 6 Cluster-A Sorries

| # | Theorem Symbol | File & Line | Mathematical Content & Resolution Path |
| :-: | :--- | :--- | :--- |
| **1** | `false_of_capSource_firstFiber_outsidePairDeletionExactRows` | [`TwoSourceFirstFiberCollision.lean:2650`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean#L2650) | **5-Center Deletion on Arc**: Carries `FiveSurvivorExactRowsBoundary` and `FirstFiberCollisionFiveCenterExactRowsResidual`. [`FirstFiberAcyclicFaithfulIngress.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstFiberAcyclicFaithfulIngress.lean) (already sorry-free) converts this into a 6-center carrier boundary containing all 3 Moser apexes, deriving `False` via cyclic boundary order. |
| **2** | `false_of_crossBlockerCoincidence` | [`TwoSourceCanonicalSurface.lean:104`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean#L104) | **4 Cross-Blocker Equalities**: Handles the 4-way OR where a cross-blocker center equals an opposite collision source point. Excluded by circle-cap $(2,1,1)$ intersection bounds. |
| **3** | `false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual` | [`TwoSourceClosure.lean:3205`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean#L3205) | **Enlarged First-Fiber Hard Residual**: Discharges the remaining provenance-preserving fixed-triple audit boundary via `SixSurvivorU3ExactRadiusAuditObstruction`. |
| **4** | `false_of_freshThird_firstNonHit_alignedRetained` | [`TwoSourceFreshThirdResidual.lean:3053`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L3053) | **Aligned Retained Non-Hit**: Aligned retained consumer with source-derived non-hit. Closes via exact retained radii on $S.\text{oppApex1}$. |
| **5** | `false_of_freshThird_firstNonHit_commonRadius` | [`TwoSourceFreshThirdResidual.lean:3071`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L3071) | **Common-Radius Non-Hit**: Independent common-radius provenance surface with non-hit. Closes via `false_of_commonRadius_equalCenters_noncanonicalSameCap_packet`. |
| **6** | `false_of_freshThirdEqualCenter_noncanonicalInteractions` | [`TwoSourceFreshThirdResidual.lean:3244`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean#L3244) | **Equal-Center Residual**: Mixed interaction cases already verified closed; two coherent cases (`distinctBlockersDifferentCaps` and `sameCapWithInternalFiberSource`) reduce to the 6-way pinned center ingress. |

---

## 4. Strategic Execution Sequence

```mermaid
sequenceDiagram
    autonumber
    participant D as Cluster D (Two-Deletion: 3)
    participant A as Cluster A (Level 5 / FreshThird: 6)
    participant B as Cluster B (TriApex Endpoint: 9)
    participant C as Cluster C (Rigid221 Pentagons: 13)

    Note over A: Step 1: Close TwoSourceFirstFiberCollision.lean:2650 via FirstFiberAcyclicFaithfulIngress
    Note over A: Step 2: Close TwoSourceCanonicalSurface.lean:104 (cross-blocker coincidences)
    Note over A: Step 3: Complete TwoSourceFreshThirdResidual.lean:3244 (pinned 6-way ingress)
    Note over A: Result: Level 5 / FreshThird Terminal Complete (0 sorries in Cluster A)

    Note over D: Step 4: Close TwoDeletionCollision.lean (3 sorries) -> B1 Global Gap Complete
    Note over B: Step 5: Close TriApexEndpointRetainedOmission.lean (9 sorries)
    Note over C: Step 6: Close Rigid221 pentagon & source-heavy branches (13 sorries)
```

---

## 5. Next Immediate Step

Execute **Step 1**: Formalize the complete proof of [`TwoSourceFirstFiberCollision.false_of_capSource_firstFiber_outsidePairDeletionExactRows`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean#L2650) using the already sorry-free `collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual` adapter from [`FirstFiberAcyclicFaithfulIngress.lean`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/FirstFiberAcyclicFaithfulIngress.lean).
