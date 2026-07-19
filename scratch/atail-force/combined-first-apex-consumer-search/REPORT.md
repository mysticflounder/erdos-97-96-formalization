# Combined first-apex / all-reverse consumer audit

Date: 2026-07-17

Status: **NO EXISTING DIRECT CONSUMER CLOSES EITHER THE SIX-POINT
FIRST-APEX CLASS OR TWO DISJOINT EXACT FOUR-SHELLS AT ONE CENTER.  MORE
IMPORTANTLY, THE NAMED T0/T1 PACKET DOES NOT SUPPLY TWO EXACT SHELLS: ITS
UNEQUAL-RADIUS ARM HAS TWO DISJOINT `SelectedFourClass` SUPPORTS.  THE
SMALLEST NEW TERMINAL TARGET MUST USE THE NAMED T0/T1 PROVENANCE BY PUTTING
ONE REVERSE OUTSIDE PAIR IN ONE OF THOSE TWO ROWS.  CAP-SIX OR ABSTRACT
TWO-SHELL PACKING ALONE IS ALREADY EXHAUSTED BY THE CURRENT PARENT AND IS NOT
PROGRESS.**

This audit owns only
`scratch/atail-force/combined-first-apex-consumer-search/`.  It did not edit
production Lean, closure documents, proof-blueprint state, git, protected
scratch lanes, or `SurplusM44`, and it did not run Lean/Lake.

## Required theorem-bank preflight

Before searching for a new consumer, this lane checked every registry required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered six co-radial carrier
points, exact four-shells, disjoint same-center shells, first-apex retained and
double-deletion rows, common-bisector consumers, and source-indexed critical
rows.  The two archive registries contain no direct `False` theorem on either
surface.  The sibling registry's closest results are recorded below.

## 1. Exact source surface: T0/T1 are selected rows, not two exact shells

The source-faithful scratch packet is
`ATailFirstApexShellRoleAuditScratch.FirstApexShellRolePacket` at
`first-apex-shell-role-audit/FirstApexShellRolePacket.lean:49-129`.
For `O = S.oppApex1` it contains:

```lean
retainedRow : SelectedFourClass D.A O
q_mem_retainedRow : F0.pair.q in retainedRow.support
w_mem_retainedRow : F0.pair.w in retainedRow.support

doubleRow : SelectedFourClass D.A O
doubleRow_subset_doubleErase :
  doubleRow.support <= (D.A.erase F0.pair.q).erase F0.pair.w

sameRadius_six : doubleRadius = radius ->
  6 <= (SelectedClass D.A O radius).card

distinctRadius_disjoint : doubleRadius != radius ->
  Disjoint retainedRow.support doubleRow.support
```

Both rows also have two named distinct points in the strict interior of the
cap opposite `O`.  This is named T0/T1 provenance.  It is stronger than the
bare cardinality marginals because the two rows retain their centers, radii,
support points, deletion origin, and cap roles.

It is nevertheless essential not to strengthen the unequal-radius statement:

- `SelectedFourClass` says that four selected points lie at one radius;
- `CriticalSelectedFourClass` additionally says that the full ambient radius
  class is exactly that four-point support and is tied to deletion failure;
- neither T0 nor T1 has that critical/exact field.

Indeed production proves

```lean
theorem FrontierCommonDeletionParentResidual.actualBlocker_ne_firstApex
    (R : FrontierCommonDeletionParentResidual F)
    (source : Real^2) (hsource : source in D.A) :
    H.centerAt source hsource != S.oppApex1
```

at `OrientedPhysicalApexIngress.lean:394-400`.  Thus no row of the retained
global `CriticalShellSystem` is centered at `O`; global CSS provenance cannot
silently upgrade T0 or T1 to an exact critical shell.  This theorem is current
production and import-reachable from `U1LargeCapRouteBTail`.

## 2. Six co-radial points: current consumers and their exact deficits

### Current production, import-reachable

`FirstApexCriticalFiberRow.lean:188-235` proves

```lean
theorem criticalShell_inter_frontierRadiusClass_card_le_two
    (R : FrontierCommonDeletionParentResidual F)
    (source : Real^2) (hsource : source in D.A) :
    ((H.selectedAt source hsource).toCriticalFourShell.support inter
      SelectedClass D.A S.oppApex1 radius).card <= 2
```

This is an upper bound from the two-circle theorem.  It closes if a critical
row shares *three* first-apex class points, but the all-reverse packet gives no
positive lower bound on that intersection.

`OrientedPhysicalApexIngress.lean:318-389` proves

```lean
theorem FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust
    (R : FrontierCommonDeletionParentResidual F) :
    FullyDeletionRobustAt D S.oppApex1
```

Its large-class arm already starts at class cardinality five.  Therefore
`sameRadius_six` reinforces a robustness fact that the parent already has; it
does not contradict it.

The imported U5 theorem

```lean
theorem u5_common_bisector_triple_incompatibility
    (hr_pos : 0 < dist p q)
    (hT_noncol : not Collinear Real {t1,t2,t3})
    (ht1_radius : dist p t1 = dist p q)
    (ht2_radius : dist p t2 = dist p q)
    (ht3_radius : dist p t3 = dist p q)
    (Kx : U5QDeletedK4Class D q x Bx)
    (hpBx : p in Bx) (ht1Bx : t1 in Bx)
    (ht2Bx : t2 in Bx) (ht3Bx : t3 in Bx) : False
```

at `U5GlobalIncidenceKernels.lean:146-166` needs a second q-deleted row
through the first center and all three non-collinear first-circle points.
T0/T1 plus all reverse rows do not supply that four-point cross-row overlap.

The more primitive imported theorem

```lean
theorem eq_of_equidistant_three_noncollinear ... : x = y
```

at `U5GlobalIncidenceBasic.lean:129` has the same three-common-point deficit.

### Checked scratch: six points are useful only with a named second row

`r-f2-escape-live-roles/F2EscapeLiveRoles.lean:213-285` proves
`qCritical_support_offOppCap2_ne_coherentSource`.  It uses a six-point fixed
class to select a first-apex row through a *prescribed pair*, then closes
against a q-critical row known to contain that same pair at a second same-cap
center.  It proves one source inequality, not `False` from six co-radial
points.  Its load-bearing extra input is the named cross-row pair.

The fixed-radius descent in
`r-full-parent-entry/FixedFirstRadiusTerminalDescent.lean:225-260` likewise
uses a six-point class to preserve K4 after erasing a pair and recursively
descend.  This is continuation data, not a terminal.

### Sibling-bank results

The exact sibling declarations are:

```lean
theorem Problem97.U1ShortShellPruning.long_apex_shell_card_le_two
    (hM44 : D.IsM44) (hr : d < r)
    (hadj : forall x in adjacentCapsAt D i,
      dist x (oppApexAt D i) <= d) :
    (longApexShellAt D i r).card <= 2
```

`RVOL.P97.U1ShortShellPruning`, line 138, is source-proved and
source-reachable in the sibling repository, but `local_exact_name = false`.
It has the wrong branch polarity (`D.IsM44`, while the retained parent has
`noM44`) and additionally needs a proved long-radius cutoff.

```lean
theorem Problem97.u2_sharedBase_family_contradiction
    ...
    (he1_exact : e1 in SelectedClass A v1 r1)
    (he2_exact : e2 in SelectedClass A v1 r1)
    (he1_sel : e1 in SelectedClass A s rs)
    (he2_sel : e2 in SelectedClass A s rs)
    (hw_exact : w in SelectedClass A v1 r1)
    (hw_sel : w in SelectedClass A s rs)
    (hw_off : signedArea2 e1 e2 w != 0) : False
```

`RVOL.P97.U2BaseChordProduction`, line 101, is source-proved and
source-reachable in the sibling repository, but `local_exact_name = false`.
It is another three-common-point theorem; no reverse row contains three named
T0/T1 points.

```lean
theorem
  Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
    (a c d e f : Real^2) (hac : a != c)
    (h1 : dist c a = dist c d)
    (h2 : dist c a = dist c f)
    (h3 : dist d c = dist d e)
    (h4 : dist d c = dist d f)
    (h5 : dist f a = dist f d)
    (h6 : dist f a = dist f e)
    (h7 : dist e a = dist e c) : False
```

`RVOL.P97.U1TwoLargeCapObstruction`, line 77, is source-proved but
`source_reachable = false` and `local_exact_name = false`.  The combined
packet supplies no assignment of its seven directed equalities.

## 3. Two disjoint exact shells: producers and positive consequences only

Production `CriticalPairFrontier.lean:397-441` has the exact theorem

```lean
theorem double_erase_survives_or_two_disjoint_exact_shells
    (hcenter : center in A)
    (hqSurvives : HasNEquidistantPointsAt 4 (A.erase q) center)
    (hwSurvives : HasNEquidistantPointsAt 4 (A.erase w) center)
    (hdist : dist center q != dist center w) :
    HasNEquidistantPointsAt 4 ((A.erase q).erase w) center or
      exists Cq : CriticalSelectedFourClass A q center,
      exists Cw : CriticalSelectedFourClass A w center,
        ... and Disjoint Cq.support Cw.support
```

This is import-reachable, but it is a producer.  The T0/T1 parent is already
in its left, double-deletion-survives arm; it cannot be converted to the right
exact-shell arm.

Production `MinimalDeletionCore.lean:295-308`, transitively imported through
`RobustLargeRadius -> GlobalMinimalDeletion`, proves only

```lean
theorem MinimalDeletionCore.capByIndex_card_ge_six
    (K : MinimalDeletionCore D.A U center)
    (hcenterEq : S.oppositeVertexByIndex k = center)
    (hUcard : 2 <= U.card) :
    6 <= (S.capByIndex k).card
```

The checked scratch consequences are likewise packing bounds:

```lean
MinimalDeletionCore.four_mul_card_le_carrier :
  4 * U.card <= A.card

MinimalDeletionCore.two_mul_card_le_capByIndex_complement :
  2 * U.card <= (D.A \ S.capByIndex k).card
```

The scratch adapter
`shell-curvature-production-adapter-audit/ShellCurvatureProductionAdapterAudit.lean:41-66`
extracts two distinct core sources with disjoint exact supports, but its own
audit records no contradiction consumer.  Strictly convex rational local
models realize two disjoint concentric exact four-shell marginals, so a
universal shell-only `False` theorem would be false.  Any valid closer must
use cap/MEC/order or a cross-center incidence in addition to exactness.

The sibling theorem
`ConsecutiveOppositeEndpointEdges.b2a1e_disjoint_fires_exit`
(`RVOL.P97.U1kOppositeEndpoint.lean:455`) is source-proved and
source-reachable there but `local_exact_name = false`.  Its exact signature
requires `CGN.OrderedCap`, `ConsecutiveOppositeEndpointEdges`, a
`MoserOnlyIncompatibles` terminal, two named exact-card-four classes, and four
interior index inequalities.  Neither abstract exact-shell data nor T0/T1
constructs that specialized packet.

## 4. All three reverse rows do not fill the deficit

On the all-reverse exact-five arm, each successor critical row is a complete
CSS shell with exactly two points in the physical cap and exactly two outside
it.  The checked scratch consumer

```lean
theorem false_of_two_reverseRows_common_outsidePair
    ...
    (ha_i : a in row_i.support) (hb_i : b in row_i.support)
    (ha_j : a in row_j.support) (hb_j : b in row_j.support)
    (haOutside : a notin physicalCap)
    (hbOutside : b notin physicalCap) (hab : a != b) : False
```

is at
`exact-five-reverse-membership-closure/ReverseMembershipClosure.lean:367-441`.
But `reverseOutsidePair_injective` in
`exact-five-reverse-outside-pair-producer/ReverseOutsidePairProducer.lean`
proves distinct reverse rows cannot repeat that outside pair.  Thus this
consumer is already used contrapositively; it is not a producer to mine.

Global CSS gives exactness, deletion polarity, and distinct reverse-row
centers.  Global minimality returns a fresh shared-radius pair or a
`MinimalDeletionCore`.  Neither operation identifies a reverse outside pair
with two points of T0 or T1.  Cardinality-only cap-six and shell-packing
consequences were already present in the cap-strengthened parent `L`; adding
them again loses the named T0/T1 information and does not advance closure.

## 5. Smallest honest named-provenance consumer target

Let `outsidePair i` be the exact two-point support residual of reverse row
`i` outside `S.oppCap2`.  The smallest direct target is the following
disjunction (architectural statement, not elaborated here):

```lean
theorem exists_reverseOutsidePair_in_firstApex_namedRow
    (P : FirstApexShellRolePacket F0 R)
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : AllReverseMembership K H) :
    exists i,
      2 <= (outsidePair K i inter P.retainedRow.support).card or
      2 <= (outsidePair K i inter P.doubleRow.support).card
```

Either arm closes immediately:

1. the selected T0 or T1 row makes the two distinct outside points co-radial
   from `S.oppApex1`;
2. the reverse exact shell makes the same pair co-radial from its blocker;
3. both centers lie in `S.oppCap2` (the first is an endpoint and the blocker
   is strict interior) and are distinct by
   `actualBlocker_ne_firstApex`; and
4. `CapSelectedRowCounting.outsidePair_unique_capCenter`, or the pointwise
   cap-order wrapper audited in `shared-order-pointwise-consumer/REPORT.md`,
   gives `False`.

This target genuinely uses named T0/T1 provenance.  It is strictly weaker
than identifying a reverse pair with `{F0.pair.q,F0.pair.w}` because T0 may
close through either completion point and T1 supplies a second independent
row.  It also remains source-faithful in both `doubleRadius = radius` and
`doubleRadius != radius` arms: the two common points must lie in one named row,
not one point in each.

No searched theorem produces this intersection.  Pure Kalmanson/ordinal,
minimality-marginal, cap-six, and abstract shell-packing routes therefore
remain retired.  The next discovery task is specifically a **T0/T1-to-reverse
row occurrence theorem**, using the common CSS/minimality provenance without
forgetting row identity.

## Epistemic ledger

- **PROVEN IN CURRENT SOURCE:** the exact production signatures and implication
  directions quoted above.
- **CHECKED SCRATCH, SUBJECT TO OWNING REPORTS:** reverse outside-pair
  injectivity, the conditional common-pair terminal, F2 six-class source
  exclusion, and minimal-core packing inequalities.
- **SOURCE-AUDITED, NOT ELABORATED:** `FirstApexShellRolePacket` and the
  displayed combined occurrence target.
- **REFUTED AS A ROUTE:** six co-radial points alone, two disjoint exact shells
  alone, cap-six alone, and minimal-core packing alone.
- **OPEN:** the named T0/T1-to-reverse-row pair occurrence theorem.
- **PRODUCTION `sorry` CLOSED:** none.
- **LEAN/LAKE, BLUEPRINT, AND GIT:** not run.
