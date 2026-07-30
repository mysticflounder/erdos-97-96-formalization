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
proofs, and which are not. It is an analysis artifact, not a plan of record; no
Lean source was changed and no build was run while producing it.

Toolchain at time of writing: `leanprover/lean4:v4.27.0`, mathlib `v4.27.0`.

## Status of `FiniteN10` itself

- `lean/Erdos9796Proof/P97/FiniteN10.lean` is untracked and **has never been
  compiled** — no `.olean` exists for it.
- Nothing imports it. It is off-spine. The acyclic insertion point is
  `lean/Erdos9796Proof/P97/UniversalLocal.lean` (root →
  `P97.UpstreamBridge` → `P97.UniversalLocal`); `UniversalLocal` is not in
  `FiniteN10`'s import closure.
- Of `FiniteN10`'s 1313 in-project closure modules, only two are not already in
  the root's 3600: itself and `P97.U1CardTenCapProfile`.
- Source closure contains no `sorry` and no `axiom` declarations. The seven
  `sorry` grep hits are prose in docstrings.
- `#print axioms Problem97.FiniteN10Closure` has **not** been run.
  {{NEEDS_PROOF}} — everything below about its axiom closure is inferred from a
  static citation trace, not from the kernel.

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
module's import closure.

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

### Positive result: 576 of 1056 endpoint shards are removable

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
7 shards for each of the 6 combinations.

The cause is mechanical, not mathematical: `ShadowSearchCoverage.lean:76-80`
destructures the DFS path and discards
`_hsepV, _hcountsV, _hsepW, _hcountsW, _hsepU, _hcountsU`, so
`endpointDepth3SubtreeValidAllAccepted_of_mem_candidates`
(`ShadowSearchShards/All.lean:1271`) must hold for all 1056 mask triples rather
than the 480 reachable ones. Two enumeration-free lemmas close the gap:

- **L1** (42 shards). If the depth-3 `pairCounts` already violate `pairCountsOK`,
  then `endpointDepth3SubtreeResult escapee vmask wmask umask = []`, because
  `incrementPairCounts` is pointwise monotone and `endpointSearchAux` re-checks
  `pairCountsOK` at its first step. The `.all` is vacuous.
- **L2** (534 shards). If `crossSeparationOKForMasks .v vmask .u umask = false`
  or `crossSeparationOKForMasks .w wmask .u umask = false`, then `separationOK`
  is false at every leaf — `endpointDepth3RestPlan` (`ShadowSearch.lean:61`)
  never reassigns v, w, u — so `endpointShadowOK escapee {masks} = false` and the
  `!endpointShadowOK ||` disjunct discharges the shard. Checked load-bearing: of
  25 sampled separation-dead shards, 4 produced raw leaves (7 total) and **0**
  were `endpointShadowOK`.

**Measured reduction: 1059 → 483 searches (54.5% of the endpoint shards).**
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
| 103 | \|s1−s3\|² | **s1 = s3** |
| 6 | \|u−s1\|² | **u = s1** |
| 16 | — | row directly unrealizable |

The 16 with no Rabinowitsch generator are `EpQ1008/1009/1028/2000/2001/2002/
2008/2019/2020/2024/2041/2054/2064/2074`, `R001NoSeparatorR001N`, `R001NoSeparatorR001Y`.

So each row is not proving an opaque contradiction — it is proving that its
circle-incidence pattern collapses two labelled points.

**T1.** Replace, per row, `checkCertificate cert = true → False` by
`sumCanonProducts (zip Ĉ G') = D^N`, consumed through the already-existing
`evalPoly_target_eq_zero_of_checkProductSumEq`
(`EndpointCertificate/Soundness.lean:449-459`) plus `pow_eq_zero_iff` and
`dist_eq_zero`. Deletes 236 Rabinowitsch generators and the entire `tau` column
(17 → 16 variables), and drops every coefficient degree by N. No new proof
obligation — the same reflection over strictly smaller data — and the reflection
now yields the reusable facts `u = v`, `s1 = s3`, `u = s1`.

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
one pattern. T1 reduces them to four statement *forms*; the 236 witnesses remain
236 separate Gröbner computations (coefficient term counts 30 → 16937, median
321, total 403,831; max coefficient monomial degree 3–10; numerators up to 172
digits).

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

| lane | now | after L1/L2 + T1 + T2 |
|---|---:|---:|
| DFS searches | 1059 | 483 (451 with one more level) |
| `normalizePoly` shape subgoals | 3625 | 0 |
| ideal-membership certificates | 252 | 252 (smaller; positive statements) |
| bookkeeping | ~40 | ~40, most likely plain `decide` |
| **`native_decide` invocations** | **~4976** | **~775** |

An ~84% cut, all of it enumeration-free reasoning, none of it new mathematics.

## What this does and does not buy for the comparator

It does **not** make `FiniteN10Closure` clean at three axioms. The 483 remaining
searches still require `native_decide`, and the 252 ideal memberships would
additionally need the coefficient-representation change below.

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

{{NEEDS_ADAM_INPUT}} — which tier `finiteN10Closure` goes in.

## Next steps, in dependency order

1. Build `FiniteN10` and run `#print axioms Problem97.FiniteN10Closure` to
   replace the static trace with the kernel's answer. Blocked on the build lock.
2. Wire `import Erdos9796Proof.P97.FiniteN10` into `UniversalLocal.lean` — needed
   for the comparator to see it at all, independent of tier.
3. L1 + L2 (removes 576 shard certificates). Self-contained, no dependency on 1–2.
4. T2 (removes 3625 subgoals and 117 files). Self-contained.
5. T1 (deletes the `tau` column and 236 generators). Depends on 4 being settled
   first if both touch the same emitters.
6. R1, R2, T3 — payload and proof-size reductions, any time.

## Provenance

Every count above is a measurement from a validated Python port, not a Lean
kernel result. Scratch scripts under the session scratchpad
(`p97port.py`, `search.py`, `measure_ep.py`, `measure_cg.py`, `am_search.py`,
`am_analysis.py`, `am_shards.py`, `am_consistency.py`, and others); they were not
committed. No repository Lean source was modified and no build was run.
