# Exact-five three-center tight-cover closure plan

Date: 2026-09-01

Lane: `exactfive-threecenter-tight-cover-20260901`

Base revision: `ac3f31c5fe45c9143af0a7db3d2e28ec4c1c7018`

## Target

The immediate target is
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical`.
It is one of the three on-spine leaves introduced by commit `30c24541b`.
The lane must not add another `sorry` or increase the effective on-spine
frontier, currently 28 declarations.

## First source consequence

The target supplies three selected four-class supports with union cardinality
eleven.  The retained source lies in the first two supports.  Since the three
supports have twelve total occurrences, this forces:

- the first two supports to intersect exactly at the retained source;
- the first and third supports to be disjoint; and
- the second and third supports to be disjoint.

In particular, the explicit target hypothesis placing the retained source
outside the third support is redundant for this alias conclusion.

`ExactFiveDistinctThreeCenterTightCover.intersections_of_card_four_union_card_eleven`
proves the generic finite-set statement.  Its specialization
`tightPhysical_support_intersections` extracts the result from the live normal
form.  A bounded cross-project Lean search found no reusable declaration for
this exact cardinality argument.

The follow-on theorem `tightPhysical_support_partition` removes the retained
source and gives three pairwise-disjoint residual blocks of cardinalities
three, three, and four.  The theorem
`tightPhysical_carrier_eq_insert_deleted_partition` then uses the source
deletion identity to decompose the full carrier as:

```text
deleted + retained + first-row residual(3) + blocker-row residual(3)
  + second-apex row(4).
```

It also proves that the deleted point is outside the eleven-point remainder.
All of these declarations are kernel-checked and contain no admitted step.
Their axiom closures contain only `propext`, `Classical.choice`, and
`Quot.sound`.

## First-apex radius collapse

The normal-form orientation and the exact-five residual give a stronger
metric identification:

- `deleted` and `retained` are distinct members of the exact first-apex
  radius class;
- that five-point class is exactly `insert deleted K₀`; and
- uniqueness of the first-apex four-class radius forces the retained-deletion
  packet's first row to be exactly
  `insert deleted (K₀.erase retained)`.

These facts are proved by
`tightPhysical_deleted_retained_mem_firstApexClass`,
`tightPhysical_firstApexClass_eq_insert_deleted`, and
`tightPhysical_retainedPacket_firstRow_eq_insert_deleted_residual`.  Their
axiom closures again contain only the three core quotient/classical axioms.
Thus the physical packet does not contribute two arbitrary rows: its
first-apex row is fixed by the `1+1+3+3+4` partition.  Only its second-apex
row can carry new incidence information.

The companion theorem
`tightPhysical_retainedPacket_cross_inter_card_le_two` records every
different-center overlap bound between the packet rows and the three normal
rows.  This is source-proved finite input, not a solver assumption.
The theorem
`tightPhysical_retainedPacket_firstRow_disjoint_normalOthers` strengthens the
two relevant bounds to disjointness.

The retained blocker row also carries exact negative information.  The
orientation identifies its center with `H.centerAt retained`, and
`tightPhysical_blockerClass_eq_exactSelectedClass` identifies its support
with the full critical-shell radius class.  Thus every carrier point outside
that four-set has a proved unequal distance from the retained blocker.  The
computational source must preserve these negative row facts; treating all
three normal rows as arbitrary positive four-subsets would discard a live
critical-shell hypothesis.

Convex independence now contributes a concrete source anchor as well.
`exists_firstApexResidual_mem_capInterior` combines the exact five-point
first-apex class with the cap-interior lower bound to produce a point in the
first residual triple, distinct from both `deleted` and `retained`, that lies
in `S.capInteriorByIndex S.oppIndex1`.  Thus the reduced packet contains at
least three distinguished sources in that cap interior: `deleted`,
`retained`, and one member of the first residual triple.  This declaration is
kernel-checked; its axiom closure contains only `propext`,
`Classical.choice`, and `Quot.sound`.

At the exact-twelve endpoint the cap budget is now fully frozen.
`tightPhysical_exact_cap_profile` proves that the surplus, first opposite,
and second opposite closed caps all have cardinality five, so both opposite
strict interiors have cardinality three.  The first five-point radius class
fills the entire first opposite interior, and
`exists_firstCapInterior_eq_triple` identifies that interior exactly as
`{deleted, retained, third}` for a source `third` in the first residual
triple.  These are source-proved consequences of convexity and robustness;
the finite ingress must treat the balanced `(5,5,5)` cap profile and this
named interior triple as fixed data rather than rediscovering them by search.

The second-apex metric freedom also collapses.  At a five-point opposite cap,
full deletion robustness rules out an exact-four ambient radius class and
rules out two distinct K4 radii.  Accordingly,
`nonempty_tightPhysical_secondApexUniqueFive` produces a unique positive
second-apex K4 radius with complete class cardinality five.
`tightPhysical_secondRows_inter_card_ge_three` proves that the normal row and
any retained-deletion witness row are four-subsets of that class and overlap
in at least three points.  The sharp form
`exists_tightPhysical_secondRows_eq_or_union_uniqueFive` says that they either
coincide, or have three-point intersection and union equal to the complete
five-class.

This does **not** turn the retained packet into a new invariant incidence
source.  Its rows are existential witnesses selected from already-known
first- and second-apex deletion robustness; different packet constructors can
choose different four-subsets of the same five-class.  The target packet is
therefore logically redundant for the global contradiction unless a consumer
uses only its survival facts.  `nonempty_retainedPacket_of_normalForm` proves
this redundancy directly from the two robustness fields.

The structure `BalancedTightCoverInvariant` packages the source-invariant
remainder—exact carrier and row partitions, exact retained critical shell,
balanced cap profile, named first interior triple, and unique second-apex
five-class—without retaining either arbitrary packet row.
`nonempty_balancedTightCoverInvariant` constructs it from only the cardinality,
tight-union, and carrier-erasure hypotheses; the historical explicit retained
omission and retained packet arguments are not used.  The remaining closure
problem is the balanced `(5,5,5)` tight cover itself, not an arbitrary
packet-row overlap search.

## Blocker-cap localization

The balanced invariant now supplies the source-side middle-center envelope
without assuming an exact choice of four points from the second-apex
five-class.  The two physical apex rows each meet the surplus cap in at most
one point.  Since the five-point surplus cap is covered by the first residual,
the three-point blocker residual, and the second row, the blocker residual
must contain exactly three surplus-cap points.  The declarations are:

- `balancedTightCover_blockerClass_inter_surplusCap_card_eq_three`;
- `balancedTightCover_blocker_not_mem_surplusCap`; and
- `balancedTightCover_blocker_mem_roleEnvelope`.

The second declaration combines the exact three-point intersection with the
general cap-row bound: a selected four-class centered inside a cap can meet
that cap in at most two points.  The third then uses cap trichotomy, the two
physical center inequalities, and blocker/source separation to prove

```text
blocker ∈ {surplusApex} ∪
  ((first-opposite interior \ {retained}) ∪ second-opposite interior).
```

At the balanced profile this is exactly the conservative six-location
middle-center envelope.  This closes the blocker-location item in the later
468-cell source specification.  It does **not** prove the specification's
stronger exact first/second row decompositions.  The `K₁` complement identity
is discharged in the next checkpoint using the same cap budget.

## Surplus-hit complement bridge

The tight cover does force the part of the proposed role packet that depends
only on the surplus cap.  The new theorem
`balancedTightCover_apexRows_inter_surplusCap_card_eq_one` proves that the
first residual and the second-apex row each meet the five-point surplus cap
in exactly one point.  Since the residual blocks are disjoint, these two
points are distinct.  The aggregate theorem
`exists_balancedTightCover_surplusCap_rowHits_blocker_eq_complement` chooses
them as `firstHit` and `secondHit` and proves

```text
blockerSupport =
  {retained} ∪ (surplusCap \ {firstHit, secondHit}).
```

Thus the proposed `K₁` complement identity is now source-proved without
assuming either stronger apex-row decomposition.  The active tight-cover
leaf constructs the balanced invariant and consumes this aggregate theorem,
so the declarations are present on the refreshed kernel spine rather than
being detached helpers.  The focused `Rigid221Closure` build passed at
proof-blueprint build `4c3a33ed1491`; the aggregate theorem's axiom closure
is exactly `propext`, `Classical.choice`, and `Quot.sound`.  The global
frontier remains 28 on-spine declarations and zero off-spine declarations,
and the anchored subtree remains one open leaf.

Independent verifier `exact12_complement_proof_review` re-read the effective
instruction chain and checked this source state at HEAD
`1ac138b49b403f02793b34845d2c71be142453f9`.  It reran
`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure`,
queried the aggregate theorem's literal axiom closure, and checked its live
consumer with proof-blueprint.  Verdict: the aggregate theorem is proven and
consumer-reachable; the target remains deliberately open because the bound
role data do not yet yield `False`.

Two stronger report-level identifications are not consequences of the
current invariant:

- the first residual contains the named first-interior third and its unique
  surplus-cap hit, but nothing yet proves that it contains `surplusApex`;
- the second row is a four-subset of the unique five-point second-apex class,
  while the full class contains the three-point second interior, but nothing
  yet proves that the normal four-row contains all three interior points.

The first missing first-row premise can be stated as the metric incidence
`dist surplusApex oppApex1 = firstApexRadius` (or directly as surplus-apex
membership in the first residual).  The first missing second-row premise is
`secondInterior ⊆ secondApexClass.support`.  Until one of these is derived
from the live geometry, a finite ingress must retain the remaining unnamed
row roles instead of hard-coding the proposed `C₀` and `C₂` forms.

For this checkpoint the finite first-coordinate submeasure

```text
(apex surplus-hit counts, hit alias, blocker residual ambiguity)
```

falls from `(at most one, unknown, arbitrary three-set)` to
`(exactly one, distinct, exact complement)`.  This is a strict source-role
reduction, but it does not reduce the one open tight-cover leaf and therefore
claims no closure credit.

## Flexible role packet

The source-supported remainder of the proposed role normal form is now a
single Lean object,
`BalancedTightCoverFlexibleRolePacket`.  Its constructor
`nonempty_balancedTightCoverFlexibleRolePacket` strengthens the surplus-hit
bridge in exactly the two directions justified by cardinality:

```text
firstResidual = {firstInteriorThird, firstHit, firstOther}
secondRow = {secondHit} ∪ secondRemainder
```

Here `firstOther` is distinct from both named first-row points and lies
outside the surplus cap.  The second remainder has cardinality three and is
disjoint from the surplus cap.  The packet also retains the exact singleton
surplus intersections, distinctness of the two cap hits, the blocker-support
complement identity, and the forced bound

```text
2 ≤ |secondRow ∩ secondOppositeInterior|.
```

The last bound is the strongest second-interior conclusion forced by the
current data: the four-point normal row and the three-point interior are both
subsets of one five-point complete radius class.  Their overlap is therefore
at least two, but can still omit one interior point.  Similarly, the unnamed
`firstOther` cannot be identified with `surplusApex` without a new metric or
incidence premise.  The packet deliberately preserves both freedoms.

The live exact-twelve leaf now constructs and consumes this packet before its
single existing admitted step.  The focused closure build passed at
proof-blueprint build `f8a4ca4ea6a1`.  Proof-blueprint reports both the packet
constructor and the second-interior lower bound on the live spine, and the
constructor's literal axiom closure is exactly `propext`,
`Classical.choice`, and `Quot.sound`.  The rooted subtree still has one open
obligation; this checkpoint packages a sharper finite ingress but does not
prove the endpoint.

Independent verifier `exact12_flexible_packet_review` audited the working
tree at HEAD `3e5eafe0170e8e02822d72b71a5e9d4c2e526e3d`.  It checked the
opposite-index argument, both cardinality decompositions, every packet field,
the direct consumer edge, and the two focused Lean modules.  Verdict: the
local derivation and source-faithfulness pass; endpoint closure does not pass
because the consumer still ends in its one pre-existing `sorry`.

This closes the alias ambiguity among the three physical rows.  It does not
yet supply the equal-distance closure or the global convex/order input needed
by a finite collision consumer.

## Balanced boundary labeling

`Balanced555BoundaryLabeling` now freezes the convex boundary coordinates of
the balanced cap profile without imposing either of the two unsupported row
identifications.  Its label bijection is induced by the inverse index carried
by `Census554.GeneralCarrierBridge.BoundaryIndexing`, rather than by an
unrelated cardinality labeling.  The associated point map is injective, has
image exactly `D.A`, and is counterclockwise convex.

Cutting the boundary at the surplus apex gives exactly two orientations.  In
the direct orientation the three cap interiors occupy labels `{1,2,3}`,
`{5,6,7}`, and `{9,10,11}` in second/surplus/first order, with the first and
second opposite apices at labels `4` and `8`.  The mirror orientation swaps
the first and second blocks and apex labels while leaving the surplus block
fixed.  In both orientations the surplus apex has label `0`.

`nonempty_balanced555BoundaryLabeling` derives this object from
`BalancedTightCoverInvariant`.  It uses the existing zero-cut boundary theorem,
the exact twelve-point carrier cardinality, and saturation of all three
three-point open intervals.  The active exact-twelve leaf now consumes this
labeling together with `BalancedTightCoverFlexibleRolePacket` before its single
existing admitted step.

This is source-side ingress only.  It does not reduce the open frontier: the
next finite layer must combine the fixed boundary labels, faithful selected-row
semantics, the flexible role packet, and the still-unfixed row roles in a named
source-backed surface.  No solver closure is claimed until a checked finite
certificate and its Lean consumer are both present.

The focused build of `Balanced555BoundaryIngress` and `Rigid221Closure` passed
at proof-blueprint build `3cbaed067306`.  The constructor's literal axiom
closure is exactly `propext`, `Classical.choice`, and `Quot.sound`; the mined
caller graph places both the constructor and its exact-twelve caller on the
live spine.  The global frontier remains 28 on-spine declarations and zero
off-spine declarations.

Independent verifier `balanced555_boundary_promotion_review` checked the
index-derived labeling, both orientation calculations, exact block
saturation, boundary-property transport, and the direct live caller.  Verdict:
the source-side promotion passes.  The verifier also confirmed the intended
scope boundary: `boundaryLabeling` and `rolePacket` are presently ingress
objects bound immediately before the existing `sorry`, not yet inputs to a
terminal finite contradiction.

## Balanced source configuration and finite contract

`Balanced555SourceConfiguration` now combines the boundary-compatible labels
with one faithful all-center selected-four-class pattern.  The selected
classes at the first apex, retained blocker, and second apex are exactly the
three normal-form classes.  Its derived API proves the exact three pinned
finite rows, the Euclidean realization, the generic exact-four/source-cube
constraints, and shared-pair alternation in the fixed cyclic labels.  The
focused module build passed at proof-blueprint build `14580fcce1d4`.

The corrected finite specification has also been reconstructed independently.
For each orientation it has 1,656 pinned source roots and five two-Kalmanson
families with 49,104 raw occurrences, 10,122 impossible antecedents, and
38,982 effective clauses.  The report's historical 50,657-clause CNF cannot
be authenticated: 544 non-Kalmanson clauses were never disclosed.  This lane
therefore uses a fresh source-minimal schema with 148 variables and 50,113
clauses, new hashes, and no claim of byte compatibility with that historical
formula.

`Balanced555FiniteConfiguration` is the Lean-side finite contract.  It keeps
the orientation, relabeled selected classes, exact cap distribution,
tight-cover partition, cyclic alternation, and Euclidean realization needed
to justify every generated clause.  The flexible-role packet is not an input:
the corrected root enumeration uses only consequences already present in
`BalancedTightCoverInvariant`.

The source constructor now builds this configuration with no admitted or
native proof step.  The first generator draft was rejected before solver use:
it had the wrong atom ledger and a synthetic contradictory Kalmanson pair.
The repaired generator has an independent semantic audit, 12 passing focused
tests, and the exact clause inventory above.  Its direct and mirror formulas
have SHA-256 digests
`f7337dc542b563c9bc3bff2460d749ea76d5e71c9975868d68688338c93751a3`
and
`4df1dc9bf6ce13d7a7148fe90954bd5f8e249ed5a895424c58c4419d2ea50cee`.
Both 9,151-clause structural positive controls are SAT under PiQD.  Both full
formulas are UNSAT under PiQD/CaDiCaL `plain`, with zero RAT lemmas: direct job
`4c1a5491-968b-4ba6-84e7-3e50da11eed0` finished in 10.536 seconds and produced
LRAT SHA-256
`82bb9120fc6d78ca8f018a70d1309fb2b3ad59d22500955d929c21f79fd33c59`;
mirror job `86287b50-c044-4e7d-9271-ee5e3a598ebb` finished in 12.372 seconds and
produced LRAT SHA-256
`963acaf45dfd250791001658f69a1b628a312db8e91053c5d1adda36df17ce9a`.
The direct proof has now been normalized to a pure-RUP source, split into 77
bounded windows, and emitted as the authenticated compact replay package with
SHA-256
`b83f6e91f056d7ce81ed5c00375e7473359536aa78ac2c38220da06d2b967e67`.
The generated 158 Lean modules and 154 compact payloads build through
`Balanced555DirectReplay.startUnsatisfiable`. A checked atom reflection maps
the direct formula to the mirror formula, so the mirror LRAT remains custody
evidence but is not duplicated in the production replay tree.

The semantic ingress is complete. `Balanced555FiniteFormula` reconstructs the
exact 50,113-clause formula, supplies checker-valid Kalmanson occurrence
witnesses, and proves each Kalmanson no-good under the source valuation.
`Balanced555FiniteStructuralSatisfaction` and its two focused helper modules
prove the remaining nine clause families. `Balanced555FiniteUnsat` combines
that valuation with the replay verdict and reflection transport.

## Reuse preflight

The first concrete global candidate is
`ConvexPerpendicularBisectorSides.false_of_three_distinct_equidistant_carriers`.
It consumes convex independence and rules out three distinct carrier centers
that are all equidistant from the same two distinct carrier points.  The
source/import revision is the lane base `ac3f31c5f`.

The candidate does not yet apply.  The normal-form rows have intersection
pattern `{retained}`, empty, empty, so they cannot themselves supply the
required common pair.  The first packet row is fixed and adds no new cross-row
incidence.  The retained packet's second row has the four-of-five dichotomy
above, but because that row is an arbitrary witness choice, it cannot supply a
source-invariant common pair.  A materially strengthened theorem-bank search
found no trusted `False` consumer: the apparent exact-row endpoint is one of
the current admitted leaves, while `ExactFiveCommonAdaptiveReselection`
applies to the common-obstruction-center residual rather than this distinct-
center residual.  The first missing antecedent remains a global ordered or
metric consequence of the balanced tight cover.

## Closure checkpoint

All three former gates are complete. The target
`false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical` now calls
`Balanced555FiniteUnsat.false_of_balanced555FiniteConfiguration` and contains
no `sorry`. Its focused `Rigid221Closure` build passed at proof-blueprint build
`93f7a22e1159`. The target-rooted spine is `0/1154` open; the effective global
on-spine frontier outside this closed root fell from 28 to 27. Its exact axiom
closure is the three standard core axioms plus the repository-approved native
boundary `Lean.ofReduceBool` and `Lean.trustCompiler`.

The next mathematical work is therefore one of the two distinct-fresh leaves,
not further computation on this exact-twelve cell.

## PiQD interface audit

The installed piqd source was audited at revision `cccc723`.  The daemon has
incremental Z3/cvc5 SMT sessions, named assumptions, unsat-core and replay
receipts, raw-CNF custody, and campaign execution.  Its typed metric ingress
does not yet accept this packet: `MetricProblem` supports only the fixed
`CapConcentration` shape, with fixed cardinality and labels.  SMT sessions do
not provide a shared typed model with exact source-semantic replay, and the
campaign layer does not derive source-aware refinements or case matrices.

The finite ingress is now explicit enough for PiQD's raw-DIMACS lane.  The
repository-local generator owns the source-semantic clause inventory and
positive controls; PiQD owns byte custody, solver execution, and automatic
DRAT/LRAT capture. The separate Lean source valuation, exact formula identity,
checked certificate replay, and live consumer have now been supplied. PiQD
remains the custody and solver layer; theorem-facing semantics stay in Lean.

## Frontier measure

Use the ordered deficit

```text
(row-alias ambiguity, missing metric/order closure, open tight-cover leaf).
```

The first coordinate falls from unknown overlap patterns to the unique
singleton/disjoint pattern, and the third coordinate is now zero for the
exact-twelve tight-cover leaf.

## General carrier row-system adapter (2026-09-03)

The faithful-carrier adapter now exports the source-backed finite row-system
surface used by the balanced exact-twelve cell.  In particular,
`GeneralCarrierAbstractRowSystem.system_sharedPairAlternating` transports the
geometric shared-pair separation theorem through the carrier labels and a
compatible boundary indexing.  The same module also supplies pair codegree at
most two, source coverage from the critical-shell blocker section, and the
support-minimal/strong-connectivity consequences.  The adapter and its live
consumer `Balanced555SourceConfiguration.sharedPairAlternating_selectedAt`
build under the governed workflow and are axiom-clean apart from the standard
Lean core axioms.  This closes an adapter gap; it does not close the remaining
distinct-fresh exact-five leaves, whose obstruction is still geometric.
