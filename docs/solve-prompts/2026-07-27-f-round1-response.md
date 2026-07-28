# Family F — deep-thinker round 1 response (2026-07-27)

Provenance: first response of the deep-thinker harness run on
`2026-07-27-exact-collision-terminals.md`. Reproduced verbatim below the
rule. Audit status (rigid221-collapse session, same day): every repository
citation verified real; the cited Lean artifacts
(`CrossBlockerCoincidenceAudit.lean`, `NoThreeHit.lean`,
`equality-arm-model.lean`) are sorry-free; the
`BlockerMultiplicityGeometry.lean` quote is verbatim. NOT re-verified this
session: the arithmetic of the 15-point model (exact-rational checker
artifacts exist from a prior session) and the content match of the claimed
six-point F1 equality-arm model against `equality-arm-model.lean`. The two
genuinely new mathematical claims — the F3c-redundancy derivation and the
sharpened F3/F4 sufficient terminals — are CONJECTURE until kernel-checked.

The four boxed "global bridge" targets at the end are the round-2 prompt
subjects; see the `f-bridge-*.md` documents.

---

## Result of the repository audit

I used the uploaded specification as the authoritative statement of Γ and F1–F4, and compared it with the live Lean definitions and surrounding proofs in the repository.

**I did not obtain a complete Branch-A proof or a complete Branch-B certificate for any of the four leaves.** Presenting any of the reductions below as a resolution would violate the success criteria in §§4–5.

The audit did, however, establish that the obstruction is substantially sharper than the four leaf statements suggest: the local circle, cap-order, collision, and mutual-omission data are jointly realizable in exact convex geometry. Any valid proof must introduce a genuinely global consequence of minimality, the all-center K₄ property, or `noM44`.

## Leaf-by-leaf outcome

### F1 — cross-blocker coincidence

The equality itself does not create the desired cross-shell incidence. For example, under $b=t_1$, $t_1$ is the **center** of $K(s_1)$, so $t_1\notin K(s_1)$. The same applies to all four equality arms. The repository contains source-clean checks of precisely these four omissions.

More decisively, there is an exact rational strictly convex six-point model realizing:

$$|a_1s_1|=|a_1s_2|,\qquad |a_1t_1|=|a_1t_2|,$$
$$|bs_1|=|bs_2|,\qquad |b't_1|=|b't_2|,$$

with $b=t_1$, distinct source pairs, distinct blockers, and the permitted alternating cap order. Relabeling realizes all four F1 equality arms. This is not a model of full Γ, but it refutes every proof based only on local bisectors, convex order, circle intersection, or Kalmanson-style inequalities.

The exact remaining F1 obligation is therefore still:

$$\Gamma+\mathrm{CrossBlockerCoincidence}\Longrightarrow\bot,$$

where the proof must use a new global bridge. Neither the localized packets nor the blocker-map two-cycle supplies such a bridge: they strengthen the relevant **omissions**, not memberships.

### F2 — cap source plus fresh third blocker fiber

The `FreshThirdBlockerFiber` structure contains a fresh equal-blocker pair, but no incidence between that pair and the cap-source row $K(g)$. The source file itself explicitly notes that no global contradiction follows from these geometric facts alone.

Thus F2 currently consists of two largely uncoupled objects:

$$g\in C_{i_1}^{\circ},\qquad |K(g)|=4,$$

with $K(g)$ omitting at least one member of each collision pair, and

$$c(x)=c(y)\notin\{b,b'\},\qquad x\ne y,$$

with $K(x)=K(y)$ containing $x,y$. Nothing forces $x$ or $y$ into $K(g)$, forces $c(g)=c(x)$, or places $c(x)$ in the first cap.

The exact gap is a positive global producer of at least one of the following types:

$$K(g)\cap K(x)\ne\varnothing \quad\text{in a geometrically usable position},$$

a common outside pair with two distinct first-cap bisector centers, a proper deletion-closed K₄ subcarrier contradicting minimality, or a newly constructed `IsM44` packet contradicting C7. None follows from the currently proved local interfaces.

### F3 — enlarged first fiber plus five-center deletion residual

The enlarged first fiber does give the exact row

$$K(s_1)=\{s_1,s_2,e,o\},\qquad e,o\notin C_{i_1}.$$

The checked first-fiber module proves the strongest unconditional consequence for another exact row: because two distinct circles meet in at most two carrier points, the other row omits at least two of these four points. It then reaches exactly the cycle-aligned/five-center-deletion disjunction recorded in the prompt.

A further simplification is important:

**Modulo Γ and F3b, F3c carries no new positive geometry.**

Indeed, F3b says $K(g)$ omits at least one of $s_1,s_2$. Choose such an $s_i$. The exact cap traces and pair disjointness give $s_i\notin K(t_1)$. Hence D1 gives deletion survival at $c(g)$ and $b'$; robustness gives survival at $a_0,a_1,a_2$. This is one of the $s_1/s_2$ arms of F3c. The analogous observation applies to the $t$-arms.

Consequently, the unresolved mathematical core of F3 is already present in:

$$\Gamma+\mathrm{F3a}+\mathrm{F3b}.$$

The closest proved terminals would close F3 under one of these additional conclusions:

$$|K(g)\cap K(s_1)|\ge 3,$$

or

$$c(g)\in C_{i_1}\quad\text{and}\quad \{e,o\}\subseteq K(g).$$

The second would contradict D9 because both $b$ and $c(g)$ would be distinct centers in $C_{i_1}$ equidistant from the off-cap pair $e,o$. Neither conclusion is currently derivable from the stated hypotheses.

### F4 — enlarged second fiber

F4 is the exact symmetric obstruction:

$$K(t_1)=\{t_1,t_2,e,o\},\qquad e,o\notin C_{i_1}.$$

The same two sufficient terminal shapes would close it:

$$|K(g)\cap K(t_1)|\ge3,$$

or

$$c(g)\in C_{i_1}\quad\text{and}\quad \{e,o\}\subseteq K(g).$$

Again, the cap-source hypotheses only supply omissions among the four collision sources. They do not locate $c(g)$ or force either outside point into $K(g)$.

## Why the most natural proof routes fail

The repository contains an exact rational 15-point strictly convex model with all four principal local exact-four classes: two distinct classes at the common apex and one blocker shell for each source pair. Every designated circle is a full carrier-level four-point class. Thus even the combined four-circle local pattern is metrically realizable.

That model fails the global hypotheses at the earliest important point: twelve of its fifteen centers have no K₄ class. It also lacks a production MEC packet, a full critical-shell system, and three rich robust apices. This shows both that local geometry is not enough for Branch A and that a Branch-B search must solve the all-center K₄ propagation problem before it even reaches C6, C7, or the tri-apex conditions.

The principal approaches were eliminated as follows:

* **Cross-hit construction:** impossible. The exact closed-cap traces force all four named cross hits to be false.
* **Three-hit construction:** also impossible under the rich-apex low-intersection theorem; the repository's audit proves the advertised positive target is itself incompatible with the exact rows.
* **Blocker-map cycles:** a blocker 2-cycle produces mutual center omissions, not common support points.
* **Two-circle counting:** the sharp bound is intersection cardinality at most two, and exact convex models attain two.
* **Ordered-cap/Kalmanson:** the realizable order is the permitted alternating order; the existing contradiction theorems require a nonalternating order.
* **Unique-four cover counting:** $|A|\le4|\mathrm{NR}|$ is a lower bound on the number of nonrobust centers, not a contradiction. Three collision-fiber excesses can exactly account for the three robust apices.
* **Global minimal deletion:** the checked instantiation supplies one cap center equidistant from some outside pair, or a minimal deletion core. D9 requires a second distinct cap center for the same pair; no theorem identifies or manufactures that second center.
* **`noM44`:** no alternate MEC-derived surplus packet with two four-point caps is produced by the distance rows. Merely relabeling the working triangle does not change the cap cardinalities in the required way.

## Branch-B status

No exact Branch-B certificate was found. The strongest existing exact local construction verifies strict convexity and the four key exact circles, but explicitly fails:

* K₄ at every carrier center;
* existence of a full `CriticalShellSystem`;
* three distinct rich/robust Moser apices;
* the required MEC-derived cap packet.

It therefore cannot be extended into a certificate merely by filling in names or packet rows.

## Precise unresolved global bridge

All four leaves would materially advance if one source-clean theorem produced any of these from Γ:

**(Bridge 1) A named positive cross-shell incidence**

or

**(Bridge 2) Two distinct first-cap centers bisecting one named off-cap pair**

or

**(Bridge 3) A proper convex-independent K₄ subcarrier**

or

**(Bridge 4) An alternative MEC surplus packet satisfying `IsM44`**.

The current checked descent produces only negative incidences, exact two-point traces, and single-center outside-pair data. That is the exact point at which the attempted resolutions stop; no complete leaf proof or full realizability certificate survived the required audit.

Cited repository artifacts (all verified present):
`scratch/cross-blocker-terminal/REPORT.md`,
`lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean`,
`lean/Erdos9796Proof/P97/ATail/FirstFiberOverlapDescent.lean`,
`scratch/full-local-euclidean-model-complete/REPORT.md`,
`scratch/hard-branch-math/REPORT.md`.
