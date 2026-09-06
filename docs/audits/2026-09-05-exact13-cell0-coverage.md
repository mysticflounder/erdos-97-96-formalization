# Exact-13 cell-zero coverage checkpoint — 2026-09-05

## Outcome and scope

The fresh bounded continuation of `direct-z08-k09-10` remains open. It returned
`BATCH_BUDGET`, not UNSAT, after 21 PIQD-replayed SAT models. Every retained
model still has a one-form or two-form incidence contradiction. No baseline
survivor was produced, so this wave does not measure incremental affine
rejection power. No live-source contradiction or theorem promotion is claimed.

This is an **EMPIRICALLY VERIFIED**, single-formula checkpoint. The lane used
the existing iterative runner without modifying solver orchestration or Lean
sources. The source-role adapter is a separate, bounded formalization request;
its assignment alone is not proof closure.

## Authenticated run

- Lane: `exact13-cell0-coverage-20260905`.
- Frozen lane base: `2e5bad4c90615d72e075c85ea9d8d81d820f2e46`.
- Manifest: `scratch/runs/exact13-cell0-coverage-20260905/run-0001/run_manifest.json`.
- Manifest self-hash: `a19c2603b545bd9e8c2d36a24bbcc6d854a09fcd0b9eeb9a4dd84b82d0d8dc36`.
- Retained certificate event: `scratch/runs/exact13-cell0-coverage-20260905/run-0001/cell-000-coverage-batch-certificate.json` (byte-identical to generated `events/cell-000-coverage-batch.json`).
- Event file SHA-256: `777a262c9a7ab60c4c701bc2f7d5a43675ed891e535a65e717cf1b75c30bf93f`.
- Event self-hash: `d3995119ccdf36586d814e0f3233855fb56e9ea5f6a2598919550d7955819302`.
- Initial journal SHA-256: `af60492ec686fe9324e873c588dc72b5e0e0395d31218cfaa162e8c5d5f40021`.

All 11 recorded source digests and 10 predecessor-event file digests matched
before execution. The manifest is a declared source snapshot, not a claim to
authenticate the complete Python import closure. The shared repository moved
during the run; the lane base is not asserted to be its exact execution HEAD.
The pinned source bytes are the identity used here.

The ten seed events include the latest bounded cone certificate. This was a
continuation of the accumulated geometric cuts, not a strict one/pair-only
baseline experiment. The event records every seed path and file hash.

| Quantity | Count |
| --- | ---: |
| Distinct seed cuts | 14,897 |
| Initial journal commands | 64,425 |
| Replayed SAT models / retained solve receipts | 21 / 21 |
| New cuts actually asserted in this run | 8,058 |
| Additional candidates at the final batch boundary | 469 |
| Total new candidate cuts | 8,527 |
| Models surviving the complete one/two-form checks | 0 |

The final model has 31 one-form conflicts and 753 two-form conflicts before
atom-set clause deduplication. Its 469 new candidates were **not asserted**:
the runner stops before that assertion at `--max-batches 20`. Do not describe
the final SAT model as satisfying those final candidates. A later resume may
load them through the existing seed loader.

## Source-to-formula audit

Inspection found no unjustified root constraint, but it did not produce a
Lean theorem connecting the complete Boolean root to the live packet.
Relevant source facts are in `CardGeThirteenExact13RawIngress.lean`:

- `exists_raw_goodSourceWitness_labels` (line 792) supplies common source,
  blocker, and deletion labels, source memberships, and deletion omissions.
- `raw_label_not_mem_of_goodOutsideSource` (line 596) supplies the source
  omissions from the first-apex row.
- `exists_raw_deleted_label_with_firstApex_support` (line 891) supplies the
  deletion's first-apex membership and `d = z` or `d` in the third row.
- `exactThirteen_six_seven_mem_firstApexRawSupport` (line 1312) supplies the
  two fixed first-apex incidences.

The needed role assignment takes `b0/b1` to the actual blockers in
`X.fivePositionalRows`; source/deletion labels must be chosen jointly and
identified by injectivity of `P.pt`. Python's global-row guard and Lean's
`guardedGlobalSupport` then suppress rows at the same two labels. An absent
adapter is not a demonstrated mismatch in that guard.

The Boolean global rows are an overapproximation: arbitrary SAT assignments
need not be actual selected K4 rows. This is acceptable for a future UNSAT
argument only after proving that the actual source-selected rows satisfy the
formula. It does not allow treating a SAT assignment's terminal atoms as facts
about the live packet. `SOURCE_PRODUCERS` currently also omits some of the
source/deletion/global-row constructor names above.

Coverage must be conditional on the source's explicit coarse signature:
direct orientation, raw `z = 8`, and raw `K` slice `{9,10}` in the fixed
five-label interval. It must not assert that every source lies in this cell.
Lean's unordered catalog membership also does not identify a Python integer
index by itself.

Existing direct-cell-zero terminals remain conditional certificates. In
particular, `false_of_directCell0_threeForm` requires the actual second
blocker to be raw label 12. The coarse signature does not supply that premise.
The two one-form terminals avoid that blocker premise but still require their
specific provider memberships. No disjunction covering all source packets in
this coarse cell has been established.

## Verification and bounded next obligation

The three focused test modules passed: **20 passed in 4.52 seconds**. The
first attempt had 13 passes and seven fixture setup errors because the parent
of `--basetemp` was missing; creating that parent resolved the setup errors.
No solver test failure was concealed by that rerun.

The immediate formalization request is a common source-role witness adapter,
owned by `luna-swarm-orbit-warden` in the new
`CardGeThirteenExact13SourceRoleIngress.lean`. A draft is present, but it is
**not Lean-validated** at this checkpoint: the shared build lock is held.
Independent read-only review identified missing transport between separately
chosen blocker labels; the owner repaired it with explicit injectivity
transport, and the reviewer confirmed the corrected source shape. This does
not substitute for the still-pending Lean check.
The adapter must preserve the actual
blocker identities, source-row memberships, first-apex exclusions, and common
deletion membership. This is the first missing input to a source-to-Boolean
assignment theorem; it is not itself exhaustive certificate coverage.
The request follows the activation/source-row obligations in
`docs/plans/2026-08-29-b1-global-continuation.md`, lines 1099–1162.

Independent offline verification returned zero errors: the event and manifest
self-hashes, all ten seed-event self-hashes, and all declared source/input
digests matched; every decoded model passed `validate_decoded_cell`. Every
one of the 8,527 retained certificates was checked against its model's equality
graph: pairing edge multisets, graph-valid paths, source-true activation and
membership atoms, and exact emitted clause. This is Python certificate replay,
not a kernel-checked Lean replay of this event.

Wave-only mining found 426 one-form and 8,101 two-form records, covering 338
distinct one-form IDs and 7,912 distinct two-form pairs. Atom-set sizes range
from 6 to 30. All belong to the existing transitive-incidence-path families;
no new generic theorem family was identified, so no repeated theorem-bank
search was performed. The final 469 candidates consist of 31 one-form and 438
two-form records after clause deduplication.

No further solver wave is justified here merely by the larger cut count; the
next proof obligation remains source assignment followed by actual coverage
of the conditional terminal payloads. A future run may explicitly add the
verified final 469 candidates as new initial clauses, but must not backdate
their assertion to this run.

## Artifact hygiene

Pytest created `test_*current` symlinks inside the completed fixture tree,
which the generated-root hygiene check rejects. After the test process exited,
an open-file scan and an external-reference scan found no consumers. Only that
fixture tree was moved, without deletion, to
`scratch/quarantine/exact13-cell0-coverage-20260905-pytest-retry`.
It can be restored by moving it back to the original `tmp/pytest-retry` path.
The solver event, initial journal, and assertion chunks were not moved. A
byte-identical certificate copy was retained outside the bulk `events/`
subdirectory, under the exact declared durable path above; the generated copy
remains available. The lane hygiene report has zero lane issues. Its global
blocking status still reports unrelated dirty/unregistered work; it is not a
claim that the shared repository is globally clean.
