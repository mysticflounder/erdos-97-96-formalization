<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Dead Ends — Erdős 97 don't-repeat registry

> **Scope and provenance (updated 2026-08-19).** This document is a historical
> registry of precise propositions, encodings, and proof routes that were
> refuted, closed, found insufficient, or retired during development of the
> removable-vertex and U-lane arguments. It was imported from the historical
> `p97-rvol` repository on 2026-07-05. References to `RVOL.P97.*` should now be
> read as historical names for declarations usually imported under
> `Erdos9796Proof.P97.*`.
>
> **This is not a live-status document.** Do not infer the current frontier,
> current leaf count, or current consumer graph from any historical entry below.
> For live truth, run `proof-blueprint spine`; `docs/live-blueprint.md` is only a
> generated snapshot. Current strategy and evidence status live in the dated
> plans and audits referenced from `README.md`.
>
> **Audit boundary.** This revision corrects source-level mathematics, logical
> scope, and status terminology. It does not independently replay every
> historical solver job. Several cited `p97-rvol` audits, postmortems, and scratch
> artifacts were never copied into this repository. An entry supported only by
> such material is marked as historical evidence rather than silently promoted
> to a repository-reproducible theorem.

## 1. How to read this registry

A route is barred only to the extent stated in its **Exact scope** field. In
particular:

- a counterexample to one lemma does not refute stronger lemmas with additional
  hypotheses;
- a timeout is not a mathematical verdict;
- failure of a bare combinatorial encoding does not refute metric or rank-lifted
  versions;
- an off-spine theorem can still be mathematically useful or even prove the
  headline result directly;
- a route equivalent to solving Erdős 97 is not a shortcut, but it is not a
  mathematical dead end.

The phrase **do not retry** means:

> Do not repeat the exact proposition, exact hypothesis language, and exact proof
> or solver encoding recorded here unless the new attempt identifies the changed
> ingredient.

It never means that an undefined family such as “all topology,” “all counting,”
“all stress methods,” or “all algebraic methods” has been ruled out.

### 1.1 Verdict vocabulary

| Verdict | Meaning |
|---|---|
| `FALSE_EXACT` | An exact counterexample refutes the stated proposition. |
| `FORMALLY_CLOSED` | A Lean theorem closes the exact target, including the stated transport. |
| `FORMAL_CORE_ONLY` | A coordinate, algebraic, or analytic core is formalized; transport from the project packet remains prose or conditional. |
| `CIRCULAR` | A required hypothesis or invoked equality is equivalent to, or already implies, the target in the stated setting. |
| `HYPOTHESIS_MISMATCH` | The proposed theorem does not apply to the objects supplied by the packet. |
| `CERTIFICATE_CONE_IMPOSSIBLE` | A target-negative point in the closure rules out certificates in the exact recorded closed cone or quadratic module. |
| `SOLVER_UNSAT_EXACT_ENCODING` | An exact branch encoding was reported UNSAT; replay and certificate status must be stated separately. |
| `ENCODING_TIMEOUT` | The exact encoding timed out at the recorded budget. No mathematical conclusion follows. |
| `ENCODING_UNSOUND` | The solver model omits or relaxes a load-bearing source hypothesis. |
| `NUMERICAL_EVIDENCE_ONLY` | Sampling or floating-point computation suggests a conclusion but does not prove it. |
| `INSUFFICIENT_ALONE` | The tested count, invariant, or packet has models or slack and cannot close the target by itself. |
| `FALSE_IN_RECORDED_RELAXATION` | An exact witness refutes a relaxation that omits specified hypotheses, often convexity coupling. |
| `REDUCED_TO_GLOBAL_CLOSURE` | The route is not locally closed; it becomes a global closure or synchronization problem. |
| `OFF_CURRENT_SPINE` | No verified current consumer is recorded. This is an engineering status, not a mathematical refutation. |
| `EQUIVALENT_TO_FULL_PROBLEM` | The route would solve Erdős 97 directly rather than provide a local shortcut. |
| `BLOCKED_BY_SPEC_MISMATCH` | The prose packet, row ledger, or coordinate dictionary is inconsistent or incomplete. |
| `STALE` | The status statement or target has been superseded by the current source. |
| `CONJECTURED` | A negative strategic assessment has not been proved. |
| `REOPEN_WITH_NEW_COUPLING` | The bare route failed, while a specified enriched version remains outside the no-go. |

### 1.2 Evidence vocabulary

Each durable verdict should identify its strongest evidence tier.

| Tier | Evidence |
|---|---|
| `LEAN` | Lean theorem with the relevant axiom closure recorded. |
| `EXACT_CERT` | Independently replayable exact certificate. |
| `EXACT_WITNESS` | Exact rational or algebraic counterexample. |
| `EXACT_SOLVER` | Exact solver result without a separately replayed certificate. |
| `PROSE` | Hand proof or source-level logical argument. |
| `NUMERICAL` | Sampling or floating-point evidence only. |
| `HISTORICAL` | Evidence is cited in an unavailable or unimported historical artifact. |

A numerical observation must not be labeled `FALSE_EXACT`. A solver timeout must
not be labeled `PROVEN`. A formal core must not be labeled `FORMALLY_CLOSED` when
the packet-to-core transport is still prose.

### 1.3 Required fields for future entries

Every new entry should record:

1. **Exact target** — a quantified proposition or named Lean declaration;
2. **Verdict** — one of the statuses above;
3. **Evidence** — theorem, witness, command, artifact path, and trust tier;
4. **Exact scope** — the hypotheses and proof language actually ruled out;
5. **Not ruled out** — nearby stronger or differently coupled formulations;
6. **Current consumers** — exact declarations, or `none`, checked against a
   stated source revision or fresh `proof-blueprint` run;
7. **Reopen condition** — the specific new ingredient that escapes the recorded
   failure.

The imported historical entries below do not assert a fresh per-entry consumer
audit. Unless a declaration is explicitly named as current, read their
**Current consumers** field as `unverified; consult the current dependency graph`.

## 2. Global conventions

### 2.1 Historical surplus-cap escape notation

Several historical routes were grouped under the label `(Q)`. That label is
retained only as a historical cross-reference; it is not the current frontier and
must not be used as an unproved equivalence between different declarations.

For a finite carrier `A`, center `p`, and radius `r > 0`, write

\[
T_A(p,r)=\{x\in A:\operatorname{dist}(p,x)=r\}.
\]

For a specified cap `C_i`, the historical **escape event** is

\[
|T_A(p,r)|\ge 4 \quad\text{and}\quad T_A(p,r)\nsubseteq C_i.
\]

Thus an escape asserts that the radius class has at least four members and that
**at least one** member lies outside `C_i`. It does not assert that four points
individually escape the cap.

Historical targets such as U1.3, U2.B, c5d3b, U5 support confinement, and the
unit-distance specializations were connected by one-way reductions with
additional hypotheses. Unless the repository contains an explicit `Iff`, do not
write `U2.B ≡ U5-t1`, “all the same object,” or an equivalent universal slogan.
Record the exact implication and all hypotheses instead.

The unit-distance target has a stronger antecedent than the variable-radius
same-distance target and is therefore logically weaker as a theorem target. This
document does not claim a strict separation unless an explicit witness is given.

No `∃ℝ`-hardness or `∃ℝ`-completeness theorem for the relevant P97 decision
problem is established here. The coordinate systems are nonlinear existential
real systems and can have positive-dimensional or component-sensitive solution
sets; that observation is not a complexity classification and does not rule out
structural proofs on the project instances.

### 2.2 Caps are chord-separation sets, not circle classes

`OnArcOpposite` is a signed-area half-plane test. Cap membership does not supply
an apex-centered circle equation.

The Moser packet proves that the three selected Moser vertices lie on the minimum
enclosing circle. It does **not** prove that they are the only carrier points on
the MEC boundary. A regular hexagon with alternating selected Moser vertices is a
counterexample to that stronger claim.

Likewise, `capInteriorByIndex` means that the two cap endpoints have been erased
from the closed cap. It does not by definition imply

\[
\operatorname{dist}(x,O)<R_{\mathrm{MEC}}.
\]

All carrier points lie in the closed MEC disk, so the generally available bound
is weak unless a separate theorem proves strictness. Consequently:

- do not treat a cap as an “adjacent-cap circle”;
- do not infer strict MEC-disk membership merely from endpoint-erased cap
  membership;
- two-circle, radical-axis, or vesica arguments require two genuine circle
  equations supplied independently by the packet;
- a specialized theorem may still show that a point lying on both the MEC and a
  named apex circle is one of two intersections. That is different from saying
  that every non-endpoint cap point is strictly inside the MEC.

### 2.3 Solver and algebra semantics

- For historical `msolve` output, `[-1]` means complex emptiness;
  `[1,n,-1,[]]` reports positive dimension; `[0,…]` reports zero dimension.
  Read the complete tuple.
- Complex Gröbner bases do not detect real infeasibility caused only by order or
  sign inequalities.
- A square-slack variable does not repair that limitation over an algebraically
  closed field: every complex value has a square root.
- Monolithic Boolean-selector nonlinear-real encodings timed out at the recorded
  budgets. That verdict is encoding-specific.
- Explicit-class, per-branch QF_NRA resolved many historical branches and remains
  a legitimate finite-branch method. Unresolved branches are `ENCODING_TIMEOUT`,
  not mathematical survivors or impossibilities.
- Partial-K4 and fixed-frame SAT models are not counterexamples to the global
  theorem unless the omitted hypotheses are restored.
- Use exact rational or symbolic literals. Floating-point “SAT” at residuals near
  machine precision is not evidence of realizability.

### 2.4 Source and consumer discipline

Lean symbol names are more stable than historical file paths and line numbers.
When an entry cites an unavailable `p97-rvol` artifact, mark the evidence
`HISTORICAL` and copy the minimum exact witness or certificate into this
repository before using it as a permanent ban.

Before acting on any claim that a theorem is live, closed, or off-spine:

```bash
proof-blueprint spine
proof-blueprint axioms <symbol>
```

or inspect the current import graph directly. A status in this registry is not a
substitute for that check.

---

## 3. Historical U1.3 / U2.B surplus-cap family

**Cluster status:** `STALE` as live-frontier text; retained as a historical route
family. The old three-leaf U-lane frontier and the slogan “U1.3/U2.B = (Q)” must
not be used as current source truth.

### 3.1 Banked one-way reductions

**Verdict:** `FORMALLY_CLOSED` for the named implications; no blanket
biconditional.

- `u1EquilateralTransfer_proof` records a one-way implication from the stated
  `IsM44` and U1.3 hypotheses to an equilateral conclusion. Its contrapositive is
  available only with the same hypotheses.
- `u2FullDistanceClasses_of_capContainment` records that a K4 radius class
  contained in a size-four cap equals that cap. This is a cardinality squeeze
  from cap containment to the historical U2 conclusion; it does not produce cap
  containment.
- `U5DangerousTriple.candidate_of_not_mem_boundedSupport` is a separate
  escape-promotion bridge with its own hypotheses. It is not, without an explicit
  reverse implication, an equivalence with U2.B.

**Exact scope:** Preserve these implications and cite their hypotheses. Do not
collapse them into a single unnamed proposition.

### 3.2 Midpoint/docstring route

**Verdict:** `FALSE_EXACT` for the implication from the listed one-sided midpoint
inequalities and an unpinned K4 witness to cap equidistance.

**Evidence:** The historical `scratch/u13_equidist/` record reports an exact
non-equilateral unit-MEC model satisfying the named disk, cap-side, and midpoint
facts while violating the intended equidistance conclusion. The midpoint lemmas
themselves are one-sided inner-product inequalities; K4 supplies an existential
radius class somewhere in `A`, not an identification of that class with the cap.

**Exact scope:** Those hypotheses alone do not pin the K4 witness set to the cap.

**Not ruled out:** A theorem with an explicit class-to-cap incidence, a full row
identity, or a new metric-rank coupling.

### 3.3 Apex-distance monotonicity, Build B

**Verdict:** `FALSE_EXACT` for the local apex-centered one-hit/strict-monotonicity
statement represented by `N8a3AdjacentCapDistanceStrict`.

**Evidence:** The historical Frame-I witness in `scratch/u13_buildB/` places
four strict-convex, cap-side, closed-disk points at common squared distance
`49/16` from the apex.

**Exact scope:** No theorem may assert the same local monotonicity from only the
recorded frame, cap-side, disk, distinctness, and convexity hypotheses.

**Not ruled out:** Endpoint-centered monotonicity, additional global K4 rows,
exact blocker-row hypotheses, or a stronger order-sensitive metric packet.

### 3.4 Endpoint monotonicity, Build A

**Verdict:** `INSUFFICIENT_ALONE`.

**Evidence:** The endpoint injectivity/subsingleton machinery is formal and
size-agnostic, but the historical Form-A counting tail uses the exact two-point
cap-interior and nine-point partition. That arithmetic does not automatically
lift to a surplus cap with at least three interior points.

**Exact scope:** The old endpoint engine plus the old nine-point cover budget does
not produce the desired containment in the surplus-cap regime.

**Not ruled out:** A different counting invariant, a multi-center overlap theorem,
Hall deficiency, a power-rank obstruction, or a larger packet that controls the
surplus points. The stronger slogan “no sieve repair” is not established.

### 3.5 QF_NRA experiments

**Verdict:** Mixed:

- monolithic Boolean-selector formulations — `ENCODING_TIMEOUT`;
- individually resolved exact-class branches — `SOLVER_UNSAT_EXACT_ENCODING`;
- unresolved explicit-class branches — `ENCODING_TIMEOUT`;
- partial-K4 or fixed-frame SATs used as global models — `ENCODING_UNSOUND`.

**Evidence:** Historical runs in `scratch/u13_global/` and
`scratch/u13_combo/` reported 91 exact-class UNSAT branches and 35 timeouts in
one `(5,4,4)` gate, while selector-based encodings timed out at the recorded
budgets. Consult the exact scripts and formulas before relying on any number.

**Exact scope:** Do not repeat the same selector encoding merely with a larger
budget unless the branching or algebra changes.

**Not ruled out:** Explicit-class branch decomposition, exact EDM/rank filters,
CAD or QE on bounded residuals, certified resultants, or solver calls after
stronger source-level reductions.

### 3.6 Global isosceles first-moment counting

**Verdict:** `INSUFFICIENT_ALONE`.

**Evidence:** The available upper and lower bounds leave slack in the relevant
cardinality range. The escape event by itself does not supply the extra pair or
five-member class needed by the stronger local lower-bound lemmas.

**Exact scope:** The recorded scalar first-moment comparison does not yield a
strict contradiction.

**Not ruled out:** Overlap-sensitive counts, second moments, row synchronization,
or a direct unit-distance/firewall theorem. A firewall proving that no convex
`PerVertexK4` configuration exists would prove Erdős 97 directly; it is not
mathematically irrelevant merely because it bypasses removable-vertex descent.

### 3.7 Bare order type and decorated chirotope

**Verdict:** `REOPEN_WITH_NEW_COUPLING`.

**Evidence:** A planar chirotope alone does not determine equal distances. The
historical same-order-type example with a shifted data point separates orientation
data from a data-point-centered equidistance relation.

**Exact scope:** Bare order type and the exact tested decorations are insufficient
to decide the metric incidence.

**Not ruled out:** Circle-power matrices, Euclidean-distance-matrix rank/PSD,
perpendicular-bisector rank, Kalmanson inequalities, paraboloid lifts,
metric-labeled oriented matroids, or support patterns coupled to proved nonzero
entries. In particular,
`lean/Erdos9796Proof/P97/Census554/CirclePowerMatrix.lean` contains a
rank-at-most-four mechanism whose unique-possible-matching criterion is a genuine
finite combinatorial/algebraic coupling, not a bare chirotope. Such a determinant
certificate is sound only when every nonmatching term contains an entry proved
zero and every entry in the unique surviving matching is proved nonzero. A point
outside a chosen four-subset is not automatically off the underlying full circle;
that nonzero fact requires exact-class or equivalent source evidence.

### 3.8 Equilateral subcase

**Verdict:** `CIRCULAR` when an equilateral Moser frame is assumed solely to prove
a theorem whose hypotheses are pre-equilateral and from which equilateralness is
only obtained downstream.

**Exact scope:** The historical U2.B producer cannot assume the downstream
conclusion as an input.

**Not ruled out:** Equilateral-conditional lemmas once equilateralness is produced
independently in another branch.

### 3.9 Minimality and essential-center coverage

**Verdict:** `INSUFFICIENT_ALONE` for the crude member-coverage count.

**Evidence:** At the historical eleven-point scale, covering the carrier by
four-member critical classes forces only three centers by the scalar estimate.
That does not by itself force a repeated-circle incidence.

**Exact scope:** Minimality used only through `|A| ≤ 4|N|` has insufficient
structure.

**Not ruled out:** Exact unique-four rows, deletion survival, common-deletion
collisions, five- or six-center synchronization, Hall/Dulmage–Mendelsohn
structure, or power-support rank. Minimality may have substantial producer force
when coupled to those data.

### 3.10 Finite-endpoint and spine discipline

**Verdict:** `OFF_CURRENT_SPINE`, not mathematically dead.

`FiniteN9Closure` and related finite-cardinality theorems are genuine results.
They do not automatically reduce a generic large-cardinality leaf. The current
project also has sorry-free exact-ten and exact-eleven endpoints, giving a
compiler-trusted project bound `n ≥ 12`; the strongest bound avoiding compiler
trust is `n ≥ 10`.

**Rule:** Check the current consumer graph before assigning work. Do not infer
that a theorem is worthless merely because it is off the present descent spine.

---

## 4. b1a1M cap-subchain monotonicity and the ★ inequality

**Cluster status:** Historical. The angular core contains useful formal lemmas,
but the former universal bans on SOS, case splits, and arc-angle methods were too
broad.

### 4.1 Arc-angle transport

**Exact target:** Derive strict monotonicity of distances from an arbitrary cap
vertex `p` by applying `arcAngle_chord_length_strict_mono` to the compared points.

**Verdict:** `HYPOTHESIS_MISMATCH`; in the historical use, also circular at the
load-bearing step.

**Reason:** The arc-angle theorem requires the compared points to lie on one
circle centered at `p`. In b1a1M, proving that the relevant points do not have the
same `p`-distance is the target. Supplying the needed cospherical hypothesis
therefore assumes the disputed metric relation rather than deriving it from cap
membership.

The historical claim that a broader “Thales with one chord endpoint in the disk”
statement is false was supported in the old text by sampling counts only. Retain
that as `NUMERICAL_EVIDENCE_ONLY` until an exact witness is copied into this
repository.

**Exact scope:** Do not apply the cospherical theorem when the packet supplies
only cap order, disk membership, and signed-area inequalities.

**Not ruled out:** A genuine circle supplied by an independent row, a coordinate
proof in a normalized frame, or an arc theorem whose hypotheses match the open
cap geometry.

### 4.2 Closed-cone SOS / Putinar search for ★

Let

\[
G=\langle E_{\mathrm{right}}-x,\,x-p\rangle.
\]

The formal metric identity relates the desired distance comparison to the sign of
`G`.

**Verdict:** `CERTIFICATE_CONE_IMPOSSIBLE` for the exact unsaturated closed
quadratic module generated by the recorded weak signed-area and disk-slack
constraints.

**Evidence:** The closure of that weak hypothesis set contains a degenerate point,
for example the recorded collapse `E_left = p = f`, `x = -f`, at which every
listed weak generator is nonnegative or zero while `G < 0`. Any identity in that
closed quadratic module would imply `G ≥ 0` at the same point, a contradiction.

**Exact scope:** This rules out certificates in that exact closed cone at every
degree.

**Not ruled out:**

- a strict Positivstellensatz using the genuine open hypotheses;
- saturation by nonzero factors, for example adjoining `t g - 1 = 0` when
  geometry proves `g ≠ 0`;
- a Stengle preordering;
- component decomposition;
- exact real quantifier elimination;
- a hand or Lean analytic proof.

The old sentence “no finite polynomial case split removes the collapsed point” is
false as a universal statement. It applies only to the tested splits whose closed
branches both retain the collapse. A saturation or a split carrying an explicit
nonvanishing certificate can remove that boundary component.

### 4.3 Formal angular core

**Verdict:** `FORMAL_CORE_ONLY` for the retained b1a1M metric/angular lemmas;
`OFF_CURRENT_SPINE` unless a fresh consumer audit says otherwise.

`b1a1M_metric` and `b1a1m_G_nonneg_angular` preserve useful exact reductions and
an angular nonnegativity theorem in the genuine strict/open regime. The old
Cartesian-to-angular extraction bridge was not built because the historical
consumer needed only distance inequality `≠`, already supplied by
`CGN6c_oneSidedDistanceInjective`, rather than a strict order.

**Maintenance rule:** The “no consumer” finding was source-verified historically,
not permanently. Recheck the current dependency graph before deleting or reviving
the bridge.

### 4.4 Related N8a3 routes

**Verdict:**

- composition through the off-center b1a1M circle argument —
  `HYPOTHESIS_MISMATCH`;
- reuse of a theorem whose center/order roles do not match —
  `HYPOTHESIS_MISMATCH`;
- normalized rigid-frame coordinate analysis — `FORMAL_CORE_ONLY` through the
  named `U2OneHitMonotone.lean` result unless its source packet is fully wired.

Do not generalize the failure of the first two transports into a ban on all
one-hit theorems.

---

## 5. Historical c5d adjacent-cap kernels

**Cluster status:** Historical and generally off the current publish spine. The
entries remain useful because they separate exact local falsehoods from formal
coordinate cores whose abstract transport was never completed.

### 5.1 c5d0 q-star outside-disk core

In the normalized frame

\[
v_1=(\cos h,-\sin h),\qquad
v_3=(\cos h,\sin h),\qquad
q=(\cos h-\sqrt3\sin h,0),\qquad
r=2\sin h,
\]

the recorded second intersection `q*` satisfies

\[
\|q^*\|^2-1=4\sqrt3\sin h\sin(h-\pi/6).
\]

With the c5d0-specific center-`v3` isosceles equality and the non-obtuse Moser
condition, the coordinate packet forces `h ≥ π/4`, hence `q*` lies outside the
unit disk.

**Verdict:** `FORMAL_CORE_ONLY`.

**Evidence:** The coordinate implications are formalized by
`c5d0_qstar_outside_disk` and `c5d0_contradiction`. The old document explicitly
states that the abstract-packet-to-coordinate-frame transport remained prose.

**Exact scope:** The core closes only packets that genuinely provide the
center-`v3` equality and every normalization hypothesis.

**Not ruled out:** Other c5d rows lacking that equality. Do not cite the formal
coordinate theorem as a completed abstract closure until the transport is a Lean
theorem.

### 5.2 c5d1c0 obtuse-angle core

**Verdict:** `FORMAL_CORE_ONLY` for the named coordinate/angle theorems and
`BLOCKED_BY_SPEC_MISMATCH` for the unresolved prose transport.

The inscribed-angle reduction and the named coordinate rows
`c5d1c0_angle_v2_obtuse`, `c5c4a2_qstar_on_O_side`,
`c5c4b3_angle_v2_obtuse`, and `c5c3c_angle_v2_obtuse` are retained. For the rows
whose step-1 cap bridge remained prose, the route is not fully closed.

The historical row prose also disagrees with the row ledger about the center-`q`
class: one description includes `v3`, while the ledger gives a class such as
`{v1,v2,u,y}`. Until that mismatch is resolved, no verdict depending on the prose
class identity may be marked `FORMALLY_CLOSED`.

**Reopen condition:** State the exact row in one canonical structure and prove the
packet-to-coordinate transport.

### 5.3 Framing-2 local distance monotonicity

**Verdict:** `FALSE_EXACT` for the specific inequality

\[
\langle u-v_1,\,v_1-q\rangle\ge0
\]

under the recorded local Framing-2 hypotheses.

**Evidence:** The exact point

\[
u_0=(\tau_0,0),\qquad
\tau_0=\cos h+(2-\sqrt3)\sin h,
\]

lies in the required interior cap position and on the disputed circle, while the
claimed sign has margin `(√3-2) sin h < 0`.

**Exact scope:** Do not reuse this inequality or any theorem that specializes to
it under the same packet.

**Not ruled out:** A different center, a stronger global row system, or a metric
comparison not implying the refuted inequality.

### 5.4 Vesica local model

**Verdict:** `FALSE_EXACT` for the claim that the **listed local vesica packet
alone** is inconsistent.

**Evidence:** The historical open-condition model constructs nearby points `u_e`
and `w_e` on the two named equal-radius circles, satisfying the specified local
cap-side, distinctness, and center-`q` K4 conditions.

**Exact scope:** No contradiction follows from that exact local packet alone.

**Not ruled out:** Additional K4 rows at other centers, full carrier convexity,
minimality, deletion synchronization, exact blocker rows, or a rank condition
omitted from the model. The old slogan “no local lever closes it” was too broad.

### 5.5 Radical-axis and middle-slot transports

**Radical-axis verdict:** `HYPOTHESIS_MISMATCH` for the recorded packet. The point
`u` has only one supplied circle equation, and the three named shared points on
`B(q,r)` make the proposed transport identity vacuous. This does not rule out a
radical-axis argument in a packet with a genuine second circle or a proved
off-circle endpoint.

**Middle-slot verdict:** `HYPOTHESIS_MISMATCH`. The historical R-star theorem
concerns SED-pin interior points in a global unit-distance regime, whereas the
c5d witnesses are strict hull vertices in a variable-radius per-vertex-K4
packet. A theorem with different hypotheses is not refuted; it is simply
inapplicable here.

### 5.6 Incompatible-walk monovariants

**Verdict:** `INSUFFICIENT_ALONE` for the four recorded candidates and
`REOPEN_WITH_NEW_COUPLING` for the family.

The historical tests show that cap rank, hull depth, the selected surplus-cap
label, and one tunable metric scalar do not furnish the required strict decrease
on the recorded walk. Abstract 4-star and local vesica cycles are satisfiable.

**Exact scope:** Those four measures, and the precise additive first-moment forms
tested, do not prove well-foundedness.

**Not ruled out:** Lexicographic states, nonadditive potentials, finite-state
closure, metric-labeled cycles, rank defects, or deletion-closed subsets. No
representation theorem was given that reduces every scalar or every descent state
to the four failed examples.

---

## 6. Global incidence and full-problem route tests

### 6.1 Ptolemy equality

**Verdict:** `CIRCULAR` after the required nondegeneracy and ordering assumptions
are stated.

For four distinct points in the correct cyclic order, with the known triple
noncollinear, Ptolemy equality characterizes membership of the fourth point on
the triple's circumcircle. Therefore using that equality to prove that the fourth
point lies on the already identified circle assumes the target in equivalent
form.

**Required caveat:** Without noncollinearity and correct label order, the bare
statement “Ptolemy equality iff concyclic” is false or ambiguous. Collinear
quadruples can also attain equality.

**Exact scope:** The circularity applies to invoking the equality itself without
an independent reason for it.

**Not ruled out:** A strict Ptolemy inequality, a comparison obtained from convex
order, or a different four-point identity whose hypotheses are independently
available.

### 6.2 Topological and crossing-count traps

**Verdict:** `INSUFFICIENT_ALONE` for the recorded arms.

The historical experiments found that:

- one symmetrized graph contains a forced `K_{2,3}` and hence is not outerplanar;
- assuming ordinary planarity yields only a weak cardinality bound;
- the tested Melchior regime does not cover the relevant radii;
- generic chord crossings are not contradictions.

**Exact scope:** Those graph definitions and those numerical inequalities do not
force the disputed circle incidence.

**Not ruled out:** A different graph, a topological obstruction carrying metric
labels, pseudoline arrangements with additional incidence restrictions, or a
special-family theorem. No complexity-theoretic conclusion follows.

### 6.3 Self-stress and sign-mix route

**Verdict:** `INSUFFICIENT_ALONE` for the recorded linearized stress model.

The source-level experiments did not force the desired incidence into the tested
Jacobian row space, and the sampled sign region was large. Those facts may refute
a particular stress ansatz.

The old rationale was incorrect in two ways:

1. convex-position sign conditions are determinant-sign inequalities in point
   coordinates, not globally an intersection of linear half-spaces there;
2. even open inequalities can select a component of an algebraic set on which an
   equality holds. For example, on `xy = 0`, the condition `x > 0` forces `y = 0`.

**Exact scope:** The recorded stress dimension, sign pattern, and Gröbner
reduction do not force the target.

**Not ruled out:** Metric-labeled stresses, component-sensitive arguments,
prestress stability, rank defects, or a polyhedral lift with additional
planarity/incidence hypotheses.

### 6.4 Faithful all-vertex construction

**Verdict:** `EQUIVALENT_TO_FULL_PROBLEM`, not dead.

A strict-convex finite set satisfying the full per-vertex K4 property is an Erdős
97 counterexample. Constructing one solves the problem negatively. It is not a
shortcut to a local historical producer, but it remains a complete and valid
research lane.

The naïve variable-minus-equation count `-n-3` is only an expected-dimension
heuristic. Without an independence or transversality theorem it does not prove
inconsistency, point collapse, or zero-dimensionality. Exact computations at
selected small sizes establish only the encoded cases actually checked.

The current project bounds should be stated with their trust tiers:

- avoiding compiler trust, every counterexample has at least `10` points;
- the sorry-free exact-ten and exact-eleven certificate endpoints strengthen the
  project bound to `12`, using `Lean.ofReduceBool` and `Lean.trustCompiler`.

**Reopen condition:** Any exact full configuration or a certified nonexistence
argument is substantive progress. Do not present either outcome as prohibited by
this registry.

---

## 7. Historical N4d `q' = E` sign-block routes

**Cluster status:** Historical. The finite nine-point endpoint was closed by a
different pin-clash route. These entries record exact failed formulations, not a
live frontier.

### 7.1 Closed-cone sign block for `0 ≤ f1 f2`

**Verdict:** `CERTIFICATE_CONE_IMPOSSIBLE` for the exact recorded Putinar-style
closed cone; the actual analytic crux is `FORMALLY_CLOSED` by a different proof.

The weak closed hypothesis set contains degenerate boundary strata incompatible
with the target sign. Consequently no sum-of-squares identity in that exact cone
can certify the target at any degree. The eventual theorem
`qEqE_oneCosine_crux` uses an analytic order argument instead.

**Exact scope:** Do not rerun `nlinarith`, SDP, or SOS on the same weak generators
and target polynomial.

**Not ruled out:** A strict or saturated certificate with genuine nonvanishing
hypotheses. In practice the target is already closed, so such work has no known
consumer.

### 7.2 `reflPt v2 v3 q` as an upper witness

**Verdict:** `FALSE_EXACT` for the historical orientation claim.

The recorded source refutation shows that this reflection selects the lower
partner rather than the required upper cap point in the relevant packet. The
reflection across a different line may produce an upper point, but it is not the
same construction.

**Exact scope:** Do not substitute `reflPt v2 v3 q` for the named cap vertex whose
side relation is actually available.

### 7.3 The `hAElt` and Φ sign routes

**Verdict:** `FALSE_EXACT` for the proposed `hAElt` implication and
`INSUFFICIENT_ALONE` for the attempted Φ clash.

Membership `b2 ∈ I2` supplies the bound against the appropriate cap endpoint; it
does not supply the stronger comparison with `v2` required by `hAElt`. The
historical counterexample separates those statements. For a genuine distinct I3
pair, the available cap-order theorem gives the opposite Φ sign, so the desired
nonnegative sign cannot be imported from the false keystone.

**Exact scope:** Do not derive `hAElt` from bare I2 membership or use its impossible
sign as a producer.

### 7.4 Shared-circle transfer and the small-s claim

**Shared-circle verdict:** `HYPOTHESIS_MISMATCH`. The theorem
`SharedCirclePointForcesV3` uses a unit-radius equilateral coincidence absent from
the b2 rows. It cannot be transferred merely because another point lies on one
of the circles.

The historical finite endpoint shell also has no generic “no five concyclic”
field. A contradiction must terminate in an actual packet hypothesis such as
disk exit, cardinality, distinctness, or convex position.

**Small-s verdict:** `FALSE_EXACT` for the stated uniform convex-position-only
closure. The historical exact strict-convex in-disk completion at
`v3 = (1,3/4)`, `s = 3/4` satisfies the recorded b2 pins.

**Exact scope:** The witness refutes the exact uniform claim and the sampled
threshold that produced the earlier false UNSAT impression.

**Not ruled out:** Stronger packets with additional row incidence or a
machine-checked continuum argument for a differently stated threshold.

---

## 8. U-series assembly and retired local architectures

**Cluster status:** Historical. No statement in this section should be read as a
current leaf roster. Several old verdicts depended on the invalid
positive-dimension argument or on obsolete placeholder definitions and have been
corrected below.

### 8.1 U4c bridge through MEC-boundary cap points

**Verdict:** `FALSE_EXACT` for the bridge asserting that the relevant cap points
are automatically on the MEC boundary; `HYPOTHESIS_MISMATCH` for any downstream
use requiring that bridge.

The corrected cap convention in §2.2 applies. The normalized
`ApexApolloniusArc` framework may retain valid formal content, but it does not
turn an endpoint-erased cap into a subset of the MEC circle.

**Exact scope:** The specific c4b/c4c/c4d transport through that false boundary
bridge is blocked.

**Not ruled out:** U4 arguments using genuine apex-circle equations, Apollonius
arcs, or separately proved boundary membership.

### 8.2 U3d affine-form dictionary

**Verdict:** `BLOCKED_BY_SPEC_MISMATCH`.

The named affine-form reductions may be formal once a coordinate dictionary is
assumed, but the historical prose did not fully recover the `q`-coupling shift or
state consistent coordinates for all named points.

**Exact scope:** Do not cite the source identities as project theorems until the
packet-to-dictionary theorem is written and checked.

**Reopen condition:** Pin the coordinates and squared-distance dictionary in one
canonical statement, then prove that the project packet supplies it.

### 8.3 U5 Mode-A finite certificate proposal

**Verdict:** `OFF_CURRENT_SPINE` / `HYPOTHESIS_MISMATCH` for the historical
certificate proposal, not a mathematical impossibility theorem.

The proposed AP≥3 certificate had the wrong polarity for the desired positive
removability disjunct and no verified consumer. Cyclotomic-algebraic coordinates
also made a direct finite `decide` replay unsuitable in the proposed form.

**Exact scope:** Do not build that exact certificate bank merely because it
proves a negative statement that the consumer does not use.

**Not ruled out:** A certificate whose proposition matches a current consumer,
or a geometric proof of the inline `hExist` target.

### 8.4 U5d wall-crack and U3d redirect

**Verdict:** `INSUFFICIENT_ALONE` for the destroyed-class fifth-member route.

If the relevant class has been proved to have cardinality exactly four, a route
that requires a fifth member of that same class is impossible under those
hypotheses. That observation does not show that every redirect is impossible.

**Exact scope:** Do not draw the new witness from the exact-four class whose
membership is already saturated.

**Not ruled out:** A surviving class, a different center, a common-deletion row,
or a new global incidence theorem.

### 8.5 U5dd NEW-2, NEW-3, and NEW-1

- **NEW-2:** `CIRCULAR` where “saturation” is merely a restatement of the desired
  equality or class membership.
- **NEW-3:** `CONJECTURED`, not closed. The old proof used the invalid inference
  that a positive-dimensional order stratum cannot lie in an equality locus.
  Positive dimension alone does not prevent an equality from holding identically
  on a component. NEW-3 requires an explicit admissible point with `Δ ≠ 0`, a
  component/density argument, or an exact elimination certificate before it can
  be called dead.
- **NEW-1:** Historical global incidence target. The naïve first-moment incidence
  count is `INSUFFICIENT_ALONE`; stronger metric-rank or multi-center formulations
  remain outside that verdict.

### 8.6 U1m two-circle producer

**Verdict:** `FORMALLY_CLOSED` for the named sink theorem if its exact hypotheses
are supplied; `INSUFFICIENT_ALONE` for the opposed-row data as a feeder.

Cap membership alone does not produce the second circle incidence required by
the sink. The historical “cross-blocking coincidence is likely false” is only
`CONJECTURED` unless an exact counterexample is attached.

**Not ruled out:** A producer carrying a genuine second circle, radical-axis data,
or power-rank support.

### 8.7 U3 placeholder saturation object

**Verdict:** `STALE` and source-level `INSUFFICIENT_ALONE`.

The historical `U3ShortCapSaturation` placeholder used definitions that collapsed
to trivial values because their arguments were ignored. Under those definitions,
the node was definitionally equivalent to its parent goal rather than a genuine
reduction.

**Durable lesson:** Unfold every placeholder structure before treating it as a
smaller theorem. A renamed parent goal is not progress.

### 8.8 Order-residual SAT mining

**Verdict:** Mixed:

- consumer-only UNSAT on an unproducible refinement — `INSUFFICIENT_ALONE`;
- UNSAT whose core relies on the relaxed circumcenter proxy —
  `ENCODING_UNSOUND`;
- the unresolved full producer system — `ENCODING_TIMEOUT`.

A refinement of a `True` placeholder must be both strong enough to contradict the
consumer and derivable from the source packet. Strengthening only the consumer
side can make UNSAT easier while making the producer false.

**Exact scope:** Reject any mined clause whose leave-one-out core depends on a
proxy not implied by the project hypotheses. Respect the target cardinality and
mode; a model at the wrong size may belong to a different branch.

---

## 9. Historical U1k counting kernels

### 9.1 Cap-restricted `card = 4`

**Verdict:** `STALE` / `HYPOTHESIS_MISMATCH`.

The exact-four statement belongs to the A-indexed distance class, not to a
cap-restricted class already known to have at most two points. The historical
rescoping to `exactClassA` is the correct repair.

**Exact scope:** Do not reintroduce `card = 4` on the cap-restricted object.

### 9.2 U1K4 second-cross-edge route

**Verdict:** `INSUFFICIENT_ALONE` for the historical survivor-counting argument;
`STALE` for the claim that U1K4 is an independent unconditional obligation.

The old bucket counts and cover inequalities did not force a second cross edge,
and the proposed self-similar descent lacked a well-founded measure and base
case. That does not prove that no survivor bound exists under a stronger packet.

**Exact scope:** Do not assert unconditional a4c/a4d existence from the old U1a–U1d
counts or repeat the measureless self-reference.

### 9.3 U1K3 usable-continuation route

**Verdict:** Historical mixed status; do not preserve the old “three open
obligations” roster.

The historical exact-real encoding under `scripts/u1k3-metric-certs/` reportedly
forced a one-hit screen bound. Unless an independently replayed certificate is
attached, record that result as
`SOLVER_UNSAT_EXACT_ENCODING`, not as a permanent theorem-family ban. It refutes
the particular scalar pigeonhole proposal only if the encoding exactly matches
the source packet.

**Exact scope:** The old “three candidates beat two slots” count cannot close a
model in which the screen intersection is at most one for the stated reason.

**Not ruled out:** A different screen object, a source theorem proving stronger
availability, an order-sensitive continuation, or a current descendant with
additional rows. Check current status rather than carrying forward the old `(e)`
and `(s)` priority labels.

---

## 10. Re-architecture, deletion, algebra, and blocker-graph routes

### 10.1 Historical U-lane re-architecture grading

**Verdict:** `STALE` for the blanket grading of routes (a), (c), (d), (e), and
(g) as dead.

Several grades relied on the invalid NEW-3 positive-dimension argument. Those
routes must be re-evaluated from their exact statements. A route that merely
renames an unresolved equality is still `INSUFFICIENT_ALONE`; a route that adds a
new component-sensitive, rank, or deletion-coupling theorem is not covered by the
old verdict.

**Exact scope:** Preserve only independently valid sub-findings, such as the
slackness of a stated first-moment bound or an explicit counterexample to a named
local lemma.

### 10.2 Gamma multi-deletion descent

**Verdict:** `REDUCED_TO_GLOBAL_CLOSURE`, not `PROVEN-dead`.

Deleting additional points cannot restore a lost witness class at a center that
remains in the carrier. But a simultaneous deletion may also delete that
obstructing center. The exact validity condition for a deletion set `X` is:

\[
\forall p\in A\setminus X\;\exists r>0:
\bigl|T_A(p,r)\setminus X\bigr|\ge4.
\]

A blocker relation can organize failures of currently selected exact-four rows:
when `X` destroys such a row at `p`, either `p` must also be deleted or another
row surviving all of `X` must be produced. Joint deletion can destroy a larger
class even when no single deleted point does, so closure must be checked against
`X` as a whole.

The monotonicity observation proves only that naïve sequential deletion does not
repair a killed **surviving** center. It does not prove that no proper
blocker-closed deletion set exists.

**Exact scope:** The historical Gamma construction that retains all selected
obstructing centers does not improve the one-deletion problem.

**Not ruled out:** Sink components, Hall-deficient blocker sets, common-deletion
closures, or simultaneous deletion packets that absorb the obstructing centers.
The current source contains multi-deletion and common-deletion machinery, so no
unqualified ban belongs here.

### 10.3 Beta foreign-smaller-witness proposal

**Verdict:** `CONJECTURED`.

No recorded construction supplied the required foreign witness without
reintroducing the metric incidence problem. Absence of such a construction is not
a proof of nonexistence.

**Reopen condition:** Give a precise construction and verify every convexity,
cardinality, and per-vertex K4 obligation in the smaller carrier.

### 10.4 Complex Gröbner bases with square slack

**Verdict:** `HYPOTHESIS_MISMATCH` for using the exact complex-field slack
encoding as a representation of a real sign condition.

If an inequality is represented over `ℂ` by adjoining `s² = r-g(p)`, then every
complex value of `r-g(p)` has a square root. The slack equation therefore does not
encode the real sign restriction. Complex emptiness cannot be inferred from a
purely real inequality obstruction by this device.

**Exact scope:** Do not use ordinary complex Gröbner emptiness of that slackened
system as a proof of real infeasibility.

**Not ruled out:** Real quantifier elimination, cylindrical algebraic
decomposition, real radicals/preorderings, or exact sign determination on a
zero-dimensional real variety.

### 10.5 The `D14` Cramer identity

The recorded identity is

\[
D14=4640\,\delta_0\delta_1\delta_2\,
\operatorname{SignedArea}(O_0,O_1,O_2).
\]

**Verdict:** `FORMAL_CORE_ONLY` for the identity; `FALSE_EXACT` for the
leaf-local forcing claim if the recorded witness satisfies the exact local
system.

**Nondegeneracy correction:** The biconditional

\[
D14=0\iff O_0,O_1,O_2\text{ are collinear}
\]

requires `δ0 δ1 δ2 ≠ 0`. Without those hypotheses, `D14 = 0` also follows from a
zero denominator factor.

The historical witness `D14 = 603` shows that the leaf-local equations do not
force the determinant to vanish. It does not show that the full global row web
cannot force it.

**Exact scope:** Do not reattempt the same local forcing or claim the unqualified
biconditional.

**Not ruled out:** Full-web elimination, nonzero-denominator saturation, a rank
proof, or a different minor whose support is controlled globally.

### 10.6 Additive descent measures

**Verdict:** `INSUFFICIENT_ALONE` for the recorded additive/first-moment
potentials.

The flat indegree vector and the tight-class-member count show that the tested
scalar measures do not decrease independently of the missing compatibility
statement. This does not quantify over every possible well-founded state.

**Exact scope:** Do not repeat the exact additive potential or a cosmetic
renaming of it.

**Not ruled out:** Lexicographic measures, multiset orders, nonadditive potentials,
finite closure ranks, component size, rank deficiency, or a proof that a proper
blocker-closed subset strictly shrinks.

### 10.7 Bare outdegree-one blocker graph

**Verdict:** `INSUFFICIENT_ALONE` for the unlabeled functional graph;
`REOPEN_WITH_NEW_COUPLING` for enriched blocker graphs.

Selecting one dangerous center per deletion-failing vertex guarantees a directed
cycle, but the bare cycle identifies only which centers interact. It does not
supply the cross-incidence or fifth circle member needed for contradiction. The
local cycle-plus-vesica packet is satisfiable under the recorded hypotheses.

**Exact scope:** Pigeonhole, cycle length, and unlabeled exact-four cardinality do
not by themselves imply a small-cardinality bound.

**Not ruled out:** Cycles carrying exact row membership, omission labels, radius
inequalities, angular midpoint equations, Kalmanson comparisons, radical-axis
signs, power-matrix support, or common-deletion data. The old sentence “the
blocker digraph is just `(Q)`” should be read only as a criticism of the bare
unlabeled reduction.

The historical two-cycle vesica equalities may be valid under their precise row
hypotheses. The further claim that every bare two-cycle is incompatible with
strict convexity remained conjectural and must not be promoted without a proof.

### 10.8 Angle-2 firewall curve identity

**Verdict:** `CONJECTURED` as currently documented; upgrade to
`FORMAL_CORE_ONLY` only if a precise classification theorem or independently
checked certificate is attached. A successful global firewall is
`EQUIVALENT_TO_FULL_PROBLEM`.

The old text did not define the admissible curve class, regularity assumptions,
or functional identity needed to justify “firewall curves are exactly parabolas.”
At most, the recorded search supports uniqueness inside its degree-four root-set
ansatz unless a classification theorem is attached.

Likewise, “no quantity is simultaneously per-vertex and radius-free” is not a
well-formed theorem without a defined class of quantities.

A firewall showing that no strict-convex all-vertex-K4 configuration exists proves
Erdős 97 directly. It may bypass the removable-vertex architecture, but it is not
a mathematical dead end.

### 10.9 Retired U2 opposite-cap vocabulary

**Verdict:** `OFF_CURRENT_SPINE` / `STALE` as a live target.

The attic declarations were retired because they had no verified external
consumer and the active packet vocabulary was rederived elsewhere. Their
mathematical statements were not thereby proved false or closed.

**Rule:** Do not resurrect the exact attic declarations as purported live leaves.
If their content is needed, restate it in the current packet vocabulary and prove
the source-to-packet bridge.

### 10.10 Card12Up uniform equality/separator language

**Verdict:** `FALSE_IN_RECORDED_RELAXATION`.

The stored W15/W16 lattice and concentric-ring witnesses in
`scratch/d3-formulation/` refute the exact uniform statements consisting of the
recorded circle equalities, separator or noncollinearity data, exact-four row
conditions, and listed row decorations. The exact controls include
`t1_results.json`, the `t9_wit_*.json` ring witnesses, and the `candidateB/` row
embedding audit. The witnesses are nonconvex, so they do not refute the source
Lean leaves carrying `ConvexIndep`.

**Exact scope:** Do not retry the same equality/separator-only language, or the
same row-decorated extension, and expect a uniform ideal-theoretic emptiness
certificate. The stored witnesses must remain positive controls for any new
encoding.

**Not ruled out:** Kalmanson inequalities, circular split weights, convex-order
signs in a lifted representation, MEC support, Euclidean-distance-matrix PSD/rank,
power-matrix rank, or multi-center coupling. The old phrase “every
equality/separator-shaped statement” was too broad; only statements expressible
in the exact recorded language are refuted.

### 10.11 Per-type minimal-window exclusions

**Verdict:** `FALSE_EXACT` for excluding each of the thirteen realized decorated
single-center types; `INSUFFICIENT_ALONE` for the recorded composition scheme.

Exact rational witnesses recorded under `census/candidate_d_probe/` realize
thirteen of the nineteen tested local types, so no single-center dead-type bank
can cover them. Independently, the `q2_results_*` token composition admits
survivors even after the conjectured/proved local kills are inserted. The later
exact SUB2-H closure strengthens the local admissibility filters but does not
remove those composition survivors.

**Exact scope:** Do not redispatch a single-center minimal-window exclusion for a
stored realized type, and do not assume that the existing local kill list composes
to a global contradiction.

**Not ruled out:** Two-center or larger windows, common-deletion coupling,
cross-row support rank, or a new global composition theorem. Preserve the exact
stored witnesses as regression tests.

---

## 11. Maintenance rules and durable reopen conditions

### 11.1 Statements that remain safely barred in their exact form

The following are well scoped and should not be repeated unchanged:

- treating cap membership as circle membership;
- inferring strict MEC-disk membership from `capInteriorByIndex` alone;
- the exact Build-B apex monotonicity lemma refuted by an exact witness;
- the exact Framing-2 inner-product inequality refuted by `u0`;
- using Ptolemy equality itself to prove the same concyclicity it characterizes;
- ordinary complex Gröbner plus square slack as an encoding of real sign
  infeasibility;
- bare chirotopes with no metric lift;
- the exact unsaturated closed quadratic modules containing a target-negative
  closure point;
- the exact nonconvex equality/separator relaxations with stored witnesses;
- single-center local type exclusions for types already exactly realized;
- placeholder “reductions” that unfold to the parent goal.

### 11.2 Routes that were previously overclosed

The following must not be rejected merely by citing the historical log:

- explicit-class QF_NRA after new source reductions;
- strict or saturated real-algebraic certificates;
- circle-power, bisector-rank, EDM, Kalmanson, or other metric lifts;
- minimality coupled to exact rows and deletion synchronization;
- metric-labeled blocker cycles;
- simultaneous deletion through a proper blocker-closed set;
- component-sensitive stress or rank arguments;
- convexity-coupled uniform algebra;
- faithful construction of a counterexample;
- a direct firewall proof of the headline theorem;
- any route whose only old no-go was the positive-dimension argument.

### 11.3 Entry update checklist

Before changing an entry to `FALSE_EXACT`, `FORMALLY_CLOSED`, or
`CERTIFICATE_CONE_IMPOSSIBLE`, verify all of the following:

- the exact proposition is written with quantifiers and nondegeneracy hypotheses;
- the witness or proof satisfies the **source** packet, not a relaxed proxy;
- every packet-to-coordinate transport is formal or explicitly marked prose;
- exact solver branches are separated from timeouts and numerical models;
- the conclusion does not quantify over a larger method family than the evidence;
- current consumers were checked from the current source;
- a full-problem route is not mislabeled dead merely because it bypasses the
  current spine.

### 11.4 Suggested machine-readable entry template

```markdown
### <route name>

**Exact target:** <quantified proposition or Lean declaration>

**Verdict:** `<status>`

**Evidence:** `<LEAN | EXACT_CERT | EXACT_WITNESS | EXACT_SOLVER | PROSE |
NUMERICAL | HISTORICAL>` — <theorem/artifact/command>

**Exact scope:** <what is ruled out>

**Not ruled out:** <nearby stronger or differently coupled formulations>

**Current consumers:** <symbols or none; checked YYYY-MM-DD>

**Reopen condition:** <specific new ingredient>
```

This format is the guardrail against converting “the recorded bare formulation
failed” into “the entire mathematical mechanism is dead.”
