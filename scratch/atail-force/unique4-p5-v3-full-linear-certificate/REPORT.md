# Unique-four p5-v3 fixed-`n = 11` certificate

Date: 2026-07-22

Status: **EXACT DRAT-VERIFIED BOOLEAN UNSAT FOR THE HASHED FIXED-`n = 11`
CNF; NOT AN ARBITRARY-CARDINALITY LEAN PROOF**.

The independently replayed terminal is the `opp1_card = 5` projection produced
by the corrected unique-four outer after adding the four generic oriented
Kalmanson seed families in
`../unique4-star-producer/kalmanson_row_instance_schemas_seeded_v3.json`.

The exact terminal CNF has:

- SHA-256
  `cbfd6ad9559dce5c9da5874a15da0ba7b5c876dfbaa056fc6eb009fc107119a1`;
- 12,672 variables;
- 2,768,417 clauses; and
- 3,012 unique seeded clauses covering 3,102 oriented embeddings.

The seeded cut set has SHA-256
`983e6e8d8553089efd1797eef3ee8c5389308ea23b2ad3128fb32200f244869d`.
The checker reconstructs those clauses independently from all four schema
records, compares the exact tail-clause multiset, and replays all four
preserved source occurrences against the separately kernel-checked generic
Lean consumers.

## Proof replay

CaDiCaL generated the untracked binary DRAT artifact
`/tmp/p97_u4_seeded_v3_full_linear_p5.replay.drat`:

- byte count: 184,212,068;
- SHA-256:
  `21d83f574691d268aabe24badc7d4cb2a836a4a0b80a851845334096293d0841`.

`drat-trim` checked that proof against the exact hashed CNF and returned:

```text
s VERIFIED
c verification time: 2698.113 seconds
```

The wrapper measured 2,698.140 seconds and exit code zero.  The complete
machine-readable audit is
[`certificate_manifest.json`](certificate_manifest.json), whose final status
is
`EXACT_DRAT_VERIFIED_BOOLEAN_UNSAT_FOR_HASHED_FIXED_N11_CNF`.

The manifest also binds:

- the terminal checkpoint and encoder-source hashes;
- the schema-bank hash;
- every record and cut-set hash;
- the exact CNF dimensions and metadata;
- the four source occurrence replays;
- the hole-free generic Lean consumer sources; and
- the proof hash plus the literal `s VERIFIED` checker tail.

## Trust boundary

This certificate proves UNSAT of one exact, hashed fixed-`n = 11` Boolean CNF.
It does not by itself prove that the Python encoding exactly captures every
source-level residual, does not provide an arbitrary-cardinality occurrence
or coverage theorem, and does not close a Lean `sorry`.  Source closure still
requires lifting the finite exhaustion to the actual unique-four parent data
or deriving a cardinality-independent occurrence theorem for the banked
consumers.

## Replay command

With the exact CNF and proof present at the paths above:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --offline python -B \
  scratch/atail-force/unique4-p5-v3-full-linear-certificate/verify_p5_v3_terminal.py \
  --cnf /tmp/p97_u4_seeded_v3_full_linear_p5.cnf \
  --solver-log /tmp/p97_u4_seeded_v3_full_linear_p5.log \
  --proof /tmp/p97_u4_seeded_v3_full_linear_p5.replay.drat \
  --run-drat-trim --drat-trim-timeout 3600 \
  --output scratch/atail-force/unique4-p5-v3-full-linear-certificate/certificate_manifest.json
```
