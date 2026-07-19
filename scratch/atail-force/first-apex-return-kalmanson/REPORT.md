# First-apex return: exact Kalmanson gate audit

Date: 2026-07-17

Status: **THE `S.oppApex1` RETURN DISJUNCTION IS NOT FORCED BY THE FIXED
FORWARD TRIANGLE + STRICT-KALMANSON + COMPLETE-REVERSE-ROW SHELL SURFACE.
ALL 990 STORED EXACT RATIONAL LRA SURVIVORS MAKE ALL THREE REVERSE OUTSIDE
PAIRS NON-CO-RADIAL FROM `S.oppApex1`.  ALL EIGHT STRICT DIRECTION CELLS
OCCUR AND HAVE INDEPENDENTLY REPLAYED EXACT WITNESSES.  THIS IS AN
ABSTRACT-DISTANCE COUNTERMODEL RESULT, NOT A PLANAR EUCLIDEAN/MEC OR
FULL-PARENT MODEL.  NO PRODUCTION THEOREM OR `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/first-apex-return-kalmanson/`.  It did not edit
production Lean, shared documents, blueprint state, `ShellCurvature`,
`SurplusM44`, the card-five lane, or protected census files.  No Lean, Lake,
or git command was run.

## Apex mapping regression gate

The fixed rational model roles are not interchangeable.  The authoritative
mapping, copied from and regression-checked against
`all-reverse-parent-return-gate/REPORT.md`, is

```text
o     = S.oppApex2       (the physical exact-five-shell center)
left  = surplusApex
right = S.oppApex1       (the retained first apex queried here).
```

Accordingly, this audit compares

```text
dist right xi  and  dist right yi,
```

not the separate physical-shell distances centered at `o`.  The exact replay
continues to check the physical class at `o`, but every return/nonreturn
direction is centered at `right`.

## Required preflight

Before testing a new local metric contradiction, this lane checked the banks
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered an `S.oppApex1`-equidistant reverse outside
pair, strict Kalmanson shell equalities, `outsidePair_unique_capCenter`, and
`u1TwoLargeCapObstruction`.  The relevant current declarations remain

```lean
ThirdCenterCommonPair.firstApex_dist_eq
CapSelectedRowCounting.outsidePair_unique_capCenter
CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities
U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
```

They are consumers once a co-radial pair at `S.oppApex1` has been produced;
none supplies that occurrence from the three reverse rows.

## Exact question

Start with the 990 exact rational QF_LRA survivors recorded by
`cycle-three-rows-kalmanson`.  They use the fixed chiral core

```text
o, left, q0, c0, c2, q1, c1, q2, right
```

and the complete reverse rows

```text
c0 : {q0,q1,x0,y0}
c1 : {q1,q2,x1,y1}
c2 : {q2,q0,x2,y2}.
```

The desired return producer would give at least one row `i` with

```text
dist right xi = dist right yi.
```

Its exact negation is

```text
dist right x0 != dist right y0
dist right x1 != dist right y1
dist right x2 != dist right y2.
```

Each disequality has two strict directions, giving eight direction cells.
Every stored ledger already satisfies positivity, all triangle inequalities,
both strict Kalmanson inequalities on every cyclic quadruple, the physical
exact-five shell at `o`, all three complete exact four-point reverse-row
shells, and every named radius-class exclusion.

## Exact result

`scan_stored_ledgers.py` reads the stored records without importing the Z3
generator and compares the six `right`-centered terms as exact `Fraction`s.
It finds:

```text
stored exact full-LRA survivors       990
all three outside pairs non-co-radial 990
strict direction cells represented     8 / 8
```

One exact witness per direction cell is:

| row-0 | row-1 | row-2 | stored case | minimum `right`-gap |
|---|---|---|---|---:|
| `x<y` | `x<y` | `x<y` | `k5_0384` | 4 |
| `x<y` | `x<y` | `y<x` | `k5_0388` | 4 |
| `x<y` | `y<x` | `x<y` | `k5_0386` | 4 |
| `x<y` | `y<x` | `y<x` | `k5_0393` | 5 |
| `y<x` | `x<y` | `x<y` | `k5_0404` | 2 |
| `y<x` | `x<y` | `y<x` | `k5_0411` | 2 |
| `y<x` | `y<x` | `x<y` | `k5_0385` | 4 |
| `y<x` | `y<x` | `y<x` | `k5_0422` | 6 |

All gaps are at least one, so every representative remains a model after
adding its normalized strict direction, for example

```text
dist right xi + 1 <= dist right yi
```

in an `x<y` cell.

The distribution over the eight cells is:

| direction signature | stored witnesses |
|---|---:|
| `x<y,x<y,x<y` | 348 |
| `x<y,x<y,y<x` | 126 |
| `x<y,y<x,x<y` | 114 |
| `x<y,y<x,y<x` | 72 |
| `y<x,x<y,x<y` | 114 |
| `y<x,x<y,y<x` | 72 |
| `y<x,y<x,x<y` | 84 |
| `y<x,y<x,y<x` | 60 |

## Independent exact replay

`verify_no_return_representatives.py` does not import Z3 or the generating
audit.  For every representative it checks exact rational values against:

- the complete unordered-distance variable set and positivity;
- all three triangle inequalities for every triple;
- the physical exact-five shell centered at `o = S.oppApex2`;
- all three complete reverse-row shell equalities;
- every current named exact-class exclusion;
- both normalized strict Kalmanson inequalities for every cyclic quadruple;
  and
- the three normalized strict directions centered at
  `right = S.oppApex1`.

The replay returns:

```text
PASS: exact rational first-apex nonreturn witnesses cover all 8 strict direction cells
x<y,x<y,x<y: k5_0384 direction_gap>=4 Kalmanson_slack>=1
x<y,x<y,y<x: k5_0388 direction_gap>=4 Kalmanson_slack>=1
x<y,y<x,x<y: k5_0386 direction_gap>=4 Kalmanson_slack>=1
x<y,y<x,y<x: k5_0393 direction_gap>=5 Kalmanson_slack>=1
y<x,x<y,x<y: k5_0404 direction_gap>=2 Kalmanson_slack>=1
y<x,x<y,y<x: k5_0411 direction_gap>=2 Kalmanson_slack>=1
y<x,y<x,x<y: k5_0385 direction_gap>=4 Kalmanson_slack>=1
y<x,y<x,y<x: k5_0422 direction_gap>=6 Kalmanson_slack>=1
PASS: abstract distance ledgers only; no Euclidean realization claimed
```

The predecessor's independent 990-ledger replay was also rerun and passed.

## Why no broad re-solve or Farkas bank was run

A single exact model of the terminal negation is sufficient to refute linear
forcing.  The corrected scan finds such a model in every one of the 990
stored survivors and covers all eight direction choices.  Re-solving all
7,920 case/direction combinations would add a coverage statement that is not
needed for this decision.

There are no strict-cycle or Farkas UNSAT cores to extract from the eight
tested direction cells: each has an explicit exact feasible ledger.  This is
a decisive SAT witness result inside the stated abstraction, not an
`UNKNOWN` search outcome.

No additional first-apex four-shell was added.  The current finite surface
does not supply source roles for the retained `S.oppApex1` K4/frontier class,
and guessing them would change the mathematical question.  The only exact
apex shell already encoded is the physical class centered at
`o = S.oppApex2`.

## Orientation discipline

This audit tests the fixed forward/chiral 990-survivor bank requested by the
caller.  The corrected shared-boundary report proves that the source-facing
interface has forward and reflected branches and warns that the full sampled
word is not an unconditional source theorem.

No reflected coverage or transport theorem is claimed.  It is unnecessary
for the negative conclusion: a fixed-forward exact model satisfying all the
linear assumptions while falsifying every `S.oppApex1` return equality is
already enough to refute a universal implication from those assumptions to
return.

## Consequence for closure

The higher-parent terminal remains sound:

```text
some reverse outside pair is co-radial from S.oppApex1
  -> two distinct same-cap centers through that pair
  -> outsidePair_unique_capCenter
  -> False.
```

What fails is the proposed **linear producer** for its antecedent.  Even all
three complete reverse rows, exact named exclusions, every triangle
inequality, and the full strict Kalmanson system allow all three returns at
`S.oppApex1` to fail simultaneously.

This does not refute a producer which uses the omitted retained first-apex
K4/frontier class, full total-critical-map coupling, deletion minimality, or
planar/MEC geometry.  Any next attempt must visibly consume one of those
stronger inputs.  The fixed-order Kalmanson overlap normal form remains valid
pruning, but it cannot also produce first-apex co-radial return by itself.

## Reproduction

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/first-apex-return-kalmanson/scan_stored_ledgers.py

UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/first-apex-return-kalmanson/verify_no_return_representatives.py

UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/cycle-three-rows-kalmanson/verify_results.py
```

## Epistemic status

| Claim | Status |
|---|---|
| `right = S.oppApex1` is the queried apex; `o = S.oppApex2` is the physical apex | **REGRESSION-CHECKED against the parent-return audit** |
| All 990 stored full-LRA survivors make all three `right`-centered pair distances unequal | **EXACT SCAN OF STORED RATIONAL LEDGERS** |
| Every one of the eight strict direction cells is feasible | **EXACT RATIONAL QF_LRA WITNESS, independently replayed** |
| The fixed forward linear Kalmanson surface forces an `S.oppApex1` return | **REFUTED** |
| The reflected source branch has been exhaustively enumerated here | **NOT CLAIMED / NOT NEEDED FOR THE NEGATIVE RESULT** |
| A witness is a planar Euclidean/MEC or full-parent realization | **NOT CLAIMED** |
| Production `sorry` closed by this lane | **NONE** |

## Source-faithful `doubleRadius != radius` follow-up

This follow-up audits the stronger retained first-apex input that was omitted
from the fixed-distance Kalmanson surface above.  It uses the packet in
`first-apex-shell-role-audit/FirstApexShellRolePacket.lean` with

```text
O   = S.oppApex1
T0  = P.retainedRow, radius r
T1  = P.doubleRow, radius rho
rho != r.
```

`T0` and `T1` are source-faithful `SelectedFourClass` rows, not exact or
critical shells.  The packet proves that their four-point supports are
disjoint.  It also preserves two distinct strict-`oppCap1` witnesses in each
row, contains `q,w` in `T0`, omits `q,w` from `T1`, and records the exact
three-way cap-role surface for `q,w`: each is in `oppCap2` or the strict part
of `oppCap1`, and at least one is strict.

### Repeated theorem-bank and indexed-corpus preflight

The required local and sibling certificate registries were searched again
before proposing a new occurrence theorem.  Focused indexed searches covered
disjoint selected/exact shells, unequal radii, cap roles, critical rows, U5
incidence incompatibilities, Kalmanson consumers, and the seven equalities of
`u1TwoLargeCapObstruction`.  The closest current results are:

- `fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses`;
- `double_erase_survives_or_two_disjoint_exact_shells`;
- `RetainedSourceReturnExactFourPartition`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities`; and
- the banked U5 source-unit families and
  `U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`.

None consumes only two anonymous disjoint selected rows at one center.  In
particular, the U5 and seven-equality metric consumers need named
source/center/support incidences that `T0,T1` do not provide.

### Consumer audit

| Consequence or consumer | What `rho != r` supplies | Decision |
|---|---|---|
| deletion robustness | two support-disjoint selected four-rows at `O` | **RETIRED:** `R.firstApexFullyDeletionRobust` is already live |
| opposite-cap counting | at least four distinct strict-`oppCap1` hits; adding the two endpoints gives `6 <= S.oppCap1.card` | **RETIRED:** exactly reconstructs `L.firstOppCap_card_ge_six`; no improvement |
| retained critical map | robustness excludes `O` from the blocker image and leaves only anonymous repeated fibers elsewhere | **RETIRED:** no reverse-pair or source-index coupling |
| isosceles/shell-curvature counting | two four-point radius colors at one center | **NONTERMINAL:** the exact strict-convex two-shell regression below realizes the local surface |
| U5 / `u1TwoLargeCapObstruction` | two within-row radius equalities | **NO MATCH:** missing prescribed critical sources, second centers, and cross-row memberships |
| `outsidePair_unique_capCenter` | an immediate contradiction if one reverse outside pair lies wholly in `T0` or wholly in `T1` | **LIVE NEXT PRODUCER** |

The cap count is sharp at the level available here.  Disjointness gives two
strict-cap hits from each selected row, hence four distinct strict hits; the
closed cap has two support-triangle endpoints.  This is precisely the already
live lower bound of six, not a route to seven or to a new row packet.

The critical-map consequence is also already present: two disjoint rows make
`O` fully deletion-robust, hence no source of the retained
`CriticalShellSystem` can have blocker center `O`.  The resulting pigeonhole
fibers are anonymous and do not identify either endpoint of any
`reverseOutsidePair`.

### Exact regressions against weaker producers

`verify_distinct_radius_branch.py` contains two independent exact checks.
The first is a finite parent-marginal fixture with cap profile `(5,6,8)`, a
total fixed-point-free blocker map, support locking, the all-reverse
three-cycle, and the retained/double-deletion first-apex rows

```text
T0 = {3,6,8,12}
T1 = {5,9,10,11}.
```

The four strict first-cap hits exhaust the strict part of the six-point cap.
Thus the `rho != r` count is saturated at six.  Its reverse outside pairs are

```text
{3,9}, {5,8}, {6,10}.
```

Every pair is contained in `T0 union T1`, but every pair has exactly one
endpoint in each row.  Consequently **even union coverage of all three
reverse pairs does not produce a return equality**.  Any proposed producer
that concludes only

```text
reverseOutsidePair K i subset T0.support union T1.support
```

is refuted by this exact finite fixture.

**Crisp forcing verdict.**  On the strongest source-faithful *finite
marginal* surface encoded by this lane, the displayed named-row occurrence
target is **not forced**: all three reverse pairs cross the `T0/T1` color
partition.  That surface includes the exact cap partition and roles, the
`rho != r` disjointness/deletion pattern, a total fixed-point-free blocker
map, support locking, omitted first/second apex values, repeated blocker
fibers, and the all-reverse three-cycle.

The fixture omits exactly the inputs that prevent promoting this to a
countermodel of the actual parent theorem:

- an `R^2` realization of the finite incidence data and a single Euclidean
  distance function realizing every named shell simultaneously;
- the strict convex cyclic order and MEC-derived support-triangle geometry
  on that same realization;
- full `CounterexampleData`, including K4 at every carrier source and the
  minimal-counterexample/no-removable-vertex conditions;
- proof that its support table is produced by one actual
  `CriticalShellSystem` with exact radius-class and deletion-failure
  semantics; and
- the definitional construction tying that same critical system to the
  retained frontier packet `F0,R`, its extracted `T0,T1`, and the physical
  omission cycle `K`.

Thus the finite marginal target is retired, but a theorem using one of these
omitted global geometric/provenance couplings is not refuted.

The second check is an exact rational nine-point strictly convex cap-order
shadow with two concentric four-point shells of squared radii `81/25` and
`1`.  Its minimum strict hull slack is `648/333125`.  It refutes a local
convexity, shell-curvature, or cap-order contradiction from two radius colors
alone.  It is deliberately not claimed to satisfy the MEC or full
`CounterexampleData` surface.

The replay output is:

```text
PASS: exact finite rho!=r parent-marginal saturation fixture
first_opp_cap_card=6 strict_hits=4
T0=[3, 6, 8, 12] T1=[5, 9, 10, 11]
reverse_pairs=[[3, 9], [5, 8], [6, 10]] all_cross_radius=True
PASS: exact rational strict-convex two-shell cap-order shadow
vertices=9 minimum_strict_hull_slack=648/333125
PASS: no MEC or full CounterexampleData realization claimed
```

### Exact next producer

The smallest producer with an immediate on-hand consumer is the following
architectural statement (names and implicit parameters are schematic; this
was not elaborated in this no-Lean lane):

```lean
theorem exists_reverseOutsidePair_in_firstApexShell
    (P : FirstApexShellRolePacket F0 R)
    (hrho : P.doubleRadius != radius)
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : AllReverseMembership K) :
    exists i,
      reverseOutsidePair K i <= P.retainedRow.support or
      reverseOutsidePair K i <= P.doubleRow.support
```

This target is independently consistent with the consumer audit in
`combined-first-apex-consumer-search/REPORT.md`; the regression here sharpens
it by showing why containment in the *union* is insufficient.

Either disjunct is terminal.  `reverseOutsidePair_card_eq_two` gives two
distinct points outside `oppCap2`; their reverse critical row makes them
co-radial from its blocker, while their inclusion in `T0` or `T1` makes them
co-radial from `O = S.oppApex1`.  Both centers lie in the ordered cap
`oppCap2`, and `R.actualBlocker_ne_firstApex` makes them distinct.
`outsidePair_unique_capCenter` then gives `False`.

It would be overstrong to demand uniformly that the returned pair is
`{q,w}`.  The source-faithful role split permits either `q` or `w` to lie in
`oppCap2`, whereas every reverse outside pair is outside `oppCap2`.  The
`{q,w}` specialization is available only in the conditional branch where
both frontier sources are strict first-cap points.

The displayed named-row occurrence theorem is **OPEN / CONJECTURAL**.  No
existing theorem found in the preflight produces it.  It must use a genuine
cross-system input--the common critical map, source-indexed reverse cycle,
deletion provenance, or stronger planar/MEC geometry--because the retained
shell marginals, cap count, and Kalmanson inequalities have exact
countermodels.

### Follow-up epistemic ledger

| Claim | Status |
|---|---|
| `rho != r` implies support-disjoint `T0,T1` | **SOURCE-AUDITED packet field** |
| it reconstructs `6 <= S.oppCap1.card` | **FINITE-SET CONSEQUENCE; already live and retired** |
| it gives new deletion robustness | **NO; already live and retired** |
| union coverage of a reverse pair suffices | **REFUTED by exact finite fixture** |
| two radius colors alone contradict strict convex cap order | **REFUTED by exact rational shadow** |
| a reverse pair wholly in one named row closes | **IMMEDIATE MATCH to the existing cap-center consumer** |
| the named-row occurrence is currently proved | **NO / OPEN** |
| production `sorry` closed by this follow-up | **NONE** |

Follow-up reproduction:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/first-apex-return-kalmanson/verify_distinct_radius_branch.py
```
