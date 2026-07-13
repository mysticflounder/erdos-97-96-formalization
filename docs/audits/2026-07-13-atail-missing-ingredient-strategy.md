# ATAIL-FORCE missing-ingredient strategy audit (2026-07-13)

## Scope and rigor labels

This audit addresses the card-at-least-11 producer required by
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
(`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2516`).  It is parallel
closure research explicitly authorized by Adam. A uniform producer is
independent of Census554; a producer stated only from card 12 would leave the
currently open card-11 slice dependent on A11-CONSUME. The concurrently owned
LIVE-T1 source is out of scope here.

Every mathematical claim below has one of these labels.

- **PROVEN**: in current Lean, or an elementary consequence of named current
  Lean facts with a complete proof sketch given here.
- **CONJECTURED**: a concrete proposed theorem which has not been proved or
  exhaustively decided.
- **EMPIRICALLY VERIFIED**: checked on a pinned finite or exact-CAS artifact,
  but not promoted to a general theorem.
- **HEURISTIC**: a proof-search ranking or expectation.

No Lean source, proof-blueprint state, or solver artifact was changed for this
audit.

## Verdict

**PROVEN.** Marginal radius-class counting cannot force the required
two-point joint fiber from the currently proved bounds: each opposite-apex
class has at least three off-surplus points, while the off-surplus carrier has
at least six points.  Two three-subsets of a six-or-larger set can be disjoint.

**PROVEN.** The existing endpoint-radius/strict-escape dichotomy does not by
itself create a shared pair.  Its containment arm confines the two apex
classes to different opposite caps, whose common cap boundary supplies at
most one shared Moser endpoint; its escape arm supplies only one point at one
center and does not synchronize a second radius class.

**HEURISTIC.** The highest-leverage route is therefore the
critical-row/full-filter route, but at a smaller conclusion than K-A-PAIR.
The exact dangerous row already supplies the first center and an outside-cap
pair.  The only new geometric datum needed for the existing
`outsidePair_unique_capCenter` sink is a second distinct center in the same
cap which is equidistant from that pair.

**CONJECTURED.** The primary theorem to test is the same-cap second-center
producer stated in section 5.  It is not currently justified by the known Q3,
incidence, or saved-row computations.

## 1. Exact hypothesis surface

Let

```text
S := leafSurplusPacket (D := D) (MT := MT) (hCirc := hCirc)
       (CP := CP) (i := i) (hM := hM) (hsurplus := hsurplus)
B := {q, t1, t2, t3}.
```

**PROVEN.** The target's `hcenter` and `hsupport` say that `B` is the complete
positive-radius four-point shell centered at `p`; it is not merely a selected
subset.  The live packet gives the same `p`-radius equalities and exact
q-deleted count.

**PROVEN.** The target receives five abstract critical rows, sourced at
`q,t1,t2,t3,u`.  Only the `t2` row is pinned to center `p` and support `B`.
The type of `CriticalSourceRows` does not state that its five rows came from
the `CriticalShellSystem` supplied separately by `hcritical`.

**PROVEN.** The pair target does not receive the live theorem's sixth
`f2CriticalRow` or either same-system comparison map.  A K-A-PAIR producer
must therefore use the five-row surface as stated, select fresh rows from
`hcritical`, or widen and immediately thread the interface.  It may not
silently import LIVE-C/LIVE-T1 provenance.

**PROVEN.** From the opposite-cap lower bounds, `hsurplus`, `hj5`, and
`hNoM44`, the three closed cap sizes satisfy, after reordering,

```text
m1 >= 5,  m2 >= 5,  m3 >= 4,
m1 + m2 + m3 = |A| + 3.
```

The phrase `(>=5,>=5,4)` in older comments is a lower-bound mnemonic, not an
exact profile for all cards. At card 11 the sorted profile is `(4,5,5)`; at
card 12 the only sorted profiles are `(4,5,6)` and `(5,5,5)`.

**PROVEN, source-verified answer to the cardinality question: no live caller
has already excluded card 11.**  The pair declaration itself carries only
`hcard : 9 < D.A.card`; it does not carry `12 <= D.A.card`.  The complete live
call chain

```text
u1_largeCap_routeB_tail_false
  -> u1_largeCap_routeB_tail_liveData_false
  -> false_of_center_p_t2_t20
  -> false_of_largeCap_pCentered_t2Source_exactDangerousRow
  -> false_of_twoLargeCaps_pCentered_t2Source
  -> exists_removableVertex_of_twoLargeCaps
  -> DoubleApexOffSurplusSharedRadiusPair
```

passes that same `hcard` unchanged.  None of these callers splits on
`D.A.card = 11`, assumes `D.A.card != 11`, or derives
`12 <= D.A.card` before invoking the pair residual.  Thus the current `sorry`
really includes the card-11 case.

**PROVEN.** The two-large-cap arithmetic yields `11 <= D.A.card`; the same
calculation is formalized downstream as
`Census554.card_ge_eleven_of_twoLargeCaps`.  That downstream declaration is
evidence for the bound, not an already wired card-11 consumer in this module.
No current imported theorem closes the exact card-11 profile `(4,5,5)` here.
Consequently either (i) the producer must keep the existing signature and work
uniformly from card 11, or (ii) a named, import-reachable card-11 contradiction
must be proved and wired before a new `12 <= D.A.card` tail producer is called.
A card-at-least-12 producer is genuine parallel progress, but by itself cannot
remove the present declaration's `sorry`.

## 2. Route (a): marginal radius multiplicity

Fix one K4-sized exact-radius class at each opposite apex, and remove the
surplus cap.

**PROVEN.** `oppApex1_surplusCap_one_hit` and
`oppApex2_surplusCap_one_hit` give at most one surplus-cap point in each
four-point apex class.  Hence each class contributes at least three points to
`A \ S.surplusCap`.

**PROVEN.** The closed-cap identity gives

```text
|A \ S.surplusCap| = |S.oppCap1| + |S.oppCap2| - 3 >= 6.
```

The subtraction by three accounts for the three closed-cap endpoint
overlaps.  This also follows directly by combining `S.capSum` with
`S.surplusCap_subset_A` and the two opposite-cap lower bounds.

**PROVEN.** For subsets `X,Y` of an off-surplus universe `U`, forcing
`2 <= |X intersect Y|` by inclusion-exclusion requires

```text
|X| + |Y| >= |U| + 2.
```

The current lower bounds give only `|X|+|Y| >= 6` and `|U| >= 6`; they do not
meet that threshold.  Even the card-12 extremal case allows two disjoint
three-subsets.

**PROVEN.** The stronger existing ordered-cap pair count does not close the
card-12 profiles.  Substituting into
`orderedCap_card_add_four_le_choose_outside` gives

```text
profile (4,5,6):  8 <= C(8,2), 9 <= C(7,2), 10 <= C(6,2);
profile (5,5,5):  9 <= C(7,2) for every cap.
```

All inequalities hold with slack.

**HEURISTIC.** A successful counting proof would need a genuinely new
cross-radius or cross-center multiplicity statement, not a sharper
presentation of the present marginal bounds.  Such a statement would already
contain most of the missing producer content.

## 3. Route (b): endpoint radius and strict escape

**PROVEN.** The general theorems
`oppApex1_containment_or_strict_adjacent_escape` and
`oppApex2_containment_or_strict_adjacent_escape` split each K4 radius class
into its own opposite-cap containment arm or a strict adjacent-cap escape
witness.

**PROVEN.** If both classes take the containment arm, their common points lie
in the intersection of the two different opposite caps.  In the cap
partition this intersection is the single shared Moser endpoint.  Thus this
arm permits at most one joint point and points away from the K-A-PAIR
conclusion.

**PROVEN.** A strict-escape arm gives one point in a specified strict cap
region.  It supplies neither a second point at that radius nor an equality at
the other apex.  Two independently obtained escape witnesses need not be the
same points or use compatible radii.

**PROVEN.** The stronger endpoint-radius wrappers in
`U2NonSurplusOneHit.lean` are designed around `IsM44`, endpoint-equality, or
explicit no-strict-escape inputs.  K-A-PAIR assumes that no `IsM44` packet
exists and carries none of those endpoint equalities.  Those wrappers are
therefore not a direct bridge on this branch.

**HEURISTIC.** Endpoint/escape should remain a diagnostic query in the next
small census.  It becomes primary only if that census repeatedly forces two
synchronized escape points.  Without that additional synchronization lemma,
route (b) merely renames the missing pair.

## 4. Routine reductions available before new geometry

### 4.1 The dangerous row already has an outside-cap pair

**PROVEN.** Since `p` belongs to `D.A`, the cap partition puts it in at least
one indexed cap `S.capByIndex k`.  Regard the exact dangerous row as a
`SelectedFourClass` centered at `p`.  Then
`selectedFourClass_inter_capByIndex_card_le_two` gives

```text
|(B intersect S.capByIndex k)| <= 2.
```

Because `|B|=4`, there are distinct `x,w in B \ S.capByIndex k`.  Both satisfy
`dist p x = dist p w` by the row's full-shell equations.  This is a routine
finite-set extraction; no new geometric theorem is needed.

### 4.2 The `u` row is a canonical center distinct from `p`

**PROVEN (derivable; no dedicated declaration was found).** Under the exact
K-A-PAIR inputs, `rows.uRow.center != p`.

Proof sketch.  Assume the center is `p`.  The source-membership field places
`u` on the `u` row.  If `q` is also on that row, then both have the row radius
about `p`, contradicting `H.selected_off_circle`.  If `q` is not on the row,
the entire exact four-point support lies in `(D.skeleton q).erase p` and
survives as a four-point positive-radius class centered at `p`, contradicting
`hlocalNoQFree.no_qfree`.

**PROVEN (derivable).** Applying
`SelectedFourClass.inter_card_le_two` to the dangerous class at `p` and the
exact `u` row gives

```text
2 <= |rows.uRow.support \ B|.
```

This is the pair-surface analogue of the checked LIVE-C theorem
`two_le_f2Row_support_sdiff_dangerousBase`.  It supplies two points co-radial
at `rows.uRow.center`, but it does not put them outside a common cap or on a
second circle.

**PROVEN.** These two routine reductions expose the exact gap: one can obtain
a first center plus a two-point pair in two natural ways, but no current fact
puts either pair on a second useful center.

## 5. Smallest proposed producer

### 5.0 Ranked producer candidates

1. **Q-C / CONJECTURED / recommended:**
   `dangerousRow_sameCap_secondCenter`, stated below.  It adds one bisector hit
   to a pair already supplied by the exact dangerous row and then uses the
   existing ordered-cap uniqueness sink.
2. **Q-A / CONJECTURED / fallback:** a full-filter coupling theorem which
   directly gives two off-surplus points in the intersection of exact-radius
   classes at `S.oppApex1` and `S.oppApex2`.  This matches K-A-PAIR's current
   conclusion, so it is less useful for theorem extraction unless a bounded
   computation exposes a much smaller invariant core.
3. **Q-E / HEURISTIC / diagnostic:** a synchronized strict-escape theorem for
   the two opposite-apex filters.  The present escape lemmas produce only one
   independently chosen witness at a time; this candidate should be promoted
   only if the target-faithful query repeatedly forces the same two witnesses.

The ranking is by expected extractability into a short reusable geometric
lemma, not by logical strength.

### 5.1 Minimal geometric output: a same-cap bisector hit

The preferred new lemma should retain all binders of
`DoubleApexOffSurplusSharedRadiusPair` initially and conclude the following.
This is pseudocode, not a current declaration.

```lean
-- CONJECTURED
theorem dangerousRow_sameCap_secondCenter
    (all current K-A-PAIR hypotheses) :
    let S := leafSurplusPacket ...
    let B : Finset ℝ² := {q, t1, t2, t3}
    ∃ k : Fin 3, ∃ c x w : ℝ²,
      p ∈ S.capByIndex k ∧
      c ∈ S.capByIndex k ∧
      c ≠ p ∧
      x ∈ B ∧ w ∈ B ∧ x ≠ w ∧
      x ∉ S.capByIndex k ∧ w ∉ S.capByIndex k ∧
      dist c x = dist c w
```

**CONJECTURED.** This has a smaller geometric payload than the present
shared-radius target: the dangerous row already supplies
`dist p x = dist p w`, so the new content is only one more equal-distance
equation and the cap placement of its center.  This is not a claim of strict
logical weakening.  Under the current hypotheses both conclusions feed an
existing contradiction sink, so their relative theorem strength has not been
proved.

An implementation-friendly stronger form asks that `c` be the center of an
actual critical full shell containing `x` and `w`:

```lean
-- CONJECTURED, stronger but closer to hcritical
∃ Hsys : CriticalShellSystem D.A,
  ∃ source hsource k x w,
    Hsys.centerAt source hsource ∈ S.capByIndex k ∧
    Hsys.centerAt source hsource ≠ p ∧
    p ∈ S.capByIndex k ∧
    x ∈ B \ S.capByIndex k ∧
    w ∈ B \ S.capByIndex k ∧ x ≠ w ∧
    x ∈ (Hsys.selectedAt source hsource).support ∧
    w ∈ (Hsys.selectedAt source hsource).support
```

**PROVEN.** The stronger form implies the minimal one by the critical shell's
equal-radius fields.

**CONJECTURED binder discipline.** The first version should copy the target's
entire explicit binder vector rather than silently weakening it:

```text
MT, hCirc, CP, i, j, rows, hM, hqCap, hsurplus, hqNonMoser,
hjne, hj5, hNoM44, hcard, hcritical, hlocalNoQFree, hfixed,
hbase, H, hcenter, hsupport
```

It also has the `CounterexampleData` fields `D.convex` and `D.K4`.  A binder
may be removed only after the producer has been proved and Lean confirms that
it is unused.

There are exactly two honest cardinality interfaces for this proposal:

```text
uniform producer: current binder vector, including only hcard : 9 < |A|;
tail producer:    current binder vector plus hcard12 : 12 <= |A|.
```

The first can replace the current residual if proved.  The second is the
genuine ATAIL card-at-least-12 theorem, but its eventual caller must acquire
`hcard12` from an explicit `|A| = 11` versus `12 <= |A|` split after closing
the equality branch.  Merely strengthening the proposed theorem statement
does not change the live caller's surface.

### 5.2 Immediate consumer chain

**PROVEN, conditional on the producer being uniform over the live
signature.** The proposed output closes K-A-PAIR without a new sink:

1. Use `S.capByIndex_cgn4g_capData D.convex k` to obtain an ordered cap `L`,
   its strict cap order, and the equality between the indexed cap and
   `Finset.univ.image L.points`.
2. Convert membership of `p` and `c` to indices `r,s : Fin m`.  Since
   `c != p`, order the indices, swapping them if necessary.
3. The dangerous exact row gives `dist p x = dist p w`; the producer gives
   `dist c x = dist c w`; and the producer also gives both points outside the
   ordered cap.
4. Apply `CapSelectedRowCounting.outsidePair_unique_capCenter` to obtain
   `False`.
5. Eliminate `False` into the existing K-A-PAIR existential, or preferably
   close its immediate `False` consumer directly.

No opposite-apex radius needs to be identified in this route.  If the
producer instead assumes `12 <= D.A.card`, this chain closes only the
card-at-least-12 tail; it still needs the separate card-11 split described in
section 1 before it can replace the current `sorry`.

### 5.3 Hypothesis map

| Inputs | Required role in a noncircular proof | Status |
|---|---|---|
| `MT`, `hCirc`, `CP`, `i`, `hM`, `D.convex` | construct `S` and the strict ordered-cap geometry used by the sink | **PROVEN** |
| `rows`, `hcenter`, `hsupport`, `hfixed` | provide the exact dangerous class `B` centered at `p` | **PROVEN** |
| `hlocalNoQFree`, `H` | support the exact dangerous-radius identification and force `u`/the `u` row away from a second `p`-class | **PROVEN** for the routine reductions |
| `hcritical` | supply source-indexed exact full shells from which a second center may be forced | **CONJECTURED** as the producer mechanism |
| `hsurplus`, `hjne`, `hj5`, `hNoM44`, `hcard` | rule out private-pair arrangements using the card-at-least-11 two-large-cap profile | **CONJECTURED**; this is where new counting/geometry must enter |
| `hqCap`, `hqNonMoser` | locate a named strict surplus-cap point and break cap-endpoint degeneracies | **CONJECTURED** as load-bearing |
| `hbase` | discharge all named-point distinctness in row and cap cases | **PROVEN** |
| `D.K4` | provide the global selected-class supply in addition to the exact critical shells | **CONJECTURED** as load-bearing |

**HEURISTIC.** Prove the combined producer before trying to shrink its binder
list.  Prematurely dropping the cap, live, or critical hypotheses reproduces
the already banked nonconvex and finite-shadow witnesses.

**HEURISTIC, regression-required load-bearing floor.** A credible proof must
visibly consume all three information groups which the completed negative
models separate: (i) `D.convex` and the single strict cap order; (ii) the exact
dangerous/full critical filters through `hcenter`, `hsupport`, `H`,
`hlocalNoQFree`, and `hcritical` (or a proved consequence of them); and (iii)
the two-large-cap branch data `hsurplus`, `hjne`, `hj5`, and `hNoM44`.  Q3
forgets group (ii), while W16/W20 fail group (i).  Whether `hqCap`,
`hqNonMoser`, the non-`t2` supplied rows, and `D.K4` are individually
load-bearing remains **CONJECTURED** and should be decided only after a proof
or an exact falsifier exists.

## 6. Why this is beyond the known negative abstractions

**PROVEN.** Q3 retains selected four-point windows at the Moser centers but
does not retain the exact dangerous `p` filter, a source-indexed critical
full shell through a chosen pair, or the same-cap placement of the two
centers.  Its SAT token assignments therefore do not decide the proposed
producer.

**PROVEN.** The incidence-only witnesses retain row membership and overlap
bounds but omit Euclidean equal-distance equations and strict cap order.
They can keep every outside pair private.  The proposed conclusion is exactly
the missing non-private pair.

**PROVEN.** If the proposed producer is proved, no Q3 or incidence witness can
extend to a convex Euclidean K-A-PAIR configuration satisfying the full
hypotheses: the extension would instantiate
`outsidePair_unique_capCenter` and derive `False`.  This does not refute those
witnesses as abstract finite models; it excludes their geometric extensions.

**EMPIRICALLY VERIFIED.** The W16/W20 row-fragment bank admits many exact
row/critical-coverage embeddings and can make the `u` row disjoint from the
dangerous `p` row.  Those configurations are not convexly independent.  They
are therefore regression tests requiring the proof of the producer to use
cap order/convexity rather than equality data alone.

**EMPIRICALLY VERIFIED.** The two saved card-12 critical-row shadows, one for
each profile `(4,5,6)` and `(5,5,5)`, survive row-overlap and global cyclic
cross-separation checks, while trusted exact Singular computations return a
unit ideal for contained 24- and 20-equality subsystems.  This is evidence
that metric coupling can kill row shadows missed by incidence, but it is only
two cases and supplies no generic core.

## 7. Smallest computation that can discover or falsify the producer

The next computation should be a target-specific implication query, not a
classification of the 167,782 selected-four systems.

### 7.1 `ATAIL-PAIR-SECOND-CENTER` query

**HEURISTIC.** Start at card 11 with the exact `(4,5,5)` profile because it is
the first live cardinality and any uniform producer must cover it. Then replay
the two card-12 profiles `(4,5,6)` and `(5,5,5)`. Encode the full pair-surface
fields needed to test the producer:

1. one common strict cyclic order and the actual Moser/cap placement;
2. the six distinct labels `p,q,t1,t2,t3,u`;
3. the exact full `p` filter with support exactly `B` (all four equalities and
   every off-support disequality);
4. the five supplied critical rows, keeping source membership and full-filter
   exactness, while not pretending they come from one system;
5. a chosen `CriticalShellSystem` row for every source point, including its
   source membership, center/source inequality, full four-point filter, and
   source-to-center map;
6. one K4 selected class at every carrier center, allowing reuse when a
   critical full shell already supplies it; and
7. the cap-size, no-M44, live-data, and localized no-q-free constraints.

Ask three negated conclusions on the same generated shadows:

```text
Q-C: no dangerous-row outside pair has a second same-cap center;
Q-A: the two opposite-apex full filters have no off-surplus joint fiber of card 2;
Q-E: no pair of synchronized strict-escape witnesses occurs.
```

**HEURISTIC.** `Q-C` is the primary query.  `Q-A` checks whether the direct
target unexpectedly becomes easier once full filters are present.  `Q-E`
decides whether route (b) deserves promotion.

### 7.2 CEGAR boundary

**HEURISTIC.** Use a finite SAT layer for support choices, cap placements,
source-to-center assignments, and cyclic order.  Send only surviving shadows
to an exact polynomial/real-algebraic oracle.  When a shadow is rejected,
mine the smallest recurring row/cap subsystem and add that structural cut to
the outer layer.

**PROVEN.** Full-filter disequalities are essential.  Equalities for four
selected support points do not state that the radius class has exactly four
carrier points.  The current Q3 and selected-row witnesses demonstrate this
logical gap.

**PROVEN.** A finite-shadow SAT assignment is not a Euclidean counterexample,
and an exact-CAS unit result for one shadow is not a uniform theorem.  The
acceptable verdicts are:

- an exact real model satisfying every encoded K-A-PAIR hypothesis and the
  negation of the candidate, which **PROVES** that candidate false at that
  cardinality;
- a replayable UNSAT certificate for a complete, target-faithful bounded
  family, which is **PROVEN** only for that family; or
- a small invariant core which is then proved independently and generalized
  in Lean.

**PROVEN.** Card 11 is the first decisive falsifier gate for any theorem
claimed uniformly on the live declaration. Failure to find a card-11 model
does not prove uniformity. A surviving core must be shown
cardinality-independent; otherwise card 11 needs A11-CONSUME, cards 12--14 need
AHEAD-CONSUME, and only then may a card-at-least-15 threshold be introduced.

**HEURISTIC.** A blind longer run on the existing 30,997/167,782 systems is
lower value than this implication query.  Those systems omit the exact
dangerous row and source-indexed full-shell information which the candidate
producer must use.

## 8. Circularity and fidelity checks

Any proof or computation for the producer must pass all of the following.

- **PROVEN fidelity requirement:** do not use
  `outsidePair_unique_capCenter`, `oppCap2_escape_gen`, or the K-A-PAIR target
  while proving the producer.  They are consumers only.
- **PROVEN fidelity requirement:** do not treat the five abstract supplied
  rows as rows of the witness chosen from `hcritical`; there is no such field
  in `CriticalSourceRows`.
- **PROVEN fidelity requirement:** do not use the sixth `f2CriticalRow` or its
  comparison maps on the pair surface.
- **PROVEN fidelity requirement:** do not replace an exact critical filter by
  a selected four-subset, and do not infer exactness for global K4 rows unless
  it has been proved in that context.
- **PROVEN fidelity requirement:** do not assume an exact cap profile
  `(5,5,4)` or `(>=5,>=5,4)` beyond card 11; use the cap-sum identity.
- **PROVEN fidelity requirement:** do not promote Q3/incidence SAT witnesses
  to Euclidean configurations, or a trusted CAS unit result to a kernel proof.
- **PROVEN fidelity requirement:** if the proof chooses a row from
  `hcritical`, retain its source label, exact support, center/source
  inequality, and the fact that the center lies in `D.A`.

## 9. Ranked next actions

1. **PROVEN / integration prerequisite:** choose the cardinality contract
   explicitly.  For closure of the current declaration, either target the
   producer uniformly at card at least 11, or first land a named card-11
   contradiction and a source-visible split which supplies
   `12 <= D.A.card` to the tail.  Do not treat a plan assertion or the stopped
   Census554 process as that split.
2. **DONE-CHECKED / routine boundary:**
   `scratch/atail-force/same_cap_second_center.lean` now kernel-checks
   `uRow_center_ne_p`, `two_le_uRow_support_sdiff_dangerousBase`, extraction
   of two dangerous-row points outside any cap containing `p`, the generic
   two-center ordered-cap sink, and
   `DangerousRowSameCapSecondCenter.false`.  The audited declarations depend
   only on `propext`, `Classical.choice`, and `Quot.sound`.  This isolates the
   open content to producing an inhabitant of
   `DangerousRowSameCapSecondCenter`; it is not closure.
3. **CONJECTURED / primary research:** implement
   `ATAIL-PAIR-SECOND-CENTER` with `Q-C` first.  Run the card-11 `(4,5,5)`
   gate first when testing a uniform producer.  The two card-12 profiles may
   be run independently as genuine ATAIL parallel work, but a positive
   bounded result there is not full K-A-PAIR closure.  Preserve exact filters
   and a single cap order from the start.
4. **HEURISTIC:** if `Q-C` has an exact target-faithful countermodel, discard
   the same-cap producer and inspect whether `Q-A` or `Q-E` is forced in that
   same model family.  Do not patch the failed statement with ad hoc extra
   hypotheses.
5. **HEURISTIC:** if all exact `Q-C` countershadows die, intersect their
   minimized unit subsystems and look specifically for a cap/bisector lemma,
   not a verbatim 20-plus-equality network.
6. **PROVEN acceptance gate:** land a uniform producer only together with its
   immediate `outsidePair_unique_capCenter` or joint-fiber consumer, a clean
   target build, and removal of K-A-PAIR from the proof-blueprint sorry
   surface.  For a card-at-least-12 producer, the acceptance gate additionally
   requires a proved card-11 consumer and the live split; without them the
   result is a tail theorem, not closure of the current declaration.

## Final assessment

**HEURISTIC.** Route (c), critical-row/full-filter coupling, is the only one
of the three routes that adds information absent from every completed negative
abstraction.

**CONJECTURED.** The smallest useful missing ingredient is not the full
opposite-apex shared-radius conclusion.  It is the same-cap bisector-hit
producer: select two points of the exact dangerous `p` row outside a cap
containing `p`, then force one additional carrier point of that cap, distinct
from `p`, to be equidistant from them.

**PROVEN.** Once that statement is available uniformly on the present
card-at-least-11 surface, the existing ordered-cap uniqueness theorem yields
`False` immediately.  A version beginning at card 12 closes the genuine
ATAIL tail only after a separate card-11 consumer is wired; the live caller
has not already performed that exclusion.  Until one of those complete chains
is proved, or the proposed producer is falsified by a target-faithful exact
model, K-A-PAIR remains open research.
