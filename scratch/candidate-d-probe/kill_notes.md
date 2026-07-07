# Q1 kill mechanisms — proofs

Window vocabulary and soundness contract per formulation.md §3. Gauge:
v2 = (0,0), v3 = (1,0), MEC center O = (1/2, ω), ω := oy, R² = 1/4 + ω².
Own cap C1 = A-points strictly beyond the chord v2v3 from v1; with the CCW
order decoration v1 lies above the axis and the own lens
L1 = {p : ‖p − O‖ ≤ R, p_y < 0} (chord-side strictness per formulation 2.2).
Non-obtuseness at v1 ⟺ ω ≥ 0 (central position of O weakly above the chord;
equivalently the inscribed angle at v1 subtending v2v3 is ≤ π/2).

## K-A. Lens-corner-max theorem (PROVEN)

**Theorem.** For x ∈ L1 (so x_y < 0): max_{p ∈ L1} ‖x − p‖ =
max(‖x − v2‖, ‖x − v3‖), and the maximum is attained ONLY at v2 or v3.

*Proof.* L1 is compact convex-bounded by the chord segment [v2, v3] and the
lower arc; extreme points of its closure are v2, v3 and the arc points, and
the distance function to x is convex, so the max is on the chord segment or
the arc. (i) On the segment [v2,v3], ‖x − p‖² is a strictly convex quadratic
in the parameter, so its max over the segment is at an endpoint, strictly
unless p is an endpoint. (ii) On the arc {O + R e(φ)}, ‖x − p‖ is strictly
unimodal in φ with its maximum at the antipode direction φ* of (x − O);
since x_y < 0 ≤ ω, (x − O) has negative y-component, so the antipode has
positive y-component, while the lens arc has y = ω + R sin φ < 0 <
antipode's y — the antipode is NOT on the lens arc, so on the (connected)
lens arc the max is at an endpoint, i.e. v2 or v3, strictly for interior
arc points. ∎

**Corollary (packet consequence).** If the packet at center x ∈ L1 contains
a strict own-interior member y (counted by s) then ρ = ‖x − y‖ <
max(‖x − v2‖, ‖x − v3‖), and if additionally ‖x − v2‖ = ρ (v2 in the packet)
then ‖x − v2‖ < ‖x − v3‖ strictly. Mirror for v3.

## K-B. Bisector-position identity (PROVEN)

Let v1 = (a, b) with b > 0 (above the axis, forced by the order decoration)
on the MEC: a² + b² = a + 2ωb (circle through v2 = origin). Non-obtuseness
at v2 reads ⟪v1 − v2, v3 − v2⟫ = a ≥ 0.

**Claim.** Every point x of the perpendicular bisector of {v1, v2} with
x_y < 0 has x₀ ≥ 1/2; symmetrically every point of the bisector of {v1, v3}
with x_y < 0 has x₀ ≤ 1/2; and the bisector of {v2, v3} is x₀ = 1/2.

*Proof.* Parametrize the (v1,v2)-bisector as p(t) = (a/2 + bt, b/2 − at).
Case a > 0: p_y < 0 ⟺ t > b/(2a); at t = b/(2a), p₀ = (a² + b²)/(2a) =
(a + 2ωb)/(2a) = 1/2 + ωb/a ≥ 1/2 (ω ≥ 0, b > 0, a > 0), and dp₀/dt = b > 0,
so p₀ > 1/2 strictly below the axis... (≥ 1/2 in all cases). Case a = 0
(right angle at v2): v1 = (0, 2ω) needs ω > 0, and the bisector is the
horizontal line y = ω ≥ 0, which never enters {y < 0} — empty case. Case
a < 0 is excluded by non-obtuseness at v2. ∎

## K-C. Kill of (2,1,0,1) and (2,2,0,0) (PROVEN)

Both classes have m = 2 and s ≥ 1: the packet contains two Moser vertices
M ⊆ {v1,v2,v3} and an own-interior member y, all at the common radius ρ
from x ∈ L1.

- M = {v2, v3}: ρ = ‖x−v2‖ = ‖x−v3‖ puts x on x₀ = 1/2, where
  max(‖x−v2‖,‖x−v3‖) = ρ is attained only at the corners (K-A), so no
  own-interior y with ‖x−y‖ = ρ exists. Contradiction with s ≥ 1.
- M = {v1, v2}: x lies on the (v1,v2)-bisector, so x₀ ≥ 1/2 (K-B), hence
  ‖x−v2‖ ≥ ‖x−v3‖, i.e. ρ = ‖x−v2‖ = max(‖x−v2‖,‖x−v3‖); by K-A no strict
  interior point of L1 attains it. Contradiction.
- M = {v1, v3}: mirror of the previous case (x₀ ≤ 1/2 forces
  ρ = ‖x−v3‖ = max).

All three vertex choices are impossible, so every case of the two classes
is unrealizable. This kill uses: cap membership (chord side), disk
membership, non-obtuseness, the equal-radius equalities, and the position
of v1 above the chord (order decoration) — but NOT the full convex-order
constraint set. Verdict: **KILLED (proof), classes (2,1,0,1), (2,2,0,0)**.
It transfers verbatim to any |A| ≥ 12 configuration since every constraint
used is implied by the leaf (formulation §3 table).

Scope note (m ≤ 2): a hypothetical m = 3 packet is separately impossible
(formulation 2.1), and this argument also shows any packet with TWO
own-cap-endpoint vertices (or one endpoint + apex) has s = 0 — a grounded
sublemma reusable beyond the 19-tuple surface: **"vertex-pair packets have
empty same-cap count"**.

## K-E. Min-corner identity (PROVEN; scope-limited)

With v1 = (a,b), b > 0, on the MEC (a² + b² = a + 2ωb) and non-obtuseness
at v2 (a ≥ 0) and at v3 (1 − a ≥ 0): for any x in the own lens (x₁ < 0),

  ‖x−v1‖² − ‖x−v2‖² = a(1 − 2x₀) + 2b(ω − x₁),
  ‖x−v1‖² − ‖x−v3‖² = (1−a)(2x₀ − 1) + 2b(ω − x₁),

and 2b(ω − x₁) > 0, so x₀ ≤ 1/2 ⟹ ‖x−v1‖ > ‖x−v2‖ and x₀ ≥ 1/2 ⟹
‖x−v1‖ > ‖x−v3‖. Hence **‖x−v1‖ > min(‖x−v2‖, ‖x−v3‖) strictly, always.**
(Used with K-A this bounds which vertex-choices can coexist with own-cap
members on a given side; it does NOT bound one-sided sups — see warning.)

**WARNING (do not re-derive).** The one-sided variant of K-A ("sup of
‖x−p‖ over the lens points strictly LEFT of x is ‖x−v2‖") is FALSE: the
vertical cut {p₀ = x₀} contributes points below x with distance up to the
local lens depth, which can exceed ‖x−v2‖ (e.g. x = (0.3, −0.05) in the
ω = 0 frame: cut-bottom distance ≈ 0.41 > ‖x−v2‖ ≈ 0.30). Only the
FULL-lens K-A (both corners) is a theorem. K-C above uses only the
full-lens version and is unaffected.

## K-D. Same-side own-pair sub-window (status: see sub2_results.json)

Sub-window SUB2 (encoder.build_sub2): x, w_a, w_b ∈ L1 with
‖x−w_a‖ = ‖x−w_b‖ = ρ, both w on ONE side of x in the own block, disk +
below-axis + all-triples order on (v2, block, v3), R² = 1/4 + ω²
substituted, ω ≥ 0. UNSAT would kill every case whose own block places two
packet members on the same side of x: all of (0,3,0,1), (0,4,0,0),
(1,3,0,0), and the k ≠ middle cases of s = 2 classes. The order-ONLY
version (no disk) is SAT — explicit evasions exist with members deep below
x — so the disk is load-bearing; consistent with the chirotope dead-end
(order alone carries no metric content).

**Reduction (PROVEN):** every ω ≥ 0 lens is contained in the ω = 0 lower
half-disk H = {p₀² + p₁² ≤ p₀, p₁ < 0} (the 2ωp₁ ≤ 0 term), so SUB2-H
(ω eliminated) UNSAT would suffice.

**Numeric status (HEURISTIC, float only):** 15M-point grid over SUB2-H
(float_probe_sub2.py): no witness; best min-margin −4e-6. Local
hill-climbs from 6 independent basins (float_refine_sub2.py): margins
increase to 0⁻ (best −9.5e-9) with θ_a → θ_b — the two members COLLAPSE
in every ascent. Reading: SUB2 is CONJECTURED-UNSAT with an infimum-zero
degenerate boundary (w_a = w_b limit), which (i) explains z3/cvc5
timeouts, (ii) predicts no strictly-feasible-gap certificate (the
closed-cone collapse shape of the dead-ends star/signblock entries). NRA
is decidable, so CAD-based QE (QEPCAD/Redlog, neither installed here) or
a hand proof via the collapse-limit tangent conditions are the routes.
Solver escalation artifacts: runs/SUB2_{left,right}.{cvc5,z3long}.out.

**Downstream dependency map:** SUB2-UNSAT would kill (0,3,0,1), (0,4,0,0),
(1,3,0,0) outright (every k-case contains a same-side own pair) and the
k != middle cases of s = 2 classes; (1,2,0,1)'s k in {0,2} cases also
ride it. It would NOT decide (1,2,0,1)'s straddle case (k = 1), which
remains open (factory found no witness; the deep-left-member geometry
conflicts with x-extremality in all hand-explored shapes).
