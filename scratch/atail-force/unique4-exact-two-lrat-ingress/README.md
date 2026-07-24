# Two-shard pure-RUP ingress

**Status:** the real p5 normalized LRAT has been deterministically split and
structurally validated. The Lean checker and canonical text ingress pass a
bounded end-to-end replay. A real one-shot first-shard replay was attempted
and exposed a structural elaboration bottleneck, so the next endpoint is a
sequence of bounded, independently rebased windows. This is not yet a
kernel-checked p5 UNSAT theorem.

## Data flow

```text
hashed trimmed core CNF + normalized pure-RUP LRAT
  -> streaming materializer
  -> shard 1 in global clause IDs
  -> exact active-clause checkpoint + global/local map
  -> shard 2 in fresh local clause IDs
  -> independent sound Lean shard checks
  -> implication/unsatisfiability composition
```

The companion checker is the importable production module
[`CheckpointedRup.lean`](../../../lean/Erdos9796Proof/P97/Certificate/CheckpointedRup.lean).
Its logical boundary is:

- `checkRebase_sound`: shard 1 implies the exact compact checkpoint;
- `checkTerminal_sound`: shard 2 makes that checkpoint unsatisfiable;
- `checkTwo_sound`: the original CNF is therefore unsatisfiable;
- `TextIngress.checkRebaseText_sound` and
  `TextIngress.checkTerminalText_sound`: the two large shards may be replayed
  and elaborated in separate modules; and
- `TextIngress.checkTwoText_sound`: combined canonical-text entry point for
  bounded tests.

The checker supports only RUP additions and deletions. There is no RAT action,
and malformed text, failed RUP, an inexact checkpoint, or a missing local-ID
translation fails closed.

## Materializer guarantees

`materialize_checkpointed_rup.py` streams the LRAT instead of retaining the
whole proof. It validates:

- the source certificate, CNF, and LRAT hashes and sizes;
- exact DIMACS counts and literal ranges;
- canonical ASCII/LF input and normalized LRAT syntax;
- dense append numbering;
- nonduplicate, nontautological source and learned clauses;
- positive, earlier, active RUP hints;
- active, nonrepeated deletion targets;
- an exact checkpoint ordered by active global clause ID;
- an injective and total global-to-local rebase for shard 2; and
- a terminal empty clause with no later actions.

These are structural checks, not RUP checks. The package manifest therefore
retains the status:

```text
STRUCTURALLY VALIDATED PURE-RUP SHARDS; LEAN REPLAY REQUIRED
```

## Tests and package verification

From this directory:

```bash
env UV_CACHE_DIR=../../../.uv-cache \
  uv run python -m unittest -v

env UV_CACHE_DIR=../../../.uv-cache \
  uv run python materialize_checkpointed_rup.py \
  --verify-package generated/p5-largest
```

The suite has 23 tests covering deterministic rebasing, relocation-stable
digests, deletion translation, parser mismatches, RAT rejection, inactive
hints, duplicate and tautological clauses, output overwrite refusal, package
drift, and replay-attestation drift.

To reproduce the real package:

```bash
env UV_CACHE_DIR=../../../.uv-cache \
  uv run python materialize_checkpointed_rup.py \
  --source-certificate \
    ../unique4-exact-two-core-map/p5-largest.trimmed-certificate.json \
  --output-dir generated/p5-largest \
  --second-shard-first-addition 500806
```

The output directory must not already exist.

## Real p5 package

The current package is ignored generated data at `generated/p5-largest/`.
Its relocation-stable package SHA-256 is:

```text
4229c86fd26f38e812d20467c68fbefa04838101611b6e73b00210cb0a444232
```

It binds:

- 616 variables and 8,703 base clauses;
- 984,205 additions, 487,508 deletion actions, and 44,826,270 hints;
- shard 1: 492,102 additions and 21,491,717 hints;
- a 23,857-clause checkpoint;
- shard 2: 492,103 additions and 23,334,553 hints; and
- terminal empty global clause ID 992,908.

The split is immediately before global addition 500,806. Shard 2 starts at
local addition ID 23,858.

The package binds the exact 32,211-byte checker source with SHA-256
`6c670c24b989f8024f43f6362ffc031c040eba77e68293060aa65cb9cb25a8e8`.

## Replay attestation

`attest_checkpointed_rup_replay.py` validates a caller-supplied replay record
and prints a canonical attestation digest:

```bash
env UV_CACHE_DIR=../../../.uv-cache \
  uv run python attest_checkpointed_rup_replay.py \
  --record path/to/replay-record.json
```

It cannot run Lean, create a success record, or mutate the structural package.
A valid record must bind the verified package digest, every replay input, the
exact checker already bound by that package, a PASS replay transcript, the
fully qualified theorem name, and a PASS axiom report explicitly excluding
`sorryAx`.

## piqd boundary

The current `piqd` and `piqd-lrat` implementation already provides reusable
DRAT-to-LRAT production, LRAT compaction, blob hashing, manifests, and
one-shot `verifyCert_correct` Lean emission. Its chunking splits clause
definitions, not LRAT checking. It has no resumable clause state, exact
checkpoint check, or sequential shard composition, so it cannot replace this
two-shard checker yet.

## Real one-shot replay result

`emit_checkpointed_rup_replay.py` generated separate `Common`, `First`,
`Second`, and `Compose` modules for the real package. `Common` compiled. The
first-shard theorem initially exceeded the default recursion limit. With
`maxRecDepth = 2000000`, unlimited heartbeats, and a 2 GiB Lean stack, its
kernel computation continued for more than 20 minutes and reached at least
23 GiB resident memory without producing `First.olean`; it was interrupted.
The second shard was not attempted because it has the same structural shape.

The bottleneck is not the soundness argument. A one-shot theorem first creates
and retains a 160 MB character list, the parsed line and action structures,
the entire replay state, and a giant final checkpoint equality. Merely raising
Lean limits does not bound that state.

The next replayable design preserves the two logical shards but subdivides
each into independently checked windows. Every window must carry an exact
dense start CNF, a bounded LRAT action file, an exact dense end CNF, and the
global/local ID map. No LRAT line may be split. Initial caps are 4,000 actions
and 4 MiB per action file, with endpoint-CNF size monitored as well. The
window implications then compose transitively; the last window of shard 2
derives the empty clause.

Adjacent window modules must reference the same shared canonical checkpoint
array definition. `TextIngress.checkRebaseText_sound_of_parse` exports each
accepted window as a plain implication over caller-named arrays;
`TextIngress.composeRebase` and `TextIngress.closeRebase` let the coordinator
join only those imported facts without parsing or replay.

See [`real-p5-kernel-replay-2026-07-23.md`](real-p5-kernel-replay-2026-07-23.md)
for the empirical replay record. Until the windowed replay succeeds, this
package closes no Lean theorem and no production `sorry`.
