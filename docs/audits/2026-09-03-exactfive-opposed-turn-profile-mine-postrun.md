# Exact-five opposed-turn profile mine post-run audit

## Verdict

CERTIFIED for the declared formula/profile scope. No custody, replay,
inventory, count, engine-identity, or terminal-integrity blocker was found.
This audit does not establish a theorem, source realization, source
completeness, Lean ingress, or promotion.

## Run custody

The audited run is
`scratch/runs/exactfive-opposed-turn-profile-mine-20260903/run-0002/`.
Its `worktree-run-manifest/v1` records base
`8526f8e379c81f0933501b3437bbb40ff522d4eb` and self-hash
`0c0980d5283970de8a1b008ad57345bc17f6a11cf05a2b7b46b2eab1e6680497`.
All current source and predecessor-input digests match the manifest.

The launch self-hash is
`9c6226dcf01c5ae8702197721a1d9b9f900a73f8c3b67800427baffaba4c5bfa`;
the terminal self-hash is
`9ddbd9e8eed66f3bce9ba3f8d66d74f2afbef9428c14f0c350b8ab837a37c2c7`.
The launch binds predecessor manifest, launch, terminal, and profile-stream
self-hashes `81e3b3c6bcddef75fbc8a2d22eda9787f6f6db5c394aca2de68b689a91d86299`,
`142ce963789fca3efb419b4be21495cdbdb5195677a32cc9f736201a027b0494`,
`6baab84ed88abc816965447f9b4f5ce90f62a7c90c8c4e777aa6496e6e62d9e2`,
and `fd2e737527f98dbba812db3c1769b4d8fa9a3d5f2f6298c104b8bc3fe215a6a7`.

The terminal tree has exactly 2,801 regular single-link files: the run
manifest, launch, terminal, and 2,798 profile records. The producer's
completed-run path reconstructed every profile query, authenticated every
predecessor terminal link and result directory, reparsed every SAT cell's
exact rational readback, replayed every rank and distance assignment, checked
all record and envelope hashes, and returned success without output.

Before and after that replay, the sorted file-content aggregate was
`b703c6d8b40b291c35f31cb1403478664bd01e8231626c7faace5d79dcb1897a`
and the sorted path/type/inode/link/mode/size/mtime aggregate was
`4f5f104e41451228b361e4da286f4335cdfb8173fa98b28e92715c37ae013526`.
The file count remained 2,801. This proves that the completed replay did not
mutate the run tree.

## Deterministic findings

The terminal recomputes and pins:

- 2,798 authenticated profiles;
- 558 profiles passing the structural filter;
- 34 SAT-bearing profiles and 56 SAT engine cells;
- 50 SAT cells matching the opposed-turn obstruction;
- 28 profiles for which every SAT cell matches; and
- residual profiles `360, 363, 376, 467, 470, 483`.

The engine-specific residual outcomes are also pinned. Profiles 360 and 467
have a nonmatching Z3 SAT cell and a matching cvc5 SAT cell. Profiles 363,
376, 470, and 483 have a nonmatching Z3 SAT cell and a cvc5 UNKNOWN cell. For
the two cvc5 matches, both `u` and `v` witness the obstruction. Every residual
profile retains exactly one nonmatching SAT cell.

An independent full-record audit reconstructed and compared all 2,798
records. Across both engines it counted 324 SAT/replayed outcomes, 90
UNKNOWN/inconclusive outcomes, and 5,182 UNSAT/discovery-only outcomes. It
also found the runtime `tmp` directory empty and no run-specific blocker.

## Claim and transport boundary

The launch records `solver_transport: false`. A static audit of the producer
and runner found no solver-process, network, or HTTP invocation. The completed
replay consumes the immutable predecessor artifacts and does not contact a
solver.

The terminal explicitly sets all of `theorem`, `source_realization`,
`source_completeness`, `lean_ingress`, and `promotion` to false. Its finding
scope is `authenticated-order-formulas-and-profile-engine-cells-only`.
Accordingly, the certified result is limited to the authenticated formula and
profile-cell census.

## Completed-wave theorem mine

The 50 matched cells instantiate the already-formalized
`twoEquilateralCircle_opposedTurns_false` obstruction. The six residual
profiles expose unmatched model patterns, but this wave does not yet supply a
concrete new theorem statement with its required antecedents. No new theorem
candidate was therefore available, so the governed Lean-corpus reuse search
was not repeated.

## Validation

The following focused checks passed:

```text
PYTHONDONTWRITEBYTECODE=1 UV_NO_SYNC=1 uv run python scripts/run_exactfive_opposed_turn_profile_mine.py
PYTHONDONTWRITEBYTECODE=1 UV_NO_SYNC=1 uv run pytest -p no:cacheprovider -q census/card_head/tests/test_exactfive_opposed_turn_profile_mine.py
UV_NO_SYNC=1 uv run --with ruff ruff check --no-cache census/card_head/exactfive_opposed_turn_profile_mine.py census/card_head/tests/test_exactfive_opposed_turn_profile_mine.py scripts/run_exactfive_opposed_turn_profile_mine.py
```

The completed-run replay exited zero and was silent. Pytest reported 26
passing tests; Ruff reported no findings.

## Hygiene

The post-run audit lane is
`exactfive-opposed-turn-profile-mine-postrun-20260903`, based at
`7c16443f3d8d7233a0fe638adcf4da29889c55ed`. Its checkpoint self-hash is
`8709bcea81c72b1f45b852815741ab3b5b960d98f242985c990701bdfe0b5b19`.
The sparse hygiene report validated the checkpoint and reported zero issues.
Its overall `blocking: true` state comes from pre-existing shared-worktree
foreign, unregistered-generated, and untracked state; it found no audit-lane
or run-specific hygiene defect.
