<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# P97 cap-configuration CE-search operator runbook

Date: 2026-08-26

Verified revision: `b09f8ca5298d662a9277acceaeb8f61f8fad99c6`

Verified fixture gate (2026-08-27): `351 passed` and
`CAP_CONFIG_TEST_GATE=PASSED`

Runbook state: `IMPLEMENTED_FIXTURE_ONLY_UNQUALIFIED`

Live search authorized by this document: `false`

## Purpose and authority

This is the copy-and-run guide for a low-level operator executing the
cap-configuration counterexample (CE) search. The operator follows the commands
and stop rules here; the operator does not select the mathematical target,
change resource limits, repair artifacts, reinterpret solver output, or
authorize a successor wave.

The mathematical and trust contract remains
[the cap-configuration census implementation plan](../plans/2026-08-23-cap-configuration-piqd-census-plan.md).
The active closure plan supplies target authorization. The frozen protocol
contract is [`docs/specs/p97-piqd-cap-configuration-census-v1.md`](../specs/p97-piqd-cap-configuration-census-v1.md).
If those documents disagree, stop and report the disagreement.

This guide is deliberately fail-closed. The six runtime modules in
[`census/cap_configuration/`](../../census/cap_configuration/) (`universe`,
`symmetry`, `replay`, `piqd_adapter`, `campaign`, and `validate`), the frozen
specification, the cap test suite, and the frozen test wrapper now exist. The
shipped backend-`none` fixture can be planned and validated offline, and its
injected-adapter lifecycle is exercised by tests. Live PIQD operation remains
unqualified: fixture v1 accepts only a JSON-null authorization `parent`, and
the default CLI `run` has no registered attestor and must fail closed with
`BLOCKED_RESOURCE_BOUNDARY` before network or session creation. Do not route
around that result by calling PIQD directly.

The runbook state may change to `READY` only after the live qualification gates
below pass in a reviewed checkpoint with a recorded implementation commit.

## Operator rules

1. Run from the isolated worktree named in the assignment packet.
2. Execute commands only from sections labeled **RUN NOW** or, after the
   readiness gate passes, **RUN WHEN READY**.
3. If an expected token, hash, path, schema, identity, or exit status differs,
   stop. Do not edit a generated JSON, SMT-LIB, journal, model, receipt, hash, or
   manifest by hand.
4. Run the campaign in the foreground. Do not append `&`, start a polling loop,
   or launch a second copy. If the host returns a background-session identifier,
   use its blocking waiter.
5. Exit code zero means only that the command completed its operational
   contract. Read the validated project classification and claim flags; never
   infer a mathematical conclusion from the shell exit code.
6. Never retry by changing a timeout, solver, profile, source revision,
   journal, or resource boundary in place. Such a change requires a new
   manifest and attempt identity.
7. Never launch a successor wave without a fresh parent-bound
   `cap-configuration-wave-authorization/v1` record with `max_children = 1`.
8. Keep one shell for the run. If the shell or host session restarts, rerun the
   environment, input-custody, and checkpoint gates before any resume command.

While `Runbook state` is `IMPLEMENTED_FIXTURE_ONLY_UNQUALIFIED`, run
**Encoding baseline** and **Implementation readiness**. Do not fabricate a live
assignment packet merely to reach the readiness check.

## Required assignment packet — RUN WHEN READY

The coordinator must provide every field below in one message or retained
assignment artifact. Copy values exactly. Do not choose defaults.

| Field | Required content |
| --- | --- |
| Worktree | Absolute path to a clean isolated worktree |
| Git identity | Expected 40-hex `HEAD` and lane `base_head` |
| Lane | Lowercase-hyphen `lane_id` matching `[a-z0-9-]+`, lane owner, committed lane-checkpoint path, and checkpoint `base_head` |
| Run | ASCII `run_id` and exact `scratch/runs/<lane-id>/<run-id>/` root |
| Run kind | One of `fixture_canary`, `target_preflight`, `pilot`, `campaign`, or `resume` |
| Manifest | Path, `campaign_id`, structured `manifest_sha256`, and exact retained-file raw SHA-256 |
| Target | T0 record path/hash, target mode, proposition polarity, and termination policy |
| Oracles | Independent Phase 0 control record for `fixture_canary`; T1a record path/hash for target work; for pilot/campaign/resume, matching T1b `PASSED` record |
| Source | Source/import revision and exact source-manifest digest |
| Authorization | Path, structured hash, and exact retained-file raw SHA-256 of the active parent-bound authorization; unconsumed for first launch, or its matching consumption record for resume |
| PIQD | Base URL plus expected daemon, solver, profile, and session-protocol identities |
| Resources | Tier, one-process or qualified concurrency cap, wall/CPU/RSS/disk limits, supervisor/config attestation path/hash, and telemetry policy/path/hash |
| Expected stop | Exact evidence allowed to end this run and the required report recipient |

Any absent, placeholder, contradictory, or ambiguous field yields
`BLOCKED_ASSIGNMENT_INCOMPLETE`. A live PIQD call always requires accepted T0
authorization. A target-specific live call also requires accepted T1a. A
pilot, generic controller run, or resumed campaign requires T1b `PASSED` bound
to the same T0 target, source revision, oracle records, structural filter, and
sample contract.

The only work allowed before T0 is the target-neutral, zero-solver Phase 0
fixture work. `T1_BLOCKED_NO_ORACLE` forbids a target sample.

## Environment preflight — RUN WHEN READY

Start at the assigned worktree root. Fill these values only from the assignment
packet:

```bash
export CE_WORKTREE='<absolute-worktree-path>'
export CE_EXPECTED_HEAD='<40-hex-head>'
export CE_LANE_BASE_HEAD='<40-hex-lane-base-head>'
export CE_LANE_ID='<ascii-lane-id>'
export CE_LANE_OWNER='<checkpoint-owner>'
export CE_RUN_ID='<ascii-run-id>'
export CE_RUN_KIND='<fixture_canary|target_preflight|pilot|campaign|resume>'
export CE_RUN_ROOT="scratch/runs/$CE_LANE_ID/$CE_RUN_ID"
export CE_MANIFEST='<repo-relative-manifest-path>'
export CE_MANIFEST_RAW_SHA256='<64-hex-raw-file-sha256>'
export CE_AUTHORIZATION='<repo-relative-authorization-path>'
export CE_AUTHORIZATION_RAW_SHA256='<64-hex-raw-file-sha256>'
export CE_PIQD_BASE_URL='<coordinator-provided-base-url>'

export PYTHONUTF8=1
export PYTHONIOENCODING=utf-8
export PYTHONHASHSEED=0
export PYTHONDONTWRITEBYTECODE=1
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export TZ=UTC

ce_require_clean_hygiene() (
  set -o pipefail
  uv run --isolated --frozen python scripts/check_worktree_hygiene.py \
    report --lane "$CE_LANE_ID" |
    jq -s -e \
      --arg lane "$CE_LANE_ID" \
      --arg head "$CE_EXPECTED_HEAD" \
      --arg checkpoint ".codex/worktree-checkpoints/$CE_LANE_ID.json" \
      'length == 1 and
       .[0].schema == "worktree-hygiene-report/v1" and
       .[0].lane_id == $lane and
       .[0].head == $head and
       .[0].checkpoint == $checkpoint and
       .[0].blocking == false and
       (.[0].counts | type) == "object" and
       (.[0].issues | type) == "array" and
       (.[0].issues | length) == 0'
)
```

Reject unfilled or unsafe values:

```bash
(
  set -e
  blocked_assignment() {
    printf 'BLOCKED_ASSIGNMENT_INCOMPLETE: %s\n' "$1"
    exit 10
  }
  blocked_foreign() {
    printf 'BLOCKED_FOREIGN_WORKTREE_STATE: %s\n' "$1"
    exit 11
  }
  for value in \
    "$CE_WORKTREE" "$CE_EXPECTED_HEAD" "$CE_LANE_BASE_HEAD" \
    "$CE_LANE_ID" "$CE_LANE_OWNER" "$CE_RUN_ID" "$CE_RUN_KIND" \
    "$CE_MANIFEST" "$CE_MANIFEST_RAW_SHA256" "$CE_AUTHORIZATION" \
    "$CE_AUTHORIZATION_RAW_SHA256" "$CE_PIQD_BASE_URL"
  do
    test -n "$value" || blocked_assignment 'empty value'
  done
  case "$CE_WORKTREE$CE_EXPECTED_HEAD$CE_LANE_BASE_HEAD$CE_LANE_ID$CE_LANE_OWNER$CE_RUN_ID$CE_RUN_KIND$CE_MANIFEST$CE_MANIFEST_RAW_SHA256$CE_AUTHORIZATION$CE_AUTHORIZATION_RAW_SHA256$CE_PIQD_BASE_URL" in
    *'<'*|*'>'*) blocked_assignment 'placeholder remains' ;;
  esac
  case "$CE_EXPECTED_HEAD" in
    *[!0-9a-f]*|'') blocked_assignment 'bad HEAD' ;;
  esac
  test "$(printf '%s' "$CE_EXPECTED_HEAD" | wc -c | tr -d ' ')" -eq 40 || blocked_assignment 'HEAD is not 40 hex characters'
  case "$CE_LANE_BASE_HEAD" in
    *[!0-9a-f]*|'') blocked_assignment 'bad lane base' ;;
  esac
  test "$(printf '%s' "$CE_LANE_BASE_HEAD" | wc -c | tr -d ' ')" -eq 40 || blocked_assignment 'lane base is not 40 hex characters'
  for digest in "$CE_MANIFEST_RAW_SHA256" "$CE_AUTHORIZATION_RAW_SHA256"
  do
    case "$digest" in
      *[!0-9a-f]*|'') blocked_assignment 'bad raw SHA-256' ;;
    esac
    test "$(printf '%s' "$digest" | wc -c | tr -d ' ')" -eq 64 || blocked_assignment 'raw SHA-256 is not 64 hex characters'
  done
  case "$CE_LANE_ID" in
    *[!a-z0-9-]*|'') blocked_assignment 'bad lane_id' ;;
  esac
  case "$CE_RUN_ID" in
    *[!A-Za-z0-9._-]*|'') blocked_assignment 'bad run_id' ;;
  esac
  case "$CE_RUN_KIND" in
    fixture_canary|target_preflight|pilot|campaign|resume) ;;
    *) blocked_assignment 'bad run kind' ;;
  esac
  test "$(pwd -P)" = "$CE_WORKTREE" || blocked_assignment 'wrong working directory'
  test "$(git rev-parse --show-toplevel)" = "$CE_WORKTREE" || blocked_assignment 'wrong Git root'
  test "$(git rev-parse HEAD)" = "$CE_EXPECTED_HEAD" || blocked_assignment 'HEAD mismatch'
  test -z "$(git status --porcelain --untracked-files=no)" || blocked_foreign 'tracked path is dirty'
  if test "$CE_RUN_KIND" != resume; then
    test -z "$(git status --porcelain --untracked-files=all)" || blocked_foreign 'first-launch worktree is not clean'
  fi
  test -f ".codex/worktree-checkpoints/$CE_LANE_ID.json" || blocked_assignment 'lane checkpoint missing'
  test -e "$CE_MANIFEST" || blocked_assignment 'manifest path missing'
  test -e "$CE_AUTHORIZATION" || blocked_assignment 'authorization path missing'
  test "$CE_RUN_ROOT" = "scratch/runs/$CE_LANE_ID/$CE_RUN_ID" || blocked_assignment 'run root mismatch'
  printf '%s\n' 'CAP_CONFIG_SHELL_PREFLIGHT=PASSED'
)
```

Perform an early rejection check on both assignment inputs through
descriptor-relative, component-wise no-follow opens. This catches bad paths,
links, and raw hashes before planning; it is not the consuming command's
custody proof:

```bash
(
  uv run --isolated --frozen python - \
    "$CE_WORKTREE" \
    "$CE_MANIFEST" "$CE_MANIFEST_RAW_SHA256" \
    "$CE_AUTHORIZATION" "$CE_AUTHORIZATION_RAW_SHA256" <<'PY'
import hashlib
import os
import stat
import sys
from pathlib import Path, PurePosixPath


def fail(message: str) -> None:
    raise SystemExit(f"BLOCKED_INPUT_CUSTODY: {message}")


def hash_regular_beneath(root_fd: int, label: str, raw_path: str) -> str:
    if not raw_path.isascii() or "\\" in raw_path:
        fail(f"{label}: path is not canonical ASCII POSIX")
    path = PurePosixPath(raw_path)
    if (
        path.is_absolute()
        or not path.parts
        or raw_path != path.as_posix()
        or any(part in {"", ".", ".."} for part in path.parts)
    ):
        fail(f"{label}: unsafe relative path")

    directory_fd = os.dup(root_fd)
    try:
        for part in path.parts[:-1]:
            next_fd = os.open(
                part,
                os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW,
                dir_fd=directory_fd,
            )
            os.close(directory_fd)
            directory_fd = next_fd
        file_fd = os.open(
            path.parts[-1],
            os.O_RDONLY | os.O_CLOEXEC | os.O_NOFOLLOW,
            dir_fd=directory_fd,
        )
        try:
            metadata = os.fstat(file_fd)
            if not stat.S_ISREG(metadata.st_mode) or metadata.st_nlink != 1:
                fail(f"{label}: input is not a single-link regular file")
            digest = hashlib.sha256()
            while chunk := os.read(file_fd, 1024 * 1024):
                digest.update(chunk)
            return digest.hexdigest()
        finally:
            os.close(file_fd)
    except OSError as error:
        fail(f"{label}: no-follow open failed: {error}")
    finally:
        os.close(directory_fd)


repo = Path(sys.argv[1]).resolve(strict=True)
root_fd = os.open(
    repo,
    os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC | os.O_NOFOLLOW,
)
try:
    for label, relative_path, expected_sha256 in (
        ("manifest", sys.argv[2], sys.argv[3]),
        ("authorization", sys.argv[4], sys.argv[5]),
    ):
        observed = hash_regular_beneath(root_fd, label, relative_path)
        if observed != expected_sha256:
            fail(f"{label}: raw SHA-256 mismatch")
finally:
    os.close(root_fd)

print("CAP_CONFIG_INPUT_CUSTODY=PASSED")
PY
) || { printf '%s\n' 'BLOCKED_INPUT_CUSTODY: preflight command failed'; false; }
```

Expected intermediate success tokens:

```text
CAP_CONFIG_SHELL_PREFLIGHT=PASSED
CAP_CONFIG_INPUT_CUSTODY=PASSED
```

Validate the checkpoint before creating the generated root. The read-only
`jq` calls do not rewrite either JSON input. On a first launch, the hygiene
report may contain only the expected missing-run-manifest scope issue; on a
resume it must contain no issue:

```bash
(
  set -e
  set -o pipefail
  uv run --isolated --frozen python scripts/check_worktree_hygiene.py \
    report --lane "$CE_LANE_ID" |
    jq -s -e \
      --arg lane "$CE_LANE_ID" \
      --arg head "$CE_EXPECTED_HEAD" \
      --arg kind "$CE_RUN_KIND" \
      --arg root "$CE_RUN_ROOT" \
      --arg checkpoint ".codex/worktree-checkpoints/$CE_LANE_ID.json" \
      'length == 1 and
       .[0].schema == "worktree-hygiene-report/v1" and
       .[0].lane_id == $lane and
       .[0].head == $head and
       .[0].checkpoint == $checkpoint and
       (.[0].counts | type) == "object" and
       (.[0].issues | type) == "array" and
       (if $kind == "resume" then
          .[0].blocking == false and (.[0].issues | length) == 0
        else
          .[0].blocking == true and
          (.[0].issues | length) >= 1 and
          all(.[0].issues[];
            .reason == "DECLARED_SCOPE_INVALID" and
            .detail == ("generated root lacks a unique standard or P97 run manifest: " + $root))
        end)'

  jq -e \
    --arg lane "$CE_LANE_ID" \
    --arg owner "$CE_LANE_OWNER" \
    --arg base "$CE_LANE_BASE_HEAD" \
    --arg root "$CE_RUN_ROOT" \
    '.schema == "worktree-lane-checkpoint/v1" and
     .lane_id == $lane and
     .owner == $owner and
     .base_head == $base and
     .generated_roots == [$root]' \
    ".codex/worktree-checkpoints/$CE_LANE_ID.json"
  printf '%s\n' 'CAP_CONFIG_ASSIGNMENT_PREFLIGHT=PASSED'
) || { printf '%s\n' 'BLOCKED_CHECKPOINT'; false; }
```

The hygiene query invokes the authoritative checkpoint schema and self-hash
checks. The direct query then binds the exact owner, lane base, and declared run
root. Any other issue yields `BLOCKED_CHECKPOINT`; only success prints
`CAP_CONFIG_ASSIGNMENT_PREFLIGHT=PASSED`.

If the worktree contains foreign changes, stop with
`BLOCKED_FOREIGN_WORKTREE_STATE`. Do not reset, stash, unstage, delete, or
commit another lane's paths.

## Encoding baseline — RUN NOW

Use an isolated, frozen uv environment so the worktree does not acquire a local
`.venv` or dependency drift:

```bash
env \
  PYTHONUTF8=1 \
  PYTHONIOENCODING=utf-8 \
  PYTHONHASHSEED=0 \
  PYTHONDONTWRITEBYTECODE=1 \
  OMP_NUM_THREADS=1 \
  OPENBLAS_NUM_THREADS=1 \
  MKL_NUM_THREADS=1 \
  NUMEXPR_NUM_THREADS=1 \
  VECLIB_MAXIMUM_THREADS=1 \
  TZ=UTC \
  uv run --isolated --frozen pytest -p no:cacheprovider \
    census/cap_configuration/tests
```

The cap-configuration test suite must pass (the current implementation runs 236
tests). Any failure is `BLOCKED_ENCODING_BASELINE`.

Run the byte-contract probe:

```bash
env \
  PYTHONUTF8=1 \
  PYTHONIOENCODING=utf-8 \
  PYTHONHASHSEED=0 \
  PYTHONDONTWRITEBYTECODE=1 \
  uv run --isolated --frozen python - <<'PY'
import sys

from census.cap_configuration import (
    canonical_json_bytes,
    parse_stored_json_bytes,
    raw_sha256,
    stored_json_bytes,
)

value = {"accent": "\u00e9", "pi": "\u03c0"}
canonical = canonical_json_bytes(value)
stored = stored_json_bytes(value)

assert sys.flags.utf8_mode == 1
assert canonical == b'{"accent":"\xc3\xa9","pi":"\xcf\x80"}'
assert stored == canonical + b"\n"
assert parse_stored_json_bytes(stored) == value
assert canonical_json_bytes({"accent": "\u00e9"}) != canonical_json_bytes(
    {"accent": "e\u0301"}
)
assert len(raw_sha256(stored)) == 64
print("CAP_CONFIG_ENCODING_PREFLIGHT=PASSED")
PY
```

Expected token:

```text
CAP_CONFIG_ENCODING_PREFLIGHT=PASSED
```

This probe checks strict UTF-8 mode, exact non-ASCII UTF-8 bytes, compact sorted
JSON, one storage newline, exact-byte parsing, absence of silent Unicode
normalization, and SHA-256 shape. It is a transport guard, not validation of
the mathematical encoding.

## Implementation readiness — RUN NOW

Run this in a subshell. It must find all six runtime modules, the frozen spec,
and the wrapper without closing the operator's shell:

```bash
(
  missing=0
  for path in \
    census/cap_configuration/universe.py \
    census/cap_configuration/symmetry.py \
    census/cap_configuration/replay.py \
    census/cap_configuration/piqd_adapter.py \
    census/cap_configuration/campaign.py \
    census/cap_configuration/validate.py \
    docs/specs/p97-piqd-cap-configuration-census-v1.md \
    scripts/test-p97-piqd-cap-configuration-census.sh
  do
    if test ! -f "$path"; then
      printf 'MISSING %s\n' "$path"
      missing=1
    fi
  done
  if test "$missing" -ne 0; then
    printf '%s\n' 'CAP_CONFIG_READINESS=BLOCKED_IMPLEMENTATION_INCOMPLETE'
    exit 20
  fi
  printf '%s\n' 'CAP_CONFIG_READINESS=IMPLEMENTED_FIXTURE_ONLY_UNQUALIFIED'
)
```

The implementation presence gate does not qualify live operation. Before this
document can say `READY`, all of the following must also be true:

- `scripts/test-p97-piqd-cap-configuration-census.sh` exits zero;
- the exact CLI help and zero-network `plan` tests below pass;
- the standalone validator uses no network and no solver;
- fixture tests cover SAT, contradictory UNSAT, forced UNKNOWN, nontrivial
  symmetry, deliberate omission, mutations, request replay, lifecycle faults,
  and crash/restart;
- a reviewed T0/T1 packet exists for the assigned live target;
- a non-null parent-authorization schema is frozen, implemented, and reviewed;
- one-process resource enforcement and identity capture pass; and
- an independent low-level operator runs the exact `fixture_canary` sequence
  below from a clean isolated worktree and reproduces the retained artifacts.

Until then, keep the runbook state
`IMPLEMENTED_FIXTURE_ONLY_UNQUALIFIED`, and stop any live operation with the
applicable gate code. Do not use a nearby P97 runner, raw `piqc submit`, a
generic SMT script, or direct HTTP calls as a substitute.

## Required command contract — RUN WHEN READY

The implemented runtime provides this single cap-owned command surface:

```text
python -m census.cap_configuration.campaign plan MANIFEST RUN_ROOT --authorization AUTHORIZATION
python -m census.cap_configuration.campaign run MANIFEST RUN_ROOT --authorization AUTHORIZATION --base-url PIQD_BASE_URL
python -m census.cap_configuration.campaign status RUN_ROOT
python -m census.cap_configuration.validate MANIFEST RUN_ROOT
```

Normative behavior:

- `plan` is zero-network and zero-solver. It validates the immutable manifest,
  T0/T1 records, source snapshots, authorization, ordered universe, orbit
  ledger, variable maps, atom/omission ledgers, resource policy, and lane/run
  identities. It atomically creates the declared run root and its
  `worktree-run-manifest/v1`. It performs component-wise descriptor-relative
  no-follow opens, hashes and parses the bytes from the held descriptors,
  atomically publishes immutable manifest/authorization/source snapshots, and
  consumes those snapshot bytes for planning. It never validates a path and
  then reopens that path as the authority.
- `run` executes or resumes the one authenticated campaign described by the
  manifest. Resume uses the same command, manifest, root, authorization, and
  PIQD identity. It resumes from authenticated state, never from a directory
  listing. Before its first mutation it performs a read-only live attestation
  of the expected PIQD daemon and solver identities. On first launch it
  validates and atomically consumes the current authorization through one held
  descriptor, cross-checks it against the planned snapshot, and executes from
  held run-root snapshot descriptors. On resume it executes from those same
  authenticated snapshots and the matching consumption record. It never
  reopens an unchecked caller path.
- `status` is read-only and may report structural or observed state only. It
  cannot authenticate a pass or make a mathematical claim.
- `validate` is the authoritative zero-network, zero-solver replay of the
  current retained prefix. It validates complete and incomplete runs, reports
  coverage separately, reconstructs identities and exact SAT replay from disk,
  and verifies the descriptor/snapshot/final-recapture custody chain.

The default CLI has no ambient resource/daemon attestor. Therefore a `run`
invocation without a registered attestor, real qualified manifest, and live
qualification must return `BLOCKED_RESOURCE_BOUNDARY` before network access or
PIQD session creation. Tests may inject a fake adapter and attestor at the
Python boundary for the backend-`none` fixture; that test seam is not live
authority.

The `run` command must invoke the registered project-side process supervisor,
verify the manifest-bound supervisor configuration and telemetry sink, and
print `CAP_CONFIG_RESOURCE_ATTESTATION=PASSED` before creating a PIQD session.
For pre-Phase-4 fixture and target-preflight tiers, the attestation binds the
one-process admission and wall boundary and states that no production memory
ceiling is claimed. For pilot/campaign/resume, the attestation binds the
qualified OS CPU/RSS/process/disk enforcement and telemetry identities. Its
retained artifact path and hash come from the frozen spec. An absent token or
artifact is `BLOCKED_RESOURCE_BOUNDARY`. A second per-wave shell launcher is
not permitted.

Use this command matrix; no run kind may borrow another row's shortcuts:

| Run kind | Required gates | Exact command sequence | Additional rule |
| --- | --- | --- | --- |
| `fixture_canary` | Accepted diagnostic/off-spine T0 authorization and Phase 0--2 fixture gates | `plan`, `validate`, `status`, hygiene report | Backend-`none` fixture only; no CLI PIQD run and no successor; injected adapter/attestor is test-only |
| `target_preflight` | T0 + T1a bound to the frozen sample; minimum Phase 1/2 slices pass | `plan`, `validate`, `run`, `validate`, `status`, hygiene report | This produces T1b evidence; only the coordinator may accept `PASSED` |
| `pilot` | Complete matching T0/T1 plus Phase 3/4 gates | `plan`, `validate`, `run`, `validate`, `status`, hygiene report | Surface must match T0; one authorized successor or named pivot only |
| `campaign` | Complete matching T0/T1, accepted pilot, resource qualification, active authorization | `plan`, `validate`, `run`, `validate`, `status`, hygiene report | Execute only the immutable ordered universe in the manifest |
| `resume` | Validator-accepted existing prefix and exact matching authorization-consumption record | `validate`, `run`, `validate`, `status`, hygiene report | Do not call `plan`, create a root, or issue fresh authorization |

Run the frozen test gate:

```bash
bash scripts/test-p97-piqd-cap-configuration-census.sh
```

Then verify that the command surface exists:

```bash
uv run --isolated --frozen python -m census.cap_configuration.campaign --help
uv run --isolated --frozen python -m census.cap_configuration.validate --help
```

If either command, subcommand, or documented option is absent, stop with
`BLOCKED_COMMAND_CONTRACT`.

## Plan the retained run — RUN WHEN READY

Skip this entire section for `resume`; its matrix row begins with validation of
the existing prefix.

The lane checkpoint must already declare `$CE_RUN_ROOT` in `generated_roots`.
Do not create the run root manually.

```bash
uv run --isolated --frozen python -m census.cap_configuration.campaign \
  plan "$CE_MANIFEST" "$CE_RUN_ROOT" \
  --authorization "$CE_AUTHORIZATION"
```

Require all of these from the retained plan result:

- the observed Git/source revision matches the assignment;
- campaign, manifest, target, source, finite-ingress, orbit-ledger, generator,
  validator, solver-profile, resource-policy, and authorization identities
  match;
- every variable is declared exactly once and every readback requests the
  complete variable map;
- named atoms use only `eq`, `ge`, `gt`, `ne`, and two-argument `or_ne`;
- enabled atoms, omitted atoms, source provenance, and omitted source
  hypotheses/predicates are separate ordered ledgers;
- all structured JSON is canonical and every raw-byte digest is recomputed;
- the run manifest repeats the lane checkpoint's `base_head`; and
- no PIQD session, job, receipt, or solver process was created.

Validate the planned prefix offline:

```bash
uv run --isolated --frozen python -m census.cap_configuration.validate \
  "$CE_MANIFEST" "$CE_RUN_ROOT"

ce_require_clean_hygiene || {
  printf '%s\n' 'BLOCKED_HYGIENE'
  false
}
```

Any validator, hygiene, custody, identity, or coverage-structure failure stops
the run before PIQD.

## Execute or resume — RUN WHEN READY (live qualification only)

Before this invocation may make a solver call, confirm that the assignment's
target and resource gates still hold. In particular:

- target mode, polarity, termination policy, and per-branch required outcomes
  are unambiguous;
- T0/T1 records and the manifest bind the same source revision;
- on first launch, the authorization is active, parent-bound, unconsumed, and
  allows exactly this run; on resume, the same authorization has the exact
  validated consumption record already bound to this run and no replacement
  authorization exists;
- one live solver is the default; concurrency above one has a retained
  two-process then four-process qualification;
- production has an external OS CPU/memory supervisor and bound telemetry; and
- the operator has not changed any input or command argument since `plan`.

In the current `IMPLEMENTED_FIXTURE_ONLY_UNQUALIFIED` state, do not proceed to
a live invocation. The default CLI `run` is an intentional fail-closed probe:
without a registered attestor it must return `BLOCKED_RESOURCE_BOUNDARY` before
network access or PIQD session creation. A backend-`none` fixture execution
requires the injected adapter/attestor used by the test suite and is not an
operator-authorized live run.

PIQD service startup, replacement, and upgrades are a separate operations
responsibility. The coordinator supplies the already-qualified endpoint and
identity packet. If the endpoint is unavailable or live attestation disagrees,
report `BLOCKED_PIQD_UNAVAILABLE_OR_DRIFTED`; do not start another daemon,
switch URLs, or call a raw PIQD route from this repository.

Run in the foreground:

```bash
uv run --isolated --frozen python -m census.cap_configuration.campaign \
  run "$CE_MANIFEST" "$CE_RUN_ROOT" \
  --authorization "$CE_AUTHORIZATION" \
  --base-url "$CE_PIQD_BASE_URL"
```

The controller must atomically retain the resource-attestation stage before any
PIQD mutation. If attestation fails, it must publish a durable failure seal and
exit with zero PIQD session creations. The informational output token is:

```text
CAP_CONFIG_RESOURCE_ATTESTATION=PASSED
```

Do not kill the foreground process merely because the token has not appeared
yet; manual termination is not a custody protocol. After `run` returns, the
standalone validator must prove from the append-only stage chain that a valid
attestation precedes every PIQD session/request record. A missing, invalid, or
misordered attestation yields `BLOCKED_RESOURCE_BOUNDARY` and forbids resume.

For resume, first validate the retained prefix, then execute the exact same
`run` command. Do not create a new run root, replace an authorization, or change
limits:

```bash
uv run --isolated --frozen python -m census.cap_configuration.validate \
  "$CE_MANIFEST" "$CE_RUN_ROOT"

uv run --isolated --frozen python -m census.cap_configuration.campaign \
  run "$CE_MANIFEST" "$CE_RUN_ROOT" \
  --authorization "$CE_AUTHORIZATION" \
  --base-url "$CE_PIQD_BASE_URL"
```

A resume is permitted only from a validator-accepted prefix. A lost create,
append, solve, or close response must be reconciled from authenticated exact
state by the controller. The operator never creates a blind replacement
session or manually edits a journal.

## Validate and classify — RUN WHEN READY

After `run` returns, do not immediately rerun it. Perform offline validation:

```bash
uv run --isolated --frozen python -m census.cap_configuration.validate \
  "$CE_MANIFEST" "$CE_RUN_ROOT"

uv run --isolated --frozen python -m census.cap_configuration.campaign \
  status "$CE_RUN_ROOT"

ce_require_clean_hygiene || {
  printf '%s\n' 'BLOCKED_HYGIENE'
  false
}
```

Interpret only the retained, validator-accepted project classification:

| Retained evidence | Classification | Operator action |
| --- | --- | --- |
| SAT with complete exact rational replay | `SAT_SEMANTICALLY_REPLAYED` | Retain and report; it stops only when the T0 termination policy and source-level witness gate say so |
| SAT with missing or rejected replay | `INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED` | Stop; retain raw SAT and replay failure |
| SAT verifier exception or invalid evidence | `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE` | Stop; retain all evidence |
| QF_NRA UNSAT without an independently checked certificate | `UNSAT_DISCOVERY_ONLY` | Diagnostic only; no branch closure |
| UNKNOWN or timeout | `INCONCLUSIVE_UNKNOWN` | Retain; no automatic fallback |
| Solve response lost without authenticated receipt | `INCONCLUSIVE_TRANSPORT_LOSS` | Stop; do not guess |
| Decisive solvers disagree | `INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT` | Stop the affected stratum |
| Malformed packet or custody/identity/protocol failure | No mathematical classification | Fail closed before interpretation |

`COMPLETE` coverage means every declared cell has a validator-accepted retained
diagnostic classification and all attempt/identity checks pass. It does not
prove the ambient theorem. `UNSAT_DISCOVERY_ONLY` is not a proof. A PIQD receipt
is not source validation. A replayed SAT model becomes a counterexample only
after the exact T0 source-witness construction and named consumer accept it.

Under `FIRST_VALID_WITNESS`, an accepted source-level witness may stop the run,
but coverage remains `INCOMPLETE` and every unattempted cell remains
inventoried. Under `NEGATIVE_BRANCH_CLOSURE`, no early stop is allowed.

The operator never performs proof promotion. In particular, an UNSAT-facing
handoff must separately prove that every source-valid geometry covered by T0
maps into the required encoded cells before a checked branch result can be
lifted. A Lean-facing handoff must also bind the exact declaration and
elaborated proposition, ordered hypothesis map, typed finite-universe ingress,
source/import digest, directional semantic bridges, trust-boundary audit, named
consumer, and independent verifier. A pilot whose target, source revision,
finite-ingress schema, hypotheses, atoms, or symmetry action differs from T0 is
fixture evidence only and cannot authorize a target campaign.

## Hard-stop and pivot rules

Stop immediately and report the first applicable reason:

- `BLOCKED_ASSIGNMENT_INCOMPLETE`: missing or ambiguous assignment field;
- `BLOCKED_IMPLEMENTATION_INCOMPLETE`: required runtime artifacts, tests, or
  command contract absent;
- `BLOCKED_T0`: no accepted target/polarity/termination/bridge record;
- `T1_BLOCKED_NO_ORACLE`: no adequate independent source oracle;
- `BLOCKED_T1_BINDING`: T0, T1a, T1b, manifest, source, or sample mismatch;
- `BLOCKED_AUTHORIZATION`: missing, stale, reused, self-issued, or non-parent-bound
  authorization;
- `BLOCKED_ENCODING_OR_REPLAY`: noncanonical bytes, unsupported values,
  incomplete variable map, atom mutation, or exact replay failure;
- `BLOCKED_CUSTODY_OR_IDENTITY`: path, hash, source, session, request, receipt,
  solver, supervisor, or telemetry disagreement;
- `BLOCKED_RESOURCE_BOUNDARY`: uncontrolled memory, process-count violation,
  or missing production supervisor;
- `BLOCKED_PIQD_UNAVAILABLE_OR_DRIFTED`: the assigned daemon is unavailable or
  its live identity does not match the assignment;
- `PIVOT_REQUIRED`: more than 20% inconclusive cells, repeatable replay
  rejection, or projected CPU/disk above the authorized envelope; or
- `BLOCKED_COVERAGE`: missing, duplicate, stale, orphaned, conflicting,
  nonterminal, crossed-identity, or source-omitted cell.

Do not answer a pivot by increasing every timeout. Return to the named
structural filter, variable elimination, smaller subsystem, or theorem
candidate. A solver disagreement, identity/custody failure, uncontrolled
memory, or omitted source-permitted case is a hard stop, not a pivot.

After a completed CEGAR wave, mine only that wave's new data. A proposed cut
stays `CANDIDATE` and cannot prune or contribute to coverage until its exact
source-preservation theorem is checked and the cut becomes `ADMITTED`. Hand the
candidate to the proof owner; the operator does not launch its child.

## Encoding and artifact rules

These rules are mandatory even when a command appears to succeed:

- Structured JSON is compact, key-sorted UTF-8 with exactly one stored terminal
  LF where the schema requires a file. Its structured hash excludes that LF.
- Raw source, SMT-LIB, journal, model, proof, receipt, and log hashes cover the
  exact retained bytes, including every line ending.
- Never pass JSON or SMT-LIB through an editor, `jq` rewrite, clipboard
  formatter, shell interpolation, Unicode normalizer, or CRLF converter.
- JSON values use exact builtin types. Floats, `NaN`, infinities, duplicate
  keys, unknown keys, unsafe paths, and noncanonical integers are rejected.
- Polynomial coefficients and replayed assignments are exact rationals. A
  decimal approximation cannot be promoted to an exact value.
- Identifiers and run-path components are ASCII. Mathematical Unicode belongs
  in canonical structured values and is serialized by the frozen helper. The
  v1 helper does not normalize Unicode: visually similar NFC and NFD strings
  have different bytes and hashes, so never retype them by hand.
- The producer and execution boundary reconstruct the journal independently;
  the retained original SMT-LIB and normalized journal are both hashed.
- Attempts and stage records are append-only. Atomic create-once publication,
  directory `fsync`, locks, no-follow opens, link-count checks, immutable
  snapshots, and final recapture are controller duties.
- Bulk logs, solver streams, caches, and models stay below the declared
  generated root. Promote only authenticated manifests, receipts, validators,
  compact reports, certificates, and unique replay sources.

## Operator report

Send one concise report after validation or at the first stop. Do not paste raw
solver logs.

```text
CAP_CONFIG_OPERATOR_REPORT
runbook_state:
repo_head:
lane_id:
run_id:
run_kind:
run_root:
campaign_id:
manifest_sha256:
target_mode:
termination_policy:
source_revision:
authorization_sha256:
authorization_consumption_sha256:
piqd_daemon_identity:
solver_identity:
solver_profile_identity:
session_request_receipt_inventory_path:
session_request_receipt_inventory_sha256:
supervisor_identity:
supervisor_attestation_sha256:
telemetry_identity:
exact_command:
command_exit_code:
validated_project_status:
coverage_status:
raw_cell_count:
canonical_cell_count:
orbit_count:
classification_counts:
sat_replay_successes:
sat_replay_failures:
unknown_or_failure_count:
orphan_count:
peak_solver_processes:
peak_rss:
disk_bytes:
validator_command:
validator_exit_code:
hygiene_status:
claim_flags:
first_stop_or_pivot_reason:
explicitly_not_claimed:
next_action_requested:
```

The `explicitly_not_claimed` field must name every unavailable claim, including
source entitlement, theorem coverage, universal lift, Lean closure, checked
UNSAT, or complete census coverage as applicable.

## Maintainer gate for changing this runbook to READY (live qualification)

Before changing `Runbook state` to `READY`, the implementing reviewer must:

1. replace the verified revision with the tested implementation commit;
2. freeze the cap protocol under `docs/specs/`;
3. verify the implemented exact four-command surface above;
4. make the readiness, frozen test, help, plan, live fixture, resume, offline
   validation, and hygiene commands pass from a clean isolated worktree;
5. prove that `uv run --isolated --frozen` leaves no worktree-local `.venv`,
   pytest cache, bytecode cache, or undeclared generated root;
6. retain command outputs, exit-code semantics, and a complete sample operator
   report in the spec or tests;
7. run an adversarial encoding/custody/replay audit; and
8. have an independent low-level agent follow this document without unstated
   choices.

Until all eight items pass, this document is an executable stop guide and
implementation command contract, not a live-search launcher.
