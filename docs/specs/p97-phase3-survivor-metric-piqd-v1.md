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
after that replay. It then freezes
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

## Deliberate limitations

- This route is a producer of finite diagnostic evidence only.
- Proofless UNSAT cannot close a theorem or Lean obligation.
- UNKNOWN and rejected SAT replay are not evidence of impossibility.
- The standalone validator requires the authenticated source tree and the same
  bound implementation revisions whose bytes were archived.
- The route does not start or manage PIQD, and the focused tests use an
  adversarial current-schema in-memory transport rather than a live daemon.
