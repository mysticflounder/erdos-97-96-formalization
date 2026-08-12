# P97 Phase-3 survivor metric PIQD route v1

Status: production diagnostic route. This is finite solver evidence, not a Lean
proof, not a universal Problem 97 result, and not source entitlement.

## Route and resource contract

`census/p97_search/phase3_survivor_metric_driver.py` defaults to
`--solver-route piqd`. Production PIQD execution is sequential and requires
`--workers 1`. The old in-process Z3 implementation is reachable only through
the explicit `--solver-route legacy-local-z3` option. The PIQD branch is chosen
and the one-worker gate is enforced before the local task runner or its
`ProcessPoolExecutor` can be reached. Loss of PIQD transport, protocol
validation failure, semantic replay rejection, and publication failure never
select a local fallback.

The bounded test command is:

```bash
./scripts/test-p97-phase3-survivor-metric-piqd.sh
```

It sets the common native-library thread caps to one, uses one pytest process,
and runs separate Ruff lint and formatting checks. It does not start a daemon
or invoke a real solver.

The historical `DEFAULT_SOURCE`/`DEFAULT_OUT` values remain unchanged for
reproducibility, but that saved 2026-07-29 source can fail current dependency
hash authentication after source revisions. Do not silently substitute it.
For a bounded production canary, authenticate the current fixture and select
one case/order explicitly:

```bash
uv run python -m census.p97_search.phase3_survivor_metric_driver \
  --source census/p97_search/tests/fixtures/phase3_structural_survivors_100_current \
  --out scratch/p97-survivor-metric-canary \
  --piqd-output-directory scratch/p97-survivor-metric-canary.piqd \
  --workers 1 --timeout 2 --case-index 0 --order-id order-00
```

The selector still authenticates all 100 source survivors, then publishes one
driver record and the corresponding per-order PIQD custody directory. For this
explicit single-order canary, the driver derives the bounded PIQD HTTP timeout
from `--timeout`; an unselected complete-census run preserves the adapter's
historical 3900-second transport timeout. The PIQD route remains sequential and
has no local fallback. Run the standalone validator on
the published order directory, not on the driver root:

```bash
uv run python -m census.p97_search.phase3_survivor_metric_piqd \
  --check scratch/p97-survivor-metric-canary.piqd/survivor-0000/00-order-00 \
  --source census/p97_search/tests/fixtures/phase3_structural_survivors_100_current
```

## Authenticated source binding

Before submission, `phase3_survivor_metric_piqd.capture_sources` captures the
exact manifest and survivor-journal bytes, verifies that the manifest's
`artifact_hashes["survivors.jsonl"]` equals the captured journal digest, and
then reuses the driver's strict manifest, dependency-hash, survivor hash-chain,
assignment, decoded-row, canonical-digest, and 24-order replay. It accepts the
driver result only when the selected manifest path, manifest bytes, digest and
inode identity, and journal bytes, digest and inode identity are unchanged
after that replay. The driver compares the two independently reconstructed
case sets through a canonical identity containing every source record, decoded
row, canonical digest, and ordered cap order. This comparison is deliberately
independent of Python dataclass class identity, because the supported
`python -m` entrypoint loads the CLI body as `__main__` while the adapter imports
the canonical package module. It then freezes
the authenticated source-manifest bytes, complete survivor-journal digest, and
exact JSONL record bytes for each survivor. Every staged query binds:

- the complete current source manifest and survivor journal digest;
- the survivor index, raw record digest, prior-record digest, assignment digest,
  row digest, and canonical digest;
- the exact decoded row system, profile `[4, 4, 5]`, order and order identifier;
- the stage identifier, normalized SMT journal, readback variables, solver
  profile, producer, and exact-rational semantic verifier; and
- byte snapshots of the source manifest, survivor record, driver, adapter,
  encoder/replayer, and generic authenticated PIQD client.

The JSONL ingress policy is deliberately fail-closed: every record must be its
canonical compact JSON object followed by exactly one LF; CRLF, a missing final
LF, a blank/fabricated terminal record, alternate whitespace or key order, and
duplicate keys are rejected. No `splitlines` normalization or synthesized
terminator is permitted. The source manifest and complete survivor journal are
reread without following symlinks before every query. Their current digests
must still match both the authenticated ingress evidence and the manifest's
artifact digest. A changed or crossed source aborts the route.

After the terminal PIQD session has closed, the route performs the same exact
path, inode, byte, ingress-digest, and manifest-artifact-digest check once more,
immediately before custody inventory creation or atomic publication. A source
replacement in that final window leaves the destination untouched.

## Exact staged semantics

Each order uses a newly created PIQD SMT session with solver `z3`, lane `smt`,
and an assumption-free one-shot solve:

1. `exact-metric-relaxation`;
2. `full-convex`, after replayed SAT or UNKNOWN from stage 1; and
3. `convex-only-relaxation`, only after raw UNKNOWN from stage 2.

No session is reused. The maintained public generic adapter validates the fresh
session, exact asserted command count and bytes, exported journal, solve
response, same-session durable receipt, result digest, Z3 name/signature/binary
digest, close response, and session uniqueness.

For SAT, all twenty coordinate readbacks must parse as exact rational S
expressions. The semantic verifier substitutes those rationals and re-evaluates
every asserted metric and orientation atom. A SAT response whose atoms do not
all replay exactly becomes inconclusive and cannot advance as verified SAT.
UNKNOWN is control flow or an inconclusive terminal result. UNSAT is recorded
only as `Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED`; PIQD does not currently provide
an independently checked UNSAT proof for this route.

## Immutable custody and offline validation

Every stage is written with exclusive creation into a private staging
directory. Publication fsyncs files and directories, writes an exact inventory
containing file identities, lengths, and SHA-256 digests, and atomically renames
the directory into a destination that must not already exist. The driver output
root and PIQD custody root are also create-once. Driver result, source-manifest,
and manifest files use exclusive immutable creation.

The public standalone validator is:

```bash
python -m census.p97_search.phase3_survivor_metric_piqd \
  --check PATH/TO/ORDER-CUSTODY \
  --source PATH/TO/AUTHENTICATED-SOURCE
```

It performs no network request. It reauthenticates the current survivor source,
reconstructs every stage query byte-for-byte, checks the complete custody
inventory, validates every archived PIQD lifecycle and solver identity, repeats
exact-rational SAT replay, rejects session reuse or invalid stage control flow,
and rederives the whole staged result.

## Live qualification (2026-08-11)

The repaired immutable checkpoint
`3a72216df8821e7f4e9a8dde33b5bbf0b9b8d78b` completed one bounded selected-order
live canary against PIQD build
`e00419994dac6c4ae8446b94eac0ae84a7025ea97ee0b3ffa42a20734367cd8f`.
The command selected survivor `0`, case `0`, and `order-00`, used one worker,
and requested a two-second timeout per stage. The only invocation that reached
the daemon created two fresh sequential Z3 sessions; both made exactly one
solve and closed:

- exact-metric relaxation session
  `17824ba5-e9b5-4d10-ab8f-360bee952fb6` returned `UNKNOWN`, with result SHA-256
  `a3bfe134a25a1170ba0ad0ff4529cbc84061e3456e3384cc0272c2eea6f48ddf`;
- full-convex session `7d1000ba-d406-4b8f-a2ae-a1e7e44981d1` returned
  proofless `UNSAT`, with result SHA-256
  `263c80e04403ba263e76bb8855a11960feb3a9e8341fd6e577c0a8b6e4104dcf`.

Both sessions bound Z3 `4.17.0`, solver SHA-256
`b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`,
`replayed = false`, and the disclosed 32-second effective deadline. The
full-convex empty core is unnamed and remains discovery-only. The driver
therefore published the finite diagnostic classification
`ALL_CAP_ORDERS_SOLVER_UNSAT_NOT_LEAN_CLOSURE`; the separate equality-only
metric core remained `UNKNOWN`.

The public standalone validator passed on the published order custody. Its
custody inventory SHA-256 is
`3d2b4adbd5edd5260e194d7fdaf2c0a20474028920482ef75d5b91d5179fc829`;
the driver manifest, results JSONL, and source-manifest SHA-256 values are,
respectively,
`25b6ad43590daf2888af733d56004e27274236ec9eed36b54a66c1749d287d5f`,
`1eb70018298a8948070a5682f859dc24ea55d99d167af3a369ea5c96466637af`,
and `a33fc3d6e0387ec7d84f2e01dfdc99dae0ed1a1fd32734f03a8566e4ed585303`.
An independent artifact audit reported the complete source/order/query/hash,
one-solve, one-receipt, closed-session, canonicalization, and self-hash chain
valid in nthdegree conversation message `#5472`.

This qualifies the operational PIQD route and its offline custody boundary for
one real selected-order run. It does not promote the diagnostic `UNSAT` to a
proof or establish source entitlement, enumeration completeness, a global or
universal theorem, a Lean result, or P97 closure.

## Deliberate limitations

- This route is a producer of finite diagnostic evidence only.
- Proofless UNSAT cannot close a theorem or Lean obligation.
- UNKNOWN and rejected SAT replay are not evidence of impossibility.
- The standalone validator requires the authenticated source tree and the same
  bound implementation revisions whose bytes were archived.
- The route does not start or manage PIQD. Its focused tests use an adversarial
  current-schema in-memory transport; the dated qualification above is the
  separate bounded live-daemon evidence.
