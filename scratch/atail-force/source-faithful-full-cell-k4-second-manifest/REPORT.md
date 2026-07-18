# Source-faithful second blocker-manifest audit

Date: 2026-07-18

Status: **BOUNDED FAIL-CLOSED NO-HIT.**  Starting from the exact algebraic
completion

```text
uS1 -> x21
x21 support = {uS1,t0s,t1s,o},
```

this lane tested 76 ranked source-oriented rows at the other nineteen missing
blocker centers.  Every atom contained a previously unmapped source.  A hit
was accepted only if the full predecessor open cell, the x21 row, the proposed
second row, and the exhaustive deletion-critical `BlockerRowManifest` at both
blockers all replayed.

No atom passed.  This is **not UNSAT, not coverage, not a MUS, and not a Lean
theorem**.  It closes no production `sorry`.  It is a bounded checkpoint that
prevents numerical failures from being promoted into a mathematical claim.

## Pinned input and theorem-bank preflight

The search pins the committed x21 artifacts:

```text
6e181dd0a0c3259d899badfe27616f123c0f28bb13c00c91e914862ddcf1b7a0
  ../source-faithful-full-cell-k4-completion/x21-algebraic-certificate.json
11ba88b63520a6472a8d40c11ee9fc4285e3f9050488bb3fe854d3b19b076d08
  ../source-faithful-full-cell-k4-completion/x21-validation.json
```

Before writing the search, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries for full blocker rows,
`CriticalShellSystem.no_qfree_at`, source membership, exact shells, and
deletion-criticality found the existing production semantics but no banked
second-row certificate.  The closest reusable declarations were
`CriticalShellSystem.no_qfree_at`,
`criticalSelectedFourClass_of_minimal_deletion_member`, and
`cumulative_deletion_blocked_at_source_blocker`.

## Encoding smoke test

The seed replay passed before either search:

```text
x21 normalized row residual       3.7210906648399475e-16
minimum mathematical cell margin  7.558148892663404e-8
minimum exhaustive x21 manifest   2.9407111788482817e-4
atom count                         76
```

The predecessor used a conservative `1e-7` strict-hull search floor, while
the exact x21 algebraic root has a positive raw hull margin of about
`7.568e-8`.  This lane therefore records and uses a declared mathematical
`1e-10` floor for the hull gates.  It does not silently reject the certified
seed because of the older discovery-only safety floor.

For each blocker/source pair, the numerical manifest contains:

1. source membership and positive source radius;
2. four named equal-radius support points;
3. nonzero support/outside radius gaps; and
4. every pairwise outside-radius gap after source deletion.

Items 3 and 4 are exhaustive over all 26 named carrier points.  Thus a
candidate can pass only when deleting the source leaves the represented class
with three points and every other radius class with size one.  Equality is
still numerical, so even a passing result would have required an exact
algebraic/interval lift before banking.

## Pass 1: full-ledger penalty oracle

`search_second_manifest.py` used twelve workers, at most 700 function
evaluations, two restarts, and a 30-second hard timeout per atom.  It retained
the full cell and both manifests in the penalty ledger.

```text
attempted               76
numeric SAT candidates   0
UNKNOWN_NO_HIT           76
timed out                74
```

The best retained-cell residual was approximately `1.04e-3`, at

```text
t0s -> x00 : {uS1,t0s,t1s,o}.
```

Its cell margin was only `1.52e-12`; the other near-best attempts likewise
pressed against the strict-hull boundary.  Because the oracle is not
UNSAT-capable, no failure was shrunk or banked as a MUS.

## Pass 2: change of instrument

Extending the same timeout would not strengthen the result.  The second pass
instead used rank-revealing QR to select six construction variables for the
six independent row equations, froze the other twenty variables, solved the
square local system, and then replayed every gate.

```text
attempted                         76
accepted numeric candidates        0
exact-equality hits failing a gate 66
UNKNOWN_NO_HIT                    10
```

The closest exact-equality local hit that retained cyclic order and both
deletion manifests was

```text
t1s -> t1o : {t1s,o,uI,x10}.
```

It had normalized equality residual `2.48e-16`, but failed the predecessor
cell: minimum MEC margin `-1.306e-3`, strict-hull margin `-1.050e-3`, and
additional existing-filter collisions.  It is therefore only a diagnostic
relaxed hit, not a witness.

The recurring boundary pressure suggests a possible finite obstruction schema

```text
x21 exact row + one nearby second exact row + retained full cell
  -> hull/MEC or inherited exact-filter failure,
```

but this is **not a MUS**: the six-variable slices do not quantify over the
other twenty degrees of freedom, and pass 1 ended UNKNOWN.  A sound next move
would need an exact full-dimensional oracle or a theorem explaining the
observed hull/MEC boundary, not a larger batch of the same local solves.

## Replay

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/source-faithful-full-cell-k4-second-manifest/verify.py
```

Expected result:

```text
SECOND_MANIFEST_BOUNDED_REPLAY_PASS
first_pass = 76 UNKNOWN_NO_HIT; 0 candidates; 74 timed out
six_dof = 66 exact-equality gate failures; 10 UNKNOWN; 0 candidates
closest_exact_hit = t1s->t1o:t1s,o,uI,x10
coverage_claim = false
unsat_claim = false
```

Syntax gate:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project python -m py_compile \
  scratch/atail-force/source-faithful-full-cell-k4-second-manifest/\
  search_second_manifest.py \
  scratch/atail-force/source-faithful-full-cell-k4-second-manifest/\
  search_local_six_dof.py \
  scratch/atail-force/source-faithful-full-cell-k4-second-manifest/verify.py
```

## Artifact inventory and ownership

- `search_second_manifest.py`: bounded full-ledger oracle;
- `search-log.jsonl` and `checkpoint.json`: pass-1 append-only log and terminal;
- `search_local_six_dof.py`: rank-revealing local square oracle;
- `six-dof-log.jsonl` and `six-dof-checkpoint.json`: pass-2 log and terminal;
- `verify.py`: independent fail-closed artifact replay; and
- `REPORT.md`: this checkpoint.

This lane edited only
`scratch/atail-force/source-faithful-full-cell-k4-second-manifest/`.  It made
no production, shared-doc, proof-blueprint, git, `ShellCurvature`,
`SurplusM44`, or active-lane changes.
