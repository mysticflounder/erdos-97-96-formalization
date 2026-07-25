# All-large-caps terminal: route inventory and negative results

Date: 2026-07-24. Scope: the single live obligation on the Problem 97 spine
after commit `744e7b1b`.

## The obligation

`Problem97.ATailFrontierLiveClosure.false_of_frontierAllLargeCapsBiApexRobustResidual`
— `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:240`.

Hypotheses, in order: `F : CriticalPairFrontier D S radius H`,
`R : FrontierCommonDeletionParentResidual F` (`minimal`, `noM44`,
`carrier_card_gt_nine`, `frontierRadius_class_card_ge_four`, and a retained
two-source common-deletion packet at the first physical apex),
`B : FrontierBiApexRobustResidual R` (`secondApex_robust :
FullyDeletionRobustAt D S.oppApex2`),
`L : FrontierLargeOppositeCapsBiApexRobustResidual B` (`6 ≤ S.oppCap1.card`,
`6 ≤ S.oppCap2.card`), and
`N : FrontierAllLargeCapsBiApexRobustResidual L` (`6 ≤ S.surplusCap.card`).

All three caps have cardinality at least six. With the cap-sum identity
`|surplusCap| + |oppCap1| + |oppCap2| = |A| + 3` this forces `15 ≤ |A|`, with
no upper bound. Cap-size lower bounds alone therefore only raise `|A|`; they
can never contradict.

Consequence worth stating once: `A \ S.surplusCap` has at least nine points on
this branch, since `|surplusCap| = |A| + 3 - |oppCap1| - |oppCap2| ≤ |A| - 9`.

## Spine status, and a tooling rule that produced a false reading

`proof-blueprint index --refresh` does **not** refresh the call-graph edges.
Those live in a separate refs table. Until `proof-blueprint refs --refresh`
runs, newly added declarations are "never mined" and `proof-blueprint spine`
reports missing edges.

Observed here: after `744e7b1b` added `false_of_frontierAllLargeCapsBiApexRobustResidual`
and rewrote `false_of_frontierLargeOppositeCapsBiApexRobustResidual` to call
it, `spine` labelled the parent anchor `[closed]` and listed the new `sorry`
under "off-spine sorries", while `proof-blueprint axioms` on that parent
correctly reported `sorryAx`. `refs --check` showed 25 symbols never mined;
after `refs --refresh` (142 edges) the anchor flipped to `[open]` and the new
`sorry` became an on-spine open obligation.

**Rule.** After any Lean edit that adds or renames declarations, run
`index --refresh` then `refs --refresh`, and cross-check with
`proof-blueprint axioms <symbol>`. Never report `[closed]` from `spine` alone.

The commit message of `744e7b1b` claims the parent is `[closed]` on the
kernel-mined spine. That claim is withdrawn: the parent reaches `sorryAx`
through the new residual. What `744e7b1b` does establish is unaffected —
every profile containing a five-point cap is dispatched, which is all of
cardinality fourteen, and the least surviving profile is `(6,6,6)` at fifteen.

## Route inventory

Produced by a read-only sweep of this repo plus the sibling trees
`p97-rvol`, `erdos-97-96`, `erdos/97`, `erdos-general-theorem/97`, and the six
`certificates/*_mining.json` registries. Import status is relative to the
transitive import closure of `Erdos9796Proof.P97.ATail.FrontierLiveClosure`
(112 modules up, 41 down). **DOWNSTREAM** means the module imports the target
transitively, so using it would create an import cycle — unusable, not merely
unimported.

Three entries below were read and confirmed verbatim at the cited lines; they
are the load-bearing ones.

### The general-k cap/class ladder exists, and is `private`

Only the `k = 4` and `k = 5` rungs are public
(`oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four`,
`..._le_five_of_cap_card_eq_five`). There is no cap-six rung and no
`SelectedClass ... .card ≤ cap.card` statement anywhere in any of the trees.

The general engine is one visibility modifier away — CONFIRMED, read at the
line:

- `selectedClass_card_le_of_small_cap` —
  `lean/Erdos9796Proof/P97/ATail/CapApexRadiusRigidity.lean:46` — module is
  IMPORTED, declaration is `private`:
  `(S : SurplusCapPacket A) (hconv : ConvexIndep A) (i : Fin 3) (hr : 0 < r)
  (hinterior : (S.capInteriorByIndex i).card ≤ n) :
  (SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ n + 2`.

With the public `capInteriorByIndex_card_add_two`
(`CapApexRadiusRigidity.lean:31`, `(S.capInteriorByIndex i).card + 2 =
(S.capByIndex i).card`) this yields
`(SelectedClass A (S.oppositeVertexByIndex i) r).card ≤ (S.capByIndex i).card`
for every index and every positive radius. The supporting public pieces
(`leftAdjacentCap_at_opposite_card_le_one_of_convexIndep`,
`rightAdjacentCap_at_opposite_card_le_one_of_convexIndep`,
`selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`) are all IMPORTED,
so the general bound can also be restated without touching the private lemma.

Not yet landed: it would be off-spine until a consumer in the terminal exists.

### No three-large-cap contradiction exists

Nothing in any tree, and nothing in the mining registries, has hypotheses
bounding all three caps from below and concludes `False` or a removable
vertex. A parse of all 16,744 declarations under `lean/Erdos9796Proof` found
exactly two carrying two or more cap-cardinality-≥5/6 hypotheses, and neither
concludes `False`:

- `carrier_card_ge_fourteen_of_both_opposite_caps_ge_six` —
  `.../P97/ATail/OrientedPhysicalApexIngress.lean:119` — IMPORTED.
- `largePhysicalRadius_or_exactTwoFourRadii_of_robust` —
  `.../P97/ATail/OrientedPhysicalApexIngress.lean:506` — IMPORTED.

There is also **no general-n cap-cardinality upper bound** in the corpus. The
nearest, `surplus_card_le_six_of_convexIndep_K4`
(`.../P97/CapSelectedRowCounting.lean:765`), requires `S.IsM44`, which pins
`|A| = |cap| + 5` and is exactly what `R.noM44` forbids.

The one general-n counting law that is IMPORTED and applies to any indexed cap
is `orderedCap_card_add_four_le_choose_outside`
(`.../P97/CapSelectedRowCounting.lean:579`), instantiating to
`c + 4 ≤ C(|A| − c, 2)`. At `|A| = 15`, `c = 6` this reads `10 ≤ 36` — slack,
so it does not refute `(6,6,6)`. It binds only when `|A| − c` is small.

`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
lives at `p97-rvol/lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77`, has zero
importers even inside `p97-rvol`, carries **no cap hypotheses at all** (it is a
five-point metric pattern closed by a Gröbner `linear_combination`), and this
repo's own mining doc disclaims it as a two-large-cap closure —
`docs/general-n-certificate-bank-mining-2026-07-09.md:430`, 3,713 misses among
4,000 constrained cubes.

### Descent via minimality: exactly one usable bridge

CONFIRMED, read at the line:

- `CounterexampleData.not_isRemovableVertex_of_minimal` —
  `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:164` — IMPORTED —
  `(hmin : D.Minimal) : ∀ x : ℝ², ¬ IsRemovableVertex D.A x`.

`IsRemovableVertex A x := x ∈ A ∧ HasNEquidistantProperty 4 (A.erase x)`
(`.../P97/SmallerCounterexample.lean:26`). So the descent route is: manufacture
a removable vertex from the three large caps, then apply the bridge to
`R.minimal`.

Every *named producer* of a removable vertex is unusable from here.
`removableVertexOfLarge_of_nonIsM44`, `RemovableVertexOfLarge`,
`descent_contradicts_minimality`, and all of `RemovableVertexAxiom/*` are
DOWNSTREAM (they import the target transitively via `U1LargeCapRouteBTail`).
The general-n producer `exists_removableVertex_of_twoLargeCaps`
(`.../P97/U1LargeCapRouteBTail.lean:2602`) additionally rests on the `sorry`
at `.../U1LargeCapRouteBTail.lean:2578`. The remaining producers
(`C5D3B.*_removable_of_u3`, `U5ModeADeletion`) are `IsM44`-gated.

`removableVertex_of_selectedClass_erase_witnesses`
(`.../P97/RemovableVertexAxiom/Base.lean:81`) is DOWNSTREAM but its proof is
two lines, so it is re-derivable in place: from
`∀ p ∈ A.erase x, ∃ radius > 0, 4 ≤ (SelectedClass (A.erase x) p radius).card`
conclude `IsRemovableVertex A x`.

### Two-center equidistance laws: rich and largely general-n

The strongest IMPORTED, general-n, fully proved member — CONFIRMED, read at
the line:

- `U2NonSurplusSqueeze.oppCap2_escape_gen` —
  `lean/Erdos9796Proof/P97/U2NonSurplusOneHit.lean:273`:
  two distinct carrier points outside the surplus cap cannot share both
  opposite-apex radii. Equivalently `x ↦ (dist x S.oppApex1, dist x S.oppApex2)`
  is injective on `A \ S.surplusCap`. Proof is a reflection/side-sign
  argument via `twoCircle_midpoint_collinear` and `signedArea2_reflection_neg`.

This is the general-n kernel that the `sorry`-ed
`DoubleApexOffSurplusSharedRadiusPair` was aiming at, and it is already proved.

Also IMPORTED and general-n: `outsidePair_unique_capCenter`
(`.../P97/CapSelectedRowCounting.lean:283`),
`ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior`
(`.../P97/ATail/TwoCenterCapLocalization.lean:106`),
`twoCircle_sameSide_reflection_false_of_not_mem_capByIndex`
(`.../P97/SurplusM44Packet/Shard01.lean:665`, works at *any* cap index),
`Dumitrescu.perpBisector_apex_bound` (`.../P97/Dumitrescu/L1.lean:128`, at most
two carrier points bisect any chord in convex position), and
`eq_of_equidistant_three_noncollinear` (`.../P97/U5GlobalIncidenceBasic.lean:129`).

`false_of_two_cap_centers_equidistant_outside_pair`
(`.../P97/ATail/TwoCenterCapLocalization.lean:60`) is the packet-level
repackaging and is `private` — the second visibility blocker.

Cycle-free additions available if wanted: the four-arrangement Kalmanson
parity family `false_of_two_centers_equidistant_pair_{after,enclosed,split,
before}` (`.../P97/ATail/TwoCenterBisectorParity.lean:53,74,112,134`), which
jointly cover every linear arrangement of two centers against a chord; and the
indexed-cap K-Q3-5 kills `q3_shared_interior_false_of_indexed_cap{,_unoriented}`
(`.../P97/Q3SharedInterior.lean:709,750`).

## Negative results from this session

### Mirror-antitonicity gives no pair-count bound

EMPIRICALLY VERIFIED. The audited law (commit `e96cbce0`) says that for two
centers `z1, z2` with the two open arcs between them, disjoint pairs
`{u_i, v_i}` with `u_i` in one arc and `v_i` in the other, each pair
equidistant from both centers, the matching `i ↦ (u_i, v_i)` must be antitone.

Run under the lane's support-local family (positivity, strict triangle on all
triples, both strict Kalmanson inequalities per cyclic 4-subset): the fully
antitone matching is SAT at `m = 2,3,4,5,6,7,8`, support up to 18, each in
under a second. Control reproduces the audit — at `m = 2` one of two matchings
is SAT, at `m = 3` one of six, in both cases the antitone one.

So there is no law of the form "at most `M` doubly-equidistant mirror pairs
across two centers". Mirror-antitonicity is a pure forced-order constraint, and
any contradiction built from it needs *competing* order constraints.

### The simplest competing-order configuration is satisfiable

EMPIRICALLY VERIFIED. Three centers on a cycle, one mirror pair per center
pair, pairs disjoint (support 9): of 88 configurations forming 16 canonical
classes, 13 are SAT and 3 UNSAT. All three UNSAT hits reduce to a single
minimal core of 4 atoms on support 7 — two mirror pairs across two center pairs
that share a centre — and that core is already present in the earlier
`k = 7`, ≤5-atom enumeration. It is *absent* from the mined 802-schema bank,
which is further evidence of that bank's incompleteness rather than a new law.

Restricting to the shared-centre configuration on seven points, only one of the
four disjoint placements is infeasible; its mirror image is satisfiable, so the
constraint is orientation-sensitive rather than a symmetric prohibition.

Conclusion: the three-centre antitonicity conflict does not by itself yield
`False`. This does not rule out contradictions at larger pair counts or atom
counts; it does rule out the simplest form.

### Atlas completeness boundary

The complete pure-equality atlas (`complete-schemas-census.json` in
`scratch/atail-force/lcap14-global-parent-surface/`) is complete at support
`k = 4, 5, 6` for at most 6 atoms — 7 / 405 / 11,245 canonical classes,
`stopping_condition` "max-atoms cutoff at 6" at each level. Any genuinely new
pure-equality law must therefore have support at least 7 or at least 7 atoms.

## In flight

An equality-only CEGAR over the smoke-validated Boolean layer, deciding
whether *any* pure-equality bank can close this branch. On each layer model it
asserts only the model's equality atoms under the support-local axiom family:

- SAT means the equality set is metrically realizable, so no pure-equality
  schema instance of any support is present, and a pure-equality bank however
  complete cannot refute that pattern — forced-equality (disequality-consuming)
  laws would be mandatory.
- UNSAT yields an unsat core over the equalities, which *is* a pure-equality
  law; it is minimized, its dihedral orbit blocked, and the loop repeats.

The loop only ever blocks pure-equality laws, so it terminates in
`DECISIVE-SAT` (pure-equality banks insufficient), `LAYER-UNSAT` (a
pure-equality bank suffices at that cardinality, and the mined laws are the
bank), or `BUDGET`.

Layer encoding validated by its own smoke test before use: base layer SAT,
forcing `nr[O1]` gives UNSAT, the S4-instance oracle is UNSAT with the expected
core, the empty pattern is SAT.

First 40 iterations at `n = 15`, profile `(6,6,6)`: `BUDGET`, 40 distinct laws
mined, all orbit-blocked, supports 6–11 and 4–10 atoms. No `DECISIVE-SAT`
yet, so no evidence at `n = 15` that pure-equality laws are insufficient. Most
mined laws lie outside both the 802-schema bank and the complete ≤6-support
atlas. Longer runs at `n = 15` `(6,6,6)` and `n = 18` `(6,7,8)` are in
progress; at `n = 18` orbit blocking exceeds the clause cap for most laws and
falls back to instance-only blocking, which is sound but too weak to converge —
that run is only probative for a `DECISIVE-SAT` hit.

Caveat on interpretation, stated because it bounds what a `DECISIVE-SAT` would
prove: the Boolean layer asserts necessary conditions on the branch, and it is
not established here that every layer model is realizable as an actual branch
configuration. A `DECISIVE-SAT` witness would need its own realizability check
against the packet hypotheses before it could be called a refutation of the
covering route.

## Faithfulness audit of the Boolean layer

An adversarial audit of `build_layer` against the Lean definitions, run
block by block with the instruction to find clauses *not* implied by the branch
hypotheses, returned **all eleven blocks SOUND** — no block unsound, none left
undetermined. So the layer is a genuine over-approximation and a LAYER-UNSAT
verdict transfers.

The specific leak worth recording, because it was the reason for the audit: the
`A` block is a plain inclusive disjunction `nr ∨ w5 ∨ w44`, so nothing textually
forbids `nr[y] ∧ w44[y]`, which would break the non-removability reading of `H`.
It is nevertheless unsatisfiable. If `y` carried a second co-radial four-set
disjoint from its `nr` class, the `N`-uniqueness clauses force all four of its
members into the `m` set, and then some five-subset of `m`-true literals
violates the `N` at-most-four clause. Symmetrically `nr[y] ∧ w44[y]` forces at
least four `g1`-true and four `g2`-true literals into `m`, so either at-most-four
fires or the co-radiality clause forces `ev` on a `g1 × g2` pair, contradicting
the cross-non-co-radiality clause. Hence in every model `nr[y]` entails that `y`
has exactly one class of size at least four, of size exactly four, equal to its
`m` set — and `h[(x,y)]` does encode "erasing `x` destroys `y`'s only
four-class". No extra binary clause is needed.

Consequently the `H` block is the encoding of the branch's minimality content:
`R.minimal` with `not_isRemovableVertex_of_minimal` gives
`¬ HasNEquidistantProperty 4 (A.erase x)` for every `x`, whose failure point `p`
must have exactly one four-class and it must contain `x`. **The equality-only
CEGAR is therefore testing the descent route, not only the covering route** — a
LAYER-UNSAT would say no configuration at that cardinality and profile can have
every vertex non-removable.

Two findings to carry forward:

- The `C` block's comment miscites `selectedFourClass_inter_capByIndex_card_le_two`
  (`.../P97/CapSelectedRowCounting.lean:257`), which only constrains radii
  carrying a support-exactly-four class. The clause as encoded forbids in-cap
  co-radial triples at *any* radius. That stronger form is still branch-implied,
  but by the radius-generic `sameRadiusIndices_card_le_two`
  (`.../P97/CapSelectedRowCounting.lean:53`) together with
  `capByIndex_cgn4g_capData` and `oneSidedDistanceInjective_of_mecCapPacket`.
  The triple rendering itself is exactly "at most two", not stronger.
- The `X` block is `OrderedCrossRowCore.false`
  (`.../P97/ATail/CriticalFiberClosingCore.lean:117,155`). Its proof consumes
  only six carrier points at increasing CCW indices plus three distance
  equalities; the shell-system provenance fields are not load-bearing, which is
  what licenses the clause's projection onto `h`, `m` and `ev` literals.

**Two named assumptions** that a LAYER-UNSAT write-up must state, both
elementary consequences of `ConvexIndep` that the audit attacked and could not
break, and neither backed by a Lean lemma:

1. *Cap contiguity.* Each cap is a single contiguous arc of the convex vertex
   cycle. Caps are closed chord-side filters and a closed half-plane cuts a
   convex polygon's vertex cycle in one arc.
2. *Per-side bisector bound.* At most one vertex on each side of a chord `uv`
   is equidistant from `u` and `v`. Lean has only the total bound of two
   (`Dumitrescu.perpBisector_apex_bound`, `.../P97/Dumitrescu/L1.lean:128`).

The blocked metric laws' own soundness was stipulated, not audited: the oracle's
axiom family is valid for convex-position carriers, and the dihedral orbit
instantiation respects the cyclic-order semantics.
