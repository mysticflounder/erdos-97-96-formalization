# Exact-five sharp mutual bounds and the third-anchor row

## Preamble: exact targets

**Conditional metric claim.** In the ordinary exact-five geometry, write O,V
for the two opposite apices, r for the first-apex radius, and q,w for distinct
points of E ∩ C1°, where E is the full radius-r class at O and C1° is the
strict first-cap interior. Suppose an actual row Kc contains q,w and an
actual blocker b of e ∈ {q,w}, and the actual row Kb contains c. Write ρ for
their common radius and L = dist(q,w). Then

- (2+√3)ρ² < L²;
- ρ < (√3−1)r;
- dist(O,c) < r.

**Conditional source claim.** In the same mutual case, suppose
I = E ∩ C1° = {u,q,w}, with these three points distinct, and retain the
original total critical-shell system H. The actual center d₀ = H(u) differs
from O,V,b,c. Its full row Kd₀ meets I in exactly one of
{u}, {u,q}, {u,w}. In either two-point case d₀ is strictly inside the first
cap, Kd₀ meets the closed first cap in precisely that pair, and c ∉ Kd₀.

These are **PROVEN, pen-and-paper conditional claims** under the authenticated
geometric inputs below. They do not close any of the three remaining trace
consumers or the unconditional physical residual. They are not new Lean
declarations or an iterative descent.

## 1. Provenance and custody

The [completed Pro response](../references/exactfive-source-geometry-2026-09-05/three-anchor-global-pro-response-2026-09-06.md)
is consult `01M1VS1YXCHXSJCQBXN5PNC80P`, message `#16676`. Its retained bytes
have SHA-256
`6c21d9690c7bd343ca5c1e50b4623faa2790b5012d661ef158479dc4287df4cc`.
The response is external input; its metric argument received an independent
paper audit. Source interfaces below were inspected at
`ac6e7978aa0ac8baa6377c4078a2aa5cdef39488`.

The [earlier mutual-return proof](2026-09-06-exactfive-mutual-return-chord.md)
already establishes the endpoint aliases, cap signs, normalization, and
exclusion of the upper equilateral placement. Its raw pair inputs quantify
over any two distinct authenticated points of I. They do not require that
the pair be jointly admissible at V or that H be replaced.

An actual row here means its entire unique rich ambient four-class, not a
selected four-subset of a larger class. We retain both explicit mutual
incidences; the ordinary residual does not supply them in every case.
Likewise |I| = 3 is a case hypothesis for the source claim.

The additional source inequality is
`FirstApexInteriorPairGeometry.inner_pos_of_oppApex1_capInterior_pair`
at `FirstApexInteriorPairGeometry.lean:217`. It requires strict first-cap
membership of q,w and yields ⟨q−O,w−O⟩ > 0. Both apices are fully
single-deletion robust; for V this is the normal form's
`secondApex_robust` field.

## 2. Sharp bounds in normalized coordinates

**PROVEN, pen-and-paper.** Relabel e as q; the hypotheses are symmetric
under swapping q,w. Apply the positive similarity from the earlier proof:

q = (−1,0), w = (1,0), O = (0,−h), c = (0,k).

Put s = √3. The prior proof gives 0 < k ≤ 1 and k < h. The additional
positive O-inner product is h²−1 > 0; hence h > 1. The remaining
equilateral placement, after exclusion of the upper placement, is

b = ((sk−1)/2,(k−s)/2),   r² = 1+h²,   ρ² = 1+k².

First suppose k ≥ 1/s. Then bₓ ≥ 0 and bₓ < 1. Also −h < bᵧ < 0:
(s−k)/2 < s/2 < 1 < h. The available horizontal width of triangle Oqw
at height bᵧ contains b strictly because

(3−sk)−(s−k) = 3−s−(s−1)k ≥ 4−2s > 0,

and therefore h(3−sk) > s−k. Explicitly this is
|bₓ| < 1 + bᵧ/h. Together with the strict vertical bounds it places b
inside triangle Oqw. All four carrier points are distinct, so this
contradicts convex independence. Thus k < 1/s.

Now −1/2 < bₓ < 0 and −h < bᵧ < 0. If
s−k ≤ h(1+sk), the same triangle width condition puts b in the closed
triangle Oqw, again forbidden. Consequently

h + (sh+1)k < s.

Since k > 0 and sh+1 > 0, this gives 1 < h < s and

0 < k < (s−h)/(1+sh) < (s−1)/(s+1) = 2−s.

The second strict comparison uses h > 1: its positive numerator decreases
and its positive denominator increases from their values at h = 1.
We can now compute

ρ² < 1+(2−s)² = 4/(2+s),

which gives (2+s)ρ² < L² because L = 2 in these coordinates. Also r² > 2,
so ρ²/r² < 4−2s = (s−1)². Both radii are positive, giving ρ < (s−1)r.
Finally h < s and k < 2−s imply

2hk+k² < 2s(2−s)+(2−s)² = 1.

Hence dist(O,c)² = (h+k)² < 1+h² = r². Each conclusion is preserved by
the original positive similarity. In particular c ∉ E. Polarization also
gives ⟨q−c,w−c⟩ < −sρ²/2, so the angle at c exceeds 150 degrees.

## 3. The actual third-anchor producer

**PROVEN, pen-and-paper under the stated I3 and mutual hypotheses.** Use
the original H and set d₀ = H(u). Totality supplies an actual critical row
Kd₀ containing u. Full-row exactness and singleton criticality come from
`CriticalShellSystem.selectedAt` and its `toCriticalFourShell` projection.
The row is not the row centered at H(d₀).

Robustness separates d₀ from O,V: deleting u preserves K4 at each apex,
whereas deleting u destroys K4 at d₀. Also d₀ ≠ c. The previously established
identity Kc ∩ E = {q,w} excludes u from the unique rich row at c. If d₀ = c,
the two full actual rows at that center must be that same unique class,
contradicting u ∈ Kd₀.

For any f ∈ I other than e, membership f ∈ Kb would make b equidistant
from the two distinct I points f,e. The existing primitive
`FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior`
(`FirstApexInteriorPairGeometry.lean:129`) would put b in C1°. Its guards
are exactly these two class/interior memberships, distinctness, b ∈ A,
b ≠ O, and the row's two distance equalities. This contradicts the mutual
geometry, which puts b outside the closed first cap. Therefore Kb ∩ I = {e}.
Since u ≠ e, the same full-row uniqueness argument gives d₀ ≠ b.

Kd₀ cannot contain both q and w. Otherwise u,q,w would lie on its circle
and on O's radius-r circle. Three distinct points on a positive circle
are noncollinear; subtracting their squared-distance equations determines
the center uniquely. Thus d₀ = O, contradicting robustness. In Lean,
`eq_of_dist_eq_three_of_pairwise_ne` in `N4d/SmallSReductions.lean:371`
supplies the corresponding center-uniqueness statement. An import or a
local adapter is still needed at the current exact-five interface; no
new compilation or transitive axiom audit is asserted here.

The inclusion u ∈ Kd₀ and exclusion of simultaneous q,w now give the
exhaustive three traces {u}, {u,q}, {u,w}. In a pair trace {u,f}, apply
the same generic localization primitive with center d₀. The row center is
strictly inside C1; then
`selectedFourClass_inter_capByIndex_card_le_two` gives
Kd₀ ∩ C1 = {u,f}. The raw nonpositive-inner-product bound gives
2σ² ≤ dist(u,f)², where σ is this actual row's radius. The bad pair {u,q}
may be used here: joint V-deletion survival is not a guard of either
geometric primitive.

Section 2 puts c in C1° and outside E. Thus c differs from u,f, and the
exact cap intersection excludes c from Kd₀ in either pair trace. Nothing
here excludes the singleton trace or gives a contradiction in a pair trace.

## 4. Stronger finite control and full-source boundary

The [retained Pro control](../references/exactfive-source-geometry-2026-09-05/three-anchor-mutual-local-control-pro-2026-09-06.md)
has SHA-256 `15d80b548874d6797a90c7af3a199cd9243a0a7ccf5d315a862f83fec0d5caa0`.
Its Python block was extracted byte for byte into
[`verify_exactfive_three_anchor_mutual_control.py`](../../scripts/verify_exactfive_three_anchor_mutual_control.py).
The [replay output](../../certificates/exactfive_three_anchor_mutual_control_20260906.json)
is **EMPIRICALLY VERIFIED, finite exact-arithmetic evidence** for 24 points
in Q(√3). Its 528 supporting-edge checks establish strict convexity for
that carrier. The MEC has exactly O,V,W on its boundary; its triangle is
acute. The strict cap counts are 6,7,8, so the closed counts are 8,9,10,
with the cap opposite W designated surplus. No other supporting triangle
is available, so no M44 packet is present.

The control has E = {q,w,u,aL,aR}, I = {u,q,w}, two full four-classes at V,
and a minimum admissible pair q,w whose chord exceeds r. It also has actual
singleton criticality at b and c, with
Kc = {q,w,b,d} and Kb = {w,c,B1,B2}. The mutual incidences and equal radii
hold exactly. The control uses e = w. Section 2 instead relabels e as q;
reflection across the vertical bisector swaps the two endpoints and the
sign of b's x-coordinate. Its normalized proof and this control therefore
use different endpoint conventions for b. Thus it tests more than the earlier 15-point
control, including a first cap larger than five and the mutual critical rows.

Global K4 nevertheless fails at the other 20 centers. Only b,c are
nonrobust rich centers, and neither actual row contains u. The control
therefore has no actual blocker for u and no total H. It does not establish
that c is fresh relative to the two endpoint blockers of an original
physical packet; for example, its only actual blocker of q is c itself.
The full ordinary/minimum-pair residual and global minimality are absent.

The third-anchor producer in §3 uses precisely a source object this control
lacks. Its existence is now justified under the full conditional source;
its three remaining trace consumers are not. The smaller actual row radius
in a pair trace does not provide a new dependent packet or a well-founded
iteration. Changing both endpoint choices to c and invoking the existing
common-center eliminator is also not an independent closure: that
eliminator can return to the unresolved distinct branch.

## 5. Completion matrix

| Obligation | Status and evidence |
| --- | --- |
| Sharp mutual chord/radius/apex-distance inequalities | PROVEN, pen-and-paper under the authenticated mutual inputs, §2 |
| Actual H(u) distinct from O,V,b,c and exhaustive three traces | PROVEN, pen-and-paper under the explicit I3/mutual/total-H hypotheses, §3 |
| Pair-trace localization, nonpositive inner product, and omission of c | PROVEN, pen-and-paper from the existing raw geometric inputs, §3 |
| Exact 24-point local model with mutual actual rows | EMPIRICALLY VERIFIED finite exact-arithmetic evidence, §4; not a full-source model |
| Singleton-trace contradiction or forced further incidence | Open |
| Contradiction consumers for the two pair traces | Open |
| Source-packet transport and a terminating iteration | Open; no decrease follows solely from the radius bounds |
| Lean promotion or unconditional physical closure | Not established by this checkpoint |
