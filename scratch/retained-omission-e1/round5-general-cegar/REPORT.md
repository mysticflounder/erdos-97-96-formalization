# Round-5 exact-15 retained-omission report

## Scope and trust boundary

This lane is anchored to the live Lean obligation

`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.

It tests only the conditional exact-`n = 15` slice of that obligation, after
the all-large cap bounds force the exact cap profile `(6,6,6)`.  It enumerates
both constructors of `RetainedOmissionAllLargeNormalForm`, all eight S6/D44
rich-apex profiles, and all retained/deleted/fresh position choices in the
fixed cyclic-order normal form.  It is not a universal `n = 15` search.

All results below are external Z3 results for a sound finite relaxation.  They
are neither kernel-checked Lean proofs nor closure of the anchored theorem.
Timeouts are recorded as `unknown`; no conclusion is drawn from them.

## Frozen schema-v1 baseline

Artifact:

`artifacts/20260801T210150.916945Z-matrix-pid92755/matrix_summary.json`

| schema | cases | UNSAT | UNKNOWN | SAT/error | elapsed |
|---|---:|---:|---:|---:|---:|
| v1 | 288 | 102 | 186 | 0 | 570.276 s |

An interrupted five-minute retry is preserved separately at
`artifacts/20260801T211147.874673Z-retry-pid41562/`.  It has no aggregate
summary and contains 31 completed per-case results (7 UNSAT, 24 UNKNOWN).  It
is not merged into either matrix census.

## Frozen schema-v2 cyclic-alternation run

Artifact:

`artifacts/20260801T212051.080177Z-matrix-pid89883/matrix_summary.json`

Authentication:

`artifacts/20260801T212051.080177Z-matrix-pid89883/source_authentication.json`

Hashes:

- `round5_cegar.py`: `78301c9a88ffeeea2d005467dfe93e8c02cb9f46b14e50b4a142009b396dced5`
- `schema.json`: `adcdf70f624e981d9a1b86606dd6e9544550986eb07574c28dfff26dce8e79fe`
- `uv.lock`: `a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c`

All 288 per-case records carry schema version 2 and the same script hash.
Their `encoding_sha256` fields authenticate the actual SMT encodings.  The
v2 results are not merged with v1 or with the earlier pairwise-cut probes,
which used a different source hash.

Overall result:

| schema | cases | UNSAT | UNKNOWN | SAT/error | elapsed |
|---|---:|---:|---:|---:|---:|
| v2 | 288 | 84 | 204 | 0 | 630.642 s |

Per arm and rich profile (`U` = UNSAT, `?` = UNKNOWN):

| profile | fresh U | fresh ? | paired U | paired ? |
|---|---:|---:|---:|---:|
| DDD | 8 | 16 | 0 | 12 |
| DDS | 6 | 18 | 0 | 12 |
| DSD | 7 | 17 | 0 | 12 |
| DSS | 10 | 14 | 0 | 12 |
| SDD | 6 | 18 | 0 | 12 |
| SDS | 4 | 20 | 0 | 12 |
| SSD | 8 | 16 | 0 | 12 |
| SSS | 23 | 1 | 12 | 0 |

Thus every paired SSS case is externally UNSAT in v2, while one fresh SSS
case and 203 other cases remain unresolved.  The smaller v2 UNSAT count than
v1 reflects solver/runtime behavior under the added redundant constraints; it
is not a logical regression and neither incomplete census subsumes the other.

## Cyclic-alternation cut and representative cores

Schema v2 adds a compact consequence of the already-banked two-center
bisector parity terminals in
`Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean`.  For two distinct
active carrier centers, two common support points cannot lie in the same open
cyclic arc between the centers.  This cut uses only positive memberships, so
it remains sound for the common-deletion packet's chosen `B1` four-subset;
it never treats off-subset points as nonmembers.  `B2` is used as a full row
only where the banked support-identification theorem justifies that equality.

Eighty-one of the 84 v2 UNSAT operational cores contain
`cyclic_alternation_cut`.  Two representative five-family cores are:

- `fresh_DDD_k0_d1_f3`:
  `critical_blocker_map`, `critical_full_row`,
  `cyclic_alternation_cut`, `normal_form`, `source_in_critical_row`.
- `paired_SSS_k0_d3`:
  `cyclic_alternation_cut`, `exact_rich_profiles`, `global_K4`,
  `no_all_apex_shell`, `strict_kalmanson`.

These family cores are operational assumption-tag cores, not modular theorem
dependency certificates.  In particular, the cyclic-alternation family
packages a consequence proved from the geometric/Kalmanson bank, so omission
of a lower-level family from a core does not prove independence from it.

## Current conclusion

No model was found in either complete case enumeration, but both enumerations
are incomplete because of timeouts.  The strongest target-specific fact is:
the paired all-S6 exact-15 slice is externally UNSAT under schema v2.  This is
empirical solver evidence only.  The anchored Lean theorem remains open.

## Separate schema-v3 squared-distance smoke

Schema v3 adds independent positive squared-distance variables, transports
same-center equality from the unsquared variables, and imposes

`s(x,z) > s(x,y) + s(y,z)`

for every angularly ordered triple on a full rich apex shell.  It does not
assert nonlinear equations `s = d^2`, so it remains a sound relaxation of an
actual Euclidean realization.  This was tested on four cases only; it is not a
new matrix census.

Hashes:

- `round5_cegar.py`: `451aae82966ddea02fa81da2d656415cf4e942e9ba7b2eefc96c915f7d62e857`
- `schema.json`: `6df622330bcc9026910acc77aae9b0a0d811798ed0f53bcdd3223dec871f7301`
- `uv.lock`: `a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c`

| case | outcome | elapsed | artifact directory |
|---|---|---:|---|
| `paired_SSS_k0_d1` | UNSAT | 11.468 s | `artifacts/20260801T213711.605694Z-case-pid68667/` |
| `fresh_SSS_k1_d3_f2` | UNSAT | 14.534 s | `artifacts/20260801T213938.412469Z-case-pid81476/` |
| `fresh_DDD_k0_d2_f1` | UNKNOWN | 122.049 s | `artifacts/20260801T213711.628221Z-case-pid68675/` |
| `paired_DDD_k0_d1` | UNKNOWN | 122.036 s | `artifacts/20260801T213711.615053Z-case-pid68668/` |

Both UNSAT cores contain `positive_squared_distances`,
`squared_distance_equality_transport`, and
`same_shell_squared_superadditivity`, together with the cyclic-alternation and
global rich-profile families.  Most notably, `fresh_SSS_k1_d3_f2` was the sole
fresh SSS case left UNKNOWN by the complete schema-v2 matrix.  Schema v3 closes
that particular case externally.  The two deliberately hard DDD probes still
time out, so the squared cut has not yet shown broad-profile closure.

The schema-v3 runner also freezes source/schema/lockfile hashes in every
invocation and compact matrix row and rejects retries across a changed target,
schema, or source hash.

These smoke results must not be combined numerically with the v1/v2 census.
They identify the squared-distance theorem as useful for the all-S6 slice, but
do not close the anchored Lean theorem or all exact-15 cases.
