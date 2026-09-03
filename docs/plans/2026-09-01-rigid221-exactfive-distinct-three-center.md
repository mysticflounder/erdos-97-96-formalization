# Exact-five distinct bi-apex three-center continuation plan

Date: 2026-09-01
Lane: `rigid221-exactfive-distinct-three-center-20260901`
Base revision: `b8502b2c065c67aaf670adb0f1bd03bf2c8427a0`

## Governed target

- Publish target: `Problem97.erdos97_rhs`.
- Anchored residual for this lane:
  `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_biApexRobust_postCardEleven`.
- Immediate caller: private
  `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_commonDeletion`.
- Public caller:
  `Problem97.ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual`.
- Target source: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`.
- Lake root: `lean/`; toolchain: `leanprover/lean4:v4.27.0`.

The proof-blueprint reference graph currently omits the private caller edge and
therefore refuses this anchor as off-spine. The versioned private-edge registry
records the actual source path. This plan treats the theorem as load-bearing.

## Reuse and rejection audit

The current theorem bank has no closed consumer for the target. The physical
second-apex split closes its critical arm, but its robust arm is exactly this
residual. The common-center adaptive reselection theorem has the wrong input
direction.

The dangerous-triple proposal is rejected. A selected four-class centered away
from the first apex meets the exact-five first-apex class in at most two points,
so no sound producer can place three of those points in either packet support.

The common-deletion-parent robust-cap continuation is also unavailable: its
positive first-apex double-deletion field conflicts with the obstruction field
carried by the exact-five distinct residual.

## Source-faithful reduction

Resolve the supplied orientation into a deleted interior source, a retained
interior source, and the retained source's selected blocker center. Let:

- `K₀` be the selected four-class at the first physical apex obtained by
  removing the deleted source from the exact five-point radius class;
- `K₁` be the common-deletion packet's first selected four-class; and
- `K₂` be its physical-second-apex selected four-class.

The retained source belongs to both `K₀` and `K₁`. Hence the union of the three
four-point supports has cardinality at most eleven. Second-apex deletion
robustness and the exact-five cap bounds give carrier cardinality at least
twelve, so a carrier source exists outside all three supports.

The existing support-preserving constructor
`Problem97.ATailThreeCenterCommonDeletion.nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses`
then gives three exact rows, at the first apex, retained blocker, and second
apex, surviving deletion of that fresh source.

Split the retained source's membership in `K₂`:

- if absent, first-apex robustness and `K₂` produce a physical-apex
  common-deletion packet at the retained source;
- if present, the three selected four-classes share that source and form a
  `RobustApexThreeRowSurface`; the existing exhaustive producer returns a
  tagged five-incidence continuation, with the saturated incidence pattern
  already excluded by its planar terminal.

The new no-`sorry` producer is
`Problem97.ExactFiveDistinctThreeCenterContinuation.nonempty_normalForm`.
The single successor obligation is
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenterNormalForm`.

## Frontier measure

Use the lexicographic deficit

```text
(missing support-preserving fresh three-center deletion,
 unresolved retained-source / three-row incidence positions).
```

Before the change, the first coordinate is `1`: the target carries only one
two-center deletion packet and no fresh source outside the three exact
supports. After the producer, the first coordinate is `0` in every outcome,
because the exact support-preserving three-center deletion is a field of the
normal form. The second coordinate is also narrowed by the retained-source
membership split; the included arm records one concrete missing-incidence
constructor from the exhaustive five-way continuation.

Thus the unchanged target can discharge to one strictly stronger successor;
constructor fan-out at the coordinator remains one. This is not a closure
claim for `Problem97.erdos97_rhs`.

## Successor coverage

The successor remains `OPEN_MATHEMATICAL` and is covered by this plan. Its two
typed outcomes require:

1. a consumer for the fresh three-center deletion together with the additional
   physical-apex packet in the retained-source-omission arm; and
2. cap-sensitive consumers for the five tagged robust-apex missing-incidence
   constructors in the retained-source-inclusion arm.

The similarly shaped exact-four consumer in `Rigid221SourceHeavy.lean` still
contains an independent open obligation and has incompatible residual data; it
must not be used as closure evidence here.

Promotion requires a focused module build, a build of the original public
caller, refreshed spine evidence with the private-edge limitation stated,
literal axiom audits, hygiene checks, and independent verification.

## Implemented checkpoint

The producer and adapter are implemented at the working-tree revision based on
`b8502b2c065c67aaf670adb0f1bd03bf2c8427a0`.

- `Erdos9796Proof.P97.ATail.ExactFiveDistinctThreeCenterContinuation` builds;
- `Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure` builds;
- `Erdos9796Proof.P97.UpstreamBridge` builds; and
- `#print axioms` for `nonempty_normalForm` reports only `propext`,
  `Classical.choice`, and `Quot.sound`.

The original theorem now calls exactly the single planned successor. The
successor remains the lane's one authored `sorry`; no closure claim is made.
After `proof-blueprint index --refresh` and `refs --refresh`, `spine
Problem97.erdos97_rhs` lists
`false_of_exactFiveDistinct_threeCenterNormalForm` among its open obligations.
The `verify-publish` off-spine scan nevertheless labels the same declaration
off-spine. This is the previously observed private-caller classification bug,
not evidence that the successor is disconnected. The publish gate still fails,
as expected, because `Problem97.erdos97_rhs` reaches `sorryAx` through this and
other existing open leaves.

## Strict-source correction

The first checkpoint's cardinality argument supplied a point outside the three
row supports, but did not prove that point distinct from `deleted`: the original
deletion is itself outside all three rows.  Therefore `freshThreeCenter` in the
original normal form is sound but not genuinely fresh.

The corrected producer
`Problem97.ExactFiveDistinctThreeCenterContinuation.nonempty_strictThreeCenterAlternative`
splits on whether `D.A.erase deleted` is contained in the three-row union.

- If containment fails, an escaping point is automatically in `D.A`, outside
  all three supports, and distinct from `deleted`; it produces an exact
  three-center deletion packet at a genuinely new source.
- If containment holds, support containment gives equality between
  `D.A.erase deleted` and the row union.  The carrier lower bound and the
  eleven-point union bound force cardinalities twelve and eleven.  The
  five-incidence alternative would put `retained` in the third row as well,
  lowering the union bound to ten and contradicting that equality.  Hence the
  tight branch necessarily carries the retained-source physical packet.

The former broad leaf
`false_of_exactFiveDistinct_threeCenterNormalForm` now has no direct `sorry`.
It dispatches to exactly three explicit on-spine obligations:

1. `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`;
2. `false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`; and
3. `false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical`.

Focused `lake-build` checks for the producer module and `Rigid221Closure`
succeed.  `proof-blueprint axioms` reports only `propext`,
`Classical.choice`, and `Quot.sound` for the strict producer.  Build
`724e9d3ae80e` shows all three corrected leaves on the kernel spine and no direct `sorry`
on `false_of_exactFiveDistinct_threeCenterNormalForm`.  The private-caller
miner defect described above has since been repaired; it no longer affects
the spine classification.

## Five-incidence cyclic reduction

The retained-source-inclusion leaf previously accepted
`RobustApexFiveIncidenceContinuationPacket`. Its continuation exposed five
possible first missing incidences but erased the preceding positive tests.
The ranked RVOL follow-up identified a strictly smaller source surface.

Four positive incidences already contradict convex cyclic order:

```text
c₁ ∈ row₀,  O ∈ row₁,  O ∈ row₂,  c₁ ∈ row₂.
```

Indeed, `row₀,row₂` share `a,c₁`, while `row₁,row₂` share `a,O`.
Shared-pair separation produces the rotated matchings

```text
separatedPair O c₂ a c₁
separatedPair c₁ c₂ a O,
```

which `separatedPair_rotated_incompatible` excludes. The test
`c₂ ∈ row₁` is therefore irrelevant to the live frontier.

The new neutral packet `RobustApexFourIncidenceContinuationPacket` retains a
boundary indexing, the three support identities, both non-apex common-point
memberships, and one of four prefix-preserving constructors. The producer is
exhaustive and introduces no admitted proof. The coordinator converts the
old five-incidence packet to this packet before calling
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`.

This changes the second coordinate of the recorded progress measure from five
unresolved incidence positions to four, with constructor fan-out still hidden
inside the one existing on-spine admitted endpoint. No new obligation is
created. The four remaining positions are:

1. `c₁ ∉ row₀`;
2. `c₁ ∈ row₀` and `O ∉ row₁`;
3. the preceding positives and `O ∉ row₂`;
4. the preceding positives and `c₁ ∉ row₂`.

Current theorem-bank search finds no complete consumer for any of the four.
In positions 3 and 4, the common-deletion packet at centers `O,c₂` admits the
standard physical-second-apex robust/critical split; its critical arm reaches
the existing swapped exact-four closure, while the robust arm remains. Since
the normal form already records second-apex robustness, this observation does
not yet close either position. The next strict reduction must supply new
source synchronization or a second order constraint, not another generic
Kalmanson identity.

## Pro-consult execution plan

Consult `01M1JEJSNZY1VD0JPJ86W15MX1` verifies that the physical/source-swap
reselection is the next source-entitled factorization, but not a closure.  The
execution order is deliberately falsification-first:

1. Reuse the existing import-safe conversion
   `qDeletedK4ClassToSelectedFourClass` and its
   `qDeletedK4Class_deleted_not_mem_support` theorem; the theorem-bank
   preflight found that no new adapter is needed.
2. Prove a finite selector that trims a positive selected class of cardinality
   at least five to four points while avoiding two points at unequal center
   distances.
3. Package and prove
   `exactFiveDistinct_secondApex_physical_or_hardSourceSwap` without changing
   the admitted target.  Its interface must take the five-incidence premise
   `normalForm.retained ∈ normalForm.secondApexClass.support` explicitly;
   this fact is not a field of the bare normal form.  The hard packet must
   retain positive distinct radii, exact full-class equalities, disjoint
   supports, the `a`/`d` source swap, and the statement that every positive
   second-apex class has cardinality below five.
4. Formalize the source-facing cut-bit transport for the actual zero-cut
   separators `U`, `O`, and `c₂`, and construct the canonical first-apex row
   obtained by erasing the retained source from the exact-five class.  These
   are required to prove the branch-four replacement omission without adding
   source assumptions.
5. Extend the census generator to cover every source-entitled placement of
   the blocker `c₁` (including `c₁ = U`) and all admissible cross-row aliases.
   The existing 102,960-cell generator is retained only as a conditional
   collapsed-subcase diagnostic and must not be reported as the live census.
6. Run the corrected complete direct/mirror order and equality census for the
   branch-four exact-grid packet, followed by branch three.  Use PiQD with
   order-sign and known-UNSAT controls.  Escalate surviving cells from
   equality/Kalmanson constraints to planar distance-matrix and then
   source/MEC constraints only as needed.
7. If every order cell is UNSAT, minimize a common exact cancellation and
   formalize that certificate.  If a cell is SAT, retain it as a route
   counterexample and add only the missing source or MEC layer exposed by the
   survivor.
8. Independently close
   `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`; the generic
   physical reselection arm depends on that rank-two obligation.
9. Only after the census identifies a terminal should the two-full-class cap
   split and symmetric `oppIndex2` radial-crossing API be promoted.

The census does not address the first two incidence branches by itself.  A
grid UNSAT result would close only the corresponding hard source-swap arms;
explicit noncircular consumers for branches one and two remain required.  No
target rewrite is permitted until every constructor has a checked consumer,
so this plan never increases or relocates the current admission.

Steps 1--3 are now complete in the standalone module
`ExactFiveDistinctSecondApexSourceSwap.lean`.  Focused Lean checking and an
independent adversarial source audit pass.  The physical arm intentionally
returns an omitted selected row rather than claiming a common-deletion packet;
the first-apex survival needed to construct that packet remains the independent
rank-two boundary.  Execution therefore proceeds to the branch-four and
branch-three source adapters without rewiring the admitted endpoint.  The
first scaffold run corrected the proposed role map: `c₁` is the blocker, not
the surplus apex `U`, and cross-row aliases remain possible.  No live solver
run is authorized until steps 4--5 provide the source-complete cell space.

Step 4 is complete in the standalone source-swap module and
`FrontierLiveClosure/ExactFiveDistinctSecondApexSourceSwapCyclic.lean`.  The
canonical swapped first-apex row, direct/mirror cap-side transport, and the
branch-four theorem forcing the hard replacement row to omit `c₁` all build
without an admission.  Execution now stays on step 5: derive the exact-grid
source adapter and enumerate the unresolved `c₁` placements and cross-row
aliases before launching PiQD.

The structural front of step 5 is complete:
`hardSourceSwap_largeSecondInterior_or_exactAdjacentCapGrid` gives the precise
large-`oppInterior2`/exact-grid dichotomy directly from the hard source-swap
packet, with no exact-twelve assumption.  The unfinished part of step 5 is now
sharply limited to naming the exact-grid hits from the source incidences and
enumerating blocker placements plus aliases involving the other two rows.
The alternative large-interior arm has also been sharpened to the checked
bound `|A| ≥ 14` using the existing exact-five first-cap estimate and cap sum;
this improves the retained packet but does not by itself close the arm.

The adjacent grid's source roles are now identified as well: old-left `O`,
old-right `a`, replacement-right `d`, and a strict surplus-interior
replacement-left point `e`.  The next two concrete deliverables are (i) the
alias-only finite profile for the remaining points and (ii) the missing
`oppIndex2` radial-order/Kalmanson adapter.  Neither deliverable authorizes a
PiQD run until their combined order-cell space is complete.

The exact-grid source interface is now packaged as
`HardSourceSwapExactGridRoles`; its producer names the old and replacement
two-point interior slices and fixes the source hits `O`, `a`, `d`, and strict
surplus-interior `e`.  The remaining Lean prerequisite is therefore the
`oppIndex2` radial-order/Kalmanson adapter, rather than further grid-role
extraction.

The downstream consumer is complete conditionally: a `RadialCyclicOrder` for
the named hits implies `dist(e,d) < dist(e,a)` through strict Kalmanson and the
first-apex equality `dist(O,a) = dist(O,d)`.  Work should therefore construct
that order packet directly and avoid widening the finite census with an
unproved metric assertion.

The alias-only deliverable is now implemented and independently checked:
961 profiles have `c₁ = U`, 6,642 have `c₁ ≠ U`, for 7,603 unique canonical
partitions under the recorded abstract overlap rules.  This completes the
finite alias prefix only.  The next execution step remains the `oppIndex2`
radial cyclic-order constructor; afterward, combine each alias profile with
the source-authorized order cells before considering a governed PiQD run.
