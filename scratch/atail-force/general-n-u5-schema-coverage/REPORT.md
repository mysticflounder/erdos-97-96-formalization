# General-n U5 schema coverage audit

Date: 2026-07-22

## Scope

This lane asks whether the source-proved general-n U5 class incompatibilities
remove the corrected `n = 11` whole-carrier structural/Kalmanson survivor.
The current outer is the bi-apex robust/common-deletion projection.  It is not
the unique-radius anchor, a live-parent Lean theorem, or an arbitrary-cardinality
coverage theorem.

No production Lean file was changed.  No new local contradiction theorem was
mined.

## Source-valid schema translation — PROVEN / VERIFIED

The registry contains exactly 96 declarations satisfying all of:

- family `U5GlobalIncidence`;
- category `ambient-data-uniform`;
- `source-proved`;
- source-reachable; and
- conclusion `False`.

Their theorem-facing antecedents normalize to 93 signed directed row-incidence
schemas under injective relabeling.  The role counts are:

| Active roles | Schemas |
| ---: | ---: |
| 5 | 12 |
| 6 | 45 |
| 7 | 30 |
| 8 | 6 |

`build_schema_catalog.py` accepts only the following source vocabulary and
fails on every unrecognized hypothesis:

- `U5DangerousTriple`;
- `U5QCriticalTripleClass`;
- `U5QDeletedK4Class`;
- `U5SelectedCandidateSkeleton`;
- named support membership/nonmembership;
- carrier/skeleton membership; and
- named disequality.

The important soundness point is that the negative atoms do **not** infer
anything about a complete ambient radius filter.  They construct theorem
packets from the selected support itself:

- if `q ∉ K.support`, the exact-four selected row `K` is a
  `U5QDeletedK4Class` with `B := K.support`;
- if `q ∈ K.support`, erasing `q` constructs a
  `U5QCriticalTripleClass` with `B := K.support.erase q`;
- a selected base row through `q` constructs the `U5DangerousTriple`; and
- injective carrier labels construct the selected-candidate packet.

These four adapters are kernel-checked in `SelectedRowU5Adapters.lean`.
Their `#print axioms` output is limited to `propext`, `Classical.choice`, and
`Quot.sound`.

`verify_schema_coverage.py` independently checked all 96 registry records
against the exact sibling source declaration at its recorded line, checked the
source-proved/reachable fields, reconstructed every signed antecedent from the
statement, and independently recanonicalized it.  Result:

```text
checked_registry_consumers: 96
checked_source_declarations: 96
normalized_schema_count: 93
status: VERIFIED
```

The requested qcritical auxiliary base-collision consumer is present as schema
35:

```text
Problem97.U5QCriticalTripleClass.qcritical_aux_base_collision_incompatibility
```

## Replay of the previously banked `n = 11` survivor — EXACT WITHIN MODEL

The corrected prior table
`uniform-cycle-coverage-audit/n11_a1_minimal0.result.json` contains five of the
93 schemas:

1. schema 35 — `qcritical_aux_base_collision_incompatibility`;
2. schema 38 — `qcritical_exact_selected_qcritical_right_right_mid_incompatibility`;
3. schema 42 — `qcritical_exact_selected_equilateral_selected_tangent_incompatibility`;
4. schema 72 — `qcritical_exact_selected_equilateral_tangent_incompatibility`;
5. schema 81 — `qcritical_exact_aux_tangent_incompatibility`.

The independent verifier reproduced exactly the same five-schema set with a
separate Z3 injective-embedding check and directly replayed every recorded
signed atom.  Thus that table is eliminated by source-valid bank cuts; it is
not a remaining structural survivor.

## Corrected outer with the first bank cut — UNKNOWN UNDER BUDGET

The exact qcritical auxiliary base-collision orbit (schema 35) was added to the
corrected `n = 11`, second-apex-1 outer:

```text
variables: 242
clauses: 523,561
schema-35 embedding cuts: 332,640
base Kalmanson schema cuts: 173,756
```

CaDiCaL 3.0.0 reached its 600-second real-time limit after 14,284,294
conflicts.  It returned code 0 / `UNKNOWN`; it produced neither a SAT model nor
an UNSAT proof.  Therefore:

- there is no n=11 bank-coverage theorem from this run;
- there is no new exact survivor whose omitted nonlinear/full-radius/global
  field can be audited; and
- `UNKNOWN` must not be reported as evidence for SAT or UNSAT.

Discovery was rerun without DRAT output.  The generated 27 MB DIMACS and the
earlier interrupted 472,526,848-byte partial DRAT were deleted.  Only the small
metadata, solver log, source catalog, source-validity adapters, and verification
artifacts are retained.

Per the lane boundary, this is the final bounded literal round.  The reusable
result is the verified source-valid schema catalog and the elimination of the
previous table, not a claim that the unique-radius anchor or the live bi-apex
parent has closed.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/private/tmp/codex-uv-cache uv run python \
  scratch/atail-force/general-n-u5-schema-coverage/build_schema_catalog.py \
  certificates/p97_rvol_general_n_mining.json \
  --output scratch/atail-force/general-n-u5-schema-coverage/schema_catalog.json

cd lean
lake env lean \
  ../scratch/atail-force/general-n-u5-schema-coverage/SelectedRowU5Adapters.lean
```

The independent source/catalog and old-survivor replay is recorded in
`n11_current_match.verify.json`.  The bounded new run and its verification are
recorded under `n11_cegar/`.
