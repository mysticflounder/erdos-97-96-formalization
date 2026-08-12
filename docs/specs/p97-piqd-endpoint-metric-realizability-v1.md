# P97 PIQD endpoint metric realizability v1

## Scope and status

This adapter onboards only the staged `_probe_system` QF_NRA path in
`metric_realizability_probe.py`. It is finite diagnostic infrastructure.
It does not establish a theorem, a universal or global result, a Lean fact, or
a kernel-checked proof. In particular, PIQD `UNSAT` remains discovery evidence,
not proof closure.

Audit reference: `#5299`. Proof-blueprint session `019fdf9c` remains unchanged,
open, and off-spine. Hardening reviews `#5304` and `#5305` do not change that
mathematical status.

## Routes

`piqd` is the default production route. It requires `workers=1`, performs no
local fallback, and never uses a process pool. `legacy-local-z3` is retained
only as an explicit compatibility route. Results record the requested route,
whether PIQD was submitted, and `local_fallback: false`.

The deterministic equality prefilters continue to run before either solver.
When one closes a system, the result records the prefilter route and PIQD is not
contacted.

## Stage protocol

Each submitted stage receives a fresh PIQD SMT session and exactly one solve:

1. `exact-metric-relaxation`: gauge, selected-row equalities, exact-row
   exclusions, and pairwise distinctness;
2. `full-convex`: the exact stage plus strict convexity in recorded order;
3. `convex-only-relaxation`: gauge, selected-row equalities, pairwise
   distinctness, and strict convexity, submitted only when the full stage
   returns raw `UNKNOWN`.

No other endpoint check is submitted. A terminal exact/full `UNSAT`, or an
exactly replayed full `SAT`, stops the sequence. A convex-only `SAT` is not a
metric realization and therefore leaves the overall status `UNKNOWN`.

Every fixture-only `smoke-sat` stage also asserts the authenticated rational
coordinate pins
`x2=4/5, y2=3/5, x3=0, y3=1, x4=-4/5, y4=3/5`. These six equalities are part
of the stage constraint counts. They make the smoke a deterministic rational
fixture without adding algebraic-number support to the production verifier.

The journal contains normalized state commands only. It has no `check-sat`,
model command, push/pop, reset, exit, or solver-specific terminal command.

## Source and lifecycle custody

The adapter uses only the maintained public functions
`validate_authenticated_single_solver_query` and
`run_authenticated_single_solver_query`. Before submission it freezes and
hash-binds:

- the exact system, order, rows, stage, and constraint counts;
- fixture-only identity and the exact canonical rational pin packet;
- the exact endpoint adapter, legacy producer, and maintained generic-adapter
  source bytes;
- each supplied input byte stream and an exact reconstruction check;
- normalization and journal bytes;
- variable/readback order, query descriptor, timeout, solver profile, and false
  claim ledger.

Production submissions require a nonempty list of exact source paths. Ingress
first rejects lexical `..` components and requires every normalized input to be
strictly contained within the loaded exact repository root, before transport or
output staging. Published source records use the resulting repo-relative path.
Capture then walks every path component with `O_NOFOLLOW`, rejects symlinks,
hard links, nonregular and oversized files, and revalidates file identity and
bytes after the read. Public source, output, and explicit repository-root
boundaries accept only the native concrete platform `Path` type; user-defined
subclasses are rejected before path protocol or property dispatch. The source
bytes must reconstruct the selected system exactly. Only
the two exact built-in smoke controls can use the private fixture-only seam;
that seam rejects nonempty production sources. Only `smoke-sat` receives the
six pins. Nonfixture source records authenticate an empty pin packet and their
queries contain no pin assertions.

The complete result tree is first built under a held private directory. It
persists an immutable stage-result ledger, source record, descriptor,
original/journal query, and source snapshots beside the maintained adapter's
session, SMT export, response, receipt, and close artifacts. Session identity
must be fresh across all stages; response, receipt, solver identity, base
journal, and query hashes must cross-bind exactly.

Before publication, the adapter records and revalidates an exact recursive
inventory including byte hashes and inode metadata. Publication is an atomic
platform no-replace directory rename, followed by final-path rebind and exact
inventory revalidation. Symlink, hard-link, replacement, or platform
publication ambiguity fails closed.

### Independent published-output validation

`validate_published_output(output_directory, repo_root=None)` is the public,
offline acceptance boundary for a published endpoint result. The equivalent
command is:

```bash
uv run python -m census.endpoint_confinement.metric_realizability_piqd \
  --check PATH_TO_ONE_PUBLISHED_SYSTEM_DIRECTORY
```

The check holds no-follow descriptors for the parent and output root, captures
the complete tree with exact bytes and inode identities, and requires the
manifest inventory to match with no missing or extra entry. It then:

1. reconstructs every source record, descriptor, normalized query, and source
   snapshot from the selected system and the current endpoint, producer, and
   maintained generic-adapter bytes;
2. validates the archived current generic session, export, pre-solve and final
   receipts, solve or reconciliation record, and terminal session, including
   session, solver, source, query, deadline, and result-digest bindings;
3. independently replays every asserted atom of each archived `SAT` model with
   exact rationals, including all authenticated fixture pins;
4. re-derives the permitted stage order and overall result; and
5. recaptures every byte and inode and reopens the parent/root paths before
   returning success.

The validator is intentionally current-source: a publication made from
different endpoint, producer, generic-adapter, input, normalization, query, or
solver-profile bytes does not validate against this checkout. Production input
paths must be repo-relative and re-readable with componentwise `O_NOFOLLOW`;
the empty-input exception remains restricted to the two named fixture smokes.
The checker never creates a transport and never contacts PIQD or Z3. Symlink,
hard-link, nonregular, oversized, replacement, noncanonical or structurally
unbounded JSON, or crossed stage/session/source/query/model/receipt identity is
a hard validation failure.

The maintained generic adapter exposes public live-query validation and run
APIs, but no standalone validator for an archived generic run. Therefore this
endpoint public checker validates the maintained current archive schema from
captured bytes itself while continuing to use the maintained public
source-query validator for reconstruction. This is an endpoint-scoped result
validator, not a generic PIQD proof checker.

## Result acceptance

Raw `UNSAT` is labeled `Z3_UNSAT_DIAGNOSTIC_NOT_KERNEL_CHECKED`.
`UNKNOWN`, transport loss, malformed state, identity mismatch, receipt/query
tampering, and verifier errors are inconclusive or fail closed.

A raw `SAT` is effective only after an independent exact-rational verifier
parses every requested coordinate and rechecks every asserted atom for that
stage:

- all four scalar gauge equalities;
- all six authenticated rational fixture equalities when fixture-only
  `smoke-sat` is selected;
- every selected-row squared-distance equality;
- every exact-row nonmember inequality;
- every pairwise distinctness inequality; and
- every strict-convexity orientation inequality when present.

The verifier rejects missing, duplicate, extra, algebraic (including Z3
`root-obj`), or otherwise unparseable values. Its local S-expression parser has
explicit byte, token, and nesting bounds and does not call a private
maintained-adapter helper. Diagnostic floating margins and the daemon verdict
are not acceptance criteria.

## CLI and testing

The CLI defaults to `--solver-route piqd --workers 1`. Live use requires a PIQD
server and a fresh custody root selected by `--piqd-output-directory`. The
explicit compatibility switch is `--solver-route legacy-local-z3`.
`--resume` is rejected on the PIQD route in v1, before smoke, input, output, or
transport work. `--explain-exact-core` also requires the explicit legacy route
and is gated before PIQD setup.

`scripts/test-p97-piqd-endpoint-metric.sh` uses a current-schema in-memory fake;
it does not contact a daemon or invoke a solver. It covers exact smoke replay,
diagnostic `UNSAT`, `UNKNOWN`, stage order and freshness, identity/source/query/
receipt/model tampering, algebraic rejection, no fallback, one-worker policy,
route dispatch, strict input types, local-only CLI gates, unexpected exception
propagation, outside-repository and lexical source-path escapes, source
replacement, and create-once publication
against replacement, symlink, and hard-link attacks. Public boundary tests also
reject hostile `Path` subclasses before transport or filesystem side effects
while retaining ordinary native `Path` use. It also covers a complete
successful offline smoke publication check; exact pin authentication, rational
live-shaped replay, pin/model/publication tampering, production pin exclusion,
and the current selected `e1f357be73ee7fb3a72f` deterministic prefilter with
zero transport calls and no output directory; missing/extra/link/nonregular/
oversized artifacts; noncanonical, floating, subclassed, Boolean-confused, and
over-deep data; crossed archived identities; final byte changes; and output-root
replacement. All tests run in one capped pytest process.

## Live qualification: 2026-08-11

The bounded fixture-only live qualification is preserved at
`scratch/p97-endpoint-metric-live-canary-20260811-v4`. It ran the two stages
sequentially through fresh PIQD Z3 sessions and then ran the public standalone
validator against the published `smoke-sat` directory.

- `00-exact-metric-relaxation` used session
  `6075896f-73b2-468c-babe-6cbcbbe230fd` and accepted one assumption-free
  `SAT` result only after exact-rational replay of all 23 asserted constraints.
- `01-full-convex` used session
  `92857ed5-dcaf-4b3c-a19b-905b02a46475` and accepted one assumption-free
  `SAT` result only after exact-rational replay of all 38 asserted constraints.
- Both sessions are closed with exactly one solve. The replayed coordinates are
  `(0,0)`, `(1,0)`, `(4/5,3/5)`, `(0,1)`, and `(-4/5,3/5)`.
- Pre/post daemon bytes are identical with SHA-256
  `5b0ec812230a885336e76e97c077dae6320fd2b18ca30bf9d67c9cdd1e26afad`;
  pre/post solver-registry bytes are identical with SHA-256
  `f5038ff6895fe47304f6c29bc98425d8f00549880a88e395ca5e73f48145db65`.
- The public offline validator returned `checked: true`, and an independent
  read-only audit revalidated the 34-entry custody inventory, exact source and
  query bindings, both session/receipt/result chains, the two rational models,
  and the closed terminal state. That audit is recorded in the project convo
  as `#5375`.
- The deterministic `smoke-unsat` fixture was rejected by the symbolic
  prefilter and made no PIQD submission.

This qualifies the endpoint adapter's finite diagnostic boundary. It does not
establish source entitlement for a production theorem input, a proof of
`UNSAT`, a global or universal geometric statement, a Problem 97 theorem, a
Lean theorem, or closure of any `sorry`. The earlier sandbox-denied v1 attempt
and algebraic-model v2 `UNKNOWN` remain preserved failure evidence; neither is
silently reclassified.
