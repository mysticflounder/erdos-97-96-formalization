# Exact-five mutual returns require a long chord

## Preamble: exact target

**Claim.** In the ordinary exact-five physical source, let q,w be its
distinct strict-interior first-circle points, O the first apex, r its
radius, and e one of q,w. Let b be an actual blocker of e with full row Kb.
Let c be another actual blocker center with full row Kc. If q,w,b belong
to Kc and c belongs to Kb, then dist(q,w) > r.

Thus dist(q,w) ≤ r excludes this entire double-hit mutual-return case.
The chord premise is not asserted for the current ordinary residual.
Zero-hit, one-hit, and non-mutual old-center incidences remain open.
The result is PROVEN on paper under the authenticated geometric inputs
listed below; it is not a new Lean theorem or unconditional physical closure.

## 1. Provenance and raw-row inputs

The [retained Pro response](../references/exactfive-source-geometry-2026-09-05/nonrobust-cut-consumer-pro-response-2026-09-06.md)
is the exact completed response to `01M1VP82R698EMZ83S7EADX101`, message
`#16622`. Its SHA-256 is
`fe61126fd166a82327c135f9391c65845fbeb7e5d10a4f75fc532d314d68ec25`.
It establishes the candidate raw-row route and a weaker exclusion c ∉ E.
The argument in §3 strengthens that exclusion with a chord inequality.
The response remains external input; the geometric guards and new argument
were independently audited against source revision
`00942f94e83c5ad6bd3dc01e6d73532a28f92958`.

Put E = SelectedClass A O r and I = E ∩ (strict first-cap interior).
Write C1 for the closed first cap and T for its supporting-triangle vertices.
The source guarantees |I| ≥ 3 and q,w ∈ I, not E ⊆ I.
Both O and the second apex V are fully single-deletion robust (the latter
by `normalForm.secondApex_robust`), so no actual blocker equals O. Let ρ be the radius of Kc.

The following existing primitive conclusions apply to any distinct pair
u,v ∈ I and any selected row at a carrier center c ≠ O containing them.
They do not require a fresh source or a change to H.

| Conclusion | Inspected source declaration |
| --- | --- |
| c is in the strict first cap | `FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior` |
| ρ < r | `FirstApexInteriorPairGeometry.bisectorCenter_radius_lt_of_selected_pair` |
| Inner product ⟨u−c,v−c⟩ ≤ 0 | `FirstApexInteriorPairGeometry.bisectorCenter_inner_nonpos_firstApexInterior` |
| The row meets C1 in exactly {u,v} | `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`, together with the two memberships |
| Exterior row points have distance to O less than r | `FirstApexInteriorPairCirclePower.dist_firstApex_lt_of_interiorPair_circlePoint_outsideCap` |
| The row omits every vertex of T | `FirstApexInteriorPairCirclePower.interiorPair_circleRadius_lt_dist_supportTriangle` |

In particular Kc ∩ E = {u,v}. If Safe denotes carrier points in C1 or T
or at distance at least r from O, then Kc ∩ Safe = {u,v}. A robust point
is not thereby a Safe point. These are conditional conclusions under the
two interior incidences; the global nonrobust-center cut does not supply
those incidences.

For the chord proof only the first four primitive conclusions are needed.
Their source guards were checked independently. No fresh kernel or transitive
axiom audit is claimed for this checkpoint.

## 2. Mutual incidence and endpoint aliases

The two actual rows have positive radii. Since b ∈ Kc and c ∈ Kb,
their radii both equal dist(b,c). Since e lies in both rows, b,c,e form a
nondegenerate equilateral triangle of side ρ. In particular b differs from e.

The other endpoint cannot be b either. If it were, c,q,w would be
equilateral. Polarization would give
⟨q−c,w−c⟩ = (ρ² + ρ² − ρ²)/2 = ρ²/2 > 0,
contradicting the primitive nonpositive inner product. Therefore
b ∉ {q,w}, and Kc ∩ C1 = {q,w} puts b outside the closed first cap.
The center c and both endpoints lie in the strict first cap.

The cap has an affine functional L positive on its strict interior and
negative at O and at every carrier point outside the closed cap. For its chord
endpoints P,Q, one choice is
L(x) = −signedArea2(x,P,Q) · signedArea2(O,P,Q).
Nondegeneracy of the supporting triangle gives L(O) < 0. The other signs
are the cap definitions, exposed by
`SurplusCapPacket.signedArea2_mul_neg_of_mem_capInteriorByIndex` and
`SurplusCapPacket.signedArea2_mul_pos_of_not_mem_capByIndex` in the
SurplusM44Packet module's Shard02 and Shard01.
Thus L(q),L(c) > 0 and L(O),L(b) < 0.

## 3. Complete chord proof

**PROVEN, pen-and-paper.** Relabel the two endpoints so that e = q; the
statement and the two-interior-point inputs are symmetric in the endpoints.
Apply a Euclidean similarity taking q = (−1,0), w = (1,0). We use r and ρ
for the scaled radii within this proof. Equal distances to q,w place O and
c on their perpendicular bisector. Radius drop excludes O = (0,0): in
that case r = 1, while every point on the bisector has distance at least
one to q. Reflect vertically if necessary to write O = (0,−h), h > 0,
and c = (0,k).

Then r² = 1+h², ρ² = 1+k², and ρ < r gives |k| < h. If k ≤ 0, c lies
on the segment from O to the midpoint of q,w, hence in conv{O,q,w},
contradicting convex independence. Thus 0 < k < h. The nonpositive inner
product is k²−1 ≤ 0, so k ≤ 1.

Put s = √3. The two equilateral placements for b are

- bupper = (−(1+sk)/2, (k+s)/2);
- blower = ((sk−1)/2, (k−s)/2).

For the upper placement set
α = (1+sk)/2, γ = s(1+k²)/(2(h+k)), and β = 1−α+γ.
Here α,γ > 0 and direct substitution gives
bupper = αq + βc − γO, with α+β−γ = 1.
If β ≤ 0, then
q = (1/α)bupper + (−β/α)c + (γ/α)O
is a convex combination of other carrier points: all coefficients are
nonnegative and their sum is one. Convex independence rules this out,
so β > 0. Applying the affine functional gives
L(bupper) = αL(q)+βL(c)−γL(O) > 0,
contradicting L(b) < 0. The upper placement is impossible.

For the lower placement, suppose h ≥ s. Put x = (sk−1)/2 and
δ = (s−k)/(2h). The inequalities 0 < k ≤ 1 imply |x| < 1/2 and
0 < δ < 1/2. Consequently

blower = δO + ((1−δ−x)/2)q + ((1−δ+x)/2)w

is a convex combination with strictly positive coefficients summing to one.
This contradicts convex independence. Therefore h < √3 and
r = √(1+h²) < 2 = dist(q,w) in the normalized coordinates.
The original similarity scales both lengths by the same positive factor,
so the required dist(q,w) > r holds in the original coordinates. ∎

## 4. Short admissible pairs with at least four interior anchors

**Lemma — PROVEN, pen-and-paper under the same source data.** Distinct
points of I have different distances to the second apex V. At most one
unordered pair of I fails to preserve K4 at V after joint deletion.

**Proof.** If two distinct I points had the same V-distance, O and V
would both be equidistant from them. The primitive
`ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex`
would put V in the strict first cap. But V is one of its supporting chord
endpoints and is omitted by that strict interior. Thus every radius class
at V contains at most one I point.

Suppose a pair {u,v} is bad. Every rich ambient V-class must meet it,
or that class would survive deletion. It meets at most one endpoint, by
distance injectivity, and has exactly four members, or it would survive
losing that endpoint. There are therefore at most two rich radii. There
cannot be only one: that would be a four-class destroyed by a singleton
deletion, contradicting V's full single-deletion robustness. Hence there
are exactly two rich four-classes, meeting I precisely in {u} and {v}.
Any other bad I pair must hit both classes, so it is the same unordered
pair {u,v}. ∎

**Proposition — PROVEN, pen-and-paper.** If |I| ≥ 4, there is a jointly
admissible pair in I with chord at most r. Any minimum admissible pair
therefore also has chord at most r and cannot have the mutual double-hit
return of §3.

**Proof.** All points of the first cap lie in the cone from O generated by
the two opposite supporting vertices. The carrier lies in the MEC disk;
`exists_cone_coeffs_of_cap_region` gives this cone containment from disk
membership and the cap-side inequality. The nonobtuse supporting triangle
makes the cone's angle at O at most 90 degrees. Concretely,
`S.circPacketByIndex` supplies the boundary and disk fields and its
`inner_at_v1` supplies the nonnegative inner product of the two boundary
rays. This verifies the geometric guards of the cone theorem.

Choose four distinct I points and order their rays from O within that cone.
Their rays are distinct because all four points have the same positive
O-distance r. The three adjacent angular gaps sum to at most 90 degrees,
so at least two gaps are at most 45 degrees. Each gives a chord of length
at most 2r sin(22.5 degrees), which is less than r. These are distinct
unordered pairs. At most one can be bad by the preceding lemma, so one
preserves K4 at V after joint deletion. Its endpoints are distinct and in
I, exactly the remaining conditions of `admissibleInteriorPair`. A minimum
admissible pair has no larger chord, by its defining inequality. ∎

With |I| = 3 this argument alone does not force a short admissible pair.
For example three rays at 10,20,89 degrees fit the cone bound; if the first
pair is bad, both remaining chords exceed r. This is an angular/deletion
diagnostic, not a Euclidean realization of the full physical source. In
the exceptional bad-pair case, V must have precisely the two rich four-classes
described above, and the third I point belongs to neither. The source has
not excluded that configuration.

## 5. What this eliminates and what remains

**PROVEN, pen-and-paper corollary.** If a source-owned pair satisfies
dist(q,w) ≤ r, an actual double-hit row cannot contain an old endpoint
blocker b while that old row contains the new center c. This is a False
consumer for those combined hypotheses, not a reason to add a new admission.

The reverse incidence c ∈ Kb is essential to the proof: b ∈ Kc by itself
does not identify the radii or make b,c,e equilateral. Nor does the result
assert that every escaping actual row double hits q,w. The separately
proved global cut supplies neither of these two premises.

Section 4 supplies short-pair entitlement when |I| ≥ 4, conditional on
carrying a minimum admissible pair to the consumer. The ordinary physical
leaf does not currently retain that payload. A closest pair of anchors
alone does not supply joint deletion survival. The three-interior-anchor
case and dependent residual transport remain **CONJECTURED / open**
(`{{NEEDS_PROOF}}`). Even completing them would eliminate the mutual
double-hit case only; omission and non-mutual cases still require their
own contradiction consumers.

## 6. Completion matrix

| Obligation | Status and evidence |
| --- | --- |
| Raw selected-row geometric inputs under two interior hits | Source-checked conditional inputs, §1; no new kernel audit |
| Equal radii and equilateral triangle under mutual incidence | PROVEN, pen-and-paper, §2 |
| Both endpoint aliases for b excluded | PROVEN, pen-and-paper, §2, using the listed nonpositive-inner-product input |
| Affine cap separation | PROVEN from the cap definition and triangle nondegeneracy, §2 |
| Upper and lower equilateral placements give chord > r | PROVEN, pen-and-paper, §3, under the listed geometric inputs |
| Distinct V-distances on I and at most one bad pair | PROVEN, pen-and-paper, §4 |
| A short jointly admissible pair with at least four interior anchors | PROVEN, pen-and-paper, §4 |
| False consumer with the additional chord ≤ r premise | PROVEN, pen-and-paper, §5 |
| Short-pair entitlement for three interior anchors and transport to the live consumer | CONJECTURED, open |
| All missing interior incidences, non-mutual and omission cases | CONJECTURED, open |
| Unconditional exact-five closure and Lean promotion | Open; no promotion or terminal reduction claimed here |
