# Exact-17 alias-aware five-survivor ingress contract

Status: diagnostic finite abstraction only.  This directory supplies neither a
universal ingress theorem nor a finite-to-general lift.

## Source arms represented

The live residual is
`FreshThirdAlignedDistinctBlockerFirstCapResidual` in
`FrontierLiveClosure/TwoSourceClosure.lean` (abbreviation near line 2179).
Only the first two alternatives of
`FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual` in
`FrontierLiveClosure/TwoSourceFirstFiberCollision.lean` (near line 1110) are
represented: delete `Q.source` or delete `Q.otherOutsidePoint`.  The two
crossed-three-row alternatives are deliberately out of scope.

The matrix has exactly eight tags:

1. active source orientation `first` or `second`;
2. deleted point `qsource` or `qother`;
3. first-apex survivor `B2 = R` or `B2 = Rh`.

## Exact named roles

There are exactly 17 anonymous carrier slots.  Every named point or center is
an integer-valued role in those slots; aliases are possible unless an explicit
source fact forbids them.  In particular, centers are not represented by fixed
numerals.

`C0..C4` are the five centers passed to
`FiveSurvivorExactRowsBoundary` (`FiveCenterDeletionBoundary.lean`, near line
95).  Their pairwise inequalities are encoded individually from the live
ambient robust/source packet, not attributed to that boundary structure.
`DB` is the actual blocker of the deleted point.  It is distinct from the
deleted point and all `C0..C4`; in the `qsource` arm, `DB = CP` comes from the
first-fiber blocker equality.  No arbitrary center/support-label injectivity is
assumed.

## Rows and incidence

- Every represented selected row has cardinality four.
- `PRow` is exactly `{P1,P2,Q0,Q1}`.
- `S0Row` and `S1Row` are the canonical source shells, contain both source
  points, and obey both cross-pair deletion views.
- `B0` is pointwise equal to the active canonical source shell.  Its first-cap
  trace is exactly `{S0,S1}`; it omits all four collision endpoints, the
  deleted point, and its own center.
- `B1` is pointwise equal to the `Pρ.source₁` canonical shell.  Its first-cap
  trace is exactly `{R1,R2}`; it omits the `P` pair, the deleted point, and its
  own center.
- No incidence is asserted between either `B0` or `B1` and the nondeleted
  outside `Q` point.
- `B2` is pointwise equal to `R` or `Rh`, following
  `fiveSurvivor_firstApexRow_eq_retained_and_deleted_not_mem`
  (`TwoSourceClosure.lean`, near line 987).
- `B3` and `B4` are independent exact-four q-deleted witnesses.  The encoder
  never equates their supports merely because two center expressions alias.
- `DBRow` records the actual blocker's original exact four-class and contains
  the deleted point, the incidence consequence of `actualBlocker_uniqueFour`
  plus `actualBlocker_fails`.
- Every pair of represented selected four-classes at unequal centers has
  support intersection cardinality at most two.  Equal centers do not imply
  equal supports.  `R` and `Rh` share their center and are explicitly disjoint
  because they are the two retained radii.

The q-deleted support/canonical-shell facts are the declarations
`qDeletedK4Class_support_eq_selectedShell` and
`qDeletedK4Class_deleted_not_mem_support` in
`FiveCenterDeletionBoundary.lean` (near lines 48 and 73).

## Rejected consumer predicates

The preflight forces each of these existing consumer interfaces from
`FirstFiberOverlapDescent.lean` separately:

- `false_of_firstFiber_explicit_overlap_card_ge_three`;
- `false_of_firstFiber_bothOutsideHits_and_firstPairHit`;
- `false_of_firstFiber_twoOutsideHits_of_capCenter`.

All three forced predicates are `UNSAT` in every tag.  This is expected from
the source map: distinct selected-class centers bound overlap with the first
collision row by two, excluding both three-point predicates, and the q-deleted
canonical shells exclude the deleted Q point.  These are not viable positive
producers for the deletion arms.  `B3` and `B4` are not treated as canonical
source shells.

`FiveRowCircleIntersectionOrderCore.false_of_core` is **not queried**.  The
five-survivor packet does not supply a source-exact map for its ten
`EdgeClosure` premises or its six signed cyclic orientations.  Inventing that
map would strengthen ingress.

## Deliberate omissions

- metric coordinates, distances, radii, cyclic order, and realizability;
- the ten equality closures and six orientations of the five-row order core;
- crossed-three-row constructors;
- anonymous global-K4 rows at every carrier point;
- any assertion that a bounded SAT/UNSAT result closes the universal Lean
  residual;
- any generic `SAT means closure` or `UNSAT means universal contradiction`
  endpoint.

Consequently the eight SAT results establish only consistency of the named
exact-17 ingress abstraction.  The 24 UNSAT results establish only that the
three rejected predicates contradict this same bounded ingress; neither result
is a universal Lean contradiction.
