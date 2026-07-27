# Tri-apex planar bridge audit

Status: source/bank audit only.  No declaration found that proves the live
`card >= 3` concentration witness.

## Smallest checked geometric refinement

The following first-opposite-cap lemma elaborates under the current
`FrontierLiveClosure` import.  It says that a canonical blocker shell with two
hits on one rich apex circle has its blocker in that same strict cap.

```lean
private theorem not_unique_of_rich {A : Finset ℝ²} {p : ℝ²}
    (h : ApexRichClassStructure A p) : ¬ IsUniqueFourCenter A p := by
  rintro ⟨hp, r0, hr0, hcard0, huniq⟩
  rcases h with ⟨r, hr, hsix⟩ |
      ⟨r1, r2, hr1, hr2, hne, hfour1, hfour2⟩
  · have her : r = r0 := huniq r hr (by omega)
    subst r
    omega
  · have he1 : r1 = r0 := huniq r1 hr1 hfour1
    have he2 : r2 = r0 := huniq r2 hr2 hfour2
    exact hne (he1.trans he2.symm)

theorem criticalShellCenter_mem_firstApexInterior_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (hrich : ApexRichClassStructure D.A S.oppApex1)
    (hcover : ∀ x : ℝ², ∀ hx : x ∈ D.A,
      H.centerAt x hx ≠ x ∧
        IsUniqueFourCenter D.A (H.centerAt x hx) ∧
        uniqueFourClass D.A (H.centerAt x hx) =
          (H.selectedAt x hx).toCriticalFourShell.support)
    {x : ℝ²} (hx : x ∈ D.A)
    (htwo : 2 ≤
      ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex S.oppIndex1 := by
  classical
  have hone : 1 <
      ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex1 r ∩
          S.capInteriorByIndex S.oppIndex1)).card := by
    omega
  rw [Finset.one_lt_card] at hone
  obtain ⟨q, hq, w, hw, hqw⟩ := hone
  have hq' := Finset.mem_inter.mp hq
  have hw' := Finset.mem_inter.mp hw
  have hcA : H.centerAt x hx ∈ D.A :=
    (H.blockerVertex ⟨x, hx⟩).2
  have hcne : H.centerAt x hx ≠ S.oppApex1 := by
    intro heq
    apply not_unique_of_rich hrich
    simpa [heq] using (hcover x hx).2.1
  have hceq :
      dist (H.centerAt x hx) q = dist (H.centerAt x hx) w :=
    ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius q hq'.1).trans
      ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius w hw'.1).symm
  exact
    FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
      hq'.2 hw'.2 hqw hcA hcne hceq
```

The reusable production version should be indexed by `i : Fin 3`:

```lean
theorem criticalShellCenter_mem_capInteriorByIndex_of_two_hits
    (S : SurplusCapPacket D.A) (i : Fin 3) (H : CriticalShellSystem D.A)
    (hrich : ApexRichClassStructure D.A (S.oppositeVertexByIndex i))
    (hcover : ...)
    {x} (hx : x ∈ D.A) {r}
    (htwo : 2 ≤
      ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i
```

The core cap argument is already implemented generically but privately as
`FirstApexInteriorPairGeometry.false_of_two_cap_centers_equidistant_outside_pair`.
Making that helper public and then indexing
`bisectorCenter_mem_firstApexInterior` is the smallest clean implementation.
The current target import reaches the first-apex theorem.  The analogous
second-apex theorem
`ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior`
exists but its module is not imported by `FrontierLiveClosure`.

This is a genuine missing planar constraint: it uses the ordered-cap/MEC
uniqueness theorem, not merely circle-intersection counting.  It does not by
itself produce a second hit, much less the required third hit.  A compatible
low-hit configuration can give every canonical shell only its source from the
rich class; those singleton fibers never trigger this lemma.

## Exact remaining bridge

Under the negation of the live target, every canonical shell has at most two
hits in every named rich class.  The checked lemma above classifies every
two-hit shell by forcing its blocker into that cap.  The still-unproved step is
therefore an anti-matching/cross-incidence statement:

> For the named sources `F.pair.q`, `F.pair.w`, and the three concrete rich
> strict-cap witness sets, the canonical blocker assignment cannot have all
> rich-class shell intersections of size at most two.

No current theorem attaches two chosen members of any rich pattern to one
named `H` shell.  This is why the existing localizations cannot start, and why
they cannot close concentration.

The strongest target-import-reachable cap packet is
`SurplusCapPacket.capByIndex_cgn4g_strictCapBlockData`; it exposes the ordered
cap, MEC packet, side data, and global boundary order for any `i`.  No existing
declaration combines it with `H.selectedAt` or a rich witness set.

## Bank audit

No declaration in the current banks, the legacy banks, or the sibling
`p97-rvol` bank produces the concentration witness.  The closest sibling result
is `Problem97.cap_arc_midpoint_inequality_v1` (and `v2`/`v3`), but it requires
the sibling `NonObtuseCircumscribedMoserTriangle`/`CapTriple` interface and
concludes only a pairwise midpoint inequality.  There is no target-imported
adapter, and that inequality does not attach a canonical shell to a rich pair.

## Current-source indexed elaboration

`scratch/triapex-planar-bridge/IndexedTwoHitLocalization.lean` imports only
`Erdos9796Proof.P97.ATail.FrontierLiveClosure`, so every declaration below is
reachable from the live target's current import graph.  It kernel-elaborates
with:

```text
cd lean
lake env lean ../scratch/triapex-planar-bridge/IndexedTwoHitLocalization.lean
```

The checked declarations are:

- `bisectorCenter_mem_oppositeCapInterior`, uniform in `i : Fin 3`;
- `criticalShellCenter_mem_oppositeCapInterior_of_two_hits`, requiring only
  the local `IsUniqueFourCenter` fact for the blocker; and
- `criticalShellCenter_mem_oppositeCapInterior_of_two_hits_of_cover`, accepting
  the exact global cover hypothesis carried by `FrontierLiveClosure`.

There are no `sorry`s or axioms in this scratch module.

Applying the result at all three indices does not contradict the available
`StrictCapBlockData`, MEC, or ordered-cap facts.  The first missing antecedent
is already needed before any indexed application: for a named source `x` and a
rich pair `q ≠ w`, one must prove

```lean
q ∈ (H.selectedAt x hx).toCriticalFourShell.support
w ∈ (H.selectedAt x hx).toCriticalFourShell.support
```

or equivalently prove that the canonical blocker `H.centerAt x hx` is
equidistant from that rich pair.  The cover hypothesis supplies only the
source's own membership in its canonical shell.

Even if such a two-hit antecedent is postulated independently for all three
indices, the localizer yields one blocker in each strict cap.  Those blockers
may be three distinct points.  The reachable interfaces provide no at-most-two
bound on blockers, no repeated-blocker producer, and no common outside pair
across two cap centers.  Consequently the ordered-cap anti-matching theorem
cannot fire: its two centers must lie in the same ordered cap and bisect the
same pair lying outside that cap, whereas the three localized pairs may differ
and lie inside their respective caps.

## Follow-up: directed-shell split at the anti-matching leaf

Current production now contains the indexed two-hit localizer and exposes
`exists_two_hit_criticalShell_with_center_outside_of_all_low_hits` as the sole
load-bearing leaf.  The target-import-reachable directed-shell equivalence
sharpens the remaining gap:

```lean
HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q hqA) ↔
  w ∉ (H.selectedAt q hqA).toCriticalFourShell.support
```

`scratch/triapex-planar-bridge/LowHitDirectedSplit.lean`, importing only
`FrontierLiveClosure`, kernel-elaborates without `sorry`.  It proves:

- `twoHit_of_crossDeletion_failure_sameRichCap`: for distinct `q,w` in one
  indexed selected class and strict cap, failure of the cross-deletion makes
  `w` a shell member, hence `q,w` give the required two hits;
- `crossDeletion_survives_of_blocker_outside_richCap`: if that canonical
  blocker is outside the cap, the cross-deletion necessarily survives.

Thus “outside blocker” and “failure of cross-deletion” are the exact
incompatible conditions whose combination would close the leaf.

The banked `nonempty_retainedInteriorPairOutcome R` does not supply this
combination:

- the equal-blocker collision arm gives the two-hit shell, but its checked
  `blocker_mem_capInterior` theorem puts the blocker **inside**;
- the distinct-blocker arm gives, in one orientation, the partner
  **outside the shell** and records that the cross-deletion **survives**.

So the distinct-blocker arm cannot compose with the adapter: it already
inhabits the survival side of the equivalence.  It also contains no theorem
placing the kept source's blocker outside its own first opposite cap.

The first unavailable implication from that arm is therefore

```lean
RetainedInteriorDirectedOmission R
  → H.centerAt kept kept_mem_A ∉ S.capInteriorByIndex S.oppIndex1
```

but even this location statement would merely reprove its stored survival.
The genuinely sufficient bridge must additionally eliminate the survival
alternative (possibly for a different selected partner):

```lean
∃ i q w hqA r,
  q ≠ w ∧
  q ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
    S.capInteriorByIndex i ∧
  w ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
    S.capInteriorByIndex i ∧
  H.centerAt q hqA ∉ S.capInteriorByIndex i ∧
  ¬ HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q hqA).
```

No current field of `R`, `B`, `L`, `N`, or `T`, no rich-pattern witness, and
no retained normal-form bank theorem proves either the blocker-location link
or this survival foreclosure.  Downstream retained modules only package the
surviving common-deletion alternatives into longer normal forms; they do not
eliminate them.

## Equal-blocker exact-two audit

The live equal-blocker coordinator is now checked.  It constructs
`C : LocalizedCollisionCommonDeletion P` and
`M : LocalizedCollisionMutualOmissionCycle P C`, then delegates to the sole
open collision leaf
`false_of_localizedCollisionMutualOmissionCycle_and_all_low_hits`.

`scratch/triapex-planar-bridge/EqualBlockerExactTwo.lean`, importing only
`FrontierLiveClosure`, kernel-elaborates without `sorry`.  Its theorem
`retainedCollision_commonUniqueClass_exactTwo` proves:

- the common `uniqueFourClass` is each collision source's canonical support;
- its intersection with the entire first closed cap is exactly
  `{P.source₁, P.source₂}`;
- its intersection with the retained first-apex selected-class strict-cap
  slice is again exactly that pair, hence has cardinality two;
- both cross incidences hold; and
- the common blocker lies in the same strict cap.

In fact, `hlow` is unnecessary for all of these conclusions:
`P.shell_inter_cap_eq_sources`, the two sources' retained-radius memberships,
and strict-cap containment already prove the exact retained-slice equality.
Thus the equal-blocker packet **saturates** the low-hit bound; it does not
contradict it.

The closest import-reachable equality-core terminal is
`false_of_distinct_actualRow_contains_collisionSources`.  In the notation of
`P`, its first missing antecedent is precisely a second actual row through the
same collision pair with a genuinely different canonical blocker:

```lean
∃ z, ∃ hz : z ∈ D.A,
  H.centerAt z hz ≠ H.centerAt P.source₁ P.source₁_mem_A ∧
  P.source₁ ∈
    (H.selectedAt z hz).toCriticalFourShell.support ∧
  P.source₂ ∈
    (H.selectedAt z hz).toCriticalFourShell.support
```

After repackaging `P` as the retained-radius collision, that existing theorem
closes immediately.  No current hypothesis produces this antecedent.
Moreover, the existing theorem is already used while constructing `M` to
show that the fresh row omits at least one collision source.  So the checked
fresh common deletion points into the mutual-omission branch, not into this
equality terminal.

Equivalently, a producer tailored directly to `hlow` would have to return,
on one explicit index and radius, three points in one canonical-shell /
rich-apex-class / strict-cap intersection:

```lean
∃ i x hx r,
  ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
  3 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
    (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
      S.capInteriorByIndex i)).card
```

No current bank declaration produces this from `P`, `C`, and `M`.  The
apparent later three-hit theorem in `FrontierLiveClosure` is circular here:
it is obtained by eliminating the same all-low contradiction coordinator.
The sibling and legacy banks require additional row-slot, finite-pattern, or
named metric packets for which no field-compatible adapter exists.
