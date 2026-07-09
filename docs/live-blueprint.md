active anchors (3):
  ⚓ 019f38a3  Problem97.isM44PinnedSurplusResidualsExcluded  [open]  — Switching from DoubleApex/card-11 census to pinned surplus residual per Adam request
  ⚓ f1cc942b  Problem97.u1_largeCap_routeB_tail_liveData_false  [open]
  ⚓ f46fdf3f  Problem97.largeK4SurplusCapPacket  [closed]
target spine view: 2 configured target_symbol(s)

════════════════════════════════════════════════════════════════
[1/2] theorem Problem97.erdos97_rhs
════════════════════════════════════════════════════════════════
spine rooted at: Problem97.erdos97_rhs
(this is a [publish] target_symbol — a claim being gated)
approved axioms: core + Lean.trustCompiler
open: 5/505 node(s)
spine source: 22005 line(s) of lean across 513 decl(s)

open obligations (1):
  ⏳ Problem97.RemovableVertexOfLarge  [stale]

(open branches only — closed subtrees collapsed; --full for everything)
└── Problem97.erdos97_rhs
    └── Problem97.UniversalProblem97
        ├── Problem97.universalReductionHypotheses
        │   ├── Problem97.descent_contradicts_minimality
        │   │   ├── Problem97.RemovableVertexOfLarge  [⏳ stale]
        │   │   └── ✓ 3 closed dep(s)
        │   └── ✓ 3 closed dep(s)
        └── ✓ 2 closed dep(s)

❌ NOT kernel-complete — spine of `Problem97.erdos97_rhs` has:
  - 1 stale symbol(s) (build changed since mine — re-run `refs --refresh`)

════════════════════════════════════════════════════════════════
[2/2] theorem Problem96.erdos96_rhs
════════════════════════════════════════════════════════════════
spine rooted at: Problem96.erdos96_rhs
(this is a [publish] target_symbol — a claim being gated)
approved axioms: core + Lean.trustCompiler
open: 9/513 node(s)
spine source: 22198 line(s) of lean across 521 decl(s)

open obligations (1):
  ⏳ Problem97.RemovableVertexOfLarge  [stale]

(open branches only — closed subtrees collapsed; --full for everything)
└── Problem96.erdos96_rhs
    └── Problem96.maxConvexUnitDistances_le_three_mul
        └── Problem96.unit_distance_pairs_bound
            ├── Problem96.EuclideanPeeling.doubledUnitCount_bound
            │   ├── Problem96.EuclideanPeeling.peel_vertex_exists
            │   │   ├── Problem97.UniversalProblem97
            │   │   │   ├── Problem97.universalReductionHypotheses
            │   │   │   │   ├── Problem97.descent_contradicts_minimality
            │   │   │   │   │   ├── Problem97.RemovableVertexOfLarge  [⏳ stale]
            │   │   │   │   │   └── ✓ 3 closed dep(s)
            │   │   │   │   └── ✓ 3 closed dep(s)
            │   │   │   └── ✓ 2 closed dep(s)
            │   │   └── ✓ 1 closed dep(s)
            │   └── ✓ 4 closed dep(s)
            └── ✓ 3 closed dep(s)

❌ NOT kernel-complete — spine of `Problem96.erdos96_rhs` has:
  - 1 stale symbol(s) (build changed since mine — re-run `refs --refresh`)

⚠ off-spine sorries (5 symbol(s) in 4 file(s)) — placeholder sorries are no longer allowed; all live work must be wired into the spine:
  Erdos9796Proof/P97/RemovableVertexAxiom/Base.lean  (1 sorry)
    💧 Problem97.isM44EndpointResidualsExcluded
  Erdos9796Proof/P97/RemovableVertexAxiom/Continuation.lean  (1 sorry)
    💧 Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
  Erdos9796Proof/P97/RemovableVertexAxiom/PinnedSurplusProducer.lean  (1 sorry)
    💧 Problem97.isM44PinnedSurplusNonVExactShapeProducer
  Erdos9796Proof/P97/U1LargeCapRouteBTail.lean  (2 sorry)
    💧 Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair
    💧 Problem97.u1_largeCap_routeB_tail_liveData_false

unimported files (510 file(s), 1641 symbol(s) — never reached by any lake import chain) — --full to list

targets summary: 2/2 target(s) still open
