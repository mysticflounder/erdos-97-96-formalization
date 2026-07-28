# Banked P97 theorems as candidate pruning rules for a shell-hypergraph census

Read-only research inventory. Scope: theorems whose STATEMENT is pure
incidence/counting (Finset cardinalities, set intersections, blocker/endomap
combinatorics) with no exact metric coordinate data in the conclusion, that
could discard a candidate combinatorial shell-hypergraph node in a planned
census. Provenance is marked per row: **this repo** (verified by direct
`Read`/`grep` against the working tree) vs **p97-rvol** (the sibling repo,
verified only via the `nthdegree docs search/show --lean` indexed corpus —
the physical file is not inside this repo's tree, consistent with
`docs/general-n-certificate-bank-mining-2026-07-09.md`'s "Sibling `p97-rvol`
banks" section). Every row is a *proven, no-`sorry`* declaration at time of
writing unless noted; this inventory does not itself certify novelty or
current spine-wiring.

Background definitions (from
`docs/solve-prompts/2026-07-27-rigid221-physical-apex-chain.md` §1):
`K4(X;p)` ⇔ ∃t>0, |{x∈X : d(p,x)=t}| ≥ 4 (Lean `HasNEquidistantPointsAt 4 X p`
/ `HasNEquidistantProperty 4 A`); "$A$ has the K4 property" means `K4(A;p)`
for every `p ∈ A`. A **critical shell system** `H` assigns each `x∈A` a
blocker center `c_H(x) ≠ x`, a row `S_H(x)` that is a *full* ambient radius
class with `|S_H(x)| = 4` exactly and `x ∈ S_H(x)`, and the **blocking
property** `¬K4(A∖{x}; c_H(x))`.

The predicate family itself is parametric in an explicit `n : ℕ`
(`HasNEquidistantPointsAt n A p`, `HasNEquidistantProperty n A` — see
`lean/Erdos9796Proof/P97/UniversalProblem97.lean:15-16`, "All predicates
... are upstream declarations"). Problem 97 itself is the fixed case `n = 4`;
every theorem below that consumes this predicate does so with the **literal
numeral `4`** written into its statement, not a bound variable — so
"k-general" below always means "the *proof technique* does not need `4`
specifically, even though the *statement as written* is at `n=4`," never
"the Lean statement already quantifies over `k`."

## Table

| # | Name / handle | Source | Statement shape | Hypotheses | k=4-specific or k-general | Census predicate pruned |
|---|---|---|---|---|---|---|
| 1 | `Problem97.card_ge_five_of_K4` | this repo: `lean/Erdos9796Proof/P97/Counting.lean:27` | `A.Nonempty → HasNEquidistantProperty 4 A → 5 ≤ A.card` | `A` nonempty, K4 property. No convexity, no minimality. | **k-general.** Proof: pick any `p∈A`, K4 gives `r>0` with `\|{x:dist p x=r}\|≥4`, that set `⊆ A.erase p`, so `A.card ≥ 5` by `omega`. Arithmetic `4→k`, `5→k+1` verbatim. | discard any node with `\|A\| < 5` |
| 2 | `Problem97.not_collinear_of_K4` | this repo: `Counting.lean:47` | `A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → ¬Collinear ℝ (A:Set ℝ²)` | as above, composes #1 + `ConvexIndep.not_collinear_of_card_ge_three`. | k-general (chains #1, needs only `k≥3`). | discard collinear candidate carriers |
| 3 | `Problem97.MEC.no_diameter_under_k4` | this repo: `lean/Erdos9796Proof/P97/NoDiameterUnderK4.lean:725` | `A.Nonempty → ¬Collinear → ConvexIndep A → HasNEquidistantProperty 4 A → 3 ≤ \|{p∈A : p on MEC boundary}\|` | convexity, non-collinearity, K4. No minimality, no fixed `n`. | **CANNOT TELL FROM DOC** for the fine-grained arithmetic — the proof (~700 lines, Lagrange-multiplier-style same-sign-pair argument) is only partially read; it uses `hK4 a ha_mem` to extract one `r>0` with a size-≥4 witness set, then a geometric packing argument in the diameter half-disk. Plausibly generalizes to k≥3 but not verified. | discard any candidate whose MEC-boundary count is claimed `<3` |
| 4 | `Problem97.boundary_card_ge_three_of_K4` | this repo: `Counting.lean:57` | thin wrapper composing #2+#3 | same as #3 | same as #3 | same as #3 |
| 5 | `Problem97.MEC.exists_capTriple_of_circumscribed` | this repo: `lean/Erdos9796Proof/P97/CapBridgeFromK4.lean:38` | circumscribed-branch MEC boundary (`3 ≤` boundary card) + convexity ⇒ ∃ non-obtuse Moser triangle + `CapTriple` (3-cap partition of `A`) | `A` nonempty, non-collinear, convex, `3≤` boundary-card hypothesis (from #3/#4). No K4 needed directly (K4 only feeds the boundary-card hyp), no minimality. | k-irrelevant — pure MEC/Moser-triangle/cap-partition construction, no equidistance count in the statement at all. | n/a (construction step, not itself a discard rule) |
| 6 | `Problem97.MEC.nonempty_surplusCapPacket_of_circumscribed` | this repo: `CapBridgeFromK4.lean:82` | as #5, plus `9 < A.card` ⇒ `Nonempty (SurplusCapPacket A)` | convexity, non-collinear, boundary-card ≥3, `n>9`. No minimality. | k-irrelevant for the packet's existence; the `9` threshold is downstream pigeonhole (see #9). | n/a (construction step) |
| 7 | **`Problem97.MEC.nonempty_surplusCapPacket_of_K4`** | this repo: `CapBridgeFromK4.lean:98` | `A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → 9 < A.card → Nonempty (SurplusCapPacket A)` | convexity, K4, `n>9`. **No minimality hypothesis anywhere in the chain.** | Depends on #3 (CANNOT TELL) for the diameter exclusion; the cap-partition/pigeonhole parts (#5,#6,#9,#10) are k-general/k-irrelevant. | **The full three-cap/Moser-triangle answer to Q1** — see below. Prunes: any candidate carrier with `n>9`, convex, K4 that is claimed to have NO valid 3-cap Moser partition. |
| 8 | `Problem97.U1OppositeCapLowerBounds.capTriple_caps_card_ge_four` (+ `interior1/2/3_card_ge_two`) | this repo: `lean/Erdos9796Proof/P97/U1OppositeCapLowerBounds.lean:446` (also duplicated in p97-rvol under the same name) | given `CapTriple`, convexity, non-collinear, K4, `CircumscribedMECPacket` ⇒ all three caps have `≥4` points | full cap/Moser/MEC-circumscribed apparatus + explicit `HasNEquidistantProperty 4 A` | **k=4-specific by conclusion** (`4 ≤ Ci.card` is literally the K4 bound transported through the cap structure via `Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap`-style ≤1-per-cap arguments); plausibly generalizes to "`≥k` per cap from K_k" but not verified line-by-line. | discard a candidate node claiming a cap of size `<4` inside a valid CapTriple |
| 9 | `Problem97.CapTriple.exists_surplus_cap_of_card_gt_nine` | this repo: `lean/Erdos9796Proof/P97/Cap/Structure.lean:262` | `CapTriple A M → 9 < A.card → ∃ i, 4 < (Ci).card` | just the cap-sum identity `\|C1\|+\|C2\|+\|C3\| = n+3` plus `n>9`; **pure `omega` pigeonhole, no metric/K4 hypothesis at all.** | **Plausibly k-general** — proof is `by_contra` + `omega` off the sum identity; generalizes verbatim to "if `n > 3(k-1)` then some cap has `>k` points" for any fixed cap-count-3 partition. | discard a 3-cap-partitioned candidate with `n>9` where all three caps are claimed `≤4` |
| 10 | `Problem97.CapTriple.toSurplusCapPacket_of_card_gt_nine` | this repo: `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:420` | packages #9 into a `SurplusCapPacket` | as #9 plus the Moser/cap-partition data | same as #9 | n/a (packaging step) |
| 11 | `Problem97.CapTriple.capSum` / `SurplusCapPacket.capSum` | this repo: `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:397` and `Cap/Structure.lean` | `\|surplusCap\|+\|oppCap1\|+\|oppCap2\| = A.card + 3` | just a valid `CapTriple`/`SurplusCapPacket` (no K4). | k-irrelevant — pure partition counting identity. | discard any claimed 3-cap partition whose three cap sizes don't sum to `n+3` |
| 12 | `Problem97.ATailBiApexBlockerMultiplicity.second_fiber_or_larger_first_fiber_of_two_omissions` | this repo: `lean/Erdos9796Proof/P97/ATail/BiApexBlockerMultiplicity.lean:35` | for **any** finite `α`, `f:α→α` omitting two named values `omitted₁≠omitted₂`: either a second collision fiber exists disjoint from a named source's fiber, **or** the named fiber already has a third source. | `Finite α`, `f:α→α`, two never-hit values, nothing else — **fully abstract, no geometry, no `4`, no distances.** | **k-general / fully k-independent** — this is generic finite combinatorics about non-surjective self-maps, reusable for a blocker map of any critical-shell arity. | discard a candidate blocker-endomap (2 known omitted centers, exactly one known collision fiber of size 2) that has no second collision fiber AND no 3rd source in the first fiber |
| 13 | `Problem97.ATailBiApexBlockerMultiplicity.third_fiber_or_larger_known_fiber_of_three_omissions` | this repo: `BiApexBlockerMultiplicity.lean:111` | same shape as #12 but with 3 omitted values and 2 known collision fibers ⇒ third fiber or a known fiber gains a 3rd source. Docstring notes explicitly: "The fixed-point-free property of the blocker map is not needed for this counting conclusion." | `Finite α`, `f:α→α`, 3 never-hit values, 2 known collision pairs — abstract. | **k-general / fully k-independent**, same reason as #12. | discard a candidate blocker-endomap (3 known omitted centers, 2 known collision fibers) with no 3rd fiber and no known fiber growing a 3rd source |
| 14 | `Problem97.CriticalShellSystem` (structure) + `Problem97.CriticalSelectedFourClass` (structure) | this repo: `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1010` and `:630` (also in p97-rvol) | interface, not a standalone theorem: every `q∈A` has a chosen blocker `center`, a `CriticalSelectedFourClass` with **exactly 4 named pairwise-distinct support points** `l1,l2,l3,l4`, and `¬HasNEquidistantPointsAt 4 (A.erase q) center` (blocking property). | definitional — any instance witnesses these as *facts*, not free assumptions. | **k=4-specific by construction**: the structure is literally named "FourClass" with 4 hardcoded named fields, and `no_qfree` hardcodes the numeral `4`. Not parametric even though the underlying predicate machinery is. | discard any candidate shell-hypergraph node whose "shells" are not exactly-size-4, or whose blocker assignment doesn't satisfy the single-deletion blocking property |
| 15 | `Problem97.U1CarrierInjection.inter_card_le_two` | **p97-rvol** (verified via `nthdegree docs show ZJVCDM --lean --source`; file not physically in this repo) | `\|SelectedClass(x,r₁) ∩ SelectedClass(y,r₂)\| ≤ 2` for `x≠y` | distinct centers; docstring: "the proof only uses that each support lies on a Euclidean circle around its center, and that distinct centers give distinct spheres." No K4, no `4`. | **k-general / k-irrelevant** — plane geometry fact (two distinct circles meet in ≤2 points), unrelated to the equidistant-count parameter. | discard any candidate pair of shells/classes at distinct centers with claimed `\|Σ(x)∩Σ(y)\| > 2` |
| 16 | `Problem97.U1ShortShellPruning.long_apex_shell_card_le_two` | **p97-rvol** (handle `GZHGB9`) | "a long exact-radius apex shell has at most two points" | not fully read (only summary line); presumably an apex-specific instance of the same circle-intersection fact. | UNVERIFIED — summary only; likely k-irrelevant by analogy to #15 but not confirmed. | discard candidate "long" apex shells with `>2` points |
| 17 | `Problem97.U3ShortCapOverlapBound.cap_overlap_le_two` | **p97-rvol** (handle `TP1KQX`) | "two distinct circles ... meet in at most two points. Concretely: if every point of finite `K` is at distance ρ from `p`, then at most two points of `K` are simultaneously at distance `d` from a second center `c≠p`." | `p≠c`; single fixed radius `ρ` on `K`. No K4. | **k-general / k-irrelevant**, same plane fact as #15. | discard a candidate cap `K` (all at fixed radius from `p`) claimed to have `>2` points at a fixed second radius from `c≠p` |
| 18 | `Problem97.FiniteEndpointShell.N8a_two_intersection_bound` | this repo: `lean/Erdos9796Proof/P97/N8/N8aArcTwoCircle.lean:164` | `((SelectedClass A apex r) ∩ arc.support).card ≤ 2`, from an `N8ApexArcWitness` | requires a `FiniteEndpointShell`, an `N4eCapContainment` fact, and an `N8ApexArcWitness` — i.e. a specific endpoint-shell/arc-witness apparatus, not bare convexity. | k-irrelevant for the ≤2 conclusion itself (same circle-intersection fact), but the *hypotheses* are endpoint-bank-specific machinery, not general census data. | discard candidate (apex-radius-class) ∩ (named arc) with claimed size `>2`, **only inside the endpoint-witness apparatus** |
| 19 | `Problem97.ATailExactFourRobustCapExpansion.actualLateRow_secondClass_card_le_two` | this repo: `lean/Erdos9796Proof/P97/ATail/ExactFourRobustCapExpansion.lean:383` | `(criticalFourShell.support ∩ SelectedClass D.A oppApex2 rho).card ≤ 2` | full A-tail apparatus: `CounterexampleData`, `SurplusCapPacket`, `CriticalShellSystem`, `CriticalPairFrontier`, `OriginalUniqueFourResidual`, `ExactFourPostCardElevenRobustSurface` — a deep, very specific proof-chain context, not a standalone general fact. | k-irrelevant for the ≤2 conclusion (again a 2-circle fact via `criticalFourShell_inter_selectedClass_card_le_two`), but **wrapped in heavy A-tail-specific hypotheses**; treat as a *derived instance* of #15/#17's underlying fact rather than an independent general rule. | discard only inside the specific A-tail exact-four robust-surface branch |

## Not included as rows (checked, judged out of scope or too weak)

- **`Problem97.U5QCriticalTripleClass.*_incompatibility` / `U5GlobalIncidence*` family** (296 modules, 96 class-level + 88 metric-point + 112 scalar-algebra kernels per `docs/general-n-certificate-bank-mining-2026-07-09.md` "U5 incidence bank"). Sampled declarations (`t_qpt0n2_anchor_incompatibility`, `u5_qcritical_exact_selected_...incompatibility`) are all named `*_metric_incompatibility` and consume exact distance-equality hypotheses between named classes, not raw incidence/counting data. **Excluded**: these need exact metric data, contradicting the task's "no exact metric data, only incidence/counting" scope. They are the leading candidate bank if the census is later extended to metric-shadow data.
- **`Problem97.EndpointCertificate.K4WindowBank.false_of_mem_k4DeadCertificates`** (10-entry dead K4 Nullstellensatz bank, per the same doc's "Unimported Lean result"). Excluded: it is an algebraic zero-evaluation certificate over exact real coordinates of a 4-point window, not an incidence/counting fact, and it is explicitly unimported/dead-certificate-only.
- **Census-554 equality-core obstructions** (`equilateral_bisector_collision`, `three_triad_collision`, duplicate-center/equal-`K4` closure) — border case. They operate on *labeled* row patterns closed under equality, which is closer to combinatorial pattern-matching than raw coordinates, but their soundness ultimately routes through metric collision theorems (`u5_unit_triangle_on_p_circle_incompatibility`, etc.), so they are metric-consequence theorems, not incidence-only. Flagged but not tabulated.
- **`Problem97.ATailBlockerMultiplicityGeometry.*`** (untracked file `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean`, 588 lines, git-status `??`). This is **active in-progress work on one specific proof chain** (translating the #12/#13 finite-map arms into A-tail geometry), not a banked/reusable general theorem — every declaration is parameterized by a huge fixed context (`D, S, radius, radiusρ, H, F, R, Fρ, Rρ, P, Pρ`) specific to the live "physical apex chain" leaves. Per this project's CLAUDE.md, in-progress context-bound leaves are not "banked" results; excluded from the table.
- **`Problem97.n9Point_four_radon_*` (Radon partition family)** — per `certificates/erdos97_legacy_general_n_mining.md` "Four-point Radon reserve", proven **only in the legacy `~/projects/math-projects/erdos/97` archive** (`lean/N9Geometry.lean:127,140,176`), about 4 arbitrary points in the plane, non-affine-independence / Radon partition / partition-elimination, kernel-clean (`propext, Classical.choice, Quot.sound`). k-irrelevant (basic convex geometry, unrelated to any equidistance count). **Not currently present in this repo** by name or normalized shape — flagged as a reserve, not a currently-banked in-repo rule.

## Q1 — Where is the three-cap/Moser structure PROVEN for convex K4 configurations?

The composed, unconditional theorem is
**`Problem97.MEC.nonempty_surplusCapPacket_of_K4`**
(`lean/Erdos9796Proof/P97/CapBridgeFromK4.lean:98-108`, this repo):

```
A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → 9 < A.card →
  Nonempty (Problem97.SurplusCapPacket A)
```

`SurplusCapPacket A` is exactly the Moser-triangle + 3-closed-cap-partition +
surplus-cap-index data (`v₁,v₂,v₃` on the MEC boundary, caps `C1,C2,C3`
partitioning `A`, cap-sum `= n+3`, one cap `>4`). It is proved by chaining,
all in this repo:

1. `Problem97.MEC.no_diameter_under_k4` (`NoDiameterUnderK4.lean:725`) — K4 +
   convex + non-collinear ⇒ MEC boundary has `≥3` points, i.e. excludes the
   Sylvester diameter branch;
2. `Problem97.MEC.exists_capTriple_of_circumscribed`
   (`CapBridgeFromK4.lean:38`) — boundary `≥3` + convex ⇒ non-obtuse
   circumscribed Moser triangle + `CapTriple` (3-cap partition), via the
   already-proven `exists_nonobtuse_circumscribed_triple`,
   `moser_triangle_signed_area_ne_zero`, `arc_partition_count_eq_one`,
   `cap_partition_from_moser_circumscribed`;
3. `Problem97.MEC.nonempty_surplusCapPacket_of_circumscribed`
   (`CapBridgeFromK4.lean:82`) — adds `CapTriple.toSurplusCapPacket_of_card_gt_nine`
   (`Cap/PartitionFromMEC.lean:420`), a pure pigeonhole on `n>9` and the
   cap-sum identity (`CapTriple.exists_surplus_cap_of_card_gt_nine`,
   `Cap/Structure.lean:262`) to pin the surplus cap.

**Hypotheses required: exactly `A.Nonempty`, `ConvexIndep A`,
`HasNEquidistantProperty 4 A`, `9 < A.card`.** No minimality-of-counterexample
hypothesis is used anywhere in this chain, and there is no other `n`-bound
besides `n>9` (which is itself the proven counting floor from Q2, not an
assumption). The only genuinely `4`-specific step in the chain (as opposed to
pigeonhole arithmetic that would generalize) is `no_diameter_under_k4`, whose
fine-grained dependence on the literal `4` I could not fully verify from a
partial read of its ~700-line proof (row #3 above, marked CANNOT TELL).

## Q2 — n-floor bounds

The strongest proven "impossible below" bound is
**`Problem97.counterexample_card_ge_nine`**
(`lean/Erdos9796Proof/P97/Counting.lean:95-108`, this repo):

```
A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → 9 ≤ A.card
```

i.e. **no convex K4 configuration has fewer than 9 points** — proved
unconditionally, no minimality needed. It composes:
`not_collinear_of_K4` + `boundary_card_ge_three_of_K4` (⇒ MEC boundary `≥3`,
same `no_diameter_under_k4` as Q1) with the CGN8 circumscribed upper bound
on the isosceles-triangle incidence count `iCount A` and the lower bound
`six_mul_card_le_iCount_of_K4` (`6·n ≤ iCount A`), closed by
`counting_arithmetic` (`counterexample_card_ge_nine_of_iCount_upper_bound`,
`Counting.lean:73-93`, hypothesis: `iCount A ≤ (11n²-18n)/12`). This part is
**k=4-specific**: the constants `6, 11, 18, 12` are outputs of a
double-counting argument over isosceles triangles built from the K4 property
specifically, not a parametrized-in-`k` bound.

A weaker but fully k-general floor is `card_ge_five_of_K4` (row #1): `n≥5`
from K4 alone, no convexity.

The `n>9` **upper-direction** ("no counterexample survives past 9") is *not*
proven unconditionally — it is exactly `UniversalReductionHypotheses.descent`
(`lean/Erdos9796Proof/P97/UniversalProblem97.lean:44-55`), an interface field
requiring, for `n>9`, a strictly-smaller-counterexample witness *under the
strong-induction minimality IH*. That remains the open Milestone-4 target;
Q2's proven floor is only the `9 ≤ n` direction.

## Q3 — Blocker fibers

No banked theorem gives a universal numeric cap on blocker-fiber size (e.g.
"every blocker center serves at most `M` sources") as an unconditional
closed-form bound. What is banked:

- **`Problem97.CriticalShellSystem`** (structure, `U1CarrierInjection.lean:1010`,
  also p97-rvol) fixes the shell-system shape itself: each source `x` has one
  chosen blocker `center ∈ A∖{x}` and a full ambient row of size **exactly 4**
  through `x`, with the blocking property `¬K4(A∖{x}; center)`. This is
  definitional scaffolding a census node must satisfy, not a fiber-size bound.
- **`second_fiber_or_larger_first_fiber_of_two_omissions`** and
  **`third_fiber_or_larger_known_fiber_of_three_omissions`**
  (`BiApexBlockerMultiplicity.lean:35,111`, this repo, rows #12–13) are the
  actual banked *fiber-multiplicity forcing* theorems: fully abstract finite
  self-map combinatorics (no geometry at all) that force a second/third
  collision fiber or a growing known fiber whenever 2 or 3 values are known
  to be never hit by the blocker map. These are pure pruning rules for a
  candidate blocker endomap on any census node, independent of `k`.
- `scratch/triapex-incidence-obstruction/check_model.py`'s asserted facts
  (`max(fibers.values()) == 2`, exactly 3 doubled fibers) are **not a proven
  Lean theorem** — the file's own docstring states "This is theorem-discovery
  evidence only... it does not encode planarity, MEC geometry, convex
  independence, or the full Lean residual." It is a python sanity-check on
  one specific 15-point candidate structural shadow, useful as a target
  shape to try to prove, not itself usable as a pruning rule.

## Q4 — Shell/class intersection bounds

Yes — this is the best-populated family. Every sampled result bounds a
class/shell/cap pairwise intersection by 2, and each is ultimately an
instance of "two distinct circles in the plane meet in at most two points,"
so none of them uses the K4 hypothesis or any `n`-bound in its proof, only
`centers distinct`:

- `Problem97.U1CarrierInjection.inter_card_le_two` (p97-rvol, row #15):
  `\|SelectedClass(x,·) ∩ SelectedClass(y,·)\| ≤ 2` for `x≠y`, no other hypotheses.
- `Problem97.U3ShortCapOverlapBound.cap_overlap_le_two` (p97-rvol, row #17):
  same fact phrased for a fixed-radius cap `K` around `p` vs. a second center
  `c≠p`.
- `Problem97.U1ShortShellPruning.long_apex_shell_card_le_two` (p97-rvol, row
  #16) — summary-only, presumed analogous.
- `Problem97.FiniteEndpointShell.N8a_two_intersection_bound`
  (`N8/N8aArcTwoCircle.lean:164`, this repo, row #18) and
  `Problem97.ATailExactFourRobustCapExpansion.actualLateRow_secondClass_card_le_two`
  (`ATail/ExactFourRobustCapExpansion.lean:383`, this repo, row #19) are
  concrete *instances* of the same underlying circle-intersection fact,
  wrapped in heavy endpoint/A-tail-specific hypothesis packets — usable as
  pruning rules only inside those specific proof contexts, not as standalone
  general census rules.

For a combinatorial census, the reusable general form is rows #15/#17: **any
two shells (or a shell and a cap) with distinct centers intersect in at most
2 points** — this constrains, but does not by itself bound, shell-hypergraph
degree; it does not say anything about same-center classes at different
radii, nor about 3-way intersections.

## Counts

- k-general or k-irrelevant (proof technique doesn't need the literal 4,
  or the fact predates/ignores the K4 hypothesis entirely): rows 1, 2, 5, 6,
  9, 10, 11, 12, 13, 15, 17, 18*, 19* (18/19 general only for the ≤2
  conclusion itself, not their surrounding hypotheses) — **13 of 19** table
  rows.
- k=4-specific (the literal `4` is load-bearing in the statement or the
  constants are K4-derived): rows 8, 14, and the Q2 CGN8/`counting_arithmetic`
  chain (`counterexample_card_ge_nine`) — **3 of 19**, plus the excluded
  metric/U5/K4-window families (out of table scope entirely, not counted here).
- CANNOT TELL FROM DOC (fine-grained arithmetic dependence on 4 not verified
  from available material): rows 3, 4 (`no_diameter_under_k4` and its
  wrapper) — **2 of 19**.
- UNVERIFIED (summary-only, declaration not read in full): row 16 — **1 of 19**.
