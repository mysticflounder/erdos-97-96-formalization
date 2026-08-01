# Power-matrix survivor audit

Date: 2026-07-30

## Result

The circle--point power-matrix idea is sound and worth retaining, but the
currently audited banks do **not** yield a determinant obstruction:

| bank | audited models | candidate circle rows | sound 5x5 hits | sound row-difference 4x4 hits |
|---|---:|---:|---:|---:|
| phase-3 distinct-distance survivors | 38 distinct metric skeletons | 380 | 0 | 0 |
| aligned-singleton v17 named survivor | 1 | 8 | 0 | 0 |

This is a negative audit of a bounded minor family, not a realizability result.
The search was exhaustive only for **center-diagonal** minors: select distinct
circle centers as rows and use the same centers as columns, trying every
available radius-class choice at each center.

The main immediate blocker is data, not determinant evaluation.  The phase-3
artifacts deliberately record selected four-subsets with `exact: false`; they
do not record the off-support nonmembership facts needed to populate a useful
zero/nonzero power pattern.

Machine-readable details are in
`scratch/p97-power-matrix-lane/power-matrix-survivor-audit.json`; the
reproducible auditor is
`scratch/p97-power-matrix-lane/audit_power_patterns.py`.

## Soundness rule

For circles \(C_i\) and points \(z_j\), let
\(P_{ij}=\operatorname{Pow}_{C_i}(z_j)\).  Planar circle/point data factor
through four coordinates, so `rank P <= 4` and every 5x5 minor vanishes.

The auditor uses three values only:

- `zero`: a recorded equal-distance / circle-membership fact;
- `nonzero`: the positive-radius circle's own center, an exact off-support
  nonmembership, or a recorded false equal-distance atom;
- `unknown`: everything else.

A 5x5 hit is accepted only if the bipartite graph of entries not proved zero
has exactly one perfect matching and every entry of that matching is proved
nonzero.  Therefore its determinant has exactly one surviving, nonzero
permutation term.  An `unknown` entry is never used either to kill a term or
to certify the surviving term.

For a fixed baseline circle, row differences have rank at most three because
the common squared-norm term cancels.  The analogous 4x4 test uses only the
sound entrywise consequences

```text
0 - 0                  -> zero
0 - proved-nonzero     -> nonzero
proved-nonzero - 0     -> nonzero
all other combinations -> unknown
```

In particular, two proved-nonzero powers are not assumed to have nonzero
difference.

## Bank 1: phase-3 distinct-distance survivors

Audited sources:

- `scratch/p97-distinct-distance-lane/phase3_old_source_dedup_snapshot_20260729/survivors-deduplicated-current-source.jsonl`
  (193 records; 35 new metric skeletons);
- `scratch/p97-distinct-distance-lane/phase3_structural_cegar_projected_sequential_global_v2_20260729/survivors.jsonl`
  (163 records; 3 new metric skeletons);
- `scratch/p97-distinct-distance-lane/paused_projected_current_source_survivors_162_20260729/survivors.jsonl`
  (162 records; 0 new metric skeletons).

Deduplication by `metric_rows_sha256` leaves 38 distinct skeletons.  Every one
has ten `metric_rows`, hence 380 audited selected rows total.

These rows are **not full exact circle classes**.  Every recorded row has
`exact: false`.  This agrees with the encoder's explicit
`full_distance_classes_used: False` and its stated omission of “exact
off-support classes” in
`census/p97_search/phase3_structural_cegar.py`.

Consequently a phase-3 row supplies only:

- four proved-zero power entries on its support;
- one proved-nonzero entry at its own center, since the radius is positive;
- nine-minus-support remaining entries as unknown.

No sound center-diagonal 5x5 or row-difference 4x4 obstruction was found.
Treating off-support points as nonzero here would be an unsound upgrade from a
chosen witness subset to a full class.

## Bank 2: aligned-singleton v17 survivor

Source:

`scratch/atail-force/aligned-singleton-second-nonbisector-induced/cegar-v17-local-critical-reuse-second.json`

The survivor has 18 quotient point classes and 2,666 recorded Boolean
equal-distance atoms.  Decoding true atoms into equality components gives
eight positive-radius components with at least four distinct quotient points,
at five distinct quotient centers.

Seven of the eight components have every entry classified across the recorded
18 quotient columns; one retains unknown entries.  “Fully classified” here
means only **relative to this named model's recorded quotient columns**.  It
does not assert that the support is a full circle class in the entire carrier,
nor that the false atoms are consequences of the live Lean hypotheses.

The model-specific false atoms are legitimate nonzero entries when testing
this exact survivor assignment: the companion Euclidean probe explicitly
interprets them as squared-distance disequalities under
`--include-false-rows`.  They are not silently generalized beyond the saved
assignment.

No sound center-diagonal 5x5 obstruction or row-difference 4x4 obstruction
was found.

## Why this does not yet cover all current A/C/F-Gamma work

The current computational plan says that F-Gamma has no sound complete
fixed-slot encoder.  Its 17-point incidence shadow and unbounded four-block
extension survive, as documented in
`scratch/f3-unbounded-counting-audit/REPORT.md`.  That shadow lists selected
rows, but does not export a complete circle-by-point table with justified
off-support nonmembership.  It therefore cannot be promoted to a full
three-valued power matrix without adding facts not present in the artifact.

Likewise, package smoke-gate success for A and C is not itself a survivor bank
with full circle-class provenance.  This audit intentionally did not infer
nonmembership from a displayed four-set.

## Missing export needed for the next audit

A useful common survivor export should contain:

1. a canonical point universe and alias quotient;
2. a circle identifier, its carrier center, and a positive-radius witness;
3. whether its displayed support is a full exact class or only a selected
   witness subset;
4. per circle/point `zero | nonzero | unknown`, with provenance for every
   nonzero;
5. whether the point universe is complete for the intended leaf;
6. stable survivor and source hashes.

With that schema, the next pass should search arbitrary five-circle by
five-point minors, not only the center-diagonal family, and combinatorial
minrank lower bounds.  Without it, the power-rank route remains a promising
constraint generator but has not closed a banked survivor.

## Reproduction

```bash
uv run python scratch/p97-power-matrix-lane/audit_power_patterns.py \
  --out scratch/p97-power-matrix-lane/power-matrix-survivor-audit.json
```

The matching/difference-state unit smoke check passed.  The full run reports:

```text
phase3_unique=38
phase3_5x5_hits=0
phase3_diff_hits=0
aligned_circles=8
aligned_full=7
aligned_5x5_hits=0
aligned_diff_hits=0
```
