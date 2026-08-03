# n=17 fresh-third fidelity audit

Date: 2026-08-02
Scope: `scratch/atail-force/same-blocker-common-omission-euclidean-v3/{model.py,incidence_cegar.py}` versus the live fresh-third interfaces.

## Verdict

The scaffold is a deliberate finite specialization of
`FreshThirdTwoCapSourceObstruction.sameBlockerAllEndpointOmission`, not a
faithful model of the generic fresh-third surface, interaction, or normalized
residual interfaces.  It is usable as a necessary-condition/diagnostic n=17
incidence model only if its scope is kept strong-arm-only.  It must not be used
to claim that the generic `FreshThirdBlockerFiber` route or either positive
normalized residual has been encoded or closed.

The main fidelity problem is **overencoding**: the CEGAR and Euclidean models
complete three first-apex radius classes to exactly the named pair and force
the p/r/q radii pairwise distinct (`incidence_cegar.py:443-450`,
`model.py:243-251`).  None of those exact-class or three-way disequalities is a
field of the live fresh-third packets.  The generic packet only carries source
membership, support cardinality/deletion views, and (in the stronger branch)
membership in one `commonRadius` class.

## Live interfaces (source anchors)

* `FreshThirdBlockerFiber` has two named carrier vertices, distinctness,
  equality of their actual blockers, blocker inequalities against the two
  retained collision blockers, eight endpoint inequalities, and mutual
  selected-shell membership (`BlockerMultiplicityGeometry.lean:70-111`).
* `CapSourceThirdCanonicalRowWitness`/`TwoCapSourceThirdCanonicalRowSurface`
  carries cap-card >= 8, source in strict cap interior, freshness from all four
  collision endpoints and both apexes/blocker centers, own support membership,
  support card = 4, and both `CrossPairDeletionView`s
  (`FrontierLiveClosure.lean:7913-7945`).
* `FreshThirdCapSourceInteraction` has four positive constructors: equal
  blocker/support, source-row endpoint omission with deletion survival,
  distinct blocker caps, and same-cap internal-fiber source
  (`FrontierLiveClosure.lean:9061-9123`).
* `FreshThirdNormalizedResidualCase` is a positive data packet with two
  non-hit alternatives or two cross hits with equal centers
  (`FrontierLiveClosure.lean:9201-9213`).
* The stronger target retains `commonRadius`, two complete source witnesses,
  mutual cross-membership, blocker equality, all-four endpoint omission,
  blocker-in-cap-interior, and exact shell/intersection `{source, source'}`
  (`FrontierLiveClosure.lean:9614-9646`).  Its `Q` is
  `FreshOutsideFirstBlockerFiber`, which explicitly names the source and the
  second off-cap shell point and their exact outside-cap difference
  (`BlockerMultiplicityGeometry.lean:115-157`).

## Predicate ledger

| Scaffold item | Status | Fidelity note / minimal action |
|---|---|---|
| Same p/r/q blocker aliases; p/r blockers distinct; q blocker fresh | Faithful for strong arm | Matches equal-blocker and blocker-ne inequalities.  `RetainedInteriorBlockerCollision.blocker_mem_capInterior` is a proved derived fact (`RetainedStrictInteriorPairSelector.lean:218-235`), so the first-cap blocker restriction is justified for this arm. |
| q pair same blocker, q shell cap intersection exactly `{q1,q2}`, all four endpoint omissions | Faithful/derived for strong arm | These are the strong constructor's `blockers_eq`, `AllCollisionEndpointsOmitted`, and `shell_inter_cap_eq`.  Exact global support `{q1,q2,u,v}` follows from support card 4 plus the cap intersection; it is not a primitive generic-surface field. |
| p-shell exact cap intersection and one same-blocker outside source | Partial/derived | This collapses `FreshOutsideFirstBlockerFiber`'s named `source`, `otherOutsidePoint`, and `outside_eq_pair` into anonymous finite candidates.  Add explicit source/other labels or retain this as a replay-derived consequence; do not call it a generic `FreshThirdBlockerFiber` encoding. |
| Mutual q source shell membership | Derived but not explicit | It follows from same blocker plus each exact selected support, but no direct cross-membership predicate is asserted.  Add replay checks if this is advertised as the live field. |
| `_complete_apex_class` for p, r, q | **Overencoded** | Live packets do not say that each radius class has exactly the named pair or excludes every other first-cap point.  Replace by named source-membership equalities (and an explicit common-radius relation for the strong q pair). |
| `distinct_first_apex_radii` | **Overencoded** | The live strong branch permits a common radius parameter and does not require it to differ from either retained radius.  Remove all three disequalities unless a separate imported theorem is made a stated assumption. |
| Strict convex order, MEC disk, non-obtuse triangle, gauge | Ambient specialization | These are QF_NRA/model conveniences, not predicates of the four fresh-third interfaces.  Keep only as clearly labelled ambient n=17 assumptions. |
| Five-center deletion arm selector | Downstream residual | This models `FirstFiberCollisionFiveCenterDeletionResidual`; it is useful, but is not part of generic `FreshThirdCapSourceInteraction` or `FreshThirdNormalizedResidualCase`.  Keep out of the base fidelity count. |
| `canonical_common_omission_witness = p1` metadata | Bookkeeping only / misleading if counted | Live strong branch has universal `AllCollisionEndpointsOmitted`; the older existential common-omission witness is not a required constructor field.  Retain as provenance only and remove from mathematical predicate/branch counts. |
| Generic interaction constructors | **Missing** | No tags or constraints encode `sameBlocker`, `sourceRowOmission`, `distinctBlockersDifferentCaps`, or `sameCapWithInternalFiberSource`. |
| Generic normalized residual packet | **Missing** | No representation of first/second non-hit packets, cross-hit witnesses, or equal cross-row centers.  The current scaffold cannot support a generic normalized-branch claim. |
| Generic `TwoCapSourceThirdCanonicalRowSurface` source data | Missing/indirect | q rows stand for the stronger same-blocker source pair; there is no independent generic C packet carrying two source witnesses and both deletion views. |

## Minimal fidelity action

No production Lean edit is needed for this audit.  For any scratch rerun,

1. remove `_complete_apex_class` and `distinct_first_apex_radii` from the base
   model, retaining only explicit source membership and the strong-arm
   `commonRadius` relation;
2. rename/document the model as
   `sameBlockerAllEndpointOmission` (not generic fresh-third); and
3. either add explicit finite witness labels for `Q.source` and
   `Q.otherOutsidePoint`, plus replay checks for mutual q cross-membership, or
   mark those facts as derived from exact-support constraints.

If generic fidelity is required later, add an explicit interaction-constructor
tag for each source and a residual-case tag/data packet.  Do not infer those
constructors from the current exact-support or five-center clauses.

## Trust boundary

This is a source/Boolean/QF_NRA audit only.  The scratch README itself records
that the live Lean terminal is unproved and that fixed n=17 evidence cannot
close the arbitrary-carrier theorem.  No Lean build, solver claim, or kernel
closure is asserted here.
