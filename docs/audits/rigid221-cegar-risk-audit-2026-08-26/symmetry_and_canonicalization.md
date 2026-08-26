# Symmetry and canonicalization

## Allowed group

The canonicalization group used by this bundle is the identity on every stored
label. This is conservative and deliberate.

The Lean exact-17 normal form distinguishes source labels, old row centers,
physical-class labels, the two named outside labels, the two named cap orders,
and orientation. The exact-12 and n=16 artifacts likewise attach semantic names
to source, blocker, apex, and deletion labels. None of the retained model
objects authenticates a nontrivial permutation that preserves all of those
roles, source indices, cap memberships, row provenance, and deletion data.

In particular:

- named source, actual-blocker, apex, and deletion roles are never exchanged;
- rotations or reflections are not applied merely because a certificate bank
  contains rotated or dihedral theorem images;
- unnamed carrier labels are not permuted unless the artifact itself supplies
  and validates that action (none used here does);
- `census/p97_search/canonical.py` is not reused because its unrestricted
  relabeling does not preserve this audit's semantic roles.

Thus the allowed group is `G = {identity}`. This may under-quotient the corpus,
but it cannot merge semantically distinct residuals.

## Canonical record construction

`scripts/build_bundle.py` parses three kinds of retained object:

1. exact-17 files with schema
   `p97-rigid221-exact17-source-faithful-model-analysis-v1`;
2. the two decoded exact-17 Boolean row assignments from the cocircular-order
   run;
3. the exact-12 complete row/blocker-map shadow and the n=16 off-class
   incidence shadow.

An exact-17 analysis record is keyed by the exact tuple

```text
(order_index, anonymous_positions, order, fifth_center,
 sorted(center, sorted support, exact-tag) rows)
```

Identical keys are collapsed and every source path and SHA-256 is retained.
No other orbit quotient is performed. The two decoded Boolean models are kept
as separate assignments. Exact-12 and n=16 each have one retained full
row-table object and therefore one record.

At this source boundary the resulting census is:

| Population | Parsed artifacts | Identity-canonical records |
|---|---:|---:|
| EX17 row/order analyses | 286 | 251 |
| EX17 decoded Boolean row assignments | 2 | 2 |
| EX12 incidence/blocker-map object | 1 | 1 |
| n=16 off-class incidence probe | 1 | 1 |
| **Total** | **290** | **255** |

These are counts of retained objects, not counts of all solver assignments.
The order-0 audit reports 8,280 Boolean models but does not retain enough raw
assignment/provenance material to reconstruct a canonical census for that
whole population.

## What “full assignment” means here

Each line of `canonical_models.jsonl` retains every assignment field available
in its source artifact. It also enumerates fields missing from a full Lean
packet. The phrase does not upgrade a row/order shadow into a Euclidean or
source-realizable model.

- The decoded EX17 records contain all 17 row supports and the selected order,
  but their own claims set `source_realizable=false`.
- EX17 analysis records omit the raw Boolean vector, complete source-to-actual-
  blocker map, dependent deletion provenance, radii, and coordinates.
- EX12 contains all rows and the blocker map, but only the digest of the raw
  SAT assignment and no cyclic/metric data.
- n=16 is an incidence-only diagnostic probe.

Every canonical record therefore has
`full_source_faithful_model=false`.

## Validation rules

The builder and validator enforce or audit the following:

1. JSON schemas are selected explicitly; quarantine paths are excluded.
2. Carrier labels and every row support are integral and deterministic.
3. Supports and rows are sorted before hashing.
4. Canonical IDs are SHA-256 prefixes of the full normalized assignment.
5. Duplicate source objects remain visible through
   `raw_artifact_multiplicity` and provenance arrays.
6. The EX17 raw multiplicities sum to 286 and its normalized keys are unique.
7. Every retained evidence path has a byte count and SHA-256 in
   `evidence_manifest.csv`.
8. Re-running the builder is byte-deterministic; the validator recomputes all
   bundle checksums.

The identity group makes the role-preservation test immediate. A future larger
quotient must provide an executable action and demonstrate that it preserves
all named roles, source indices, actual-blocker identity, cap/order data, and
deletion provenance before replacing this baseline.
