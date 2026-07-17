# Current Closure Plan — Problem 97/96 (2026-07-09)

This is the single active route plan to
`proof-blueprint verify-publish` green on `Problem97.erdos97_rhs` and
`Problem96.erdos96_rhs`. The executable task register is
`docs/closure-matrix-2026-07-09.md`; this document owns route rationale and
dependency order. The full-plan audit is
`docs/audits/2026-07-09-full-closure-plan-audit.md`.

It consolidates the decision-relevant content of the former 2026-07-06 master
plan. That detailed record is [archived](../archive/2026-07-10-closure-plan-consolidation/closure-plan-2026-07-06.md)
and is evidence for rejected routes and dated solver results, not a dispatch
authority.

## Authority and snapshot protocol

Cardinality terminology is fixed across the active closure plan:
`CARD-GE-12` / `card-ge-12` means a theorem uniform under
`12 ≤ D.A.card`, while `CARD-EQ-12` / `card-eq-12` means an exact-cardinality
census, placement, or profile under `D.A.card = 12`. Bare “card-12 producer”
is retired from current-status prose; historical file names and immutable
artifact identifiers keep their original spelling.

The numerical snapshots in this plan and the matrix are dated evidence, not
current truth. Before dispatching or reporting a row, run the matrix's
`CTRL-GRAPH` and `CTRL-OWN` gates and record the timestamp, source-index state,
build/mining fingerprint, open theorem names, and source artifact. Do not infer
currentness from a prior line number, node count, or anchor.

Before proposing a new finite-pattern, row-slot, incidence, or local-metric
contradiction, complete the mandatory theorem-bank preflight: inspect every
registry named in `AGENTS.md`, search the indexed corpus with
`nthdegree docs search --lean`, and record the candidate's normalized
statement, source/import reachability, closure status, field-by-field map from
the live packet, first missing antecedent, circularity check, and immediate
spine consumer. A negative compatibility result is a valid deliverable; a
consumer without its geometric producer is not a closure route.

## Current inventory (updated 2026-07-16)

The current source surface is **12 direct `sorry` declarations / 32 textual
holes**, grouped into two Front-A proof clusters.  The liveData case tree is
still extracted into named helpers, but the T1 and T3 permutation orbits are
now source-sorry-free after production relabel wiring and remain only
transitively open through K-A-PAIR.  The 22
ERASE declarations have source proofs and no longer contribute source holes;
their P2 native and downstream target builds now pass on the current working
tree and remain tracked separately from global publication.

| # | Cluster | Current source surface | Symbols | Textual holes | Front |
|---|---|---|---:|---:|---|
| 1 | Parent two-large-cap contradiction (legacy shared-radius symbol) | `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | 1 | 1 | A |
| 2 | liveData families | Four LIVE-Q helpers and seven LIVE-C center helpers carry direct holes; all LIVE-T1/LIVE-T3 helpers and `u1_largeCap_routeB_tail_liveData_false` itself are source-sorry-free | 11 | 31 | A |
| **Total** | | | **12** | **32** | |

The pinned-surplus general-m and endpoint general-m leaves are closed and are
not part of the current inventory (matrix K-B-PIN and K-B-END-GENERAL).
The refreshed source/graph checkpoint reports exactly the 12 declarations
above.  The T1 and T3 declarations still inherit `sorryAx` through K-A-PAIR,
but they are not direct source obligations.
The full P2 fleet, downstream ERASE targets, and target-specific exact-pin gate
pass from pushed commit `652fdfcb`. The global `CTRL-GRAPH`/publication gate
remains open for the 12 direct Front-A declarations and shared-tree
reproducibility. Both production relabel theorems and all 24 T1/T3 helper
consumers are now in the source graph.
`sorryAx` is the synthetic kernel marker reached through the remaining
Front-A declarations and through the source-clean LIVE-T1 helpers' K-A-PAIR
dependency, not a 25th source obligation.

The 2026-07-16 live `proof-blueprint` recheck reports the source index in
sync, exactly these 12 on-spine declarations, and no off-spine placeholder
sorries. At the K-A anchor,
`DoubleApexOffSurplusSharedRadiusPair` is the only open project symbol in its
31-node subtree; its body still reaches `sorryAx`. This does not make the 11
LIVE-Q/C declarations closed: they remain separate on-spine frontier symbols
until the parent contradiction is called before their slot split and
reference mining proves that the old tree is dead or leaves sorry-free
compatibility wrappers.

## Current Front-A closure strategy (refreshed 2026-07-16)

The sole primary theorem boundary is the direct parent contradiction

```lean
false_of_twoLargeCaps_commonCriticalMap
```

called immediately after the parent chooses the concrete
`Hcritical : CriticalShellSystem D.A` and before it constructs or enumerates
the LIVE rows.  The legacy
`DoubleApexOffSurplusSharedRadiusPair` conclusion is an artificial ex-falso
endpoint: `oppCap2_escape_gen` already refutes the requested pair, and its
substantive consumer immediately eliminates the resulting `False`.

The parent proof keeps the full `CriticalPairFrontier`.  Its current
production extraction already supplies `secondApexDouble`, so simultaneous
double-deletion survival at the second apex is unconditional on this
frontier; `secondApexSplit` is compatibility data only.  The first-apex split
is the source-current decomposition

```text
R | FA-UNIQ4 | FA-UNIQ5.
```

The common critical-map provenance is also already retained in the stronger
scratch interface `LiveDangerousRetainingSystem`: it carries the concrete
system, exact live row and support, deletion-blocker fact,
`centerAt = p` classification, and selected-support transport.  Do not add a
separate provenance-restoration task.

**Primary R-route correction, 2026-07-16.**  The card-at-least-fourteen R
surface no longer requires the full origin-tagged branch tree to reach its
closure boundary.  The kernel-checked theorem
`exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen`
constructs a common-deletion packet whose second center is the physical
`S.oppApex2`, while retaining the deleted frontier choice, one outside-fiber
source, its actual blocker, and that blocker’s inequality from the second
apex.  The checked uniform consumer then proves

```text
card >= 14 R
  -> FullyDeletionRobustAt D S.oppApex2
   or SwappedFirstApexUniqueFourFrontier D S H.
```

The exact remaining card-at-least-fourteen consumers are therefore the robust
physical-second-apex direct-`False` theorem and the protected swapped
`FA-UNIQ4` direct-`False` theorem.  The origin-tagged coordinator and its branch
reductions below remain checked diagnostics and fallback infrastructure, but
they are no longer the primary load-bearing route.  Do not instantiate every
old R callback merely to recover a result already supplied by the physical
second-apex reduction.

The robust endpoint has also been normalized exactly in
`robust-second-apex-geometry/`.  It is equivalent to either one
`S.oppApex2` radius class of cardinality at least five, or two distinct K4
radii with support-disjoint selected four-classes.  Cap four contradicts
robustness, and cap five reorients to protected swapped `FA-UNIQ5`.  The live R
surface already has `6 ≤ S.oppCap2.card`, where both alternatives remain
compatible with all current marginal MEC/cap one-hit facts.  The next robust
consumer must therefore use genuinely global source-indexed geometry to
exclude both large-cap radius alternatives.  Do not target
`HasCriticalDeletionAt D S.oppApex2`: it is exactly the negation of full
deletion robustness.  Likewise `FullyDeletionRobustAt.centerAt_ne` forbids a
retained critical-map source centered at that apex on this branch.

The corrected 101-shadow checkpoint does not test this live large-cap
endpoint: its fixed census profile is `(8,4,5)`, so the physical opposite cap
has cardinality four.  An exact endpoint-one-hit replay finds 28 admissible K4
supports there, all containing the same two strict opposite-cap points, with
zero five-point supports and zero disjoint support pairs; hence 0/101 shadows
extend to full robustness.  This is the already-proved cap-four impossibility
in finite form.  The same audit finds 28 five-supports at cap five and 1,512
disjoint four-support pairs at cap six, so it supplies no negative evidence for
the live `cap ≥ 6` residual.  Full stored completions have Kalmanson matches,
but the fixed parent-local packet has none; there is no live coverage theorem.

**Minimality route correction, 2026-07-16.**  The retained-map structural
surface is SAT at the smallest live profile `(6,6,5)` when it includes global
selected K4 rows, a total source-indexed critical map with exact row locking,
exclusion of `S.oppApex2` from the map image, and two disjoint robust rows.
That witness is only a finite structural shadow, but it proves that the next
consumer must use a field absent from the current tail interface.

The stopped `global-minimal-deletion-core/` lane supplies the strongest such
field.  From `hmin : D.Minimal` and the live survivor-pair frontier it
kernel-produces a fresh strict-cap center and exactly one of:

1. a shared-radius collision among a bounded deleted-role set;
2. a genuine `MinimalDeletionCore` with pairwise-disjoint exact four-shells,
   global packing `4 * V.card ≤ D.A.card`, and cap-local packing; or
3. an installed singleton exact blocker omitting one frontier target while
   preserving deletion survival there.

All 25 exported declarations independently recompile with only `propext`,
`Classical.choice`, and `Quot.sound`.  This is a checked positive predecessor,
not yet the robust contradiction.  Its exact remaining consumers are the
bounded collision arm, packed multi-core arm, and a monotone/finite-orbit
consumer for the installed singleton arm.

The adopted higher-parent composition now kernel-checks as
`robustSecondApexMinimalDeletion_reduction`.  It retains the physical-second-
apex robust-radius classification on every arm and strengthens every deleted
source with survival of its deletion at `S.oppApex2`.  Its three exact outputs
are `RobustSecondApexMinimalDeletionCollision`,
`RobustSecondApexMinimalDeletionMultiCore`, and
`RobustSecondApexMinimalDeletionInstalledSingleton`.  The adjacent theorem
`false_of_robustSecondApexMinimalDeletion` is only a motive-valued dispatcher:
it requires one direct-`False` callback for each output and is not itself a
closed contradiction.  The multi-core endpoint now also retains the checked
strict-cap complement bound

```text
2 * V.card <= (D.A \ S.capByIndex fresh.capIndex).card,
```

in addition to `4 * V.card <= D.A.card`.  This is a stronger packing boundary,
not a cardinality contradiction for unbounded carriers.

The mandatory theorem-bank audit in `robust-minimal-consumer-bank/` found no
complete consumer for any of these endpoints.  One small conditional terminal
does kernel-check: a same-row collision is false if a third point of the
physical row lies on the fresh-center collision radius, by
`eq_of_equidistant_three_noncollinear`.  That third common point is exactly the
extra premise not produced by the live endpoint.  In particular, a five-point
fresh radius class does not imply that it meets the physical row in a third
point.  Treat this theorem as an incompatibility boundary, not as the next
producer target.

In the two-disjoint-radius subarm, the checked theorem
`exists_secondApexRow_minimalDeletionTransition` uses the second disjoint row
essentially to prove that the fresh blocking center differs from the physical
second apex.  It then returns either a same-row co-radial pair with reciprocal
actual-blocker deletion survival, or a minimal deletion core.  The collision
arm is now stronger: restoring either collision endpoint in a cardinal-minimal
deletion set produces a K4 which must use that endpoint, while the deleted
co-radial partner is a fifth ambient point.  Therefore the fresh radius class
has cardinality at least five and the fresh center is fully deletion-robust.
A non-singleton collision-free core was already known to make the fresh center
fully deletion-robust from its two disjoint exact shells.  Thus every
non-singleton outcome advances to a fresh robust center; only the singleton
core and robust-center iteration remain.  This is a genuine global reduction,
not a contradiction.  Its next consumer must localize the fresh center and
produce a strict cap/MEC-order decrease or a finite nonreturn packet; bare
iteration of `FullyDeletionRobustAt` is not well founded.

In the radius-class-cardinality-at-least-five subarm, the checked theorem
`nonempty_minimalDeletionOutcome_of_largeSecondApexRadius` chooses two strict
`oppCap2`-interior points from the full physical-apex radius class and applies
global minimality to their two-point deletion.  It returns exactly an existing
`CommonDeletionTwoCenterPacket`, a `LargeCapUniqueFiveSecondApexRadius`, or a
`SharedCriticalPairAtLargeSecondApex`.  The exact-five outcome is not the
already-routed cap-five terminal: the surrounding cap still has cardinality
at least six, so the unused cap point is part of the remaining geometry.  The
shared-pair outcome retains one fresh exact critical shell through both chosen
points, both fresh-center deletion failures, and both physical-apex deletion
survivals.  The checked follow-up in
`robust-large-radius-center-localization/` proves that the fresh center lies in
the same strict `oppCap2` interior as the shared pair and that its exact shell
meets `oppCap2` in exactly those two points.  Hence the other two shell members
are outside that cap.  Ordered-cap uniqueness is used essentially for the
localization, but the result is not itself false: an interior center is allowed
exactly two same-cap points on one circle.  The remaining consumers are
therefore the existing common-deletion continuation, a sixth-cap-point/full-
filter consumer for the exact-five profile, and a cap-order/minimality
continuation that uses the two outside shell members.  The honest next rank
question is whether the fresh center lies strictly between the shared pair and
whether that interval can be made to decrease across the next critical-map
step; do not replace it with another anonymous incidence scan.

The production interface formerly dropped the required hypothesis:
`removableVertexOfLarge_of_nonIsM44` constructs `hmin` immediately before its
sole call to `u1_largeCap_routeB_tail_false`.  The tail signature and that sole
call now retain `hmin` directly, without widening K-A-PAIR or any LIVE helper.
The primary R theorem is therefore now
provisionally named `RobustSecondApexMinimalDeletion`:

```text
D.Minimal
  + full two-large-cap/frontier/common-map surface
  + FullyDeletionRobustAt D S.oppApex2
  -> False.
```

Use `hmin` only at the parent boundary and call this theorem before LIVE
slot/center enumeration.  Do not widen K-A-PAIR or the LIVE-Q/C helper tree:
the intended parent bypass makes those lower interfaces obsolete.  Reuse the
checked global minimal-deletion extractor as a predecessor; do not reimplement
it in either radius arm.

Within `R`, the current
`ResolvedCurrentFirstApexFixedRadiusNormalForm` is an audit projection, not
the final consumer boundary.  It drops the reciprocal residual and
continuation witness and, on the spent branch, the frontier, spent witness,
deleted-source identity, and exact first center.  The checked scratch module
`scratch/atail-force/r-origin-tagged-coordinator/OriginTaggedCoordinator.lean`
now reconstructs the source-current coordinator before that loss; its
validation and scope are recorded in the adjacent `REPORT.md`.  It retains
anchored, reciprocal, and spent origins and exposes motive-valued eliminators
covering:

1. aligned and unaligned first centers;
2. the two-off-live positive branch and its failure;
3. F1, F2, and F3; and
4. F2 live-heavy, support-heavy, and mixed.

The coordinator and all nine printed endpoints elaborate under the pinned
Lean 4.27 toolchain with only `propext`, `Classical.choice`, and `Quot.sound`.
This is a checked branch-completeness interface, not a `False` theorem and not
production closure.  It was the prior candidate for instantiating the R motive
with `False`; the physical-second-apex reduction above now supersedes that
per-branch task on the primary card-at-least-fourteen route.

Five source-faithful branch reductions are now checked in scratch:

1. `r-unaligned-handler/UnalignedHandler.lean` proves that every unaligned
   first row has two distinct off-live points and retains the exact
   anchored/reciprocal U5 fan or spent live-status split.  Its immediate
   ordered-cap sink is
   `false_of_unalignedCommonCapLiveMultiplicity`; the missing producer is one
   common cap containing the two centers with two common row points outside
   that cap.  A finite regression proves that row counts plus individual cap
   coverage do not force this field.
2. `r-two-off-live-handler/RTwoOffLiveHandler.lean` repairs the lossy generic
   pair interface by retaining both off-live sources in the exact second row.
   A successor at the second center either raises the retained radius class to
   cardinality at least five or has support disjoint from the old row; the
   checked handler proves that either successor shape makes
   `S.oppApex2` fully robust under every single deletion.  Consequently any
   `HasCriticalDeletionAt D S.oppApex2` would close the successor immediately,
   but that hypothesis is exactly the negation of the robust branch.  The
   critical-pair arm is an exact unique-card-four second-center terminal under
   the same live system and reorients immediately to the existing swapped
   `FA-UNIQ4` frontier.  The remaining global task is to exclude the two
   large-cap robust radius cases; the legitimate small-cap robust case routes
   through swapped `FA-UNIQ5`.  In particular, exact cap five must not be
   contradicted merely for being deletion-robust, and physical-apex
   criticality must not be requested inside the robust arm.
3. `r-f1-f3-handler/F1F3Handler.lean` gives F1 and F3 one common producer:
   their unique point outside both named carriers is an origin-retaining
   off-live fresh critical source, followed by either a successor
   common-deletion packet at that source or a prescribed second-apex critical
   shell whose support is exactly the retained second row.
   `F1F3OutcomeReduction.lean` consumes that output uniformly.  The critical
   shell reorients to swapped `FA-UNIQ4`; an exact-card-five successor
   reorients to swapped `FA-UNIQ5`; and the only remaining successor carries
   the exact geometric residual `6 ≤ S.oppCap2.card`.  The earlier
   complement-heavy/mixed placement split is no longer the load-bearing
   producer boundary.
4. `r-anchored-f2-supportheavy-handler/AnchoredF2SupportHeavyHandler.lean`
   keeps the anchored packet on the native `alignedSharedRowPacket` surface
   instead of attempting an invalid dependent cast through the generic
   aligned packet.  Its checked native origin-tagged eliminator reduces the
   exact four-way generated-row split to eight callbacks.  The
   both-q-critical metric residual is eliminated internally; repeated common
   deletion, cross survival, and the mixed non-equilateral/equilateral
   continuations remain open.
5. `r-f2-live-mixed-handler/F2LiveMixedHandler.lean` closes the remaining
   anchored F2 packaging gap without weakening the source.  Live-heavy
   becomes an exact original-`q` q-deleted middle row
   `{x,y,s,t}`, with the coherent source retained as the omitted third
   dangerous label and at least one of `x,y` outside the fixed first-apex
   marginal.  Mixed becomes the exact original-`q` dichotomy: either
   q-critical support `{x,s,t}` or q-deleted support `{x,y,s,t}`.
   `r-f2-directed-original-q-row/` now performs the source-faithful next
   expansion.  The concrete critical system's source-`q` row remains centered
   at `p`; global K4 after deleting that same original `q` supplies the exact
   q-deleted/q-critical row at each named dangerous center.  Every such row
   has two support points outside the full live row.  The checked criticality
   bridge retains the raw full radius filter, and the checked pair classifier
   yields the two cross-survival arms or its exact metric residual.
   The formerly proposed uniform hit
   `p ∈ G.support ∨ otherCenter ∈ G.support ∨ coherentSource ∈ G.support`
   is overstrong in the local exact algebraic model and is retired.
   The correct checked finite boundary is instead: either an off-live
   generated point lies outside the physical middle row and constructs a
   provenance-retaining `CommonDeletionTwoCenterPacket`, or both named
   support-only points lie in the generated support.  Independently, every
   live-heavy generated row is already `False` or has a support point outside
   both the live row and `oppCap2`.
   `confined-terminal/OriginalQConfinedTerminal.lean` kernel-checks the
   constructor-sensitive live-heavy counting/geometry argument at both named
   centers, so every checked live-heavy generated row now unconditionally
   yields the provenance-retaining outside-middle successor.  The remaining
   live-heavy consumer must give that new generated-source successor an
   immediate cap/MEC/order/global-critical-map sink or a genuine monotone
   measure.  The new source is outside the old middle row, while the
   old two-off-live robustness proof requires its source inside that row; the
   polarity is opposite, so the old handler must not receive the new witness.
   Reclassification alone can revisit the same F2 surface.  The preferred
   next theorem is therefore direct `False` for the generated-source
   successor while retaining the full frontier, cap/MEC and origin packet;
   adding a provenance tag without a consumer is not closure progress.

The generated-successor boundary is now mechanically connected to that full
parent surface and has two genuine terminals:

- `generated-successor-parent/GeneratedSuccessorParent.lean` pins the exact
  MEC/cap, second-large-cap, common-critical-map, frontier, anchored origin,
  aligned F2, generated row, and outside-middle successor in
  `OriginalQOutsideMiddleSuccessorParentSurface`;
- `generated-successor-parent-entry/GeneratedSuccessorParentEntry.lean`
  proves that the existing full-parent extractor reaches the exact
  origin-tagged coordinator, and that the native anchored live-heavy callback
  constructs both the `x` and `y` full-parent successor surfaces without
  assuming either generated row or successor.  The native mixed callback
  honestly returns `False`, one such surface, or the existing
  `MixedConfinedResidual`; it is not forced into the successor arm;
- `generated-successor-pair/OriginalQGeneratedSuccessorPair.lean` retains the
  two live-heavy generated rows and both successors in one packet.  Its exact
  initial source split is: distinct successor sources; equal source with cross
  survival at `x` or `y`; equal metric source at `p`; or equal equilateral
  source at `S.oppApex2`.  The checked
  `equal-source-metric-terminal/EqualSourceMetricTerminal.lean` eliminates the
  entire equal-metric-source-at-`p` constructor, uniformly over all four
  q-deleted/q-critical generated-row combinations.  Its source-clean
  `ReducedSourceSplit` has four constructors at that intermediate boundary:
  distinct sources, the two oriented equal-source cross-survival arms, and the
  second-apex equilateral arm.  The later postmix reduction described below
  removes that last constructor from the current frontier;
- `qcritical-metric-terminal/OriginalQCriticalCriticalMetricTerminal.lean`
  proves that any ambient point common to both metric-residual generated rows
  is `p` or `S.oppApex2`.  When both generated constructors are q-critical,
  their common point `q` therefore gives `False`: the live critical row
  excludes `q = p`, and
  `generated-successor-parent-facts/QNotSecondApex.lean` derives
  `q ≠ S.oppApex2` from the retained parent hypothesis `q ∉ M.verts`.
  `ParentQCriticalMetricTerminal.lean` kernel-checks the complete
  full-parent composition with no free exclusion premise;
- `qcritical-continuation-reduction/` composes that terminal with the exact
  continuation classifier.  At full-parent strength, two q-critical
  constructors now reduce assumption-free to the two oriented
  cross-deletion-survival arms.  This is the complete surviving continuation
  surface for that constructor pair, not `False`;
- `qcritical-common-outside-terminal/` consumes the first useful part of that
  surface.  The common q-critical point `q` is already outside `oppCap2`, so
  any second common generated-row point outside that cap is contradictory.
  In particular, an equal chosen successor source closes as soon as it is
  explicitly outside `oppCap2`; in the distinct-source case, one off-cap
  chosen source plus its reciprocal generated-row membership suffices.  Bare
  cross-deletion survival supplies neither cap placement nor reciprocal
  membership, so those remain producer facts;
- `qcritical-cross-sink-match/` sends either oriented q-critical
  cross-survival arm into the strongest existing source-faithful global
  selection normal form.  Its exact endpoints are three
  `CommonDeletionTwoCenterPacket` variants, `ApexDoubleCriticalResidual`, or
  `DeletedBlockerApexAlignment`.
  `qcritical-endpoint-integration/QCriticalEndpointIntegration.lean` now
  closes `DeletedBlockerApexAlignment`: the aligned blocker is the original
  deleted point `q`, while the q-critical generated support omits `q`.
  The full-parent q-critical normal form therefore retains exactly four
  endpoint classes: the two escape/common-deletion orientations,
  `ApexDoubleCriticalResidual`, and relocated-blocker common deletion.  This
  remains a checked downstream reduction, not `False`;
- `qcritical-rank-integration/` combines both source-exact rank classifiers
  with the q-critical common-outside terminal.  An outside-`oppCap2` source is
  now explicitly omitted by the opposite generated row.  If the two chosen
  sources are equal, a single shared ordered-cap presentation proves that the
  two companions cannot both occur: the two equal-radius statements would
  put `x` between `y` and the source and simultaneously put `y` between `x`
  and the source.  Thus the equal-source q-critical residual has at least one
  opposite companion omitted, in addition to cross survival;
- `equal-source-metric-terminal/` observes that every `MetricResidual`
  already contains both opposite named centers in the completed generated
  rows.  Away from the deleted original point `q`, completed-row membership
  descends to raw generated-support membership in both the q-deleted and
  q-critical constructors.  In the live-center arm the common source is
  `p`, and `p,x,y ∈ oppCap2`; the shared ordered-cap theorem then makes the
  two mutual companion incidences contradictory.  This closes both the
  non-equilateral and equilateral live-center subcases directly.  The former
  strict-`oppCap1` common-hit, surplus-heavy, and reverse-equality routes are
  diagnostic only: the native supports intersect exactly at `{p}`; the
  surplus-heavy completion equality has the wrong polarity; and
  `reverse-equality-producer/` proves that the first two proposed reverse
  equalities already identify two distinct witnesses with the same coherent
  source, while the third is redundant.  These impossible packets must not
  be mined as positive producers;
- `second-apex-equilateral-terminal/` proves the tetrahedron exclusion and
  q-deleted fourth-slot reroute.  The exhaustive successor
  `second-apex-constructor-split/` now removes both homogeneous constructor
  pairs: q-critical/q-critical closes through the existing shared
  `q`/second-apex outside pair, while q-deleted/q-deleted either supplies an
  off-live outside-middle successor or closes because both rows share the
  second apex and retained coherent source outside `oppCap2`.  In each mixed
  constructor pair, either one side reroutes source-faithfully or the exact
  residual is complementary:

  ```text
  q-deleted row:  coherent source + one of {s,t}
  q-critical row: coherent source omitted + the other of {s,t}.
  ```

  `mixed-second-apex-eliminator/MixedSecondApexEliminator.lean` now closes both
  mixed residuals.  The two support-only points and the physical second-apex
  row lie on one positive radius; the generated-row equalities make them the
  two opposite equilateral intersections, so their sum is twice the second
  apex.  They and the second apex are therefore three distinct collinear
  carrier points, contradicting convex independence.  The resulting
  `SecondApexRerouteReduction` has only the two source-faithful reroutes;
- `generated-successor-rank/CapRankOppositeSide.lean` and
  `generated-successor-geometry-rank/GeneratedSuccessorGeometryRank.lean`
  give the strongest honest ordered-cap handoff at each named center.  The
  exact alternatives are: the successor source leaves `oppCap2`; the
  opposite named companion is omitted from the generated support; or the
  two cap points define a certified opposite-side rank move.  The
  q-critical coherent-predecessor terminal is retained as a universal
  omission field.  No cap membership is inferred from support omission.
- `generated-successor-source-split-audit/REPORT.md` matches every
  original `SourceSplit` constructor against the checked banks.  Its
  live-center status is superseded by the direct terminal above.  The
  distinct-source and cross-survival arms still need a
  `CommonOutsidePair` across the two generated rows; in the
  q-critical/q-critical specialization, the existing common point `q`
  reduces this to one additional common outside-cap point, and in an
  equal-source cross arm to the shared source lying outside `oppCap2`.
  The second-apex/equilateral constructor now has no residual metric arm:
  homogeneous pairs close, both mixed complementary-`{s,t}` packets close by
  the collinearity theorem above, and every surviving outcome is a concrete
  non-apex outside-middle reroute at `x` or `y`;
- `reduced-frontier-integration/ReducedFrontierIntegration.lean` composes the
  two latest reductions at full-parent strength.  Every generated-successor
  pair is now either: at least one q-deleted exact generated row together with
  the five-way `PostmixSourceSplit`; or two q-critical exact rows together with
  an actual oriented `LiveDeletedCrossSurvival` and its four-class
  `ReducedCrossSinkNormalForm`.  `second-apex-postmix-wiring/` supplies the
  source-clean split and conversions from both reroutes back to
  `OriginalQOutsideMiddleSuccessor`.  This is the current branch-exact
  coordinator; it introduces no new `False` claim;
- `postmix-reroute-consumer/PostmixRerouteConsumer.lean` corrects one interface
  loss in that coordinator.  A bare `PostmixSourceSplit` forgets that each
  reroute came from equal predecessor sources at `S.oppApex2` and from the
  equilateral residual.  The history-retaining split preserves those facts.
  Each reroute then has an exact two-arm outcome: an outside-`oppCap2` source
  omitted by the opposite generated row, or an in-cap source carrying a
  certified opposite-side rank relative to the other live-heavy center.  If
  the outside source occurs in the opposite row, the shared second apex and
  that source form the checked common-outside-pair terminal.  The surviving
  rank arm is not a descent: the packets still lack one fixed ordered-cap
  presentation, a cross-step center-index link, a decreasing measure, and a
  no-wrap theorem.

All of these declarations fresh-check with only `propext`,
`Classical.choice`, and `Quot.sound`.  This closes both the
q-critical/q-critical metric subcase, the whole equal-source live-center
constructor, and both mixed second-apex metric packets, but not a production
`sorry`.  The remaining live-heavy frontier is the five-way postmix split
(distinct sources, two oriented cross-survival arms, and two concrete
outside-middle reroutes), the four endpoint classes in the
q-critical cross-survival arm, the other generated-constructor/continuation
arms, and the source-exact cap/rank alternatives.  The immediate q-critical
targets are the two escape/common-deletion orientations,
`ApexDoubleCriticalResidual`, and relocated-blocker common deletion.  The
second-apex metric target is closed; its surviving reroutes now re-enter the
ordinary outside-middle-successor surface with source distinct from the second
apex.  A rank move is not terminal until a
cycle-wide no-wrap or well-founded argument is proved, and the
outside-cap/companion-omitted arms
still need a full-parent cap/order or global-critical-map consumer.  Do not
revert to an anonymous
`CommonDeletionTwoCenterPacket → False` target or restart local selected-four
mining.

The independent global-minimality/cap-count proposal has also been audited
against the current theorem bank and corrected structural census.  Its
nonacute cap chain, one-sided cap distance injectivity, cap-cardinality lower
bounds, cross-cap outside-pair center injectivity, and resulting count bound
already have production Lean counterparts.  Its strong-connectivity claim
for an arbitrary selected witness digraph is valid, but production already
contains the stronger closure form
`FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`; all 101 corrected
structural survivors satisfy full closure from every one-point seed, so this
minimality condition removes 0/101 at that abstraction.  The
selected-row/minimality route is therefore **blocked at the current pure
structural abstraction**, not merely unfinished; this does not rule out a
metric-enriched use of minimality.

The proposed cap-order idea must be split into a geometric producer and a
consumer.  The implication from the stated crossing inequality to the
semicomplete strict disk-containment alternative is kernel-checked, but that
containment packet is not contradictory.  The stronger strict-distance
bridge is now production Lean:
`ATail/CapCrossingKalmanson.lean` proves both crossed-quadrilateral Kalmanson
inequalities for four increasing vertices of one convex CCW boundary and the
five-point selected-row terminal
`false_of_selected_rows_in_five_ccw_order`.  The focused production target
builds with exactly `propext`, `Classical.choice`, and `Quot.sound`; no
solver-backed or scratch-only axiom is involved.

The first bounded consumer audit is now exact for the stored prefix.  After
quotienting distance terms by selected-row equalities, ordinal Kalmanson
closure rejects all 101 corrected shadows: 89 have a one-step strict
self-cycle and 12 have a two-step cycle.  The formerly bank-clean terminal
shadow has a particularly small three-row certificate in the pinned order
`O < A < Y < E < C`: the `Y` row and `O,A,Y,E` give `OA < AE`; the `O` and
`A` rows and `O,A,E,C` give `AE < OA`.  The two normalized inequalities sum
with integer multipliers one to `0 ≥ 2`.  Exact rational LRA replay rejects
both the terminal Kalmanson-only system and the version with all triangle
inequalities.  The independently replayable artifact is
`scratch/atail-force/global-minimality-connectivity-audit/kalmanson-consumer/`;
it pins checkpoint SHA-256
`b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9`.

The source checkpoint status remains
`SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW`; the 101 observations alone were
not coverage.  The fresh continuation now enforces ordinal Kalmanson
inconsistency as a prefix-monotone rejection rule and returns
`UNSAT_EXHAUSTIVE_FINITE_DFS` for the fixed fourteen-role
`PROFILE = (8,4,5)` surface.  It uses 110 prefix checks, 82 Kalmanson
rejections, zero DFS nodes, and zero formal-bank-cut rejections.  More
sharply, the fixed ambient plus `O/A/D/t1` row packet is consistent, but every
admissible singleton selected row at each of `X`, `I`, and `F` is already
Kalmanson-inconsistent: `401/401`, `328/328`, and `328/328` respectively.
An independent verifier reconstructs all candidate domains and replays both
the 101-prefix certificates and the three empty singleton domains.

The raw domain counts include candidates already rejected by the older
compatibility and pair-capacity gates.  After those old gates, the new
Kalmanson cut is load-bearing on exactly `70/70`, `69/69`, and `65/65`
candidates at `X`, `I`, and `F`.  The 70 live `X` cases compress to four
named-row footprints and five `(footprint, shortest-cycle-length)` schemas;
all are instances of the one generic equality-quotient/strict-cycle
consumer, not 70 unrelated metric theorems.

The direct source-interface smoke theorem is also checked:
`kalmanson-terminal-bank-adapter/` converts six actual
`SelectedFourClass.support` memberships at rows `O`, `A`, and `Y` into the
production five-point contradiction.  A forward-only direct-row matcher
finds that exact schema in all 101 saved corrected witnesses, with 383
embeddings; the formerly bank-clean witness has the canonical
`O,A,Y,E,C` embedding.  This strengthens the saved-prefix explanation but
does not turn a prefix into coverage.  The clean corrected-map CEGAR run that
uses only this direct schema confirms the boundary: after 51 valid direct
cuts, iteration 52 returns
`SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW`.  Thus the direct theorem is a
useful bank consumer, but fixed-profile coverage requires the generic
equality-quotient/strict-cycle consumer or its compressed finite schemas.

This exhausts the fixed finite model, not the live parent.  The model does not
prove that every larger carrier has a selected row supported inside the same
fourteen roles, nor that every live branch instantiates the pinned profile and
fixed named rows.  The parent-order audit now separates the gap precisely:
`kalmanson-parent-order-adapter/` kernel-checks one shared ambient boundary
and the honest order dichotomy `O,A,x,y,C` or `O,A,y,x,C`, up to orientation,
for two distinct strict first-opposite-cap points.  Boundary enumeration is
therefore no longer the blocker.  The live parent does not currently export
strict first-opposite-cap placement for finite role `E`, any second role `Y`,
the directed `Y`-before-`E` arm, or the three source-exact selected rows and
six memberships consumed by the terminal.  `PinnedHullOrder` cannot fill the
gap because it assumes `IsM44` while this leaf carries `hNoM44`.

The actual-frontier match audit now rules out a smaller hidden application.
`frontier-kalmanson-match/FrontierKalmansonMatch.lean` instantiates the
four-point ordinal theorem with the real frontier roles: the first apex and
the blocker at `pair.q` cannot both be equidistant from `pair.q,pair.w` in
the directed boundary order `first apex < blocker < pair.q < pair.w`.  This
conditional terminal is kernel-checked with only the three standard axioms.
No live frontier arm supplies both its cross-membership equality and that
order.  In fact the cross-membership arm has the opposite-side/alternating
geometry, while the deletion-survival arm lacks the row equality.  The
five-point terminal likewise has no source-valid assignment of its two
additional roles and six row memberships on the current parent surface.
The absent adjacent order is therefore an impossible packet, not a producer
target.

The remaining source-valid continuation is now sharper.  The checked
`third-center-common-pair/` saturation theorem shows that a genuinely third
actual blocker whose selected row contains the frontier pair is already an
impossible terminal.  `anchored-double-deletion-producer/` then closes the
logical loop: outside the exact-card-four escape and on the directed cross-hit
arm, both prescribed frontier deletions fail at an actual blocker if and only
if that blocker is the known `q`-blocker.  Thus a distinct double-blocked
source is provably nonexistent; asking the parent to produce one is already a
direct contradiction target, not an intermediate producer.

The honest residual is a source-indexed survival cover.  Exact support locking
bounds the known `q`-blocker fiber by four.  Since `9 < D.A.card`, at least six
sources lie outside that fiber, and every such source preserves deletion of
`q` or preserves deletion of `w` at its actual blocker.  On the actual R
surface the small-card bypass supplies `14 <= D.A.card`, so at least ten
sources remain.  One survival color contains five sources, while every actual
blocker fiber has cardinality at most four.  The kernel-checked theorem
`exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen` in
`survival-cover-bank-match/` therefore retains two outside-fiber sources with
distinct actual blockers and constructs a `CommonDeletionTwoCenterPacket` for
deleting `q` or `w`.

The stronger theorem
`exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen`
closes the physical-alignment gap.  Since both anchored frontier deletions
already preserve K4 at `S.oppApex2`, one of the two distinct actual blockers
can be paired directly with that physical apex.  The source-faithful output
retains the frontier deletion, an outside-fiber source, its actual blocker,
the blocker/apex inequality, and the physical-second-apex packet.

`common-deletion-uniform-consumer/CommonDeletionUniformConsumer.lean` consumes
that exact packet without using the cyclic generic expansion.  A point in its
second exact row but outside the first either gives a new physical-second-apex
row or a prescribed critical deletion.  The first case makes
`S.oppApex2` fully deletion-robust; the second reorients to swapped
`FA-UNIQ4`.  Its motive-valued endpoint
`card_ge_fourteen_survivalCover_false` exposes precisely the two missing
handlers.  Thus neither anonymous-center alignment, generic no-wrap recursion,
nor the full origin-tagged R callback tree is load-bearing on the primary
card-at-least-fourteen route.

The robust handler is not a black box anymore.  The checked equivalence in
`robust-second-apex-geometry/` reduces it to a large radius class of size at
least five or two distinct disjoint K4 radius supports.  The small-cap cases
close or enter protected unique-five, but the actual card-at-least-fourteen R
surface has opposite cap at least six and admits both normal-form arms under
the current cap/MEC bounds.  Do not mine another selected-four marginal at
this point: physical-apex criticality and center-map alignment are incompatible
with the robust hypothesis.  The missing input is a global critical-map or
cross-cap coupling theorem that directly excludes the two radius arms.
The `robust-second-apex-bank-audit/` threshold replay is the regression gate:
any proposed finite lift must state which cap-at-least-six/global fields remove
the explicit higher-cap modes, rather than reusing the cap-four 0/101 result.

The secondary cap reductions remain useful diagnostics.  At card at least
eleven, survival color times actual-blocker cap produces two sources whose
blockers lie in one closed cap; equal blockers put both sources in one exact
support, while distinct blockers acquire honest ordered ranks.  At card at
least fourteen, survival color times strict source-cap interior also produces
two same-cap sources.  Neither packet supplies the two shared outside support
points needed by the existing cap-center uniqueness sink.

The corrected 101-shadow Kalmanson audit in
`survival-cover-kalmanson-audit/` confirms that this is a real selection gap.
Every stored shadow has survival-cover output pairs, and many pairs give a
strict-distance cycle, but every shadow also has a valid non-cyclic output
pair; survivor 36 has no cyclic same-cap-blocker output pair at all.  The
production five-point pair is absent in 73/101 shadows.  Thus an existential
pigeonhole pair cannot be sent directly to the Kalmanson terminal without a
new canonical-selection theorem or stronger source-valid antecedent.  This is
exact within the corrected structural shadow bank, not a Euclidean
counterexample.

Alternatively, prove the complete actual-role five-point ordered
packet, including both named roles, the directed order arm, and all six
selected-row memberships consumed by the production Kalmanson terminal.  A
third option is a kernel-checkable coverage theorem mapping every live
frontier to an already checked terminal.  The direct-only corrected CEGAR test
has already produced an avoiding shadow, so no further literal replay of that
one schema should be mistaken for fixed-surface or live-parent coverage.

`actual-five-point-kalmanson-packet/` now fixes the honest five roles to the
live objects `O = oppApex1`, `A = oppApex2`,
`Y = centerAt frontier.q`, `E = frontier.q`, and `C = surplusApex`.  With rows
at the actual sources `E,C,O`, three of the Kalmanson terminal's six support
memberships are automatic source memberships; the remaining three are exact
cross-source incidences.  The adapter is kernel-checked, but the current
frontier does not construct it.  Its first missing fact is
`O ∈ support (H.selectedAt E)`; independently it still needs the blocker-map
edges `centerAt C = O` and `centerAt O = A`, the other two cross incidences,
and the directed actual boundary order.  This is a complete consumer boundary,
not evidence that the five-point packet is close to production.

Record the five-point route as a bounded metric fallback with a passed
fixed-surface gate, not as the primary producer.  The source-faithful physical
second-apex consumer now supersedes generated-successor work whose sole purpose
was to close the card-at-least-fourteen R surface.  Do not mine an unanchored
"third center" or a
distinct double-blocked blocker: their terminal, exact negation, fiber bound,
and total-map survival classifier are already kernel-checked.
The complete evidence and the two source-clean scratch corollaries are in
`scratch/atail-force/global-minimality-connectivity-audit/`.

Every endpoint above fresh-compiles with only `propext`,
`Classical.choice`, and `Quot.sound`.  The physical route reduces the R motive
to robust `S.oppApex2` or protected swapped `FA-UNIQ4`; those direct consumers
remain open, and no production `sorry` is closed.

The parent-level small-card orientation is now also checked.
`r-small-card-parent-bypass/SmallCardParentBypass.lean` proves that
`D.A.card ≤ 13` routes every chosen frontier directly to
`OriginalUniqueRadiusArm`, swapped `FA-UNIQ4`, or swapped `FA-UNIQ5`.
If the original first cap is small, the existing frontier is already unique;
if the second cap is small, a fixed-surplus swap and fresh frontier extraction
produce the protected swapped arm.  Thus no origin-tagged R handler is needed
through card thirteen.  The genuine R residual begins only when both
non-surplus caps have cardinality at least six, hence at carrier card at least
fourteen.

Reciprocal criticality is a checked dependency edge to the protected
packet-polymorphic `FA-UNIQ4` proof.  The separately user-owned `FA-UNIQ4`,
`FA-UNIQ5`, and `(6,5,4)` unique-row theorem targets remain required for
branch-complete parent closure.  The current 555/654 literal whole-shadow
queue is not itself load-bearing: the actual-frontier audit shows that those
cores neither produce a geometric consumer of the six-source survival cover,
the complete five-point packet, nor coverage.  Preserve the completed exact-CAS
artifacts, but stop the in-flight literal scans and launch no successors.
Resume computation only against one of the complete source-valid antecedents
above, or against a formal coverage statement whose immediate Lean consumer
is already identified.

LIVE-Q/C normalization is fallback risk reduction only.  Do not dispatch
their 31 holes individually while the parent bypass is viable.  Likewise,
finite certificates count as closure progress only when they eliminate a
whole symmetry orbit/schema, shrink a required checked certificate, or enter
a formal coverage theorem.  Literal-core accumulation and anonymous
support/fixed-class CEGAR are not the primary route.

Historical snapshot (audited 2026-07-09, build fingerprint `002b0247c64e`):
five declarations / 87 holes; P97 spine 23/1827 open; P96 spine 27/1835
open; endpoint umbrella then at `Base.lean:10070` with holes
`:10097`/`:10119`.

The matrix decomposes the 32 holes into producer families and also records
non-`sorry` publication gates. Front-B/ERASE card 11 is closed. Front-A card 11
is not: the live declarations carry only `9 < D.A.card`, the two-large-cap
bridge gives `11 ≤ D.A.card`, and no named card-11 contradiction is imported.
Census554 is a conditional alternative: it is unnecessary only if the uniform
ATAIL producer covers card 11.

**Reproducibility checkpoint (dated 2026-07-09).** The focused pinned-surplus
build was green, and proof-blueprint reported build fingerprint
`002b0247c64e` with 6024/6024 mined symbols fresh. It saw two uncommitted Lean
paths, `PinnedSurplusBank.lean` and `U3ToU5Terminal.lean`. The source
declarations remained open, so this was checkpoint evidence, not a passing
publication gate. Re-run `CTRL-GRAPH` rather than reusing these particulars.

## Execution contract

Every matrix row must identify an existing spine consumer before adding a new
`sorry`. New helper statements land sorry-free; if a genuinely new open
theorem is unavoidable, its consumer must land in the same change so the new
declaration is immediately on the kernel spine. No wrapper-only reformulation
counts as progress.

For a Lean row, acceptance is:

1. `proof-blueprint anchor list` and a fresh diff show that no active owner is
   being overwritten; a closed or stale anchor is cleared by its owner, never
   by another session;
2. no other top-level build or direct Lean compile is active in this project;
3. `lake-build <smallest affected module target>` succeeds;
4. `proof-blueprint index --refresh` reports the source index in sync;
5. `proof-blueprint refs --refresh`, then `proof-blueprint refs --check`,
   establish that the mined graph describes that build;
6. `proof-blueprint spine <consumer-symbol>` shows the intended dependency;
7. `proof-blueprint axioms <new-terminal-symbol>` shows only Lean core axioms
   (including `Lean.ofReduceBool`/`Lean.ofReduceNat` when present) and the
   explicitly approved `Lean.trustCompiler` boundary when `native_decide` is
   used;
8. for every `native_decide` terminal, the evaluated decision-procedure
   closure is audited for `unsafe`, `@[implemented_by]`, and `@[extern]`; and
9. the row's targeted tests in the closure matrix pass.

Only the final publication row runs the full project build, refreshes kernel
references, and invokes `proof-blueprint verify-publish` on both targets.

Two fronts. Front A is the two-large-cap (¬M44) branch; Front B is the M44
branch. They are disjoint on the spine (the `removableVertexOfLarge` case
split: `of_isM44PinnedSurplus` vs `of_nonIsM44`).

## Retained decisions from the archived 2026-07-06 plan

The archive preserves detailed logs; these constraints remain active here:

- exact two-hit witnesses refute the former interior one-hit bounds, so the
  erased-pin route must use the specified P4/P2 producers rather than revive
  `leftAdjCount ≤ 1` or `rightAdjCount ≤ 1`;
- the exact ten-label bank closes only the `m = 5` pinned-surplus regime; it is
  not a general-`m` coverage theorem;
- equality-only and pattern-only statements do not close the card-`≥ 15` tail.
  Their known falsifying witnesses are non-convex, so they do not refute the
  actual `ConvexIndep` leaf; they rule out only that relaxed proof surface;
- multi-center work is off-spine until its selected-four representative
  surface is bridged to the exact `MC-CONSUMER` full-filter overlap target
  fixed on 2026-07-13 from the Front-A leaf hypotheses; and
- `Lean.trustCompiler` is the approved native-decision boundary, while anchors
  are ephemeral coordination hints rather than durable proof state.

---

## Front A — two-large-cap lane (leaves 1, 2)

### A.0 Verified structure (2026-07-09 source reads)

- Leaf 1's hypotheses carry `9 < D.A.card` with **no upper bound**
  (U1LargeCapRouteBTail.lean:2672); surplus cap `> 4` at `i`, second cap
  `≥ 5` at `j ≠ i`, `¬ IsM44`, center-K4 via `D`, critical shell.
- `capProfile_eq_554_of_card_eq_eleven` (line 2158) pins the cap profile to
  (5,5,4) exactly when `D.A.card = 11` — "the finite profile handoff used by
  the (5,5,4) census" (line 2155 comment).
- The (5,5,4) Python census space (`scratch/census-554/census554_lib.py`)
  encodes C1 center-K4, C2 two-circle, C4 strict convexity, and one-hit at
  V/W over the 11 labeled points. Its header records those cuts as proved
  necessary, and the Lean finite mirror reproduces the Python candidate
  counts. `Problem97.Census554.exists_card11SelectedCube_cubeOk` now assembles
  the theorem-level transport from the geometric card-11 leaf hypotheses to
  every `CubeOk` clause. At card 11 every point of `A` is labeled, so no
  additional unlabeled-point confinement condition is needed.

### A.1 Census554 card-11 alternative — paused, conditionally critical

**Dependency correction, 2026-07-13.** No current theorem closes the Front-A
card-11 slice. `Census554.false_of_cardEleven_twoLargeCaps` is still absent, and
the live declarations do not split away `D.A.card = 11`. Census554 may remain
paused while ATAIL targets the complete card-at-least-11 signature. If ATAIL is
weakened to `CARD-GE-12`, the terminal cover, Lean replay, card-11 consumer,
and leaf wiring become proof-critical rather than optional. The detailed
pipeline below remains the specification for that alternate discharge.

Pipeline (`scratch/census-554/frontier_loop.py`): lazy motif-embedding cover +
CEGAR mining at genuine frontiers, to UNSAT.

At the 2026-07-09 audit, the 18:32 snapshot was paused at 5,431 rows /
iteration 1154. A later process resumed it; at 19:40 PDT, lock-consistent file
evidence showed 5,444 raw bank rows and the log at iteration 1240. Direct
process-list access was sandbox-blocked. This is historical bank/log evidence,
not a current process claim: recheck A11-RUN before resuming, restarting, or
interpreting a terminal marker. There was no adjudicated terminal result at the
snapshot.

**Durable checkpoint, 2026-07-11.** The algebra bank was frozen at 5,836 raw
rows, SHA-256
`36348d35397a494bee5ac0ab9e423c20802e7aff45fa12f0530df36a57cfc43a`.
A merged separation probe at
`scratch/census-554/separation_probe_runs/transition-bank5836-structural36-20260711T185116Z`
reached a checked `combined-frontier` at iteration 231 with 1,602,162 dynamic
exclusions and 156,278 static instances, hence 1,758,440 total instances. Its
checkpoint SHA-256 is
`a34b5be871dc096fcdccab389955787cd9541c54b59afd609c209b17f7183ff8`.
The immutable ordered replay of every dynamic record passed, the source
database reopened with `integrity_check=ok`, and that terminal source remains
preserved as rollback evidence.

The mandatory theorem-bank preflight then found a convex structural
contradiction before algebra mining: four sparse rows force labels `3`, `8`,
and `10` onto the perpendicular bisector of the distinct foci `1` and `6`.
`Census554/FourRowPerpBisector.lean` packages this as the reusable,
relabel- and superpattern-stable
`FourRowPerpBisectorCore`; the focused build and both public axiom audits use
only `propext`, `Classical.choice`, and `Quot.sound`. This is a convex-carrier
consumer, not an unconditional `IsDead` or Nullstellensatz-bank theorem.

The approved static structural seed artifact has SHA-256
`be498bc8e31f32fa29d12f0a37c2c8776ce80dc16ab8c9d56b00396785372ad9`
and exactly 36 profile-orbit exclusions. The probe snapshots the seed, source
frontier result, and Lean theorem source separately; requires passed build
evidence; and rejects transition-time orbit loss, theorem-source drift, or
evidence downgrade.

The checked working-tree CEGAR refinement oracle now covers the formalized
structural core rather than only this one static seed. Its catalog contains all
thirteen alternatives in `GeneralCarrierBridge`; twelve are soundly detectable
from a raw equality cube. The exact-off-circle alternative is explicitly
disabled because a raw cube does not supply its required `ExactAt` premise.
The eligible surface is ten unordered theorem families plus the convex
five-point and convex rhombus/equilateral families, with both direct and
reversed cyclic-order detectors. Every emitted record carries a minimized
equality pattern, replayable row/flip closure paths, the exact Lean theorem and
source hash, and its pattern-orbit map. Unordered cores emit unconditional
sparse cuts. Ordered cores emit clauses scoped to the compatible
boundary-order selector, becoming unconditional only when every valid order is
excluded. Bank-motif refinement runs first; the structural scan runs exactly
when the candidate has no new bank embedding. The preservation-first
oracle-13 transition described below has now activated this complete catalog;
this is active-run provenance, not merely a working-tree capability.

**Six-point two-pair collision, formalized 2026-07-13 UTC.** The exact
iteration-1,203 recovery on support `{0,2,3,4,5,10}` produced nine equality
generators and a checked Singular/Rabinowitsch certificate forcing either
`4 = 5` or `5 = 10`. The independent generic Lean theorem
`EqualityCore.six_point_two_pair_collision` proves that the corresponding
roles force `D = E ∨ E = F`, and
`not_realizes_of_sixPointTwoPairCollisionCore` rules out an injective planar
realization. The detector replays all nine closure obligations and emits the
complete 12-image profile orbit. This is a PROVEN structural exclusion, not a
claim that its certificate has been banked or that the launch-pinned live
oracle already uses it. Recovery and certificate provenance are preserved at
`scratch/census-554/frontier_recovery_runs/run-20260713T030307Z-iter1203/`.

**Offline scheduling experiment, 2026-07-12.** The preservation-safe study in
`docs/audits/2026-07-12-census-554-structural-first-experiment.md` supports a
reversible structural-first canary, not an in-place policy rewrite. Across two
iteration-920 repeats, structural first reduced end-to-end wall time by
4.21--4.61%, active solver-plus-refinement time by 14.11--14.45%, and learned
cuts from 6,234 to 939 over 20 iterations. A clean 100-iteration comparison
showed a 34.74% wall reduction. Preseeding all 23,250 row-feasible
perpendicular-bisector templates was counterproductive and must remain off.
These are empirical throughput results only: they do not determine how many
iterations remain or establish closure. The experiment itself left the live
bank-first run untouched.

**Targeted bank-core replacement experiment, 2026-07-12.** The CPU-time study
in
`docs/audits/2026-07-12-census-554-perpendicular-core-replacement-experiment.md`
replaced the 1,207 bank motifs already containing the proved unordered
perpendicular-bisector core with their minimized structural cores. Across two
order-swapped 100-iteration repeats, solver CPU improved by 5.75%, but total
worker CPU regressed by 2.36% because the wrapper recomputed the replacement
map and learned more dynamic structural cuts. Therefore the current wrapper is
not a production transition candidate. The digest-pinned cached follow-up then
passed the same two-order gate: solver CPU improved by 5.32% and total worker
CPU improved by 2.73%, with byte-identical CNF and zero same-treatment database
differences. Status was **CPU-GATE PASS** for the exact frozen 5,836-row bank.
The preservation-first production transition described below has now
snapshotted the cache in a private successor, bound its digest and contract to
resume metadata, and exercised it live. A changed bank still requires
regeneration and a fresh audit.

**Production transition, 2026-07-12.** The required preservation-first switch
has now completed. The bank-first source stopped cleanly at iteration 1,873
with 2,215,432 dynamic records and remains available with two independently
validated rollback snapshots. Transition replay imported all 2,215,432
records, with zero seed collisions and zero inherited order-conditional cuts,
into
`scratch/census-554/separation_probe_runs/run-20260712T091653Z-structural-first-iter1873`.
The successor persists `refinement_order=structural-first`, keeps the bulk
preseed disabled, uses the same 5,836-row bank and seed, passed SQLite integrity
and an independent ordinary-probe replay, and then committed multiple live
structural-only refinements. The exact rollback and validation record is
`scratch/census-554/transition_snapshots/20260712T091653Z-bank-first-stopped/README.md`.
The separately changing mutable bank was intentionally not merged into this
scheduler-only handoff.

The active cached-run oracle snapshot freezes ten Lean source files and the built
`GeneralCarrierBridge.olean` (SHA-256
`9104b9a9d466801ab0894e5e2ff993d3ec91cbee4411ffb41c3b52342e09b96b`).
`lake-build Erdos9796Proof.P97.Census554.GeneralCarrierBridge` passed with
proof-blueprint build fingerprint `294acadba613`; the terminal axiom query is
exactly `propext`, `Classical.choice`, and `Quot.sound`. The Python catalog,
source snapshots, build artifact, and axiom result are evidence-bound by the
oracle contract, and transition replay fails closed on structural provenance
conflicts or algebra/structural provenance collisions.

The thirteen-alternative successor contract freezes eleven Lean source
files. Its focused aggregate build passed with proof-blueprint build
fingerprint `bd78491c38fd`; the resulting `GeneralCarrierBridge.olean` has
SHA-256
`b4a37e979bc93b843d5f3c5d8822c6563e924b0252b73910f085ed2b610958fb`.
The new core consumer and aggregate bridge axiom audits both report exactly
`propext`, `Classical.choice`, and `Quot.sound`. Oracle contract SHA-256
`5040043d196154501086163699026d48a2d9be64083fbec8c059b38656471b5d`
now binds these facts into the active successor.

A second preservation-first transition published
`scratch/census-554/separation_probe_runs/run-20260711T204242Z-40533-f03a883e`
with all 1,602,162 dynamic records retained, 156,278 static instances,
1,758,440 total instances, and zero target collisions. Its independent SQLite
reopen returned `integrity_check=ok` and the exact dynamic-record count. The
probe ran with a four-hour wall budget and 5,000-refinement ceiling and
checkpointed every iteration. It is now the stopped, preserved bank-first
source for the structural-first transition recorded above; do not mistake its
historical `progress.json` for current process state.

**Cached production transition, 2026-07-13 UTC.** The stopped structural-first
source was migrated into
`scratch/census-554/separation_probe_runs/run-20260713T015318Z-cached-perp-bank5836-from-iter1179`
under the source workdir lock. All 2,263,978 source records were preserved:
2,261,836 were imported as dynamic records and 2,142 were exact collisions
with the successor's 143,500-instance seed surface. The target retained the
same 5,836-row bank and seed, and bound the workdir-local cache SHA-256
`0a24950c5feeb41e4a214a7deebd69865e1eca662b08dcc5e338391e82b3b9ff`
to its run metadata. Its bank/cache hashes matched, SQLite returned
`integrity_check=ok`, exact reopen found 2,261,836 dynamic records, all focused
transition tests passed, and no staging or migration spool remained after
atomic publication. The source checkpoint/WAL/SHM hashes were rechecked after
publication and the source remains the immediate rollback. The durable record
is
`scratch/census-554/transition_snapshots/20260713T015318Z-cached-perp-bank5836/README.md`.

**Oracle-13 production transition, 2026-07-13 UTC.** The cached source stopped
cleanly at iteration 813 with 2,304,034 dynamic records and
`status=interrupted`. Under its workdir lock, transition replay reconstructed
all 2,304,034 records with zero target seed collisions and retargeted 88,350
structural records to the 13-family contract. The atomically published target
is
`scratch/census-554/separation_probe_runs/run-20260713T054559Z-oracle13-from-iter813`.
It starts from 143,500 static seeds and 2,447,534 total exclusions, binds cache
SHA-256
`bbd7b6aa6942b0f1b2c2c8da2365aa8a63d69a5f32edbbef7e07ddac9dbd4db0`,
and binds oracle contract SHA-256
`5040043d196154501086163699026d48a2d9be64083fbec8c059b38656471b5d`.
Independent reopen returned `integrity_check=ok` and the exact dynamic count;
all artifact hashes matched, the source hashes rechecked, and no transition
staging or union spool remained. The source and its byte-exact clone remain
rollback, with full evidence at
`scratch/census-554/transition_snapshots/20260713T050037Z-oracle12-stopped-iter813/README.md`.

**Oracle-13 terminal residual and mining handoff, 2026-07-13 UTC.** Oracle-13
exited cleanly at 00:54 PDT with `status=combined-frontier`, iteration 316,
2,464,637 total exclusions, and 4,440.017 seconds of cumulative elapsed time.
The formalized structural scan found no applicable core for the surviving
direct order (internal index 43); it did not report UNSAT. `result.json`,
`combined_frontier.json`, and `progress.json` are byte-identical with SHA-256
`63f69c20f5c166493a8bdd194c62d51b399d893d35fadb8341b74b8c7b918cad`.
An independent consumer recomputed `cube_ok`, the direct order identity and
labels, and the order/cube compatibility against the exact 5,836-row frozen
bank. Full and quick SQLite integrity checks returned `ok`, and neither the
checkpoint nor workdir lock retained a live handle. This is a terminal result
for the bounded oracle invocation, but it is a residual cube requiring mining,
not a Census554 closure result or geometric counterexample.

The generation-bound consumer
`scratch/census-554/frontier_mining_runs/run-20260713T081430Z-54070-30351c36`
completed with `status=certified` after 905.431 seconds. At minimum support 6,
Flux checked 158 of 178 candidates and the two-worker local share checked 20;
one selected motif survived exact shrinking and then passed certificate
structure, generator fidelity, and the exact Fraction identity gate. The
certified-artifact SHA-256 is
`7f8ad66760da4454785196771e2250491e1cddc03e9a4946f4a22e29ca8e47f6`.
After an independent exact replay and a fresh canonical-novelty check against
the then-current 5,898-row bank, the sole guarded publisher banked it as
`pat_05898`. This is a certified new exclusion and useful closure progress, not
coverage or a theorem by itself.

**Current paused checkpoint, 2026-07-13 11:00 PDT.** Census554 is fully
quiescent and recoverable. The authoritative bank has 5,939 rows, SHA-256
`02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2`.
The sole driver was interrupted outside a bank transaction after replaying
through iteration 173 (350,209 instances in 501 seconds); no transaction
journal remains. The bounded producer
`cube_prefetch_runs/run-20260713T161108Z-iter690-bank5934-rebase` reached its
natural `frontier-limit` with 2,428 attempts, 2,113,600 learned exclusions in
499 durable batches, and nine preserved frontier candidates. Its state
SHA-256 is
`c846a3c919d0a1573ce0900abd6e2336d4f045602f59547f9eead2eb0905fc62`.
No local driver, producer, retry drainer, certification worker, Census tmux
session, or bank transaction is live. All substantive shared-queue jobs were
moved to `paused/20260713T180000Z-off-critical-path/jobs`; AppleDouble `._*`
metadata files may remain in the active directory but are not dispatchable
jobs. Result files and durable state were preserved. Resuming requires an
explicit new resource lease, bank/hash recheck, and queue unquarantine.

**Historical operational split, 2026-07-13 02:53 PDT.** These were separate
lanes and must not be collapsed into one "live oracle":

1. Oracle-13 is **TERMINAL-COMBINED-FRONTIER**. Its tmux session exited, its
   final artifacts passed the independent generation, cube/order, hash, lock,
   and SQLite checks above, and it produced neither checked UNSAT nor a closure
   theorem.
2. The frozen residual consumer is **CERTIFIED-AND-PUBLISHED**. It exited after
   producing one exact motif; no consumer process remains. The motif passed a
   second current-bank novelty check and was published only through the sole
   guarded writer as `pat_05898`.
3. The stopped iteration-813 cached source and rollback clone remain
   **STOPPED-BOUNDED**. Never resume either concurrently with a successor.
4. The mutable-bank `frontier_loop.py` was live at this historical snapshot
   under the single driver lease in tmux `census554-loop`. The bank then had
   5,916 rows, SHA-256
   `ed1e86710748fe2e6b8298557aaf07a53a272b07accfb31dcbccc17ff1e12dbd`.
   Iteration 690 reached a genuine frontier, mined 14 minimal `k=7` patterns,
   certified one `multi_pair` motif, failed the other 13, and banked the success
   as `pat_05897`. The driver was then stopped after that atomic boundary,
   `pat_05898` was published, and the driver restarted from the new generation;
   it later stopped outside a bank transaction for a second guarded publication.
   Four independently exact-verified speculative motifs were fresh against the
   then-current bank and became `pat_05899` through `pat_05902`. A later
   four-record exact batch from attempt 1,475 passed the same current-bank and
   sole-writer gates and became `pat_05903` through `pat_05906`. Seven more
   exact records from attempt 1,486 became `pat_05907` through `pat_05913`
   under the same gates. Its hard rank 1 later passed a 1,380-second
   certification and the publisher's exact Fraction gate as `pat_05914`; the
   last attempt-1,683 candidate became `pat_05915`. After each transition the
   publisher exactly validated every admitted certificate and no transaction
   journal remained. The sole driver restarted from the 5,916-row generation
   and had replayed through iteration 23 at this snapshot.
5. Mine-only work is pipelined but cannot publish. A complete generation-bound
   scan checked all 291 iteration-690 `k=7` candidates on flux and the
   idle-gated MacBook, finding 73 heuristic dead candidates with zero worker
   errors. The remote greedy-shrink reached a fixed point after four complete
   rounds and 5,108 deletion trials with zero worker errors, retaining 73
   canonical candidates. Thirteen are exact canonical matches for the 14 live
   certification patterns; one additional candidate strictly strengthened the
   remaining live pattern by removing one equality center, but subsequently
   failed exact certification and was not admitted to the pending store. A
   four-core local producer solved an immutable iteration-690 CNF/bank snapshot,
   clause-checked every SAT model, validated `cube_ok`, and learned compact
   one-hot-equivalent exclusions for models hit by frozen-bank embeddings. It
   exited cleanly at its one-hour wall limit after 1,876 diversified models,
   1,729,607 learned speculative pattern instances, and seven preserved
   model-checked frontiers at attempts 560, 908, 1,475, 1,486, 1,510, 1,511,
   and 1,683. The two support-6 candidates from each of attempts 560 and 908
   passed exact certification, a fresh 5,899-row canonical-novelty check, and
   sole-writer publication as `pat_05899` through `pat_05902`. Attempt 1,475
   had no dead support-4/5 pattern; four support-6 hits shrank to four distinct
   candidates in two complete rounds, passed exact certification and a fresh
   bank recheck, and were published as `pat_05903` through `pat_05906`.
   Attempt 1,486 likewise had no dead support-4/5 pattern; eight support-6 hits
   reached a fixed point after three complete shrink rounds and entered the
   two-hour exact queue after proving distinct from both the current bank and
   the attempt-1,475 batch. Seven passed exact certification and a fresh
   5,907-row novelty check and were published as `pat_05907` through
   `pat_05913`. Rank 1 later passed exact certification, remained novel
   against the 5,914-row bank, and was published as `pat_05914`. Attempts
   1,510 and 1,511 are now covered by all four
   attempt-1,475 motifs. Attempt 1,510's four shrunk candidates are exact
   canonical duplicates of `pat_05904`, `pat_05905`, `pat_05906`, and
   `pat_05903`, so no redundant exact jobs were submitted; a direct
   all-AUTOS containment check found the same four motifs in attempt 1,511.
   Attempt 1,683 was the only remaining uncovered frozen frontier. It had no
   dead support-4/5 pattern; one of 202 support-6 candidates was heuristically
   dead, shrank twice and then fixed after 48 error-free deletion trials, and
   remained distinct from both the current bank and the attempt-1,486 batch.
   Its exact job passed with `kill=pair:7-9`; the publisher's Census-AUTOS
   key correctly distinguished it from a broader unlabeled-store digest match
   and banked it as `pat_05915`. Thus all seven frozen frontiers are now mined,
   covered by newer rows, or exactly published.
6. A fresh four-core successor
   `cube_prefetch_runs/run-20260713T093813Z-iter690-bank5914-rebase` was live at
   that snapshot and later stopped at its bounded frontier limit.
   It reuses the immutable 5,897-row CNF but matches every candidate against a
   separately hashed 5,914-row bank snapshot, so all 17 post-CNF motifs are
   filtered before a frontier can be emitted. At 02:53 PDT it had checked 516
   models, learned 612,895 bank-pattern exclusions, and found no frontier. The
   authoritative bank has since added `pat_05914` and `pat_05915`, so every
   future candidate still required a fresh 5,916-row recheck. The run was
   read-only and capped at four cores, one hour, 2,048 attempts, and eight
   frontiers.
7. The retry drainer was a separate resumable certification operation. Its
   running in-memory pass began from 105 failures, selected 87 retries, and
   confirmed 79 dead. A current-bank audit later proved that all 16 atomic
   records already in `retry_certified_pending.d` are exact Census-AUTOS
   duplicates of `pat_05868` through `pat_05883`; the 41,004,168,111 bytes of
   certificate payload therefore require no republication. The durable mapping
   is `retry-certified-pending-current-bank-audit.json`. That audit also exposed
   a liveness-only deduplication bug: the store and retry selector used the
   broader arbitrary-relabeling key rather than the bank's AUTOS key. Two
   bank-distinct failed motifs had been suppressed solely by that coarser key;
   both passed a fresh exact deadness recheck. The store now collision-safely
   preserves broad-isomorphic/AUTOS-distinct records, the next retry scan uses
   the bank identity, and the expanded 144-test Census-554 suite passes. Evidence and the
   two recovered patterns are in
   `retry-autos-dedup-recovery-20260713.json`. The already-running pass retains
   its old in-memory selection at that snapshot; no drainer is live now, and a
   fresh pass is required to exercise the fix.
8. Flux's 14 mine slots are the dependable remote baseline. MacBook slots are
   opportunistic and exist only while its idle gate is open. This host runs the
   two-hour/high-memory certification and local fallback lanes; four local cores
   produced the bounded speculative run above. At 02:08 PDT the post-run audit
   showed about 55.8 GB immediately free, 95% system memory availability, no
   throttled pages, and 33.69 MB of stable swap use. Cube generation need not
   pause during certification while repeated audits retain comparable headroom;
   do not describe the current host as having literally zero swap activity.

Before launching or transitioning another heavy oracle, pass `CTRL-RESOURCE`:
enumerate native Lean evaluation, Singular retry/frontier workers, mutable-bank
mining, speculative producers, and theorem-oracle runs. The local worker is
cert-only with four slots; a system memory guard caps any one Singular at 64 GB
and intervenes on memory pressure. Flux and the MacBook are mine-only. Resource
headroom and live process ownership must be rechecked before changing these
limits; a stale heartbeat or pid file is not capacity evidence.

This mixed-source machinery is valid for externally trusted CEGAR exploration,
not yet for final Lean publication. Python detections and boundary-order tests
are replayable and theorem-linked, but are not Lean proof terms. Final
publication still requires a checked Lean replay of every used structural
record, including a checked bridge from the Python direct/reverse order test to
the corresponding Lean orientation premise.

**Correct interpretation of a future solver UNSAT:** CaDiCaL UNSAT would be an
EMPIRICALLY VERIFIED coverage result for the exact emitted Python CNF and its
frozen formula sources. In an algebra-only run it says that every candidate
cube contains an encoded bank-motif instance. In a mixed-source run
it says that every candidate cube hits either an algebra motif or a separately
identified convex structural exclusion. It would not, by itself, prove the
geometric card-11 theorem or close a Lean leaf. The permanent
terminal publisher now re-solves the persisted CNF, requires `drat-trim`
verification, emits core CNF and LRAT artifacts, takes a lock-consistent bank
snapshot, and records source row, canonical motif, support injection, emitted
pattern, and clause provenance. It writes the completion marker last. Unit
fault gates and a real tiny CaDiCaL/`drat-trim` integration test pass. The
frozen-probe publisher separately publishes `UNSAT-verified` only after a
proof-producing re-solve and `drat-trim`; that remains an empirical CNF result,
not the final cover publication or Lean replay. The mandatory consumer command
`uv run python -m census.census_554.verify_completion --root scratch/census-554`
rejects the legacy marker schema and independently rechecks all hashes and DRAT.

The historical Census-based independent card-11 replay has seven obligations:

1. freeze the terminal bank and cover-instance snapshots, with digests, and
   independently validate every certificate used by the cover;
2. prove that the geometric card-11 data induces a `CubeOk` cube, including
   the necessity of C1/C2/C4/one-hit at exactly the centers where imposed;
3. replay per-pattern certificate deadness in Lean for every bank motif used;
4. define motif containment and prove that every injection of a motif's
   support into `Fin 11` extends to a total injective relabeling of `Fin 11`;
5. apply the proved similarity/relabeling theorem
   `Problem97.Census554.motif_transfer`;
6. kernel-check that the motif-closed bank covers every `CubeOk` cube; and
7. package the resulting contradiction and wire the card-11/`CARD-GE-12`
   split into the actual Front-A leaves.

Obligations 2, 4, and 5, plus the mathematical checker core needed for
obligation 3, are complete. A.2 tracks the remaining artifacts. They gate
closure exactly when the ATAIL producer starts at `CARD-GE-12` or later; a uniform
card-at-least-11 producer supersedes them.

Operational code now has a shared lifetime driver lease, a separate bank
transaction lock, max-suffix PID allocation, canonical dedupe, exact precommit
certificate validation, a crash-recovery journal, fsynced atomic certificate
publication, and fsynced atomic bank replacement. The child publisher used
this path successfully for `pat_05443`. Cross-process and fault-injection tests
pass. The frozen probe launched after the safe transition later reached the
terminal combined frontier and released its lock; the historical rollback was
neither resumed nor destroyed. Permanent migration is partial:
`census/census_554/` owns the protocol, terminal gate, structural auditor,
combinatorial core, and self-contained smoke/tests, while the driver, miner,
verifier, changing bank, and large certificate artifact remain under
`scratch/`. See
`docs/audits/2026-07-09-census-554-parallel-work-audit.md`.

Stop conditions that would revise this section: a frontier cube with no
minimal dead pattern (a genuinely ALIVE cube ⇒ the census finds a candidate
11-point counterexample-consistent class system — a mathematical finding, not
a tooling failure), or systematic certify failure.

**ALIVE adjudication contract.** Keep three claims distinct: an ALIVE Boolean
cube, an exact-coordinate `RealizesCube` witness, and a configuration satisfying
the full Front-A leaf hypotheses. The first is only a cover failure; the second
needs an independent exact realization check; only the third can challenge a
geometric necessity claim. The outcome record must identify its level, complete
assumption ledger, source hashes, and independent verifier before any restart or
route change.

### A.2 Conditional Census554 Lean transfer — specified steps

Ordered; each step names a buildable artifact. Status is controlled by the
corresponding closure-matrix gate, not by prose completion claims.

1. **Finite space defs in Lean**: the 11-point profile, candidate classes
   (C1/C2/C4/one-hit filter) as decidable defs mirroring `census554_lib.py`.
   **Mirror BUILT 2026-07-09**: `lean/Erdos9796Proof/P97/Census554/Space.lean`
   (`OnehitOk`/`IsCandidateClass`/`candidateClasses`/`Cube`/`CubeOk`, all
   decidable); encoding validated by kernel-`decide` smoke anchors — the
   per-center class counts (210, 43, 16, 210) match
   `len(census554_lib.candidates(p))`.
   **Status: DEFINITIONS AND GEOMETRIC NECESSITY BRIDGE COMPLETE (matrix
   A11-GEO-*).** `Census554/GeometryBridge.lean` now provides:

   - `Card11CapLabeling.nonempty_of_card_eq_eleven`, which constructs an
     injective `pointOf : Fin 11 → ℝ²` with range `D.A`, puts the three Moser
     apices at labels 0/1/2, and maps the canonical blocks 3--5, 6--8, and
     9--10 exactly onto the `(3,3,2)` strict cap interiors;
   - `Card11SelectedCube.ofGlobalK4` and `Card11SelectedCube.cube`, which choose
     one proved-nonempty `SelectedFourClass D.A (pointOf p)` per label and pull
     its support back through `pointOf`;
   - `image_cube_eq_support` and `equidist_of_mem_cube`, the exact
     schema-neutral facts needed to construct the future `RealizesCube`
     relation without repeating geometric reasoning;
   - `cube_card`, `center_not_mem_cube`, and `cube_inter_card_le_two` for C1/C2;
     `pair_hit_centers_card_le_two` for C4; and
     `onehitOk_of_capProfile` for the two V/W one-hit conditions; and
   - `Card11SelectedCube.cubeOk` plus
     `exists_card11SelectedCube_cubeOk`, which package the complete necessity
     bridge from the card-11 two-large-cap hypotheses to `CubeOk`.

   The targeted `lake-build` succeeds. The source contains no
   `sorry`/`admit`/declared axiom, and live axiom queries for
   `Card11CapLabeling.nonempty_of_card_eq_eleven`,
   `Card11SelectedCube.cubeOk`, and `exists_card11SelectedCube_cubeOk` report
   only `propext`, `Classical.choice`, and `Quot.sound`. Step 3/A11-COVER-REL
   now defines `RealizesCube` and proves the selected-cube adapter directly
   from `L.injective` and `S.equidist_of_mem_cube`.
2. **Certificate checker**: verified Lean checker for the banked certificate
   format (Σ cᵢ·gᵢ = 1 over ℚ) + generated pattern data. Kernel-checked via
   `decide`/`native_decide` under the bv_decide standard (verified decision
   procedure, no `@[implemented_by]` in closure).
   **Feasibility remeasured 2026-07-09** by the permanent structural auditor at
   5,443 unique cert paths: median 54,787 B, p90 7,193,804 B, p99 365,247,505 B,
   max 2,281,208,887 B, 157 files over 100 MiB, and 78,158,578,373 B total.
   About 4,900 certs at most
   10 MB account for only a few GB; roughly 475 heavy `multi_pair` certs carry
   most of the bytes and cannot be replayed
   through the kernel as-is. Smallest certs are all `base` kills, largest
   all `multi_pair`. Named residual: a shrink strategy for the heavy tail —
   re-lift with different order/strategy, split multi_pair kills into
   per-pair sub-certificates, or re-mine alternative patterns at the
   affected cubes. The terminal checker now invokes `drat-trim -c/-L`, maps
   core exclusion clauses back to exact manifest rows, and records core source
   cert sizes. Apply shrinking only to that core; exact full-bank replay is a
   freeze audit, not part of terminal SAT-proof publication (matrix A11-CORE
   and A11-CERT-*).
   **Format verified 2026-07-09** (`certs/pat_02213.json`, schema
   `census554_pattern_certificate.v1`): `variables` (gauged coordinate
   names), `generators` (polynomial strings), `generator_tags` ([c,a,b] =
   the generator is d²(c,a)−d²(c,b)), `coefficients` (one per generator;
   identity Σ cᵢ·gᵢ = 1), `rab_pairs` (Rabinowitsch t-var generators, empty
   for base kills), `python_exact_identity: true` (exact Fraction recheck
   passed at banking). The Lean checker must RE-DERIVE the generators from
   `pattern` + gauge (not trust the strings) and then verify the identity;
   `IsDead` (MotifTransfer.lean) then follows by evaluation, giving
   emptiness per banked pattern.
   **Verified poly layer BUILT 2026-07-09**:
   `lean/Erdos9796Proof/P97/Census554/PolyCheck.lean` — computable sparse
   ℚ-polynomials (`Mon`/`SPoly`, add/neg/mul/const/normalize) with
   evaluation-soundness lemmas; payoff theorem
   `SPoly.eval_eq_zero_of_normalize_eq_nil` (normalize-to-nil ⟹ evaluates
   to 0 everywhere) is sorry-free, core axioms only.
   **Checker bridge BUILT 2026-07-09**:
   `lean/Erdos9796Proof/P97/Census554/CertCheck.lean` —
   `coordVar`/`coordPoly`/`d2Poly`/`CertTag`/`envOf`/`checkCert` with
   soundness theorem `isDead_of_checkCert` (accepted certificate ⟹
   `IsDead P`), sorry-free, core axioms only. **End-to-end validated on
   real banked data**: `isDead_P02213` replays cert `pat_02213.json`
   (base kill) via `native_decide` (core axioms + ofReduceBool/
   trustCompiler, both approved) — tag/gauge/variable conventions match
   the bank exactly, first attempt. Step 2's mathematical core is
   COMPLETE.
   **Data-pipeline PROTOTYPE BUILT + probe-measured 2026-07-09; NOT
   INTEGRATION-COMPLETE** (`scratch/census-554/gen_lean_certs.py`; probe
   modules under `lean/.../Census554/Bank/`, all uncommitted at audit time):
   hand-written tokenizer,
   per-cert validation (exact generator-string round-trip; coefficients
   are verbatim Singular output so they get semantic round-trip + the
   exact Fraction identity Σcᵢgᵢ=1 re-derived from pattern+tags), chunked
   `SPoly` literals (≤128 terms/def — a ~5,000-term literal dies at
   maxRecDepth). 21/21 probe certs validated; generated theorems replay
   via `native_decide`, axioms = core + ofReduceBool/trustCompiler.
   **Measured cost** (scales with coefficient term count, ~60–80 ms/term):
   small modules 6.5 s each with batching amortizing overhead to
   ~0.1 s/theorem; fleet-median 55 KB cert → 88 s; 572 KB multi_pair →
   753 s. **Projection**: certs ≤ 1 MB (4,277 = 79% of fleet) ≈ 145–150
   CPU-hours — feasible batched at 8-way. The greater-than-1-MB tail (1,136
   certs at that later live checkpoint),
   and especially the ~410 certs > 16 MB, are NOT viable by naive replay —
   this sharpens the heavy-tail residual: re-mine smaller certificates for
   those patterns or redesign the checker's `normalize` (quadratic
   insert-merge) before replay.
   **`normalize` redesign DONE 2026-07-09**: `SPoly.normalize` is now
   sort-merge (`Mon.canon` map → `List.mergeSort` by monomial → linear
   adjacent-merge `mergeAdj`), eval-soundness reproven via
   `List.mergeSort_perm` + permutation-invariance of the evaluation sum,
   core axioms only; all 21 committed Bank modules replay unchanged.
   Measured on the largest committed module (Pat05043, 7.3 MB): 381 s →
   343 s wall (−10%) — literal elaboration dominates at this size, so the
   checker fix alone does NOT rescue the >16 MB tail; re-mining/splitting
   remains the named residual there.

   The committed generator now puts batch output in a disjoint namespace,
   emits the standard Lean file header, and no longer leaves the duplicate
   `PatBatchProbe` module in `lean/`; 21 representative replay modules are
   committed. Those repairs have not completed integration: move the supported
   generator and tests to `census/census_554/`, add self-contained fixtures,
   and retain the documented ignored-artifact policy for raw heavy payloads
   before fleet generation. **Step 2 status: checker soundness COMPLETE;
   permanent generator integration and terminal cover-core replay OPEN.**

   **Conditional equality-core reduction.**
   `Census554/EqualityCore.lean`, `FivePointCollision.lean`, and
   `ThreeTriadCollision.lean` prove generic duplicate-center, equal-K4,
   equilateral-bisector, and three-triad deadness.  The generated-bank adapter
   emits structural proofs for all twelve equal-K4 and both
   equilateral-bisector instances among the 21 current `Bank/Pat` modules.
   This is not miner-witness validation, bank coverage, or a closure theorem.
   After a terminal core is frozen, `A11-EQUALITY-CORE` must match
   manifest IDs to checked finite core witnesses, build and axiom-audit the
   generated adapters, and measure the reduction in the replayed cover core.
   Unmatched patterns continue through the ordinary certificate route.

   **Conditional cyclic-separation reduction.**
   `Census554/SeparationCore.lean` proves the general shared-pair alternation
   theorem and encodes the `U,O2,V,S,W,O1` surface as exactly 72 internal
   orders.  `SeparationMirror.lean` adds the reflected `U,O1,W,S,V,O2`
   surface and a consumer that requires rejection of both orientations.
   `SeparationCertificate.lean` checks proof-free row/flip paths for all 144
   orders and proves that a successful Boolean check yields the two rejection
   predicates.  `SeparationGeometry.lean` proves
   `Card11CapLabeling.nonempty_directOrMirrorMacroCcwLabeling` by cutting the
   global CCW boundary at the surplus apex, sorting the cap-interior blocks,
   and using the other-apex order dichotomy to select the direct or mirrored
   surface.  `SeparationBridge.lean` composes that producer with the checked
   certificate consumer.  No concrete bank-row certificate is emitted yet.
   Do not generate or count separation-based `IsDead` rows until both finite
   rejection witnesses for each claimed row are Lean-checked; a direct-only
   72-order Python screen is not sufficient.

   **Per-module native-decision audit.** Every generated replay module and the
   assembled core bank must record its `proof-blueprint axioms` output and an
   audit of the evaluated closure for `unsafe`, `@[implemented_by]`, and
   `@[extern]`. This occurs before indexing the core bank, not only at the final
   publication gate.
3. **Motif-closed cover bridge and check**: this step has separate mathematical
   and finite-computation parts. The support-injection and relational substeps
   are complete; the remaining parts are open:

   - freeze the terminal bank and exact motif-instance manifest; the permanent
     publisher now records all required provenance and hashes;
   - consume the emitted core CNF/LRAT and mapped core source rows, then
     generate/replay only that certificate core before fleet-wide replay;
   - kernel-check that every `CubeOk` cube contains a dead motif instance; and
   - combine per-pattern deadness, the support bridge, and step 4 to derive
     impossibility of every covered cube.

   **Support bridge PROVEN 2026-07-09:**
   `Problem97.Census554.exists_injective_extension` extends an injection on a
   finite support, and `motif_transfer_of_supportInjOn` consumes the support
   injection directly. The latter was built and its axiom query reports only
   `propext`, `Classical.choice`, and `Quot.sound`.

   **Relational interface PROVEN 2026-07-09**
   (`Census554/CoverRelations.lean`): `CoverRow` keeps computable source ID and
   pattern data separate from `CoverRow.Certified := IsDead row.pattern`;
   `PatternEmbedsUnder row.pattern f κ` stores the total map, its
   `Set.InjOn f (support row.pattern)` proof, and every mapped-mask inclusion;
   `RealizesCube x κ` stores point injectivity and per-class equidistance.
   `RealizesCube.equidist_of_patternEmbedsUnder` supplies the relabeled motif
   equations, and `CoverRow.not_realizesCube_of_embeds` combines a certified
   row with an embedding through `motif_transfer_of_supportInjOn`.
   `Card11SelectedCube.realizesCube` is the geometric adapter. A nonidentity
   two-row smoke example compiles. The source is sorry-free, and live axiom
   queries for the three public endpoints report only `propext`,
   `Classical.choice`, and `Quot.sound`.

   Implement the finite coordinator and generated core data in
   `Census554/Cover.lean`, reusing these relations. Keep the combinatorial and
   geometric conclusions separate:

   - `coverCore_covers : CubeOk κ → ∃ row ∈ coverCore, ∃ f,
     PatternEmbedsUnder row.pattern f κ`; and
   - `not_realizesCube_of_coverCore : CubeOk κ → ¬ RealizesCube x κ`, where
     `RealizesCube x κ` includes `Function.Injective x` and the per-class
     equidistance facts needed by `motif_transfer`.

   `CubeOk κ` alone must NOT imply `False`: combinatorially valid but
   geometrically dead cubes are exactly what the census enumerates.

   First measure direct `decide`/DFS certificate size on the frozen snapshot.
   If that exceeds the build budget, use a generated search certificate or a
   checked DRAT/LRAT-derived artifact; do not trust the current overwritten
   CaDiCaL CNF or stdout verdict. The format-selection experiment and its stop
   thresholds are matrix A11-COVER-FMT. DRAT verification and core/LRAT
   extraction are implemented and integration-tested. The verified-LRAT
   route is selected below; terminal certificate size/check time remains open.

   **LRAT-route base encoder LANDED 2026-07-09**
   (`Census554/CoverCnf.lean`): a variable-for-variable, clause-for-clause
   Lean port of `sat_cover.py`'s base encoding (one-hot selection, C2 NAND,
   C4 Sinz counters) as `baseDimacs`/`baseCnf : Std.Sat.CNF Nat`, with five
   `native_decide` anchors against the Python ground truth (candidate counts
   210/43/16/210×8, 1949 x-vars, 27286 vars, 207969 clauses, 143883 C2
   clauses) and a rendered DIMACS verified **byte-identical** (all 2,821,218
   bytes) to `CoverInstance().dimacs()` on the empty bank. Candidate tables
   are nullary defs so the compiled anchors evaluate in ~13 s (the naive
   per-literal recomputation took 2001 s). Still open on this sub-lane: the
   banked-pattern `y`-layer emitter over the frozen terminal manifest, the
   completeness lemma `CubeOk κ → the derived assignment satisfies the CNF`
   (Sinz counting aux + one-hot + NAND + indicator layers), and the terminal
   `verifyCert_correct` replay.

   **LRAT plumbing VALIDATED end-to-end 2026-07-09** on a real forced-UNSAT
   instance (base CNF + the smoke-gate-3 C2-violation units `272`, `483`):
   `cadical --no-binary --lrat` → 1,951-action ASCII certificate →
   `Std.Tactic.BVDecide.Reflect.verifyCert (baseCnf ++ units) cert = true`
   directly — **no drat-trim conversion, no clause-ID compaction, and no
   detautologization were needed** (cadical's LRAT IDs continue contiguously
   from the 207,971 originals, and `parseLRATProof` accepts the ASCII output
   as-is). The v4.29-targeted `piqd-lrat` port is therefore NOT required.
   A11-COVER-FMT format selection: **verified-LRAT route CONFIRMED**; the
   remaining unknown is only the terminal certificate's size/check time,
   measurable when the loop reaches UNSAT.

   **Frozen final-CNF contract.** `FinalCoverData` must bind the normalized
   manifest row IDs, canonical pattern and certificate hashes, full DIMACS/CNF
   digest (including the banked-pattern `y` layer), variable and clause IDs, and
   the exact LRAT input digest. The final Lean CNF must be byte-identical after
   canonical rendering or carry a proved clause/variable correspondence used by
   `verifyCert_correct`. A regression that corrupts one mapped motif or `y`
   clause must fail. Reproving the same motif changes only that certificate's
   digest; changing a motif, cover, or manifest invalidates the frozen CNF,
   extracted core, and LRAT and restarts their gates.

   **Sinz completeness core PROVEN 2026-07-09** (`Census554/SinzSat.lean`):
   `sinz_sat` — for any assignment with at most `k` true inputs, the
   canonical counter witness `sinzExt` satisfies every clause of
   `sinzClauses` (all six clause families) — plus the DIMACS↔`Std.Sat.CNF`
   evaluation bridge `evalClauseD_toLit`. Axioms: core only (propext,
   Classical.choice, Quot.sound); no sorry. This is the reusable core of the
   completeness lemma; the remaining composition (one-hot exactly-one, C2
   NAND, C4 counting from `CubeOk`, block disjointness, pattern `y`-layer)
   is still open.

   **Base-CNF completeness PROVEN 2026-07-09** (`Census554/BaseSat.lean`):
   `baseDimacs_sat`/`baseCnf_sat` — an index-level candidate selection
   `idx : Nat → Nat` obeying index-level C2 (`interCard` ≤ 2 pairwise) and C4
   (per-point-pair center count ≤ 2) constraints yields a satisfying
   assignment for the whole base CNF (one-hot + C2 + C4 layers composed via
   threaded `sinzExt` folds mirroring `onehotClauses`/`c4Fold`). Axioms: core
   only; no sorry. Deliberately index-level, not `Finset`/`CubeOk`-level —
   still open: the bridge from `CubeOk κ` down to these index-level
   hypotheses (needs a candidate-enumeration completeness anchor: every
   `IsCandidateClass` mask appears in `candMasks p`), the banked-pattern
   `y`-layer emitter, and the terminal `verifyCert_correct` replay.
4. **Motif-transfer lemma** in Lean: equidistance-pattern deadness is
   similarity-invariant. This is the single new mathematical lemma of Front
   A's card-11 slice. Shape: if a labeled pattern has no realization with
   gauge (0,0),(1,0), then no injective relabeling of it has any realization
   at all. **PROVEN 2026-07-09**: `Problem97.Census554.motif_transfer`
   (`lean/Erdos9796Proof/P97/Census554/MotifTransfer.lean`), built via the
   existing `normSim` similarity toolkit
   (`U2/SimilarityNormalization.lean:72-122`); `#print axioms` = core only
   (propext, Classical.choice, Quot.sound), no sorry. The file also fixes
   the `Pattern`/`IsGaugedRealization`/`IsDead` vocabulary steps 2–3 consume.
   The same file now contains the compiled support-injection bridge described
   in step 3. Not yet imported by the leaf — wiring is step 5.
5. **Conditional leaf discharge at card 11**: from steps 1–4 + `D.K4` +
   `capProfile_eq_554_of_card_eq_eleven`, derive `False` under
   `D.A.card = 11` at the leaf, and case-split every Front-A obligation on
   `card = 11` vs `12 ≤ card`. This was the original Census wiring proposal.
   Implement the reusable theorem
   `Census554.false_of_cardEleven_twoLargeCaps` in
   `Census554/Card11.lean`; it consumes the cap frame, geometric bridge,
   `coverCore_covers`, and `not_realizesCube_of_coverCore`, and returns `False`
   without any liveData row hypotheses. Then invoke it in both Front-A
   declarations before any `CARD-GE-12` residual proofs. This theorem and
   its wires are required if the ATAIL producer does not cover card 11. They
   become unnecessary only after a uniform card-at-least-11 producer closes the
   existing declarations directly (matrix A11-CONSUME/A11-WIRE-*).

### A.2b Leaf wiring facts (U1LargeCapRouteBTail.lean, refreshed 2026-07-14)

- P1b originally moved 79 case holes one-for-one into **35 named on-spine
  helper theorems**. `u1_largeCap_routeB_tail_liveData_false` itself is
  sorry-free and consumes those helpers. Production LIVE-T1 orbit wiring has
  since removed 48 direct holes from all 24 T1/T3 helpers, leaving 31 direct
  liveData holes in 11 helpers. The historical decomposition was 24
  `q = t2[0]` ordered-subcube leaves, 24 `t1 = t2[0]` source-slot leaves, 24
  `t3 = t2[0]` source-slot leaves, and 7 terminal center branches (`q`, `t1`,
  `t2`-named, `t2`-row-failure, `t3`, `u`, fresh). Matrix rows LIVE-* own
  these families. The t1 band is not one polarity: six holes are the positive
  `ht1Row_l1` branch when the source slot is `l1 = t1`, and the other eighteen
  are negative branches. The production theorem
  `Problem97.U1LargeCapRouteBTailRelabel.false_of_center_p_t1_t20_via_pair`
  now bypasses that historical T1 split in every helper. The 12 T1 helpers are
  source-sorry-free but inherit K-A-PAIR's `sorryAx`. The production T3
  adapter now does the same for all 12 T3 helpers.
- The kernel spine additionally shows leaf 2's compiled proof reaching
  leaf 1 (`DoubleApexOffSurplusSharedRadiusPair`) through the
  `false_of_center_p_t2_t20 → … → exists_removableVertex_of_twoLargeCaps`
  chain. The preferred parent-level producer now bypasses that chain before
  case enumeration; after it lands, reference mining should delete the 31
  dead Q/C holes rather than prove branches with no remaining caller.
- The namespace-level exports remain thin re-exports, not duplicate
  obligations. Within the shared-radius declaration/export pair, the only
  proof hole is the one in
  `DoubleApexOffSurplusSharedRadiusPair`; this does not discount the 31 direct
  holes still present in the liveData helper family.
- **Historical Census handoff status:** `capProfile_eq_554_of_card_eq_eleven`
  terminates in profile facts ((5,5,4), interiors (3,3,2), and the
  `MultiCenter/CapProfile.lean` vocabulary translations) rather than a Census
  cover consumer. That missing Census-specific wire is a real conditional gap:
  it is required for a `CARD-GE-12` ATAIL split and unnecessary only for a
  producer uniform from card 11.

`LIVE-BANK-MATCH` is complete and terminal negative (commit `dd2f91c1`): its
machine-readable map checked 1,422 ordered leaf/consumer pairs, with 0 MATCH,
18 PARTIAL, and 1,404 NO-MATCH. The structural blocker is recorded in the
matrix K-A-LIVE row. Do not rerun that decider; new work must add the missing
packet-label-centered/full-filter producer content.

### A.3 Card ≥ 11 residual and `CARD-EQ-{12,13,14}` computational surfaces

Evidence sources: `scratch/census-12-gate/STATE.md` and
`census/candidate_d_probe/report.md`, digested 2026-07-09.

**AHEAD-DEC — DONE 2026-07-13.** Adam explicitly authorized head-only
card-12--14 narrowing as parallel research alongside Census554/A11. This
replaces the 2026-07-12 defer-until-A11-outcome default. The authorization
opens `AHEAD-SPEC` and lightweight deterministic preflights immediately; it
does not by itself transfer the active heavy-compute lease from
`CTRL-RESOURCE`.

**Resource update, 2026-07-13.** Census554 is stopped and the bounded ATAIL
Z3/cvc5 leases have finished, so that compute pool is available for a freshly
manifested successor. This removes external contention but is not launch
authorization: AHEAD remains fail-closed until AHEAD-WORKER lands and a fresh
process/lock/load/memory/disk preflight assigns the lease.

The authorized envelope is:

- proof-tier runs use only PROVEN cuts; CONJECTURED cuts may appear only in a
  separately labeled exploratory appendix;
- no AHEAD-N12/N13/N14 run starts until `CTRL-RESOURCE` is explicitly assigned
  to AHEAD, after which runs are serialized to one labeled profile at a time,
  use at most four workers, nice long-lived processes, and publish an immutable
  pre-run manifest with wall, bank-growth, and shape-staleness stops;
- finite cover, SAT, and sampling results retain their exact empirical scope
  and do not become geometric closure claims without the Lean necessity and
  cover-replay chain; and
- no named card-at-least-15 residual may be introduced at this stage. Such a
  residual is permitted only after `AHEAD-COVER` is proved, and then only when
  `AHEAD-CONSUME` introduces it together with its immediate spine consumer.

**First permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/run_manifest.py` now defines an immutable pre-run manifest
and freezes the exact post-SUB2 PROVEN cut contract at SHA-256
`8e067c226a9e5fec0825d0f7461d84af3aca19baaba52d6faafcbd7d8be505cf`.
Validation pins one of the 3/6/10 authorized labeled profiles, source-file
digests, artifact paths, at most four workers, positive niceness, and the
wall, bank-growth, and consecutive-shape-staleness stops; exclusive creation
refuses to overwrite an existing manifest. The three profile tests and six
manifest tests pass. This is an operational preflight, not a geometric proof:
at this first checkpoint the candidate-count fixtures and permanent runner
port remained open, and no heavy AHEAD census had launched.

**Second permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/candidate_surface.py` is the cardinality-generic port of the
historical per-center `all` admissibility layer, now correctly classified as
post-SUB2 PROVEN. The committed `candidate_count_fixtures.json` exhausts all
19 labeled profiles: 254 profile/center instances and 106,755 candidate
classes. All three card-12 profiles reproduce the historical counts exactly,
and every card-12--14 count independently matches the corresponding closed
combinatorial formula. The order-free proxy drops `s >= 3` but deliberately
does not encode or decide the position of an `s = 2` class.

`run_manifest.py` now constructs the sole admitted command as the niced
permanent runner entrypoint rather than accepting an arbitrary command.
`runner.py` re-hashes the complete required source set, regenerates and checks
the selected fixture, and reports the finite evidence scope. Its `execute`
entrypoint is intentionally fail-closed until the permanent CEGAR engine
adapter lands and `CTRL-RESOURCE` is explicitly transferred to AHEAD. The full
card-head suite is 16/16 passing. No heavy AHEAD process was launched, and this
checkpoint is still finite-abstraction infrastructure rather than coverage or
geometric closure.

**Third permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/sat_encoding.py` ports the historical one-hot/C2/C4 and raw
pattern-exclusion CNF onto the permanent generic candidate surface. For the
(6,5,4) card-12 profile the empty-bank base is exactly 37,310 variables and
297,119 clauses, matching the historical `654_all` encoder; the representative
(5,5,6) card-13 and (5,5,7) card-14 bases are pinned at
63,966/635,654 and 101,122/1,210,260 variables/clauses respectively.

The five card-12 encoding gates pass: an empty bank is SAT with its decoded
cube independently accepted by `cube_ok`; excluding that full cube changes the
witness; forced C2, forced C4, and forced submask violations are UNSAT with all
three CaDiCaL DRAT proofs independently accepted by `drat-trim`; and the free
submask instance remains SAT outside the exclusion. These are encoding smoke
results, labeled EMPIRICALLY VERIFIED within the finite CNF, not coverage.
The suite is now 22/22 passing. `runner.py execute` remains fail-closed because
the CEGAR mining/certification adapter, historical-bank replay, and explicit
`CTRL-RESOURCE` transfer are still open. No AHEAD census was launched.

**Fourth permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/historical_bank.py` performs a read-only structural replay of
the current historical `654_all` index. The committed report
`historical_654_all_structural_audit.json` pins bank SHA-256
`e65e00a1a8ac900a5608061d135fb3b46c77f79b0c78533c775119816eeb8c04`.
All 256 bank rows are distinct profile-automorphism orbits; their 20,610
labeled instances are candidate-compatible under the permanent post-SUB2
surface; all 159 role-blind shape labels recompute; and all 256 referenced
certificate files exist and agree with the bank's path inventory.

This is `PASS_STRUCTURAL_ONLY`, not certificate replay. The referenced
certificate payload totals 9,233,993,303 bytes. A fresh exact-identity verifier
was started, found to be unsuitable as a lightweight concurrent preflight, and
stopped before it could contend with the active resource lane. Consequently
the permanent report says `certificate_identity_replay: NOT_RUN`; file
existence and the old recorded verifier result are not promoted to a current
proof. The suite is 26/26 passing. The CEGAR mining/certification adapter,
fresh certificate replay, and `CTRL-RESOURCE` transfer remain open, and the old
bank remains nonterminal/noncoverage.

**Fifth permanent AHEAD-SPEC checkpoint, 2026-07-13.**
`census/card_head/run_protocol.py` now supplies the durable state boundary for
future manifest-pinned runs. Each event is fully written and fsynced before an
exclusive hard link publishes its sequence name; every event binds the
immutable manifest digest and its predecessor digest. Strict replay rejects
gaps, corruption, backwards elapsed time, decreasing bank/shape totals, and
events after a terminal state. There is no mutable status document: `PLANNED`,
`RUNNING`, and terminal state are derived from the manifest plus the event
stream.

`RUN_STARTED` freezes the initial bank-row and shape-count baselines. Every
`CHUNK_COMPLETED` represents one SAT-witness iteration and records its
pre-certification fresh-shape count alongside monotone bank/shape totals. Thus
the stale counter matches the historical definition exactly: it advances when
the witness has no fresh shape, even if new raw rows were banked, and resets
when fresh shapes were found even if their certification failed. Banked-shape
growth is required to be a subset of the fresh shapes observed. Reaching any
manifest wall, bank-growth, or shape-staleness limit produces
`STOPPED_BY_POLICY` and forbids another append. Simultaneous stops are retained
in deterministic wall/bank/staleness order. Engine exhaustion can currently
terminate only as `ENGINE_EXHAUSTED_UNVERIFIED`, which is expressly not finite
coverage. `runner.py status` re-runs the complete source/fixture preflight and
reads this derived state without creating an event directory. The suite is
35/35 passing. `runner.py execute` remains fail-closed on the CEGAR
mining/certification adapter and `CTRL-RESOURCE`; no AHEAD census was launched.

**Sixth permanent AHEAD-SPEC checkpoint, 2026-07-13.**
The exact certification and publication boundary is now permanent and generic
across all authorized card-12--14 profiles. `pattern_certificate.py`
reconstructs every equidistance and Rabinowitsch generator from the proposed
pattern, checks variable order and generator tags, parses the external
cofactors, and verifies `sum_i c_i g_i = 1` in exact `Fraction` arithmetic.
Thus msolve/Singular output is proposal material only: neither an msolve
emptiness verdict nor a Singular `CHK:1` string is bankable without independent
generator-fidelity and identity replay. The smallest historical `654_all`
five-generator identity passes, as does the same identity under the permanent
card-13 schema; altered generators and cofactors fail closed.

`cegar_adapter.py` binds each proposal to the immutable manifest, independently
rechecks its complete SAT cube, rejects a cube containing an old bank orbit,
requires every new pattern to occur in that cube, recomputes the entire profile
orbit and role-blind shape, and accepts only exact-verified certificates.
`bank_store.py` then couples read-only certificate payloads, append-only bank
rows, and the matching run-protocol measurement through one fsynced recovery
journal. Fault-injection tests cover crashes before the bank replace, after the
bank replace but before the event, and after the event; recovery either removes
uncommitted certificates or appends exactly the missing event. A bank commit
also exercises the manifest bank-growth stop at its exact boundary.

`runner.py` now reports exact replay and transactional bank publication as
enabled, while the mining/generation worker remains disabled. The suite is
52/52 passing. No external algebra engine, SAT census, historical 9.23 GB
identity replay, Lean build, or heavy AHEAD process was launched. Consequently
`execute` remains fail-closed on the mining/generation worker and explicit
`CTRL-RESOURCE` transfer; no coverage claim advances.

**Seventh permanent AHEAD-SPEC checkpoint, 2026-07-13 (worker-readiness
audit).** The resource gate is no longer the first blocker. A read-only audit
of the permanent package found that safely enabling `runner.py execute`
requires four missing operational pieces: a cardinality-generic
mining/certificate proposal worker; a public lock-consistent validated bank
snapshot plus bank-to-CNF adapter; a cross-profile lifetime lease; and the
execute orchestration from SAT decode through exact preparation,
transactional commit, policy stop, resume, and honest unverified exhaustion.
Deleting the fail-closed exception alone is unsound.

One accounting mismatch must be fixed before the shape-staleness stop is
trusted. `run_protocol.py` correctly defines `fresh_shape_count` from the
pre-certification witness, while `PreparedIteration` and `bank_store.py`
currently conflate witnessed fresh shapes with certified/banked fresh shapes.
The worker must preserve both counts separately (or stop conservatively on any
certificate failure). It must also bind execution to the canonical manifest,
prevent bank-limit overshoot, derive elapsed wall from the original
`RUN_STARTED`, and include every new source in the manifest digest set.

The minimum activation order is therefore: worker unit tests; validated bank
snapshot/CNF tests; shape-accounting repair; lifetime-lock and fake-worker
runner lifecycle tests; full 52-test regression plus the card-12 SAT/DRAT
smoke; then creation of exactly one final `(6,5,4)` manifest. No permanent run
directory currently exists and no AHEAD process was launched by this audit.
Even a verified final DRAT remains `ENGINE_EXHAUSTED_UNVERIFIED` until a
separate hash-bound CNF/DRAT/core/LRAT publication and Lean cover consumer are
implemented.

**Current decider status, updated 2026-07-13.** ATAIL-SUB2 is PROVEN: the
exact rational certificate, independent checker, adversarial audit, and the
Lean theorems `ATailSub2.sub2H_left_unsat` / `sub2H_right_unsat` passed their
stated gates. ATAIL-Q3 is now DONE-NEGATIVE within the selected-four/two-center
surface. Its permanent checkpoint (`census/q3_two_center/checkpoint.py` /
`checkpoint.json`) exact-replays 72 realized windows, validates 44 stored
profile/tier token assignments, pins its inputs, and re-runs the repaired
396-triangle falsifier gate. All 22 unordered profiles at cards 12--16 retain
a token model under both the base and post-SUB2 proved cuts. This is exact
within the token abstraction, not a full-configuration counterexample; the
falsifier gate is guard-banded floating evidence, and the checkpoint does not
independently replay the 15 hand/Z3 kill proofs. ATAIL-FORCE therefore remains
open and must use a selection-robust full-filter, order-coupled multi-window,
or critical-row mechanism. The exact producer target and theorem-bank audit
are in `docs/atail-force-producer-plan-2026-07-13.md`.

**Proof-priority decision, refreshed 2026-07-14.** ATAIL-FORCE is one parent-
level content lane. Census554 and AHEAD CEGAR remain bounded alternate/fallback lanes: their
banks may expose reusable structural lemmas, Census554 may discharge card 11,
and a checked AHEAD cover could remove cards 12--14. Neither should be awaited
before theorem work on the uniform parent contradiction. A successful pair of
finite covers would still leave the card-at-least-15 tail. The LIVE-Q/C tree is
current source inventory, not an independent content lane: the parent theorem
is called before its split and should make it dead code. A nonterminal CEGAR run stops at its
predeclared wall, bank-growth, or shape-staleness boundary; SAT progress or a
larger bank alone does not authorize a budget extension.

**Parallel-research authorization, 2026-07-13.** Adam explicitly authorized
ATAIL/AHEAD as genuine parallel closure work and authorized creation of the
proof-local analysis files, scratch Lean/Python artifacts, bounded
computations, theorem-bank searches, and closure-document updates needed to
develop the missing producer without per-artifact permission. The
authorization preserves the separately recorded ownership of the shared
Route-B/LIVE-T1 source and does not extend to destructive or unrelated
external actions.

The exact `ATAIL-DISTINCT-REPLAY` checkpoint now makes the computational
boundary sharper. It constructs and exact-replays separator-satisfying
algebraic witnesses for all 343 raw equality skeletons: all 4,802 equalities
and 19,978 pairwise-distinctness/nondegenerate-triangle separators pass. The
construction proves all coordinates real for all 343 skeletons. It does not
check disk, nonobtuse, cap, or global-order inequalities, does not realize a
full configuration, and does not prove a Lean statement. Thus the bare or
separator-saturated equality route is DONE-NEGATIVE even over real algebraic
coordinates, while ATAIL-FORCE remains OPEN-RESEARCH and must use the omitted
inequalities or a direct full-filter/critical-row producer.

The subsequent `ATAIL-INEQ-PILOT` exercised those omitted inequalities only as
a bounded diagnostic. Its immutable seven-case manifest includes the complete
disk, nonobtuse, cap-sign, and global-order generators, with one sequential Z3
4.16.0 QF_NRA/NLSAT process, 30 seconds per case, and a 240-second aggregate
wall. Every case timed out; total wall was 219.901 seconds. No model or UNSAT
proposal was returned, so no geometric row is classified and no mathematical
claim advances. This is DONE-NEGATIVE-TRACTABILITY and does not authorize a
larger nonlinear sweep.

After Census554 stopped and released compute, `ATAIL-CVC5-PILOT` used the same
seven frozen full-inequality systems as a cross-engine diagnostic, not a
surface expansion. One sequential cvc5 1.3.3 nonlinear-coverings process ran
at verified effective nice 10, 30 seconds per case, under the same 240-second
aggregate wall. All seven reached cvc5's exact statusless timeout diagnostic;
total wall was 219.217 seconds, with no SAT or UNSAT status. The immutable raw
result's parser labeled those signal exits `ERROR`; a solver-free checkpoint
binds every manifest, system, SMT2, and constraint-ledger digest and normalizes
only that exact raw shape to 7/7 `TIMEOUT`. No row is classified and no claim
advances. The blind cross-engine route is therefore also
DONE-NEGATIVE-TRACTABILITY at this granularity.

The first materially smaller forced subsystem is now
`ATAIL-ORDER-FAN-1`. In the frozen six-interior-point representative, the
metric/disk/cap base is SAT, whereas adding a seven-inequality oriented edge
fan gives a repeatable Z3 UNSAT proposal. Conservative deletion leaves 15
scalar hypotheses, and `scratch/atail-force/order_fan_kernel.lean` gives an
explicit solver-free Lean proof of their inconsistency. The exact S3 matcher
finds this pattern in 39 of 167,782 selected-four order decorations, spanning
21 joint classes; the other six frozen size strata remain `UNKNOWN` under a
five-second diagnostic. These counts are exact only for the decision surface.
There is no leaf-to-inventory extraction, full-filter pair, or on-spine
consumer, so this is a checked narrow cut and theorem-extraction template,
not closure of ATAIL-FORCE or K-A-PAIR.

The bounded m=6 follow-up exhausts seven S3 class representatives, 25
representative orders, and nine oriented edges per order (225 queries at 250
ms). The order-free base statuses were 7 `SAT`, 12 `UNKNOWN`, and 6 `UNSAT`;
the fan statuses were 26 `SAT`, 155 `UNKNOWN`, and 44 `UNSAT`. Those statuses
are diagnostic only. The six base proposals reduce to two independently
proved order-free Lean kernels: the eight-hypothesis `bisectorCapKernel` from
class 2472 and the eleven-hypothesis `twoCircleCapKernel` from class 2422.
Together with `orderFanKernel`, the exact simultaneous-S3 matcher finds three
disjoint cuts covering respectively 39, 66, and 24 of the 167,782
selected-four systems: 129 systems across 45 classes, leaving 167,653. This is
new theorem-bank content, not completeness. The exact narrow reach terminates
blind selected-four kernel mining as the primary lane; the next theorem must
use the actual full-filter or critical-row hypotheses to force a checked
terminal packet or `False` directly. The joint-fiber lower bound is a retired
compatibility endpoint, not a dispatch target.

A direct audit of the seven LIVE-C helper contracts found no routine whole-row
reduction. This is negative source history, not a separate proof queue.
`CriticalRowPacket.center_ne_source` only kills subcells in which
the extra row source `t2[0]` is also identified with its blocker center; none
of the seven contracts supplies that equality, and none supplies K-A-PAIR's
p-centered exact-dangerous `t2Row` hypotheses. LIVE-C is superseded by the
parent bypass. LIVE-T1 and LIVE-T3 are now source-sorry-free and
inherit openness only through K-A-PAIR; the active proof cursor is anchored
directly at K-A-PAIR.  Both relabel adapters are production-wired, while the
K-A-PAIR body remains the open producer declaration. The target build refreshed generated
`docs/live-blueprint.md`, which is not an anchor input and was not edited by
hand.

The legacy-helper normalization began in two kernel-checked scratch modules:
(i) the compatibility-only joint-fiber card-two extraction and the fact that equal critical-row
centers plus equal selected `l1` identify the full exact supports; and (ii)
dangerous-triple relabeling adapters for `f2=t1` and `f2=t3`. Both halves are
now promoted to production and remove all 48 direct LIVE-T1/T3 holes by
making the collided row the relabeled `t2Row`. Both intentionally inherit K-A-PAIR's
`sorryAx`, so this is a dependency reduction rather than kernel closure.
Artifacts: `scratch/atail-force/critical_row_coupling.lean`,
`scratch/atail-force/triple_relabel_adapters.lean`, and
`Problem97.U1LargeCapRouteBTailRelabel.false_of_center_p_t1_t20_via_pair`.

The outer wrapper's construction provenance has now also been retained in a
third kernel-checked scratch module. `U1Depth5.LiveCriticalRowProvenance`
records that all five source rows and `f2CriticalRow` come from the same
`CriticalShellSystem`, rather than passing only an unrelated
`Nonempty (CriticalShellSystem D.A)`. It recovers the row deletion-blocker
facts and reuses the banked theorem
`CriticalShellSystem.selectedFourClass_support_eq_shell` to show that every
selected K4 row at the same blocker center is exactly the f2 critical support.

For the current parent route this compatibility packet has been superseded by
`LiveDangerousRetainingSystem`, which rebuilds one concrete system before
frontier extraction and retains the exact live row, blocker fact,
`centerAt = p` iff dangerous-source classification, and selected-support
transport.  Provenance restoration is therefore complete at the scratch
interface level; the open problem is consuming it without projecting away the
origin fields.

The exact source-contract census records the historical P1b surface of all 35
live helpers and 79 textual holes. After T1/T3 production wiring, 11 helpers
and 31 direct holes remain. The 28 p-centered LIVE-Q/T1/T3 contracts already
transfer full
support through their comparison maps, so provenance adds no new same-center
transfer there; it would restore f2 no-qfree to all 35 helpers. Six named LIVE-C
branches turn that blocker fact into a packet-label-centered membership/support
statement, but this is the positively realized f2-critical branch, not a
contradiction. The fresh-center branch retains the same blocker fact without a
named packet center.

`f2Row_to_qCriticalTriple` now packages that surviving branch as the existing
`U5QCriticalTripleClass` on `f2Row.support.erase f2`. It is kernel-checked and
needs only the concrete critical-row packet; it adds no missing dangerous-point
memberships and is normalization rather than closure.

The strongest current-contract output is instead
`two_le_f2Row_support_sdiff_dangerousBase`: since every LIVE-C f2 center is
different from `p`, the two-circle bound forces at least two f2-support points
outside `{q,t1,t2,t3}` in all seven helpers; the witness theorem
`exists_two_f2Row_support_off_dangerousBase` extracts the distinct pair. This
is a one-center off-dangerous pair. It does not prove that the points are off
the surplus cap,
does not relate the f2 center to either opposite Moser apex or give both apex
radii, and does not supply the bounded-anchor or class-center fields needed by
a U5 bank consumer. These are compatibility gaps, not standalone producer
targets; any use must feed an existing terminal or the parent `False` theorem. Artifacts:
`scratch/atail-force/live_critical_provenance.lean` and
`scratch/atail-force/provenance_contract_audit.py`.

The later consumer audit in `live_q_c_shared_consumer_boundary.lean` sharpens
this boundary without closing a helper.  It proves the same off-dangerous
pair uniformly from the seven center contracts, lets the fixed dangerous
`p`-circle serve directly as the first center in the same-cap sink, and
extracts the equilateral-star prefix from `center_t2_named`.  LIVE-Q still
lacks any distinct aligned row center.  LIVE-C supplies two points outside
the dangerous base, while the sink needs two dangerous-base points of the
second-center row outside a common cap.  The special named branch next lacks
a dangerous-centered cross-row incidence.  Exact consumer-by-consumer map:
`scratch/atail-force/live_q_c_consumer_match_audit_2026-07-13.md`.

The corresponding finite incidence-delta census is now **DONE-NEGATIVE,
exact within the stated abstraction**. The corrected witnesses retain the
actual `f := t2[0]` and `f5 := t2[1]` membership in the `t2` source row, rather
than treating those labels as unrelated atoms. They also retain source
membership, four-point support, center/source separation, equal-center support
coupling, all distinct-center two-circle overlap bounds, the conditional
comparison maps, the seven LIVE-C center branches, and the `t2_named` /
`t2_rowFailure` split. `incidence_delta_census.py --check` validates one
explicit witness for each family: 7/7 are `SAT_INCIDENCE_ONLY`, with zero
forced second-center collision, zero `q`-plus-two-dangerous support, and zero
five-source support.
The pinned witness digest is
`78d6ea82c294e8dd2943f1dec50e9bf51a6de88bbef91c34f649c2f28a115a3e`.
These are finite incidence structures, not Euclidean/convex realizations, and
the current metric-consumer fields are explicitly not modeled. Therefore the
incidence-only route is terminal at this interface; any successor must add
cap/order/full-filter or metric information. Artifact:
`scratch/atail-force/incidence_delta_census.py`.

The first metric discriminator on the stronger finite shadow is also complete
for its two saved `CARD-EQ-12` candidates. Each candidate has one selected
four-point row at every center, support intersections at most two, an explicit
common cyclic order satisfying every shared-pair separation, and no core found
by the current `_formalized_metric_core` catalog. Singular nevertheless returns
`UNIT` over `QQ` as a trusted exact-arithmetic CAS result for a contained
subsystem of each: 8 rows / 24 equalities for the internal block-profile label
`(4,5,6)`, and 7 rows / 20 equalities on 11 active labels for `(5,5,5)`.
The first tuple is not the closure matrix's labeled-cap tuple order, and no
orientation bridge is claimed. Thus neither finite-shadow witness is a
Euclidean equality model.
This is exact within the algebraic model for the two saved systems, but its
Nullstellensatz certificate was not independently replayed; it is not
exhaustive, not a Lean theorem, and not K-A-PAIR. The retained subsystems are large rigidity networks, so they
are regression examples rather than formalization targets. The next live
theorem should instead place the already-forced pair of off-dangerous f2-row
points in a second selected/full-filter class and consume
`outsidePair_unique_capCenter`, or derive the parent contradiction directly;
the opposite-apex radii are only an internal terminal, not the theorem target.
Artifacts: `scratch/atail-force/critical_row_metric_discriminator.py`, its
pinned JSON, and
`docs/audits/2026-07-13-atail-critical-row-metric-discriminator.md`.

The existing two-circle sink has now been repackaged in the exact joint-filter
vocabulary. The kernel-checked scratch theorem
`doubleApexJointFiber_sdiff_surplus_card_le_one` says that every fixed pair of
opposite-apex radii has at most one carrier realization outside the surplus
cap. Symmetric companion theorems show that K4 nevertheless supplies a radius
with at least three off-surplus representatives at either apex and at least two
representatives in the strict interior of its own opposite cap. Distance to
the other apex is injective on each such three-point marginal. Therefore no
argument from separate marginal K4 counts can prove the needed lower bound.
That lower bound is another form of the whole contradiction, not a smaller
milestone; the successor is the parent robust classifier. Artifact:
`scratch/atail-force/apex_filters/joint_fiber_upper_bound.lean`; full audit:
`docs/audits/2026-07-13-atail-apex-filter-assessment.md`.

The blocker-cycle route is also **DONE-NEGATIVE at its relaxed abstraction**.
A 12-vertex exact symmetric distance-equality model has a spanning blocker
cycle, one exact four-class per center, global deletion criticality, overlap at
most two, and only singleton fixed two-center fibers. An independent 33-point
integer-coordinate Euclidean witness has global K4, failure after every single
deletion, genuine blocker cycles, and an injective fixed two-center distance
map. The latter is non-convex, so it does not refute K-A-PAIR; it proves that
Euclidean blocker structure alone still omits a load-bearing convex/Moser/cap
fact. Do not spend another lane on cycle length, spanning, or surjectivity.
Any blocker-based successor must enter an existing cap/critical-row/core sink
or prove the parent contradiction directly using convexity, cap/order,
no-M44, or the actual critical rows. Artifacts:
`scratch/atail-force/blocker_graph/` and
`docs/audits/2026-07-13-atail-blocker-graph-assessment.md`.

The stronger ordered-cap double count is likewise **DONE-NEGATIVE at the
finite count abstraction**. The current Lean lower bound is `m+4` distinct
outside pairs for a cap of size `m`; at card 12 the summed lower is 27 against
summed capacities 63 for `(5,5,5)` and 64 for `(4,5,6)`. Common critical
provenance bounds blocker fibers by four but does not add another row copy,
because the global selected class at a blocker center equals its critical
support. `scratch/atail-force/global_count_boundary/` validates strengthened
finite shadows for both profiles with the current count, blocker cover,
one-sided ordered-cap bounds, cyclic separation, outside-pair uniqueness, and
singleton fixed joint fibers. The artifacts are non-Euclidean, nonexhaustive,
and fail-closed. They require a real metric/order-realizability coupling rather
than a larger finite count. Audit:
`docs/audits/2026-07-13-atail-global-count-boundary.md`.

The smaller same-cap producer boundary is now **CHECKED-SCRATCH**. In
`scratch/atail-force/same_cap_second_center.lean`, the exact dangerous `p`
row supplies two distinct row points outside any indexed cap containing `p`,
the supplied `u` row is proved to have center different from `p`, and the
generic ordered-cap adapter proves
`DangerousRowSameCapSecondCenter.false`. Thus the remaining conjectural field
is exact: produce a second carrier center in the same cap as `p`, distinct
from `p`, which is equidistant from that dangerous-row outside pair. The
existing `outsidePair_unique_capCenter` theorem then gives `False`; no
opposite-apex identification is needed. Direct Lean validation passes, and
the four audited endpoints depend only on `propext`, `Classical.choice`, and
`Quot.sound`. The live declaration still includes card 11, so this producer
must be uniform from card 11 unless A11-CONSUME and the source-visible
cardinality split land first. Strategy and circularity audit:
`docs/audits/2026-07-13-atail-missing-ingredient-strategy.md`.

The same scratch file now also kernel-checks
`DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity`: it is
enough to produce one source-indexed critical shell with a non-`p` center in
`p`'s cap and at least two support points in the dangerous set outside that
cap. This is the current exact producer field. A size-only localization of
dangerous sources into `cap \ {p}` is insufficient except in the extremal
cap-size-4/all-four-outside case, so the remaining proof must add geometric
non-injectivity, direct support overlap, or a useful critical source outside
the dangerous row. The companion
`false_of_criticalShell_sameCap_capMultiplicity` is the checked one-call
consumer for exactly this field.

`scratch/atail-force/dangerous_blocker_collapse.lean` closes the corresponding
choice audit in the negative. It proves the dangerous selected class is
exactly `{q,t1,t2,t3}`, every deletion from that class blocks `p`, and any
critical-shell system may be overridden so all four dangerous sources choose
`p`. Therefore no arbitrary-system argument may infer the needed non-`p`
center from a dangerous source. This does not rule out another useful system;
it requires the producer to use an outside source, independently construct a
non-`p` blocker, or retain common provenance which supplies additional
load-bearing structure.

The honest outside-source successor is now **CHECKED-SCRATCH to its exact two
open fields**. `scratch/atail-force/outside_source_cap_multiplicity.lean`
proves the live selected point `u` lies outside the dangerous class and that
both its supplied row and any common-system blocker row at `u` have center
different from `p`. It separately proves cap coverage for `p` and the center,
at least two `u`-row points outside the dangerous class, and at least two
outside any cap containing the center. Those facts do not align the cap
indices or complements. The exact remaining `URowCapMultiplicityFields`
requires one cap containing both centers and two dangerous support points
outside it. `URowCommonCapOffDangerousConfinement` is a kernel-checked
sufficient condition: every off-dangerous `u`-row support point lies in that
common cap. This confinement is not a current theorem. Common provenance adds
center separation/support locking, not either missing cap-alignment field.

The subsequent geometric and falsifier audit closes this *local route* in the
negative. An exact strictly convex Euclidean `(4,5,6)` relaxed residual has the
common cap and satisfies the generic center-cap support bound, yet only one
dangerous `u`-row support point lies outside that cap. Therefore the two
separate complement inequalities cannot be combined to prove MULT. The saved
`(5,5,5)` finite shadow independently fails ALIGN. These are not live
counterexamples: the Euclidean residual does not have the named Moser triangle
as an MEC frame, fails all-center K4 at eight centers, and omits the full
no-M44/full-filter coupling. The full live implication remains CONJECTURED.
There is also a contract loss: the outer live caller constructs the five rows
from `Hcritical`, whereas the pair residual accepts `rows` and a nonempty
critical-shell system independently. Restoring that provenance is a necessary
interface repair for any common-system continuation, but the audit proves it
does not by itself create ALIGN or MULT. The primary lane therefore moves to
the wrap-order six-point/global-row producers; URow is retained only as a
conditional MEC/all-center-coupling route.
The existing `MECStraddlingRowCore` already gives the exact structural
exclusion for that residual (and the saved coordinates have a positive
rational circumdisk power at label 10), but the core uses only one equality
from the `u` row and no dangerous-count or cap field. It is therefore a valid
CEGAR cut, not the missing URow producer.

The first target-specific `CARD-EQ-12` Q-C incidence preflight is also complete.
`scratch/atail-force/second_center_query/query.py --check` validates one
29-row finite shadow for each profile: `(4,5,6)` in 19 nodes and `(5,5,5)` in
26 nodes. Each shadow retains the dangerous exact row, five independent
supplied rows, a selected exact row at every center, and a source-indexed
critical-system row at every point, yet has no second-center witness carried
by an encoded row. The result is strictly `SAT_FINITE_SHADOW_ONLY`; its
manifest explicitly omits Euclidean metric constraints, strict convexity,
MEC geometry, arbitrary bisector hits, exhaustive placements, full live data,
Q-A/Q-E, and card 11. It terminates incidence-only forcing at these placements
but does not falsify `DangerousRowSameCapSecondCenter` or close any `sorry`.

The exact metric successor is now complete for those two saved shadows.
`scratch/atail-force/second_center_metric_oracle/oracle.py --check` validates
that each deduplicates to 12 circles / 36 quadratic equalities, and Singular
plus msolve in two variable orders all return `UNIT` over `QQ`. Thus neither
fixed normalized real equality variety exists. Cross-checked bounded cores
contain 6 rows / 18 equalities for `(4,5,6)` and 7 rows / 21 equalities for
`(5,5,5)`. The original oracle is trusted exact CAS and the placements are not
exhaustive, but one compact successor is now fully kernel checked.

`scratch/atail-force/five_row_metric_core.lean` proves the `(4,5,6)` round-1
five-row obstruction by a compact real branch argument. Eleven equal-distance
comparisons force labels `0` and `1` to coincide. The file exposes the direct
`SelectedFourClass` consumer `false_of_five_selectedFourClasses`, the abstract
`FiveRowCollisionCore`, and its no-injective-realization theorem; all printed
axiom sets are core-only. A separate rational certificate replays
`1 = Σ h_i g_i` exactly and its generated Lean fallback also checks. The
required theorem-bank preflight checks twelve equality-only families and finds
no match for this particular compact core.

The bounded metric CEGAR continuation reaches 64 rounds for each of the two
fixed placements. All 128 saved full ideals and all 128 accepted cuts fully
replay as `CROSSCHECKED_UNIT`; both cases stop at `STOPPED_ROUND_BUDGET`, not
exhaustion, with no nonunit candidate. The first repeated whole-core type is
the `(5,5,5)` round-40/62 five-row shape, which exactly matches the existing
`SixPointCircleChainCollisionCore`. This is theorem-family reuse, not finite
coverage.

The row-origin replay gives the integration boundary. Zero of 64 learned cuts
in either profile has a supplied-source alias for every retained row. The new
compact `(4,5,6)` core uses one row which aliases `supplied:u` and four
global-only selected rows. Therefore the five live `CriticalSourceRows` do not
directly instantiate either metric consumer; a selected-K4/global-row support
incidence theorem is still required.

The archived pre-subsumption common-system CEGAR removed that
global-row-at-every-center
assumption. It chooses one exact source-indexed row for every point of a single
finite critical-system abstraction and learns only kernel-backed structural
cuts. That historical hash-bound replay accepted 6 cuts for `(4,5,6)` and 23 for
`(5,5,5)`, preserving every earlier assignment digest and cut stage. Its bank
is `ExactOffCircleCore`, `NestedEqualChordCore`, `MECStraddlingRowCore`,
`SixPointTwoCircleOrderCore`, `SixPointNestedCenterOrderCore`, and
`SixPointCircleChainOrderCore`, plus the checked-scratch
`SixPointCircleChainWrapOrderCore` and `SevenPointSplitBridgeOrderCore`. The
nested-equal-chord adapter proves that
three blocker rows plus cyclic order `o,a,b,c,d` instantiate its
`EdgeClosure` consumer. This closes the metric/convex and live-vocabulary lift
for that motif, not its incidence/order producer. The archived checkpoint is
SHA-256 `861d4a41141a26c0f6a1afb4fefe52156813c6890ad5eb3bc4b3a084d6b30ee9`.

The deeper checked live adapter discharges the order component automatically:
every critical blocker row has a canonical cyclic enumeration `o,a,b,c,d`.
With global selected rows already present at centers `a` and `b`, the exact
remaining nested-chord producer is only
`o,d ∈ rowPattern F a` and `o,c ∈ rowPattern F b` for one ordered blocker row.
`HasGlobalNestedPairProducer` packages these four memberships, and
`false_of_hasGlobalNestedPairProducer` is its kernel-checked immediate
consumer. No additional critical sources or blocker-center alignment fields
are required.

Restoring one global selected row at a time is checked insufficient within the
fixed `(4,5,6)` frame. Exhaustive support enumeration at centers 4--11 leaves
128--176 candidates per center after every current formalized core, and each
center has a proper exact equality-ideal survivor in both msolve orders. This
is not a real convex or target-faithful extension, but it rules out proving that
one predetermined missing-center row must already instantiate the bank. The
next bounded global-row layer is the coupled `a,b` pair in
`GlobalNestedPairFields`, or MEC disk geometry first.

The coupled finite census is also negative on the saved placement: none of the
twelve critical-source choices admits `GlobalNestedPairFields`. Three blocker
patterns conflict with locked exact rows; all 15 candidates in the sole
unlocked pattern are covered by existing duplicate-center or exact-off-circle
cores. This is exact only for the saved placement and blocker map. It shows
that bare global-K4 incidence does not force the nested producer there, making
MEC/cap/full-filter geometry the required next discriminator.

The historical `(4,5,6)` round-5 residual has an external exact
`Q(sqrt(3),sqrt(K))` certificate: rational interval arithmetic and an
independent exact Z3 QF_NRA replay certify its exact rows, strict convexity,
cap arcs, nonobtuse Moser triangle, and saved common blocker/no-`q`-free map.
It is not Lean-kernel checked or target-faithful. Concretely, centers 4--11
have no global K4 row and labels 7, 10, and 11 violate the MEC circumdisk.
Those omissions, not exact cardinality 12, explain that relaxed witness. The
production `MECStraddlingRowCore` proves actual MEC/nonobtuse/cyclic-order data
excludes the residual: with `o=0,a=1,p=2,s=3,x=10,y=7`, three rows give
`oa=ap=os=sx=sy`, and the two in-disk points force opposite signs for one
determinant. Its generic metric, equality-closure, geometry, and reflected
consumers target-build with core axioms only. The current honest `(4,5,6)`
checkpoint is instead a round-6 four-row `CROSSCHECKED_NONUNIT` survivor with
digest `268f0efa...ba89f9`; 16 numerical starts find no witness, which is not a
proof of infeasibility.

The `(5,5,5)` replay first uses `SixPointTwoCircleOrderCore` on rounds 7--9.
Its next family, `SixPointNestedCenterOrderCore`, maps
`(O,A,D,E,X,C)=(0,1,3,4,5,2)` and closes rounds 14--16 with a production
metric theorem, reflected `EdgeClosure` consumer, and actual GeneralCarrier
adapter. `SixPointCircleChainOrderCore` then closes round 17 under
`(O,A,D,E,C,Y)=(0,1,3,4,2,8)`, using all five rows and the four signs
`OAC,OAE,OAD,CYO`. All three production modules target-build with only the
standard core axioms and are integrated after the earlier matchers. The
checked-scratch `SixPointCircleChainWrapOrderCore` proves the same equality
graph impossible in cyclic order `O,Y,A,D,E,C`, using
`OAC,OAE,OAD,OYA`; its generic theorem, reflected consumer, and actual
GeneralCarrier adapter elaborate with the standard core axioms. Its matcher
closes rounds 18 and 19.

In the archived pre-subsumption trace, round 20 changed the graph rather than
merely changing the placement. The old
shared circle-chain point splits into `U` and `W`. The exact analysis extracts
the seven-point core `(O,A,C,D,E,U,W)=(0,1,2,3,4,6,8)`, nine row equalities,
and cyclic signs `OAC,OAD,OAE,OEC`; a normalized Euclidean argument gives a
triangle-inequality contradiction. An explicit positive-norm real realization
of the same equalities with the wrong cyclic order proves that equality-only
Gram certificates cannot close this residual. The generic Lean theorem,
reflected `EdgeClosure` consumer, and actual GeneralCarrier adapter now
elaborate with exactly the standard core axioms and have passed an independent
antecedent/source audit. The historical monotone matcher closed rounds 20--22
with the same spine and `W=8,9,10`. The archived round-23 survivor had digest
`d1c0773c...e4e5971` and final row `4:{2,3,5,11}`; its equality ideal remains
`CROSSCHECKED_NONUNIT` and real feasibility was undecided. Archived checkpoint SHA-256 is
`861d4a41141a26c0f6a1afb4fefe52156813c6890ad5eb3bc4b3a084d6b30ee9`.

That round numbering is now an archived pre-subsumption trace.  The checked
`SixPointTwoCircleArcOvertakeOrderCore` and its GeneralCarrier adapter subsume
all old `(5,5,5)` rounds 10--28: under
`(O,A,D,E,F,C)=(0,1,3,4,5,2)`, the three exact rows centered at `O`, `A`, and
`D` and cyclic order `O,A,D,E,F,C` are already contradictory.  The preserved
pre-subsumption replay has SHA-256
`fcb0b93588ad95dac43aa2a1bf1364d5f7a3a24cc5cb5f15739c8541cd11ca09`.
After integrating the monotone arc-overtake and five-row circle-intersection
matchers, the clean replay has six cuts for `(4,5,6)` and twenty-one cuts for
`(5,5,5)`.  The latter consumer closes rounds 19 and 20.  Its first uncovered
`(5,5,5)` shadow is round 21, digest
`2854f002275620851be4b86b064d3f0fb02cb60099c6a60d36f241dd19fb82ec`.

The live boundary is also checked: `LiveArcOvertakeFields` preserves the
dangerous `p`-row, one selected critical `p`-source row, and the independent
`uRow` on the existing five-row pair surface, and
`false_of_liveArcOvertakeFields` feeds those rows to the GeneralCarrier
adapter.  This is a conditional producer, not closure.  The former round-19 shadow
avoids it in exactly one incidence: its supplied `u`-row meets the dangerous
four-class in only one aligned point, omitting the second hit required by the
arc-overtake packet.  The later forcing audit shows that a two-hit lower bound
alone is still insufficient: it must also localize the `u`-row center in the
dangerous class and align a critical `p`-source row through one hit and another
dangerous point.  An exact nine-point strictly convex algebraic model realizes
those three local rows in a non-overtaking cyclic order, so order is a second
genuine MEC/cap stage rather than routine bookkeeping.

That Stage-I boundary is now explicit and checked.
`LiveArcOvertakeStageOneFields` is the live packet with only cyclic order
removed; it proves the dangerous u-row intersection has cardinality exactly
two and converts definitionally to the final packet once order is supplied.
A separate `Fin 12` common-provenance incidence model retains every current
support-cardinality/source/same-center/intersection consequence and both
blocker-center alignments but has exactly one dangerous u-row hit.  This is a
kernel-checked dependency boundary, not a Euclidean counterexample: Stage I
must use omitted metric/MEC/cap/no-`M44` geometry or a named alternate.

The same-cap alternate is now split at two exact checked escape packets.
`stage1_common_cap_alignment_boundary.lean` gives common-cap alignment or
`URowSeparatedCapPlacement` on the actual K-A-PAIR leaf packet; a `Fin 12`
cap model shows that current cap arithmetic, coverage, incidence, and
complement bounds do not exclude separation.  Assuming alignment,
`stage1_common_cap_confinement_boundary.lean` gives confinement or
`URowOffDangerousSeparatedPairFields`: two outside `uRow` points have equal
distance from its center but unequal distances from `p`.  Existing
outside-pair uniqueness proves the inequality at `p`; another finite shadow
shows cap counting cannot remove the packet.  The next positive geometry is
therefore an exclusion of separated-cap placement followed, if needed, by a
classification of the separated outside pair into a named MEC/nested/order
consumer.

The subsequent geometry pass exhausts the routine refinement of both packets.
Separated caps are either strict-interior centers in different caps or an
opposite-Moser endpoint case. The endpoint case now has no cap-cardinality
escape: its exact four-point row contains two distinct points of the facing
strict cap interior, its whole carrier radius filter is retained, and both
outer Moser endpoints separate that pair's distances. The old card-four versus
card-at-least-five split is superseded. The surviving separated outside pair has exact full-shell
support, a unique common-cap bisector center, and an explicit global boundary
block.  A checked Dumitrescu consumer would close if two more carrier centers
lay on that perpendicular bisector. The critical-system reduction now makes
the missing data exact: reciprocal membership of the escaped pair in the rows
sourced at its two points, plus pairwise distinctness of those two blocker
centers and `uRow.center`. The corresponding one-call adapter back to
confinement is kernel-checked, but current fields do not prove those
incidences or inequalities. If reciprocal incidence is obtained without the
inequalities, Dumitrescu forces one of three blocker-center collisions and
exactness identifies the corresponding complete supports; those support
collapse branches are the named complement that must be consumed.
The positive producer targets are now the distinct-interior placement, the
endpoint exact-filter interior pair, and additional bisector centers for the
outside-pair packet. Another marginal cap theorem or cyclic-order extraction
alone cannot close them.

The remaining ATAIL task is therefore a two-stage live coverage theorem:
full-filter/critical/cap/no-`M44` data must first produce the aligned incidence
packet or a named consumed alternate; MEC/cap order must then produce the
arc-overtake order or a named order-failure alternate.  The round-19
order-failure alternate is now proved through its five-row geometry boundary:
in positive half-arc gaps summing to
`pi/6`, the three necessary lower circle-intersection margins are
incompatible, and a kernel-checked theorem gives the uniform bound
`tau < -4/25`.  Its five public endpoints use only the standard core axioms.
The positive and reflected geometry endpoints derive the two minor-arc
angles, four chord identities, and lower margins from the five row equalities
and six cyclic signs; they do not require MEC, nonobtuse, or disk hypotheses.
The label-generic core, reflected carrier adapter, and monotone matcher are
now checked and registered; deterministic replay banks the former round-19
pattern and its round-20 sibling.
The earlier
32-start / `401 x 401` optimizer remains discovery evidence only and makes no
optimality claim.  Further blind CEGAR rounds are diagnostic and are not a
prerequisite for either proof stage.  Audits:
`scratch/atail-force/second_dangerous_hit_forcing_analysis.md` and
`scratch/atail-force/residual_555_round19_mec_scalar_core_analysis.md`.

Therefore there is still no basis for raising the uniform producer threshold
above `CARD-GE-12`; a higher threshold would add AHEAD coverage obligations
for cards 12--14 without resolving the current card-12 producer.

The exact placement census also rejects naive scaling of this search. Under the
current `CARD-EQ-12` preconditions, `(4,5,6)` has 253,302 raw/orbit representatives,
while `(5,5,5)` has 683,424 raw placements and 113,904 six-element orbits:
936,726 raw placements and 367,206 representatives total. Independent
re-enumeration, Burnside checks, and six tests pass. This is strictly a
placement-level result: it checks no row system, metric realization, target
faithfulness, producer, or card 11.

The certificate-bank synthesis sharpens the reusable back end without changing
that boundary. The sibling theorem `u5_gram_cert_checker_sound` is a fixed
`Fin 6` / `Fin 8` instance of a natural arbitrary-finite-row/label Gram
certificate soundness theorem; its archived checker handled 37,278 of 37,350
targeted U5 residual patterns. Generalizing it would provide one kernel-checked
compiler for changing equality graphs, but it would not select live rows or
encode the cyclic inequalities essential at round 20. Separately, the validated
critical-system fiber theorem proves every `centerAt` fiber has card at most
four and `|A| <= 4 * |image(centerAt)|`. This forces three centers under the
live `9 < |A|` hypothesis and four only above card 12; the strongest generic
same-cap pigeonhole remains arithmetically slack at card 12 and even card 13.
Full audit:
`docs/audits/2026-07-13-atail-certificate-bank-generalization-audit.md`.

The paused 5,939-row Census-554 bank does not currently contradict that
choice of abstraction. A fresh arbitrary-relabeling audit of rows 5,633--5,939
finds 307 rows and 306 motifs, all 306 new versus the 5,632-row prefix, with no
hit in the original four equality-core families. Thirty-two rows minimize to
four already-known perpendicular-bisector cores; only one other unlabeled motif
repeats, twice, and it hits no current unordered detector. Thus the current
tail supports reuse of general certificate and order-aware consumers, not a
new fixed unordered theorem family. This is deterministic census evidence, not
a stabilization or completeness theorem; the full exact 142 GB replay remains
`NOT_RUN`. Audit:
`scratch/census-554/current_tail_pattern_audit_2026-07-13.md`.

The next equality-only frontier consumer is now kernel checked without changing
that producer boundary. `Census554/SevenPointSixCircleCollisionB.lean` proves
that its eleven equality closures on seven labels have no injective planar
realization. Its exact rational UNIT identity is split across 26 generated
summand modules so the certificate, wrapper, and aggregate
`GeneralCarrierBridge` all build under the project memory cap. The aggregate
axiom audit is exactly `propext`, `Classical.choice`, and `Quot.sound`.
The monotone detector is the twenty-first raw-cube-eligible family in the
22-family catalog; exact-off-circle remains the sole ineligible raw-cube
family.

Its measured effect is deliberately bounded. Against the 46-shard
`CARD-EQ-12` formalized-core checkpoint, only stale shard 15 is rerun. The new
family rejects nine branches but does not exhaust the shard: all 46 shards
still end in `SAT_FINITE_SHADOW_ONLY`. The refreshed exact oracle rules out a
normalized complex or real equality realization for 44/46 survivors; shards
12 and 19 remain `UNDECIDED_FAIL_CLOSED` because Singular times out while both
msolve variable orders return UNIT. The formalized-core checkpoint SHA-256 is
`cbe6dcf835203b930f61223101ed9504653852efde599190a84da9a3460204d9`;
the oracle checkpoint SHA-256 is
`3962fd952661524de566e35cdf7d5659913c5e33bd654c63927653f115c6c4e7`.
This banks one reusable consumer, not a producer or coverage theorem. It
closed no shard and no named on-spine `sorry`; at that checkpoint the live
blueprint still reported 36 named on-spine `sorry` declarations. The later
2026-07-14 LIVE-T1 wiring first reduced the inventory to 24; subsequent T3
wiring reduced the current direct inventory to 12 without changing this
finite-shadow verdict.

The subsequent five-row circle-intersection order checkpoint supersedes those
frontier counts without changing that conclusion. The round-19 scalar and
geometry argument now lives in the production modules
`CircleIntersectionInequalityCore`, `FiveRowCircleIntersectionGeometry`, and
`FiveRowCircleIntersectionOrderCore`; the positive and reflected endpoints are
consumed by `GeneralCarrierBridge`. The aggregate endpoint builds with exactly
`propext`, `Classical.choice`, and `Quot.sound`. Its ordered detector is the
twenty-second raw-cube-eligible family in the 23-family catalog and contributes
two orientations, bringing the production oracle to 26 detector stages;
exact-off-circle remains the sole raw-cube-ineligible family.

Incremental replay invalidates the saved first survivor in 12 of the 46
`CARD-EQ-12` shards. Each slice nevertheless has a later finite-shadow
survivor. The only 100,000-node indeterminate, shard index 24, becomes `SAT` at
108,537 nodes under the declared 1,000,000-node retry, so the final status is
again 46/46 `SAT_FINITE_SHADOW_ONLY`. The final formalized-core checkpoint
SHA-256 is
`7b5736a36506bf234d87b52b638b6b8c9d32f77985e170255ca52267d6651fec`.
The trusted exact-CAS refresh excludes normalized complex or real equality
realizations for 45/46 saved survivors. Shard index 19 is the sole
`UNDECIDED_FAIL_CLOSED` case: both msolve variable orders return `UNIT`, while
Singular times out. Its oracle checkpoint SHA-256 is
`6b2b67726d383b949f8bf6a248fecc5496877a8439d3b9d4bb48483bde4c1acd`.
This is an exact bounded-frontier advance plus a kernel-checked reusable
consumer, not a producer or cover: it closes zero shards and zero named
on-spine `sorry` declarations.

The sharpened missing ingredient is therefore a live incidence producer, not
more scalar algebra or a blind per-placement CAS sweep. It must force the
sixteen memberships consumed by `false_of_five_selectedFourClasses`, the
reused cyclic-order pattern family (including the split-bridge successor), or
the four memberships in `HasGlobalNestedPairProducer`, and then be consumed
immediately. `URowCapMultiplicityFields` is no longer a primary alternative:
it may be reopened only with retained common-system provenance and a new
MEC/all-center geometric coupling that excludes the audited relaxed residual.

Cap profiles at card 12 (sum 15, parts ≥ 4, at least two parts ≥ 5):
(6,5,4), (5,6,4), (5,5,5); {4,4,7} excluded (STATE.md:33-45). Only (6,5,4)
was measured ("654_all"; at run time the "_all" cut set included one
CONJECTURED narrowing, STATE.md:192-208). That narrowing, the order-free
`s <= 2` proxy used only to drop `s >= 3`, is now PROVEN post-SUB2 by
`ATailSub2.sub2H_left_unsat` / `sub2H_right_unsat`. This retrospective tier
upgrade does not make the old run terminal or permit its pre-manifest encoding
to be reused without fidelity validation. Readout = **no observed
convergence** over the measured 65+ iterations: 256 bank rows, 158 window
shapes before the two offline full-cube additions, and 20,322 pre-addition
orbit instances; the raw
evidence is `iters12_654_all.jsonl`, `cegar12_654_all.log`, and
`run_census12_654_all.log`; those underlying artifacts, not a volatile plan
line range, are the authoritative digest source.
All 256 current certificate files exist and the recorded full-bank verifier
passed, including offline `pat_00255`. The canonical family-size estimate is
approximately 5e20 (`STATE.md:286-297`). The (5,5,5) profile was never run to
depth; (5,6,4) was deliberately unmeasured (STATE.md:47-52).

**Three provably different regimes above card 11:**

- **Card 12–14 ("the head")** — finite at each fixed cardinality but with no
  known closing cover. Candidate C is CONJECTURED, not an established route.
  Sampled evidence is n=13 300/300 dead and n=14 160/160 dead, with observed
  kills localizing to at most eight-point windows
  (`census/candidate_d_probe/report.md`, sections 3 and 5.C). Against that,
  the sole n=12 profile run did not converge and omitted two labeled profiles;
  although its formerly conjectural `s <= 2` exclusion is now PROVEN
  post-SUB2, the run also predates the immutable manifest/source-digest gate.
  A head census is therefore an expensive narrowing
  experiment whose success criterion is a checked cover, not merely more dead
  samples.
- **Card ≥ 15 ("the tail") — the relaxed pattern-cover statement is
  FALSIFIED.** The witness tiers must be kept distinct. W15 refutes the weakest
  census surface; exact-integer W16-sq additionally has full H1 and full
  exact-four classes but is not in general position; the W16/W20 two-ring
  witnesses survive full H1, noncollinearity, and exactness at the recorded
  evidence tier (`scratch/d3-formulation/report.md`, section 4). One admissible
  relaxed witness at n=16 is already enough to refute a statement quantified
  over every n ≥ 15; the artifacts do not prove that every individual n ≥ 15
  has such a witness. Because one coordinate realization realizes every
  induced subpattern, no bank of dead equality motifs can cover that witness.
  All these configurations are non-convex, so they do not refute the actual
  `ConvexIndep` leaf; they show that any viable tail theorem or richer census
  must use global convex order, full-filter data, or equivalent critical-row
  coupling absent from the relaxed surface.
- **Only non-excluded tail route: Candidate D** — synthetic
  convexity/full-filter/critical-map coupling for the parent contradiction;
  the forbidden shared-radius pair may occur only as an internal terminal for
  `oppCap2_escape_gen`. The completed Candidate-D probe gives three reusable
  proved cuts (`m ≤ 2`; vertex-pair packets have `s = 0`; `s = 2` is
  straddle-only), but 13/19 decorated minimal-window types are realizable and
  even granting every conjectured per-type kill leaves token-level evasions at
  n=12..16. The seven-variable `SUB2-H` half-disk gate is PROVEN, and the Q3
  two-center sweep is DONE-NEGATIVE: its complete selected-four surface remains
  token-SAT after every proved cut. Cross-center coupling beyond independently
  selected four-point windows is therefore required.

Consequence, stated plainly: **Front A has no complete known route, including
card 11.** The proof-critical surface begins at card 11 and consists of one
parent common-critical-map contradiction. The K-A and LIVE declarations are
the current legacy source chain below that boundary, not independent lanes.
Census554 is the conditional
card-11 alternate; cards 12--14 may admit an AHEAD cover. Both are bounded
fallbacks rather than the primary schedule. Card ≥15 requires
Candidate-D-shaped convexity/full-filter/critical-row mathematics, and the
preferred target is uniform from card 11 so neither finite split is needed.

**Decision A-HEAD (matrix AHEAD-DEC): AUTHORIZED 2026-07-13.** Adam selected
the head-only narrowing attempt as parallel research alongside Census554/A11.
The route must first port and validate the exact old `all` encoding against
the permanent post-SUB2 PROVEN cut contract, run all three labeled card-12
profiles, then cover all six labeled card-13 and ten labeled card-14 profiles
listed in matrix AHEAD-SPEC. Heavy runs remain under the `CTRL-RESOURCE`
transfer and four-worker serialization recorded above. The resource pool is
available after Census554 and the ATAIL pilots stopped, but AHEAD-WORKER still
precedes any immutable run manifest or launch.
Only a proved 12–14 cover permits AHEAD-CONSUME to introduce a named
card-at-least-15 residual with its immediate consumer; no such residual is
authorized earlier. More dead samples without a cover do not justify the split,
and a policy-stopped profile is a durable nonterminal result rather than a
reason to extend the run. Partial banks are theorem-discovery inputs only.

---

## Front B — M44 lane (closed ERASE/pinned/endpoint history)

**Current dispatch correction, 2026-07-13.** K-B-PIN,
K-B-END-GENERAL, and K-B-ERASE are DONE. The only project source sorries are
the 80 Front-A holes in `U1LargeCapRouteBTail.lean`; the pinned general-m
declaration is source-proved and absent from the open spine. The PIN-GENERAL,
PIN-METRIC-BRIDGE, PIN-KQ35, and PIN-EXACT-CLOSURE material below is retained
as dated route history and a reusable theorem bank. It is not a current
dispatch surface.

### B.0 Verified structure (2026-07-09 source + slot3 doc tail)

The historical three-leaf analysis shared one producer core: at M44, `A` is unbounded
(`surplusCap.card + 5 = A.card`, `Cap/PartitionFromMEC.lean:450`) and unlabeled
points live in the surplus cap interior. The producers demand, per non-fixed
center, a fully-labeled equidistant 4-class whose mask is in the generated
candidate tables — i.e. **confinement**. The pinned residual supplies exactly
one labeled circle (the `.v` selected class, SurplusM44Packet.lean:4390);
no non-circular producer existed in the repo at the 2026-07-09 checkpoint.
That analysis led to completed pinned-surplus and endpoint general-m
classifiers. The only current Front-B proof cluster is ERASE; B.1 and B.2 are
retained as closed route history and must not be dispatched.

Coordination: query ownership live with `proof-blueprint anchor list`; do
not take a row whose owner is active. Anchors are advisory, so file changes
still require a fresh diff read. (Historical 2026-07-09 snapshot: erased-pin,
pinned-surplus, and liveData branches all had active owners; the erased-pin
and liveData anchors were cleared as stale on 2026-07-11.)

### B.1 Endpoint residual producer (leaves 4 and 5)

**CLOSED 2026-07-12.** K-B-END-LABEL and K-B-END-GENERAL are DONE. The m=5
geometry producer and the general-m card-eleven endpoint classifier are
kernel-verified under the recorded core/native trust boundary, contain no
source `sorry`, and are absent from the open spine inventory. The remainder of
this subsection is historical route rationale, not current work.

**Updated 2026-07-11 — route (b) implemented (commit 136ebb9b).**
`isM44EndpointResidualsExcluded` (`Base.lean:9521`) case-splits on
`S.surplusCap.card = 5`:

- **m = 5 branch (matrix K-B-END-LABEL, END-L/END-R — scoped to m = 5).**
  Two `hshadow` holes at `Base.lean:9555`/`:9578` with
  `hcard5 : S.surplusCap.card = 5` in scope. `ResidualCoreData` already
  produces the ten point labels, injectivity, point membership, the two fixed
  `.v/.w` selected-class masks, and the terminal contradiction from any shadow
  that is both in the endpoint bank and a metric shadow. Apex orientation is
  SYMMETRIC, not forced (2026-07-11 prover verdict): a forcing lemma is
  equivalent to the hole itself; the two holes are exact mirrors under
  `NonSurplusSwap` (`U2NonSurplusOneHit.lean:1642`), leaving one direct and
  one reflected apex branch, with kernels
  `crossSeparationOKForMasks_of_sameRadius_ccwHull`/`_reflectedCcwHull`
  (`SurplusCOMPGBankGeometry.lean:1498`/`:1621`) reused as-is. Producer
  staging is landed green in `EndpointCertificate/GeometryProducer.lean`
  (engine + u-bound + circumcenter families; commits 8a7e6d1b, b2183714,
  35bc63aa); right-apex assembly was then in flight and subsequently closed.
  Import boundary: `Base.lean` may
  import the producer; the producer must not import `Base.lean` or any
  consumer of `isM44EndpointResidualsExcluded` (hull-order machinery
  relocated upstream to `PinnedHullOrder.lean`, commit 858b7e39).
  Acceptance: the two Base holes disappear via producer calls.

- **General-m branch (matrix K-B-END-GENERAL).** New leaf
  `isM44EndpointGeneralMResidualsExcluded` (`Base.lean:9511`, hole `:9513`,
  stated strictly `5 < S.surplusCap.card`), routed to the forced
  `m = 6` / `A.card = 11` machinery with a scoped extension (endpoint seed
  predicates, classifier extension, one (4,2,2) bridge case, endpoint source
  consumers) — see `docs/audits/2026-07-11-endpoint-generalm-representability.md`.
  Finite gate passed 2026-07-11 with zero residuals over both 32-placement
  endpoint seed families (EXACT WITHIN MODEL, not PROVEN;
  `census/endpoint_confinement/endpoint_direct_metric_core_residuals_n11.json`).

`isM44EndpointResidualsExcluded` leaves the spine-open list only when BOTH
branches close.

### B.2 Pinned-surplus general-m residual (leaf 3)

**CLOSED 2026-07-12.** K-B-PIN is DONE. The forced `m = 6`, card-eleven
classifier, pinned-shell bridge, and left-to-right transport close the former
general-m leaf; it contains no source `sorry` and is absent from the open spine
inventory. The remainder of this subsection records the route that produced
the closure and is not dispatch authority.

The label-complete path is closed.  Both halves of
`isM44PinnedSurplusNonVExactShapeProducer` now require
`S.surplusCap.card = 5` and prove, for each pinned residual and fixed ten-label
geometry, the exact output

```text
∃ supportClass : Label → Finset ℝ²,
  PinnedSurplusSupportClasses pointOf sstar
    (pinnedSurplusCenterClass A pointOf radius wRadius supportClass)
```

where `PinnedSurplusSupportClasses` means (i) same-radius classes at every
center other than `.v/.w`, and (ii) membership of every resulting point mask
in `candidateMasks sstar center`.  The metric-shadow assembly and checked
row-zero contradiction also close this `m = 5` regime.  The focused producer
and bank targets build; `PinnedSurplusProducer.lean` contains no `sorry`.

The former remaining leaf was
`isM44PinnedSurplusGeneralMResidualsExcluded`, stated directly with
`5 < S.surplusCap.card`.  Do not route it through exact ten-label masks.  The
empty-residue generator census only classifies facts after selecting a
singleton leaf.  The finite coverage probe
`scripts/pinned-generalm-certificate-coverage.py` finds a model defeating all
available leaves in every one of the 15 fixed `.v/.w` rows at nonfixed
labelled-cardinality floors 2 and 3, even with cyclic cross-separation and the
global point-pair class-count bound.  Coverage returns only at floor 4.

The first larger-regime reduction is now proved, without adding a second
obligation. `SurplusCapPacket.surplusInterior_card_ge_four_of_card_gt_five`
uses the strict `5 < S.surplusCap.card` hypothesis to show that the strict
surplus interior has at least four points. The orientation-specific theorems
`CounterexampleData.exists_pinnedRightExtraCriticalPacket` and
`CounterexampleData.exists_pinnedLeftExtraCriticalPacket` choose an additional
surplus-interior point `y` outside the pinned four-class and a selected
four-class at the surplus apex whose support contains `y`. That class survives
in the skeleton with `y` and its pinned apex erased.  Minimality then produces
a `U3LocalizedNoQFreePacket D y p`, forces `p` to differ from the pinned apex,
and supplies a `U3FixedTriplePacket D y p t1 t2 t3`.  The packet now also
contains the exact full `CriticalSelectedFourClass D.A y p` on
`{y,t1,t2,t3}`.  The two-circle bound forces at least one of `t1,t2,t3`
outside the pinned class.  Finally, `U3FixedTripleAuditFrame` supplies a
selected candidate `u` and two further auxiliary points `a0,a1`, all with the
required skeleton exclusions and all off the critical circle.  The on-spine
theorem constructs `D.Minimal` and a `CriticalShellSystem A` before its sole
`sorry`.  The system now retains, for every source, the deletion-failure fact
at its chosen blocker center; `CriticalShellSystem.no_qfree_erase_center_at`
exports the center-erased form consumed by localized packets.  Each orientation
extractor now returns a concrete frame, the proved terminal fact
`∀ H : U3FixedTripleAuditFrame ..., ¬ H.RowwiseConfinedQDeletedClasses`, and a
single `CriticalShellSystem` / `FaithfulCarrierPattern` preserving the pinned
exact row, the surplus-apex row through `y`, and the dangerous exact row.

For every center in this bounded frame,
`U3FixedTripleAuditFrame.auditCenters_qDeleted_or_qCritical` proves the exact
row dichotomy: either an exact-cardinality-four q-deleted K4 class or an exact
three-point q-critical class.  It deliberately does not assert that a
q-deleted class is confined to the bounded support.

This extraction does not reduce `m` or confine the additional surplus points
to the existing ten labels.  The remaining theorem must derive `False` from
the critical-shell system together with either orientation's exact critical
packet and bounded audit frame.  The finite consumer is now complete:
`U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses` assembles
`U5ConfinedK4AuditPayload`, converts it to audited support, and invokes the
kernel-checked finite audit directly.  It uses neither `U2Statement` nor
`U5ModeA`.  Its exact remaining producer is
`H.RowwiseConfinedQDeletedClasses`: every one of the six audit centers must
have an exact q-deleted four-class contained in `U5BoundedSupport`.

Producing that proposition has two explicit subobligations.  First eliminate
or promote the q-critical-three arm of the proved row dichotomy.  Second prove
bounded-support confinement for each surviving q-deleted four-class.  A route
through U2/U5 Mode A or non-surplus containment would be circular at this
source site unless its required input is proved independently.

Historically, PIN-R and PIN-L were DONE while PIN-GENERAL owned this leaf. The
proposed acceptance test was to prove `H.RowwiseConfinedQDeletedClasses` for
one extracted orientation frame, or a stronger direct audit-frame obstruction.
That route is superseded. The terminal source is now sorry-free: its left
residual is transported through
the all-index `NonSurplusSwap.pinnedLeft_to_right` field, then the swapped
datum is relabelled and consumed by the existing right-pinned carrier bridge.
K-B-PIN records the completed build/axiom/spine gates. Do not resume the
historical confinement producer without a new named on-spine consumer.

#### PIN-GENERAL incidence-probe checkpoint (2026-07-10)

The permanent probe at `census/global_confinement/` first searched the canonical
adjacent pinned-source/deleted-point placement for the `(6,4,4)` and `(7,4,4)`
profiles (`n = 11,12`).  It fixes the pinned and dangerous exact classes,
selects one compatible K4 row at every remaining center, and enforces the
L2/PROVEN local cuts, Q3 joint cuts, cyclic cross-separation, the two-circle
overlap bound, and the global point-pair class-count bound.  It separately
tests individual q-critical audit rows, simultaneous q-deleted survival at all
six audit centers, and eight-point confinement.  SAT is only a selected-class
incidence witness; the probe has no coordinates or distance equations.

The exhaustive declared-shadow counts are:

- `n = 11`: `364/564` dangerous rows have a full-center extension;
  `2654/3276` individual audit-center q-critical tests are SAT;
  simultaneous q-deleted survival is SAT on `3933/7280` admitted packet frames
  and UNSAT on `3347/7280`; confinement is UNSAT on all `7280` frames.
- `n = 12`: `709/935` dangerous rows have a full-center extension;
  `6082/7090` individual q-critical tests are SAT; simultaneous q-deleted
  survival is SAT on all `24815` admitted packet frames; confinement is UNSAT
  on all `24815` frames.

These results do not close PIN-GENERAL.  They show that the current incidence
cuts do not eliminate q-critical rows, and that selecting globally compatible
K4 rows does not itself prove the theorem-facing q-deleted classes.  The
all-UNSAT confinement result is a finite-consumer check, not evidence for the
missing producer.  The dangerous-row types `(0,0,2,2)` and `(0,2,0,2)` have no
full-center extension in either scan and are provisional fixed-pin elimination
lemmas.  The apparent `n = 11` elimination of `(0,0,0,4)` disappears at
`n = 12`, so it must not be promoted to a general theorem.

The follow-up scans close the original model-coverage TODOs:

- `placement_results_n11_12` covers every ordered pair of distinct surplus
  labels: 12 placements at `n = 11` and 20 at `n = 12`.  Aggregated admitted /
  rejected dangerous rows are `3779/2989` and `13700/5000`, respectively.  The
  two zero-extension types `(0,0,2,2)` and `(0,2,0,2)` remain zero at every
  scanned placement and cardinality.
- `placement_zero_types_n13` checks just those two types over all 30 ordered
  `n = 13` placements.  All 600 `(0,0,2,2)` and 1,200 `(0,2,0,2)` scenarios
  are UNSAT, with no cap.  This is a successful larger-size check, but remains
  bounded evidence.
- `zero_type_cores_n11_13` explains all 2,888 zero-type rows before DFS.  Exactly
  1,444 have an incompatible fixed pin/dangerous pair from overlap greater than
  two or cyclic cross-separation.  The other 1,444 leave `Moser-2` with an empty
  candidate domain after Q3, overlap, and cross-separation filtering.  The same
  three rejection families occur at every scanned size.  This is a complete
  bounded core partition, not yet a size-independent Lean theorem.
- `critical_shell_results_all_placements_n11_12` samples one admitted packet
  per placement and dangerous-row type.  It encodes one exact blocker shell
  for every source and requires every selected K4 at that blocker center to
  contain the source.  All `177 + 340 = 517` packets admit the joint shell
  system and a K4 at every ambient center (`517` SAT, `0` UNSAT, `0` capped in
  both stages).  The largest full search used `276052/300000` nodes.

The Lean interface now matches that enriched model: `CriticalShellSystem`
stores `no_qfree`, `exists_criticalShellSystem` preserves it, and
`CriticalShellSystem.no_qfree_erase_center_at` supplies the center-erased form.
This eliminates the prior data-loss risk.  The all-SAT result shows that shell
existence plus the current global incidence cuts is not itself the missing
contradiction.

The shell/audit coupling TODO is also complete.
`shell_audit_results_all_frames_n11_12` tests every exact q-critical row and
every six-center q-deleted frame for all 517 representatives while retaining
the joint source-indexed shells, no-q-free linkage, and full-center extension.
The adjudicated totals are:

- q-critical: `4198` SAT, `795` UNSAT, `0` indeterminate out of `4993`;
- q-deleted survival: `12894` SAT, `2546` UNSAT, `0` indeterminate out of
  `15440` frames.

The 67 initial caps were resolved in targeted passes at 1, 3, and 10 million
nodes.  The added shell constraints prune both audit families, but many models
survive, so this declared shadow does not prove q-critical elimination or
rowwise confinement.  There is no need to repeat the confinement run: adding
shell constraints is monotone, and every weaker confined scenario was already
UNSAT.

The stable-zero core TODO is complete.  `zero_type_cores_n11_13` inspects all
2,888 node-zero rows for `(0,0,2,2)` and `(0,2,0,2)` across `n = 11,12,13`.
Exactly 1,444 are fixed-pair conflicts between the pinned and dangerous exact
classes: either overlap exceeds two or the supports violate cyclic
cross-separation.  The other 1,444 have an empty candidate domain at Moser
center 2; every locally admitted candidate is rejected by overlap, separation,
K-Q3-1, or K-Q3-5.  The blocker-region signatures are stable across all three
sizes: `O2` / `O1` for the fixed-pair / one-center branches of `(0,0,2,2)`,
and `S` for both branches of `(0,2,0,2)`.

This decomposition identifies proof atoms but is not itself a general-`n`
proof.  `SelectedFourClass.inter_card_le_two` already supplies the overlap
atom.  The underlying `SurplusCOMPGBank.btw_sep` theorem now applies to every
`Fin n` CCW convex enumeration; the generated Boolean-mask wrapper remains
ten-label-specific, and PIN-GENERAL still needs a carrier-to-boundary-index
bridge.  K-Q3-1's same-side two-circle core is already kernel-clean as
`SurplusCapPacket.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`;
the missing work is the selected-support/cap-location adapter. K-Q3-5's
normalized scalar core is now kernel-clean as
`Problem97.q3_shared_interior_false_normalized` in
`P97/Q3SharedInterior.lean`: it consumes normalized MEC-disk, oriented-height,
base-coordinate, nonobtuse-apex, radius-square, and strict cap-side hypotheses.
The packet now supplies `hdisk`, `hux0`, `hux1`, and `hapex` directly through
the kernel-checked
`CircumscribedMECPacket.normSim_mec_disk_normalized`,
`CircumscribedMECPacket.normSim_v3_fst_bounds`, and
`CircumscribedMECPacket.normSim_nonobtuse_at_v3_normalized`. The complete
core-only indexed-cap adapter is now
`SurplusCapPacket.q3_shared_interior_false_of_adjacent_selectedClass_membership`:
it
rotates the MEC packet into the cap support-chord frame and internally supplies
the oriented height, center height, lower side, radius-square transport, and
normalized strict side premises. Its orientation-free wrapper reverses the
frame and swaps the two selected-circle roles when needed. Its explicit source
contract is strict-cap witness `z`, adjacent-interior witnesses `p`/`q`, and
shared `SelectedClass` memberships at the two cap endpoints. Adjacent-cap
membership supplies the strict side products. The remaining producer work is to
extract those facts from selected classes without importing the target
confinement conclusion. Finally, the kernel-checked L2/full LOCAL enumerator proves abstract code
coverage only; it does not extract a `ProfileClassIncidence` code from a
concrete geometric `SelectedFourClass` or transport the required compatibility
facts.

The current source audit sharpens this boundary. `CriticalShellSystem` supplies
a full `CriticalSelectedFourClass` and its no-q-free / center-erased blocker
facts, while `U3FixedTripleAuditFrame` supplies only the q-deleted versus
q-critical row dichotomy. Neither interface supplies cap-interior membership,
adjacent-cap indices, or the four endpoint `SelectedClass` memberships consumed
by K-Q3-5. Therefore the Q3 theorem cannot yet be instantiated from the
PIN-GENERAL packet by definitional unfolding; a bridge must be proved from the
selected-class shell/audit data, or this route must be marked unavailable for
that frame. This is a producer gap, not a missing algebra lemma.

The K-Q3-1 adapter has a fixed, small Lean contract.  For a chosen shared cap
`i : Fin 3`, take `K₂ : SelectedFourClass D.A (D.packet.triangleByIndex i).v2`
and `K₃ : SelectedFourClass D.A (D.packet.triangleByIndex i).v3`, together
with distinct `x` and `y` in both supports and proofs that both lie outside
`D.packet.capByIndex i`.  The adapter obtains carrier membership from
`support_subset_A` and the four radius equations from `support_eq_radius`, then
calls `D.packet.twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`.
The only missing producer work is to map a Q3 code/shared-support branch to
that `i`, these two selected classes, and the two outside-cap facts.

**PIN-GENERAL proof-interface gates.** K-Q3-5 now has a named indexed-cap
theorem contract,
`SurplusCapPacket.q3_shared_interior_false_of_adjacent_selectedClass_membership`,
whose
complete normalization, MEC packet alignment, and orientation symmetry are
kernel-checked. Before it can serve PIN-GENERAL, produce its strict-cap witness,
two adjacent-interior witnesses, and four endpoint class memberships from the
concrete selected classes; solver notes alone do not supply this extraction. The
selected-class-to-L2 extractor must be total: for every
relevant `U3FixedTripleAuditFrame` and audit center, it returns a finite-domain
code and proves every cap-count, shared-label, overlap, separation, and Q3 field
used by the consumer. The finite consumer must quantify over that extracted
domain, not a hand-selected subset.

**Metric-realizability triage.**
`census/global_confinement/metric_realizability_structural_complete.{md,json}`
records the complete deterministic partition of all 1,325 saved relaxed row
systems: 1,264 duplicate-center, 31 exact-off-circle, 20
perpendicular-bisector, 9 cyclic five-point, and 1 cyclic
rhombus/equilateral contradiction. The original 30-system solver frontier is
therefore fully mined, although a 120-second-per-stage cvc5 rerun of the last
system still returns UNKNOWN. Generic core-only Lean consumers are
`EqualityCore.false_of_convexIndep_of_perpBisectorCore`,
`ConvexFivePointCore.false_of_core`, and
`ConvexRhombusCore.false_of_core`, in addition to the earlier duplicate-center
and exact-off-circle endpoints.

This completes bounded metric-core triage but does not emit Lean
row-realization proofs for arbitrary PIN-GENERAL frames. The remaining
obligation is a noncircular producer/coverage theorem: map every relevant
frame to a realized equality pattern, derive the required cyclic orientation
facts, and extract one of the proved cores, or prove a finite-code completeness
bridge into the certified assignment domain. The generic theorem kernels are
general in the label type; only the current coverage artifact is bounded. The
orientation adapter must explicitly reconcile the probe-positive cross order
with the negative `signedArea2` convention exposed by
`ConvexCyclicOrder.hneg_of_ccw`.

The exact-row endpoint is now attached to the live shell API:
`Census554.ExactShellBridge.false_of_criticalFourShell_exactOffCircleCore`
combines a realized generic equality closure with a `CriticalFourShell`'s
exact support equation. It does not manufacture the required realized pattern,
support membership, or off-support label from a PIN-GENERAL packet; that is the
next producer obligation and must remain independent of the target
confinement conclusion.

#### PIN-GENERAL arbitrary-carrier bridge checkpoint (2026-07-10)

The arbitrary-cardinality consumer side is now kernel-checked. The canonical
carrier subtype is mapped to a `Census554.EqualityCore.RowPattern`, with a
proved `Realizes` witness and exact blocker rows from `CriticalShellSystem`.
`MetricCoreAlternative` and `ShellMetricCoreAlternative` cover duplicate
centers, exact off-circle, equal-K4, equilateral-bisector collision,
three-triad collision, surplus-source collision, six-row-anchor collision,
seven-point-orbit collision, seven-point circle-network collision,
perpendicular-bisector, cyclic five-point, and cyclic rhombus cores. The cyclic
consumers have negative-orientation wrappers matching the live CCW enumeration
convention. All twelve consumers are generic in the finite label type and
introduce no new `sorry`.

The boundary-index gap is also closed. `GeneralCarrierBridge.BoundaryIndexing`
packages an injective CCW enumeration and an injective inverse index for every
carrier label. `BoundaryIndexing.sharedPair_satisfied` applies the generic
`SurplusCOMPGBank.btw_sep` theorem directly to a realized shared-pair core.
`PinnedCarrierBridge` simultaneously preserves the pinned exact row, a
surplus-apex selected row containing the deleted source, and the dangerous
exact critical row in one shell system and faithful pattern. If the dangerous
center is the surplus apex, exact-shell uniqueness identifies the last two
rows.

The local pinned geometry has a complete opposite-apex split in both
orientations: the K4 row is the exact opposite cap, a mirror pin at a distinct
surplus point, or an endpoint residual. Separately, every fixed-triple audit
constructively exposes either a q-deleted row member outside its bounded support
or an ambient critical shell.

None of these results proves the final producer. Minimality implies that every
proper nonempty selected-row-closed subset has an escaping row, but that is not
enough: freshness is only relative to the current support, a critical shell can
remain internal, and a selected-row path does not compose equality closure. The
next accepted theorem must use convex cyclic geometry to prove:

```text
nonfresh audit escape
  -> ShellMetricCoreAlternative
     or a shared pair with strict boundary-interval rank decrease.
```

The shared pair and strict interval inclusion are the open mathematical facts.
An abstract `iterated_escape_forces_core` theorem without them is an overclaim.

#### PIN-GENERAL surplus-source falsifier checkpoint (2026-07-10)

The permanent probe
`census.global_confinement.surplus_source_metric_core_probe` strengthens the
source-indexed shell model by requiring the selected surplus-apex row to contain
the deleted surplus point, matching the new three-row Lean carrier. It found
incidence assignments that avoid the five alternatives then present in
`MetricCoreAlternative`. Equal-K4, equilateral-bisector, three-triad, and
surplus-source collision were subsequently added as generic consumers. The
probe starts from `critical_shell` representatives and does not add the six rows
of a particular `U3FixedTripleAuditFrame`; it tests the
three-row-plus-global-shell route, not a producer that genuinely consumes the
complete audit frame. Therefore the proposed theorem

```text
aligned pinned row + surplus-source row + dangerous row + current incidence cuts
  -> one of the proved metric cores
```

is false at the encoded incidence level. These assignments are not Euclidean
models and are not Problem 97 counterexamples. A 60-second-per-stage Z3 check
of the first survivor returned UNKNOWN for the exact-metric, full-convex, and
convex-only systems; UNKNOWN carries no verdict.

The original packet-54 survivor has a stronger algebraic adjudication. After removing
inessential reference labels, 12 squared-distance equalities on six moving
points give the unit ideal over characteristic zero. msolve reports the same
empty complex variety under three variable orders, and Singular independently
confirms the characteristic-zero unit ideal. The direct theorem
`EqualityCore.not_realizes_of_surplusSourceCollisionCore` now supersedes that
external calculation for proof purposes and kills the known packet-54
assignment. Packet 54 as a whole remains `INDETERMINATE` after both v4 and v5
reach the 300,000-node cap.

The complete v4 nine-core checkpoint classifies the 517 packets as 167 `UNSAT`,
250 `SAT`, and 100 `INDETERMINATE`. It is archived as
`surplus_source_metric_core_results_n11_12_v4.json` with SHA-256
`d26afd7901bc72b80d212caad6c48d9aa088b653cca3ac7caeca7811ca3b0062`.
Two further exact QQ unit cores extracted from the packet-85 and packet-181
witnesses are now generic, kernel-checked Lean theorems:
`not_realizes_of_sixRowAnchorCollisionCore` and
`not_realizes_of_sevenPointOrbitCollisionCore`. Each assumes only `O != A`; all
other roles may alias. They kill those saved witnesses, but packet-wide
classification requires a new search for alternative assignments.

Schema v5 adds those two detectors, records inherited-row provenance, reuses
only the 167 monotone v4 `UNSAT` verdicts, and reruns every old `SAT` or
`INDETERMINATE` packet. The v5 artifact now records `complete=true`; it is a
terminal result for that exact finite packet schema, not a general geometric
closure theorem. The shared closure-index optimization was
differentially checked against the reference detectors and reduces the saved
packet-177 prefix classifier by about 6.3x on this host.

The permanent `equality_ideal_probe.py` mines exact QQ unit-ideal candidates
from saved v4/v5 SAT assignments. Packet 177 survived the then-current eleven
detectors under direct replay and exposed a Singular-confirmed seven-point unit
subsystem. The first direct Lean `grobner` attempt exceeded the 16 GB build cap;
the obstruction has since been reproved by smaller Gram-determinant and
polynomial identities as
`EqualityCore.not_realizes_of_sevenPointCircleNetworkCollisionCore`, the
twelfth generic consumer. The old saved assignments are not Euclidean
realizations or Problem 97 counterexamples, and their historical verdicts do
not constitute a total producer.

Exact rational local models for each opposite-apex branch independently show
that the pinned/surplus/dangerous three-row packet alone is consistent. Any
accepted closure must consume additional global shell/audit data. The smallest
currently identified direct additions are either an equality-closure path from
an exact row to an off-row label, yielding `ExactOffCircleCore`, or a second
shared support point between the surplus and dangerous rows plus cap-order
localization proving a proper boundary-interval successor. A shared pair alone
gives cyclic alternation but not strict descent.

Applying the critical-shell system to all four members of the surplus-apex
class does not supply that second point. The first unsupported fact is a source
`q` and a distinct `z` in the surplus class such that `z` also lies in `q`'s
chosen shell while `q`'s blocker differs from the surplus apex. Even after that
fact, the strict subinterval must inherit a valid audit/blocker state. Neither
antecedent follows from `CriticalShellSystem` or the current aligned carrier.

#### PIN-GENERAL forced card-eleven checkpoint (2026-07-11)

The open branch is no longer arbitrary in either the surplus-cap size or the
ambient cardinality. `SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4`
and `SurplusCapPacket.surplus_card_eq_six_of_convexIndep_K4` prove that
`5 < S.surplusCap.card` forces `S.surplusCap.card = 6`.
`SurplusCapPacket.card_eq_eleven_of_surplus_card_gt_five` then proves
`A.card = 11`. Finally,
`SurplusCapPacket.exists_orderedSurplusCapSix_with_selected_hitCounts_and_endpoints`
supplies an ordered six-point surplus cap, retains which ordered endpoints are
the two Moser support endpoints, and proves the exact selected-row cap-hit
counts: one at its endpoints and two at its four strict interior points.
`selectedClass_support_inter_surplusCap_card_eq` transports that result to any
named cap center. These are kernel-checked general theorems, not census
observations.

The resulting direct finite model is defined in
`Census554.CapSelectedFiniteCode`. Its canonical labels have cap profile
`(6,4,4)`, one selected row at every center, the existing local, overlap,
pair-count, Q3, and cross-separation consequences, the exact cap-selected
counts, the pinned row, and the source-indexed shell blocker conditions. The
two order-sensitive core predicates now accept both orientations of the cyclic
boundary. This orientation symmetry is necessary: a forward-only diagnostic
temporarily left three row patterns in five placements, and every one was an
already-formalized convex five-point core in the reversed order. Regression
tests preserve that case.

The orientation-complete run in
`direct_cap_selected_metric_core_residuals_n11.json` exhausts all twelve
ordered choices of distinct pinned and deleted surplus-interior labels. Every
placement is `EXHAUSTIVE`, no search is capped, the largest search visits
299,801 nodes, and the residual bank is empty. The 2026-07-14 provenance
refresh checks 23 theorem families through 26 detector stages. The artifact
SHA-256 is
`98b1ebe08279337e5dbded3ec1911edb7be505ec84506d6de7eadcf2300d247f`;
the probe-source SHA-256 recorded by the artifact is
`1a6eff0ab3e99e9e8038f951f6465c37613eafcdff6163ecc8d47ba3c0ae0c35`,
and its metric-detector dependency SHA-256 is
`f7a92776f9cee02eda2265467d77a0bbd5254d1dd335bc7a70713203239d3373`.
This is exact within the declared finite model. It is not yet a Lean theorem.

#### PIN-GENERAL native-classifier checkpoint (2026-07-11)

`Census554.CapSelectedNativeClassifier` replaces the quantified free-color
bitvector search with direct eleven-bit row enumeration and deterministic
equality closure. All twelve ordered pin/deletion placements now build by
`native_decide`; `CapSelectedNativePlacements.allPlacementChecks` is their
aggregate theorem. The eight-job aggregate build took about 17m31s on this
host. Individual runtimes ranged from about 90 seconds to 17m25s. The older
bitvector attempt had produced no verdict after 55 minutes on one placement,
so the replacement is substantially faster, but this is not a completed
old-runtime benchmark.

The exact external enumerator was rerun after removing the rhombus detector.
All twelve placements remain `EXHAUSTIVE` with zero survivors under only
duplicate-center, exact-off-circle, perpendicular-bisector, and oriented convex
five-point cores. This remains the external finite-model cross-check; the
twelve native placement equalities are now Lean theorems.

The proof-facing layer is partially kernel-checked:

- `CapSelectedNativeClassifierFacts` caches exhaustive mask membership,
  intersection-cardinality, Q3-block, local-candidate, and pinned-row facts;
- `CapSelectedNativeClassifierSound` proves semantic candidate-row coverage,
  the fixed pinned seed, row-intersection pruning, Q3 pruning, cyclic-separation
  pruning, `rowsCompatible`, `pairBoundOK`, and the complete `compatibleWith`
  filter;
- `CapSelectedNativeClassifierCoverage` proves domain sorting is a permutation,
  domain restriction preserves each distinguished semantic row, and the full
  recursive search trace. In particular,
  `exists_semanticPrefixCore_of_placementCheck` turns a successful placement
  replay into a duplicate-free semantic prefix with `hasPrefixCore = true`;
- `CapSelectedNativePlacements` packages all twelve successful native replays;
- `CapSelectedNogoodCertificate` proves direct row/flip path checking, compact
  core extraction, pinned exactness, and checked-bank-match soundness;
- `CapSelectedNogoodClassifier` proves the complete static-bank DFS trace and
  turns a successful placement certificate replay into the public
  `ClosureCoreAlternative`;
- `CapSelectedNativeClosureSound` proves the native union-find parent
  invariant, transports every normalized-root equality to `EdgeClosure`,
  extracts all four active native core families, and proves the total theorem
  `closureCoreAlternative_of_incidenceOK_pinnedShellOK`; and
- `CapSelectedClosureColor` and
  `CapSelectedGeometry.exists_boundaryBlocks_of_isM44_surplus_card_eq_six`
  build without `sorry`, supplying canonical closure colors and exact direct-or-
  mirror `(4,2,2)` boundary blocks.

The finite obligation is closed. A separate exact certificate-mining run found
149,434 subsumption-minimal row nogoods and a 647,221,809-byte flat artifact;
all 795,609 prefix kills had explicit row/flip paths of length at most 17, and
the static bank replayed all twelve placements UNSAT. This is exact within the
finite model, but the flat payload is operationally rejected as a Lean
artifact. Its compact hash-anchored record is
`certificates/surplus/reports/cap_selected_nogood_certificate_mining.{md,json}`.
The generic union-find proof removes that payload entirely.

The canonical-label and incidence parts of the geometry obligation are now
closed:
`CapSelectedGeometry.exists_canonicalLabeling_of_isM44_surplus_card_eq_six`
enumerates the exact boundary blocks into `Fin 11`, identifies all three
strict-interior preimages, and carries direct or reflected hull order.
`CapSelectedCarrierBridge` constructs and realizes the finite row code. It
proves all six incidence conjuncts through `incidenceOK_patternCode`:
`LocalRowsOK`, `RowIntersectionsOK`, `PairCenterCountOK`, `CrossSeparationOK`,
`Q3OK`, and `CapSelectedCountsOK`. The proof includes the previously missing
non-Moser three-hit exclusion without importing U2 or a downstream containment
theorem. Its axiom closure is exactly `propext`, `Classical.choice`, and
`Quot.sound`.

The right-oriented adapter is now implemented in
`CapSelectedPinnedShellBridge`: it constructs `PinnedShellOK` from an aligned
right carrier, invokes `incidenceOK_patternCode` and the total native theorem,
consumes all twelve `ClosureCoreAlternative` cases on the geometric carrier,
and is wired into `PinnedSurplusGeneralM.lean` as the first terminal conjunct,
`PinnedRightSurplusResidualAt -> False`.

The explicit left-to-right boundary reflection adapter is implemented in
`U2NonSurplusOneHit.lean`: each of the three fixed-surplus swaps transports the
private cap, selected center, adjacent caps, outer endpoints, and both
non-equidistance fields. It is exported as
`NonSurplusSwap.pinnedLeft_to_right` and used by the terminal source to obtain
the same right-oriented finite seed, shell witness, and closure contradiction
for the left packet. The source elaborates directly without `sorry`; the
serialized target build and proof-blueprint refresh later passed. The
shared-pair/strict-interval descent route is historical fallback, not the
current critical path.

### B.3 Erased-pin generated row bank (leaf 5 lane)

The ERASE-P2 redraft is complete. The broad false remainder assertions were
removed and replaced by twenty explicit per-row refutation consumers. The
current classifier ladder forces card `{10,11}`:

- **card 10 / P2 — DONE in commit `652fdfcb`:**
  `ErasedCertificate/CardTenProducer.lean` supplies the label-complete
  producer, `hv`/`hw` classes, terminal coverage, and pure-row cardinality
  closures. All twenty P2 consumers are wired through proved card-10 branches.
- **card 11 / P2 — DONE in commit `652fdfcb`:** the same twenty
  consumers call the `P2Closure.lean` finals.  All 128 independent native
  leaves, aggregators, semantic dispatcher, closure, residual shard, and
  downstream `Continuation` target build.  The right/left terminals and
  dispatcher have approved axiom closures with no `sorryAx`.  A final cached
  rerun of `scripts/build-p2-certificates.sh` passed all 16 bounded batches and
  the 8410-job aggregate target with exit code 0.
- **card 10 / P4 — DONE:** M9 enumerates all 504 admissible `u`/`s`-centered
  seeds, proves a 378/126 direct-separation/native-grid partition, and closes
  the 72 P4-U plus three 18-seed P4-S grid families through seven native
  shards. Both geometric consumers are wired and spine-closed.
- **card 11 / P4-U — DONE:** the containment-specialized 47-support native
  certificate, semantic classifier/closure transport, canonical geometry
  consumer, and `Continuation.lean` wiring close the surplus-opposite
  residual. The refreshed spine marks it closed.
- **card 11 / P4-S — DONE AND DOWNSTREAM VERIFIED:** the 128 native
  placement leaves, semantic dispatcher, family final, and source consumer are
  implemented and built.  `P4SPlacements`, `P4SClosure`, and the importing
  `Continuation` target build.  The terminal, semantic dispatcher, and
  downstream parent report only core axioms plus approved `Lean.trustCompiler`,
  with no `sorryAx`.

The card-eleven M6 geometry lane is now complete and target-built:
`ErasedCertificate/CardElevenBridgeStaging.lean` and
`CardElevenBlocker.lean` package canonical incidence, orientation-correct
bucket counts, deleted-row selection, blocker routing, and exactness for all
twenty count rows and both P4 families. The finite blocker override is confined
to the prescribed proof-facing row; this avoids the unavailable claim that
every member of an arbitrary erased-pin class has the same geometric critical
center. The stale `blocker deleted ≠ center` condition is not part of the ERASE
shell contract: every committed classifier/closure consumer discards it, and
it is false in the P4-U case. The M6 target build passed 8173 jobs and its
package theorems use only `propext`, `Classical.choice`, and `Quot.sound`.

The native M1 gate is complete.  The compiled `erase_m1_gate` executable ran
the exact 4543-cell domain with eight Lean runtime threads and returned P4-U
47/47, P4-S 1440/1440, and P2 3056/3056 true in 845205 ms.  This resolves the
search-feasibility STOP condition empirically; it is not itself a theorem.

M2 is complete generically.  For P4-U and P4-S, M3-M5 and M7 are also complete through
`ErasedNativeClassifier.lean`, `ErasedClassifierSound.lean`,
`ErasedClassifierCoverage.lean`, `ErasedClosureSound.lean`,
`CardElevenShellBridge.lean`, the corresponding placement modules, and
`P4UClosure.lean`/`P4SClosure.lean`.  The earlier downstream `Continuation`
target build passed 9292 jobs for P4-U.  Both P4-S standalone endpoints have
axiom closure exactly
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`, with no `sorryAx`.  P2's M3-M5 and M7 now pass the same
build/axiom/spine gates.  `Continuation` passed 9703 jobs; the downstream
exact-pin theorem is 0/1376 open and passes target-specific `verify-publish`.
The ordered ladder and exact risk gates live in
`scratch/erase-classifier-design/DESIGN.md`; M1, M2, M6, M8, M9, and P4-U are
complete, and P4-S/P2/M10 are included in the committed closure checkpoint.
The complete ERASE lane, including the generated certificate fleets and
bounded rebuild driver, is pushed at `652fdfcb`.

The P2 proof build has two measured performance mitigations.  A balanced
support key reduces active searches per native leaf from a 0–65 range to
21–25, and the support-independent candidate domains are constructed once per
leaf rather than once per support, with a proved equality back to the original
classifier.  A representative 23-search leaf built in 715 seconds.
`compiler.small 100` took 714 seconds on the same leaf and was rejected as
noise.  Profiling attributes the remaining cost to `native_decide`'s IR
interpreter; a substantial later speedup would require a compact generated
killed-tree/nogood witness checked by verified Lean rather than DFS replay.
The representative leaf axiom audit has no `sorryAx`, and a source scan of its
evaluated classifier closure finds no project `unsafe`, `@[implemented_by]`,
or `@[extern]` declaration.  The aggregate dispatcher, both count-row
terminals, both payload terminals, and both downstream parents have the same
approved closure with no `sorryAx`.
The resumable `scripts/build-p2-certificates.sh` driver gives Lake at most
eight explicit leaf targets per locked `lake-build` invocation.  This target
batching is the hard concurrency bound; Lake's jobs setting is only advisory.
The first complete group measured 549–1064 seconds per chunk, 736 seconds on
average.  Runtime varies more than support count, so the completed queue grouped
equal chunk indices together.  Late fleet batches took 13m04s-18m22s under the
eight-worker cap; chunk 5 was the slowest observed pair at 18m22s/18m08s.

The optional P3 map is DONE and remains diagnostic. ERASE-P3-SWEEP stays held
under the resource gate; a discovered empirical cut would become proof work
only after a necessity theorem and exact on-spine consumer are specified.

---

## Cross-cutting C — multi-center census (off-spine research)

This work now feeds the bounded ATAIL-FORCE geometric decision surface in
`census/atail_force/`, but it still does **not** supply a Front-B producer or
close either Front-A `sorry`. It remains finite-alphabet infrastructure rather
than a direct closure theorem until the geometric extraction and full-filter
consumer bridges are proved.

Empirical status (`census/multi_center/STATE.md`): L2/full, GLOBAL tier,
PROVEN cuts, n=12..32 has 977,975/977,975 SAT, 0 UNSAT, 0 INDETERMINATE, with
3,375 cumulative class keys and zero fresh GLOBAL keys on n=25..32. Exact
LOCAL scans are flat against the same key set through n=64. Verdict:
**STABILIZED-EMPIRICAL**, not a general-n theorem. The CONJECTURED-tier run is
only an n=12..15 smoke (11,223/11,223 SAT); the targeted appendix is open.

Proved Lean boundary:

- the 21-cell independent LOCAL enumerator is complete for the scoped
  L2/full-participant class object;
- its accepted keys equal the 3,375-row typed bank;
- all six profile-preserving center permutations and all 489 generated
  profile rows are checked; and
- `ProfileClassIncidence.completesL2FullFrom_representativeSurface` is
  kernel-checked.

This proves completeness of a generated **representative surface**, not
geometric GLOBAL realization. The abstract LOCAL persistence layer is also
already proved: `ProfileRealizationSurface.localInventory_stepPersistent`
follows from `ProfileStepExtends`, and
`JointClass.locallyAdmissible_extendCap` supplies cap-capacity monotonicity.
Therefore "prove T2 persistence" is not one undifferentiated remaining task.

If this lane is resumed, matrix MC-* gives the only dependency order that can
make it closure-relevant:

1. define a concrete geometric `ProfileRealizationSurface` and prove the
   extraction theorem `extractedClass_locallyAdmissible` field by field;
2. prove `GlobalSound` for that surface and the exact profile-occurrence
   extension needed by `ProfileStepExtends`;
3. prove geometric LOCAL-to-GLOBAL completion (`CompletesGlobalFrom`) or an
   independently sufficient GLOBAL upper-bound theorem — this is T1, still
   open mathematics; and
4. state and prove a consumer on the parent surface, retaining the concrete
   common critical map and full geometry, whose conclusion supplies an
   already-consumed terminal packet or `False` directly.

The old joint-filter lower bound is a compatibility endpoint only: it
reconstructs a pair already refuted by `oppCap2_escape_gen`. Any resumed MC
work must feed the parent robust classifier, not that lower bound. The first exact Python adapter
now replays all 3,375 L2 rows and restores 167,782 membership-distinct global
orders in a common three-center polynomial frame. The exact combinatorial
reduction has 590 S3 class orbits / 30,997 representative-order cases and 343
raw / 70 S3 equality skeletons. Every raw equality skeleton has an
exact-replayed collapsed `Q(sqrt(3))` witness, so unsaturated equality-ideal
emptiness is a negative terminal. Exact constructive replay also gives all 343
skeletons separator-satisfying real algebraic witnesses. The bounded
full-inequality successor selected seven fixed support-size strata, but Z3
timed out on all seven in 219.901 seconds and classified no row. The checkpoint
deliberately reports `lean_leaf_to_inventory_extraction = false` and
`full_filter_shared_radius_pair = false`. MC-* therefore remains
OFF-SPINE RESEARCH until a concrete geometric extraction and selection-robust
bridge connect that target to the selected-four representative surface. It
must not introduce a `sorry`. Forward persistence alone yields only
qualitative eventual constancy; it does not prove `inventory(n) =
inventory(25)` or the parent two-large-cap contradiction.

---

## Ordering and sizing

There is one open-mathematics cluster:

1. **Front-A parent common-critical-map contradiction:** Candidate-D
   cross-center convexity coupling for
   `false_of_twoLargeCaps_commonCriticalMap` on the actual card-at-least-11
   surface. The old `DoubleApexOffSurplusSharedRadiusPair` declaration is only
   the current compatibility symbol. A `CARD-GE-12` proof leaves A11-CONSUME
   and wiring open.

The LIVE-Q/C declarations are downstream source inventory. The parent theorem
is called before their split, after which reference mining deletes the tree or
retains only sorry-free externally used wrappers.

Front-B ERASE is no longer an open-mathematics cluster.  Its card-{10,11}
P2/P4 source, native fleets, downstream target, axiom closures, and exact-pin
spine gate pass from pushed commit `652fdfcb`. This does not discharge the
repository-wide git/full-build/publication controls.

The former endpoint/pinned cluster is closed (K-B-END-GENERAL and K-B-PIN
DONE) and belongs to route history, not the open-mathematics count.

The paused Census554 pipeline contains substantial engineering and finite-proof
work, but it is not uniformly "bounded to 1–3 sessions": final cover format,
cover-core size, and heavy-certificate cost are not known until the run freezes.
Those uncertainties disappear from the theorem schedule only if the primary
ATAIL producer works uniformly from card 11; otherwise Census554 is the
declared card-11 alternate.

**Historical Census554 checkpoint (2026-07-13 02:53 PDT):** the mutable
card-11 cover loop was live on a verified 5,916-row bank. Iteration 690 contributed
`pat_05897`; the separately validated Oracle-13 residual contributed
`pat_05898`; and four exact-certified speculative motifs contributed
`pat_05899` through `pat_05902` after fresh novelty checks and guarded
publication. Four attempt-1,475 exact motifs then contributed `pat_05903`
through `pat_05906` under the same gates. The sole driver restarted after each
publication transition. Seven attempt-1,486 motifs then contributed
`pat_05907` through `pat_05913`; its hard rank 1 and the final attempt-1,683
candidate contributed `pat_05914` and `pat_05915`. The driver was replaying
the 5,916-row generation. Oracle-13 itself remains a validated
`combined-frontier` terminal result at iteration 316, not Census554 closure.
The bounded four-core producer exited at its one-hour limit with seven
preserved frontiers on the older 5,897-row generation. That batch is fully
resolved: all productive candidates are published, and attempts 1,510 and
1,511 were already covered by the new bank. A new four-core producer was then
running against a 5,914-row matching snapshot; any candidate would have
required a fresh current-bank novelty recheck and sole-writer publication. No
speculative lane had bank-write authority or could by itself advance a closure
row.

This paragraph is retained as dated provenance, not as a current process
claim. Census554 subsequently stopped at the authoritative 5,939-row bank
(SHA-256
`02fbefc4f290458895e9ad9afbb5f7f3401f428747010ed6a47aa8479ff477b2`)
before `CTRL-RESOURCE` transferred to the bounded ATAIL diagnostics. The last
producer reached `frontier-limit` with nine preserved candidates; all
substantive shared-queue jobs are quarantined and no Census worker is live.
The ATAIL Z3 and cvc5 diagnostics have reached their recorded terminal
checkpoints.
Consult the matrix `CTRL-RESOURCE` and A11 rows, then perform a fresh
process/lock/queue/hash check, before resuming Census554 or assigning another
heavy lane.

Execution order is dependency-based, not difficulty-based. The proof-critical
order is:

1. **Use the checked normal forms.** Retain `CriticalPairFrontier`, the
   prescribed-deletion equality-or-survival split, and the sound equilateral
   fixed-anchor deletion classifier, total `LowHit`/apex-pair hit table, and
   blocker survival/alignment classifier. The joint-fiber extractor and T1/T3
   relabels are compatibility/legacy wiring only.
2. **Prove the content-bearing parent classifier.** On the full current parent
   hypothesis surface with concrete `Hcritical`, rule out the joint transition
   states across the generated rows and turn every robust branch into an
   existing cap/critical-row/core terminal packet or `False` directly.
3. **Use computation only to discover the theorem.** The reduced three-center
   systems and any CEGAR survivors may identify recurrent equality/order
   skeletons. The completed 343-skeleton replay rules out the bare and
   separator-saturated equality-only route, so the next candidate must use
   real cap/disk/nonobtuse/global-order inequalities or the live critical
   rows. Both Z3 and cvc5 timed out on the same seven full-inequality systems,
   and the three checked scalar kernels jointly cut only 129 of 167,782
   selected-four systems, so neither another blind cross-engine/budget
   escalation nor continued unguided local-kernel enumeration is a next step.
   Computation resumes only behind a full-filter or critical-row forcing
   principle that explains why a checked pattern must occur.
   Every proposed universal lemma must also be checked against the W16/W20
   bank and the new blocker-graph witnesses, and must identify the actual
   convexity, cap/full-filter, or critical-row hypothesis that excludes them.
   No representative result is promoted without the leaf-to-inventory and
   certificate bridges.
4. **Consume the producer at the parent boundary.** Assemble
   `false_of_twoLargeCaps_commonCriticalMap` and call it immediately after the
   parent chooses `Hcritical`, before row construction and slot enumeration.
   Then reference-mine and
   delete the obsolete K-A residual chain and LIVE helper tree; preserve only
   sorry-free compatibility wrappers for declarations with real external
   callers. Do not close the remaining 31 Q/C holes one by one if the parent
   theorem makes them dead code.
5. **Use AHEAD only as fallback.** If the uniform producer naturally needs
   `15 ≤ D.A.card`, a checked AHEAD cover may discharge cards 12--14 and
   authorize AHEAD-CONSUME, while A11-CONSUME must separately discharge card
   11. If the producer works from card 11, retire both finite censuses from the
   closure path.

Adam's 2026-07-13 AHEAD-DEC authorization still permits bounded parallel head
research. Census554 no longer holds the resource pool, but heavy
AHEAD-N12/N13/N14 execution remains software-gated by AHEAD-WORKER and then
serialized through a fresh `CTRL-RESOURCE` lease. It is not deferred on
Census554. Neither finite lane may delay work on the uniform producer; a
thresholded producer must nevertheless carry its A11/AHEAD dependencies.

The paused Census554 lane retains this internal order. It may run alongside
proof work subject to `CTRL-RESOURCE`; it gates the card-11 split only when the
primary producer starts at `CARD-GE-12` or later:

1. **Stabilize operations and ownership.** Resolve the concurrent generated
   rewrite; refresh the mined graph and `anchor list`; move Census554 into
   `census/census_554/`; finish the remaining permanence work. Keep the active
   lifetime driver lease, transaction publisher, and durable terminal gate as
   mandatory invariants across every restart.
2. **Advance bank-independent Census interfaces.** Build
   `GeometryBridge.lean` and the abstract combinatorial/geometric cover
   interfaces. The support-injection bridge is already DONE. These consume no
   final bank.
3. **Mine the adjudicated oracle-13 residual.** Oracle-13 has reached a checked
   `combined-frontier`; preserve its terminal artifacts and the iteration-813
   rollback. No consumer is live. Any resumed consumer must be bound to a fresh,
   exact bank snapshot. Mine, exactly certify, and novelty-check any residual pattern before routing
   it through the sole mutable-bank publisher. Only a later checked UNSAT
   licenses the freeze/core/replay rows. A transition to a newer mutable bank
   requires a separate measured decision and the same preservation/integrity
   gates.
4. **Minimize before replay.** Extract the pattern IDs used by the checked
   cover, then generate and replay that core only. Apply certificate shrinking
   or checker optimization only to heavy certificates that survive the core.
5. **Conditional card-11 replay.** If the Census reaches a checked terminal
   cover, prove `false_of_cardEleven_twoLargeCaps`. Wire it into both Front-A
   declarations if the primary producer starts at `CARD-GE-12`; leave it as an
   independent theorem only if a uniform card-at-least-11 producer has already
   closed those declarations.
Proof work proceeds independently according to the primary order above. ERASE
is closed and needs no further proof work; ERASE-P3, AHEAD, Census554, and MC
experiments run only under their explicit decision and resource rows.
The 30,997 reduced or 167,782 raw ATAIL systems are not a license for an
ungated bulk nonlinear sweep.

The closure matrix is the dispatch surface. A low-level agent takes exactly
one row, verifies that its dependencies are DONE, claims the corresponding
spine branch when applicable, and returns the named deliverable plus its gate
output. It must not silently substitute an easier statement.

## 2026-07-14 Front-A producer decision

The authoritative Front-A route is now a parent-level common-critical-map
contradiction, not an unconditional cap-confinement theorem and not a census
of the two opposite-apex marginals.

The reasons are checked and separate:

- the outer wrapper already constructs all source rows from one concrete
  `CriticalShellSystem`; restoring provenance is not an open theorem;
- `URowCommonCapOffDangerousConfinement` fails in a finite shadow retaining
  every currently extracted incidence/count consequence, with the desired
  dangerous multiplicity equal to one; and
- the solver-free exact-pair classifier exhausts 369,743 target-negating
  card-11/card-12 exact-class pairs and, after the bank, endpoint-containment,
  and production adjacent-cap one-hit stages, leaves 930 survivors
  (96 / 150 / 684), including survivors in all three profiles.  Therefore a
  pair of apex marginals plus the current order bank is not a coverage proof.

The next content theorem is provisionally
`false_of_twoLargeCaps_commonCriticalMap`.  It must consume the actual
MEC-derived cap packet, `hNoM44`, full exact filters, the concrete critical
map, and the fixed/live row data, and return `False`.  It is called at
`u1_largeCap_routeB_tail_false` before the LIVE-Q/C slot split.

Work is decomposed as follows:

1. **FRONTIER-EXTRACT, DONE-PRODUCTION:** the sorry-free
   `CriticalPairFrontier` packet retains the survivor pair and simultaneous
   second-apex double-deletion survival; the extractor conclusion retains the
   chosen first-apex class's four-point lower bound alongside that packet.
   The legacy second-apex split is retained only for compatibility and is
   always in its survival arm.  The defining module builds and both extractors
   close with core axioms only.
2. **ROBUST-COUPLING, primary open theorem:** cumulative-erasure recurrence is
   now formally excluded, and an exact local model excludes any theorem which
   localizes the arbitrary blocker from only the three-center MEC/cap packet.
   Production Lean proves that, under first-apex deletion survival (or a
   five-point first-apex class), common blocker is equivalent to mutual cross
   membership.  The remaining branches are therefore common/mutual,
   distinct/one-way, and distinct/reciprocal-omission.  Card 11 lands in the
   robust arm, so the next producer must couple both actual blockers or another
   global row and return a cap-local hit, common-blocker residual hit, compact
   metric-core contradiction, or `False` directly.  The current
   bank now kills the historical `(5,5,5)` total-map shadow by the reverse
   equality-convex-five-point core, so its separate 11-equality certificate is
   superseded fixed evidence rather than the next promotion target.  An
   eight-way fresh `(4,5,6)` extended run returned five SAT shadows and three
   node-capped indeterminate shards.  Two SAT shadows replay to a production
   six-point order core; the remaining three full row systems are exact
   `CROSSCHECKED_UNIT` over `QQ`.  MARCO-style multi-order deletion banked 16
   exact UNIT subsets, including four five-row subsets, but all 16 have
   distinct free-incidence shapes.  Exact minimization of the four five-row
   subsets retains 9, 7, 9, and 11 equality generators, all cross-checked UNIT;
   exhaustive alias-permitting role assignment is diagonal-only.  They share
   an equilateral hinge normalization but require four distinct tail
   contradictions.  All four tails are now kernel-proved in scratch Lean with
   core axioms only and no trusted CAS step.  Their production `EdgeClosure`
   packaging now builds in `EquilateralHingeCollisions.lean`; all five saved
   SAT shadows from the first eight-way run classify by production consumers.
   A corrected all-eight-sink rerun at the same cap returns one new SAT shadow,
   seven node-capped indeterminate shards, zero exhausted shards, and 760,861
   nodes total.  Live extraction and finite exhaustion remain open.  A scratch
   Lean contract now packages both the ordered-only four-way disjunction and
   the all-current eight-way production-Core alternative.
   Its smallest FourPoint branch requires only two arbitrary `EdgeClosure`
   paths and cyclic order `q,u,y,v`.  The active frontier blocker cannot fill
   that role: a cross hit forces opposite-side placement, while cross survival
   forces unequal blocker distances.  Thus the first missing live packet is
   an off-frontier nonalternating shared-pair continuation, not another fixed
   certificate or direct-membership adapter.  A full-live scratch adapter now
   constructs the global faithful system, the off-frontier blocker `v != p`,
   and its exact row.  The first atomic gap is precisely a lower bound of two
   on that row's intersection with `{q,t1,t2,t3}`, followed by cap/order
   nonalternation.  A `Fin 12` shadow refutes deriving this from cardinality,
   all-center-row, common-provenance, and intersection data alone.
   Exact Euclidean global-K4/deletion/full-filter data still does not make the
   two-hit selector-independent: a pinned 33-point carrier has a legal common
   selector with maximum one dangerous hit off-frontier, while another legal
   selector on the same carrier has two.  That carrier is nonconvex.  The
   complementary exact-symbolic 35-point model supplies strict convexity,
   unique nonobtuse MEC, caps, no-`IsM44`, the robust packet, K4 at every
   relevant support center, and an exact deletion-critical blocker for every
   source, hence a total `CriticalShellSystem`.  It still has no two-hit or
   confinement witness; exactly 24 centers lack K4.  Together the two
   falsifiers isolate the needed interaction: a proof must use all-center K4
   continuation jointly with the local full geometry.  Total criticality by
   itself is no longer a candidate missing force.
   Endpoint-blocker geometry is likewise settled at this interface: card five
   excludes both blockers from both surplus endpoints, while in card four the
   first apex is a valid critical blocker for both sources and selector
   override can choose it twice.  That landing is the common-blocker/cross-hit
   arm, not a terminal.  The next statement must therefore be choice-invariant:
   produce a non-apex surplus critical shell containing both sources, or
   eliminate card four before choosing the critical system.
   A cycle-free scratch theorem now supplies the strongest positive
   apex-alignment split: two distinct off-surplus points in one non-surplus
   Moser-apex radius class either both survive deletion at the other apex, or
   an adapted critical system selects that other apex as an actual blocker for
   one source.  This is adaptive alignment only; it does not put the second
   point in the shell or identify the arbitrary live selector.
3. **UNIQUE-ROW-CLASSIFIER, parallel owner input:** the separate user-owned
   unique-row/`(6,5,4)` lane may produce exactly one checked consumer packet:
   choice-invariant
   `ExistsSurplusPairCriticalBlocker`; `CardFiveCapOrMutualFields`; or the
   coincident-blocker residual-member class containing the common pair.  The
   card-five/distinct-blocker adapter is now kernel-checked: it needs only
   `CardFiveDistinctCapLocalCrossHypothesis`, one directed cross hit whose
   actual blocker lies in the surplus cap.  This identifies the exact first
   missing source-indexed geometric field; it does not yet produce that field
   from the live hypotheses.  This is not a dependency of the current robust
   lane; consume it only if its owner publishes a validated result.
4. **PARENT-WIRE:** combine the checked direct-equality terminals with the
   single robust/full-geometry survival branch into the parent `False` theorem
   and call it before case enumeration.  Reference-mine and delete the
   obsolete K-A residual chain and LIVE helper tree when they have no external
   callers; do not preserve dead direct sorries.

The remaining robust theorem must jointly consume the parent full geometry and
all-center global-K4 continuation.  The 35-point exact model already includes
a total critical-shell system, so selector resynchronization is not a missing
force.  The complementary 33-point model supplies global K4 without convex
MEC/cap geometry.  Alternate branch theorems must likewise identify a
source-indexed metric incidence or other consumed output absent from those
models.  They must be tested against the exact-pair survivors, the
apex-flip cycle, the card-four blocker falsifier, and the coincident-blocker
falsifier.  The saved `(5,5,5)` total-critical-map shadow is now eliminated
directly by the current reverse equality-convex-five-point bank core; its
independent 11-equality characteristic-zero certificate remains exact but
superseded.  The fresh sharded `(4,5,6)` evidence instead banks 16 exact UNIT
row subsets across 16 incidence types, with no uniform extraction yet.  Adam explicitly authorized
parallel ATAIL research, analysis artifacts, theorem-bank search, and closure
document updates.  The detailed theorem signatures, branch consumers, counts, and
deletion order are in
`docs/atail-force-producer-plan-2026-07-13.md`, section
“2026-07-14 producer decision after exact-pair coverage.”

## 2026-07-14 K-A tractability refinement

This refinement supersedes the sequential instruction to finish the
unique-row classifier before isolating the robust terminal.  The live
`proof-blueprint` anchor remains
`DoubleApexOffSurplusSharedRadiusPair`, open through its single source
`sorry`; LIVE-Q/C remain separate on-spine obligations.

The tractability gain is an exact frontier reduction, not a new census.
Full MEC/cap geometry proves that two distinct positive K4 radii at one Moser
apex force the opposite cap to have cardinality at least six.  If both
non-surplus apices had two radii then `14 <= D.A.card`.  Through card 13 at
least one non-surplus apex therefore has a unique ambient K4 radius whose
full filter has cardinality four or five.  This statement is kernel-checked
in scratch with only `propext`, `Classical.choice`, and `Quot.sound`; exact
card-12 and card-13 local models show that it normalizes but does not close the
frontier.  From card 14 onward the `(5,6,6)` cap profile makes this shortcut
insufficient, so it is not a uniform closure theorem and does not justify a
higher threshold.

The production extractor now retains that its chosen first-apex radius carries
at least four points and adaptively chooses the off-surplus pair so simultaneous
deletion preserves K4 at the second apex.  Consequently the former
second-apex exact-eight arm is absent from every extracted packet.  For card at
most 13, the remaining routine normalization is to orient a small cap as
`oppIndex1`; the checked small-cap theorem then removes first-apex double
survival.  The result is one exact full-carrier packet: a unique first-apex
class of card four or five containing the off-surplus pair, with simultaneous
deletion preserving K4 at the other apex.  The orientation transport is still
pending.  This packet is compatible and is not itself closure.

The standalone prescribed-deletion lane is retired by exact logical polarity.
The scratch-kernel audit proves the branch-complete local forms

```text
dist d c = dist d f ∨
  HasNEquidistantPointsAt 4 (D.A.erase f) d
dist f a = dist f d ∨
  HasNEquidistantPointsAt 4 (D.A.erase d) f.
```

If the right endpoint is outside the already selected exact four-support, that
same row survives its deletion.  Therefore forcing the second disjunct to fail
would already contradict an explicit K4 witness; it is a terminal, not an
intermediate mechanism for obtaining h4/h5.  The equality arm enters the
existing metric-core consumer immediately.  Production also proves that this
cross-survival arm separates the actual blocker from the first apex without a
card-five assumption.  The actual-critical-map alignment adapters are kernel
checked, but no current theorem produces the required alignment.

The former 23-shadow prescribed-edge audit is now **historical only**.  It was
pinned to checkpoint SHA `5b661a15...`; all 23 stored survivors hit the current
complete bank, 18 also violate the subsequently proved selected-row own-cap
bound, and the synchronized refresh reuses none of them.  Its old h4/h5 split
must not be cited as current producer evidence.

The synchronized current-bank replacement is
`scratch/atail-force/biapex-continuation-current-bank-refresh/current_producer_bank_refresh_100k_checkpoint.json`,
SHA-256
`02a3a92b6241d42841bdbbacfe35005e55b0cd609ce981ab381945c98eba8a66`.
All 23 fixed `(5,5,5)` shards were independently rerun at 100,000 nodes with
the full live `producer_bank.scan_all_formalized_cores` gate, the earlier
metric prefix gate, the proved own-cap cuts, and the equilateral-hinge check.
No survivor was reused.  The synchronized split is 10 SAT finite shadows,
13 node-capped indeterminate shards, zero UNSAT, and zero errors, after
1,838,367 stored nodes and 27,535 complete leaves.  Every fresh survivor
replays clean against every gate; all ten injected cap-cut mutations are
rejected.  The older `ad2400...` 11/12 checkpoint is retained only as an
immutable older-bank comparison.

The ten current survivors contain twelve strict-pair grids.  Every grid is
exactly one forward membership short of the checked outside-pair terminal in
both the existential-best and universal-worst senses, and no direct terminal
fires.  The all-grid analysis is pinned by SHA-256
`c0ad7b01207516719f80f9f996c70d0a5b1b2d24e859cf22db04012f32e7d5ce` and
`analyze.py --check` passes.  No selective high-budget retry was launched:
thirteen slices remain capped and a larger budget on one slice cannot make
the aggregate decisive.

MARCO-style forward/reverse row deletion was then applied to the six legacy
bank-clean fronts (shards 0, 1, 2, 3, 16, and 20).  It found ten
three-engine UNIT frontiers; the six smallest have respectively 7, 7, 8, 9,
9, and 8 complete selected rows.  They are confirmed UNIT but are explicitly
`NOT_ESTABLISHED` as deletion-minimal, and the six shapes are pairwise
nonisomorphic.  The finalized invariant scan of all three required
theorem-bank registries finds no exact simple metric-bank match.  One recurring
U5 consumer is one distance-class join short on all six fronts.  This is not a
single producer: a fixed `ht1q`/apex-bisector equality covers shards
0, 1, 2, 16, and 20, while shard 3 splits the radius hypotheses `4+2` or
`1+5` and therefore needs a selection-dependent class join.  The older
source-order-star scan reports that distinction as fixed-slot coverage `5/6`.
`u1TwoLargeCapObstruction` is one equality short only on shards 0 and 16; in
both, the apex-normalized completion is `d(1,2)=d(1,10)`, although its theorem
hypothesis number changes under relabeling.  All 101 emitted representative
mappings independently replay.  Thus the invariant result is `6/6` for an
abstract one-class-join consumer normal form and `5/6` for an actionable fixed
equality producer, not a common six-front producer.  The scan proves neither
the missing equality nor a Lean theorem.

The UNIT results are exact CAS evidence only.  They exclude the normalized
complex equality systems at the stated fixed-shadow scope but are not a Lean
producer or uniform coverage theorem.
The finalized bank reconciliation, source pins, and all 101 mapping replays
are in `scratch/atail-force/six-frontier-bank-deficits/`; both
`bank_deficits.py --check` and its four focused tests pass.  The separate
joint-fiber boundary remains pinned in
`scratch/atail-force/second-apex-joint-fiber/`.
Scratch Lean independently packages the live joint-fiber boundary:
`secondApex_distance_injective_on_firstApex_offSurplus_fiber` and its strict
pair specialization prove that the two second-apex distances are unequal and
therefore satisfy `< ∨ >`.  `JointFiberNormalForm.lean` direct-checks with
only `propext`, `Classical.choice`, and `Quot.sound`.  This is a normal form,
not the missing equality or K-A closure.

The corrected result remains **EMPIRICALLY VERIFIED only within one
fixed-label card-12 `(5,5,5)` finite-incidence abstraction**.  It checks no
coordinates satisfying the surviving abstraction, card 11, or uniform
theorem.  It does not close K-A-PAIR.  It identifies the exact live content
gap as either a compact uniform metric contradiction, forcing the prescribed
retained-map alignment, or contradicting the deletion-survival complement
with full convex MEC/cap geometry.

The selector boundary itself is kernel-checked in
`scratch/atail-force/biapex-continuation-grid/BiapexContinuationGrid.lean`.
For a distinct carrier center, global K4 plus existence of one critical-shell
system proves that deletion failure there is equivalent to existence of a
possibly overridden critical-shell system selecting that center as the
source's blocker.  It does not align the concrete retained map.  The endpoint
`prescribed_deletion_blocked_iff_exists_css_alignment` has only `propext`,
`Classical.choice`, and `Quot.sound` in its axiom closure and no `sorryAx`
(source SHA-256
`034feb2c798e90f6b3b7780c6cf3e9ce85b5753997fff848ef7d503d40e5f553`).

The proof-critical work is therefore one content lane: **parent-level robust
full-geometry coupling under the no-direct-h4/h5-equality arm**.  It must use
both actual blockers and all-center global K4 at a continuation center, then
combine that row with the convex/MEC/cap/no-`IsM44` geometry to produce a
checked cap-local/common-blocker/core packet or `False`.  Card 11 reaches this
arm, so the direct equality terminal alone cannot close K-A.
Cumulative-erasure recurrence and bare apex flipping remain excluded.  The
three MEC-boundary source rows alone reduce only to reciprocal cross-deletion
survival or a directed three-cycle; the former is this open arm and the latter
lacks every current shared-support/order consumer antecedent.

One exact sufficient producer target is the one-row confinement

```lean
Kq := (Hcritical.selectedAt F.pair.q F.pair.q_mem_A)
        .toCriticalFourShell
T_r := (D.A.filter (fun x => dist x S.oppApex1 = r)) \ S.surplusCap

∃ K2 : SelectedFourClass D.A S.oppApex2,
  K2.support ⊆ Kq.support ∪ T_r
```

The scratch theorem
`false_of_secondApexClass_support_subset_blockerSupport_union_marginal`
kernel-checks this exact conditional adapter with only `propext`,
`Classical.choice`, and `Quot.sound`: distinct-center overlap at most two and
support cardinality four produce two points in `T_r`, after which the existing
`oppCap2_escape_gen` sink closes.  This validates the consumer only.  No
current bank or production theorem proves the inclusion, so its full-geometric
producer is **CONJECTURED / OPEN**.  A pinned exact 33-point nonconvex carrier
shows that global K4, deletion criticality, exact rows, and common-map
provenance alone do not force the analogous two-hit.

The complementary exact-symbolic checker
`scratch/atail-force/global-critical-continuation/verify_total_css_completion.py`
exits `0` on a 35-point strictly convex carrier with a unique nonobtuse MEC
boundary, cap cards `(8,11,19)`, no-`IsM44` for every MEC permutation, the
robust pair packet, K4 at every relevant blocker-support center, and an exact
deletion-critical blocker for every source.  It therefore supports a total
`CriticalShellSystem`, while the direct two-hit and confinement targets both
fail.  Exactly 24 centers lack K4.  This is exact SymPy evidence, not
Lean-kernel evidence and not a K-A counterexample.  It isolates all-center
global K4 continuation as the only omitted live layer; a positive proof must
use a K4 row at one of those deficient continuation centers or bypass
confinement with another already consumed output.

The direct robust sink has also been normalized to its exact metric content.
`robust-four-center/RobustParentBoundary.lean` kernel-proves that the two exact
blocker shells always provide distinct support centers `zq,zw`, both off the
first apex, and that global K4 automatically gives rows at both.  Closure then
needs only the two equalities saying `zq` and `zw` are equidistant from the
frontier pair; the first apex supplies the third bisector center and the
convex-independent bisector bound gives `False`.  Requiring both global rows
to contain the pair is a sufficient but stronger presentation.  Hence the
remaining producer is not row existence or support-center selection, but a
full-geometric coupling that forces those two bisector equalities.
`RobustCapFiveRoleExclusion.lean` separately kernel-refutes the attempted
cap-five opposite-apex role at both actual robust blockers, since each differs
from both non-surplus apices.  The later anchored audit shows that requesting
a new third double-blocked center on the directed cross arm is already the
contradiction; it is not a separate producer for this rigidity bank.

The bounded replay in `robust-all-center-cegar/` makes this boundary exact.
Its fourteen-label structural model has a represented four-row at every
center, the current pair/cyclic constraints, rows at all six eligible blocker-
shell support centers, and a total source-to-blocker selector while both
two-hit/confinement targets and every prescribed pair row fail.  The decoded
finite model is kernel-checked, but it is not literal global K4 or Euclidean.
On the pinned local coordinates all six support centers lie strictly on the
same side of the frontier-pair bisector.  The selected all-center completion is
exact-CAS UNIT already on rows `O,D,E,I,F`, and the nonseed CEGAR exhausted
only its 128-cut budget rather than proving UNSAT.  The initial interpretation
that the common Euclidean metric was the first failed layer is withdrawn by
the correction below.

The current-bank replay corrects that dependency claim.  The structural model
represented the known card-five `O` radius class only by a selected four-subset
which omitted `J`; the metric replay restored the full ambient class.  On the
restored `O,D,E,I,F` rows, the existing
`FourPointTwoCircleBisectorOrderCore` fires in both cyclic orientations with
centers `I,O` and common points `J,E` in the smallest forward presentation.
Thus the 16-equation UNIT computation is redundant as a consumer, and the old
SAT shadow does not prove that all structural coupling was exhausted.  It
omitted the ambient first-apex class's circle/order compatibility against each
global row.  Corrected CEGAR must add that class before any survivor or
metric-mining conclusion is used; the old seed itself is already excluded by
a production consumer.

The corrected replay and consumer audit are now complete.  The live roles are
`O = S.oppApex1`, `q = E`, `w = D`, with `J` a distinct first-apex marginal
point rather than `P.w`.  The kernel-checked generic endpoint
`false_of_surplusInterior_row_contains_marginalPair` needs only one
strict-surplus center `z` and one selected four-class at `z` containing two
distinct first-apex marginal points; production
`CapSelectedRowCounting.outsidePair_unique_capCenter` then gives `False`.
The existential producer chooses `z`.  A q-shell localization or a uniform
claim about every selected row is stronger than the actual sink and is not a
required interface.

The synchronized `robust-all-center-marco` checkpoint now records 101
corrected fourteen-role structural shadows, 524 sound row-minimal cuts, and
1,799 replayed single-row minimality deletions.  The first 100 shadows are
matched by existing formalized bank consumers; the terminal 101st shadow is
bank-clean.  All 101 avoid the recorded q-shell-localized producer.
`bank_cegar.py --check` reconstructs every cut, deletion, shadow, exactness
flag, and target audit.  The outer status is
`SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW`, not map UNSAT or a uniform proof.

The terminal bank-clean shadow exposes a new metric core instead of another
incidence cut.  The ambient `O` five-class plus all fourteen selected rows
produce 43 nonduplicate squared-distance equalities.  Independent role and
encoding reconstruction retains a 15-equality subsystem on
`O,A,E,F,G,K,X,Y,Z`, deletion-minimal under the audited two-order msolve
oracle.  Singular over `QQ` and msolve in both variable orders return the unit
ideal.  Groebner.jl's exact rational change matrix and an independent sparse
`Fraction` replay verify an explicit identity, so this fixed structural row
system has no simultaneous complex and therefore no real Euclidean
realization.

The Lean consumer is now kernel-complete in scratch. All geometry-to-coordinate
mappings, arbitrary-anchor similarity transport, reflection reductions,
nongeneric branches, all 504 generated modules, the terminal, and all seven
wrappers compile with only the three core axioms. Direct replay and earlier
microsharded shapes exceeded the 16 GiB cap; the successful fine DAG has a
6.41-GiB logical `.olean` graph and is therefore not a production import as
written. A separate matcher preflight scans all 101 saved shadows and finds
this pattern at seven indices, including terminal index 100; the other six
already have older bank matches. Corrected CEGAR may use it as a sound scratch
cut, while production registration still needs a live role map and a smaller
checked payload or explicit import-cost acceptance.

The exact one-row audit and a kernel-checked card-12 incidence audit sharpen
the next theorem.  Exact 29-point and 35-point Euclidean regressions have local
K4 at the eligible strict-surplus centers and no radius class there containing
`q` plus another marginal point; the 35-point regression additionally has a
total critical-shell map but omits all-center K4 elsewhere.  The card-four and
card-five incidence shadows retain one abstract four-row per center, the exact
cap-hit profile, and disjoint outside-pair ledgers, yet every strict row has
one marginal hit and the aggregate count stops at equality
`|I| = sum_z |K_z intersect T| = 4`.  The checked sufficient interface is the
strict inequality `|I| < sum_z |K_z intersect T|`.  Therefore another raw
ordered-cap pair count cannot close the lane.  The exact second-cap replay also
realizes both old and fresh frontier directions: `t1,I,F` have K4 and avoid
both endpoint marginal pairs, while `t1_css_1..3` are the strict centers where
K4 is absent.  Its complementary kernel-checked all-center incidence shadow
keeps both frontiers but remains at one hit per marginal per strict row.
Finally, all 101 corrected structural shadows satisfy the selected-row closure
consequence used to test restoration of the caller's `D.Minimal` hypothesis.
Thus symmetry, raw counting, and merely widening K-A's signature do not repair
the producer. The UNIT metric core is now formalized and is being used only as
a scratch cut in the corrected map; only a later metric-consistent survivor
would move the burden to MEC/cap/no-`IsM44`, critical provenance, or a
second-cap geometric cut. Even finite exhaustion would still need a faithful
arbitrary-carrier extraction theorem before it could close K-A.

That first continuation step is now kernel-checked in scratch.  Every selected
four-class at the second opposite apex has at least two support points in
`S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)`: the two adjacent one-hit bounds can
account for at most two of its four support points.  Global K4 supplies a
selected four-class centered at each of the remaining points.  In the exact
35-point regression these are represented by `G` and `K`, both centers where
K4 fails, so the theorem consumes the isolated missing layer rather than
repackaging existing local rows.  The next open statement is a classifier for
those two continuation rows into an existing outside-pair, rank/lap,
metric-core, confinement, or direct-`False` consumer.  The generic packet API
stays scratch-only until that consumer fixes its final shape.

The synchronized six-front structural audit prevents one tempting but false
shortcut.  All six smallest exact UNIT fronts share an injective
`MECStraddlingRowCore.Core` equality skeleton, and the live packet supplies its
center, first MEC-boundary equality, and disk inequalities.  The remaining
nonobtuse field is also derivable in checked scratch.  Nevertheless the mapped
second boundary point is strictly cap-interior, and every common map has
orientation signature `(+,+,+,-)` or its reversal.  Hence neither MEC
geometry consumer applies; there is also no common perpendicular-bisector,
exact-off-circle, equality-only, or cyclic-order alternative.  The pinned
negative audit is `scratch/atail-force/six-frontier-structural-core/` and is
not a producer.

The next-generation row search does have one exact checked terminal.  The
sibling U5 bank's three-exact-class tetrahedron obstruction weakens to three
ordinary `SelectedFourClass` rows; the scratch adapter
`scratch/atail-force/tetrahedron-bank-adapter/TetrahedronBankAdapter.lean`
closes whenever a third row centered at a remaining continuation support point
contains all three vertices `z1,z2,oppApex2`.  Its axiom closure is exactly
`propext`, `Classical.choice`, and `Quot.sound`.  The remaining theorem is a
branch-complete **normal form**, not elimination of every two-hit profile.  The
`{z1,z2}` branch closes only when the needed outside-cap/order field is live.
The `{z1,oppApex2}` and `{z2,oppApex2}` branches have exact strictly-convex
equilateral local realizations and must remain explicit two-circle packets with
their missing signed-area/cyclic-order hypothesis; zero/one-hit cases remain
incidence-deficit/deletion-survival packets.  This is bounded parallel theorem
research authorized by Adam; the separately user-controlled 16-core search is
not duplicated or adjudicated in this lane.

The sound complement normal form is now kernel-checked in
`scratch/atail-force/equilateral-second-generation/`.  Global K4 at a new
continuation center survives deletion of one of the three fixed anchors, and
the resulting `ThreeAnchorDeletedK4Row` is packaged as an exact bank-ready
deleted row; the paired producer supplies one at each continuation witness.
`scratch/atail-force/third-row-profile-bank/ThirdRowProfileBank.lean` now
kernel-checks the total normal form `low_hit_or_live_apex_pair_profile`:
low-hit on `{z1,z2,oppApex2}`, exact `{z1,oppApex2}`, or exact
`{z2,oppApex2}`.  The theorem is packet-generic in the explicit parent-local
surplus packet; `LeafPacketRebase.lean` separately checks the corresponding
`CounterexampleData` transport without assuming `D.packet` is that packet.
The two apex-pair states remain realizable.

The retained common map refines those states through
`scratch/atail-force/robust-classifier-target/RobustClassifierTarget.lean`:
each endpoint blocker either preserves K4 after deleting the partner or equals
one of the two known bisector centers; a third center closes by the
perpendicular-bisector bound.  Both files check with exactly the three core
axioms.  The next bounded object is therefore a joint transition core over
`LowHit` versus `ApexPair + blocker survival/alignment` across the generated
rows under one parent `Hcritical`. It must enter an existing terminal or
`False`; it is not a renewed goal to kill either realizable profile.

That joint finite state is now itself kernel-checked in
`scratch/atail-force/joint-transition-core/JointTransitionCore.lean`.
From a continuation-geometry `EquilateralResidual` it constructs both
divergent outside witnesses, their global selected rows, the two q-deleted
four-row certificates, and the complete `LowHit` or apex-pair plus blocker
survival/alignment transition at each row.  The exact missing datum is the
`JointTransitionCoreEliminator` proposition; no theorem or axiom asserts it,
and no indexed current/sibling/legacy bank consumer closes `LowHit` or this
paired packet.  All proved adapters report only the three accepted core
axioms.

The first joint-profile pruning is now a uniform Lean theorem in
`scratch/atail-force/joint-profile-elimination/`.  Both same-profile
assignments close by the three-center perpendicular-bisector bound, and the
crossed `v = {y,a}, u = {x,a}` assignment is collinear against convex
independence.  A live packet therefore reduces to `LowHit` on either generated
row or the reverse mixed profile `v = {x,a}, u = {y,a}`.  The exact
`Q(sqrt(3))` audit remains discovery evidence only for the local realizability
of that last mixed profile; the three eliminated cases are kernel-checked.

`scratch/atail-force/low-hit-residual/` kernel-checks the corresponding
LowHit boundary.  Every LowHit row contains at least three fresh sources.  A
fresh pair with reciprocal actual-critical-shell hits forces a collision among
the row center and the two blocker centers, upgrading each collision arm to
an exact support equality; three separated centers close immediately.  An
exact finite incidence model rules out deriving the reciprocal hits from
cardinality and overlap data alone.  The remaining theorem must therefore use
parent geometry to select such a pair or consume the resulting alignment,
rather than treating LowHit as a purely combinatorial contradiction.

`scratch/atail-force/mixed-parent-coupling/` gives the exact reverse-mixed
producer boundary.  Prescribed deletion failure is equivalent to membership
of the deleted partner in the retained apex shell; after that hit, separation
from the two known bisector centers produces the terminal third center.  The
`oppCap2` side bit supplies the opposite-side inequality automatically, so
only one same-side blocker inequality remains.  The checked
`ApexPartnerFailureCapResidual` consumer closes from precisely the apex-shell
hit plus this cap-quotiented inequality.  A pinned exact regression realizes
all four aligned blocker cases, showing that cap side alone does not prove the
same-side exclusion.  This is a kernel-checked reduction, not construction of
the parent producer.

`scratch/atail-force/frontier-continuation-dispatcher/` now kernel-checks the
branch-complete parent transport.  It uses the frontier's actual twice-erased
second-apex witness to obtain an exact selected row avoiding both frontier
sources, builds `TwoContinuationRows` over the rebased parent packet, and
returns `FrontierContinuationEliminators` with exactly three proof fields.
Continuation-center cross-deletion survival is packaged as one exact
q-deleted row; the non-equilateral `MetricResidual` supplies a
`CommonDeletionTwoCenterPacket` for deletion of `S.oppApex2`; and the
equilateral arm enters `JointTransitionCoreEliminator`.  The adapter from this
content contract to `CommonCriticalMapClosingProducer` is also kernel-clean.

Transport is therefore complete, and each routed field now has a smaller
branch-local normal form.  None is closed by the full parent geometry yet, so
proving only the equilateral joint eliminator still does not finish
`false_of_twoLargeCaps_commonCriticalMap`.

`scratch/atail-force/unified-parent-coupling/UnifiedParentCoupling.lean`
kernel-checks a sufficient parent-facing architecture.  Its adapters build all
three dispatcher fields and preserve the complete parent quantifier order down
to `CommonCriticalMapClosingProducer`.  The later shape audit proves that this
surface is operationally broad: it fixes an arbitrary retained system and asks
for eliminators uniformly over all continuation choices.  It remains a
regression interface, not the useful theorem-discovery construction order.

The retained-map order is separately normalized in
`scratch/atail-force/critical-system-rebase/`.  Kernel-checked transport keeps
the same frontier pair and both apex deletion facts while rebasing the
frontier to any other `CriticalShellSystem`; a second adapter performs a
certified pointwise shell override after the pair has been selected.  Hence a
future producer may use the more natural order “select frontier,
then select/override a favorable critical shell.”  This is transport only:
the theorem does not prove that a branch-closing shell exists.  It does rule
out treating failure for one arbitrary retained-map choice as a geometric
obstruction to every choice.

`FavorableSystemParentSurface.lean` further kernel-checks that the parent need
not eliminate every possible `K`/`P` continuation choice.  Its preferred
contract selects one favorable critical system, rebases the fixed frontier,
selects one concrete `FrontierContinuationDispatch`, and closes the three
propositions attached to that dispatch.  The adapter reaches
`CommonCriticalMapClosingProducer` while preserving every outer hypothesis.
Thus `UnifiedFrontierParentCoupling` is retained as a sufficient interface but
is no longer the primary construction target: it asks a proof to fill
universal map and row callbacks instead of following one explicit dependent
choice.

`FavorableRoutedBranchSurface.lean` performs the last quantifier cleanup.
`FavorableSystemContinuationContent` chooses one dispatch but still supplies
callbacks for all three mutually exclusive outputs.  The new
`FavorableRoutedBranchContent` asks only for the consumer selected by the
branch carried by that dispatch.  Its kernel-checked adapter reaches
`CommonCriticalMapClosingProducer`, and the three-callback surface implies it.
The chosen-tuple audit now proves the converse at the proposition level for a
fixed dispatch: `routedBranchEliminator_iff_allAlternativesImpossible`, and
both sides are equivalent to `False` from the carried routed proof.  The
branch-only form is a compact operational normal form, not a weakening.

`LateCriticalSystemSurface.lean` exposes an equivalent but operationally more
useful order.  Its H-independent `GeometricFrontierContinuation` fixes the
trimmed second-apex row, continuation centers, and global rows first; the
critical system is chosen or overridden only after those labels are known.
Adapters in both directions prove this is equivalent to the choice-first
favorable-system witness, and its full-parent adapter reaches
`CommonCriticalMapClosingProducer`.  Thus sourcewise critical-shell choices may
depend on the concrete branch labels without changing the theorem strength.

`ExistentialParentSurface.lean` performs the outer quantifier audit that the
earlier surfaces left unchanged.  The parent constructs one
second-large-cap witness and one K4 radius/frontier, then consumes only that
tuple.  Its smallest choice-explicit full-parent interface is therefore
`ChosenLateCriticalSystemParentContent`: one large-cap index, one radius and
frontier, one H-independent continuation, one late favorable system, and the
eliminator for its one routed branch.  The direct theorem
`false_of_twoLargeCaps_of_chosenLateContent` closes from this existential
packet without first proving the universally quantified
`CommonCriticalMapClosingProducer`.  The universal late-content surface
implies the chosen one, but this does not establish strict logical weakness:
each closing content implies `False`, and `False` reconstructs either content
by elimination.  `routedBranchEliminator_iff_false` makes the fixed-branch
collapse explicit.  Selection organizes the proof search but supplies no
mathematical ingredient.  The same selector file proves
`chosenParentContent_iff_false` and
`chosenParentContent_iff_universalLateContent`, factors the second-large-cap
witness independently from the continuation content, and identifies a
geometric continuation with explicit `K/P` row choices.  A kernel-checked
finite incidence shadow has two choices at all six layers while every tuple
remains open; it is not Euclidean or a `CounterexampleData`, but it is an exact
regression against inferring a favorable tuple from choice multiplicity.

`blocker-distinct-radius/PacketReorientationAudit.lean` separately closes the
remaining cap-index normalization question.  It completes the public
`NonSurplusSwap` interface with the omitted opposite-apex and surplus-apex
equalities, then kernel-proves that any non-surplus second-large-cap witness
can occupy the physical `oppCap2`/`oppApex2` role while preserving the carrier
and physical surplus cap/apex.  This is a physical normalization, not an
identity of the original `Fin 3` index.  It neither refines the cap bound to
exactly five nor transports the old frontier pair.  The follow-up
`CriticalPairFrontierSwapAudit.lean` proves same-pair transport impossible,
because the old pair has unequal distances from the apex which becomes the
swapped first apex.  It also proves that fresh frontier existence is already
available from the arbitrary-packet `exists_criticalPairFrontier_of_K4`, with
the physical second apex projected to `S.oppositeVertexByIndex j`.  The open
theorem is therefore a coupling between the old and fresh frontiers, or from
the chosen cap/cardinality witness to the fresh frontier—not another
left/right split or apex-symmetric existence theorem.

The chosen branches now have exact checked normal forms:

- `global-source-selection/GlobalSourceSelection.lean` proves that cross
  survival reaches one of three `CommonDeletionTwoCenterPacket` variants,
  `ApexDoubleCriticalResidual`, or `DeletedBlockerApexAlignment`.  The broad
  surplus-cap residual is eliminated: the surviving critical source/blocker
  is exactly the named second apex with prescribed deletion failures and an
  exact shell-support identification.
  `common-deletion-consumer/CommonDeletionCriticalExpansion.lean` proves that
  a common-deletion packet has at least three sources outside the deleted
  source's exact critical shell and therefore yields either a successor packet
  at the same two centers or two distinct sources prescribed-critical at one
  center, with both shells equal to that center's original q-deleted row.
  `CommonDeletionSuccessorCycle.lean` iterates this exactly to an aligned pair
  at some survivor or a genuine period-at-least-two orbit, retaining the
  original non-equilateral/cross center roles.  A pinned exact finite
  equality/global-K4/total-critical-shell model realizes a three-cycle, so no
  geometry-free termination theorem is available at this interface.
  `apex-alignment-consumer/ApexAlignmentConsumer.lean` identifies both apex-
  alignment outputs with one `DeletedApexCriticalCertificate`, installs it
  after labels are known, and proves its support equals the parent apex row.
  The induced h5 equality is redundant with the parent row; either alignment
  closes exactly from a `DeletedApexOmissionPacket`.
  `DeletedApexOmissionProducer.lean` proves the sharp equivalence: under that
  certificate, the omission packet exists iff the second apex has another
  positive radius with a class of cardinality at least four.  The parent
  radius class is exactly the retained four-point support, so same-radius
  reselection cannot help.  The currently retained rows have either the right
  center and wrong support polarity or the right omission and provably wrong
  center; a new distinct-radius or source-role theorem is required.
- `non-equilateral-parent-producer/NonEquilateralParentProducer.lean` proves
  that either native row is surplus-heavy, or the rows contain two distinct
  mutually exclusive strict-`oppCap1` witnesses.  The exact coordinate
  regression has zero row overlap and a structural `(5,5,4)` cap profile, but
  its row centers are `oppCap2` endpoints rather than strict-`oppCap2`
  continuation centers.  It is not a Euclidean realization of the native
  packet and does not refute a native common-hit theorem.
  `non-equilateral-full-parent-reduction/NonEquilateralFullParentReduction.lean`
  then puts those same native supports into the late-system common-deletion
  expansion.  Their overlap is at most one, so at least four native-row
  sources lie outside the deleted critical shell.  The exact terminal split
  is a `(2,2)` outside/inside-`oppCap2` profile for both rows, or a fresh
  prescribed transition outside `oppCap2` and the late shell, localized to
  `surplusCap` or strict `oppCap1`.
  `non-equilateral-geometry-consumer/NonEquilateralGeometryConsumer.lean`
  then carries the actual no-`IsM44`/MEC data to this branch.  It proves the
  opposite-large-cap location disjunction and turns the exclusive strict
  witnesses into two metric hinges: each has the native radius at its own
  center and provably not at the other center.  The exact sibling-bank target
  is `StrictWitnessBankCompletion`, consisting of one common native point and
  three reverse-row equalities; its checked adapter constructs all hypotheses
  of `u1TwoLargeCapObstruction`.  The later
  `equal-source-non-equilateral/` audit shows that no sibling import is
  required: the same packet closes through the current production theorem
  `Problem97.u5_equilateral_opposite_point_metric_incompatibility`.
  With the live common point fixed to `p`, exactly three reverse equalities
  remain, and an exhaustive 24-map role audit finds no better fixed-`f = p`
  assignment.  A kernel-checked twelve-label incidence model shows that
  all-center row existence and a total prescribed critical map alone do not
  force those reverse incidences.  The surplus-heavy arm remains a distinct
  second-cap placement problem.
  The required-bank and indexed-corpus follow-up finds no producer for this
  structure.  The first missing step is common-support nonemptiness
  `∃ f, f ∈ P.row₁.support ∧ f ∈ P.row₂.support`; the current native theorem is
  only an intersection upper bound.  Even granting `f`, all three reverse-
  radius equalities remain open.  The nearest sibling C5D3B common-point
  theorems require unavailable packet/full-profile hypotheses and do not
  supply those equalities.
  `common-support-geometry/CommonSupportGeometry.lean` proves the exact first-
  field geometry: a common selected point is an ambient equilateral apex over
  `z₁z₂`; the converse needs both arbitrary four-subsets to be radius-
  saturated.  An exact 16-point strict-convex/MEC/cap regression realizes the
  strict metric hinge, zero overlap, and an omitted ambient radius point, while
  explicitly failing the live MEC-to-cap/apex binding, all-center K4, and
  total criticality.  It does not refute a full-parent theorem, but shows that
  common-support-first needs new global geometry both to create and lock the
  equilateral apex before the three reverse equalities are addressed.
  In the surplus-heavy arm, the nearest sink is
  `outsidePair_unique_capCenter`.  Reaching it requires two strict surplus-
  interior hits on the heavy row and a second distinct `oppCap2` center
  equidistant from the same pair.  The current two hits may include a Moser
  endpoint, and the native row supplies only one center; neither global K4 nor
  total criticality prescribes the second incidence.
- `mixed-parent-producer/MixedParentProducer.lean` replaces the arbitrary-map
  shell-hit target by a choice-free apex critical shell.  A separated one-hit
  shell closes directly.  Global K4 plus no-removability produces a certified
  shell in exactly one of three remaining forms: both continuation centers
  omitted, a `y`-only hit aligned at `x/u`, or an `x`-only hit aligned at
  `y/v`.  `reverse-mixed-residual-reduction/ReverseMixedResidualReduction.lean`
  identifies the both-omitted form as an exact shell surviving both single
  deletions and the double deletion with a unique positive four-point radius;
  its four aligned subarms are exact support equalities with `P.rowX`, `Ku`,
  `P.rowY`, or `Kv`.  Its late-choice and full-parent wrappers install the
  certified shell only after the labels are known and retain the genuine
  second-large-cap witness from no-`IsM44`.  The aligned-edge polarity audit
  proves each h4/h5 radius equality is already encoded by its named row; the
  genuine closing packet is an alternate same-center row omitting the common
  apex.
  `reverse-mixed-radius-consumer/CriticalShellRadiusConsumer.lean` proves the
  uniform exact boundary at all four aligned blocker centers: an omitting row
  exists iff a distinct positive four-capable radius exists, iff source
  deletion preserves K4, iff some selected support differs from the shell.
  The stored deletion failure rules out all four presentations and makes every
  arbitrary global-K4 row at that blocker collapse to the retained
  `P.rowX`/`Ku`/`P.rowY`/`Kv` support.  This reuses the apex-omission rigidity
  mechanism.  The attempted `CapFiveOppositeApexBlockerRole` is now
  kernel-refuted on all four aligned reverse-mixed arms:
  `CapFiveRoleClassification.lean` proves every candidate `x,u,y,v` differs
  from the opposite Moser vertex of every non-surplus cap.  Exact card five
  therefore cannot repair this bridge.  The valid target remains a
  non-apex-specific deletion-survival/omission/distinct-radius producer.  The
  cross-apex route is separate and still has only a second-cap lower-bound fact
  in parallel, so no contradiction follows there either.

Root independently recompiles these files, the chosen-tuple selector and
finite countermodel, `CriticalSystemRebase.lean`, and the reverse-mixed radius
consumer with only `propext`, `Classical.choice`, and `Quot.sound`; both exact
Euclidean regressions pass.  These are proof-shape and residual reductions,
not closure of a production sorry.  If an explicit construction routes cross,
its producer must
use cap/MEC provenance to eliminate the common-deletion periodic-cycle or
aligned-critical-pair endpoint, and
must produce a second-apex omission row for the exact apex-alignment packet,
equivalently a distinct positive four-capable radius at that apex (or an
explicit retained-row role alignment).
The non-equilateral exclusive-strict arm now has the exact
`StrictWitnessBankCompletion` target: one common native point and three reverse
equalities, with the native metric hinge and bank adapter already proved.  Its
surplus-heavy arm still needs second-cap placement coupling; LowHit remains
unchanged.  Reverse mixed is reduced to the robust double-deletion/unique-
radius packet or four named-row support equalities.  The latter all need the
same apex-omitting row/distinct-radius/deletion-survival producer, not another
prescribed-deletion radius calculation.

CEGAR/MUS work is permitted only on the bounded local packet: the two sources,
two Moser apices, two blockers, their exact four-supports, and the required
MEC/cap order or power signs.  Each learned exact core must be formalized and
wired to an immediate consumer before another round.  Do not launch another
ambient card-placement census, and do not promote a finite certificate into a
uniform producer claim.

After a genuine geometric contradiction is proved (equivalently, after a
chosen-tuple content proposition is inhabited), prove
`false_of_twoLargeCaps_commonCriticalMap`, call it in
`u1_largeCap_routeB_tail_false` before the f2/LIVE slot split, consume each
direct h4/h5 equality at its existing sink, and send only the deletion-survival
complement through the robust theorem.  Then reference-mine and delete the
obsolete pair/removability/helper tree when it has no external callers.  The
separate Adam-controlled unique-row/`(6,5,4)` certificate session remains
parallel owner work: this lane does not run, edit, or adjudicate it, and
consumes only a result its owner has validated and published.

The initial parent theorem must retain the full present two-large-cap/MEC/cap/
no-`IsM44` hypothesis surface and take the concrete common
`Hcritical : CriticalShellSystem D.A`.  The old double-apex existential is a
compatibility endpoint only: `oppCap2_escape_gen` already refutes its result,
and its substantive caller immediately eliminates that `False`.  Do not mine
the pair or generalize prematurely to a geometry-free `D,S,Hcritical → False`.

`scratch/atail-force/parent-false-surface/ParentFalseSurface.lean` now
kernel-checks the exact routine parent adapter. After the parent chooses the
concrete map, it derives the second large cap and `CriticalPairFrontier` and
invokes an explicit `CommonCriticalMapClosingProducer` directly at `False`,
before any LIVE row construction or slot split. Its axiom closure is exactly
`propext`, `Classical.choice`, and `Quot.sound`; the producer argument remains
a sufficient mathematical obligation.  The later checked direct adapter
`false_of_twoLargeCaps_of_chosenLateContent` is weaker: its one
`ChosenLateCriticalSystemParentContent` witness may choose the second cap,
radius, frontier, continuation, and late system jointly, so that existential
packet is the current genuine obligation.

## 2026-07-15 producer/coverage consolidation

The consumer bank is no longer the architectural bottleneck.
`Census554.GeneralCarrierBridge.ShellMetricCoreAlternative` is already the
single arbitrary-cardinality sink for the formalized metric cores, and
`false_of_shellMetricCoreAlternative` eliminates any supplied arm. Replacing
its nested disjunction by a tagged inductive may improve maintenance, but it
does not construct a missing hypothesis and is not a closure milestone.

The corrected CEGAR stream currently has 101 target-avoiding shadows: 100 hit
the formalized bank and the terminal shadow is bank-clean. Its 43 equalities
reduce to a 15-equality, nine-role subsystem. Singular over `QQ`, msolve in
both variable orders, Groebner.jl, and an independent exact rational replay
agree on the UNIT identity. The deterministic fine replay is now complete:
all 504 generated modules pass, `LambdaKxFine.Terminal` and all seven
geometry-facing wrappers fresh-compile, and every printed endpoint has exactly
`propext`, `Classical.choice`, and `Quot.sound`. The resulting scratch consumer
is therefore **PROVEN in Lean**, not merely exact external evidence. Its
current generated import graph is not production-ready: 95,044 source lines
and 6,885,254,248 logical `.olean` bytes (about 6.41 GiB), with a recorded peak
process-tree RSS of about 9.03 GiB. It closes zero production sorries by
itself; it is a sound classifier cut whose live role map is still unproduced,
and production use requires a materially smaller checked payload or another
accepted import-cost reduction.

The only currently plausible refactor is therefore on the producer/coverage
boundary, but its mathematical feasibility is **CONJECTURED / NOT YET
ESTABLISHED**. The checked adapters show where such a theorem would be
consumed; they do not show that the live hypotheses produce its finite shadow
or that the present bank covers every extracted shadow. Existing exact
countermodels already rule out several incidence-only and arbitrary-choice
versions, so the full MEC/cap/no-`IsM44` geometry must be visibly load-bearing.

The field-by-field go/no-go audit is now complete at
`scratch/atail-force/chosen-shadow-extraction-audit/REPORT.md`. It rejects the
fixed card-11/card-12 `producer_surface`/`producer_geometry` boundary as a
uniform live shadow. The live telescope has only `9 < D.A.card`, whereas that
surface assumes one of three exact card-11/card-12 profiles; it also separately
assumes full apex-filter sizes and omits source-indexed critical/deletion/live-
row coupling. These are multiple independent gaps, not one coherent geometric
producer. Existing fixed-surface certificates remain valid theorem-discovery
consumers, but further CEGAR on that surface is not primary closure work.

The narrower card-independent candidate has now been tested in its two direct
forms and neither form is a producer. The pinned audit reconstructs all 101
corrected survivors, confirms the seven existing pattern hits, and exhausts
both the equality-closure and direct-Z3 matchers on three increasingly strong
abstractions of the actually carried `K` row plus the two continuation rows.
All six matcher calls return `NO_MATCH`. The terminal identity assignment also
fails source-by-source at its first row group: `O_A_E` needs the second apex in
the first-apex radius class, while `exists_criticalPairFrontier_of_K4` supplies
only `q,w` in that class. These are exact results within the pinned row
abstractions and a source audit of the identity map, not a counterexample to a
richer ambient-geometric theorem.

Consequently the remaining candidate is explicitly stronger and still open:

1. retain the full live two-large-cap/MEC/cap/no-`IsM44` surface and one
   concrete or dependently chosen `CriticalShellSystem`/frontier tuple before
   the LIVE slot split;
2. split the retained frontier by `CriticalPairFrontier.firstApexSplit` into
   `R`, `FA-UNIQ4`, and `FA-UNIQ5` before the independent `C/N/E`
   continuation dispatch; the latter names replace the ambiguous historical
   `U4/U5` shorthand and are not numbered U-lane stages; in current ATAIL
   prose they must not be abbreviated, because bare `U4` and `U5` remain
   reserved for the original numbered U-lane stages and their historical
   theorem banks;
   dispatching first loses the deletion polarity used by the sharper unique-row
   consumers;
3. keep `FA-UNIQ4` / `FA-UNIQ5` with the separately owned unique-row lane and make this lane's
   nonduplicating target the `R` branch: repeated double-deletion descent to a
   subcarrier terminal whose contradiction is stable when erased points are
   re-added;
4. only if it is load-bearing, construct additional global-K4 rows and prove
   the cross-row incidences needed by a non-identity nine-role/15-equality
   assignment; the fixed-shadow origin is compatible with
   `R ∪ FA-UNIQ5`, so the
   certificate does not select a branch;
5. consume an exact terminal packet through its checked core and, only if
   useful,
   register it as one `ShellMetricCoreAlternative` arm;
6. consume the witness at `False`, package the result through
   `false_of_twoLargeCaps_commonCriticalMap` or the weaker chosen-late-content
   adapter, and call it in `u1_largeCap_routeB_tail_false` before f2/LIVE slot
   enumeration; and
7. reference-mine the old double-apex/removability/LIVE helper tree, deleting
   dead declarations and retaining only source-clean externally used wrappers.

The first `R` construction step is now kernel-checked in two complementary
forms. `DoubleSurvivalBranchProducer.lean` retains one fixed second-apex row as
an identical `Finset` through the descent, a cumulative off-surplus co-radial
erasure history, and a unique card-four/card-five first-apex terminal. The
fixed row is exact relative to the twice-erased carrier `B0`, not to ambient
`D.A`; the live frontier supplies no proof that the original pair avoids its
radius. `SubcarrierTerminalInvariant.lean` strengthens the history itself:
every erased point has an ambient robust mate whose simultaneous deletion
preserves K4 at both opposite apices, and a named history pair has a strict
`oppCap1` endpoint. `RTransitionLiveSurface.lean` now sharpens the proposed
critical-map transition. A source blocker in `S.surplusCap` is automatically
strict-surplus, and adding mate membership produces a selector-free selected
four-row containing the retained erased pair; ordered-cap outside-pair
uniqueness refutes that packet immediately. Thus the two CSS-directed fields
are already a terminal contradiction, not the weakest producer interface.
For every orientation the exact checked split is instead
`cross hit + blocker outside surplus` or
`cross omission + deletion survival at the blocker`.
These terminal conditions do not select a source-derived producer.
`RobustLiveBankAdapter.false_of_surplusInterior_bisects_marginalPair` already
proves that every strict-surplus point avoids every retained off-surplus
first-apex pair. Asking the parent to produce the opposite equality is
therefore equivalent to asking it to prove `False`, not an adjudicated local
mining target. Naming `q` as the center does not change that polarity.
Focused source
validation also repaired the stale
`DoubleSecondApexFrontier.toCriticalPairFrontier` constructor by copying the
new `secondApexDouble` field; `DoubleSurvivorConsumer.lean` now directly
checks against the current production structure with only the three core
axioms.

`r-complement-blocker-map/RobustPairBlockerNormalForm.lean` now gives the
exact two-blocker refinement. The blockers coincide iff neither directed
cross deletion survives; they differ iff at least one survives. A named
blocker orbit always reaches a genuine period-at-least-two cycle, but the
robust-pair invariants do not propagate beyond its first edge.
`FiniteBlockerCycleBoundary.lean` realizes an off-surplus blocker two-cycle
with both directed omissions, so totality or cycle extraction alone cannot
close `R`.

The R lane is therefore **compute-frozen pending a source-complete transition
proof**, rather than open for another search. No equality, endpoint hit, row
membership, blocker placement, or finite-shadow deficit is an accepted mining
target merely because an existing consumer maps it to `False`. Before any new
search, a source-current candidate must be shown to be the total output of a
theorem from the full parent surface, with every branch already consumed or
carrying an invariant-preserving well-founded successor and every hypothesis
mapped to a live source field. The completed audit is recorded immediately
below; because it fails consumer coverage, it does not authorize mining.

That independent source-to-consumer audit is now complete; see
`docs/audits/2026-07-15-r-source-consumer-coverage-gate.md`. The accepted
nonterminal R state and its exact CSS/two-blocker normal forms are honestly
source-produced, but no existing union of terminal consumers is complete on
them. The sharp reciprocal quotient is a coincident outside-surplus pair-row
or one of two common-deletion packets. The first arm lacks a third
pair-bisecting center or complete cap-order terminal, while the latter arms
expand only to an aligned prescribed pair or a genuine successor cycle. The
gate therefore **fails consumer coverage**, not source extraction. Keep R
compute stopped until full-parent geometry either eliminates the directed
omission/deletion-survival branch or supplies an invariant-preserving
well-founded cap-walk transition with complete terminal consumers.

The fixed `Fin 11` `CapSelectedFiniteCode` surface is a useful certificate
implementation and regression model, but its own module explicitly lacks
complete source producers for `CrossSeparationOK`, `Q3OK`, and
`CapSelectedCountsOK`; it cannot be silently promoted into the uniform live
extraction theorem. Likewise, `UnifiedFrontierParentCoupling` is a checked
conditional consumer interface, not a constructor from the parent data.
Further ambient-cardinality CEGAR or one bespoke producer per bank consumer
would mine the wrong object. Additional bounded mining is not permitted unless
a replacement theorem candidate passes a fresh source-to-consumer
object-selection gate.

That one permitted corrected replay is now complete in
`robust-all-center-15core-continuation/`. It replayed all 101 predecessor
survivors, installed the kernel-checked fifteen-core as one row-minimal
seven-row cut, added 20 further legacy-bank MARCO-minimal cuts, and reached a
new independently checked bank-clean residual at iteration 7. The terminal is
`SAT_NEXT_INDEPENDENTLY_VERIFIED_BANK_CLEAN_RESIDUAL`, still avoids the
represented strict-surplus pair capture, and is exact only inside the fixed
target-negated abstraction. Thus the new core is sound but the fixed-shadow
classifier is not converging to the live producer. Do not continue
CEGAR on this map; retain the residual as a regression case and keep R mining
stopped unless a replacement theorem candidate passes a fresh
source-to-consumer object-selection gate.

Execution order is fail-closed and includes a go/no-go gate:

1. retain the completed 15-equality DAG, terminal, and adapter axiom audit as
   an independent kernel-checked scratch gate; reduce its payload before any
   production import;
2. treat both direct live maps as **FAILED**: neither the three named
   continuation rows nor the terminal identity assignment supplies the packet;
3. do not promote or production-register the core until a concrete live role
   map makes it load-bearing and its generated-source/import cost is accepted;
4. treat the fixed-surface extraction gate as **FAILED**; the one corrected
   15-core continuation ended in another independently checked SAT residual,
   so do not extend that CEGAR stream without a newly sourced geometric field;
5. use the completed `firstApexSplit` audit to leave `FA-UNIQ4` /
   `FA-UNIQ5` in the unique-row lane, and advance `R` only through the
   cap-oriented actual-blocker transition adjudication below; before assigning
   compute, require a total source theorem from the full parent surface, a
   branch-complete terminal/successor map, and a field-by-field live provenance
   table;
6. if that R transition yields a checked terminal or a genuinely
   invariant-preserving well-founded successor, prove the direct parent
   `False` theorem before the slot split; otherwise keep the 15-core
   consumer-only and reject the transition; and
7. run focused builds, refresh proof-blueprint source/kernel indexes, verify
   that K-A-PAIR and LIVE-Q/C have disappeared from `symbols --with-sorry`,
   then run the full build and publication gates.

The separate user-owned unique-row/`(6,5,4)` lane remains genuine closure work
but is paused as of 2026-07-15. Its protected files are not mutated here. Until
that lane resumes or a fresh non-overlapping scratch continuation is assigned,
`FA-UNIQ4` / `FA-UNIQ5` are an unstaffed dependency for final parent wiring;
progress on `R`
does not by itself close K-A-PAIR.

The follow-up R/full-parent continuation object gate has now been executed;
see `docs/audits/2026-07-15-r-global-continuation-object-gate.md`.  The proposed
two-continuation-row union was rejected before encoding, so no formula or
solver run exists to interpret.  On one concrete frontier the source produces
an R normal form and an independent continuation dispatch, not a theorem
coupling their incidences.  The resulting product

```text
(B0/B1/B2 robust blocker normal form)
times
(CrossSurvival/NonEquilateral/Equilateral continuation output)
```

is branch-complete but has no terminal arm.  Repeated outside-pair support is
an unsourced conditional contradiction; the original-U5 role has no legal map
from the live surplus source to an off-surplus R endpoint; and a raw same-cap
edge is nonterminal and lacks its endpoint equality.

`UnifiedFrontierParentCoupling F` remains a valid sufficient adapter, but it
is not the correct producer interface on the actual live-center branch: its
`StrictOppCap1CommonHit` field is now kernel-checked to be impossible there.
The branch-exact interface uses the cross-survival global-source normal form,
the non-equilateral support/geometry dichotomy, and the realized
`JointTransitionClosingSelection`.  The next admissible theorem must consume
one of those honest outputs or turn directed R omission/deletion survival
into an immediate checked terminal or an invariant-preserving strict
same-cap rank/adjacent-cap lap transition.  It must preserve the
R/full-parent invariant and any actual-blocker endpoint equality at its
successor.

The pinned `G,K` labels are not a solver-ready substitute: the exact 35-point
model fails K4 at both centers, the live theorem has no fixed-35-cardinality
extraction, and deforming the coordinates would require re-proving every
hull/MEC/cap/CSS gate.  Likewise, a bank miss is not the negation of a Lean
terminal theorem.  Keep the iteration-7 SAT residual as regression evidence
and keep R compute stopped until the transition theorem supplies a truthful
source/target manifest.  The independent source, consumer, geometry, and
encoding audits were run in parallel under Adam's authorization and agree on
this verdict.

### 2026-07-15 post-gate R execution target

The proof-side object is now narrower than the rejected continuation-row
query.  The production-facing goal should be a direct contradiction from the
full R parent surface (schematically `false_of_R_fullParent`), not another
existential packet whose checked consumer immediately turns it into `False`.
This is a theorem shape for the next scratch proof attempt, not a new Lean
declaration or a claim that the contradiction is proved.

The source portion is already **PROVEN in checked scratch**.  From
`exists_doubleSurvivalBranchNormalForm` one obtains a retained ambient robust
history pair, and `AmbientRobustHistoryPair.sourceTransition_exact_split`
gives the exact directed split

```text
mate selected by the actual source blocker + blocker outside surplus
or
mate omitted by the actual source blocker + deletion survives there.
```

The next admissible lemma must preserve that routed branch.  Its complete
output contract is

```text
actual R blocker step
  -> checked terminal
   or consumer-ready same-cap endpoint equality
        + R-preserving strict rank decrease
   or R-preserving adjacent-cap advance
        + bounded lap history.
```

The first adjudication target is therefore the **cap-oriented actual-blocker
step**: either put the strict R source and its actual blocker in a genuine
common minor-cap order and produce a *different* spent endpoint in the
blocker row (equivalently the required endpoint-radius equality), or produce a
strict adjacent-cap boundary advance.  Every nonterminal arm must construct a
successor retaining the co-radial mate, off-surplus placement, and simultaneous
double survival at both prescribed apices.  A cap location, interval
membership, or rank inequality without that successor is not progress.

The old indexed `SameCapBlockerEdge` does not repair the gap.  Its source is
absent from the current checkout, and the external n8-worktree declaration is
field-for-field the same schema as sibling `SameCapIncompatibleEdge`, including
the already-missing `endpoint_radius_eq`.  The banked `source_pushout_left` /
`source_pushout_right` only return interval membership; `rank_drop` assumes the
strict interval inclusion; and the opposite-endpoint/strict-lap consumers
assume the linked edges or globally glued pushes.  None constructs or preserves
an R successor.  Porting or renaming that interface is therefore rejected as
wrapper-only work.

Adjudicate the exact cap-oriented statement against the existing Euclidean and
finite R regressions before adding a Lean obligation or any encoding.  Passing
those regressions would be discovery evidence, not a proof; failure rejects the
statement and must identify the omitted full-parent field.  Until this gate
passes, do not resume R CEGAR, encode anonymous continuation rows, or run a
bank-miss search.

The paused `FA-UNIQ4` / `FA-UNIQ5` lane has also sharpened its target.  Its
checked T1/T5/D results reclassify `ExistsSurplusPairCriticalBlocker`,
`CardFiveDistinctCapLocalCrossHypothesis`, and the coincident residual-member
packet as ex-falso endpoints on their respective branch surfaces.  They are
valid terminal presentations but not useful intermediate producer objects.
If that protected lane resumes, it should prove the three live residuals
directly as `False` and continue exact-CAS adjudication of whole surviving row
assignments, rather than mine blocker selections or those packets.  The lane
remains paused and required; no files in it are changed by this plan update.

Rigor summary: the common consumer and parent adapters are **PROVEN in Lean**;
the 15-equality bank-clean consumer and its complete generated replay are
**PROVEN in Lean but not production-cost accepted**;
the corrected shadow counts and algebraic identities are **EMPIRICALLY
VERIFIED or exact within their stated finite/algebraic abstractions**; the
fixed card-11/card-12 surface is **REJECTED as a uniform live extraction
target**; the direct three-row and terminal-identity role maps are **REJECTED
within their stated audits**; the corrected 15-core continuation is **EXACT
WITHIN ITS FIXED ABSTRACTION AND ENDS SAT**, not a producer; the constructive
robust `R` history and its
selector-free ordered-cap sink plus exact critical-map transition split are
**PROVEN in Lean**; the two-blocker normal form and failure of cycle-only
closure are also **PROVEN in Lean**; and no R producer target is currently
known to have passed adjudication. No closure forecast or mining task
may promote a contradiction antecedent into a producer target without passing
the source-to-consumer gate. The apparent sibling
`source-proved` K-A declaration is only a
`simpa` wrapper around the earlier `sorry`-backed declaration and is not proof
evidence.

### 2026-07-15 R actual-blocker source-gate checkpoint

The post-gate source/omission manifest now exists at
`scratch/atail-force/r-actual-blocker-transition/SOURCE_TARGET_MANIFEST.md`.
It fixes the live source as the actual blocker selected by the retained
`CriticalShellSystem` and requires every nonterminal successor to have that
blocker as its source. An arbitrary new robust pair is not preservation.

Two new scratch checkpoints are **PROVEN in Lean** with exactly `propext`,
`Classical.choice`, and `Quot.sound`:

- `r-full-parent-entry/RFullParentEntry.lean` proves
  `fullParent_extracts_criticalPairFrontier_firstApexSplit`, retaining the
  complete live telescope while reaching a concrete production frontier and
  its `R/FA-UNIQ4/FA-UNIQ5` split; and
- `r-actual-blocker-transition/ActualBlockerCapMetricClassifier.lean` proves
  `actualBlocker_capMetricClassifier` and the strict-source orientation
  wrapper. The blocker is a carrier point distinct from both prescribed
  apices and is the surplus apex or a strict-cap point. HIT supplies exact
  mate membership, outside-surplus placement, pair-radius equality, and the
  opposite-side sign. OMISSION supplies exact mate omission, deletion
  survival, and the opposite radius inequality.

The retained robust history sharpens preservation further.
`ActualBlockerRobustSuccessor.lean` proves the named-source export
`exists_ambientRobustHistoryPair_with_source_of_erased` and the exact split

```text
actual blocker b belongs to the terminal carrier C
or
there is a complete AmbientRobustHistoryPair P' with P'.x = b.
```

Thus the erased-blocker branch already reconstructs the successor's
co-radial mate, off-surplus placement, and simultaneous double survival at
both prescribed apices. These declarations also use only the three core
axioms. What remains open is strict progress for that successor and the
terminal-carrier landing branch.

`ActualBlockerOrbitNormalForm.lean` now iterates this named successor and
proves the source-faithful finite normal form: either a reachable actual
blocker lies in `C`, or the actual-blocker map has a reachable period at least
two wholly in `D.A \ C`, with a complete robust pair whose source is exactly
every reachable orbit vertex. `ActualBlockerMinimalCycle.lean` then replaces
the arbitrary displayed period with the canonical mathlib minimal period,
proves it is at least two, supplies injective/nodup canonical vertices, and
retains erased membership plus a source-exact robust pair at every
`Fin period` index. `LeastTerminalHitPredecessor.lean` takes the least positive
terminal hit, proves every earlier source is erased, reconstructs the robust
predecessor with that exact source, identifies its actual blocker with the hit,
and attaches `RetainedActualBlockerTerminalPayload` to that entry edge.
`ActualBlockerMinimalCycleClassifier.lean` independently chooses one robust
pair at every exact cycle source, applies the actual-blocker classifier there,
and proves the exact finite alternative: some source is HIT or every source
is OMISSION. The chosen mates and radii remain independent across sources.
`RFullParentOrbitEntry.lean` wires the refined dichotomy back to the complete
K-A parent and exposes exactly the protected unique-row arm or an R state whose
outcome is the least-entry terminal payload or that classified source-exact
minimal erased cycle. Crucially its R output includes `P.x = F.pair.q`; the
orbit cannot start
from an unrelated erased pair. All new entry/normalization declarations again
use only the three core axioms.

This is the complete current source/DAG normal form, not a closing transition.
The mate reconstructed at each source is existential rather than coherent
across successive edges; no cycle theorem may assume mate-history coherence
without producing it. The source contains no named endpoint role, proper rank
inclusion, or globally oriented lap advance. All twelve fail-closed actual-blocker,
endpoint, finite-invariant, cycle, selector, Euclidean layer-separation, and
iteration-7 checkpoint regressions replayed successfully. The finite blocker
two-cycle specifically shows that preservation without progress is
insufficient. The iteration-7 command remained check-only and still ends in a
bank-clean SAT residual with zero represented target hits; mining was not
resumed.

The terminal-carrier audit also rules out the tempting uniqueness shortcut.
`FirstApexTerminalOn.hunique` controls classes centered at `S.oppApex1` on
`C`, whereas the actual blocker shell is centered at `b != S.oppApex1` and
contains an erased source point. A faithful finite boundary realizes
`b in C` in strict `oppCap1` while omitting the mate and both cap endpoints.
The theorem-bank/index preflight finds no declaration consuming `b in C`
alone. In HIT the smallest bank-feeding payload is a third point common to the
circles centered at `b` and `S.oppApex1`, after which
`Problem97.two_circle_third_point_eq` closes. In OMISSION the deleted K4 row
can be packaged as `U5QDeletedK4Class`, but a named common-bisector triple or
reciprocal selected-class incidence is still missing.
`ActualBlockerTerminalHitConsumer.lean` now kernel-checks the HIT adapter:
`false_of_actualBlocker_hit_thirdCommonPoint` consumes that one third point
and closes with the banked two-circle theorem under only the three core
axioms. The third-point producer itself remains open.

The descent-state audit is also complete in
`r-full-parent-entry/RetainedPointProvenance.lean`. For a retained actual
blocker it proves exactly: the blocker equals terminal `q`, equals terminal
`w`, or survives in `(C.erase q).erase w`; in the residual role it lies on the
unique terminal first-apex radius or its own retained first-apex class has card
at most three. `exists_terminalWitness_role_and_capMetricOutcome` crosses that
role with HIT/OMISSION and retains the terminal second-apex K4 witness. Every
endpoint uses only the three core axioms. No stronger endpoint, row-incidence,
or rank field is preserved by the current interface, and the bank preflight
finds no direct consumer for the whole quotient.

The exact cell audit is recorded in
`docs/audits/2026-07-15-r-terminal-payload-branch-audit.md`.
`ActualBlockerOmissionAdapter.lean` now keeps the actual selected shell
definitionally, with exact four-point support, source membership, mate
omission, radius equality, deletion survival, and a source-derived
`U5QDeletedK4Class`. Its checked
`false_of_dangerousTriple_subset` closes as soon as a
`U5DangerousTriple D P.y P.x T` with `T ⊆ K.support` is produced. This is the
smallest named one-row OMISSION incidence currently feeding a bank consumer;
packaging another anonymous K4 witness would lose useful provenance.
`ResidualTerminalOmissionConsumer.lean` supplies the complementary exact
two-circle closer: the residual terminal-radius OMISSION cell is false from
only `rho = terminalRadius` and membership of both terminal endpoints in the
actual selected shell. Its distinctness proof is source-derived from
erased-versus-retained provenance.

The first genuinely open producer is therefore split by the refined orbit
outcome. On the terminal arm, least-hit/source-predecessor reconstruction is
already proved; mine/prove only from its exact endpoint-versus-residual role
crossed with HIT/OMISSION and terminal-radius-versus-small-class status. Route
HIT to the checked third-common-point consumer and OMISSION to named U5
dangerous-triple incidence in its exact selected shell. On the erased arm,
minimal-period normalization and the exact
some-HIT versus all-OMISSION split are also proved. The missing content is now
the bank-feeding incidence/metric producer in those two cycle-wide arms: a
fixed-cap endpoint-spending packet, coherent strict-lap packet, or existing
metric terminal. The same-cap source-pushout
and rank/lap bank remains consumer-side only. No production sorry has closed,
and the protected paused `FA-UNIQ4` / `FA-UNIQ5` lane is unchanged.

### 2026-07-15 coherent fixed-single-radius R checkpoint

Adam explicitly authorized the parallel source, consumer, cap-order, and
spent-entry research recorded in this checkpoint. The resulting scratch
surface is now branch-complete at the first-radius descent, and all positive
claims below have been kernel-checked with exactly `propext`,
`Classical.choice`, and `Quot.sound`.

`FixedFirstRadiusTerminalDescent.lean`,
`FixedSingleRadiusResidualClassifier.lean`, and
`FixedSingleRadiusOrbitEntryIntegration.lean` replace the earlier
source-by-source independent-radius cycle surface. They produce either a
single coherent `FixedSingleRadiusTerminalHistory` or the explicit residual
`FrontierRadiusSpentAtEntry`. On the coherent arm, every reconstructed source
and its actual-blocker successor lie in the same fixed class about
`S.oppApex1`. The least terminal hit and the minimal erased cycle are both
retained; the cycle successor can be chosen as the robust mate and its exact
actual-blocker outcome is OMISSION.

The first common-deletion reduction is complete but is not a contradiction.
`FixedSingleRadiusTerminalCommonDeletion.lean`,
`FixedSingleRadiusCycleCommonDeletion.lean`, and
`FixedSingleRadiusCommonDeletionIntegration.lean` map both coherent orbit
outcomes into the existing `CommonDeletionTwoCenterPacket` interface.
However, the cycle packet deletes its own first center. The checked
`SelfCenteredCommonDeletionClassifier.lean` proves that this specialization is
equivalent to the single substantive second-center deletion-survival fact;
first-center survival is automatic from global K4. The generic
common-deletion successor recursion therefore remains nonterminal and its
existing geometry-free periodic countermodel still applies. The
source-preserving version is now packaged by
`CoherentRCommonDeletionProvenance.lean`: it retains the named source and
deleted successor, the source's actual full critical row, the double-deleted
second-apex row, and the source's deletion-criticality/survival polarity. Its
first exact missing incidence is `SourceOutsideDeletedCriticalShell`, namely
that the predecessor source is outside the deleted successor's chosen shell.

Two genuine geometric consequences are now checked on the coherent cycle.
`FixedSingleRadiusCycleCapLocalization.lean` puts all sources outside the
surplus cap, permits at most one source in `oppCap2`, and puts every other
source in strict `oppCap1`. Thus periods at least three have a strict
`oppCap1` actual-blocker edge; period two is the only exceptional length.
`FixedSingleRadiusCycleSecondApexExtrema.lean` uses the banked two-apex escape
theorem to prove that distance to `S.oppApex2` is injective on the canonical
cycle. Consequently the actual-blocker cycle has both a strictly increasing
and a strictly decreasing second-apex-distance edge. This is the first
order-sensitive Euclidean invariant not represented by the earlier finite
incidence/order regressions.

The ordered-cap lift has now bypassed the earlier endpoint-radius guess.
`FixedSingleRadiusCycleSourceOutside.lean` proves that for three consecutive
strict-`oppCap1` cycle vertices, if the predecessor and deleted ranks lie on
the same side of the next blocker rank, transported CGN6c forces
`SourceOutsideDeletedCriticalShell`. Otherwise the next blocker rank lies
strictly between the previous two ranks, giving the exact rank-descent
alternative rather than another raw edge wrapper. The separate
`CoherentRPeriodTwoSourceOutside.lean` closes the missing incidence for period
two: the deleted successor's blocker is the original source, hence the source
is the deleted row's center and cannot lie in its positive-radius support.
The rank descent is now globalized on an all-strict cycle: cyclic return makes
an everywhere-decreasing edge gap impossible, so some triple supplies
source-outside. `OppCap2CycleBoundarySourceOutside.lean` closes the remaining
exception. If the middle point of a consecutive triple is the unique possible
`oppCap2` source, the preceding two sources are strict `oppCap1`; putting both
in that source's selected row would give two distinct ordered-cap centers
equidistant from the same distinct pair outside the cap, contradicting the
banked ordered-cap uniqueness theorem. Therefore every period-at-least-three
coherent cycle has some `CycleSourceOutsideSuccessorShell`, with no residual
cap-local disjunction. The combined theorem
`exists_sourceOutsideSuccessorShell_of_three_le_period` was independently
root-recompiled on 2026-07-16 and prints only the three core axioms.

The cycle integration is now complete through
`FixedSingleRadiusCycleReanchoring.lean` and
`FixedSingleRadiusCycleAnchoredIntegration.lean`. Reanchoring a minimal cycle
at any canonical index preserves its minimal period, identifies the new
indices zero and one with the old winning source and successor, and rebuilds
the provenance-bearing coherent packet there. Consequently every coherent
fixed-radius minimal cycle, including period two, produces
`AnchoredSourceCriticalTransition`. Both files independently root-compile
with only the three core axioms.

The coherent least-terminal-hit producer is now split exactly by
`LeastTerminalHitReciprocalRowSplit.lean`. If the predecessor source avoids
the chosen terminal endpoint's selected shell, it reaches the same anchored
transition. Otherwise `ReciprocalDirectedCrossResidual` retains the exact
asymmetric cross: the source lies in the deleted endpoint's row while the
deleted endpoint is absent from the source row. It also retains both-apex
single-deletion survival for both points, source criticality versus deleted
survival at the first center, distinct blocker centers, selected-row overlap
at most two, the exact unique surviving source row after deleting the
endpoint, the fixed-radius/off-surplus/strict-cap data, and the banked negative
signed-area product. This is a residual packet, not `False`.

`AnchoredSourceCriticalTransitionConsumer.lean` checks the downstream
polarity. Once source-outside is known, the source is a genuine fresh critical
source whose prescribed transition is already critical at the first center
and is not another common-deletion successor. This is still not `False`. The
deleted point's already-selected critical row becomes an exact source-deleted
U5 class at a center distinct from the source row's center. The banked U5
intersection theorem therefore gives the unconditional bound that these two
retained critical rows share at most two points. A third common point would be
a sufficient contradiction, but current provenance produces no named common
point, so `ThreeCommonCriticalRowPoints` is a consumer boundary rather than a
justified producer target. `FixedSingleRadiusAnchoredOrTerminalResidual.lean`
now composes the complete orbit into the exact consumer-facing normal form:
either a provenance-bearing anchored transition or the named terminal
`ReciprocalDirectedCrossResidual`. Its root compile and axiom audit are clean.
The two-row overlap bound must be consumed with fixed-radius/cap/order
provenance rather than by assuming a third hit. The remaining coherent-R work
is therefore consumer work on these two exact outputs, not cycle mining,
index adjudication, or another anonymous common-deletion recursion. The
second-apex equality between the source and deleted point is a sufficient
conditional sink but is not an admissible producer target: the existing
joint-fiber injectivity theorem proves those distances unequal for distinct
off-surplus points on the common first-apex fiber.

The spent-at-entry branch is now completely reduced before any alternate-
radius orbit is needed. `SpentEntryTerminalMutualHitConsumer.lean` proves
`FrontierRadiusSpentAtEntry.both_originalPoints_commonDeletion` and
`FrontierRadiusSpentAtEntry.exists_commonDeletion`: the frontier's existing
first- and second-apex double-survival facts monotonically give single-
deletion survival for either original endpoint at both distinct apices.
Consequently the entire spent branch reaches `CommonDeletionTwoCenterPacket`
at entry. The later cycle-return and mutual-hit packet adapters remain valid,
but neither is load-bearing and there is no spent-specific producer residual.
Root isolated recompilation passed with only the three core axioms. No
production `sorry` has closed, the protected paused `FA-UNIQ4` / `FA-UNIQ5`
lane is unchanged, and LIVE-Q/LIVE-C deletion still waits for a consumer-
complete coherent R theorem plus the protected unique-row proof.

### 2026-07-16 dangerous-retaining coherent R consumer checkpoint

The full-parent connector is now synchronized to the critical-system choice
which retains the live dangerous row.  In
`r-full-parent-normal-form/DangerousRetainingFullParentNormalForm.lean`,
`fullParent_extracts_dangerousRetainingCurrentNormalForm` rebuilds the live
row before frontier selection and keeps the same system throughout the
frontier normal form.  It retains the chosen second-large-cap witness
`j ≠ i`, `5 ≤ (CP.capAt j).card`, the fact that `q` lies in the physical
surplus cap, the fixed first-apex radius and frontier, and the exact
`FA-UNIQ4/FA-UNIQ5` versus coherent versus spent split.  The declaration was
root-recompiled with only `propext`, `Classical.choice`, and `Quot.sound`.

The dangerous-row coupling is exact.  For a coherent packet, the rebuilt
system has

```text
R.firstCenter = p ↔ R.sourcePair.x ∈ {t1,t2,t3}.
```

(`q` is excluded because the coherent source is off the surplus cap.)  On
this aligned arm the source row is exactly `{q,t1,t2,t3}`.  On the
nonaligned arm the current two-circle bank gives only intersection cardinality
at most two; it gives no positive dangerous-row hit.  In the reciprocal arm
the deleted endpoint is unconditionally outside the dangerous row.  These
facts are checked in
`r-parent-dangerous-row-coupling/DangerousRowCoupling.lean`; they sharpen the
parent quotient but do not imply `False`.

The anchored `2 + 2 + deleted` fallback has been eliminated.
`r-anchored-221-consumer/AnchoredTwoRowCoverConsumer.lean` lifts the retained
second-apex row to the ambient two-apex joint-fiber bound and proves that its
intersection with one off-surplus first-apex marginal has cardinality at most
one.  This contradicts the fallback's asserted two hits.  Hence every
`AnchoredSourceCriticalTransition` has an off-surplus row-external source and
therefore returns a `CriticalPairFrontier` at the same first-apex radius.
This is a recurrence theorem, not a contradiction or a well-founded descent.

The freshness audit in
`r-frontier-progress-audit/FrontierProgressAudit.lean` makes that distinction
formal.  The successor unordered pair differs from the current source pair,
and its new endpoint avoids the current distinguished source, but the
frontier interface forgets predecessor and erased-history data.  The deleted
endpoint is either retained by the terminal carrier or already belongs to the
erased history.  In the retained arm there is either another retained
row-external source or the exact
`TerminalThreePointTwoRowCoverResidual`; in the cycle arm the deleted endpoint
is already erased.  No strict global rank, history growth, or nonrecurrence
theorem follows from the current interface.

The retained terminal residual has now been normalized and independently
root-recompiled in
`r-terminal-three-point-residual/TerminalThreePointResidual.lean`.  Its
terminal first-apex class has cardinality exactly four and meets the surplus
cap in exactly one point.  Its three off-surplus points are exactly the
deleted point, one source-row hit, and one second-apex-row hit; the two row
marginals are disjoint.  Cap placement is exactly either three strict
`oppCap1` hits and no `oppCap2` hit, or two strict `oppCap1` hits and one
`oppCap2` hit.  One common off-surplus terminal-marginal point of the two
retained rows gives `False`, but an exact incidence model realizes the
distinct-hit profile.  Therefore the next terminal producer must use
metric/order/MEC geometry to force a cross-row incidence; cardinality and cap
membership alone are terminal for this route.

`r-terminal-cap-row-geometry/TerminalCapRowMetricBridge.lean` records a
conditional scalar terminal.  It would be enough to produce the unique
second-apex-row terminal marginal hit `z` together with

```text
dist R.firstCenter z = R.sourceRow.radius.
```

The source row is an exact critical shell, so this equality would force
`z ∈ R.sourceRow.support` and closes the terminal residual through the checked
common-row-point consumer.  In the parent-aligned arm `R.firstCenter = p`,
the same target can be stated without a distance: it is enough to put the
second-apex-row marginal hit in `{q,t1,t2,t3}`, equivalently in
`{t1,t2,t3}` because the marginal is off the surplus cap.  Both conditional
bridges were independently root-recompiled with only the three core axioms.
The companion
`r-terminal-cap-row-geometry/TerminalCapRowIncidenceCountermodel.lean`
kernel-checks a `Fin 16` model containing the exact terminal row counts,
aligned dangerous base, ambient five-point marginal, cap placement, and
row-overlap bounds while keeping the two named hits distinct.  This is exact
within the exported finite incidence/cap-placement abstraction, not a
Euclidean or full-parent counterexample.  The later named-hit audit below
proves that the equality and dangerous-base placement are actually false on
the source-faithful residual, so this bridge is retained only as a regression
terminal and is not an open producer.

The source-provenance audit in
`r-terminal-metric-source-audit/TerminalMetricSourceAudit.lean` removes one
apparent ambiguity.  The terminal residual puts the deleted endpoint back in
`T.carrier`, so the minimal-cycle provenance arm is impossible.  The packet
must come from a `LeastPositiveTerminalHitPredecessor`, and `R.firstCenter` is
exactly that least positive blocker-orbit hit.  The remaining obstruction is
at a constructor boundary: the original terminal witness is a second-apex K4
after deleting both named terminal endpoints, but the current constructor
monotonically lifts that existence and chooses an arbitrary four-subset on a
larger carrier.  It forgets the other terminal endpoint and the original
double-erased row.

That interface loss is now repaired in
`r-terminal-source-faithful-packet/TerminalSourceFaithfulPacket.lean`.
The terminal constructor chooses the four-point row on the original
double-erased terminal carrier first, then lifts that exact support and radius
into the coherent ambient packet.  The strengthened terminal-only refinement
retains the least-hit predecessor, the other terminal endpoint, and the
support-identical original row.  Under the exact three-point residual it names
the marginal as

```text
{deleted, otherTerminal, terminalSecondRowHit},
```

where `otherTerminal` is exactly the unique source-row hit and
`terminalSecondRowHit` is exactly the unique hit of the original
double-erased second-apex row.  The latter is distinct from both endpoints
and remains outside the source row.  The companion
`TerminalSourceFaithfulMetricBridge.lean` records the single named conditional
equality

```text
dist firstCenter terminalSecondRowHit = sourceRow.radius,
```

or, in the aligned arm, membership of that same named point in
`{q,t1,t2,t3}`.  Both files were independently root-compiled with only the
three core axioms.  The witness ambiguity is closed, but the later
`TerminalNamedMetricLocalization.lean` audit refutes these antecedents and
retires them as producer targets.

`r-terminal-source-faithful-integration/TerminalSourceFaithfulIntegration.lean`
now carries that refinement through the actual-blocker orbit, resolves its
reciprocal arm as fresh common deletion or swapped `FA-UNIQ4`, and exposes the
result through the complete dangerous-retaining full-parent telescope.  The
terminal-anchored branch retains the refined packet rather than projecting
back to an anonymous coherent packet; minimal-cycle anchored transitions stay
on the uniform packet.  Thus `terminalSecondRowHit` is available at the
load-bearing parent branch.  This integration was also root-compiled with
only the three core axioms.

`r-terminal-named-metric-attack/TerminalNamedMetricLocalization.lean` decides
the named terminal question.  The residual proves

```text
dist firstCenter terminalSecondRowHit ≠ sourceRow.radius,
```

and in the aligned live branch the named hit lies outside
`{q,t1,t2,t3}`.  Those are not missing lemmas.  Instead, deleting the named
hit preserves K4 at the coherent first center.  Global K4 at `oppApex2` then
gives either a fresh `CommonDeletionTwoCenterPacket` or a prescribed critical
row; the fixed-surplus non-surplus swap sends the latter directly to the
protected `FA-UNIQ4` branch.  The terminal-only metric chase is therefore
closed as a negative target.  Its source history may still be useful when
consuming the resulting common-deletion packet, so the terminal origin is not
discarded at the parent boundary.

The live-row common-deletion expansion has also been decided precisely in
`r-live-common-deletion-expansion/LiveCommonDeletionExpansion.lean`.  For

```text
C : CommonDeletionTwoCenterPacket D W.H deleted p center₂
```

the first row is the live dangerous row, the deleted source lies outside it,
and an aligned prescribed-critical pair at the first center `p` is automatic.
That pair repeats the support and blocker data already installed in `W`; no
existing `False` consumer matches it.  Consequently the named
`CommonDeletionSuccessorCycle` is impossible because its `no_aligned` field
fails everywhere.  This does not rule out actual recursive recurrence: that
cycle theorem was constructed only under global absence of aligned pairs.
The first nontrivial escape antecedent is two fresh expansion sources outside
the live row.  From exactly that cardinality hypothesis, the checked theorem
returns either an off-live successor at the same two centers or an aligned
prescribed pair at the second center.  Closing either output still needs
well-founded progress or cap/MEC placement.  The nearest already-imported
direct terminal is
`U5QCriticalTripleClass.two_triple_points_incompatibility`; reaching it would
require an independent q-critical row at a center different from `p` which
contains two distinct dangerous-triple points.  The automatic first-center
alignment supplies none of those new role or center fields.

Failure of the two-off-live antecedent is no longer anonymous.
`r-two-off-live-failure/TwoOffLiveFailureClassification.lean` gives the exact
three-profile trichotomy for the second row relative to the live dangerous
row and the deleted source's four-point critical support:

1. `1 live-only + 2 support-only + 1 outside`;
2. an exact disjoint `2 live-only + 2 support-only` cover; or
3. two live hits and one outside point, with either
   `2 live-only + 1 support-only + 1 outside` or
   `1 triple-common + 1 live-only + 1 support-only + 1 outside`.

Zero live overlap is impossible, and the deleted source remains in the
critical support outside the second row.  No current U5 bank consumer accepts
these anonymous cells: the nearest theorems require named MEC/cap sectors,
audit-center membership, or q-critical classes at prescribed dangerous
centers.  Further support-cardinality mining is exhausted.  The next useful
common-deletion theorem must either produce a second off-live source from
independent parent data or attach the exact profiles—especially the `2+2`
cover—to source-faithful cap/order roles.

`r-failure-profiles-parent-lift/FailureProfilesParentLift.lean` performs that
first full-parent cap lift for an arbitrary actual packet `S` rather than
silently using `D.packet`.  Every failure branch has at least two second-row
points in strict `oppCap2`, and global K4 supplies a row at each such point.
In F1 and F2 the deleted source's critical support contains at most one live
dangerous point; F3 retains only the general at-most-two bound.  Thus the
tempting two-dangerous-point q-critical adapter is not source-faithful.

For F2, the two strict points are exactly live-heavy, support-heavy, or one
of each.  In the live-heavy arm the existing same-cap consumer first proves

```text
p ∉ S.surplusCap ∧ p ∉ S.oppCap1.
```

Exact three-cap coverage then forces the opposite conclusion from the former
plan target:

```text
p ∈ strictSecondCap S,
```

and the live dangerous row saturates the current selected-row cap bound:

```text
(W.liveRow.support ∩ S.oppCap2).card = 2.
```

Thus `p ∈ S.surplusCap ∪ S.oppCap1` is false, not a missing placement lemma.
A direct sufficient strengthening would be an at-most-one bound for this
intersection, or the stronger exclusion `p ∉ S.oppCap2`, but neither is
currently banked and neither may be assumed merely because it closes the
branch.  The next bank-facing audit must use the named three-row roles in the
exact `2 live-only + 2 support-only` chain.  The support-heavy and mixed arms
likewise need named source, center, and critical-class roles rather than more
anonymous support-cardinality mining.  The parent lift and
`r-f2-liveheavy-placement/F2LiveHeavyPlacementAudit.lean` compile with only
the three core axioms.

The direct current-U5 adapter audit is also now exact.  In
`r-f2-u5-bank-match/F2U5BankMatchAudit.lean`, erasing either strict live
witness turns the live row and second-apex row into two q-critical triple
classes, but their surviving supports intersect in exactly one point.  The
first class is centered at `p`, which is also the canonical dangerous-triple
center, so `p` is neither a dangerous-triple point nor a member of its own
q-critical support.  The named adjacent-center and third-common U5
incompatibilities therefore fail before their final incidence hypotheses;
the indexed `third_common_obstruction` name is only the current
`third_common_incompatibility`, not a stronger unimported declaration.

The correct remaining object is formalized in
`r-f2-three-row-chain/F2ThreeRowChain.lean`.
`SourceFaithfulF2ThreeRowChain` retains:

```text
card (C.B₂ ∩ live) = 2
card (C.B₂ ∩ deletedCriticalSupport C) = 2
card (live ∩ deletedCriticalSupport C) ≤ 1
card (C.B₂ ∩ live ∩ deletedCriticalSupport C) = 0
```

together with the actual q-deleted row classes, deleted-source critical
system, `q ∈ surplusCap`, strict-`oppCap2` localization, the global-K4 row
producer at every strict middle-row point, and pairwise-distinct row centers.
`NamedF2TwoTwoWitnesses` names the two live-only strict points and two
support-only points with every cross-cell inequality explicit.  These
declarations compile on the pinned Lean 4.27 toolchain with only
the three core axioms.  The same file also kernel-checks the exact global-K4
split at every strict middle-row point: a four-point row surviving the
original deletion or a three-point q-critical row at that center, without
inventing any further row incidences.

The required theorem-bank audit is now complete rather than pending.
`r-f2-three-row-bank-deficits/` scans all 170 source-proved,
ambient-data-uniform U5 `False` consumers in the current sibling census:
there are zero direct matches, six conditional current-row matches, 45
impossible role maps, 107 matches requiring additional generated classes, and
12 opaque/non-class interfaces.  Turning the closest q-critical consumer
around does give one positive uniform theorem.  At a generated center in the
actual deleted-source dangerous triple, either side of the global-K4 split
has at least two support points outside that dangerous triple:

```text
q-critical: card (G ∩ T) ≤ 1, hence 2 ≤ card (G \ T)
q-deleted:  card (G ∩ T) ≤ 2, hence 2 ≤ card (G \ T).
```

This is not yet the two-off-live producer: the deleted-source dangerous
triple `T` and the retained live row are different named sets.  Further work
must classify the generated `G \ T` points against the retained live row,
middle row, cap/MEC placement, and origin provenance.  Anonymous
support-cardinality or diagnostic live-overlap mining is exhausted.

The support-heavy half is now reduced just as sharply in
`r-f2-supportheavy-reduction/F2SupportHeavyReduction.lean`.  Two strict
support-only witnesses lie both on `C.B₂` and on the retained selected
critical shell at the actual deleted source.  Ordered-cap outside-pair
uniqueness forces that shell's actual blocker outside the surplus cap and
`oppCap1`; exact cap coverage then places it in `strictSecondCap S`, and the
critical shell saturates the selected-row cap bound:

```text
card (deletedCriticalSupport C ∩ S.oppCap2) = 2.
```

`r-f2-supportheavy-deleted-cap/F2SupportHeavyDeletedCap.lean` adds the
source placement forced by that saturation.  The actual deleted source is in
the selected critical support but omitted from the q-deleted middle row, so
it cannot be a third `oppCap2` member of that support.  On the anchored
off-surplus branch this gives:

```text
deleted ∉ S.oppCap2
deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2).
```

This is a placement of the actual source, not an inference from selected-row
nonmembership to a radius inequality.

`r-f2-anchored-supportheavy-coupling/AnchoredSupportHeavyCoupling.lean`
retains that source placement together with the two named support-heavy
witnesses.  The source `X.point` is strict `oppCap1`, while the distinct
points `s,t` are strict `oppCap2` members of both the retained second row and
the actual selected critical shell at the blocker chosen for `X.point`.
At most one of `s,t` lies in the full fixed first-apex radius class, so the
packet also names an off-fixed witness without inferring anything from
selected-support omission.  The exact metric fan is:

```text
dist S.oppApex2 s = dist S.oppApex2 t
dist (W.H.centerAt X.point ...) s = dist (W.H.centerAt X.point ...) t
dist X.point s ≠ dist X.point t.
```

`r-f2-deleted-source-pair-row/DeletedSourcePairRowBoundary.lean` makes the
consequence decisive: every selected row centered at `X.point` meets
`{s,t}` in cardinality at most one.  Global K4 does choose such a row, but
every possible choice omits at least one named point; the same bound holds
for any retained critical-shell entry whose blocker center is `X.point`.
Thus an `X.point`-centered row through both witnesses is not merely
unproduced—it is incompatible with the validated packet.  Remove that target
from the producer queue.

Thus both heavy arms end at an exact two-hit saturation, one for the live row
and one for the deleted-source critical shell.  Neither saturation supplies
the contradictory at-most-one bound.  If neither heavy arm occurs,
`F2MixedOneLiveOneSupportBoundary` proves the exact residual:

```text
card liveStrict = 1
card supportStrict = 1.
```

Its two strict witnesses are distinct by their cells, but only one belongs to
each outer row, so the two-point same-cap argument used in the heavy arms is
unavailable.  This mixed `1+1` packet is the smallest F2 cap boundary still
lacking a paired outer-center witness.

`r-f2-strict-cell-normal-form/F2StrictCellNormalForm.lean` now packages this
as the complete F2 branch interface.  `ResolvedF2StrictCellNormalForm` retains
the original `TwoLiveExactCoverSecondApexProfile` and `q ∈ surplusCap` in
every branch, then returns exactly live-heavy, support-heavy, or mixed.  This
prevents the reduced saturation packets from becoming weaker replacement
objects that lose the exact `2+2` row or its global-K4 continuation field.
The coordinator compiles with only the three core axioms.

The metric audits in `r-f2-three-row-metric-audit/` and
`r-f2-second-apex-radius-transport/` also settle the proposed middle-radius
shortcut and its source identity.  In the anchored F2 lift, the generic
deleted label is the fresh row-external `X.point`, not the older coherent
`R.deleted`.  Before the strict-cell trichotomy is split, this actual source
is provably off the retained second-row radius:

```text
dist S.oppApex2 X.point ≠ R.secondApexRow.radius.
```

Therefore equality with that radius is a valid conditional contradiction,
but it is not a plausible branch-uniform producer.  Every selected
second-apex row containing `X.point` has a different radius and selected
support disjoint from the retained row.  Moreover the second-apex distances
of `X.point`, `R.deleted`, and `R.sourcePair.x` are pairwise distinct, so no
selected row at that apex can contain any two of those names.  A retained
radius hit for either older name yields only a full ambient class of
cardinality at least five, not a contradiction, and both older names cannot
hit simultaneously.

The exact finite incidence terminal is now
`FreshRetainedRadiusTransport X`: a selected row at `S.oppApex2` containing
`X.point` together with one selected support point shared with
`R.secondApexRow`.  `false_of_freshRetainedRadiusTransport` closes that
packet, since the common hit forces the forbidden radius equality.  Since the
same anchored interface already proves all such containing rows
support-disjoint from the retained row, this packet is a conditional sink and
regression theorem, not a smaller positive producer target.  An exact local parabola
realization of the bare three-row equations independently confirms that
anonymous three-row metric closure is too weak.

`r-f2-generated-escape-placement/F2GeneratedEscapePlacement.lean` classifies
the actual global-K4 rows at the two support-heavy centers.  A q-deleted row
always has a genuine support point outside both

```text
T := (deletedCriticalSupport C).erase deleted
```

and `oppCap2`, hence in the surplus cap or strict `oppCap1`.  Its first
q-critical classification left one exact no-escape arm:

```text
card (K.support \ oppCap2) = 1
2 ≤ card ((K.support \ T) ∩ oppCap2).
```

`r-f2-boundary-absorption/F2BoundaryAbsorption.lean` now eliminates that arm.
The completed q-critical row and the actual deleted-source critical shell
would have distinct strict-`oppCap2` centers and share the two distinct
outside-cap points consisting of the deleted source and the unique absorbed
boundary point.  Ordered-cap uniqueness gives `False`.  Therefore every
q-critical output has the same genuine off-`T`, off-`oppCap2` escape as every
q-deleted output:

```text
∀ exact generated row G,
  ∃ y ∈ G.support, y ∉ T ∧ y ∉ oppCap2.
```

The earlier middle-confined q-critical theorem remains a sharp saturation
diagnostic, but its no-escape premise is now impossible.
The pair of exact generated rows also normalizes without support loss to
`TwoContinuationRows` and reaches the existing
cross-deletion-survival-or-`MetricResidual` trichotomy.

`r-f2-generated-metric-sink/F2GeneratedMetricSink.lean` removes the metric
arm from the both-q-critical constructor.  Both completed rows contain the
actual deleted source `X.point`; either `MetricResidual` arm equates their
radii, so actual support membership would give

```text
dist X.point s = dist X.point t,
```

contradicting the anchored cap-order separation.  Hence the both-q-critical
case necessarily reaches one of the two cross-deletion-survival arms, already
packaged as an exact q-deleted four-row.  Cross-survival itself is not yet a
contradiction.  The q-deleted/q-deleted and mixed constructor metric arms also
remain open because the deleted source is absent from at least one completed
row.

`r-f2-escape-live-roles/F2EscapeLiveRoles.lean` classifies the
constructor-uniform escape without erasing its row.  It is either genuinely
off the retained live row—and then automatically off the middle row—or it is
exactly one of `q,t1,t2,t3`.  The `q` role retains surplus-cap membership; each
`ti` retains the exact surplus-or-strict-`oppCap1` alternative.  In an
anchored q-critical row the escape cannot be the actual coherent predecessor
`R.sourcePair.x`: the completed generated row would contain both that source
and `X.point`, while the ambient fixed first-apex class supplies a four-subrow
through the same strict-`oppCap1` pair, contradicting ordered-cap uniqueness.
Thus the remaining q-critical live roles are `q` or a dangerous label other
than the coherent source; q-deleted still permits any one named live hit.

The remaining F2 question is therefore exact: classify the now-uniform escape
in pairs—forcing a second off-live point, common outside point, or a named U5
reciprocal/chain incidence—or consume the generated continuation trichotomy
with an independent provenance/rank fact.  A single named live hit does not
meet any current U5 antecedent.

Finally, the reciprocal critical arm is not an independent producer
obligation.  In
`r-reciprocal-swap-reduction/ReciprocalSwapReduction.lean`, prescribed
second-apex criticality gives an exact four-point ambient row and a unique
positive four-capable radius.  The fixed-surplus non-surplus swap makes the
old second apex the new first apex, preserves `D`, `H`, and the physical
surplus cap, and a fresh frontier on the swapped packet lands in the
`FA-UNIQ4` branch with double deletion blocked.  Transporting the old pair is
impossible but unnecessary.  Therefore the former distinct-second-apex-radius
producer is removed from the R queue.  The protected `FA-UNIQ4` eliminator
must be packet-polymorphic or accept the recorded swap equalities; once it
does, this critical arm closes through the owner lane.  The alternative
reciprocal common-deletion arm remains part of the common-deletion work.
`r-reciprocal-swap-integration/ReciprocalSwapIntegration.lean` carries this
reclassification through the coherent coordinator and the complete
dangerous-retaining parent telescope: the source-current reciprocal branch is
exposed directly as fresh common deletion or swapped `FA-UNIQ4`, with no
distinct-radius node left in the normal form.  The wrapper was root-compiled
with only the three core axioms.

The generic spent-at-entry branch has also been checked at its strongest
obvious provenance level.  In
`r-spent-entry-provenance-consumer/SpentEntryOriginalPairSharedRows.lean`,
one alternate first-apex row and the frontier's retained second-apex row can
be chosen so that both original endpoints `q,w` are common deletions using
exactly the same two supports.  Ordered-cap geometry sharpens their common
support outside the surplus cap to cardinality at most one; if total overlap
is two, the split is exactly one point inside and one outside the surplus
cap.  This does not close: `q,w` themselves are omitted from both rows, no
lower bound of two on row overlap is available, and selecting strict pairs
lands exactly in the existing
`biApex_two_by_two_survival_normal_form`, whose conclusion forgets `q,w`.
This provenance branch should not be developed as a separate spent-only DAG.
It should instead enter the same origin-aware common-deletion consumer as the
anchored and reciprocal-common arms.  Its original pair, fixed rows, and exact
one-inside/one-outside overlap split remain available until that consumer has
actually fired.

`r-coherent-continuation-collapse/CoherentContinuationCollapse.lean` gives a
useful coverage projection:

- every anchored transition, whether terminal-hit or minimal-cycle, has an
  off-surplus row-external common deletion;
- reciprocal common deletion already has the same generic packet shape;
- radius-spent-at-entry already has that shape; and
- reciprocal criticality is swapped `FA-UNIQ4`.

This proves that terminal-only metric equality and a separate spent-entry
construction are not needed merely to *produce a continuation*.  It does not
make `CommonDeletionTwoCenterPacket` the load-bearing closure interface.
`common-deletion-consumer/successor_cycle_countermodel.py` realizes a genuine
periodic successor orbit in the stated geometry-free abstraction, and the
source reports identify terminal, coherent-source, reciprocal, and spent data
lost by the generic projection.  Therefore
the source-current normal form strengthened to the checked
`OriginTaggedCurrentFirstApexFixedRadiusNormalForm` is the coordinator consumed
by the final R theorem.  `ResolvedCurrentFirstApexFixedRadiusNormalForm` and
the generic collapse are coverage audits and regression aids only.

`r-branch-coverage-audit/REPORT.md` and `matrix.json` now make the exact
coverage boundary machine-readable.  The deepest current F2 sink lies on the
strict path

```text
coherent R
  -> anchored origin
  -> R.firstCenter = p
  -> failure of the two-off-live antecedent
  -> F2
  -> support-heavy
  -> both q-critical
  -> MetricResidual.
```

Only the last metric arm on that path is eliminated.  In particular,
F1/F2/F3 is available only after the equality `R.firstCenter = p`; the full
parent does not force that equality.  The complementary coherent branch has
only the checked upper bound

```text
card (R.sourceRow.support ∩ {q,t1,t2,t3}) <= 2.
```

The audit also records that the current `Resolved...` projection drops the
`ReciprocalDirectedCrossResidual` witness from reciprocal common deletion and
drops the frontier, spent-entry witness, deleted-source identity, and exact
first center from the spent apex-to-apex branch.  It is therefore not yet a
strong enough producer boundary for the final consumer.  Support-heavy remains
load-bearing, but it does not cover the unaligned coherent branch, the
two-off-live positive branch, F1, F3, F2 live-heavy, F2 mixed, reciprocal
common deletion with its source witness, spent apex-to-apex deletion, or the
remaining support-heavy continuations.

The current coherent-R work queue is now:

1. **DONE-CHECKED-SCRATCH:** use
   `OriginTaggedCurrentFirstApexFixedRadiusNormalForm` and
   `OriginTaggedCoordinatorEliminator` from
   `r-origin-tagged-coordinator/OriginTaggedCoordinator.lean`.  They retain
   the anchored transition and row-external source, reciprocal residual and
   exact continuation witness, and spent frontier/witness with its
   apex-to-apex source identities.  Do not replace this boundary by a
   universal `CommonDeletionTwoCenterPacket → False`;
2. **DONE-CHECKED-SCRATCH BRANCH SHAPES:** use the new unaligned,
   origin-aware two-off-live, common F1/F3, and native anchored F2
   support-heavy handlers.  They retain the fields erased by the generic
   packets and identify their exact next producers.  In particular, do not
   reintroduce the lossy `AlignedPrescribedCriticalPair` surface for the
   two-off-live arm, and do not cast the anchored
   `alignedSharedRowPacket` through `commonDeletionAtLiveCenter`;
3. **DONE-CHECKED-SCRATCH SMALL-CARD BYPASS:** use
   `smallCarrier_routes_to_protectedFrontier`.  Through card thirteen the
   parent routes directly to original or swapped `FA-UNIQ4/FA-UNIQ5`; do not
   enter the R coordinator on those cards.
4. **CURRENT / OPEN-MATHEMATICS FROM CARD FOURTEEN:** instantiate the native
   origin-aware coordinator at `Goal := False` only on the residual where both
   non-surplus caps have cardinality at least six.  The narrow open producers
   are the
   unaligned common-cap multiplicity packet; the radius-classified
   two-off-live successor, now reduced to full single-deletion robustness at
   `S.oppApex2`, with its pair arm already routed to swapped `FA-UNIQ4`; the
   small-cap robust case is already routed to swapped `FA-UNIQ5`, so only the
   large-cap robust residual remains; the shared F1/F3 arm is already reduced
   to swapped `FA-UNIQ4`, swapped `FA-UNIQ5`, or
   `6 ≤ S.oppCap2.card`; anchored F2 live-heavy/mixed now retain exact
   original-`q` generated rows, their raw q-deleted/q-critical constructors,
   two-off-live support deficits, and the outside-middle-successor versus
   both-support-only-hits split.  Uniform named-hit mining is retired.
   Live-heavy also has a checked cap-escape/`False` alternative and a
   pair-level cross-survival/metric classifier, and its confined constructor
   is now eliminated at both named centers.  The actual native callback now
   constructs both full-parent successor surfaces, so the retained
   cap/MEC/frontier/origin contract is not an assumed scratch island.  The
   paired successors start with an exact five-way source split; the entire
   equal-source-at-live-center metric constructor is closed, and the old
   second-apex constructor is further reduced to two concrete reroutes.  The
   current q-deleted frontier therefore carries the five-way
   `PostmixSourceSplit`: distinct sources, two oriented cross-survival arms,
   or outside-middle reroute at `x`/`y`.  Each source also has an honest
   cap/rank trichotomy: outside `oppCap2`, opposite companion omitted, or a
   certified opposite-side rank move.  The
   q-critical/q-critical `MetricResidual` arm is closed at the full-parent
   boundary by perpendicular-bisector localization plus `q ∉ M.verts`.
   The remaining live-heavy work is therefore to consume the surviving
   constructor/continuation arms together with the source and rank splits;
   one whole original `SourceSplit` constructor is now terminal.  Q-critical
   cross survival reaches the existing global-source-selection normal form,
   and `DeletedBlockerApexAlignment` is closed, leaving exactly the two
   escape/common-deletion orientations, `ApexDoubleCriticalResidual`, and
   relocated-blocker common deletion.  Its source/rank refinement proves that
   an equal chosen source forces at least one opposite companion omission.
   Distinct/cross arms still target the audited repeated common outside-cap
   pair or those exact global-source endpoints.  Do not mine
   `StrictOppCap1CommonHit`, the surplus-heavy completion equality, or the
   three reverse equalities on the closed live-center branch: all three
   targets now have checked wrong-polarity/impossibility results.
   In the second-apex equilateral arm, the exhaustive constructor split and
   the mixed collinearity eliminator close both homogeneous and both mixed
   constructor pairs.  Every surviving outcome is now a source-faithful
   non-apex outside-middle reroute, and the reduced frontier carries that
   reroute explicitly.  The history-retaining reroute classifier proves that
   an outside-`oppCap2` source is omitted by the opposite row, while an in-cap
   source carries a certified opposite-side rank move.  A rank move still
   needs one fixed cap presentation across steps, a cross-step center-index
   link, a decreasing measure, and a cycle-wide no-wrap theorem; the
   outside/omitted arm still needs a different direct sink.
   Mixed must remain split by its physical and generated constructors.  In the
   mixed confined classifier, physical-q-critical/generated-q-critical and
   every physical-q-deleted cell with the third middle-row live hit close by
   three common points.  Three exact two-common-point residuals remain:
   physical-q-critical/generated-q-deleted, and the two
   physical-q-deleted constructors with the third live hit omitted.  The
   eight anchored support-heavy callbacks, reciprocal F2, and spent F2
   remain separate.  The final theorem must visibly cover every origin and
   branch.  Closing only one nested packet is not the R eliminator;
5. within the aligned F2 support-heavy leaf, continue only from the audited
   generated-row boundary.  The
   theorem-bank match is complete and has zero direct consumer; every
   q-deleted/q-critical row generated at a support-heavy center has two points
   outside the actual deleted-source dangerous triple, while the actual
   deleted source lies in strict `oppCap1`.  Both q-deleted and q-critical
   constructors now have a genuine off-`T`, off-`oppCap2` escape; the unique
   q-critical boundary-absorption residual is closed by the actual blocker
   row and ordered-cap uniqueness.  The live-role audit further reduces each
   escape to off-live/off-middle or one of `q,t1,t2,t3`, and excludes the
   coherent predecessor in the q-critical constructor.  Produce the second
   incidence needed by an ordered-cap/U5 sink or consume the resulting
   cross-deletion-survival/`MetricResidual` trichotomy.  In the
   both-q-critical constructor the metric arm is already closed, leaving an
   exact cross-survival q-deleted row; the other three constructor
   combinations still retain their metric arms.  The source-indexed
   radius and deleted-source pair-row audits are complete negative gates:
   `FreshRetainedRadiusTransport X` is already refuted by support
   disjointness, and every `X.point`-centered row omits at least one of the
   named support-heavy witnesses.  Do not substitute `G \ T` for
   `G \ live`, and do not target either forbidden equality as though it were
   an available producer; and
6. combine the branch-complete R eliminator with the protected
   packet-polymorphic
   `FA-UNIQ4` / `FA-UNIQ5` direct-`False` results.

No production `sorry` has closed.  Do not restart anonymous
support/fixed-class CEGAR or erase origin data before the common-deletion
consumer.  The F2 support-heavy work is a nested branch contribution, not a
branch-complete parent route.  The reciprocal critical arm is a checked
dependency edge into the protected owner lane.  The protected paused
`FA-UNIQ4` / `FA-UNIQ5` lane remains a separate final-closure dependency.

## Change control

This document supersedes ad-hoc status narration. Any status change must update
both this plan and `docs/closure-matrix-2026-07-09.md`, cite a source artifact
or kernel query, and distinguish source-current evidence from the last compiled
kernel snapshot. A row is DONE only when its stated consumer and acceptance
gate pass; a successful exploratory script is evidence, not proof closure. The
archived 2026-07-06 plan is not updated with new status; retain it only as
dated provenance and update this plan, the matrix, and the active source links.
