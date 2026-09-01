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
