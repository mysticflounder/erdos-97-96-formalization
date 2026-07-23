# Aligned-p5 terminal source-map audit

Date: 2026-07-22

Scope: `run_aligned_p5_full_linear_cegar.py`, its imported encoder and hard
clause families, and the exact card-eleven `alignedP5` Lean source surface.
This audit changes no production Lean file or shared plan document.

## Verdict

**No semantically overstrong aligned-p5 clause was found.** In particular,
both clauses singled out for review are source-valid independently of whether
they are load-bearing in an UNSAT core:

1. `AlignedInteriorFrontier.residual` sets
   `interior_q := P.frontier.pair.q` and
   `interior_w := P.frontier.pair.w`. Therefore the encoder's ordered
   equivalences

   ```text
   retained_q_i <-> interior_q_i
   retained_w_i <-> interior_w_i
   ```

   are exact. They do not identify the pair merely up to a swap.
2. `pair_minimality_overlay` is a direct application of
   `ATailGlobalMinimalDeletion.exists_global_cardMinimal_blocking_subdeletion`
   to the distinct carrier pair
   `{R.interior_q, R.interior_w}`. The fresh-center, nonempty subdeletion,
   blocking, and one-point-restoration clauses have the right direction.

The exact finite UNSAT result is nevertheless **not currently a locally
kernel-backed source contradiction**. The first hard-cut family which lacks
a consumer in this repository's import closure is

```text
verified_u5_signed_schema_cut
```

with 2,106,720 clauses. Its eight consumers exist in the sibling
`p97-rvol` corpus, but the current repository neither contains nor imports
those declarations. The source catalog used to derive the signed schemas
labels itself

```text
SOURCE_STATEMENT_TRANSLATION_AUDITED_NOT_KERNEL_REBUILT.
```

Thus these clauses are **CONDITIONAL**, not locally `PROVEN`, until the
corresponding consumers are copied/imported, their selected-row adapters are
composed, and the resulting declarations are freshly kernel-checked here.
Alternatively, a checked UNSAT run with this bank removed would make this
particular gap irrelevant.

No hard clause is classified `UNSUPPORTED` in the stronger sense of being
false or lacking any known mathematical producer. The current blockers are
formal transport and trust-boundary gaps, not a discovered countermodel to a
clause.

## Status vocabulary

- **PROVEN**: the implication is supplied definitionally or by a current Lean
  theorem/source construction with the exact relevant semantics.
- **CONDITIONAL**: the mathematical implication has a credible proved source,
  but the current repository lacks a local kernel import, exact source-to-CNF
  valuation theorem, or artifact binding needed to use it for closure.
- **UNSUPPORTED**: no valid producer was found, or the encoded implication is
  stronger than the source. No family reached this status.

These labels assess source validity. They are intentionally independent of
whether a separate clause-ablation run finds a family load-bearing.

## Exact aligned-p5 source map

The intended input is the `alignedP5` constructor of
`CardElevenUniqueFourCoverage R`, carrying

```text
S.surplusCap.card = 5
S.oppCap1.card = 5
S.oppCap2.card = 4
P : AlignedInteriorFrontier R.
```

The finite boundary labels are

```text
0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
```

with apices `0` and `4`, surplus vertex `8`, and closed caps

```text
surplus        = {0,1,2,3,4}
first opposite = {4,5,6,7,8}
second opposite= {8,9,10,0}.
```

The mathematical re-cut/orientation is source-valid. A Lean record packaging
the exact boundary equivalence and these labels has not been constructed, so
the label assignment is **CONDITIONAL as a source-to-CNF bridge**, not an
unsupported cap decomposition.

| Encoded aligned field | Status | Source justification |
|---|---|---|
| `opp1_card = 5` and the `(5,5,4)` cap profile | **PROVEN** | `CardElevenUniqueFourCoverage.alignedP5.profile` |
| strict labels are exactly `5,6,7` | **PROVEN** mathematically; **CONDITIONAL** as a Lean label record | a five-point closed cap has three strict interior points |
| `class_5`, `class_6`, `class_7` | **PROVEN** | `P.three_strict_hits` plus strict-interior cardinality three |
| retained `q,w` are distinct, in the first-apex class, and outside the surplus cap | **PROVEN** | `P.interiorPair` and `P.frontier.pair` |
| retained pair equals residual strict pair | **PROVEN** | definitional fields of `AlignedInteriorFrontier.residual`; ordered `q` and `w` agree separately |
| second-apex double-deletion row omits retained `q,w` | **PROVEN** | `P.interiorPair.secondApexDouble`, transported through `P.frontier` |
| first-apex class has cardinality four and unique K4 radius | **PROVEN** | fields preserved by `AlignedInteriorFrontier.residual` |
| strict-pair bisector localization | **PROVEN** | field rebuilt explicitly in `AlignedInteriorFrontier.residual` |

The 47 aligned clauses consist of three positive class units and 44
implications implementing the two ordered role equivalences over eleven
labels. Their polarity is correct.

## Outer hard-clause audit

The following table groups every base family emitted by
`exact_four_outer.py`.

| Clause block or field group | Status | Audit |
|---|---|---|
| `radius_partition_transitivity` | **PROVEN** | equality of actual distances from one center is an equivalence relation on noncenter points |
| `row_*`, `selected_row_subset_radius_class` | **PROVEN** source semantics; **CONDITIONAL** Lean valuation | global K4 supplies one nonself selected four-subset at every center |
| `mutual_triangle_cross_center_radius_transport` | **PROVEN** | distance symmetry and the four displayed row incidences force the blocker-center equality |
| `full_class_intersection_at_most_2` | **PROVEN** | two circles with distinct carrier centers have at most two common points |
| `full_pair_center_count_at_most_2` | **PROVEN** | carrier centers equidistant from a fixed pair lie on its perpendicular bisector; convex independence permits at most two carrier points there |
| `full_class_cyclic_alternation` | **PROVEN** | the two centers on the perpendicular bisector and the equal pair must alternate on the strict convex boundary |
| `strong_connectivity_outgoing_cut` | **PROVEN** | minimality makes every source-faithful selected-witness digraph strongly connected |
| `first_apex_class_*`, `first_apex_unique_K4_class`, `first_apex_row_eq_class` | **PROVEN** | `OriginalUniqueFourResidual.class_card_eq_four` and `unique_K4_radius`; the selected first-apex row is the complete exact class |
| first-apex adjacent-cap at-most-one clauses | **PROVEN** | the endpoint one-hit theorems for the two caps incident to the first apex |
| `interior_*` base role clauses | **PROVEN** | the residual carries a distinct strict-cap class pair |
| `blocker_*`, `critical_support_*`, `critical_no_qfree_full_partition` | **PROVEN** | the late `CriticalShellSystem` is total and fixed-point-free; criticality after deleting the source makes the source radius class exact four and leaves every other class below four |
| `blocker_center_row_eq_critical_support` | **PROVEN** | choose the global selected row at each used blocker center to be its critical support |
| `same_blocker_same_critical_support` | **PROVEN** | same center plus source containment and critical exactness force the same complete four-class |
| `first_apex_fiber_eq_class`, `class_source_critical_support_eq_class` | **PROVEN** | `lateFirstApexSystem_centerAt_eq_iff_mem_class` and `lateFirstApexSystem_support_eq_class` |
| `blocker_image_mutual_triangle_membership_closure` | **PROVEN** | `mem_blockerImageSelectedRow_of_twoStep_mutualTriangle`; the Boolean implication polarity was also exhaustively audited in `unique4-complete-radius-encoding-audit` |
| retained-pair clauses | **PROVEN** | source frontier pair membership/distinctness and cap placement |
| `second_deletion_row_*` | **PROVEN** | choose four points from the actual second-apex K4 witness after deleting the retained pair |
| `full_partition_bisector_localization` | **PROVEN** | `OriginalUniqueFourResidual.bisector_center_mem_interior` |
| `minimality_*` protected-set prefix | **PROVEN** | exact common prefix of `exists_strictCap_collision_or_singletonCore_or_packedCore`; it does not encode the later trichotomy |
| `pair_minimality_*` | **PROVEN** | direct pair specialization of `exists_global_cardMinimal_blocking_subdeletion` |
| `verified_planar_schema_cut` | **PROVEN** theorem semantics; **CONDITIONAL** source-to-CNF bridge | one extension-stable generic consumer, transported over injective role maps |
| `verified_kalmanson_order_schema_cut` | **PROVEN** theorem semantics; **CONDITIONAL** source-to-CNF bridge | ten kernel-only generic consumers, transported only over order-preserving maps and reflection |
| `verified_u5_signed_schema_cut` | **CONDITIONAL** | eight sibling `p97-rvol` consumers; current local adapters exist, but the consumer declarations are not imported or kernel rebuilt here |

### Pair-minimality details

The pair overlay does not smuggle in the later singleton/equal-radius/
distinct-radius classification.

- `pair_minimality_center_outside_pair` is exactly
  `center ∈ D.A \ U`.
- `pair_minimality_deleted_subset_pair` is exactly `V ⊆ U`.
- `pair_minimality_deleted_nonempty` is the theorem's `V.Nonempty`.
- `pair_minimality_no_K4_after_full_deletion` expands the negation of K4
  over every four-point complete radius class.
- Each restoration witness contains the returned source and three points
  surviving the other deletions at one radius.
- Restoration clauses are generated only for strict-cap source labels. This
  is exhaustive because `V` is already constrained to the two strict roles.

The fact that the retained/strict role equality is not needed by a particular
finite UNSAT core would not invalidate it. Source validity and core
load-bearing status are separate questions.

### Protected-set minimality details

The protected set is the exact first-apex class union the three support
triangle vertices. For nontriangle labels the subset clause requires class
membership; triangle labels are permitted directly. The chosen center is
outside both pieces. This matches the source theorem's
`center ∈ D.A \ protectedDeletionSet R` common prefix.

The two minimality witnesses use disjoint auxiliary variable families, so
asserting both existential consequences simultaneously is valid.

## Added own-cap, curvature, and seed blocks

| Added block | Status | Audit |
|---|---|---|
| selected-row intersection with a containing displayed cap is at most two | **PROVEN** | `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two` |
| endpoint row intersection with either incident cap is at most one | **PROVEN** | the `first` and `last` ordered-cap endpoint theorems |
| row-pattern equivalences and outer-arc variables | **PROVEN** at Boolean level | exactly-four row membership makes one support-pattern true; its two masks match the selected-row curvature adapter |
| `direct_no_four_turn_disjoint_outer_arcs` | **PROVEN** theorem semantics | pairwise-disjoint nonempty turn masks either leave a strict gap or cover the period; the two checked curvature consumers handle both cases, including repeated row centers |
| four seeded Kalmanson row-instance families | **PROVEN** theorem semantics | two corrected-own-cap consumers and two orientations of `false_of_two_k2_three_row_triangle`; all rows in each seed have distinct centers |

The seeded clauses quantify over all order-preserving injections and boundary
reflection only. That is exactly the transport licensed by the generic
consumers. No arbitrary role permutation is installed.

The full-linear oracle is not load-bearing in this run:

```text
refinement_count = 0.
```

The Boolean formula was already UNSAT before any metric-oracle refinement.

## Theorem-bank preflight

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered aligned exact-four p5, strict-pair
minimal deletion, cap row bounds, Kalmanson, and shell curvature. No local
source-to-CNF coverage theorem for the aligned branch was found. The search
did confirm that the U5 consumers are part of the sibling `p97-rvol` bank,
not declarations in the current Lean library.

This audit proposes no new local contradiction theorem. The immediate bank
action, if the U5 family is load-bearing, is to reuse and locally rebuild the
existing sibling consumers rather than derive replacements.

### Fresh-elaboration boundary

A direct warning-as-error recheck of the scratch dependency chain was
attempted, but the current default Lake search path does not contain the
scratch named-import oleans such as `OriginalUniqueResidualDispatch` and
`AuxBaseCollisionPort`. No source diagnostic was reached. The theorem-level
`PROVEN` labels above therefore combine direct inspection of the current
declarations with their existing same-checkpoint warning-clean/axiom reports;
they are not a claim that this audit freshly rebuilt the whole scratch graph.
This limitation strengthens, rather than relaxes, the requirement for a local
kernel rebuild before importing the finite result into the proof spine.

## Artifact integrity

The current temporary terminal bytes match the saved result:

```text
CNF SHA-256
50a8062cb9b089cc6f3a47497face0a46ceacb5e86152ec04fc5f3c6557b9c7f

solver log SHA-256
62faf0e5fedb56b8bbd61bda31e21b38990e39b983a7c1a39203409071a8cf6e
```

All seven paths listed in `aligned_p5_cegar.json.source_hashes` also match
their current bytes. The binding is incomplete, however. The result omits
hashes for transitive load-bearing code including:

```text
run_full_linear_cegar.py
run_direct_overlay_with_own_cap.py
direct_curvature_overlay.py
```

and it does not bind the Lean sources of the own-cap, curvature, planar,
Kalmanson, seeded, or U5 consumers. `full_linear_replay.py` is also unbound,
although it was not reached in this zero-refinement run.

The CNF comments retain the base encoder's pre-overlay block-count snapshot.
They record final variable/clause totals but not separate aligned, own-cap,
curvature, and seed block counts. The source code is auditable, but the
terminal artifact is not a complete self-describing provenance manifest.

## First actual closure gaps

Even after DRAT verification, two bridges remain:

1. a Lean structure/valuation from
   `CardElevenUniqueFourCoverage.alignedP5` to the exact generated formula,
   including the `Fin 11` boundary labeling, every selected row, equality
   atom, critical support, and auxiliary witness; and
2. a locally kernel-checked implementation of every enabled hard bank,
   especially the eight sibling U5 signed schemas.

Accordingly, the strongest justified present claim is:

> **EXACT external Boolean UNSAT for the hashed documented projection,
> pending proof replay; aligned overlay source-valid; U5 bank and full
> source-to-CNF transport not locally kernel closed.**

It is not yet a proof of the aligned-p5 Lean residual and does not close a
source `sorry`.
