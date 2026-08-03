# V33 endpoint shared-blocker selected-seed checkpoint

Date: 2026-08-03

## Status

Schema v33 is a source-frozen, exact-15 computational slice of
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
It covers only the ordinary `fresh` arm after endpoint collision and the
shared-blocker alternative have been selected.  The implementation, schema,
and focused contract tests are ready for the 192-case production matrix.

A clean-checkout launch audit additionally requires every inherited schema and
the lockfile read by the composed v8/v9/v12-v19/v29-v33 provenance chain to be
versioned.  The focused suite now checks that complete tracked-runtime closure
explicitly; this prevents a dirty working tree from masking a missing runtime
dependency.

This checkpoint is **not** a Lean proof, finite coverage of the parent theorem,
or a universal P97 result.  It creates no Lean obligation and does not change
the coordinator-interface frontier: the anchor still reaches eight terminal
leaves, and no ninth leaf is introduced.

## Encoded continuation

For distinct first-cap interior roles `kept`, `deleted`, and `fresh`, v33
introduces:

- a one-hot point `J` outside the first strict cap interior;
- the dynamic critical row `common` selected by `blocker(kept)`;
- `Q.row`, represented by `qrow`, an exact selected four-subset of the first
  rich apex class containing `kept` and `J`;
- the exact six-point seed `common ∪ qrow`; and
- one simultaneous exact selected four-subset `qsel[c]` of the encoded K4 row
  at every center `c` in that seed.

The endpoint collision identifies `blocker(fresh)` with `blocker(kept)`.
The selected `J` cross-hits the dynamic row at `fresh` and has the same
blocker as `kept`.  The intersection of `common` with the first frontier is
exactly `{kept, J}`.  Finally, at least one active `qsel[c]` must escape the
six-point seed.  This is the finite form of the banked universal
selected-row escape producer.

The soundness boundary is load-bearing: neither `qrow` nor any `qsel[c]` is
registered as a full physical circle class.  They are selected four-subsets,
so off-subset points remain unknown and cannot generate full-shell
nonmembership or power-pattern entries.

## Frozen counts and provenance

The v33 layer adds exactly 251 semantic Boolean variables:

- 11 `J` selectors;
- 15 `qrow` selectors; and
- 225 `qsel` selectors.

The complete expected semantic count is
`1031 + 15 * profiles.count("D")`.  The new layer contributes 702 tracked
constraints.  Its source contract includes the endpoint-critical fiber,
endpoint-fresh cross-or-deletion, first-apex selected-row source,
retained-matching common-deletion cycle, exact-six seed, faithful selected-row
adapter, and live target files.

Frozen file hashes:

- `round5_cegar_v33.py`: `aa3468a494f911927e60343f52fe028bc0591b16ec20d60884711a99271275e4`
- `schema_v33.json`: `82edd3898821dd3c4537ee9fc606f9e004b633c46a2148357382751dd1cdd016`
- `test_round5_cegar_v33.py`: `8cf08b3ebb8c77b81425609908f4a68758150ef5dbecb74cac555cf0cbeca9e2`
- `focused-tests-v33.log`: `8a12e55192aeb5866e0be2a9f6b1fb932e47eee80bae6b629b33ca3b718b90da`
- `uv.lock`: `a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c`

An independent static audit found no remaining semantic mismatch after two
repairs: the retained-matching source file was added to the provenance
contract, and the role map was tied to the correct endpoint-fresh producers.
The composed runtime also captures the v30 Boolean-count implementation before
rebinding, avoiding recursive delegation through the v32 compatibility hook.

## Verification

Focused verification is green:

- Ruff: clean;
- Python compilation: clean;
- pytest: 9 tests and 3 profile subtests passed; and
- spawned-child smoke: `child_contract_valid = true`.

The clean-checkout smoke from detached commit `643f30fe` is
`artifacts-v33-smoke-clean-checkout/20260803T133829.616026Z-smoke-pid81530`;
its `summary.json` SHA-256 is
`f77e1508a5e5381f89db7f91d3ffc9fc0de41f9fae61f82b02cc826c8936ed9a`.
Its single case, `fresh_SSS_k0_d1_f2`, is externally `UNSAT`, complete, and
produced zero assignment records.  This establishes that the v33 clauses can
close at least one labelled SSS slice in the Boolean prepass.  It does not say
anything yet about the other 191 cases.

## Terminal classification

The frozen 192-case matrix ran from detached commit `643f30fe` with 23 nice-15
workers under
`artifacts-v33-production2-clean-643f30fe/20260803T133955.191739Z-matrix-pid89083`.
It terminated after 1487.31 seconds with:

- 144 `UNSAT` cases, all at the inherited Boolean prepass;
- 36 `UNKNOWN` cases;
- 12 runtime-error cases; and
- zero `SAT` cases.

The aggregate has `child_contract_valid = true`, an empty child-validation
error map, exactly 192 result records, and exactly 192 recorded result-file
hashes.  Recomputing all 192 hashes found zero mismatches.  The terminal
`summary.json` SHA-256 is
`6eeef80f2a5e614d2fd0f8aabad2526f39c1841d3a88290dff345ca20b174960`.
The corresponding `invocation.json` and `progress.json` SHA-256 values are
`bb814303a026c22abeb925525463dcfbf2376155acedd4c0273673354f49e34a`
and `75bef06170a58238ed1c27a2d47a963ae71a6a87a6891ebd18f8d65b2d4c7f6f`.
An independent audit also recomputed the trace, prepass, frozen-blob, and
assignment-journal hash chains and reran the exact child validator over all
192 durable results; it found zero errors.

The profile split is exact.  `SSS`, `SDS`, `SSD`, and `SDD` close 24/24;
`DSS`, `DSD`, and `DDS` each close 12/24 and leave 12 `UNKNOWN`; `DDD` closes
12/24 and errors on the other 12.  Of the 36 unknowns, 35 report
`v33_wall_clock_budget_exhausted` and one reports `boolean_master: canceled`.
The unknown traces contain 1,057 completed full-assignment checks, all UNSAT,
but none exhausts its whole Boolean case.
The 12 errors all report the same fail-closed provenance defect:
`track_exact_fifteen_s_profile_mutual_class_pair` is absent from the frozen
formula-tracker allowlist.

This is a terminal authenticated **incomplete** computation.  It proves the
144 labelled exact-15 subcases only; it does not close the 48 remaining
labelled cases, the selected-seed slice, any terminal Lean leaf, or the parent
retained-omission theorem.

## Mandatory audits and successor lane

The global theorem-bank audit found no banked general-n contradiction matching
the v33 selected-seed/shared-blocker hypotheses.  The reusable banked material
is generic infrastructure (`exists_selectedFourClass_of_globalK4` and
`SelectedFourClass.inter_card_le_two`), already represented in the current
encoding; the simultaneous prescribed-row producer is the newer local theorem
`exists_faithfulCarrierPattern_with_classes_on`, not an omitted bank hit.

The odd-round efficiency audit found that the Boolean prepass is not the hard
case bottleneck: completed prepasses returned within 16.7 seconds.  On a
representative 636.93-second hard case, dual normalization consumed 367.60
seconds while the recorded solver calls consumed about 8.24 seconds; roughly
245 seconds remains uninstrumented and must not be assigned to a phase without
new telemetry.  The hard downstream branch is confined to 12 joint
`(kept, deleted, fresh)` role tuples.

Before another production wave, repair the D-profile tracker allowlist and add
durable phase timing around normalization, reconstruction/hash work, formula
hashing, and journal writes.  Exercise only the 12 hard role tuples as the
canary lane.  Do not rerun the 192-case monolith or claim convergence from the
144 Boolean-prepass closures.
