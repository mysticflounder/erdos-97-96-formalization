# FirstFiber crossed-row Kalmanson audit (2026-09-02)

## Verdict

Do not add the proposed shared-fourth Kalmanson adapter to the Lean source yet.
The current source proves the six roles are distinct and supplies the three
required selected-row equalities, but it does not supply either cyclic order
accepted by the existing Kalmanson terminals.  The canonical closure plan also
records an exact rational strictly convex survivor in a different order.  A
conditional adapter would therefore add no strict reduction to the published
proof frontier.

This corrects the rank-2 recommendation in
`rvol-discovery-to-sorry-analysis-2026-09-02--01M1HWQY6A6NBAF6PTXT1V1188.md`.
That recommendation was explicitly conditional on a current-source order
audit.  The incidence half succeeds; the order half does not.

## Exact shared-fourth role map

For `E : FirstFiberCrossedThreeRowExactSupports ...`, assume
`hz : E.commonFourth = E.oppositeFourth` and set

```text
x  := commonOutside
y  := oppositeOutside
z  := E.commonFourth
c0 := H.centerAt P.source₁ P.source₁_mem_A
c1 := H.centerAt source.1 source.2
c2 := H.centerAt Pρ.source₁ Pρ.source₁_mem_A
```

The raw `302_401_512` consumer uses

```text
i0 = x, i1 = z, i2 = y, i3 = c0, i4 = c1, i5 = c2.
```

The three exact support equations at
`TwoSourceFirstFiberCollision.lean:602` give

```text
dist c0 x = dist c0 y
dist c1 x = dist c1 z
dist c2 z = dist c2 y.
```

These are precisely the row equalities consumed by
`false_of_six_ccw_three_shell_equalities_302_401_512` and by the direct and
reflected support-first wrappers in `KalmansonThreeEqualitySchemas.lean:352,
1297,1342`.

All role distinctions are source-provable.  The packet itself gives the three
outside-point distinctions, the collision frame gives the three center
distinctions, and selected-row center exclusion gives each center's two local
support distinctions.  The three initially nonlocal cases are separated by
the first cap:

- `c1 != y`: `c1` is in the first cap interior, while either orientation of
  `y` is one of the two named `Q` points outside the first cap;
- `c2 != x`: `Pρ.blocker_mem_capInterior` puts `c2` in the first cap, while
  either orientation of `x` is outside it;
- `c0 != z`: `P.blocker_mem_capInterior` puts `c0` in the first cap, while
  `E.commonFourth_not_mem_firstCap` puts `z` outside it.

Thus aliasing is not the blocker.

## Missing order producer

The Kalmanson terminals require six boundary indices realizing the displayed
roles in the direct or reflected strict order.  No current theorem produces
that order.  The closest source-clean facts are:

- `firstFiber_capSources_alternate_between_firstApex_and_commonBlocker`;
- `exists_blockerCenter_capIndex_and_boundaryPosition`;
- `FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_sourceDeletionSaturation`;
- `FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_selectedRowOmissionSaturation`.

They locate cap sources or individual blockers and normalize deletion arms;
none orders the three outside roles against the three row centers.  The
project-indexed theorem-bank search returned only the already-known direct and
reflected consumers, not an order producer.

The canonical plan at `docs/computational-closure-plan-2026-07-28.md:9639`
records the decisive negative projection.  After the three row equalities,
two source-proved cross-distance signs, strict convexity, and a contiguous
three-center cap block were imposed, six order/sign arms remained and all six
had strict convex Euclidean realizations.  Its exact rational survivor has
cyclic order

```text
c0, c1, y, z, x, c2.
```

The added cap-separation arguments above hold in this order, so they do not
remove that survivor.  The old scratch artifact path named by the plan is not
present in the current worktree; the durable evidence currently available is
the plan's recorded checked result.  This is a custody limitation, not a basis
for promoting the conditional adapter.

## Proof-frontier consequence

The last crossed-row caller retaining `crossedRows` is
`false_of_capSource_firstFiber_crossedSeventhBlockerFaithfulResidual_frame` at
`TwoSourceFirstFiberCollision.lean:2694`.  Replacing that caller alone would
not remove the three FreshThird obligations: an independent live route through
`false_of_twoCapSources_freshThirdBlockerFiber_core` reaches the same
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` without a
`FirstFiberCrossedThreeRowExactSupports` packet.

The earliest minimality packet on that independent route is
`exists_freshThird_retained_minimalDeletionCoreProducer` at
`TwoSourceRetainedMinimalCore.lean:106`.  Its caller
`false_of_twoCapSources_freshThirdBlockerFiber` binds the resulting retained
packet as `_hretainedPacket` and discards it before entering
`false_of_twoCapSources_freshThirdBlockerFiber_on_surface`.  Conversely, the
crossed-row packet is reconstructed only inside the same-blocker constructor.
The earliest common descendant is therefore the normalized residual, after
both packets have been erased.

The refreshed kernel graph confirms the distinction: the public compatibility
wrapper `false_of_capSource_firstFiber_crossedThreeRowExactSupports` is
off-spine, while its `_frame` declaration at line 2811 is on-spine and reaches
exactly these three obligations:

- `false_of_freshThird_firstNonHit_alignedRetained`;
- `false_of_freshThird_firstNonHit_commonRadius`;
- `false_of_freshThirdEqualCenter_noncanonicalInteractions`.

The session anchor consequently sinks from the `_frame` declaration to
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, the
common coordinator above those three leaves.

There is a branch-local crossed/minimality theorem,
`exists_freshThird_crossed_pinnedCenter_allRows_escape_namedSeed` at
`TwoSourceFirstFiberCollision.lean:851`, but it is not available on the
independent normalized route.  The nearest order-free bank consumer,
`selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers`, would need
a third selected row containing both source points.  The current minimality
packet supplies an unspecified escaping point instead, so this antecedent is
also absent.

Therefore the rank-2 branch is not presently an implementation target.  The
next admissible theorem is a source-clean, cardinality-independent producer
that forces the missing relative orientation (or another positive metric/
incidence motif excluding the recorded survivor) and is available at both live
ingresses.  Until that theorem exists, adding a role adapter or rerunning the
local Kalmanson matrix would not decrease the governed lexicographic frontier.

## Reuse preflight record

- Candidate: shared-fourth six-role `302_401_512` order producer.
- Immediate consumer:
  `CapCrossingKalmansonBridge.false_of_six_ccw_three_shell_equalities_302_401_512`.
- First missing antecedent: direct or reflected strict cyclic order of
  `(x,z,y,c0,c1,c2)`.
- Source/import revision: `d580d14a7f1e94057da16aa7fb7c8471bbe3e875`;
  existing consumers are in `KalmansonThreeEqualitySchemas.lean`.
- Circularity: none in the consumers; the producer is absent.
