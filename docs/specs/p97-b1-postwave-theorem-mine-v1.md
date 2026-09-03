# P97 B1 alternate-executor post-wave theorem mine v1

Status: implemented and fail-closed by
`scripts/b1_postwave_theorem_mine.py`.

## Purpose

The generic PIQD post-wave gate does not cover every B1 computation.  B1 waves
also use direct SAT/SMT processes, Singular, bounded enumerators, static
classifiers, and other alternate executors.  Those runs still create a theorem
mining obligation when they terminate.

This specification supplies one executor-independent receipt for that
obligation.  A receipt authenticates:

- one `worktree-run-manifest/v1` wave;
- the exact new data inspected from that wave;
- the terminal diagnostic verdict;
- the observations made from those data;
- either concrete theorem candidates or an explicit `NO_NEW_PATTERN` result;
- both required Lean-corpus searches for every concrete candidate; and
- the claim, trust, consumer, and historical/current gate boundaries.

The schema is `p97-b1-postwave-theorem-mine/v1`.

## When the gate fires

Every completed diagnostic run creates the obligation, whether or not its
result can advance the mathematical proof.  In particular, each of the
following terminal outcomes counts as a completed wave:

- `SAT`;
- `UNSAT`;
- `UNKNOWN`;
- `TIMEOUT`;
- `BUDGET_EXHAUSTED`;
- `ENUMERATION_COMPLETE`; and
- `ALGEBRA_COMPLETE`.

Timeout, budget exhaustion, a negative classification, or a run that only
confirms a known pattern does not waive the mine.  The useful theorem-mining
observation may be precisely the reason that the search stopped or the
structure of the surviving/failed cases.

Execution exclusions in the generic CEGAR framework also do not waive the
mine.  A wave performed by a bespoke runner, a staged endpoint campaign, a
survivor classifier, a core-deletion pass, or an algebra process remains a run
for this gate.  The scan cares about the governed `run_manifest.json`, not
whether the generic framework launched the executable.

The only exemption is an explicit `NO_RUN` entry in a campaign scan.  It is
accepted only when the named wave root is absent or empty.  A run manifest, an
executor output, or even a framework-exclusion record makes the wave nonempty
and invalidates `NO_RUN`.

## Separate reuse preflight

This checkpoint is not the bounded reuse preflight described in `AGENTS.md`.

- A reuse preflight starts from a concrete proposed statement, its hypotheses,
  immediate consumer, and source/import revision.  It is performed before
  deriving or reproving that candidate and is not repeated while that key is
  unchanged.
- A post-wave mine starts after a completed run and inspects only data newly
  produced by that wave.  It must happen after every completed wave.
- If the current-wave mine produces a concrete candidate, it records a project
  Lean-corpus search with `proof-blueprint search` and a cross-project
  Lean-corpus search with `nthdegree docs search --lean`.  If it produces no
  concrete candidate, it records `NO_NEW_PATTERN` and no candidate search is
  fabricated.

An earlier preflight, a later theorem classification, or a search over an
unchanged old key cannot stand in for the current-wave mine.

## Canonical location and commands

For campaign `C` and run id `W`, the governed run root is
`scratch/runs/C/W`.  Its receipt has one canonical path:

```text
scratch/runs/C/W/artifacts/postwave_theorem_mine.json
```

All command paths are normalized repository-relative paths.  Typical use is:

```bash
uv run python scripts/b1_postwave_theorem_mine.py create \
  --repo-root . \
  --input scratch/inputs/wave-14-postwave-mine-input.json \
  --output scratch/runs/b1-exact12-structural-20260830/wave-14/artifacts/postwave_theorem_mine.json

uv run python scripts/b1_postwave_theorem_mine.py verify \
  --repo-root . \
  --receipt scratch/runs/b1-exact12-structural-20260830/wave-14/artifacts/postwave_theorem_mine.json

uv run python scripts/b1_postwave_theorem_mine.py scan \
  --repo-root . \
  --campaign-root scratch/runs/b1-exact12-structural-20260830 \
  --wave wave-14 --wave wave-15 --wave wave-16
```

An explicit no-run scan entry uses both flags:

```bash
uv run python scripts/b1_postwave_theorem_mine.py scan \
  --repo-root . \
  --campaign-root scratch/runs/b1-exact12-structural-20260830 \
  --wave wave-never-started --no-run wave-never-started
```

Every `--no-run` id must also occur as a `--wave` id.  Wave ids are unique.

## Declarative one-wave input

`create` accepts ordinary strict UTF-8 JSON.  The input is unsigned and must
omit `receipt_sha256`.  It has these exact top-level fields:

```json
{
  "schema": "p97-b1-postwave-theorem-mine/v1",
  "created_utc": "2026-08-31T12:05:00Z",
  "campaign_id": "b1-exact12-structural-20260830",
  "wave": {},
  "scope": "CURRENT_WAVE_ONLY",
  "gate": {},
  "wave_artifacts": [],
  "terminal": {},
  "observations": [],
  "outcome": {},
  "immediate_consumer": "named direct consumer",
  "claim_boundary": {},
  "trust_boundary": {}
}
```

Unknown fields, missing fields, duplicate JSON keys, non-finite numbers, unsafe
identifiers, non-UTC timestamps, and non-normalized paths fail closed.

### Wave and run-manifest binding

`wave` has these exact fields:

```json
{
  "run_id": "wave-14",
  "root": "scratch/runs/b1-exact12-structural-20260830/wave-14",
  "base_head": "0000000000000000000000000000000000000000",
  "run_manifest": {
    "path": "scratch/runs/b1-exact12-structural-20260830/wave-14/run_manifest.json",
    "sha256": "0000000000000000000000000000000000000000000000000000000000000000",
    "manifest_sha256": "0000000000000000000000000000000000000000000000000000000000000000"
  }
}
```

The validator independently requires that:

- `wave.root` is exactly `scratch/runs/<campaign_id>/<run_id>`;
- the manifest path is exactly `<wave.root>/run_manifest.json`;
- the manifest is a single-link regular file reached through no symlink;
- `sha256` matches the complete manifest file bytes;
- the manifest has schema `worktree-run-manifest/v1` and its exact v1 fields;
- `lane_id`, `run_id`, `root`, and `base_head` match the receipt;
- `manifest_sha256` matches both the receipt and the manifest body hash;
- output classes are exactly `artifacts`, `events`, and `tmp`; and
- every path/digest pair in the manifest's `source_digests` and
  `input_digests` still names a repository-relative single-link regular file
  with the exact SHA-256.

Every governed read or hash checks `st_nlink == 1`, compares the descriptor
snapshot before and after consuming the file, then safely reopens the final
pathname and requires the same device, inode, link count, size, modification
time, and change time.  Hard links and pathname replacement therefore fail
closed rather than importing an inode from outside the declared custody path
or authenticating bytes no longer named there.

`O_NOFOLLOW` and `O_DIRECTORY` are mandatory platform capabilities for these
walks.  The implementation fails closed if either flag is unavailable; it
never silently substitutes a zero flag and weakens the no-symlink contract.

The manifest may bind predecessor inputs outside the current root.  That is
run provenance, not current-wave theorem-mine data.  The manifest itself may
not appear in `wave_artifacts` under any role.  Every artifact listed there is
instead confined to the current wave root.

### Current-wave artifact table

`wave_artifacts` is nonempty.  Each row has exactly:

```json
{
  "artifact_id": "solver-result",
  "role": "TERMINAL_EVIDENCE",
  "path": "scratch/runs/campaign/wave-1/artifacts/result.json",
  "sha256": "0000000000000000000000000000000000000000000000000000000000000000"
}
```

Permitted roles are:

- `TERMINAL_EVIDENCE`;
- `MINE_INPUT`;
- `PROJECT_SEARCH_RESULT`;
- `CROSS_PROJECT_SEARCH_RESULT`; and
- `OTHER_WAVE_DATA`.

Every path must be strictly below `wave.root`, must not be the wave's
`run_manifest.json`, and every file and ancestor must be non-symlink.  The
file must have exactly one hard link, retain pathname-to-inode identity across
the hash, and match its declared digest.  Artifact ids are unique.  Terminal
evidence, observations, and candidate searches reference artifact ids; an
unreferenced artifact row fails closed so unrelated data cannot be swept into
the receipt.

### Terminal result and observations

`terminal` has exactly `executor`, `verdict`, `summary`, and a nonempty
`evidence` list.  Its evidence ids must name `TERMINAL_EVIDENCE` rows.  The
verdict is one of the seven terminal outcomes listed above.

`observations` is a nonempty list.  Each row has exactly:

```json
{
  "observation_id": "orbit-signature-review",
  "statement": "What the current wave data showed.",
  "evidence": ["solver-result", "mine-notes"]
}
```

The statement is a human-attested observation, not a theorem.  Its evidence
list is nonempty and may refer only to the authenticated current-wave artifact
table.

### Outcome and conditional searches

`outcome` has exactly `kind`, `rationale`, and `candidates`.

- `NO_NEW_PATTERN` requires an empty candidate list and a nonempty rationale.
- `CANDIDATES` requires at least one concrete candidate.

Each candidate has exactly:

- `candidate_id`;
- `statement`;
- `immediate_consumer`;
- `claim_boundary`;
- `trust_boundary`;
- `project_search`; and
- `cross_project_search`.

Both search records are mandatory for every concrete candidate.  Each records
the exact query, corpus, corpus/index revision, result summary, first missing
antecedent or circularity, and an authenticated search-result artifact.  The
project record must use:

```text
scope  = PROJECT
tool   = PROOF_BLUEPRINT_SEARCH
corpus = erdos-97-96-formalization-lean
```

The cross-project record must use:

```text
scope  = CROSS_PROJECT
tool   = NTHDEGREE_DOCS_SEARCH
corpus = ALL_CONFIGURED_LEAN_CORPORA
```

The project evidence id must name a `PROJECT_SEARCH_RESULT` artifact; the
cross-project evidence id must name a `CROSS_PROJECT_SEARCH_RESULT` artifact.
The validator authenticates that the declared logs were captured.  It does not
rerun the semantic search engine or assert that a human review was complete.

### Gate state

`gate` has exactly `status` and `effect`, with one of these fixed pairs:

| status | effect |
|---|---|
| `HISTORICAL_BACKFILL_NON_AUTHORIZING` | `NON_AUTHORIZING_HISTORICAL_RECORD` |
| `CURRENT_GATE` | `SATISFIES_CURRENT_POSTWAVE_MINE_ONLY` |

A historical receipt repairs the audit record and authorizes nothing.  A
current receipt satisfies only this post-wave theorem-mine checkpoint.  It is
not, by itself, permission to launch a successor solver run, admit a learned
clause, promote a theorem, or change the proof frontier.  Those actions retain
their own producer, semantic, source-ingress, and campaign gates.

### Claim and trust boundary

The top-level `immediate_consumer` names the direct consumer that motivated the
mine.

`claim_boundary` has exactly:

- `rigor = EMPIRICALLY_VERIFIED`;
- `establishes`; and
- `does_not_establish`.

`trust_boundary` has exactly:

- `solver_evidence = EXTERNAL_DIAGNOSTIC`;
- `semantic_review = HUMAN_ATTESTED`; and
- `statement`.

These fixed labels prevent a receipt from presenting diagnostic computation or
semantic inspection as a kernel proof.  The free-text fields must state the
specific local boundary.  Candidate-level claim/trust fields narrow that
boundary for each proposed statement.

## Canonical receipt and self hash

`create` validates the unsigned body, appends `receipt_sha256`, and writes
sorted compact ASCII JSON followed by exactly one newline.  If `U` is the
unsigned body, then:

```text
receipt_sha256 = SHA256(canonical_json(U) || "\n")
```

`verify` requires the exact canonical byte representation, recomputes the self
hash, and revalidates every referenced file and run-manifest field.  Reformatting
the receipt, editing any field, changing an artifact, changing a bound source or
input, moving evidence to another wave, or introducing a symlink fails closed.

Creation opens the canonical final path once with `O_CREAT | O_EXCL |
O_NOFOLLOW`, writes and fsyncs through that owned descriptor, confirms that the
path still names the opened inode, and fsyncs the containing directory.  It
never renames, replaces, repairs, or unlinks any pathname.

After any exception following the exclusive create, the failure path safely
reopens the canonical pathname, requires that it still names the created
single-link inode, truncates that inode to zero bytes, and confirms both the
descriptor and pathname state.  The pathname is retained, but the empty file
is structurally invalid JSON, so `verify` and campaign `scan` reject it.  This
also applies to partial writes, file or directory fsync failures,
path-identity failures where the owned inode remains reachable, and close
failures.  An operator must inspect and explicitly quarantine the retained
invalid artifact before retrying.

This invalidation has an unavoidable syscall and hostile-namespace boundary.
If the pathname was removed, replaced, or hard-linked concurrently, or if the
safe reopen, stat, or truncate syscall itself fails, the creator refuses to
touch an unconfirmed inode and reports that invalidation could not be
confirmed.  A truncate performed after an fsync failure is structural state in
the live filesystem; it is not claimed crash-durable when the operating system
cannot complete the relevant durability syscalls.  No unlink, rename,
replacement, or automatic cleanup is attempted in either case.

## Campaign scan

`scan` examines exactly the campaign and repeated `--wave` ids supplied by the
caller.  For every non-exempt id it loads the fixed canonical receipt path and
runs the full verifier.  Missing, noncanonical, stale, wrong-campaign,
wrong-wave, or otherwise invalid receipts fail the scan.

An explicit `--no-run W` records `W` as `NO_RUN` only when `W` was also supplied
with `--wave` and its wave directory is absent or empty.  No other exemption
string exists.  In particular, framework exclusion, diagnostic-only,
nonpromotable, timeout, budget, and no-new-pattern are not scan exemptions.

For an existing empty wave directory, the scan snapshots the opened directory
while listing it, then freshly resolves the pathname and requires the same
directory snapshot and entry set.  Directory replacement or mutation during
that check invalidates `NO_RUN`; as with any filesystem inspection, the result
describes the completed scan snapshot and is not a lock against later writes.

On success, scan emits schema `p97-b1-postwave-theorem-mine-scan/v1` with one
`VALID_RECEIPT` or `NO_RUN` row per requested wave.  The scan summary is not a
durable wave receipt and has no self hash.

## Claim boundary of the validator

A valid receipt establishes file custody and schema compliance for a recorded
current-wave-only semantic mine.  It does not establish the truth of an
observation, search completeness, source-valid clause entitlement, a universal
lift, a Lean theorem, a closed `sorry`, or P97/P96.  Solver results remain
external diagnostic evidence and the semantic mine remains human-attested
until a separate accepted proof path reaches the named consumer.
