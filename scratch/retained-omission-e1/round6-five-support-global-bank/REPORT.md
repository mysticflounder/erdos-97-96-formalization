# Round-6 five-support global theorem-bank audit

## Verdict and verification boundary

**No existing theorem formalizes, or is directly instantiable from, the exact-`n = 15` 31-clause obstruction on `R0,R1,R2,K7,K8`.**

Anchor: `Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core` at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:6918`. It remains an explicit load-bearing `sorry`. The round-6 full-multiplicity probe records one schema-v4 `fresh_SSS_k1_d3_f2` result, `unsat` (Z3 4.15.3), at `round6-full-multiplicity/artifacts/20260801T220757.354027Z-cases-pid20770/summary.json`. This is exact external evidence for its finite relaxation, not a Lean proof.

The frozen Boolean core has exactly 31 clauses: 9 cyclic-alternation cuts (1332, 1334, 1335, 1381, 1383, 1384, 1569, 1570, 1613), 18 exact-rich-profile clauses (12, 16--20, 48, 51--55, 84, 86--90), and 4 global-K4 clauses (231, 247, 264, 278). It uses only `R0,R1,R2,K7,K8`.

One required indexed-corpus query was run, exactly once:

```text
nthdegree docs search --lean --agentic 'cyclic alternation five supports two-center bisector parity exact-rich profiles global K4 retained omission'
```

It yielded no direct five-support/core declaration. The mandated general-n report and all three mandated inventories were then searched. No Lake/Lean, solver, generator, or axiom command was run. Therefore “source-proved” below is the inventory's no-`sorry` source classification, **not** fresh transitive kernel closure.

## Candidates and preflight

| Candidate / exact statement | Source, importability, axioms | Five-support map and first missing producer |
|---|---|---|
| `false_of_two_centers_equidistant_pair_{after,enclosed,split,before}`: each stated CCW four-point order plus two centers each satisfying `dist center p1 = dist center p2` gives `False`. `dist_eq_dist_of_mutual_bisector` transports mutual equalities. | `P97/ATail/TwoCenterBisectorParity.lean:53,74,94,112,134`. Public but not anchor-imported (only a historical certificate imports it). Source-clean, no local `#print axioms` result or fresh audit: transitive axioms **UNKNOWN**. | Set centers to `K7,K8` and endpoints to two row points. Missing: both full equality pairs and a certified CCW order; profile/cardinality clauses do not supply either. |
| `false_of_four_ccw_endpoint_centers_bisect_middle_pair` and `...middle_centers_bisect_endpoint_pair`: CCW quadruple and the displayed two equalities imply `False`. | `P97/ATail/CapCrossingKalmanson.lean:462,493`; reachable because anchor imports `KalmansonThreeEqualitySchemas`. Declaration-level axiom print requests exist, but no fresh output was taken: **UNKNOWN**. | Same two-center/chord shape. Missing common chord, two equality pairs, and order adapter from `Q/G`. |
| `false_of_six_ccw_three_shell_equalities_013_412_523`, `...012_325_415`, `false_of_five_ccw_three_shell_equalities_012_124_314`, `...013_235_415`: `ConvexIndep`, injective CCW enumeration/image, increasing indices, and their three explicitly named radius equalities imply `False`. | `P97/ATail/KalmansonThreeEqualitySchemas.lean:32,68,110,143`; directly anchor-reachable. Source-proved; no fresh axiom audit: **UNKNOWN**. | Possible terminal after three row equalities are extracted. Missing: any three compatible equalities and five/six ordered roles; deriving alternation from this consumer reverses the route. |
| `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`: `Relation.TransGen (SelectedRowOrdinalComparison boundary value) start start -> False`. | `P97/ATail/OrdinalKalmansonCycle.lean:111`; public/used elsewhere but not anchor-imported. Source-proved/no fresh closure: **UNKNOWN**. | The nine cuts resemble a strict cycle only after each is upgraded to a metric comparison. Missing: even one `SelectedRowOrdinalComparison`; a Boolean `AtMost 1` is not one. |
| `OrderedDifferentPairCrossHit.false` and alternate: retained collision + positive actual cross-membership + stated six-role CCW order imply `False`. | `P97/ATail/RetainedCollisionDifferentPairConsumer.lean:157,258`; explicitly `COMPAT-ONLY/BANK`, no importer, hence not anchor-reachable. It has axiom-print requests but no fresh audit: **UNKNOWN**. | Closest retained-omission consumer. Missing `K_mem_J_shell` and the order; `Q` gives negative omissions, so treating it as a positive-hit producer is circular/invalid. |
| RVOL `U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`: for `a c d e f`, `a != c` and seven prescribed equalities (`ca=cd=cf`, `dc=de=df`, `fa=fd=fe`, `ea=ec`) imply `False`. | sibling `p97-rvol/lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77`; unimported, inventory `source-proved` only, fresh axiom status **UNKNOWN**. | Five support names could be assigned, but no assignment/seven equalities are produced. Importing a consumer does not realize its hypotheses. |
| RVOL `u5_common_bisector_triple_incompatibility`; and `qcritical_exact_selected_double_bisector_incompatibility` (single-bisector sibling included). The former needs positive `dist p q`, noncollinear common-circle triple, and a deleted K4 class; the latter needs `U5DangerousTriple`, critical/deleted K4 classes, and cross-memberships. | `U5GlobalIncidenceKernels.lean:146`, `U5GlobalIncidenceQCriticalExactSelectedDoubleBisector.lean:26`, sibling `...QCriticalSelectedBisector.lean:131`; RVOL-reachable/source-proved inventory entries, fresh closure **UNKNOWN**. | Nearest class-level K7/K8 analogue. Missing the entire metric/class packet and positive cross incidences. Establishing those by invoking the incompatibility theorem is circular. |
| RVOL `exists_selectedFourClass_of_globalK4 : HasNEquidistantProperty 4 A -> center ∈ A -> Nonempty (SelectedFourClass A center)`. | `p97-rvol/lean/RVOL/P97/U1CarrierInjection.lean:1029`; RVOL-reachable/source-proved, fresh closure **UNKNOWN**. | Selects a K4 row only. Missing ambient lift, identification with `K7/K8`, full equality-class cardinality, and all nine cuts. |
| Legacy/general `three_common_equidistant_centers_eq`: a noncollinear triple simultaneously equidistant from two centers forces the centers equal. Near-misses: `pointChord_strictMono_of_angle_lt_radius`, `inner_endpoint_chord_nonpos_of_cospherical_angles`, `midpoint_vsub_orthogonal`, and `n9Point_four_radon_partition` with partition-false consumers. | legacy `~/projects/math-projects/erdos/97/lean/N9Geometry.lean:19096,1427,1832,1268,69`; older-general counterpart `~/erdos-general-theorem/97/lean/N9Geometry.lean:19309,1489,1894,1268,69`. Public `source_reachable=true`, source-proved/no-sorry; archival roots, no recorded axiom/dependency graph: **UNKNOWN**. | Map triple to row points and centers to `K7,K8`. Missing all six equalities and noncollinearity (or positive radius/angle-order/convex/no-crossing data for near-misses). The bridge is geometric realization, not K4 counting. |

The mandated `docs/general-n-certificate-bank-mining-2026-07-09.md` likewise records no arbitrary-`n` certificate supplying this global incidence producer. The p97-rvol, legacy, and erdos-general inventories contain no R-label/five-support/exact-rich/global-K4 core declaration.

## Smallest honest new lemma shape

First prove the finite terminal explicitly, with no hidden metric conclusion:

```lean
theorem not_feasible_round6_fiveSupport_core
    (m : Fin 3 -> Fin 15 -> Bool)  -- R0,R1,R2
    (k : Fin 2 -> Fin 15 -> Bool)  -- K7,K8
    (h31 : Round6FiveSupport31Clauses m k) : False
```

`Round6FiveSupport31Clauses` must transparently encode **exactly** the 18 profile, 4 K4, and 9 alternation clauses (including fixed omitted/forced labels). A bounded kernel proof may close this purely finite theorem.

Separately, the first load-bearing geometric producer is:

```lean
theorem retainedOmission_to_round6_fiveSupport31Clauses
    (R : FrontierCommonDeletionParentResidual F)
    (Q : RetainedOmissionAllLargeNormalForm P)
    (G : TriApexAllLargeContext D S) :
    ∃ (m : Fin 3 -> Fin 15 -> Bool) (k : Fin 2 -> Fin 15 -> Bool),
      Round6FiveSupport31Clauses m k
```

It must derive the actual five row/equality-class labels, exact cardinalities, and nine alternation cuts from `Q/G` alone. It must not call the anchored false core, an outcome enumerator, or any candidate consumer above. This is the smallest honest missing bridge; without it, the external UNSAT core is not a Lean closure route.
