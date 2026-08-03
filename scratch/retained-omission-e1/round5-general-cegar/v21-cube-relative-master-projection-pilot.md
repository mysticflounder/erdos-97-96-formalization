# V21 cube-relative master-projection pilot

## Scope and status

This is a strictly offline pilot. It does not expose a production `solve_case`,
child-wave, or launch entrypoint, and the saved-model report records
`production_launched: false`. No v20 or earlier source was changed.

The implemented rule starts from a complete semantic assignment `A = I and V`
whose v19 raw-formula check `F and I and V` is already authenticated UNSAT. For
a master cube `C`, it queries the exact saved terminal master for

```text
M and C and not I.
```

Only primary and fresh-context Z3 results both equal to UNSAT admit the projected
master blocker `not C or not V` (implemented as the blocker for `C union V`). Any
SAT, UNKNOWN, replay disagreement, malformed assignment/cube, non-shortening
projection, or master/cumulative-blocker identity mismatch returns the original
complete blocker.

The master identity is bound to the finalized v19 result's
`final_master_formula_sha256`; the exact gzip blob is separately authenticated
by byte hash before parsing. The cumulative blocker identity is recomputed from
all 190 authenticated terminal assignments and compared with the finalized v19
result. Parsing normalizes Z3 expressions, so the separately reported parsed
assertion-formula hash is diagnostic and is not substituted for the recorded
terminal master identity.

## Saved-terminal pilot

Input:

- finalized v19 summary SHA-256:
  `327dd9f3df4d4bc36b77bc1866eae8933abf083e4c017899ebead6f9602796b9`;
- finalized v19 result SHA-256:
  `8e1a13271686fb558dc71d95db127afef06a9ba3f2cf28808fe9a30f04c8178a`;
- terminal master formula identity:
  `fad5a5b2831f03efe387a796891462e3bf6a690ae3f3b73b609d148e68a20f6b`;
- cumulative blocker identity:
  `0c781b1b179eca9a149129a15a92b3ebfd3045122a6727319a841c4ae516b2aa`;
- exact saved master blob SHA-256:
  `b5912fe9f3f8cde1c0fb713a5c74d24aefe846407028b420f044eba25888521a`.

The blob parsed to 22,528 assertions. Across the 190 current v19 complete
assignments, 802 of 825 semantic Booleans are invariant and 23 vary. The 16 v20
cubes partition all 190 assignments. With a 2,000 ms per-replay timeout, every
cube's primary query was SAT, with a recorded countermodel violating the proposed
invariant conjunction. Therefore:

- shortened cubes: 0 of 16;
- shortened current v19 assignments: 0 of 190;
- returned blocker size: 825 for every cube;
- result: this rule does **not** shorten any current v19 assignment.

The full machine-readable evidence is in `v21-saved-model-pilot.json`. No fresh
replay was needed for these 16 rows because the primary SAT result already forces
the fail-closed complete blocker.

## Checks

`test_round5_cegar_v21.py` covers a sound successful projection on a small
formula, a SAT countermodel, fresh-replay UNKNOWN/disagreement, master and
cumulative hash mismatches before solver entry, a tampered authenticated full
check, a cube conflicting with the assignment, blocker semantics, and refusal to
run without the explicit `--saved-pilot` flag.

Commands used:

```text
uv run --with pytest pytest -q test_round5_cegar_v21.py
uv run --with ruff ruff check round5_cegar_v21.py test_round5_cegar_v21.py
uv run python round5_cegar_v21.py --saved-pilot --timeout-ms 2000
```

No Lean theorem candidate arose, so no nthdegree Lean/agentic search was run.
The trust boundary is authenticated saved artifacts plus external Z3 primary and
fresh-context checks; this is neither Lean kernel evidence nor a closure claim.
