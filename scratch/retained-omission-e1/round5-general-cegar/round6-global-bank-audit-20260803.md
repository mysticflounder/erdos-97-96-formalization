# Round 6 global theorem-bank audit (FreshThird exact-row packet)

Date: 2026-08-03
Scope: source/index/registry audit only; no production Lean edits or kernel gate.

## Verdict

**NO-GO.** The mandatory theorem-bank registries and indexed Lean corpus contain
no source-clean theorem that consumes the full `FreshThirdEqualCenterExactFourRow`
packet together with the noncanonical exact-overlap/cyclic data.  The live
normalized-residual terminal remains an explicit `sorry`, so the packet is a
positive branch description, not a contradiction.

## Live packet and open leaf

`FrontierLiveClosure.lean:10509-10524` defines
`FreshThirdEqualCenterExactFourRow`: equal cap-source centers, distinct fresh
center, and both selected supports exactly
`{C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}`.
`freshThirdEqualCenterExactFourRow_of_hits` (`:10531-10539`) is source-proved,
but only constructs this packet.  The noncanonical interaction constructors
(`:10430-10500`) add exact support overlap and cap-interior membership, yet do
not add a boundary order.

The closed distinct-center arm
`false_of_two_freshThirdCrossRowHits_distinctCenters` (`:10889` onward) does not
apply when the two cap-source centers are equal.  The first unresolved leaf is
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
(`:11217-11227`), whose body is `sorry`; the residual/coordinator wrappers below
it are therefore not closure.

## Existing consumers (near misses)

* **PROVEN (source body):**
  `selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers`
  (`FrontierLiveClosure.lean:10039-10047`) proves exact two-source support
  intersection from mutual cross-membership and distinct blockers.  It is an
  incidence lemma, not `False`.
* **PROVEN (source body, not a FreshThird adapter):**
  `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`
  (`ATail/CapCrossingKalmanson.lean:427-455`) derives `False` from two selected
  four-class rows whose centers and two shared supports occur in strict order
  `ia < ib < ic < id`, plus `ConvexIndep`, injective/image boundary, and CCW
  convexity.  `FrontierLiveClosure` reaches this module transitively through
  `EndpointFreshFiveRoleKalmanson -> KalmansonThreeEqualitySchemas`.
  The FreshThird packet supplies none of the required four-index order or
  boundary hypotheses.
* **PROVEN (source body, unimported from Frontier):**
  `Problem97.selectedFourClass_shared_pair_separated`
  (`Phase3SharedPairSeparation.lean:31`) gives cyclic alternation of a shared
  pair across two distinct rows, under an explicit global `boundary` and
  `indexOf` adapter.  `FrontierLiveClosure` has no import of this module, and
  the result is an alternation equivalence rather than a contradiction.
* **Definition only:** `ConvexCyclicOrder` (`ConvexCyclicOrder/Basic.lean:52-60`)
  packages exactly the missing four-point increasing order, but no theorem in
  the registries or indexed corpus proves it for the FreshThird centers/sources.

The appropriate candidate bridge is therefore a **new adapter**, not reuse of a
banked terminal.  In the equal-center both-hit arm let
`c := H.centerAt C.firstSource`, `q := H.centerAt Q.source₁`, and
`u,v := Q.source₁.1,Q.source₂.1`.  A sufficient (orientation-dependent)
hypothesis is `ConvexCyclicOrder D.A c q u v` (or the reversed compatible
orientation).  The adapter must export subtype values through `H.blockerVertex`,
prove `ConvexIndep D.A`, obtain injective/image/CCW boundary indices, and convert
the two critical shells to `SelectedFourClass D.A` rows before invoking the
Kalmanson terminal.  Cap-interior membership and exact overlap alone do not
imply this order.  The `Phase3SharedPairSeparation` theorem can certify
alternation after such an adapter, but cannot manufacture the needed consecutive
order.  `firstNonHit`/`secondNonHit` residual constructors remain untouched by
this equal-center consumer.

## Stronger v2 solver artifacts (external diagnostics only)

| artifact | status | packet fields |
|---|---|---|
| `equal-center-exact-row-incidence-v2.json` | **EMPIRICALLY VERIFIED** SAT, 4,980 ms (30 s timeout) | exact equal four-row support; exact Q overlap; noncanonical interaction; `cyclic_metric=false`; rows `[[q1,q2,s1,s3],[q1,q2,s1,s3]]`, Q sources `[s3,s1]` |
| `equal-center-exact-row-cyclic-v2.json` | **EMPIRICALLY VERIFIED** SAT, 26,067 ms (120 s timeout) | same exact/support/interaction constraints with `cyclic_metric=true`; rows `[[t3,q1,q2,s3],[t3,q1,q2,s3]]`, Q sources `[t3,s3]` |

Both files explicitly state the trust boundary “external Z3 only; bounded
`n=17` lane; no Lean/universal claim.”  SAT under these stronger bounded
incidence/order abstractions is not a contradiction and does not establish a
Euclidean realization or a general-`n` theorem.

## Registry and corpus census

The required inventories have zero matching declarations (literal/serialized
search for `FreshThird`, `normalized_residual`, `twoCapSources`, `Kalmanson`, or
`ConvexCyclicOrder`):

* `certificates/p97_rvol_general_n_mining.json`
* `certificates/erdos97_legacy_general_n_mining.json`
* `certificates/erdos_general_theorem_p97_mining.json`

The indexed search returns the live FreshThird structures/routers and generic
U1/U5 consumers, but no source-clean producer of the missing boundary/order
antecedent.  Registry labels and source scans are discovery evidence only;
transitive kernel/axiom closure was not run in this audit.

**First missing bridge:** a branch-preserving theorem deriving a compatible
`ConvexCyclicOrder`/strict boundary quadruple (and the required row/index
conversions) from the equal-center exact-row plus noncanonical interaction
fields.  Until that theorem is proved and wired to
`false_of_two_selected_rows_shared_late_pair`, the normalized residual stays
open.
