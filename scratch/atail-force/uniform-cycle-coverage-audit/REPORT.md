# Uniform cycle-coverage audit

Date: 2026-07-17

## Result

The proposed uniform terminal classification

1. a single Kalmanson equality collision;
2. a Kalmanson/Farkas simple equality cycle of length `3 <= k <= 7`; or
3. a coupled interlocking shared-pair pattern

is **false on the currently encoded whole-carrier structural surface already
at `n = 11`**.

This is stronger than failure to mine enough examples.  The final carrier:

* is a substitution-checked SAT model of the direct Boolean outer encoding;
* independently replays every structural clause and transported schema cut;
* has no global K1/K2 equality collision;
* has no cyclic interlocking shared-pair terminal;
* contains 65,944 literal simple equality cycles of lengths three through
  seven, representing 64,753 distinct normalized order types, and none is
  Kalmanson-UNSAT; and
* admits an independently substitution-checked exact rational model of the
  **entire** positivity + triangle + strict Kalmanson + selected-row equality
  system.

Therefore increasing the cycle bound or allowing an arbitrary linear Farkas
combination cannot close this survivor.  Pure Kalmanson/Farkas mining is
blocked on this abstraction.

This is **not** a geometric counterexample to Problem 97 or to the live Lean
surface.  The exact rational distance table is not Euclidean, and the solver
does not yet encode all fields inherited from the actual `R^2`, MEC/cap, and
common-critical-map objects.

## Active-role normalization correction

The earlier transported bank retained the complete 11- or 12-point carrier
of a discovered LRA core even when the contradiction mentioned only five or
six ordered center/terminal roles.  This made the bank sensitive to irrelevant
gaps and forced rediscovery of one mathematical order type at many spacings.

`make_compressed_bank.py` now restricts each schema to the induced linear order
on the roles appearing in its required row memberships, then reflection-
canonicalizes that compact schema.  This is sound for these terminals:
strict Kalmanson inequalities restrict to every ordered subset, and all row
equalities used by the terminal mention retained roles.

Consequences:

| quantity | before correction | after correction |
|---|---:|---:|
| input bank records | 262 | 262 |
| distinct transported order types | 262 | 215 |
| fixed-`n=11` interlocking cuts | 1,385 | 3 six-role cyclic order types |
| final corrected bank size | 1,647 | 217 |

The three interlocking records are the three reflection classes of the cyclic
rotations of the six-role pattern.  They transport into every larger ordered
carrier.

## Exact `n = 11` evidence

The corrected outer solve used:

* bank: `compressed_bank_262_minimal_cyclic.json`;
* 242 Boolean variables;
* 190,921 clauses;
* 173,756 transported schema embeddings; and
* CaDiCaL wall time 74.109 seconds.

It returned SAT in `n11_a1_minimal0.result.json`.  Independent semantic replay
in `n11_a1_minimal0.verify.json` reports:

```text
status = VERIFIED_SAT
checked_schema_count = 217
checked_schema_embedding_count = 173756
strongly_connected = true
```

`scan_candidate.py` then exhaustively enumerated the following simple cycles:

| cycle length | literal cycles | distinct normalized order types |
|---:|---:|---:|
| 3 | 139 | 46 |
| 4 | 730 | 543 |
| 5 | 3,629 | 3,341 |
| 6 | 14,682 | 14,347 |
| 7 | 46,764 | 46,476 |
| **total** | **65,944** | **64,753** |

The exact bounded scan in `n11_a1_minimal0.scan.json` reports
`NO_TERMINAL_FOUND` with no budget exhaustion.

The stronger check `n11_a1_minimal0.full_lra.json` reports:

```text
status = SAT_VERIFIED_FULL_KALMANSON_METRIC
epistemic_status = EXACT_RATIONAL_MODEL_SUBSTITUTION_VERIFIED
distance_count = 55
```

The independent payload verifier checks the complete rational table without
calling Z3: positivity, all triangle inequalities, both strict Kalmanson
inequalities on every increasing quadruple, every row equality, and all
structural row/blocker conditions.

## Encoded surface versus omitted live data

The comparison target is
`generic-biapex-kalmanson-search/WholeCarrierBiApexKalmansonSurface.lean`.

| live field or derived fact | current solver status | exact encoding or omission |
|---|---|---|
| complete carrier labels and fixed cyclic order | encoded combinatorially | vertices are `0,...,n-1`, with distinct labels and a fixed linear cut in the cyclic order |
| actual `boundary : Fin n -> R^2` | **omitted** | there are no coordinates or Euclidean distance-matrix constraints |
| `boundary_ccw` / convex position | partial consequences only | cyclic shared-pair alternation and both strict Kalmanson inequalities are encoded; full orientation/realizability is not |
| one selected class at every center | encoded | exactly four distinct nonself members at every vertex |
| selected-row metric realization | encoded abstractly | the four row distances are equal and positive in a finite abstract metric |
| selected-witness strong connectivity | encoded | all nonempty proper outgoing cuts are asserted and independently replayed |
| distinct-row intersection at most two | encoded | direct Boolean clauses and independent replay |
| pair hit by at most two centers | encoded | direct Boolean clauses and independent replay |
| physical apices distinct | encoded by labels | the apices are fixed as distinct vertices `0` and `1` |
| total blocker map | encoded | exactly one blocker center per source |
| blocker omits both physical apices | encoded | blocker values cannot be `0` or `1` |
| blocker differs from its source | encoded | self blockers are forbidden |
| source belongs to its blocker row | encoded | direct blocker-to-membership implication |
| `exactAt_blocker` full radius filter | not imposed as a solver constraint | nevertheless the final rational model satisfies it at all 11 sources and all 8 distinct blocker centers; see `n11_a1_minimal0.exact_filters.json` |
| full common `CriticalShellSystem` provenance | **omitted** beyond blocker incidence | no shared `centerAt`, source-indexed radius, critical K4-after-deletion failure, or complete shell filter is represented |
| first/second-apex robust deletion data | **omitted** beyond blocker omissions | no actual deletion K4 predicates or common-deletion coupling is encoded |
| surplus cap, MEC, and cap/interior placement | **omitted** | no cap membership, boundary-chain location, enclosing disk, or MEC order constraints are present |
| Euclidean `R^2` Gram/rank conditions | **omitted** | triangle + Kalmanson is strictly weaker than planar Euclidean realization |
| imported terminal bank | encoded additionally | 217 sound transported K1/K2, cycle, and interlocking order types are forbidden |

The exact-radius omission is not the immediate explanation for this survivor:
`check_blocker_exact_filters.py` proves by rational substitution that every
represented blocker row already equals its complete equal-radius filter.

## Why Euclidean `R^2` is the smallest discriminating extension

`check_euclidean_gram.py` reconstructs, over exact rationals, the Gram matrix
forced by the exported distance table with vertex zero as origin.  The result
in `n11_a1_minimal0.euclidean_gram.json` is:

```text
gram_rank = 10
rank_at_most_two = false
euclidean_any_dimension = false
```

More decisively, the principal Gram minor on vertices `{1,2,3}` is

```text
[[121,   352,   861/2],
 [352,  1024,     882],
 [861/2, 882,    1764]]
```

with exact determinant `-16597476`.  Hence the table is not positive
semidefinite and is not a Euclidean distance matrix in any dimension.

Among the candidate extensions, the smallest one that actually separates the
current survivor is therefore **planar Euclidean realization**.  Adding only
the full exact-radius filters does not remove this witness.  MEC/cap data and
the complete critical-map coupling are larger extensions and should be held
until planar realizability is tested.

A direct discovery encoding should use coordinate variables `(x_i,y_i)`:

1. fix an affine/similarity gauge, for example vertex zero at `(0,0)` and
   vertex one at `(1,0)`;
2. impose positive orientation for every increasing triple, which enforces
   the supplied strict CCW convex order;
3. impose the three squared-distance equalities for each selected four-row;
4. retain the Boolean row/blocker constraints in the outer model; and
5. initially omit Kalmanson and triangle constraints, since genuine strict
   convex `R^2` coordinates imply the required crossing inequalities.

This is a quadratic real-feasibility problem.  For discovery, Z3 NLSAT,
HomotopyContinuation, or an SOS backend can be tried on one fixed row system.
If the fixed survivor is infeasible, the next task is to extract a small
row-equality/orientation core and transport its induced active-role order type.
If it is feasible, only then add MEC/cap placement or the missing global
critical-map/deletion coupling.

## Artifact map

| artifact | role |
|---|---|
| `make_compressed_bank.py` | compact all bank records to induced active-role order |
| `augment_cyclic_interlocking.py` | add the three six-role cyclic interlocking order types |
| `compressed_bank_262_minimal_cyclic.json` | corrected 217-type transported bank |
| `scan_candidate.py` | collision/interlocking scan plus exhaustive normalized equality-cycle LRA scan |
| `append_terminal.py` | append a scanned terminal while preserving compact transport normalization |
| `n11_a1_minimal0.result.json` | substitution-checked direct-CNF SAT carrier |
| `n11_a1_minimal0.verify.json` | independent structural and bank replay |
| `n11_a1_minimal0.scan.json` | exhaustive length-three-through-seven terminal scan |
| `n11_a1_minimal0.full_lra.json` | exact rational full-metric SAT witness and independent replay status |
| `check_blocker_exact_filters.py` / `n11_a1_minimal0.exact_filters.json` | exact full-radius-filter replay |
| `check_euclidean_gram.py` / `n11_a1_minimal0.euclidean_gram.json` | exact non-Euclidean Gram obstruction |

The earlier `compressed_bank_262_n11_cyclic.json` and `n11_a1_cycle*` artifacts
are superseded diagnostics from before active-role normalization.  They remain
useful only as evidence of the discovered normalization bug.

## Validation

All Python files in this audit directory pass `python -m py_compile`.  No Lean
or Lake command was run because the concurrent `ShellCurvature.lean` lane owns
that build surface.

Relevant SHA-256 values at this checkpoint:

```text
f2cab66ab7dc1bbbc3bce60fbf036a3ca4f5475a6ea3ff3973c72bf0d910a584  compressed_bank_262_minimal_cyclic.json
10bafa995ea62799b44382263b5f01047b8ebf289c86191a7c92a4a6151bdfa0  n11_a1_minimal0.result.json
7bda14903d00e388947cd083ee39befbcfa6cbd21311220fb630c4d8d570694b  n11_a1_minimal0.verify.json
90997bcab8667f4e100c7b9fec4524a4b79347973ee474642d32294107391229  n11_a1_minimal0.scan.json
2d3e1a1e5452addfeedca93fdc5073f5c0fd0147b5c1587ac4855630df58e1ee  n11_a1_minimal0.full_lra.json
```
