# Audit verdict

Yes. The document remains valuable as a record of **specific failed constructions and refuted lemmas**, but it currently conflates several materially different conclusions:

1. a proposed lemma is actually false;
2. a particular encoding timed out;
3. one first-moment argument has insufficient slack;
4. a route has no consumer on the present Lean spine;
5. a route is as hard as the full problem;
6. an entire mathematical technique has been ruled out.

Only the first of these normally justifies an unconditional “do not re-attempt.” I found:

* **one definite source-level mathematical error;**
* **several definite stale-status statements;**
* **at least seven theorem-family bans that are substantially broader than the evidence supports;**
* **several historical `PROVEN` verdicts whose supporting artifacts are not available in the canonical repository.**

I did not replay every historical solver job or every scratch certificate. That is impossible from `main` alone because the document says that several referenced `p97-rvol` audits and postmortems were not copied into the canonical repository. Consequently, this is a source, logic, and scope audit—not a complete independent rerun of every experiment.

## 1. Definite error: cap-interior points need not be strictly inside the MEC

The most concrete error is the statement:

> “Only the 3 Moser vertices lie on the MEC boundary; interior cap points are strictly inside…”

The source does not say this. In the circumscribed branch,
`moser_triangle_exists` (in `lean/Erdos9796Proof/P97/Moser/Triangle.lean`)
forms the set of **all** carrier points on the MEC boundary and then chooses an
arbitrary three-element subset from it. It only proves that the three selected
vertices are boundary points; it does not prove that no others are.

Moreover,

```lean
capInteriorByIndex
```

is defined in `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean` by erasing
the two endpoint Moser vertices from the closed cap. It is not defined by the strict inequality

\[
d(x,O)<R_{\mathrm{MEC}}.
\]

Thus “strict cap interior” means **endpoint-erased cap**, not strict interior of the MEC disk.  The attached Family E expansion uses exactly this endpoint-erased meaning.

A direct counterexample to the dead-ends statement is a regular hexagon. Choose alternating vertices as the Moser triangle. The remaining three vertices are still on the MEC boundary, and each is a non-endpoint member of one of the corresponding caps.

### Correct replacement

The durable statement should be:

> Caps are signed-area half-plane/chord-separation sets, not circle classes. The packet guarantees that the three selected Moser vertices lie on the MEC boundary, but other carrier points may also lie on it. `capInteriorByIndex` removes the two cap endpoints and does not by itself imply strict MEC-disk membership.

The important “a cap is not a circle” warning remains valid. But every downstream argument using

\[
x\in C_i^\circ\Longrightarrow d(x,O)<R_{\mathrm{MEC}}
\]

must be re-audited. The more specialized claim that an MEC-boundary point which also lies on a particular apex-centered anchor circle must be one of the two intersections may still be valid; the erroneous global boundary claim is not needed for that two-circle argument.

## 2. The supposed live (Q) frontier is historical, not current

The document’s Cluster 1 still labels (Q) as the “LIVE frontier,” describes three open spine leaves, and Cluster 6 says the active frontier is (Q). The current checkout and README instead record twenty direct A-tail leaves in nine packages, and say that the former LIVE-(Q/C) and shared-radius declarations were bypassed and retired when the caller moved to `CriticalPairFrontier`; they were not individually proved.

This matters strategically. An argument may resemble the old (Q) obstruction without being equivalent to any current leaf. Conversely, a theorem that does not solve historical (Q) may close a current exact-four, exact-five, E, or F-(\Gamma) descendant.

### Correct replacement

Every historical entry should carry two independent fields:

* **Mathematical residual:** what proposition the route really failed to establish.
* **Current consumers:** exact current declarations, or `none`.

“Equivalent to historical (Q)” should no longer be used as sufficient grounds for closing a route unless an explicit current-source implication has been checked.

## 3. The (\exists\mathbb R)-completeness claim is unsupported and partly ill-posed

The document twice states that `PerVertexK4` or (Q) is **(\exists\mathbb R)-complete**, attributes this to Mnëv universality, and uses it as the “root explanation” for why topology and elementary approaches fail.

That is not established by what the document presents.

To assert (\exists\mathbb R)-completeness, one first needs a clearly specified decision problem:

* Is the input (n)?
* A proposed equality hypergraph?
* A blocker-row system?
* A cyclic order plus prescribed circle incidences?
* Some other finite combinatorial structure?

One then needs a polynomial-time reduction from an established (\exists\mathbb R)-complete problem. Mnëv universality for oriented-matroid realization spaces does not automatically give such a reduction to this particular repeated-distance system.

There is a second logical problem: even a valid (\exists\mathbb R)-completeness theorem would not imply that “general topology cannot force (\Delta=0).” Complexity classifications do not prohibit elegant structural theorems on a restricted family of instances.

### Correct replacement

Use something like:

> The realizability systems are semialgebraic and empirically exhibit positive-dimensional and component-sensitive behavior. No (\exists\mathbb R)-hardness or completeness result for the relevant P97 decision problem is currently established here.

The specific outerplanarity, Melchior, and crossing-count attempts may remain dead for their stated numerical or structural reasons. The purported complexity-theoretic explanation should be removed.

## 4. “Continuous SMT exhausted” contradicts the document’s own revised solver audit

The revised `(D-msolve)` section says something quite specific and useful:

* monolithic Boolean class-selection inside nonlinear real arithmetic is intractable at the tested budgets;
* explicit-class, per-branch QF_NRA is usable, resolving many branches;
* remaining branches require escalation or exact algebra.

Cluster 1 nevertheless retains the broader verdict:

> “continuous SMT (QF_NRA) — exhausted”

and says the explicit-class gate is spent.

Those are not the same conclusion. The current source still has exact-full and six-class F-(\Gamma) probes at `UNKNOWN`, not proved SAT or UNSAT, while fixed-cardinality branches admit finite explicit-class decompositions. ([GitHub][1])

### Correct replacement

The dead entry should be:

> **Dead:** monolithic selector-based QF_NRA at the recorded formulations and budgets.
> **Still viable:** explicit-class per-branch QF_NRA, especially after rank, order, and distance filters, provided every branch has a useful certified outcome.

This is not a recommendation to buy unlimited compute. It is a correction to the mathematical status of the technique.

## 5. The Positivstellensatz conclusion is much too broad

The document records an obstruction to one particular certification scheme. The chosen weak, closed semialgebraic hypothesis set contains degenerate boundary points where the target inequality is false. Therefore no identity in the corresponding closed quadratic module can certify the target at any degree. The repository's source comments and closed-cone argument are recorded in `lean/Erdos9796Proof/P97/Cap/ArcInteriorPoints.lean`; there is no kernel-checked impossibility theorem there, and the evidence is scoped to those closed-cone generators, not to every strict or saturated Positivstellensatz route. ([GitHub][2])

That does **not** prove:

* no Positivstellensatz certificate using the genuine strict hypotheses;
* no certificate after saturating by nonzero factors;
* no Stengle-style preordering certificate;
* no finite strict semialgebraic case split;
* no real quantifier-elimination proof.

For example, if genuine geometry gives (g\ne0), introducing

\[
t g-1=0
\]

removes the (g=0) boundary stratum completely. Whether that larger system is computationally tractable is a separate question.

The document itself says the target has a valid proof in the genuine strict/open regime. That makes the distinction between the strict set and its closure load-bearing.

### Correct replacement

> Closed-cone Putinar/SOS/SDP certificates from the recorded weak generators are impossible. Do not rerun that exact certificate search. Strict Positivstellensatz, saturation, or exact real QE are not ruled out, although the route currently lacks a live consumer.

The route is also off-spine, which may make reopening it low priority. But “all Positivstellensatz / SOS / case-split routes are proven dead” is mathematically stronger than the evidence.

## 6. Bare order type is dead; lifted rank and power-pattern methods are not

The document correctly observes that a planar chirotope by itself does not encode equal distances. Its explicit same-order-type/different-distance example is a valid objection to a **bare** order-type solution.

The overreach is the subsequent claim that every combinatorial relaxation has zero discriminating power and that the only sound coupling necessarily reintroduces monolithic QF_NRA.

The power-matrix proposal is a direct counterexample to that meta-claim. For genuine full circles

\[
\Omega_i=\Gamma(c_i,r_i),
\qquad
P_{ij}=|z_j-c_i|^2-r_i^2,
\]

one has

\[
\operatorname{rank}P\le4.
\]

A finite zero/nonzero pattern can contradict that rank without coordinates or nonlinear solving. As you correctly emphasized, the valid (5\times5) certificate requires:

1. the graph of entries **not proved zero** to have a unique perfect matching;
2. every edge of that unique matching to be **proved nonzero**.

Then all other determinant terms contain a proved zero, while the unique surviving term is nonzero.

This uses combinatorial support information coupled to a fixed algebraic rank theorem. Similar comments apply to:

* the rank-(\le3) perpendicular-bisector matrix;
* paraboloid-lifted circuit matroids;
* Euclidean-distance-matrix rank and PSD constraints;
* Kalmanson order cones;
* positive Ptolemy/Plücker systems.

The current checkout contains a concrete source-level implementation in
`lean/Erdos9796Proof/P97/Census554/CirclePowerMatrix.lean`, including
`powerMatrix_rank_le_four`, `powerMatrix_det_fin_five`, and the unique-possible-
matching criterion.  This is theorem-bank infrastructure, not yet an
unconditional consumer on the published spine; its presence therefore keeps
the route active without claiming a finished closure.

### Correct replacement

> Bare planar chirotopes and the tested decorated-order encoding are insufficient. Lifted rank, power-support, Euclidean-distance, and convex-order representations remain untested or active.

The full-class versus chosen-subset distinction remains crucial: a point outside a chosen CD four-set is not thereby known to give a nonzero power entry for the underlying circle. The attached leaf statement explicitly distinguishes actual full shell rows from chosen common-deletion subsets.

## 7. “Minimality gives no producer teeth” only applies to the crude first-moment use

The dead-end argument shows that minimality plus four-set coverage, used only as

\[
|A|\le 4|\mathcal N|,
\]

does not by itself force the desired same-circle incidence. At the global floor (n=11), it only forces three nonrobust centers. That limited conclusion is sound. ([GitHub][2])

The blanket conclusion is no longer sound for the current descendants.

Current source retains `notRobustCover_card` as the explicit “positive content”
of minimality.  Moreover,
`sixCenterDeletionSurvivalPacket_of_oneSided` already proves a six-center
synchronization packet (two collision blockers, three robust Moser apices, and
one surviving cap-source blocker).  Its bundled
`FiveCenterDeletionSurvival` component carries the first five survival rows,
and the final field supplies the surviving cap-source row; this is a producer
packet, not a contradiction.  The unresolved bridge is the fixed
`U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses` consumer
(in `lean/Erdos9796Proof/P97/U3ToU5Terminal.lean`) together with confinement
of all six rows to one common eight-point `U5BoundedSupport` (defined in
`lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean`); no theorem currently
derives that confinement from the six-center packet.  The current closure docs
record this as the live producer frontier.

At a cap-eight descendant, writing \(\mathcal N\) for the source's
`notRobustCenters` set, with

\[
|A|\ge17,
\]

the same inequality gives

\[
|\mathcal N|\ge\left\lceil\frac{17}{4}\right\rceil=5,
\]

not merely three. Five may still have slack, but this is a qualitatively different finite structure from the old positive-dimensional three-center fragment.

### Correct replacement

> Minimality through the unstructured first-moment cover count alone is insufficient. Minimality coupled to exact unique-four rows, deletion survival, cap localization, and a fixed five- or six-center system remains active.

Promising consumers include Hall deficiency, Dulmage–Mendelsohn decomposition, closed blocker subsets, and power-matrix support rank. None follows from the scalar count alone.

## 8. The bare blocker functional graph is dead; metric-labeled blocker cycles are not

The document convincingly explains why the bare map

\[
q\mapsto p(q)
\]

plus functional-graph pigeonhole does not by itself imply (n\le9). A cycle only selects dangerous centers; it does not create the missing cross-incidence. ([GitHub][2])

The concluding ban is too broad:

> “do not re-propose the blocker-digraph as a distinct cardinality route.”

Current source is explicitly organized around two collision rows, cross-membership or one-sided deletion survival, and a positive producer that must generate a three-hit shell or a cross-row incidence. It also imports the Kalmanson equality machinery.

A blocker cycle enriched with any of the following is no longer the dead bare graph:

\[
r_{p_1}<r_{p_2}<\cdots<r_{p_k}<r_{p_1},
\]

angular midpoint equations,

\[
2\theta(c)=\theta(x)+\theta(y),
\]

alternating-order constraints, or radical-axis sign data.

### Correct replacement

> Bare outdegree-one cardinality and unlabeled cycle arguments are exhausted. Blocker cycles carrying metric inequalities, angular averaging, Kalmanson comparisons, or exact row-support constraints remain viable.

That is also consistent with the current source-level producer, rather than fighting the architecture.

## 9. The multi-deletion route is not proved impossible by monotonicity

The document declares direct multi-deletion “PROVEN-dead by monotonicity”: once deleting a point destroys K4 at a surviving center, deleting more points cannot restore it.

The monotonicity statement is true. The strategic conclusion does not follow.

A simultaneous deletion can also delete the center whose K4 witness was destroyed. Therefore a valid multi-deletion set (X) only needs K4 to survive at points of

\[
A\setminus X.
\]

The obstruction becomes a closure condition:

> whenever (x\in X) blocks (p), either (p\in X) or (p) retains another four-class disjoint from (X).

That may indeed be as hard as a global blocker-hypergraph closure problem, but “reduces to a global closure problem” is not the same as “proved impossible.” A sink component, Hall-deficient set, or proper closed subset could be exactly what is needed.

### Correct replacement

> Naïve sequential deletion does not repair a killed surviving center. Multi-deletion reduces to finding a proper deletion-closed blocker set. The current source does produce a fresh center and a cardinality-minimal blocker core via `exists_fresh_sharedRadiusPair_or_minimalDeletionCore`, but it does not yet produce a globally deletion-closed set or the missing contradiction.

The relevant source-level machinery is `lean/Erdos9796Proof/P97/ATail/GlobalMinimalDeletion.lean`; it records the closure problem but does not supply the missing contradiction.

This should be labeled `REDUCED_TO_GLOBAL_CLOSURE`, not `PROVEN_DEAD`.

## 10. A faithful construction is not a dead end; it is the negative solution

The “faithful-construction-nogo” section proves only the following:

> A faithful convex all-vertex K4 construction would be a full P97 counterexample.

That is not a reason to classify it as dead. It means the construction route is **not a shortcut**. It is still one of the two complete ways to resolve the problem. The attached Family E prompt likewise treats an exact full configuration satisfying all hypotheses as equally valuable to a contradiction proof.

The dimension count and the tested small-pattern UNSAT results are useful heuristics, but they do not prove that no construction exists.

There is also a definite stale numerical statement. The section says the first possible faithful witness is (n\ge10). The current checkout contains `Problem97.FiniteN10Closure` in `lean/Erdos9796Proof/P97/FiniteN10.lean` and, since 2026-08-01, `Problem97.FiniteN11Closure` in `lean/Erdos9796Proof/P97/FiniteN11.lean`; both are recorded under the README’s **compiler-trusted native trust boundary**, so the full-P97 floor is now

\[
\boxed{n\ge12}.
\]

`FiniteN11Closure` closed on 2026-08-01 (commit 553206dc): its measured axiom closure is exactly `{propext, Classical.choice, Quot.sound, Lean.ofReduceBool, Lean.trustCompiler}` with no `sorryAx`. Neither the N=10 nor the N=11 result is a three-core-axiom/kernel-only closure: both audited dependency sets additionally contain `Lean.ofReduceBool` and `Lean.trustCompiler`, which is why the README keeps them outside the three-axiom set. The kernel-only floor remains (n\ge10) via `not_hasNEquidistantProperty_four_of_card_le_nine`. Neither finite endpoint is on the `erdos97_rhs` publish spine, and neither is a completed publish target.

### Correct replacement

> Faithful construction is equivalent to solving P97 negatively. It is high-cost and should not be presented as an easier way to settle a local producer, but it remains a valid project lane. The current compiler-trusted bound is (n\ge12); it is not a kernel-only closure, which stands at (n\ge10).

For a particular cap-eight descendant, of course, its own cap arithmetic may give a higher local minimum.

## 11. “Firewall” and “off-spine” are not mathematical dead ends

Several entries dismiss an argument because it would produce only a “firewall”:

\[
\text{no convex all-vertex K4 configuration exists},
\]

rather than a removable vertex fitting the RVoL spine.

But such a firewall proves the full P97 conclusion directly. It may bypass the current proof architecture, but it is stronger than the intended local theorem.

Likewise, finite-cardinality closures do not reduce the generic large-(n) spine, but they are genuine mathematical progress. The current README records `FiniteN10Closure`, `FiniteN11Closure`, and the resulting compiler-trusted (n\ge12) bound.

### Correct classification

Use:

* `OFF_CURRENT_SPINE`;
* `DIRECT_HEADLINE_ROUTE`;
* `CARDINALITY_ONLY`;
* `NO_CURRENT_CONSUMER`;

rather than `DEAD`.

A route should be deprioritized for engineering reasons without being declared mathematically invalid.

## 12. The nonconvex witness conclusions are slightly overgeneralized

The W15/W16 and concentric-ring witnesses appear to do real work: they refute equality-plus-separator and row-decorated statements that omit convex-position coupling. The document correctly acknowledges that all these witnesses are nonconvex and that the live Lean leaf remains untouched.

The final injunction—

> “do not re-dispatch pattern-level or ideal-theoretic uniform lemmas”

—is broader than the falsifiers justify.

What has been killed is approximately:

\[
\text{circle equalities}
+\text{separator/noncollinearity data}
+\text{the tested row decorations},
\]

without a sufficiently strong encoding of convex cyclic geometry.

It does not kill uniform statements using:

* Kalmanson inequalities;
* circular split weights;
* convex-order signs in a lifted configuration;
* MEC support constraints;
* power-matrix rank plus cap order;
* Euclidean-distance-matrix PSD/rank;
* multi-center rather than single-center windows.

### Correct replacement

> Do not retry uniform equality/separator-only or the recorded single-center decorated languages. A future uniform lemma must be explicitly convexity-coupled and must fail on the stored nonconvex controls for the intended reason.

The subsequent single-center-window conclusion is much better scoped: thirteen local types are actually realized, and the document explicitly preserves two-center windows. That part should remain.

## 13. Two further claims should be downgraded pending evidence

### “Firewall curves are exactly parabolas”

This is a strong classification theorem, but the dead-ends entry does not specify:

* the class of admissible curves;
* smoothness or algebraicity assumptions;
* the exact telescoping identity;
* whether “exactly” is global or only within a tested degree-(4) ansatz;
* a Lean theorem, symbolic certificate, or cited proof.

Until that material is attached, it should be marked:

\[
\texttt{CONJECTURED / PROVED-IN-RESTRICTED-ANSATZ}
\]

rather than used to ban all curve-identity searches. ([GitHub][2])

### “All elementary and global-combinatorial levers are exhausted”

This cannot be a proved mathematical statement. The current source itself continues to develop new global combinations of exact rows, Kalmanson geometry, cap localization, and deletion synchronization.

It should be replaced by an exact list of feature languages already tested.

# Decisions that still look sound

I would **not** broadly reopen the following:

* treating a cap itself as a circle;
* the exact Build-B apex monotonicity statement already refuted by coordinates;
* using Ptolemy equality on three known points and the target fourth point to prove that same fourth point is concyclic—the equality is the conclusion in disguise;
* complex Gröbner plus ordinary square slack as a method for detecting purely real inequality infeasibility;
* bare planar chirotopes with no metric lift;
* the exact closed-cone SOS searches whose closure contains a target-negative degenerate point;
* the recorded equality/separator-only uniform patterns refuted by exact nonconvex witnesses;
* single-center minimal-window exclusion banks for the thirteen locally realized types.

Those are well-supported, appropriately scoped lessons.

# Recommended rewrite of `dead-ends.md`

Every entry should have a machine-readable status from this set:

| Status                       | Meaning                                                        |
| ---------------------------- | -------------------------------------------------------------- |
| `FALSE_EXACT`                | Exact counterexample to the proposed lemma                     |
| `FORMALLY_CLOSED`            | Lean theorem closes the precise target                         |
| `CIRCULAR`                   | Hypothesis or invoked equality is equivalent to the conclusion |
| `ENCODING_UNSOUND`           | Solver result came from an unfaithful model                    |
| `ENCODING_TIMEOUT`           | No verdict; exact encoding and budget recorded                 |
| `INSUFFICIENT_ALONE`         | Tested invariant/count has slack                               |
| `OFF_SPINE`                  | No current consumer, but mathematics may be valid              |
| `EQUIVALENT_TO_FULL_PROBLEM` | Not a shortcut, but remains a valid solution route             |
| `STALE`                      | Superseded by current source                                   |
| `CONJECTURED`                | Plausible negative assessment without proof                    |
| `REOPEN_WITH_NEW_COUPLING`   | Bare route dead, enriched route viable                         |

The current use of “PROVEN-dead” covers too many of these categories.

# Routes I would reopen now

In priority order:

1. **Power and bisector support-rank scans**, using the exact unique-possible-matching/nonzero-matching guard you identified.
2. **One-sided deletion synchronization**, combining minimality, the five-or-more nonrobust-center budget, exact-four rows, and Hall/Dulmage–Mendelsohn or bounded-support closure.
3. **Metric-labeled blocker cycles**, especially Kalmanson strict comparisons, angular midpoint equations, and radical-axis signs.
4. **Explicit-class QF_NRA and exact EDM filtering** for fixed-cardinality and bounded residuals; not monolithic Boolean-selector NRA.
5. **Strict real-algebraic certificates** using saturation or exact QE where the only obstruction to closed-cone SOS is a degenerate boundary point.
6. **Convexity-coupled uniform algebra**, as opposed to the refuted equality/separator-only language.

The most consequential correction is not merely the MEC-boundary error. It is the document’s repeated conversion of

\[
\text{“this bare or spine-specific formulation failed”}
\]

into

\[
\text{“the entire mathematical mechanism is dead.”}
\]

That conversion has likely caused several worthwhile multi-center, rank, deletion-closure, and convex-order routes to be prematurely deprioritized.

[1]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/README.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/README.md"
[2]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/dead-ends.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/dead-ends.md"
