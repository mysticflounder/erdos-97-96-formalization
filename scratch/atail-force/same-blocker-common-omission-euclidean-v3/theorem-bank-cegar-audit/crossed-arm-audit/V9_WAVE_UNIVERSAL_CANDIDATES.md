# V9 post-wave universal-candidate audit

Date: 2026-08-01

## Verdict

The v9 wave yields **no credible new universal/general-cardinality theorem
candidate**.  It yields two useful implementation findings:

1. all 23,470 fresh theorem-cut keys are new instances of 21 already registered
   local theorem families; the 484 fresh structural keys are all instances of
   the already proved shared-pair separation rule; and
2. 712 fresh selected-row cuts are syntactically redundant in the presence of
   their corresponding weaker raw-equality cuts.

The recurrence is therefore evidence for theorem-bank reuse and matcher/cut
deduplication, not evidence for a new mathematical consumer or for a
general-cardinality producer.  The live source-faithful universal obligation
remains the existing load-bearing theorem
`false_of_capSource_firstFiber_crossedThreeRowExactSupports` in
`FrontierLiveClosure.lean`; v9 does not prove, split, or narrow it.

## Scope and trust boundary

Compared artifacts:

- resume source v8: `source-at-common-full-metric-bank-v9-global-kalmanson-resume-v8/result.json`;
- v9 wave: `source-at-common-full-metric-bank-v9-global-kalmanson-resume-v9-1800s/result.json`.

V9 is `UNKNOWN_FAIL_CLOSED` after 1,800,019 ms.  It is a fixed `n = 17`,
closed-cap profile `(6,8,6)`, `source-at-common` Boolean incidence/order run.
It has 947 SAT cut-producing iterations followed by one canceled `unknown`.
The learned sets grow monotonically:

| learned key set | v8 | v9 | fresh |
|---|---:|---:|---:|
| theorem | 205,428 | 228,898 | 23,470 |
| structural | 8,598 | 9,082 | 484 |

The artifact explicitly omits Euclidean coordinates/QF_NRA realizability,
MEC/nonobtuse inequalities, full `CounterexampleData`/`noM44` geometry, other
unregistered metric theorems, every other `n` and cap profile, and any new Lean
build/kernel/axiom audit.  It supplies neither a semantically replayed SAT
witness nor a checked UNSAT certificate.  This audit ran only read-only source,
JSON, and theorem-index analysis; it ran no CEGAR job and no Lean/Lake command.

## Fresh theorem-family frequency

| family | fresh keys |
|---|---:|
| `first` | 3,673 |
| `reversed_second` | 3,673 |
| `second` | 3,615 |
| `convex_five_point_core` | 2,309 |
| `kalmanson_012_325_415` | 1,520 |
| `kalmanson_013_235_415` | 1,124 |
| `kalmanson_013_412_523` | 975 |
| `six_sparse_row_equalities` | 813 |
| `six_two_triple_row_equalities` | 796 |
| `five_direct_three_row_equalities` | 776 |
| `five_second_three_row_equalities` | 763 |
| `five_circle_isosceles_two_selected_rows` | 749 |
| `six_k2_three_row_triangle` | 726 |
| `six_sparse_two_selected_rows` | 495 |
| `kalmanson_012_124_314` | 443 |
| `five_kalmanson_three_shell_equalities` | 441 |
| `five_kalmanson_three_selected_rows` | 217 |
| `six_mirror_interleaving_equalities` | 108 |
| `four_middle_centers_bisect_endpoint_pair` | 106 |
| `four_endpoint_centers_bisect_middle_pair` | 91 |
| `six_main_row_equalities` | 57 |
| `global_kalmanson_14role_16eq` | 0 |

The fresh point counts are broad rather than localized: every one of the 17
fixed roles occurs between 6,194 and 7,880 times (`a3` lowest, `t1` highest).

## Orbit and co-occurrence analysis

There is no small new role-pattern orbit.  For example:

| family | fresh keys | distinct dihedral role coarsenings | largest coarsening |
|---|---:|---:|---:|
| `first` | 3,673 | 1,093 | 41 (`S-S-T-T-T`) |
| `second` | 3,615 | 1,062 | 44 (`S-S-T-T-T`) |
| `reversed_second` | 3,673 | 1,093 | 41 (`S-S-T-T-T`) |
| `convex_five_point_core` | 2,309 | 924 | 29 (`S-S-T-T-a2`) |
| `six_sparse_row_equalities` | 813 | 541 | 8 |
| `six_sparse_two_selected_rows` | 495 | 356 | 4 |

Thus even aggressive role coarsening leaves hundreds to more than a thousand
orbits in the dominant families.

Iteration-level recurrence is strong but not a logical implication:

- `first` and `reversed_second` occur in exactly the same 885/947 SAT
  iterations (Jaccard 1.0);
- either with `second`: 806 iterations (Jaccard 0.8547);
- either with `convex_five_point_core`: 797 iterations (Jaccard 0.8461);
- `second` with `convex_five_point_core`: 776 iterations (Jaccard 0.8238).

The `first`/`reversed_second` symmetry is exact after forgetting cyclic role
placement: each has 2,661 unordered five-point supports and the support sets
are identical.  Only 130 exact ordered tuples coincide.  This supports a
paired matcher macro, not a new contradiction theorem: the two antecedents are
different cyclic placements and their separate universal consumers already
exist.  A disjunctive Lean wrapper would be immediate bookkeeping and its CNF
cut is just the conjunction of the existing two cuts.

There are 4,858 point supports hit by multiple families.  The large clusters
are dominated by the same `first`/`reversed_second` symmetry and by already
known raw/selected versions.  Mere same-model or same-support co-occurrence
does not prove that one antecedent implies another.

## Genuine subsumption found

Two exact-order implications are valid directly from `SelectedFourClass`
membership and `support_eq_radius`:

| subsuming weaker antecedent | redundant stronger antecedent | fresh redundant cuts |
|---|---|---:|
| `six_sparse_row_equalities` | `six_sparse_two_selected_rows` | 495/495 |
| `five_kalmanson_three_shell_equalities` | `five_kalmanson_three_selected_rows` | 217/217 |

Every selected-row antecedent supplies the raw distance equalities on the same
ordered points, while the order guard is unchanged.  Hence the negation of the
raw antecedent subsumes the selected-row cut.  A resume generator may suppress
these 712 selected-row cuts when the paired raw family is enabled.  This is an
encoder optimization using existing proved theorems, not a new theorem and
not a route to the source-faithful terminal.

## Universal versus fixed-`n` classification

### Existing universal/local-uniform consumers

- `selectedFourClass_shared_pair_separated` and
  `SharedPairSeparationCore.satisfiedBy_of_realizes_ccw` are already
  ambient-cardinality-independent shared-pair separation theorems.  They
  account for the 484 fresh `raw_btw_sep` instances.
- `false_of_six_ccw_two_selected_rows` already derives the sparse six-point
  raw equalities from two selected rows and invokes the raw contradiction.
- `false_of_five_ccw_three_shell_equalities` and the four named Kalmanson
  three-equality schemas already cover the five-point raw patterns.
- the direct, second, and reversed-second cyclic-shift selected-row theorems
  already cover the dominant five-point instances.
- `false_of_fourteen_ccw_sixteen_shell_equalities_global_core` is already a
  theorem for arbitrary ambient `n`, with 14 cyclic indices and 16 distance
  equalities.  Its matcher fires **zero** times in both v8 and v9.  The fixed-v8
  role pattern therefore does not recur in this wave.

These are source-level applications of existing Lean declarations.  This run
did not rebuild them or perform a transitive axiom audit, and the JSON cuts do
not themselves constitute Lean applications of all 23,470 instances.

### Fixed-`n` empirical facts only

- the 23,470/484 fresh-key counts and all family frequencies;
- the 947 SAT models and final fail-closed timeout;
- role-frequency, orbit, point-support, and iteration co-occurrence results;
- persistence of the branch after all learned v9 cuts;
- absence of a v9 match for the 14-role schema.

None quantifies over `n`, other cap profiles, Euclidean realizations, or the
live `FirstFiberCrossedThreeRowExactSupports` data.

### New source-faithful universal candidates

**Empty set.**  Consequently there is no honest new Lean statement shape to
propose.  Any theorem of the desired form would need a new general producer
from the hypotheses of

```lean
theorem false_of_capSource_firstFiber_crossedThreeRowExactSupports
    ...
    (crossedRows :
      FirstFiberCrossedThreeRowExactSupports
        P Pρ Q source source' commonOutside oppositeOutside)
    (hexactRows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) :
    False
```

to one of the existing local consumers.  V9 provides no such map: its roles
are frozen at 17 labels, it omits the live geometry, and its observed local
family does not stabilize.  Introducing an existential “some five/six-point
bank obstruction occurs” theorem would simply restate the missing producer as
a new `sorry`, not extract a theorem from the wave.

## Global theorem search and bank pass

All configured Lean corpora were searched once per plausible statement with
`nthdegree docs search --lean --agentic`.  Exact query outcomes:

| query | result |
|---|---|
| `convex cyclic points two equal-distance centers for the same endpoint pair must alternate between the endpoints` | no agentic result surfaced |
| `six convex points two selected rows imply the sparse four row equalities contradiction` | no agentic result surfaced; name-filtered follow-up hit `false_of_six_ccw_two_selected_rows` (handle `CM9VHT`) |
| `five convex points three selected rows imply three shell equalities Kalmanson contradiction` | no agentic result surfaced; name-filtered follow-up hit `false_of_five_ccw_three_shell_equalities` (`SG2349`) and `..._012_124_314` (`PH820F`) |
| `five cyclic points direct and reversed second selected row obstruction unified` | no unified theorem surfaced; name-filtered follow-up hit the separate direct/second/reversed cyclic-shift family (`KX66R1`, `HKCFB0`, `QFHSD3`, `27HFQJ`, `ME9507`, `YW90Y3`) |
| `fourteen cyclic points sixteen equal distance shell equalities global Kalmanson contradiction` | hit the existing increasing/decreasing/wrapper family (`BMEXG4`, `H37RRQ`, `FBYH0H`) |
| `shared pair separation convex cyclic equal distance centers alternate` | hit `selectedFourClass_shared_pair_separated`, `CrossSeparationOK`, `SharedPairSeparationCore.SatisfiedBy`, and supporting declarations (`BVBWF5`, `5753R5`, `7S7REJ`, `QHBN57`, `RQSMSJ`) |
| `arbitrary convex point set family of selected four point rows contains a forbidden five or six point local pattern` | no agentic result surfaced globally, in `p97-rvol-lean`, or in `erdos-97-96-lean` |

The required registries were also checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md` explicitly classifies
  the equality-core family as ambient-cardinality independent but **not** a
  finite-cover theorem.  Its frontier scan found 311 new motifs among the
  478-row tail and 131/132 new motifs in the newest block, so it rejects a
  stabilized small complete motif alphabet.  The cyclic-separation layer has
  generic geometry/checker plumbing but no concrete row certificate or
  coverage claim.  Its closure summary identifies the producer, not consumer,
  as the remaining boundary.
- `certificates/p97_rvol_general_n_mining.{md,json}` contains 2,148 general-n
  candidate instances and 500 source-proved novel contradiction consumers,
  but the registry keyword review and scoped corpus search surfaced no
  crossed-arm selected-row, Kalmanson-shell, shared-pair-separation, or
  local-cover replacement for this branch.
- `certificates/erdos97_legacy_general_n_mining.{md,json}` and
  `certificates/erdos_general_theorem_p97_mining.{md,json}` explicitly report
  zero public ambient-`n` candidates.  Their reusable geometry is bounded-local
  rather than an all-`n` classification; neither inventory contains a relevant
  selected-row/Kalmanson/local-cover producer.

## Reproduction

Analysis script:

`crossed-arm-audit/analyze_v9_wave_universal_candidates.py`

It computes exact set deltas, family frequencies, role coarsenings,
same-support clusters, iteration co-occurrence, and same-order syntactic
subsumption.  Run from the repository root with:

```bash
uv run scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/analyze_v9_wave_universal_candidates.py
```
