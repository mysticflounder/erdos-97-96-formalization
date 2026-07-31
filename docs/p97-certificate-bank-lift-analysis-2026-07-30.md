# P97 certificate-bank lift analysis (2026-07-30)

## Scope

Triggered by the question of whether `Problem97.FiniteN10Closure` can enter the
`comparator/` audit set. `comparator/config.json` pins `permitted_axioms` to
exactly `{propext, Quot.sound, Classical.choice}` and
`comparator/check-conformance.sh` hard-fails on `Lean.ofReduce*` /
`Lean.trustCompiler`, so any theorem whose closure reaches `native_decide` is
excluded from the current tier.

This document records what the exact-ten route's `native_decide` population
actually contains mathematically, which parts are liftable to enumeration-free
proofs, and which are not. It is an analysis artifact, not a plan of record.
The original census changed no Lean source and ran no build.  A later review
added live build-performance observations from an already-running focused
`FiniteN11` build; that review also changed no Lean or comparator source.

Toolchain at time of writing: `leanprover/lean4:v4.27.0`, mathlib `v4.27.0`.

## Status of `FiniteN10` itself

- `lean/Erdos9796Proof/P97/FiniteN10.lean` is still untracked, but the earlier
  statement that it had never been compiled is now stale.  A focused build
  completed on 2026-07-30 and
  `.lake/build/lib/lean/Erdos9796Proof/P97/FiniteN10.olean` exists.
- Nothing imports it. It is off-spine. The acyclic insertion point is
  `lean/Erdos9796Proof/P97/UniversalLocal.lean` (root →
  `P97.UpstreamBridge` → `P97.UniversalLocal`); `UniversalLocal` is not in
  `FiniteN10`'s import closure.
- Of `FiniteN10`'s 1313 in-project closure modules, only two are not already in
  the root's 3600: itself and `P97.U1CardTenCapProfile`.
- Source closure contains no `sorry` and no `axiom` declarations. The seven
  `sorry` grep hits are prose in docstrings.
- A post-build kernel audit of `Problem97.FiniteN10Closure` completed and found
  the expected five-axiom closure:
  `{propext, Quot.sound, Classical.choice, Lean.ofReduceBool,
  Lean.trustCompiler}`, with no `sorryAx`.  The currently running
  `FiniteN11` rebuild has invalidated editor imports temporarily, so this audit
  should be refreshed after that build finishes; the earlier successful audit
  is no longer merely a static citation inference.

One structural note on the working-tree diff that produced it: the split
extracted the `card = 5` branch into
`isM44PinnedSurplusResidualsExcluded_of_card_five`
(`RemovableVertexAxiom/PinnedSurplusBank.lean:27`) and changed how the bank
handoff arrives. The old theorem took
`hbridge : PinnedSurplusCOMPGBankBridgeStatement` as a *hypothesis*; the new one
discharges it by calling `Problem97.pinnedSurplusCOMPGBankBridge`
(`RemovableVertexAxiom/Base.lean:71`). That is what makes it unconditional, and
it is also what pulls the COMP-G DFS-completeness closure into its axiom set.

## Method and validation

All measurements come from Python ports of the Lean predicates, run outside
Lean. Ports were validated before any number was recorded:

- All 30 `SurplusCOMPGBank.candidateMasks` families reproduced element-for-element
  against the literal table (binding, because `candidate_masks_match_filter`,
  `SurplusCOMPGBank.lean:1611`, is a proved theorem that
  `candidateMasks = candidateMasksByFilter`).
- `endpointCandidateMasks .Q1 .v = [452,456,464,480]`,
  `.Q2 .v = [708,712,720,736]`, `.Q1 .w = .Q2 .w = [771,777,785,801]`, both `.u`
  lists 33 elements; `depth2Wmasks` = the 12 Lean values.
- A full re-run of `fragmentSearchAux` reproduces `rawFragmentSearchEntries`
  **exactly — 135 entries, same order**.
- Both DFS searches re-run in Python give 33/84 endpoint leaves and 41/71/23
  COMP-G leaves with **zero symmetric difference** against the banks.
- All 117 endpoint bank rows satisfy `endpointShadowOK`; all 135
  `validFragmentEntries` satisfy `isValidPinnedFragment`.

Recorded so it does not propagate: `|candidateMasks .s1 .s2|` and
`|candidateMasks .s1 .s3|` are **120 and 120**, not 126 and 121 as stated in an
earlier working note.

## Load-bearing `native_decide` inventory

Static citation trace from the two exact-ten entry points, filtered by each
module's import closure. **This table is the pre-rewrite baseline**, kept as the
measurement reference; rows 1 and 2 have since been reduced by L1/L2 and T2 —
see "Consolidated tally".

| lane | leaves | invocations |
|---|---:|---:|
| DFS completeness — 1056 endpoint shards + 3 COMP-G depth-2 | 1059 | 1059 |
| `RowZeros` `normalizePoly p = normalizePoly q` subgoals | 117 | ~3625 |
| `checkCertificate` / `checkProductSum` (117 endpoint + 135 relaxed-split) | 252 | 252 |
| candidate-mask filters, bank bookkeeping, `Label.beq`, prefix `countP` | ~40 | ~40 |
| **total** | **~1468** | **~4976** |

Caveat on the trace: it follows explicitly named citations. A `@[simp]`-tagged
lemma proved by `native_decide` could enter through an unnamed `simp` call.
`Label.beq_eq_decide_eq` (`SurplusCOMPGBank.lean:50`) is the one such lemma
found, and it *is* named explicitly at the cited sites.

The geometric substrate is clean: `SurplusCOMPGBankGeometry.lean`,
`PinnedHullOrder.lean`, `EndpointCertificate/{Geometry,GeometryProducer,
MetricShadow,ResidualSoundness,BridgeAssembly}.lean`, `CapBridgeFromK4.lean`,
`NoDiameterUnderK4.lean` contain zero `native_decide`.

## Part 1 — the DFS lane

### What is being searched

`Shadow` assigns each of the 10 labels (`u v w s1 s2 s3 Pw Pu Q1 Q2`) a
4-element mask over the others — the combinatorial shadow of "these four points
lie on the selected circle centred here", i.e. `HasNEquidistantProperty 4`
written combinatorially. The local predicates are shadows of Euclidean facts:

| predicate | source | Euclidean content |
|---|---|---|
| `noThreeOK` | `SurplusCOMPGBank.lean:300` | at most 2 centres are equidistant from both x and y |
| `pairCountsOK` | `:327` | the same bound, accumulated prefix-wise |
| `circumcenterOKAt` | `:230` | uniqueness of the circumcentre of a non-degenerate triangle |
| `sepOKFor` / `separationOK` | `:274` | ordering of co-bisector centres along the bisector |
| `oneHitOK` | `:218` | single-hit bound between adjacent cap classes |

### Measured search cost (complete, not sampled)

Endpoint, all 1056 shards: **66,326,280 expansions**, 552,959 surviving nodes,
**1,296 surviving leaves**, of which **117 pass `endpointShadowOK` and all 117
are bank-covered** (0 valid-but-uncovered); 1,179 leaves are killed by
`endpointShadowOK`. Split Q1 21,963,600 / 329 / 33 and Q2 44,362,680 / 967 / 84.
Per-shard expansions: min 120, median 28,800, max 617,280.

COMP-G, all 3 theorems / 36 w-subtrees: **5,078,635 expansions**, 62,681
surviving nodes, **135 leaves, all valid, all bank-covered**. Per theorem:
s1 1,758,860 / 41 leaves, s2 1,692,436 / 71, s3 1,627,339 / 23.

Both banks are exactly the solution sets — no slack in either direction.

Predicate attribution (evaluated independently, not first-failure): separation
kills 99.1% of endpoint expansions and 98.8% of COMP-G. `pairCountsOK` is the
sole kill reason for 57,327 endpoint expansions (0.086%) and for **zero** COMP-G
expansions.

### Certificate size, if the search were replaced by a completeness tree

Total certificate nodes (roots + expansions) = **71,406,007**: 615,301 internal,
1,431 surviving leaves, 70,789,275 kill leaves. Serialized 80.1 MB (survivor
bitmap), 143.4 MB (explicit child records), 289.9 MB (literal candidate lists).
Not viable as a kernel-checked object.

But the kill mass is nearly all separation kills, and
`crossSeparationOKForMasks` is **pairwise** — it depends only on
`(center, mask, other, othermask)`. Distinct kill witnesses actually used:
45,470 endpoint + 27,341 COMP-G ≈ 73K, against 70.7M kill leaves — a ~1000×
redundancy. A complete tabulation of the separation predicate over all ordered
centre-pairs × their full candidate lists is 1,348,480 + 1,227,216 bits =
**314 KB total**.

### Negative result: symmetry buys nothing

`Aut(separated)` computed exhaustively over all 10! permutations against the 630
distinct chord-pairs has **order 20** — the dihedral group of the `hullPos`
10-cycle `u,Q1,Q2,v,s1,s2,s3,w,Pw,Pu` (`SurplusCOMPGBank.lean:84-101`). Of those,
only the identity and the reflection
ρ: `u↦u, v↔w, s1↔s3, s2↦s2, Q1↔Pu, Q2↔Pw` preserve `{u,v,w}` (required by
`circumcenterOK`), and ρ fails `oneHitOK`, which pins constraints at `u` and `w`
while ρ sends `w↦v`.

Every intuitive candidate breaks separation outright, because Q1,Q2 sit at hull
positions 1,2, Pw,Pu at 8,9, s1,s2,s3 at 4,5,6, and a transposition of adjacent
hull positions is not dihedral: Q1↔Q2 ✗, Pw↔Pu ✗, all six s-permutations ✗.

`Aut(bank) = 1` exhaustively for all five banks; orbit decomposition is
33, 84, 41, 71, 23 singletons. Independently, the branch sizes 33≠84 and
41≠71≠23 rule out any cross-branch permutation.

**A proved symmetry lemma divides the search by 1 and removes 0 of the 1059.**

### Negative result: no sharper counting identity

Σ over the 45 label pairs of `pointPairClassCount` = **60** exactly on all 236
bank rows. This is a pure double count — 10 classes × C(4,2), and since
`c ∉ class(c)` every contributed pair avoids its centre — so it holds for *every*
`classesShapeOK` shadow, survivor or not. Capacity is 2·45 = 90, so `noThreeOK`
is **never globally tight: 30 units of permanent slack**. Its corollary
`#{count=2} − #{count=0} = 15` carries no extra information.

No sharper identity exists: the degree sequence `deg(x) = #{c ≠ x : x ∈ class(c)}`
is not constant (range [2,5]; 21/54/26/40/20 distinct sequences across the five
banks).

### Negative result: the system is not a binary CSP

Arc consistency run to fixpoint over all 45 binary separation constraints leaves
6.5e14 / 8.9e14 / 1.4e14 / 7.1e13 / 3.5e13 candidate 10-tuples against
33 / 84 / 41 / 71 / 23 solutions — a **12–13 order-of-magnitude gap**. Endpoint
`u` stays at 33 (solution projection 9/15); `Pw` goes 120→55 (projection 12/16);
COMP-G `u` goes 19→17 (projection 2 for s3). No pairwise-local forcing lemma
exists. The residual pruning power is the ≤2 pair-count constraint interacting
along the full 10-centre assignment chain — a genuinely 10-ary condition.

Separation being pairwise and killing 99% of *expansions* is not the same as
separation determining the solution set. Both statements are true.

### Positive result: 576 of 1056 endpoint shards are removable — **IMPLEMENTED**

Shard census, 1056 = 2 × 4 × 4 × 33:

| class | count |
|---|---:|
| separation already fails inside the fixed `{v,w,u}` prefix | 534 |
| pair count already > 2 in the 3-centre prefix | 42 |
| admissible prefix, empty subtree | 450 |
| live (carry all 117 rows; 1–18 leaves each) | 30 |

Cross-checked against the node profile: depth-3 surviving nodes are 240 per
escapee = 480 admissible; 1056 − 480 = 576.

The 534 separation failures are **always at (v,u) or (w,u), never (v,w)**
(240 / 222 / 72). The 42 count failures are exactly the pairs `{s_i, Q_j}`,
7 shards for each of the 6 combinations, and every one of them is *also*
separation-dead — the two dead classes are nested, not disjoint. The table rows
are disjoint only because "separation already fails" counts the 534 triples
whose pair counts are still in bounds.

The cause is mechanical, not mathematical: `ShadowSearchCoverage.lean:75-80`
destructures the DFS path and discards
`_hsepV, _hcountsV, _hsepW, _hcountsW, _hsepU, _hcountsU`, so
`endpointDepth3SubtreeValidAllAccepted_of_mem_candidates` must hold for all 1056
mask triples rather than the 480 reachable ones. Two enumeration-free lemmas
close the gap, in `EndpointCertificate/ShadowSearchPruning.lean`:

- **L1** (42 shards),
  `endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false`. If the depth-3
  `pairCounts` already violate `pairCountsOK`, then
  `endpointDepth3SubtreeResult escapee vmask wmask umask = []`, because
  `incrementPairCounts` is pointwise monotone and `endpointSearchAux` re-tests
  `pairCountsOK` before descending. The `.all` is vacuous.
- **L2** (534 shards),
  `endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false` and
  `..._of_crossSep_uv_false`. If
  `crossSeparationOKForMasks .u umask .w wmask = false` or
  `crossSeparationOKForMasks .u umask .v vmask = false`, then
  `searchSeparationOK` is false at every leaf — `endpointDepth3RestPlan`
  (`ShadowSearch.lean:61`) never reassigns v, w, u, and `orderedLabelPairs`
  carries `(.u, .w)` and `(.u, .v)` in exactly that argument order — so
  `endpointShadowOK escapee {masks} = false` and the `!endpointShadowOK ||`
  disjunct of `endpointDepth3SubtreeValidAllAccepted` discharges the shard.

Note the argument order. Both hypotheses are stated as `.u` against the earlier
centre, which is the form the DFS itself produces at the `.u` step
(`assignedSeparationOK .u umask [.w, .v] _`) and the form that appears in
`searchSeparationOK`'s scan over `orderedLabelPairs`. No symmetry lemma for
`crossSeparationOKForMasks` is needed.

`ShadowSearchCoverage.lean` is **unchanged**: the pruning lemmas conclude
`endpointDepth3SubtreeValidAllAccepted _ v w u = true` from a decidable test on
the three fixed masks alone, so the dispatch keeps its original signature and the
discarded path hypotheses stay discarded. This is a smaller change than the
originally planned "thread `_hsepU`/`_hcountsU` through the dispatch".

The generator (`scripts/endpoint-shadow-search-shards.py`) classifies each
triple and emits a `native_decide` certificate only for the live ones; the other
576 become `exact <pruning lemma> (by decide)` in the dispatch. The classifier
re-implements `crossSeparationOKForMasks`, `incrementPairCounts`, and
`pairCountsOK` in Python; it carries no trust, since a misclassification makes
the emitted `by decide` fail. It was validated against a `lake env lean --run`
dump of the same four predicates over all 1056 triples: **0 mismatches**.

The count route is tested *first*, which is what keeps L1 load-bearing rather
than vestigial given the nesting above. Emission split: 42 L1, 294 uw, 240 uv,
480 certificates.

**Measured reduction: 1056 → 480 endpoint shard certificates; 1059 → 483
searches (54.5% of the endpoint shards).** Shard modules: 160 → 124.
Extending the same argument one level (no admissible `Pw` against the prefix)
removes 32 more: 608/1056, 1059 → 451. Diminishing past that.

COMP-G gets nothing from L1/L2 — all 36 depth-2 prefixes pass both checks
(21 of the 36 subtrees are nonetheless empty, but only search shows it). If
COMP-G were sharded to depth 3, 234 of the 684 prefixes are separation-dead, all
at `(w,u)`.

### Clause-level redundancies (shrink payloads, remove no searches)

- **R1** `searchPairCountsOK shadow ↔ noThreeOK shadow`.
  `fragmentSearchAssignedPrefixes` (`:333`) is an increasing chain whose last
  element is all ten labels, and `incrementPairCounts` is pointwise monotone.
  0 disagreements in 200,000 random shadows. Lean has one direction
  (`noThreeOK_of_PrefixPairCountsOK`, `:1868`); the converse is monotonicity.
- **R2** `separationOK shadow ↔ searchSeparationOK shadow`. `separated` is
  symmetric on all 5040 distinct quadruples (exhaustive) and
  `orderedLabelPairs = labelPairs ∪ swap(labelPairs)`. Both `endpointShadowOK`
  and `isValidPinnedFragment` currently evaluate 45 centre pairs *and* 90 centre
  pairs for the same fact.
- **T-overlap** For all `c ≠ c'`, `|class(c) ∩ class(c') \ {c,c'}| ≤ 2` — three
  points cannot be pairwise separated by a single chord (verified exhaustively;
  max overlap measured 2 on all five banks). Adds no pruning; it is the
  combinatorial form of "two circles meet in at most two points".

## Part 2 — the polynomial certificate lane

### Variable and generator schema

`EndpointCertificate/Variables.lean:25-55` defines the single variable inductive
used by **all 252** certificates: 17 columns,
`ux uy s1x s1y s2x s2y s3x s3y pwx pwy pux puy q1x q1y q2x q2y tau`.
The gauge is `normalAxis (pointOf .v) (pointOf .w) ·`
(`NormalAxisVariables.lean:30-42`), pinning `v ↦ (0,0)` and `w ↦ (1,0)` — so `v`
and `w` are **constants inside the polynomials**, not variables. Column 16 is a
Rabinowitsch slack `tau = 1/dist²(pair)`.

`EndpointCertificate/PolynomialGeometry.lean` defines 14 schematic constructors,
12 of which are used (`sqNormMinusOnePoly` and `sqDistToUnitXMinusOnePoly` are
used by none of the 252). Each has a proved `evalPoly_…` meaning theorem and a
geometric zero-lemma in `GeneratorZeros.lean`.

**There are only two distinct geometric relation types.** Ten of the twelve are
the single relation `dist(c,p) = dist(c,q)` — "p and q are equidistant from c" —
written in gauge-specialized forms because `v`, `w` are constants and the `|c|²`
terms cancel differently. The remaining two are the Rabinowitsch `≠` wrappers.
The surplus side defines **zero** new constructors; it wraps these eleven in a
`GeneratorRule` inductive (`SurplusCertificate/RowZeros/RuleData.lean:41-106`).

Atom histogram (union of both families, 7808 generator instances, 214 distinct
`(constructor, label-tuple)` atoms):

```
sqDistToCenterDiffPoly                  60 tuples   2376 instances
sqNormFirstMinusSqDistPoly              46 tuples   1726
sqDistUnitXToPointMinusCenterDistPoly   44 tuples    918
sqNormDiffPoly                          17 tuples    750
sqDistToUnitXDiffPoly                   17 tuples    750
twiceVarMinusOnePoly                     7 tuples    404
sqDistPointToUnitXDiffPoly               7 tuples    312
sqDistMinusSqNormFirstPoly               7 tuples    312
rabinowitschSqNormPoly                   1 tuple     127
rabinowitschSqDistPoly                   2 tuples    121
oneMinusSqNormPoly                       3 tuples      6
oneMinusSqDistToUnitXPoly                3 tuples      6
```

### Positive result: the 252 certificates are three coincidence claims

252 certificates = 117 `Patterns/EpQ*.lean` + 135
`SurplusCertificate/RelaxedSplit/R*.lean` (206 `checkCertificate`, 46
`checkProductSum`); 248 carry 31 generators, 4 carry 30.

Reconstructing the exact rational arithmetic for all 252 (including the 46
sharded product-sum ones): **236 carry a single Rabinowitsch generator**
`R = tau·D − 1`. Writing `G' = generators \ {R}` and `N` for the tau-degree of
the coefficient vector, substituting `tau := 1/D` and clearing `D^N` turns
`Σ Cᵢ Gᵢ = 1` into `Σ Ĉᵢ Gᵢ = D^N` with polynomial `Ĉᵢ` — i.e.
**`D^N ∈ ideal(G')`**. Verified: EP 101 at N=1, EP 2 at N=2, RS 131 at N=1,
RS 2 at N=2.

There are only **three distinct targets `D` across all 252**:

| certs | D | what the row forces |
|---:|---|---|
| 127 | \|u\|² | **u = v** |
| 115 | \|s1−s3\|² | **s1 = s3** |
| 6 | \|u−s1\|² | **u = s1** |
| 4 | — | row directly unrealizable |

**Corrected 2026-07-30** (this table previously read 103 / 16). The atom
histogram above is decisive and was already inconsistent with the old numbers:
`rabinowitschSqNormPoly` has 127 instances over 1 tuple, and
`rabinowitschSqDistPoly` has 121 over 2 tuples — so the two `sqDist` targets
must sum to 121, not 109, and the Rabinowitsch-free remainder is
252 − 248 = **4**, not 16.

A direct count against the generated Lean confirms the split: **115 of the 117
endpoint rows carry the `s1 = s3` Rabinowitsch generator**, and only
`ep_Q2_000` and `ep_Q2_001` do not. The old "14 `EpQ` rows with no Rabinowitsch
generator" conflated those two with the 12 *product-sum* rows
(`ep_Q1_008/009/028`, `ep_Q2_002/008/019/020/024/041/054/064/074`), which do
carry it but package their payload as checked product blocks rather than a
direct generator list. On the relaxed-split side `R001NoSeparatorR001N` and
`R001NoSeparatorR001Y` genuinely have none.

The T1 restatement `D^N ∈ ideal(G')` therefore applies to 248 of the 252
certificates.

So each row is not proving an opaque contradiction — it is proving that its
circle-incidence pattern collapses two labelled points.

**T1, as originally proposed.** Replace, per row,
`checkCertificate cert = true → False` by `sumCanonProducts (zip Ĉ G') = D^N`,
consumed through the already-existing
`evalPoly_target_eq_zero_of_checkProductSumEq`
(`EndpointCertificate/Soundness.lean:449-459`) plus `pow_eq_zero_iff` and
`dist_eq_zero`. Deletes 236 Rabinowitsch generators and the entire `tau` column
(17 → 16 variables).

**T1 is retired.** The claim that this is "the same reflection over strictly
smaller data" is false; see the next section. The `u = v` / `s1 = s3` /
`u = s1` facts it was wanted for are obtainable from the unchanged certificates.

### Negative result: the T1 tau-clearing enlarges the payload — **T1 DROPPED**

Measured 2026-07-30 with `scripts/t1-tau-clearing-probe.py` over all of
`certificates/endpoint/`. 115 of the 117 endpoint certificates carry a `tau`
column (`ep_Q2_000` and `ep_Q2_001` do not, matching the census above). For each
one the script substitutes `t := 1/D`, clears `D^N`, and confirms
`Σ Ĉᵢ Gᵢ = D^N`: **115 of 115 reconstructed identities verify**, so what follows
measures T1 working exactly as specified, not a failed reconstruction.

| | before | after | |
|---|---:|---:|---|
| product monomials, 115 rows | 692,276 | 1,895,938 | **2.74×** |

`N = 1` on 113 rows and `N = 2` on 2. The per-row ratio is not a uniform factor:
median 1.00×, min 0.93×, max 5.65×. 87 rows are flat, losing exactly the 7
monomials of the deleted Rabinowitsch product out of tens of thousands. 24 rows
grow by 1.4–5.7×, and they are the expensive ones: **92% of the total increase
comes from 12 certificates and 71% from 5**, the worst being `ep_Q2_041` at
69,734 → 336,387.

The mechanism is that clearing `tau` is a substitution, not a deletion:
`Ĉᵢ = Σₖ c_{i,k}·D^(N−k)`. A coefficient that is purely `t^N` survives unchanged
— those are the 87 flat rows — but any coefficient with a `t`-free part is
multiplied by `D`, itself a 6-term degree-2 polynomial. The trade is one
generator out of 31 against a ~6× enlargement of every mixed-degree coefficient.
Total degree therefore *rises*; only the degree in `tau` falls. Restricting T1
to the rows where it is free saves 609 monomials out of 692,276 (0.09%), so the
selective variant is not worth building either.

Two limits on this measurement. Monomial count before canonical merging is a
proxy for checker cost, not a measured build delta. And it covers the 115
endpoint rows, not the 135 relaxed-split ones, whose certificates are not stored
in the same per-row JSON form; the surplus side shares the constructors and the
`tau` schema, so the mechanism should carry over, but the magnitude there is
unmeasured and is not claimed.

**The semantic content does not require T1.** `GeneratorZeros.lean:495-497`
shows `pointOf .s1 ≠ pointOf .s3` is an *input*, supplied by
`EndpointMetricShadow.point_ne` — so each row already means "`s1 ≠ s3` together
with these incidences is inconsistent", and the coincidence follows from the
existing certificate by contraposition. The identity `Σ Cᵢ Gᵢ = 1` holds for all
`ν`; given a configuration zeroing the non-Rabinowitsch generators, if `D ≠ 0`
then instantiating `tau := 1/D` zeros `R` as well and yields `1 = 0`; hence
`D = 0`, hence the coincidence. That is one generic lemma alongside
`evalPoly_target_eq_zero_of_checkProductSumEq`, with no payload change, no
emitter change, and no regeneration of 248 rows. {{UNVALIDATED}} — the argument
is stated but not yet written in Lean.

### Positive result: 3625 shape-matching subgoals are removable by construction

Measured exactly **3625** occurrences of `evalPoly_eq_zero_of_normalizePoly_eq`
in `EndpointCertificate/RowZeros/`, and **0** in `SurplusCertificate/`. Distinct
`q` constructors: 10. Distinct `q` instantiations: 165 — a 22.0× redundancy.

The surplus side already eliminated this obligation class by construction:
`RuleData.lean:12-17` — *"Generator polynomials are derived from these rules, so
generated code does not need a separate polynomial-shape matching proof"* — via
`GeneratorRule.normalizedPoly rule := normalizePoly rule.poly`
(`RuleData.lean:105`). The endpoint side was never migrated, which is the entire
source of the 3625.

**T2.** Migrate `Patterns/EpQ*.lean` to the surplus representation: emit
`List GeneratorRule` and define generators as
`rules.map GeneratorRule.normalizedPoly`; port `GeneratorRule.Valid`,
`evalPoly_eq_zero`, `evaluationZeros_of_directRowCheck`
(`SurplusCertificate/RowZeros/DirectSoundness.lean:60,144,168,174,289`) from
`SurplusCOMPGBank.Label` to `ShadowBank.Label`. Replaces **3625 `native_decide`
subgoals with 0** and deletes the 117 `RowZeros/{Direct,Product}/EpQ*.lean`
proof scripts. Needs one `Decidable`-instance generalization; no new algebra, no
new geometry.

#### T2 implementation status (2026-07-30)

Infrastructure landed and type-checked; generated files not yet regenerated.

- `EndpointCertificate/RowZeros/RuleData.lean` — `EndpointGeneratorRule` (12
  constructors), `poly`, `normalizedPoly`, `rulePolys`. Imports only
  `PolynomialGeometry` + `ShadowBank`, so the 117 pattern modules do not gain a
  Mathlib-geometry import.
- `EndpointCertificate/RowZeros/DirectSoundness.lean` — `ok` (a `Bool`
  function, not a tactic-built `Decidable` instance), `rulesOK`,
  `EndpointGeneratorRule.evalPoly_eq_zero` over all 12 constructors, and
  `evaluationZeros_of_rulesOK`.
- `endpointXVarOfLabel` / `endpointYVarOfLabel` and their four assignment
  agreement lemmas moved from `SurplusCertificate/GeometryCore.lean` into
  `EndpointCertificate/GeneratorZeros.lean` (same
  `EndpointCertificate.Variables` namespace, so all six existing consumers
  resolve them unchanged). This is what lets the endpoint rules reuse the map
  without depending on the surplus lane.
- `scripts/endpoint-certificate.py` — `endpoint_generator_rule` mirrors the
  existing classification branch table; `emit_lean_certificate` now emits
  `<pid>_rules` and defines `<pid>_generators := RowZeros.rulePolys <pid>_rules`;
  `emit_direct_row_zero_module` emits one `decide` in place of the 31-bullet
  script.

Validation performed without taking the Lake lock (`lake env lean` on
concatenated scratch modules, elaborating against the existing oleans):

1. Both new modules elaborate clean.
2. Rule coverage over **all 117 certificates / 3625 generators: 0 unclassified**,
   and the rule histogram reproduces the old shape-lemma usage census exactly —
   1117 `.ordinary`, 774 `.ordinaryVLeft`, 438 `.ordinaryWLeft`, 351 `.exactW`,
   345 `.exactV`, 186 `.ordinaryVW`, 152 `.ordinaryVRight`,
   141 `.ordinaryWRight`, 115 `.distinctS1S3`, 6 `.exactVUnitFlipped`.
3. Payload neutrality, checked in Lean for `ep_Q1_000`:
   `rulePolys ep_Q1_000_rules = Patterns.ep_Q1_000_generators`. This holds by
   construction — `checkCertificate` requires `generators.all isNormalizedPoly`,
   and the 3625 retired subgoals asserted
   `normalizePoly literal = normalizePoly shape` — so no certificate
   coefficient is re-derived.
4. **`rulesOK ep_Q1_000_rules row.toShadow = true` closes by kernel `decide`.**
   T2 therefore takes the endpoint shape-matching population 3625 → **0**
   native invocations, not 3625 → 117: the surviving per-row obligation is
   kernel-checked. (The surplus side still needs `native_decide` for its
   analogue because `GeneratorRule.instDecidableValid` is tactic-built and does
   not reduce.)
5. End-to-end elaboration of the actual emitted `Patterns/EpQ1000.lean` +
   `RowZeros/Direct/EpQ1000.lean`: 0 errors. Row-zero module 409 → 59 lines;
   pattern module 1012 → 804.
6. `SurplusCertificate/GeometryCore.lean` re-elaborates clean after the move.

Remaining before regeneration: the 12 product-sum rows still use the literal
generator path (`emit_computed_generator_module`,
`emit_computed_product_row_zero_module`). Then regenerate, rebuild, and record
the module-family delta.

**T3.** State the ten equidistance constructors once over an abstract centre —
`coordSqDist c p = coordSqDist c q → evalPoly ν (sqDistToCenterDiffPoly …) = 0` —
and derive the gauge-specialized forms by `simp`/`ring` from
`endpointNormalAxisCoord_v` / `_w`, replacing eight separate `calc` proofs in
`GeneratorZeros.lean:43-414`. `twiceVarMinusOnePoly` is the one non-instance: it
is the perpendicular bisector `x = 1/2` of v,w, itself the degenerate case of
`sqNormDiffPoly` at v and w. Proof-size reduction of the geometry bridge, not a
certificate reduction.

### Negative result: the 252 ideal memberships do not collapse

| clustering level | distinct classes |
|---|---:|
| distinct atoms (constructor + labels) | 214 (EP 165, RS 174, shared 125) |
| constructor-multiset signature | 77 (EP 37, RS 44) |
| exact generator set | **252** |
| generator set modulo relabelling the 8 free labels | **252** |

No collapse at any level. No generator is common to all 252; the largest
pairwise intersections are 30-of-31 (41 such pairs, all within one relaxed row
family). The 214 atoms nearly saturate their label universe — e.g.
`sqNormFirstMinusSqDistPoly` uses 46 of the 56 possible ordered label pairs.
These are 252 different circle-incidence patterns on 10 points, not instances of
one pattern. T1 would have reduced them to four statement *forms*, but the 236
witnesses remain 236 separate Gröbner computations either way (coefficient term
counts 30 → 16937, median 321, total 403,831; max coefficient monomial degree
3–10; numerators up to 172 digits). With T1 dropped, the four forms are reached
instead by contraposition on the unchanged witnesses.

### Structural handle, unexploited

`sqDistToCenterDiffPoly c p q` is **linear in the centre's coordinates** — it is
the perpendicular-bisector line of p,q evaluated at c. Each centre carries 4
incidences, hence 3 independent bisector conditions each linear in c: two
determine c, the third constrains the configuration. Ten centres, one excess
condition each. A real general theorem at this layer would be a statement about
when a 10-point / 40-incidence bisector arrangement forces a coincidence.

{{NEEDS_PROOF}} — "the 252 certificates are redundantly presented relative to
those ~10 excess conditions" follows from the linearity but has not been checked
against the actual generator sets.

## Consolidated tally

`analysed` is the state this document was written against; `landed` is the
current tree; `target` is after the remaining items.

| lane | analysed | landed | target |
|---|---:|---:|---:|
| DFS searches | 1059 | 483 | 483 (451 with one more level) |
| `normalizePoly` shape subgoals | 3625 | 0 | 0 |
| ideal-membership certificates | 252 | 252 | 252 (smaller; positive statements) |
| bookkeeping | ~40 | ~40 | ~40, most likely plain `decide` |
| **`native_decide` invocations** | **~4976** | **~775** | **~775** |

An ~84% cut, all of it enumeration-free reasoning, none of it new mathematics.
T2 and L1/L2 together account for all of it. T1 would not have changed the
count, and — measured — would have enlarged the payload of the 252 remaining
certificates by 2.74×; it is dropped.

## Build-performance impact

The rewrite has value independent of the comparator trust tier: it should
materially reduce cold builds and builds after changes high in the certificate
dependency graph.

A live focused `FiniteN11` build on 2026-07-30 compiled 120
`EndpointCertificate` pattern/row-zero modules and 534 `SurplusCertificate`
modules before reaching the later certificate banks.  Thus T2 does not merely
remove visually noisy proof text: it removes 117 modules' generated row-zero
scripts and 3625 native shape checks from an import closure that is exercised by
the current headline builds.  L1/L2 remove 576 DFS shard checks.  T1 was
expected to reduce the arithmetic payload of 236 polynomial checks; it was
measured to enlarge it 2.74× and has been dropped.

The 84% reduction in invocation count must not be reported as an 84% wall-time
reduction without measurement.  Native checks have very unequal costs and Lake
compiles independent modules in parallel.  For the endpoint shard family that
measurement now exists — see "Endpoint shard family, measured" below, where the
unequal costs run in the *favourable* direction — but it has not been made for
the surplus family or for T2.  In the same live build, separate
`ErasedCertificate/P2Placement*Native` and
`ErasedCertificate/P4SPlacement*Native` modules were still taking more than
20 minutes each.  Those modules are outside the endpoint/surplus rewrite
analyzed here and remain a separate build bottleneck.

The implementation should therefore record a module-family baseline before
the rewrite and compare:

1. clean-build wall time and aggregate reported module time;
2. rebuild time after invalidating the endpoint/surplus definitions;
3. peak parallelism and the longest individual native checks; and
4. the same measurements for the unaffected `ErasedCertificate` family.

### Endpoint shard family, measured (2026-07-30)

Both states were produced by the same generator script and built with the same
`lake build Erdos9796Proof.P97.EndpointCertificate.ShadowSearchCoverage` from a
cold shard family (every shard module invalidated, everything below it warm), on
the same machine under the same background load from the other lanes.

| | before | after |
|---|---:|---:|
| shard certificates (`native_decide`) | 1056 | 480 |
| shard modules | 160 | 124 |
| Lake jobs | 166 | 131 |
| CPU time (`user`) | 78m07s | 19m33s |
| wall time | 7m27s | 1m50s |

**A 4.0× CPU reduction, against a 2.2× reduction in certificate count.** The
pruned triples were disproportionately expensive, which is what the earlier
per-shard expansion profile (min 120, median 28,800, max 617,280) predicts:
`endpointSearchAux` tests `assignedSeparationOK` only when it *assigns* a
centre, so a triple that is already separation-dead in its `{v,w,u}` prefix is
not pruned at depth 3 — it explores the whole seven-centre subtree and only
fails at the final `endpointShadowOK`. Removing those triples removes more work
per certificate than removing a live one would.

Caveat on the figures: the two runs saw different background load from the other
lanes (`load_1m` ≈ 26 for the after-run, ≈ 32 for the baseline), and the baseline
ran second. Wall time is the more confounded of the two; CPU time is the primary
figure. The contention skew flatters the result, but not by enough to explain the
gap — the ratio stays well above the 2.2× count ratio under any plausible
correction.

Axiom closure of the replacement, checked with `#print axioms`:

```
endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false  → [propext, Quot.sound]
endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false → [propext, Quot.sound]
endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false → [propext, Quot.sound]
```

So the 576 removed shard checks are not merely traded for cheaper native ones —
they are discharged with **no compiler trust at all**, inside the three-axiom
budget, and below even the `Classical.choice` line. The compiler-trusted surface
of the endpoint DFS lane shrinks by 54.5%, not just its invocation count.

The axiom closure of the consumer is unchanged, as it must be while any shard
certificate remains native:

```
endpointShadowInBank_of_endpointShadowOK
  → [propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

identical before and after. L1/L2 reduce how much compiler trust the lane
*exercises*; they do not remove it from the closure. Only eliminating all 480
remaining certificates would do that, and nothing in this document proposes to.

### Negative result: `precompileModules` is a 5.3× CPU regression (2026-07-31)

Tested in an isolated `git worktree` clone under the session scratchpad, with a
CoW copy of `.lake/packages`, so the shared tree was never touched. Both arms
built the same target (`EndpointCertificate.ShadowSearchCoverage`) from a cold
package build, back to back, at the same system load (1-minute average 104–116).

| | `precompileModules` | control | |
|---|---:|---:|---|
| Lake jobs | 389 | 131 | |
| wall | 25m49s | 4m17s | 6.0× |
| user CPU | 105m56s | 19m50s | **5.3×** |
| `ShadowSearchShards.All` | 279s | 16s | 17× |
| `ShadowSearchCoverage` | 251s | 0.4s | ~600× |
| shard `Q1V452W771U08_15` | 184s | 60s | 3.1× |

The control's 19m50s CPU agrees to within 2% with the 19m33s recorded for the
same family in the shared tree at load ~26, which is the evidence that user CPU
is load-robust here and that the clone is representative.

Two secondary findings, both contrary to what was expected going in:

1. **mathlib does not need precompiling.** After a successful build with
   `precompileModules = true`, mathlib had 0 object files and 0 shared
   libraries, as did `formal_conjectures` — the 812 `.c` files Lake emitted for
   it were never compiled or linked. Only our own modules got native artifacts
   (129 dylibs against 132 oleans). The feared mathlib C-compilation cost
   (7523 `.c` files, ~1.6 CPU-hours by a 20-file sample) never arises.
2. **The precompilation jobs themselves are free.** Every `:c.o` and `:dynlib`
   job ran in 49–83 ms.

The regression is therefore not in the linking but in elaboration: forcing code
generation over modules whose content is enormous literal certificate data and
proof terms costs far more than the interpreted calls it removes. The effect is
worst exactly where the data is largest — the aggregator and coverage modules,
not the individual shards.

**Do not enable `precompileModules` on this package.** The motivating
observation — a shard module spending 16.1s wall against 5.6s user, the gap
being C-compiler subprocess time — is real, but precompiling imports is not the
way to recover it.

### Separate `ErasedCertificate` bottleneck

The live build gives a more precise census than the source filenames alone.
There are 112 P2/P4-S modules whose names end in `Native`, but only **64
expensive `native_decide` leaves**: 32 P2 and 32 P4-S.  The other 48 modules
compose or re-export those leaf results.

At the 2026-07-30 snapshot:

- 13 completed P2 leaves had median reported time 3670 seconds and maximum
  4182 seconds;
- 21 completed P4-S leaves had median 1954 seconds and maximum 2922 seconds;
- 30 computational leaves remained active;
- the 32 active Erased workers consumed about 30 cores and 159 GiB RSS on the
  32-core, 256-GiB host, with no active swapping.

Thus this is primarily a CPU/search problem, not a Lake failure or a swapping
problem, and P2 is the critical-path family.  Lowering the job count might
still improve per-worker throughput, but that must be decided by an A/B build;
the current snapshot alone does not justify it.

The source audit found several changes worth benchmarking before a new
certificate representation:

1. Both P2 and P4-S test `localCandidateOK` in the chunk predicate and then
   immediately call a placement helper that tests it again.
2. `candidateRows` scans all 2048 support masks although these lanes only use
   the 330 four-point masks.
3. `allKilledAt` fully insertion-sorts every domain list even though it consumes
   only the smallest domain.
4. Every recursive node recomputes compatibility against the whole assigned
   prefix, the equality closure, normalized roots, and every metric-core scan.

Items 1--3 admit local equivalence lemmas and can preserve all public theorem
statements.  They are the first Erased-specific implementation experiment.
Item 4 has the larger potential payoff, but needs an invariant-carrying search
state and a new soundness proof; it belongs after a one-leaf benchmark confirms
that the local changes are insufficient.

There is already a checked row-nogood interface in
`CapSelectedNogoodCertificate.lean` and
`CapSelectedNogoodClassifier.lean`, but its historical cap-selected mining run
also records why a direct reuse is not yet the answer.  The flat bank contained
149,434 subsumption-minimal nogoods and occupied about 617 MiB before Lean
elaboration.  Moreover, `allCertified` still performs the full DFS and checks
the bank at every prefix.  Therefore an Erased certificate rewrite should not
mean emitting the same flat bank for P2/P4-S.  A viable replacement must encode
coverage compactly--for example a structurally shared trie/DAG or a checked
branch proof--so Lean verifies a precomputed result instead of rediscovering
the search.

## What this does and does not buy for the comparator

It does **not** make `FiniteN10Closure` clean at three axioms. The 483 remaining
searches still require `native_decide`, and the 252 ideal memberships would
additionally need the coefficient-representation change below.

That does not make the rewrite low priority.  Comparator admission and build
performance are separate objectives: the project can expose exact ten in an
explicit compiler-trusted tier immediately while still performing T2 and
L1/L2 for build tractability.

Root cause of the certificate lane's kernel-infeasibility, recorded here because
it is easy to misdiagnose as scale: `Checker.lean` has `Term.coeff : Rat`, and
the hot loop is `a.coeff * b.coeff` (`mulTerm`, `:143`) and
`t.coeff + u.coeff` (`insertTerm` `:89`, `addCanon` `:130`). Every `Rat`
`+`/`*` routes through `Rat.normalize` → `Nat.gcd`, which is well-founded
recursion the kernel cannot unfold at speed. This was already diagnosed in the
project on 2026-07-06 —
`docs/archive/2026-07-10-closure-plan-consolidation/closure-plan-2026-07-06.md:604`
records `K4WindowBank.lean` as "native_decide forced by `Rat`/`Nat.gcd` kernel
non-reduction — same shape as the EpQ pattern files".

{{NEEDS_PROOF}} — clearing denominators and checking `Σ c'ᵢ·gᵢ = N` over `Int`
(GMP-accelerated in the kernel, no gcd, no WF recursion) should make the 252
kernel-decidable. Requires `Term.coeff : Int`, denominators cleared in
`scripts/endpoint-certificate.py`, and `false_of_checkCertificate` re-proved for
the scaled identity. Untested — the measurement needs a build.

So the tier decision stands on its own:

1. **Existing 3-axiom tier.** Requires the Int rewrite *and* a completeness-
   certificate scheme for 483 searches. Large engineering, zero new mathematics.
2. **Second comparator tier** permitting `Lean.ofReduceBool` / `Lean.trustCompiler`
   beside the current 24 theorems at three axioms. Small cost; reports the
   compiler-trust dependency explicitly rather than hiding it.

**Recommendation.** Put `FiniteN10Closure` in the explicit compiler-trusted
second tier now.  Do not make the build-performance rewrite wait on a decision
to pursue the three-axiom tier: implement T2 and L1/L2 as tractability work,
measure them, then decide whether T1 and the Int checker rewrite justify their
additional migration cost.  **Resolved for T1 on 2026-07-30:** it does not — the
measurement retired it.  The Int checker remains open.

## Comparator tier status (2026-07-30)

Next steps 1 and 2 are done.  The recommendation above — put `FiniteN10Closure`
in an explicit compiler-trusted tier rather than waiting on the Int rewrite —
was implemented.

**Axiom closures, measured directly** (`lake env lean` against the built
oleans, importing `Erdos9796Proof.P97.FiniteN11`):

| Theorem | Closure |
|---|---|
| `Problem97.FiniteN9Closure` | `{propext, Classical.choice, Quot.sound}` |
| `Problem97.FiniteN10Closure` | those **+** `{Lean.ofReduceBool, Lean.trustCompiler}`, **no `sorryAx`** |
| `Problem97.FiniteN11Closure` | those **+ `sorryAx`** |

This confirms the earlier audit for `FiniteN10Closure` — five axioms, no
`sorryAx` — and is no longer a citation inference.

**The tier.**  `comparator/` is now split by axiom budget over the same
`Challenge`/`Solution` pair:

| Tier | Manifest | Permitted axioms | Count |
|---|---|---|---|
| core | `config.json` / `axiom-audit.lean` | `propext`, `Classical.choice`, `Quot.sound` | 24 |
| native | `config-native.json` / `axiom-audit-native.lean` | those **+** `Lean.ofReduceBool`, `Lean.trustCompiler` | 3 |

The three native-tier entries are `Headline.finiteN10Closure`
(`Problem97.FiniteN10Closure`), `Headline.counterexample_card_ge_eleven`
(every counterexample has ≥ 11 points), and `Headline.erdos97_of_card_le_ten`
(its contrapositive).  The latter two are composed in `Solution.lean` from
`Problem97.counterexample_card_ge_ten` with equality killed by
`Problem97.FiniteN10Closure` — the same shape `counterexample_card_ge_ten` uses
one level down against `FiniteN9Closure`.

`check-conformance.sh` was rewritten to be tier-driven: permitted sets are read
from the config files rather than hardcoded, each tier's config and audit file
are cross-checked for the same name set, the tiers must be disjoint, and every
reported axiom must be in its tier's permitted set.  That last check subsumes
the old grep guards — `sorryAx` is in no tier's set, and a core-tier theorem
that starts using `native_decide` reports `Lean.ofReduceBool`, which core does
not permit.

**Two facts worth recording.**

1. `Problem97.FiniteN10Closure` is **not in the project root's import closure**.
   `Erdos9796Proof` imports only `P97.UpstreamBridge` and `P96.UpstreamBridge`,
   and that descent route does not pass through the fixed-card exact-ten
   endpoint; nothing in the tree imports `P97/FiniteN10.lean` except
   `P97/FiniteN11.lean`.  This corroborates the "nothing imports it, it is
   off-spine" note above, and it means `Solution.lean` has to name the module
   explicitly.
2. **`FiniteN11Closure` cannot be gated in any tier**, including conditionally.
   It still reaches `sorryAx` (measured 2026-07-30) through
   `ATailFiniteN11Frontier.false_of_twoLargeCaps_commonCriticalMap_of_card_eq_eleven`,
   which splits into two arms — the unique-radius arm, whose open leaf is the
   exact-five common-obstruction-center residual at `FiniteN11Frontier.lean:42`,
   and `false_of_frontierCommonDeletionPhysicalSecondApex` in
   `FrontierLiveClosure`, which carries `sorryAx` of its own (ExactSkeletonPilot,
   convo #2485).  The `FiniteN11Frontier.lean:42` docstring calling its leaf
   "the sole open fixed-cardinality-eleven leaf" is stale; the live residual set
   belongs to the exact-eleven lane, not this one.
   A conditional gate is not a workaround: that hypothesis quantifies over
   `CounterexampleData`, `SurplusCapPacket`, and `CriticalShellSystem`, project
   structures with no faithful mathlib-only restatement, so stating it in
   `Challenge.lean` would defeat the module's purpose.
   `counterexample_card_ge_eleven` is the strongest proved eleven-point
   statement available — a lower bound on a counterexample's size, not its
   exclusion.  When the leaf closes, `finiteN11Closure` joins the native tier
   by the same three-line pattern as `finiteN10Closure`.

**Verification.** `check-conformance.sh` passes both tiers.  Statement identity
for the three new theorems was checked by the `pp.explicit` diff
(`Challenge` vs `Solution`, 455 lines each, 0 differences).  A real
`leanprover/comparator` run against `config-native.json` has **not** been done.

## Next steps, in dependency order

1. ~~After the active `FiniteN11` build finishes, refresh
   `#print axioms Problem97.FiniteN10Closure` and preserve the exact output in
   the audit artifacts.~~ **DONE 2026-07-30** — see "Comparator tier status"
   below.
2. ~~Add `FiniteN10Closure` to an explicitly compiler-trusted comparator tier.
   Do not add it to the existing three-axiom theorem set or make that clean tier
   depend on it.  Coordinate this with the active comparator-wiring owner.~~
   **DONE 2026-07-30** — see "Comparator tier status" below.
3. Capture the build baseline described above before changing the certificate
   representation.
4. ~~T2 (removes 3625 subgoals and 117 proof-script files).  This is the first
   implementation target because it removes repeated work by construction and
   does not change the certificate mathematics.~~ **DONE 2026-07-30** — see
   "T2 implementation status" above.  Verified in-tree: `RowZeros` is at 1
   `native_decide`, `Patterns` at 328.
5. ~~L1 + L2 (removes 576 shard checks).  Self-contained and independently
   measurable.~~ **DONE 2026-07-30** — see "Positive result: 576 of 1056
   endpoint shards are removable" above and "Endpoint shard family, measured"
   below.
6. ~~Rebuild and compare against the baseline.  Land T2/L1/L2 only with
   source-clean theorem checks and a recorded wall-time/module-family delta.~~
   **CLOSED 2026-07-30, Adam's call.**  Done for L1/L2 ("Endpoint shard family,
   measured").  Not done for T2 and will not be: no pre-T2 baseline was captured
   before that change landed, so the delta is not recoverable by direct
   comparison, and re-deriving it was judged not worth a from-scratch rebuild of
   the pre-T2 commit.  T2's 3625 → 0 invocation reduction stands; its wall-time
   effect is unmeasured and should not be asserted.
7. ~~T1 (deletes the `tau` column and 236 generators).  Do this after T2 settles
   the shared emitters.~~ **DROPPED 2026-07-30** — see "Negative result: the T1
   tau-clearing enlarges the payload" above.  Measured over all 115 tau-carrying
   endpoint certificates: the clearing verifies on every one and grows the
   payload 2.74×, because substituting `t := 1/D` multiplies every `t`-free
   coefficient slice by `D`.  T1 never changed the invocation count, so nothing
   is lost on the tally.  If the `u = v` / `s1 = s3` / `u = s1` facts are wanted,
   take them by contraposition on the unchanged certificates — one generic lemma,
   no emitter or payload change.  That lemma is the follow-on task, if any.
8. Pursue the `Int` coefficient checker and explicit completeness certificates
   only if admission to the existing three-axiom tier remains a project goal.
9. For ErasedCertificate, benchmark items 1--3 above on one of the slowest P2
   leaves against its preserved baseline.  If the result is material, apply
   the equivalence-preserving evaluator to all 64 leaves and repeat the
   32-versus-24-job comparison.
10. In parallel, prototype a compact checked branch/trie certificate for one P2
    leaf.  Do not promote the historical flat nogood representation unless its
    matching and payload costs are first eliminated.
11. If both experiments leave the P2 tail too large, introduce an incremental
    DFS state for compatibility and equality closure, then prove it equivalent
    to the current classifier.
12. R1, R2, T3 — payload and proof-size reductions, any time.

## Provenance

Every mathematical census count above is a measurement from a validated Python
port, not a Lean kernel result. The T1 payload measurement is reproducible from
`scripts/t1-tau-clearing-probe.py`, which is committed; the earlier census
scripts are not. Scratch scripts under the session scratchpad
(`p97port.py`, `search.py`, `measure_ep.py`, `measure_cg.py`, `am_search.py`,
`am_analysis.py`, `am_shards.py`, `am_consistency.py`, and others); they were not
committed.  The 120/534 module counts and 20-minute-class native-module timings
in the build-performance section come from
`lean/scratch/finite-n11-focused-build-20260730.log`.  The 2026-07-30 T1
revision modified this document and added `scripts/t1-tau-clearing-probe.py`; it
did not edit Lean or comparator source or start a build.
