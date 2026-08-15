# Lean certificate ingress gate audit

Date: 2026-08-14
Scope: read-only audit of the recurring failure in which a certificate names a
Lean theorem but does not bind its source bytes or prove that the theorem is
reachable from the aggregate consumer.

## Classification

This is primarily a project implementation failure, not a piqd failure. The
piqd daemon transports solver jobs/results and has no Lean import graph or Lean
toolchain dependency. The affected records are assembled and promoted in
`census/` and the `lean/` aggregate modules. Piqd should not be asked to assert
that a Lean declaration exists or is imported.

The Lean usage skill already states the relevant requirements: exact source
path/current elaboration, import reachability from the proposed consumer,
fresh elaboration, source-level bridge, and independent final-consumer
verification (`lean-usage/references/proof-discipline.md`, theorem-bank and
archive evidence; independent promotion verification). The docs/process gap is
that these are not currently one mandatory, fail-closed ingress API. Add a
short policy entry requiring that API at every certificate publication seam;
do not treat a prose checklist as sufficient.

## Existing evidence and smallest reusable seam

There is useful code to reuse, but it is fragmented:

* `census/card_head/exact12_positive_membership_source_order_bank.py` has
  descriptor-relative no-follow reads and `_source_record` (path, byte count,
  SHA-256). It authenticates `source_path`, `coverage_source_path`, and
  `consumer_source_path` through the generated binding manifest, but does not
  parse/verify the qualified declaration or import closure.
* The exact-12 family-bank modules duplicate `_project_lean_source_path`,
  `_lean_import_modules`, and recursive `_lean_source_paths`; for example
  `exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank.py:101-201`.
  These routines compute a repository-local import closure, but the result is
  not a shared certificate binding and is not paired with declaration checks.
* `census/card_head/exact12_v14_ordered_coverage.py` records theorem names and
  source/coverage/consumer byte constants in the append-only binding registry
  (for example `FROZEN_V8_LEAN_BINDING`), while its tests mostly compare bytes
  and literal metadata. This is evidence of intended provenance, not a
  publication gate.
* `census/card_head/exact12_next_row_static_cegar.py:751-767` only requires a
  nonempty `nogood_declaration` and `source_path` before embedding a cut.
* `census/p97_search/phase3_piqd_exact12_source54_package.py` records a Lean
  source path/hash but explicitly carries
  `certificate_position_binding: False`; it must remain non-publishable until
  the complete gate is used.
* `census/p97_search/phase3_piqd_card_head_adapter.py:902-916` checks a theorem
  string in generated Lean text and hashes the generated artifact, but does
  not establish a named declaration in the project aggregate. Its metadata
  correctly says `theorem_promotion_allowed: False`; that status must remain
  false until the gate below passes.
* `census/p97_search/phase3_qq_certificate_lean_emitter.py:320-430` puts source
  hashes in generated-module comments. If this output is ever promoted, the
  comments must be replaced/augmented by a machine-checked ingress record.
* The current FreshThird replay
  (`freshthird_qfiber_three_carrier_cap_alternation_replay_v1.py`) is a useful
  partial repair: it binds ingress and aggregate bytes, checks one import line,
  uses a record hash domain, and includes qualified declaration strings. Its
  `_validate_lean_source_bytes` still checks only a short theorem marker and an
  import line; it does not prove that every qualified declaration exists or
  that the aggregate's transitive closure is the intended one. The current
  aggregate import is present in the working tree, but this must be tested as a
  mutation and enforced through the common gate rather than hand-maintained.

The smallest justified change is one new shared module,
`census/card_head/lean_ingress_gate.py`, rather than extending a
source-order-specific bank. It should reuse the no-follow source reader from
`exact12_positive_membership_source_order_bank.py` (or move that reader into
the new module) and make the repeated import-closure parser a single
implementation. This module is project infrastructure, not a new solver
adapter.

## Proposed fail-closed API

Use a versioned, strict, canonical record. Suggested fields:

```text
LeanIngressBinding/v1
  declarations: [{module, source_path, source_bytes, source_sha256, fqn}]
  aggregate: {module, source_path, source_bytes, source_sha256,
              direct_imports, import_closure, import_closure_sha256,
              consumer_fqn}
  toolchain_identity: exact pinned Lean/Lake identity
  semantic_replay_id: caller's replay/certificate identity
  hash_domain: p97-lean-ingress-binding/v1
```

Required operations:

1. `capture_binding(repo_root, declarations, aggregate_module,
   consumer_fqn, semantic_replay_id)` reads every path via regular,
   no-follow descriptors and records exact bytes and hashes. Reject absolute or
   escaping paths, symlinks, duplicate JSON keys, malformed module names, and
   missing files.
2. `validate_binding(repo_root, binding)` re-reads all recorded bytes and
   recomputes every hash. It parses Lean imports with one shared parser,
   requires a direct aggregate import of every ingress module, computes the
   complete repository-local transitive closure, and compares the ordered
   closure plus its hash with the record.
3. Declaration validation must be semantic, not `substring in source`: run the
   pinned Lean checker against the aggregate import and `#check`/`#print` each
   fully qualified declaration. Also retain the exact native source path/hash
   for each declaration. A declaration that exists only in an unimported file
   fails.
4. `revalidate_after_replay(...)` must call `validate_binding` after the
   certificate/solver semantic replay, then include the returned binding in the
   certificate body before calculating the self hash. A stale source or changed
   aggregate therefore invalidates the record even when the seven literals or
   solver result still replay.
5. `record_hash(payload, domain)` must hash
   `ASCII(domain) || NUL || canonical_json(payload)`. Use separate domains for
   ingress binding, certificate record, and parent-chain link. Bump the record
   schema for existing records; do not silently accept the old un-domain-
   separated hash.
6. Parent links must be typed: bind `parent_schema`, `parent_record_kind`, and
   `parent_record_sha256`, and verify the parent with its own domain before
   accepting it. This prevents a certificate hash from being reused as a
   different record kind merely because its JSON happens to match.

The publication function should accept only a validated `LeanIngressBinding`
and should expose no separate “theorem name” or “source hash” escape hatch.
Records with `theorem_promotion_allowed: False` remain diagnostic evidence.

## Tests that eliminate this failure class

Add tests beside the shared module and migrate the FreshThird tests as the
canary:

* positive: capture the real FreshThird ingress plus
  `FrontierLiveClosure.lean`, verify both qualified declarations with the
  pinned checker, and assert ingress is in the aggregate transitive closure;
* mutate ingress bytes, aggregate bytes, a declaration name, a source path, or
  the aggregate import and assert validation fails before record publication;
* remove the direct import but leave a same-named declaration in an unrelated
  file: this must fail (guards against the exact historical bug);
* replace the aggregate with a module that imports the ingress transitively but
  is not the named published consumer: this must fail on aggregate identity;
* after semantic replay, mutate ingress/aggregate bytes and assert
  `revalidate_after_replay` rejects the record;
* assert the self hash changes when any ingress/aggregate/declaration/closure
  field changes;
* cross-use certificate and parent hashes with equal JSON payloads and assert
  domain/schema checks reject them;
* test both FreshThird alternating parities (`1010` and `0101`) and verify the
  generated seven-literal clause against the exact Lean theorem. Existing
  tests mainly exercise one synthetic signature; keep the opposite-parity test
  independent.

## Adoption order

1. FreshThird cap-alternation replay (already has the closest shape and
   explicit ingress/aggregate fields).
2. `exact12_v14_source_order_bank.py` and
   `exact12_positive_membership_source_order_bank.py`; replace the duplicated
   import-closure helpers in the exact-12 family banks with the shared module.
3. `exact12_next_row_static_cegar.py` and the source54 package; require the
   shared binding before a cut enters a journal/package.
4. Other generated Lean emitters and `phase3_piqd_card_head_adapter.py` only
   at their promotion boundary. Piqd's transport/certificate APIs need no
   feature change for this issue; they should preserve the binding as opaque
   data if a caller supplies one.

The publication gate is therefore a project implementation task, with a small
Lean-usage docs clarification. It is not a #piqd product bug.
