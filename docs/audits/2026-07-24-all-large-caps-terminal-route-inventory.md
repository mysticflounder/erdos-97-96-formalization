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

## Consumer hunt for the shortest-side exclusion: negative

The shortest-side bi-equidistance exclusion
(`docs/shortest-side-biequidistance-exclusion-2026-07-24.md`) was pushed for a
consumer inside this terminal. It does not close it, and the specific mechanism
one would reach for provably does not exist here.

### The sharpening is real, and its target is named

Verified by reading source, not inferred:

- `CommonDeletionTwoCenterPacket.overlap_le_two`
  (`.../P97/ATail/CommonDeletionTwoCenter.lean:46`) is discharged at lines 94-95
  by `U5QDeletedK4Class.inter_card_le_two R₁ R₂ hcenters` — it is nothing but
  the generic two-distinct-circles bound. `B₁`, `B₂` are four-point co-radial
  rows at `center₁`, `center₂` inside `D.A.erase q`, and at this terminal the
  two centers are exactly `S.oppApex1`, `S.oppApex2`
  (`.../P97/ATail/OrientedPhysicalApexIngress.lean:246`).
- With the apex chord a shortest Moser side, the exclusion sharpens that bound
  from `≤ 2` to `≤ 1`.
- The half that was missing is precisely the surplus-cap-touching case. If
  `u, w ∈ B₁ ∩ B₂` then `u, w` are bi-equidistant at both apices, and
  `U2NonSurplusSqueeze.oppCap2_escape_gen`
  (`.../P97/U2NonSurplusOneHit.lean:273`) already refutes that when both lie
  outside the surplus cap. So `|B₁ ∩ B₂| = 2` already forces one of the two
  points into the surplus cap; the new law removes that escape.

### The WLOG rotation is a real Lean move

`redesignateFirstOppCapAsSurplus` and `redesignateSecondOppCapAsSurplus`
(`.../P97/ATail/FrontierLiveClosure.lean:55,155`) copy `hA`, `hncol`,
`triangleNonObtuse`, `hCirc` and `partition` unchanged and set only
`surplusIdx`. So the MEC triangle and its three inscribed vertices are invariant
across all three rotations, and the only side condition is the packet's
`surplus` field, `4 < (capByIndex i).card`, which holds for all three indices
when every cap has at least six points. The exclusion's hypotheses are
therefore literally packet fields: `triangleNonObtuse` is
`MEC.NonObtuseCircumscribedMoserTriangle`, and `hCirc` pins the inscribed case.
The surplus cap's chord endpoints *are* the two opposite apices (for
`surplusIdx = 0`, `surplusCap = C1` with `v2_mem_C1`, `v3_mem_C1`,
`v1_notin_C1`, while `oppApex1 = v2`, `oppApex2 = v3`; same for the other two
indices).

Caveat for any implementation: there is no lemma anywhere comparing the three
Moser side lengths, and no WLOG relabelling machinery. Identifying "the shortest
side" is a three-way `le_total` split — elementary, but new work.

### Why the counting collision does not exist

Injectivity of `x ↦ (d(v_a,x), d(v_b,x))` gives `n ≤ k_a · k_b` where `k_a`,
`k_b` count distinct radii at the two apices, plus
`k_b ≥ max_r |SelectedClass A v_a r|` and symmetrically. **Every one of these is
a lower bound on radius counts.** A contradiction needs `k_a k_b < n`.

An exhaustive sweep of this repo, the `p97-rvol`, `erdos/97` and
`erdos-general-theorem/97` trees, and the indexed Lean corpora found **no**
declaration bounding the number of distinct distances or radii from a point.
Structural reason: no `Finset ℝ` of radii exists anywhere in any tree, so the
cardinality is not currently expressible. Every "unique radius" statement in the
corpus is a hypothesis (`LargeCapUniqueFive.lean:36`,
`OrientedPhysicalApexIngress.lean:226`, `CriticalPairFrontier.lean:544`), or a
consequence of a *small cap*, or of `IsM44` (killed by `R.noM44`), or of a
*blocked deletion* — none available with caps ≥ 6 and both apices robust.
`largePhysicalRadius_or_exactTwoFourRadii_of_robust`
(`OrientedPhysicalApexIngress.lean:506`) is existential, not an upper bound.

This reproduces, from a different angle, the verdict already recorded in
`docs/audits/2026-07-13-atail-apex-filter-assessment.md:5-20`: "It cannot arise
from an upper bound on the opposite-radius image of one apex class: that image is
provably at least three." Confirmed against that file.

### Proposition A — the only radius-counting upper bound on the branch (PROVEN)

Let `S : SurplusCapPacket A`, `hconv : ConvexIndep A`, `i : Fin 3`, and
`c_i = (S.capByIndex i).card`. Then the number of distinct positive radii `r`
with `4 ≤ (SelectedClass A (S.oppositeVertexByIndex i) r).card` is at most
`⌊(c_i − 2)/2⌋`.

*Proof.* Distinct radii give disjoint classes. Each such class meets
`S.capInteriorByIndex i` in at least two points, by the public IMPORTED
`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`
(`.../P97/ATail/CapInteriorRadiusCounting.lean:27` — verified public, not
`private`). Disjointness gives `2m ≤ (S.capInteriorByIndex i).card`, and
`capInteriorByIndex_card_add_two` gives `(S.capInteriorByIndex i).card = c_i−2`. ∎

This strictly generalises `oppositeVertex_distinct_K4_radii_force_capInterior_card_ge_four`
from `m = 2` to arbitrary `m`, and is not in the corpus. On the `(6,6,6)`
profile it reads: **at most two K4-radii at each apex.**

It cannot supply the missing collision, because it bounds the number of
*K4-radii* — radii whose class has at least four points — whereas injectivity's
lower bounds are on the number of *distinct* radii. `K4` forces only one large
class per point, so `k_a` may be as large as `n−4`, and `(n−4)² ≥ n` for
`n ≥ 15`. **The two bounds constrain disjoint quantities and never meet.** The
cap bound `|class| ≤ c_i` pushes `k_a ≥ (n−1)/c_i`, i.e. the wrong way.

Dual counting is also slack. With `Dumitrescu.perpBisector_apex_bound`
(`.../P97/Dumitrescu/L1.lean:128`), summing over pairs gives
`Σ_z Σ_r C(|class(z,r)|,2) ≤ 2·C(n,2)`. Robustness forces a point's
contribution to at least 10, non-robustness to at least 6; at `n = 15` that is
`10·6 + 6·9 = 114 ≤ 210`.

### The apex bi-equidistance family is dead at the incidence level

An independent incidence abstraction at `n = 15`, apices at `0,5,10`, caps
`{0..5}` surplus, `{5..10}`, `{10..14,0}`, asserting K4 at every point, the
adjacent one-hit bounds at all three apices, full deletion robustness at both
opposite apices, the minimality covering condition from
`not_isRemovableVertex_of_minimal`, `perpBisector_apex_bound`, and the crossing
law below:

| variant | z3 |
|---|---|
| no shortest-side law, no in-cap bound | sat |
| + shortest-side law at the surplus chord | sat |
| + in-cap co-radial bound | sat |
| shortest-side law at **all three** chords, all three apices robust | sat |

EMPIRICALLY VERIFIED, and sound as a negative result: the model caps each point
at two rows, so a satisfying assignment of the restricted model is a fortiori
one of the unrestricted model. Saturating the entire apex-bi-equidistance family
leaves the abstraction satisfiable. This abstraction is *weaker* than the Boolean
layer above (no metric oracle, no Kalmanson), so it does not settle the layer —
but it does close off the family.

### Lemma C (crossing), and the master criterion

**Lemma C (PROVEN, elementary).** If `z₁ ≠ z₂ ∈ A` are both equidistant from
`u ≠ w ∈ A`, all four distinct, and `A` is in strictly convex position, then the
open segments `(u,w)` and `(z₁,z₂)` cross; equivalently `{u,w}` and `{z₁,z₂}`
interleave in the convex cyclic order.

The "opposite sides" half is `Problem97.twoCircle_sameSide_reflection_false`
(`.../P97/U2/WitnessReflectionKernel.lean:200`) and needs no convexity. The
interleaving half is the content of the four proved terminals
`false_of_two_centers_equidistant_pair_{after,enclosed,split,before}`
(`.../P97/ATail/TwoCenterBisectorParity.lean:53,74,112,134`), which cover the
four same-arc arrangements. Two free corollaries: injectivity at any chord whose
endpoints are cyclically **adjacent**, and `≤ 1` bisector point for any **hull
edge**, sharpening `perpBisector_apex_bound`. Neither helps here: the two
opposite apices are never adjacent, since the surplus cap has at least six
points so at least four lie strictly between them.

**Master criterion (PROVEN).** For `z₁ ≠ z₂ ∈ A`, `L = line(z₁,z₂)`,
`h = dist(O,L)`, coordinates with `L` the x-axis and `O = (0,h)`, `h ≥ 0`, and
`ζ₁ < ζ₂` the coordinates of `z₁,z₂`, set

    Reg(z₁,z₂) = {(x,y) : y > 0, x² + (y+h)² ≤ R², ζ₁ < x < ζ₂}.

The member of a bi-equidistant pair at `(z₁,z₂)` lying on the `O` side of `L`
belongs to `Reg`. So `A ∩ Reg = ∅` gives injectivity at `(z₁,z₂)`, and that
follows from `Reg ⊆ conv(V)` for any `V ⊆ A` disjoint from `Reg`, by
`ConvexIndep`. For the shortest Moser side this is exactly the proven law, with
`V = {v₁,v₂,v₃}` and `Reg ⊆ T`. Independently validated: over **100,147**
random non-obtuse inscribed triangles the algebraic criterion
`a(a+|p|) > hq ∨ q ≤ R−h`, the angle criterion `γ₃ > min(γ₁,γ₂)`, and the
geometric statement "the reflection of the minor segment across `v₁v₂` lies
inside `T`" agree with **zero mismatches**.

### Chord variants: all refuted, with witnesses at the branch profile

Scope note governing what a numerical refutation means: a candidate law of this
family may use only the geometric hypotheses (strict convex position, non-obtuse
inscribed Moser triangle, MEC containment, cap cardinalities). `K4` and
minimality cannot be used *and* tested — a configuration satisfying them would
refute Erdős 97. So a configuration meeting the geometric hypotheses and
carrying a bi-equidistant pair refutes the candidate.

Control first, against the proven law: 399,676 sampled mirror pairs across
Moser–Moser chords gave 71,657 realizable strictly-convex configurations, and in
**every one** the chord was not a shortest side — zero shortest-side
realizations. Repeated at `n = 15`, caps `(6,6,6)`: 388 hits, again zero with
the chord shortest. The generator finds configurations where they exist and none
where the law forbids them.

- **(a) Chord `(v_i, x)`, `x` a cap-interior point — FALSE.** 253
  branch-compatible hits in 3000 trials, across all nine (vertex, cap)
  combinations. Verified witness at `n = 15`, caps `(6,6,6)`, min hull cross
  `5.7e−5`, max angle `1.4249 < π/2`, residuals `−5.6e−17`, `−2.2e−16`.
- **(b) Two cap-interior centres in the same cap — FALSE.** 1 hit in 20,000
  trials; witness with min hull cross `1.54e−4`, max angle `1.4876`, residuals
  exactly `0.0`.
- **(c) Two cap-interior centres in different caps — FALSE.** 144 hits in 3000
  trials; witness with min hull cross `1.33e−4`.
- **Neighbour-localization strengthening — FALSE.** Of 431 verified
  non-shortest-side hits at `n = 15`, only 174 had the pair as the two cyclic
  neighbours of an endpoint; the rest sat at cyclic distance up to 4.

Reason, in the master criterion's language: for a Moser side both `z₁,z₂` lie on
`∂D(O,R)`, so the lens height vanishes at both ends of the strip and `Reg`
closes into the reflected minor segment, whose only possible `A`-point is `v₃`,
excluded by `q > R − h` (Step 5 of the law's proof). For any chord with an
endpoint strictly inside the disk the lens height there is strictly positive,
`Reg` acquires a corner at positive depth, and no subset of
`{v₁,v₂,v₃,z₁,z₂}` has `Reg ⊆ conv(V)`. The counterexamples occupy exactly that
region.

**Do not spend further effort on chord variants of the reflection law.**

### The one real gain, and it is off-spine

The sharpening's demonstrated value is case-elimination, not counting.
`frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one` bounds
`|B₂ ∩ (first-apex class minus the surplus cap)| ≤ 1`, and that off-surplus
restriction is why `FrontierSecondRowOffConfinementEscape` carries the
disjunctive field `point_mem_surplus_or_firstApexRadius_ne`
(`.../P97/ATail/FrontierCommonDeletionEscape.lean:220`). The new law removes the
restriction, giving `|B₂ ∩ SelectedClass A oppApex1 radius| ≤ 1` outright, which
makes `FrontierEscapeLocationOutcome.onRadiusSurplus` unreachable and collapses
`FrontierRefinedEscapeOutcome`
(`.../P97/ATail/FrontierCommonDeletionSurplusEscape.lean:490`) from three
constructors to one. This is the exact shape `oppCap2_escape_gen` cannot reach,
because the escape point is *inside* the surplus cap.

**No `sorry` shrinks.** The only sorries in all of `ATail/` are the two in
`FrontierLiveClosure.lean` (`:51`, `:249`); the whole escape subtree is already
closed. By the project's spine rule this stays unlanded until the collapsed form
is used inside the terminal. Proposition A is likewise unlanded.

## The closing statement

Unfolding `CounterexampleData.not_isRemovableVertex_of_minimal`
(`.../P97/U1TwoShortCapReduction.lean:164`): non-removability of every `x` means
that for every `x ∈ A` there is `p ∈ A` with a unique class of size at least
four, of size exactly four, containing `x`. Since each such class has exactly
four members, the non-robust set `B` must satisfy `4|B| ≥ n`. Hence

    (S1)   4 · |{p ∈ A : ¬ FullyDeletionRobustAt D p}| < |A|

closes the terminal immediately: covering fails, so some vertex is removable,
contradicting `R.minimal`.

Status of (S1): **genuinely open**, and outside the reflection/MEC technique's
reach. That technique produces per-chord exclusions attached to at most three
distinguished points, whereas (S1) is uniform over all `n` points. The
incidence-level witness above has `|B| = 9 > 15/4`, so (S1) is not derivable
from anything currently on the branch. Everything apex-local is now measured and
closed off.

## Blocking policy: the stall is clause count, and it is a hard ceiling

Measured at `n = 15`, profile `(6,6,6)`, with the shortest-side clause family
added, same layer (2534 vars / 162,085 clauses) in all three runs:

| policy | laws mined | wall |
|---|---|---|
| eager (whole dihedral orbit per law, up front) | 30 | 630 s, then stalls |
| lazy (only the violated placements of each model) | 8 | 440 s |
| hybrid (eager under a clause budget, lazy past it) | 24 / 28 / 30 | 110 s / 240 s / 752 s |

The hybrid reaches 24 laws in 110 s against the eager policy's 630 s for 30, so
per-law it is roughly six times faster while the database is small — one solve
absorbs an orbit instead of thousands of refine rounds. But it converges to the
same wall at **30 laws / ~2.4M clauses**, within 20% of the eager policy's
wall. The ceiling is clause-count-driven CDCL search hardness and is
**independent of blocking policy**; a better policy postpones it, it does not
remove it. Lazy enforcement was smoke-validated against eager enumeration:
with exactly one orbit member's atoms true it returns that member and nothing
else, an empty model returns nothing, and every returned clause is a genuine
orbit member.

A combined single-query formulation was also built and smoke-validated — the
Boolean layer as z3 `Bool`s plus the 105 distances as `Real`s under the
support-local family, linked by the one-way `ev(y,u,v) → d(y,u) = d(y,v)`, so
CDCL(T) derives each pure-equality law as a theory lemma instead of by clause
expansion. Both halves check out (the mined support-7 law UNSAT with all four
proper subsets SAT; z3's layer model satisfies all 110,608 DIMACS clauses on
independent re-evaluation in python). It produced no verdict within the session
at `n = 15` `(6,6,6)` or `n = 14` `(5,6,6)`.

**Scope limit, stated so it is not overread.** A `LAYER-UNSAT` at `n = 15`
would *not* close `false_of_frontierAllLargeCapsBiApexRobustResidual`. The
obligation is general in `n` with no upper bound on carrier cardinality; UNSAT
at `n = 15` refutes only cardinality 15 at profile `(6,6,6)` and hands back the
law set, leaving general-`n` coverage as a separate argument. `DECISIVE-SAT`
would kill the pure-equality covering route outright. Either way this is a
route-viability test, not a closure route.
