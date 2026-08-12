# P97 PIQD Rigid221 pentagon contract, v1

## Status and scope

This is a finite, source-authenticated diagnostic route for the Rigid221
pentagon oracle. It does not prove Problem 97, close a Lean obligation, or
promote a theorem. A proofless `UNSAT` response and any named core remain
diagnostic. `UNKNOWN` and an unreconciled transport loss are inconclusive. A
`SAT` response is retained only after an independent exact-rational replay of
the asserted source semantics.

Proof-blueprint session `019fdf9c` is unchanged: **OPEN**, **OFF_SPINE**.

The production/default backend is PIQD. The old process-local Z3 probe is
available only through the explicit `--backend legacy-local-z3` option in
`census/rigid221_pentagon_oracle.py`. The production adapter neither imports nor
calls the private local `_probe_system` implementation, and there is no local
fallback after any PIQD failure.

## Entry points

Run the immutable PIQD campaign with an absolute, absent output path:

```bash
uv run python census/rigid221_pentagon_oracle.py \
  --output "$PWD/scratch/rigid221-pentagon-piqd-run"
```

The equivalent direct adapter entry point is:

```bash
uv run python census/rigid221_pentagon_piqd.py \
  --output "$PWD/scratch/rigid221-pentagon-piqd-run"
```

Validate an already-published tree offline:

```bash
uv run python census/rigid221_pentagon_piqd.py \
  --check "$PWD/scratch/rigid221-pentagon-piqd-run"
```

`--check` constructs no transport and performs no daemon or solver call. It
rechecks the complete manifest, exact archived descriptor/journal/source
custody, solve/receipt/session identities, result digests, source-semantic
bindings, independent SAT replay, and named-core label bindings against the
current source files.

## Execution topology

The campaign is one worker, strictly sequential, and one-shot:

1. create one fresh PIQD SMT session using solver `z3`;
2. require an empty receipt history;
3. assert the exact frozen journal in its recorded order;
4. fetch `/smt2` and require byte equality with the frozen journal;
5. perform exactly one solve;
6. cross-check the response, durable receipt, session, request, and result;
7. close the session before creating the next session.

Session identifiers may not repeat anywhere in a campaign. There is no shared
solver state, concurrent worker, second solve, retry in a live session, or
local fallback.

Stages 0--4 use the maintained public metric source-semantic builder and the
maintained public single-Z3 PIQD adapter. Stage 5 uses the maintained public
source-semantic envelope and single-Z3 PIQD API with its own source-derived
cap-layer encoding and exact replay:

| Stage | Finite sweep | Interpretation |
|---|---|---|
| 0 | SAT/UNSAT smoke pair | Encoding and replay diagnostic |
| 1 | three row configurations over all 60 reflected cyclic orders on six labels | Survivor discovery only |
| 2 | data-dependent fanout over stage-1 SAT survivors | Diagnostic refinement only |
| 3 | two duplicate-centre configurations over 60 orders | Diagnostic obstruction search |
| 4 | three off-class variants over all 360 reflected cyclic orders on seven labels | Encoded-subsystem evidence only |
| 5 | four cap-layer variants over all 360 orders | Proved-source consequence sweep, still proofless/off-spine |

If the first unlabelled `base+chord` query returns `UNSAT`, one additional
fresh session runs the named-core form for that exact order. No named-core job
is inferred from `UNKNOWN`, transport loss, or another variant.

## Exact source and query custody

Each query archives:

- a canonical descriptor and its exact bytes;
- the exact SMT-LIB journal and command order;
- a canonical source-semantic record;
- byte-for-byte snapshots of the oracle, this adapter, the maintained metric
  adapter, and the maintained neutral source-semantic adapter;
- source order, sizes, and SHA-256 digests;
- semantic order, variant, group order, atoms, assumptions, and readback order.

Only exact native `Path` objects and exact built-in scalar/container types are
accepted at the custody boundary. Source paths are opened component by
component with `O_NOFOLLOW`. Captures require a regular file, link count one,
bounded size, stable descriptor identity before and after the read, and a
second componentwise path binding to the same identity.

## Exact-rational SAT replay

Stages 0--4 delegate replay to the public metric adapter. Stage 5 parses the
requested readback as bounded exact rational S-expressions and evaluates,
without a solver:

- the coordinate gauge;
- every pairwise distinctness constraint;
- every strict convex-order cross product;
- apex-circle equalities and the exact off-class condition for `w`;
- row-`u` and row-`xv` equidistance and optional exact-class exclusions;
- chord nondegeneracy and every signed-side constraint;
- the deliberate same-side sanity contradiction when selected.

Missing, extra, duplicate, reordered, algebraic, decimal, malformed, or
non-rational readback fails closed. A model string by itself is never accepted.

## Named-core contract

Every asserted group is guarded by one exact assumption term. Its
`assumption_label` is derived from a canonical binding containing:

- the exact group index, tag, and atom list;
- the exact matching `rigid221_pentagon_oracle._CAP_LAYER_LEDGER` entry;
- the digest of the entire canonical ledger;
- the oracle source path, byte count, and byte digest;
- a digest of that complete binding.

The exact ordered, non-null `assumption_labels` array is part of the solve
request digest and durable receipt. For `UNSAT`, the exact ordered, non-null
`core_labels` array must bind member-by-member to the returned assumption core.
The response and receipt must agree on answer, labels, request ID, request
digest, and the current named-core-aware result digest; the receipt envelope
and session paths must bind the same fresh session.

Labels are names only. They do not confer source entitlement, theorem status,
or proof status. The archived exact source binding is the evidence that gives
a label meaning, and the result explicitly records `source_entitlement=false`.

## Create-once publication

The output target must not exist. Work is written under an unpredictable
sibling staging directory while holding its parent and staging directory file
descriptors. Every file is created with `O_EXCL|O_NOFOLLOW`, fsynced, and
required to be one private regular file. Before publication, a bounded
descriptor-relative inventory reopens and hashes every file, rejecting links,
nonregular nodes, multiply linked files, oversize files, and identity changes.

Publication rebinds the parent pathname to the held parent identity and uses an
atomic no-replace directory rename (`renameatx_np(RENAME_EXCL)` on macOS or
`renameat2(RENAME_NOREPLACE)` where available). A target that appears during
the run is not overwritten or removed. On any custody or publication failure,
the implementation does not delete a hostile/preexisting target or the held
staging evidence.

## Verification

The focused test is fake-transport only and must remain single-process with
all numerical-library thread caps set to one:

```bash
scripts/test-p97-piqd-rigid221-pentagon.sh
```

It covers default/no-private-local routing, explicit legacy routing, fresh
sequential sessions, exact query/source/order/group custody, exact-rational SAT
replay and tamper, named-core and cross-session/digest tamper, propagation of
unexpected `Exception` and `BaseException` without fallback, source and
publication symlink/hardlink/nonregular/oversize/TOCTOU attacks, atomic
create-once races, and zero-transport `--check` routing. It does not start a
daemon or solver and does not invoke Lean.
