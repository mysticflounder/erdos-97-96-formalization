# `cardGeThirteen` ingress-coupling checkpoint v2

Date: 2026-09-03  
Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`

## Executive status

The original comparison of two arbitrarily chosen ingress packets had four
equality/inequality cases. That is no longer the preferred formulation.

The source-faithful normalization is to choose deletion witnesses rather than
inherit arbitrary choices. For a good outside source `s`, use the two-element
deletion universe

```text
D₀ = {F.pair.q, F.pair.w}
```

and let `O(s)` be the nonempty subset of `D₀` whose deletion preserves the
actual selected shell at `β(s)`.

**Important correction:** `goodOutsideSources R` is defined using
`F.pair.q/F.pair.w`, not `R.interior_q/R.interior_w`. No equality between
those pairs is stored in `OriginalUniqueFourResidual`. The normalized ingress
route must therefore use the `F.pair` deletion pair, or use a neutral
`CommonDeletionTwoCenterPacket` when working with the interior pair.

## Source-valid packet kernel

For a good source `s` and an admissible deletion `d ∈ O(s)`:

1. the actual selected shell at `β(s)` survives deleting `d`;
2. `surface.secondApex_robust` supplies survival at `S.oppApex2`;
3. `surface.secondApex_robust.centerAt_ne` gives
   `β(s) ≠ S.oppApex2`;
4. `Problem97.ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket`
   therefore constructs a common-deletion packet at centers
   `β(s)` and `S.oppApex2`.

The stored ingress can be prescribed to a particular deletion only after a
small source adapter; the existing source-specific ingress theorem chooses its
own `q` or `w` arm. A neutral packet construction has no such problem.

Separately, the mandatory ingress row `surface.ingress.packet.B₂` can be lifted
under `hnoFive` to a full ambient `SelectedFourClass` at `S.oppApex2`.
This justifies the planned `IngressAlignedTwoRadiusRows` interface, but that
interface is not needed for the finite coupling theorem below.

## Correct normalized case split

Let

```text
G = goodOutsideSources R
β(s) = the actual blocker of s
C(s) = the actual selected shell at β(s)
O(s) = {d ∈ {q,w} | d ∉ C(s)}.
```

Assume the current source supplies `5 ≤ G.card`.

Exactly one of the following occurs.

### A. Source-rich three-center common deletion

There are distinct `s,t ∈ G`, with `β(s) ≠ β(t)`, and a deletion
`d ∈ O(s) ∩ O(t)`.

The rows at `β(s)`, `β(t)`, and `S.oppApex2` all survive deleting `d`.
Their centers are pairwise distinct, so they produce
`ThreeCenterCommonDeletionExactRows`, together with the stronger facts that
the first two rows are actual source shells and that both sources are good
outside sources.

### B. Complementary two-blocker good-source normal form

Assume no pair as in A exists. Equal blockers have equal selected supports,
so `O(s)` is constant on each blocker fiber.

- There are exactly two blocker values.
- Their omission sets are the complementary singletons `{q}` and `{w}`.
- Each blocker fiber has cardinality at most three.
- Consequently `G.card` is five or six.
- The fiber-size multiset is `{2,3}` or `{3,3}`.
- A size-three blocker shell is exactly its three source points plus the
  opposite retained point.
- A size-two blocker shell contains its two source points, the opposite
  retained point, and one additional completion point.

The key size-three bound is strict: a four-source fiber with omission set
`{q}` would force its common four-point shell to contain all four sources and
`w`, and symmetrically for `{w}`.

The accompanying exact classifier checks every canonical blocker partition and
every nonempty deletion-set assignment for source counts five through eight.
Survivors exist only at five and six, with exactly the stated normalized types.

## Cardinality sharpening under audit

The ingress producer appears to derive five good outside sources from:

```text
actual first-apex blocker fiber card ≤ 4
badOutsideSources card ≤ 3
ambient card ≥ 12.
```

If the underlying argument is factored without weakening, it should give

```text
D.A.card ≤ (goodOutsideSources R).card + 7.
```

Then the live `12 < D.A.card` yields `6 ≤ G.card`, and
`13 < D.A.card` yields `7 ≤ G.card`.

Since outcome B forces `G.card ≤ 6`, this would imply:

```text
14 ≤ D.A.card  ->  source-rich three-center common deletion.
```

The only no-three-center cardinality would be `D.A.card = 13`, with the exact
`3+3` complementary two-blocker residual. This is especially valuable if the
existing exact-card-13 certified ingress can dispatch that one finite branch.

This source cardinality factor is the current decisive audit gate. It has not
yet been credited as a Lean theorem in this checkpoint.

## Lean formalization sequence

The following tasks have been routed to the luna-swarm agents, without touching
the live sorry:

1. `IngressAlignedTwoRadiusRows`.
2. A prescribed-omission neutral common-deletion packet.
3. The pure two-element deletion-set normalization.
4. The finite five-good-source classification in this checkpoint.
5. A source adapter to `ThreeCenterCommonDeletionExactRows`.
6. The source cardinality theorem
   `D.A.card ≤ goodOutsideSources.card + 7`, if the existing producer proof
   supports it.

The earlier pinned-two-radius-row good-source selector is **not source-valid**
at the current interface: first-apex contamination is bounded per radius, not
globally across the two radii, and the bad-source definitions use different
retained pairs.

## Remaining mathematical terminals

Even after the case split is formalized, neither output is currently a proved
contradiction.

- The three-center arm lacks a current terminal using only three surviving
  rows plus source-goodness.
- The complementary two-blocker arm is a new bounded five/six-source residual.
  Its deletion-survival matrix is stronger than the earlier isolated
  equal-blocker countermodels and should be compared against the B1,
  FirstNonHit, and two-deletion consumers.

The case split is nevertheless a genuine reduction: it replaces an
arbitrary-cardinality, arbitrary-profile obligation by one source-rich
three-center packet and one bounded five/six-source normal form.
