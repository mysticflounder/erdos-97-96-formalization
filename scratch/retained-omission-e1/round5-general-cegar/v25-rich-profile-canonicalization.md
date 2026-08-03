# V25 rich-profile canonicalization analysis

Date: 2026-08-02.  This is a read-only, no-solver, no-Lean analysis of the
authenticated v22 55-fix blocker, the recovered v19-resume journal, and the 16
live v20 cube journals.  The machine-readable result is
`v25-rich-profile-canonicalization.json`; its snapshot completed at
`2026-08-02T18:22:12.762796+00:00`.  The producers were still live, so these
are authenticated per-journal heads, not terminal production totals.  Every
journal was unchanged across its own read and its complete v19 hash chain,
payload hashes, assignment hashes, and raw-formula identity were checked.

## Result

The snapshot contains 3,095 proposal occurrences from 17 journals, all with
distinct complete-assignment hashes.  It has 39 distinct full 90-bit rich
profiles and 39 canonical orbits.  Each theoretical orbit has size four, but
only one raw member of each orbit was observed.  The v19-resume journal alone
has 316 proposals (315 completed and one pending) and exactly two profiles:
40 proposals match the v22 55-fix vector and 276 differ in 16 positions.

There are 3,078 within-journal transitions: 3,054 self-transitions and 24
changes.  V19 contributes 315 transitions, of which 314 are self-transitions;
its only change is `736a68aa56adbfe5 -> 99b0a40e5b3e6e53`.  The complete
directed transition table, all per-cube counts, journal heads, v22 mismatch
histograms, and coverage by source are in the JSON artifact.

## Symmetry audit

The rigorously valid formula automorphism group for the fixed
`fresh_DDD_k0_d2_f1` encoding is `C2 x C2`: independently swap the two rich
classes at apex indices 1 and 2, including their radius variables.  All uses
of those class indices are symmetric.  Swapping the apex-0 classes is invalid:
`round5_cegar_v8.py:596-605` names `rich[0,0]` as `first_frontier` and requires
it to contain kept point 0 and deleted point 2.

No nonidentity point-label symmetry survives.  Exhaustive audit of the 30
dihedral actions on the encoded 15-cycle, while preserving the cap/apex
incidence structure and the distinguished kept/deleted/fresh labels 0/2/1,
leaves only the identity.  Arbitrary permutations inside a cap are invalid
because the exact encoding also fixes cyclic distance-order constraints.

The v22 55-coordinate projection is not invariant under the full class group:
it contains only ten `rich_1_0_*` coordinates but all fifteen `rich_1_1_*`
coordinates (the missing former coordinates are 0, 1, 10, 11, 12).  It is
invariant under the apex-2 swap.  Therefore v25 canonicalizes the full 90-bit
profile and uses v22 only as an explicitly asymmetric mismatch projection.

## Exact representatives and coverage

Notation in the final column is
`apex12-class0/class1 ; apex13-class0/class1 ; apex14-class0/class1`; dots join
the exact point labels in one four-point support.  `n` is proposal-occurrence
coverage (also the unique complete-assignment count for every row).

| rep | n | exact supports |
|---|---:|---|
| 047889b13d049874 | 2 | 0.2.5.11/1.3.7.8; 0.4.6.12/5.7.9.10; 1.4.9.11/6.8.10.13 |
| 06094d5a417fa0e3 | 170 | 0.2.4.7/1.3.9.10; 1.5.7.9/4.6.10.12; 0.5.8.10/4.9.11.13 |
| 1646a8434b3f1773 | 2 | 0.2.6.14/1.3.8.10; 0.4.5.8/3.6.7.10; 0.4.10.11/2.8.9.13 |
| 18db0afb475291bb | 171 | 0.2.11.14/1.3.10.13; 2.5.7.11/3.4.6.9; 1.6.8.11/2.5.9.10 |
| 195abea2f34fd680 | 1 | 0.2.4.11/1.3.10.13; 2.5.7.11/3.4.6.9; 1.4.8.11/2.5.9.10 |
| 256e4fed983f9b46 | 174 | 0.2.7.13/1.3.4.11; 2.4.6.12/5.7.10.14; 2.6.8.11/4.9.10.13 |
| 2a5ee8837ea1a93c | 1 | 0.2.6.7/1.3.8.13; 1.5.6.8/3.4.7.9; 1.5.9.11/2.4.8.10 |
| 3c91f027de9dab5c | 31 | 0.2.6.13/1.3.4.9; 1.5.7.10/4.6.11.14; 2.3.10.11/5.6.8.9 |
| 478dc24c8d7cc490 | 170 | 0.2.5.11/1.3.6.8; 0.4.6.12/5.7.9.10; 3.4.9.11/6.8.10.13 |
| 4a14601b72dded2f | 172 | 0.2.8.13/1.3.7.9; 3.5.6.10/4.7.9.11; 0.9.10.12/3.5.8.11 |
| 50afbe509a7ba702 | 1 | 0.2.7.9/1.3.8.10; 0.5.6.12/1.4.7.10; 2.5.10.11/4.8.9.12 |
| 577555140a56cacb | 88 | 0.2.7.8/1.3.13.14; 1.4.5.9/6.7.10.12; 1.8.11.12/2.9.10.13 |
| 5b8f2d90efa5b99c | 143 | 0.2.8.10/1.3.6.14; 0.3.5.7/2.4.6.8; 3.7.8.11/4.5.9.10 |
| 73479d58c3fa631e | 78 | 0.2.7.9/1.3.6.10; 0.5.6.12/4.7.10.14; 1.8.9.12/2.5.10.11 |
| 736a68aa56adbfe5 | 40 | 0.2.11.13/1.3.7.8; 0.6.7.12/3.4.5.8; 2.6.8.10/4.9.11.12 |
| 743af5329be13ffd | 2 | 0.2.8.13/1.3.7.9; 3.5.6.10/4.7.9.11; 2.9.10.12/3.5.8.11 |
| 81779eb0eb8785f2 | 5 | 0.2.11.13/1.3.7.8; 1.2.4.5/6.7.9.12; 2.8.10.12/3.4.9.11 |
| 87c924f143526062 | 174 | 0.2.10.14/1.3.5.8; 0.5.7.8/1.4.6.12; 2.8.9.13/3.5.10.11 |
| 8c3d4ecdc5898356 | 2 | 0.2.5.10/1.3.4.11; 0.4.7.14/3.5.6.9; 3.9.10.13/5.7.8.11 |
| 902388adebea646e | 173 | 0.2.7.13/1.3.6.8; 0.4.6.11/1.5.7.8; 1.5.9.11/2.4.8.10 |
| 95d92282f2defc5a | 82 | 0.2.6.14/1.3.8.10; 0.1.4.5/6.7.10.12; 0.5.10.11/2.4.8.9 |
| 97bbd879b7e5a2f9 | 8 | 0.2.7.11/1.3.8.13; 1.5.6.10/4.7.9.12; 2.4.8.10/3.5.9.11 |
| 99b0a40e5b3e6e53 | 276 | 0.2.6.9/1.3.10.14; 4.6.8.14/5.7.10.12; 3.5.8.9/6.10.11.13 |
| 9b02981061b126ae | 3 | 0.2.8.10/1.3.4.14; 0.3.5.7/2.4.6.8; 3.7.8.11/4.5.9.10 |
| 9ba6b70a909158a4 | 1 | 0.2.7.8/1.3.6.10; 0.5.6.12/4.7.10.14; 1.8.9.12/2.5.10.11 |
| a26a24470deb124e | 170 | 0.2.8.10/1.3.4.9; 0.5.6.14/4.7.8.12; 1.5.8.11/4.6.9.10 |
| a72f126645992878 | 18 | 0.2.7.11/1.3.4.8; 1.5.6.10/4.7.9.12; 2.4.8.10/3.5.9.11 |
| b2440d0ade76793f | 1 | 0.2.11.14/1.3.10.13; 2.5.7.11/3.4.6.9; 1.4.8.11/2.5.9.10 |
| bb800a22a0588e14 | 5 | 0.2.8.9/1.3.11.13; 1.5.6.8/3.4.7.11; 3.4.8.10/5.9.11.12 |
| bf2f7f1478f6d1c3 | 6 | 0.2.6.8/1.3.4.9; 0.3.5.7/4.6.10.12; 2.7.10.11/6.8.9.13 |
| c38255a169c6cbd5 | 1 | 0.2.5.11/1.3.8.14; 0.4.6.12/5.7.9.10; 1.4.9.11/6.8.10.13 |
| cb14adf3c5a90222 | 94 | 0.2.7.9/1.3.6.10; 0.5.6.12/1.4.7.10; 1.8.9.12/2.5.10.11 |
| d7e5c9febea1c049 | 169 | 0.2.11.13/1.3.7.8; 1.2.4.5/6.7.9.12; 2.8.10.12/3.5.9.11 |
| e34a90db03b9a952 | 171 | 0.2.6.11/1.3.4.7; 0.4.5.14/6.7.9.11; 1.4.8.11/2.5.9.10 |
| ed971ff192532a32 | 170 | 0.2.4.8/1.3.11.14; 0.1.6.7/4.5.10.12; 1.7.9.10/4.8.11.13 |
| f1db109e2f170908 | 2 | 0.2.7.11/1.3.5.8; 0.5.6.10/4.7.9.12; 2.4.8.10/3.5.9.11 |
| f90101048f155783 | 171 | 0.2.4.9/1.3.10.14; 0.1.5.6/4.7.11.14; 0.5.8.11/7.9.10.13 |
| fa976c7fbc6803ce | 2 | 0.2.6.8/1.3.4.10; 0.3.5.7/4.6.10.12; 2.5.10.11/6.8.9.13 |
| fc53667c1f652cba | 145 | 0.2.7.11/1.3.5.13; 0.5.6.10/4.7.9.12; 2.4.8.10/3.5.9.11 |

## Pattern test and theorem-bank audit

The two discriminating small signatures do not collapse: class-location
distributions take 30 values and the three cross-apex intersection multisets
take 24 values.  The only nontrivial uniform observation is that every pair of
rich classes at distinct apices intersects in at most two points.  This is
empirically exhaustive only for these 39 observed profiles, but mathematically
it is already a consequence of the current general metric bank: three shared
points are noncollinear in the counterexample set, and
`Problem97.eq_of_equidistant_three_noncollinear` in
`lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:129` would force the two
distinct apex centers to be equal.

The mandatory global bank audit checked the registry and both concise and JSON
censuses for all three external banks:

- the sibling `p97-rvol` bank already contains both
  `Problem97.eq_of_equidistant_three_noncollinear` and a namespaced copy, plus
  the much larger U5 incidence bank (96 ambient-data, 88 metric-point, and 112
  scalar-algebra contradiction consumers);
- the legacy `erdos/97` bank contains
  `Problem97.three_common_equidistant_centers_eq`, explicitly identified by
  the registry as having a stronger current counterpart;
- the older `erdos-general-theorem/97` census has 297 bounded-local candidates
  but no exact declaration hit for this rich-profile statement.

Thus no new theorem candidate survived the bank check, and no agentic
`nthdegree docs search --lean` call was needed.

## First missing bridge to the live core

The observed `card <= 2` fact does not close
`false_of_retainedOmission_triApexAllLarge_core`.  Immediately before that
open theorem, the live source already proves the stronger consumer
`criticalShell_inter_otherRichCapSlice_card_le_one` and packages it as
`exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge`.
The first missing bridge is therefore a producer from the actual hypotheses
`R`, `Q`, and `G`: construct a named critical-shell support and a different
apex/radius cap slice whose intersection has cardinality at least two (or an
equivalent forced forbidden incidence).  A rich-profile signature alone does
not identify the critical-shell center, selected support, packet arm, or radius
needed for that statement.  The 39-profile census supplies no common
combinatorial selector that constructs this witness.

Trust status: the computation is authenticated external finite evidence and
the theorem-bank result is a source-only audit.  No solver was launched, no
Lean file was edited, and no build or kernel/axiom gate was run.
