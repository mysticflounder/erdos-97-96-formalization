# A three-interior-anchor control for short-pair selection

## Preamble: exact target

**Finite control claim.** The exact 15-point carrier below is strictly
convex-independent, lies in the minimum enclosing disk supported by a
nonobtuse triangle O,V,W, and has an exact five-point radius-one class at O
with precisely three members in the strict cap opposite O. Both O and V are
fully single-deletion robust. The only short pair among those three interior
points is exactly the pair whose joint deletion destroys K4 at V. Thus no
jointly admissible interior pair has chord at most the O-radius.

This is a counterconfiguration to that short-pair implication from the listed
geometric, radius-class, and robustness premises. It does not satisfy global
K4 and does not supply a total critical-shell system or global minimality.
It is not a counterexample to the full exact-five physical theorem.

**Evidence status: EMPIRICALLY VERIFIED, finite interval control.** The exact circle identities
below determine the intended equalities. Strict inequalities and exclusion
of additional radius classes are checked by
[`verify_exactfive_three_anchor_control.py`](../../scripts/verify_exactfive_three_anchor_control.py),
with retained output
[`exactfive_three_anchor_control_20260906.json`](../../certificates/exactfive_three_anchor_control_20260906.json).
The retained certificate reports `PASS: finite interval-verified local
control; global K4 fails` for all 15 points. The verifier uses outward-rounded
fixed-rational intervals for strict inequalities and radius separation, with
explicit exact identities for the prescribed circle memberships. This is
finite computational evidence; no Lean promotion is claimed.

## 1. Exact coordinates

All angles in this note are degrees. Write
u(θ) = (cos θ, sin θ), and let Rotθ denote planar rotation by θ.
Set

- O = (0,0), V = (1,0), W = u(80);
- a = u(1), p = u(70), q = u(79);
- ρ₁ = 2 sin 35 and ρ₂ = 2 sin 39.5;
- C = (1/2, (1−cos 80)/(2 sin 80)) = (1/2, (tan 40)/2).

The following indices are notation for this note:

| Index | Name | Exact point |
| --- | --- | --- |
| 0 | O | (0,0) |
| 1 | V | (1,0) |
| 2 | W | u(80) |
| 3 | a | u(1) |
| 4 | p | u(70) |
| 5 | q | u(79) |
| 6 | x₁ | V + ρ₁u(165) |
| 7 | x₂ | V + ρ₁u(166) |
| 8 | x₃ | V + ρ₁u(167) |
| 9 | y₁ | V + ρ₂u(138.6) |
| 10 | y₂ | V + ρ₂u(138.8) |
| 11 | y₃ | V + ρ₂u(139) |
| 12 | P | C + (999/1000)Rot30(−C) |
| 13 | Q | C + (999/1000)Rot60(−C) |
| 14 | R | C + (999/1000)Rot45(−C) |

The verifier and certificate use names rather than these numerical indices:
their `u,v` are this note's p,q; their `b1,b2,b3` are x₁,x₂,x₃; and their
`c1,c2,c3` are y₁,y₂,y₃. The names O,V,W,a,P,Q,R agree.

Let A be these 15 points. Rational degree values specify exact real points;
the coordinates are not rounded decimal replacements. The three final points
lie strictly inside the MEC disk, at distance (999/1000)‖C‖ from C, and in
the strict cap opposite W. Their approximate coordinates, for identification
only, are P = (0.276985444,−0.193177642),
Q = (0.613227458,−0.222595006), and
R = (0.443170016,−0.230019875).

## 2. Convexity, disk custody, and cap roles

The proposed counterclockwise boundary order is

`8, 0, 12, 14, 13, 1, 3, 4, 5, 2, 9, 10, 11, 6, 7`.

The verifier checks that every other point lies strictly to the left of each
oriented boundary edge. These inequalities imply that all 15 points are
distinct exposed vertices of their convex hull. The retained certificate
records a strictly positive interval lower bound for every required
supporting determinant.

The triangle O,V,W has angles 80,50,50. Its circumcenter is C and its
circumradius is ‖C‖ = 1/(2 cos 40). The MEC-boundary memberships of O,V,W
follow from their exact circle identities. Rotation invariance gives
‖P−C‖ = ‖Q−C‖ = ‖R−C‖ = (999/1000)‖C‖ < ‖C‖.
The verifier checks strict disk interior for every carrier point other than
O,V,W. Thus these are the only three MEC-boundary points.
The minimum enclosing disk and its center are unique here. To see this
directly, put c₈₀ = cos 80. The positive weights
λO = c₈₀/(1+c₈₀) and λV = λW = 1/(2(1+c₈₀)) sum to one and have
weighted barycenter C. For any candidate disk center Z, the weighted average
of the three squared distances to O,V,W is
‖C‖² + ‖Z−C‖². Hence every disk enclosing the triangle, and therefore every
disk enclosing A, has squared radius at least that quantity. The constructed
disk attains radius ‖C‖, and attaining that radius forces Z = C.

The closed caps are defined by the supporting-triangle chord half-planes,
restricted to A. Their memberships are:

| Opposite apex | Closed-cap indices | Cardinality | Strict interior |
| --- | --- | --- | --- |
| O | 1,2,3,4,5 | 5 | a,p,q |
| V | 0,2,6,7,8,9,10,11 | 8 | x₁,x₂,x₃,y₁,y₂,y₃ |
| W | 0,1,12,13,14 | 5 | P,Q,R |

Designate the cap opposite W as the surplus cap. Its three strict-interior
points P,Q,R and two endpoints O,V give size five, so O and V retain
respectively the first and second opposite-apex roles.

**No M44 packet — paper deduction from the finite boundary and cap checks.**
The only MEC-boundary points are O,V,W; all other carrier points are strictly
inside. By uniqueness of the MEC, any eligible circumscribed nonobtuse support
triangle must therefore use O,V,W, up to permutation. The cap half-planes are
fixed by its three supporting chords, so every eligible packet has the same
cap cardinalities 5,8,5, up to permutation. None has the two four-point caps
required by M44. Hence no eligible packet on A is M44. The certificate checks
the sole boundary triple and its cap counts. This is a paper consequence of
the finite boundary/cap checks and MEC uniqueness, not a new Lean verification
of the `noM44` field.

## 3. Exact radius classes and the only bad pair

The full positive radius-one class at O is
E = {V,W,a,p,q}. Its strict first-cap intersection is exactly
I = {a,p,q}. Deleting any one carrier point leaves at least four points of E,
so O is fully single-deletion robust.

The only rich positive-radius classes at V are

- K₁ = {p,x₁,x₂,x₃}, at radius ρ₁;
- K₂ = {q,y₁,y₂,y₃}, at radius ρ₂.

The equalities follow from ‖u(θ)−V‖ = 2 sin(θ/2) for these angles and from
the definitions of xᵢ,yᵢ. Their exact cardinalities and the absence of other
rich V-classes require the verifier's separation checks. Since K₁ and K₂ are
disjoint, deleting any one carrier point leaves one full four-class intact.
Thus V is fully single-deletion robust.

Deleting p and q together leaves three points in each of K₁,K₂. No other
V-class becomes larger under deletion, so K4 at V fails. The third I point a
lies in neither class. Deleting a and p preserves K₂; deleting a and q
preserves K₁. Hence {p,q} is the unique bad unordered pair of I.

The three chords, with first-apex radius r = 1, are

- dist(p,q) = 2 sin 4.5 < 1;
- dist(a,p) = 2 sin 34.5 > 1;
- dist(a,q) = 2 sin 39 > 1.

These strict comparisons follow from the monotonicity of sine on [0,90]
and sin 30 = 1/2. Therefore the only short pair is the bad one. The minimum
jointly admissible interior chord is dist(a,p), which exceeds r.

This control also tests the proposed rich-radius upper bound. Both
ρ₁ and ρ₂ exceed dist(V,O) = 1, while each V-class has exactly one I member
and three strict opposite-V-cap members. Thus neither an unconditional
opposite-cap two-hit bound nor the upper bound ρ ≤ dist(V,O) follows from
these geometric and full-class premises. The valid adjacent-cap one-hit
bounds and opposite-cap lower bound of two are respected.

## 4. Explicit full-source failures

The only K4 centers in A are O and V. At each of indices 2 through 14,
every positive-radius class has at most two points; the verifier checks
this upper bound rather than relying on a selected radius.
Thus global K4 fails at W,a,p,q,x₁,x₂,x₃,y₁,y₂,y₃,P,Q,R.

Moreover the only centers carrying a selected four-row, O and V, are both
fully single-deletion robust. Neither supplies an actual critical row for
any source. Therefore the carrier supplies no total critical-shell system H.
It cannot instantiate `CounterexampleData` or its global minimality predicate.

The first opposite cap has size five. Existing conditional cap-five consumers
may close particular double-hit branches under their full hypotheses. This
control tests short-pair selection from the explicitly retained local premises;
it does not contest those consumers or furnish their missing actual-row data.

## 5. Evidence boundaries and next use

The verifier and certificate concern this one exact finite configuration.
Their role is to reject the narrowed short-pair implication and the tested
radius upper bound as consequences of the listed local premises alone.
Neither a full-source countermodel nor an exact-five contradiction follows.

Any proof eliminating the three-anchor exception must use an additional
authenticated premise that this control lacks, such as global K4 or a total
actual critical-row system, or directly close the exceptional branch under
its complete source data. Global minimality must still be applied only where
its nonempty convex global-K4 antecedents have been supplied.

| Claim | Evidence and scope |
| --- | --- |
| Prescribed O- and V-circle memberships and the three chord identities | PROVEN, pen-and-paper trigonometric identities for the displayed coordinates |
| Strict convexity, disk interior, cap memberships, and radius-class exclusions | EMPIRICALLY VERIFIED for these 15 exact points by the retained outward-rounded interval certificate |
| O and V robust; sole short pair bad; both admissible chords exceed r | Paper deductions from the exact identities and finite class-exclusion checks |
| Unique MEC and exclusion of all M44 packets | Paper deductions from positive barycentric weights and the finite boundary/cap checks |
| Global K4 failure at every center other than O,V | EMPIRICALLY VERIFIED finite radius-multiplicity upper bounds |
| No total critical-shell system or global-minimal counterexample data | Paper consequence of those full radius-class checks |
| Contradiction for the complete physical residual | Not claimed; the missing global premises remain essential |
