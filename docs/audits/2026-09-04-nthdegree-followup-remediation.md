# nthdegree follow-up audit remediation

Date: 2026-09-04

This ledger tracks remediation of the externally delivered conversation audit
(`01M1Q21QBBNT8F9SYJX2HSBFN8`, SHA-256
`6e8d1760bf0a177603e70deeba4b88ed886689d71430b601e29ececf288eb548`)
and its final-ledger addendum (`01M1Q256WF9QVY6RFYPRP05B3B`, SHA-256
`4d993dc2a0114aba09129f799db317f3bd982afee7eb51583f7051e7a5f8e5c4`).

The report is an archive triage, not a semantic certification of every
conversation message. Each entry below records current-source validation and
an explicit exit criterion before it is marked resolved.

## Disposition ledger

Statuses distinguish source implementation, validation, publication, and
consumer reachability. A proof helper is not marked resolved merely because it
exists, and a custody audit is not treated as recovery of the artifact it
searched for.

| Item | Current disposition | Remediation and exit criterion |
|---|---|---|
| A1 exact-13 publication / Fin-13 interval | **Resolved and published.** Commit `fe863dbf2` replaces the wrapping `Ico ... (13 : Fin 13)` endpoints by the intended `Icc ... 12`, adds cardinality/membership guards and image transports, and leaves zero forbidden endpoints. Governed receipts show `DRExactThirteenValuation` and `CardGeThirteenExact13RawIngress` exits 0 with the branch dependency rebuilt. | Staged hygiene passed with exactly the owned valuation path; commit and push succeeded. The separate active whole-project build was not raced. |
| A2 stale completed consults | **Erratum published.** | `2026-09-04-b1-consult-erratum.md` (SHA-256 `7198ec1c…`) supersedes the recommendation in `#12515` without rewriting completed-consult metadata. It records the blocker-inequality circularity, the honest existing split, the correction to `#9007`, and that B1 remains open. Conversation publication is `#12811`; linked nthdegree reference is `01M1QB3SHX18QTCADE81HYWGZB`. |
| A3 exact-13 raw-label bridge | **Right statement exists, implementation not validated.** The untracked `CardGeThirteenExact13RawIngress.lean` preserves `id ∈ Traw` and `id = zraw ∨ id ∈ Kraw` without assuming the selected label is interior, but currently fails to compile and is not aggregate-reachable. | Owner `RadiusCartographer` was asked to repair the unused/missing binders and support/radius type mismatches, then add a deliberate import and named consumer. Exit requires narrow and aggregate builds followed by publication. |
| A4 center-9 fixed rows | **Consumers exist; producer is mathematically absent.** The source-faithful positional-row packet retains variable blocker/source centers and supports; `orientation` alone cannot identify them with the five hard-coded tuples. The terminal still assumes `FixedFiveRows`. | First missing theorem: a source occurrence/classification result identifying the two blocker rows and three apex rows under direct/mirror orientation, or a permutation-equivariant terminal consuming the variable packet. The bounded theorem-bank search found no producer. Checkpoint-only audit commit `fd9bd55c6` records the stop; no wrapper/import was added. |
| A5 strict-Kalmanson `dbbae6a5…` catalog | **Original payload unrecovered; authenticated claim retired pending recovery.** The custody audit tested 11,960 serializations / 5,520 unique digests with zero matches. | Do not cite the missing digest as recovered. Preserve the 202-record local diagnostic (`eb9d60d2…`) and independently generated n=12 bank (`93407f5d…`) as separate results. Reopen only if exact bytes or a replayable generator with declared inputs reproduces `dbbae6a503866379882765aab8bfacb9c8ec9c179a21d4a637ecac5b239daf37`. |
| A6 canonical negative incidence | **Resolved at the producer boundary and published.** Commit `905c39ad0` adds `actualBlocker_alias_or_fresh_of_survivalSquare`, which recovers and exports `X ∉ Kq.support` through `cross_deletion_survives_iff_not_mem_selected_support`, plus canonical support, `pX ≠ bq`, `pX ≠ apex`, and named-alias positive incidence. Two source adapters cover the apex arm and `pX=bu` test. Focused Lean checks pass; all three declarations have axioms exactly `[propext, Classical.choice, Quot.sound]`. | This repairs the audit defect without claiming B1 closure. Known-center arms still need a new geometric consumer; the fresh arm additionally lacks reverse omission `q ∉ selectedAt X`. The downstream survival-square terminal remains explicitly open. |
| H1 FR92/Table-2 transcription | **Resolved as an apparent printed Table-2 typo.** P4 is complete/admitted; the source image reads `k ≥ 3` and the corpus `k > 3` is an OCR glyph error. Two independent encoders enumerate identical 16,478 forbidden occurrences at 6×8. The displayed 19-one witness has no P1–P4 occurrence, while the 20 upper bound is DRAT-verified UNSAT. | Record the audited conditional value `g_candidate(6,8)=19` and do not import the printed 18. Reproduction anchors: `verify_table2.py` SHA `a9d1fcf…`, `audit_predicate.py` SHA `5cd6bab7…`, upper CNF SHA `a7160501…`; the original PDF SHA is `ca4a813a…`. P4 remains admitted and need not be reopened. |
| H2 shortest-side bank adapter | **Bank-only, retired from the active proof plan.** Five normalized lemmas and one-way adapters are checked, but no production caller exists; the intended all-large-cap branch now closes via the uniform metric terminal. | Reopen only with a named caller and a source-derived normalized package including shortest-side split/WLOG, similarity, `ConvexIndep`, transformed MEC data, and coordinate inequalities. Existing normalized lemmas alone are not a producer. |
| H3 exact-17 rich rotation | **Exploratory query closed with no authenticated result.** Existing exact-17 survivors are Boolean-only/source-unrealizable and leave 21 metric unknowns; no later metric run or angle certificate was found. | Do not cite rich rotation as established. Reopen only for a scoped metric run with an explicit angle predicate, source-realizable inputs, run manifest, and authenticated result. |
| H4 source-order v27 | **Governed canary reproduced and published.** Commit `5af46ccec` contains `source-order-v27-receipt-20260904/run-0001`, which exited 0 with `SAT_WITNESS_REPLAYED`, 81 entries (`cedf4162…`), post-install CNF `82be5127…`, and final `discovery.cnf` `8da06d5e…`. Exact-once and tamper tests passed (`2` tests, `6` subtests); staged hygiene and self-hash checks passed. | The frozen v27 validator correctly failed closed (exit 2) because legacy-local mode emits no PIQD journal/descriptor. Receipt self-hash is `9f6b0c07…`; run-manifest self-hash is `e875f000…`. Exit requires PIQD-mode replay/descriptor custody and a literal historical-witness rejection fixture; the bounded SAT replay is not terminal UNSAT or a Lean proof. |
| H5 BANK-001 publication/export | **Active external-service blocker.** The P97 migration adapter requires snapshot tokens, detects drift, and deliberately raises `BLOCKED_ON_PIQD_FEATURE`; its 24-test suite and Ruff checks pass. Current PIQD has separate blob ingest/evidence creation, no atomic publish endpoint, no snapshot token, and prose-only errors. | PIQD handoff `#12862` supplies the acceptance matrix; tracking memory is `01M1QCNFB10E6749WBJKE2TRZR`. Exit requires the atomic publication and materialized/tokenized snapshot APIs before P97 APPLY is enabled. |
| H6 RVOL full binary (`691006…`) | **Original archive unrecovered; binary claim retired pending recovery.** The verified native report (`419b6603…`) and abstract Fin-9 Wave2b evidence (`9a92c627…`) are separate and do not authenticate the archive. | Reopen only if the originating archive is retrieved and bound to its report, certificate, and consumer. Until then retain the report and mark the binary claim unreproduced. |
| H7 exact-n=10 master (`dffbade…`) | **Original master unsupported and retired pending recovery.** No matching bytes, manifest, or replay command were found. The semantic 8,400+840+40 census and independent Lean Fin-10 chain are separate results. | Reopen only with exact master bytes plus generator/order/manifest/replay evidence. Do not present the semantic census as payload recovery or exhaustive UNSAT. |

## Publication notes

The remediation lane is governed by
`.codex/worktree-checkpoints/nthdegree-audit-remediation-20260904.json`. Its
owned paths are intentionally narrow because the shared worktree contains many
foreign lanes. Immutable nthdegree file links cannot currently be minted in
this environment because `NTHDEGREE_MCP_FILE_ROOTS` is not configured; for A2,
the repository path, SHA-256, conversation message, and linked memory relation
form the durable correction chain.
