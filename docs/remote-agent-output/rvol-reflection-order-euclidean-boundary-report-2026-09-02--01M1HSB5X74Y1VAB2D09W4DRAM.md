# RVOL defect-four reflection-order and Euclidean-boundary stage
**Checkpoint date:** 2026-09-02  
**Scope:** selected-row, finite-metric, cyclic-order, and Euclidean-realizability diagnostics; no P97 or Lean closure claim.
## 1. Executive result

The previously universal-looking six-role/two-K2 motif was a feature of the retained high-n constructions, not a consequence of the sharp defect-four cap count. A canonical type-A reflection order arranges outside-pair owners so that for every outside triple \(a<b<c\), the owner of \(ac\) lies between the owners of \(ab\) and \(bc\). After collapsing one A2 triangle at each endpoint, this gives exactly the defect-four pair accounting.

More importantly, that pair-owner system extends to full four-point cap rows and to an exact rational Kalmanson metric. It then extends again to an abstract all-center K4 / total blocker / complete exact-four shell / deletion-failure system. The package remains consistent until **planar Euclidean realization** is imposed. This is the first clean computational separation of the cheap global RVOL axioms from the genuinely Euclidean layer.

The current highest-leverage proof question is therefore no longer broad high-n incidence enumeration. It is whether the source-derived equality case forces a small planar rigidity circuit, equilateral/rhombus chain, radial-arc overload, Cayley–Menger obstruction, or rank drop that can be stated independently of the particular reflection-order model.

## 2. Exact rational Kalmanson completion

The reflection-order owner system extends to complete four-point cap rows and admits an **exact rational metric** satisfying every prescribed row equality, every strict K1/K2 Kalmanson inequality, every triangle inequality, symmetry, positivity, and zero diagonal. This is a finite metric construction, not a planar coordinate realization.

_No records._
The construction uses a Monge/Kalmanson line arrangement for cross distances, a concave gap function for within-block distances, and an exact rational perturbation chosen below all computed strict margins. It therefore refutes any attempt to close the defect-four quotient from cyclic Kalmanson and ordinary metric axioms alone.

## 3. Abstract metric critical-shell independence models

The exact metric can be extended beyond the cap-centered rows. Outside vertices have many unit-distance cap owners, so four of them can be selected as an outside-centered row. A capacity-four matching then assigns every source to a cap blocker whose **complete unit fiber has cardinality four and contains that source**.

_No records._
For each source q, deleting q leaves **no four-point distance fiber of any radius** at its assigned blocker—not merely no surviving copy of the chosen unit row. The independent verifier reconstructs the exact Fraction-valued metric and recomputes all rows, complete fibers, blocker capacities, deletion checks, codegrees, support connectivity, shared-pair separation, and the seven-source mutual-omission condition.

These models are deliberately not called Lean `CriticalShellSystem` values: that structure lives in Euclidean space. They are independence countermodels for the corresponding finite metric/incidence axiom package.

## 4. Where the exact metric leaves Euclidean geometry

An exact Cayley–Menger audit supplies a small honesty certificate for each chosen metric. A nonzero four-point Cayley–Menger determinant shows that the displayed metric itself does not embed in the Euclidean plane. This does **not** prove that no other metric satisfying the same row equalities embeds in the plane.

_No records._
## 5. Exact local Euclidean screens

### 5.1 Equilateral and rhombus propagation

If the same outside point occurs in neighboring cap rows, the corresponding triangle is equilateral. If it occurs in rows two positions apart, the intervening center gives an equilateral rhombus and an affine parallelogram identity. These equations were propagated exactly over \(\mathbf Q(\zeta_6)\).

_No records._

### 5.2 Radial-arc budget

For a fixed outside point v, all of its owner centers lie on one radius circle. Their polar angles lie in an open semicircle, while each adjacent owner transition advances exactly \(\pi/3\). Consequently at most two consecutive-owner transitions can occur at one v.

_No records._
The familiar seven-center circle walk is the extremal special case: six consecutive equilateral steps around the same outside pivot force the first and seventh centers to coincide. Reflection orders can avoid such long runs, so this is a useful cut rather than a universal closure.

## 6. Direct nonlinear-real probe

The smallest sharp systems were sent directly to exact QF_NRA in cumulative stages: unit equalities, then pairwise point distinctness, then the prescribed strict-convex cyclic order. Every SAT result is accepted only after replaying all asserted formulas in the returned model; timeouts and solver unknowns remain `UNKNOWN`, never UNSAT.

_No records._
## 7. Rigidity-circuit extraction

The full unit graph is overbraced, so random generic-rigidity bases were used to extract fundamental Laman circuits. Each retained circuit was minimized combinatorially and checked before being sent to QF_NRA first as a distinct unit-distance framework and then with its inherited strict convex order. UNSAT entries remain solver-only unless accompanied by a proof artifact; SAT entries require assertion replay.

_No records._
## 8. Formalization and next-work boundary

### 8.1 Formalize now

1. **Tightness extraction for `orderedCap_card_add_four_le_choose_outside`.** Equality should yield exactly three outside points at the two endpoint rows, exactly two at every interior cap row, and a partition of all outside pairs. The existing theorem proves only the cardinality inequality.

2. **Radial-arc budget.** For a fixed outside point, prove that at most two consecutive cap-row transitions can share it. The seven-center/equilateral-hexagon contradiction is a useful small corollary.

3. **Equilateral-rhombus affine adapters.** Package the distance equalities and cyclic orientation that imply the \(60^\circ\) rotation and parallelogram identities. These are exact Euclidean consequences absent from abstract Kalmanson metrics.

4. **Singleton-intersection to six-role order adapter.** This feeds the already existing three-row Kalmanson consumers. It remains useful as a local cut, although the reflection-order model shows that the particular six-role triangle is not forced solely by defect-four pair accounting.

### 8.2 Do not promote

- The abstract finite metrics are not Euclidean coordinate models.
- A nonzero Cayley–Menger determinant rejects only the chosen metric, not every metric with the same row equalities.
- Numerical no-hit is not UNSAT.
- QF_NRA `UNKNOWN` is open, and solver-only UNSAT is not a checked certificate.
- The finite reflection-order constructions do not supply a genuine MEC/Moser cap packet or `CounterexampleData.Minimal`.

### 8.3 Recommended next computation

Work from the equality/tightness quotient, but replace broad whole-carrier search by **small forced Euclidean circuit mining**. Enumerate reflection orders only up to their local rank-two/root-system patterns, attach the source-forced neighbor rows, extract Laman circuits and circle chains, and seek a circuit that occurs in every admissible order. For each candidate, use exact elimination or a proof-producing finite certificate and then map it to a small Lean geometric theorem.

## 9. Integrity audit

_No integrity ledger found._
## 10. Artifact map

- `reflection_order_probe.py`: pair-owner reflection-order construction and local Kalmanson quotient.
- `full_cap_row_probe.py`: full four-point cap-row completion.
- `exact_kalmanson_construction.py`: exact rational Kalmanson/metric construction.
- `verify_exact_kalmanson_metrics.py`: independent exact replay.
- `abstract_metric_critical_shell_model.py`: all-center K4 and total exact-shell/blocker extension.
- `verify_abstract_metric_critical_shell.py`: independent finite-metric/source replay.
- `equilateral_rhombus_linear_probe.py`: exact \(\mathbf Q(\zeta_6)\) propagation.
- `radial_arc_budget_probe.py`: exact radial-arc overload screen.
- `qfnra_unit_convex_probe.py`: cumulative exact nonlinear-real probe.
- `rigidity_circuit_probe.py`: Laman-circuit extraction and local QF_NRA checks.
- `stage_integrity_audit.py`: independent verifier runner, JSON parser, compiler pass, and checksum manifest.
- `artifacts/figures/rect_support.png`: retained rectangle/support visualization.
