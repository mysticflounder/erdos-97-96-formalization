# Math Skeptic Audit: Exact-five mutual-return chord

**Target**: `docs/audits/2026-09-06-exactfive-mutual-return-chord.md` (entire note), and §3c of `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md`
**Date**: 2026-09-06
**Verdict**: CERTIFIED
**Claims audited**: 11 major claims

## Summary

The chord inequality, the short-admissible-pair proposition for at least four
interior anchors, and their conditional contradiction consumer have complete
pen-and-paper proofs under the geometric inputs listed in the note. Both
equilateral placements are accounted for, endpoint aliases are excluded, and
the normalization follows from the actual source hypotheses. There is no
missing freshness, override, or minimum-pair premise in this proof.

Certification is limited to these paper deductions and the inspected
interfaces of their geometric inputs. It does not certify a new Lean theorem,
a transitive axiom graph, a live terminal reduction, or unconditional
exact-five closure. The three-interior-anchor short-pair question and transport
of a minimum-pair payload into the live consumer remain open.

## Findings

### F1: The raw-row primitives accept arbitrary authenticated interior pairs

- **Location**: target note:35–56, §1.
- **Quote**: "They do not require a fresh source or a change to H."
- **Stated label**: Source-checked conditional geometric inputs.
- **Evidence present**: The six primitive declarations listed in §1.
- **Actual label**: PROVEN interface-level deductions from the listed inputs;
  source statements inspected, without a new kernel trust audit.
- **Verdict**: OK.
- **Reason**: The localization, nonacute inequality, radius drop, exterior
  distance inequality, and supporting-triangle inequalities quantify over
  arbitrary distinct u,v in the stated interior intersection, a carrier center
  c distinct from O, and equal-distance equations. The cap-row cardinality
  theorem takes an arbitrary selected four-class at a center in that cap.
  Neither a source selected through H nor physical freshness is a primitive
  guard. Two authenticated memberships and the bound of two cap members give
  the exact cap intersection. The exterior distance and triangle inequalities
  then give the stated E and Safe intersections. Membership in E alone is not
  being substituted for interior membership.

Inspected sources under `lean/Erdos9796Proof/P97/`:

- `ATail/FirstApexInteriorPairGeometry.lean:129`, `:313`, and `:333`;
- `CapSelectedRowCounting.lean:399`;
- `ATail/FirstApexInteriorPairCirclePower.lean:319` and `:675`.

### F2: Mutual incidence identifies radii and excludes endpoint aliases

- **Location**: target note:60–69, §2.
- **Quote**: "their radii both equal dist(b,c)."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: b ∈ Kc, c ∈ Kb, and e ∈ Kc ∩ Kb, with positive radii.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: Symmetry of distance identifies the two radii. The shared e then
  supplies the other two equal positive sides of triangle b,c,e. The equality
  b = e is impossible. If b is the opposite endpoint, polarization gives
  inner product ρ²/2 > 0 at c, contradicting the raw nonacute inequality.
  Therefore b is neither endpoint; the exact cap intersection puts b outside
  the closed cap. All five points used in subsequent convex-independence
  arguments are distinct: positivity separates row centers from row members,
  the alias argument separates b from q,w, and robustness of O separates it
  from both actual blocker centers.

### F3: The affine cap functional has the required signs

- **Location**: target note:71–80, §2.
- **Quote**: "Thus L(q),L(c) > 0 and L(O),L(b) < 0."
- **Stated label**: PROVEN from cap definitions and triangle nondegeneracy.
- **Evidence present**: The signed-area formula and the two cited sign lemmas.
- **Actual label**: PROVEN, pen-and-paper from the authenticated cap predicates.
- **Verdict**: OK for the carrier points used in the proof.
- **Reason**: With P,Q the supporting chord endpoints, signedArea2(x,P,Q) is
  affine in x. Negating its product with the nonzero constant
  signedArea2(O,P,Q) gives L(O) equal to minus a nonzero square. Interior
  carrier membership gives positive L, and outside-cap carrier membership
  gives negative L. In particular b is a carrier point, as required by the
  outside-cap theorem. No assertion about arbitrary non-carrier points follows
  from membership outside a finite carrier cap.

The exact namespace is `Problem97.SurplusCapPacket`; `SurplusM44Packet` names
the module tree. The inspected declarations are
`SurplusM44Packet/Shard02.lean:297` and
`SurplusM44Packet/Shard01.lean:653`.

### F4: The coordinate normalization and bounds follow from the hypotheses

- **Location**: target note:84–97, §3.
- **Quote**: "Thus 0 < k < h."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: Positive similarity, bisector equations, strict radius
  drop, convex independence, and the nonpositive inner product.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: The endpoint relabeling changes no symmetric hypothesis. After
  normalizing q,w, radius drop rules out O at their midpoint. Reflection thus
  permits O = (0,−h), h > 0. The bisector equation places c = (0,k), with
  |k| < h. A nonpositive k puts c on the segment from O to the chord midpoint,
  inside the convex hull of other carrier points. This is forbidden even at
  k = 0. Finally the inner product is k²−1, giving k ≤ 1. No order between O
  and c has been assumed without proof.

### F5: The two equilateral placements exhaust the possibilities

- **Location**: target note:99–101, §3.
- **Quote**: "The two equilateral placements for b are"
- **Stated label**: PROVEN, pen-and-paper algebra.
- **Evidence present**: The two displayed coordinates with s = √3.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: Rotating c−q = (1,k) through either sign of 60 degrees about q
  gives precisely the displayed upper and lower points. A positive-side
  equilateral triangle in the plane has exactly these two third vertices.

### F6: The upper placement is impossible

- **Location**: target note:103–113, §3.
- **Quote**: "The upper placement is impossible."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: The affine decomposition with α,β,γ and its sign split.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: Direct substitution verifies both coordinates and
  α+β−γ = 1. The established h+k > 0 gives γ > 0; α > 0 as well. If β ≤ 0,
  the expression for q has nonnegative coefficients summing to one and uses
  distinct other carrier points. Convex independence therefore forces β > 0.
  Applying an affine functional is legitimate because the coefficients of
  b sum to one, despite the negative coefficient of O. Every term in
  αL(q)+βL(c)−γL(O) is positive, contradicting the authenticated sign of L(b).

### F7: The lower placement forces the strict chord inequality

- **Location**: target note:115–125, §3.
- **Quote**: "Therefore h < √3"
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: The displayed convex combination under h ≥ √3.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: From 0 < k ≤ 1 and √3 < 2 one gets |(√3k−1)/2| < 1/2.
  Under h ≥ √3, the displayed δ satisfies 0 < δ < 1/2. Hence both remaining
  coefficients are strictly positive. They sum with δ to one and reproduce
  both coordinates of blower. Since b differs from O,q,w, this contradicts
  convex independence. Thus r² = 1+h² < 4, giving r < 2 in normalized
  coordinates. Similarity scales the chord and radius by the same positive
  factor, preserving the claimed strict inequality.

### F8: Distances from the second apex are injective on I

- **Location**: target note:129–138, §4.
- **Quote**: "Distinct points of I have different distances to the second apex V."
- **Stated label**: PROVEN, pen-and-paper under the same source data.
- **Evidence present**: The common-physical-pair localization primitive and
  exclusion of supporting-triangle vertices from the strict cap interior.
- **Actual label**: PROVEN, pen-and-paper from the authenticated geometry.
- **Verdict**: OK.
- **Reason**: Two distinct I points share their positive O-radius. If they
  shared a V-radius, the localization theorem would put V into the strict
  cap interior, because V is a carrier point distinct from O. But V is a
  supporting-triangle vertex, excluded from every strict cap interior.
  Thus each V-radius class contains at most one I point. The relevant
  interfaces are `ATail/TwoCenterCapLocalization.lean:122` and
  `SurplusM44Packet/Shard02.lean:179`.

### F9: At most one unordered pair of I destroys K4 at V

- **Location**: target note:140–148, §4.
- **Quote**: "Any other bad I pair must hit both classes, so it is the same unordered pair {u,v}."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: F8, ambient K4 at V, and full single-deletion robustness
  of V from the physical normal form.
- **Actual label**: PROVEN, pen-and-paper.
- **Verdict**: OK.
- **Reason**: A bad pair must meet every rich V-class. By F8 it removes at most
  one member of each, so every such class has exactly four members. Two
  deleted points meet at most two different radius classes. There cannot be
  just one rich class, since its four members would make V nonrobust. Hence
  there are exactly two rich four-classes, containing respectively u and v
  as their only I members. Any bad pair from I must therefore be {u,v}.
  This covers all radius multiplicities: classes of size at least five or
  three distinct rich radii cannot survive this bad-pair premise. The source
  robustness field is `ExactFiveDistinctThreeCenterNormalForm.secondApex_robust`
  in `ATail/ExactFiveDistinctThreeCenterContinuation.lean:71`.

### F10: Four interior anchors supply a short jointly admissible pair

- **Location**: target note:150–172, §4.
- **Quote**: "so at least two gaps are at most 45 degrees."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: The MEC cone-containment theorem, the nonobtuse apex
  angle, F9, and the actual admissible-pair definition.
- **Actual label**: PROVEN, pen-and-paper from the authenticated geometry.
- **Verdict**: OK.
- **Reason**: `exists_cone_coeffs_of_cap_region` in
  `Cap/ConeContainment.lean:202` takes the MEC center as its parameter O,
  the physical first apex as its parameter c, and the two supporting chord
  endpoints as a,b. Boundary, carrier-disk, cap-side, and nondegeneracy guards
  are all supplied by `S.circPacketByIndex` and the cap predicates. The
  packet's `inner_at_v1` makes the positive cone's opening at most 90 degrees.
  Every I ray is nonzero; distinct I points have distinct rays because their
  common radius is positive. Ordering four rays gives three positive adjacent
  gaps whose sum is at most 90 degrees. If two gaps exceeded 45 degrees their
  sum alone would exceed that bound, so two distinct adjacent pairs have
  chord at most 2r sin(22.5 degrees) < r. F9 leaves at least one jointly
  surviving pair. The inspected `admissibleInteriorPair` definition in
  `ATail/MinimalAdmissibleInteriorPair.lean:43` requires exactly interior
  membership, distinctness, and this joint V-survival. Its minimum-pair field
  therefore passes the same chord bound to a minimum admissible pair.

The supporting packet fields were checked in
`CircumscribedMECPacket.lean:83` and
`SurplusM44Packet/Shard01.lean:303`; the MEC radius was not confused with r,
the first-apex radius.

### F11: The corollary and active-plan use retain their missing antecedents

- **Location**: target note:174–219, §§4–6; active plan §3c:302–329.
- **Quote**: "The reverse incidence c ∈ Kb is essential to the proof"
- **Stated label**: PROVEN conditional corollary; CONJECTURED / open for
  three-anchor short-pair entitlement, live source transport, and closure.
- **Evidence present**: The chord theorem and explicit separation of the
  reverse incidence, double hit, admissibility, and dependent-state obligations.
- **Actual label**: PROVEN, pen-and-paper for the conditional contradiction;
  CONJECTURED / open for the remaining source and terminal claims.
- **Verdict**: OK.
- **Reason**: Adding dist(q,w) ≤ r contradicts F7 immediately. Neither a
  one-way old-blocker incidence nor the global cut supplies the mutual-return
  premise. The note does not claim a short chord for an arbitrary ordinary
  pair, preserve a dependent residual after changing that pair, or eliminate
  omission and non-mutual cases. For three rays at 10,20,89 degrees the pair
  gaps are 10,69,79 degrees, so only the first chord is at most r. Marking
  that pair bad defeats this angular argument; it is correctly described as
  an angular/deletion diagnostic rather than a full-source geometric model.
  F9 authenticates the stated two-rich-class description if such a bad pair
  exists. Plan §3c reproduces these qualifications and does not transport the
  minimum-pair payload merely from its existence.

## Weasel words

No unsupported WLOG or omitted symmetry step remains. The relabeling has its
explicit symmetry justification. The coordinate substitutions, normalization
guards, positivity claims, and the exhaustion of the two placements have
been checked rather than accepted as unsupported algebraic shorthand.

## Scope conflation

The note distinguishes raw-row geometric inputs, the new paper proofs, and
the missing physical consumers. It does not infer a fresh source, new H,
pair admissibility, or a decreasing actual-row radius from mutual incidence.
Actual row radii are equal in the return; the new conclusion is a bound on
the original source chord relative to its original apex radius.

## Lean sorry graph

No Lean file was edited, built, or newly axiom-audited for this certificate.
The listed declarations were inspected as conditional source inputs. No
compiling theorem or transitive `sorry`-free closure is claimed for the new
chord result. The existing physical terminal remains outside this
certification and is explicitly open in the note and plan.

## Upgrade drift

The stronger chord inequality has the complete proof audited in F2–F7, and
the new admissible-pair proposition has the proof audited in F8–F10.
It is not inferred solely from the retained Pro response, whose weaker
conclusion was c ∉ E. The response's SHA-256 was recomputed and matches the
note. The completion matrix gives the new result a paper label and does not
upgrade physical closure or Lean promotion.

## Required before CERTIFIED

Nothing further for the paper proofs under their stated geometric inputs.
Three-interior-anchor entitlement, minimum-pair transport, omitted-endpoint
and non-mutual cases, and Lean promotion require their own mathematics and
validation.
