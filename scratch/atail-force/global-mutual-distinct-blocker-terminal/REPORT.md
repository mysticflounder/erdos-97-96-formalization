# Arbitrary mutual-pair distinct-blocker terminal audit

Date: 2026-07-18

Status: **THE DISTINCT-BLOCKER FOUR-CENTER PACKET HAS BEEN NORMALIZED TO
THREE COMPLETE SOURCE-FAITHFUL ROWS, WITH A FRESH KERNEL CHECK. IT DOES NOT
IMPLY `False` THROUGH ANY CURRENT BANKED CONSUMER. THE FIRST DIRECT
SAME-CAP TERMINAL NEEDS A POSITIVE SHARED OUTSIDE PAIR; IN THE SMALLEST
SOURCE-NAMED SPECIALIZATION THIS IS TWO RECIPROCAL CROSS INCIDENCES PLUS
ONE CAP-PLACEMENT PATTERN. AN EXACT FINITE INCIDENCE/CAP FIXTURE SATISFIES
THE CANONICAL SURFACE WHILE OMITTING EVEN A TWO-POINT BLOCKER-ROW
INTERSECTION. NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/global-mutual-distinct-blocker-terminal/`. It does not
edit production Lean, closure documents, generated blueprint state,
`ShellCurvature`, `SurplusM44`, protected card-five/555/654 work, or git.

## Required preflight

Before deriving the normalization or matching a new incidence target, this
lane checked every registry required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- two `CommonDeletionTwoCenterPacket`s for the same deletion;
- four distinct deletion-survival centers;
- arbitrary exact-five mutual omission and distinct blockers;
- same-cap shared outside pairs and `outsidePair_unique_capCenter`;
- Kalmanson shared-pair and three-row consumers; and
- `u1TwoLargeCapObstruction` and source-faithful row completions.

The nearest checked sinks are still:

```text
CapSelectedRowCounting.outsidePair_unique_capCenter
CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair
CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order
U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction.
```

None consumes only the four-center packet pair. Every one first requires a
positive support overlap or a compatible named cyclic placement.

## Kernel-checked canonical normalization

Start with the predecessor packet

```lean
M : FullParentExactFiveMutualData L profile
Q : FullParentMutualFourCenterDeletion M
```

and its checked packet-pair constructor

```lean
nonempty_fullParentMutualFourCenterPacketPair Q.
```

The new theorem

```lean
nonempty_fullParentMutualFourCenterCanonicalRows Q
```

constructs `P : FullParentMutualFourCenterPacketPair Q` and proves the three
exact support identities

```text
P.blockerPacket.B1
  = support (H.selectedAt continuation.unusedRow.unused.point)

P.blockerPacket.B2
  = support (H.selectedAt Q.chosen.partner)

P.apexPacket.B2
  = (SelectedClass D.A S.oppApex2 profile.radius)
      .erase Q.chosen.deleted.
```

The first two equalities use
`cross_survival_unique_radius_and_exact_support`: because the chosen deleted
point is absent from each actual critical support, every q-deleted K4 row at
that blocker has the unique retained critical radius and therefore the same
complete four-point support. The third equality uses exact-five radius
uniqueness and the q-deleted support cardinality.

The companion theorem `canonical_named_memberships` exposes all unconditional
named incidences obtained from those identities:

```text
partner is in the physical-second-apex row;
partner is in its own actual critical row;
deleted is absent from the continuation-blocker row;
deleted is absent from the partner-blocker row.
```

The continuation source is of course in its own actual row. Crucially, no
theorem gives a second common member of the two blocker rows. Their existing
overlap field is only the upper bound `card <= 2`.

## Smallest checked source-named terminal

The file defines

```lean
FullParentMutualSourcePairSameCapCollision Q
```

for the following exact positive completion. Write

```text
u  = continuation.unusedRow.unused.point
p  = Q.chosen.partner
bu = H.centerAt u
bp = H.centerAt p.
```

The packet asks for one indexed cap `C` such that

```text
bu, bp are in C;
u, p are outside C;
p is in the selected critical row at bu;
u is in the selected critical row at bp.
```

Own-source membership supplies `u` in the `bu` row and `p` in the `bp` row.
Thus `u,p` are a shared outside pair for two distinct centers in one ordered
cap. The kernel-checked theorem

```lean
FullParentMutualSourcePairSameCapCollision.false
```

closes immediately with
`CapSelectedRowCounting.outsidePair_unique_capCenter`.

This is the smallest **source-named same-cap completion** found in the
current bank: it adds two cross memberships rather than four arbitrary-pair
memberships. It is a terminal antecedent, not a recommended producer theorem.
The live packet gives none of its two cross incidences, and does not put the
two blockers in one cap excluding both sources.

## Why the other advertised consumers still do not fire

### `TwoCenterCapLocalization`

The distinct-blocker arm supplies the two distinct centers, but no pair of
distinct points equidistant from both. Canonical support identities do not
turn the overlap upper bound into a positive overlap. The physical exact-five
row gives points equidistant from `S.oppApex2`, not from either actual blocker.

### Kalmanson

`false_of_two_selected_rows_shared_late_pair` first needs two common support
points. `false_of_selected_rows_in_five_ccw_order` needs three positive row
equalities on five named boundary points. The canonical packet supplies
neither. A global CCW enumeration exists, but an order without the missing
incidences is not a consumer input.

### `u1TwoLargeCapObstruction`

The exact-five physical row supplies one circle with four retained points;
each blocker row supplies a different circle. The seven-equality obstruction
still needs cross-row equalities centered at three of its five roles. No
source-faithful assignment obtains those equalities from the own-source and
omission facts above.

### Global minimality and `noM44`

The complete `L/R` indices remain available, but their currently exported
consequences are cap cardinalities, bi-apex deletion robustness, and global
minimality. Applying minimality to another deletion produces another local
blocker/critical row, not a prescribed common pair in these two normalized
rows. No registered theorem turns four deletion-survival centers into a
positive row overlap. Another generic deletion adapter would therefore only
repeat the current nonterminal interface.

## Exact finite-scope regression

`verify_scope_model.py` checks a 14-label incidence/cap fixture with cap
profile `(5,6,6)`. It retains:

- a three-cap partition with the correct endpoint overlaps;
- a five-point physical-second-apex class and an unused sixth cap point;
- an arbitrary mutual omission pair `deleted,partner`;
- distinct continuation and partner blockers, each distinct from both
  physical apices;
- the three exact canonical support identities above;
- both q-deleted packet overlap bounds;
- all displayed exact-four support sizes, own-source memberships, center
  exclusions, and cap two-hit bounds; and
- the two-circle intersection upper bound for every displayed pair of
  distinct centers.

In the fixture the two normalized blocker rows intersect in exactly one
point, while both source-pair cross incidences are false. Consequently no
shared outside pair and no source-pair same-cap terminal is present.

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --no-project \
  scratch/atail-force/global-mutual-distinct-blocker-terminal/verify_scope_model.py
```

Output:

```text
PASS: canonical four-center incidence/cap scope is compatible
blocker-row intersection = [1]
source-pair cross incidences = False False
scope only: not Euclidean and not a CounterexampleData realization
```

This is **EXACT WITHIN THE STATED FINITE INCIDENCE/CAP ABSTRACTION**. It is
not a Euclidean realization and not a counterexample to the intended theorem.
Its role is to refute projection-only attempts to manufacture the missing
positive overlap from support sizes, omissions, cap counts, and the canonical
row identities.

## Validation

Because the predecessor is a scratch module outside the Lake source tree, the
validation first compiled it to a local scratch `.olean`, then elaborated the
owned file with that directory prepended to the Lake environment's
`LEAN_PATH`. Both deliberate single-file checks exit zero.

The three explicit axiom queries report exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean source contains no `sorry`, `admit`, declared axiom,
`native_decide`, or unsafe declaration. Lean LSP cannot directly register
this file because it lies outside the `lean/` project root; the direct Lean
elaboration and explicit kernel axiom queries are the validation boundary.

## Verdict and next theorem shape

The distinct-blocker branch is now normalized as far as the current APIs
permit. It does **not** reach direct `False`.

Do not promote the conditional same-cap packet and do not add another generic
deletion continuation. The remaining mathematical theorem must consume the
complete `L/profile/continuation/Q` surface and produce either:

1. a genuine shared pair in the two normalized blocker rows together with a
   compatible same-cap or Kalmanson placement; or
2. `False` directly from nonlinear Euclidean/MEC/full-fiber geometry or
   global minimality.

A theorem producing only the two packet rows, their cardinalities, or another
deletion-survival center is already subsumed by the checked normalization and
does not reduce the open frontier.

## Epistemic ledger

| Claim | Status |
| --- | --- |
| blocker q-deleted rows equal their source-indexed critical supports | **PROVEN / KERNEL-CHECKED** |
| second-apex q-deleted row equals the exact-five erasure | **PROVEN / KERNEL-CHECKED** |
| source-pair same-cap collision implies `False` | **PROVEN / KERNEL-CHECKED** |
| current distinct-blocker packet produces that collision | **NOT PROVED; FALSE IN THE STATED FINITE ABSTRACTION** |
| current packet produces any two-point blocker-row intersection | **NOT PROVED; FALSE IN THE STATED FINITE ABSTRACTION** |
| finite fixture is a Euclidean `CounterexampleData` model | **NOT CLAIMED** |
| distinct-blocker arm is directly false | **OPEN** |
| production `sorry` closed | **NONE** |
