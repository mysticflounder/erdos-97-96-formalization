# Source-indexed core data pattern mining

This report mines the current fixed equality-row hypergraphs for theorem
discovery. It is not a Euclidean realizability theorem, a coverage proof,
or evidence that any empirical core is forced by `CriticalPairFrontier`.

## Inventory

- Current core candidates: 57
- Numbered certificate targets: 54
- Saved alternate variants: 3
- Scanner-admitted exact cores: 49
- Queued/unadmitted cores: 8
- Replayed exact certificates with statistics: 49
- Injective-relabel embeddings between distinct cores: 0
- Nontrivial exact relabeling classes: 0

## Exact relabeling classes

- None: every current core is distinct under exact point relabeling.

## Direct subcore-cover relations

- None among distinct exact-isomorphism classes.

## Repeated coarse profiles

- 24 cores: rows=6, equalities=19, supports=[5, 4, 4, 4, 4, 4] — source-indexed-unit-core-654-10, source-indexed-unit-core-654-11, source-indexed-unit-core-654-17, source-indexed-unit-core-654-18, source-indexed-unit-core-654-19, source-indexed-unit-core-654-22, source-indexed-unit-core-654-23, source-indexed-unit-core-654-24, source-indexed-unit-core-654-25, source-indexed-unit-core-654-27, source-indexed-unit-core-654-29, source-indexed-unit-core-654-30, source-indexed-unit-core-654-34, source-indexed-unit-core-654-40, source-indexed-unit-core-654-41, source-indexed-unit-core-654-42, source-indexed-unit-core-654-43, source-indexed-unit-core-654-44, source-indexed-unit-core-654-47, source-indexed-unit-core-654-47-alt, source-indexed-unit-core-654-48, source-indexed-unit-core-654-49, source-indexed-unit-core-654-49-alt, source-indexed-unit-core-654-57
- 14 cores: rows=6, equalities=18, supports=[4, 4, 4, 4, 4, 4] — source-indexed-unit-core-654-09, source-indexed-unit-core-654-14, source-indexed-unit-core-654-15, source-indexed-unit-core-654-16, source-indexed-unit-core-654-20, source-indexed-unit-core-654-21, source-indexed-unit-core-654-26, source-indexed-unit-core-654-33, source-indexed-unit-core-654-35, source-indexed-unit-core-654-38, source-indexed-unit-core-654-39, source-indexed-unit-core-654-46, source-indexed-unit-core-654-56, source-indexed-unit-core-654-60
- 7 cores: rows=5, equalities=16, supports=[5, 4, 4, 4, 4] — source-indexed-unit-core-654-07, source-indexed-unit-core-654-08, source-indexed-unit-core-654-31, source-indexed-unit-core-654-45, source-indexed-unit-core-654-53, source-indexed-unit-core-654-54, source-indexed-unit-core-654-58
- 6 cores: rows=7, equalities=21, supports=[4, 4, 4, 4, 4, 4, 4] — source-indexed-unit-core-654-36, source-indexed-unit-core-654-37, source-indexed-unit-core-654-51, source-indexed-unit-core-654-52, source-indexed-unit-core-654-55, source-indexed-unit-core-654-59
- 4 cores: rows=7, equalities=22, supports=[5, 4, 4, 4, 4, 4, 4] — source-indexed-unit-core-654-28, source-indexed-unit-core-654-32, source-indexed-unit-core-654-50, source-indexed-unit-core-654-50-alt
- 2 cores: rows=5, equalities=15, supports=[4, 4, 4, 4, 4] — source-indexed-unit-core-654-12, source-indexed-unit-core-654-13

## Repeated incidence-motif profiles

- 2 cores: arcs=10, mutual=1, 3-cycles=4, intersection histogram={'1': 7, '2': 3} — source-indexed-unit-core-654-45, source-indexed-unit-core-654-53

## Most frequent two-row motifs

The motif key is `larger support size / smaller support size /
larger-center-to-smaller-center incidence / reverse incidence /
support intersection size`.

| Motif | Occurrences | Cores |
|---|---:|---:|
| `4/4/0/1/1` | 297 | 57 |
| `4/4/0/0/1` | 110 | 46 |
| `4/4/0/1/2` | 87 | 50 |
| `4/4/0/0/2` | 82 | 44 |
| `4/4/1/1/1` | 58 | 40 |
| `5/4/0/1/1` | 55 | 32 |
| `5/4/1/0/2` | 41 | 24 |
| `4/4/0/1/0` | 34 | 29 |
| `5/4/1/0/1` | 26 | 21 |
| `4/4/1/1/0` | 24 | 22 |
| `5/4/0/0/1` | 19 | 15 |
| `5/4/1/1/1` | 19 | 19 |
| `5/4/0/0/2` | 8 | 8 |
| `4/4/0/0/0` | 6 | 6 |
| `5/4/1/1/2` | 3 | 3 |
| `5/4/1/0/0` | 1 | 1 |

## Universal and near-universal skeleton

- 57/57 cores contain both a mutual
  center-incidence pair and a directed center 3-cycle somewhere.
- 55/57 cores contain a single three-row
  subsystem having both features.
- 57/57 cores have pairwise support
  intersections of size at most two.
- 57/57 cores use every support-point
  pair in at most two rows.

These are data invariants of the saved cores, not standalone
infeasibility statements.

## Three-row center-digraph motifs

The six-bit key records the directed incidences among three row centers
after canonical row permutation. The table is sorted by core coverage.

| Motif | Occurrences | Cores |
|---|---:|---:|
| `001011` | 171 | 57 |
| `011011` | 111 | 55 |
| `000110` | 231 | 53 |
| `000111` | 110 | 46 |
| `011001` | 96 | 45 |
| `000001` | 140 | 44 |
| `010101` | 84 | 40 |
| `000011` | 60 | 39 |
| `001010` | 61 | 34 |
| `001111` | 34 | 30 |
| `011110` | 31 | 27 |
| `000101` | 44 | 22 |
| `000000` | 17 | 10 |
| `010111` | 10 | 8 |

## Full three-row equality motifs

These signatures retain support sizes, incidences of the three centers,
and the multiplicity of every non-center support-membership mask. They
are complete for a three-row subsystem up to row permutation and
relabeling of non-center points.

| Cores | Occurrences | Signature |
|---:|---:|---|
| 29 | 37 | `s=4,4,4;c=000001100;e=2,1,1,1,1,1,0` |
| 24 | 36 | `s=4,4,4;c=000100110;e=2,2,1,1,1,0,0` |
| 19 | 19 | `s=4,4,4;c=001100110;e=1,2,1,1,1,0,0` |
| 17 | 19 | `s=4,4,4;c=000100110;e=1,1,2,1,1,0,0` |
| 16 | 17 | `s=4,4,4;c=001001010;e=1,1,1,1,1,1,0` |
| 16 | 16 | `s=4,4,4;c=001100010;e=1,2,1,2,1,0,0` |
| 15 | 19 | `s=4,4,5;c=001100010;e=1,1,1,2,1,1,0` |
| 15 | 18 | `s=4,4,4;c=000001100;e=1,1,1,1,1,0,1` |
| 14 | 24 | `s=4,4,4;c=000000010;e=2,2,1,1,1,1,0` |
| 14 | 19 | `s=4,4,4;c=000001110;e=2,2,1,1,1,0,0` |
| 14 | 14 | `s=4,4,4;c=000101110;e=2,1,1,1,1,0,0` |
| 13 | 15 | `s=4,4,4;c=000001100;e=2,1,1,2,0,0,1` |
| 13 | 15 | `s=4,4,4;c=000001110;e=2,1,1,0,1,1,0` |
| 13 | 13 | `s=4,4,4;c=000100110;e=2,1,1,0,1,1,0` |
| 12 | 15 | `s=4,4,4;c=000001100;e=1,0,2,1,1,1,0` |
| 12 | 15 | `s=4,4,4;c=000100100;e=1,1,2,2,1,0,0` |
| 12 | 14 | `s=4,4,4;c=000000010;e=2,1,1,1,0,1,1` |
| 11 | 17 | `s=4,4,4;c=000000010;e=1,1,2,1,1,1,0` |
| 11 | 12 | `s=4,4,4;c=000001100;e=1,1,1,0,2,1,0` |
| 11 | 12 | `s=4,4,4;c=001100010;e=1,1,1,2,0,0,1` |

### Exact cover by full three-row motifs

An exact 0/1 set-cover solve needs 5
complete three-row types to hit every current full core. The selected
minimum-cardinality cover is:

- `s=4,4,4;c=000001100;e=2,1,1,1,1,1,0` — covers 29 cores
- `s=4,4,4;c=000100110;e=1,1,2,1,1,0,0` — covers 17 cores
- `s=4,4,4;c=000100110;e=2,2,1,1,1,0,0` — covers 24 cores
- `s=4,4,4;c=001100110;e=2,2,1,2,0,0,0` — covers 10 cores
- `s=4,4,5;c=001101000;e=2,1,0,3,1,1,0` — covers 11 cores

Every selected type is a proper subsystem of a row-minimal exact core,
so this five-way cover is a case-packaging opportunity, not five local
contradiction theorems.

## Exact-certificate complexity

Statistics are available for 49 independently
replayed exact identities. They measure the generated coordinate
certificate, so gauge and generator order can affect them.

- Total multiplier terms: {'minimum': 182, 'median': 24719, 'maximum': 237549}
- Maximum multiplier-degree histogram: {'4': 1, '5': 4, '6': 7, '7': 7, '8': 10, '9': 11, '10': 6, '11': 2, '12': 1}
- Nonzero-multiplier-count histogram: {'9': 4, '10': 1, '11': 2, '12': 4, '13': 8, '14': 5, '15': 10, '16': 8, '17': 3, '18': 2, '20': 2}

### Smallest exact identities by total multiplier terms

| Core | Terms | Degree | Active/equalities |
|---|---:|---:|---:|
| `source-indexed-unit-core-654-07` | 182 | 5 | 9/16 |
| `source-indexed-unit-core-654-08` | 182 | 5 | 9/16 |
| `source-indexed-unit-core-654-54` | 701 | 5 | 9/16 |
| `source-indexed-unit-core-654-31` | 854 | 7 | 10/16 |
| `source-indexed-unit-core-654-12` | 1149 | 7 | 9/15 |
| `source-indexed-unit-core-654-58` | 2410 | 6 | 12/16 |
| `source-indexed-unit-core-654-13` | 2431 | 4 | 11/15 |
| `source-indexed-unit-core-654-45` | 2493 | 6 | 11/16 |
| `source-indexed-unit-core-654-39` | 3641 | 7 | 13/18 |
| `source-indexed-unit-core-654-26` | 4210 | 6 | 16/18 |

### Largest exact identities by total multiplier terms

| Core | Terms | Degree | Active/equalities |
|---|---:|---:|---:|
| `source-indexed-unit-core-654-44` | 237549 | 9 | 17/19 |
| `source-indexed-unit-core-654-28` | 195929 | 10 | 20/22 |
| `source-indexed-unit-core-654-40` | 168149 | 10 | 15/19 |
| `source-indexed-unit-core-654-10` | 135340 | 12 | 18/19 |
| `source-indexed-unit-core-654-38` | 119992 | 10 | 16/18 |
| `source-indexed-unit-core-654-46` | 101518 | 9 | 16/18 |
| `source-indexed-unit-core-654-47-alt` | 87391 | 11 | 16/19 |
| `source-indexed-unit-core-654-35` | 82181 | 8 | 15/18 |
| `source-indexed-unit-core-654-14` | 81299 | 8 | 15/18 |
| `source-indexed-unit-core-654-25` | 77086 | 11 | 15/19 |

## Certificate-active equality kernels

Zero cofactors were removed from all replayed identities, leaving the
smallest equality systems actually used by those fixed certificates.
This is a certificate-supported strengthening of each nominal cut; it
does not claim globally minimal polynomial support.

- Active kernels analyzed: 49
- Embeddings between distinct active kernels: 2
- Active-kernel embeddings into the 55 full cores: 51
- Queued full cores covered by an existing active kernel: 0
- Minimum active kernels needed for the 49 admitted full cores: 48
- Minimum complete three-row motif types covering all active kernels: 13
- Mutual pair plus directed cycle: 49/49
- Same triple contains both: 48/49

The only nontrivial exact relabeling class is:

- `source-indexed-unit-core-654-07`, `source-indexed-unit-core-654-08`

Those two certificates share one six-label, five-row, nine-equality
kernel with support sizes `[4, 3, 3, 2, 2]`. Core 54 has the same coarse
profile but is not isomorphic. No active kernel covers any of the 8
queued cores, so their exact-certificate gates remain real.

### Repeated active-kernel row profiles

- 6 kernels: rows=6, equalities=16, supports=[4, 4, 4, 4, 3, 3] — source-indexed-unit-core-654-26, source-indexed-unit-core-654-38, source-indexed-unit-core-654-46, source-indexed-unit-core-654-47-alt, source-indexed-unit-core-654-48, source-indexed-unit-core-654-57
- 5 kernels: rows=6, equalities=15, supports=[4, 4, 4, 3, 3, 3] — source-indexed-unit-core-654-09, source-indexed-unit-core-654-14, source-indexed-unit-core-654-15, source-indexed-unit-core-654-24, source-indexed-unit-core-654-35
- 4 kernels: rows=6, equalities=13, supports=[4, 3, 3, 3, 3, 3] — source-indexed-unit-core-654-17, source-indexed-unit-core-654-18, source-indexed-unit-core-654-21, source-indexed-unit-core-654-60
- 3 kernels: rows=5, equalities=9, supports=[4, 3, 3, 2, 2] — source-indexed-unit-core-654-07, source-indexed-unit-core-654-08, source-indexed-unit-core-654-54
- 3 kernels: rows=6, equalities=17, supports=[4, 4, 4, 4, 4, 3] — source-indexed-unit-core-654-23, source-indexed-unit-core-654-27, source-indexed-unit-core-654-44
- 3 kernels: rows=6, equalities=15, supports=[5, 4, 3, 3, 3, 3] — source-indexed-unit-core-654-25, source-indexed-unit-core-654-40, source-indexed-unit-core-654-49-alt
- 2 kernels: rows=6, equalities=14, supports=[5, 4, 3, 3, 3, 2] — source-indexed-unit-core-654-11, source-indexed-unit-core-654-29
- 2 kernels: rows=6, equalities=14, supports=[4, 4, 3, 3, 3, 3] — source-indexed-unit-core-654-19, source-indexed-unit-core-654-30
- 2 kernels: rows=7, equalities=20, supports=[4, 4, 4, 4, 4, 4, 3] — source-indexed-unit-core-654-28, source-indexed-unit-core-654-36
- 2 kernels: rows=6, equalities=13, supports=[4, 4, 3, 3, 3, 2] — source-indexed-unit-core-654-33, source-indexed-unit-core-654-39
- 2 kernels: rows=6, equalities=16, supports=[5, 4, 4, 4, 3, 2] — source-indexed-unit-core-654-43, source-indexed-unit-core-654-49
- 2 kernels: rows=5, equalities=12, supports=[4, 4, 3, 3, 3] — source-indexed-unit-core-654-53, source-indexed-unit-core-654-58

### Active-kernel three-row motif cover

The exact minimum complete-three-row motif cover selects:

- `s=2,3,4;c=000100110;e=0,1,0,0,1,0,1` covers 4 active kernels
- `s=3,3,3;c=001100010;e=0,0,1,1,0,0,1` covers 3 active kernels
- `s=3,3,4;c=000001100;e=2,1,0,2,0,0,1` covers 2 active kernels
- `s=3,3,4;c=000100010;e=1,0,1,1,1,1,0` covers 9 active kernels
- `s=3,3,4;c=000100110;e=1,1,1,1,1,0,0` covers 7 active kernels
- `s=3,3,4;c=001100010;e=0,0,0,0,1,1,1` covers 2 active kernels
- `s=3,3,4;c=001100010;e=1,1,0,2,0,0,1` covers 3 active kernels
- `s=3,3,5;c=000000110;e=0,1,1,1,1,0,1` covers 2 active kernels
- `s=3,4,4;c=000000110;e=1,2,1,0,1,1,0` covers 5 active kernels
- `s=3,4,4;c=000100110;e=0,1,2,1,1,0,0` covers 5 active kernels
- `s=3,4,4;c=001000010;e=0,1,1,0,1,2,0` covers 3 active kernels
- `s=3,4,4;c=011000110;e=0,2,1,1,0,1,0` covers 6 active kernels
- `s=4,4,4;c=001100110;e=1,2,1,1,1,0,0` covers 5 active kernels

As with the full-core cover, these are proper subsystems of certified
kernels and therefore organize cases; they are not local contradictions.

## Motif-tag families

- 18 cores, tags=['mutual-center-incidence', 'directed-center-3-cycle', 'five-point-radius-row']: source-indexed-unit-core-654-11, source-indexed-unit-core-654-17, source-indexed-unit-core-654-18, source-indexed-unit-core-654-23, source-indexed-unit-core-654-27, source-indexed-unit-core-654-29, source-indexed-unit-core-654-30, source-indexed-unit-core-654-31, source-indexed-unit-core-654-34, source-indexed-unit-core-654-42, source-indexed-unit-core-654-44, source-indexed-unit-core-654-45, source-indexed-unit-core-654-48, source-indexed-unit-core-654-49-alt, source-indexed-unit-core-654-50-alt, source-indexed-unit-core-654-53, source-indexed-unit-core-654-57, source-indexed-unit-core-654-58
- 10 cores, tags=['mutual-center-incidence', 'directed-center-3-cycle', 'support-point-used-by-4+-rows']: source-indexed-unit-core-654-09, source-indexed-unit-core-654-15, source-indexed-unit-core-654-35, source-indexed-unit-core-654-37, source-indexed-unit-core-654-39, source-indexed-unit-core-654-46, source-indexed-unit-core-654-52, source-indexed-unit-core-654-55, source-indexed-unit-core-654-59, source-indexed-unit-core-654-60
- 8 cores, tags=['mutual-center-incidence', 'directed-center-3-cycle', 'support-point-used-by-4+-rows', 'five-point-radius-row', 'shared-pair-row-network-connected']: source-indexed-unit-core-654-07, source-indexed-unit-core-654-08, source-indexed-unit-core-654-19, source-indexed-unit-core-654-22, source-indexed-unit-core-654-24, source-indexed-unit-core-654-47, source-indexed-unit-core-654-49, source-indexed-unit-core-654-50
- 8 cores, tags=['mutual-center-incidence', 'directed-center-3-cycle', 'support-point-used-by-4+-rows', 'five-point-radius-row']: source-indexed-unit-core-654-10, source-indexed-unit-core-654-25, source-indexed-unit-core-654-28, source-indexed-unit-core-654-32, source-indexed-unit-core-654-40, source-indexed-unit-core-654-41, source-indexed-unit-core-654-43, source-indexed-unit-core-654-47-alt
- 8 cores, tags=['mutual-center-incidence', 'directed-center-3-cycle']: source-indexed-unit-core-654-12, source-indexed-unit-core-654-13, source-indexed-unit-core-654-14, source-indexed-unit-core-654-20, source-indexed-unit-core-654-26, source-indexed-unit-core-654-33, source-indexed-unit-core-654-38, source-indexed-unit-core-654-56
- 4 cores, tags=['mutual-center-incidence', 'directed-center-3-cycle', 'support-point-used-by-4+-rows', 'shared-pair-row-network-connected']: source-indexed-unit-core-654-16, source-indexed-unit-core-654-21, source-indexed-unit-core-654-36, source-indexed-unit-core-654-51

## Generalization reading

- No two current cores can share a wrapper merely by exact relabeling or
  direct subcore containment; the observed proliferation is genuine.
- Repeated two-row and shared-pair motifs are candidates for small geometric
  lemmas, but frequency alone does not prove a common contradiction theorem.
- The center-cycle plus reciprocal-edge skeleton is the strongest universal
  incidence pattern, but it has elementary realizations and therefore is
  only a preprocessing shape, not a contradiction target.
- The first concrete shared lift is the six-label, nine-equality active
  kernel common to cores 07 and 08. Other current active kernels remain
  distinct under the tested exact/subkernel relation.
- The fully uniform lift remains a finite-type `EqualityCore`/Gram-certificate
  checker: it abstracts all row and label counts without asserting coverage.
- Any producer theorem still has to derive one of these row hypergraphs from
  the concrete frontier; the data analysis cannot supply that implication.
