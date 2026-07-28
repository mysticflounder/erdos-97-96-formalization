# k=3 positive control for the P97 counterexample-search lane — research findings

Date: 2026-07-28. Read-only research task. Goal: locate a concrete, verifiable
construction of a finite planar point set in convex position where **every**
point has at least 3 other points of the set equidistant from it (the k=3
analogue of Erdős Problem 97; k=4 is the open problem).

Bottom line up front: a concrete coordinate construction was found and
**independently verified by exact (symbolic, non-floating-point) arithmetic
to satisfy both required properties** — but only after correcting a single
apparent transcription bug in the coordinate literally recorded in the
upstream source. The as-written upstream coordinates do **not** satisfy the
claim. See §3 for the verified point set and §2/§4 for full provenance and
the discrepancy.

---

## 1. Local archive search (`~/projects/math-projects/erdos/97`,
`~/erdos-general-theorem/97`)

Both archives are near-duplicates. `src/known_constructions.py` in each
contains a `danzer_9gon()` function. Its own docstring is explicit that it is
**not** a sourced reproduction:

> "Danzer's 9-gon (Erdős 1987): ... The original coordinates were not
> published; Erdős only stated existence. This module provides one specific
> realisation from the (≥13-dimensional) moduli space."
> — `~/projects/math-projects/erdos/97/src/known_constructions.py:1-11`

Two versions were tried historically in that archive, both dead ends:

- **v1** ("9 consecutive vertices of a regular 11-gon"): flagged in
  `results/analysis.md:53` as wrong — "only gives k=2 equidistance," not
  Danzer's actual construction. Confirmed by the archived plot
  `results/danzer_9gon.png`, whose own title/caption reads "Danzer 9-gon
  (k=3)" but whose printed per-vertex equidistant-group sizes are
  `[2, 2, 2, 2, 2, 2, 2, 2, 2]` — i.e. it visibly fails to reach k=3 anywhere.
- **v2** (current `known_constructions.py`, hand-placed coordinates: apex at
  origin, three points at 30°/90°/150° on the unit circle, five "filler"
  points): only claims k=3 at a single **apex** vertex, not at every vertex —
  it does not attempt the "every point" property this task requires, and is
  explicitly self-described as invented, not sourced.

Session working-state memory (`nthdegree`, ULID `01KPBAHTHNA90WJST8NW9264J3`,
2026-04-16) independently confirms: *"danzer_9gon() is NOT Danzer's real k=3
construction (just 9-of-11-gon, gives k=2 only)"* and lists "Reproduce
Danzer's actual k=3 construction (needs study of Er87b paper)" as unfinished
future work.

**Verdict for this source: NOT FOUND.** No genuine sourced construction, and
what exists explicitly does not satisfy "every point."

## 2. This repo (`erdos-97-96-formalization`)

`nthdegree recall` and `nthdegree docs search --current-project` turned up
extensive, well-sourced **bibliographic** material (attribution/citation
chasing done in this project on 2026-07-26/27) but no coordinates of its own:

- P. Erdős, *On sets of distances of n points*, Amer. Math. Monthly 53
  (1946), 248–250, §2, p.248 — poses the original k=3 conjecture (verbatim,
  from a page-image-verified quote in project memory): *"In every convex
  polygon there is at least one vertex with the property that no three
  vertices of the polygon are equally distant from it."*
- P. Erdős, *Some combinatorial and metric problems in geometry*, Colloq.
  Math. Soc. János Bolyai 48, Intuitive Geometry (Siófok, 1985), 1987,
  167–177 [Er87b] — p.175 states Danzer's disproof (a convex 9-point set) and
  draws "Danzer's nonagon" on the same page; p.176 poses the still-open k=4
  question. (Project memory also independently flags and corrects a citation
  error in this project's own `lean/Erdos9796Proof/P97/PinnedMultiplicity.lean:20`,
  which had cited p.175 for the k=4 statement — it should be p.176.)
- Brass–Moser–Pach, *Research Problems in Discrete Geometry* (2005), §5.6
  "Repeated Distances in Point Sets in Convex Position," p.218 — states both
  the pinned-form conjecture and "no four other vertices at the same
  distance" as Conjecture 3 in the same paragraph, citing Danzer's k=3 result
  as already refuting the k=2-indexed (their indexing) case.
- Erdős–Purdy, *Some extremal problems in geometry IV*, Congressus
  Numerantium XVII (1976), 307–322, p.307 — records that Erdős's earlier
  (1970, 1975) claim that Danzer had settled the conjecture "for every k" was
  a **retracted overstatement**: *"Danzer now says he only has the result for
  k=3, hence the problem is still open for k≥4."*

None of this project's own `docs/`, `certificates/`, or `scratch/` prose
contains explicit coordinates for a k=3 construction — every hit is
citation/attribution work, not a constructive artifact. A grep for `Danzer`
across `docs/`, `certificates/`, `scratch/` turned up no coordinate file
either. The only concrete artifact found anywhere under this repo's tree is a
**vendored third-party Lean file** (§3), reached via a `.lake/packages/`
checkout, not project-authored content.

**Verdict for this source: NOT FOUND** (bibliography only) as project-native
content; a third-party vendored artifact was found incidentally (§3).

## 3. The construction found: `google-deepmind/formal-conjectures`,
`FormalConjectures/ErdosProblems/97.lean`

### 3.1 Where

Vendored (via `lake`) at, e.g.,
`/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/atail-force/card12-frontier-common-deletion-alignment/.lake/packages/formal_conjectures/FormalConjectures/ErdosProblems/97.lean`
(also present under a second `scratch/atail-force/blocker-cycle-kalmanson-bridge/...`
copy). Upstream: https://github.com/google-deepmind/formal-conjectures ,
file `FormalConjectures/ErdosProblems/97.lean` at `main`
(fetched fresh via `gh api` on 2026-07-28; only diff from the vendored copy
is a trivial import-path rename, so the content below is current-main, not
stale). Original authorship: PR
[google-deepmind/formal-conjectures#1144](https://github.com/google-deepmind/formal-conjectures/pull/1144)
("feat: Formalize Erdős Problem 97").

### 3.2 The claim, as stated in the file (lines 80–102)

```
Erdős originally conjectured this (in [Er46b]) with no 3 vertices equidistant,
but Danzer found a convex polygon on 9 points such that every vertex has three
vertices equidistant from it (but this distance depends on the vertex).
Danzer's construction is explained in [Er87b].

[Er46b] Erdős, P., On sets of distances of n points. Amer. Math. Monthly (1946), 248-250.
[Er87b] Erdős, P., Some combinatorial and metric problems in geometry. Intuitive geometry (Siófok, 1985), 167-177.
```
```lean
@[category research solved, AMS 52]
theorem erdos_97.variants.three_equidistant :
    ∃ A : Finset ℝ², A.Nonempty ∧ ConvexIndep A ∧ HasNEquidistantProperty 3 A := by
  let A₁ : ℝ² := !₂[(-√3), -1]
  let A₂ : ℝ² := !₂[(√3), -1]
  let A₃ : ℝ² := !₂[0, 2]
  let B₁ : ℝ² := !₂[(-8991 / 10927 * √3), -26503 / 10927]
  let B₂ : ℝ² := !₂[(-17747 / 10947 * √3), -235 / 10927]
  let B₃ : ℝ² := !₂[(-8756 / 10927 * √3), 26738 / 10927]
  let C₁ : ℝ² := !₂[(-10753 / 18529 * √3), -44665 / 18529]
  let C₂ : ℝ² := !₂[(27709 / 18529 * √3), 6203 / 18529]
  let C₃ : ℝ² := !₂[(-16956 / 18529 * √3), 38462 / 18529]
  use {A₁, A₂, A₃, B₁, B₂, B₃, C₁, C₂, C₃}
  sorry
```

`HasNEquidistantProperty n A` is defined in the same file (lines 44–49) as
"for every point in `A`, there exist at least `n` other points in `A`
equidistant from it" — this is exactly the property requested by the task
(≥3, for every point). `ConvexIndep` is the file's convex-position predicate.

**The theorem body is `sorry`.** The file supplies a concrete candidate point
set and asserts the property holds, but proves nothing — no completed Lean
proof, no cited numeric check. The `@[category research solved]` tag reflects
the formal-conjectures project's judgment that the *underlying math fact* is
settled in the literature (Danzer's result), not that this Lean file has
verified this specific coordinate instantiation.

### 3.3 Independent verification of the literal, as-written coordinates: FAILS

I computed all pairwise squared distances among the 9 literal points above
using exact symbolic arithmetic (`sympy`, `Rational` + symbolic `sqrt(3)`, no
floating-point rounding) — this checks the file's own numbers, not an
invented alternative. Result:

| Point | Best equidistant-group size found | Meets "≥3"? |
|---|---|---|
| A₁ | 3 | yes |
| A₂ | 3 | yes |
| A₃ | 2 | **no** |
| B₁ | 2 | **no** |
| B₂ | 1 | **no** |
| B₃ | 2 | **no** |
| C₁ | 3 | yes |
| C₂ | 3 | yes |
| C₃ | 3 | yes |

A convex-hull check (Andrew's monotone chain, floating point) on the same 9
literal points also finds only **7 of 9** points on the hull — A₁ and C₃ fall
inside/on the hull of the rest, i.e. `ConvexIndep` also appears to fail for
the literal coordinates.

**So the theorem statement, exactly as written in the current upstream
`main` branch, is not witnessed by the point set it provides.** This is
consistent with the body being `sorry` — nobody has actually checked it.

### 3.4 A single-coordinate discrepancy, and a corrected point set that DOES verify

Comparing `B₂`'s two coordinates against the pattern shared by every other
point (`B₁`, `B₃`, `C₁`, `C₂`, `C₃` all use the *same* denominator, 10927 or
18529, for both their x- and y-coordinate fractions), `B₂` is the sole
outlier: its x-coordinate denominator is written as **10947** (not 10927, a
20-off typo) and, separately, its sign is negative
(`-17747/10947 * √3`) where the geometric role expected by the construction's
apparent symmetry (pairing with `A₂`, the only other "positive-x, near-equator"
vertex, the way `B₁`/`C₁` pair with `A₁` and `B₃`/`C₃` pair with `A₃`) would
be positive.

I found — but did **not** derive myself — a coordinate set that makes exactly
this correction, in an **unmerged, closed, rejected** GitHub pull request:
[google-deepmind/formal-conjectures#2425](https://github.com/google-deepmind/formal-conjectures/pull/2425)
("solve(ErdosProblems): danzer in 97," closed 2026-03-03, `mergedAt: null`).
That PR does not touch the coordinates in the main file at all — it only
edits the `@[category ...]` attribute to point at an external fork,
`github.com/theaustinhatfield/formal-conjectures`, branch
`solve-erdos-97-danzer`, file `FormalConjectures/ErdosProblems/97.lean`. On
that fork, the same 9 points are re-labeled `P0`..`P8` and `P4` (playing the
role of `B₂`) is given as:

```lean
noncomputable def P4x : ℝ := 17747 / 10927
noncomputable def P4y : ℝ := -235 / 10927
noncomputable def P4 : ℝ² := !₂[P4x * s3, P4y]
```
i.e. `(17747/10927 · √3, -235/10927)` — positive sign, denominator 10927. All
other 8 points (`P0,P1,P2,P3,P5,P6,P7,P8`) are byte-identical to `A₁,B₁,C₁,A₂,C₂,A₃,B₃,C₃`.

**I independently re-verified this corrected 9-point set myself**, exact
symbolic arithmetic again, not trusting the fork's ~1200-line Lean proof
(which I did not compile or audit):

```
P0(=A1)=(-1.732051,-1.000000)   P1(=B1)=(-1.425173,-2.425460)
P2(=C1)=(-1.005167,-2.410546)   P3(=A2)=( 1.732051,-1.000000)
P4(=B2, corrected)=( 2.813097,-0.021506)
P5(=C2)=( 2.590177, 0.334773)   P6(=A3)=( 0.000000, 2.000000)
P7(=B3)=(-1.387923, 2.446966)   P8(=C3)=(-1.585010, 2.075773)
```

Result of exact-arithmetic check (every point, best/only equidistant-group
size across the whole set):

| Point | Equidistant-group size | Squared distance realized |
|---|---|---|
| P0(A1) | **3** (P3,P6,P7) | 12 |
| P1(B1) | **3** (P4,P5,P7) | 259428/10927 |
| P2(C1) | **3** (P5,P6,P8) | 379164/18529 |
| P3(A2) | **3** (P0,P1,P6) | 12 |
| P4(B2) | **3** (P1,P7,P8) | 259428/10927 |
| P5(C2) | **3** (P0,P2,P8) | 379164/18529 |
| P6(A3) | **3** (P0,P3,P4) | 12 |
| P7(B3) | **3** (P1,P2,P4) | 259428/10927 |
| P8(C3) | **3** (P2,P3,P5) | 379164/18529 |

Every one of the 9 points achieves an equidistant-group of size **exactly**
3 (never 4+, checked as the maximum over all groupings), realized via one of
three distinct squared-distance values: 12 (= (2√3)², ≈3.464 side), 259428/10927
(≈4.873), 379164/18529 (≈4.524) — i.e. the equidistant distance genuinely
*varies by vertex*, matching the docstring's "but this distance depends on
the vertex." Convex-hull check (Andrew's monotone chain, floating point):
**all 9 of 9 points lie on the hull** — full convex position, no interior or
collinear points.

This is a from-scratch, independent verification performed for this task
(sympy `Rational`/`sqrt(3)` exact arithmetic; script:
`/private/tmp/claude-1000/.../scratchpad/verify_fork_p0p8.py`, transient), not
a re-trust of anyone's Lean proof or of the fork's own claims.

### 3.5 Caveats on trustworthiness of the correction's provenance

- The GitHub PR that contains this corrected value
  ([#2425](https://github.com/google-deepmind/formal-conjectures/pull/2425))
  was **closed without merging**. Its own description claims the coordinates
  were "extracted" by an LLM ("Gemini 3.1 pro") and that the accompanying
  ~1200-line Lean proof "verified locally," but that proof was never merged
  or independently checked by the upstream project, and I did not compile it.
- A companion PR on the same theorem,
  [#2979](https://github.com/google-deepmind/formal-conjectures/pull/2979)
  ("solve(ErdosProblems): formally solved ... in 97," also closed, also
  `mergedAt: null`), self-describes as *"Applies the `research formally
  solved` loophole pattern"* — i.e. an explicit acknowledgment (by its own
  submitter) of gaming the project's category-tag system rather than
  supplying a reviewed proof. Both PRs were rejected by the upstream
  maintainers.
- Net effect: I treat the *specific corrected coordinate values* as
  independently verified by my own exact computation (high confidence, not
  contingent on trusting the fork), but I treat the *fork's Lean proof itself*
  and its "resolved" framing as **unverified and of low provenance trust** —
  it should not be cited as "Danzer's construction, formally proved" without
  someone actually compiling and auditing that ~1200-line file.
- Neither the corrected coordinates nor the original ones are attributable to
  Danzer's own (historically unpublished) numbers — see §1: the literature
  consistently states Danzer never published coordinates, only existence.
  So this verified 9-point set should be described as *"a modern coordinate
  instantiation matching Danzer's claimed abstract construction,"* not as
  "Danzer's actual coordinates."

## 4. The Fishburn–Reeds 20-point construction (found, but citation-only — no coordinates)

The same upstream file (`erdos_97.variants.three_unit_distance`, lines
113–122, and `erdos_97.variants.three_unit_distance_cut_min`, lines 124–141)
cites a second, stronger published result:

> Fishburn and Reeds [FiRe92] have found a convex polygon on 20 points such
> that every vertex has three vertices equidistant from it (and this
> distance is the same for all vertices).
>
> [FiRe92] Fishburn, P. C. and Reeds, J. A., *Unit distances between vertices
> of a convex polygon*. Comput. Geom. (1992), 81–91.

and additionally: *"the smallest n for which there exists a convex n-gon and
a cut {A,B} of its vertices such that ... [3 unit distances each way] ... is
n = 20"* — i.e. n=20 is proved minimal for the *uniform-distance* version.
Both Lean theorems for this variant are also `sorry`, with **no coordinates
given anywhere in the file**.

I confirmed the citation independently via web search: P. C. Fishburn, J. A.
Reeds, "Unit distances between vertices of a convex polygon," *Computational
Geometry: Theory and Applications*, Vol. 2 (1992), pp. 81–91
(https://www.sciencedirect.com/science/article/pii/092577219290026O — full
text is paywalled; WebFetch returned HTTP 403). A related later paper,
arXiv:1009.2216 ("On Unit Distances in a Convex Polygon"), explicitly credits
"a question asked by Fishburn and Reeds" but its abstract gives no
construction detail, and I could not extract readable full text from its PDF
(binary/compressed stream not parseable by the fetch tool used).

**Verdict for the Fishburn–Reeds 20-point construction: citation trail
only, no concrete coordinates found.** This is a genuinely stronger and
independently published result (uniform distance, not just "distance depends
on vertex," and n=20 proved minimal for that stronger property) — worth
obtaining the original paper for if a same-distance k=3 control is ever
needed — but I am reporting it as NOT FOUND at the coordinate level per the
task's explicit instructions.

## 5. Summary table

| Candidate | Every point ≥3 equidistant? | Convex position? | Coordinates given? | Verified how | Status |
|---|---|---|---|---|---|
| Local archive `danzer_9gon()` v1 (9-of-11-gon) | No (max k=2, self-flagged) | Yes (regular-polygon subset) | Yes | Archive's own plot | Confirmed wrong, dead end |
| Local archive `danzer_9gon()` v2 (hand-placed) | Only claims apex, not every point | Unverified | Yes | Not verified by anyone | Off-target, self-admitted invention |
| `formal-conjectures` `three_equidistant`, literal coordinates | **No** (3 of 9 points fail) | **No** (2 of 9 points off-hull) | Yes | Verified by me, exact arithmetic | FAILS as written |
| Same, with B₂/P4 sign+denominator corrected (per closed PR #2425 / fork) | **Yes**, all 9 points, exactly 3 each | **Yes**, all 9 on hull | Yes | Verified by me, exact arithmetic | **Positive control candidate — verified** |
| Fishburn–Reeds 20-point uniform-distance construction | Claimed yes (published, n=20 minimal) | Claimed yes | **No** | Not verified (no coordinates found) | Citation only |

## 6. Recommendation

Section 3.4's corrected 9-point set is the strongest available candidate for
the k=3 positive control: it is a genuine planar point set, exactly
computable in ℚ(√3), that I independently confirmed by exact symbolic
arithmetic to be in strict convex position with every one of its 9 points
having an equidistant-group of size exactly 3. Before using it as a
soundness-critical control, whoever adopts it should re-run an independent
check from these coordinates (not from my script, not from either GitHub
PR) — e.g. a fresh from-scratch recomputation, or a Lean `decide`/`norm_num`
proof built directly against these numbers — since its only textual source is
a rejected, self-admittedly loophole-seeking PR, even though the numbers
themselves check out under my own from-scratch arithmetic.

Coordinates for direct reuse (exact, ℚ(√3)):

```
P0 = (-√3, -1)
P1 = (-8991/10927·√3, -26503/10927)
P2 = (-10753/18529·√3, -44665/18529)
P3 = (√3, -1)
P4 = (17747/10927·√3, -235/10927)      ← corrected from upstream's -17747/10947·√3
P5 = (27709/18529·√3, 6203/18529)
P6 = (0, 2)
P7 = (-8756/10927·√3, 26738/10927)
P8 = (-16956/18529·√3, 38462/18529)
```
