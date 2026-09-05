# `cardGeThirteen` New-Chat Handoff

**Prepared:** 2026-09-04 (America/Los_Angeles)  
**Project:** Erdős 97–96 formalization  
**Repository:** `mysticflounder/erdos-97-96-formalization`  
**Collaboration channel:** nthdegree `#erdos-97-96-formalization`  
**Primary target:**

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen
```

Historically this target has been near `Rigid221Closure.lean:1252`, but line
numbers drift. Locate it by fully qualified name rather than trusting that line.

---

## 0. Ready-to-paste opening message for the new chat

Use this as the first message in the new chat, together with this handoff file:

> Continue the `cardGeThirteen` closure campaign from the attached handoff.
> Work against the current repository source, not stale mined indices or old
> line numbers. First verify the current HEAD, dirty/untracked files, live target
> signature, and whether the repaired exact-13 I2 valuation and
> `CardGeThirteenExact13RawIngress.lean` have been committed since this handoff.
>
> The target is genuinely arbitrary-cardinality (`12 < D.A.card`), so do not
> treat exact-card-13/14 certificates as general closure. The present proof tree
> has three independent open terminals: adjacent grid, the arbitrary-cardinality
> fresh-point arm, and source-complete exact-card-13 tight-cell coverage.
>
> Start with the highest-leverage source task: land or revalidate the repaired
> `DRExactThirteenValuation.secondOppositeInterior`, then prove the physical,
> unordered `2+3` I2 theorem from the exact-13 profile plus the large-interior
> arm. Feed that into a source-complete raw labelled-cell packet and the
> all-center K4/Kalmanson support classifier. Reuse the landed fixed-cell
> certificate infrastructure only after a source classifier selects the cell.
>
> Preload generic two-row and three-row Kalmanson schema families before more
> cell-by-cell CEGAR. Treat solver `UNKNOWN` and iteration limits as non-results.
> Use Luna-swarm agents in nthdegree for bounded Lean formalizations, with exact
> FQNs, focused build, marker scan, `#print axioms`, and no live-sorry rewiring
> until all outcomes have checked consumers.
>
> Do not repeat the invalid routes listed in the handoff: bounded-subcarrier K4
> inheritance, the withdrawn global `n ≤ 32` argument, the old vacuous
> `Finset.Ico ... 13` I2 sets, the original three-fan statement without explicit
> distinctness, oriented `K=2/L=3` assumptions, or claims that a fixed-cell K4
> theorem is source-uniform.

---

## 1. Executive status

The live theorem remains open. The original blocker report was accurate that
there was no geometric witness or infeasibility theorem for the whole branch,
but several genuine advances have since been made:

1. The sharp source count gives at least seven good outside sources whenever
   `12 < D.A.card`.
2. A source-native seven-source classification reduces to a mutually omitted
   pair with distinct blockers and one common frontier deletion; its unique
   colored residual is eliminated by a corrected three-fan theorem.
3. Overlaying the two full A2 radius classes gives an uncovered-point versus
   exact double-`2+2`-partition split.
4. The large-interior side of the double-partition branch has a checked
   source-clean contradiction.
5. The adjacent-grid side remains open.
6. In the uncovered branch, the common omitted point can be chosen in the
   strict second-opposite interior.
7. A pure finite theorem gives:

   ```text
   fresh point outside the three retained rows
   OR
   exact-card-13 tight cover by three disjoint card-four rows plus z.
   ```

8. Exact-card-13 fixed cells now have kernel-checked Kalmanson/global-K4
   terminals, including a compressed two-canonical-K4 theorem.
9. No fixed challenge center or small challenge set is proved source-universal.
10. The all-center support/Kalmanson campaign is active but has not returned
    Boolean UNSAT or a rational survivor.

The route is therefore substantially de-risked but not closed. The three
independent open branches are:

```text
A. double-partition adjacent grid;
B. uncovered/fresh point at card >= 14;
C. exact-card-13 tight source-cell coverage and finite all-center K4 closure.
```

Completing C alone does not close A or B.

---

## 2. The honest proof tree

```text
12 < D.A.card
  |
  +-- sharp count: 7 <= goodOutsideSources.card
  |
  +-- seven-source source classifier
  |     |
  |     +-- desired pair:
  |     |     distinct good sources s,t
  |     |     distinct actual blockers b,c
  |     |     mutual source omission
  |     |     common deleted d in {F.pair.q,F.pair.w}
  |     |     d omitted from both actual rows
  |     |
  |     +-- unique colored seven-row residual
  |           -> three-fan order/alias classification
  |           -> corrected scalar/Kalmanson geometry
  |           -> False
  |
  +-- overlay two disjoint full A2 classes K_rho,K_sigma
        |
        +-- common uncovered A2-class point z
        |     |
        |     +-- choose z in strict oppIndex2 interior
        |     |
        |     +-- fresh q outside three rows
        |     |     [automatic for carrier card >= 14]
        |     |     -> same three rows survive z and q
        |     |     -> D.K4 supplies q-centered row
        |     |     -> no source-clean terminal yet                 [OPEN B]
        |     |
        |     +-- exact-card-13 tight cover
        |           -> repaired exact-13 profile/boundary ingress
        |           -> physical unordered 2+3 I2 theorem            [small gap]
        |           -> source-complete raw Fin13 cell
        |           -> all-center K4 support/Kalmanson classifier    [OPEN C]
        |
        +-- no common uncovered class point
              -> exact double 2+2 partition
                    |
                    +-- large-interior arm -> False                 [CLOSED]
                    |
                    +-- adjacent-grid arm                           [OPEN A]
```

---

## 3. Status vocabulary for the new chat

Use these labels rigorously:

- **LANDED:** committed/pushed, source-clean, focused build and axiom audit done.
- **COMPILED BUT UNLANDED:** exists in the shared checkout and compiles, but was
  dirty/untracked or blocked by foreign staged paths at the latest audit.
- **SOURCE-COMPLETE MATHEMATICS:** proof is supported by current source binders,
  but may not yet have a durable Lean theorem/import edge.
- **CONDITIONAL:** theorem/certificate is valid only after extra premises or a
  finite occurrence cell is supplied.
- **FIXED-CELL:** exact finite terminal for one normalized support/order cell;
  not source-uniform.
- **REFUTED/WITHDRAWN:** do not reuse without materially stronger hypotheses.
- **DIAGNOSTIC ONLY:** SAT/UNKNOWN/local rational model used to define a proof
  boundary, not a source witness or theorem.

A source-clean wrapper is not closure if the publication root still reaches a
`sorryAx` child.

---

## 4. Proved or landed foundations

### 4.1 Sharp good-source count

The source calculation is:

```text
outsideFirstApexFiber.card + 4 = D.A.card
goodOutsideSources.card + badOutsideSources.card
  = outsideFirstApexFiber.card
badOutsideSources.card <= 2
```

Therefore:

```text
D.A.card <= goodOutsideSources.card + 6
12 < D.A.card -> 7 <= goodOutsideSources.card.
```

Relevant intended declarations:

```lean
carrier_card_le_goodOutsideSources_card_add_six
seven_le_goodOutsideSources_card_of_card_gt_twelve
```

Earlier collaboration reported this work landed around commit `617c84a61`.
Verify the exact current commit/FQN before relying on it.

**Important pair distinction:** `goodOutsideSources` uses
`F.pair.q/F.pair.w`. It does not use `R.interior_q/R.interior_w`.

### 4.2 Seven-source occurrence

The literal omission data—not merely abstract nonempty subsets—exclude a
four-source singleton-color blocker fiber: a card-four blocker fiber already
fills its card-four selected support, while a singleton omission color would
force the opposite frontier point into that support.

The source classification gives either the desired mutually omitted/common-
deletion pair or a unique singleton-fiber colored seven-row residual. The
residual contains a three-fan:

```text
X : {A,B,C}
Y : {A,B,D}
Z : {A,C,D}.
```

The corrected pure geometry requires explicit distinctness/alias handling:

- all seven roles distinct: two order orbits;
- exactly one cross alias: one order up to reversal;
- two cross aliases: separation facts inconsistent.

Do not use the old implication with only
`ConvexIndep ({A,B,C,D,X,Y,Z} : Finset R2)`: Finset deduplication makes that
statement false. Use an injective label map, cardinality seven, or explicit
nonalias hypotheses.

### 4.3 Uncovered versus double partition

With all card/coverage/intersection hypotheses present, there is a valid exact
split:

```text
exists z in K_rho union K_sigma omitted by both blocker rows
OR
each blocker row takes exactly 2 points from each class,
the traces are complementary, and the rows partition the two classes.
```

Intersection bounds alone do not imply the global partition. The proof needs
full class cardinalities, coverage, shell cardinalities, and disjointness.

### 4.4 Double-partition large-interior terminal

Reported checked declarations include:

```lean
Problem97.ATailCapInteriorEquidistant.
  false_of_capInterior_center_equidistant_three_points

false_of_twoRadius_doublePartition_largeInterior
```

The key argument is that five strict-interior class points distributed across
two partition rows force one row to contain three; a same-radius pair localizes
its blocker center and the third interior equidistant point contradicts the cap
geometry theorem.

The remaining double-partition outcome is the adjacent grid.

### 4.5 Uncovered strict-interior adapter

Reported module:

```text
P97/ATail/FrontierLiveClosure/
  CardGeThirteenUncoveredStrictInterior.lean
```

It corrects an earlier overstatement: the trace-cardinality bounds are only
inside the physical set

```text
I = (firstRow.support intersect oppInterior2)
  union (secondRow.support intersect oppInterior2),
```

not on the whole cap.

### 4.6 Pure fresh-or-tight Finset theorem

Reported modules/declarations:

```text
P97/ATail/ThreeRowsFreshOrExactThirteenTight.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenThreeRowsTightAdapter.lean

ThreeRowsFreshOrExactThirteenTight_split
threeRowsFresh_or_exactThirteenTight_twoArm
cardGeThirteenPacket_fresh_or_exactThirteenTight_provenance
```

The critical-path form is only:

```text
fresh q outside insert z (C0 union C1 union K)
OR
A.card = 13 and A = insert z (C0 union C1 union K),
with C0,C1,K pairwise disjoint card-four supports.
```

The richer overlap/fresh/tight outcome is useful for provenance but should not
be the main terminal tree. Any overlap makes the union too small, hence belongs
to the fresh arm.

Immediate corollary:

```text
card >= 14 -> fresh arm.
```

Thus the finite exact-cell campaign applies only to the exact-card-13 no-fresh
branch.

---

## 5. Exact-13 source bug and current raw-ingress status

### 5.1 Major repaired bug: wrapping `Fin 13` interval

The old definition used expressions such as:

```lean
Finset.Ico 8 13
Finset.Ico 9 13
```

inside `Fin 13`. Since `13 : Fin 13 = 0`, every old
`secondOppositeInterior` set was empty. Old membership/order proofs were
therefore vacuous.

The working repair is:

```text
Icc 8 12
Icc 9 12
Icc 9 12
```

with profile cardinalities:

```text
5,4,4.
```

The repaired chart has:

```text
raw 9 in every I2 set;
raw 8 only in the secondOpposite profile.
```

Reported checked declarations include:

```lean
DRExactThirteenValuation.secondOppositeInterior_image_eq
DRExactThirteenValuation.firstOppositeInterior_image_eq
DRExactThirteenValuation.surplusInterior_image_eq
```

At the latest audit, the repaired source compiled but was dirty/uncommitted.
Verify whether this has since landed before using it.

### 5.2 Raw ingress module

Latest reported working module:

```text
P97/ATail/FrontierLiveClosure/CardGeThirteenExact13RawIngress.lean
```

Reported exports:

```lean
rawSupportPreimage_image_eq
rawSupportPreimage_card_eq
rawSupportPreimage_disjoint
raw_tight_support_of_exact_cover
raw_other_outer_support_of_tight
raw_firstApex_support_with_interior_pair
exists_raw_goodSourceWitness_labels
exists_K4_row_at_raw_label
raw_two_three_partition_of_physical_unordered
source_not_mem_firstApexClass_of_mem_outside
raw_label_not_mem_of_goodOutsideSource
```

The intended content is:

- raw preimages `C0raw,C1raw,Kraw`, card four, pairwise disjoint;
- exact image equalities to the physical three rows;
- union equal to `univ.erase zraw`;
- the opposite A2 class `Lraw`, card four, disjoint from `Kraw`, containing
  `zraw`;
- the A1 exact class `Traw`, card four, with two distinct repaired-I1 labels;
- raw good-source/blocker/deletion labels;
- global K4 row existence at any raw carrier label.

At the latest audit this module was **compiled but untracked, uncommitted, and
not imported by the live dispatcher**. Do not call it landed merely because a
focused check passed.

---

## 6. Smallest missing source theorem for exact-card-13

The main missing bridge is not a fixed-label theorem. It is a physical,
symmetric profile theorem.

### 6.1 Desired content

From:

- exact-card-13 profile ingress;
- two disjoint full A2 classes;
- the no-five/full-class rewrite;
- each row's strict-I2 slice cardinality at least two;
- the large-interior union lower bound at least five;

prove:

```text
profile = secondOpposite
and
(
  |K intersect I2| = 2 and |L intersect I2| = 3
  or
  |K intersect I2| = 3 and |L intersect I2| = 2
)
and
(K intersect I2) union (L intersect I2) = I2.
```

Do not orient `K` as the two-point slice. `thirdRow_named` does not force that
orientation.

### 6.2 Short proof idea

Use the already available exact profile alternatives:

```lean
exactThirteen_profile_of_twoRadiusBranch
```

The `.surplus` and `.firstOpposite` profiles have repaired I2 cardinality four,
contradicting a five-point large union. Hence the profile is
`.secondOpposite`, whose I2 has cardinality five. Each disjoint full class
contributes at least two points, so the only possible slice-card pair is
`2+3` in either order, and the five-point union saturates I2.

### 6.3 Architectural simplification

There is no need to thread `hlarge` through every intermediate packet. At the
exact-tight consumer, re-invoke the source-clean:

```text
large-interior OR adjacent-grid
```

split on the same two A2 rows:

- grid returns to the independent grid residual;
- large supplies the premise for the symmetric `2+3` theorem and raw ingress.

This avoids a broad record refactor.

---

## 7. Fixed-cell certificate work: what is landed and what it does not prove

### 7.1 Two-canonical-K4 fixed-cell theorem

Landed commit:

```text
3613954825e06392eecf67cf1a0706f1cc77cc7e
```

Main theorem:

```lean
Problem97.ATailFrontierLiveClosure.
  CardGeThirteenTwoCanonicalK4FixedCell.
  false_of_twoCanonicalK4_fixedCell
```

Related normalizers/bank:

```lean
CardGeThirteenTwoCanonicalK4FixedCellNormalizers.center2_normalize
CardGeThirteenTwoCanonicalK4FixedCellNormalizers.center5_normalize
CardGeThirteenTwoCanonicalK4FixedCellCertificateBank.jointCertificate
CardGeThirteenTwoCanonicalK4FixedCellCertificateBank.jointCertificate_check
```

Compression:

```text
center 2: 495 supports -> 27 residual supports via 18 pair no-goods
center 5: 495 supports -> 16 residual supports via 27 pair no-goods
joint: 27*16 = 432 cells -> 63 reused certificate tuples
certificate lengths: 144 one-form, 176 two-form, 112 three-form.
```

Ordinary kernel reduction is used; no `native_decide` or external solver axiom.

### 7.2 Scope

This theorem is **fixed-cell only**. A source theorem must first identify the
same direct/mirror support cell. Other corrected source-like cells admit K4 at
those two centers.

Do not infer a universal challenge pair or source-uniform hitting set.

### 7.3 Earlier fixed-cell row-domain terminals

Reported durable work includes:

```text
CardGeThirteenCenter9K4RowDomain.lean
```

and a center-9/global-K4 fixed-cell theorem reportedly pushed around commit
`93b871f29` before the stronger two-canonical theorem. Verify current ancestry.

The 495-way row domain was also compressed in some cells to three-block pair
banks. These are useful theorem-size reductions after occurrence, not a
substitute for source coverage.

### 7.4 Authoritative bundle

nthdegree file:

```text
01M1PJ731KGA2M0FBVH999NB2K
```

Authoritative receipt SHA-256:

```text
35e4cead03ce736e2c09d8a3c7bd55166b3dc8af23f89e13fe558ffdeeb2db1b
```

An older post omitted the final `b`; use the digest above.

---

## 8. Computational claim boundary

### 8.1 Exact certificates that replay

The standard-library verifiers for these artifacts replayed successfully:

- card-14 maximal-witness Kalmanson contradiction;
- exact-13 center-9 row domain;
- exact-13 shared-pair/A3 row domain;
- A3 three-block pair compression;
- two-canonical-K4 fixed-cell bank;
- corrected source-like `z` row-domain control.

### 8.2 All-center campaign

A direct all-center QF_LIRA query containing the named rows, source/deletion
roles, 13 K4 supports, strict triangle/Kalmanson inequalities, and overlap
bounds returned:

```text
UNKNOWN
```

after the bounded run. This proves neither SAT nor UNSAT.

The Boolean support CEGAR then proceeded with exact quotient replay:

1. the first 100 models all died by one Kalmanson form;
2. every generic two-row local obstruction was installed globally;
3. the next 1,000 models yielded:

   ```text
   998 one-form cancellations involving at least 3 rows
     2 two-form cancellations
   ```

4. the run stopped at its iteration limit;
5. no Boolean UNSAT certificate was obtained;
6. no rational LRA survivor was obtained.

This is theorem-mining evidence, not closure.

### 8.3 Mined generic two-row schema

For cyclic order `a<b<c<d`:

- rows centered at `a` and `d` cannot both contain `b,c`;
- dually, rows centered at `a` and `b` cannot both contain `c,d`.

Each is one strict Kalmanson inequality made impossible by two row equalities.
Install every source-allowed instance before CEGAR.

### 8.4 Next generic theorem family

After two-row cuts were factored out, remaining one-form cuts used equality
paths through at least three rows. Normalize them under cyclic shift/reflection
and compare them against:

```text
KalmansonThreeEqualitySchemas
KalmansonThreeRowCycleSchemas
KalmansonSmallRoleCycleSchemas
OrdinalKalmansonCycle
```

Do not learn thousands of cell-specific hashes when a small orbit family can be
formalized once.

---

## 9. Separate open branch A: adjacent grid

The double-partition grid arm has:

- two disjoint full A2 classes at distinct radii;
- exact adjacent-cap placement;
- two blocker rows, each taking two points from each radius class;
- source and common-deletion provenance from the seven-source route.

What remains missing is a source-rich order/sign adapter for the blocker
centers and row supports. Existing grid terminals are hard-wired to other apex
indices or stronger retained/source-return packets.

Previously proposed split:

```text
balanced 1+1 traces -> zero-cut/nested-escape style terminal
unbalanced 2+0 traces -> one Kalmanson radius-reversal contradiction
```

The first exact missing antecedent in the unbalanced arm was reported as a
blocker-inclusive cyclic order such as:

```lean
ConvexCyclicOrder D.A S.oppApex2 X x b
```

The current `oppIndex2` producer exports anonymous `FourHits`/radial order, not
that source-rich role order.

Treat grid as an independent theorem-discovery lane. Do not claim it is closed
by the exact-card-13 finite work.

---

## 10. Separate open branch B: fresh point

When card is at least 14, the uncovered three-row packet is automatically in
the fresh arm. It supplies a carrier point `q` outside:

```text
z and the three retained row supports.
```

Source-clean consequences:

- the retained A2 row survives deleting `q`;
- the same three centers/rows survive deletion of both `z` and `q`;
- `D.K4 q` gives an arbitrary selected four-class centered at `q`;
- `no_qfree_at` supplies actual-blocker failure data at the chosen blocker for
  source `q`.

No checked source-clean terminal currently consumes only this information.
Nearest sinks require one of:

- a second q-deleted row and positive cross-incidences;
- overlap at least three with a distinct-center row;
- a six-role boundary-order/Kalmanson packet;
- stronger repeated-deletion/four-center provenance;
- the full seven-source system rather than the selected pair.

Do not route through the sorry-backed TwoDeletion blocker-coincidence or
survival-square leaves.

A useful next search is to retain the full seven-source raw system and ask
whether the extra six rows force a positive occurrence around the fresh
q-row. The isolated three-row local geometry has exact rational controls, so a
pure local-circle theorem is unlikely to suffice.

---

## 11. Rejected or withdrawn routes

### 11.1 Bounded induced subcarrier

Invalid. Global K4, minimality, critical shells, cap/MEC packets, robust apex
structures, and exact boundary exhaustion are not hereditary.

### 11.2 Global `n <= 32` cap-growth bound

Withdrawn. The calculation bounded only pure-growth subarms while silently
holding the other cap excesses at baseline. MultiGrowth remains unbounded.

### 11.3 Fixed-card-14 SAT/NRA as arbitrary-cardinality closure

Invalid. The maximal assignment has a short exact Kalmanson contradiction, but
that does not close all profile assignments or the general theorem. Solver
`UNKNOWN` is not evidence.

### 11.4 Old empty I2 chart

Invalid for source transport. Any theorem using old
`secondOppositeInterior_mem` may have been vacuous. Revalidate after the `Icc`
repair.

### 11.5 Three-fan without explicit distinctness

False as stated. Finset convex independence does not prevent deduplication.

### 11.6 Treating `R.interior_q/w` as the good-source deletion pair

Wrong. Use `F.pair.q/w` for omission colors. Retain `R.interior_q/w`
separately for the A1/I1 class.

### 11.7 Oriented `K=2, L=3`

Unsupported. The source gives only an unordered `(2,3)/(3,2)` alternative.

### 11.8 Tight-cover blocker-row `2+2+1`

Wrong in the exact-tight branch. The full opposite A2 row minus z has a
`1+2` trace; `2+2+1` belongs only to an earlier weaker strict-interior packet.

### 11.9 Early rational controls as full source witnesses

Wrong. They omit global K4/minimality or fail exact cap order, A1-class, MEC,
or blocker-system obligations. Use them only to refute overbroad local lemmas.

### 11.10 More handwritten fixed-cell terminals as the main strategy

Low leverage. Use a generic source-cell code/interpreter and certificate data
bank; keep fixed cells as regressions.

---

## 12. Highest-leverage next work

### Priority 1 — make the corrected raw ingress durable

1. Check whether the `Icc` repair and raw ingress have landed.
2. If not, inspect the shared index/foreign paths; exact-path stage and commit
   only after ownership is clear.
3. Add/recheck regression theorems:

   ```text
   I2 cards = 5,4,4
   raw 9 is in every I2 profile
   raw 8 iff profile = secondOpposite
   exact I1/I2/surplus image equalities
   ```

4. Verify the direct importer closure and `#print axioms`.

### Priority 2 — prove the physical unordered `2+3` theorem

Use `exactThirteen_profile_of_twoRadiusBranch`, repaired I2 cardinalities,
row-local slice lower bounds, `hnoFive`, class disjointness, and `hlarge`.
Re-invoke large-interior/grid at the exact-tight consumer if necessary.

This is the smallest missing source theorem before finite enumeration.

### Priority 3 — define a source-complete finite cell code

Suggested conceptual structure:

```lean
structure Exact13TightCellCode where
  profile : ExactThirteenTwoRadiusCapProfile
  orientation : DirectOrMirror
  zraw : Fin 13
  C0raw C1raw Kraw Lraw Traw : Finset (Fin 13)
  source0 source1 blocker0 blocker1 deleted : Fin 13
  -- exact card/image/disjointness/partition facts
  -- unordered 2+3 profile
  -- 1+2 L\{z} trace
  -- source membership/omission and blocker facts
  -- A1 interior pair
```

Add a theorem from the raw source packet to a valid cell code. Do not pin
supports to old fixed cells.

### Priority 4 — generic certificate interpreter

Use the existing weighted-Kalmanson checker and define code-indexed finite
certificate data. Avoid one Lean theorem per support cell.

### Priority 5 — preload generic schema families

Install all legal instances of the two-row Kalmanson obstruction. Normalize and
formalize the observed three-row chains before another long CEGAR run.

### Priority 6 — all-center K4 support campaign

For each source cell:

1. challenge `z` first;
2. add K4 rows at source-canonical apex/interior roles;
3. continue to all raw centers if needed;
4. use Boolean support SAT plus exact quotient cuts;
5. run rational LRA only on a complete finite-schema survivor;
6. run planar/MEC QF_NRA only after the LRA layer survives.

Preserve exact receipts, replay commands, and shortest equality-path
provenance.

### Priority 7 — keep A and B visible

Do not let the exact-card-13 campaign hide the independent adjacent-grid and
fresh-point terminals.

---

## 13. Luna-swarm formalization requests suitable for immediate routing

Route these to Luna-swarm agents in nthdegree.

### Request A: unordered physical `2+3` theorem

> Prove a source-clean physical theorem in the exact-13 two-radius branch:
> under `hlarge`, exact profile ingress, two disjoint full A2 classes, no-five,
> and the two row-local I2 lower bounds, the profile is `.secondOpposite`; the
> two I2 slices partition the repaired I2 set; and their cardinalities are
> `(2,3)` or `(3,2)`. Do not orient K/L. Keep the theorem below the raw transport
> and off `Rigid221Closure`; focused build, markers, and `#print axioms`.

### Request B: source-to-cell-code adapter

> Define an additive `Exact13TightCellCode` using raw preimages and exact image
> equalities, and prove the source packet yields one valid code. Preserve all
> source identities and omissions. Do not assign unsupported fixed labels and
> do not add a terminal theorem in the same lane unless a current certificate
> bank covers every code outcome.

### Request C: generic three-row Kalmanson chain

> Extract the recurring one-form equality-chain patterns from the all-center
> CEGAR after the two-row family is removed. Normalize under cyclic shift and
> reflection, compare against existing three-equality/cycle schemas, and land
> only genuinely missing source-neutral theorems. Each theorem should consume
> explicit selected-row memberships and one/two strict Kalmanson inequalities,
> with no fixed n.

### Request D: exact grid order adapter

> From the double-partition adjacent-grid packet at `oppIndex2`, produce the
> blocker-inclusive direct-or-reflected cyclic order and radial-sign facts
> needed by the balanced nested-escape and unbalanced radius-reversal
> terminals. Report the first missing source field before adding wrappers.

### Request E: fresh-arm occurrence audit

> Work from the full seven-source system plus a fresh q outside the selected
> three rows. Retain q's K4 row and actual blocker. Search for a source-clean
> positive cross-incidence/order occurrence feeding an existing Kalmanson,
> tetrahedron, or repeated-deletion terminal. Do not use B2/B3 sorry-backed
> consumers and do not infer a terminal from the local three-row packet alone.

---

## 14. Validation standard for any claimed closure

A claim that the live sorry is closed must include:

1. exact source HEAD and clean/dirty status;
2. target FQN with no `sorry` body;
3. direct parent consumer compilation;
4. focused and relevant aggregate Lake build;
5. marker scan for `sorry`, `admit`, `axiom`, `unsafe`, `native_decide`;
6. `#print axioms` for every new terminal and the live target;
7. before/after publication-root `sorryAx` reachability;
8. source-occurrence proof for every finite certificate cell;
9. exact independent replay for computational banks;
10. no fixed-cardinality or induced-subcarrier substitution for the arbitrary
    theorem.

A compiled interface that leaves the target importing a `sorryAx` terminal is
progress, not closure.

---

## 15. Important artifacts and receipts

### Retrospective audit

```text
cardGeThirteen-retrospective-audit-2026-09-04.md
SHA-256:
2a913eead8e5a451675f48c6498dff96a599f6936a2948ad7e703c9abccd21d9
```

### Two-canonical fixed-cell bundle

```text
nthdegree file ID: 01M1PJ731KGA2M0FBVH999NB2K
receipt SHA-256:
35e4cead03ce736e2c09d8a3c7bd55166b3dc8af23f89e13fe558ffdeeb2db1b
```

### Corrected source-like z-row verifier

```text
cardge13_exact13_source_like_z_k4_verifier.py
SHA-256:
2313ea2a2780517c82c015ce93af922d0fb5b679772ffbf38cb3b60b3f626412
```

Checkpoint:

```text
cardGeThirteen-exact13-source-like-z-k4-checkpoint-2026-09-04.md
SHA-256:
ba782cb796febc7624b7952e0969afbb0d51781b979ace0a0ede1e8e6ecbaf75
```

### Fixed-cell landed theorem

```text
commit:
3613954825e06392eecf67cf1a0706f1cc77cc7e

FQN:
Problem97.ATailFrontierLiveClosure.
  CardGeThirteenTwoCanonicalK4FixedCell.
  false_of_twoCanonicalK4_fixedCell
```

### Earlier maximal card-14 handoff

The exact maximal-survivor contradiction and route checkpoint were posted in
nthdegree around messages `#9463` and related files. Treat these as assignment-
level theorem discovery, not profile-wide/general closure.

---

## 16. Repository files to inspect first

Locate by basename/FQN; paths may have shifted.

```text
P97/ATail/FrontierLiveClosure/Rigid221Closure.lean
P97/ATail/ExactFourPhysicalConsumer.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenTerminalSplitV2.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenUncoveredStrictInterior.lean
P97/ATail/ThreeRowsFreshOrExactThirteenTight.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenThreeRowsTightAdapter.lean
P97/ATail/FrontierLiveClosure/DRExactThirteenValuation.lean
P97/ATail/FrontierLiveClosure/DRExactThirteenBranchIngress.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenExact13RawIngress.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenCenter9K4RowDomain.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenTwoCanonicalK4FixedCell*.lean
P97/ATail/FrontierLiveClosure/CardGeThirteenTwoRadiusSplit.lean
P97/ATail/TwoFullSecondApexClassesLargeInteriorOrGrid.lean
P97/ATail/ThreeCenterCommonDeletion.lean
P97/ATail/CapCrossingKalmanson.lean
P97/ATail/KalmansonThreeEqualitySchemas.lean
P97/ATail/KalmansonThreeRowCycleSchemas.lean
P97/ATail/KalmansonSmallRoleCycleSchemas.lean
P97/ATail/SelectedFourClassWeightedKalmansonIngress.lean
```

Also inspect current scripts and runs under names resembling:

```text
scripts/cardge13_exact13_*
scratch/runs/exact13-source-enumerator-20260904/
```

Do not assume a generated artifact is committed or authenticated merely because
it exists in the shared worktree.

---

## 17. Questions the new chat should answer explicitly

1. Have the repaired I2 valuation and raw ingress been committed and pushed?
2. Is the live target still at the same signature, and how many direct child
   outcomes does it currently dispatch?
3. Can the physical unordered `2+3` theorem be proved by re-invoking the
   large-interior/grid split without changing packet structures?
4. What is the exact source-cell count after raw incidence/profile constraints,
   before adding K4 rows?
5. Which generic three-row Kalmanson orbits explain the current 1,000 learned
   one-form cuts?
6. Does the all-center Boolean campaign become UNSAT after those orbit families,
   or does an equality/LRA survivor remain?
7. What is the smallest source field missing from the adjacent-grid order
   adapter?
8. What additional occurrence does the full seven-source system force in the
   fresh arm?
9. Which work is landed versus merely present in the shared checkout?
10. Does any proposed change actually remove a publication-root `sorryAx` edge?

---

## 18. Final warning and strategic recommendation

The exact mathematics has been more reliable than the narrative around it.
Most mistakes were caused by silently upgrading:

```text
local -> global,
fixed-cell -> source-uniform,
compiled -> landed,
intended Fin13 range -> literal Fin13 range,
UNKNOWN/iteration-limit -> evidence of closure.
```

The recommended strategy is now:

```text
finish one source-complete exact-13 labelled packet;
interpret cells through one generic finite checker;
preload generic two/three-row Kalmanson theorems;
run all-center K4 support CEGAR;
keep grid and fresh terminals explicit and separate.
```

Do not spend the next chat generating more isolated fixed-cell wrappers unless a
source classifier already selects those cells. The highest-value theorem is the
small physical unordered `2+3` source bridge, followed by the source-to-cell-code
adapter.
