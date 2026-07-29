# Session 3 computational triage — live frontier

Date: 2026-07-28.

## Executive verdict

The live `FrontierLiveClosure.lean` frontier has **20**, not 19,
load-bearing `sorry` theorems.  The 19-leaf baseline in
`docs/computational-closure-plan-2026-07-28.md` predates the source-clean F3
narrowing: the former single F3 residual is now represented by
`false_of_twoCapSources_mutualCrossMembership_distinctBlockers` and
`false_of_twoCapSources_oneSidedDeletionSurvival`.  Both are consumed by
`false_of_twoCapSources_firstFiber`, and `docs/live-blueprint.md` marks both
as live `sorry` dependencies.

The Session-3 result is therefore **zero computational closures**:

- A, C, D-R, D-E, E, B2, and B3 have satisfiable audited incidence
  projections.  These SAT assignments are not Euclidean realizations and do
  not refute the Lean statements.
- B1 has no official package verdict because its live leaf does not expose
  the prerequisites needed by the historical B1 bank.
- F-Γ has no sound fixed-slot completeness reduction.  An unbounded abstract
  incidence/cardinality family survives, so a finite named-local SAT search
  cannot close that package.

Every UNSAT result produced in Sessions 1–3 is a smoke/probe result whose
DRAT proof checks.  None is an UNSAT verdict for a live leaf.

## Leaf matrix

All declarations below are in
`Problem97.ATailFrontierLiveClosure`; the four F declarations are in its
`TwoSourceExactCollisionRowsTerminal` namespace.

| # | Package | Live theorem | Computational status | First missing bridge |
|---:|---|---|---|---|
| 1 | B1 | `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision` | `BLOCKED_INGRESS_MISSING`; direct shadow SAT is not official | Produce support equality, both cross-memberships, and the exact two-point class intersection required by the B1 bank |
| 2 | B2 | `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence` | `OPEN_INC_SAT` | A global/metric consequence beyond the named-local canonical-row and mutual-omission projection |
| 3 | B3 | `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare` | `OPEN_INC_SAT` | The live global off-center survival quantifier; it cannot be replaced by the four named selectors |
| 4 | A | `false_of_exactFourMutualOmissionRigid221_minimalCore` | `OPEN_INC_SAT` after v1.3 `(C6)` | Exact metric/global geometry beyond the current blocker, deletion, cap, and overlap clauses |
| 5 | A | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted` | `OPEN_INC_SAT` after v1.3 `(C6)` | Same A-package metric/global bridge |
| 6 | A | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy` | `OPEN_INC_SAT` after v1.3 `(C6)` | Same A-package metric/global bridge |
| 7 | A | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy` | `OPEN_INC_SAT` after v1.3 `(C6)` | Same A-package metric/global bridge |
| 8 | A | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows` | `OPEN_INC_SAT` after v1.3 `(C6)` | Same A-package metric/global bridge |
| 9 | A | `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge` | `OPEN_INC_SAT` after v1.3 `(C6)` | Same A-package metric/global bridge |
| 10 | C | `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU` | `OPEN_INC_SAT` | A metric/global realization obstruction beyond the C1 placement projection |
| 11 | C | `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision` | `OPEN_INC_SAT` | A metric/global realization obstruction beyond the explicit C2 collision projection |
| 12 | D-R | `false_of_exactFourPostCardElevenTwoRadiusBranch` | `OPEN_INC_SAT` | A finite consequence of universal no-five/no-M44 or exact real-radius content |
| 13 | D-R | `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` | `OPEN_INC_SAT` | Same D-R universal/metric bridge; the five swap aliases do not imply packet equality |
| 14 | D-E | `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` | `OPEN_INC_SAT` | A proved finite cutoff, a cardinality-free symbolic certificate, or exact geometric content |
| 15 | D-E | `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` | `OPEN_INC_SAT` | Same D-E bridge; the two-bisector bound alone is consistent with the live projection |
| 16 | E | `false_of_retainedInteriorDirectedOmission_and_all_low_hits` | `OPEN_INC_SAT` | The unencoded E9 all-low-hit family and the remaining unlabeled survival/minimality geometry |
| 17 | F-Γ | `false_of_crossBlockerCoincidence` | `OPEN_NO_FINITE_COMPLETENESS` | A positive cross-hit consequence from the equality arms using global geometry |
| 18 | F-Γ | `false_of_capSource_freshThirdBlockerFiber` | `OPEN_NO_FINITE_COMPLETENESS` | A positive incidence/center or rich-slice relation between the cap-source row and fresh fiber |
| 19 | F-Γ | `false_of_twoCapSources_mutualCrossMembership_distinctBlockers` | `OPEN_GEOMETRY` | Close the common-omission branch when one blocker-cap index is the first cap |
| 20 | F-Γ | `false_of_twoCapSources_oneSidedDeletionSurvival` | `OPEN_GEOMETRY` | Synchronize the surviving deletion row with the five named robust centers and obtain bounded-support confinement |

## Audited package evidence

| Package | Official production result | Gate evidence | Scope |
|---|---|---|---|
| A | all eight v1.3 runs SAT | G-C6 and all other negative probes DRAT-verified | finite named incidence abstraction |
| C | base, C1, and C2 SAT | all smoke/probe UNSATs DRAT-verified | finite named incidence abstraction |
| E | all three runs SAT | five negative probes DRAT-verified; 15-point shadow checked | finite named incidence/counting abstraction |
| D-R | `dr-common`, `dr-d1`, `dr-d2` SAT | 25/25 negative probes DRAT-verified; four positive fixtures SAT | named-local incidence shadow |
| D-E | base-E, D3-left, D3-right, D4 SAT | fresh third bisector UNSAT with verified DRAT; dependency-removal near miss SAT | open-carrier named-witness projection |
| B | B2/B3 and pinned arms SAT; B1 omitted | third-bisector smoke UNSAT with verified DRAT; three near misses SAT | named-local projection |
| F-Γ | no complete finite verdict | 17-point shadow plus unbounded four-point-block extension | abstract incidence/cardinality only |

## Consequence for the compute lane

The package SAT lane has reached its honest boundary: further clauses must
come from new proved metric/global consequences, not from closing the
displayed labels into an artificial finite universe.  The next computational
work is Phase 3 exact shell enumeration and survivor banking.  Its results
remain conditional on the exact cell CNF and do not close a Lean leaf unless
all OPEN survivors also receive independently checked infeasibility
certificates.
