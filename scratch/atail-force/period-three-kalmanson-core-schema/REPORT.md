# Period-three fixed-representative Kalmanson core schema

Date: 2026-07-17

Status: **EXACT ALL-CURRENT FIXED-REPRESENTATIVE CORE CENSUS. ALL 10,368
FORWARD CELLS IN THE CURRENT BOUNDED RUN DIE FOR THE SAME TWO-OWNER,
NONALTERNATING-TARGET-PAIR REASON. THE REVERSE ROWS AND PERIOD-THREE DATA ARE
UNUSED. THIS IS AN ENCODING-ARTIFACT ROUTE CORRECTION, NOT CONVERGENCE AND NOT
LIVE SOURCE COVERAGE. NO `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/period-three-kalmanson-core-schema/`. It did not edit
production Lean, closure docs, proof-blueprint state, git, `ShellCurvature`,
`SurplusM44`, or another scratch lane, and it ran no Lean/Lake command.

## Required preflight

Before mining a new metric pattern, this audit checked every registry required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling-bank and cyclic-separation sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered Kalmanson cancellation,
strict-lap nonreturn, two rows sharing a later pair, and the ordered-cap outside
pair theorem. The bank already contains the immediate production consumer

```lean
Problem97.CapCrossingKalmansonBridge
  .false_of_two_selected_rows_shared_late_pair
```

and the equality-closure/same-side consumer

```lean
Problem97.Census554.FourPointTwoCircleBisectorOrderCore
  .false_of_core_of_same_side.
```

The latest prose backup was also checked at SHA-256

```text
898887e99d2937931cff9ccb7ffbcb4ba0b71232e2ffc6a0fc74e0d0011d3c38
/opt/nfs/front-a-closure-backup-20260718T025149Z/verified-results.md
```

Its Lemma 223 is exactly the mathematical normal form found here. Lemmas 202,
230, and 237 and Corollary 203 do not transport directly to the live `P + K`
period-three packet; the field-by-field comparison is below.

## The common core

Let `O` be the first apex, `P` the physical second apex, and let `u,v` be two
distinct targets. In the current forward representatives the four roles occur
in boundary order

```text
O < P < u < v.
```

The fixed rows imply

```text
d(O,u) = d(O,v),
d(P,u) = d(P,v).
```

The single strict `K2(O,P,u,v)` inequality is

```text
d(O,v) + d(P,u) < d(O,u) + d(P,v),
```

which contradicts the two equalities by direct cancellation. Equivalently,
the owner chord `OP` and target chord `uv` do not alternate, contradicting
Lemma 223 from the prose backup. Reflection preserves this nonalternation.

This is a three-constraint semantic core:

```text
one strict K2 inequality
+ first-owner target-pair equality
+ second-owner target-pair equality.
```

It needs no triangle inequality, positivity, exact-shell exclusion, radius
disequality, pair-choice Boolean, reverse row, pair injectivity, CSS map,
minimality, MEC condition, or period-three fact.

## Exhaustive current-representative census

[`scan_common_schema.py`](scan_common_schema.py) inspects the rows fixed by the
current `cell()` function and all orders from `compatible_orders()`. Its source
snapshot has SHA-256

```text
1e799aadcdd2d6216558bc7beef2b5e52f1e598d71834cb20256318cf10dcf57
scratch/atail-force/period-three-first-apex-kalmanson/decide_quotient.py
```

Run:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-kalmanson-core-schema/scan_common_schema.py
```

Exact result:

```text
generated forward orders: 1,728
representatives per order: 6
forward cells checked: 10,368
forward cells missing the core: 0
reflected fixed cells checked: 10,368
reflected cells missing the core: 0
```

The six representative families split only by the equality path at `O`:

| arm | role | cells | targets | first-owner equality |
| --- | --- | ---: | --- | --- |
| `eq` | `II` | 1,728 | `{8,11}` | T0--T1 chain through fixed overlap `9` |
| `eq` | `IO` | 1,728 | `{8,12}` | one T0 row |
| `eq` | `OI` | 1,728 | `{8,12}` | one T0 row |
| `neq` | `II` | 1,728 | `{8,12}` | one T0 row |
| `neq` | `IO` | 1,728 | `{8,12}` | one T0 row |
| `neq` | `OI` | 1,728 | `{8,12}` | one T0 row |

Thus five families transport to the existing selected-row shared-late-pair
consumer after selecting a four-subrow of the physical exact-five class. The
`eq/II` family uses two first-apex selected rows transitively, so it needs
either an equality-closure adapter to the production Census554 consumer or a
raw-equality version of the same one-line Kalmanson theorem. This interface
difference is minor for the fixed cell and irrelevant to the source gap.

The machine-readable census is
[`common_schema_census.json`](common_schema_census.json).

## Exact Farkas replay and deletion minimality

[`verify_farkas_cores.py`](verify_farkas_cores.py) independently sums integer
coefficient dictionaries and checks the raw cores with Z3:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-kalmanson-core-schema/verify_farkas_cores.py
```

Result:

```text
EXACT_INTEGER_FARKAS_REPLAY_AND_DELETION_MINIMALITY_PASS
```

The five-family raw core has five constraints:

```text
K2,
d(O,u)=r, d(O,v)=r,
d(P,u)=R, d(P,v)=R.
```

The `eq/II` overlap-chain core has seven:

```text
K2,
d(O,u)=r, d(O,m)=r,
d(O,m)=rho, d(O,v)=rho,
d(P,u)=R, d(P,v)=R.
```

In both cases the primitive integer Farkas sum is identically zero while the
strict inequality contributes unit slack. Deleting any one displayed raw
constraint makes the system SAT. The exact ledger is
[`farkas_core_verification.json`](farkas_core_verification.json).

[`mine_boolean_cores.py`](mine_boolean_cores.py) records the initial
assumption-core diagnostic. Z3 first returned long K2 staircases because an
UNSAT core is inclusion-minimal only inside the solver-chosen initial core; it
need not be a globally smallest alternate. The direct equality-quotient scan
above finds the actual one-Kalmanson alternate and makes further MARCO mining
of this fixed formula unnecessary.

## Why this is an encoding artifact

The representative encoder fixes identities between two independent source
surfaces:

```text
F0 / the first-apex T0,T1 rows
and
the physical-apex exact-five class used by K.
```

For example, five cells force both labels `8,12` into T0 and the physical
class. The sixth forces `8` into T0, `11` into T1, a fixed T0--T1 overlap, and
both `8,11` into the physical class. None of these cross-surface identities is
a consequence of `FirstApexShellRolePacket`,
`LargeCapUniqueFiveSecondApexRadius`, or
`PhysicalActualCriticalOmissionCycle`, and they are not symmetry
representatives after the role names and boundary order are fixed.

The live packet permits:

- T0/T1 overlap zero, one, or two in the equal-radius arm, with fresh
  completion points;
- disjoint T0/T1 supports in the distinct-radius arm;
- every legal equality partition between the first-apex and physical-five
  roles, including total disjointness; and
- physical-five profiles with three, four, or five strict physical-cap hits.

Therefore the 10,368 UNSAT verdicts show only that the six chosen identity
patterns are impossible. They provide no evidence that reverse-row
Kalmanson coupling is converging.

## Exact source condition for a valid immediate sink

The common core becomes a valid live producer-to-consumer closure precisely
when source proves the following packet for the two actual apices `O,P`:

```text
there exist distinct u,v in D.A such that

1. d(O,u) = d(O,v), derived from T0/T1 row equality closure;
2. u and v lie in the physical exact-five radius class at P,
   hence d(P,u) = d(P,v); and
3. the chords OP and uv are nonalternating in the whole-carrier convex
   boundary order (for example O < P < u < v after a cyclic cut).
```

With those three fields, the existing strict Kalmanson theorem closes the
branch immediately. A selected-row specialization can use
`false_of_two_selected_rows_shared_late_pair`; a transitive T0--T1 equality
can use an equality-closure adapter or a raw-equality wrapper.

Current `P + K + period=3 + all-reverse` supplies **none** of the load-bearing
cross-surface intersection statement in item 2. The exact missing producer is
therefore

```text
first-apex equality closure and physical-five class
share a two-point target class in a nonalternating owner/target placement.
```

It is not enough to know that each surface separately has large rows.

## Latest prose-backup match

The requested `/opt/nfs` results compare as follows.

| Result | Match to this core / live `P + K` |
| --- | --- |
| Lemma 202 | **No direct match.** It needs six distinct roles in order `b,a,t,c,w,q`, a three-target shell at `a`, a two-target shell at `b`, and `angle qwt <= pi/2`. The fixed core needs only four roles and no angle; live `P + K` does not supply the Lemma-202 role map. |
| Corollary 203 | **No direct match.** It specializes Lemma 202 to an MEC-wedge A-before-B handoff. `P + K` does not force that handoff or its own-cap/cross-target placement. |
| Lemma 223 | **Exact mathematical match to the fixed core.** Map `p=O`, `q=P`, `x=u`, `y=v`. The current fixed cells violate its required alternation. But live `P + K` does not force a common pair `{u,v}` for the two apex rows. The prose theorem is not assumed Lean-importable; production already has closely matching Kalmanson and equality-closure consumers. |
| Lemma 230 | **No direct match.** It assumes a same-block target pair and an outside first owner, then localizes a distinct second owner inside the block. The fixed pairs `8,11` and `8,12` span different cap blocks, and live `P + K` does not force the second owner. |
| Lemma 237 | **No direct match.** It assumes exact transverse-A rows plus the Lemma-132 supplier obstruction and two-owner alternation. Those exact-A/front-coordinate fields are absent from `P + K`. |

Thus Lemma 223 confirms the core's geometry but does not repair the missing
source producer. Lemmas 202/203 remain possible higher-level mechanisms only
after a new role-map theorem supplies their substantially stronger fields.

## Route correction

1. Do not mine more Farkas/MARCO cores from the current six representatives.
   Their full UNSAT census is already explained by one unsupported identity
   choice.
2. Treat the 10,368 run as a regression showing that the immediate Lemma-223
   sink is correctly detected, not as evidence for
   `false_of_periodThree_allReverse_firstApexRows`.
3. Rebuild the role/identity quotient first: include the complete T0/T1 role
   space, fresh completion points, every legal intersection with the
   independent physical-five roles, reverse-target identities, and both
   orientations.
4. Use the common-pair/Lemma-223 core as an immediate pruning rule whenever
   the source-faithful quotient produces it.
5. Stop on the first exact no-common-pair SAT cell. Only if the complete
   remaining quotient is UNSAT should new deletion-minimal Farkas cores be
   mined and generalized.

## Epistemic ledger

- **EXACT ALL-CURRENT BOUNDED COVERAGE:** one common core in all 10,368
  forward fixed representatives.
- **EXACT DIAGNOSTIC REFLECTION CHECK:** the same core in 10,368 reflected
  copies.
- **EXACT CERTIFICATE:** primitive integer Farkas cancellation and
  deletion-minimal raw cores.
- **EXISTING CONSUMER MATCH:** production selected-row/equality-closure
  Kalmanson consumers; prose Lemma 223 is the same mathematical statement.
- **NOT LIVE SOURCE COVERAGE:** the shared target pair is a fixed unsupported
  cross-surface identity.
- **NOT USED:** reverse rows, period three, all-reverse, CSS/minimality, MEC,
  or no-`M44`.
- **LEAN/LAKE/PRODUCTION/BLUEPRINT/GIT:** not run or edited.
- **PRODUCTION `sorry` CLOSED:** none.
