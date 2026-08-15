# Ingress contract

## Inherited exact scope

This round imports the frozen v2 implementation from
`../post_core_cut_v2/` only as a read-only schema reference and inherits the
complete incidence and metric ledger recorded there.  In particular it retains:

- exactly 17 carrier points and cap profile `(8,6,6)`;
- the direct crossed constructor only;
- the exact P, Pρ, C-source, and Q rows and crossed omissions;
- exact first-cap D44 slices equal to P/Pρ up to swapping;
- canonical-source separation from both multi-point D44 slices;
- carrier-wide K4 witnesses, actual-blocker row locking, and minimality
  incidence constraints; and
- one shared coordinate pair per carrier point in the metric stage.

Nothing is imported from a six-center schema.  The two deletion constructors
and reversed crossed constructor remain out of scope.

## Preserved aligned singleton cut

The preserved source theorem is
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned`
in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean`.
It proves, for either aligned canonical source `c`,

```text
SelectedClass A firstApex (dist firstApex c) ∩ strictFirstCap = {c}.
```

The aligned consumer packet instantiates this theorem separately at its first
and second canonical sources.  Consequently, if the chosen four-point K4
support at the first apex contains either source, every other point of that
support must lie outside the strict first cap.  `incidence_round.py` encodes
this implication for both sources, every possible first-apex index, and every
carrier point before solving.

This direction is sound for a chosen K4 support: membership of the source makes
the support's common radius exactly `dist firstApex source`, and the singleton
theorem then excludes every distinct strict-cap member.  No converse is used.

## New exact-six rich-support cuts

The exact-17 source theorem `twoCapSourceSurface_exact_seventeen_cap_profile`
fixes closed-cap cardinalities `(8,6,6)`: the first indexed cap has eight
points, while cap indices 1 and 2 have six.  The new constraints are nevertheless
emitted generically with an explicit `card(cap[i]) = 6` guard.

For a D44 branch, the licensing theorem is
`Problem97.ATailExactFifteenApexProfile.selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`.
Its antecedent is: convex independence, a selected four-class at the indexed
opposite apex, two distinct positive rich radii with each full class of
cardinality at least four, and closed-cap cardinality six.  Under the
`rich_two_arm[i]` encoding these are precisely the D44 arm conditions.  The
conclusion identifies the *full* selected support with one rich class.

For an S6 branch, the licensing theorem is
`Problem97.ATailExactFifteenApexProfile.selectedFourClass_support_subset_richSixClass_of_cap_card_eq_six`.
Its antecedent is: convex independence, a selected four-class at the indexed
opposite apex, a positive rich radius whose full class has cardinality at least
six, and closed-cap cardinality six.  Under `not rich_two_arm[i]` these are the
S6 arm conditions.  Its direct conclusion is support containment.  The
projected support also has at least two points: the selected support has four
points, lies inside the rich six-point class, and adjacent-cap localization
permits at most two points of that class outside the strict cap.
The latter bound uses
`selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps` together with
`leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` and
`rightAdjacentCap_at_opposite_card_le_one_of_convexIndep`.

The solver does not represent either full rich class.  `rich_slice[i][arm]`
is exactly its intersection with the strict indexed cap.  The admitted
projections therefore are:

- D44: the selected K4 support intersected with the strict cap equals arm 0 or
  arm 1;
- S6: the selected K4 support intersected with the strict cap is a subset of
  arm 0 and has cardinality at least two.

No full-support equality with a two-point D44 slice is asserted.  Both cuts are
branch-guarded, so neither profile is assumed globally.  The extracted packet
records the branch at each nonfirst exact-six cap.

## Validation and controls

- The parent structural validator checks roles, exact rows, Q row, cap
  composition, blockers, K4/minimality, rich slices, and crossed orientation.
- The v3 validator independently recomputes the first apex singleton overlap
  and, at every exact-six cap, the branch-correct D44 equality or S6
  subset-with-cardinality-lower-bound projection.
- The original pre-v2 assignment must still be rejected by the singleton cut.
- The v2 packet must be rejected because its exact-six D44 opposite-apex K4
  supports cross the two stored rich arms.
- Tiny SAT and malformed-UNSAT artifacts smoke-test both Z3 and cvc5 wrappers.
- Metric malformed controls contradict boundary orientation, a K4 equality,
  D44 radius distinctness, and a source singleton.

## Deliberate omissions

The encoder still lacks a complete extraction from all original P97 and
`CriticalShellSystem` hypotheses, including all anonymous deletion packets and
all minimality consequences.  It also lacks constructor coverage, assignment
coverage, cardinality coverage, and a general-cardinality lift.  Thus:

- SAT is only a model of the encoded packet, not a P97 counterexample;
- UNSAT rejects only this bounded packet or fixed assignment, not the live
  universal residual; and
- solver evidence is not a kernel-checked Lean theorem.
