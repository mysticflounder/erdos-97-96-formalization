# Adversarial Red-Team Audit: B-Family Closure Plan

**Date**: 2026-08-18  
**Target Document**: [`docs/plans/2026-08-18-b-family-closure-plan.md`](file:///Users/adam/projects/math-projects/erdos-97-96-formalization/docs/plans/2026-08-18-b-family-closure-plan.md)  
**Auditor**: Antigravity Rigor & Alignment Engine  
**Objective**: Stress-test every step, assumption, and proof route in the B-family closure plan to identify all mathematical vulnerabilities, invalid geometric assertions, and missing bridges.

---

## Executive Summary of Findings

| Step | Scope | Vulnerability Level | Core Obstruction Identified |
| :--- | :--- | :---: | :--- |
| **Step 1** | B2 Normal Form Promotion | **`LOW` (Sound Adapter)** | Step 1 is mathematically proven in `B2Arm3.lean`, but it is **only a normal-form reduction** ($3 \to 1$ arm). It does *not* close B2. |
| **Step 2 & 3** | B2 Convex Center Exclusion | **`CRITICAL` (Defective Geometric Claim)** | **A circle center $w$ and 4 points on its circumference CAN be in strictly convex position in $\mathbb{R}^2$** (whenever the 4 points lie on an open arc $< 180^\circ$). Convexity alone does NOT force `False`. |
| **Step 4** | B1 Escape Point Transport | **`CRITICAL` (Refuted Inductive Target)** | `B1GlobalGapOrClosedTerminal` has 3 branches, but Branches 1 & 2 are proven impossible by `b1_live_bisectorSet_eq_pair`, and Branch 3 requires overlap $\ge 3$, whereas `b1_live_escape_small_overlap` produces overlap $\le 2$. |
| **Step 5** | B3 Survival Square Infeasibility | **`HIGH` (Missing Metric Bridge)** | No theorem in `Geometry/` currently maps the 4-center deletion square to `fivePointCircleIsoscelesOrder` or `SimilarityFrame`. |

---

## Detailed Vulnerability Analysis by Step

### 1. Adversarial Audit of Step 1 (Normal Form Promotion)
* **The Claim**: Porting `B2Arm3.lean` theorems into `TwoDeletionCollision.lean` unifies the 3 collision branches $z_1 = \beta(u) \lor z_1 = \beta(v) \lor z_1 = \beta(z_2)$ into $\exists x \in \{u, v, z_2\}$, $z_1 = \beta(x)$.
* **Audit Finding**:
  - **Verdict**: **`SOUND REDUCTION`**.
  - **Verification**: `b2_collision_uniform_normalForm` typechecks against the exact binders of B2 in `lean/scratch/b-family-bank/B2Arm3.lean:417–494` with zero sorries and standard axioms.
  - **Risk**: Executing agents might mistake Step 1 for closing the B2 leaf. It must be explicit that Step 1 only reduces the surface from 3 arms to 1 unified obligation `false_of_exactFourMutualOmission_center_in_carrier`.

---

### 2. Adversarial Audit of Step 2 & Step 3 (B2 Center-in-Carrier Exclusion)
* **The Claim**: A circle center $z_1 \in D.A$ of 4 points $\operatorname{Row}(x) \subseteq D.A \setminus \{z_1\}$ in convex position violates `ConvexIndep D.A`.
* **Adversarial Counterexample (Mathematical Refutation)**:
  - Let $z_1 = (0, 0)$.
  - Let $\operatorname{Row}(x)$ be 4 points on the unit circle in the first quadrant:
    $$P_1 = (\cos 10^\circ, \sin 10^\circ), \quad P_2 = (\cos 30^\circ, \sin 30^\circ), \quad P_3 = (\cos 50^\circ, \sin 50^\circ), \quad P_4 = (\cos 70^\circ, \sin 70^\circ)$$
  - All 4 points lie in an arc of $60^\circ < 180^\circ$.
  - The convex hull of $\{P_1, P_2, P_3, P_4\}$ is a convex polygon strictly contained in the half-plane $x + y > 0.8$.
  - The origin $z_1 = (0, 0)$ is strictly outside this convex hull ($z_1 \notin \operatorname{convexHull}(P_1, P_2, P_3, P_4)$).
  - The polygon with vertices $(z_1, P_1, P_2, P_3, P_4)$ is a **strictly convex pentagon** in $\mathbb{R}^2$!
  - Therefore, the 5 points $\{z_1, P_1, P_2, P_3, P_4\}$ are in **strictly convex position** (`EuclideanGeometry.ConvexIndep`).
* **Conclusion**:
  - **Convex independence of $z_1$ and $\operatorname{Row}(x)$ is SATISFIABLE.**
  - Claiming that a circle center and 4 points on its circumference cannot be in convex position is **FALSE**.
  - **Required Correction for B2**: The contradiction must come from the interaction with the **ambient second-cap circle** $\operatorname{SelectedClass}(S.\text{oppApex2}, \rho)$.
    Specifically:
    1. $z_1$ and $x$ both lie on the circle centered at $S.\text{oppApex2}$ of radius $\rho$.
    2. $x$ and at most one other point $x'$ of $\operatorname{Row}(x)$ lie on this same circle ($\operatorname{Row}(x) \cap C \le 2$).
    3. The other 2 points of $\operatorname{Row}(x)$ lie in the interior or exterior of the cap.
    4. The mutual omission with $u, v \in C$ forces an angular configuration incompatible with the convexity of the outer polygon containing $S.\text{oppApex2}$.

---

### 3. Adversarial Audit of Step 4 (B1 Escape Point Transport)
* **The Claim**: Connect `b1_live_escape_small_overlap` to `B1GlobalGapOrClosedTerminal C`.
* **Adversarial Counterexample (Structural Refutation)**:
  - `B1GlobalGapOrClosedTerminal C` is defined as a 3-way disjunction:
    - Branch 1: $\exists c \in D.A \setminus \{b, S.\text{oppApex2}\}$, $\operatorname{dist}(c, z_1) = \operatorname{dist}(c, z_2)$. (Proven EMPTY by `b1_live_bisectorSet_eq_pair`).
    - Branch 2: $|\operatorname{PB}(z_1, z_2) \cap D.A| \ge 3$. (Proven FALSE by `b1_live_bisectorSet_eq_pair`).
    - Branch 3: $\exists t \in C$, $|\operatorname{Row}(t) \cap \operatorname{Row}(z_1)| \ge 3$. (Directly contradicts `b1_live_escape_small_overlap` which proves overlap $\le 2$).
  - Therefore, `B1GlobalGapOrClosedTerminal C` is an **unsatisfiable target definition**!
* **Conclusion**:
  - You cannot prove `B1GlobalGapOrClosedTerminal C` as currently defined.
  - **Required Correction for B1**: The B1 target must bypass `B1GlobalGapOrClosedTerminal` and directly prove `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` by feeding the escape point $t$ (with overlap $\le 2$) into the cap geometric contradiction with $(u, v)$.

---

### 4. Adversarial Audit of Step 5 (B3 Survival Square)
* **The Claim**: 4 centers $C_4$ form a deletion-survival square ruled out by `SimilarityFrame` / `FivePointCircleIsosceles`.
* **Audit Finding**:
  - `b3_gap_refuted` in `BFamilyBank.lean` proved that the vertex-removability route is dead.
  - The geometric bridge formalizing the non-existence of a 4-cycle of mutually equidistant circles in a convex cap does not yet exist in `lean/Erdos9796Proof/Geometry/`.
* **Conclusion**:
  - Step 5 requires first constructing the geometric lemma in `Geometry/` before attempting to wire it to B3.

---

## Required Plan Amendments

1. **Fix B2 Geometric Engine**: Replace the false "center cannot be in convex position with 4 points" claim with the true "2-circle intersection + cap boundary angular span" theorem.
2. **Bypass Defective B1 Inductive Inductive Wrapper**: Refactor `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` to directly consume the escape point $t$ rather than routing through the refuted `B1GlobalGapOrClosedTerminal`.
3. **Formalize B3 Metric Lemma**: Specify the exact coordinate geometry lemma required in `lean/Erdos9796Proof/Geometry/FourCircleSquareObstruction.lean`.
