# Exact-five/card-13 distinct-radius source-core cover

Date: 2026-07-22

Status: **EMPIRICALLY VERIFIED COMPLETE SOURCE-CUBE COVER FOR BOTH ORBITS;
512/512 DIRECT AND 512/512 MIRROR LEAVES HAVE INDEPENDENTLY RECHECKED SOURCE
CORES.  LEAN GENERATION REMAINS REQUIRED.**

This lane works on the exact-five/card-13 distinct-radius finite source
surface in
`scratch/atail-force/exact5-card13-distinct-radius-aggregate/surface.py`.
It does not claim a Euclidean theorem or close a production `sorry` by itself.
Its output is a source-faithful certificate input for the Lean generator.

## Result

The source stream has 58,433 assertions in each of the two source orbits:

| orbit | source-stream SHA-256 |
| --- | --- |
| `asymmetricSourceLeft` | `cf71dc4d0cf46e050fbbce43dce4a02c583989d5a4cf7533442e6c26afa8aec3` |
| `asymmetricSourceRight` | `12c1f105e80a0094169b518b25e636ddbb263f657bb890929ed454ab28d38389` |

The cover cubes only the following nine named pre-bitblast source Booleans:

```text
shell_5
g1_2_5, g1_2_6, g1_2_7, g1_2_8
g1_2_9, g1_2_10, g1_2_11, g1_2_12
```

All `2^9 = 512` assignments were checked in each orbit.  There was no SAT
leaf.  Every leaf now has a source packet whose original assertion indices
and exact cube literals independently recheck UNSAT.

| orbit | first-pass checked cores | level-two checked cores | external checked cores | final checked cover |
| --- | ---: | ---: | ---: | ---: |
| direct / `asymmetricSourceLeft` | 471 | 37 | 4 | 512/512 |
| mirror / `asymmetricSourceRight` | 471 | 35 | 6 | 512/512 |

The final direct selected source-core sizes range from 7 to 5,094 assertions;
49 leaves exceed 12 source assertions.  The mirror range is 7 to 5,277, also
with 49 leaves exceeding 12.  Those larger cores are valid inputs now;
minimization is an optimization and is not an acceptance condition.

## Recovery ladder

The 30-second first pass classified 478 direct and 477 mirror leaves UNSAT.
It independently rechecked 471 source cores in each orbit.  The remaining 41
leaves per orbit were rebuilt with fresh solvers, varied seeds, and
300-second classification/core/recheck budgets.

Level two classified every direct leaf UNSAT and left four tracked-core
extraction timeouts at leaves `129`, `130`, `132`, and `136`.  It left six
mirror source-core gaps at leaves `33`, `65`, `129`, `130`, `132`, and `136`;
mirror leaf `129` was still classification-UNKNOWN under that budget.  These
statuses were treated as unresolved, never as UNSAT evidence.

The ten gaps then used the selector-preserving external path:

1. guard every one of the 58,433 source assertions and all nine cube literals
   before bit-blasting;
2. preserve those guards through the CNF conversion;
3. solve the activated CNF with CaDiCaL;
4. check and trim the DRAT trace with `drat-trim`;
5. map the retained activation units back to original source assertion
   indices and exact cube literals; and
6. independently replay that recovered source packet in Z3.

Nine gaps passed with the initial five-minute trim budget.  Direct leaf `136`
produced an external UNSAT trace but timed out in that trim and was not
counted.  A separate immutable retry with a 15-minute trim budget produced a
3,356-source-assertion plus 9-cube-literal packet; `drat-trim` verified it and
the direct source replay returned UNSAT.

## Final manifests

The generator-ready uncompressed artifacts are:

| artifact | SHA-256 |
| --- | --- |
| `/tmp/exact5-card13-distinct-source-core-cover/best-core-manifests-complete/asymmetricSourceLeft.best-checked-cores.json` | `48d2343bb1b94cf92bf823b10f57a0488b15843244b5b7ac653592301481ef1b` |
| `/tmp/exact5-card13-distinct-source-core-cover/best-core-manifests-complete/asymmetricSourceRight.best-checked-cores.json` | `606dab7c425c2e06587e2cf4230ab7475ea7ac911ecd4483abd54f635b8a6604` |
| `/tmp/exact5-card13-distinct-source-core-cover/best-checked-cores.complete.json` | `421a27451ab473c20f1bad98c58959b49ad29864588fd03c2ffb43e9f3f83f39` |

The combined manifest is also banked in this directory as
`best-checked-cores.complete.json.gz`.  It is deterministic (`gzip` mtime
zero), is 898,882 bytes, and has SHA-256
`c620897150393c053e6c06e99ffd1a772b123748b14fd7a4ced3db0fcb88901e`.

For every leaf the manifest records:

- the exact nine-bit source cube;
- the deterministic source-stream fingerprint;
- zero-based original source assertion indices;
- the exact selected cube literal s-expressions;
- source, cube, and total core sizes; and
- the selected stage artifact path and SHA-256.

Selection minimizes `(total core size, source core size, cube core size,
stage)` among all independently checked candidates available for that leaf.

## Scripts

- `source_core_pilot.py`: exhaustive source-cube classification and first-pass
  source-core extraction.
- `refine_unknowns.py`: strict-resume level-two refinement of only unresolved
  first-pass leaves.
- `external_selector_core_pilot.py`: one-leaf selector-preserving
  CNF/DRAT/source-replay bridge.
- `external_selector_batch.py`: immutable batch and retry orchestration for
  persistent level-two gaps.
- `reduce_external_core.py`: checked reduction of one mapped external core.
- `refine_oversized_cores.py`: optional parallel replacement search for
  checked cores larger than a threshold.
- `select_best_cores.py`: strict provenance validation, best-core selection,
  per-orbit splitting, and deterministic compressed banking.

All seven scripts pass Python bytecode compilation under the repository's
frozen `uv` environment.

## Stopped minimization checkpoint

The optional 20-worker replacement pass was stopped after 35 of the 48
selected direct-orbit attempts and before the mirror phase.  It preserved 29
independently checked replacement cores and recorded six extraction timeouts.
Selecting only genuine improvements among those partial results reduced the
direct unique source-assertion union from 17,537 to 17,179 assertions
(`-358`, about 2.04%) and the summed selected source-core sizes from 146,165
to 142,590 (`-3,575`).  The mirror union remained unchanged at 18,043 because
its optimization phase had not started.

This optimization is explicitly non-load-bearing.  Its partial best-core
manifest remains at
`/tmp/exact5-card13-distinct-source-core-cover/best-checked-cores.minimized-partial.json`;
the complete unminimized manifests above remain the generation inputs and
retain 512/512 checked coverage in both orientations.

## Epistemic boundary

**PROVEN BY CHECKED COMPUTATION WITHIN THE FINITE SOURCE ENCODING:** every one
of the 512 named-source-cube leaves in both source orbits has a recovered
packet that independently checks UNSAT.

**NOT YET PROVEN IN LEAN BY THIS LANE:** the production exact-five/card-13
parent contradiction.  Closure still requires the source-to-Lean generator,
kernel checking of the generated finite proof, and wiring through the
source-faithful direct/mirror dispatcher to the on-spine consumer.
