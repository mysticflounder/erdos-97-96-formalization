<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Dead Ends — Erdős 97 don't-repeat registry

> **Scope and provenance (correctness pass completed 2026-08-19).** This is a
> historical registry of precise propositions, encodings, and proof routes that
> were refuted, proved, found insufficient, or retired while developing the
> removable-vertex and U-lane arguments. It was imported from the historical
> `p97-rvol` repository on 2026-07-05. Historical `RVOL.P97.*` names usually map
> to declarations imported under `Erdos9796Proof.P97.*`.
>
> **Audited baseline.** This revision was checked against repository commit
> `97efba032abe8066d349ab6a7f3cd6f18a916c30`. At that baseline the README's
> recorded `proof-blueprint spine` output reported 36 publish-spine leaves. That
> number is provenance, not a durable status assertion; regenerate the spine
> before quoting a live roster.
>
> **This is not a live-status document.** Run `proof-blueprint spine` for the
> current consumer graph and open obligations. `docs/live-blueprint.md` is a
> generated snapshot, not an authority independent of the build.
>
> **Audit boundary.** The final pass checked source definitions, current route
> documentation, and the logical force of the recorded arguments. It did not
> replay every historical solver job or every certificate bank. Several cited
> `p97-rvol` scratch directories were never copied into this repository. Such
> claims are retained only as unverified reports and must not be used as permanent
> bans until their exact witness or certificate is restored and replayed.

## 1. How to read this registry

A route is barred only to the extent stated in its **Exact scope** field. In
particular:

- a counterexample to one proposition does not refute a stronger proposition
  with additional hypotheses;
- a timeout is not a mathematical verdict;
- an UNSAT result proves only the formula actually encoded;
- failure of a bare combinatorial abstraction does not refute metric- or
  rank-lifted variants;
- an off-spine theorem can still be useful or can prove the headline theorem by
  a different architecture;
- constructing a genuine all-vertex-K4 configuration or proving that none exists
  is a direct full-problem route, not a mathematical dead end.

The phrase **do not retry** means:

> Do not repeat the exact proposition, exact hypothesis language, and exact proof
> or solver encoding recorded here unless the new attempt identifies the changed
> ingredient.

It never means that an undefined family such as “all topology,” “all counting,”
“all stress methods,” or “all algebraic methods” has been ruled out.

### 1.1 Mathematical-assessment vocabulary

| Assessment | Meaning |
|---|---|
| `FALSE_EXACT` | An exact, checked counterexample refutes the stated proposition. |
| `PROVED_EXACT` | The exact proposition and its required transport have been checked with the stated trust boundary. |
| `FORMAL_DECLARATION_PRESENT` | A named Lean declaration is present, but this audit did not independently establish the required axiom closure and all surrounding transport. |
| `FORMAL_CORE_ONLY` | A coordinate, algebraic, analytic, or finite core is formalized; transport from the project packet remains conditional, prose, or separately open. |
| `REPORTED_RESULT_UNVERIFIED` | Historical prose or an unreplayed repository artifact reports a precise result. It is not a durable ban until replayed. |
| `CIRCULAR` | A required hypothesis or invoked equality is equivalent to, or already implies, the target in the stated setting. |
| `HYPOTHESIS_MISMATCH` | The proposed theorem does not apply to the objects or hypotheses supplied by the source packet. |
| `CERTIFICATE_CLASS_IMPOSSIBLE` | A checked target-negative closure point rules out certificates in the exact stated closed cone, module, or other certificate class. |
| `ENCODING_TIMEOUT` | The exact encoding timed out at the stated budget. No mathematical conclusion follows. |
| `ENCODING_UNSOUND` | The encoded formula omits, weakens, or misrepresents a load-bearing source hypothesis. |
| `NUMERICAL_EVIDENCE_ONLY` | Floating-point sampling or numerical optimization suggests a result but does not prove it. |
| `INSUFFICIENT_ALONE` | The tested count, invariant, or local packet has slack or models and cannot close the target by itself. |
| `FALSE_IN_RECORDED_RELAXATION` | A checked witness refutes the exact relaxation, while omitted source hypotheses remain available. |
| `REDUCED_TO_GLOBAL_CLOSURE` | The local proposal is not closed; its validity becomes a global closure or synchronization problem. |
| `DIRECT_FULL_PROBLEM_ROUTE` | Success would settle Erdős 97 directly rather than supply the intended local shortcut. |
| `BLOCKED_BY_SPEC_MISMATCH` | The prose packet, row ledger, coordinate dictionary, or polarity is inconsistent or incomplete. |
| `UNRESOLVED` | No sound positive or negative conclusion has been established. |

Live engineering status is recorded separately:

| Project relevance | Meaning |
|---|---|
| `CURRENT_CONSUMERS_VERIFIED` | Current source consumers were checked at the audited baseline. |
| `CURRENT_CONSUMERS_UNVERIFIED` | No fresh consumer audit was completed for this entry. |
| `OFF_SPINE_AT_BASELINE` | The entry had no publish-spine consumer at the audited baseline. This is not a mathematical verdict. |
| `STALE_STATUS` | A former leaf, priority, or route label was superseded or retired. |

### 1.2 Evidence vocabulary

| Evidence | Meaning |
|---|---|
| `VERIFIED_INLINE` | The document gives a complete exact argument or witness that was rechecked in this pass. |
| `SOURCE_CHECKED` | The claim was checked directly against the audited source revision. |
| `LEAN_KERNEL_CLEAN` | `#print axioms` or an equivalent kernel audit establishes the approved axiom closure. |
| `LEAN_DECLARATION_PRESENT` | The declaration or module is present, but this pass did not rerun its axiom audit. |
| `EXACT_ARTIFACT_REPLAYED` | An exact witness or certificate was independently replayed. |
| `REPOSITORY_ARTIFACT_UNREPLAYED` | The exact-looking artifact exists in the repository but was not replayed in this pass. |
| `SOLVER_RESULT_UNREPLAYED` | A solver result is reported, but no independently checked certificate was replayed. |
| `NUMERICAL_ONLY` | The support is sampling or floating-point computation. |
| `HISTORICAL_ONLY` | The cited evidence is absent from the audited repository or exists only in old prose. |
| `PROSE_CHECKED` | A hand argument was checked, but no kernel or certificate replay is claimed. |

`FALSE_EXACT`, `PROVED_EXACT`, `CERTIFICATE_CLASS_IMPOSSIBLE`, and
`FALSE_IN_RECORDED_RELAXATION` require `VERIFIED_INLINE`,
`LEAN_KERNEL_CLEAN`, or `EXACT_ARTIFACT_REPLAYED`. A result supported only by
`HISTORICAL_ONLY`, `SOLVER_RESULT_UNREPLAYED`, or
`REPOSITORY_ARTIFACT_UNREPLAYED` must instead be recorded as
`REPORTED_RESULT_UNVERIFIED` or another nonfinal assessment.

A Lean declaration being source-clean is not enough: it may still reach
`sorryAx` transitively. “Proved” means the relevant declaration is kernel-clean
under the stated trust policy.

### 1.3 Required fields

Every new or materially revised entry should record:

1. **Exact target** — a quantified proposition or named Lean declaration;
2. **Assessment** — one of the mathematical assessments above;
3. **Evidence** — the strongest evidence tier, with theorem, artifact, command,
   version, and digest where applicable;
4. **Project relevance** — current consumers or an explicit unverified/off-spine
   marker;
5. **Exact scope** — the hypotheses and proof language actually ruled out;
6. **Not ruled out** — nearby stronger or differently coupled formulations;
7. **Reopen condition** — the specific new ingredient that escapes the recorded
   failure.

For legacy entries lacking an explicit evidence or relevance line, read
**Evidence** as `HISTORICAL_ONLY` and **Project relevance** as
`CURRENT_CONSUMERS_UNVERIFIED`. Such an entry is a search-memory prompt, not a
permanent ban.

## 2. Global conventions

### 2.1 Historical surplus-cap escape notation

Several historical routes were grouped under the label `(Q)`. That label is
retained only as a cross-reference; it is not the current frontier and must not be
used as an unproved equivalence between different declarations.

For a finite carrier `A`, center `p`, and radius `r > 0`, write

\[
T_A(p,r)=\{x\in A:\operatorname{dist}(p,x)=r\}.
\]

For a specified cap `C_i`, the historical **escape event** is

\[
|T_A(p,r)|\ge 4 \quad\text{and}\quad T_A(p,r)\nsubseteq C_i.
\]

Thus an escape says that the radius class has at least four members and that
**at least one** member lies outside `C_i`. It does not say that four members lie
outside the cap.

Historical targets such as U1.3, U2.B, c5d3b, U5 support confinement, and the
unit-distance specializations were connected by one-way reductions carrying
additional hypotheses. Unless source contains an explicit `Iff`, record the exact
implication instead of writing `U2.B ≡ U5-t1` or “all the same object.”

The unit-distance target has a stronger antecedent than the variable-radius
same-distance target and is therefore logically weaker as a theorem target. No
strict separation is claimed here without an explicit witness.

No `∃ℝ`-hardness or `∃ℝ`-completeness theorem for the relevant P97 decision
problem has been established in this registry. The coordinate formulations are
nonlinear existential-real systems; that observation is not a complexity
classification and does not rule out structural proofs for the project packets.

### 2.2 Caps are chord-separation sets, not circle classes

`OnArcOpposite vi vj vk x` is the signed-area condition

\[
\operatorname{signedArea2}(x,v_j,v_k)\,
\operatorname{signedArea2}(v_i,v_j,v_k)\le 0.
\]

It is a closed chord-side test. It does not assert that `x` lies on any circle,
and it supplies no apex-centered distance equality.

Two exact planar families prevent the two common radial misreadings. Let

\[
w_k=(\cos(k\pi/6),\sin(k\pi/6)),\qquad 0\le k<12,
\]

with `O=(0,0)`, and choose `v1=w0`, `v2=w4`, `v3=w8`. These selected
vertices form an equilateral, non-obtuse triangle on the unit MEC. The MEC claim
is exact: since `v1+v2+v3=0` and every `vi` has norm one, every candidate center
`c` satisfies

\[
\frac{1}{3}\sum_{i=1}^{3}\lVert v_i-c\rVert^2=1+\lVert c\rVert^2\ge1.
\]

Thus any enclosing disk has radius at least one, while the unit disk centered at
`O` contains the configuration. Each closed chord-side cap has its two selected
endpoints and the three intervening dodecagon vertices, hence cardinality five.

1. **Endpoint-erased cap data can occur on the MEC boundary.** In the regular
   dodecagon, every nonselected `wk` has norm one. The three intervening vertices
   of each cap survive endpoint erasure and remain on the MEC boundary.
2. **The same chord-side and endpoint-erasure data can occur strictly inside the
   MEC.** Replace `w1` by `x=(9/10)w1` and leave the other eleven vertices
   fixed. The unit disk remains minimum because the equilateral triangle
   `v1,v2,v3` already has circumradius one. The cap sets remain
   `C1={w4,w5,w6,w7,w8}`, `C2={w8,w9,w10,w11,w0}`, and
   `C3={w0,x,w2,w3,w4}`. With the vertices kept in their displayed cyclic
   order, strict convexity is exact: the only altered consecutive turn
   determinants reduce to `9/10-√3/2` and `(19-9√3)/20`, both positive; the
   unchanged value is `1-√3/2>0`. Yet `dist x O=9/10<1`.

These are exact geometric witnesses for the **bare** chord-side-plus-endpoint-
erasure data. This audit did not build the corresponding Lean
`SurplusCapPacket` terms, so a theorem exploiting additional packet fields must
still be assessed separately.

Therefore unfolding `capInteriorByIndex` supplies endpoint-erased cap membership,
not a radial equality or strict inequality. Neither

\[
\operatorname{dist}(x,O)<R_{\mathrm{MEC}}
\]

nor equality with `R_MEC` follows from that definitional data alone. The generally
available MEC fact is the weak disk bound `dist x O ≤ R_MEC`; additional packet
hypotheses may support a stronger theorem and must be stated explicitly.
Consequently:

- do not treat a cap as an adjacent-cap circle;
- two-circle, radical-axis, vesica, or inscribed-angle arguments require genuine
  circle equations supplied independently by the packet;
- a specialized theorem may identify the intersections of the MEC with another
  named circle, but that is not a property of cap membership alone.

### 2.3 Solver and algebra semantics

- Store the exact solver version, command, complete input, complete output,
  timeout, and encoding contract. Do not attach permanent meanings to abbreviated
  output tuples from an unpinned historical `msolve` version.
- Complex Gröbner bases do not detect real infeasibility caused only by sign or
  order inequalities.
- A square-slack equation over an algebraically closed field does not encode a
  real sign restriction: every complex number has a square root.
- An UNSAT result is useful only after the encoded formula has been shown
  equivalent to the source packet. UNSAT for a stronger consumer-side refinement
  or a relaxed proxy does not prove the producer.
- Monolithic Boolean-selector nonlinear-real encodings timed out at the recorded
  historical budgets. That is encoding-specific.
- Explicit-class per-branch QF_NRA remains a legitimate method. A resolved branch
  is still only an unreplayed solver result unless a certificate is independently
  checked; an unresolved branch is `ENCODING_TIMEOUT`.
- A SAT model for partial K4, a fixed frame, or a nonconvex relaxation is not a
  counterexample to the global source theorem unless every omitted hypothesis is
  restored.
- Use exact rational or algebraic literals. A floating-point model with small
  residuals is not an exact realization.

### 2.4 Source, axiom, and consumer discipline

Lean symbol names and full commit hashes are more durable than line numbers or
mutable branch URLs. When an entry cites absent `p97-rvol` material, copy the
minimum exact witness or certificate into this repository before upgrading it to
an exact ban.

Before acting on a live/closed/off-spine claim, regenerate the current spine:

```bash
proof-blueprint spine
```

To audit a theorem's actual trust closure, create a small Lean file importing the
defining module and run `#print axioms`, for example:

```lean
import Erdos9796Proof.P97.UpstreamBridge
#print axioms Problem97.erdos97_rhs
```

Then run it with the pinned repository toolchain. `proof-blueprint spine` reports
reachability and open obligations; it is not a substitute for `#print axioms` on
an individual theorem. Conversely, source-clean does not imply kernel-clean.

A status in this registry never substitutes for a current import-graph or axiom
check.

---

## 3. Historical U1.3 / U2.B surplus-cap family

**Project relevance:** `STALE_STATUS` as live-frontier text; retained as a historical route
family. The old three-leaf U-lane frontier and the slogan “U1.3/U2.B = (Q)” must
not be used as current source truth.

### 3.1 Banked one-way reductions

**Exact target:** The exact implications named by
`u1EquilateralTransfer_proof`, `u2FullDistanceClasses_of_capContainment`, and
`U5DangerousTriple.candidate_of_not_mem_boundedSupport`.

**Assessment:** `REPORTED_RESULT_UNVERIFIED`; no blanket biconditional.

**Evidence:** `HISTORICAL_ONLY`. The current registry names these declarations,
but this pass did not independently locate each defining module or rerun
`#print axioms`.

- `u1EquilateralTransfer_proof` is a one-way implication from its stated `IsM44`
  and U1.3 hypotheses to an equilateral conclusion. Its contrapositive carries
  the same hypotheses.
- `u2FullDistanceClasses_of_capContainment` is a cardinality squeeze: a K4 radius
  class contained in a cap of cardinality four equals that cap. It does not
  produce the containment premise.
- `U5DangerousTriple.candidate_of_not_mem_boundedSupport` is a distinct
  escape-promotion bridge with its own hypotheses. No reverse implication is
  established here.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Preserve the individual implications and cite every hypothesis.
Do not collapse them into `(Q)` or an unnamed `Iff`.

**Reopen condition:** A claimed equivalence requires explicit Lean implications
in both directions with the same objects and hypotheses.

### 3.2 Midpoint/docstring route

**Exact target:** Derive cap equidistance from the listed one-sided midpoint
inequalities plus an existential, unpinned K4 witness.

**Assessment:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`. The cited `scratch/u13_equidist/` directory is
absent at the audited baseline, so the reported exact non-equilateral unit-MEC
model was not replayed.

The logical diagnosis remains sound: the midpoint lemmas provide one-sided
inner-product inequalities, while K4 supplies a radius class somewhere in `A`.
Nothing in that packet identifies the existential class with the cap.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The current repository does not contain enough evidence to use
this as a permanent counterexample bank. It identifies an unproved producer
step: an explicit class-to-cap incidence, or an indirect theorem deriving one,
is still needed.

**Not ruled out:** A full row identity, explicit selected-class containment, or a
metric-rank coupling.

**Reopen condition:** Restore the exact coordinates and an exact checker for all
source hypotheses and the failed conclusion.

### 3.3 Apex-distance monotonicity, Build B

Two different propositions were conflated in the historical log and must remain
separate.

#### Weak local Build-B proposition

**Exact target:** Strict apex-distance monotonicity from only the historical
frame, cap-side, closed-disk, distinctness, and local convexity hypotheses.

**Assessment:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`. The reported Frame-I witness at squared radius
`49/16` lived under `scratch/u13_buildB/`, which is absent at the audited
baseline.

**Exact scope:** Do not call the weak proposition exactly false until the witness
is restored and checked. The old report is nevertheless a warning not to infer
monotonicity from those weak local hypotheses without a new proof.

#### Current normalized N8a3 Route-A proposition

**Exact target:** `N8a3AdjacentCapDistanceStrict` for chains represented by the
normalized `capU2`/`capU3` coordinate models and the stated monotone angle maps.

**Assessment:** `FORMAL_CORE_ONLY`, not false.

**Evidence:** `SOURCE_CHECKED` and `LEAN_DECLARATION_PRESENT` in
`P97/U2/OneHitMonotone.lean`. That module proves strict monotonicity in the
normalized frame and exports `n8a3_of_capCoordChain` and
`n8a3_of_capCoordChainRev`; the general packet-to-coordinate-chain bridge remains
separate.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Not ruled out:** Completion of the vocabulary/similarity bridge from a general
`CapTriple` or `SelectedClass` packet to the normalized chains.

### 3.4 Endpoint monotonicity, Build A

**Assessment:** `INSUFFICIENT_ALONE`.

**Evidence:** `HISTORICAL_ONLY` for the named endpoint machinery;
`PROSE_CHECKED` for the arithmetic limitation.

The endpoint machinery is size-agnostic, but the historical Form-A tail uses the
exact two-point cap interior and the nine-point cover budget. That arithmetic does
not automatically extend to a surplus cap with at least three interior points.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The old endpoint engine plus the old nine-point scalar cover does
not prove surplus-cap containment.

**Not ruled out:** A different counting invariant, multi-center overlap, Hall
deficiency, a power-rank obstruction, or a larger packet controlling the surplus
points. No general “no sieve repair” theorem is established.

### 3.5 QF_NRA experiments

**Assessment:** Mixed and entirely encoding-specific:

- monolithic Boolean-selector formulations — `ENCODING_TIMEOUT`;
- branches reported UNSAT — `REPORTED_RESULT_UNVERIFIED`;
- unresolved explicit-class branches — `ENCODING_TIMEOUT`;
- partial-K4 or fixed-frame SAT models promoted to global models —
  `ENCODING_UNSOUND`.

**Evidence:** `HISTORICAL_ONLY` / `SOLVER_RESULT_UNREPLAYED`. The old log reports
91 UNSAT branches and 35 timeouts in one `(5,4,4)` gate, but the cited
`scratch/u13_global/` and `scratch/u13_combo/` material was not replayed in this
pass.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not repeat the same selector encoding merely with a larger
budget and call a timeout evidence. Do not use the branch counts until the exact
formula, solver version, and result files are pinned.

**Not ruled out:** Explicit-class decomposition, exact EDM/rank filters, CAD or
QE on reduced residuals, certified resultants, or solver calls after stronger
source-level reductions.

### 3.6 Global isosceles first-moment counting

**Assessment:** `INSUFFICIENT_ALONE`.

**Evidence:** `PROSE_CHECKED` for the recorded scalar comparison; historical
numerical bounds should still be recopied with their exact hypotheses before
reuse.

The available first-moment upper and lower bounds leave slack in the historical
cardinality regime. The escape event alone does not provide the extra pair or
five-member class required by the stronger local lower-bound lemmas.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The recorded scalar comparison does not yield a strict
contradiction.

**Not ruled out:** Overlap-sensitive counts, second moments, row synchronization,
or a direct unit-distance/firewall theorem.

### 3.7 Bare order type and decorated chirotope

**Assessment:** `INSUFFICIENT_ALONE` for bare order type and the exact tested
decorations.

**Evidence:** `VERIFIED_INLINE` for metric blindness. For example, the labelled
square `(0,0),(1,0),(1,1),(0,1)` and the labelled rectangle
`(0,0),(1,0),(1,2),(0,2)` have the same uniform rank-three chirotope, but from the
first labelled point the distances to the second and fourth points are equal only
in the square. `SOURCE_CHECKED` and `LEAN_DECLARATION_PRESENT` for the separate
circle-power-matrix mechanism.

A planar chirotope does not determine equal distances. That does not imply that
every finite combinatorial lift is powerless. The current source contains a
four-dimensional factorization of the circle-point power matrix, rank at most
four, vanishing `5 × 5` minors, and a unique-possible-matching determinant
criterion that distinguishes certified zero, certified nonzero, and unknown
entries.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Bare orientation data and the specifically tested decorations do
not decide the metric incidence.

**Not ruled out:** Circle-power matrices, Euclidean-distance-matrix rank/PSD,
perpendicular-bisector rank, Kalmanson inequalities, paraboloid lifts,
metric-labelled oriented matroids, or support patterns with separately proved
nonzero entries. A point outside a selected four-subset is not automatically off
the full circle; nonzero power requires exact source evidence.

### 3.8 Equilateral subcase

**Assessment:** `CIRCULAR` when equilateralness is assumed solely to prove a
pre-equilateral producer from which equilateralness is obtained downstream.

**Evidence:** `PROSE_CHECKED` at the implication-graph level.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** A historical U2.B producer cannot import its downstream
conclusion as an input.

**Not ruled out:** Equilateral-conditional lemmas after another branch has
established the equilateral frame independently.

### 3.9 Minimality and essential-center coverage

**Assessment:** `INSUFFICIENT_ALONE` for the crude member-coverage count.

**Evidence:** `VERIFIED_INLINE`. If the selected critical rows cover `A` and
each has four members, then `|A| ≤ 4|N|`; at `|A|=11` this yields only
`|N|≥3`. The total membership count then forces some repeated membership, but it
does not identify a useful pair of rows, a center, a repeated circle, or any
particular geometric overlap.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Minimality used only through the scalar coverage inequality has
insufficient structure.

**Not ruled out:** Exact unique-four rows, deletion survival, common-deletion
collisions, five- or six-center synchronization, Hall/Dulmage–Mendelsohn
structure, or power-support rank.

### 3.10 Finite-endpoint and spine discipline

**Assessment:** Finite endpoint theorems are genuine mathematical results; their
current usefulness is a separate consumer question.

**Evidence:** `SOURCE_CHECKED`. At the audited baseline the repository reports a
machine-checked lower bound `n ≥ 12` using the approved compiler-trusted
certificate tier, and `n ≥ 10` when compiler trust is excluded.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`; do not automatically mark
the endpoints off-spine.

`FiniteN9Closure` and the exact-ten/exact-eleven endpoints do not automatically
reduce a generic larger-cardinality leaf. Conversely, lack of a current consumer
does not make their statements false or worthless.

**Rule:** Regenerate the current consumer graph before assigning or retiring
work, and state the trust tier whenever quoting a finite bound.

## 4. b1a1M cap-subchain monotonicity and the ★ inequality

**Cluster status:** Historical. The current source contains the normalized
N8a3 Route-A core and reports it axiom-clean, while other b1a1M formal claims
remain historical in this audit. The former universal bans on SOS, case splits, and arc-angle methods were
too broad.

### 4.1 Arc-angle transport

**Exact target:** Derive strict distance monotonicity from an arbitrary cap
vertex by composing the b1a1M packet with the on-sphere chord/arc lemmas.

**Assessment:** `HYPOTHESIS_MISMATCH`, not circular merely from cosphericity.

**Evidence:** `SOURCE_CHECKED`. `ArcInscribedAngle.lean` requires the angle vertex
`c` and the chord endpoints `x,y` to lie on a common sphere centered at a separate
point `O`, together with a chord-side inner-product condition. The historical
b1a1M packet supplied cap order, disk membership, and signed-area data, but not
that common-sphere packet. `U2/OneHitMonotone.lean` independently records both the
missing common sphere and failure of the required turn inequality for this route.

The prior replacement incorrectly said that the common circle was centered at
`p`. That was impossible for a strict comparison of `p`-distances and is removed
here. Common-sphere membership itself does not assume equality of the two chords,
so the route is not labelled circular without a more specific equivalence.

The historical claim that a broader “Thales with one chord endpoint in the disk”
statement is false was supported only by sampling.

**Assessment of that broader claim:** `NUMERICAL_EVIDENCE_ONLY`.

**Evidence:** `NUMERICAL_ONLY` until an exact witness is copied and checked.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not apply the on-sphere theorem when the packet provides no
common-sphere equations or no required turn/half-plane hypothesis.

**Not ruled out:** A genuine common circle supplied by an independent row, a
normalized coordinate proof, or an arc theorem whose hypotheses match the open
cap geometry.

### 4.2 Closed-cone SOS / Putinar search for ★

Let

\[
G=\langle E_{\mathrm{right}}-x,\,x-p\rangle.
\]

The formal metric identity relates the desired distance comparison to the sign of
`G`.

**General assessment:** `CERTIFICATE_CLASS_IMPOSSIBLE` provided an exact closure
point satisfying every generator and `G<0` has been checked.

**Evidence for the general implication:** `VERIFIED_INLINE`. Any identity placing
`G` in a quadratic module generated by polynomials nonnegative at a point `z`
would imply `G(z)≥0`. Thus a checked `z` with all generators nonnegative and
`G(z)<0` rules out that exact module at every degree.

**Assessment of the recorded b1a1M collapse:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`. The old collapse
`E_left = p = f`, `x = -f` and the complete generator list were not replayed from
a current artifact in this pass.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Once the closure point is restored and checked, it rules out only
the exact unsaturated closed quadratic module generated by those weak
constraints.

**Not ruled out:**

- a strict Positivstellensatz using the genuine open hypotheses;
- saturation by a proved nonzero factor, for example adjoining `t g - 1 = 0`;
- a Stengle preordering;
- component decomposition;
- exact real quantifier elimination;
- a hand or Lean analytic proof.

The old universal sentence “no finite polynomial case split removes the
collapsed point” is false. It applies only to tested closed branches retaining the
collapse; saturation or a branch with a certified nonvanishing condition can
remove that component.

### 4.3 Formal angular core

**Assessment:** `REPORTED_RESULT_UNVERIFIED` for the claimed angular core.

**Evidence:** `HISTORICAL_ONLY` for the named declarations; this pass did not
independently locate their defining modules, rerun their axiom closures, or audit
the full packet-to-angular transport.

The retained lemmas give useful exact metric reductions and an angular
nonnegativity theorem in their strict/open regime. The historical
Cartesian-to-angular extraction bridge was not completed because the then-current
consumer needed only distance inequality `≠`, supplied elsewhere, rather than a
strict order.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Maintenance rule:** Recheck the dependency graph before deleting or reviving
the bridge.

### 4.4 Related N8a3 routes

**Assessment:**

- composition through the off-center b1a1M on-sphere argument —
  `HYPOTHESIS_MISMATCH`;
- reuse of endpoint machinery with incompatible center/order roles —
  `HYPOTHESIS_MISMATCH`;
- normalized rigid-frame Route A in `U2/OneHitMonotone.lean` —
  `FORMAL_CORE_ONLY`, with both adjacent-cap branches implemented;
- general packet-to-normalized-chain bridge — `UNRESOLVED` unless closed by a
  later source change.

**Evidence:** `SOURCE_CHECKED` and `LEAN_DECLARATION_PRESENT` for Route A; the
module itself identifies the vocabulary bridge as the remaining scoped gap.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The two failed transports do not support a ban on all one-hit or
adjacent-cap monotonicity theorems.

## 5. Historical c5d adjacent-cap kernels

**Cluster status:** Historical. No fresh per-entry consumer audit was completed
for this section. The entries remain useful because they separate reported local
falsehoods from coordinate cores whose abstract transport was never completed.

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
condition, the coordinate packet is reported to force `h ≥ π/4`, placing `q*`
outside the unit disk.

**Assessment:** `REPORTED_RESULT_UNVERIFIED` for the claimed formal core.

**Evidence:** `HISTORICAL_ONLY`. The named declarations and formula are
reported by the imported log; their defining modules, packet transport, and axiom
closure were not independently checked in this pass.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The coordinate core applies only when the source packet supplies
the center-`v3` equality, nondegeneracy, and every normalization hypothesis.

**Not ruled out:** Other c5d rows lacking that equality. Do not cite the
coordinate theorem as a completed abstract closure until the transport is a
checked Lean theorem.

### 5.2 c5d1c0 obtuse-angle core

**Assessment:** `REPORTED_RESULT_UNVERIFIED` for the claimed coordinate/angle
core; `BLOCKED_BY_SPEC_MISMATCH` for the unresolved prose transport.

**Evidence:** `HISTORICAL_ONLY`. The imported log names
`c5d1c0_angle_v2_obtuse`, `c5c4a2_qstar_on_O_side`,
`c5c4b3_angle_v2_obtuse`, and `c5c3c_angle_v2_obtuse`, but this pass did not
independently locate and axiom-audit them.

The historical row prose disagrees with its row ledger about the center-`q`
class: one description includes `v3`, while another gives a class such as
`{v1,v2,u,y}`. A conclusion depending on one of those identities cannot be
promoted while the source packet is ambiguous.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Preserve the coordinate lemmas conditionally. Do not call the
abstract row closed.

**Reopen condition:** State the row once in a canonical structure and prove the
packet-to-coordinate transport.

### 5.3 Framing-2 local distance monotonicity

**Exact target:** The inequality

\[
\langle u-v_1,\,v_1-q\rangle\ge0
\]

under the recorded local Framing-2 hypotheses.

**Assessment:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`. The old log gives

\[
u_0=(\tau_0,0),\qquad
\tau_0=\cos h+(2-\sqrt3)\sin h,
\]

and the algebraic margin `(√3-2) sin h < 0`. That sign calculation is exact when
`0<h<π`, but this pass did not recover an artifact checking that `u0` satisfies
every source-packet hypothesis.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Treat the old point as a candidate regression witness, not a
permanent ban, until its full packet is restored.

**Not ruled out:** A different center, stronger global rows, or a comparison not
specializing to this inequality.

**Reopen condition:** Copy the exact parameter interval and all source checks into
an independently replayable artifact.

### 5.4 Vesica local model

**Exact target:** The claim that the listed local two-circle/vesica packet is
inconsistent.

**Assessment:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`. The old record reports nearby points `u_ε` and
`w_ε` on two named equal-radius circles satisfying the local cap-side,
distinctness, and center-`q` K4 conditions, but the model and checker were not
recovered in this pass.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The report concerns only the listed local packet. It does not
establish a model of the global theorem.

**Not ruled out:** Additional K4 rows, full carrier convexity, minimality,
deletion synchronization, exact blocker rows, or a rank condition omitted from
the local model.

**Reopen condition:** Restore the exact model and verify every open inequality
symbolically or by an exact certificate.

### 5.5 Radical-axis and middle-slot transports

**Radical-axis assessment:** `HYPOTHESIS_MISMATCH` for the recorded packet.

**Evidence:** `PROSE_CHECKED`. A radical-axis transfer needs two independently
supplied circle equations. The historical point `u` had only one, and the named
shared points on `B(q,r)` made the proposed identity vacuous rather than a
producer of the missing incidence.

**Middle-slot assessment:** `HYPOTHESIS_MISMATCH`.

**Evidence:** `PROSE_CHECKED`. The historical R-star theorem concerns SED-pin
interior points in a global unit-distance regime; the c5d objects are strict hull
vertices in a variable-radius per-vertex-K4 packet.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** These theorems are inapplicable to the recorded packet; they are
not refuted as mathematical statements.

**Not ruled out:** A packet with a genuine second circle, a proved off-circle
endpoint, or a new middle-slot theorem matching the current object types.

### 5.6 Incompatible-walk monovariants

**Assessment:** `INSUFFICIENT_ALONE` for the four recorded candidates;
`UNRESOLVED` for the unrestricted family of descent states.

**Evidence:** `HISTORICAL_ONLY` for the experiments. No representation theorem was
found that reduces every scalar or well-founded state to those examples.

The old tests report failure of cap rank, hull depth, the selected surplus-cap
label, and one tunable metric scalar to decrease strictly on the recorded walk.
Local vesica cycles were also reported satisfiable.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Those four measures and the exact additive first-moment forms
tested do not supply the desired descent.

**Not ruled out:** Lexicographic states, multiset orders, nonadditive potentials,
finite-state closure, metric-labelled cycles, rank defects, or deletion-closed
subsets.

## 6. Global incidence and full-problem route tests

### 6.1 Ptolemy equality

**Assessment:** `CIRCULAR` for the exact use, after all nondegeneracy and ordering
hypotheses are stated.

**Evidence:** `VERIFIED_INLINE`.

For four distinct points labelled in the appropriate cyclic order, with a known
noncollinear triple, Ptolemy equality characterizes membership of the fourth
point on that triple's circumcircle. Invoking that equality solely to prove the
same circle membership therefore assumes an equivalent form of the target.

The qualifications are load-bearing. A bare statement “Ptolemy equality iff
concyclic” is false or ambiguous: collinear quadruples can attain equality, and
the displayed equality depends on the diagonal/side labelling. For example,
`0,1,2,3` on a line satisfy

\[
|0-2|\,|1-3|=|0-1|\,|2-3|+|1-2|\,|3-0|=4.
\]

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The circularity concerns using the equality itself without an
independent derivation.

**Not ruled out:** A strict Ptolemy inequality, a comparison derived from convex
order, or a different four-point identity with independently available
hypotheses.

### 6.2 Topological and crossing-count traps

**Assessment:** `INSUFFICIENT_ALONE` for the recorded graph definitions and
inequalities.

**Evidence:** `HISTORICAL_ONLY` for the computations and graph instances;
`PROSE_CHECKED` for the warning that generic chord crossings are not geometric
contradictions.

The old experiments report that one symmetrized graph contains a forced
`K_{2,3}` and is not outerplanar, ordinary planarity gives only a weak bound, the
tested Melchior regime misses the relevant radii, and generic chord crossings do
not violate convexity.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Those graph constructions and scalar inequalities do not force
the disputed circle incidence.

**Not ruled out:** A different graph, metric-labelled topology, pseudoline
arrangements with additional incidence restrictions, or a theorem for a special
family. No complexity conclusion follows.

### 6.3 Self-stress and sign-mix route

**Assessment:** `INSUFFICIENT_ALONE` for the recorded linearized stress model.

**Evidence:** `HISTORICAL_ONLY` for the Jacobian, sampling, and Gröbner
experiments; `VERIFIED_INLINE` for the two logical corrections below.

The old rationale contained two invalid universal claims:

1. convex-position conditions are determinant-sign inequalities in point
   coordinates, not globally an intersection of linear half-spaces there;
2. open inequalities can select an algebraic component on which an equality
   holds. On the variety `xy=0`, the condition `x>0` forces `y=0`.

Thus stress dimension and a large sampled sign region may defeat a particular
ansatz, but they do not prove that no stress or polyhedral-lift argument can force
the incidence.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The recorded row-space, sign pattern, and reduction do not force
the target.

**Not ruled out:** Metric-labelled stresses, component-sensitive arguments,
prestress stability, rank defects, or a lift carrying additional incidence
hypotheses.

### 6.4 Faithful all-vertex construction

**Assessment:** `DIRECT_FULL_PROBLEM_ROUTE`, not dead.

**Evidence:** `SOURCE_CHECKED` against the pinned-multiplicity formulation and
`VERIFIED_INLINE` for the logical classification.

A strict-convex finite set satisfying the full per-vertex K4 property is an Erdős
97 counterexample. Constructing one settles the problem negatively. Proving that
no such set exists settles the pinned-multiplicity formulation positively. Either
is substantive full-problem progress, even though neither is a shortcut to a
historical local producer.

The naïve variable-minus-equation count `-n-3` is only an expected-dimension
heuristic. Without an independence, regularity, or transversality theorem it does
not prove inconsistency, point collapse, or zero-dimensionality. Exact
computations at selected small sizes establish only the encoded cases checked.

At the audited baseline the project reports:

- every counterexample has at least `10` points without compiler trust;
- the exact-ten and exact-eleven certificate endpoints strengthen the bound to
  `12` under the project's approved compiler-trust policy.

**Project relevance:** A direct research lane; current publish-spine consumers
are a separate question.

**Reopen condition:** Any exact construction, certified nonexistence theorem, or
new structural reduction is valid progress and must not be rejected by this
registry.

## 7. Historical N4d `q' = E` sign-block routes

**Cluster status:** Historical. The imported log reports that the finite
nine-point endpoint was closed by a different pin-clash route. These entries are
not a live frontier.

### 7.1 Closed-cone sign block for `0 ≤ f1 f2`

**General assessment:** `CERTIFICATE_CLASS_IMPOSSIBLE` if a target-negative point
satisfying every weak closed generator is checked.

**Evidence for the general implication:** `VERIFIED_INLINE`, by the same
quadratic-module evaluation argument as §4.2.

**Assessment of the historical boundary strata:**
`REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`; the complete generators and boundary witness were
not replayed in this pass.

**Assessment of the eventual analytic crux:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`; the imported log names `qEqE_oneCosine_crux`,
but this pass did not independently locate or axiom-audit it.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** After replay, the boundary witness would rule out only the exact
weak unsaturated cone. It would not rule out a strict or saturated certificate.
The analytic route is the recorded replacement.

### 7.2 `reflPt v2 v3 q` as an upper witness

**Assessment:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`. The old source report says this reflection selects
the lower partner rather than the required upper cap point, but the exact packet
and orientation computation were not replayed here.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not treat the historical report as a permanent exact witness
until restored. Do not substitute this reflection for a cap vertex unless its
side relation is proved in the current orientation convention.

**Not ruled out:** Reflection across a different line or a separately proved
upper-point construction.

### 7.3 The `hAElt` and Φ sign routes

**Assessment:** `REPORTED_RESULT_UNVERIFIED` for the proposed `hAElt`
implication; `INSUFFICIENT_ALONE` for the attempted Φ clash.

**Evidence:** `HISTORICAL_ONLY`. The reported counterexample and exact cap-order
sign calculations were not restored in this pass.

The structural issue is clear: membership `b2 ∈ I2` supplies a comparison with
the relevant cap endpoint, not automatically the stronger comparison with `v2`
required by `hAElt`. A downstream sign cannot be imported from an unproved
keystone.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not derive `hAElt` from bare I2 membership.

**Reopen condition:** Restore the exact witness or prove the stronger comparison
from additional source hypotheses.

### 7.4 Shared-circle transfer and the small-s claim

**Shared-circle assessment:** `HYPOTHESIS_MISMATCH`.

**Evidence:** `PROSE_CHECKED`. `SharedCirclePointForcesV3` uses a unit-radius
equilateral coincidence absent from the historical b2 rows. Another point lying
on one of the circles does not supply the missing hypotheses.

The historical finite endpoint shell also had no generic “no five concyclic”
hypothesis; any contradiction must terminate in an actual packet field such as
disk exit, cardinality, distinctness, or convex position.

**Small-s assessment:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY`. The old log reports an exact strict-convex
in-disk completion at `v3=(1,3/4)`, `s=3/4`, but the full model was not replayed.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The shared-circle theorem is inapplicable as recorded. The
small-s uniform claim should be treated as unresolved until the witness is
restored.

**Not ruled out:** Stronger row incidence or an independently checked continuum
argument for a different threshold.

## 8. U-series assembly and retired local architectures

**Cluster status:** Historical. No statement in this section should be read as a
current leaf roster. Several old verdicts depended on the invalid
positive-dimension argument or on obsolete placeholder definitions and have been
corrected below.

### 8.1 U4c bridge through MEC-boundary cap points

Two levels must be distinguished.

**Bare target:** Chord-side cap membership together with distinctness from the
two cap endpoints implies MEC-boundary membership.

**Assessment:** `FALSE_EXACT`.

**Evidence:** `VERIFIED_INLINE`, using the perturbed dodecagon in §2.2. The moved
point has the same cap-side and endpoint-erasure data as before, remains a strict
convex-hull vertex, and has norm `9/10` in a unit minimum enclosing disk.

**Historical U4 transport target:** Derive MEC-boundary membership for the
named cap points from the full U4 packet and its additional hypotheses.

**Assessment of the recorded bridge:** `HYPOTHESIS_MISMATCH`.

**Assessment of the full target:** `UNRESOLVED`, not `FALSE_EXACT` absent a
witness satisfying the full U4 packet.

**Evidence:** `SOURCE_CHECKED` for the definitions: `OnArcOpposite` is only a
chord-side predicate and `capInteriorByIndex` only erases endpoints. The material
audited here did not supply or cite a separately checked boundary theorem for the
recorded transport.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The bare chord-side-plus-endpoint-distinctness implication to
MEC-boundary membership is refuted. A theorem over the full U4 or
`SurplusCapPacket` structure is not refuted
unless every additional field is included in the proof analysis or a checked
structure-level counterexample.

**Not ruled out:** U4 arguments using genuine apex-circle equations,
Apollonius arcs, or separately proved MEC-boundary membership.

### 8.2 U3d affine-form dictionary

**Assessment:** `BLOCKED_BY_SPEC_MISMATCH`.

**Evidence:** `HISTORICAL_ONLY` for the old dictionary audit.

The affine-form identities may be valid once a coordinate dictionary is fixed,
but the historical prose did not fully recover the `q`-coupling shift or state
consistent coordinates for all named points.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not cite the coordinate identities as project theorems until a
single packet-to-dictionary statement is checked.

**Reopen condition:** Pin the coordinates and squared-distance dictionary in one
canonical theorem and prove the source packet supplies it.

### 8.3 U5 Mode-A finite certificate proposal

**Assessment:** `HYPOTHESIS_MISMATCH` for the historical certificate proposition;
no impossibility theorem for certificate methods.

**Evidence:** `HISTORICAL_ONLY` for the old consumer audit.

The proposed AP≥3 certificate had the wrong polarity for the desired positive
removability disjunct and no verified consumer. Cyclotomic-algebraic coordinates
also made the proposed direct finite `decide` replay unsuitable in that form.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not build that exact bank merely because it proves a negative
statement unused by the consumer.

**Not ruled out:** A certificate whose proposition matches a current consumer or
a geometric proof of the actual inline existence target.

### 8.4 U5d wall-crack and U3d redirect

**Assessment:** `INSUFFICIENT_ALONE` for the destroyed-class fifth-member route.

**Evidence:** `VERIFIED_INLINE`. If a named distance class has been proved to have
cardinality exactly four, no fifth distinct member can be drawn from that same
class under the same hypotheses.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not source a new witness from the already saturated exact-four
class.

**Not ruled out:** A surviving class, different center, common-deletion row, or a
new global incidence theorem.

### 8.5 U5dd NEW-2, NEW-3, and NEW-1

- **NEW-2 — Assessment:** `CIRCULAR` where “saturation” is merely a restatement
  of the desired equality or class membership. **Evidence:** `PROSE_CHECKED`.
- **NEW-3 — Assessment:** `UNRESOLVED`. The old closure used the invalid inference
  that a positive-dimensional order stratum cannot lie in an equality locus.
  **Evidence:** `VERIFIED_INLINE` for the defect: the positive-dimensional set
  `{(x,y): x>0, y=0}` lies entirely in the equality locus `y=0`. NEW-3 requires an
  admissible point with `Δ≠0`, a component/density proof, or exact elimination.
- **NEW-1 — Assessment:** `INSUFFICIENT_ALONE` for the naïve first-moment
  incidence count. **Evidence:** `HISTORICAL_ONLY` for the particular numeric
  ledger. Metric-rank and multi-center formulations remain outside the result.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

### 8.6 U1m two-circle producer

**Sink assessment:** `REPORTED_RESULT_UNVERIFIED` when its exact two-circle
hypotheses are supplied.

**Evidence:** `HISTORICAL_ONLY`; the named sink was not independently located or
axiom-audited in this pass.

**Feeder assessment:** `INSUFFICIENT_ALONE` for the historical opposed-row data.
Cap membership alone does not produce the second circle incidence required by
the sink.

The statement “cross-blocking coincidence is likely false” remains
`UNRESOLVED`; no exact current witness was attached.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Not ruled out:** A producer carrying a genuine second circle, radical-axis data,
or power-rank support.

### 8.7 U3 placeholder saturation object

**Assessment:** `BLOCKED_BY_SPEC_MISMATCH` and `INSUFFICIENT_ALONE` for the
historical placeholder definitions.

**Evidence:** `HISTORICAL_ONLY` unless the old definitions are restored in a
current source file.

The reported `U3ShortCapSaturation` object ignored load-bearing arguments and
unfolded to a trivial or parent-equivalent proposition. Renaming the parent goal
is not a reduction.

**Project relevance:** `STALE_STATUS`.

**Durable lesson:** Unfold every placeholder structure and compare the resulting
proposition with its parent before assigning proof work.

### 8.8 Order-residual SAT mining

**Assessment:** Mixed:

- consumer-only UNSAT on an unproducible refinement — `INSUFFICIENT_ALONE`;
- UNSAT whose core uses a relaxed circumcenter proxy — `ENCODING_UNSOUND`;
- unresolved full producer formula — `ENCODING_TIMEOUT`.

**Evidence:** `HISTORICAL_ONLY` / `SOLVER_RESULT_UNREPLAYED`.

A mined refinement must be both strong enough to contradict the consumer and
derivable from the source packet. Strengthening only the consumer side can make
UNSAT easier while making the producer false. A model at the wrong cardinality or
mode may belong to another branch.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Reject clauses whose UNSAT core depends on an unproved proxy or
wrong-size model. No general ban on SAT mining follows.

## 9. Historical U1k counting kernels

### 9.1 Cap-restricted `card = 4`

**Assessment:** `HYPOTHESIS_MISMATCH`.

**Evidence:** `HISTORICAL_ONLY` for the old rescoping audit.

The exact-four statement belongs to the A-indexed distance class, not to a
cap-restricted object already known to have at most two points. The historical
repair was to state it on `exactClassA`.

**Project relevance:** `STALE_STATUS`.

**Exact scope:** Do not reintroduce `card=4` on the cap-restricted class.

### 9.2 U1K4 second-cross-edge route

**Assessment:** `INSUFFICIENT_ALONE` for the historical survivor count;
`BLOCKED_BY_SPEC_MISMATCH` for the measureless self-descent.

**Evidence:** `HISTORICAL_ONLY` for the bucket ledger; `PROSE_CHECKED` for the
need for a well-founded measure and base case.

The old cover inequalities did not force a second cross edge, and the proposed
self-reference did not establish strict descent.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not assert unconditional a4c/a4d existence from the old
U1a–U1d counts or repeat the same self-reference.

**Not ruled out:** A stronger source packet, a new survivor bound, or a genuine
well-founded descent.

### 9.3 U1K3 usable-continuation route

**Assessment:** `REPORTED_RESULT_UNVERIFIED` for the historical one-hit screen
UNSAT; `INSUFFICIENT_ALONE` for the old scalar pigeonhole argument.

**Evidence:** `HISTORICAL_ONLY` / `SOLVER_RESULT_UNREPLAYED`. The cited
`scripts/u1k3-metric-certs/` path is absent at the audited baseline, so neither
the exact formula nor a certificate was replayed.

**Project relevance:** `STALE_STATUS`; do not preserve the old “three open
obligations” roster.

**Exact scope:** The “three candidates beat two slots” count does not close a
packet in which the relevant screen intersection is at most one. The reported
solver result cannot be a permanent family ban until restored.

**Not ruled out:** A different screen object, a stronger source theorem,
order-sensitive continuation, or a current descendant with additional rows.

## 10. Re-architecture, deletion, algebra, and blocker-graph routes

### 10.1 Historical U-lane re-architecture grading

**Assessment:** `UNRESOLVED`; the blanket grading of routes (a), (c), (d),
(e), and (g) as dead is not established.

**Evidence:** `VERIFIED_INLINE` for the defect in the NEW-3
positive-dimension argument; other route-specific observations retain their own
evidence tiers.

A route that only renames an unresolved equality remains
`INSUFFICIENT_ALONE`. A route adding component-sensitive algebra, rank coupling,
or deletion synchronization is not covered by the old grading.

**Project relevance:** `STALE_STATUS`.

**Exact scope:** Preserve only independently valid sub-findings, such as a checked
counterexample to a named lemma or slack in an explicitly written count.

### 10.2 Gamma multi-deletion descent

**Assessment:** `REDUCED_TO_GLOBAL_CLOSURE`, not dead.

**Evidence:** `VERIFIED_INLINE` for the deletion condition and logical limitation;
`SOURCE_CHECKED` for the existence of current two-deletion/common-deletion
machinery at the audited baseline.

Deleting more points cannot restore a destroyed witness row at a center that
survives. But a simultaneous deletion may also delete the obstructing center. For
`X⊆A`, preservation of the per-vertex K4 property on `A\X` requires

\[
\forall p\in A\setminus X\;\exists r>0:
\bigl|T_A(p,r)\setminus X\bigr|\ge4.
\]

A selected exact-four row destroyed by `X` therefore creates a closure
obligation: delete its center too, or produce another row surviving all of `X`.
The set `X` must be checked jointly; a larger class can be destroyed by several
deletions even when no one deletion destroys it.

**Project relevance:** `CURRENT_CONSUMERS_VERIFIED` at the audited baseline in the
sense that the publish frontier included a Two-deletion cluster. This does not say
the historical Gamma formulation itself is a current leaf.

**Exact scope:** The monotonicity observation alone does not validate a Gamma
construction that retains its selected obstructing centers: every such surviving
center still needs an alternate row that survives the whole deletion set.

**Not ruled out:** Sink components, Hall-deficient blocker sets, common-deletion
closures, or simultaneous deletion packets absorbing the obstructing centers.

### 10.3 Beta foreign-smaller-witness proposal

**Assessment:** `UNRESOLVED`.

**Evidence:** `HISTORICAL_ONLY`. No recorded construction supplied the required
foreign witness without reintroducing the metric incidence problem, but absence
of a construction is not a nonexistence proof.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Reopen condition:** Give a precise construction and check convexity,
cardinality, distinctness, and every per-vertex K4 obligation in the smaller
carrier.

### 10.4 Complex Gröbner bases with square slack

**Assessment:** `ENCODING_UNSOUND` when the complex-field square-slack equation is
used as an encoding of a real sign condition.

**Evidence:** `VERIFIED_INLINE`.

If a real inequality is represented over `ℂ` by

\[
s^2=r-g(p),
\]

then every complex value of `r-g(p)` has a square root. The equation imposes no
real nonnegativity condition. Consequently, ordinary complex Gröbner emptiness of
that slackened system cannot certify infeasibility whose only obstruction is a
real sign inequality.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** The no-go concerns that exact complex encoding.

**Not ruled out:** Real quantifier elimination, CAD, real radicals or preorderings,
or exact sign determination on a zero-dimensional real variety.

### 10.5 The `D14` Cramer identity

The recorded identity is

\[
D14=4640\,\delta_0\delta_1\delta_2\,
\operatorname{SignedArea}(O_0,O_1,O_2).
\]

**Identity assessment:** `REPORTED_RESULT_UNVERIFIED`; the imported log
reports a formal algebraic core.

**Evidence:** `HISTORICAL_ONLY`; the exact declaration and axiom closure were not
independently located or replayed in this pass.

The biconditional

\[
D14=0\iff O_0,O_1,O_2\text{ are collinear}
\]

requires `δ0δ1δ2≠0`. Without that nondegeneracy, `D14=0` may come from any zero
factor `δi`; calling these “denominator factors” is justified only if the
coordinate derivation has separately defined them that way.

**Leaf-local forcing assessment:** `REPORTED_RESULT_UNVERIFIED`.

**Evidence:** `HISTORICAL_ONLY` for the reported witness `D14=603`; its exact
coordinates and source-packet checker were not recovered.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not claim the unqualified biconditional. Do not use the
historical `603` value as a permanent local counterexample until replayed.

**Not ruled out:** Full-web elimination, saturation by the nonzero `δi`, a rank
proof, or another minor whose support is globally controlled.

### 10.6 Additive descent measures

**Assessment:** `INSUFFICIENT_ALONE` for the recorded additive and first-moment
potentials.

**Evidence:** `HISTORICAL_ONLY` for the flat-indegree and tight-class ledgers.

Those examples show that the tested scalar quantities do not decrease without
the missing compatibility theorem. They do not quantify over every well-founded
state.

**Project relevance:** `STALE_STATUS` / `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Do not repeat the exact additive potential or a cosmetic
renaming.

**Not ruled out:** Lexicographic or multiset orders, nonadditive potentials,
finite closure ranks, component size, rank deficiency, or a proof that a proper
blocker-closed subset shrinks.

### 10.7 Bare outdegree-one blocker graph

**Assessment:** `INSUFFICIENT_ALONE` for an unlabeled functional blocker graph.

**Evidence:** `VERIFIED_INLINE` that choosing one blocker per failing deletion
produces a directed cycle in a finite functional graph; `HISTORICAL_ONLY` for the
reported local cycle-plus-vesica models.

A bare cycle says which centers interact. It does not supply cross-incidence,
exact row membership, a fifth circle member, or a metric contradiction.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`; current source uses richer
blocker rows and common-deletion data, so no blanket blocker-graph ban is valid.

**Exact scope:** Pigeonhole, cycle length, and unlabeled exact-four cardinality do
not by themselves imply a small-cardinality contradiction.

**Not ruled out:** Radius labels, exact rows, omission labels, angular equations,
Kalmanson comparisons, radical-axis signs, power-matrix support, or
common-deletion coupling. The historical claim that every bare two-cycle is
incompatible with strict convexity remains `UNRESOLVED`.

### 10.8 Angle-2 firewall curve identity

**Classification assessment:** `UNRESOLVED` as documented.

**Evidence:** `HISTORICAL_ONLY`. The old text did not define the admissible curve
class, regularity assumptions, or functional equation needed to prove “the
firewall curves are exactly parabolas.” At most it reported uniqueness inside a
particular degree-four root-set ansatz.

Likewise, “no quantity is simultaneously per-vertex and radius-free” is not a
well-formed theorem without a defined class of quantities.

**Global-firewall assessment:** `DIRECT_FULL_PROBLEM_ROUTE`.

**Evidence:** `SOURCE_CHECKED` against the pinned-multiplicity formulation. A
firewall proving that no strict-convex all-vertex-K4 configuration exists proves
Erdős 97 directly.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`; the mathematical
route remains valid regardless of its current spine position.

**Exact scope:** Do not cite the undocumented curve search as a universal
classification or no-go theorem.

### 10.9 Retired U2 opposite-cap vocabulary

**Assessment:** No mathematical assessment; this is a project-status record.

**Evidence:** `SOURCE_CHECKED` for the README's broad statement that former
shared-radius and LIVE-Q/C declarations were bypassed and retired rather than
individually proved; `HISTORICAL_ONLY` for the exact composition and zero-reference
audit of the older attic bundle.

**Project relevance:** `STALE_STATUS` / `OFF_SPINE_AT_BASELINE`.

The exact attic declarations are reported retired because the caller and packet
vocabulary changed. Retirement does not prove their statements false or true.

**Rule:** Do not resurrect the exact attic declarations as purported current
leaves. Restate needed content in current vocabulary and prove the source bridge.

### 10.10 Card12Up uniform equality/separator language

**Reported target:** Uniform contradiction from the recorded circle equalities,
separator/noncollinearity data, exact-four rows, and listed row decorations.

**Assessment:** `REPORTED_RESULT_UNVERIFIED` in this audit.

**Evidence:** `REPOSITORY_ARTIFACT_UNREPLAYED`. The audited repository contains
`scratch/d3-formulation/` artifacts including `t1_results.json`,
`t9_wit_*.json`, verification scripts, and `candidateB/`. This pass confirmed
their presence but did not replay every witness and checker.

The stored witnesses are reported nonconvex. Even after replay they would refute
only the exact equality/separator relaxation, not source Lean leaves carrying
`ConvexIndep`.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** Preserve the artifacts as mandatory positive controls. Upgrade
to `FALSE_IN_RECORDED_RELAXATION` only after the exact formulas and witnesses are
replayed under a pinned checker.

**Not ruled out:** Kalmanson inequalities, circular split weights, convex-order
signs, MEC support, EDM PSD/rank, power-matrix rank, or multi-center coupling.

### 10.11 Per-type minimal-window exclusions

**Reported result:** Thirteen of nineteen decorated single-center local types are
realized by exact rational witnesses, and the recorded token-composition system
retains global survivors.

**Assessment:** `REPORTED_RESULT_UNVERIFIED` in this audit;
`INSUFFICIENT_ALONE` for the reported single-center composition scheme.

**Evidence:** `REPOSITORY_ARTIFACT_UNREPLAYED`. The audited repository contains
`census/candidate_d_probe/`, witness JSON, checker material, and a state ledger
reporting the thirteen exact realizations. This pass confirmed the artifacts but
did not rerun the complete witness and composition checkers.

**Project relevance:** `CURRENT_CONSUMERS_UNVERIFIED`.

**Exact scope:** After replay, a realized type cannot be excluded by the same
single-center predicate. The existing local kill list still would not be assumed
to compose to a global contradiction without a separate theorem.

**Not ruled out:** Two-center or larger windows, common-deletion coupling,
cross-row support rank, or a new composition theorem.

**Reopen condition:** Replay and digest every witness/checker before upgrading the
entry to `FALSE_EXACT` for the precise local exclusions.

## 11. Maintenance rules and durable reopen conditions

### 11.1 Statements safely barred now

The following conclusions have source-level or inline support strong enough to
bar their exact forms without relying on missing historical artifacts:

- cap membership alone supplies no circle equation;
- unfolding `capInteriorByIndex` alone supplies no radial equality or strict
  inequality;
- the bare chord-side-plus-endpoint-erasure implication to MEC-boundary
  membership is false by the perturbed dodecagon in §2.2;
- the b1a1M on-sphere transport cannot be applied without a genuine common sphere
  centered at a separate `O` and the required chord-side/turn hypothesis;
- Ptolemy equality cannot be used solely to prove the same concyclicity it
  characterizes, with the stated nondegeneracy and order caveats;
- ordinary complex Gröbner plus square slack does not encode real sign
  infeasibility;
- positive dimension alone does not show that an equality is unforced;
- the unqualified `D14=0`/circumcenter-collinearity biconditional is invalid
  without `δ0δ1δ2≠0`;
- the crude coverage inequality `|A|≤4|N|` supplies only a lower bound on the
  number of centers and, beyond aggregate repeated membership, no specified or
  geometrically useful overlap;
- placeholder “reductions” that unfold to the parent goal are not reductions.

These are narrow statements. Each may be escaped by adding a genuinely new
hypothesis or coupling that changes the exact proposition.

### 11.2 Claims retained only as regression leads

The following historical reports are **not** permanent bans at this baseline
because the exact witness, generator list, solver input, or checker was absent or
unreplayed:

- the U1.3 midpoint countermodel;
- the weak local Build-B Frame-I model;
- the b1a1M and N4d target-negative quadratic-module closure points;
- the Framing-2 `u0` packet;
- the local vesica model;
- the reflection, `hAElt`, Φ, and small-s counterexamples;
- the U1K3 one-hit solver result;
- the `D14=603` local witness;
- the d3 nonconvex witness bank and the candidate-d exact local-type bank, until
  their repository checkers are replayed.

Before relying on one, restore or run the exact artifact and record its digest,
checker version, source-packet contract, and result.

### 11.3 Routes previously overclosed

Do not reject the following merely by citing an old universal slogan:

- explicit-class QF_NRA after new source reductions;
- strict or saturated real-algebraic certificates;
- circle-power, bisector-rank, EDM, Kalmanson, or other metric lifts;
- minimality coupled to exact rows and deletion synchronization;
- metric-labelled blocker cycles;
- simultaneous deletion through a proper blocker-closed set;
- component-sensitive stress or rank arguments;
- convexity-coupled uniform algebra;
- normalized N8a3 Route A and its still-needed vocabulary bridge;
- faithful construction of a counterexample;
- a direct firewall proof;
- any route whose only old no-go was the positive-dimensional-stratum argument.

### 11.4 Promotion checklist

Before upgrading an entry to `FALSE_EXACT`, `PROVED_EXACT`,
`CERTIFICATE_CLASS_IMPOSSIBLE`, or `FALSE_IN_RECORDED_RELAXATION`, verify all of
the following:

- the exact proposition is written with quantifiers, object types, order
  conventions, positivity assumptions, and nondegeneracy hypotheses;
- the witness or proof satisfies the **source** packet, not a relaxed proxy;
- every packet-to-coordinate transport is formal or explicitly separated;
- the exact artifact is present, hashed, and independently replayed;
- solver version, command, timeout, and full formula are pinned;
- UNSAT has a checked certificate or is labelled unreplayed;
- a Lean theorem's `#print axioms` closure is recorded;
- current consumers were regenerated from the audited source;
- the conclusion does not quantify over a larger method family than the evidence;
- a direct full-problem route is not mislabeled dead because it bypasses the
  current architecture.

### 11.5 Entry template

```markdown
### <route name>

**Exact target:** <quantified proposition or named Lean declaration>

**Assessment:** `<mathematical assessment>`

**Evidence:** `<evidence tier>` — <theorem/artifact/command/version/digest>

**Project relevance:** `<relevance status>` — <consumers; checked commit/date>

**Exact scope:** <what is ruled out>

**Not ruled out:** <nearby stronger or differently coupled formulations>

**Reopen condition:** <specific new ingredient>
```

This format is the guardrail against turning “the recorded bare formulation
failed” into “the entire mathematical mechanism is dead.”

