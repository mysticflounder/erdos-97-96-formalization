# Non-piqd computation validation campaign (2026-08-18)

Status: Stages 1 to 4 complete. This document makes no mathematical
closure claim.

Almost all solver and census work now routes through the piqd daemon, which
gives a result a content-addressed CNF blob, a recorded solver invocation, an
idempotent identity hash, and a byte-identical DRAT replay for a terminal
UNSAT. Output written before or outside that route has none of it.
`p97-piqd-remaining-solver-onboarding-plan-2026-08-09.md` classifies every
active *caller*; this campaign validates the *output* those callers wrote.

Scope: the git-tracked durable artifacts under `scratch/`, `census/` and
`certificates/` — 22,340 files, 3.42 GB — plus the untracked inputs they name
by hash. Tracked scope is deduplicated by construction; the whole-repository
copies that inflate filesystem counts are not tracked.

## Tools

### `scripts/audit_nonpiqd_custody.py` — Tier 0, custody survey

```bash
uv run python scripts/audit_nonpiqd_custody.py survey \
  --repo-root . --root scratch --root census --root certificates \
  --out <run-root>/artifacts/custody-survey.jsonl \
  --summary-out <run-root>/artifacts/custody-summary.json
uv run python scripts/audit_nonpiqd_custody.py links --repo-root .
uv run python scripts/audit_nonpiqd_custody.py writer-index --repo-root . --out <path>
```

Read-only; reports, never gates. Bounded reads, no symlink following,
duplicate-JSON-key rejection and JSON shape bounds follow
`census/card_head/exact12_next_row_arm_static_v24_validator.py`. Reference
resolution is an ordered strategy — repo-root-relative, manifest-relative,
ancestor up to four levels, absolute — and the winning strategy is recorded
per reference, because a root-only resolver reports many false missing files.
Writer attribution uses a schema-literal reverse map, with `producer`,
`command`, `argv`, `script`, `module` as fallbacks. `generator` is never used:
in `certificates/` it holds polynomial strings, not a producer name.

Durable output: `docs/audits/2026-08-18-nonpiqd-custody-survey.json`.

### `scripts/classify_writer_fields.py` — Tier 1, field provenance

```bash
uv run python scripts/classify_writer_fields.py index --repo-root . \
  --out <run-root>/artifacts/field-provenance.jsonl \
  --summary-out <run-root>/artifacts/field-provenance-summary.json
uv run python scripts/classify_writer_fields.py classify \
  --module <path.py> [--field <name>]
```

Parses with `ast`; never executes a writer. Classes by trust: `LITERAL`,
`FLAG_ECHO` and `UNKNOWN` carry none; `COMPUTED` is provisional; `GUARDED` is
trustworthy. A field's aggregate is the least trustworthy class over its
sites. Fields on the pre-registered non-result list cannot be promoted: the
AST verdict is kept as `raw_aggregate` while `aggregate` falls back to
`UNKNOWN` and `trust_capped` is set.

Durable output: `docs/audits/2026-08-18-nonpiqd-field-provenance.json`.

### `scripts/recheck_algebraic_certificates.py` — Tier 2a, algebraic

```bash
uv run --with sympy python scripts/recheck_algebraic_certificates.py recheck \
  --repo-root . \
  --root certificates/endpoint \
  --root certificates/surplus/relaxed_split_singleton \
  --jobs 8 \
  --out <run-root>/artifacts/algebraic-recheck.jsonl \
  --summary-out <run-root>/artifacts/algebraic-recheck-summary.json
uv run --with sympy python scripts/recheck_algebraic_certificates.py lean-links \
  --repo-root . [--detail]
```

Three legs per certificate. Leg A is independent: sympy exact rational
arithmetic over QQ, written in this script, sharing no code with either
producer. It rejects a float literal and any symbol the certificate did not
declare, and reads `^` as exponentiation — sympy's default reading is XOR,
which is a silent-pass hazard. Leg B is the producer's own `check_identity`
from `scripts/endpoint-certificate.py`, loaded through the same importlib shim
`scripts/pinned-surplus-certificate.py:50` uses; both families were checked at
write time by exactly that function, so leg B corroborates rather than
independently derives. Leg B' runs `endpoint-certificate.py --check <dir>` in a
subprocess; it covers only the endpoint family, because
`check_certificate_file` rejects any other schema.

Mutation control: two mutants per certificate, both put through the full leg-A
and leg-B path. The mutated index is the smallest with a nonzero coefficient
*and* a nonzero generator, so `c_i -> (c_i)+1` shifts the sum by `g_i != 0` and
`g_i -> (g_i)+1` shifts it by `c_i != 0`. Mutating an index where either side
vanishes leaves the sum unchanged and would report a false pass. The run exits
3 and declares itself void unless `n_rejected` equals `n_mutants`.

Durable output: `docs/audits/2026-08-18-nonpiqd-algebraic-recheck.json` and
`.jsonl`.

### `scripts/recheck_inventory_certificates.py` — Tier 2a, inventory

```bash
uv run python scripts/recheck_inventory_certificates.py recheck \
  --repo-root . [--sweep-dir census/multi_center/sweeps] \
  [--no-producer-replay] \
  --out <run-root>/artifacts/inventory-recheck.jsonl \
  --summary-out <run-root>/artifacts/inventory-recheck-summary.json
```

The two `certificates/multi_center/reports/` certificates carry no polynomial
payload, so the algebraic recheck does not reach them. Leg A reimplements the
writer's `key_digest`, `single_key_sha256`, `class_id_digest`,
`incidence_digest` and `id_ranges` and recomputes every count and set relation
the certificate states about its own contents. Leg B re-runs
`build_class_report`, `build_profile_report` and `build_incidence_report` from
`scripts/multi-center-sweep-certificate.py` over the raw sweeps and compares
the writer's own serialization byte for byte with the committed file. `main()`
is never called — it would overwrite six committed Lean modules and four
committed certificates. Each relation records `scope`: `internal` when the
certificate's own contents settle it, `source` when it needs the raw sweeps.

Durable output: `docs/audits/2026-08-18-nonpiqd-inventory-recheck.json`.

### `scripts/verify_lean_transcription.py` — Tier 2b, JSON to Lean

```bash
uv run python scripts/verify_lean_transcription.py verify \
  --repo-root . \
  --out-root <run-root>/tmp/lean-emit \
  --report <run-root>/artifacts/lean-transcription.json
```

Re-emits both certificate banks from the committed JSON into a scratch tree
and diffs against the committed Lean tree. Every emitter output path is
redirected, and the run digests `git status` over `lean/` and `certificates/`
before and after; a change exits 3. The endpoint bank needs two passes — the
directory pass, then a term-sharded overwrite for each id in
`PRODUCT_SUM_ENDPOINT_IDS` — and both emitters embed the certificate path they
were handed in a `Source certificate:` comment, so the input must be passed
repository-relative from the repository root. An absolute path changes every
emitted byte.

Durable output: `docs/audits/2026-08-18-nonpiqd-lean-transcription.json`.

### `scripts/recheck_solver_verdicts.py` — Tier 2c, solver verdicts

```bash
uv run python scripts/recheck_solver_verdicts.py \
  --output-dir <run-root>/artifacts --scratch-dir <run-root>/tmp \
  arm-cells --cells <workdir> ...
uv run python scripts/recheck_solver_verdicts.py \
  --output-dir <run-root>/artifacts --scratch-dir <run-root>/tmp \
  pairs --survey <run-root>/artifacts/custody-survey.jsonl
```

Two routes. `arm-cells` runs
`scripts/prepare_exact12_next_row_arm_terminal_rup_source.py` unchanged on each
retained terminal cell and then byte-compares every artifact it produced
against the committed one. `pairs` covers the remaining `(cnf, proof)` pairs
Tier 0 found present and hash-matching, taking the pairing from the record
rather than from filenames: a pair is declared only when one record names
exactly one matching CNF and exactly one matching proof, and the 19 records
that name more are reported as ambiguous rather than resolved by guesswork.

The verdict authority is `_verify_drat` imported from
`census/card_head/exact12_next_row_arm_static_v24_validator.py:377`, not a local
copy. That function hardcodes a 600 s timeout and collapses timeout, missing
binary and genuine failure into one `False`, so a `False` is always re-run here
with a longer timeout and a captured transcript to tell the three apart.

Durable output: `docs/audits/2026-08-19-nonpiqd-solver-verdicts.json`.

### `scripts/verify_bank_chain_pins.py` — Tier 2d and 2e, bank chain

```bash
uv run python scripts/verify_bank_chain_pins.py --output-dir <run-root>/artifacts
```

Runs `refreeze_narrowed_chain.py --verify`, parses the `REFROZEN` block, and
diffs all 13 shas against the literals frozen in source — eight against the
module's own `EXPECTED_BANK_SHA256`, five against the successor's
`EXPECTED_PARENT_BANK_SHA256`, which pins the same value. It then runs
`scripts/mine_bank_lean_dependencies.py --compare` over the 13, checks the
24-bank clause chain statically, and reports which banks the walk built at
runtime. The negative control lives in `scripts/_bank_chain_pin_control.py`,
which runs as a subprocess so its monkeypatched builders cannot leak back.

Durable output: `docs/audits/2026-08-19-nonpiqd-bank-chain-pins.json`.

### `scripts/test-nonpiqd-validation.sh` — lane runner

Pinned environment, explicit file list, `uv run pytest -q`, then `ruff check`
and `ruff format --check`. 161 tests.

## Corrections this campaign establishes

- **The documented dedup preflight is incomplete.** A `scratch/**/*-source/`
  directory is a whole repository checkout, so excluding only its `scratch/`
  subtree leaves a 6.8x residual inflation (`*.lean`: 130,533 raw, 77,441
  under the documented rule, 11,363 excluding `*-source/` entirely). Exclude
  the whole tree. Also treat `scratch/exact12-overlay-20260810/` as build
  output.
- **Reverse-link checks must match a full extension.** An alternation on
  `json` truncates `bank.jsonl` to `bank.json` and invents dangling links.
- **A raise-guarded comparison is not always a guard.** A nested raise under
  `if status == CONST:` is a dispatch. And `record["x"] != CONST` is circular
  when the field read was stamped with that constant.
- **`checks.python_exact_polynomial` is not a result.** It echoes
  `--no-python-check` (`scripts/endpoint-certificate.py:732,2370`), so `false`
  means the check never ran. All 135 records carrying `false` do satisfy their
  identity exactly (Stage 3 below).
- **A `status: UNKNOWN` solver record is not a failed proof.** Two records in
  `scratch/atail-force/exact5-card13-distinct-radius-aggregate/artifacts/`
  report `UNKNOWN` with `cadical_returncode: 0` and `timeout_seconds: 60`. They
  hold a partial proof by construction and never claimed UNSAT, so `drat-trim`
  answering `s NOT VERIFIED` on them is the correct outcome. A recheck that
  assumes every stored proof was meant to be terminal manufactures a failure
  out of a correctly labelled artifact.
- **`CHAIN VERIFY COMPLETE` is not evidence.** `--verify` gates only
  `refreeze_narrowed_chain.py:79` and the closing word at `:132`. The
  hash-drift recovery loop at `:100-117` is *not* gated on it, and `:107`
  reassigns `EXPECTED_BANK_SHA256` to a digest the module just computed. The
  recovery path holds no `print` or `log`, so stdout and the exit code look
  identical after a silently re-accepted drift. A drift at chain position N is
  still re-caught at N+1 through the frozen parent pin, and positions 1-5 hold
  no own pin for `:107` to overwrite — but position 13 is the tail and has no
  downstream pin, so only the sha diff catches it.
- **Every DRAT proof in this corpus is binary.** `drat-trim` announces
  `c turning on binary mode checking`. A mutation control written for text
  lines finds no lemma, perturbs nothing, and reports a clean run having
  established nothing. The first Tier 2c run did exactly that.
- **A single literal flip need not break a proof, and near the end it never
  did.** `drat-trim` checks backwards from the empty clause and never examines
  a lemma outside the core. On an 11 MB proof, eight consecutive single-literal
  flips at the tail all still verified. A control must be aimed at the core
  that `-l` emits, and the core must be verified unperturbed first — a control
  that only runs the broken case cannot tell a working checker from one that
  rejects everything.
- **The surplus term-sharded Lean emitter is broken at HEAD.** Commit
  `7c3fa141` removed `add_poly_many` and `singleton_poly` from
  `scripts/endpoint-certificate.py`; `scripts/pinned-surplus-certificate.py`
  still calls both at `:1549,1551` through the dynamically loaded endpoint
  tool. The neighbouring `run_singular_script` call at `:228` is *not* a
  regression: it sits under `except AttributeError` with a documented local
  fallback.

## Findings so far

Tier 0, over 22,340 artifacts and 36,366 references:

- Lean names 307 artifact path tokens; 302 present, 5 missing, and all 5 are
  named only from `lean/scratch/`, which is not a `lean_lib` root, so every
  dangling link is off-spine.
- **Zero of the 254 Lean-named certificates carry any Tier-0 defect.**
- 32,083 references match. 2,300 mismatch across 476 records, but only 119
  distinct drifted target files — generator modules edited after a record
  pinned them. 12 are committed certificates
  (`certificates/p97_exact12_next_row/cell00*-clause-delta.json`), none named
  by Lean. The files are clean against HEAD, so these are stale pins, not
  uncommitted edits. A stale pin breaks replay provenance; it does not by
  itself impugn the recorded mathematics.
- 18 records fail bounded JSON parse: 9 zero-byte files, 4 concatenated
  JSONL, 4 non-finite numbers, 1 over the checker's 64 MiB bound.

Tier 1, over 3,277 writer modules and 99,504 (module, field) pairs:

| Class | Count |
|---|---|
| COMPUTED | 56,505 |
| LITERAL | 29,484 |
| UNKNOWN | 10,612 |
| FLAG_ECHO | 2,348 |
| GUARDED | 555 |

42,444 fields — 42.7 % — carry no trust; 0.56 % reach `GUARDED`.

### Tier 2a — the 254 Lean-named certificates

The 254 split 252 algebraic plus 2 inventory: the 117 `certificates/endpoint/`
records carry the explicit `sum_i coefficients[i] * generators[i] = 1` identity
string, the 135 `surplus/relaxed_split_singleton/` records carry `generators`
and `coefficients` with no `identity` field, and the 2
`multi_center/reports/` records carry `rows`, `class_count` and `*_sha256`
with no polynomial payload at all. All 508 Lean modules that name a
certificate live under `Erdos9796Proof`, a `lean_lib` root, so every one is
compiled.

Algebraic, 252 certificates, 2,332 s of arithmetic across 8 workers:

| Quantity | Value |
|---|---|
| Independent leg (sympy over QQ) | 252 HOLDS, 0 FAILS |
| Producer leg (`check_identity`) | 252 HOLDS, 0 FAILS |
| Leg disagreements | 0 |
| Arms-length `--check certificates/endpoint` | exit 0, "checked 117 certificate files" |
| Mutation control | 504 mutants, 504 rejected by *both* legs |
| Declared `python_exact_polynomial: false` | 135 |
| — of those, identity holds exactly | **135** |

Inventory, 2 certificates: 38 relations checked, 38 hold — 36 settled by the
certificate's own contents, 2 needing the raw sweeps. 4 mutants, 4 rejected.
The producer replay over `census/multi_center/sweeps/` (11 files, present and
tracked) reproduces **both** committed certificates byte for byte in 2.8 s.

Their `claims` vectors are all-`true` and are computed, not literal
(`scripts/multi-center-sweep-certificate.py:301-304,510-513`). They are **not**
the all-`False` anti-overclaim seal used elsewhere; the two patterns must not
be read the same way.

### Tier 2b — JSON to Lean transcription

| Bank | Result |
|---|---|
| `EndpointCertificate/Patterns` | 219 emitted, 219 committed, **byte identical** |
| `SurplusCertificate/RelaxedSplit` | emitter aborts; see below |

The surplus directory emit dies on the 11th certificate in sorted order with
`AttributeError: module 'endpoint_certificate_tool' has no attribute
'add_poly_many'`. The 11 modules written before the abort are byte identical to
the committed ones. Bounding the break by calling the working direct branch
per certificate: of 135 rows, **101 reproduce byte for byte, 0 differ, and 34
are blocked** — exactly the rows whose content size passes the 40,000
shard threshold and so route to the broken term-sharded emitter. `Bank.lean`
and `Payload.lean` are excluded from the diff because neither emitter produces
them; a test pins that neither name is the module of any certificate, so the
exclusion cannot mask a missing row.

So 101 of the 135 committed surplus modules, and all 219 endpoint modules, are
demonstrably the transcription of their committed JSON. For the other 34 the
transcription is currently **unverifiable from the JSON** — not shown wrong,
not shown right. Their identities were rechecked exactly at the JSON layer, so
what is open is the JSON-to-Lean step alone. Repairing the emitter is outside
this campaign's scope, which changes no generator.

### Tier 2c — solver verdicts

Four retained terminal arm cells
(`scratch/rigid221-sourceheavy-anchor/exact12-next-row-arm-terminal-rup-sources-20260813/cell-{52,58,65,71}`)
were rerun through the preparer unchanged. All four **agree**. In each cell 10
of 13 artifacts are byte identical, including `terminal.cnf`, `discovery.cnf`,
`clause_delta.json`, `job.json`, the fresh `plain.drat`, `drat-trim.lrat`,
`normalized.lrat` and `source-manifest.json`. The current source rematerializes
the CNF byte for byte, `cadical --plain` reproduces the identical proof bytes,
and `drat-trim` reproduces the identical LRAT.

The three that differ are the solver and checker transcripts, which embed
wall-clock and memory figures. `receipt.json` differs only because it records
those three digests and then hashes itself; with exactly four fields redacted —
`artifacts.cadical_plain_output`, `artifacts.drat_trim_original_output`,
`artifacts.drat_trim_output`, `receipt_sha256` — the receipts are identical, so
the normalization counts, verdicts and proof digests all still compare exactly.

The other 68 cells of the two 20260811 waves retain only `summary.json`; their
CNFs and proofs were not kept, so they are outside a re-execution check and are
named here rather than counted as covered.

Seven further `(cnf, proof)` pairs were declared by records Tier 0 found
present and hash-matching. Five declare a terminal refutation and all five
reproduce `s VERIFIED`, with an independent `cadical --plain` returning UNSAT
on the same CNF and that fresh proof verifying too. Two declare `UNKNOWN` from
a 60 s timeout and correctly do **not** verify.

### Tier 2d — bank chain

`refreeze_narrowed_chain.py --verify` walks 13 narrowed banks with every frozen
pin in force. All 13 observed shas match the literals frozen in source, so the
drift the un-gated recovery loop could otherwise absorb did not occur — the
success banner was not taken as evidence for any of them.
`mine_bank_lean_dependencies.py --compare` reports `UNCHANGED` for all 13,
between 22 and 29 modules each. The 12 parent links hold: six restated literals
agree with their predecessor's own literal, one is an import alias that cannot
drift, and five sit above a position that carries no own literal, where the
successor's parent pin *is* the pin.

The negative control perturbs one digest in one `source_manifest` entry in
memory — `census/card_head/exact12_positive_membership_cnf.py` in the position-6
bank — after a clean build of the same bank has succeeded. The build raises
`Exact12SecondApexSurplusSecondFirstCommonFiveMembershipFamilyBankError` and
names the drifted digest.

### Tier 2e — generator reruns

The 24 banks that declare a clause chain have no command line at all: no
`__main__`, no `argparse`, and no write of any kind. Rerunning one therefore
means building it under its frozen pins, which is what the chain walk does, and
every `install_*` calls its own `build_*` and `validate_*` first. All 24 are
built at runtime — two by the cell materializer, nine by the chain head's
`_parent`, and thirteen by the CHAIN loop.

Statically, the clause chain is contiguous from 634,859 to 703,533 with one
head (`exact12_block_spanning_membership_family_bank`), no fork and no
unresolved link. Twenty-one links restate the count as a literal; two are held
by import aliasing and cannot drift apart. Reading only integer literals misses
`EXPECTED_PARENT_CLAUSES = FAMILY_FINAL_CLAUSES` in
`exact12_three_triad_membership_bank` and reports two heads where there is one.

## Remaining stages

5. Lean build and axiom-budget confirmation, then ledger assembly.

## What this campaign does not establish

It validates computation. It closes no proof obligation, promotes no leaf, and
moves no spine anchor.

A Tier 2a pass confirms the identity a certificate states; it does not
establish that the identity is the correct obligation for its Lean consumer.
A Tier 2c pass confirms that a stored refutation checks and that a fresh solver
run reaches the same verdict on the same CNF; it does not establish that the
CNF encodes the intended combinatorial claim. `drat-trim` is a precheck, not a
kernel: the Lean-side fact still needs the compact-RUP replay. There is no
`lrat-check` or `cake_lpr` on this machine, so LRAT is checked by `drat-trim`
and by Lean's kernel through the RUP ingress, not by a second LRAT checker.
A Tier 2d pass confirms that the banks rebuild to their frozen digests from
current source; it does not establish that those digests are the right ones.
Lean admits each certificate by `native_decide`, so the Lean-side fact rests on
the approved `Lean.trustCompiler` axiom, not on the kernel. And 34 surplus Lean
modules remain outside the transcription check while the term-sharded emitter
is broken.
