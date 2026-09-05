# Project review and paths for the major admissions

Date: 2026-09-04. Verdict: **NEEDS WORK** for completion of either problem.
Claim/status groups audited: six; research-route groups reviewed: six.

This is a review of the proof architecture, major admitted obligations, recent
mathematical work, theorem reuse, computation boundaries, and project process.
It is not a line-by-line certification of every generated certificate or a new
proof of any open statement. Recommendations below are **HEURISTIC** research
judgments; proposed missing mathematical statements remain **CONJECTURED**.

## Scope and evidence

- Repository: `/Users/adam/projects/math-projects/erdos-97-96-formalization`.
- Branch: `main`; configured publication target: `Problem97.erdos97_rhs`.
  Problem 96 is a separate theorem root, downstream of the Problem 97 argument.
- Scope: current worktree plus committed history, 2026-08-28 through 2026-09-04
  inclusive, America/Los_Angeles. Older conversation evidence was used where it
  explains a still-relevant obstruction.
- History baseline: `a301d85e`; review-start HEAD:
  `0bbbc5a6f311c3c5f0512df4ca4a3de84996346a`. Other sessions continued changing
  this shared worktree; the later observed HEAD was
  `e91a960183e6f9104d51b52cd5c2963ed9267d3a`. Source observations are snapshots,
  not a frozen release.
- Prior review reused: nthdegree `01M1568RC0Z64ESKZZMZT4KRTP`, dated 2026-08-28.
- Three independent reviewers covered history/conversations, proof state/trust,
  and authored plans. The lead inspected the source hypotheses and synthesized
  the research priorities.
- The conversation audit used its terse history index, obligation-specific
  semantic/keyword searches, and selected complete messages. This does not claim
  individual review of all approximately 10,000 messages. Message IDs below are
  in the `erdos-97-96-formalization` channel and can be read with
  `nthdegree convo show ID`.
- No new Lean builds or solver searches were launched for this review. Historical
  build/audit results are credited only at their recorded scope and revision.

## Verdict

The project has a substantial checked mathematical foundation and several real
finite-case closures. Its remaining task is mathematical: derive the order,
incidence, and occurrence facts that the current contradiction consumers need.
More encodings, adapters, or fixed-cell certificates help only when they identify
and remove one of those missing facts.

The main structural risk is loss of source information across reductions. The
repeated pattern is a strong geometric source, a compact interface retaining
cardinalities or selected rows, and a terminal requiring an additional order or
incidence fact that the interface never produced. The conversation history
contains numerous corrections of exactly this form. A second recurring risk is
treating a contradiction for one finite profile as coverage of its parent.

## Established progress and its boundary

The README's overall statement, **“Neither problem is proved yet,”** is accurate.
The counting/base-case foundation and the implication from Problem 97 to Problem
96 are distinct from the unfinished descent theorem. Their reported audits are
historical evidence, not new builds performed here.

The following recent changes have useful mathematical content:

| Change | Evidence and scope | Remaining boundary |
|---|---|---|
| Rigid221 exact-A2 and A3/A4 circle-wedge closures | Recorded checked/audited geometric closures at `6d0fcc389` and `b613e25bf`; see the Aug 28 exact-A2 and A3-global-circle-wedge audits | These close their stated rigid branches, not all Rigid221 placements |
| B1 equal-blocker continuation and five/six normal form | Checked producer and narrowing, `5413bd4f4`, `3f6a15dee` | `false_of_b1PhysicalClassFiveSixNormalForm` still has an admission |
| D-R two-radius exact-12 case | Recorded checked bounded closure, with a coordinator dispatch in `Rigid221Closure.lean:1248-1297` | The `cardGeThirteen` child remains admitted |
| Exact-five source-swap and four-incidence refinement | Support-preserving producer and reduced incidence alternatives; Sep 2 exact-five five-incidence audit | Neither the physical continuation nor all hard source-swap cells are closed |
| D1 foreign-hit geometry | Recorded source-clean reflection, circle, and cyclic-exclusion consumers | Their occurrence/counting hypotheses and connection to the D1 leaf remain unfinished |
| Profile-1697 B--O contradiction | Audited pen-and-paper algebra and independently replayed finite formulas, Sep 3 B--O audit | Source identities `p=s` and `c2=q` and coverage of other profiles remain missing |

These are respectively scoped closures, producers, narrowings, or finite
evidence. They do not establish unconditional closure of the publication target.

## Paths forward

### 1. B1 and the other two-deletion terminals

The B1 admission is
`false_of_b1PhysicalClassFiveSixNormalForm` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean`.
The companion open terminals concern `blockerCoincidence` and `survivalSquare`.

**Best next investigation:** the exact-card-five fresh-`v` original-source arm,
before it is weakened to the endpoint residual. Pro consult **#9960** identifies
the live theorem `b1_freshV_cardFiveEndpoint_or_originalSource_or_adjacentCap`
(`TwoDeletionCollision.lean:408`). In the arms `v = C.u` or `v = C.v`, retain
the full fresh-pair, canonical-source, mutual-omission, and deletion-role
hypotheses, and try to derive `B1CardFiveWinningSliceArc` for an actual live
slice. The checked `false_of_b1WinningLiveSliceSameBoundaryArc` is the immediate
sink. `B1GoodCanonicalEndpointCardArc` is a conditional packaging interface,
not an independently justified route.

The canonical endpoint packet gives order for the deleted pair and its blocker;
it does not supply order for the winning live slice. The first identified loss
site is `B1WinningLiveSliceIngress.lean:137`. Cardinality two and a single omitted
peer do not themselves produce the missing two-point order relation. The raw
card-six bridge also requires `rawCardSixGood`, whose order conditions are not
supplied by the endpoint packet. See the Sep 4 canonical endpoint card-arc audit
and messages **#12591, #12593**.

This is a substantive geometric theorem, not an adapter task. Search for its
proof in the full cap/minimal-deletion context, keeping both live points, the
physical apex, the blocker, and the same boundary indexing. If testing a weaker
packet produces a model, record exactly which source constraints it omitted;
that is evidence against the weakened route, not a counterexample to Problem 97.

Before attempting the new card-five proof, falsify its proposed local
order/incidence consequence with **all those branch hypotheses retained** and
both candidate same-arc bits false. A model refutes only the represented
consequence unless its full geometric/source predicates are independently
validated. A finite UNSAT result still needs a sound reduction and checked
core before becoming a Lean proof. The older Fin-18 endpoint control omitted
the fresh-pair/canonical-source context, so it does not decide this candidate.

**Card six needs a different investigation.** Pro consult **#10513** records
that the all-interior arm puts the live blocker inside the cap and between the
slice endpoints. The old blocker-outside/same-arc adapter does not apply.
The missing theorem must use the full `noThird`, exact class cover, and actual
Euclidean row/survival data to force a global terminal or directly contradict
that alternating configuration. A useful diagnostic therefore names a complete
finite carrier, expands `noThird` and the terminal negations over that carrier,
and independently replays any coordinate model. Another named-role projection
cannot settle those universally quantified carrier conditions.

For `survivalSquare`, localize the actual row incidences before appealing to a
four-center terminal. For `blockerCoincidence`, avoid reusing the two-bisector
argument as if it supplied a third distinct center: that failed route was
already documented in message **#3165**.

**Gate:** a theorem deriving the arc/incidence packet from the live source,
followed by direct consumption in the existing terminal and a fresh axiom check.
**Stop rule:** no additional wrapper claiming progress while that producer is
unchanged. Home: the B1 continuation plan and source ingress modules.

### 2. D-R: two radii, cardinality at least thirteen

The precise admission is
`false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`
in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean:1252`.
Its binders retain two disjoint selected
four-rows at distinct radii, the no-five condition, and the robust source.
The exact-12 proof should not be rerun as the main research task.

Two missing links deserve attention:

1. Produce the relevant boundary/cap order from the live geometric packet.
   Historical card-13 models violated `cap_betweenness`, but using that as a cut
   requires the actual `StrictCapOrder` bridge and the correct `oppIndex2` roles.
   Messages **#8971, #8984** record this boundary.
2. Derive the `.secondOpposite` profile and unordered physical 2+3 split from
   the profile, large-cardinality premise, and available row bounds. Raw ingress
   lemmas and fixed-cell K4 terminals are useful only after this occurrence step.
   Messages **#12585, #12586, #12592** distinguish the already-written raw bridge
   from the still-missing source theorem.

Pro consult **#12167** makes the bounded classifier concrete. For each
source-entitled direct/mirror label map, retain actual row supports and produce

`DiskReadyCell` **or** `FixedFiveRowsCell` **or an explicit remaining cell**.

The disk-ready condition supplies two source MEC-boundary centers, a directional
center membership, and two distinct common support points. The suggested small
adapter has **already landed** as
`false_of_mecBoundary_selectedRows_sharedPair` in
`CardGeThirteenSharedPairTerminal.lean:32`; the current source statement was
checked in this review. The other terminal still needs its `FixedFiveRows`
positional support table. Neither condition follows just from a direct/mirror
boundary enumeration. Do not replace the three-way classifier by an unsupported
claim that one of the two terminal cells always occurs, or use the canonical
`q,w` pair where the existing bisector-center placement theorem excludes it.

Treat exact thirteen as a bounded subproblem. To close the stated admission,
also give an arbitrary-cardinality argument: for example a proved descent
preserving this branch's data, or a cardinality-independent obstruction with a
source occurrence theorem. A thirteen-point chart does not supply that argument.

**Gate:** source-derived order/profile, an exhaustive split, checked terminals,
and coverage of every cardinality allowed by the admitted statement. Home: the
D-R plan and source/profile producers. Priority: **now**, alongside B1.

### 3. Rigid221 and exact-five common-deletion geometry

Do not reopen the old card-at-least-eighteen wedge route. Current
`Rigid221SourceHeavy.lean` routes the historical deletion wrappers to its
cardinality-independent wedge contradiction. The wrappers are not evidence for
a different FourCenter/TwoDeletion ingress; message **#11771** and Sep 4 follow-up
`01M1NZBY0D22H4VP2ESTQSZGJN` explain this distinction.

Concentrate on the still-open placement/missing-incidence cases and the exact-five
three-center continuations. Preserve the positive incidence prefix before the
first missing incidence. The four-incidence refinement demonstrates why this
matters: an older packet had erased the very memberships and order needed by
the available Kalmanson and shared-pair consumers.

The most concrete finite lead is the hard source-swap grid. The Sep 3
profile-1697 audit derives, under its stated source equalities and signs,

`B=(0,0), O=(1,0), A=(1/2,r), S=(1/2,-r), Q=(3/2,r), 4r²=3`.

Then `S,O,Q` are collinear, contrary to strict convex order. This is a small
geometric obstruction worth extracting **once its live occurrence is justified**.
The current gap is that the live grid roles do not establish the profile's
`p=s` and `c2=q` identifications. Two formulas ruled out do not rule out the
whole hard-source-swap branch.

**Next:** classify source-entitled alias/order patterns; distinguish cases where
those identifications are proved from residual cases. Minimize each new terminal
to a reusable geometric fact, and keep the physical continuation separate from
the hard source-swap continuation. Do not silently strengthen cap lower bounds
into carrier lower bounds: the exact-five audit documents that extra premises
are needed.

**Gate:** authenticated full case coverage plus live hypothesis transport into
each geometric consumer. Home: the exact-five three-center plan and rigid
placement/source-heavy modules. Priority: **next**, with bounded case targets.

### 4. FreshThird / TwoSource

The major surfaces are aligned-retained FirstNonHit, common-radius FirstNonHit,
equal-center noncanonical interactions, pinned-endpoint outside-seed, acyclic
hard residual, cross-blocker coincidence, and first-fiber outside-pair deletion.
In `TwoSourceFreshThirdResidual.lean`, the equal-center theorem contains two
branch-local admissions although it is one declaration.

All seven declarations are in
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`:

| Declaration suffix | Source module | Admission line(s) |
|---|---|---|
| `false_of_crossBlockerCoincidence` | `TwoSourceCanonicalSurface` | 135 |
| `false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual` | `TwoSourceClosure` | 3284 |
| `false_of_capSource_firstFiber_outsidePairDeletionExactRows` | `TwoSourceFirstFiberCollision` | 2687 |
| `false_of_freshThird_firstNonHit_alignedRetained` | `TwoSourceFreshThirdResidual` | 3088 |
| `false_of_freshThird_firstNonHit_commonRadius` | `TwoSourceFreshThirdResidual` | 3105 |
| `false_of_freshThirdEqualCenter_noncanonicalInteractions` | `TwoSourceFreshThirdResidual` | 3375, 3411 |
| `false_of_freshThird_pinnedEndpoint_outsideSeedResidual` | `TwoSourceFreshThirdResidual` | 9705 |

Keep retained and common-radius ingress separate. A source witness in the latter
does not automatically identify with the named canonical surface in the former.
The local alternatives often give only overlap at most two. A consumer requiring
three shared points still needs a global producer. Equal blocker names are not
distinct bisector centers, and the different canonical radii prevent casually
using the first apex as a third center. The Aug 9/12 conversation audits already
ruled out these shortcuts (`01KZJSSJNK6H28X52QTPWG7NAK`,
`01KZSPYSEQM45BCM43X0AAWWM2`, `01KZW4KPS4SM6ZQK17GHYWAHYE`).

For the pinned-endpoint leaf, start with the actual
`FreshThirdPinnedEndpointOutsideSeedQueryPacket` outcome already bound before
the admission. A useful theorem must connect its nonrobust/retained-fan or
robust-separated branch to named endpoints, row incidences, or a contradiction.
Generic four-order-arm Kalmanson consumers are already present; arbitrary fan
witnesses still need the order/endpoint transport.

**Next:** test that exact transport on the complete source-produced packet.
If the retained local data admit models, identify a missing global cap/deletion
constraint before generating a larger local bank. A descent alternative needs
an explicit decreasing interval/finite measure and proof that reselection
preserves every required predicate; simply finding another source is insufficient.

**Gate:** close one of the existing source-level branches without importing its
own admitted parent. Home: the FreshThird active plan and its query packet.
Priority: **next**, after one bounded hypothesis audit per proposed route.

### 5. D1 / TriApex all-large

The current source has two children, exact fifteen and cardinality at least
sixteen (`TriApexEndpointRetainedOmission.lean:2881-2961`). At exactly fifteen,
each closed cap has six points and each interior four; support identities and
the ordered six-slot representation are available. These facts do not extend
to the larger-cardinality child.

The best bounded task is to finish the exact-fifteen foreign-hit analysis.
Use the one-/two-radius alternatives at each apex, retaining which radius each
foreign point belongs to. The reflection/pair bound and cyclic foreign-hit
exclusion are existing consumers. Two apex-centered radii are **not** the
missing object: section 77 of the D1 plan corrected that mistaken diagnosis.
The remaining work is a source-produced incidence/counting pattern supplying the
consumer, especially in the two-radius cases where a shared-radius argument
cannot simply be reused.

The newer two-radius theorem gives a **lower** bound of two foreign hits at one
index; the proposed counting route needs an **upper** bound and/or a cyclic
occurrence statement. These are different claims. Section 82 explicitly records
that several useful module tips are still outside the D1 proof path.

**Next:** perform the finite radius-choice/slot analysis at fifteen, prove the
needed occurrence/count, then wire the existing geometry into the child. For
at least sixteen, extract a small cardinality-independent obstruction with a
coverage theorem, or prove a valid minimality descent. Priority: bounded exact
fifteen **next**; unbounded continuation **later**, informed by the finite proof.

### 6. A general all-center Kalmanson route

This is a worthwhile parallel research hypothesis, not an established replacement
for the current descent proof. The local-collapse producer now enumerates 202
four/five-role patterns and reconstructs a 193,380-clause `n=12` stream. Its own
audit explicitly makes no all-center impossibility claim.

Message **#12460** reports that, after the two-row cuts, 1,000 residual models
were rejected by one-/two-form cancellation; the run stopped at its iteration
limit. It did not prove UNSAT. Existing `KalmansonThreeEqualitySchemas` and
`GenericRowNogoodCertificate` already consume ordered equality chains and checked
weighted certificates. The missing general theorem is **occurrence/coverage**:
from the live all-center system, produce such a certificate or another proved
obstruction, uniformly in cardinality.

**Next:** use one bounded classification of the newest residual models to test
whether they all instantiate existing three-row schemas with explicit equality
paths and order witnesses. If a model survives, inspect the missing geometric
constraint; do not claim a coverage theorem from the first thousand rejected
models. Prefer this measured experiment over another undirected clause campaign.
Home: the all-center source contract and current-wave theorem-mining record.

## Audit findings on claims and process

### F1. The public status surfaces are inconsistent

Location: `docs/proof/CURRENT.md:22-24`. Quote: **“The current registry records
25 reachable and 6 off-spine declarations.”** The inspected generated registry
instead records 27 reachable entries at source head `020e43bfc`; current source
has further changed. Verdict: **CLARIFY / refresh from one validated revision**.
The quoted number is a historical checkpoint, not the current frontier.

The dirty `docs/live-blueprint.md` inspected during the review reports 37 open
obligations marked stale. Those stale nodes must not be counted as 37 current
mathematical admissions. The source, registry, and compiled graph answer
different questions until they are synchronized.

### F2. The README's no-route statement is obsolete

Location: `README.md:410-417`. Quote: **“`|A| ≥ 18` has no route at all.”**
The Aug 28 A3/A4 audit records the later direct Euclidean wedge closures, and
the current source's historical card-at-least-eighteen wrappers call that
cardinality-independent wedge theorem. Verdict: **CORRECT THE STATUS** for this
branch. This correction does not close the other Rigid221 admissions or prove
the general Problem 97 statement. Preserve the old spec as historical evidence,
but remove its authority over the present route.

### F3. Absence of a producer is not a non-derivability proof

Location: `docs/audits/2026-09-04-b1-canonical-endpoint-card-arc-audit.md:9-10`.
Quote: **“cannot be derived soundly ... with the current hypotheses.”**
The report establishes no existing producer and identifies missing order fields.
It does not exhibit a model satisfying the full source context while falsifying
the proposed conclusion. Verdict: **CLARIFY** to “no source-established producer
was found.” The missing geometry remains a research obligation.

### F4. Formalized consumers do not certify their occurrence

Locations: D1 plan sections 77–82; D-R messages #12585–#12592; FreshThird audits
above. These frequently state the limitation accurately, but they also record
earlier incorrect missing-producer diagnoses and over-broad applicability claims.
Verdict: keep the corrected hypothesis maps beside the active obligation, and
supersede obsolete dispatch descriptions visibly. Do not require a fresh theorem
search after every ordinary edit when the candidate/hypothesis key is unchanged.

### F5. Local catalog identity and theorem coverage are separate

Location: `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md:97-107`.
Its distinction is accurate: independently reproduced local-bank bytes are finite
evidence; all-center strict-Kalmanson impossibility remains conjectured. The
unreproduced author's catalog hash is not a closure credential. Verdict: **OK at
the stated finite scope**. Require source lift and publication consumption before
crediting solver artifacts as proof-frontier closure.

### F6. The committed D-R source does not reproduce the reviewed worktree

The Pro conversation review (#12609, #12633) flagged committed versus dirty
source as a separate issue from mathematical occurrence. Direct inspection
confirmed both of the following at `e91a96018` plus the worktree:

- Tracked `CardGeThirteenOutcomeDispatcher.lean:7` imports
  `CardGeThirteenThreeRowsTightAdapter`, but that module is untracked.
  `FrontierLiveClosure.lean:23` imports the dispatcher. A checkout of this commit
  therefore lacks a source dependency needed to reproduce this import path.
- Committed `DRExactThirteenValuation.lean:63` uses `Finset.Ico 8 13` and
  `Finset.Ico 9 13` with endpoints in `Fin 13`. The numeral `13` wraps to zero,
  so these do not describe the intended final five/four labels. The working
  tree repairs them to `Icc 8 12` and `Icc 9 12`, adds cardinality/membership
  regression lemmas, and proves an image-to-physical-interior bridge. These
  changes were still uncommitted when inspected.

Verdict: **REPRODUCIBILITY BLOCKER**, with the interval defect already repaired
in the working tree. Finish owner-reviewed validation and commit the complete
dependency set before citing a clean-checkout or publication result. This review
does not take ownership of those other sessions' source edits. In particular,
the repaired intervals do not prove the missing `.secondOpposite` occurrence or
the physical 2+3 split.

## Reconciliation with the Pro conversation review

The broad Pro review under `ChatGPT-s-4eiz23qO9hfv5Gml73Mg` was delivered in
**#12652**, followed by its final-ledger addendum in **#12656**. The lead
verified both delivered file hashes; the history reviewer read the full
report and addendum. Retained references:

- Main report: nthdegree file `01M1Q21QBBNT8F9SYJX2HSBFN8`, 36,844 bytes,
  SHA-256 `6e8d1760bf0a177603e70deeba4b88ed886689d71430b601e29ececf288eb548`.
- Addendum: nthdegree file `01M1Q256WF9QVY6RFYPRP05B3B`, SHA-256
  `4d993dc2a0114aba09129f799db317f3bd982afee7eb51583f7051e7a5f8e5c4`.

The final coverage is an inventory/search/triage of 9,434 messages
(#2368–#12596), with 1,150 original-cutoff messages directly reviewed and
targeted later replies. The ledger arrived in #12647. Its arrival does not
certify a semantic final disposition of every message; the addendum explicitly
corrects two of its classifications.

The substantive additions confirmed here are F6's missing tracked dependency
and committed finite-interval defect. Its catalog correction also agrees with
F5: message #12596 certifies the corrected custody audit, **not** recovery of
the author's `dbbae6a5...` catalog. Independent generation of the corrected
`n=12` stream and recovery of the original catalog remain different evidence.

The Pro review also warns against declaring a historical task unfinished merely
because no later message repeats its numeric ID. That warning is adopted here:
the old MinimalDeletionCore restoration issue (#4090–#4097) was corrected, and
old graph-count snapshots are superseded rather than accumulated as fresh work.
Older FR92/Table-2, shortest-side, source-order-cut, and BANK001 leads require
content/source-based disposition before entering the active proof backlog.

The completed consults sharpen the mathematical priorities: **#9960** gives
B1's exact-card-five original-source arc target; **#10513** directs the
all-interior card-six arm toward complete-carrier geometry and `noThird`;
**#12167** gives the D-R positional classifier above. The small shared-pair
adapter proposed in #12167 is already present, so it is not a new task.

Another concrete follow-up is a superseding erratum for completed B1 consult
`01M1NYCWZTSKGQKNA168CKA3V8`, whose answer still points to #12515 despite the
later circularity/localization corrections and #12645's validation. Correct
that retained answer alongside the source audit so the same failed route is
not rediscovered. Message #12660 also reports that the raw exact-13 deleted-label
first-apex consequences have now been exported: validate and land that work
with its owner rather than reassigning it as a new proof task.

The FR92 follow-up resolves the historical ambiguity. The P4
transcription/proof is complete and admitted by the existing visual/source
audit; do not reopen it. The corpus rendering `k > 3` is an OCR glyph error for
the visually confirmed `k ≥ 3`. Two independent encoders agree on all 16,478
forbidden occurrences at 6×8, validate a 19-one P1–P4-free witness, and have a
DRAT-verified UNSAT upper bound at 20. Thus the paper's printed `g(6,8)=18` is
an apparent Table-2 typo; use the audited conditional value 19. The normalized
`Geometry/ShortestSideBiEquidistance.lean` bank is checked but has no production
caller and is retired from the active proof plan because its intended branch
now closes through the uniform metric terminal. The exact-17 rich-rotation
question likewise has no authenticated metric result and is closed as an
exploratory query, not a theorem. BANK001 (#5043) remains an active PIQD service
blocker, with the P97 migration adapter intentionally dry-run-only. For the
source-order bank, current source contains the v27 constants and exact-once unit
regression, while #10351 remains only an authorization/request pointer. The new
governed `source-order-v27-receipt-20260904/run-0001` reproduces the repaired
81-clause installation and bounded SAT witness with immutable artifacts. Its
full v27 validator still fails closed because legacy-local mode emits no PIQD
journal/descriptor, so this is a partial repair receipt, not terminal campaign
certification for #5099.
These are **unresolved audit leads**, not newly established proof gaps:
the next action is to identify a live consumer and an authoritative resolution
or retirement record. Do not spend another proof lane on them solely because a
later message did not mention their original ID.

Two further custody checks from the final Pro report belong in this same
historical category. For RVOL, verify custody of the claimed full binary archive
and identify a present consumer; superseded transfer fragments are not themselves
missing evidence. For the old exact-`n=10` announcement, the claimed 9,280-clause
master and `dffbade...` identity remain unauthenticated. Preserve the independent
committed `false_of_complementaryArc_selectedRowEqualityChain` result at
`e3d065804` (#10372) without treating it as authentication of that master or an
exhaustive UNSAT proof. Neither unresolved artifact is automatically a dependency
of the current publication target; that link must be checked first.

## Recommended allocation and completion criteria

1. **Now:** one B1 source-order/incidence lane and one D-R source-order/profile
   lane, each ending in a proved producer or an explicitly scoped obstruction.
2. **Next:** bounded Rigid221 hard-source-swap coverage and D1 exact-fifteen
   radius/slot analysis. Keep FreshThird focused on its actual packet transport,
   not generic repetition of overlap/bisector searches.
3. **Exploratory lane:** one bounded all-center three-row occurrence experiment.
   Review its evidence before committing to larger runs or a new main strategy.
4. **Maintenance checkpoint:** after the active source edits settle, use the
   governed build and refresh workflow to synchronize the source index, kernel
   graph, registry, README block, and current pointer. Do not alter another
   session's staged files or stop its jobs as part of this review.

The D-R reproducibility repairs in F6 should precede any new clean-checkout
validation or claim that its latest source work is fully delivered.

For every mathematical lane, the deliverable should name the existing admission,
the exact new producer or contradiction, its immediate consumer, and the scope
removed. Validate the affected module, the final consumer's axiom closure, and
fresh publication reachability. For computed cases, also validate input custody,
certificate/replay, source transport, and exhaustive coverage. A new admitted
adapter is not a completed deliverable.

## Evidence index

| Topic | Primary local evidence |
|---|---|
| Publication contract | `.blueprint.toml`; `README.md`; `proof-status/README.md` |
| Historical registered frontier | `proof-status/obligations.json`; baseline commit `a301d85e` |
| Circle-wedge closures | `docs/audits/2026-08-28-rigid221-exact-a2-skeptic.md`; `docs/audits/2026-08-28-rigid221-a3-global-circle-wedge.md` |
| B1 | `docs/plans/2026-08-29-b1-global-continuation.md`; `docs/audits/2026-09-04-b1-canonical-endpoint-card-arc-audit.md` |
| D-R | `docs/plans/2026-09-01-dr-two-radius-branch-closure.md`; `docs/audits/2026-09-01-dr-two-radius-quotient-wave.md` |
| Exact-five | `docs/audits/2026-09-02-rigid221-exactfive-distinct-fiveincidence.md`; `docs/plans/2026-09-01-rigid221-exactfive-distinct-three-center.md` |
| Profile-1697 | `docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-bo-source-qfnra-run-0001.md`; `docs/skeptic-exactfive-hard-source-swap-bo-normalization-2026-09-03.md` |
| FreshThird | `TwoSourceFreshThirdResidual.lean` in the frontier directory; conversation records cited above |
| D1 | `docs/plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md`, especially sections 77–82 |
| General cancellation | `docs/audits/2026-09-04-strict-kalmanson-local-collapse-producer.md`; `KalmansonThreeEqualitySchemas.lean`; `GenericRowNogoodCertificate.lean`; conversation #12460 |

## Current source inventory

The independent source audit found **28 admitted declarations and 29 admission
occurrences**. This is a source inventory, not a newly authenticated current
publication-reachability census. The lead independently rechecked all 29
standalone admission lines in the nine listed source modules.

| Family | Declarations | Admission occurrences | Source modules and admission lines |
|---|---:|---:|---|
| Rigid221 / exact-five / D-R | 16 | 16 | `Rigid221Closure`: 112, 445, 1268, 1374, 1554, 1580; `Rigid221Placement`: 584, 759, 985, 1011, 1036; `Rigid221SourceHeavy`: 5111, 19128, 19178, 19755, 19918 |
| TriApex / D1 | 2 | 2 | `TriApexEndpointRetainedOmission`: 2931, 2961 |
| Two-deletion / B1–B3 | 3 | 3 | `TwoDeletionCollision`: 1449, 1548, 1761 |
| TwoSource / FreshThird | 7 | 8 | `TwoSourceCanonicalSurface`: 135; `TwoSourceClosure`: 3284; `TwoSourceFirstFiberCollision`: 2687; `TwoSourceFreshThirdResidual`: 3088, 3105, 3375, 3411, 9705 |
| **Total** | **28** | **29** | All modules above are under `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/` |

The 28 source declarations are not interchangeable with the 27 registered
entries, the old current-pointer count of 25, or the 37 stale graph nodes.

## Verification and trust

The independent audit recorded:

| Read-only check | Exit | Result and limitation |
|---|---:|---|
| `proof-blueprint refs --check` | 1 | Build `194427673fa4`: 58,798 fresh, 2,274 stale, 392 never-mined declarations |
| `proof-blueprint index --check` | 1 | 6,582 source files versus 6,581 indexed; one new, one changed, 84 FQN collisions |
| `proof-blueprint status` | 2 | 23 uncommitted Lean files; cached sorry state from older build `d95280fef1c2` reports 28 on-spine and zero off-spine |
| `proof-blueprint symbols --with-sorry` | inventory | 28 declarations, 29 source tokens, grouped above |
| `proof-blueprint axioms Problem97.erdos97_rhs` | 1 | Cached closure includes `sorryAx`, the three core axioms, `Lean.ofReduceBool`, and `Lean.trustCompiler` |
| `proof-blueprint verify-publish --no-refresh` | 1 | Fail-closed inventory, not a publication verdict; 37 stale spine symbols, 28 source admissions classified off-spine by that stale cache, and 12 unbound mining-skip patterns |
| `gen_obligation_registry.py status --check` | 2 | `malformed proof-blueprint obligation entry`; the registry cannot currently certify live status |

The native axioms are explicitly whitelisted in `.blueprint.toml`; no custom
axioms are approved. `sorryAx` remains the unapproved admission dependency.
The `[mining].skip` findings reflect missing `[computations].manifests` bindings
under the installed gate. They do not by themselves refute the generated
certificates, but their custody/ingress contract needs to be bound before this
gate can pass.

The deployed `spine` command would refresh state, so the reviewer did not invoke
it as a read-only check. The inspected live-blueprint text is a dirty generated
snapshot. A stale coordinator prevents certification of the newest source call
graph. This review did not independently rebuild all artifacts or redo every
native implementation/axiom audit.

The read-only hygiene report for this review's lane returned a repository-wide
blocking inventory: 13,392 entries, including 8,688 `UNREGISTERED_GENERATED`,
4,548 `DURABLE_UNTRACKED`, 144 `UNTRACKED_ROOT_SPILL`, and 10 `FOREIGN_DIRTY`
entries. These are classification entries, not counts of independent proofs or
disposable directories. The report itself exited zero; its `blocking` field
must be inspected separately. No foreign files were changed or cleaned. Any
cleanup requires the project's ownership/reference scan and quarantine process;
the immediate actionable reproducibility issue is the concrete imported module
in F6, not a demand to make the entire shared worktree clean.

## Comparable metrics and review cost

| Metric | Baseline | End observation | Interpretation |
|---|---:|---:|---|
| Registered reachable entries | 28 at `a301d85e` | 27 at registry source `020e43bfc` | Historical registry delta −1; current source differs, so this is not a proved frontier delta |
| Registered off-spine entries | 6 | 0 | Includes archival/reclassification; not six proof closures |
| Current source admitted declarations | unavailable | 28 | Diagnostic source count only |
| Current source admission occurrences | unavailable | 29 | One FreshThird declaration contains two holes |
| Fresh current-source publication frontier | unavailable | unavailable | Build/index/registry findings above block this measurement |
| Configured publish targets proved | 0 | 0 | The target continues to depend on `sorryAx` |
| Commits in the review interval through review start | no comparable prior census | 533 through `0bbbc5a6` | Later shared-worktree commits are excluded; activity, not mathematical progress |

The history lane found 242 commits touching proof Lean, 361 touching docs, and
107 touching scripts/census/certificates; these sets overlap. Generated payloads
and repeated status corrections dominate volume, so line counts were not used
to rank proof progress. No measured fresh-build runtime comparison is available.

Context limitations: several initial skill/web reads exceeded the intended
output budget or were clipped; the largest directly observed pre-truncation
output was 3,524 tokens. Later evidence collection used targeted source pages,
concise search results, and bounded reviewer reports. A complete cross-agent
count of oversize outputs and avoidable rereads was not instrumented. No context
compaction occurred in the lead review.

Historical mathematical classifications remain scoped to their recorded audits.
No finite computation is credited as a general proof, and no strategy
recommendation is asserted to close an admission. The final review record is
stored separately in nthdegree for comparison by the next review.
