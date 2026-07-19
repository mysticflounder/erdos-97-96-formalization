# First-apex shell-role audit

Date: 2026-07-17

Status: **SOURCE AUDIT COMPLETE. THE RETAINED ORIGINAL FRONTIER CONTRIBUTES
TWO FIRST-APEX FOUR-ROW SURFACES, BUT IT DOES NOT ASSIGN THE FRONTIER SOURCES
OR THE ROW COMPLETION POINTS TO FIXED COMMON-ORDER SLOTS. THE PRECISE SOLVER
EXTENSION IS THE ROLE-DOMAIN PACKET IN `FirstApexShellRolePacket.lean`. NO
PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/first-apex-shell-role-audit/`. It did not edit production
Lean, plans, proof-blueprint state, git, or protected/user-owned files, and it
did not run Lean/Lake.

## Required preflight

Before deriving the packet, the audit searched every registry required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed Lean searches for first-apex double deletion, retained
radius classes, support filters, and four-shell rows. The closest hits were
the current `CriticalPairFrontier`, deletion-robustness, and first-apex row
modules. No banked theorem identifies this retained frontier with the
independently reconstructed exact-five frontier, and no banked theorem gives
fixed roles for its unnamed completion points.

## 1. Do not identify the two frontiers

The full-parent all-reverse leaf has an original

```lean
F0 : CriticalPairFrontier D S radius H
R  : FrontierCommonDeletionParentResidual F0
```

retained by the cap-strengthened parent. By contrast,
`FrontierCoupledExactFivePhysicalCycleParentResidual` stores a fresh
`frontier` constructed by a new call to
`exists_criticalPairFrontier_of_K4`.
`PhysicalOmissionCycleParentResidual.lean:65-74,113-130` gives no equality of
that frontier, its radius, or its pair with `F0`. The packet in this lane is
therefore indexed by `F0` and `R` directly. It adds no `E.frontier = F0`
equation.

## 2. Exact retained-pair facts

Write `q = F0.pair.q`, `w = F0.pair.w`, and `O = S.oppApex1`. In the
fixed-core notation used by the period-three Kalmanson/Euclidean audits,

```text
right = S.oppApex1 = O,
o     = S.oppApex2.
```

Thus the two new rows are centered at fixed-core `right`, not at physical
apex `o` and not at a reverse-row blocker.

From `SurvivorPairRelocationPacket`
(`CriticalPairFrontier.lean:287-303`) one has:

- `q,w in D.A` and `q != w`;
- `q,w` lie in the exact `O`-radius filter at `radius`;
- `q,w` are outside `S.surplusCap`;
- deleting either `q` or `w` preserves K4 at `S.oppApex2`; and
- their actual critical blockers are not `S.oppApex2`.

`R.frontierRadius_class_card_ge_four`
(`OrientedPhysicalApexIngress.lean:251-260`) and the positive radius derived
from `q` give an ambient K4 class at `O` containing both `q,w`.

The exact cap-role classifier is not a single named cap. The production cover,
applied to the local `CounterexampleData` obtained by replacing `D.packet`
with `S`,
`U2SqueezePort.oppApex1_exactRadiusClass_cover`
(`U2SqueezePort.lean:297-316`) gives, after removing the impossible surplus
alternative,

```text
q in oppCap2 or q in strictFirstOppositeCap,
w in oppCap2 or w in strictFirstOppositeCap,
```

where

```text
strictFirstOppositeCap = oppCap1 \ (surplusCap union oppCap2).
```

The one-hit theorem
`U2NonSurplusSqueeze.oppApex1_otherCap_one_hit`
(`U2NonSurplusOneHit.lean:310-335`) and `q != w` exclude the case in which
both lie in `oppCap2`. Hence at least one lies in the strict private part of
`oppCap1`. All three remaining labelled cases are source-faithful:

1. both strict `oppCap1`;
2. `q` strict `oppCap1`, `w` in `oppCap2`;
3. `q` in `oppCap2`, `w` strict `oppCap1`.

There is no theorem selecting one of these cases.

## 3. Retained-radius four-row

`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`
(`CapInteriorRadiusCounting.lean:23-73`), after rewriting
`O = S.oppositeVertexByIndex S.oppIndex1`, supplies two distinct points
`x0,x1` in

```text
SelectedClass D.A O radius intersect
  S.capInteriorByIndex S.oppIndex1.
```

The four-point preservation lemma
`FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four`
(`N8/FourSubpacket.lean:49-66`) can preserve the union `{q,w,x0,x1}` because
it has cardinality at most four. Thus one may choose a selected four-row
`T0` at `O` which:

- has radius `radius` and support card four;
- contains `q,w`;
- contains two distinct strict-`oppCap1` points; and
- has exactly two support points outside `{q,w}`.

Crucially, `x0` or `x1` may equal `q` or `w`. Therefore the two completion
points of `T0` have **no individually provable cap roles**. A solver must
retain the three frontier role cases and enumerate the remaining row roles
under the cap cover and adjacent one-hit constraints.

## 4. Double-deletion four-row

`R.common.firstApexDouble`
(`OrientedPhysicalApexIngress.lean:239-247`) is exactly

```lean
HasNEquidistantPointsAt 4 ((D.A.erase q).erase w) O.
```

Choose its witness radius `rho` and a selected four-support `T1`. After
lifting from the erased carrier:

- `0 < rho`;
- `T1.card = 4` and every member is in `D.A`;
- `T1` is co-radial from `O` at `rho`;
- `T1` is disjoint from `{q,w}`; and
- every member lies in `surplusCap`, `oppCap2`, or strict `oppCap1`.

The cap-interior lower bound remains valid for this erased row. The proof is
the same count as `CapInteriorRadiusCounting`: the erased selected class is a
subset of the ambient `rho` class, the two adjacent closed-cap intersections
are each at most one
(`SurplusM44Packet/Shard01.lean:1020-1048`), and the outside-interior cover is
`SurplusM44Packet/Shard02.lean:600-610`. Since the erased class has at least
four points, at least two lie in strict `oppCap1`. `T1` can be chosen to
preserve two such points.

These are four genuinely extra points relative to `q,w`, but only two have a
named strict-cap role. The other two retain the three-way cap-role domain.

## 5. Exact `radius` / `rho` split

The split has two different solver meanings.

### `rho = radius`

`q,w` and all four points of `T1` are six distinct members of the same
ambient first-apex radius class. This proves

```text
6 <= card (SelectedClass D.A O radius).
```

No equality between `T0` and `T1` follows. `T1` avoids `q,w`; the two
completion points of `T0` may or may not be in `T1`.

### `rho != radius`

Every point of `T0` has `O`-distance `radius` and every point of `T1` has
`O`-distance `rho`, so

```text
Disjoint T0.support T1.support.
```

This is a genuine two-radius, eight-slot selected-row surface at one center.
It does not identify any `T1` member with a reverse-row outside target.

The common parent supplies no upper bound on the retained class, so neither
arm can be discarded. The proof of
`FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust`
(`OrientedPhysicalApexIngress.lean:313-389`) uses `rho != radius` only inside
its *exact-card-four* subcase; it does not establish that inequality on the
whole all-reverse parent.

## 6. Deletion ledger

The precise deletion facts are:

| Fact | Source |
| --- | --- |
| delete both `q,w`, K4 at first apex | `R.common.firstApexDouble`, `OrientedPhysicalApexIngress.lean:239-247` |
| delete both `q,w`, K4 at second apex | `F0.secondApexDouble`, `CriticalPairFrontier.lean:568-576` |
| delete `q`, K4 at second apex | `F0.pair.q_survives`, `CriticalPairFrontier.lean:300` |
| delete `w`, K4 at second apex | `F0.pair.w_survives`, `CriticalPairFrontier.lean:301` |
| delete `q` or `w`, K4 at first apex | monotonic lift of the retained double-deletion witness |
| every actual blocker differs from first apex | `R.actualBlocker_ne_firstApex`, `OrientedPhysicalApexIngress.lean:391-400` |

No deletion fact places a `T1` point in a reverse critical support or places a
reverse outside target in `T0` or `T1`.

## 7. Boundary-order verdict

The cap-role fields determine which of the three boundary chains each point
may occupy. Convexity then gives a global cyclic embedding, but the current
source does **not** determine:

- the internal order of `q,w` when both lie in strict `oppCap1`;
- which retained-row completion points occupy which chain;
- the internal order of the four double-row points;
- an identification of any first-apex row point with any reverse-row outside
  target; or
- a common anchored order tying these rows to the period-three cycle.

Accordingly a faithful solver extension must enumerate cap roles and all
compatible within-chain permutations. Hard-coding the original frontier pair
as a reverse outside pair, setting `E.frontier = F0`, or forcing six distinct
outside targets would be an encoding bug.

## 8. ENCODED / OMITTED ledger

### ENCODED

- the original `F0` identity and `R` dependency;
- `q,w` ambient membership, distinctness, off-surplus status, common retained
  radius, and exact three-case cap-role split;
- one retained four-row containing `q,w` and two strict-cap witnesses;
- one double-deletion four-row avoiding `q,w` and containing two strict-cap
  witnesses;
- exact row cardinalities and co-radial equalities;
- the exhaustive `rho = radius` six-point arm versus `rho != radius`
  disjoint-row arm;
- all six first-/second-apex single/double deletion-survival facts; and
- global convex/Kalmanson inequalities only after enumerating a compatible
  common boundary order.

### OMITTED

- any equality between `E.frontier` and `F0`;
- any fixed cap role for the retained completion pair or the two unnamed
  double-row points;
- any fixed within-cap order beyond chain membership;
- any equality with a reverse outside target;
- any exact ambient radius-class cardinality;
- critical-shell exactness for `T0` or `T1` (they are selected K4 subrows,
  not source-indexed `H.selectedAt` rows);
- global K4 rows at the new support points unless separately instantiated;
  and
- a contradiction or coverage claim.

## Epistemic status

- **PROVEN IN CURRENT SOURCE:** all parent, frontier, cover, one-hit, cap
  counting, and deletion implications cited above.
- **ROUTINE LEAN EXTRACTION, NOT BUILT IN THIS LANE:** the single structure in
  `FirstApexShellRolePacket.lean`, using finite subset selection and monotonic
  lifting.
- **NOT PROVEN:** any common-order identification with the all-reverse rows or
  any contradiction from the packet.
- **NOT RUN:** Lean/Lake, proof-blueprint, production compilation, axiom audit,
  or git.

## 9. Follow-up: the `rho = radius` six-point arm

Status: **SOURCE-EXACT CONSEQUENCE IDENTIFIED; ROLE ENUMERATION CHECKED;
GEOMETRY-FREE DIRECT `False` REFUTED; NO TERMINAL ON-SPINE CONSUMER FOUND.**

This follow-up re-ran the required theorem-bank and indexed-corpus preflight
for six co-radial points, two-deletion robustness, selected subrows, and
large-radius consumers. The closest existing developments are:

- `FixedFirstRadiusTerminalDescent.lean:384-420,621-670`, which consumes a
  six-point first-apex class by retaining the radius through the frontier
  deletion and entering a history descent;
- `AnchoredFreshSuccessor.lean:166-325,918-949`, which extracts row-external
  successor sources and proves one named deleted/fresh double deletion;
- `F2EscapeLiveRoles.lean:134-219`, which selects a four-subrow through any
  prescribed pair in the six-point class;
- `GlobalMinimalDeletion.lean:143-176`, whose consumer returns a fresh
  shared-radius collision or a `MinimalDeletionCore`; and
- `RobustLargeRadius*.lean`, which is for a large radius at the *physical
  second apex* and reduces to common-deletion/exact-five residuals rather than
  to `False`.

None is a direct consumer of the source-faithful first-apex six named points
on the all-reverse leaf. The first three are continuation constructors. The
global-minimality consumer has already been applied to `{q,w}` in
`frontier-common-deletion-consumer/` and leaves two open alternatives. The
physical-second-apex route has the wrong oriented apex and is itself
nonterminal.

The closest all-reverse sinks were checked explicitly. The conditional
`ReverseEdgeU5AdjacentTerminal` in
`all-reverse-direct-false/AllReverseDirectFalse.lean:87-126` needs a dangerous
triple, two blocker-in-triple facts, two dangerous-center row incidences, and
one cross-blocker incidence. The first-apex six packet supplies none of those
identifications. The nonrecursive parent-return target in
`all-reverse-parent-coupling/REPORT.md` instead asks that one reverse outside
pair equal `{F0.pair.q,F0.pair.w}`. The six packet still gives no identity
between a reverse outside point and `q`, `w`, or a `T1` point, so it does not
advance that antecedent either.

### 9.0 Route-deduplication against the live `L` wrapper

The live large-cap wrapper already carries

```lean
L.first_cap_card_ge_six : 6 ≤ S.oppCap1.card
```

(the production source field is
`LargePhysicalSecondApexRadiusIngress.first_cap_card_ge_six`,
`OrientedPhysicalApexIngress.lean:163-170`). Therefore the observation that
four strict-interior points plus the two endpoints give a six-point closed
`oppCap1` is **not new and is not closure progress**.

Likewise, both radius arms recover facts already available from `R`:

- `rho = radius` implies a class of cardinality at least six and hence
  singleton deletion robustness;
- `rho != radius` gives two disjoint selected four-rows and hence singleton
  deletion robustness; but
- `R.firstApexFullyDeletionRobust`
  (`OrientedPhysicalApexIngress.lean:313-389`) already supplies that
  singleton interface without choosing either arm.

The only genuinely new information beyond `L + R` is therefore:

1. the named identity of the first-apex equalities: `q,w` and all four points
   of `T1` share the radius in the equal arm, while `T0,T1` are disjoint
   named rows in the unequal arm;
2. the exact `4/5/6` strict-interior role counts for those six named points,
   including the `2/3` lower bounds inside `T1`; and
3. in the equal arm, survival after **arbitrary two-point deletion**, which
   is strictly stronger than the already-known arbitrary singleton survival.

No cap-cardinality recovery is counted as a new result below.

### 9.1 PROVEN: exact six-point packet

Assume `P.doubleRadius = radius` and write

```text
N = {F0.pair.q, F0.pair.w} union P.doubleRow.support.
```

The source gives all of the following without slot or order choices:

1. `N.card = 6` and `N` is a subset of
   `SelectedClass D.A S.oppApex1 radius`.
2. At most one point of `N` lies in each adjacent closed cap. Therefore at
   least four points of `N` lie in
   `S.capInteriorByIndex S.oppIndex1`.
3. The double row contains at least two strict-interior points.
4. If `q` or `w` is the unique possible `oppCap2` point, then the double row
   contains at least three strict-interior points: that frontier source uses
   the `oppCap2` one-hit, leaving only the surplus-cap one-hit outside the
   strict interior.
5. For **every** two points `a,b` (whether or not they belong to `N`),

   ```lean
   HasNEquidistantPointsAt 4
     ((D.A.erase a).erase b) S.oppApex1
   ```

   because two applications of
   `selectedClass_erase_card_ge_of_succ_le`
   (`WitnessPacketInterface.lean:76`) leave at least four of the six-point
   class. This is arbitrary two-deletion robustness, stronger than the
   already-production `FullyDeletionRobustAt` singleton interface.

The exact Lean/solver-facing statement is
`SameRadiusSixConsequencePacket` in `FirstApexShellRolePacket.lean`.
Its fields are sourceable from:

- the named-six membership/distinctness facts already audited above;
- `leftAdjacentCap_at_opposite_card_le_one_of_convexIndep` and
  `rightAdjacentCap_at_opposite_card_le_one_of_convexIndep`
  (`SurplusM44Packet/Shard01.lean:1022-1048`);
- `selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`
  (`SurplusM44Packet/Shard02.lean:602-625`); and
- the two-erasure cardinal lemma just cited.

The extractor was not elaborated because this lane was explicitly forbidden
from running Lean/Lake and from touching production. The packet is therefore
**proved from current source at the mathematical/interface level, with an
unbuilt scratch declaration**.

### 9.2 CHECKED: exhaustive role-count normal form

`enumerate_same_radius_roles.py` exhausts the three legal frontier roles and
the one-hit-constrained roles of the four double-row points. It has 31
labelled row assignments and only the following aggregate vectors, written
as `(strict interior, surplusCap, oppCap2)`:

```text
q,w both strict:
  double row = (2,1,1), (3,0,1), (3,1,0), or (4,0,0)
  named six  = (4,1,1), (5,0,1), (5,1,0), or (6,0,0)

q strict / w in oppCap2, or the labelled reverse:
  double row = (3,1,0) or (4,0,0)
  named six  = (4,1,1) or (5,0,1)
```

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/first-apex-shell-role-audit/enumerate_same_radius_roles.py
```

The script asserts the global lower bound four, the unconditional double-row
lower bound two, and the cross-cap double-row lower bound three. It does not
enumerate boundary order or identify any point with a reverse-row target.

### 9.3 REFUTED: a direct `False` from the local six-class interface

The exact finite-metric boundary in
`frontier-common-deletion-consumer/verify_finite_metric_boundary.py` retains
a six-point first-apex radius class containing the off-surplus frontier pair,
double-deletion survival at both apices, a total source-exact critical map,
and the source-faithful common-deletion rows. It reports
`PASS_EXACT_FINITE_METRIC_INTERFACE_ONLY` with first-class cardinality six.

Thus the six-class facts, row equalities, critical-map marginals, and
deletion-survival facts do not imply a geometry-free direct `False`. This is
an exact refutation only within that finite metric interface; the model omits
Euclidean planar realization, convex/MEC cap geometry, global minimality, and
no-`M44`.

A generic geometric contradiction from "six points on a circle centered at a
convex vertex" is also false: arbitrarily many points on an arc of angle less
than `pi` can coexist with the circle center as an extreme point. Hence any
valid direct-False theorem must use more than convexity plus the six equal
distances.

### 9.4 CONJECTURAL: smallest genuinely new consumer

The useful new information for the period-three solver is therefore exactly:

- six named first-apex equal-radius points;
- at least four named strict-`oppCap1` interior roles, with the aggregate
  cases above; and
- arbitrary double-deletion survival at the first apex.

Closure still needs a source-exact coupling to a reverse row: a proved
identity/membership placing one of these named points in an all-reverse
critical support, or a common boundary order that lets the Kalmanson system
consume the new first-apex equalities. Without that bridge, the six-point
packet only feeds the already-known history/successor loops. No such bridge
or direct-False theorem was found in the theorem banks or current on-spine
production modules.

## 10. Updated epistemic ledger

- **PROVEN IN CURRENT SOURCE:** named-six cardinality/membership, at least four
  named strict-interior points, the `2/3` double-row strict lower bounds, and
  arbitrary first-apex two-deletion robustness.
- **CHECKED FINITE ENUMERATION:** exactly the role-count vectors in section
  9.2.
- **REFUTED WITHIN THE PINNED FINITE METRIC INTERFACE:** a direct `False` from
  the six-class/row/critical-map/deletion facts alone.
- **REFUTED GENERICALLY:** six co-radial points centered at a convex vertex are
  not by themselves geometrically impossible.
- **CONJECTURAL / MISSING:** a reverse-row identity, order coupling, or other
  global geometric consumer that turns this packet into `False`.
- **NOT CLAIMED:** a Lean-elaborated extractor, an on-spine closure, or a
  production `sorry` closure.

## 11. Global CSS/minimality follow-up

Status: **NO NEW TERMINAL. ARBITRARY TWO-DELETION ROBUSTNESS EXCLUDES THE
FIRST APEX AS A PAIR-BLOCKING CENTER, BUT IT DOES NOT FORCE A BLOCKER-FIBER
COLLISION INSIDE THE NAMED SIX, A CRITICAL ROW THROUGH A NAMED PAIR, OR A
REVERSE-PAIR RETURN.**

The required bank and indexed-corpus preflight found the following complete
existing consequence chain:

- `FullyDeletionRobustAt.exists_distinct_sources_same_blocker`
  (`DeletionRobustness.lean:149-168`) already obtains a blocker-fiber
  collision from **singleton** robustness, because `oppApex1` is omitted by
  the finite blocker endomap.
- The live bi-apex wrapper already strengthens this to two fibers or one
  three-source fiber through
  `FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber`
  (`BiApexBlockerMultiplicity.lean`). This is nonterminal and does not place
  any collision source in the named first-apex class.
- `exists_fresh_sharedRadiusPair_or_minimalDeletionCore`
  (`GlobalMinimalDeletion.lean:143-176`) may be applied to any distinct pair
  `{a,b}` among the named six. It returns a blocking center outside the pair
  and a nonempty minimal subset `V ⊆ {a,b}`.

For such a named pair, the last result specializes to three mathematical
possibilities:

1. `V` is a singleton: one of `a,b` has an exact deletion-critical shell at
   the fresh center. The current `H` can be overridden to use that shell, but
   is not forced already to select that center.
2. `V = {a,b}` and the two distances to the fresh center are equal: the
   corresponding ambient radius class has exact cardinality five; deleting
   either source leaves K4, while deleting both kills it.
3. `V = {a,b}` and the distances differ: `MinimalDeletionCore` supplies two
   support-disjoint exact four-shells at that center, one through each source;
   again either singleton deletion survives and the double deletion fails.

The new arbitrary two-deletion theorem only proves that the blocking center
in cases 2 and 3 is not `S.oppApex1`. In case 1 that exclusion already follows
from singleton robustness. For the original frontier pair `{q,w}`, even this
is old: `R.common.firstApexDouble` already gave its first-apex double-deletion
survival before the `rho = radius` split.

Crucially, the two pair-minimal shells in case 3 are not current CSS blocker
rows for `a,b`: deleting either source alone survives at their common center.
Thus the late core cannot be installed as a two-source fiber of `H`. The
singleton case installs only one row, and neither pair case identifies a
reverse outside pair. Global CSS plus `D.Minimal` therefore adds a
collision/core **split**, not a closing core.

### Exact finite regression

`verify_two_deletion_fiber_boundary.py` checks an exact rational 25-point
metric interface with:

- strict triangle inequalities and global K4;
- deletion minimality, certified by a connected non-apex neighbor graph in
  which every non-apex center has one exact four-point radius class;
- a total source-indexed blocker map with deletion-critical rows and
  same-center support locking;
- one exact six-point class at an omitted center `O`, hence K4 after every
  double deletion at `O`;
- injective blocker values on the six named class sources;
- at most one named class point in every selected critical support; and
- three distinguished actual critical-row pairs disjoint from the named
  class and hence not returning to `{q,w}`.

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/first-apex-shell-role-audit/verify_two_deletion_fiber_boundary.py
```

It reports:

```text
PASS_EXACT_FINITE_METRIC_TWO_DELETION_FIBER_BOUNDARY
carrier_card=25
fixed_class_card=6
named_class_blockers=[7, 10, 13, 16, 19, 22]
```

This is not a Euclidean convex/MEC/cap realization and does not encode the
exact-five reverse cycle. It refutes only geometry-free claims that
two-deletion robustness plus global K4, deletion minimality, and a total CSS
force the named fiber collision/row hit/return.

### Final `rho = radius` verdict

Global CSS and `D.Minimal` add **no terminal beyond arbitrary two-deletion
robustness**. The smallest still-missing bridge is a source identity, not
another deletion theorem: one must place two named fixed-class points in one
actual reverse/critical row with the cap role required by the ordered-cap
consumer. Equivalently on the exact-five all-reverse leaf, it is enough to
prove that one reverse outside pair is a two-point subset of the named
first-apex class with the needed off-surplus/strict role. Current source gives
neither this containment nor a blocker-fiber collision inside the named six.
