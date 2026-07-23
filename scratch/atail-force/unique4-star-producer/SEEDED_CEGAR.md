# Seeded full-linear CEGAR checkpoint

Status: **BOUNDED THEOREM DISCOVERY; NOT A LEAN PROOF**.

`run_seeded_full_linear_cegar.py` is a separate wrapper around the unseeded
driver.  It does not modify or overwrite the unseeded p4/p5 runs.  Its seed
bank is
`../unique4-source-field-audit/kalmanson_row_instance_schemas.json`, SHA-256
`7a00ec6746a89137c29c1304e1872670ca028ff983aaaf0612347eacfb51427e`.

The loader fails closed unless:

- the bank has the expected kernel-checked status;
- every record is bound to an existing source artifact with the recorded
  hash;
- row-instance identifiers are unique;
- row instances have pairwise distinct center roles; and
- the flattened center/member schema agrees with the banked audit field.

The distinct-center check is load-bearing.  The current corrected outer CNF
has one selected row per center, so a repeated-center schema would lose row
identity and is rejected instead of being seeded.

At `n = 11`, the two schemas cover 1,254 oriented order embeddings and add
1,164 unique clauses.  The 90 duplicate p4 clauses arise because one p4 role
occurs only in a strict Kalmanson inequality: different placements of that
role can induce the same Boolean membership clause.  The combined unique cut
set has SHA-256
`dc8ced14d4389f8811b8ce6829d33c79abd7952d07e481d6a73c4a5b06744262`.

Exact static replay is recorded in
`seeded_full_linear_cegar_validation.json`.  It checks both source
occurrences, checks clause-count growth for p4 and p5, and verifies that a
synthetic repeated-center seed is rejected.

The isolated one-hour discovery runs write:

- `seeded_full_linear_cegar_p4.json`, using
  `/tmp/p97_u4_seeded_full_linear_p4.{cnf,log}`;
- `seeded_full_linear_cegar_p5.json`, using
  `/tmp/p97_u4_seeded_full_linear_p5.{cnf,log}`.

The p4 run terminated after 411.35 seconds with zero refinements and status
`BOOLEAN_UNSAT_PENDING_PROOF_REPLAY`.  Its terminal CNF SHA-256 is
`e5b788b9872de4dc41a6754ea91298ca97a41fd64d8cf1d38e06d32a8e7d3d89`.
This is independent solver evidence only; a separate certificate lane owns
proof generation/replay.

## Combined p5-v2 seed

The first two unseeded p5 refinements and the first old-bank seeded p5
refinement all compress to the same cardinality-generic six-role K2 triangle
consumer.  Its synchronized schema/replay live in
`../unique4-kalmanson-occurrence/`.

`build_seeded_v2_bank.py` combines that consumer with the first two records in
the immutable bank `kalmanson_row_instance_schemas_seeded_v2.json`.  The
combined bank has SHA-256
`2b0ff57785fa93ca5682a9c75ecae6c1ad1c8f952fee181869699e953c94bdd0`.
It covers 2,178 oriented embeddings with 2,088 unique clauses; the combined
cut set has SHA-256
`3252b8d1a87ee55763253ce78196761d8cdc54c0da2766b6a44d0b3580872a29`.
`seeded_v2_full_linear_cegar_validation.json` replays the three source
occurrences and the fail-closed distinct-center gate.

The separate p5-v2 run writes `seeded_v2_full_linear_cegar_p5.json` and uses
`/tmp/p97_u4_seeded_v2_full_linear_p5.{cnf,log}`.  It does not interrupt or
overwrite the old-bank p5 artifacts.  After preserving two refinements, the
old-bank p5 process was explicitly stopped because both refinements compressed
to the six-role triangle already seeded by v2.  Its checkpoint is marked
`INTERRUPTED_SUPERSEDED_BY_SEEDED_V2`, not `RUNNING` and not terminal coverage.

p5-v2 found one further six-role triangle orientation, added its literal core,
and then terminated `BOOLEAN_UNSAT_PENDING_PROOF_REPLAY` after 1,069.88
seconds.  Its final CNF SHA-256 is
`d30a55bd77c1c6cd65366f9e01717f1029400662958ea273162f539d4a2a8119`.

`audit_p5_v2_triangle_orientation.py` proves by exact role transport and
integer coefficient replay that the new pattern is not a new consumer.  It is
`false_of_two_k2_three_row_triangle` after boundary reflection and a cyclic
re-cut by three roles, with role map `[2,1,0,5,4,3]`.  The v2 seed expansion
had omitted that re-cut orientation.

`build_seeded_v3_bank.py` adds the complete order-preserving/reflected
embedding family for this transported orientation.  The resulting four-record
bank `kalmanson_row_instance_schemas_seeded_v3.json` has SHA-256
`46b3d5f52029f1bab83f455717e7532b0669e2763f8ad882eabeff1749e69473`.
It covers 3,102 oriented embeddings with 3,012 unique clauses; the cut-set
SHA-256 is
`983e6e8d8553089efd1797eef3ee8c5389308ea23b2ad3128fb32200f244869d`.
`seeded_v3_full_linear_cegar_validation.json` replays all four preserved
occurrences and the distinct-center rejection gate.

The isolated p5-v3 run writes `seeded_v3_full_linear_cegar_p5.json` and uses
`/tmp/p97_u4_seeded_v3_full_linear_p5.{cnf,log}`.  It tests whether the four
generic oriented families exhaust p5 without another refinement.  The run
terminated `BOOLEAN_UNSAT_PENDING_PROOF_REPLAY` after 488.04 seconds with zero
refinements.  Its terminal CNF SHA-256 is
`cbfd6ad9559dce5c9da5874a15da0ba7b5c876dfbaa056fc6eb009fc107119a1`.

Thus the corrected fixed-`n = 11` p4 and p5 projections are both Boolean UNSAT
after the generic oriented seed families.  The p5-v3 terminal now has an
independently checked DRAT certificate, recorded in
`../unique4-p5-v3-full-linear-certificate/`.  `drat-trim` returned literal
`s VERIFIED` for the exact CNF with SHA-256
`cbfd6ad9559dce5c9da5874a15da0ba7b5c876dfbaa056fc6eb009fc107119a1`.
The untracked 184,212,068-byte proof has SHA-256
`21d83f574691d268aabe24badc7d4cb2a836a4a0b80a851845334096293d0841`.

This does **not** close a Lean source obligation.  The p4 terminal is also
independently DRAT-verified in
`../unique4-p4-full-linear-certificate/`, so both hashed fixed-`n = 11`
projections are exact at the external certificate boundary.  Any source-level
use still needs a coverage lift from the actual arbitrary-cardinality parent
data.  Any newly mined full-linear schema still needs exact certificate replay
and a Lean consumer before it can become a trusted cut.

Replay the static validation with:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/unique4-star-producer/verify_seeded_full_linear_cegar.py \
  --output scratch/atail-force/unique4-star-producer/seeded_full_linear_cegar_validation.json \
  --check
```
