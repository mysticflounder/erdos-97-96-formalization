# Round-5 theorem-bank audit for the retained-omission E1 core

## Scope and trust boundary

Target:

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_retainedOmission_triApexAllLarge_core
```

The proof-blueprint anchor is set to this declaration. The live interface is:

```lean
(R : FrontierCommonDeletionParentResidual F)
(Q : RetainedOmissionAllLargeNormalForm P)
(G : TriApexAllLargeContext D S) : False
```

This is a source-only theorem-bank and producer audit. It makes no production
Lean edits and runs no Lean/Lake build. `source-proved` below means only that
the registry found no `sorry` in that declaration body; it is not automatically
a transitive kernel verdict.

## Bottom line

No existing banked theorem closes either Q arm from the data currently exposed
by Q and G.

The fresh arm already contains a genuine two-center/two-hit configuration: the
first apex and the blocker of `O.deleted` are both equidistant from
`O.kept,O.deleted`. The new
`Problem97.CGN.index_strictly_between_of_equidistant` theorem localizes the
blocker strictly between those two cap points. This is the *allowed*
alternating placement, not one of the four forbidden placements consumed by
`TwoCenterBisectorParity`.

The first genuinely missing producers are:

1. **fresh arm:** a third carrier point on both the first-apex radius and the
   deleted-source full critical shell, or a second center on the same pair in a
   forbidden nonalternating interval;
2. **paired arm:** an earlier positive cross-row incidence producing a second
   common hit for one apex/blocker pair (or the equivalent four-vertex
   Kalmanson equality closure);
3. **tri-apex route:** two rich-slice hits of one canonical shell in each of two
   distinct indexed caps, so the same center is forced into disjoint cap
   interiors;
4. **cover route:** a quantitative upper bound or injection controlling
   `notRobustCenters`; G's scalar cover inequality alone cannot close.

These are producer gaps, not wrapper gaps.

## Exact Q-arm geometry

Write `k = O.kept`, `d = O.deleted`, `a = S.oppApex1`, and
`bd = H.centerAt d`. Both `k,d` lie on the selected radius about `a` and in
the first strict cap interior.

### Paired common deletion

The exposed full-shell facts are asymmetric omissions:

* `d` is not in the full critical shell selected at `k`;
* `k` is not in the full critical shell selected at `d`.

The two `CommonDeletionTwoCenterPacket`s provide q-deleted four-subsets, but
their first rows are not full ambient shell classes. Their support complements
cannot be promoted to ambient circle nonmembership. Consequently Q does not
identify a second common hit for either `(a, blocker(k))` or
`(a, blocker(d))`.

### Reverse-hit/fresh common deletion

Here Q proves:

```text
k,d are on the first-apex circle;
k,d are on the full critical shell centered at bd;
bd,k,d lie in the first strict cap interior;
fresh is not on the bd shell.
```

Thus `(a,bd)` is a real two-center/two-hit pair on the chord `{k,d}`.
`index_strictly_between_of_equidistant` places `bd` strictly between `k,d` in
the ordered cap. Convexity places `a` on the complementary side of the chord,
so this is precisely the legal alternating arrangement. The banked

* `false_of_two_centers_equidistant_pair_after`,
* `..._enclosed`,
* `..._split`, and
* `..._before`

theorems in `ATail/TwoCenterBisectorParity.lean` all require a forbidden
nonalternating order and do not apply.

The fresh packet supplies two surviving q-deleted rows, but no fact places
`fresh` on the apex circle or a third point on both the apex circle and the
`bd` shell. This is the exact gap before the strongest shared-base consumer.

## Best reusable consumers found

| declaration | location/status | what it would consume | missing producer |
|---|---|---|---|
| `Problem97.u2_sharedBase_family_contradiction` | sibling `p97-rvol`, `U2BaseChordProduction.lean:101`; registry `source-proved`, RVOL-reachable | two distinct centers sharing `e1,e2,w`, with `w` off the base chord | in the fresh arm, `k,d` supply `e1,e2`; need a third common carrier point `w` on both full classes. Convex independence supplies off-chord once `w` is distinct |
| `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction` | sibling `U1TwoLargeCapObstruction.lean:77`; source-proved, not RVOL-reachable; documentation records kernel-clean core axioms | a particular five-point pattern of seven distance equalities | a completeness theorem instantiating that exact pattern from Q+G; it appeared in only 287/4000 stored constrained cubes |
| 18 U1 source-unit consumers | eight sibling ordinal modules, unimported | a `RowSlotLabelPacket` or `AllEightSlotMetricCore` matching a certified ordinal | row-slot placement and explicit equality producer; Q+G does not expose those labels |
| 96 U5 class incompatibilities, backed by 88 metric and 112 scalar kernels | sibling `U5GlobalIncidence...` bank; representative class theorem freshly kernel-clean in the registry audit | a fully classified bounded U5 incidence packet | classification of the live Q packet into one of the incompatible families |
| `CriticalShellSystem.off_row_named_label_forbidden` and class/shell variants | current-repo equivalents exist in `U1CarrierInjection.lean` | forbids a named label only after an equal-distance premise identifies the row label | positive equal-distance/cross-incidence premise; this theorem does not create one |
| `criticalShellCenter_mem_capInteriorByIndex_of_two_hits` | current `FrontierLiveClosure.lean:6611` | two hits of one rich indexed slice in a full canonical shell | for two-cap contradiction, two such hit pairs for the same shell at distinct indices |
| `index_strictly_between_of_equidistant` | current `CapSelectedRowCounting.lean:51`; separately banked source-clean | exact ordered-cap position of a co-hit center | a second center in a forbidden interval, or an extra co-hit relation |

## Consumers that must not be treated as clean closures

`DoubleApexOffSurplusSharedRadiusPair` in the sibling U1 tail contains a source
`sorry`. `exists_removableVertex_of_twoLargeCaps` is syntactically
`source-proved` but calls that open theorem, so it remains transitively
`sorryAx`-dependent. Its public wrapper does not repair that dependency.

`strictOppCap_card_le_two` assumes the M44 short-shell regime and is irrelevant
to the all-large non-M44 E1 context.

The stale C5D3B families are not portable bank results: the registry audit
records fresh-build declaration conflicts/failures.

The legacy and grouped-relaxed registries contain no declaration mentioning
`notRobustCenters`, `FullyDeletionRobust`, or an equivalent quantitative
nonrobust-center bound. No banked theorem upgrades

```lean
D.A.card <= 4 * (notRobustCenters D).card
```

to a contradiction.

## Power-rank result

The companion exhaustive named-pattern audit is
`../power-rank-q-arms/REPORT.md`. It found:

| arm | corrected 5x5 power hit | 4x4 row-difference hit | largest named fooling set |
|---|---:|---:|---:|
| paired | 0 | 0 | 3 |
| fresh | 0 | 0 | 2 |

The existing `Census554/CirclePowerMatrix.lean` already banks the sound rank-4
and unique-possible-matching determinant consumer. The obstruction is again
producer-side: in the paired matrix the rows for the frontier/apex packet
circles have possible nonzeros concentrated in one named column, and in the
fresh matrix the defect is worse. A valid 5x5 certificate needs at least two
new certified ambient off-circle facts in distinct columns. Complements of
chosen packet `B1` four-subsets are not such facts.

## Why G does not currently force the missing hit

`G.apex_rich` is existential at each indexed apex. It neither identifies its
rich slices with a Q packet row nor requires a Q full shell to meet two of
those slices. `G.cap_card_ge_six` supplies room, not incidence.
`G.no_center_covers_all_apices` forbids one very specific triple-apex radius,
but Q names no center covering even two of those apices. Finally,
`G.notRobustCover_card` has no independent bound on the number of nonrobust
centers.

The existing exact `n=15` paired-arm incidence survivor under
`scratch/retained-omission-e1/round2-smoke.json` is a regression witness for
this producer boundary: the encoded Q+G incidence/counting shadow is
satisfiable. It is not a Euclidean counterexample, but it rules out claiming
that a pure named-incidence consequence already forces the missing cross hit.

## Recommended next theorem target

The sharpest single positive producer is the fresh-arm third-hit statement:

```text
reverse-hit/fresh Q + tri-apex G
  -> exists w in A, w != k, w != d,
       w lies on the first-apex selected radius,
       w lies in the full critical shell centered at bd.
```

If true, `u2_sharedBase_family_contradiction` closes that arm after a small
port/import and convex-independence bridge. If it is false in the exact
Euclidean search, the next useful target is the weaker ordinal producer that
puts another co-hit center in one of the four forbidden
`TwoCenterBisectorParity` arrangements.

For the paired arm, do not start with the U2 consumer: the first missing fact is
still a second common hit. The stable arm-neutral target remains the
four-vertex equality-closure producer described in
`../general-critical-shell-cover/REPORT.md`.
