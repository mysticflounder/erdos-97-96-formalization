# R actual-blocker transition: source/target manifest

Date: 2026-07-15

Status: **SOURCE CLASSIFIER, ERASED-BLOCKER SUCCESSOR, SOURCE-ANCHORED
FULL-PARENT ENTRY, LEAST-HIT TERMINAL PAYLOAD, AND SOURCE-EXACT MINIMAL BLOCKER CYCLE PROVEN;
TERMINAL-HIT / ERASED-CYCLE EXCLUSION CONJECTURED.**

This manifest is the fail-closed gate for the first-apex double-survival (`R`)
arm under the full `DoubleApexOffSurplusSharedRadiusPair` parent. It fixes the
source object, required successor provenance, and regression obligations before
any new solver encoding or recursive transition theorem is admitted.

## Source object

Start with a concrete `CriticalPairFrontier F` and an oriented
`AmbientRobustHistoryPair P` whose source `P.x` lies in strict `oppCap1`. Let

```text
b := H.centerAt P.x P.x_mem_A
```

be the actual blocker chosen by the same retained `CriticalShellSystem H`.
The source is not an anonymous continuation row and `b` is not a freely chosen
critical center.

The current checked surface supplies:

| Field | Status | Source |
|---|---|---|
| `P.x != P.y` | PROVEN | `AmbientRobustHistoryPair.x_ne_y` |
| both points are in `D.A`, co-radial at `S.oppApex1`, and off `S.surplusCap` | PROVEN | fields of `AmbientRobustHistoryPair` |
| simultaneous deletion of the pair preserves K4 at both opposite apices | PROVEN | `first_double`, `second_double` |
| the oriented source is strict `oppCap1` | PROVEN | `exists_strictSource_orientation_with_transition_split` |
| `b` is a carrier point and differs from both opposite apices | PROVEN | critical-shell center membership plus deletion-survival blocker inequalities |
| `b = S.surplusApex` or `b` lies in one strict cap interior | PROVEN | `surplusApex_or_exists_capInterior_of_ne_oppositeApices` |

## Exact one-step quotient

Exactly one of the following source branches is available.

### HIT

```text
P.y is in the selected support at b
b is outside the closed surplus cap
dist b P.x = dist b P.y
signedArea2 P.y S.oppApex1 b * signedArea2 P.x S.oppApex1 b < 0
```

The cap split refines to `b = S.surplusApex`, strict `oppCap1`, or strict
`oppCap2`. The radius equality is for the current mate `P.y`; no theorem makes
that mate a named cap endpoint.

### OMISSION

```text
P.y is not in the selected support at b
HasNEquidistantPointsAt 4 (D.A.erase P.y) b
dist b P.y != dist b P.x
```

The full apex/strict-interior cap split remains possible. In particular,
reusing `P.y` as the endpoint-radius witness is invalid in this branch.

The exact quotient is kernel-checked in
`ActualBlockerCapMetricClassifier.lean` as:

```text
AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
AmbientRobustHistoryPair.exists_strictSource_actualBlocker_capMetricClassifier
```

The second theorem keeps the explicit original-or-swapped orientation and
places the routed source in strict `oppCap1`. Both declarations depend only on
`propext`, `Classical.choice`, and `Quot.sound`; the file has no `sorry`,
`admit`, custom axiom, or `native_decide`.

The complete live parent telescope reaches the production frontier and its
`FirstApexSplit` through the separately checked
`r-full-parent-entry/RFullParentEntry.lean` theorem
`fullParent_extracts_criticalPairFrontier_firstApexSplit`, with the same three
axioms. This is source extraction, not closure of either split arm.

`RFullParentOrbitEntry.lean` now closes the remaining adapter edge. Its checked
theorem

```text
fullParent_extracts_firstApexUnique_or_sourceFaithfulROrbit
```

returns either the unchanged `FA-UNIQ4/FA-UNIQ5` radius-uniqueness arm or the
complete R state: terminal carrier, retained ambient erasure history, a robust
pair satisfying the explicit anchor `P.x = F.pair.q`, and exactly one of the
least-entry terminal payload or the source-exact minimal erased cycle. The
source equality is part of the theorem output; the orbit cannot silently start
from an unrelated erased pair, and a bare terminal-hit existential is no
longer exposed by the full-parent endpoint. Both new entry theorems use only
the three core axioms.

## Exact successor-preservation split

The retained descent object includes
`Hhist : RobustPairedErasureHistory D S D.A C`. The checked file
`ActualBlockerRobustSuccessor.lean` restores the named-source provenance that
the older existential export forgot:

```text
exists_ambientRobustHistoryPair_with_source_of_erased

AmbientRobustHistoryPair.
  actualBlocker_mem_terminalCarrier_or_robustSuccessor
```

For the actual blocker `b`, the second theorem proves exactly:

```text
b ∈ C
or
∃ rho' P' : AmbientRobustHistoryPair D S C rho', P'.x = b.
```

Thus every co-radial, off-surplus, and two-apex double-survival field is
already reconstructed on the erased-blocker branch. The open preservation
problem is not universal: it is the terminal-carrier branch `b ∈ C`, while
the erased branch still needs strict rank/global-boundary progress to exclude
the checked blocker two-cycle. Both new declarations use only `propext`,
`Classical.choice`, and `Quot.sound` and contain no `sorry` or custom axiom.

`ActualBlockerOrbitNormalForm.lean` iterates the deterministic actual-blocker
map without losing the robust source. Its checked theorem

```text
AmbientRobustHistoryPair.
  actualBlockerOrbit_terminalHit_or_erasedCycle
```

returns exactly one of:

```text
some reachable blocker source belongs to C
or
a reachable blocker cycle of period at least two,
with a complete source-exact AmbientRobustHistoryPair at every orbit vertex.
```

This theorem also has only the three core axioms. It is the finite history
object on which cap-rank/lap progress must be proved; the cycle arm is not a
contradiction by itself.

`ActualBlockerMinimalCycle.lean` performs the canonical normalization.
`SourceExactMinimalActualBlockerCycle` carries a reachable base, the mathlib
minimal period with a proof that it is at least two, injective/nodup canonical
vertices, erased membership at every vertex, and a source-exact robust pair at
every `Fin period` index. The refined theorem

```text
AmbientRobustHistoryPair.
  actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
```

feeds the further refinement

```text
AmbientRobustHistoryPair.
  actualBlockerOrbit_terminalPayload_or_sourceExactMinimalCycle
```

in `r-full-parent-entry/LeastTerminalHitPredecessor.lean`.
`ActualBlockerMinimalCycleClassifier.lean` separately chooses one robust pair
at every canonical cycle source and proves the exact finite alternative that
some chosen pair is HIT or every chosen pair is OMISSION. The parent endpoint
in `RFullParentOrbitEntry.lean` now exposes the terminal payload or that
classified minimal cycle directly. The robust mate at each cycle source
remains existential rather than coherent across consecutive edges;
cycle-wide geometry must not assume mate-history coherence that this source
does not provide. The new minimal-cycle and parent-adapter endpoints again use
only the three core axioms.

## Terminal-carrier provenance boundary

`FirstApexTerminalOn.hunique` controls radius classes centered at
`S.oppApex1` on `C`; the actual blocker shell is centered at
`b != S.oppApex1` and contains the erased source. Consequently it is not a
four-row on `C`. The checked finite terminal landing can place
`b in C` in strict `oppCap1` while omitting the mate and both named cap
endpoints. Terminal uniqueness therefore supplies no blocker-row endpoint or
rank field.

The mandated theorem-bank and indexed-corpus preflight found no declaration
that consumes `b in C` alone. In HIT the smallest bank-feeding payload is a
third point common to the circles centered at `b` and `S.oppApex1`, distinct
from `P.x,P.y`; `Problem97.two_circle_third_point_eq` then closes. In OMISSION
the deleted K4 witness can be packaged as a `U5QDeletedK4Class`, but it stays
anonymous until a named common-bisector triple or reciprocal selected-class
incidence is produced.

`ActualBlockerTerminalHitConsumer.lean` now checks that HIT reduction in Lean.
`false_of_actualBlocker_hit_thirdCommonPoint` consumes the actual blocker row,
mate membership, and one named third common point and closes through the
banked two-circle theorem. Its endpoint uses only the three core axioms. This
closes the consumer adapter, not the third-point producer.

The recursive-construction audit has now been formalized in
`r-full-parent-entry/RetainedPointProvenance.lean`. It proves the strongest
retained-point quotient available without changing the descent:

```text
b = terminal q
or b = terminal w
or b survives in (C.erase q).erase w,
   and b lies on the unique terminal first-apex radius
   or its own retained first-apex class has card at most three.
```

`exists_terminalWitness_role_and_capMetricOutcome` crosses that exact role
with the existing HIT/OMISSION classifier while retaining the terminal
second-apex K4 witness. All endpoints use only the three core axioms. The bank
preflight finds no direct consumer for the whole quotient, but this is now the
only admitted terminal mining object: endpoint versus residual survivor,
crossed with HIT versus OMISSION and terminal-radius versus small-class status.
Bare `b in C`, marginal blocker placement, and anonymous rows remain rejected.

`r-full-parent-entry/ActualBlockerOmissionAdapter.lean` now preserves the
actual selected shell on the OMISSION arm. Its `exactRowPacket` retains the
definitionally exact four-point support, source membership, mate omission,
positive-radius equality, deletion survival, and a source-derived
`U5QDeletedK4Class`. The checked consumer
`false_of_dangerousTriple_subset` closes from precisely one new incidence:
some `U5DangerousTriple D P.y P.x T` satisfies `T ⊆ K.support`. This is the
preferred U5-facing OMISSION target; do not replace it with an anonymous
equidistance witness.

`r-full-parent-entry/ResidualTerminalOmissionConsumer.lean` checks the direct
two-circle route for the residual terminal-radius OMISSION cell. Its only
additional producer field is
`rho = terminalRadius ∧ q ∈ K.support ∧ w ∈ K.support`; the erased source and
two retained endpoints then give three distinct common circle points.

`r-full-parent-entry/LeastTerminalHitPredecessor.lean` completes the orbit
adapter. From any reachable terminal hit it takes the least positive hit time,
proves every earlier vertex is erased, reconstructs a robust predecessor with
source exactly the preceding orbit vertex, identifies its actual blocker with
the hit, and returns `RetainedActualBlockerTerminalPayload` for that exact
entry edge. The terminal arm is therefore source-derived end to end; the new
adapter endpoints use only the three core axioms.

## Accepted closing output contract

A full-parent theorem may return one of the following, and nothing weaker is
counted as transition progress.

1. A named, already checked terminal that yields `False` on the routed source
   branch.
2. An endpoint-landing disposition together with either a named terminal or a
   transition satisfying item 3 or 4. Endpoint landing alone is not terminal.
3. A same-cap transition carrying:
   - one concrete common ordered minor cap;
   - a spent endpoint `e` distinct from the current source and actual blocker;
   - `e` in the actual blocker support, hence the exact endpoint-radius equality;
   - a successor `P'` with `P'.x = b` (up to the explicitly declared
     orientation);
   - reconstruction of every robust-pair field at `P'`; and
   - a proper inclusion of the concrete rank interval, hence strict rank drop.
4. An adjacent-cap transition carrying:
   - a successor `P'` with `P'.x = b`;
   - reconstruction of every robust-pair field at `P'`;
   - one common global-boundary lift and a directed strict advance; and
   - retained bounded no-wrap/lap history.

Returning an arbitrary `AmbientRobustHistoryPair P'` is rejected: `P' = P` or
an unrelated pair would make preservation vacuous. If the recursion erases
points cumulatively, the state must additionally carry cumulative carrier and
survival fields; ambient double survival in the original `D.A` does not imply
cumulative survival.

## Explicit omissions in the current source

| Needed closing field | Current status |
|---|---|
| named endpoint in the actual blocker row | OPEN; not implied by HIT mate membership |
| common minor-cap placement of source and blocker | OPEN universally; only a cap-location subbranch |
| strict rank interval inclusion | CONDITIONAL consumer proven; producer open |
| successor with source equal to actual blocker | PROVEN when `b ∉ C`; terminal-carrier case remains |
| co-radial off-surplus mate at the successor | PROVEN when `b ∉ C` |
| double survival at both apices for the successor | PROVEN when `b ∉ C` |
| globally oriented adjacent-cap advance | OPEN |
| bounded lap/no-wrap history | OPEN |

`source_pushout_left/right`, `rank_drop`, opposite-endpoint consumers, and
strict-lap consumers assume the missing edge/progress fields. They do not
produce them. The sibling `SameCapIncompatibleEdge` likewise assumes its
endpoint-radius equality and is not a source theorem.

## Regression gate

Every proposed strengthening must state which full-parent field excludes each
of these checked boundaries.

The complete replay was run on 2026-07-15. All twelve gates passed. A PASS
means that the boundary example remains valid within its stated abstraction;
it is not a counterexample to omitted full-parent fields.

| Gate | Checked boundary | Must be consumed to exclude it |
|---|---|---|
| 1 | exact 13-point strict-convex/MEC/no-M44 local blocker model | all-center K4 plus total common-system coupling |
| 2 | exact `(4,5,6)` endpoint blocker whose row omits both cap endpoints | a full-parent endpoint-incidence or named terminal theorem |
| 3 | kernel `Fin 13` same-cap strict-interior blocker three-cycle | genuine Euclidean/global-order progress, not endpoint exclusion alone |
| 4 | exact `(6,4,5)` first-apex endpoint-critical packet | global K4/total CSS or an explicit endpoint disposition |
| 5 | kernel finite ambient robust-history boundary | geometric parent fields beyond the R-history/CSS interface |
| 6 | kernel off-surplus blocker two-cycle with cross omissions | strict provenance-carrying progress, not arbitrary blocker iteration |
| 7 | exact `(5,5,5)` apex-flip alternation | explicit cumulative carrier/survival if recursion accumulates erasures |
| 8 | finite global-K4/total-CSS fresh-successor three-cycle | cap/global-boundary order attached to the successor |
| 9 | kernel tuple-selection countermodel | a source theorem, not multiplicity of anonymous row choices |
| 10 | exact strict-convex/MEC/no-M44 local two-hit/confinement failure | all-center K4 plus total CSS |
| 11 | exact 35-point strict-convex/MEC/no-M44/total-CSS completion | all-center K4; coordinate digest begins `c5289a` and ends `b7dce` |
| 12 | pinned iteration-7 bank-clean continuation checkpoint | a newly proved source/target transition; zero represented R-target hits is not a terminal theorem |

Canonical replays:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/blocker-cap-geometry/exact_blocker_cap_countermodel.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/endpoint-continuation/analyze.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/endpoint-blocker-geometry/analyze.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/robust-survival-bridge/separate_deletion_countermodel.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/stage1_apex_flip_cycle_countermodel_2026-07-14.py

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/common-deletion-consumer/successor_cycle_countermodel.py

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/nom44-support-localization/check.py

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/global-critical-continuation/verify_total_css_completion.py

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --frozen python \
  scratch/atail-force/robust-all-center-15core-continuation/continuation.py \
    --check --max-nodes-per-iteration 5000000
```

The corresponding Lean boundary files are:

```text
endpoint-continuation/finite_countermodel.lean
subcarrier-terminal-invariant/FiniteRobustHistoryBoundary.lean
r-complement-blocker-map/FiniteBlockerCycleBoundary.lean
chosen-tuple-selector/TupleSelectionCountermodel.lean
```

The iteration-7 command is check-only: it replayed the predecessor and
continuation checkpoints, returned
`SAT_NEXT_INDEPENDENTLY_VERIFIED_BANK_CLEAN_RESIDUAL`, and did not resume
mining. Any semantic/count/source-hash drift fails this gate closed.

## Next proof target

The terminal provenance certificate is now proved. The next terminal-arm
producer must be derived from its exact finite quotient. Its HIT consumer
target is a third common circle point for
`Problem97.two_circle_third_point_eq`; its OMISSION consumer target is a named
dangerous triple contained in the exact actual-blocker support, or a stronger
common-bisector/reciprocal-incidence packet. The preferred adapter first
turning a reachable terminal orbit hit into its least positive hit and a
source-exact predecessor pair is now proved. Terminal work is therefore the
branch-by-branch production of one of those two bank inputs from the exact
`RetainedActualBlockerTerminalPayload`. On the erased-cycle arm,
the minimal positive period, distinct canonical vertices, and exact some-HIT
versus all-OMISSION family split are now proved.
The new geometric content must be cycle-wide: a fixed-cap endpoint-spending
periodic packet, a coherent globally oriented strict-lap packet, or an existing
metric/equality terminal. A one-edge rank assertion is insufficient unless its
order composes coherently around the whole cycle. Until one of these objects
survives this manifest and its regressions, R CEGAR, anonymous continuation-row
mining, and ports of assumption-only same-cap edge records remain stopped.
