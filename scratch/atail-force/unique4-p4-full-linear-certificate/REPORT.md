# Unique-four p4 full-linear certificate replay

Date: 2026-07-22

Scope: the fixed `n = 11`, `opp1_card = 4` terminal emitted by
`unique4-star-producer/run_full_linear_cegar.py`. This lane changes no production Lean or shared
closure document.

## Decision

The terminal CNF is **externally exact DRAT-verified UNSAT**:

- CNF: 12,672 variables, 2,765,403 clauses, 158,304,678 bytes;
- CNF SHA-256:
  `d1ff6359442edebbafa2ea9a01aa77c439a681b62a186e73cdbf528028fdb536`;
- CaDiCaL 3.0.0 replay: exit 20, `s UNSATISFIABLE`;
- binary DRAT: 248,900,779 bytes;
- DRAT SHA-256:
  `8460ec3f078691772de38bf2d47e5a973917cb4290cb9e8aea3adfe30f881f62`;
- `drat-trim`: exit 0 and exact line `s VERIFIED` after 3,033.589 seconds.

The checker reports 48,605 input clauses and 950,245 derived lemmas in the backward core, using
81,326,475 resolution steps. The compact hash-bound result is
`certificate_manifest.json`. The 388 MiB of CNF and DRAT data remain under `/tmp` and are
deliberately not tracked.

This is an exhaustive certificate for the exact hashed Boolean formula. It is **not** an
arbitrary-cardinality theorem, a kernel proof of the Python encoding, or a Lean `sorry` closure.

## Encoding and clause replay

`verify_p4_terminal.py` is independent of the CEGAR driver's in-memory CNF objects. It:

1. streams and syntax-checks every DIMACS clause;
2. checks the terminal CNF and original solver-log hashes against
   `unique4-star-producer/full_linear_cegar_p4.json`;
3. checks every encoder/bank source hash stored by that checkpoint;
4. reconstructs the final transported schema directly from the checkpoint and DIMACS variable
   comments; and
5. compares the reconstructed clauses with the exact DIMACS tail as a multiset.

The driver reports 22 oriented transported embeddings. They yield 16 distinct clauses and six
duplicate emissions because two unused roles can move without changing the membership clause.
The emitted multiset is exact; its canonical JSON SHA-256 is
`cbff1428cbc61e126b6e64c213ab1ea708e342748e2e611e6ca3362b7e3c57cb`.

The existing compact semantic gates were also replayed on the current artifacts:

- `verify_corrected_survivors.py --check`: pass;
- `audit_corrected_survivors.py --check`: pass; and
- `verify_seeded_full_linear_cegar.py --check`: pass, 1,164 unique seeded cuts.

These checks audit the intended fixed finite projection; the DRAT proof itself certifies only the
hashed CNF.

## Transport to the kernel-checked p4 consumer

The one CEGAR refinement uses boundary-ordered source vertices

```text
0, 1, 2, 3, 5, 6, 7, 8, 9, 10
```

and the nine memberships

```text
row 0: 2, 5, 9
row 1: 0, 9, 10
row 3: 2, 5, 10.
```

Restricting to source vertices

```text
0, 1, 2, 3, 5, 6, 9, 10
```

is order preserving. In the ten-role transported core these are roles

```text
0, 1, 2, 3, 4, 5, 8, 9.
```

After rank compression, the nine memberships are exactly the antecedent of

```lean
Problem97.CorrectedOwnCapKalmansonCoresScratch
  .false_of_four_endpoint_k2_three_row_instances
```

in `unique4-source-field-audit/CorrectedOwnCapKalmansonCores.lean`. The source assignment contains
every named point in the exact selected row instance; no center-only merge is used. Therefore every
appended ten-role CEGAR cut contains an order-preserving occurrence of that eight-role consumer.

The consumer was independently elaborated with warnings as errors:

```bash
cd lean
LEAN_PATH=/private/tmp/unique4-robust-prov-modules \
  lake env lean -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/unique4-source-field-audit/CorrectedOwnCapKalmansonCores.lean
```

Its axiom closure is exactly:

```text
propext, Classical.choice, Quot.sound
```

## Replay

Recreate the external proof from the exact terminal CNF:

```bash
cadical -t 1200 \
  /tmp/p97_u4_full_linear_cegar_p4.cnf \
  /tmp/p97_u4_full_linear_cegar_p4.replay.drat
```

Then run the complete hash, transport, and DRAT gate:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --offline python -B \
  scratch/atail-force/unique4-p4-full-linear-certificate/verify_p4_terminal.py \
  --cnf /tmp/p97_u4_full_linear_cegar_p4.cnf \
  --solver-log /tmp/p97_u4_full_linear_cegar_p4.log \
  --proof /tmp/p97_u4_full_linear_cegar_p4.replay.drat \
  --run-drat-trim --drat-trim-timeout 3600 \
  --output \
    scratch/atail-force/unique4-p4-full-linear-certificate/certificate_manifest.json
```

For a cheap drift check that does not rerun `drat-trim`, omit `--proof` and
`--run-drat-trim` and write to a temporary output. A full `--check` necessarily needs the same
proof-verification mode because the tracked manifest records the proof hash and verifier transcript.

## Trust boundary and consequence

- **PROVEN externally for the exact CNF:** `drat-trim` verifies the CaDiCaL proof against the
  hash-bound terminal formula.
- **PROVEN in Lean:** the generic eight-role p4 Kalmanson consumer has only standard project
  axioms.
- **EMPIRICALLY/structurally verified:** the Python encoding-to-fixed-projection map and the exact
  occurrence/transport mapping pass independent drift checks.
- **Not proved:** an arbitrary-cardinality occurrence/coverage theorem producing this schema from
  the live unique-four source residual.

Thus the named fixed p4 search surface is closed, while the live proof still needs a source-level
coverage theorem (or additional terminal schemas) before this finite certificate can close a
production `sorry`.
