active anchors (2):
  ⚓ 17ed85d2  Problem97.isM44EndpointResidualsExcluded  [open]
  ⚓ 019f401b (YOU)  Problem97.isM44PinnedSurplusGeneralMResidualsExcluded  [open]  — Auditing and closing the explicit general-m pinned-surplus residual after the m=5 bank closure
target spine view: 2 configured target_symbol(s)

════════════════════════════════════════════════════════════════
[1/2] theorem Problem97.erdos97_rhs
════════════════════════════════════════════════════════════════
spine rooted at: Problem97.erdos97_rhs
(this is a [publish] target_symbol — a claim being gated)
approved axioms: core + Lean.trustCompiler
open: 24/1879 node(s)
trusted leaves: 14 🔒 (certs excluded from mine by [mining].skip; covered by `#print axioms`)
spine source: 67472 line(s) of lean across 1887 decl(s)

open obligations (7):
  💧 Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair  [sorry]
  💧 Problem97.isM44EndpointGeneralMResidualsExcluded  [sorry]
  💧 Problem97.isM44EndpointResidualsExcluded  [sorry]
  💧 Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded  [sorry]
  💧 Problem97.isM44PinnedSurplusGeneralMResidualsExcluded  [sorry]
  💧 Problem97.u1_largeCap_routeB_tail_liveData_false  [sorry]
  ❌ sorryAx  [unapproved axiom]

(open branches only — closed subtrees collapsed; --full for everything)
└── Problem97.erdos97_rhs
    └── Problem97.UniversalProblem97
        ├── Problem97.universalReductionHypotheses
        │   ├── Problem97.descent_contradicts_minimality
        │   │   ├── Problem97.RemovableVertexOfLarge
        │   │   │   ├── Problem97.RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank
        │   │   │   │   ├── Problem97.removableVertexOfLarge_of_isM44PinnedSurplus
        │   │   │   │   │   ├── Problem97.isM44EndpointResidualsExcluded  [💧]
        │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
        │   │   │   │   │   │   ├── Problem97.isM44EndpointGeneralMResidualsExcluded  [💧]
        │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
        │   │   │   │   │   │   │   └── ✓ 1 closed dep(s)
        │   │   │   │   │   │   └── ✓ 26 closed dep(s)
        │   │   │   │   │   ├── Problem97.isM44PinnedSurplusResidualsExcluded
        │   │   │   │   │   │   ├── Problem97.isM44PinnedSurplusGeneralMResidualsExcluded  [💧]  ⚓ (YOU)
        │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
        │   │   │   │   │   │   │   └── ✓ 29 closed dep(s)
        │   │   │   │   │   │   └── ✓ 20 closed dep(s)
        │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentRemovable
        │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentErasureWitnesses
        │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentResidualErasureWitnesses
        │   │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentExactPinResidualsExcluded
        │   │   │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded  [💧]
        │   │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
        │   │   │   │   │   │   │   │   │   │   └── ✓ 74 closed dep(s)
        │   │   │   │   │   │   │   │   │   └── ✓ 16 closed dep(s)
        │   │   │   │   │   │   │   │   └── ✓ 17 closed dep(s)
        │   │   │   │   │   │   │   └── ✓ 22 closed dep(s)
        │   │   │   │   │   │   └── ✓ 14 closed dep(s)
        │   │   │   │   │   └── ✓ 2 closed dep(s)
        │   │   │   │   ├── Problem97.removableVertexOfLarge_of_nonIsM44
        │   │   │   │   │   ├── Problem97.u1_largeCap_routeB_tail_false
        │   │   │   │   │   │   ├── Problem97.u1_largeCap_routeB_tail_liveData_false  [💧]
        │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
        │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_center_p_t2_t20
        │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_largeCap_pCentered_t2Source_exactDangerousRow
        │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_twoLargeCaps_pCentered_t2Source
        │   │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.exists_removableVertex_of_twoLargeCaps
        │   │   │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair  [💧]
        │   │   │   │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
        │   │   │   │   │   │   │   │   │   │   │   │   └── ✓ 22 closed dep(s)
        │   │   │   │   │   │   │   │   │   │   │   └── ✓ 24 closed dep(s)
        │   │   │   │   │   │   │   │   │   │   └── ✓ 20 closed dep(s)
        │   │   │   │   │   │   │   │   │   └── ✓ 22 closed dep(s)
        │   │   │   │   │   │   │   │   └── ✓ 27 closed dep(s)
        │   │   │   │   │   │   │   └── ✓ 35 closed dep(s)
        │   │   │   │   │   │   └── ✓ 46 closed dep(s)
        │   │   │   │   │   └── ✓ 25 closed dep(s)
        │   │   │   │   └── ✓ 3 closed dep(s)
        │   │   │   └── ✓ 2 closed dep(s)
        │   │   └── ✓ 3 closed dep(s)
        │   └── ✓ 3 closed dep(s)
        └── ✓ 2 closed dep(s)

❌ NOT kernel-complete — spine of `Problem97.erdos97_rhs` has:
  - reaches sorry via 6 symbol(s)
  - unapproved axiom on spine: sorryAx

════════════════════════════════════════════════════════════════
[2/2] theorem Problem96.erdos96_rhs
════════════════════════════════════════════════════════════════
spine rooted at: Problem96.erdos96_rhs
(this is a [publish] target_symbol — a claim being gated)
approved axioms: core + Lean.trustCompiler
open: 28/1887 node(s)
trusted leaves: 14 🔒 (certs excluded from mine by [mining].skip; covered by `#print axioms`)
spine source: 67665 line(s) of lean across 1895 decl(s)

open obligations (7):
  💧 Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair  [sorry]
  💧 Problem97.isM44EndpointGeneralMResidualsExcluded  [sorry]
  💧 Problem97.isM44EndpointResidualsExcluded  [sorry]
  💧 Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded  [sorry]
  💧 Problem97.isM44PinnedSurplusGeneralMResidualsExcluded  [sorry]
  💧 Problem97.u1_largeCap_routeB_tail_liveData_false  [sorry]
  ❌ sorryAx  [unapproved axiom]

(open branches only — closed subtrees collapsed; --full for everything)
└── Problem96.erdos96_rhs
    └── Problem96.maxConvexUnitDistances_le_three_mul
        └── Problem96.unit_distance_pairs_bound
            ├── Problem96.EuclideanPeeling.doubledUnitCount_bound
            │   ├── Problem96.EuclideanPeeling.peel_vertex_exists
            │   │   ├── Problem97.UniversalProblem97
            │   │   │   ├── Problem97.universalReductionHypotheses
            │   │   │   │   ├── Problem97.descent_contradicts_minimality
            │   │   │   │   │   ├── Problem97.RemovableVertexOfLarge
            │   │   │   │   │   │   ├── Problem97.RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank
            │   │   │   │   │   │   │   ├── Problem97.removableVertexOfLarge_of_isM44PinnedSurplus
            │   │   │   │   │   │   │   │   ├── Problem97.isM44EndpointResidualsExcluded  [💧]
            │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
            │   │   │   │   │   │   │   │   │   ├── Problem97.isM44EndpointGeneralMResidualsExcluded  [💧]
            │   │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
            │   │   │   │   │   │   │   │   │   │   └── ✓ 1 closed dep(s)
            │   │   │   │   │   │   │   │   │   └── ✓ 26 closed dep(s)
            │   │   │   │   │   │   │   │   ├── Problem97.isM44PinnedSurplusResidualsExcluded
            │   │   │   │   │   │   │   │   │   ├── Problem97.isM44PinnedSurplusGeneralMResidualsExcluded  [💧]  ⚓ (YOU)
            │   │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
            │   │   │   │   │   │   │   │   │   │   └── ✓ 29 closed dep(s)
            │   │   │   │   │   │   │   │   │   └── ✓ 20 closed dep(s)
            │   │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentRemovable
            │   │   │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentErasureWitnesses
            │   │   │   │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentResidualErasureWitnesses
            │   │   │   │   │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentExactPinResidualsExcluded
            │   │   │   │   │   │   │   │   │   │   │   │   ├── Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded  [💧]
            │   │   │   │   │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
            │   │   │   │   │   │   │   │   │   │   │   │   │   └── ✓ 74 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   │   │   └── ✓ 16 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   │   └── ✓ 17 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   └── ✓ 22 closed dep(s)
            │   │   │   │   │   │   │   │   │   └── ✓ 14 closed dep(s)
            │   │   │   │   │   │   │   │   └── ✓ 2 closed dep(s)
            │   │   │   │   │   │   │   ├── Problem97.removableVertexOfLarge_of_nonIsM44
            │   │   │   │   │   │   │   │   ├── Problem97.u1_largeCap_routeB_tail_false
            │   │   │   │   │   │   │   │   │   ├── Problem97.u1_largeCap_routeB_tail_liveData_false  [💧]
            │   │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
            │   │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_center_p_t2_t20
            │   │   │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_largeCap_pCentered_t2Source_exactDangerousRow
            │   │   │   │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_twoLargeCaps_pCentered_t2Source
            │   │   │   │   │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.exists_removableVertex_of_twoLargeCaps
            │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├── Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair  [💧]
            │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├── sorryAx  [💧 sorry]
            │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └── ✓ 22 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   │   │   │   │   └── ✓ 24 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   │   │   │   └── ✓ 20 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   │   │   └── ✓ 22 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   │   └── ✓ 27 closed dep(s)
            │   │   │   │   │   │   │   │   │   │   └── ✓ 35 closed dep(s)
            │   │   │   │   │   │   │   │   │   └── ✓ 46 closed dep(s)
            │   │   │   │   │   │   │   │   └── ✓ 25 closed dep(s)
            │   │   │   │   │   │   │   └── ✓ 3 closed dep(s)
            │   │   │   │   │   │   └── ✓ 2 closed dep(s)
            │   │   │   │   │   └── ✓ 3 closed dep(s)
            │   │   │   │   └── ✓ 3 closed dep(s)
            │   │   │   └── ✓ 2 closed dep(s)
            │   │   └── ✓ 1 closed dep(s)
            │   └── ✓ 4 closed dep(s)
            └── ✓ 3 closed dep(s)

❌ NOT kernel-complete — spine of `Problem96.erdos96_rhs` has:
  - reaches sorry via 6 symbol(s)
  - unapproved axiom on spine: sorryAx

unimported files (173 file(s), 2020 symbol(s) — never reached by any lake import chain) — --full to list

targets summary: 2/2 target(s) still open
