# CardGe13 exact-13 priority-cone continuation audit (2026-09-06)

## Scope

This is a solver-only bounded continuation on the one replayed Boolean event
for cell `direct-z09-k08-12`. It reports an empirical formula/model result only:
no theorem claim, source-coverage claim, closure claim, or Lean claim is made.
No Lean file or shared script was edited.

## Governance and immutable inputs

- Lane: `cardge13-exact13-priority-cone-continuation-20260906`
- Owner: `CardGE13ConeContinuation`
- Checkpoint base: `c2978097ace4ba0b1999d9eb464b49e2f17d31c0`
- Checkpoint self-hash:
  `931a8d62e7ffa0e3fa581fa803271cb7b731c2295e0f4055d4408d4dfda3673d`
- Run manifest:
  `scratch/runs/cardge13-exact13-priority-cone-continuation-20260906/run-0001/run_manifest.json`
- Run-manifest self-hash:
  `30e37d3ababebfb7e5016769b3b9b0d236ce957cc0671712599d9e61cca1454f`
- Run-manifest file SHA-256:
  `6b920e65fdf9885650871d2d35d75b08573c2ed4c4b486917630d9e25bbc8af3`

The new immutable manifest binds the existing Boolean source event at
`scratch/runs/cardge13-exact13-priority-cone-20260906/run-0001/cell-012-direct-z09-k08-12-priority.json`
with file SHA-256
`cbdf6f1b69a1c84ca5a3c256d13a3201291692efefa3b42856ea0137588f4c9e`.
It also binds the prior run manifest with file SHA-256
`64f973399f76244a0be3ac8793874c1b917fe931b0b3a65d6c3a86b35fa87ecc`.

## Governed piqd continuation

The producer was
`scripts/cardge13_exact13_coarse_cell_conic_batch_piqd.py`. The paths below
show the final promoted custody layout; the event was initially emitted under
the run's runtime `events/` class and then moved byte-for-byte:

```text
--run-manifest scratch/runs/cardge13-exact13-priority-cone-continuation-20260906/run-0001/run_manifest.json
--source-event scratch/runs/cardge13-exact13-priority-cone-20260906/run-0001/cell-012-direct-z09-k08-12-priority.json
--out scratch/runs/cardge13-exact13-priority-cone-continuation-20260906/run-0001/artifacts/cell-012-direct-z09-k08-12-priority-cone.smt2
--event scratch/runs/cardge13-exact13-priority-cone-continuation-20260906/run-0001/cell-012-direct-z09-k08-12-priority-cone.json
--solver z3 --timeout-ms 120000
```

The producer emitted 1,099 projected forms and 2,237 SMT commands. The single
piqd Z3 solve returned `SAT`; the exact rational model replay returned
`SATISFIED`. Primitive natural-weight replay yielded total weight `1` with one
nonzero weight. The emitted weighted conflict has two edge pairings and 14
source atoms in its local decoded cell record.

Outputs:

- Reproducible journal SHA-256 (removed after validation; not retained):
  `56104dbfbf0da299dea644bab04845ab5b8090a58bd8b73354c81a0ef4bb1ef7`
- Event:
  `scratch/runs/cardge13-exact13-priority-cone-continuation-20260906/run-0001/cell-012-direct-z09-k08-12-priority-cone.json`
- Event self-hash: `4bc18be229d7fa289d501780c461a420cf4921c356cae8e32d196626e57d551e`
- Event file SHA-256:
  `dbc2d23ebfa515ff4e2118450f2c0a21ae0b549a1e610a3f76e69774775dfe34`

The piqd session was
`33bf8f05-27be-4b5f-bb1d-acf11324216d`. Its one-line receipt remains at
`/Users/adam/.piqd/sessions/33bf8f05-27be-4b5f-bb1d-acf11324216d/receipts.jsonl`:
1 line, 43,572 bytes, SHA-256
`e13fb733ac0c647a108c75e22fa695e9e0efacec1779e0530e5a4a1ad11d657d`.
The receipt records solver signature `z3-4.17.0`, solver SHA-256
`b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`,
`solve_index = 1`, `status = SAT`, and `timeout_ms = 120000`.

## Independent validation

An independent read-only replay check passed all of the following:

- run-manifest canonical self-hash;
- event canonical self-hash;
- source-event digest and event source binding;
- journal digest and receipt `base_sha256`/command-count binding;
- receipt/event status, solve index, result digest, and `SATISFIED` replay binding;
- exact model parsing and primitive-weight replay; and
- presence of the two emitted weighted path pairings.

The validation was formula/model custody only. It does not establish source
coverage or any mathematical consequence beyond the recorded bounded run.

## Hygiene

The checkpoint now lists the exact cone event and `run_manifest.json` as its
only durable paths; the reproducible SMT journal was removed. The resulting
checkpoint self-hash is
`931a8d62e7ffa0e3fa581fa803271cb7b731c2295e0f4055d4408d4dfda3673d`.

The cone event was promoted from the runtime `events/` class to the run root,
without changing its bytes, internal source bindings, event self-hash, or file
SHA-256. The follow-up lane report accepted the lane with `issues: 0` while
repository-wide shared-worktree material continued to make the summary
blocking. No shared hygiene script was changed. This lane did not stage,
commit, push, revert, or modify any foreign path.
