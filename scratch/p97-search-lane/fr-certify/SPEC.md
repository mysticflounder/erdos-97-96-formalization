# FR 20-gon exact certification — implementation spec (2026-07-28, v1.0)

Realization-arm validation target
(`docs/p97-counterexample-search-design-2026-07-28.md` §4, §7): produce
a RIGOROUS existence certificate for the Fishburn–Reeds 1992 convex
20-gon (`scratch/p97-search-lane/fishburn-reeds-notes.md`) — published
numerical ground truth whose exact certification the paper leaves open
(IVT argument only). Deliverable: a machine-checked proof that an exact
real configuration exists in an explicit rational box, strictly convex,
with every vertex at distance exactly 1 from ≥ 3 others.

**Soundness discipline (binding).** Implement exactly this spec; STOP
on any soundness-relevant ambiguity, implement the rest, report it.
The checker (§3) is the trusted core: it must be small, dependency-free
(Python stdlib only), and must not import or trust the producer.

## 1. Formulation (square polynomial system — no square roots)

Unknowns: B-side coordinates x₁..x₁₀, y₁..y₁₀ (A-side is the mirror
(−xᵢ, yᵢ); mirror symmetry is BUILT IN, not certified).

Equations (from the notes' 15-pair edge list; hardcode with a citation
comment): for each unordered pair {i, j},

    E_{ij}:  (xᵢ + xⱼ)² + (yⱼ − yᵢ)² − 1 = 0

(distance between i_A = (−xᵢ, yᵢ) and j_B = (xⱼ, yⱼ); the mirror edge
(j_A, i_B) holds by symmetry).

Chart (fixes the 5-dimensional solution freedom = 1 translation + the
paper's 4 DOF; this is exactly the paper's parameterization, with
γᵢ := y_{i+1} − yᵢ): substitute, as EXACT rationals from Table 1 of
the notes (value/1000 with all printed digits):

- y₁ = 0 (translation: shift all Table-1 y's by −y₁ for the seed), and
- γ₃, γ₄, γ₅, γ₆ fixed to the Table-1 differences, eliminating
  y₄ = y₃ + γ₃, y₅ = y₄ + γ₄, y₆ = y₅ + γ₅, y₇ = y₆ + γ₆ — four
  eliminated variables, all linear in y₃.

Free unknowns: (x₁..x₁₀, y₂, y₃, y₈, y₉, y₁₀) — 15 unknowns for 15
equations, a square system. (Count check: 20 coordinates − 1
translation − 4 gap fixes = 15; do NOT fix a fifth gap — that would
overdetermine the system.) If the Krawczyk operator fails to contract
in this chart (§3), STOP and report — the orchestrator picks an
alternate chart; do not improvise chart changes.

All 15 equations are quadratic polynomials with rational coefficients
after substitution. The system, chart, and fixed rationals are
constructed in `system.py` and re-derived INDEPENDENTLY by the checker
from the notes data (§3).

## 2. Producer (untrusted, `producer.py`)

mpmath (50+ digits) multivariate Newton from the Table-1 seed to
residual < 10⁻⁴⁰. Output: midpoint vector m (rationals, e.g. dyadics
truncated from the polished root) and box radius r (suggest 10⁻³⁰;
producer may tune). Anything the producer emits is a HINT; nothing it
computes is trusted.

## 3. Checker (trusted core)

### 3.1 `dyadic.py` — interval arithmetic

Dyadic outward-rounded interval arithmetic, stdlib only: endpoints are
Fraction (or int mantissa/exponent pairs); after every operation round
the lower endpoint down and the upper endpoint up to multiples of
2^(−P) (default P = 128) via integer floor/ceil scaling. Operations:
+, −, ×, negation, scalar ×; no division or sqrt needed (system is
polynomial; Y in §3.2 is a rational matrix given by hint). Every
rounding is outward; unit-test associativity-independence containment
properties (G-DYADIC: random rational triples, interval results contain
exact rational results).

### 3.2 `krawczyk.py` — existence certificate

Krawczyk operator on the 15-dim box X = m ± r:

    K(X) = m − Y·F(m) + (I − Y·J(X))·(X − m)

with F the exact system (§1), J(X) the interval Jacobian (quadratic
system ⇒ J entries are degree-1 interval evaluations), Y a rational
approximate inverse of the midpoint Jacobian (HINT from producer;
checker only verifies the contraction, never inverts). Certificate
condition (verified entirely in dyadic interval arithmetic):

    K(X) ⊂ interior(X)

This proves existence AND uniqueness of a root of F in X (standard
Krawczyk theorem; cite Neumaier, *Interval Methods for Systems of
Equations*, Thm 5.1.8 in a comment). If contraction fails at P = 128,
retry at P = 256, then STOP and report margins.

### 3.3 Side conditions (over the certified box X)

All decided by strict interval sign checks; each must hold for the
ENTIRE box (then in particular at the root):

- (C1) Local convexity of the 20-gon in the fixed cyclic order
  B₁..B₁₀, A₁₀..A₁ (A-side intervals = mirror; y₁ = 0, eliminated y's
  reconstructed from the exact gaps): all 20 consecutive-triple cross
  products strictly one sign (producer hints the orientation; checker
  verifies all 20 uniformly).
- (C1b) Hull-order certificate (added 2026-07-28, orchestrator
  validation audit): for each directed edge of the 20-cycle, every
  other vertex lies strictly on the orientation side (20 × 18 = 360
  strict interval checks — the halfplane characterization of a convex
  polygon). C1 alone certifies only LOCAL convexity: a star traversal
  (pentagram order) also has all-same-sign turns, so C1 does not by
  itself prove convex position or pin the hull order; C1b does both
  and subsumes C1's conclusion. Control: star-ordered pentagon passes
  the C1 logic and fails the C1b logic (probe verified).
- (C2) Pairwise distinctness of all 20 vertices (190 interval checks;
  implied by C1b but cheap — belt and suspenders).
- (C3) xᵢ > 0 for all i (the cut is genuine: A and B sides on opposite
  sides of the y-axis, hull disjointness NOT claimed — only what FR
  Theorem 1 needs for our K3 reading: 20 distinct strictly-convex
  points, each with ≥ 3 unit partners).
- (C4) Degree count: each index has exactly 3 incident pairs in the
  edge list (pure combinatorics, recheck in the checker).

The K3-witness property needs NO interval check: the certified root
satisfies the 15 equations EXACTLY, so each vertex has AT LEAST its 3
edge-list partners at distance exactly 1 by construction (record this
argument in the certificate; accidental extra unit distances are not
excluded and are harmless for the ≥3 witness property).

### 3.4 Independence rule

The checker re-derives the system coefficients from the Table-1
rationals and the edge list (its own copy, cited to the notes file) and
takes from the producer ONLY: m, r, Y, orientation sign. No mpmath, no
floats anywhere in the checker (Fraction/int arithmetic only).

## 4. Controls (`smoke.py`, run before the real target)

- (G-POS) Known-root positive control: the two-circle system
  x² + y² = 1, (x−1)² + y² = 1 with exact root (1/2, √3/2): certify a
  box around a dyadic approximation; verify the certified box contains
  the known algebraic root (check by exact rational sign evaluation of
  both polynomials at box corners bracketing).
- (G-NEG) Negative control: same system with constant term shifted so
  no root lies near the seed; Krawczyk must FAIL to certify.
- (G-SING) Singular control: a system with singular Jacobian at the
  root (e.g. x² = 0 paired with y − x = 0); Krawczyk must FAIL (no
  false certificate at singular roots).
- (G-DYADIC) §3.1 containment tests.

## 5. Deliverables

`scratch/p97-search-lane/fr-certify/`: `system.py`, `producer.py`,
`dyadic.py`, `krawczyk.py`, `certify.py` (driver: producer → checker →
C1–C4 → write `certificate.json` with box, Y, precision, margins, and
the by-construction K3 argument text), `smoke.py`, `RESULTS.md` (gate
table: G-DYADIC, G-POS, G-NEG, G-SING, then FR-CERT PASS/FAIL with
contraction and inequality margins; any STOP ambiguities). Runnable:
`uv run python scratch/p97-search-lane/fr-certify/smoke.py` then
`... certify.py`, both exit nonzero on failure. Report raw gate
outcomes only; no narrative claims.
