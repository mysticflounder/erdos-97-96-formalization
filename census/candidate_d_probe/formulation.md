# Candidate-D probe — Q1 window formulation (FORMULATION FIRST)

Register U4 / ledger row 4: route analysis for the named residual
`DoubleApexOffSurplusSharedRadiusPairCard12Up` (|A| ≥ 12 tail of
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`,
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`). Deliverable:
verdict tables that shrink strategy freedom. No Lean production.

Dead-ends compliance: this probe is the convexity-coupled route explicitly
left open by `doubleapex-card12up-uniform-pattern-lemma`; per `vesica-local-sat`
no bare (undecorated) local window is re-run — every Q1 window carries the
convex-position + cyclic-order decoration; per (D-msolve) all exact work uses
exact-rational/symbolic frames, msolve verdict tuples parsed in full, no
decimal-literal frames, no free-frame QF_NRA claims beyond labeled
KILLED-QFNRA; per (D-caps) no cap is treated as a circle anywhere below.

## 1. Source semantics (all grounded to in-tree definitions)

### 1.1 The packet counts (m,s,l,r)

`lean/Erdos9796Proof/P97/N8/FourSubpacket.lean`:

- `packetMoserCount S T = |T ∩ S.triangle.verts|` — counts packet members that
  are Moser vertices, out of ALL THREE `{v1,v2,v3}` (no adjacency restriction).
- `packetSameCapCount S i x T = |T ∩ (S.capInteriorByIndex i).erase x|`.
- `packetLeftAdjCount S i T = |T ∩ S.leftAdjacentInteriorByIndex i|`.
- `packetRightAdjCount S i T = |T ∩ S.rightAdjacentInteriorByIndex i|`.
- `packet_groupSum_eq_card` (PROVEN, in-tree): for `T ⊆ SelectedClass A x radius`,
  `radius > 0`: m + s + l + r = |T|. The four groups PARTITION the packet
  (each non-Moser selected point is in exactly one open cap interior;
  `x ∉ T` since `dist x x = 0 < radius`).
- `N8SelectedApex S i x` (`N8/N8bEndpointPair.lean:112`): `radius > 0`,
  `x ∈ S.capInteriorByIndex i`, `4 ≤ |SelectedClass A x radius|`.
  `SelectedClass A x r = A.filter (dist x · = r)` (ambient radius class).
- Four-point subpacket: `N8SelectedApex.exists_fourSubpacket_with_packet_budget`
  — any selected class of card ≥ 4 contains a 4-subset T with exact budget
  m+s+l+r = 4. NOTE: T is a SUBSET; other window points MAY also lie at
  distance `radius` from x without being counted (no exactness constraints
  in any window below — deliberate, soundness-critical).

Cap indexing (`N8bEndpointPair.lean:36-98`, matching cyclic convention in
`SurplusM44Packet.lean:307-320`): own cap of index i=0 is C1 with endpoints
v2 (`ownLeftEndpointByIndex`) and v3 (`ownRightEndpointByIndex`); left-adjacent
interior = I2 (cap C2, endpoints v3,v1), right-adjacent = I3 (cap C3,
endpoints v1,v2). `Iᵢ = Cᵢ` minus its two endpoint vertices
(`N9Endpoint/Shell.lean:117-126`).

### 1.2 Geometric layer

- `CapTriple` (`Cap/Structure.lean:161`): closed-cap convention; field
  `arc_membership`: for v ∈ A, `v ∈ C1 ↔ OnArcOpposite v1 v2 v3 v`, etc.
- `OnArcOpposite vi vj vk v ⟺ signedArea2(v,vj,vk) · signedArea2(vi,vj,vk) ≤ 0`
  (`Foundation.lean:57`) — closed chord-separation, signed-area form.
  `signedArea2(v,vj,vk) = (vj₀−v₀)(vk₁−v₁) − (vk₀−v₀)(vj₁−v₁)`.
- `CircumscribedMECPacket` (`CircumscribedMECPacket.lean:83`): center O,
  radius R > 0, `‖vᵢ − O‖ = R` (all three), non-obtuseness as inner products
  `⟪v2−v1, v3−v1⟫ ≥ 0` (and cyclic), `disk_contains_A : ∀ a ∈ A, ‖a−O‖ ≤ R`.
- `ConvexIndep A` (`Foundation.lean:28`): extreme-point property
  (`∀ a ∈ S, a ∉ convexHull ℝ (S ∖ {a})`).
- `nonmoser_in_one` (CapTriple field): every non-Moser A-point is in exactly
  one cap.
- The DoubleApex leaf (`U1LargeCapRouteBTail.lean:2383`) carries: ConvexIndep
  (via CounterexampleData), K4 everywhere (`HasNEquidistantProperty 4 A` — so
  EVERY a ∈ A is the center of some radius class of card ≥ 4),
  `MT : MEC.NonObtuseCircumscribedMoserTriangle`, `CP : CapTriple` on its
  structural projection, surplus cap > 4 and a second cap ≥ 5, |A| ≥ 12 in
  the Card12Up residual.

### 1.3 The proven token fact (restated; re-verified this probe)

Within escape-census.py's capacity model (own-interior-minus-center base
capacity 1, adjacent base 2, support needed = max(0,s−1)+max(0,l−2)+max(0,r−2),
m ≤ 2), the supportable primitive tuples (m+s+l+r = 4) are constant for
surplus p ≥ 3 (|A| ≥ 12): 31 ordered / 19 mod reflection, max support 3.
Re-verified p ≤ 200 (`verify_tuples.py`, PASS). Token-level PROVEN; what is
NOT proven and is probed here: (i) proof-usability of the normalization for
Card12Up (leads §7 — CONJECTURED); (ii) per-type kills compose to a global
kill (obstruction D1).

## 2. Grounding notes (window-level lemmas, with proofs)

### 2.1 m ≤ 2 is geometric, not just a model choice (PROVEN, prose)

If all three vertices were in T then dist(x,v1) = dist(x,v2) = dist(x,v3) = ρ
with v1,v2,v3 distinct and noncollinear (they realize a nondegenerate triangle
on the MEC), so x is their unique circumcenter; the circumcenter of the three
MEC-boundary points IS the MEC center O (all three at distance R from O and
circumcenter unique). But x ∈ A is non-Moser, so `nonmoser_in_one` puts x in
some cap, i.e. weakly beyond some chord; the non-obtuse circumcenter lies in
the CLOSED triangle, and lying ON a chord would make x collinear with two
A-points (excluded: ConvexIndep forbids collinear A-triples, CGN5b
`ConvexIndep.not_three_collinear`, in-tree PROVEN). So x is strictly inside
all three chords — in no cap — contradiction. Hence m ≤ 2 for packets at
non-Moser centers. (Uses: finiteness nowhere; uses non-obtuseness +
convex-independence + cap partition.)

### 2.2 Strict cap signs for non-Moser A-points (PROVEN, prose)

For non-Moser a ∈ A with cap assignment Cᵢ: `arc_membership` gives the closed
inequality `sA2(a, vⱼ, vₖ) · sA2(vᵢ, vⱼ, vₖ) ≤ 0` (chord {vⱼ,vₖ} opposite vᵢ).
No A-triple is collinear (CGN5b), so `sA2(a, vⱼ, vₖ) ≠ 0` and
`sA2(vᵢ, vⱼ, vₖ) ≠ 0`; the product is nonzero, hence < 0 strictly.
`nonmoser_in_one` (exactly one cap) turns the other two closed conditions into
strict same-side: product > 0. So each non-Moser window point carries three
STRICT sign conditions.

### 2.3 Cap contiguity in the convex cyclic order (PROVEN, prose)

Window W ⊆ A is convex-independent (subsets inherit: hull of a subset is
contained in hull of the superset minus nothing relevant — if a ∈ hull(W∖a)
then a ∈ hull(A∖a)). Its convex polygon has a cyclic vertex order. Let L be
the line through v2, v3 (both window points, both on the polygon). A convex
polygon's boundary meets a line in ≤ 2 points unless an edge lies on it; v2
and v3 are vertices ON L and every other window point is strictly off L
(no collinear A-triples), so along the cyclic order the strict side of L is
constant on each of the two open arcs between v2 and v3. C1-assigned points
are strictly on the far side (2.2), all others strictly near. Hence the
C1-window-points form exactly one of the two open arcs (the far one), i.e.
the block v2, [C1-interior points], v3 is contiguous; same for the other two
chords. The three blocks tile the cycle sharing endpoints, forcing the cyclic
arrangement (v2, I1-pts, v3, I2-pts, v1, I3-pts) up to orientation.
For a convex polygon listed in CCW cyclic order, EVERY cyclically ordered
triple has signedArea2 > 0 (standard convex-position chirotope fact).

### 2.4 Reflection/relabeling reductions (PROVEN, prose)

Fix the gauge v2 = (0,0), v3 = (1,0) (translation+rotation+scale; all window
constraints are similarity-invariant — signedArea2 scales by λ² > 0,
distance equalities are homogeneous once R, ρ are variables).

(a) Reflection across the x-axis (the v2v3 line) fixes the gauge and every
constraint class: signedArea2 flips sign, so cap-sign PRODUCTS are invariant;
distances, disk, inner products invariant; the CCW reading of the reflected
polygon is the reversed cycle. It maps realizations with cyclic arrangement
(v2, I1, v3, I2, v1, I3) to arrangement (v2, I3-rev, v1, I2-rev, v3, I1-rev)
and vice versa. Hence encoding ONLY the arrangement
(v2, own-block, v3, left-block, v1, right-block) in CCW loses nothing.

(b) The relabeling v2 ↔ v3 (with C2 ↔ C3 forced by the definitions) composed
with the gauge-restoring reflection across x = 1/2 maps realizations of tuple
(m,s,l,r) bijectively to realizations of (m,s,r,l), preserving the CCW
arrangement pattern of (a), and maps Moser-vertex packet choices v2 ↔ v3,
v1 ↦ v1. Hence: UNSAT of the (a)-encoding of (m,s,l,r) for ALL its sub-cases
⟺ the whole reflected class {(m,s,l,r),(m,s,r,l)} is unrealizable. One
representative per reflected class suffices, and for l = r classes the
vertex-choice pairs {v1,v2}~{v1,v3} and (m=1) v2~v3 collapse.

### 2.5 Within-cap order freedom

Packet members within one cap are unlabeled, so WLOG they appear in arc order;
the only order datum is the POSITION OF THE CENTER x among the s own-cap
packet points: s+1 cases. (x is distinguishable — it carries the radius
equalities.) Total sub-case count per reflected class:
(s+1) × (#vertex-choice cases per 2.4(b)).

## 3. The per-type decorated window W(τ), τ = (m,s,l,r)

Point roster (all points are A-points of a hypothetical |A| ≥ 12 leaf
configuration; window size 8 − m):

- v1, v2, v3 — the Moser triangle (anchors; always present);
- x — the packet center, non-Moser, own cap C1 (WLOG i = 0: no cap-size data
  is carried by the minimal window, so cap relabeling is free; the surplus
  designation caveat of closure-plan §5 does not bite at this scale — noted);
- y₁..y_s ∈ I1 ∖ {x}; a₁..a_l ∈ I2; b₁..b_r ∈ I3;
- the m vertex packet members are a chosen subset M ⊆ {v1,v2,v3}, |M| = m
  (sub-cases per 2.4(b)).

Auxiliary variables: O (MEC center), R² (as one variable R2 > 0), ρ² (rho2 > 0).
Gauge: v2 = (0,0), v3 = (1,0); O₀ = 1/2 substituted (implied by
‖v2−O‖ = ‖v3−O‖).

Constraints (every one implied by the real leaf configuration — exclusion-sound):

| tag | constraint | source |
|---|---|---|
| E-MEC | ‖vᵢ−O‖² = R2, i=1,2,3 | CircumscribedMECPacket.moser_on_boundary_i |
| E-PKT | ‖t−x‖² = rho2 for each packet member t ∈ M ∪ {y,a,b} | SelectedClass membership |
| I-POS | R2 > 0, rho2 > 0 | radius_pos fields |
| I-DISK | ‖p−O‖² ≤ R2, every window point p | disk_contains_A |
| I-OBT | ⟪v2−v1,v3−v1⟫ ≥ 0 and cyclic | inner_at_vᵢ |
| I-CAP | strict 3-chord sign conditions per non-Moser point (2.2) | arc_membership + nonmoser_in_one + CGN5b |
| I-ORD | ALL cyclic triples of σ positive, σ = (v2, w₁..w_{s+1}, v3, a₁..a_l, v1, b₁..b_r), where (w's) = own block containing x at slot k | ConvexIndep + 2.3 |

Distinctness of all window points and noncollinearity of all window triples
are IMPLIED by I-ORD (all triples strictly positive) — no separate separators
needed in the sign-carrying encodings. The equality-only ladder step adds
Rabinowitsch separators explicitly where needed.

NOT constrained (deliberately): exactness of the class (anchors may lie at
distance ρ from x); cap sizes; the DoubleApex row/liveData structure; MEC
minimality beyond disk containment (the MEC is the minimum enclosing circle,
but only boundary/containment/non-obtuseness are consumed by the leaf's
packet — adding minimality would be sound but is not needed for a first
minimal window and is not polynomial without witness points).

Realizability semantics: SAT of W(τ) does NOT witness a full |A| ≥ 12
configuration (anchors/cap sizes/other centers absent) — verdict is
NOT-KILLED-AT-SCALE unless an exact witness is produced, in which case the
finding is "the decorated minimal window is realizable" (kills the per-type
minimal-window exclusion hope for τ). UNSAT of W(τ) (exact or QF_NRA) kills
every configuration containing a type-τ packet — in particular composes over
the census (Q2).

## 4. Sub-case table

19 reflected classes; sub-cases = (s+1) orders × vertex choices
(m=0: 1; m=1: 3, reduced to 2 = {v1, v2} when l = r; m=2: 3, reduced to
2 = {v1v2, v2v3} when l = r). v1 = opposite apex, v2/v3 = own-cap endpoints.

| τ | orders | vertex choices | cases |
|---|---|---|---|
| (0,0,0,4) | 1 | — | 1 |
| (0,0,1,3) | 1 | — | 1 |
| (0,0,2,2) | 1 | — | 1 |
| (0,1,0,3) | 2 | — | 2 |
| (0,1,1,2) | 2 | — | 2 |
| (0,2,0,2) | 3 | — | 3 |
| (0,2,1,1) | 3 | — | 3 |
| (0,3,0,1) | 4 | — | 4 |
| (0,4,0,0) | 5 | — | 5 |
| (1,0,0,3) | 1 | v1,v2,v3 | 3 |
| (1,0,1,2) | 1 | v1,v2,v3 | 3 |
| (1,1,0,2) | 2 | v1,v2,v3 | 6 |
| (1,1,1,1) | 2 | v1,v2 | 4 |
| (1,2,0,1) | 3 | v1,v2,v3 | 9 |
| (1,3,0,0) | 4 | v1,v2 (l=r) | 8 |
| (2,0,0,2) | 1 | v1v2,v1v3,v2v3 | 3 |
| (2,0,1,1) | 1 | v1v2,v2v3 | 2 |
| (2,1,0,1) | 2 | v1v2,v1v3,v2v3 | 6 |
| (2,2,0,0) | 3 | v1v2,v2v3 (l=r) | 6 |

Total 72 conjunctive cases (the l=r vertex-choice reduction of 2.4(b) applies
to every l=r class, including l=r=0). Every case's window is definite and finite: no
UNGROUNDED entries — the (m,s,l,r) semantics ground completely via §1.1's
partition lemma; the one model-level assumption (m ≤ 2) is discharged
geometrically in §2.1.

## 5. Escalation ladder per case (per dispatch)

(i) exact equality-ideal check (sympy Groebner + msolve, both engines):
    equalities E-MEC + E-PKT + gauge, saturated by pairwise Rabinowitsch
    separators; `[-1]`/GB={1} ⇒ KILLED with exact certificate (expected rare:
    windows are equality-underdetermined);
(ii) z3 QF_NRA on the full decorated system, timebox (first pass 60 s, then
    300 s on unresolved); UNSAT ⇒ KILLED-QFNRA (query file kept);
    SAT ⇒ extract model, attempt exact verification (Fraction/sympy);
    verified exact witness ⇒ realizable minimal window (major finding, kills
    the per-type hope for τ);
(iii) enlarge window only if (i)/(ii) resolve fast; uniform timeout at
    minimal windows ⇒ STOP, report obstruction-D3-confirmed-at-minimal-scale.

## 6. Q2 composition semantics (token level)

Pattern model = the census/D3 admissibility (census554_lib.py style,
generalized cap profile): labels {U,V,W} + interiors; caps S,O1,O2 closed
(each contains its two endpoint vertices); profile (c_S,c_{O1},c_{O2}),
all ≥ 4, two ≥ 5, n = ΣcapSizes − 3 ∈ {12..16}; class map K, |K(p)| = 4,
p ∉ K(p); C2 (|K(p)∩K(q)| ≤ 2), C4 (pair in ≤ 2 classes), FULL H1 (per Moser
vertex, per containing cap: ≤ 1 hit in cap minus itself — leaf-derivable at
all three vertices per `SurplusM44Packet.lean:423` + report §2). Type of a
non-Moser center c in cap X with left/right caps per the cyclic convention:
m = |K(c) ∩ {U,V,W}|, s = |K(c) ∩ int(X) ∖ {c}|, l = |K(c) ∩ int(left)|,
r = |K(c) ∩ int(right)|; reflected canonical form min((m,s,l,r),(m,s,r,l)).
Q2 asks: SAT of {admissible pattern, no non-Moser center's canonical type
∈ K} for n = 12..16, K = Q1's killed set.
