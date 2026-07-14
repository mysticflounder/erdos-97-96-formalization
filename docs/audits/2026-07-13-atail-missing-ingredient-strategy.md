# ATAIL-FORCE missing-ingredient strategy audit (2026-07-13)

## Scope and rigor labels

Cardinality terminology is fixed in this audit: `CARD-GE-12` means a theorem
uniform under `12 ≤ D.A.card`; `CARD-EQ-12` means a finite exact-cardinality
profile or artifact under `D.A.card = 12`. Bare “card-12 producer” is retired
from current conclusions.

This audit addresses the card-at-least-11 producer required by
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
(`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2516`).  It is parallel
closure research explicitly authorized by Adam. A uniform producer is
independent of Census554; a producer stated only from `CARD-GE-12` would leave the
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
A `CARD-GE-12` producer is genuine parallel progress, but by itself cannot
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

That implication is now kernel-checked, rather than merely a pseudocode
reduction. The no-`sorry` theorem
`DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity` in
`scratch/atail-force/same_cap_second_center.lean` takes one source-indexed
critical shell whose center lies with `p` in a cap, is distinct from `p`, and
whose support meets `B \ cap` in at least two points. It extracts the pair and
constructs `DangerousRowSameCapSecondCenter`. The open geometric content has
therefore been reduced exactly to this cap-local support-multiplicity
statement. The companion
`false_of_criticalShell_sameCap_capMultiplicity` threads that field directly
through `.false`, so the exact producer has a one-call checked consumer.

**PROVEN counting boundary.** Cardinality alone cannot force that statement
on the live profiles. Write `m := |cap|` and `d := |B \ cap|`. The checked
dangerous-row extraction gives only `2 <= d <= 4`. Even after adding the
unproved localization that every dangerous source chooses a center in
`cap \ {p}`, pigeonhole forces a repeated center only when
`d > m - 1`. Across the card-11 and card-12 cap sizes this can occur only in
the extremal `m = 4, d = 4` case; for cap sizes five and six the source-to-
center map may remain injective. Thus the missing result cannot be obtained
uniformly by a bare cap-size count. It needs either non-injectivity from
geometry, a shell which already contains two dangerous points, or a source
outside the dangerous row whose critical shell has the required overlap.

The stronger global ordered-cap count is also now closed as a research
boundary. `docs/audits/2026-07-13-atail-global-count-boundary.md` proves from
the current Lean inequalities that a cap of size `m` contributes only
`m + 4` distinct outside-pair slots, versus capacity
`choose(|A \ cap|, 2)`. The card-12 profiles retain slack in every cap, with
summed lower count 27 versus summed capacities 63 for `(5,5,5)` and 64 for
`(4,5,6)`. A common critical system gives blocker fibers of size at most four
and a row cover, but its global selected row at a blocker center is the same
critical support, so it adds source tags rather than a second incidence copy.
Deterministically validated strengthened finite shadows for both profiles
simultaneously satisfy these count/order constraints and keep the fixed joint
off-surplus fiber at cardinality one. They are explicitly non-Euclidean and
nonexhaustive; they prove only that a real metric/order coupling, not a larger
finite double count, is required.

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
genuine ATAIL `CARD-GE-12` theorem, but its eventual caller must acquire
`hcard12` from an explicit `|A| = 11` versus `12 <= |A|` split after closing
the equality branch.  Merely strengthening the proposed theorem statement
does not change the live caller's surface.

### 5.2 Dangerous-source blocker-collapse obstruction

**PROVEN, kernel-checked.** The local no-`q`-free packet and fixed dangerous
triple make the ambient selected class at center `p` and radius `dist p q`
exactly `{q,t1,t2,t3}`. Deleting any member of that class destroys every K4
witness at `p`. Therefore `p` is a valid critical-shell blocker center for
each of the four dangerous sources.

`scratch/atail-force/dangerous_blocker_collapse.lean` packages this in
`collapseDangerousBlockers`: any existing `CriticalShellSystem` can be
overridden on the exact dangerous class so that

```text
centerAt q = centerAt t1 = centerAt t2 = centerAt t3 = p.
```

The file kernel-checks without `sorry`; the existence theorem
`exists_criticalShellSystem_collapsing_dangerousBase` starts from exactly the
`Nonempty (CriticalShellSystem D.A)` form carried by the pair target. Its
axiom audit is exactly `propext`, `Classical.choice`, and `Quot.sound`.

This does **not** prove that no useful critical-shell system exists, nor does
it falsify the existential same-cap producer. It proves the narrower but
decisive design obstruction: choosing an arbitrary witness from `hcritical`
and a source inside the dangerous class cannot force a center distinct from
`p`. Any successful cap-local producer must instead use a source outside
`{q,t1,t2,t3}`, construct or prove the existence of an independently
non-`p` blocker, or add common live provenance which prevents this arbitrary
override at the row being consumed.

### 5.3 Outside-source exact boundary

**PROVEN, kernel-checked.** The honest source outside the collapsed dangerous
class is the selected point `u`. The scratch audit
`scratch/atail-force/outside_source_cap_multiplicity.lean` proves all routine
facts available from the current binders:

- `u` lies in `D.A`, lies in `rows.uRow` support, and is outside
  `{q,t1,t2,t3}`;
- `rows.uRow.center` lies in `D.A` and differs from `p`;
- the `u` row has at least two support points outside the dangerous class;
- `p` lies in some indexed cap, and the `u`-row center lies in some indexed
  cap, but these two existential cap indices need not agree; and
- for every cap containing the `u`-row center, at most two row points lie in
  the cap and at least two lie outside it.

The common-system theorem
`criticalShellSystem_centerAt_ne_p_of_outside_dangerousBase` gives the same
center separation for any `CriticalShellSystem`: the dangerous K4 survives
deleting `u`, so `p` cannot be the deletion blocker. This is exactly what
retained provenance adds here; it supplies neither cap alignment nor dangerous
support overlap.

The file names the exact remaining fields as `URowCapMultiplicityFields`:

```text
exists k,
  p in cap[k] and uRow.center in cap[k] and
  2 <= |uRow.support intersect ({q,t1,t2,t3} minus cap[k])|.
```

It also kernel-checks a non-tautological sufficient condition,
`URowCommonCapOffDangerousConfinement`: one cap contains `p`, the `u`-row
center, and every `u`-row support point outside the dangerous class. The two
points forced outside that cap must then be dangerous, giving the required
multiplicity. The current binders do not prove this confinement. Axiom audits
of the common-system separation, confinement adapter, and full current
boundary are exactly `propext`, `Classical.choice`, and `Quot.sound`.

### 5.4 Immediate consumer chain

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
`CARD-GE-12` tail; it still needs the separate card-11 split described in
section 1 before it can replace the current `sorry`.

### 5.5 Hypothesis map

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

### 6.0 Legacy same-cap blocker interface

**PROVEN, source-audited.** The sibling theorem bank contains the real
same-cap order consumers `SameCapIncompatibleEdge`,
`ConsecutiveOppositeEndpointEdges`, the source-pushout lemmas, the
shared/disjoint exit split, and `strictLapPacket_nonreturn`. No audited source
constructs the edge or strict-lap packet from the present K-A-PAIR binders.
Moreover, the edge carries an equal-distance pair consisting of a cap source
and a spent cap endpoint, whereas the proposed ATAIL sink needs two points
outside the cap. It therefore does not supply the missing second center for
the dangerous outside pair. The exact declaration and hypothesis audit is
`docs/audits/2026-07-13-atail-legacy-samecap-blocker-audit.md`.

**PROVEN, source-audited.** The card-11 `erasedBlocker` path is likewise not a
geometric producer. It overrides a finite-label blocker function on the
prescribed row while deliberately retaining the original
`CriticalShellSystem`; it does not prescribe `centerAt` on that row. Hence its
row-to-`p` finite routing cannot instantiate the cap-local critical-shell
multiplicity theorem above.

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

**EMPIRICALLY VERIFIED.** The two saved `CARD-EQ-12` critical-row shadows, one for
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
the two `CARD-EQ-12` profiles `(4,5,6)` and `(5,5,5)`. Encode the full pair-surface
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

### 7.3 `CARD-EQ-12` incidence and metric preflight result

**EMPIRICALLY VERIFIED, exact within the encoded finite shadow.** The first
Q-C preflight is implemented in
`scratch/atail-force/second_center_query/`. Card 11 was deliberately excluded
because that lane is separately owned. One explicit admitted placement was
checked for each `CARD-EQ-12` profile. The encoding retains the dangerous exact
row, all five independent supplied exact rows, one exact selected row at every
center, one source-indexed exact critical-system row per carrier point,
source membership, center/source separation, the encoded no-q-free
consequence, and the current cap/cyclic/pair/Q3 incidence cuts.

Both cases have independently validated 29-row witnesses with no Q-C witness
carried by an encoded row:

```text
(4,5,6): SAT_FINITE_SHADOW_ONLY, 19 nodes,
  sha256 ce24f3818d0b9465ef6afadced8a957065ffb7846cd62d7f1cb52c764850fa47
(5,5,5): SAT_FINITE_SHADOW_ONLY, 26 nodes,
  sha256 d1231886198381478c2ae0120c5d444b353e0b003097cc97b10c205c98883a18
```

**PROVEN scope boundary.** These witnesses are not Euclidean counterexamples
and do not falsify the producer. The manifest fail-closes metric equations and
full-filter disequalities, strict convexity, geometric strict-cap order,
MEC/non-obtuse data, arbitrary bisector hits not represented by an encoded
row, the omitted full live fields, exhaustive named-label placements, Q-A,
Q-E, a real-algebraic oracle, and card 11.

**TRUSTED EXACT-CAS, independently cross-checked.** The successor metric
oracle is complete for these two saved shadows in
`scratch/atail-force/second_center_metric_oracle/`. After deduplication each
29-row witness has 12 distinct center/support circles, hence 36 quadratic
squared-distance equalities in 20 free coordinate variables under the gauge
`point 0 = (0,0)`, `point 1 = (1,0)`. Singular 4.4.1 over `QQ` and msolve
0.10.1 over `QQ` in both forward and reverse variable orders all return
`UNIT` for both full ideals. Thus neither fixed normalized complex variety,
and hence neither fixed normalized real variety, is nonempty.

Bounded deletion retains independently cross-checked unit subsets of 6 rows /
18 equalities for `(4,5,6)` and 7 rows / 21 equalities for `(5,5,5)`. Timeouts
make these confirmed unit subsets, not claimed minimal cores. The replay and
four tests pass. This original two-shadow result remains trusted exact
computation rather than a proof of a general producer.

**PROVEN, kernel-checked for one compact consumer.** The later `(4,5,6)`
five-row CEGAR core no longer relies on CAS trust. An exact rational
Nullstellensatz identity was independently reconstructed and expanded to one,
and `scratch/atail-force/five_row_metric_core.lean` proves the same result by a
compact real branch argument. Its invariant theorem shows that eleven
equal-distance comparisons force the distinguished points `P0` and `P1` to
coincide; `false_of_five_selectedFourClasses` packages the required sixteen
support memberships in the existing selected-K4 vocabulary, and
`FiveRowCollisionCore` packages the same obstruction through `EdgeClosure`.
All printed axiom sets are exactly `propext`, `Classical.choice`, and
`Quot.sound`. The exact twelve-family theorem-bank audit finds no match for
this particular subject.

**EMPIRICALLY VERIFIED, bounded and exact within two fixed shadows.** The
metric CEGAR continuation reaches 64 rounds per profile. All 128 full equality
ideals and all 128 learned row cuts replay as three-engine
`CROSSCHECKED_UNIT`; no nonunit candidate appears. Both profiles stop at the
round budget rather than exhaustion. The first repeated whole-core type,
`(5,5,5)` rounds 40 and 62, exactly reuses
`SixPointCircleChainCollisionCore`, but that is a consumer match only.

**PROVEN provenance boundary within the saved finite replay.** The row-origin
audit deterministically reconstructs every named incidence assignment. Zero of
64 cuts in either profile has a supplied-source alias for every retained row.
The compact `(4,5,6)` core has one row aliasing `supplied:u` and four rows that
exist only in the stronger global-row-at-every-center inventory. Therefore the
five live `CriticalSourceRows` do not directly supply either the new compact
consumer or the repeated bank consumer. Selected-K4/global-row incidence is
the exact missing bridge.

**EMPIRICALLY VERIFIED, exact placement surface only.** Independent
re-enumeration of the `CARD-EQ-12` named-placement layer gives 936,726 raw
placements and 367,206 verified automorphism representatives: 253,302 for
`(4,5,6)`, and 683,424 raw / 113,904 six-element orbits for `(5,5,5)`. This
checks no row-system, metric realization, target faithfulness, or producer.
The size makes a blind per-representative metric sweep a poor closure route.

**PROVEN scope boundary.** These checkpoints kill 128 fixed-placement incidence
witnesses before convexity or cap inequalities are needed, but they do not
exhaust either fixed placement, exhaust the placement surface, include card 11,
or prove Q-C. The next proof step is not a larger blind CEGAR budget. It is a
live selected-K4/global-row incidence theorem producing the sixteen memberships
consumed by `false_of_five_selectedFourClasses`, the nine closures consumed by
the reused six-point-chain family, or the independent
`URowCapMultiplicityFields` route.

**EMPIRICALLY VERIFIED current common-system checkpoint.** The hash-bound
structural replay now accepts 6 kernel-backed cuts for `(4,5,6)` and 18 for
`(5,5,5)`, preserving every earlier assignment digest and cut stage. The bank
is `ExactOffCircleCore`, `NestedEqualChordCore`, `MECStraddlingRowCore`,
`SixPointTwoCircleOrderCore`, `SixPointNestedCenterOrderCore`, and
`SixPointCircleChainOrderCore`. The honest survivors occur at round 6 and
round 18, with digests `268f0efa...ba89f9` and `5dac7824...e49f8`.
Both equality ideals are `CROSSCHECKED_NONUNIT`; 16-start numerical searches
find no witness but do not prove infeasibility. Checkpoint SHA-256:
`5cdb8883bf02ccde64b6b9ba0bfe34786f2a7158efb29ba0d4e045767bdf1940`.

**PROVEN new consumer and adapter.** The early common-system cuts isolated a
three-row nested-equal-chord pattern. The production module
`Problem97.Census554.NestedEqualChordCore` proves its metric-orientation
incompatibility and both signed-orientation consumers with only the standard
core axioms. The checked standalone adapter derives its `EdgeClosure` core and
four boundary orientations from three actual common-system blocker rows and a
cyclic cut `o,a,b,c,d`. This consumes the early pattern; it does not kill the
later survivors.

**PROVEN smaller live producer boundary.** The checked
`nested_equal_chord_live_producer.lean` proves that cyclic ordering is
automatic for every actual critical blocker row. After enumerating one row as
`o,a,b,c,d`, the entire remaining nested-chord producer is four global-row
memberships: `o,d ∈ rowPattern F a` and `o,c ∈ rowPattern F b`.
`HasGlobalNestedPairProducer` packages exactly this field and
`false_of_hasGlobalNestedPairProducer` consumes it with core axioms only. The
live `FaithfulCarrierPattern` already supplies the rows at `a` and `b`, so no
extra critical sources or blocker-center alignment equations are required.

**EMPIRICALLY VERIFIED one-row boundary.** Exhaustive locally admissible
support enumeration at every missing `(4,5,6)` center 4--11 leaves 128--176
survivors after all current formalized cores. Every center has a proper exact
equality-ideal survivor in both msolve variable orders. Hence one global row at
one predetermined center is not a complete current-bank producer. This is not
a real convex extension; it motivates coupling the two global rows in
`GlobalNestedPairFields` or imposing MEC before enlarging the row bank.

**EMPIRICALLY VERIFIED nested-pair boundary.** The coupled saved-placement
census finds zero `GlobalNestedPairFields` witnesses for all twelve critical
sources. Three blocker patterns contradict locked exact rows; all 15 candidates
in the only unlocked pattern instantiate existing duplicate-center or
exact-off-circle cores. This is exact only within the saved `(4,5,6)` finite
frame and blocker map. It shows that global K4 incidence alone does not force
the nested producer there; live MEC/cap/full-filter geometry must exclude or
reconfigure the placement, or the proof must use another consumer.

**EMPIRICALLY VERIFIED falsifier for the relaxed producer.** The historical
`(4,5,6)` round-5 shadow has an external exact construction in
`Q(sqrt(3),sqrt(K))`. A standalone rational interval checker and an independent
exact Z3 QF_NRA replay certify the exact rows, pairwise distinctness, strict
convexity, cap arcs, nonobtuse Moser triangle, and the saved source/blocker
no-`q`-free deletion map. This is not Lean-kernel checked and does not refute
the live theorem. It fails the all-center K4 field exactly at centers 4--11 and
the MEC disk exactly at labels 7, 10, and 11. It therefore refutes any universal
lemma using only common blocker provenance, exact rows, convex order, cap-side
data, and nonobtuseness, while identifying global K4 or MEC as concrete missing
live resources. The current `(4,5,6)` replay has moved past this historical
candidate to the honest round-6 survivor.

**PROVEN `(4,5,6)` MEC consumer.** Production
`MECStraddlingRowCore` replaces that numerical hint with a kernel proof. Under
`o=0,a=1,p=2,s=3,x=10,y=7`, three residual rows supply
`oa=ap=os=sx=sy`; actual Moser boundary/disk facts, nonobtuseness at `a`, and
four cyclic orientations force the same normalized power determinant to be
both positive and negative. The generic metric theorem, reflected theorem,
`EdgeClosure` core, and geometry consumers target-build with only `propext`,
`Classical.choice`, and `Quot.sound`. No global K4 row is needed. This closes
the saved residual consumer, not universal incidence/placement production.

**PROVEN `(5,5,5)` consumer chain.** `SixPointTwoCircleOrderCore` closes
rounds 7--9 from the map `A,P,Q,B,D,C = 0,9,11,1,3,2` using five inherited
closures and seven cyclic signs. `SixPointNestedCenterOrderCore` closes rounds
14--16 from `(O,A,D,E,X,C)=(0,1,3,4,5,2)`. The production
`SixPointCircleChainOrderCore` closes round 17 from
`(O,A,D,E,C,Y)=(0,1,3,4,2,8)`, using all five rows, the closures
`OA=OC=AC=OD=OE`, `DA=DE`, `EA=EC=EY`, `CD=CY`, and signs
`OAC,OAE,OAD,CYO`. Their normalized/generic theorems, positive and reflected
`EdgeClosure` consumers, and actual GeneralCarrier adapters target-build with
only `propext`, `Classical.choice`, and `Quot.sound`. The matchers are integrated
after all earlier matchers. The round-18 wrap-order scalar route is recorded as
CONJECTURED only; it is not a Lean theorem.

**PROVEN threshold conclusion.** Nothing in this checkpoint forces a threshold
above `CARD-GE-12`. The exact external witness is not target-faithful, and the
uniform `CARD-GE-12` producer remains the intended ATAIL target. Raising the
threshold would create a new AHEAD obligation for the skipped finite cards
without resolving card 11. The two `CARD-EQ-12` profile consumers do not
themselves prove the selection/lift to larger carriers, but that is a producer
obligation rather than evidence for a higher threshold.

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
   `DangerousRowSameCapSecondCenter.false`, plus
   `DangerousRowSameCapSecondCenter.of_criticalShell_capMultiplicity`. The
   audited declarations depend only on `propext`, `Classical.choice`, and
   `Quot.sound`. This isolates the open content to one critical shell with a
   non-`p` center in `p`'s cap and at least two support points in the dangerous
   outside set. Bare cap-size pigeonhole does not force that condition on the
   non-extremal card-11/`CARD-EQ-12` profiles. Moreover,
   `dangerous_blocker_collapse.lean` proves that all four dangerous sources
   may simultaneously choose `p` in a valid overridden critical system, so an
   arbitrary-system proof must use a source outside the dangerous class or
   independently force a non-`p` blocker. This is not closure.
3. **DONE-CHECKED consumer / OPEN producer:** the 64-round-per-profile CEGAR
   checkpoint has 128/128 cross-checked unit shadows and cuts, but no fixed
   placement is exhausted. One compact five-row consumer now kernel-checks and
   one repeated five-row type reuses `SixPointCircleChainCollisionCore`.
   Provenance replay shows that every learned cut still needs at least one
   selected global row absent from the five supplied source rows. The next
   theorem must therefore produce the compact sixteen-support pattern, the
   reused chain pattern, the four memberships in
   `HasGlobalNestedPairProducer`, or `URowCapMultiplicityFields` from live
   selected-K4, cap/order/full-filter, or common critical-row data. Card 11
   remains a separate prerequisite for any `CARD-GE-12` result.
4. **DONE-NEGATIVE scalability gate:** the `CARD-EQ-12` placement surface has
   367,206 representatives. Do not launch one CAS CEGAR per representative.
   Generalize the recurring incidence motif or prove a cap-local forcing lemma
   first, then use a finite cover only for the genuinely residual cases.
5. **HEURISTIC:** if `Q-C` has an exact target-faithful countermodel, discard
   the same-cap producer and inspect whether `Q-A` or `Q-E` is forced in that
   same model family.  Do not patch the failed statement with ad hoc extra
   hypotheses.
6. **HEURISTIC:** use the exact row-origin and repeated-core audits to seek a
   cap/bisector incidence lemma, not another scalar certificate. The metric
   consumer side is already sufficient.
7. **PROVEN acceptance gate:** land a uniform producer only together with its
   immediate `outsidePair_unique_capCenter` or joint-fiber consumer, a clean
   target build, and removal of K-A-PAIR from the proof-blueprint sorry
   surface.  For a `CARD-GE-12` producer, the acceptance gate additionally
   requires a proved card-11 consumer and the live split; without them the
   result is a tail theorem, not closure of the current declaration.

## Final assessment

**HEURISTIC.** Route (c), critical-row/full-filter coupling, is the only one
of the three routes that adds information absent from every completed negative
abstraction.

**CONJECTURED.** The smallest useful missing ingredient is not another metric
contradiction. Three exact producer interfaces are now viable: the same-cap
bisector hit (`URowCapMultiplicityFields`); the four global-row memberships in
`HasGlobalNestedPairProducer`; or a selected-K4 incidence theorem forcing the
sixteen memberships of `false_of_five_selectedFourClasses` (with the reused
six-point-chain core as a sibling target). The bounded evidence does not yet
prove which interface is forced by the live hypotheses.

**PROVEN.** Every producer has a kernel-checked immediate consumer: the
same-cap statement feeds ordered-cap uniqueness, the global-pair statement
feeds `NestedEqualChordCore`, and the five-row pattern feeds the compact
collision theorem. A `CARD-GE-12` version closes the genuine ATAIL
tail only after a separate card-11 consumer is wired; the live caller has not
already performed that exclusion. Until one of those complete chains is
proved, or the proposed producers are falsified by a target-faithful exact
model, K-A-PAIR remains open research.

## Arc-overtake refinement — 2026-07-13

The later common-system replay resolves the choice among the consumer
interfaces more sharply.  `SixPointTwoCircleArcOvertakeOrderCore` subsumes the
archived `(5,5,5)` rounds 10--28 with one three-row cyclic-order obstruction,
and `live_arc_overtake_producer.lean` kernel-checks its conditional producer on
the existing five-row pair surface.  Thus the preferred primary route is now
the arc-overtake packet; the same-cap, nested-pair, and five-row packets remain
proved alternatives rather than equal-priority search directions.

**PROVEN.** The consumer, arbitrary-carrier adapter, and minimal live
conditional boundary are complete with only the standard core axioms.  The
five-row circle-intersection core and carrier adapter are also checked and
registered.  The clean replay has twenty-one `(5,5,5)` cuts: the new matcher
closes rounds 19 and 20, then stops at round 21, digest
`2854f002275620851be4b86b064d3f0fb02cb60099c6a60d36f241dd19fb82ec`.
The required-bank audit finds no registered theorem embedding in that new
survivor and no direct whole LIVE-Q or LIVE-C closure.

**PROVEN within the finite incidence shadow.** The former round 19 avoided the packet by
one exact field: the supplied `u`-row meets the dangerous four-class in only
one aligned point.  In particular, the existing upper bound on that
intersection and lower bound on its complement do not imply the missing
second hit.

**OPEN-PROOF.** The planned content-bearing coverage has two independent
stages.  Stage I must use full-filter/critical/cap/no-`M44` data to localize the
`u`-row center, force two dangerous hits, and align one with a critical row
through source `p`, or produce a named consumed alternate.  Merely proving
`2 <= |uRow.support ∩ B|` is insufficient.  Stage II must use the actual
MEC/cap order to produce the overtaking cyclic order or another named
alternate.  An exact nine-point strictly convex algebraic model realizes the
three aligned local rows in a non-overtaking order, so Stage II is not routine.

**PROVEN dependency split for the same-cap alternate.** The current cap
surface yields common-cap alignment or `URowSeparatedCapPlacement`; a checked
`Fin 12` `(5,5,5)` cap model retains the present arithmetic, coverage, row
cardinalities, center localization, and complement bounds while realizing the
separated branch.  Conditional on common-cap alignment, the next checked
dichotomy is confinement or `URowOffDangerousSeparatedPairFields`.  In the
escape packet the `uRow` center is equidistant from two outside points while
`p` separates their distances; equality at `p` is already excluded by the
ordered-cap outside-pair theorem.  A second finite shadow realizes that escape
with dangerous multiplicity one.  Thus the new geometric targets are exactly
an exclusion of separated-cap placement and a classifier from the separated
pair to a named MEC/nested/order consumer.  Neither follows from another cap
count.

**PROVEN geometric normalization of the escapes.** A separated-cap packet is
either two strict-interior centers in different caps or an opposite-Moser
endpoint packet. The endpoint packet is now cap-cardinality-free: its exact
four-point row contains two distinct facing-cap interior points, the whole
carrier radius filter is retained, and both outer Moser endpoints separate
the pair's distances. Thus the old short/large-cap split has no surviving
large-cap branch. A separated outside pair has exact full-shell support, one
unique equidistant center inside the common cap, and a retained global block
ordering. The smallest checked consumed alternate requires two further
carrier centers on its perpendicular bisector, after which Dumitrescu's bound
closes. The actual critical-system interface reduces those centers to
reciprocal membership of the escaped pair in the rows sourced at its two
points, plus pairwise distinctness of the two blocker centers and
`uRow.center`; the return-to-confinement adapter is checked. Current data does
not supply those incidences or inequalities. Reciprocal incidence without
center distinctness forces a three-way blocker-center collision, with the
corresponding exact supports equal. The remaining claims are
therefore positive cross-row producer theorems, not unproved consequences
hidden in the cap/count layer.

**PROVEN through the five-row geometry boundary.** For the round-19
order-failure branch, the
necessary MEC gate reduces to nonnegative `x,y,z` with `x+y+z=pi/6` and three
one-sided lower chord inequalities.  The solver-free Lean theorem
`lower_chord_margins_incompatible` proves them inconsistent using only
`sin t <= t`; `common_gate_margin_lt_neg_four_twentyfive` additionally proves
the rigorous bound `tau < -4/25`.  All five audited endpoints use exactly the
standard core axioms.  The prior numerical best `-0.1701735873` has the
certified negative sign but is not certified optimal.
`false_of_five_row_metric_data` and its reflected endpoint now kernel-check
the actual order-to-angle/chord lift.  In fact they need no MEC, nonobtuse, or
disk hypothesis: the five row equalities and six cyclic signs suffice.  It is
now a registered consumed alternate: the label-generic carrier adapter
and deterministic matcher kernel-check, and replay banks both round-19 and
round-20 instances.

Further blind CEGAR rounds can discover alternate consumers but cannot
establish either live implication; they are not a prerequisite for the
producer proof.  No live `sorry` is claimed closed at this checkpoint.

## Stage-I joint-geometry frontier — 2026-07-14

**CHECKED-SCRATCH CONSUMER REDUCTION.**  The smallest
uniform separated-cap sink is now two equalities at the live `u`-row center:
`dist c q = dist c t1` and `dist c q = dist c t3`.  The fixed packet makes
`q,t1,t3` three distinct points on the positive-radius `p`-circle, so the
current-tree theorem `eq_of_equidistant_three_noncollinear` forces `p = c`,
contradicting the sharp frontier's center separation.  The source module is
`scratch/atail-force/stage1_three_dangerous_equidistant_sink.lean`; proving
either equality remains open.

**EMPIRICALLY VERIFIED EXACTLY ON A WEAKENED EUCLIDEAN SURFACE.**  The
33-point integer-coordinate checker
`stage1_dangerous_equality_euclidean_countermodel_2026-07-14.py` retains
global K4, failure of K4 after every deletion, one common deletion-blocker
system, exact dangerous and `u` full filters, and the localized/fixed/live
metric field shapes.  Nevertheless the squared distances from the `u`-row
center to `q,t1,t2,t3` are `36,34,32,26`.  The construction is non-convex and
does not instantiate the MEC/Moser/cap/no-M44 packet, so it is not a live
counterexample.  It rules out another producer based only on global K4,
deletion criticality, full-filter exactness, or common provenance.

**EXACT COMPLEMENTARY LOCAL WITNESS.**  The rational seven-point endpoint
configuration in
`stage1_separated_cap_packet_exclusion_assessment_2026-07-14.md` is strictly
convex, lies in the stated circumscribed MEC disk, realizes the six-point
facing cap and exact endpoint shell, and has the two proved outer-distance
inequalities.  It omits global K4 and the all-source critical system.  The two
witnesses therefore isolate the genuinely untested interaction: convex
MEC/cap geometry together with common critical-row provenance.

**LEAN SOURCE COMPLETE; FULL CHECK QUEUED.**  The cap-local blocker map gives
fiber capacity two for inside-cap centers and four for outside-cap centers.
Its mixed bound is arithmetically slack at every card-12 cap size 4--6, and the
strengthened finite-shadow validator plus ten tests pass.  This closes the
cap-count subroute negatively and gives no evidence for a threshold above
`CARD-GE-12`.

**OPEN-PROOF.**  The next useful theorem must consume the joint geometric
layer and produce the first cross-center datum: either the first dangerous
equality `dist c q = dist c t1`, the first reciprocal endpoint incidence
`y ∈ selectedAt(x).support`, or a different already-consumed metric/order
packet.  More generic blocker counting or blind CEGAR rounds do not attack
this boundary.

The reciprocal-incidence option has one further necessary qualifier.  If the
endpoint-interior source is merely localized to `t2` or `u`, diagonal source
incidence produces a row whose center is the already-known endpoint center;
that row cannot supply a new center to the triple-bisector sink.  The first
consumable endpoint datum must pair the incidence with
`H.centerAt x != c0`, where `c0` is that endpoint center.  The short-cap
outputs `c ∈ B` and `p ∈ R` remain preserved branches but have no current
consumer.  The required bank preflight and exact arm-by-arm inventory are in
`scratch/atail-force/stage1_coupled_geometry_first_field_assessment_2026-07-14.md`.

The short-cap audit sharpens that negative result.  A finite common-incidence
shadow realizes both `c ∈ B` and `p ∈ R` while keeping `R ∩ B = ∅`, so those
bare outputs cannot yield even one dangerous support hit on the current
incidence interface.  In either short non-surplus orientation, the cap
selector instead fixes two distinct off-surplus points already co-radial at
one opposite apex.  This reduces the branch to exactly one other-apex
equality.  That equality is contradiction-strength: the checked joint-fiber
injectivity theorem proves its negation for the fixed pair.  No required-bank
theorem produces it, and this specialization does not cover a large-facing-cap
branch.  See
`scratch/atail-force/stage1_short_cap_output_consumer_assessment_2026-07-14.md`
and
`scratch/atail-force/stage1_one_apex_cross_cap_bank_audit_2026-07-14.md`.

The uniform producer interface is therefore exact.  For

```text
T_r := (D.A.filter (fun x => dist x S.oppApex1 = r)) \ S.surplusCap,
```

the current tree gives `3 ≤ |T_r|` and makes the other-apex distance map
injective on `T_r`.  It is enough to prove

```text
ApexAlignedTwoHit(P,S,r) :=
  ∃ source,
    P.system.centerAt source = S.oppApex2 ∧
    2 ≤ |T_r ∩ support(P.system.selectedAt source)|.
```

Two intersection points immediately instantiate the forbidden double-apex
fiber and close K-A-PAIR.  The first absent atomic coupling is already
`OppApex2InBlockerImage`: no current cap, critical-system, common-provenance,
live-row, or bank theorem pins any chosen blocker center to `S.oppApex2`.
After that alignment, the second missing fact is the two-hit incidence.  This
is the next proof target; another marginal census, generic cardinality bound,
or consumer wrapper would not reduce it.  Full premise-by-premise audit:
`scratch/atail-force/apex_filters/joint_fiber_functional_producer_assessment_2026-07-14.md`.
