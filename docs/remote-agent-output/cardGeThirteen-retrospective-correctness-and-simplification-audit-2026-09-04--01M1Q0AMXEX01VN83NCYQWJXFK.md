# `cardGeThirteen` retrospective correctness and simplification audit

Date: 2026-09-04

Live root:

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
```

## Executive verdict

The core direction remains viable, but several of my intermediate descriptions
were too strong or unnecessarily complicated.

The exact arithmetic and finite-certificate artifacts available in this session
replay successfully. The main errors were instead at the **source boundary**:

1. I relied on a vacuous `Fin 13` interval before noticing that `13 : Fin 13 = 0`.
2. I treated a colored seven-source/three-fan strengthening as if it completed
   the source occurrence route; it did not.
3. I transferred a `2+2+1` strict-interior trace conclusion into the exact tight
   cover, where the correct fourth-row trace is `2+1` or `1+2`.
4. I occasionally blurred the distinction between a row centered at a carrier
   point supplied by global `D.K4` and the critical shell belonging to a source,
   which is centered at that source's actual blocker.
5. Some early finite models were described as more source-compatible than they
   were; they were valid local negative controls, but omitted MEC, first-apex,
   critical-shell, or global-K4 data.

The most important simplifications are:

- the current source occurrence needs only **distinct blockers with one common
  omitted frontier deletion**; it does not need mutual source omission or the
  colored three-fan detour;
- the uncovered three-row packet has a **two-arm** continuation:
  a fresh second deletion, or an exact-card-13 pairwise-disjoint tight cover;
  separate overlap branches are unnecessary;
- in the exact tight large-interior arm, the repaired I2 cardinalities force
  the `.secondOpposite` profile and an unordered `2+3` split of the two A2
  classes;
- the frontier deletion lies in the exact first-apex class `T`, though not
  necessarily in the I1 interior pair;
- fixed-cell support enumeration should use forbidden-pair graphs, small
  residual domains, and reusable Kalmanson schema banks rather than repeated
  495-way or monolithic LRA searches.

The live root remains open. No fixed-cell certificate should be counted as a
publication-root decrement until a source-complete cell coverage theorem feeds
it.

---

## 1. Serious corrections

### 1.1 The `Fin 13` I2 interval was vacuous

The committed definition used intervals of the form

```lean
Finset.Ico 8 13
Finset.Ico 9 13
```

inside `Fin 13`. Since `13 : Fin 13 = 0`, these sets are empty.

Consequences:

- the old `secondOppositeInterior_mem` field was vacuous;
- old direct/mirror I2 order lemmas could close through impossible membership;
- claims that raw labels `9–12` were source-derived second-opposite-interior
  labels were invalid before repair;
- any source-cell count relying on those memberships was not evidence for the
  live theorem.

A working-tree repair changes the sets to

```text
Icc 8 12
Icc 9 12
Icc 9 12,
```

with cards `(5,4,4)`, and adds nonvacuous image-equality and regression
theorems. Focused builds and axiom checks were reported green.

However, the retrospective source audit found that this repair, the raw
exact-13 ingress, and the fresh/tight source files were still untracked or
foreign-dirty at the audited HEAD. Until they are committed and pushed, the
published source still has the vacuous semantics.

**Correction to my earlier wording:** “the I2 bug is repaired” was true of the
shared working tree, not yet of the durable repository state.

### 1.2 The colored seven-source/three-fan chain was overclaimed

The following are landed and source-clean:

```lean
carrier_card_le_goodOutsideSources_card_add_six
seven_le_goodOutsideSources_card_of_card_gt_twelve
exists_good_sources_distinctBlockers_commonDeletion
```

They establish at least seven good sources and directly produce two good
sources with distinct actual blockers whose rows omit one common frontier
point.

The colored checkpoint attempted to strengthen this to a pair that was also
mutually omitted from the two source rows, then eliminate one finite survivor
through a three-fan classification.

That stronger implication is **not proved**. The mutual-omission producer and
the three-fan metric terminals are separate landed components; no theorem
derives the fan's second shared supports and required ordered center/incidence
packet from the common-deletion source packet.

Therefore the statement in the colored checkpoint that the full chain forces a
mutual-omission/common-deletion pair was premature.

More importantly, the current `cardGeThirteen` continuation does not need that
strengthening. The simple distinct-blocker/common-deletion packet is sufficient
to form the two blocker rows and overlay them with the two A2 classes.

**Simplification:** remove the colored three-fan route from the critical path.
Retain its geometric kernels only as optional theorem-bank material.

### 1.3 Two different `2+2+1` statements were conflated

For a broad strict-interior set

```text
I = (firstRow.support ∩ oppInterior2) ∪
    (secondRow.support ∩ oppInterior2),
```

if both blocker-row traces in `I` have card at most two and exactly one point
of `I` lies outside their union, then the elementary count really does force

```text
2 + 2 + 1.
```

That local statement is sound.

In the **exact-card-13 tight cover**, however, the three rows `C0,C1,K` are
pairwise disjoint and partition `A \ {z}`. The opposite A2 class `L` contains
`z`, is disjoint from `K`, and satisfies

```text
L.erase z ⊆ C0 ∪ C1
card (L.erase z) = 3.
```

Circle-intersection bounds give the correct full trace:

```text
|L.erase z ∩ C0|, |L.erase z ∩ C1| = 2+1 or 1+2.
```

The earlier tight-cover `2+2+1` claim was wrong and has been superseded.

### 1.4 Global K4 and critical-shell rows are different objects

For a carrier point `q`:

- `D.K4 q` gives an equal-distance row **centered at `q`**;
- `H.selectedAt q` is the critical row belonging to source `q`, centered at
  its actual blocker `H.centerAt q`, and containing `q`.

Several exploratory routes implicitly moved between these without an explicit
center identity. That is invalid.

The exact-card-13 all-center K4 campaign correctly uses the first object.
A fresh-deletion/actual-blocker campaign must separately use the second object
and preserve `no_qfree_at`.

### 1.5 The frontier deletion lies in the A1 class, not necessarily I1

The common deletion `d = W.deleted` is one of the frontier pair points and is
source-cleanly in the exact first-apex selected class `T`.

There is no theorem that:

- places `d` in `firstOppositeInterior`;
- identifies it with `R.interior_q` or `R.interior_w`;
- proves `d ≠ z`.

Thus any finite encoding imposing `d ∈ T ∩ I1` is overconstrained.

In the exact tight cover, because `d` is omitted by `C0,C1`,

```text
d = z ∨ d ∈ K.
```

Combining with `d ∈ T` gives the sharper source constraint

```text
d = z with z ∈ T
OR
d ∈ K ∩ T.
```

This is a useful cell reduction that should be exported by the raw ingress.

### 1.6 The five-outside/six-center shortcut was invalid

The attempted route using five points outside the two fixed blocker rows
assumed first-apex survival and/or `actualBlocker(r) ≠ A1`. Those facts are not
available for arbitrary outside points.

Trying to avoid A1 by forcing two new blocker rows also fails from the current
interface: a four-source blocker fiber whose common support is exactly that
fiber, plus one singleton fiber, is a valid abstract counterpattern.

This route should remain discarded unless a new global source theorem excludes
that fiber pattern.

### 1.7 Conditional cap-cardinality cutoffs were not established

The early `n ≤ 17` or `n ≤ 32` ordered-cap bounds were explicitly conditional
on adapters that were never source-verified. Cap-growth arithmetic alone admits
unbounded multi-growth families.

These bounds are not part of the current proof route.

### 1.8 One custody/hash error occurred

One nthdegree post omitted the final `b` from a bundle receipt SHA. The
authoritative receipt was later corrected to

```text
35e4cead03ce736e2c09d8a3c7bd55166b3dc8af23f89e13fe558ffdeeb2db1b.
```

This was clerical, not mathematical. Earlier exact-model transport also carried
a stale embedded code hash after manual compaction; the whole-file receipt and
independent replay were used to correct it.

---

## 2. What survived the audit

### 2.1 Source-count and common-deletion occurrence

The source-clean count is:

```text
D.A.card ≤ goodOutsideSources.card + 6.
```

Hence `12 < D.A.card` gives at least seven good sources.

A simple two-color/blocker-fiber argument then gives distinct good sources
whose distinct blocker rows omit the same frontier point:

- each blocker fiber has card at most four;
- every good source omits at least one of two frontier points;
- if two distinct blocker fibers never shared an omitted point, there could be
  at most two fibers;
- singleton omission fibers have card at most three because their common
  four-row must also contain the opposite frontier point;
- seven sources cannot fit into two such fibers.

This is the correct occurrence theorem. No three-fan strengthening is needed.

### 2.2 Uncovered-or-grid producer

The landed source split remains valid:

```text
CardGeThirteenUncoveredThreeCenterPacket
OR
ExactFourTwoRadiusAdjacentCapGrid.
```

The large-interior double-partition arm has a source-clean contradiction. The
grid arm remains open because the source still lacks a blocker-shell-to-cyclic-
order/signed packet.

### 2.3 Local negative controls

The exact rational local controls remain useful and replay:

- a diagonal two-cycle with completed four-rows and local deletion failure;
- a 15-point uncovered packet with two distinct common deletions and exact
  four-point circles;
- several exact-card-13 abstract strict-Kalmanson metrics satisfying strong
  local source-like row data.

They correctly show that selected-row equalities, strict convex order, and even
some local actual-blocker failure semantics do not by themselves close the
branch. Their limitations—MEC, global K4, total critical shells, or minimality—
are load-bearing.

### 2.4 Fixed-cell Kalmanson terminals

The fixed-cell certificate work is mathematically sound within its stated
scope. In particular, the landed theorem

```lean
CardGeThirteenTwoCanonicalK4FixedCell.
  false_of_twoCanonicalK4_fixedCell
```

uses transparent finite normalizers and a 63-certificate Kalmanson bank, with
ordinary kernel reduction and standard axioms.

What is not proved is source-uniform occurrence of its exact base cell.

### 2.5 Exact artifact replay

All available executable artifacts replayed successfully in this audit:

| Artifact | Replay summary |
|---|---|
| diagonal two-cycle rational control | 11 roles, three exact fibers, zero geometric violations |
| five-good-source finite classifier | survivors only at 5 and 6; none at 7 or 8 |
| 15-point uncovered local control | all eight advertised exact checks pass |
| source-like exact-13 `z`-K4 control | 858 triangles, 1,430 Kalmanson; `484+11` row-domain kill |
| fixed center-9 bundle | `455/32/8` one/two/three-form support kills |
| shared-pair/A3 bundle | `494/1` support kills |
| A3 three-block bundle | 18 pair certificates, `10+8` one/two-form |
| two-canonical-K4 bundle | residual domains `27×16`, kills `144/176/112` |

The card-14 maximal-assignment certificate also checks directly: two strict
Kalmanson inequalities and three row equalities give

```text
d(1,4) > d(1,6) = d(1,9) > d(1,4).
```

This refutes that assignment only, not a full profile or the arbitrary-cardinal
leaf.

The colored seven-source finite classification was not accompanied by a
replayable artifact in the present session, and its claimed source-to-fan
implication is not landed. It should not be used as proof evidence.

---

## 3. The simpler correct proof architecture

The current route should be represented as follows.

```text
12 < card
  │
  ├─ sharp count: at least seven good sources
  │
  ├─ simple two-frontier-point/fiber pigeonhole
  │      → distinct blocker rows C0,C1 omitting one common d
  │
  ├─ overlay C0,C1 with the two disjoint A2 four-classes
  │
  ├─ exact double 2+2 partition
  │      ├─ large-interior arm → checked False
  │      └─ adjacent grid → OPEN blocker-inclusive order bridge
  │
  └─ uncovered strict-interior point z
         │
         ├─ fresh q outside z,C0,C1,K
         │      → same three exact rows survive z and q
         │      → OPEN fresh two-deletion/critical-shell terminal
         │
         └─ exact card 13
                → C0,C1,K pairwise disjoint
                → A = {z} ⊔ C0 ⊔ C1 ⊔ K
                → repaired I2 forces profile secondOpposite
                → A2 slices are unordered 2+3
                → raw Fin13 source-cell enumeration
                → all-center global-K4 Kalmanson CEGAR
```

### 3.1 No overlap branch is needed

Let

```text
S = insert z ((C0 ∪ C1) ∪ K).
```

Every row has card four and omits `z`, so `S.card ≤ 13` and `S ⊆ A`.

Either a point of `A` lies outside `S`, giving the fresh branch, or `A ⊆ S`.
In the latter case `A=S`. Since `12 < A.card`, equality forces:

```text
A.card = 13,
S.card = 13,
C0,C1,K pairwise disjoint.
```

Thus overlap automatically implies the fresh branch. The richer five-way
overlap/fresh/tight outcome can remain for diagnostics, but the terminal-facing
proof should use the two-arm theorem.

A useful corollary is:

```text
card A ≥ 14
→ the uncovered branch always has a fresh second deletion.
```

The exact tight branch is purely an exact-card-13 problem.

### 3.2 The large-interior exact-13 profile has no three-profile split

After the non-wrapping I2 repair:

```text
|I2| = 5 for .secondOpposite,
|I2| = 4 for .surplus and .firstOpposite.
```

The uncovered branch comes from

```text
5 ≤ |(firstRow ∩ I2) ∪ (secondRow ∩ I2)|.
```

Therefore the latter two profiles are impossible. In `.secondOpposite`:

- `I2.card=5`;
- the two A2 classes are disjoint;
- each contributes at least two I2 points;
- their union has at least five points and lies in I2.

Hence they partition I2 with cards `2+3` or `3+2`.

This removes a factor of three from the finite source classifier and should be
formalized before further cell enumeration.

### 3.3 The A1 row is more constrained than earlier encoders used

The raw A1 support `Traw` is source-complete:

- exact card four;
- exact image equal to the A1 selected class;
- contains distinct raw preimages of `R.interior_q` and `R.interior_w`;
- each good source lies outside it, after exposing the currently private
  source-not-in-first-class lemma;
- the frontier deletion raw label also lies in it.

The finite encoder should leave the two frontier/interior pairs distinct unless
the source proves more. It should not pin `d` to an I1 label.

---

## 4. Computational simplifications

### 4.1 Use Boolean support CEGAR before monolithic LRA

The monolithic all-center QF_LIRA query returned `UNKNOWN`. That is not
evidence.

The Boolean support CEGAR is the correct first layer:

1. exact card-four supports;
2. center exclusions;
3. source-owned row memberships and omissions;
4. circle-intersection and pair-codegree constraints;
5. direct/mirror/profile order;
6. lazy quotient Kalmanson certificates.

Only a support system surviving the complete Kalmanson layer should enter
rational LRA or planar QF_NRA.

### 4.2 Add the existing two-row clauses up front

The most frequent early one-form cut is not new mathematics. For
`a<b<c<d`, two selected rows cannot realize either nonalternating shared-pair
pattern:

```text
row(a) and row(d) both contain {b,c},
```

or dually

```text
row(a) and row(b) both contain {c,d}.
```

These are existing strict-Kalmanson/shared-pair terminals. All source-fixed and
conditional instances should be encoded before the lazy loop.

### 4.3 Mine schema orbits, not one thousand certificate hashes

After the two-row family was preloaded, 1,000 more Boolean models were killed:

```text
998 by one-form quotient cancellation,
2 by two-form cancellation.
```

Every residual one-form certificate used at least three rows.

The next step should canonicalize each shortest equality path as a small
row-incidence hypergraph and quotient it by cyclic/reflection symmetry.
Likely outputs are:

- existing three-equality schemas;
- the landed five-role/two-Kalmanson cycle;
- a small number of new three-row equality-chain schemas.

Adding whole schema orbits is much more efficient than adding one model-specific
cut at a time.

### 4.4 Replace 495-support dispatches by safe-pair graphs

For a fixed row-equality cell and challenge center:

1. compute every forbidden support pair;
2. form the graph of pairs still allowed;
3. enumerate four-cliques of the safe graph;
4. only classify the residual cliques.

Examples already obtained:

- one A3 row domain collapses through an 18-pair, three-block pigeonhole;
- one uncovered-`z` domain has a minimum 19-pair, three-block cover;
- the two-canonical theorem reduces `495×495` supports to `27×16`.

This should be the standard finite row-domain interface.

### 4.5 Keep fixed-cell theorem proving separate from source coverage

The fixed-cell kernels are trustworthy and reusable as certificate-checker
tests. They should not each receive an on-spine adapter.

The source classifier should instead emit a normalized cell identifier and
invoke a cell-specific certificate bank. A missing bank is a finite search
task; a missing source-to-cell map is a mathematical ingress task. Mixing the
two obscures progress.

---

## 5. Remaining blockers, after simplification

### 5.1 Adjacent-grid branch

Still missing:

```text
blocker-shell memberships
→ blocker-inclusive cyclic order / signed-area packet
→ existing nested-escape or one-Kalmanson terminal.
```

Anonymous four-hit radial order is insufficient.

### 5.2 Fresh second-deletion branch

The three fixed rows omit both `z` and `q`, but no checked terminal consumes
only those two deletion views.

The next source-faithful split should add the critical shells for `z` and `q`:

- actual blockers and their source-containing exact rows;
- blocker equality versus inequality;
- two cross-membership bits;
- which of those rows survives the opposite deletion.

This is a bounded local residual and is the real arbitrary-cardinality
terminal for the uncovered branch.

Do not replace a critical-shell row with the unrelated global-K4 row centered
at the same source.

### 5.3 Exact-card-13 tight branch

The raw ingress is close, but two source bridges should precede more computation:

1. `hlarge` plus repaired profile/cardinality facts implies
   `.secondOpposite` and an unordered `2+3` A2 slice partition, preserving row
   identities;
2. a public good-source-to-A1-class-off theorem, plus raw transport.

Also export:

```text
d ∈ Traw
d = zraw ∨ d ∈ Kraw.
```

Then run a source-derived direct/mirror finite classifier with:

- variable `C0,C1,K,L,T`, not fixed supports;
- raw source/blocker/deletion labels;
- global K4 supports at all thirteen centers;
- two-row Kalmanson clauses preloaded;
- lazy schema-level quotient cuts.

### 5.4 Durability gap

At the audited HEAD, the following mathematically useful work was not yet
durable:

- non-wrapping I2 repair and regressions;
- the two-arm fresh/tight source theorem;
- provenance-preserving tight outcome;
- exact-13 raw support ingress.

Further finite claims should pause until these are committed, pushed, and
replayed from a clean checkout. Otherwise source-cell results remain tied to a
foreign-dirty worktree.

---

## 6. Recommended order of work

1. **Make the source layer durable.** Commit the I2 repair, regressions,
   fresh/tight theorem, and raw ingress.
2. **Land the profile-to-`2+3` theorem** and public good-source-off-A1 lemma;
   export `d∈T` and `d=z∨d∈K`.
3. **Finish the fresh-branch residual**, because it handles every uncovered
   configuration of cardinality at least 14.
4. **Continue exact-13 all-center Boolean CEGAR**, but canonicalize cuts into
   reusable row-equality schemas before adding more iterations.
5. **Attack the adjacent-grid blocker-order bridge** in parallel.
6. Use fixed-cell Lean terminals only after a source-complete cell dispatcher
   selects them.

---

## 7. Bottom line

The work was not invalidated, but it was less close to closing the live root
than some of my interim summaries suggested.

What is genuinely accomplished:

- the arbitrary source produces a common-deletion pair at distinct blockers;
- the geometric branch reduces to adjacent grid or uncovered strict interior;
- large-interior double partition is closed;
- the uncovered branch reduces to a fresh second deletion or exact card 13;
- exact finite Kalmanson certificate infrastructure is demonstrably effective.

What is not accomplished:

- the colored source-to-three-fan implication;
- the fresh two-deletion terminal;
- the adjacent-grid terminal;
- source-complete exact-13 cell coverage;
- all-center CEGAR UNSAT;
- removal of the live `sorry`.

The cleanest current characterization is:

> `cardGeThirteen` is no longer an amorphous arbitrary-cardinality problem. It
> is three sharply separated obligations: an adjacent-grid order bridge, a
> cardinality-generic fresh two-deletion/critical-shell terminal, and a finite
> exact-card-13 all-center K4 classification.

By the project's own audit standard, the fixed-cell certificates and new
packets are interface/certificate progress until one of those three obligations
is connected to the publication root and removes its `sorryAx` path.
