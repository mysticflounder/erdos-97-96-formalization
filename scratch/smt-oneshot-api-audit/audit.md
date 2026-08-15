# SMT_ONESHOT API/contract audit

Date: 2026-08-14  
Scope: read-only audit of the shared CEGAR control/registry/CLI/engine and
`phase3_piqd_smt_source_adapter`. No solver, daemon, network, Git, or Lean
commands were used. The only durable artifact from this audit is this file.

## Finding

There is currently no `SMT_ONESHOT` symbol, registration, control branch, CLI
dispatch, or shared engine. The closed registry currently contains:

* `STATIC_CNF` v1 (`cegar_wave_registry.STATIC_CNF_EXECUTION`),
* `STATIC_CNF` v2 (`STATIC_CNF_EXECUTION_V2`),
* `STATIC_CNF` v3 data-only (`STATIC_CNF_DATA_ONLY_V1`), and
* `ASSUMPTION_CNF` v1 (`ASSUMPTION_CNF_EXECUTION_V1`).

The smallest safe design is additive: leave all four registrations and their
byte contracts unchanged, add a new descriptor/package branch for
`SMT_ONESHOT`, and put one thin engine around the existing authenticated
single-solver adapter. Do not make the CNF engine polymorphic; it hard-codes
DIMACS, receipt, custody-inventory, and result-assignment invariants.

## Existing contracts to preserve

### SMT adapter (`census/p97_search/phase3_piqd_smt_source_adapter.py`)

The following are reusable and already tested:

* `SourceSemanticQuery`, `SourceSnapshot`, `SemanticVerification`, and the
  `SemanticVerifier` callback type are the right typed boundary for exact
  source bytes, raw SMT model/readback text, and producer semantics.
* `load_source_semantic_query()` captures descriptor, original SMT2, and all
  declared sources relative to a no-follow descriptor root. It validates exact
  hashes/types and derives `journal_commands`/`journal_smt2` through
  `normalize_state_journal()`.
* `validate_authenticated_single_solver_query()` revalidates exact descriptor
  bytes, one solver, one profile schema, and the complete authenticated journal.
  It is the correct one-shot pre-transport gate; do not bypass it by mutating a
  two-solver query in the engine.
* `run_authenticated_single_solver_query()` calls `_run_solver()` exactly once
  and is the existing production boundary for one fresh session/one solve. It
  preserves solver name/signature/hash, assert count, `GET /smt2` byte identity,
  empty pre-receipts, solve request/readback, receipt identity, close state,
  and unique session IDs.
* `_reconcile_lost_solve_response()` performs bounded receipt polling without
  resubmitting `POST /solve`. A complete durable receipt is reconstructed as
  `reconciled_from_receipt`; no receipt becomes
  `INCONCLUSIVE_TRANSPORT_LOSS`.
* `_semantic_replay()` invokes the exact callback only for SAT and records
  `SAT_SEMANTICALLY_REPLAYED`, `INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED`, or
  `INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`. UNSAT becomes
  `UNSAT_DISCOVERY_ONLY` without invoking the callback; UNKNOWN becomes
  `INCONCLUSIVE_UNKNOWN`.
* `_reserve_output_staging()`, `_write_immutable()`, `_publish_output()`, and
  cleanup helpers already implement the adapter's create-once, no-follow,
  immutable staging/publication contract. They are private, so a new public
  staged one-shot helper is preferable to importing these names from another
  module.

Relevant tests in
`census/p97_search/tests/test_phase3_piqd_smt_source_adapter.py` include:
`test_public_authenticated_single_solver_boundary_binds_exact_selection`,
`test_unsat_core_is_renamed_to_unsat_assumptions_with_source_provenance`,
`test_unknown_and_semantic_verifier_failure_downgrade`,
`test_solve_response_loss_reconciles_receipt_or_downgrades_and_closes`,
`test_response_loss_waits_for_delayed_unknown_receipt_without_second_solve`,
`test_sat_custody_real_routes_sequential_sessions_and_semantic_replay`, and
the mutation/no-follow/create-once tests.

The maintained adapter's public `run_source_semantic_query()` is not the
one-shot engine primitive: it always runs fresh Z3 *then* cvc5, creates its own
output tree, and emits `RESULT_SCHEMA` (`.../source-adapter-result/v1`). The
new engine must call the single-solver boundary instead.

### Control (`census/p97_search/phase3_cegar_wave_control.py`)

`load_wave_control()` is strict canonical JSON with a closed
`STATIC_REGISTRY`, exact schema branches v1--v4, authenticated references,
and no-follow package capture. `WaveControl` and `StaticCnfBinding` currently
assume the package has `cnf`, `producer_manifest`, and `variable_map`; that is
the principal control-plane gap. `bind_static_cnf()` rejects every non-static
kind and validates DIMACS counts, so it cannot be reused for SMT.

Add a separate SMT package reference (recommended name: `smt_descriptor`) and
an `SmtOneshotBinding` plus `bind_smt_oneshot()`. The binding should retain the
authoritative wave manifest (if the wave package uses one), descriptor bytes,
and the adapter-loaded `SourceSemanticQuery`; it must not pretend the SMT
descriptor is CNF or overload the existing `cnf` field. Add a new control-schema
branch only for this package shape (a v5 branch is the least ambiguous); keep
v1--v4 exact-key and canonical-byte behavior frozen.

The existing `semantic_profile`/`semantic_artifacts` and v4 retained-hardlink
logic must remain unchanged for `STATIC_CNF_DATA_ONLY_V1`. The current profile
validator (`p97-cegar-wave-semantic_profiles.py`) is explicitly static-CNF and
has `domain_kind: STATIC_CNF`; it must not be silently reused as an SMT
semantic verifier. If SMT data-only packages are required later, add a
versioned SMT profile/validator rather than widening the static profile.

### Registry (`census/p97_search/cegar_wave_registry.py`)

Reusable pieces are `ExecutionRegistration`, the immutable
`EXECUTION_REGISTRY_ALL`, `_registration_envelope()`,
`resolve_execution_registration()`, `resolve_execution_registration_envelope()`,
and the registered plan/ingress/output dispatch pattern. Add one new closed
tuple `(SMT_ONESHOT, SMT_ONESHOT_ADAPTER, schema)` and a new code-defined
revision. Its capabilities should be limited to the common one-shot surface:
`check`, `plan`, `run`, `status`, `validate-ingress`, `validate-output`; all
campaign/export/diagnostic-mining/terminal-proof flags remain false. Execution
mode should state one-shot SMT and the engine schema/semantic-validator IDs
must be exact constants.

`validate_registered_ingress()` needs an SMT branch that captures and validates
the descriptor/source packet without transport. `plan_execution()` needs an
SMT step list (authenticate control/package, create one fresh session, assert
the exact journal, solve once, reconcile receipt if needed, replay SAT
semantics, close, publish). `execute_registered_wave()` needs an SMT branch
that rejects static/assumption-only arguments and passes only the registered
single-solver configuration. `inspect_registered_output_structure()` and
`validate_registered_output()` need to route the new envelope to a dedicated
SMT inspector/validator and cross-bind control, descriptor, manifest, profile,
and registration hashes. Data-only registrations must continue to fail before
execution and have no output validator path.

The existing output check compares package bindings and registration but is
CNF-specific (`manifest.encoding`, `cnf_sha256`, variable map, clause counts).
It cannot be generalized by adding conditionals without risking the frozen
static contracts; use a separate SMT validator function.

### Engine (`census/p97_search/phase3_cegar_wave_engine.py`)

`StaticCnfWaveEngine` is not reusable as an SMT base class. Its constructor
selects only static adapter schemas, requires `requested_core_limit=1`, and
its run/publish path calls `make_static_piqd_solver_runner()`. Its receipt keys,
artifact inventory, model-response custody, DIMACS scan, and classifications
are all static-CNF-specific. Preserve it byte-for-byte except for imports only
if unavoidable.

Add a dedicated module (recommended:
`census/p97_search/phase3_smt_oneshot_engine.py`) with:

1. a strict constructor for the new bound control, absolute native paths,
   server/transport, and one registered semantic callback;
2. a `run()` that captures/binds the descriptor, creates private staging,
   archives descriptor/original SMT2/normalized journal/source snapshots,
   invokes `run_authenticated_single_solver_query()` exactly once, writes a
   thin common envelope plus adapter-specific result, atomically publishes
   once, and immediately reopens/validates the installed output;
3. an offline `inspect_smt_oneshot_engine_output_structure()` that performs
   self-consistency only, and a registered validator that cross-binds package
   identity and registration without PIQD/solver/callback execution; and
4. a recovery/validation path only if the adapter's durable receipt tree can
   be authenticated without guessing a session or replaying `POST /solve`.

The common envelope should carry the execution registration, control hash,
descriptor/source-manifest hashes, exact journal hash/command count, solver
identity (name/signature/binary hash), raw/effective status, response-loss and
reconciliation metadata, semantic replay record, artifact inventory, and all
claims as literal false. It must not add proof fields or reinterpret UNSAT as
certified. Recommended classifications are the adapter's existing strings:
`SAT_SEMANTICALLY_REPLAYED`, `UNSAT_DISCOVERY_ONLY`,
`INCONCLUSIVE_UNKNOWN`, `INCONCLUSIVE_TRANSPORT_LOSS`, and the two semantic
replay failure classes.

The adapter's current `run_authenticated_single_solver_query()` accepts an
open `output_fd`, not an output directory, and does not publish a common
envelope. Add one public staged wrapper in the adapter (or a small shared
staging API) rather than having the engine import adapter private functions.
The wrapper must preserve existing low-level behavior and tests.

### CLI (`census/p97_search/cegar_wave_cli.py`)

The parser and `_run()` currently assume one control type but forward either
static arguments (`journal_root`, timeout) or assumption arguments (solver
signature, resume session) through `execute_registered_wave()`. Add only the
SMT-specific solver/profile options needed by the code-defined registration;
reject `--journal-root`, `--solver-signature`, `--existing-session-id`, and
static proof/recovery arguments for SMT before transport. Keep `status`
structural-only and `validate-output`/`check` offline cross-bound. Extend
`_classification()` only for the common SMT `result.classification` location.

## Callback and offline-validation gap

The adapter's callback is intentionally a runtime `Callable`; control JSON
contains only the semantic-verifier identity in the descriptor. A generic
registered engine cannot safely reconstruct that callback from an import path,
and an offline validator cannot re-run it from the published JSON alone.

Therefore the new registration must choose one of these explicit contracts:

* the semantic verifier is a code-defined, allowlisted callback selected by a
  stable registry identity, and the offline validator checks the corresponding
  registered result schema/evidence; or
* SMT output validation is structural/custodial only and the registration
  explicitly does not claim independent semantic replay offline.

Do not accept an arbitrary callback from control JSON. If the task requires
independent offline semantic replay, add a new SMT semantic-profile schema and
closed validator registry; do not reuse the static-CNF profile.

## Minimal file/change inventory

Required production changes:

1. `phase3_cegar_wave_control.py`: SMT constants, one control-schema/package
   branch, `SmtOneshotBinding`, and `bind_smt_oneshot()`; no edits to frozen
   static branches.
2. `phase3_piqd_smt_source_adapter.py`: parameterized/public single-solver
   descriptor loading if needed, plus a public staged one-shot wrapper that
   reuses existing `_run_solver()`/reconciliation/replay and publication
   primitives.
3. New `phase3_smt_oneshot_engine.py`: common envelope, create-once run,
   structural inspector, and offline package cross-binding.
4. `cegar_wave_registry.py`: registration constants, registry entry, plan,
   ingress, execution, inspector, and output-validation branches.
5. `cegar_wave_cli.py`: SMT argument surface and dispatch guards.

Required tests (additive files or sections):

* control: exact v5 SMT package, descriptor/source hash crossings, no-follow,
  static v1--v4 byte snapshots, and static data-only no-run regression;
* adapter: one-solver Z3 and cvc5 identity, exact journal/readback, SAT callback
  accept/reject/failure, UNSAT/UNKNOWN boundaries, response-loss receipt
  reconciliation/no second solve, session close, and staged create-once;
* engine/registry: registration crossing, envelope custody/hash checks,
  offline validation with no transport, data-only refusal, atomic publication,
  and proof argument rejection;
* CLI: SMT plan/validate-ingress/run/status/check and rejection of arguments
  belonging to static or assumption execution.

Existing tests that must remain green include all current
`test_phase3_piqd_smt_source_adapter.py`, `test_cegar_wave_registry.py`,
`test_phase3_cegar_wave_control.py`, `test_phase3_cegar_wave_engine.py`, and
`test_cegar_wave_cli.py` suites. In particular, preserve registry v1 aliases,
static v2 semantic-profile binding, and the data-only tests
`test_data_only_registration_refuses_every_execution_output_path` and
`test_data_only_cli_plans_and_validates_but_cannot_run`.

## Bottom line

The adapter already proves the difficult one-shot PIQD facts. The missing work
is a new authenticated package/control shape, a public staged wrapper, a
non-CNF envelope/validator, and closed registry/CLI dispatch. Reusing the
adapter's low-level single-solver call is safe; reusing
`run_source_semantic_query()` (which is intentionally two-solver) or
`StaticCnfWaveEngine` (which is CNF-specific) would violate the requested
solver identity and result boundaries.
