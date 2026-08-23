# AlphaEvolve P97 artifact analysis — 2026-08-22

**Status: EMPIRICAL throughout.** Every finding in this document is numerical.
No claim here is proven, and no claim here is Lean-promoted. Candidate lemma
statements are marked {{NEEDS_PROOF}}. The degrees-of-freedom counts are
HEURISTIC (naive constraint counting); the Jacobian ranks are finite-difference
computations at specific points.

## 1. Artifact provenance

Source notebook (Google DeepMind, AlphaEvolve repository of problems):

- `https://raw.githubusercontent.com/google-deepmind/alphaevolve_repository_of_problems/main/experiments/equidistant_points_in_convex_polygons/Equidistant_points_in_convex_polygons.ipynb`

The notebook targets exactly our Problem 97 statement: find a convex polygon
in which every vertex has 4 other vertices equidistant from it (a
counterexample), or get as close as possible. Its normalized defect score for
a polygon P is

- `score(P) = (worst over vertices v of the best 4-window range) / (min_side² / diameter)`

where the best 4-window range at v is the minimum over sorted-distance windows
of `d(4) − d(1)` among the distances from v to the other vertices. The
`min_side²/diameter` denominator is the notebook's anti-degeneration
normalization (their first, naive scoring allowed point clustering; see §4,
finding F4 for why the exponent 2 is structurally meaningful).

Notebook contents relevant here (coordinates extracted to
`scratch/alphaevolve-p97-analysis-20260822/alphaevolve_configs.txt`):

| name | n | k | role | notebook score |
|---|---|---|---|---|
| myarr1, myarr2 | 20 | 4 | early cluster-cheat constructions | (pre-normalization) |
| myarr3 | 35 | 4 | early cluster-cheat construction | (pre-normalization) |
| myarr4 | 15 | 4 | best honest attempt, normalized score | −0.48898 |
| points | 9 | 3 | exact solution of the 3-equidistant relaxation | −1.96e−14 |

The notebook's own headline conclusions: "AlphaEvolve didn't find a solution
for any n we tried" (4-equidistant case), and the 3-equidistant relaxation is
solved to machine precision by a 9-gon. The 9-gon reproduces the known Danzer
construction for the 3 case.

## 2. Methods

Scripts (reproduction commands in §7):

- `scratch/alphaevolve-p97-analysis-20260822/analyze_alphaevolve.py` —
  per-configuration structural report: convexity, diameter, min side,
  per-vertex best-window members/offsets/radii, normalized per-vertex defect,
  reciprocity and per-vertex load of the incidence relation, rotation-symmetry
  detection, distance-multiset clustering, distance-profile mode counts,
  finite-difference Jacobian rank of the fixed-combinatorics equidistance
  system, and an unconstrained least-squares polish probe.
- `scratch/alphaevolve-p97-analysis-20260822/followup_alphaevolve.py` —
  degeneracy check of the polish limit, convexity-constrained polish floor,
  reflection-symmetry check, C3 symmetrization test, and an exhaustive
  pairing-type solve of a D5 all-axes ansatz on n = 15.

Fixed-combinatorics equidistance system: for a window assignment
`v ↦ {a₀(v), a₁(v), a₂(v), a₃(v)}`, the residuals are
`|x_v − x_{aᵢ(v)}| − |x_v − x_{a₀(v)}|` for i = 1..k−1, all v. For k = 4 and
n = 15 that is 45 equations in 30 coordinates; translations (2) and rotation
(1) are always in the Jacobian kernel, and scaling (1) joins the kernel
exactly at solutions.

## 3. Raw structural facts (EMPIRICAL)

### 3.1 The best 15-gon (myarr4, k = 4)

- Convex; diameter 2.19626; min side 0.41972; normalizer q = s²/D = 0.08021.
- **C3-symmetric to within 3.6e−4 relative deviation** (|R x_v − x_{v+5}|
  after centering, R = rotation by 120°). Exact C3 symmetrization stays
  convex and scores 0.48914 versus 0.48898 unsymmetrized: symmetry breaking
  contributes essentially nothing.
- **Per-vertex normalized defect is equalized**: range 0.4843–0.4901 over all
  15 vertices, standard deviation 0.0017. No vertex is a local witness.
- Orbit structure (period 5 under the C3 index shift v ↦ v+5), with r(v) the
  best-window mean radius:

  | orbit reps | window offsets from v | r(v)/diam | load |
  |---|---|---|---|
  | 0, 5, 10 | {4, 5, 6, 10} | 0.818 | 4 |
  | 1, 6, 11 | {3, 4, 5, 10} | 0.643 | 3 |
  | 2, 7, 12 | {5, 10, 11, 12} | 0.643 | 3 |
  | 3, 8, 13 | {5, 9, 10, 11} | 0.818 | 4 |
  | 4, 9, 14 | {5, 6, 9, 10} | 0.991 | 6 |

- **Every window contains both offsets 5 and 10** — the vertex's own C3
  orbit-mates. See F2.
- Load (number of windows containing a given vertex): mean 4.00 by counting;
  maximum 6, attained exactly on the near-diameter orbit (r/diam = 0.991); the
  diameter pair is (9, 14), inside that orbit. Directed incidences 60, of
  which 30 reciprocated.
- Distance multiset: 105 pairs collapse to 19 clusters at relative tolerance
  1e−3, top multiplicities 12, 12, 6, 6, 6, 6, 6, 6.
- Jacobian of the fixed-combinatorics system at myarr4: **rank 27 of a
  possible 27** (30 coordinates minus 3 kernel directions at a non-solution),
  singular values fall off to 5.4e−3 then machine zeros. Naive deficiency
  45 − 27 = 18. No flat direction: the combinatorial type is locally rigid at
  this point.

### 3.2 The exact 9-gon (k = 3)

- Convex; **pure C3 — no reflection through any vertex axis** (Danzer's
  configuration is chiral).
- Windows per orbit: offsets {3, 5, 6}, {2, 3, 6}, {3, 5, 6}; every window
  contains the own-orbit pair {3, 6}.
- Class radii per orbit: 1.99866, 1.37347, 1.82396. The largest class radius
  **equals the diameter** (1.998657) at machine precision.
- Load is exactly 3 at every vertex (3-regular incidence); 18 of 27 directed
  incidences reciprocated.
- Distance multiset: 36 pairs collapse to 9 values, multiplicities
  6, 6, 6, 3, 3, 3, 3, 3, 3.
- Jacobian at the solution: rank 13 of 18; nullity 5 = 4 similarity
  directions + **1 genuine flat direction**. The Danzer 9-gon sits on a
  1-parameter family modulo similarity. {{UNVALIDATED}} whether the family is
  known in the literature.

### 3.3 The cheat constructions (myarr1–3)

All three exploit clustering: min side 0.050 pinned at the old constraint
floor, near-diameter radii for almost all windows, normalized defects 2.4–17.
They document the failure mode the s²/D normalization was introduced to
close, nothing more.

## 4. Findings

### F1. Minimax saturation and a sharp scale-free floor near 0.489 (n = 15)

Three independent measurements agree:

1. AlphaEvolve's best: normalized score 0.48898.
2. Our convexity-constrained polish (Nelder–Mead on a soft-max of per-vertex
   defects with an orientation-margin hinge, 12 restarts from perturbed
   starts): best 0.48997, all restarts ≥ 0.4899.
3. Exact C3 symmetrization of AlphaEvolve's polygon: 0.48914, convex.

Together with the vertex-defect equalization (§3.1), the n = 15 optimum
behaves like a saturated minimax point on the C3-symmetric stratum with a
sharp constant ≈ 0.489. CONJECTURE (quantitative stability form of P97, at
n = 15): every convex 15-gon has a vertex whose best 4-window range is at
least c·s²/D with c ≈ 0.49. {{NEEDS_PROOF}} {{NEEDS_RESEARCH}} — behavior of
the floor as n varies was not measured (the notebook exposes only n = 15).

Consequence for proof shape: equalization means no local feature (diameter
endpoint, min-side endpoint, worst angle) identifies a witness vertex at the
extremal configuration. A proof of the quantitative form must argue globally
(averaging or capacity), which is the shape of the spine's
SelectedClass/pinnedMultiplicity arguments.

### F2. Free-pair counting law (HEURISTIC, numerically confirmed twice)

Under a cyclic symmetry C_m acting on indices by v ↦ v + n/m, every vertex is
automatically equidistant from its orbit-mate pair {v + jn/m, v − jn/m}:
|x − R^j x| = |x − R^(−j) x| for any rotation R. But the radii of these free
pairs are pinned relative to each other: |x − R^j x| = 2·|x|·sin(jπ/m), so
two own pairs of the same vertex can never be equalized by adjusting the
configuration.

Consequences of naive counting, per C_m orbit of vertices (n = m·p, p orbits,
2p generator coordinates, minus 2 for rotation and scaling):

- k = 3: window = own pair + 1 extra point at the same radius → 1 equation
  per orbit → p equations vs 2p − 2 unknowns → **underdetermined by p − 2**;
  at p = 3 (Danzer, n = 9) a 1-parameter family. Matches the measured
  Jacobian nullity exactly (§3.2).
- k = 4: window = own pair + 2 extra points → 2 equations per orbit →
  **overdetermined by 2 for every p**. Matches the full-rank Jacobian at
  myarr4 (§3.1) and every window of myarr4 containing {5, 10}.

The k = 3 / k = 4 divide is a ±1 flip in a degrees-of-freedom count. This is
the cleanest structural account in the data of why the problem changes
character at 4.

### F3. Convex position is the separating obstruction; golden-ratio radius gap

A dihedral all-axes ansatz lowers the naive deficit to 1: D5 on n = 15, three
C5 orbits, every generator on a reflection axis, each vertex's 4-class formed
by two mirror pairs forced to a common radius (one equation per orbit; 3
equations, 3 generator radii, minus scaling). Exhaustive enumeration of all
3375 pairing types, 3 random starts each:

- 51 pairing types admit **exact solutions of the metric system with
  pairwise-distinct points** (residual² < 1e−18): configurations in which
  every vertex has 4 exactly-equidistant other vertices.
- **Every one of them is non-convex**, always with exactly 5 convexity
  violations — a full C5 orbit interior to the hull of the others.
- A refined scan with an orbit-radius nondegeneracy filter (all |t| > 1e−3)
  retained 36 solutions and measured the orbit radii (|t₁| ≤ |t₂| ≤ |t₃|):
  across all 36, **max(|t₁|/|t₃|) = 0.381966** — numerically
  1/φ² = (3 − √5)/2 = (sin 36°/sin 72°)², φ the golden ratio. All 15 points
  in convex position would require every orbit radius ratio to exceed
  cos 36° = 0.80902. Observed gap: 0.382 vs 0.809, wide and clean.

CONJECTURE (candidate global lemma, D5 all-axes family): equalizing two
mirror-pair class radii at every vertex forces one orbit radius down by a
factor ≥ φ² relative to the largest, which forces that orbit inside the hull;
hence no member of the family is convex. {{NEEDS_PROOF}} — the constant's
algebraic form (sin 36°/sin 72°)² suggests a short trigonometric proof, and
the statement looks certifiable by interval arithmetic if wanted.

Together with F4 this is a three-way pattern: cluster-cheats degenerate,
the C3 type collapses, the D5 exact solutions all leave convex position. In
every mode the metric incidence system is the soft part and **convex position
is what breaks** — matching the spine's convex-position capacity approach.

### F4. Counterexample-upgrade verdict: NEGATIVE for these artifacts

- The myarr4 window system (C3 type) has **no nondegenerate exact solution
  reachable by least squares**: the residual is driven to 1e−16 only by total
  collapse (min pairwise distance = diameter = 0, displacement ≈ 1 for every
  vertex). Combined with the full-rank Jacobian (§3.1), the only exact
  solution found for this combinatorial type is the cone point. This is also
  the structural reading of the notebook's s²/D normalization: defect decays
  only quadratically along the degeneration, so the exponent 2 is exactly
  what makes the score degeneration-proof.
- The D5 route produces exact incidence systems but always non-convex, with
  the F3 margin.
- Pure cyclic ansätze are closed off by F2 (deficit 2 at every p).

The open crack the data leaves: a **non-symmetric combinatorial type whose
Jacobian is rank-deficient** at a convex configuration. None was observed.
Untested neighbors of the D5 experiment: D3 all-axes on n = 15 (five orbits,
naive deficit 1), mixed on/off-axis orbit structures, and other n.
{{NEEDS_RESEARCH}}

### F5. Small recurring patterns

- Extremal class radii push to the diameter: the 9-gon's largest class radius
  equals its diameter to machine precision; myarr4's near-diameter orbit sits
  at 0.991·diam.
- Load concentrates on the diametral orbit (6 vs 3 in myarr4); in the exact
  9-gon the load is perfectly regular (3 everywhere).
- Near-optimal configurations compress the distance multiset hard (105 → 19
  values; 36 → 9 values), far below generic, while staying well above the
  Altman-type distinct-distance floor — so distinct-distance counting alone
  does not bite here.

## 5. Relevance to the current spine

- The load/pinning picture (F5) is the numeric shadow of the
  SelectedClass/pinnedMultiplicity capacity arguments: diametral vertices are
  the ones serving the most classes, and class radii ride the diameter. This
  is consistent with the crossed-arm and diameter-adjacent frontier
  structures already in the repo.
- F1 says the extremal configuration equalizes: proof strategies that hunt a
  locally-identifiable witness vertex are fighting the data; averaging or
  global capacity arguments are aligned with it.
- F3 offers a small, self-contained candidate lemma (golden-ratio radius
  collapse in the D5 family) that is plausibly provable by elementary
  trigonometry and would be a first fully-worked instance of "class
  equalization forces radial collapse below the convex-position threshold".
  It closes no spine obligation by itself; its value is as a model theorem
  for the capacity leitmotif. {{NEEDS_ADAM_INPUT}} on whether it is worth
  formalizing versus keeping as prose evidence.

## 6. Caveats

- All Jacobian ranks are finite-difference computations at specific points
  with SVD threshold 1e−8 relative; ranks near thresholds could shift under
  exact arithmetic.
- The degrees-of-freedom deficits are naive counts; the D5 experiment itself
  shows naive-overdetermined systems can possess exact solutions on
  non-generic strata, so deficits argue plausibility, never impossibility.
- The 51 vs 36 D5 solution counts come from two passes with different
  nondegeneracy filters (pairwise point distance > 1e−3 vs orbit radius
  > 1e−3) and per-type first-hit recording; neither pass enumerates all
  solutions of a type.
- The exhaustive claim in F3 is exhaustive over pairing types, with 3 random
  starts per type; a type could in principle have additional solution
  branches missed by all 3 starts.
- The floor in F1 is measured at n = 15 only.

## 7. Addendum 2026-08-23 — reuse audit and F3 supersession

An external (GPT) review of this document proposed a four-item "formalize
now" shortlist: an equidistance-witness API with the perpendicular-bisector
characterization, a pair-codegree ≤ 2 bound for carrier centers, an
opposite-sides theorem for two witnesses of one chord, and an exact-row
shared-pair cyclic-separation adapter. A reuse preflight against the indexed
Lean corpus shows **all four already exist in repo-native form**:

| shortlist item | existing declaration(s) |
|---|---|
| bisector characterization | `Problem97.inner_witness_midpoint_eq_zero` (Dumitrescu.Lc1Strict); `exists_bisector_direction` (ATail.CocircularPerpendicularBisector) |
| centers per pair ≤ 2 | `perpBisector_carrier_card_le_two`, `false_of_three_distinct_equidistant_carriers` (ATail.ConvexPerpendicularBisectorSides) |
| opposite sides of the chord | `false_of_two_centers_equidistant_pair_{after,enclosed,split,before}` + `dist_eq_dist_of_mutual_bisector` (ATail.TwoCenterBisectorParity), stated in the project's CCW cyclic-position form over `ConvexIndep` |
| shared-pair cyclic adapter | `BoundaryIndexing.sharedPair_satisfied` (Census554.GeneralCarrierBridge) |

No new formalization is required by this document. Adding a parallel
`EqDistWitness` wrapper API is NOT recommended: the repo already carries
duplicate-interface debt, and a bridge with zero consumers is bookkeeping,
not progress.

**F3 supersession.** The same review supplied a strictly stronger and
simpler argument that retires F3's candidate lemma: in the all-axes D_m
ansatz the oriented reflection-axis rays fall into exactly two rotational
phase classes, so three C_m orbits force two orbits onto the same ray set
(pigeonhole); the smaller-radius orbit is then a radial contraction of the
larger, and since the orbit's center lies in its convex hull, every
contracted point lies in the convex hull of the larger orbit. Hence **no
union of three distinct all-axes C_m orbits is convexly independent at
all** — the non-convexity of every exact solution in §F3 was decided by the
ansatz alone, before the equalization equations were imposed. The
golden-ratio ratio bound remains a true measured property of the
equalization system, but it is not the cause of the convexity failure, and
the "radial collapse below the extremality threshold" lemma candidate is
withdrawn in favor of the pigeonhole statement. The argument is elementary;
a Lean utility form (`t • x ∈ convexHull` contradiction against
`ConvexIndep`) would be a two-line corollary of the definition and has no
current consumer, so it is left unformalized. F2 (the free-pair counting
law) is unaffected and remains the substantive residue of the D5
experiment.

## 8. Reproduction

```bash
cd scratch/alphaevolve-p97-analysis-20260822
uv run --no-project --with numpy --with scipy python analyze_alphaevolve.py
uv run --no-project --with numpy --with scipy python followup_alphaevolve.py
```

`alphaevolve_configs.txt` holds the five coordinate arrays extracted verbatim
from the notebook (the 3.2 MB notebook itself is not committed; use the URL
in §1). The nthdegree memory records for this analysis are the 2026-08-22
entries "AlphaEvolve artifact for Erdős 97 examined" and "AlphaEvolve P97
data mining".
