# P97 profile 0034 unresolved group-core lane

Status: governed discovery lane, version 1, dated 2026-09-04.

This lane consumes the completed supporting-edge physical-deletion run. It
authenticates that run, its supporting-edge parent, and the maintained phase-3
PIQD SMT adapter before preparing any cell. The fixed inputs are the eleven
deletion probes that ended `UNKNOWN`:

- LT: edge groups 00, 03, 04 and source-row groups 01, 05.
- GT: edge groups 00, 03 and source-row groups 00, 01, 03, 05.

The run manifest and every query snapshot bind the execution-critical
supporting-edge QF_NRA producer reached through the deletion producer's
`parent.source` import. The query snapshot uses the stable name
`implementation-supporting-edge-qfnra-parent.py`.

There are four Z3 cells. The positive and negative controls run in that order.
After both controls pass, the LT and GT targets run in one concurrent batch.
Every cell owns a fresh PIQD session, submits one solve, closes that session,
and records the full request, journal, receipt, lifecycle, and close custody.
The timeout is 60,000 milliseconds. The default and maximum worker count is
four.

For a target, every group outside the fixed UNKNOWN set is a hard assertion.
Each unresolved group has one Boolean assumption. An edge assumption guards
all eleven assertions for that edge index. A row assumption guards its single
equality. The descriptor stores the group ID, source entries, source commands,
their hashes, assumption term, and self-hashed label. Supplying all assumptions
reconstructs the complete parent assertion stream in its source order.

The positive control must return SAT and pass exact rational replay against its
complete original source. The negative control must return UNSAT with a
nonempty `get-unsat-assumptions` core. A target may publish SAT, UNSAT, or
UNKNOWN. Target SAT is accepted only after exact rational replay against the
complete original target source. Target UNSAT requires a nonempty returned core
whose terms, group IDs, and labels authenticate against the stored bindings.
The core is not asserted minimal. UNKNOWN remains unresolved. Transport loss,
malformed custody, and rejected SAT replay fail closed.

All claim-bearing records set these claims to false:
`live_source_completeness`, `core_minimality`, `source_realization`,
`all_profile_execution`, `lean_ingress`, `live_closure`, `promotion`, and
`theorem`. A SAT witness is not a source realization.

The run tree is immutable under
`scratch/runs/exactfive-hard-source-swap-profile0034-unresolved-group-core-piqd-20260904/run-0001`.
Its manifest repeats the lane checkpoint base head and binds exact source and
input digests. Launch requires the current committed source bytes. Replay uses
the execution commit stored by the launch. A partial launch cannot resume.
Superseded init-only manifests and their self-hashed move receipts are retained
below the registered `tmp/prelaunch-quarantine` output path and are inputs to
the current manifest and every query.
Default CLI success is silent, while errors are written to standard error.
