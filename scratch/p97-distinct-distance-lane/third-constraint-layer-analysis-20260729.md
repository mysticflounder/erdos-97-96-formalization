# P97 Phase-3: audit of a third constraint layer

Date: 2026-07-29  
Scope: read-only audit of the live `(k,n,profile,exact) = (4,10,(4,4,5),true)`
Phase-3 search, with no change to the encoder, Lean sources, manifests, or
published ledgers.

## Executive verdict

There is one sound constraint family at the current variable vocabulary that is
genuinely independent of both local Euclidean-realizability tests and
distinct-distance constraints:

> **Global descent / minimality cut.** The directed selected-shell graph must
> be strongly connected. Equivalently, for every nonempty proper label set
> `X`, some selected-shell edge enters `X` from its complement:
>
> `OR { s[p,x] : p ∉ X, x ∈ X }`.

For the live `n=10` cell this does **not** require assuming that the source
counterexample was selected cardinal-minimal: a closed proper subset has at
most nine points, contradicting the kernel-clean theorem
`Problem97.counterexample_card_ge_ten`. For a generic `n>10` cell, the same
clause family is sound only behind an explicit minimal-source producer (or a
proved smaller-cardinality closure covering every proper subset). It must not be
inferred merely from `Node`; that would violate the current Phase-3 contract.

This is a real logical strengthening of the current CNF. An exhaustive forced
cut experiment found current-CNF models with no edge entering every one of the
45 two-label cuts and every one of the 120 three-label cuts. Thus 165 cut
clauses are empirically nonredundant at `n=10`. On the other hand, all 100
saved production models and all 163 current global-v2 structural survivors
happen already to be strongly connected. The family has a clean theorem and
cheap encoding, but **zero retrospective pruning on the saved checkpoints**.

No second genuinely independent family survived this audit. In particular:

- pure cyclic order and rank-3 oriented-matroid axioms admit every current cap
  partition;
- parity, planarity, and crossing-topology restrictions have no sound premise
  on the selected-shell graph;
- Fisher/EKR/Zarankiewicz/Hall-style statements are either missing hypotheses
  or are aggregate consequences of clauses already present;
- abstract metric axioms cannot constrain the selected supports because
  `MetricRow.exact=false`; the discrete metric extends every selected-support
  system;
- coordinate rank, Gram, Cayley-Menger, Ptolemy, Radon-plus-length, and
  perpendicular-bisector statements are Euclidean-realizability constraints,
  not a third layer.

Two additional changes are worth deploying, but they must be classified
correctly:

1. **Project out the blocker-choice variables.** This is an exact existential
   quotient and likely the largest immediate runtime win, but it adds no
   mathematical constraint.
2. **Compile the target-pair codegree bound statically.** This is a strong,
   kernel-backed six-literal clause family that kills all 100 saved base
   models, but it is the transpose/perpendicular-bisector part of the existing
   Euclidean layer, not a third layer.

Accordingly, the honest answer is: **one narrow global-minimality layer exists;
there is no broad independent order/matroid/parity/topology layer at the live
abstraction.**

## Status vocabulary

- **PROVEN-KERNEL**: a named Lean theorem was checked transitively and reports
  only `propext`, `Classical.choice`, and `Quot.sound`.
- **PROVEN-MATH / WRAPPER-MISSING**: the deduction is complete from
  PROVEN-KERNEL ingredients, but the exact Phase-3-facing wrapper theorem and
  CNF semantic compiler are not yet in Lean.
- **EMPIRICALLY VERIFIED**: checked against saved artifacts or by a finite SAT
  experiment; not promoted to kernel evidence.
- **REDUNDANT**: an exact logical consequence of the current clauses, so it
  cannot remove a projected model.
- **NOT INDEPENDENT**: sound and useful, but part of Euclidean geometry or the
  distinct-distance layer already under consideration.
- **UNSOUND**: not a consequence of the stated source hypotheses.
- **INADMISSIBLE AT CURRENT VOCABULARY**: may be mathematically sound with
  additional data, but the current `s,b,f` assignment cannot state or verify
  its antecedent.

## 1. Exact live abstraction and its information boundary

The current semantic variables are:

| Atom | Count | Meaning |
|---|---:|---|
| `s[p,q]`, `p != q` | 90 | `q` is in the one selected four-support at center `p` |
| `b[x,d]`, `x != d` | 90 | the chosen B1 witness is `c(x)=d` |
| `f[x,i]`, `x=3..9`, `i=0,1,2` | 21 | strict cap-fiber assignment for fixed `M={0,1,2}` |

The current 201 semantic variables plus three cap-profile selectors give the
204-variable live encoding. The saved base manifest reports 5,532 clauses.

The hard semantic content is exactly:

- each row has four selected targets;
- two selected rows share at most two targets (`S-CIRC2`);
- each target chooses exactly one incoming selected row (`B-TOTAL`, `B-MEM`);
- each non-Moser label has one cap fiber, with strict fiber-size multiset
  `(2,2,3)`.

The contract is explicit in
`census/p97_search/PHASE3-SPEC.md:103-158`. In particular:

- complete model blocking includes all `s`, all `b`, and all `f`;
- `R-P1` through `R-P4` are forbidden because there is no same-distance
  `C2`-matrix producer;
- convexity, distance transitivity, exact-five, minimality, no-M44, and
  finite-universe clauses may not be inferred merely from a node.

The geometric rows consumed by structural CEGAR have `exact=false`. A positive
atom `s[p,q]` proves that `q` has the selected radius from `p`; a false atom
does **not** prove that `q` has a different radius. This is the decisive reason
that many tempting metric and equality-closure clauses are unsound.

The cap annotation also does not itself store cyclic order. For each fixed
partition of sizes `(2,2,3)`, the current order enumerator supplies

`2! * 2! * 3! = 24`

compatible internal orders. Every such cyclic order is realized by a labelled
regular decagon, hence it has a valid alternating rank-3 oriented matroid before
any length equalities are imposed.

## 2. Ranking

### 2.1 Genuine new mathematical layers

There is only one deployable entry:

| Rank | Family | Classification | Sound scope | Saved-checkpoint pruning |
|---:|---|---|---|---:|
| 1 | `S-MINCUT`: every proper cut has an entering selected-shell edge | **PROVEN-MATH / WRAPPER-MISSING**, genuinely independent | live `n=10`; generic `n` only in explicit minimal-source mode | 0/100 base, 0/163 survivors |

There is no honest rank 2 or rank 3. The rejected families in section 6 are
either redundant, unsound, inadmissible, or part of Euclidean geometry.

### 2.2 Overall engineering deployment order

If the question is instead “what should be implemented next?”, regardless of
whether it is a new mathematical layer:

| Rank | Change | Why |
|---:|---|---|
| 1 | existentially project `b`, reconstruct a canonical blocker | removes 90 semantic variables and the dominant witness multiplicity |
| 2 | add static dual-codegree/perpendicular-bisector clauses | cheap, kernel-backed, and all 100 saved base models violate them |
| 3 | add `S-MINCUT` behind an `n=10` or minimal-source gate | genuinely new layer and logically nonredundant, but no saved survivor violates it |

These rankings deliberately separate mathematical novelty from likely runtime
return.

## 3. Genuine third layer: proper-cut crossing / strong connectivity

### 3.1 Exact statement

Given a carrier `A` and one selected four-support `S(p)` at every `p in A`,
define the directed graph

`p -> q  iff  q in S(p)`.

For every nonempty proper `X subset A`,

`exists p in A \ X, exists x in X, x in S(p)`.                 `(CUT)`

Equivalently, the selected-shell digraph is strongly connected.

The equivalence is standard and elementary. If a finite directed graph is not
strongly connected, its condensation DAG has a source strongly connected
component `X`, and no edge enters `X`. Conversely, `(CUT)` directly forbids
every nontrivial source component.

### 3.2 Proof at the live `n=10` cell

Assume `(CUT)` fails for a nonempty proper `X`, and put `B=A\X`. Then:

1. `B` is nonempty because `X` is proper.
2. `B` is convex-independent because convex independence is hereditary.
3. For every `p in B`, no selected edge from `p` enters `X`; hence
   `S(p) subset B`.
4. The same positive radius and the same four selected witnesses therefore
   prove `HasNEquidistantPointsAt 4 B p`.
5. Thus `B` is a nonempty convex-independent K4 counterexample.
6. Since `B` is a proper subset of a ten-point carrier, `|B| <= 9`, contradicting
   `Problem97.not_hasNEquidistantProperty_four_of_card_le_nine`, equivalently
   `Problem97.counterexample_card_ge_ten`.

`Problem97.counterexample_card_ge_ten` is at
`lean/Erdos9796Proof/P97/UniversalLocal.lean:54-68`. Its transitive axiom
report is exactly:

`{propext, Classical.choice, Quot.sound}`.

Therefore the mathematical deduction is unconditional for every realizable
live `n=10` Phase-3 assignment. It does not assume that the ten-point source
was itself cardinal-minimal.

### 3.3 Proof in generic minimal-source mode

For a cardinal-minimal `CounterexampleData D`, the same proof works at every
cardinality: a nonempty proper row-closed `B subset D.A` would retain K4 and
contradict minimality.

The exact existing producer is

`Problem97.ATailGlobalMinimalDeletion.not_hasNEquidistantProperty_of_nonempty_proper_subset`

at
`lean/Erdos9796Proof/P97/ATail/GlobalMinimalDeletion.lean:30-42`.
`CounterexampleData.Minimal` is the cardinal-minimal predicate at
`lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:150-160`. The producer's
transitive axiom report is again exactly

`{propext, Classical.choice, Quot.sound}`.

This establishes the generic theorem, but it also fixes the scope boundary:
for `n>10`, a non-minimal counterexample could contain a proper K4
counterexample, so `S-MINCUT` must be refused unless a minimal-source premise
or an adequate smaller-cardinality theorem is supplied.

### 3.4 CNF encoding

For every `X` with `empty != X != Fin n`, emit the positive clause

`CUT(X) := OR_{p notin X, x in X} s[p,x]`.

At `n=10`:

- number of clauses: `2^10 - 2 = 1,022`;
- clause length for `|X|=m`: `m(10-m)`, at most 25;
- total literals: `10*9*2^8 = 23,040`;
- new variables: zero.

This is small relative to the current 5,532-clause encoding. Emitting all 1,022
clauses is the simplest auditable implementation.

A lazy alternative is even cheaper:

1. build the 10-vertex, 40-edge graph from a SAT assignment;
2. run SCC decomposition in `O(n+|E|)`;
3. if it is not strongly connected, choose the lexicographically first source
   SCC `X`;
4. emit `CUT(X)`.

A certificate record needs only the subset bitmask, the crossing variable IDs,
and the assignment hash. Replay checks that `X` is nonempty and proper and
that every crossing literal was false. The mathematical checker then invokes
the proper-subset theorem.

### 3.5 Logical independence from the current hard clauses

The following selected rows satisfy exact row size four, pairwise row
intersection at most two, and min indegree at least one:

```text
S0 = {1,3,6,8}      S5 = {2,4,6,7}
S1 = {0,2,7,9}      S6 = {2,3,8,9}
S2 = {3,6,7,9}      S7 = {3,4,5,8}
S3 = {4,6,8,9}      S8 = {2,5,6,9}
S4 = {5,6,7,8}      S9 = {2,3,5,7}
```

For `X={0,1}`, no row centered outside `X` contains `0` or `1`, so `CUT(X)`
fails. A valid current blocker annotation is

`c = (1,0,1,0,3,4,0,1,0,1)`,

and a valid cap assignment is

`f^{-1}(0)={3,4}`, `f^{-1}(1)={5,6}`, `f^{-1}(2)={7,8,9}`.

Thus this is a complete witness at the `s,b,f` semantic level, not merely a
row sketch. Its maximum pairwise row intersection is two. It proves that the
cut family is not derivable from `S-EXACT`, `S-CIRC2`, `B-TOTAL`, `B-MEM`,
`CAP-TOTAL`, and `CAP-PROFILE`.

An exhaustive CaDiCaL forcing experiment over all proper subsets gave:

| Cut size | Forced no-incoming instances | SAT under current CNF |
|---:|---:|---:|
| 1 | 10 | 0 |
| 2 | 45 | 45 |
| 3 | 120 | 120 |
| 4 through 9 | 847 | 0 |

This is **EMPIRICALLY VERIFIED**, not a DRAT-backed redundancy proof. The
size-one cuts are visibly B1. For production, either emit all 1,022 clauses or
prove/check any omitted family; do not promote “165 effective clauses” solely
from these solver verdicts.

### 3.6 Expected pruning

Retrospective checks found:

- 0 of the 100 saved bounded production models violate strong connectivity;
- 0 of the 163 saved global-v2 survivors violate strong connectivity.

So the observed late-stage pruning is zero. The benefit is instead:

- eliminating logically admitted row-closed components before geometry;
- preventing the solver from exploring the explicit two- and three-label cut
  families found by the forcing experiment;
- making the SAT abstraction faithful to the available global cardinality
  theorem.

This should be described as semantic tightening, not as a demonstrated speedup.

### 3.7 Lean consumer and trust path

A useful wrapper shape is:

```lean
theorem exists_rowPattern_crossing_of_card_eq_ten
    {A : Finset ℝ²} (hcard : A.card = 10)
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    {X : Finset (CarrierLabel A)}
    (hXne : X.Nonempty) (hXproper : X ≠ Finset.univ) :
    ∃ p ∉ X, ∃ x ∈ X, x ∈ Census554.rowPattern F p
```

and, separately:

```lean
theorem exists_rowPattern_crossing_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal)
    (F : FaithfulCarrierPattern D.A)
    {X : Finset (CarrierLabel D.A)}
    (hXne : X.Nonempty) (hXproper : X ≠ Finset.univ) :
    ∃ p ∉ X, ∃ x ∈ X, x ∈ Census554.rowPattern F p
```

`FaithfulCarrierPattern` already stores one selected four-class at every
carrier vertex
(`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1378-1397`), and
`Census554.rowPattern` pulls those supports back to carrier labels
(`lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean:106-166`).

The first missing bridge is not the mathematics. It is a source-clean
Phase-3 semantic theorem connecting every realizable `s` assignment to such a
`rowPattern`, followed by a verified CNF clause compiler. A Python SCC oracle,
even with locally replayed records, is not Lean closure. A terminal SAT claim
would still require the exact terminal CNF, verified DRAT/LRAT, and a
kernel-checked ingress from the semantic clauses to the live theorem consumer.

### 3.8 Required falsification gates

1. **Scope refusal.** The encoder must reject `S-MINCUT` for generic `n>10`
   unless `minimal_source=true` or a named smaller-cardinality theorem is in
   the manifest.
2. **Positive cut gate.** The explicit witness above is SAT under the old CNF
   and UNSAT after adding `CUT({0,1})`.
3. **Spare gate.** A valid strongly connected synthetic node remains SAT.
4. **All-subset replay.** For every decoded model, an independent checker
   compares SCC status with all 1,022 clauses.
5. **Clause provenance.** Each clause records `X`, its literal list, the
   theorem name, and the precise source-mode premise.
6. **Lean axiom gate.** The wrapper reports only the three standard axioms and
   contains no `sorryAx`.
7. **Artifact versioning.** Changing the base CNF invalidates old terminal
   hashes and DRAT claims; use a new schema/run directory.

## 4. Exact blocker projection: highest-ROI engineering change, not a layer

### 4.1 Exact equivalence

The current `b` variables express only:

`for every x, there exists d != x with s[d,x]`.

Indeed,

`exists b. (B-TOTAL and B-MEM)  iff  AND_x OR_{d != x} s[d,x]`.       `(B-EX)`

Forward implication reads the unique selected `d`. Reverse implication chooses
one witnessing `d` per `x`. This is precisely the immediate equivalence E1 in
`scratch/p97-search-lane/blocker-annotation-existence.md:14-31`.

Therefore replace the 90 semantic `b[x,d]` variables with ten clauses

`B-EXISTS(x) := OR_{d != x} s[d,x]`,

and reconstruct a deterministic witness after decoding, for example

`c_min(x) := min { d : s[d,x] }`.

This does not add or remove any projected `(s,f)` assignment. It is
**PROVEN-MATH**, an existential projection, and explicitly **not a new
constraint family**.

### 4.2 Static cost reduction

For each target, current `B-TOTAL` emits one length-nine at-least-one clause and
36 pairwise at-most-one clauses. Across ten targets that is 370 clauses;
`B-MEM` adds 90 more. Projection replaces those 460 clauses with ten.

For the live cell:

| Quantity | Current | Projected |
|---|---:|---:|
| semantic variables | 201 | 111 |
| total variables | 204 | 114 |
| base clauses | 5,532 | 5,082 |
| complete survivor block length | 201 | 111 |

The more important reduction is not the 450 clauses; it is witness
multiplicity.

### 4.3 Observed witness blow-up

The interrupted global-v2 checkpoint contains 163 survivor records but only
three distinct `(s,f)` projections:

| observed records for projection | column indegrees | possible B1 maps `product_x indeg(x)` |
|---:|---|---:|
| 134 | `[4,5,4,4,4,5,5,3,2,4]` | 768,000 |
| 28 | `[4,3,4,4,4,4,3,4,6,4]` | 884,736 |
| 1 | `[5,4,3,4,5,3,4,4,4,4]` | 921,600 |

The 100 saved bounded base models similarly collapse to 25 `(s,f)`
projections. These are **EMPIRICALLY VERIFIED checkpoint counts**, not a
runtime benchmark: solver order and learned clauses will change after
projection. They nevertheless expose a severe semantic duplication mechanism.

The saved survivor clauses confirm the implementation issue: each unresolved
record blocks all 201 semantic literals
(`census/p97_search/phase3_structural_cegar.py:5324-5348`), and the Phase-3
spec explicitly includes all `b` atoms in complete model blocking.

### 4.4 Why canonical reconstruction is safe for the current lane

`BlockerAnnotation` enforces only B1
(`census/p97_search/annotations.py:37-94`). Its only admitted node rule,
`R-FIBER4`, is defensive: each fiber of `d` is a subset of the exact four-row
`S[d]`, so it can never prune a B1-valid decoded object.

The structural algebraic systems explicitly record `blockers_used=false`
(`census/p97_search/phase3_structural_cegar.py:2274-2284` and the analogous
later validator). The learned geometric and cap-order clauses use `s` and,
when applicable, `f`, not the identity of `c`.

Thus one deterministic B1 witness is enough for current construction and
validation. The joint canonical form and artifact schema currently include
`c`, so they must be revised rather than silently reusing old banks.

If a future theorem consumes more than B1—for example, a source-specific
deletion fact not reconstructible from `s`—then `b` projection must be
re-audited. The present recommendation does not project such richer data,
because it is not present in Phase 3 now.

### 4.5 Required gates

1. Exhaustively compare projected `(s,f)` model sets between the original and
   projected encodings on tiny cells.
2. For every projected model, construct `c_min` and re-run
   `BlockerAnnotation` validation.
3. Differentially replay every current rule over randomized alternative B1
   choices and the canonical choice; any classifier dependency on `c` is a
   fail.
4. Assert that the current 163-record checkpoint projects to exactly three
   `(s,f)` assignments with multiplicities `134,28,1`.
5. Version semantic-assignment hashes, canonical digests, manifests, resume
   verification, and terminal CNFs. Old raw-assignment DRAT claims do not
   transfer.

## 5. Static target-pair codegree: excellent clause, but geometric

### 5.1 Statement and six-literal encoding

For distinct targets `a,b`, at most two centers can select both:

`|{p : a in S(p) and b in S(p)}| <= 2`.                         `(DUAL2)`

If three distinct centers `p,q,r` selected both `a` and `b`, then all three
centers would lie on the perpendicular bisector of segment `ab`. A
convex-independent planar carrier has at most two points on that line.

For every target pair `{a,b}` and every center triple
`{p,q,r} subset [n]\{a,b}`, emit:

```text
not s[p,a] or not s[p,b] or
not s[q,a] or not s[q,b] or
not s[r,a] or not s[r,b].
```

At `n=10` this gives

`C(10,2) * C(8,3) = 2,520`

six-literal clauses and no variables.

It is the transpose of current `S-CIRC2`:

- `S-CIRC2` forbids two centers sharing three targets;
- `DUAL2` forbids three centers sharing two targets.

`DUAL2` is demonstrably not entailed by the present CNF: all 100 saved base
models satisfy that CNF (including `S-CIRC2`) and violate `DUAL2`. No converse
independence claim is needed here.

### 5.2 Lean and trust status

The generic kernel theorem is
`Problem97.Dumitrescu.perpBisector_apex_bound` at
`lean/Erdos9796Proof/P97/Dumitrescu/L1.lean:123-155`.
Its axiom report is exactly the three standard axioms.

The equality-core consumer is
`Problem97.Census554.EqualityCore.false_of_convexIndep_of_perpBisectorCore`
at
`lean/Erdos9796Proof/P97/Census554/EqualityCore.lean:229-245`; `lean_verify`
reports the same three axioms and no warnings. It is wired into
`Problem97.Census554.false_of_metricCoreAlternative` at
`lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean:279-324`.
A direct card-11 adapter,
`pair_hit_centers_card_le_two`, already appears at
`lean/Erdos9796Proof/P97/Census554/GeometryBridge.lean:1047-1079`.

So the mathematics and a live generic consumer already exist. What is missing
is only the static Phase-3 clause compiler, its semantic soundness gate, and a
new terminal certificate.

### 5.3 Empirical effect

- all 100 saved bounded base models violate `DUAL2`;
- their maximum target-pair codegree is four;
- none of the 163 global-v2 survivors violates it;
- the global-v2 learned bank contains 425
  `equality-perpendicular-bisector-convex` certificates, of which 423 remain
  in the active antichain.

Current dynamic certificates call `_clause_for_rows`, which blocks all four
selected memberships of every certificate row, hence has length `4r` for `r`
rows (`census/p97_search/phase3_structural_cegar.py:2100-2127`). An artifact
audit separates the 425 learned records into:

- 236 direct, three-row records whose equality paths all have length one; their
  learned clauses have 12 literals, and the static six-literal clause strictly
  dominates them;
- 189 closure-derived records using longer equality paths and between three and
  six certificate rows. Their centers need not each directly select both
  foci, so `DUAL2` does **not** subsume them.

The equality-closure detector and its longer-path certificates must therefore
remain available after static compilation. Static `DUAL2` removes only the
direct subfamily; it does not replace the dynamic perpendicular-bisector
reasoner.

These observations make static compilation a strong engineering
recommendation. They do **not** make it a third constraint layer: its proof is
exactly a Euclidean perpendicular-bisector/convexity argument.

### 5.4 Falsification gate

Force

```text
s[2,0], s[2,1],
s[3,0], s[3,1],
s[4,0], s[4,1].
```

The old base CNF must remain SAT; the revised CNF must become UNSAT immediately
from the corresponding six-literal clause. Replay should construct the
five-label `PerpBisectorCore`, invoke the kernel theorem, and verify any
terminal DRAT against the exact revised CNF.

## 6. Candidate families that do not survive

### 6.1 Pure metric closure

**Candidate.** Triangle inequalities, equality transitivity, four-point metric
inequalities, or radius-component closure.

**Status: INADMISSIBLE / NO PRUNING.**

Because false `s[p,q]` atoms are not off-radius facts, every selected-support
assignment has an abstract metric extension: give every pair of distinct labels
distance one. Each selected row is then a subset of a same-distance class,
regardless of its omitted labels. Triangle inequalities and all equality
transitivity statements hold.

Any metric clause that prunes the current `s` abstraction must therefore use
additional negative/off-class atoms or Euclidean dimension. The former is a
distinct-distance/exactness layer; the latter is the existing geometry layer.

### 6.2 Cross-center radius equalities and mutual membership

**Candidate.** Infer equality of row radii, or restrictions on cycles, from
`q in S(p)` and `p in S(q)`.

**Status: UNSOUND.**

Mutual membership says only

`dist(p,q)=r_p` and `dist(q,p)=r_q`,

so symmetry gives `r_p=r_q` for that mutual pair. It does not make the whole
supports equal, force additional selected memberships, or relate a
non-mutual edge to another center's radius. Longer directed cycles likewise
do not equalize all radii without mutual edges. Any useful collision conclusion
then invokes Euclidean equal-length geometry and belongs in the current
realizability layer.

### 6.3 Pure cyclic order and oriented matroids

**Candidate.** Alternating chirotope constraints, Grassmann-Plücker signs,
Radon partitions, or cap-order consistency.

**Status: PROVEN NO STANDALONE PRUNING.**

For a convex labelled carrier, the rank-3 oriented matroid is the alternating
matroid determined by a cyclic order. Every cyclic order is realized by points
on a circle. Every current `(2,2,3)` strict cap partition admits the 24 orders
already enumerated by the lane. Therefore existentially adding chirotope
variables always extends a current `f` assignment.

Radon/crossing facts become restrictive only when combined with selected
equal-length relations—for example the live convex-five, rhombus, and Kalmanson
detectors. Those are valuable order-plus-metric Euclidean certificates, but
they are not an independent order layer.

### 6.4 Planarity, pseudolines, and crossing parity

**Candidate.** Require the selected-shell incidence graph to be planar, bound
chord crossings, or impose an even-crossing parity law.

**Status: UNSOUND.**

The shell edges are abstract center-to-witness incidences, not edges of a
planar straight-line graph whose crossings are forbidden. An arbitrary graph
can be drawn by chords between points in convex position. Hanani-Tutte,
pseudoline-arrangement, and cycle-parity conclusions require premises absent
from Phase 3. No such premise may be inferred from convex independence alone.

### 6.5 Block-design and extremal-set inequalities

| Tempting tool | Why it does not add a sound current constraint |
|---|---|
| Fisher inequality / BIBD identities | row and column degrees are not constant and pair multiplicities are not fixed |
| Erdős-Ko-Rado | the ten selected rows need not be pairwise intersecting |
| Ray-Chaudhuri-Wilson | its restricted intersection/regularity hypotheses are absent |
| Kővári-Sós-Turán / Zarankiewicz | the relevant `K_{2,3}` exclusion is exactly `S-CIRC2`; aggregate bounds do not exclude 40 incidences, as current models witness |
| Linear-programming degree bounds | consequences of exact row sum 40, B1, and row codegree; no extra source theorem was found |

**Status: UNSOUND when stronger hypotheses are assumed; otherwise REDUNDANT.**

The existing saved models are concrete incidence structures satisfying the
current row-size, row-codegree, and B1 conditions. An aggregate inequality true
of precisely those hypotheses cannot remove them.

### 6.6 Hall, capacities, and blocker fibers

**Candidate.** Matching constraints, surjectivity of `c`, many blocker centers,
or a restricted blocker-cycle structure.

**Status: REDUNDANT or UNSOUND.**

There is no injectivity requirement on `c`; B1-map existence is exactly minimum
column indegree one. Since every fiber of `d` is a subset of `S[d]`, its size is
at most four, and consequently at least `ceil(10/4)=3` centers are used. Both
facts are already consequences of B1 plus exact rows.

Every fixed-point-free functional graph has a directed cycle of length at least
two, but that is automatic after choosing `c` and imposes no new condition on
`s`. Requiring the blocker graph itself to be strongly connected, to have a
particular cycle length, or to satisfy parity is unsound because `c` is an
arbitrary witness choice.

### 6.7 Degree and parity laws

**Candidate.** Even indegrees, an even number of mutual pairs, or a forced
degree sequence.

**Status: UNSOUND.**

The only universal arithmetic facts in the current vocabulary are total
indegree 40 and positive indegree from B1. The three saved survivor projections
already have mixed odd/even indegrees and distinct degree sequences. No
geometric or minimality theorem found in the indexed banks imposes a parity
condition.

### 6.8 Algebraic rank, PSD, Cayley-Menger, Ptolemy

**Candidate.** Rank-two Gram constraints, vanishing Cayley-Menger
determinants, Euclidean distance-matrix PSD, Ptolemy, or coordinate elimination.

**Status: NOT INDEPENDENT.**

These are alternative encodings of Euclidean realizability. They may improve
the existing algebraic oracle, but they are not constraints “other than
geometry.” The same applies to the dual-codegree rule in section 5.

### 6.9 Richer minimal-deletion constraints

The global minimal-deletion bank proves a stronger alternative: after deleting
a finite source set, either two deleted sources have equal radius at a blocker
or one obtains pairwise-disjoint exact critical shells. This is mathematically
promising, but **INADMISSIBLE AT CURRENT VOCABULARY**:

- `s` stores only one selected four-subset per center;
- `MetricRow.exact=false` does not identify the full radius class;
- `b` stores only B1, not the `no_qfree` deletion fact of
  `CriticalShellSystem`;
- source-specific critical-shell exactness is absent.

Encoding this theorem would require new exact-radius-class and deletion-witness
atoms, plus a new producer contract. It should be treated as a future enriched
layer, not silently projected onto current `s,b,f`.

## 7. Completeness of the negative conclusion at the current vocabulary

The negative conclusion is not a claim that no other theorem about convex
equidistant configurations exists. It is a statement about what the live
semantic atoms can soundly express.

At this vocabulary:

1. `f` has no relation to `s` until a cyclic-order-plus-metric theorem is
   invoked.
2. false `s` atoms carry no disequality or off-circle information.
3. `b` is only an existential incoming-edge witness.
4. the only guaranteed K4 structure on a proper subset is obtained when all
   selected rows centered in that subset stay in it.

Point 4 explains why `S-MINCUT` is the complete direct consequence of global
minimality visible through one selected row per center: it forbids exactly the
proper row-closed subsets. A stronger minimality cut needs more witness classes
or exact off-support data.

Pure order/matroid/topology decorations existentially extend every current cap
partition, while pure abstract metrics existentially extend every current
selected-support system. Therefore neither can prune without coupling to
Euclidean length facts. This is the core rigorous reason that no broad third
layer appears.

## 8. Trust matrix

| Item | Mathematical producer | Phase-3 wrapper/compiler | Terminal proof | Current status |
|---|---|---|---|---|
| `S-MINCUT`, `n=10` | `counterexample_card_ge_ten`, kernel-clean | missing | none | safe design, not implemented |
| `S-MINCUT`, generic minimal | proper-subset theorem, kernel-clean | missing minimal-source mode | none | safe only with explicit premise |
| blocker projection | exact existential equivalence; prose proof audited | missing projected schema/gates | old artifacts inapplicable | engineering design only |
| `DUAL2` | generic apex bound and equality-core consumer, kernel-clean | static six-literal compiler missing | none for revised CNF | geometry optimization only |
| order/OM layer | every current partition extends | no pruning clause exists | n/a | negative conclusion |

A source-clean wrapper alone would not make any SAT terminal kernel-closed.
Promotion requires the full semantic ingress and checked terminal certificate.

## 9. Recommended implementation sequence and acceptance criteria

### Step 1: project blocker witnesses

- revise the Phase-3 spec and schema;
- replace `B-TOTAL/B-MEM` with ten `B-EXISTS` clauses;
- reconstruct `c_min`;
- block and canonicalize on `(s,f)`;
- pass the differential gates in section 4.5.

Acceptance: exact equality of projected model sets on exhaustive small gates,
and no reuse of old hashes or terminal artifacts.

### Step 2: compile `DUAL2`

- add all 2,520 six-literal clauses;
- attach the generic perpendicular-bisector theorem name to clause provenance;
- prove/replay the semantic compiler;
- rerun the 100-model gate and the dynamic-certificate subsumption audit.

Acceptance: the explicit six-literal positive-control assignment is rejected,
the direct three-center/two-target certificate instances are subsumed,
closure-derived certificates remain replayable and their detector remains
enabled, and any terminal DRAT is checked against the revised CNF.

Classification in all reports: **Euclidean geometry optimization**, never
“third layer.”

### Step 3: add `S-MINCUT`

- first add the two Lean wrappers in section 3.7;
- introduce an explicit source-mode theorem token in the manifest;
- for the live cell, authorize it through the `card=10` theorem;
- for generic cells, require minimal-source mode;
- initially emit all 1,022 clauses; optimize to lazy SCC only after replay
  gates are stable.

Acceptance: exact theorem scope is in the manifest, the explicit cut witness is
killed, strongly connected controls are spared, and the wrapper has a clean
transitive axiom report.

### Step 4: rerun and report honestly

Report separately:

- projected SAT assignments;
- canonical banks;
- structural survivors;
- external algebraic verdicts;
- DRAT/LRAT verification;
- Lean semantic ingress;
- transitive axiom status.

Do not infer speedup from the retrospective counts, and do not upgrade an
interrupted checkpoint or an externally checked certificate to P97 closure.

## 10. Sources audited

The audit began with the live handoff/spec/result spine and then searched the
indexed Lean and paper corpora before inspecting source:

- `scratch/p97-search-lane/HANDOFF-2026-07-28.md`
- `census/p97_search/PHASE3-SPEC.md`
- `census/p97_search/PHASE3-RESULTS.md`
- `census/p97_search/sat_generate.py`
- `census/p97_search/phase3_structural_cegar.py`
- `census/p97_search/phase3_ordered_metric_rules.py`
- `scratch/p97-search-lane/blocker-annotation-existence.md`
- `docs/general-n-certificate-bank-mining-2026-07-09.md`
- `certificates/p97_rvol_general_n_mining.md`
- `certificates/erdos97_legacy_general_n_mining.md`
- `certificates/erdos_general_theorem_p97_mining.md`
- the live Lean consumers cited above.

The theorem-bank audit did not reveal an overlooked non-geometric consumer
whose antecedent is expressible from current `s,b,f`. The one new exact
consumer identified here is the proper-subset/minimality theorem, yielding
`S-MINCUT`.
