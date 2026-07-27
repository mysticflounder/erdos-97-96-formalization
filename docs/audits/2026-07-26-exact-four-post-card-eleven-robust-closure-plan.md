# Exact-four post-card-eleven robust closure inventory

Date: 2026-07-26
Anchor:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenRobustSurface`

## Scope and status convention

This is the scratch-wide closure reconciliation for the robust constructor of
`K-A-UNIQUE-PHYSICAL-SPLIT`.  It covers the current production inputs and the
relevant route families under `scratch/atail-force`, including promoted
card-eleven certificate material, later card-at-least-twelve audits, generated
solver/check logs, and declarations whose namespaces still contain `Scratch`.
It began as an inventory and next-slice plan.  The implementation checkpoint
at the end records the subsequently checked production narrowing; it does not
claim that the anchored contradiction is closed.

The source in `lean/Erdos9796Proof` and the current proof-blueprint anchor
outrank older reports and cached oleans.  Trust labels below mean:

- **KERNEL-CURRENT**: current Lean 4.27 source was freshly checked or is a
  current production declaration with a recorded source-clean build and
  standard axioms only.
- **KERNEL-RECORDED**: a report records an axiom-clean Lean check, but this
  audit did not rebuild the current source.
- **NEGATIVE-KERNEL**: a current Lean theorem rules out the proposed adapter.
- **SOURCE-NORMALIZATION**: a checked producer or case split, but not a
  contradiction.
- **EXACT-WITHIN-MODEL**: a checked SAT/SMT result about the recorded finite
  encoding, not a Euclidean source theorem.
- **CONJECTURAL / OPEN**: no checked producer of the required premise.

`proof-blueprint anchor list` currently contains the open session anchor
`019f91c7` for the theorem named above.  `proof-blueprint refs --check` is not
clean in the shared dirty checkout: at build `bca77eb456b3` it reports four
stale and twenty never-mined project symbols and requests `refs --refresh`.
Accordingly this document does not claim a refreshed whole-project spine; the
anchor theorem and its immediate production inputs below were reconciled
directly against current source.

Lean is `4.27.0`.  A fresh broad rebuild was not started because approximately
twenty Lean processes were already active in this shared checkout.  The two
most relevant current-source logs are:

- `scratch/atail-force/card12-frontier-common-deletion-alignment/lake-build-final.log`,
  a successful 8,762-job Lean 4.27 build; and
- `scratch/atail-force/card12-robust-terminal-audit/continuation-lean427.log`
  and `large-radius-continuation-lean427.log`, both recording the current
  duplicate-declaration import failure of the large-radius continuation.

## Exact current production contract

The published coordinator is at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:137`:

```lean
theorem false_of_exactFourPostCardElevenRobustSurface
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    False := by
  rcases interiorPairGood_or_twoDistinctExactFourInteriorRows R surface with
    hFivePoint | hTwoRadius
  · exact false_of_exactFourPostCardElevenInteriorDeletionBranch
      R hcard surface -- unpacked hFivePoint fields
  · exact false_of_exactFourPostCardElevenTwoRadiusBranch
      R hcard surface -- unpacked hTwoRadius fields
```

The coordinator itself is checked.  Its two branch theorems are the exact
load-bearing obligations.  The separate `12 ≤ D.A.card` hypothesis is not
stored inside the surface.  The exact checked inputs are:

| Input | Current source and strongest retained data |
|---|---|
| `OriginalUniqueFourResidual F` | `P97/ATail/CardElevenUniqueFourCertificate/Support/UniqueArmRouteAudit/OriginalUniqueResidualDispatch.lean:43`.  It retains `D.Minimal`, no `IsM44`, `9 < D.A.card`, a first-apex selected radius class of cardinality exactly four, uniqueness of the positive K4 radius at that apex, deletion blocking for every point of that class, two distinct class points `interior_q,w` in the strict first opposite cap, and localization of every other carrier bisector center of that pair to the same strict cap.  The production copy differs from the older scratch file principally by production imports; production is authoritative. |
| `ExactFourPhysicalCommonDeletionIngress R` | `P97/ATail/ExactFourPhysicalConsumer.lean:417`.  It retains one deleted point equal to one of the original frontier points, one good outside source, a late blocker distinct from the physical second apex, and a `CommonDeletionTwoCenterPacket` at those two centers. |
| `ExactFourPostCardElevenRobustSurface R` | `P97/ATail/ExactFourRobustCapExpansion.lean:280`.  It retains the ingress, full deletion robustness at the physical second apex, first opposite cap cardinality at least four, second opposite cap cardinality at least five, the complete second-apex deletion-robust radius classification, and the exhaustive cap-growth trichotomy. |
| Surface producer | `nonempty_postCardElevenRobustSurface_of_robust` at `ExactFourRobustCapExpansion.lean:250`.  The maintained closure matrix records a Lean 4.27 build with axioms exactly `propext`, `Classical.choice`, and `Quot.sound`.  This is a source-clean refinement, not a terminal. |

Import direction into the anchor is:

```text
OriginalUniqueFourResidual
  -> ExactFourPhysicalConsumer
  -> ExactFourRobustCapExpansion
  -> FrontierLiveClosure
```

The namespace `ATailUniqueArmRouteAuditScratch` is therefore not evidence that
the residual is still an unimported scratch dependency.

## Deduplicated route-family inventory

### 1. Promoted card-eleven certificate and its old scratch copies

**Paths.** `scratch/atail-force/card11-production-promotion`,
`unique-arm-route-audit`, `unique-arm-post-card11-coordinator`,
`unique-arm-whole-carrier-source-audit`, and the `unique4-aligned-p5-*`,
`unique4-exact-two-*`, `unique4-p4-*`, `unique4-kalmanson-*`,
`unique4-late-choice-terminal`, `unique4-n11-source-lift`,
`unique4-selected-class-curvature-adapter`, and
`unique4-source-field-audit` families.

**Strongest result.** The promoted production chain closes the exact
card-eleven certificate branches.  The generic Kalmanson terminal
`false_of_one_k1_three_cyclic_selected_rows` is now production code at
`CardElevenUniqueFourCertificate/Support/Unique4KalmansonCorePort/UniqueFourKalmansonCores.lean:141`.

**Status.** **KERNEL-CURRENT** for the promoted production declarations;
older scratch copies are dominated and can be stale.  LRAT/DRAT and valuation
artifacts before promotion are only **EXACT-WITHIN-MODEL**; promotion plus
kernel replay is the trust boundary.  The required profile permits
`native_decide`/`Lean.trustCompiler`; no historical or vendor dependency is
needed.

**Why it does not close this anchor.** The certificate consumes exact
cardinality eleven, whereas the anchor assumes at least twelve.  The reusable
cardinality-independent item is the Kalmanson `False` terminal; its missing
premise is a source-level occurrence of the prescribed three-row cyclic
cross-incidence pattern.  This family dominates all unpromoted card-eleven
P4/P5/exact-two replays, but not that occurrence problem.

### 2. Five-way robust large-radius continuation

**Path.**
`scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:637-687`
and `card12-robust-terminal-audit`.

**Strongest result.**
`nonempty_exactFourPostCardElevenRobustContinuation` normalizes the surface
into five constructors:

1. surplus cap at least six plus a second-apex five-point radius reduction;
2. first-opposite-cap growth plus a five-point reduction;
3. second-opposite-cap growth plus a robust parent, frontier-coupled common
   deletion, and exact-five common-deletion successor;
4. the same growth plus an exact-five physical omission-cycle normal form; or
5. two distinct second-apex radii plus the first-cap profile.

**Status.** **SOURCE-NORMALIZATION, CURRENT SOURCE UNREBUILDABLE**.  Fresh Lean
4.27 fails at import time because the scratch
`card_five_interior_survivor_pair` and its promoted production copy declare
the same namespace object.  A cached olean or the fact that the text contains
no `sorry` is not a current-source check.

**Missing item.** None of the five constructors has a checked consumer to
`False`.  Constructors 3 and 4 additionally cross into exact-five data whose
canonical source is not aligned with the exact-four ingress source.

**Dominance.** This subsumes the separate robust-completion and radius-choice
normal-form directories as a case census.  It must not be promoted as five new
frontier leaves: it expands one loud obligation to five unterminated
obligations without a matching narrowing-to-terminal argument.

### 3. Exact card-twelve, card-at-least-fourteen, and faithful-row escape

**Paths.** `card12-robust-terminal-audit`,
`cardge14-current-frontier-import-wire-audit`, `full-geometry-producer`,
`cap-five-apex-rigidity`, and `unique4-uniform-route-audit`.

**Strongest results.**

- `both_opposite_apices_distinct_K4_radii_force_card_ge_fourteen` yields only
  `14 ≤ D.A.card`; its distinct-radius premise conflicts with the first-apex
  unique-radius residual.
- Exact-card-twelve profile classifiers choose an apex/profile but do not
  prove `False`; some require an exact-five first-apex selected class, which
  conflicts with the retained exact-four class.
- Faithful-carrier escape theorems for canonical cap profiles are axiom-clean
  but only produce row escape.
- `carrier_card_ge_eleven` proves the useful lower bound `11 ≤ D.A.card`.

**Status.** Cap-five/card-twelve classifiers and faithful-row escape have
current or recorded **KERNEL-CURRENT** checks in the dated audits.  The uniform
lower bound is **KERNEL-RECORDED**.  None is terminal.

**Missing item.** An upper bound or a source theorem converting row escape
into prescribed two-point incidence.  The conjectural
`OriginalUniqueFourResidual F -> D.A.card ≤ 11` would close the anchor but is
not present.  Lower bounds, exact-card profiles, and row escape do not supply
it.

### 4. Current physical common-deletion ingress

**Paths.** Production `ExactFourPhysicalConsumer.lean`,
`common-deletion-multicenter-search`,
`card12-frontier-common-deletion-alignment`, and
`frontier-coupled-two-four-radius-consumer`.

**Strongest positive result.** The surface retains a real two-center packet:
one deletion, one late blocker, and the physical second apex, with K4 survival
data at both centers.  The current production refinement additionally proves
that all outside sources which block deletion of both source-valid strict
first-cap points share one actual late blocker, and that a fixed positive
second-apex radius contains at most one such bad strict-cap source.  Hence a
five-point second-apex radius contains an actual strict second-cap source for
which deleting `R.interior_q` or `R.interior_w` preserves K4 at that source's
late blocker.

**Strongest negative result.** The freshly checked
`FrontierCommonDeletionAlignmentObstruction.lean` proves
`firstApexDouble_blocked_of_originalUniqueFour`,
`no_same_frontier_commonDeletionParentResidual`, and
`no_late_frontier_commonDeletionParentResidual`.

**Status.** Production ingress and the new interior-pair source extraction are
**KERNEL-CURRENT** under Lean 4.27.  The obstruction is **NEGATIVE-KERNEL**.
Bare three/four-center enumerations are only finite checks or specifications
unless separately listed below.

**Precise gap.** The five-point-radius arm now supplies one of the two needed
source-valid interior deletions, but no checked terminal yet converts that
survival packet into the required cyclic three-row occurrence.  In the other
radius-classification arm, production now retains two disjoint exact
four-point second-apex rows, each with at least two strict second-cap members;
the extremal coupling of those four candidates remains open.  Reusing the
original frontier pair is not merely unproved: deleting both exact-four class
points leaves too few points at the first apex, while the desired successor
requires survival.

**Dominance.** This negative theorem kills every plan that wires the existing
original or late frontier directly to the exact-five common-deletion
successor.

### 5. Protected-deletion global coupling and minimal cores

**Paths.** `unique4-global-coupling`,
`unique4-singleton-core-terminal`, `unique4-escape-localization`, and
`unique4-robust-global-terminal`.

**Strongest result.**
`exists_strictCap_collision_or_singletonCore_or_packedCore` at
`UniqueFourGlobalDeletionCoupling.lean:515` deletes the exact class together
with protected Moser vertices and returns:

- an equal-radius collision with a robust omitted center;
- a singleton `MinimalDeletionCore`; or
- a nontrivial disjoint-shell core with
  `2 * V.card ≤ complement-cap.card`.

The smallest singleton continuation installs the core as an actual center and
can feed `nonempty_singletonCoreOutsidePairIngress`.
`false_of_hasSameCapActualRowRepeat` is a checked conditional terminal.

**Status.** **KERNEL-RECORDED SOURCE-NORMALIZATION**; not freshly rebuilt in
this shared run.  The scratch modules are not production imports.

**Precise gap.** The singleton terminal additionally needs
`ExactTwoStrictHitDistribution R` and a `HasSameCapActualRowRepeat`: a second
distinct installed center in the same cap whose actual row contains both
outside points.  The packed and collision arms likewise lack a prescribed
cross-occurrence consumer.

**Dominance.** This is the strongest general protected-deletion case split and
subsumes the weaker escape/localization normal forms.  It does not dominate
the production surface, because it does not use the physical two-center
ingress or the complete second-apex radius classification.

### 6. Strict-pair minimal deletion and equal-radius arm

**Paths.** `unique4-strict-pair-minimality`,
`unique4-equal-radius-terminal`, and
`unique4-aligned-interior-closure-audit`.

**Strongest result.**
`exists_strictPair_singleton_or_equalRadius_or_distinctRadius` at
`UniqueFourStrictPairMinimality.lean:305` gives:

- a singleton minimal-deletion core;
- deletion of the whole pair at one equal radius, with a fresh first-cap
  center, a class and cap of cardinality at least five, and robustness; or
- deletion of the whole pair at distinct radii, with a robust two-shell core.

`false_of_equalRadius_pair_of_firstOppCap_card_eq_four` closes only when the
physical first opposite cap has cardinality exactly four.
`false_of_secondFirstCapCenter_bisecting_outsidePair` is the smallest
equal-radius conditional terminal.

**Status.** **KERNEL-RECORDED SOURCE-NORMALIZATION**; no fresh rebuild in this
run.  `strictPairMinimalDeletion_center_ne_secondApex` is a checked
localization statement, not a terminal.

**Precise gaps.**

- Exact radius-class cardinality four is not physical cap cardinality four, so
  the first conditional terminal cannot fire from the current surface.
- The second terminal needs a distinct second center in the first cap
  bisecting the extracted outside pair.  Equivalently it needs another actual
  row in that cap containing both outside points.
- `not_both_outsidePoints_mem_actualRow_of_center_mem_firstCap` is an
  avoidance theorem; it does not produce that row.

**Dominance.** This is the best local branch decomposition of the protected
pair.  It exposes the same missing two-point cross-occurrence as the global
coupling route.

### 7. Multicenter occurrence and the production Kalmanson terminal

**Paths.** `unique4-multicenter-occurrence`,
`unique4-three-row-occurrence-producer`,
`unique4-three-row-placement-source-audit`,
`unique4-cross-incidence-occurrence`,
`unique4-complete-radius-spine-bridge`,
`row-triangle-connectivity-audit`, and the promoted
`UniqueFourKalmansonCores.lean`.

**Strongest producers.**

- `exists_three_actualCenters_with_exact_rows` produces the first-apex exact
  row and two distinct outside blockers with their actual critical rows.
- `singletonCore_installs_strictCap_actualCenter` can install one
  singleton-core center/row.
- Faithful-carrier closure gives one-point row-connectivity and prescribed
  row escape.

**Strongest terminal.**
`false_of_one_k1_three_cyclic_selected_rows` is a production,
cardinality-independent Kalmanson contradiction for three
`SelectedFourClass` rows and six prescribed cross-memberships in cyclic
order.

**Status.** Terminal: **KERNEL-CURRENT**.  Producers:
**KERNEL-RECORDED**.  Finite connectivity models are
**NEGATIVE EXACT-WITHIN-MODEL** evidence against deriving the required
two-point pattern from closure/connectivity alone.

**Precise gap.** Existing producers retain only each source's membership in
its own row.  They do not prove the six cross-memberships and the compatible
cyclic ordering required by the terminal.  The current physical ingress gives
two particularly meaningful rows, but still no prescribed cross-incidence.

**Dominance.** This is the highest-leverage route family: the terminal is
already production, generic in carrier cardinality, and independent of the
card-eleven certificate.  All three-row, row-triangle, and occurrence audits
reduce to the same positive source bridge.

### 8. Four-turn / corrected-curvature occurrence

**Paths.** `unique4-turn-disjoint-source-occurrence`,
`unique4-corrected-curvature-schema`,
`unique4-robust-provenance-curvature`,
`unique4-turn-disjoint-p4`,
`unique4-turn-disjoint-radius-generalization`,
`unique4-global-k4-curvature-packing`, and
`unique4-occurrence-feasibility`.

**Strongest terminals.** Recorded axiom-clean theorems include
`false_of_fourTurnDisjointSelectedRowArcs`,
`false_of_fourTurnCoveringSelectedRowArcs`,
`false_of_fourTurnDisjointLeftSelectedRows`, and the exact-two variant.
Corrected-curvature decoders also reject particular recorded patterns.

**Status.** Terminals and decoders are **KERNEL-RECORDED**.  Exact cyclic
searches found satisfiable coarse row systems with global K4, the `2+1+1`
distribution, strong connectivity, and scalar curvature while avoiding the
target occurrence.  These are **EXACT-WITHIN-MODEL**, not Euclidean
counterexamples.

**Precise gap.** No source theorem produces the turn-disjoint/covering packet
or the corrected cyclic placement from the robust surface.  Pure cap counts,
row connectivity, and scalar curvature are insufficient in the audited
finite abstractions; a successful bridge must use stronger Euclidean metric,
MEC, deletion-robustness, or physical-ingress data.

**Dominance.** This is a second terminal vocabulary for the same aggregate
occurrence bottleneck.  It is less attractive than the already-promoted
three-row Kalmanson terminal unless the surface's complete radius
classification naturally produces four turns.

### 9. Carrier closure and descent

**Paths.** Production `P97/U1CarrierInjection.lean:1427`,
`P97/Descent.lean:27`, `unique4-uniform-route-audit`, and
`row-triangle-connectivity-audit`.

**Strongest results.**

- `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed` proves that a
  nonempty carrier subset closed under every selected support equals the whole
  carrier.
- `descent_contradicts_minimality` proves `False` from a genuinely smaller
  nonempty convex set having the global `HasNEquidistantProperty 4`.

**Status.** Production theorems are **KERNEL-CURRENT**, but no current
strict-pair or protected-deletion theorem supplies their premises.

**Precise gaps.**

- Strict-pair blocking is local at one center after deletion; it does not
  construct a smaller set with global K4.
- No route constructs a nonempty closed support set of cardinality at most
  eleven.  `exists_row_escape_of_proper_subset` says exactly why an arbitrary
  proper set is insufficient.
- Connectivity obtained from closure is only one-point reachability, not the
  ordered two-point row incidence needed by the Kalmanson terminal.

**Import warning.** Importing `Descent` into the production anchor is not an
independent closure route: `Descent` imports the removable-vertex layer, whose
continuation reaches `U1LargeCapRouteBTail`, and that layer reaches
`FrontierLiveClosure`.  This would be circular for the anchor even before the
missing global-K4 premise is addressed.  Any useful descent producer must be
factored into an upstream-safe module.

### 10. MEC, retriangulation, and local Euclidean terminals

**Paths.** `unique4-mec-terminal`, `unique4-mec-interior-eliminator`,
`unique4-mec-all-boundary-terminal`, `unique4-mec-interior-geometry`,
`unique4-retriangulation-terminal`, and
`unique4-mec-terminal-pathfinder`.

**Strongest result.** Fresh-center MEC localization gives the checked
alternative “strictly inside the MEC or four boundary points,” together with
cap-location refinements.

**Status.** Localization is **KERNEL-RECORDED SOURCE-NORMALIZATION**.
The proposed local retriangulation implication has a negative audit; the full
global theorem and MEC-interior eliminator remain **CONJECTURAL**.

**Precise gap.** Exclude the MEC-interior arm or derive a prescribed
cross-row/cyclic occurrence using the full global deletion and radius data.
Local quadrilateral/retriangulation facts alone do not do so.

### 11. Two-radius normal forms and coupled frontier wrappers

**Paths.** `two-radius-bank-audit`,
`unique4-robust-cap-expansion/ExactFourTwoRadiusSuccessorNormalForm.lean`,
`frontier-coupled-two-four-radius-consumer`, and production
`OrientedPhysicalApexIngress.lean`.

**Strongest result.**
`nonempty_exactFourTwoRadiusNoFiveNormalForm` is axiom-clean in its recorded
olean, but the bare normal form has no consumer.  A different production
coupled residual already has exactly the fields needed to call
`false_of_criticalPairFrontier`.

**Status.** Bare producer: **KERNEL-RECORDED SOURCE-NORMALIZATION**.  The
coupled adapter reaches `False` only through the existing frontier closer,
whose axiom closure contains `sorryAx`; this is coordinator bookkeeping, not
an independent terminal.

**Precise gap.** The bare normal form lacks `CriticalPairFrontier`,
minimality, no `IsM44`, the first-apex rich-class lower bound, and the
large-first-cap coupling.  In the fully coupled type there is no missing
field—the missing work is exactly the downstream live frontier leaves.

### 12. Exact-four / exact-five source alignment

**Paths.** `exact-four-exact-five-source-alignment-audit`,
`unique4-robust-cap-expansion`, the exact-five common-deletion and
large-cap omission-cycle families, and card-13/card-14 solver gates.

**Strongest result.** Exact-five continuation/cycle packages have their own
fixed source, common critical-shell system, and canonical cycle
normalization.

**Status.** The source audit is negative.  Fixed-card solver cores are
**EXACT-WITHIN-MODEL** where checked; relevant coverage jobs reported
`UNKNOWN`.  There is no Lean coverage theorem.

**Precise gap.** The exact-four ingress source is not definitionally or
provably the canonical exact-five source.  The current surface retains a
radius classification, not an exact-five physical profile, continuation,
cycle, or common critical-shell system.  Even equality with a canonical cycle
start needs a new source-normalization theorem.

**Dominance.** This rules out treating exact-five card-13/card-14 artifacts or
three/four-center exact-five producers as current-anchor consumers.  They are
wrong-branch evidence until an explicit source bridge is proved.

### 13. Swapped exact-four and other live frontier branches

**Paths.** Production `FrontierLiveClosure.lean:106` and scratch
`unique4-source-closer`, swapped-frontier, and robust-completion directories.

**Strongest result.** The production physical consumer splits card-at-least-12
exact four into robust and swapped protected exact-four outcomes.

**Status.** **KERNEL-CURRENT coordinator**, with two direct live terminals.

**Why it does not close this anchor.** The swapped terminal consumes the
swapped constructor; it cannot be applied to the robust-only surface.
`unique4-source-closer` and older physical-outcome packages are dominated by
the production consumer.  A theorem assuming both robust and swapped data is
strictly stronger than the current constructor and therefore conditional
bookkeeping.

### 14. Direct-false and theorem-bank searches

**Paths.** `unique4-direct-false`, `unique4-robust-o2-terminal`,
`unique4-source-closer`, `common-deletion-multicenter-search`, and the
registered theorem-bank inventories in `certificates/` and
`docs/general-n-certificate-bank-mining-2026-07-09.md`.

**Result.** No exact-signature, import-acyclic, axiom-clean theorem sends
`ExactFourPostCardElevenRobustSurface R` to `False`.  Existing general-n U5
families need row-slot/metric-shadow realizations; the finite-n families are
fixed n=9; common-deletion terminals need named multicenter incidence.

**Status.** Negative source/theorem-bank audit.  Separate finite boundary or
row-system models refute only weakened abstractions, not the full Euclidean
residual.

**Precise gap.** A realization theorem from the current source fields to one
of the checked generic terminal packets.

## Ranked closure routes

### Rank 1 — physical-ingress-to-Kalmanson occurrence

Use the surface, not merely the older residual:

1. retain the first-apex exact selected row from `R`;
2. obtain rows at the ingress late blocker and physical second apex from the
   common-deletion packet and its K4 survival data;
3. prove a cyclicly ordered four-source subconfiguration whose three rows
   satisfy the six cross-memberships of
   `false_of_one_k1_three_cyclic_selected_rows`; and
4. apply that production terminal directly.

The exact open premise is the positive aggregate occurrence in step 3.
One-source-per-own-row, row escape, strong connectivity, and cap counts are
not substitutes.  The common-deletion alignment obstruction forbids choosing
the old frontier pair as the common pair after deleting both exact-class
points, so the occurrence theorem must permit fresh witnesses.

This is preferred because it uses the newly retained physical ingress, has a
production cardinality-generic terminal, and does not expand into five
unterminated robust cases.

### Rank 2 — strict-pair/protected-core branchwise occurrence

Use the strict-pair or global protected-deletion producer to obtain the
singleton/equal/distinct or collision/singleton/packed branches.  For each
branch prove a two-point same-cap row repeat or a Kalmanson/turn occurrence.
The exact missing positive lemmas are:

- a second distinct first-cap center bisecting the equal-radius outside pair;
- `HasSameCapActualRowRepeat` in the singleton arm; and
- an aggregate cross-row occurrence from the distinct/packed shell arm.

This route has strong source-faithful normal forms but currently ignores much
of the surface's physical-second-apex classification and has no complete set
of consumers.

### Rank 3 — repair and consume the five-way robust continuation

First replace the scratch/production duplicate imports so the current source
builds.  Then, before promotion, supply a checked terminal for every one of
the five constructors.  The exact-five constructors additionally require an
honest exact-four-to-exact-five source normalization.  This is a conditional
fallback, not the next slice: import repair alone is cosmetic and the
five-constructor fan-out is presently worse than the one-leaf frontier.

### Conditional only

- A source-proved upper bound `D.A.card ≤ 11`.
- A nonempty support-closed carrier subset of cardinality at most eleven.
- An upstream-safe removable-vertex or smaller-global-K4 theorem.
- Exact physical first-opposite-cap cardinality four for the strict-pair
  equal-radius terminal.
- MEC-interior elimination using global data.
- A source-level reduction to one of the exact card-12/13/14 finite encodings.

### Dead or dominated as presently stated

- Reuse of the original/late frontier pair in the common-deletion successor:
  **NEGATIVE-KERNEL**.
- Applying card-eleven certificates at cardinality at least twelve.
- Treating lower bounds `11 ≤ card` or `14 ≤ card` as an upper-bound closure.
- Importing `Descent` underneath this anchor.
- Exact-five cycle/gate results without an exact-four source alignment.
- Applying the swapped exact-four terminal to the robust constructor.
- Promoting conditional closers or the five-way continuation as if they were
  terminal progress.
- Re-running coarse connectivity/curvature SAT searches without adding a
  Euclidean or physical-ingress constraint absent from the known models.

## Recommended next proof slice

The first source-realization step is production and checked:
`interiorPairGood_or_twoDistinctExactFourInteriorRows` exhaustively refines the
surface's radius classification.  Its five-point arm now retains the positive
radius, the class-cardinality lower bound `5 ≤ card`, a strict second-cap
source outside the first-apex fiber, and a surviving deletion of
`R.interior_q` or `R.interior_w` at that source's actual late blocker.  Its
other arm retains two disjoint exact four-point rows, the global absence of a
five-point positive class, and at least two strict second-cap members in each
row.

`FrontierLiveClosure.lean` consumes this disjunction in a checked coordinator.
The first branch has now been narrowed one checked step further.
`actualLateRow_secondClassInterior_card_le_two` proves that the source's
actual late row contains at most two points in the strict second-cap part of
its physical radius class.  Indeed, one further hit beside the source
localizes the late blocker to the second cap, after which three total hits
would contradict the ordered-cap two-point row bound.  The checked wrapper
`false_of_exactFourPostCardElevenInteriorDeletionBranch` therefore dispatches
to the sole remaining leaf
`false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch`.

That leaf preserves the named radius, five-point lower bound, source, and
surviving deletion while adding the proved late-row intersection bound.  Its
next terminal incidence must therefore come from another row or blocker
fiber, rather than from three hits in the source's own late row.  Packaging
the surviving deletion at the late blocker together with second-apex
deletion robustness is still useful normalization, but a
`CommonDeletionTwoCenterPacket` alone does not close the branch.

The mathematical content still required across the two branches is:

> From `OriginalUniqueFourResidual F`, `12 ≤ D.A.card`, and
> `ExactFourPostCardElevenRobustSurface R`, use either the surviving
> interior-deletion source in the five-point arm or the four strict-cap
> candidates in the two-distinct-radii arm to construct four cyclicly ordered
> carrier sources and three selected four-classes satisfying the six
> cross-memberships required by
> `false_of_one_k1_three_cyclic_selected_rows`; alternatively, feed every
> exceptional cyclic-order case to another already checked terminal.

The radius classification enters through the checked normal form.  Each
remaining proof must show where the cap-growth witness enters, must not erase
the named surviving deletion in the five-point arm, and must avoid the
provably impossible original-frontier common-deletion alignment.  A theorem
using only `R` would merely revisit the older multicenter audit.

Do not promote a proposition-valued package, a `...Closers` structure, or a
case enumerator by itself.  The new lemma must be a loud Lean obligation,
wired to this anchor and the publish target in the same change, and its
exceptional arms must each feed checked terminals.

## Coordinator-interface frontier

**Before this audit.**

- Chosen granularity: one direct robust terminal.
- Immediate constructor fan-out at the anchor: one
  `ExactFourPostCardElevenRobustSurface`.
- Loud obligations in this anchor slice: exactly one,
  `false_of_exactFourPostCardElevenRobustSurface`.
- The separate swapped constructor is a sibling production obligation, not a
  subcase of this anchor.

**After the implementation checkpoint.**

- `ExactFourRobustCapExpansion.lean` adds the checked common-blocker,
  per-radius bad-source bound, five-point interior-deletion extraction, and
  exhaustive radius normal form.
- `FrontierLiveClosure.lean` directly consumes that normal form before its
  existing terminal obligation, so the new work is on the publish spine.
- Chosen granularity remains one direct robust terminal.
- Immediate constructor fan-out remains one.
- Loud obligations in this anchor slice remain exactly one.
- No `sorry` was closed and no source-normalization producer has been
  reclassified as a terminal.

**After the branch decomposition checkpoint.**

- The direct robust-surface `sorry` has been replaced by a checked case
  coordinator consuming both constructors of the radius normal form.
- Chosen granularity is two branch-specific terminal obligations.
- Immediate constructor fan-out is two.
- The load-bearing leaves are
  `false_of_exactFourPostCardElevenInteriorDeletionBranch` and
  `false_of_exactFourPostCardElevenTwoRadiusBranch`.
- The first leaf is strictly narrower by a named positive radius, a
  five-point class lower bound, a strict-cap source outside the first-apex
  fiber, and one named surviving interior deletion.
- The second leaf is strictly narrower by two distinct positive radii, exact
  cardinality four at both radii, no positive five-point class, disjoint
  selected supports, and two strict-cap members in each class.
- Both leaves are called immediately by the checked parent and therefore
  remain transitively consumed by the publish target; no orphan obligation
  was introduced.
- The active work cursor is the interior-deletion branch.  Closing it reduces
  this coordinator frontier from two leaves to one.
- Do not adopt the existing five-way continuation until all five arms have
  terminal consumers and the current import collision is removed.

**After the bounded-cross-incidence checkpoint.**

- `actualLateRow_secondClassInterior_card_le_two` is a source-clean checked
  producer: it eliminates every configuration with three physical
  strict-second-cap hits in the active source's actual late row.
- The former interior-deletion leaf is now a checked one-child coordinator.
  Its sole load-bearing child is
  `false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch`.
- The child is strictly narrower by the proved intersection bound
  `lateRow.support ∩ (physicalRadiusClass ∩ strictSecondCap) ≤ 2`; the parent
  proves that bound before calling it.
- Chosen granularity and immediate fan-out at the robust-surface coordinator
  remain two: the bounded-cross-incidence leaf and the two-distinct-radii
  leaf.  The interior-deletion subcoordinator has immediate fan-out one.
- The direct `sorry` count in this slice remains two.  No new orphan or
  compatibility-only obligation was introduced, and no normalization packet
  is being counted as a terminal.
- The active work cursor moves to the bounded-cross-incidence leaf.  The
  three-hit route is closed; the remaining bridge must force a second-row
  cross-incidence, a useful blocker-fiber coincidence, or a compatible
  ordered-row terminal.

**After the omitted-peer checkpoint.**

- `exists_omittedSecondClassInteriorPeer` is a source-clean checked producer.
  The five-point physical radius class has at least three strict-second-cap
  members, whereas the active late row contains at most two of them, so it
  supplies a distinct strict-cap peer omitted from that row.
- Equality of the source and peer actual blockers would identify their
  canonical late supports.  Since the peer belongs to its own support, the
  omission proves that the two actual blockers are distinct.
- The former bounded-cross-incidence leaf is now a checked one-child
  coordinator.  Its sole load-bearing child is
  `false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch`.
- The child retains the positive radius, five-point class lower bound,
  source, outside-first-fiber membership, surviving interior deletion, and
  two-hit bound, and additionally names the omitted peer with its class,
  strict-cap, omission, and blocker-separation facts.
- Chosen granularity and immediate fan-out at the robust-surface coordinator
  remain two: the omitted-peer leaf and the two-distinct-radii leaf.  Both
  interior-deletion subcoordinators have immediate fan-out one.
- The direct `sorry` count in this slice remains two.  No orphan obligation
  was introduced, and neither the peer extractor nor its coordinator is
  counted as a terminal.
- The active work cursor moves to the omitted-peer leaf.  The next
  decomposition must use the peer's own late row, the distinct-blocker fact,
  or a compatible common-deletion/ordered-row terminal; merely repackaging
  those fields is not closure.

**After the mutual-omission checkpoint.**

- `actualLateRow_secondClass_card_le_two` strengthens the row bound from the
  strict-cap interior to the whole physical second-apex radius class.  Full
  deletion robustness keeps the physical apex distinct from every actual
  late blocker, so the generic two-circle intersection theorem gives the
  bound directly.
- `exists_mutuallyOmittedSecondClassPair` is a source-clean checked producer.
  The active row omits at least three of the five class points.  Two omitted
  peers suffice for a three-case argument using the whole-class two-hit bound
  on their rows, yielding two distinct class sources mutually absent from one
  another's actual late supports.
- Mutual omission gives both source-faithful cross-deletion survivals by
  `cross_deletion_survives_iff_not_mem_selected_support`.  Equality of the two
  actual blockers would identify their canonical supports and contradict
  either omission.
- The former omitted-peer obligation is now a checked one-child coordinator.
  Its sole load-bearing child is
  `false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch`.
  The child retains every preceding source, peer, and surviving-deletion
  field and additionally names the mutual pair, both omissions, distinct
  blockers, and both cross-deletion survivals.
- Chosen granularity and immediate fan-out at the robust-surface coordinator
  remain two: the mutual-omission leaf and the two-distinct-radii leaf.  Each
  nested interior-deletion coordinator has immediate fan-out one.
- The direct `sorry` count in this slice remains two.  No orphan or
  compatibility-only obligation was introduced.  This checkpoint closes the
  whole-class mutual-pair extraction, not the five-point branch itself.
- The active work cursor moves to the mutual-omission leaf.  The remaining
  bridge must turn the two reciprocal cross-deletion survivals into a
  compatible ordered-row, common-deletion, or geometric terminal; merely
  packaging them into an existing packet is not closure.

**After the contextual rigid-deletion checkpoint.**

- `ExactFourMutualOmissionSourceContext` now carries the strict-cap source and
  omitted peer into every rigid `2+2+1` continuation.  It retains the source
  row incidence and omissions, distinct source/peer blockers, the source's
  surviving original interior deletion, and the whole-class two-hit bound.
- In the `u ≠ source` arm,
  `exactFourRigid221_context_u_ne_source_normalForm` proves
  `Iu = {source,u}`, `sourceRow ∩ Iu = {source}`, and pairwise distinction of
  the source, `u`, and `v` actual blockers.
  `exactFourRigid221_context_u_ne_source_otherPlacement` confines `other` to
  `u`, the disjoint `v` block, or the distinguished singleton deletion.
- The former opaque
  `false_of_exactFourMutualOmissionRigid221_globalDeletion` obligation is now
  a checked exhaustive coordinator.  Its immediate children are exactly the
  physical-apex leaf, the nonphysical equal-radius-collision leaf, and the
  nonphysical pairwise-distinct-radius minimal-core leaf.
- The narrowing measure is explicit geometry plus center role.  Every child
  keeps the complete parent and source context, all three are consumed by the
  same production coordinator, and the split is acyclic.  No first-apex
  exact-five result is used.
- At this coordinator the interface frontier changes from one opaque leaf to
  three immediate leaves, so its direct `sorry` count changes from one to
  three while the former parent `sorry` closes.  The robust-surface
  coordinator still has two immediate branches; its transitive open frontier
  is now these three leaves plus the independent two-radius leaf.
- The current source, including the contextual normal forms, passed a fresh
  Lean 4.27 target build and proof-blueprint resync at build `756df77dbd52`.
  This checkpoint is a strict decomposition, not closure of the five-point
  branch.

**After the source-`u` cross-row cap-shape checkpoint.**

- The former
  `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRowOther`
  leaf is now a checked coordinator.  It preserves the full physical-apex,
  source, mutual-omission, joint-deletion, and rigid-global-deletion packet.
- The chosen granularity is the number of points from each rigid two-point
  class row in the strict physical second-cap interior.  Sequential equality
  tests against two produce three exhaustive shapes: source-row-heavy,
  opposite-row-heavy after excluding source-row-heavy, and both rows sparse.
- The coordinator-interface frontier before this checkpoint was one opaque
  cross-row leaf.  Afterwards it is three immediate on-spine leaves, with
  fan-out three and raw direct-`sorry` delta `+2`.  The old parent `sorry` is
  proved; the mathematical branch is not closed.
- Every new leaf has strictly stronger parent-produced count constraints,
  keeps the original blocker-in-row and blocker-not-`v` hypotheses, and is
  consumed by the same production parent.  The decomposition is acyclic and
  introduces no scratch dependency, orphan, compatibility wrapper, or
  first-apex exact-five route.
- A focused Lean 4.27 target build and generated proof-blueprint resync passed
  at build `8aeaf16b2d2d`.  The generated anchor spine reaches exactly the
  three new leaves.

**After the source-heavy retained-peer placement checkpoint.**

- The former `..._sourceRowHeavy` leaf is now a checked coordinator.
  Production constructs named row companions `xu` and `xv`, exact traces for
  the two rigid rows, the exact physical class cover, the equality between the
  source blocker and `xv`, and the strict-interior equality for the source
  pair.
- The retained peer's physical-class membership and source-row omission reduce
  its placement exhaustively to the singleton deletion, `v`, or `xv`; the
  `u` and `xu` alternatives are refuted by the source-row omission.  The three
  immediate on-spine leaves are `..._sourceRowHeavy_otherDeleted`,
  `..._sourceRowHeavy_otherV`, and `..._sourceRowHeavy_otherXv`.
- The local coordinator-interface frontier changes from one opaque leaf to
  three placement leaves, with fan-out three and raw direct-`sorry` delta
  `+2`.  Consequently the enclosing cross-row frontier now has five
  transitive leaves: these three plus `..._oppositeRowHeavy` and
  `..._sparseRows`.
- Each placement equality is parent-produced, all original physical-apex and
  mutual-omission context is retained, and all children feed the same publish
  target.  The split is exhaustive, acyclic, and has no scratch or retired
  first-apex exact-five dependency.  It is a narrowing checkpoint, not closure.
- A focused Lean 4.27 target build and proof-blueprint resync passed at build
  `57ab73e8bc7e`.  The active anchor is the `other = xv` leaf, which makes the
  retained interior peer equal to the actual source blocker and is the direct
  ingress to the cap-profile and metric continuation.

**After the first-growth row-incidence checkpoint.**

- The production `sorry` in
  `false_of_exactFourRigid221_sourceHeavyOtherXv_firstGrowth_uXvMutualOmission`
  is proved.  The coordinator sequentially tests whether the selected `xv`
  row contains `xu`, then `v`, then the distinguished deleted point; the
  fourth branch is their relevant joint absence.
- The `xu`-present branch is the checked blocker-localization and
  strict-convexity contradiction.  In the `v`-present and deleted-present
  branches, the two-point row bound identifies the row traces as `{xv,v}` and
  `{xv,deleted}` respectively.  Each branch reindexes the rigid `2+2+1`
  decomposition and reconstructs the complete global-deletion and source
  context required by the existing blocker-`v` terminal.
- When neither `v` nor the distinguished deleted point is in the row, those
  points supply the existing two-distinct-joint-deletions terminal.  Hence the
  local direct-`sorry` delta is `-1`: no new leaf or scratch dependency was
  introduced.  The immediate case fan-out is four, while the transitive open
  frontier reuses the already-live blocker-`v` and two-deletion terminals.
- This closes the named source obligation and makes its first-growth packet
  dispatcher source-clean.  It does not close either reused terminal, so it
  is not yet closure of the enclosing robust exact-four branch.
- The focused Lean 4.27 target build passed and the edited module was freshly
  kernel-mined at build `7ebe91bbe100`; proof-blueprint reports the anchored
  theorem `[closed]` at its source/call-graph surface.  Live
  `#print axioms` nevertheless reports `sorryAx` through the reused
  blocker-`v` and two-deletion terminals.  Therefore this checkpoint removes
  the named source `sorry` and consolidates dependencies but does not meet the
  final trust-profile closure gate.  The project-wide `refs --check`
  separately reports four stale and thirteen never-mined symbols, so this
  checkpoint also makes no global graph-freshness claim.

**After the blocker-`v` cap-shape checkpoint.**

- The former direct `sorry` in
  `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV`
  is now a checked coordinator over two explicit row-interior counts.  It
  first tests whether the source row contributes two points to the strict
  physical-cap interior and, if not, whether the opposite row does.
- The exhaustive children are
  `..._blockerV_sourceRowHeavy`,
  `..._blockerV_oppositeRowHeavy`, and
  `..._blockerV_neitherRowHeavy`.  Every child preserves the complete
  blocker-`v` context and adds only count equalities or inequalities produced
  by the coordinator.  No child calls the parent.
- The coordinator-interface frontier changes from one opaque leaf to three
  immediate on-spine leaves.  Its fan-out is three and its raw direct-`sorry`
  delta is `+2`.  This is strict cap-shape decomposition, not a mathematical
  proof of the blocker-`v` contradiction.
- No scratch module, historical Lean tree, compatibility closer, or retired
  first-apex exact-five route is imported.  The active exact-four route is
  unchanged.
- The source-row-heavy coordinator additionally proves
  `P.v.1 ∈ S.capInteriorByIndex S.oppIndex2` from the rigid two-point row and
  two-center localization, then passes that fact into the live child.  The
  helper is production-wired and its live axiom audit contains only
  `propext`, `Classical.choice`, and `Quot.sound`.
- The focused Lean 4.27 target build and generated proof-blueprint resync
  passed at build `10e9a911642a`.  The refreshed parent spine reaches the
  three new `sorry` symbols, and live `#print axioms` reports `sorryAx`
  through them.  The active anchor is now the source-row-heavy child.
  Project-wide `refs --check` still reports four stale and thirteen
  never-mined symbols outside this focused module, so no global freshness
  claim is made.
- A direct-context audit isolates the remaining center mismatch.  Source
  omission supplies a four-point shell after deleting the source at
  `centerAt P.v`, and global deletion supplies one at `S.oppApex2`; the
  available no-four-point contradiction at the blocker requires center
  exactly `P.v`.  The joint-deletion packet proves these first two centers
  are not `P.v`, so the existing packets do not close any child merely by
  simplification.
- The smallest kernel-tested sufficient bridge is
  `dist P.v.1 P.other.1 = dist P.v.1 P.source.1`: it places the retained
  off-source-row peer on the source radius about `P.v` and contradicts the
  named-label exclusion for the source row.  The newly proved strict-cap
  membership of `v` does not itself imply this equality.  The next direct
  step must combine it with the rigid physical-class geometry to force this
  co-radial relation or another equivalent `P.v`-centered four-point terminal.

## Two-collision global route checkpoint (2026-07-27)

The current admitted direct bridge in the exact-four collision branch is
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`.
Its checked downstream wrapper
`exists_three_hit_of_two_collisionRows_capCross_normalForm` is not itself the
missing producer.  The exact disjoint collision packets already rule out both
sides of the bridge's conclusion:

- a rich-apex three-hit shell contradicts the checked two-circle intersection
  bound; and
- each of the four named cross hits contradicts the checked exact cap-pair
  omissions.

This is proved source-clean in
`scratch/packet-contradiction-search/TargetConclusionImpossible.lean`.
Accordingly, the admitted theorem is logically a direct contradiction from
its global hypotheses, followed by `False.elim`; attempting to manufacture
its conclusion from the local packet alone is the wrong proof shape.

The concrete route has the following components.

1. Tri-apex richness gives deletion robustness at all three Moser apices, so
   the finite blocker endomap omits three pairwise-distinct values.  Applying
   `third_fiber_or_larger_known_fiber_of_three_omissions` from
   `scratch/exact-four-three-omitted-counting/ThreeOmittedMultiplicity.lean`
   to the two named collision pairs gives the exhaustive sharp split:
   a third blocker-value collision, a third source in `P`'s blocker fiber, or
   a third source in `Pρ`'s blocker fiber.  The theorem checks under Lean 4.27
   and needs no cardinal assumption beyond finiteness.  Its report includes
   fixed-point-free examples proving that all three arms are necessary.
2. `collisionCrossHit_or_geometricMultiplicity` in
   `scratch/global-exact-four-prover/BlockerMultiplicityGeometry.lean`
   converts the three finite-map arms into strict geometric packets.  It
   gives either a requested named cross hit, a fresh third blocker fiber
   whose two sources lie in one another's canonical rows, or a larger-known-
   fiber packet whose two fresh points are exactly that four-shell's
   shell-minus-first-cap remainder and avoid the opposite collision pair.
   This theorem checks under Lean 4.27 with only `propext`,
   `Classical.choice`, and `Quot.sound`.
3. The existing global split is
   `cap-card-at-least-eight | cross-blocker-equality`.  On the cap-eight arm,
   the new acyclic production module
   `ATail/TwoCollisionGlobalProducer.lean` proves
   `exists_capSource_thirdCanonicalRow_omits_each_collisionPair`, producing a
   third source
   in the strict first indexed cap, outside the two collision pairs.  Its
   blocker is distinct from the two collision blockers and the two physical
   apices; its canonical shell has exactly four points, contains the source,
   and omits an endpoint of each collision pair.  The stronger packaged
   theorem
   `triApex_patterns_and_exists_capSource_thirdCanonicalRow_connector`
   retains this row together with all three rich-cap patterns.
4. The four blocker-equality arms cannot be discharged by local polarity
   rewriting: each equality yields a cross omission rather than one of the
   impossible target cross hits.  Moreover,
   `scratch/hard-branch-math/equality-arm-model.lean` gives an exact local
   metric model of the equality surface.  These arms must use global
   minimality and `noM44` to exclude the equality or transfer it to the
   cap-eight/terminal surface.
The cap-eight connector has now been extracted before the admitted bridge.
It replaces the scratch theorem's live-residual argument by the exact field
it uses, `FullyDeletionRobustAt D S.oppApex2`; its module therefore has no
dependency on `FrontierLiveClosure`.  The current proof prefix maps the
cap-eight side of `hcapEightOrCross` through this production theorem.  The
next extraction is the geometric multiplicity normalization in item 2.

The remaining mathematical bridge is positive geometric localization, not
counting:

- for a fresh third blocker fiber, place its mutually incident source pair in
  a second selected row or a rich strict-cap radius slice;
- for an enlarged known fiber, place the exact two-point off-cap remainder in
  a second row, align a remainder point with two points of a rich slice, or
  derive an MEC/full-filter contradiction;
- on the cap-eight arm, use the concrete third canonical row as the candidate
  alignment surface, while noting that its two cross-pair omissions alone do
  not link it to a normalized multiplicity packet;
- on each blocker-equality arm, prove the global exclusion/transfer described
  above.

The three-omission split and cap-eight connector are already wired through
the current production proof prefix.  The connector makes positive third-row
data available on spine, but does not by itself close the `sorry`.

The nine-role minimal-deletion theorem is no longer an asserted closure step.
Its fresh center and deletion set are not linked to either collision shell,
either exact off-cap remainder, or a rich strict-cap slice, and its
`MinimalDeletionCore` arm has no terminal consumer on this surface.

The cap-at-least-eight alternative cannot be closed by redesignating that cap
and invoking
`SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4`.  That theorem
requires `IsM44`, whereas the live residual explicitly rules out every
`IsM44` packet, and its conclusion concerns the designated surplus cap rather
than the indexed opposite cap.  This route is classified unavailable, not
pending.

## Reconciliation with maintained status

The human-maintained umbrella row is
`K-A-UNIQUE-PHYSICAL-SPLIT` in
`docs/closure-matrix-2026-07-09.md`.  Its radius-normal-form checkpoint and
the bounded-cross-incidence, omitted-peer, and mutual-omission checkpoints
below are maintained together: the surface producer and all one-child
interior-deletion coordinators are source-clean, both direct robust branches
remain open, and the five-way continuation is an intermediate normalization
rather than promoted terminal fan-out.

`docs/live-blueprint.md` is generated and was not edited.

## Literal-reference scratch census

As a completeness cross-check, the current literal signature search for the
anchor, surface, residual, or physical ingress finds 205 files under
`scratch/atail-force`: 136 Lean files, 48 `REPORT.md` files, two JSON files,
two other markdown files, and 17 other artifacts.  They occupy the following
79 top-level directories.  Every directory below is folded into one of the
route families above; a directory's presence here does not upgrade its
epistemic class.

```text
card11-production-promotion
card12-frontier-common-deletion-alignment
card12-robust-terminal-audit
cardge14-current-frontier-import-wire-audit
common-deletion-multicenter-search
exact-four-exact-five-source-alignment-audit
prefixed-p4-occurrence-closures
two-radius-bank-audit
unique-arm-post-card11-coordinator
unique-arm-route-audit
unique-arm-whole-carrier-source-audit
unique4-aligned-interior-closure-audit
unique4-aligned-p5-occurrence
unique4-aligned-p5-terminal
unique4-bisector-placement-bridge
unique4-class-cap-distribution
unique4-class-cap-terminal-audit
unique4-complete-radius-placement-audit
unique4-complete-radius-spine-bridge
unique4-corrected-curvature-schema
unique4-cross-incidence-occurrence
unique4-direct-false
unique4-equal-radius-terminal
unique4-escape-localization
unique4-exact-two-core-port
unique4-exact-two-lrat-ingress
unique4-exact-two-occurrence
unique4-exact-two-source-bridge
unique4-global-coupling
unique4-global-k4-curvature-packing
unique4-kalmanson-core-port
unique4-kalmanson-occurrence
unique4-late-choice-terminal
unique4-mec-interior-eliminator
unique4-mec-terminal
unique4-multicenter-occurrence
unique4-n11-source-lift
unique4-occurrence-feasibility
unique4-occurrence-metric-audit
unique4-p4-cegar6-occurrence-bridge
unique4-p4-critical-support-occurrence-bridge
unique4-p4-cyclic-alternation-occurrence-bridge
unique4-p4-direct-outer-occurrence-bridge
unique4-p4-direct-valuation
unique4-p4-kalmanson-occurrence-bridge
unique4-p4-mirror-cap-source-bridge
unique4-p4-mirror-outer-occurrence-bridge
unique4-p4-mirror-valuation
unique4-p4-occurrence-bridge
unique4-p4-prefixed-closures
unique4-p4-radius-partition-occurrence-bridge
unique4-p4-right-cap-source-bridge
unique4-p4-row-at-least-four-occurrence-bridge
unique4-p4-row-radius-occurrence-bridge
unique4-p4-source-bridge
unique4-p4-strict-unit-source-bridge
unique4-retriangulation-terminal
unique4-robust-cap-expansion
unique4-robust-completion-radius-choice
unique4-robust-global-terminal
unique4-robust-o2-terminal
unique4-robust-provenance-curvature
unique4-singleton-core-terminal
unique4-singleton-repeat-producer
unique4-source-closer
unique4-source-field-audit
unique4-star-producer
unique4-strict-pair-minimality
unique4-surplus-pair-producer
unique4-swapped-global-terminal
unique4-swapped-terminal
unique4-three-row-occurrence-producer
unique4-three-row-placement-source-audit
unique4-transition-bank-match
unique4-turn-disjoint-curvature-terminal
unique4-turn-disjoint-source-occurrence
unique4-two-completion-row-placement
unique4-u5-bank-ingress
unique4-uniform-route-audit
```

The broader non-literal screens additionally covered the registered sibling
and legacy theorem banks, exact-five common-deletion/cycle producers,
faithful-carrier closure, descent, and the removable-vertex import chain.
