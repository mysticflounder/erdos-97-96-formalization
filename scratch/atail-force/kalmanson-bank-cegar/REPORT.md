# Direct selected-row Kalmanson producer-bank audit

Date: 2026-07-16

Status: **THE FORWARD DIRECT-ROW MATCHER IS SOUND AND USEFUL, BUT IT IS NOT
EXHAUSTIVE ON THE CORRECTED FIXED FOURTEEN-ROLE SURFACE.**

This lane changes the shared producer bank and its focused tests. It does not
change production Lean, a closure document, or the protected unique-row,
`SurplusM44`, or `SevenPointTwinFourCircleCollision` lanes.

## Bank integration

`census/atail_force/producer_bank.py` now accepts the forward-CCW stage

```text
equality-convex-five-point-three-selected-row-kalmanson
```

with roles in cyclic order

```text
O < A < Y < E < C
```

and exactly these direct selected-row incidences:

```text
YRow contains O,E
ORow contains E,C
ARow contains C,O.
```

The record names the production consumer

```text
Problem97.CapCrossingKalmansonBridge
  .false_of_selected_rows_in_five_ccw_order
```

in module

```text
Erdos9796Proof.P97.ATail.CapCrossingKalmanson.
```

The matcher uses the actual `MetricRow.support` sets. It does not call or
inspect `_row_equality_closure`, ignores the `exact` flag, and does not test
the reversed order. The runtime fails closed if the production module or the
named declaration disappears from source.

The core payload is exactly the integer role map `{O,A,Y,E,C}`. Additional
metadata records the production Lean module and the cyclic rotation used by
the match.

### Rotation obligation

The Python input is a cyclic order, so the matcher tests every forward cyclic
rotation. The Lean consumer instead receives one linear `Fin carrier.card`
enumeration and hypotheses `iO < iA < iY < iE < iC`. Therefore a match with
nonzero `boundary_rotation_start` is not by itself the live parent adapter:
the eventual producer must construct the corresponding rotated CCW
enumeration and transport its image/injectivity/CCW facts. The bank records

```text
boundary_rotation_start
requires_rotated_ccw_enumeration
```

so this obligation cannot be silently lost. The direct-only run used eleven
different rotation starts, including `0`; it is load-bearing in practice.

## Existing-bank preflight

Before integration, the registries required by `AGENTS.md` were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries for the five-point cyclic
selected-row/Kalmanson terminal found nearby ordered-row consumers but no
duplicate of this normalized direct three-row statement. The detailed source
adapter preflight remains in
`scratch/atail-force/kalmanson-terminal-bank-adapter/REPORT.md`.

## Corrected-prefix and all-bank steering evidence

The independent direct-row replay of the corrected stored prefix still gives

```text
stored corrected survivors                 101
forward direct-schema survivors             101
forward direct-schema embeddings            383
```

against seed checkpoint

```text
sha256 b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9.
```

A fresh all-bank continuation seeded only with the seed's 524 already-sound
cuts then produced 42 further independently verified structural shadows. All
42 contained the new forward direct-row stage. It stopped at its explicit
wall budget with

```text
status                  WALL_BUDGET_FAIL_CLOSED
total survivors                              143
post-seed survivors                           42
post-seed new-stage hits                      42
total bank cuts                              761
```

This is useful recurrence/steering evidence, not coverage. Its bounded
checkpoint is `coverage_checkpoint.json`, SHA-256
`9cb50339e32eeff34171a706edaec58ac26e21a5b9b1466ef2864e2bd6a7f652`.
Because the stored seed's MARCO cores were minimal relative to the *old* bank,
adding a monotone matcher can make their historical deletion-minimality
metadata false. Accordingly this seeded checkpoint is not the acceptance
artifact for the expanded bank; the clean direct-only checkpoint below is.

## Decisive direct-only coverage experiment

`direct_schema_coverage.py` starts from the corrected fixed fourteen-role map
with no seed cuts. Every accepted cut is projected to exactly the selected-row
centers needed by the new stage and is rescanned before use. Existing producer
families, reverse orientation, exact-row facts, and transitive equality are not
cut reasons in this experiment.

The result is:

```text
status             SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW
schema-matched verified witnesses                              51
direct-schema cuts                                             51
schema-avoiding verified witness                                1
terminal iteration                                             52
total DFS nodes across the 52 witnesses                      2,813
maximum DFS nodes in one iteration                            227
```

Of the 51 sound cuts, 42 depend on three variable selected rows and nine on
two variable rows plus the fixed ambient first-apex row. The 52nd witness
passes the corrected structural verifier and has no forward direct-row match.
Its complete rows and blocker map are stored in the checkpoint; their
canonical hashes are

```text
rows      946943a5b4f16f2649ed5802dbc48419c3a3a19c81d77576719c981198dc445e
blockers  b210bdbe92a5e3eddd89ed552507d8b15f78461b55856b903384940fe59beafe.
```

The decisive checkpoint is
`direct_schema_coverage_checkpoint.json`, SHA-256
`f3d36762c63be39b77aaaae2d2de34199eeffca4cbc5cdad8e919e8f444d182a`.

Therefore the three-row terminal should remain in the producer bank as a
small valid cut, but it cannot be the only Kalmanson consumer. The next finite
consumer must cover a broader ordinal strict-cycle/schema family (or the full
linear Kalmanson/Farkas system). This witness does **not** refute that broader
route; it avoids only the exact direct three-row pattern formalized here.

## Epistemic boundary

The negative coverage result is **EXACT WITHIN THE CORRECTED FIXED
FOURTEEN-ROLE `PROFILE=(8,4,5)` FINITE STRUCTURAL ABSTRACTION**. It is not a
Euclidean realization, a Problem 97 counterexample, a live-parent extraction,
or a statement about other profiles/cardinalities. Conversely, the matched
schema is backed by the production Lean consumer, but a live K-A-PAIR use
still needs the parent boundary-rotation/order and selected-row producer.

No production `sorry` is closed by this bank integration alone.

## Pinned sources and validation

The direct-only checkpoint pins:

```text
producer_bank.py                    484510cafb79a1256a0dcd030958e57145229654cabd245aa29030543b1cf8cb
CapCrossingKalmanson.lean           e29ef9b7c84a6acc87be9f830ff9059e1be4377bec49dd7ccafb17f490bb1b22
direct_schema_coverage.py           8cae8220eb4b7aac377b81a378a5ed223598351c1491ca4783c36aaa17369cd1
corrected robust search.py          54edd2c3ed92ef6d0d55f5f5196d9ec84d2d04cabc40a3ecc04cabbcb4a16d02
authoritative bank_cegar.py         35b911ccde42691fee1f9d425634f626154cc0621ff8802b8f7f1d2547a8ea16
shadow.py                           a9ab1452444cd4e79d7a4ea6fc291a1522394cad3a841c4bb439fcf67da82e62
```

Focused bank tests passed all 11 cases, including:

- the positive canonical match and exact metadata;
- deletion of each required direct row;
- a closure-only false positive regression;
- rejection of the reflected/reverse-only fixture;
- nonzero rotation metadata; and
- fail-closed behavior when the production consumer source is absent.

The direct checkpoint gate passed:

```text
checked_direct_schema_cuts = 51
verified_witnesses = 52
status = SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW
```

The independent `verify_artifacts.py` replay reconstructed all 52 row systems,
reran the corrected structural verifier and direct matcher, and confirmed 51
matched witnesses followed by exactly one terminal avoider. It also checked
the pinned checkpoint, terminal-row, and blocker hashes.

Reproduction commands:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python -m unittest \
  census.atail_force.tests.test_producer_bank -v

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/kalmanson-terminal-bank-adapter/schema_audit.py \
  --check --summary

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/kalmanson-bank-cegar/direct_schema_coverage.py \
  --output scratch/atail-force/kalmanson-bank-cegar/direct_schema_coverage_checkpoint.json \
  --check --max-iterations 4096 --wall-seconds 300 \
  --max-nodes-per-iteration 5000000

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/kalmanson-bank-cegar/verify_artifacts.py
```
