# U5 bounded-support bridge audit for K-A-PAIR

Date: 2026-07-14

## Verdict

The RVOL U5 two-hit counting mechanism is real, but it does **not** currently
map to a producer from `CriticalPairFrontier` or the live K-A hypotheses.  Its
decisive input is not global K4 or the two-circle overlap bound.  It is an
assumed confinement field saying that the selected four-class is contained in
one fixed eight-point support.

The K-A surface supplies the exact-class and overlap parts.  It does not supply
the confinement, nor does it identify the bounded anchors with an
off-surplus first-apex marginal.  Whether the full convex/MEC/cap/no-`IsM44`
geometry forces such a confinement is therefore **CONJECTURED / OPEN**, not
proved by the bank.

No Lean wrapper is added.  A conditional adapter would only repackage the
missing containment and duplicate cardinal arithmetic already proved in the
canonical U5 support module.

## Required bank and index preflight

The following required registries were checked before this assessment:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` U5 and stale-C5D3B sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted indexed-Lean searches covered bounded selected K4 support, selected
rows off a named circle, two points outside a cap/row, and the exact theorem
name.  The high-signal hits were the sibling C5D3B declarations and the
already-ingested canonical `U5GlobalIncidenceSupport` lemmas.  No hit produces
the confinement from global K4, cap geometry, or a `CriticalShellSystem`.

The inventory records

```text
Problem97.C5D3B
  .two_le_qAllowedSelected_inter_rowOffAnchors_card_of_sameSideTerminal
```

at `RVOL.P97.C5D3BPacket:6301` as source-proved and RVOL-reachable.  This is
discovery evidence only: the registry's stale-C5D3B audit says that this large
surface does not freshly build against the current canonical dependency because
of duplicate `CGN4gExt` declarations.  The present assessment does not treat
the old C5D3B olean as a portable kernel result.

## Exact mechanism in the sibling theorem

Write

```text
B := (H.selected_classes z hz).1
R := {v3, v1, qs, u}
A := {q, w, H.a0, H.a1}.
```

The proof has four ingredients:

1. `H.selected_card_four z hz` gives `B.card = 4`.
2. `P.rowCircleQAllowedK4Class` and
   `((H.selected_classes z hz).2).1` are classes at distinct centers, so
   `U5QAllowedK4Class.inter_card_le_two` gives `(B ∩ R).card <= 2`.
3. Cardinal arithmetic gives `2 <= (B \ R).card`.
4. The field

   ```text
   ((H.selected_classes z hz).2).2 :
     B ⊆ U5QAllowedBoundedSupport
       D q v3 {v1,qs,w} u H.a0 H.a1
   ```

   and the definition of `U5QAllowedBoundedSupport` give

   ```text
   B \ R ⊆ B ∩ A.
   ```

Only item 4 is bounded-support content.  The support simplifies to

```text
{q, v3, u, H.a0, H.a1, v1, qs, w},
```

so removing the row-circle labels leaves the four named anchors in the
conclusion.

The canonical tree already contains the same general counting split:

- `U5QAllowedK4Class.exists_card_four_of_globalK4` produces an exact selected
  four-class at an ambient center but explicitly does not prove confinement;
- `U5QAllowedAuditSupport.two_le_selected_sdiff_dangerous_circle_card` proves
  the two-off-circle count conditionally on audited support; and
- `U5QAllowedAuditSupport.two_le_selected_inter_anchorSupport_erase_center_card`
  moves those two points into the bounded anchors.

The constructors
`U5QAllowedAuditSupport.of_selectedClasses` and
`U5QAllowedConfinedK4AuditPayload.toAuditedSupport` also take the containment
as input.  They do not derive it.

There is also a literal packet mismatch before this field can be used.  K-A
does not supply either `C5D3BSameSideTerminalPacket` or
`U5QAllowedAuditSupport`.  The sibling producer targets meant to construct
those packets are stated under `D.Minimal`, `D.IsM44`, `U2Statement`,
`U3ShortCapSaturation`, and `U5ModeA`; the live K-A leaf instead assumes
`hNoM44`.  Therefore the C5D3B theorem cannot be called directly.  Only its
general four-minus-two proof pattern is relevant here.

## Hypothesis map to the live critical-pair frontier

For a production frontier `F : CriticalPairFrontier D S r Hcritical`, set

```text
T_r := (D.A.filter (fun x => dist x S.oppApex1 = r)) \ S.surplusCap
Kq  := (Hcritical.selectedAt F.pair.q F.pair.q_mem_A)
         .toCriticalFourShell.
```

The live fields already provide:

- an exact four-point blocker row `Kq.support`;
- `F.pair.q_blocker_ne_oppApex2`, hence the center of `Kq` differs from
  `S.oppApex2`;
- an exact selected four-class `K2` centered at `S.oppApex2`, obtainable from
  global K4 (and a twice-erased K4 witness from `F.secondApexDouble`); and
- the sharp overlap bound

  ```text
  (K2.support ∩ Kq.support).card <= 2
  ```

  from `SelectedFourClass.inter_card_le_two`.

What is absent is any inclusion relating those independently selected rows.
In particular, neither `CriticalShellSystem.centerAt` nor
`CriticalShellSystem.selectedAt` says where a K4 class at a different center
is supported.  Exactness locks a selected row once its center is already a
chosen blocker; it does not confine another center's row to the union of a
blocker shell and cap-local points.

The frontier's current source pair is also not already the desired pair:
`SurvivorPairRelocationPacket.oppApex2_dist_ne` proves its two members have
different second-apex radii.

## Can the production cap-row theorems replace confinement?

No.  The three closest current declarations recover the U5 mechanism's upper
bound and pair-uniqueness halves, but none gives a bounded target support.

### `selectedFourClass_inter_capByIndex_card_le_two`

For a selected four-class whose center lies in one indexed cap, this theorem
proves that at most two support points lie in that same cap.  Consequently at
least two support points lie in the **entire cap complement**.  This is a valid
four-minus-two count, but the cap complement is not `T_r`, is not a fixed
four-anchor set, and is not known to be contained in
`Kq.support ∪ T_r`.  The two resulting points share the selected row's radius,
but no theorem makes them co-radial from `S.oppApex1`.

Thus this theorem can replace the U5 overlap estimate, but not the U5
confinement field.

### `outsidePair_unique_capCenter`

This is a contradiction consumer.  It assumes two distinct points already lie
outside one ordered cap and are both equidistant from two distinct centers of
that cap.  K-A would be closed once the required outside pair and both center
equalities were available; the theorem does not produce either the pair or
membership in a common first-apex marginal.  In particular, it cannot turn a
generic pair in a cap complement into a pair in `T_r`.

### `orderedCap_outsidePairCount_sum_le`

This theorem sums the number of outside pairs selected by all centers of one
ordered cap and bounds that sum by all pairs in the cap complement.  Its key
input is precisely `outsidePair_unique_capCenter`, so it prevents reuse of one
outside pair by two cap centers.  It is an aggregate **upper** incidence bound;
it supplies neither a repeated pair nor a fixed-row support inclusion.

The companion lower count `orderedCap_card_add_four_le_choose_outside` can
force the cap complement to be large enough to hold all those disjoint pairs.
For the unbounded K-A surface that is compatible with increasing ambient
cardinality and still does not localize any pair to `T_r`.  Therefore the
cap-row counting family does not remove the bounded-support gap.

## Smallest honest candidate producer

The full `U5QAllowedAuditSupport` packet is stronger than K-A needs.  The
smallest direct translation of its useful field is the following one-row
confinement statement:

```text
exists K2 : SelectedFourClass D.A S.oppApex2,
  K2.support ⊆ Kq.support ∪ T_r.
```

Everything after this inclusion is already routine and producer-free:

1. distinct centers give
   `|(K2.support ∩ Kq.support)| <= 2`;
2. `K2.support.card = 4` gives at least two points in
   `K2.support \ Kq.support`;
3. confinement puts both points in `T_r`;
4. membership in `T_r` gives off-surplus membership and one common
   first-apex radius; and
5. membership in `K2.support` gives one common second-apex radius.

Thus this inclusion immediately yields the forbidden K-A pair.  It visibly
uses the retained critical row and is strictly smaller than constructing all
audit centers, two auxiliary anchors, and all of their confined selected
classes.

## Kernel-checked conditional adapter

The exact conditional consumer is now pinned in the scratch-only file
`OneRowConfinementAdapter.lean` as

```lean
theorem false_of_secondApexClass_support_subset_blockerSupport_union_marginal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (K2 : SelectedFourClass D.A S.oppApex2)
    (hconf :
      K2.support ⊆
        (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support ∪
          ((D.A.filter fun x => dist x S.oppApex1 = r) \
            S.surplusCap)) :
    False
```

This has exactly one additional content hypothesis, `hconf`.  The proof uses
`F.pair.q_blocker_ne_oppApex2` and
`SelectedFourClass.inter_card_le_two` to bound overlap with the retained row
by two, exact support cardinality four to extract two points outside that row,
and `U2NonSurplusSqueeze.oppCap2_escape_gen` to contradict their two common
apex radii.  In particular, there is no second unrecorded localization or
pair-existence assumption hidden in the adapter.

Direct validation from the `lean/` Lake root succeeded:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/u5-bounded-support-bridge/OneRowConfinementAdapter.lean
```

Lean's `#print axioms` result is exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` dependency.  This validates the consumer only; it does
not promote or prove the geometric confinement producer.

No production theorem or banked theorem proves this inclusion.  Current MEC
and cap results cover ambient points by cap regions and give one-hit or
two-circle upper bounds.  A cap-region cover is not a support cover by
`Kq.support ∪ T_r`, and the retained critical map supplies no such
cross-center containment.

## Regression and falsifier boundary

Two existing artifacts prevent this gap from being silently replaced by an
incidence-only assertion.

First,
`off-frontier-continuation/IncidenceCapCountermodel.lean` is a previously
kernel-checked `Fin 12` shadow retaining exact `(5,5,5)` cap cardinalities and
coverage, one four-row at every center, pairwise overlap bounds, and one common
critical blocker map.  Its theorem
`no_off_frontier_source_has_two_dangerous_hits` proves that these finite fields
do not force even the analogous two-hit conclusion.  This is **PROVEN within
that finite abstraction**, not a Euclidean or K-A counterexample.

Second, the exact integer-coordinate checker

```text
scratch/atail-force/off-frontier-two-hit-geometry/
  exact_euclidean_selection_countermodel.py
```

was rerun for this audit and passed.  It exhaustively verifies, in exact Python
integer arithmetic, a 33-point carrier with global K4, every single deletion
breaking global K4, exact four-point full filters, and a common critical-shell
selection for which the 29 off-frontier selected rows have hit histogram
`27 zero / 2 one`; the maximum selected two-hit count is one.  Pinned digests:

```text
base construction  a78922fbf1a30e7642019a65859c93d34d45f668e06e0f60310bf780b45c55c5
selection          e55aa316518bdb7912922d96eaa8d142e972927cfb00cba51942279e19c273fe
```

This is **EMPIRICALLY VERIFIED exact computation**, not Lean-kernel evidence.
The carrier is nonconvex and omits the live MEC/surplus-cap/no-`IsM44` layer,
so it does not refute the full K-A implication.  It is the regression gate:
any proposed proof using only global K4, deletion criticality, exact selected
rows, and common-map provenance is false at this boundary.  A valid positive
proof must visibly consume the convex/MEC/cap/no-`IsM44` geometry omitted by
the checker and explain how that geometry yields the displayed inclusion (or
bypass it with another closing producer).

## Epistemic ledger

- **PROVEN:** conditional on bounded support, the U5 four-minus-two counting
  mechanism yields two bounded anchors; the canonical tree already contains
  this mechanism.
- **PROVEN within a finite abstraction:** cap cardinalities, all-center
  four-row incidence, overlap bounds, and a common blocker map do not force
  the analogous two-hit.
- **EMPIRICALLY VERIFIED:** exact Euclidean/global-K4/deletion/full-filter/
  common-map data without convex/MEC localization do not force the two-hit.
- **CONJECTURED / OPEN:** full live convex/MEC/cap/no-`IsM44` geometry may force
  `K2.support ⊆ Kq.support ∪ T_r`, another equally strong localization, or a
  different closing producer.
- **NOT CLAIMED:** an independence result or counterexample for the complete
  K-A hypotheses.
