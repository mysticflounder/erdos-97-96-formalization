# Exact-six mutual MEC / `noM44` direct audit

Date: 2026-07-18

Status: **KERNEL-CHECKED RETRIANGULATION OBSTRUCTION. NO DIRECT `False`; NO
PRODUCTION `sorry` CLOSED.**

This report is intentionally narrower than the existing full-parent mutual
equal/distinct-blocker audits. Those reports already establish that the
displayed packet is not `IsM44`, so `R.noM44` is inert on the current support
triangle. The result here tests the first genuinely different triangle one
would naturally try to construct from the mutual exact-five data.

## New checked result

`PhysicalTripleMECBoundary.lean` proves:

```lean
not_nonobtuse_of_three_distinct_physicalVertices
exists_third_physicalVertex_and_not_nonobtuse
```

Every three distinct `PhysicalVertex profile`s lie on one circle centered at
`S.oppApex2`. If their triangle were non-obtuse, the standard circumcenter
lemma would put `S.oppApex2` in their convex hull. The apex and the three
sources are four distinct carrier points, contradicting convex independence.

In particular, the two sources of

```lean
M.pair : PhysicalActualCriticalMutualOmissionPair H profile
```

have a third physical exact-five source, but every such completion is obtuse.
Thus the most immediate alternative support triangle cannot be a
`MEC.NonObtuseCircumscribedMoserTriangle`, even before proving MEC-boundary
membership or computing its cap sizes. Any useful `noM44` retriangulation must
use at least one carrier point outside this physical exact-five radius class.

Both declarations compile with `-DwarningAsError=true` and have axiom closure

```text
[propext, Classical.choice, Quot.sound]
```

only.

## Exact role of `noM44`

At this boundary,

```lean
R.noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
```

is global, but the current `S` is already non-`M44`: both large-cap hypotheses
give cap cardinalities at least six. Therefore `noM44` contributes only after
constructing a genuinely different MEC-boundary non-obtuse support triangle
and proving that some orientation of its cap partition has two exact-four
opposite caps. The checked result above excludes the obvious all-physical
candidate family.

## Direct target and first missing theorem

The target should remain direct and full-parent:

```lean
theorem false_of_fullParentExactFiveMutualData_of_secondCap_card_eq_six
    (M : FullParentExactFiveMutualData L profile)
    (hcap : S.oppCap2.card = 6) : False
```

For a `noM44` proof, its first new geometric step must construct internally a
different support packet

```lean
T : SurplusCapPacket D.A
T.IsM44
```

whose triangle contains at least one point outside `physicalVertices profile`.
It must then close immediately with `R.noM44`. A conditional "candidate
triangle" packet without the MEC-boundary, non-obtuse, and exact-cap proofs is
not progress toward this endpoint. The alternative is a direct contradiction
from the full MEC/full-radius-filter data, without routing through `noM44`.

## Constraint manifest for an exact feasibility test

The two existing regressions split the currently uncombined layers:

- `../cap-local-transport-model/` is an exact symbolic strict-convex,
  unique-MEC, cap-order, no-`M44`, exact-five, two-blocker model with both
  reciprocal hits absent, but its cap profile is `(5,8,4)` and it omits global
  all-center K4 and a total source-faithful critical map.
- `../global-mutual-distinct-blocker-terminal/` has the source-faithful finite
  blocker rows and missing reciprocal hits (including exact-six-style cap
  incidence), but is explicitly not Euclidean and not a `CounterexampleData`
  realization.

An exact coordinate feasibility test is informative only if it combines all
of the following in one model:

1. strict convexity and one cyclic order for the entire carrier;
2. one actual non-obtuse circumscribed MEC triangle, its exact cap partition,
   `S.oppCap2.card = 6`, and both cap-six lower bounds retained by `L`;
3. the unique exact-five full radius filter at `S.oppApex2`, including every
   physical source and the continuation's unused source identity;
4. one total source-faithful `CriticalShellSystem`: for every source, the
   actual blocker is a carrier point, the selected support is the complete
   exact four-point radius class, and `no_qfree_at` holds;
5. global all-center K4, and `D.Minimal` or an exact witness-closed-subset
   formulation if minimality is used;
6. the mutual pair's two negative cross incidences, the chosen deletion, both
   common-deletion survivals, and both actual blocker arms, with no anonymous
   replacement rows;
7. the original first-apex frontier `F₀`, bi-apex robustness, both cap bounds,
   and `R.noM44`;
8. exact equalities and strict inequalities for every full distance filter,
   not only four selected representatives; and
9. universal `noM44` coverage over every carrier triple that is non-obtuse and
   lies on the MEC boundary, together with every surplus orientation. With a
   proved unique MEC, exhaustive carrier triples/permutations are sufficient.

A SAT result for this combined system would block the proposed direct theorem
and provide a source-faithful regression. UNSAT is useful only with a
checkable certificate or after extraction of a short mathematical core that
can be replayed in Lean.

The two existing regression checkers were replayed at this checkpoint:

```text
PASS: exact cap-local cross countermodel matches checkpoint.json
PASS: canonical four-center incidence/cap scope is compatible
scope only: not Euclidean and not a CounterexampleData realization
```

These are not independence claims. They show why neither local MEC geometry
alone nor finite row incidence alone can supply the missing terminal.

## Preflight and exclusions

The required general-n registries, sibling/legacy certificate inventories,
and `nthdegree docs search --lean` index were searched before theorem work. No
existing direct exact-six mutual MEC/`noM44` theorem was found; the banked
consumers require positive shared-pair or cross-row incidence not present at
this surface.

The current production `ShellCurvature` wrapper was not used. Its endpoint is
under separate repair and, even after repair, a finite-window curvature fact
would need to feed the direct full-parent terminal above rather than create
another conditional packet.
