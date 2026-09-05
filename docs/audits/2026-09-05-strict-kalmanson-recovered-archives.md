# Strict-Kalmanson archive recovery and n=10 replay

Date: 2026-09-05.

Status: EMPIRICALLY VERIFIED for the n=10 finite row abstraction.
The four archives supplied by Adam are now present in the governed local run
`scratch/runs/strict-kalmanson-recovered-archives-20260905/run-0001/`.
The accompanying JSON receipt records their exact sizes, digests, extraction
roots, checksums, compiler, fresh result records, and replay command.
The complete n=10 archive is retained for repository replay as
`certificates/p97_strict_kalmanson_n10_recovery.tar.xz`.
The original Wave-6 catalog is retained as
`certificates/p97_strict_kalmanson_recovered_catalog.json`.
The three larger wave archives remain in the governed local run.

## Archive integrity

| Archive | Bytes | Internal checksums |
|---|---:|---:|
| n=10 certified recovery | 119,284 | 56 passed |
| Wave 4 | 625,980 | 27 passed |
| Wave 5 n=12 curated | 3,346,211 | 217 passed |
| Wave 6 n=12 corrected curated | 5,404,121 | 128 passed |

The n=10 archive matches the previously requested digest
`7e494f13689dbd7b5daace2a21b99488c285c958d443430d5eba6f1b45377f7c`.
Wave 6 matches the previously reported archive digest
`76af03910f8ab519111a17baf569da1bd186ca5ca0582c61e912ca5eae13f7c6`.
All internal checksum ledgers also pass after the n=10 verifier and replay.
The intake script rejects absolute paths, parent traversal, repeated raw member names,
links, special files, and archives exceeding its unpacked-size bound.

## n=10 semantics and fresh replay

Each of the ten centers selects four distinct other labels. A forbidden
membership clause rules out containing all its listed row memberships.
The recovered bank has 8,400 Berge clauses, 840 shared-pair clauses, and
40 complementary-arc clauses. Decoding the recovered row masks and comparing
their union with `generate_strict_kalmanson_known_clause_census.py` gives
exact equality of all 9,280 clauses.

The recovered bank digest is
`dffbade583eb1576055157ef8dbd8c2a703c399816b5179ded2d20a8ed97d8f7`.
The bundled verifier passes its semantic and stored incremental SAT-witness
checks. Fresh builds from the delivered C++ sources, using Apple clang,
produce:

| Search | Result | States/nodes | Row-0 cases |
|---|---|---:|---:|
| Structural, slow | EXACT_MASTER_UNSAT | 57,228 | 66 |
| Structural, fast | EXACT_MASTER_UNSAT | 57,228 | 66 |
| Independent bitset, symmetry | UNSAT | 55,629 | 66 |
| Independent bitset, no symmetry | UNSAT | 929,250 | 126 |

Both structural searches have 4,744,373 transitions. The search without
symmetry has 118,014,624 row trials and completes in 13.5543 seconds on this
host. These reproduce the reported exact search counts.

Both structural sources have a disabled cycle-pruning function returning
zero. Their result comes from finite membership-bank exhaustion; validity
of the Kalmanson clauses is checked separately. The independent comparison
against the repository generator also checks the actual complementary-arc
images, beyond the bundled verifier's orbit-size checks.

## Scope and continuation

The Wave-6 catalog identity is also authenticated. Parse the retained JSON,
remove `elapsed_seconds` and `catalog_sha256`, serialize with Python
`json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n"`,
and encode as UTF-8. The resulting 23,995 bytes have SHA-256
`dbbae6a503866379882765aab8bfacb9c8ec9c179a21d4a637ecac5b239daf37`.
The original pretty JSON file has 110,303 bytes and SHA-256
`7e50118e6ad930f2f9061d4ff13385911e6f5739532c539df1b93845122b3a19`.
An independent audit compares all atoms, widths, and collapsed-form sets
with the local generator: all 202 records match (12 on four roles and
190 on five roles). The identity includes enumeration statistics and
other object fields absent from the earlier bounded serializer search.
The original catalog generator and verifier are included in Wave 6 under
`source/enumerate_complete_single_k_collapse_catalog.py` and
`source/verify_complete_single_k_collapse_catalog.py`.

The original n=10 archive custody gap and local replay gap are resolved.
This is a finite exhaustive computation, with independent representations
and validated clause semantics. It is not a DRAT/LRAT certificate or a
Lean-reflected finite theorem, and it does not close P97.

Wave 4, Wave 5, and Wave 6 have passed archive integrity checks here; this
does not by itself authenticate every mathematical conclusion in those runs.
The next proof-producing step can consume the actual recovered bank and
sources. Earlier missing-archive reports remain historical records.

## Reproduction

From the repository root, with the four archives available:

```bash
uv run python scripts/intake_strict_kalmanson_archives.py --source-dir /private/tmp
```

Intake requires a fresh registered run root. The receipt supplies the exact
fresh replay command. The n=10 bundle additionally provides
`verify_bundle.py` and `run_exact_replay.sh --no-symmetry`; set PATH to
the project virtual environment and CXX to an available C++20 compiler.
The replay writes only inside its extracted bundle. It rebuilds the
executables and bank, compares the rebuilt bank bytes, and asserts the
expected exhaustive results. Its per-search limits are 120 seconds for
each structural/symmetric run and 300 seconds for the search without
symmetry; reaching a limit is not accepted as UNSAT.
