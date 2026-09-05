<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# P97 exact-five profile-0034 direct blocker-radius guard PIQD canary v1

## Scope

This governed canary takes the two complete direct profile-0034 radius formulas
from the authenticated physical-block run and appends one new strict polynomial
guard to each formula. It submits each guarded branch independently to Z3 and
cvc5 through PIQD. Every solver receives fresh positive and negative controls.

This is theorem-discovery infrastructure. A terminal result is about the exact
authenticated QF_NRA formula only. It is not a source realization, a proof of
the live source obligation, a Lean-ingress result, closure, or promotion.

## Authenticated parent

The parent is
`scratch/runs/exactfive-profile0034-direct-physical-block-deletion-piqd-20260905/run-0003`.
The producer pins and fully replays it offline before preparing any child query:

- run manifest self-hash
  `c80e09b9fe8b5d15dad8b2403b1023ec0fc8fbdccb04f5a82b3979876e1d71b0`;
- launch self-hash
  `fe9e795a8df4d2b0f38c24a7c5536a778ae07dd8952e139fb6fa3947e891a568`;
- terminal self-hash
  `666ed25997beb262efb6a00062aaca64e8211660fc482cb7d5dac51d0dbd1720`;
- recorded execution HEAD
  `53a044df922b4b9723ac51f44372b1f089c08478`.

The exact full-formula anchor journals are pinned separately:

| branch | parent journal SHA-256 | guarded journal SHA-256 |
|---|---|---|
| `lt` | `330e657acc657e76c12d275c35dab43bf45a5fee1b1ca5cc7be84079df66341e` | `c24f53801bcfbdaed9819e5174795e15ed470b80c752cc473c087602da81c25e` |
| `gt` | `a457faa7eea07e01442a57c1e2dd8558bf5528576c238fc7a0b1456e216693eb` | `bdd07eb7269b476d267f019c88e506ba9b727f0531bbd11c62a3624cafc23ae3` |

Each parent journal has all 26 physical assertion groups: 156 assertions and
177 commands. The child preserves those bytes command-for-command and appends
one assertion, yielding 157 assertions, 178 commands, and 16,214 bytes.

## Source-proved guard

The source declaration is
`RobustApexFourIncidenceContinuationPacket.secondApex_sqDist_lt_sqDist_blocker`
in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean`.
The producer pins that file at SHA-256
`5381678645d913b188299749a1cf0e8cf049003b729519c815aec49ebae71b04`
and records source commit
`79ee277bc3000d19b6a021d9915d24305f7f6a8c`.

Under the profile role map,

```text
c2 = c002, O = c001, U/blocker = c000.
```

The theorem concludes
`(dist c2 O)^2 < (dist c2 blocker)^2` under its robust-packet and support
membership hypotheses. In the exact equilateral coordinates, physical squared
distance is represented by `dx^2 + 3*dY^2`. The one appended command is:

```smt2
(assert (< (+ (* (- x_c002 1) (- x_c002 1)) (* 3 (- Y_c002 0) (- Y_c002 0))) (+ (* (- x_c002 0) (- x_c002 0)) (* 3 (- Y_c002 0) (- Y_c002 0)))))
```

The parent radius branches compare `dist²(c2,O)` with `dist²(c2,d)`, where
`d = c004`; the added guard compares with `U = c000`. The new assertion is not
a renamed parent radius branch and was absent from the 26-group campaign.

The source bytes, theorem identity, role map, guard operands, and command are
bound in every descriptor and source snapshot. There is no Lean-ingress binding
record connecting every satisfying coordinate assignment back to a live source
packet. Accordingly, `source_realization`, `formula_to_source_lift`,
`lean_ingress`, `theorem`, `closure`, and `promotion` all remain false.

## Query matrix and controls

The immutable eight-cell plan is:

```text
z3-target-lt               cvc5-target-lt
z3-target-gt               cvc5-target-gt
z3-control-positive        cvc5-control-positive
z3-control-negative        cvc5-control-negative
```

Every cell uses a fresh PIQD SMT session, one solve, no assumptions, no resume,
and a 300,000 ms solver cap. The launcher accepts 1 through 20 workers and uses
8 by default. Positive controls require an exactly replayed rational model;
negative controls require formula-scoped PIQD UNSAT custody. A failed control
prevents terminal publication.

SAT target observations are replayed against all parent assertions and the new
guard with exact rational arithmetic. Algebraic `root-obj` values or incomplete
readback remain rejected and cannot be reported as source witnesses. PIQD UNSAT
stays discovery-only: this lane carries no checked proof certificate or source
lift.

## Artifact and verification contract

The registered root is
`scratch/runs/exactfive-profile0034-direct-blocker-radius-guard-piqd-20260905/run-0001`.
It is intentionally uninitialized by this implementation change.

Initialization writes only `run_manifest.json`. Execution requires the complete
source inventory to match one committed HEAD, records an immutable launch, and
creates exactly eight artifact directories. Symlinks, hardlinks, non-regular
files, duplicate JSON keys, noncanonical JSON, escaping paths, undeclared files,
source drift, parent drift, session reuse, lifecycle mutation, timeout drift,
and partial-run resume all fail closed.

Offline verification reconstructs every descriptor and guarded formula, checks
every source snapshot and transport artifact, reclassifies every engine result,
checks fresh controls and unique sessions, and rebuilds the terminal self-hash.
It makes no daemon request and starts no solver.

```bash
uv run python scripts/run_exactfive_profile0034_direct_blocker_radius_guard_piqd.py --check-parent
uv run python scripts/run_exactfive_profile0034_direct_blocker_radius_guard_piqd.py --init-only
uv run python scripts/run_exactfive_profile0034_direct_blocker_radius_guard_piqd.py --workers 8
uv run python scripts/run_exactfive_profile0034_direct_blocker_radius_guard_piqd.py --verify
```

The implementation task does not run any of these solver-launching or run-root
initialization commands.
