# P97 PIQD FreshThird SMT-session adapter v1

## Status and boundary

`census/p97_search/phase3_piqd_freshthird_smt_session.py` is an additive,
finite-diagnostic consumer for an already frozen FreshThird U3 wave. It does
not generate a wave, alter a source file, run Lean, or promote a theorem. A
successful receipt says only that the authenticated finite packet was replayed
through the stated PIQD solver identities under this protocol.

The receipt schema is `p97-piqd-freshthird-smt-session/v1` and its status is
always `FINITE_DIAGNOSTIC_ONLY`. The following claims are always false:

- theorem proved;
- source entitlement;
- universal, Lean, or Euclidean closure;
- CPU, solver, or daemon attestation.

The proof-blueprint session is outside this adapter and is neither read nor
changed.

## Approved frozen inputs

Admission is a closed manifest-hash allowlist. It is not a directory-name
check. After selecting the profile by the SHA-256 of the original
`manifest.json` bytes, the adapter requires the profile's exact namespace,
schema hash, case-matrix hash, cross-solver-results hash, finite-nogood hash,
source-hash map, budgets, and exact ordered 12-row case matrix. Every original
model is then checked against the row's exact `smt_sha256`.

The approved profiles are:

| Wave | Manifest SHA-256 | Case matrix SHA-256 | Cross-solver SHA-256 |
| --- | --- | --- | --- |
| `freshthird_u3_simultaneous_sixcenter_20260809` | `b2a239e1141e15dc61e9c9f465ea37271e103a3b065fd9de597e44b6388ff64b` | `dd3ac9d122b66ab4529a7ef06c4325d7b93c32d2a0aea0eb2f4aca73bfa4f094` | `dbb755c4a1b51a13c94227e955eb78383ba94d4c774b51fccf134c297e0c4274` |
| `freshthird_u3_simultaneous_shell_distribution_20260809` | `59f927a4cd1b3199c6eb470a2d87b543b78af7cc336692f8e8a3e70b819aac4f` | `0506a630df4c7339c5596d708da2d72a4553885ac8988c5b3975cf2a8dcfdda0` | `1f3e02aa012f5c4ea5db963bfa58a3aa3b1c5502c9ff22b14f518d874e6f7f7b` |
| `freshthird_u3_simultaneous_shell_distribution_smoke_defined_20260809` | `db86d68a8a1a876d12c7768e249fa372f189713336dcccecfc5020ba095422e3` | `b5228045a708a1cfe2260344df3c6e6d5d8647d8156918c6e9caf5680d1d0195` | `9b0ea3439a7bd680aa6d83d0dcfedefde527ad9ad4cff2248137ea4e89ea8f5a` |

All three bind finite nogoods
`ddd5531a2648f4b0dfd4fccbe06c4880504e827aaa212178b50ba88b041487a4`.
The profile declarations in the implementation are the normative exact source
and per-case hash maps. The shell-distribution successor differs in three
source hashes and in the live-case SMT2 hash; accepting either packet never
allows hashes to be mixed between profiles.

The first shell-distribution profile remains accepted for deterministic replay,
but it is not a successful live qualification packet: its known-SAT control
declares no symbol, so a standards-conforming solver may return an empty model.
The adapter correctly rejects that model as incomplete for its fail-closed
readback contract. The `smoke_defined` successor is the default qualification
candidate. It declares `smoke_dummy : Bool`, asserts it, and therefore requires
an explicit, independently checkable model binding. This repairs the P97 smoke
fixture without weakening empty-model rejection.

`preflight_frozen_wave(path)` performs the complete package admission and SMT2
normalization read-only, without contacting PIQD. In the admitted predecessor
the live case has 641 asserted commands and 69 readback terms; in the successor
it has 725 commands and 99 terms. The other eleven normalized scripts are
identical between profiles.

## SMT2 normalization

Original SMT2 files are captured by bounded, descriptor-relative, no-follow
reads and retained byte-for-byte in the output, with their original hashes.
The normalizer uses a structural scanner compatible with PIQD's SMT command
scanner. It tracks top-level parentheses, comments, SMT doubled-quote strings,
and quoted symbols. It uses no regular expression and preserves the exact byte
spelling of every retained top-level command.

The only removals are:

1. at most one command structurally equal to
   `(set-option :produce-models true)`; and
2. the required exact terminal command pair `(check-sat)` then `(exit)`.

Any other nonterminal `check-sat`, `exit`, or `get-*` query is rejected. Each
retained command plus one newline forms both the CAS assert request and the
normalized journal. The journal byte count and SHA-256 are bound independently
by the adapter, PIQD `/smt2` export, and the durable solve receipt.

## Session protocol

Cases retain the exact frozen order. For each case, the adapter runs `z3` and
then `cvc5`, strictly sequentially. Each `(case, solver)` gets a new SMT-lane
session with an empty journal, canonical UUID identity, and a unique diagnostic
label. The caller must supply `--piqd-data-root` (or `piqd_data_root=` through
the Python interface); it is not inferred from a daemon response. The root must
be a canonical absolute path and every component is opened without following
links. Its authenticated descriptor remains open for the complete run.

The exchange is:

1. `POST /sessions` with the exact solver, `lane: "smt"`, and label, requiring
   the current PIQD create status HTTP 201 (all other JSON endpoints require
   their exact HTTP 200 contract);
2. `POST /sessions/{id}/assert` with all normalized commands and
   `expect_commands: 0` as the compare-and-swap guard;
3. bounded descriptor capture of `GET /sessions/{id}/smt2`, requiring exact
   equality with the normalized journal;
4. `GET /sessions/{id}/receipts`, requiring zero receipts;
5. one and only one `POST /sessions/{id}/solve` with empty assumptions,
   `timeout_ms: 20000`, `include_model: true`, and every declared Boolean or
   integer term in `get_values`;
6. a second receipt read and strict response/receipt agreement; and
7. `DELETE /sessions/{id}` with strict closed-session identity and counters.

The create response must name exactly the canonical absolute
`{data_root}/sessions/{id}/journal.smt2`; receipt responses must repeat that
path and name exactly
`{data_root}/sessions/{id}/receipts.jsonl`. Equality is necessary but not
sufficient: the adapter reopens `sessions`, the canonical UUID directory, and
each exact basename component-by-component through the authenticated data-root
descriptor using `O_NOFOLLOW`, and requires regular files. Relative paths,
outside-root paths, crossed UUIDs, noncanonical components, wrong basenames,
symlinked parents, and non-string values fail closed.

The adapter never calls `GET /sessions/{id}/model`. Model and value text must
come back in the solve response, or from the matching durable solve receipt
when the response itself was lost.

All PIQD JSON objects have exact key sets, built-in JSON value types, strict
integer-versus-Boolean checks, canonical UUIDs, lowercase SHA-256 strings, and
status-specific solve fields. The exact Session key set includes
`declared_num_vars`, `last_solve_index`, `last_assumption_free`, and
`last_terminal_unsat`. Because this lane creates unseeded SMT sessions, all
four are exactly null at creation. On close after the one permitted solve,
`declared_num_vars` remains null, `last_solve_index` is exactly `1`,
`last_assumption_free` is exactly true, and `last_terminal_unsat` is true only
for the accepted assumption-free terminal UNSAT result and null otherwise. A
close after an uncommitted solve loss retains the four creation values.
Duplicate JSON keys and non-finite numbers are
rejected at frozen JSON ingress. JSON response values are copied into a bounded
detached snapshot before use, with explicit depth and aggregate-node caps.
SMT S-expression scanning and parsing likewise enforce depth, token, and node
caps. Receipt identity binds solver signature and
binary hash, request parameters, command count, journal bytes/hash, solve index,
result hash, and status-specific result payload.

The result hash is not accepted as an opaque lowercase digest. The adapter
recomputes PIQD's exact `piqd-smt-solve-result/v1` length-prefixed byte encoding
over status, interruption, terminal flag, ordered core, model, and values, then
requires equality in both the solve response and durable receipt. The hash is
still only integrity binding, not a daemon signature or attestation. A SAT
model must also contain a model definition; syntactically valid but
semantically empty `(model)` and `()` payloads are downgraded to `UNKNOWN` even
when value readback is complete.

## Response loss and verdicts

`POST /solve` is currently non-idempotent. It is never retried. If its response
is lost, the adapter performs the already-specified post-solve receipt read:

- exactly one valid receipt reconstructs the solve result;
- no receipt produces `UNKNOWN`; and
- an invalid, duplicate, or disagreeing receipt fails closed.

Only the absence of an inspectable transport response enters this
reconciliation path. A present but malformed or non-200 solve response fails
closed even if a receipt exists; it is not relabeled as response loss.

A solver `UNKNOWN`, timeout, interruption, crash/loss without a receipt,
cross-solver disagreement, malformed model/value payload, or failed independent
P97 readback makes the case verdict `UNKNOWN`. SAT is reported only as
`SAT-abstraction`; admitted UNSAT is reported as `semantic-UNSAT` only for the
two frozen semantic controls and otherwise as `relaxation-UNSAT`.

Independent readback rechecks model completeness and the P97 finite incidence
conditions rather than trusting the frozen runner's classification. For the
successor live case it additionally checks the shell-distribution variables:
mode 2 has `q` on the shell, at most two named P-circle points, at least two
outside points, and total shell cardinality four; non-shell modes bind all
shell variables to false/zero.

## Output custody

The output directory must not exist. Every parent component is opened as a
real directory without following symlinks, the directory is created through
its authenticated parent descriptor, and every artifact is installed once
with `O_EXCL | O_NOFOLLOW`. Input and downloaded artifacts have fixed byte
caps. HTTP artifact redirects are disabled. Authenticated source capture and
download verification compare device, inode, mode, size, nanosecond mtime, and
nanosecond ctime before and after the bounded read, so same-size in-place
mutation is rejected. PIQD JSON responses, including receipt lists, are
detached from transport-owned objects before validation and later use.

The output contains authenticated frozen JSON, every original SMT2 file, every
PIQD journal export, and `receipt.json`. Artifact metadata records path, byte
count, and SHA-256. `receipt.json` is canonicalized and self-hashed by hashing
the complete receipt object before the `receipt_sha256` field is added. The
file is installed last through the same descriptor-rooted create-once path.

## Standalone validation and replay

`validate_freshthird_smt_session_output(output_dir, repo_root=...)` is the
public, daemon-free consumer for an output packet. The equivalent CLI is:

```text
python -m census.p97_search.phase3_piqd_freshthird_smt_session \
  --check /absolute/path/to/output --repo-root /absolute/path/to/repository
```

The validator opens every directory component without following links. It
requires the exact 41-file set: four copied frozen JSON files, twelve original
SMT2 files, twenty-four solver journal exports, and the receipt. Extra and
missing entries, subdirectories, symlinks, multiply linked files, writable
files, nonregular files, oversized individual files, and an oversized aggregate
fail closed. Every file is captured into bounded immutable bytes while its
descriptor remains open. Directory contents/identity and each file's device,
inode, mode, link count, size, nanosecond mtime, and nanosecond ctime are
rechecked after semantic replay, detecting replacement and same-size mutation.

The receipt must be strict JSON and its bytes must equal the canonical encoding
plus one newline. The validator removes only `receipt_sha256`, recomputes the
self-hash, and requires exact top-level and nested schemas with built-in types.
It rechecks every artifact descriptor against the captured path, bytes, size,
and SHA-256; re-admits the copied frozen manifest, matrix, results, and nogoods
against one approved profile; and renormalizes each captured original SMT2.

For all 24 engine records, replay binds case and solver identity, diagnostic
label, session UUID and absolute PIQD paths, create/close provenance, CAS count,
downloaded journal, receipt-list identity, exact solve receipt, recomputed PIQD
result digest, and response-loss reconciliation. It independently parses the
stored model and values and reruns the P97 readback, including successor shell
constraints. The recorded readback, effective status, and case verdict must
equal that replay; invalid or incomplete SAT evidence is reproduced as the
documented `UNKNOWN` downgrade. It never reads the old PIQD data root and never
starts a solver: those absolute paths are custody-bound historical identifiers.

Finally, the validator hashes the currently selected source files through an
explicit, no-follow `repo_root` descriptor and requires the receipt's full
current-source observation to match. This checks what the run actually
observed without upgrading `source_entitlement`, which remains false.

## Verification

The focused test module uses only adversarial fake JSON and descriptor-download
transports. It exercises both approved read-only preflights, all 24 fresh
session runs and their order, response-loss reconciliation without retry,
unreceipted loss, corrupt receipts, strict response keys, false artifact
digests, exact result-digest recomputation, complete all-SAT response/readback
paths for all frozen profiles, invalid and empty SAT models, create-once and
data-root no-follow custody, absolute-path adversaries, same-size capture
mutation, descriptor cleanup on reservation failure, JSON/S-expression
complexity budgets, structural SMT splitting, exact reserved-option removal,
query-suffix rejection, independent incomplete-model rejection, full standalone
replay for both approved 24-session packets, canonical/self-hash tampering,
undeclared files, symlink/hardlink aliases, post-capture mutation, cross-case
and cross-solver substitution, current-source drift, and Boolean/float/container
subclass confusion. It starts no daemon or solver and does not invoke Lean or
Git.
