# Profile-282 core-confirmation post-run audit

## Verdict

CERTIFIED for the declared formula scope. No custody, hashing, session, query,
or terminal-integrity blocker was found. This audit does not promote a
theorem, source realization, Lean ingress, source-completeness result, or
all-order result.

## Run custody

The audited run is
`scratch/runs/exactfive-hard-source-swap-profile282-core-confirmation-20260903/run-0002/`.
Its run manifest is `worktree-run-manifest/v1`, declares base
`05eee6511a2db25ed537328c2a3e9a5ccce0d0c0`, and has manifest hash
`797da5796b99a42613e281d1ddbd8cd80a668526ea148ad924d5f6474ec173ca`.
All 14 declared source and predecessor-input digests verified against current
bytes. The launch record hash is
`d3fa0c8c648c380710bc862fde75bae3364b81f92cdbcda0bacde53e72f24bca`; the
terminal hash is
`a903ff5df7df5e0a669e404df2d0f68db2bea1ee2a85a2944e4fd6d563fd1128`.
Terminal and result self-hashes, launch/manifest references, and predecessor
custody all validate.

The launch contains exactly six sequential, fresh, one-solve cells:

| cell | outcome | selected IDs / returned core |
|---|---|---|
| `z3-mirror-five` | `UNSAT_SELECTED_FORMULAS` | `normalization-000,row-009,area-059,area-244` (drops `area-144`) |
| `cvc5-mirror-five` | `INCONCLUSIVE_UNKNOWN` | no core |
| `z3-mirror-four` | `UNSAT_SELECTED_FORMULAS` | `normalization-000,row-009,area-059,area-244` |
| `cvc5-mirror-four` | `INCONCLUSIVE_UNKNOWN` | no core |
| `z3-direct-four` | `UNSAT_SELECTED_FORMULAS` | `normalization-000,row-009,area-023,area-184` |
| `cvc5-direct-four` | `INCONCLUSIVE_UNKNOWN` | no core |

The six session IDs are unique, with no resumed solve and `solve_index=1` in
each cell. The UNSAT records have nonempty, nonterminal named cores from
`get-unsat-assumptions`; returned terms, source IDs, labels, ordering, source
system hash, and source ledger hash validate exactly. The core labels are
self-hashed labels for the listed IDs.

The cvc5 receipts all report `UNKNOWN`, requested timeout 60,000 ms, effective
deadline 90,000 ms, and `interrupted_by=daemon_deadline`. Recorded elapsed
times are approximately 90,010 ms, 90,022 ms, and 90,020 ms for mirror-five,
mirror-four, and direct-four. These are inconclusive deadline outcomes, not
contradictions of the Z3 results. The imported predecessor cvc5 direct session
was authenticated separately, including its request, result, journal, solver,
labels, and deadline receipt.

The supplied Z3 timings are: mirror-five 4,043 ms, mirror-four 286 ms, and
direct-four 12,308 ms. The terminal correctly records
`mirror_five_cross_engine=false`, `mirror_four_cross_engine=false`, and
`direct_four_cross_engine=false`, because cvc5 did not return UNSAT.

A second local `run_campaign` invocation using a transport that raises on any
network operation validated the terminal and all six existing cells without
creating sessions or changing artifacts. This confirms resumability and
no-transport terminal validation.

## Formula and source audit

Every cell retains all 302 declarations and guarded implications. The
`named_atoms` ledger is sorted by atom ID, while selected IDs are submitted in
the semantic family order shown above; labels are checked against the
self-hashed ledger entries. The mirror-five query includes
`area-144`; mirror-four omits it. The direct-four row and area bodies use the
reflected signs documented in the governing specification. The audited result
therefore supports only the selected unguarded formulas, not the full profile
or any source-to-theorem correspondence.

The exact implementation/specification inputs are authenticated by the run
manifest. Run-root creation and post-creation checks reject unsafe ancestors,
symlinks, and non-directories. The terminal claims are all false for theorem,
promotion, Lean ingress, source realization, source completeness, closure,
and all-order elimination.

No new general-theorem candidate arose beyond the already-formalized
opposed-turn lemma. A repeat corpus search is not warranted unless a future
mine changes the candidate key materially.

## Hygiene

The sparse lane report returned `issues=0`; both owned entries were accepted
without a lane-specific issue. Its overall `blocking=true` status is caused by
pre-existing global worktree noise (foreign dirty paths and unregistered or
untracked material outside this lane), not by this audit’s custody or report
content.

## Durable audit lane

This report is owned by lane
`exactfive-profile282-core-confirmation-postrun-20260903`. Its checkpoint is
`.codex/worktree-checkpoints/exactfive-profile282-core-confirmation-postrun-20260903.json`,
with current lane base `ce312b111f60802600e970cba8806ded1ada6aa6` and verified
self-hash
`edce7b1e2c5f2287f2a2271b4678333c3123b85d0e3694da9ace9d5410886013`.
