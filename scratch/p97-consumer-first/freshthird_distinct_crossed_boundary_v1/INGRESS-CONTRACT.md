# FreshThird distinct-crossed boundary v1 ingress contract

Date: 2026-08-10

Status: **STOPPED BEFORE ENCODING AS A DUPLICATE CAMPAIGN.**  This document
freezes the requested source ingress and records why it does not authorize a
new solver wave.  It is not a counterexample, a universal closure, or a Lean
closure.

## Live source ingress

The proposed finite abstraction may use only the following ordinary Lean
data.

| Source declaration | Location | File SHA-256 |
|---|---|---|
| `FirstFiberCrossedThreeRowExactSupports` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean:534` | `c0e84b82b292e4a8c7fb718fcfc5ac7225b41b208ddd66cd5ea9c51d7f16a6f8` |
| `FreshThirdAlignedDistinctBlockerFirstCapResidual` | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean:2526` | `df5f81953b0343a725bddd6739ab58b00ab8759bb201d43b7a3992cfb2590a27` |
| `FreshThirdAlignedMutualBlockerBoundaryPacket` | same file, line 2555 | same |
| `freshThird_alignedMutualBlockerBoundaryPacket` | same file, line 2583 | same |
| `FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_selectedRowOmissionSaturation` | same file, line 2757 | same |

The exact-support structure contributes the three named selected-row support
equalities, its named fourth points, their carrier/first-cap exclusions, and
the crossed nonmemberships.  The residual contributes distinct source
blockers, two distinct cap indices with one equal to the first cap, the exact
source-pair/first-cap intersection, and the crossed packet.  The boundary
packet contributes only its direct/mirror blocks and cyclic separation.  The
saturation theorem contributes its proved shared-fourth or selected-row
omission disjunction.

Explicitly forbidden are a common radius, equality of the two blockers,
`AllCollisionEndpointsOmitted`, aliases between Q roles and apex/grid roles,
unsupported center-to-row incidence, and an exact carrier cardinality used as
if it were universal.

## Intended Lean landing

A successful wave would have to produce a complete source-level adapter to
one of these existing consumers:

1. `FivePointEuclideanObstruction.false_of_five_ccw_two_selected_rows`
   (`FivePointEuclideanObstruction.lean:633`): five increasing boundary roles
   plus the two positive row-incidence patterns `{a,e}` and `{a,b,d}`.
2. `CapCrossingKalmanson.false_of_selected_rows_in_five_ccw_order`
   (`CapCrossingKalmanson.lean:380`): one shared order `O<A<Y<E<C` plus six
   positive incidences across three selected rows.
3. `SixPointTwoCircleOrderCore.false_of_core`
   (`SixPointTwoCircleOrderCore.lean:459`): five `EdgeClosure` equalities and
   seven compatible signed orientations for six roles.

The live ingress supplies exact supports and some cyclic separation, but it
does not force any of those complete antecedents.  In particular, omissions
from actual-blocker rows do not imply the positive hits needed by the
five-point consumers, and the boundary packet does not imply the five
edge-closure paths and seven orientations needed by the six-point consumer.

## Duplication gate

The materially new model requested for this directory would have had to put,
in one coordinate system, the crossed exact rows, shared cap/boundary order,
aligned singleton/rich classes, and blocker exactness.  That exact coupling is
already the ingress of:

`scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/`.

Its prerequisite structural campaign
`freshthird_aligned_mutual_crossed_v1/` was validated SAT by Z3 and cvc5 even
with the target positive producers negated.  The metric campaign and its
post-consumer-map v5 audit then tested the shared-coordinate endpoint: the
best five-row role maps supplied only 6 of 10 required equality edges, and no
complete six-point/two-circle map was found without degenerate aliases.  The
later equality-path v5 campaign retained closure-clean dual-solver survivors
in every source-faithful tag.  These results are summarized authoritatively in
`docs/computational-closure-plan-2026-07-28.md`, especially the FreshThird
sections around lines 6268--6310 and 6740--7225 (plan SHA-256
`95707a834caf23399633fb894899b672ff07ccde17cc008cf5436ac9711c408c`).

Therefore a new incidence/order or shared-coordinate SMT instance here would
repeat an exhausted abstraction rather than test a new source theorem.  Per
the plan's no-duplicate rule, no solver input is authorized and no solver was
launched.

## Authorization needed for a future wave

Before another finite wave, ordinary Lean must add at least one uniform
positive producer that closes a named consumer gap: a positive actual-blocker
row incidence, a source-exact edge-closure path, or a boundary-order theorem
locating all consumer roles in one required chain.  Merely adding more
omissions, a larger cyclic-order matrix, or an exact-`n` bound is insufficient.
