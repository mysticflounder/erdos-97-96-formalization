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

This closes the alias ambiguity among the three physical rows.  It does not
yet supply the equal-distance closure or the global convex/order input needed
by a finite collision consumer.

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

## Next gates

1. Express the reduced balanced tight cover, including the fixed first-apex
   five-class, exact first interior triple, exact retained critical shell,
   unique second-apex five-class, convex independence, global `K4`,
   row-center semantics, cyclic/order data, and every retained omission.
   Treat a SAT result as a missing-source-hypothesis diagnosis, not as a
   theorem failure.
2. Do not encode stored packet rows as independent source data.  If witness
   rows are retained for replay, enforce their proved four-of-five dichotomy
   and distinguish witness selection from invariant survival facts.
3. If the complete packet is UNSAT, retain the proof artifact and promote a
   checked finite certificate through a named Lean consumer.
4. Wire that consumer into the target and require the effective on-spine
   count to fall from 28 to 27 before proceeding to the two distinct-fresh
   leaves.

## PiQD interface audit

The installed piqd source was audited at revision `cccc723`.  The daemon has
incremental Z3/cvc5 SMT sessions, named assumptions, unsat-core and replay
receipts, raw-CNF custody, and campaign execution.  Its typed metric ingress
does not yet accept this packet: `MetricProblem` supports only the fixed
`CapConcentration` shape, with fixed cardinality and labels.  SMT sessions do
not provide a shared typed model with exact source-semantic replay, and the
campaign layer does not derive source-aware refinements or case matrices.

Consequently this lane will not replace the missing ingress with another
Python runner.  A computational attempt must use shared piqd/producer
infrastructure and declarative B1 source data.  Until exact source assertions
and their replay boundary are explicit, no solver result can discharge the
Lean target.

## Frontier measure

Use the ordered deficit

```text
(row-alias ambiguity, missing metric/order closure, open tight-cover leaf).
```

The first coordinate falls from unknown overlap patterns to the unique
singleton/disjoint pattern.  No closure credit is claimed until the third
coordinate falls from one to zero.
