# First-fiber nested-consumer audit (2026-08-10)

## Declarations audited

`Problem97.Census554.NestedEqualChordCore.metric_orientation_incompatibility`
(`lean/Erdos9796Proof/P97/Census554/NestedEqualChordCore.lean:110-123`) needs
`o ≠ a`; radial equalities `oa=ob`, `oa=oc`, `oa=od`; chord equalities
`oa=ad`, `oa=bc`; and four strict positive signed areas
`o,a,d`, `o,b,c`, `a,b,d`, `b,c,d`.

`Problem97.two_circle_noncollinear_common_point_elim`
(`lean/Erdos9796Proof/P97/TwoCircleCrossing.lean:58-67`) needs distinct spheres,
distinct endpoints, both endpoints on both spheres, a third point on both, and
`signedArea2 p₁ p₂ q ≠ 0`.

## Active packet facts

`TwoCapSourceThirdCanonicalRowSurface` supplies two distinct source points,
each in its own exact-four support, and each source's canonical-row deletion
views (`TwoSourceCanonicalSurface.lean:112-145`).
Mutual cross membership supplies the reverse two support memberships
(`TwoSourceFreshThirdFiber.lean:1247-1252`).  Any support member gives only
`dist rowCenter point = row.radius` via `CriticalFourShell.support_eq_radius`.

`FreshThirdAlignedDistinctBlockerFirstCapResidual`
(`TwoSourceClosure.lean:2526-2552`) adds distinct blocker centers/cap indices,
one first-cap exact two-source intersection, and an exact crossed-row packet.
`FreshThirdAlignedMutualBlockerBoundaryPacket`
(`TwoSourceClosure.lean:2555-2581`) adds cap memberships, three boundary labels,
direct-or-mirror zero-cut blocks, and a `btw` separation; it adds no Euclidean
signed-area facts.

`FirstFiberCrossedThreeRowExactSupports`
(`TwoSourceFirstFiberCollision.lean:534-571`) gives exact four-point support
sets and omission/non-first-cap facts.  It does not give chord lengths or
signed areas.  The derived alternatives can give
`commonFourth = oppositeFourth`, or only blocker inequalities
(`TwoSourceFirstFiberCollision.lean:792-892`).

## Mapping / blockers

### NestedEqualChordCore

The only plausible role map is one exact-four row:
`o := H.centerAt source`, with `a,b,c,d` chosen from its four support points.
The four radial premises `oa=ob`, `oa=oc`, `oa=od` are available by chaining
`support_eq_radius` (and `o ≠ a` can be obtained from `center_not_mem_support`).
No source-entitled fact supplies either required chord equality
`oa = ad` or `oa = bc`; support equality is radial, not pairwise chord
equality.  None of the packet/boundary fields supplies any of the four strict
positive signed-area premises.  Therefore this consumer is **not exactly
instantiable** from the active packet.  Missing inputs are at minimum the two
chord equalities and four signed-area inequalities (plus a fixed four-point
role/order witness).

### TwoCircleCrossing

For the mutual source rows, the conditional map is:

* `s₁ := ⟨H.centerAt C.firstSource, K₁.radius⟩`,
  `s₂ := ⟨H.centerAt C.secondSource, K₂.radius⟩`, where `Kᵢ` are the exact-four
  shells.
* `p₁ := C.firstSource.1`, `p₂ := C.secondSource.1`; `p₁ ≠ p₂` is
  `C.sources_ne`.
* Endpoint membership on both circles follows from each row's `q_mem_support`
  and mutual cross membership, converted with `support_eq_radius`/`mem_sphere`.
* Distinct spheres follows from distinct blocker centers in the distinct-blocker
  residual (center inequality implies sphere inequality).

This map has no third common point in the general crossed packet: `commonOutside`
is deliberately omitted from the opposite row and `oppositeOutside` from the
common row.  In the special derived branch
`commonFourth = oppositeFourth`, that common fourth can serve as `q`, with
membership on both rows obtained from the two exact support equalities.
However, the required `signedArea2 p₁ p₂ q ≠ 0` is absent.  The boundary packet's
`btw` statement is only an index-order proposition and has no source theorem
connecting it to signed area.  Thus the two-circle consumer is **conditionally
instantiable only after** (i) selecting the shared-fourth equality branch and
(ii) producing a geometric off-chord/noncollinearity lemma; otherwise its first
missing premise is the third common point, and in all cases the strict
orientation premise is missing.

The active packet therefore exposes useful circle-membership producers but not
either contradiction consumer's complete hypotheses; no promotion/closure is
justified.
