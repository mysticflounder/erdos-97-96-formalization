# V33 endpoint shared-blocker selected-seed checkpoint

Date: 2026-08-03

## Status

Schema v33 is a source-frozen, exact-15 computational slice of
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
It covers only the ordinary `fresh` arm after endpoint collision and the
shared-blocker alternative have been selected.  The implementation, schema,
and focused contract tests are ready for the 192-case production matrix.

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
- `test_round5_cegar_v33.py`: `e7833eb30299d2e8596f96dbb2b42eb838f224773710eddef7fdecca0d410057`
- `focused-tests-v33.log`: `532bf36b4e7ba0d37b4e69ce21672be24c2121b0b455dd522ad89ed8efc2d87d`

An independent static audit found no remaining semantic mismatch after two
repairs: the retained-matching source file was added to the provenance
contract, and the role map was tied to the correct endpoint-fresh producers.
The composed runtime also captures the v30 Boolean-count implementation before
rebinding, avoiding recursive delegation through the v32 compatibility hook.

## Verification

Focused verification is green:

- Ruff: clean;
- Python compilation: clean;
- pytest: 8 tests and 3 profile subtests passed; and
- spawned-child smoke: `child_contract_valid = true`.

The source-current smoke artifact is
`artifacts-v33-smoke-checkpoint2/20260803T132004.472447Z-smoke-pid9399`.
Its single case, `fresh_SSS_k0_d1_f2`, is externally `UNSAT`, complete, and
produced zero assignment records.  This establishes that the v33 clauses can
close at least one labelled SSS slice in the Boolean prepass.  It does not say
anything yet about the other 191 cases.

## Next action

Run the frozen 192-case matrix without changing its sources.  On termination,
authenticate every child and durable artifact before aggregating results.
Because v33 is odd-numbered, pair its mandatory global theorem-bank audit with
an efficiency/observability audit before designing any successor round.
