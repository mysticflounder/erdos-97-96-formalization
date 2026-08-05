# V38 pinned seed-center multiplicity canary

## Status

Bounded full-metric diagnostic: **UNKNOWN** (`canceled`) on the single canonical
case `fresh_DDD_k0_d2_f1` after a 20,000 ms solver timeout.  Total wall time was
28.647 seconds, including encoding, Boolean-audit, and solver construction.

This is not a P97 closure, counterexample, Euclidean realization, certificate,
or publish-target proof.  The new constraint is a source-proved producer, but
v38 inherits v37's forced hypothetical branch-two-hit producer.  Consequently,
even an UNSAT result would be conditional; SAT or UNKNOWN closes nothing.  The
coordinator-interface frontier is unchanged.

## Encoding

V38 extends the v37 diagnostic configuration (`pairwise=True`,
`force_producer=True`) with the physical-shell consequence of:

- `endpointFresh_exists_seedCenter_all_selectedRows_escape_twoShellSeed_of_sharedBlocker`;
- `endpointFresh_exists_seedCenter_selectedClass_seed_card_le_three_of_sharedBlocker`;
- `endpointFresh_exists_seedCenter_ne_firstApex_ne_sharedBlocker_selectedClass_seed_card_le_three`.

It adds one one-hot selector over the 15 possible seed centers:

- 15 semantic Boolean atoms;
- one exact-one assertion and 15 selector-implies-seed assertions;
- 210 guarded ordered representative instantiations `(center, representative)`
  with distinct labels.  Each bounds by three the seed points whose physical
  distance from `center` equals the representative's distance.

The 210 instantiations are not necessarily 210 distinct physical shells:
equal-radius representatives intentionally produce logically duplicate caps.
No four-subset expansion is used.

The last Lean theorem does not require two extra ad hoc solver clauses.  In the
full metric encoding, pinning the first apex is already inconsistent with the
four-point `Q.row` shell inside the seed, and identifying the pin with the
shared blocker is inconsistent with the four-point common critical shell.
Focused full-formula regression checks assert each forbidden role in turn and
obtain `UNSAT`.  This checks theorem/encoding alignment; it does not change the
canonical canary's `UNKNOWN` status.

The full formula has 27,294 high-level assertions and SHA-256
`305f6643e1fc1eb37bfcf008e36c53c5fc647537c27dc76cdb9122e35538ac37`.
All 44 group trackers exactly match the encoded family set.

## Boolean-relaxation boundary

The Boolean audit included 8,937 assertions and excluded 18,357.  It included
the 16 selector assertions but excluded all 210 physical-shell caps because
they contain real distance equalities.  Therefore a Boolean-only v38 run would
not test the pinned physical multiplicity producer.

## Verification and invocation

Focused verification:

```text
uv run --with ruff ruff check scratch/retained-omission-e1/round5-general-cegar/v38_pinned_seed_center_multiplicity_canary.py scratch/retained-omission-e1/round5-general-cegar/test_v38_pinned_seed_center_multiplicity_canary.py
All checks passed!

uv run --with pytest pytest -q scratch/retained-omission-e1/round5-general-cegar/test_v38_pinned_seed_center_multiplicity_canary.py
6 passed in 32.53s
```

The only full-metric command run was:

```text
uv run python scratch/retained-omission-e1/round5-general-cegar/v38_pinned_seed_center_multiplicity_canary.py --timeout-ms 20000
```

The exact result, direct-source worktree hashes, provenance hash
`99861cb7afc1958cf9da204cb1a268983705be370cceed37301c189aedf9f7ab`,
and formula hash are recorded in
`v38-canonical-full-metric-diagnostic.json`.  This is an exact worktree snapshot
of direct v38 sources and dependencies, not a git-HEAD-authenticated production
manifest.

After that diagnostic was recorded, the provenance contract and focused tests
were refreshed to name the strengthened role-exclusion theorem explicitly.
This metadata/test-only refresh leaves the SMT constraint set unchanged.  The
JSON remains the immutable record of the earlier diagnostic snapshot and is
not a fresh replay against the refreshed direct-source hashes.
