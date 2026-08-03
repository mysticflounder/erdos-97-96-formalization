# Schema-v2 global theorem-bank audit

## Scope and verification boundary

This is a read-only source/artifact audit of

`scratch/retained-omission-e1/round5-general-cegar/artifacts/20260801T212051.080177Z-matrix-pid89883/matrix_summary.json`

against the live target

`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.

No Lean/Lake build, solver rerun, generator, proof-blueprint refresh, or kernel
axiom gate was run.  “Source-proved” below means only that no source
`sorry`/`admit` was found in the inspected declaration/module, unless an older
registry explicitly records a stronger audit.  The v2 matrix is external Z3
evidence for a conditional exact-`n = 15`, cap-profile `(6,6,6)` relaxation;
it is not a Lean proof and it does not close the universal target.

Exactly one agentic nthdegree Lean search was used, with the semantic query
“two distinct convex boundary centers equidistant from same two points cyclic
arc alternation bisector parity.”  Its highest-signal hits were the current
`CyclicAlternationCore`, the sibling/current
`u5_common_bisector_triple_incompatibility`, the current two-cap localization
consumer, and `TwoCenterBisectorParity`.  No further nthdegree search was run.

## Frozen v2 evidence

The authenticated v2 matrix contains 288 cases: 84 `unsat`, 204 `unknown`, and
no `sat`/error result.  Its frozen script hash is
`78301c9a88ffeeea2d005467dfe93e8c02cb9f46b14e50b4a142009b396dced5`.
The 204 `unknown` results are timeouts/cancellations, not models.

Family counts among the 84 operational UNSAT cores are:

| family | cores |
|---|---:|
| `cyclic_alternation_cut` | 81 |
| `global_K4` | 64 |
| `exact_rich_profiles` | 62 |
| `normal_form` | 54 |
| `source_in_critical_row` | 53 |
| `critical_full_row` | 53 |
| `critical_blocker_map` | 53 |
| `strict_kalmanson` | 45 |
| `no_all_apex_shell` | 37 |
| `packet_B2_equals_critical_row` | 19 |
| `common_deletion_packets` | 19 |
| `distinct_circle_overlap` | 16 |
| `pair_center_multiplicity` | 9 |

Representative records:

* `fresh_DDD_k0_d1_f3` is UNSAT from
  `critical_blocker_map`, `critical_full_row`,
  `cyclic_alternation_cut`, `normal_form`, and
  `source_in_critical_row`.
* `paired_SSS_k0_d3` is UNSAT from `cyclic_alternation_cut`,
  `exact_rich_profiles`, `global_K4`, `no_all_apex_shell`, and
  `strict_kalmanson`.
* `paired_DDD_k0_d1` is `unknown` (`canceled`), so it supplies no negative
  theorem or counterexample.

Only three UNSAT cores omit `cyclic_alternation_cut`: two DDS fresh cases use
the critical-row, exact-profile, global-K4, normal-form, source-incidence and
strict-Kalmanson families; one DSS fresh case additionally uses the two
common-deletion packet families.  Consequently cyclic alternation is the
dominant reusable terminal, but not an experimentally necessary terminal for
every closed case.  Family-level cores are operational tracked-assumption
cores, not modular proof dependencies.

## Reusable Lean theorems already present

### Exact terminal behind `cyclic_alternation_cut`

The mathematical cut is already source-proved in the current repository.

* `Problem97.false_of_two_centers_equidistant_pair_after`
* `Problem97.false_of_two_centers_equidistant_pair_enclosed`
* `Problem97.false_of_two_centers_equidistant_pair_split`
* `Problem97.false_of_two_centers_equidistant_pair_before`

all live in
`lean/Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean`.  They are
ambient-cardinality-uniform: for a convex-independent finite carrier and a CCW
enumeration, two boundary centers on the same side of a chord cannot both be
equidistant from its endpoints.  Their bodies reduce to the general strict
Kalmanson kernels in `CapCrossingKalmanson.lean`.  No source `sorry`/`admit`
occurs in this module.

The already-packaged cyclic form is

`Problem97.P5IndexedSourceScratch.false_of_nonalternating_equidistant`

in
`lean/Erdos9796Proof/P97/ATail/CardElevenUniqueFourCertificate/Support/Unique4ExactTwoSourceBridge/IndexedSource/CyclicAlternationCore.lean`.
It proves that two ordered centers and two ordered points that lie on the same
side of the center interval cannot satisfy both center/pair equidistances.  It
is uniform in the ambient `A`, but its local label type is `Fin 11`; this is a
bounded-label wrapper around the genuinely ambient-uniform four terminal
theorems, not an arbitrary-label API.  The exact-eleven family wrapper
`fullClassCyclicAlternationSat_direct` is therefore not the interface to use
for the live exact-15/general-n branch.

Both modules are transitively import-reachable from `FrontierLiveClosure`.
One explicit chain is

`FrontierLiveClosure -> CardElevenUniqueFourCertificateIngress -> Coordinator
-> P4FullLedgerSatisfaction -> .../CyclicAlternation/Main -> .../Core
-> P4GenericFamilies -> CyclicAlternationCore -> TwoCenterBisectorParity`.

The two inspected cyclic modules contain no source `sorry`/`admit` and print
their axioms at file end, but this audit did not execute those commands or a
transitive proof-blueprint/Lean axiom gate.  Their current live kernel closure
is therefore not re-certified here.

### Other core families

The remaining high-level family labels also mostly name semantics already
represented in general-n Lean:

| v2 family | existing Lean surface | audit result |
|---|---|---|
| `strict_kalmanson` | `CapCrossingKalmanson.lean`; four terminals in `TwoCenterBisectorParity.lean` | reusable general-n terminal already present |
| `distinct_circle_overlap` | `Problem97.two_circle_common_point_eq_endpoint` in `TwoCircleCrossing.lean`; `Problem97.U5QDeletedK4Class.inter_card_le_two` in `U5GlobalIncidenceSupport.lean` | reusable general-n two-circle intersection bound already present |
| `common_deletion_packets` | `ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket` and `nonempty_commonDeletionTwoCenterPacket` in `ATail/CommonDeletionTwoCenter.lean` | packet already carries exact four rows, distinct centers, and overlap `<= 2` |
| `packet_B2_equals_critical_row` | the live normal form's chosen critical-shell identification (the v2 report names `secondRow_support_eq_criticalShell_of_center_eq`) | target-specific producer/transport, not a new metric terminal |
| `normal_form` | the two constructors of `RetainedOmissionAllLargeNormalForm` in `FrontierLiveClosure.lean` | live checked producer; paired and fresh arms are explicit |
| `exact_rich_profiles` | `ApexRichClassStructure` and `oppositeCapRichClassInteriorPattern_of_apexRichClassStructure` in `ApexRichClassStructure.lean` | general-n Lean supplies S: at least four strict-cap points, or D: two distinct radii with at least two each; the matrix's exact S6/D44 cardinalities are exact-15 specialization data |
| `no_all_apex_shell` | `ATailApexRichClassStructure.no_center_class_contains_all_apices` | reusable general-n theorem already present |
| `critical_*`, `source_in_critical_row`, `global_K4` | `CriticalShellSystem`, selected critical-four shells, and the live cover/context producers | represented by live structures/producers; an SMT family is not itself a standalone reusable theorem |
| `pair_center_multiplicity` | the convex-carrier perpendicular-bisector bound is used by `no_third_bisectorCenter_of_obstructionCenters_eq`; exact-eleven certificate semantics also contain a perpendicular-bisector exclusion family | no new exact public general-n wrapper was identified by this audit; it is secondary because only 9/84 cores use the family |

All current modules named in the table are transitively reachable from
`FrontierLiveClosure` according to a source import-graph traversal.  No Lean
build was used to validate that traversal.

## Mandated external theorem-bank registries

All registries named in `AGENTS.md` were checked.

### Sibling `p97-rvol`

`certificates/p97_rvol_general_n_mining.{md,json}` and the “Sibling
`p97-rvol` banks” section of
`docs/general-n-certificate-bank-mining-2026-07-09.md` record 2,148 general-n
candidate instances, including 96 U5 class-level incidence incompatibility
families supported by 88 metric-point and 112 scalar-algebra kernels.

The closest semantic hit is

`Problem97.u5_common_bisector_triple_incompatibility`

from sibling `lean/RVOL/P97/U5GlobalIncidenceKernels.lean:146`.  The registry
marks it `source-proved`, RVOL-root-reachable, and an exact current-repo
name/shape match.  The current copy is
`lean/Erdos9796Proof/P97/U5GlobalIncidenceKernels.lean:146` and is also
transitively reachable from `FrontierLiveClosure`.

That theorem is not the v2 cyclic-alternation family.  It needs three
non-collinear points common to a `p`-circle and an exact q-deleted K4 class;
the dominant v2 cores need only two common points on one open cyclic arc.
Using it would require the strictly stronger producer “three common points
plus non-collinearity,” which the representative five-family cores do not
provide.  The registry contains no literal
`cyclic_alternation`/`nonalternating_equidistant`/two-center-parity candidate.

The registry's global conclusion exactly matches this round: its reusable
general-n consumers do not classify an arbitrary live packet into a terminal
incidence family.  The missing edge remains a geometric incidence/placement
producer.

### Legacy `erdos/97` and `erdos-general-theorem/97`

`certificates/erdos97_legacy_general_n_mining.{md,json}` records 285
source-proved bounded-local/general-n candidates (39 contradiction consumers),
and `certificates/erdos_general_theorem_p97_mining.{md,json}` records 297
(38 contradiction consumers).  Both registries report zero source
`sorry`/`admit`, but their public reusable material is principally N9
four-point Radon and scalar/algebra cell geometry.  Neither registry has a
literal cyclic-alternation, nonalternating-equidistant, strict-Kalmanson, or
two-center-bisector-parity candidate.  No candidate in either archive supplies
the positive common-support/same-arc producer needed by the v2 cores.

Thus the external banks add no better terminal than the current source already
imports, and none changes the producer boundary.

## What actually separates the closed and UNKNOWN cases

There is **no proved exact hypothesis separator** between the 84 UNSAT and 204
UNKNOWN records.  `UNKNOWN` is a timeout/cancellation status, not a satisfiable
case.  The same SSS theorem-level family core closes 12/12 paired SSS cases and
23/24 fresh SSS cases; the remaining fresh SSS case later closes only in the
separate schema-v3 smoke.  Therefore neither arm nor S/D profile is a logical
separator certified by v2.

There are nevertheless two precise producer differences visible in the
encoding:

1. In the fresh constructor, `reverse_mem`, the reverse blocker in the first
   strict cap, and
   `reverseShell_inter_cap_eq = {kept, deleted}` supply a direct pair of
   positive common incidences.  In the representative fresh DDD core, the
   first rich-apex shell and the reverse critical row both contain `kept` and
   `deleted`; the remaining work is to expose that these two points lie in one
   open cyclic arc between the two distinct centers.  This is why a core can
   use only normal-form/critical-row/source-incidence data plus cyclic
   alternation.
2. The paired constructor has `reverse_omission` instead of `reverse_mem`.
   Hence it lacks that direct positive common-pair producer.  In the all-S
   specialization, one radius class contains all four strict-cap points at
   each apex, so exact rich profiles plus the global exact K4 rows and the
   no-all-apex-shell condition can force a common same-arc pair indirectly.
   In a D arm those four points are split `2+2` across distinct radii, removing
   the single-class coherence used by that pigeonhole/propagation route.

The exact reusable missing datum is therefore not another cyclic terminal.  It
is a **positive witness producer** yielding distinct centers `c1,c2` and
distinct carrier points `p,q` such that `p,q` lie on both named radius classes
and occupy the same open cyclic arc between `c1,c2` (equivalently, satisfy the
nonalternating `hside` condition after choosing an order cut).  Once these
witnesses and their selected-class equalities are explicit, one of the four
`TwoCenterBisectorParity` terminals closes the branch.

This statement is exact at the Lean boundary.  Calling “S rather than D” or
“fresh rather than paired” the separator would overstate the experiment:
those are observed sources of the witness, not logically complete status
classifiers.

## Recommended universal theorem target

The next universal target should be the producer, not a duplicate terminal:

```lean
theorem exists_nonalternating_common_radius_pair_of_retainedOmission_triApexAllLarge
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (Q : RetainedOmissionAllLargeNormalForm P)
    (G : TriApexAllLargeContext D S) :
    -- existential package of c1 != c2 and p != q in D.A,
    -- both selected-radius memberships/equidistances,
    -- and p,q in the same open cyclic arc between c1,c2
    Nonempty (NonalternatingCommonRadiusPair D Q G) := by
  ...
```

`NonalternatingCommonRadiusPair` is schematic here; it should be a small
general-n proposition/structure stated directly with the carrier's CCW
indices, not with the exact-eleven `Fin 11` certificate `Label`.  Its consumer
should immediately dispatch to the already-proved four
`false_of_two_centers_equidistant_pair_*` theorems.  The producer must split
the two constructors of `RetainedOmissionAllLargeNormalForm` and the three
S/D rich-pattern choices, using only positive selected-class membership.

This recommendation is **conjectural as a universal producer**: the v2 data
make it the highest-yield target (81/84 UNSAT cores), but do not prove that
every `Q,G` has such a witness.  Before promotion as a load-bearing obligation,
the paired D-profile branches should be checked source-theoretically for an
actual witness or split into a separately justified terminal route.  A merely
conditional `False` theorem assuming this witness would be bookkeeping under
the project's obligation rules, not closure progress.

## Bottom line

The dominant v2 core family already corresponds to imported, reusable,
source-proved general-n Lean geometry.  The external registries contain nearby
two-circle/U5 consumers but no stronger directly applicable cyclic theorem.
The first missing bridge is the branch-uniform positive common-pair/same-arc
producer.  The exact-15 matrix provides strong targeting evidence for that
bridge, especially in the fresh arm and all-S profile, but the 204 timeouts and
the absent paired-D producer prevent any universal closure claim.
