# Common-radius `sameBlocker × sameBlocker`: W4 proof attempt

Status: `INTERFACE-SURVIVOR`.  This is not a Euclidean P97 counterexample and
does not refute the live theorem.  It isolates the first missing synchronization
after using the new source-clean W-card-4 theorem.

Let

* `R_Q := (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support`,
* `c_Q := H.centerAt Q.source₁.1 Q.source₁.2`, and
* `i₀ := S.oppIndex1`.

Assume both common-radius source rows have support `R_Q`.

## Exact derivation

1. `freshThird_commonRadius_sameBlocker_freshCenter_mem_canonicalCap`
   gives `c_Q ∈ S.capInteriorByIndex i₀`.
2. `freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell_with_deletion_survivals`
   gives a finset `W` with `W.card = 4`, and for every `z ∈ W`:
   `z ∈ capInterior i₀`, `z ∉ R_Q`, an ambient proof `hzA`,
   `H.centerAt z hzA ≠ c_Q`, and
   `HasNEquidistantPointsAt 4 (D.A.erase z) c_Q`.
3. `H.no_qfree_at z hzA` instead gives
   `¬ HasNEquidistantPointsAt 4 (D.A.erase z) (H.centerAt z hzA)`.
   These statements concern different centers, so they are compatible.
4. `actualBlockerFiber_filter_capByIndex_card_le_two Q.source₁ i₀`
   bounds only sources in `cap i₀` whose actual blocker is `c_Q`.
   Every member of `W` has actual blocker different from `c_Q`, so the W4
   packet contributes zero elements to this bounded fiber.
5. Pointwise cap localization assigns the four actual W blockers to three
   strict caps.  Pigeonhole yields two blocker *caps*, not two blocker values.
   If the repeated cap is `i₀`, the sources themselves lie in that cap, so
   `crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair` is
   inapplicable.  If it is another cap and the blockers are distinct, that
   theorem yields a cross-deletion survival, not `False`.  Equal blockers are
   another explicit escape.
6. `freshThird_commonRadius_sameBlocker_exists_sameRadius_pair_off_selectedShell`
   gives an apex-equidistant W pair.  For distinct actual blockers,
   `crossDeletion_survives_of_distinct_selectedRow_blockers` rules out only the
   case in which both actual rows contain the opposite source.  It therefore
   returns one cross-deletion survival.  No W point lies in `R_Q`, so this does
   not create a positive Q-row incidence.

The first missing antecedent for the fiber-cardinality consumer is therefore
three cap-`i₀` W sources with one common actual blocker in cap `i₀`.  The W4
theorem gives neither the common blocker nor any blocker-cap return.  The first
missing antecedents for the cap/perpendicular-bisector consumers are a pair
whose blockers are distinct and whose two cross deletions are both blocked;
the available theorems prove that such a pair cannot occur and return a
survival instead.

## Concrete finite source/row/cap counterpattern

This table is a model of precisely the projected source/row/cap/deletion
interface above.  It is deliberately not claimed to extend to a full
`CounterexampleData`.

* `R_Q = {c₁,c₂,q₁,q₂}` and all four sources have actual blocker `c_Q` and
  selected row `R_Q`.
* `c_Q,c₁,c₂ ∈ capInterior i₀`; `q₁,q₂ ∉ cap i₀`.  Hence the `c_Q` blocker
  fiber filtered by `cap i₀` has exactly two elements.
* `W = {w₀,w₁,w₂,w₃} ⊂ capInterior i₀`, disjoint from `R_Q`.
* The actual blockers `b₀,b₁,b₂,b₃` of the `wᵢ` are pairwise distinct and all
  lie in `capInterior i₀`; in particular every `bᵢ ≠ c_Q`.
* The exact selected row `Rᵢ` at `bᵢ` contains `wᵢ` and three private support
  points, but contains no point of `R_Q` and no `wⱼ` for `j ≠ i`.

Equivalently, on the displayed sources the blocker/support table is

| sources | actual blocker | exact support at that blocker | in `cap i₀` |
|---|---|---|---|
| `c₁,c₂,q₁,q₂` | `c_Q` | `{c₁,c₂,q₁,q₂}` | only `c₁,c₂` |
| `wᵢ` | `bᵢ` | `{wᵢ,pᵢ₀,pᵢ₁,pᵢ₂}` | only `wᵢ` |

Here `c_Q,b₀,b₁,b₂,b₃` themselves are carrier points in
`capInterior i₀`, the four `bᵢ` are pairwise distinct, and all private
`pᵢⱼ` are outside `cap i₀` and distinct from every named point.  Thus the
closed-cap intersection bounds behind
`actualBlockerFiber_filter_capByIndex_card_le_two` are witnessed sharply:
`R_Q ∩ cap i₀ = {c₁,c₂}` and `Rᵢ ∩ cap i₀ = {wᵢ}`.  Define the
projected deletion predicate by

```text
survives(delete z, center d)  iff  z ∉ row(d).
```

Then `wᵢ ∉ R_Q` is exactly the W-theorem's deletion survival at `c_Q`,
while `wᵢ ∈ Rᵢ` is exactly `no_qfree_at` at `bᵢ`.  For `i ≠ j`, both
`wᵢ ∉ Rⱼ` and `wⱼ ∉ Rᵢ`, so both cross deletions survive.  This is the
same membership/deletion equivalence used by
`cross_deletion_survives_iff_not_mem_selected_support`, rather than an
independently chosen truth table.

Then deletion of every `wᵢ` preserves `R_Q` at `c_Q`, deletion of `wᵢ`
destroys the exact row `Rᵢ` at `bᵢ`, and each distinct-center overlap
`R_Q ∩ Rᵢ` has cardinality zero.  Every W blocker fiber filtered by `cap i₀`
has cardinality one.  Repeated-blocker-cap normalization necessarily chooses
the `source lies in blocker cap` arm.  For any apex-equidistant pair among the
W sources, both cross deletions survive because the two actual rows mutually
omit the opposite source, so the perpendicular-bisector consumer is also
satisfied.

A concrete metric core for the two required apex/Q equalities is:

* apex `a=(0,0)`;
* `c₁=(-1,0)`, `c₂=(1,0)`, and `c_Q=(0,2)`, so both `a` and `c_Q` are
  equidistant from `c₁,c₂`;
* `q₁=(-2,1)`, `q₂=(2,1)`, so
  `{c₁,c₂,q₁,q₂}` is a four-point circle about `c_Q`;
* `w₀=(0,3)`, `w₁=(3,0)`, so `w₀,w₁` are equidistant from `a` and neither is
  on the `c_Q` circle.

The private rows are left as abstract exact-four incidence rows.  Thus this
metric core witnesses compatibility of the common perpendicular-bisector
relations, while the finite table witnesses the precise exported incidence,
cap, fiber, and deletion facts.  A full convex Euclidean extension is not
asserted.

In particular, the model boundary is the projection consisting of exact-four
supports, actual-blocker fibers, cap labels, deletion/support equivalence, and
the equal-radius/perpendicular-bisector conclusions used by the named
consumers.  It deliberately omits the unused global fields of
`CounterexampleData`, the MEC construction of the cap packet, and a metric
realization of the four private rows.  Therefore it refutes only the proposed
implication from this projected packet to `False`, not the live theorem.

## First open synchronization theorem

At the narrowest existing-consumer boundary, the fiber route reaches the
following concrete statement and no existing producer supplies it:

```lean
theorem exists_canonicalCap_actualBlockerFiber_card_ge_three_of_commonRadius_sameBlocker
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport :
      (H.selectedAt C.surface.firstSource.1
          C.surface.firstSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
    (hsecondSupport :
      (H.selectedAt C.surface.secondSource.1
          C.surface.secondSource.2).toCriticalFourShell.support =
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    ∃ anchor : CriticalShellSystem.CarrierVertex D.A,
      H.centerAt anchor.1 anchor.2 ∈ S.capByIndex S.oppIndex1 ∧
      3 ≤
        ((ATailSurvivalCover.actualBlockerFiber H anchor).filter
          (fun source => source.1 ∈
            S.capByIndex S.oppIndex1)).card
```

Its consumer is already clean:

```lean
rcases hlargeFiber with ⟨anchor, hanchorCap, hthree⟩
have htwo := actualBlockerFiber_filter_capByIndex_card_le_two
  (S := S) (H := H) anchor S.oppIndex1 hanchorCap
omega
```

The source-shaped sufficient producer below exposes what the lower bound
would have to mean geometrically.  Here `R_Q` abbreviates the selected support
at `Q.source₁` as above:

```lean
theorem exists_three_W_sources_with_one_canonicalCap_actualBlocker
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirstSupport : /* first common source row = Q row */)
    (hsecondSupport : /* second common source row = Q row */) :
    ∃ z₁ z₂ z₃ : CriticalShellSystem.CarrierVertex D.A,
      z₁ ≠ z₂ ∧ z₁ ≠ z₃ ∧ z₂ ≠ z₃ ∧
      z₁.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
      z₂.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
      z₃.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
      z₁.1 ∉ R_Q ∧ z₂.1 ∉ R_Q ∧ z₃.1 ∉ R_Q ∧
      H.blockerVertex z₁ = H.blockerVertex z₂ ∧
      H.blockerVertex z₁ = H.blockerVertex z₃ ∧
      (H.blockerVertex z₁).1 ∈ S.capByIndex S.oppIndex1
```

Applied with anchor `z₁`, the last three lines put three distinct filtered
fiber elements into `actualBlockerFiber H z₁`; its cardinality is therefore
at least three, contradicting
`actualBlockerFiber_filter_capByIndex_card_le_two`.  The displayed theorem is
not claimed source-entitled or proved: under the ambient facts it is already a
branch-closing synchronization assertion, and the distinct-blocker model above
shows it cannot be extracted from the listed projections alone.

## Bounded theorem-bank preflight

Candidate searched once: a selected four-row centered in one indexed cap
cannot have four support sources in a different strict cap.  The scoped
agentic Lean-bank query returned no declaration.  The live source instead has
the weaker, slice-synchronized theorem
`criticalShell_inter_otherRichCapSlice_card_le_one`: for a blocker in cap `i`,
one gets at most one hit in a *single radius slice* of a different rich cap
`j`.  It does not apply to the arbitrary W4 set, and the separate same-radius
pair can take pairwise-distinct blockers in the canonical cap as in the
counterpattern.
