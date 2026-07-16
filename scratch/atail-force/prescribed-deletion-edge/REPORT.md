# Prescribed h4/h5 deletion-edge audit

## Verdict

The standalone prescribed-criticality lane is **retired**.

Every preferred finite-shadow edge has the same polarity: the left endpoint is
in the selected four-support and the right endpoint is outside it.  The
selected row therefore survives deletion of the right endpoint.  Consequently
the proposed output

```lean
¬ HasNEquidistantPointsAt 4 (D.A.erase f) d
```

(or its `d`/`f` mirror) is incompatible with the row already present at that
center.  Forcing prescribed deletion failure would not be a mechanism for
obtaining `h4`/`h5`; it would already prove the full packet contradictory.

The honest local output is instead:

```lean
dist d c = dist d f ∨
  HasNEquidistantPointsAt 4 (D.A.erase f) d
```

and, in the mirror orientation,

```lean
dist f a = dist f d ∨
  HasNEquidistantPointsAt 4 (D.A.erase d) f.
```

The equality arm enters the existing h4/h5 metric-core consumer.  The survival
arm must remain in the full robust coupling theorem, where global K4, the
retained source-indexed critical map, and MEC/cap order are all available.  It
cannot be closed by another prescribed-criticality argument.

## Kernel-checked polarity and terminal adapters

[`PrescribedDeletionEdge.lean`](./PrescribedDeletionEdge.lean) proves, with no
`sorry`:

```lean
theorem deletion_survives_of_not_mem_selected_support
    (K : SelectedFourClass A center)
    (hsource : source ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase source) center

theorem row_extension_or_deletion_survives
    (K : SelectedFourClass A center)
    (hanchor : anchor ∈ K.support) :
    dist center anchor = dist center source ∨
      HasNEquidistantPointsAt 4 (A.erase source) center

theorem h4_or_f_deletion_survives
    (Kd : SelectedFourClass A d) (hc : c ∈ Kd.support) :
    dist d c = dist d f ∨
      HasNEquidistantPointsAt 4 (A.erase f) d

theorem h5_or_d_deletion_survives
    (Kf : SelectedFourClass A f) (ha : a ∈ Kf.support) :
    dist f a = dist f d ∨
      HasNEquidistantPointsAt 4 (A.erase d) f
```

It also checks the actual-map adapter:

```lean
H.centerAt f hf = d ∨ H.centerAt d hd = f
  → dist d c = dist d f ∨ dist f a = dist f d,
```

and the sharper terminal fact that actual-map alignment plus the corresponding
right-outside-support fact is `False`.  Thus retaining the same
`CriticalShellSystem` is enough for the adapter; no new selector should be
constructed.  It is not enough to produce the alignment.

Focused validation:

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/prescribed-deletion-edge/PrescribedDeletionEdge.lean
```

passes.  Every printed declaration has axiom closure exactly `propext`,
`Classical.choice`, and `Quot.sound`.

## Exact finite-shadow evidence

The local checker [`check.py`](./check.py) pins and jointly checks:

- `current-marco-cores/row_extension_completion_checkpoint.json`, SHA-256
  `d6c2bece9b30fc337ef181a941a8b781b33d9217fe2347c948fe61b2d306a83c`;
- `common-system-parent/shadow_checkpoint.json`, SHA-256
  `e8ae93be71d1c10e638c7a2679c2b1e0847b921e328f6009143665f15c13dc37`.

Replay:

```bash
.venv/bin/python scratch/atail-force/prescribed-deletion-edge/check.py
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/current-marco-cores/row_extension_completion.py --check
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/common-system-parent/audit_shadow.py --check
```

All three checks pass.  The pinned facts are:

- all 23 preferred selected rows are exact;
- in all 23, the left endpoint is in the selected support and the right
  endpoint is outside it;
- the preferred split is five `h4`, eleven `h5`, and seven nominal `h5+h7`
  cases (the latter seven close with `h5` alone);
- adding the direct equality reaches `DuplicateCenterCore` in 21 cases and
  `ExactOffCircleCore` in two;
- all 23 shadows admit a total common blocker map and all 23 admit one that
  avoids the preferred right-endpoint-to-center alignment.

That last item directly tests the parent implementation fact that all five
`Hdepth5Rows` come from the same retained `Hcritical`.  Common provenance is
present in the abstraction and still does not produce the prescribed edge.

These statements are **EMPIRICALLY VERIFIED, exact within the pinned finite
incidence abstraction only**.  The abstraction is fixed card 12 with cap
profile `(5,5,5)` and omits coordinates, convexity, MEC optimality, alternate
radius classes, and the unbounded live theorem.  It is not a K-A-PAIR proof or
counterexample.

## Required bank and index preflight

The following registries were checked before treating the edge as new:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered prescribed deletion, selected exact rows,
critical-map alignment, bounded support, and the h4/h5 distance shapes.  The
relevant existing declarations are the current critical-shell/deletion
normal forms, the sibling `u1TwoLargeCapObstruction` consumer, and the U5
q-allowed selected-row counting family.  No indexed theorem produces the
prescribed alignment or a direct h4/h5 equality from the live full geometry.

The sibling `u1TwoLargeCapObstruction` has the exact consumer signature

```lean
(h1 : dist c a = dist c d)
(h2 : dist c a = dist c f)
(h3 : dist d c = dist d e)
(h4 : dist d c = dist d f)
(h5 : dist f a = dist f d)
(h6 : dist f a = dist f e)
(h7 : dist e a = dist e c) : False
```

but is unimported sibling code with a large algebraic certificate.  It is a
consumer discovery hit, not a current producer.

## U5 selected-row counting audit

The strongest relevant current declaration is

```lean
U5QAllowedAuditSupport.two_le_selected_inter_anchorSupport_erase_center_card
```

and the sibling `C5D3BPacket` contains the refined

```lean
two_le_qAllowedSelected_inter_anchorSupport_of_mem_exactRadiusClass_sdiff_base.
```

The mechanism is sound and useful for the robust lane: a selected exact
four-row overlaps the dangerous four-point circle in at most two points, so at
least two row points lie off that circle; bounded support then confines those
points to a small named anchor set.

### Live hypothesis map

| U5 input | Live source | Status |
|---|---|---|
| `U5DangerousTriple D q p {t1,t2,t3}` | `U1LargeCapRouteBTailLiveData.dangerous` | exact |
| `U5SelectedCandidateSkeleton ... u` | `U1LargeCapRouteBTailLiveData.selected` | exact |
| exact q-deleted dangerous radius | `exactQDeletedRadius` | available, not needed by the two-hit lemma itself |
| one selected four-row at each named center | `D.K4` via `FaithfulCarrierPattern`, or the retained `Hcritical` at its blocker centers | available |
| pairwise row overlap at most two | `SelectedFourClass.inter_card_le_two` / the audit constructor | automatic |
| two auxiliary off-circle anchors `a0,a1` | no current live selection theorem | missing |
| every chosen row is contained in `U5QAllowedBoundedSupport ... a0 a1` | no current global-K4, critical-map, MEC, or cap-order theorem | **first load-bearing missing field** |
| identify one of the two anonymous anchor hits with the prescribed `d` or `f` | no current theorem | second missing field |

The exact first non-bookkeeping antecedent is therefore the containment part of
`U5QAllowedAuditSupport.selected_classes`:

```lean
∀ x ∈ U5BoundedAuditCenters D q p T u a0 a1,
  Σ B : Finset ℝ²,
    Subtype fun _K : U5QAllowedK4Class D x B =>
      B ⊆ U5QAllowedBoundedSupport D q p T u a0 a1
```

Global K4 supplies `B`; it does not supply the final subset.  The retained
critical map supplies exact blocker rows; it also does not confine their
supports to these eight named points.  Even granting this packet, the theorem
returns a cardinality-two intersection with a four- or five-element anchor
set, not a named h4/h5 endpoint.  A further cap/order localization or
named-anchor exclusion is required.

## Honest replacement boundary

The smallest branch-complete local output is already kernel checked:

```lean
-- h4 orientation
dist d c = dist d f ∨
  HasNEquidistantPointsAt 4 (D.A.erase f) d

-- h5 orientation
dist f a = dist f d ∨
  HasNEquidistantPointsAt 4 (D.A.erase d) f
```

This replaces the proposed deletion-*failure* output.  At the parent:

1. consume the equality arm immediately with the existing row-extension/core
   sink;
2. retain the survival arm together with the same `CriticalPairFrontier`,
   `D.K4`, actual `Hcritical`, and the MEC/cap packet `S`;
3. prove the robust branch by returning an already consumed card-four,
   card-five, or common-blocker packet, or `False` directly.

Equivalently, the next content theorem is the parent-level robust coupling
contradiction under the negation of a direct h4/h5 row extension.  It must not
be weakened to “produce prescribed deletion failure”: on the preferred
right-outside row, that failure contradicts an explicit K4 witness.

The U5 bounded-support theorem is a plausible way to obtain a two-hit robust
output, but it belongs inside that full branch theorem.  Its first target is
the bounded-containment field above; its next target is named-anchor selection.

## Geometry textbook check

The ingested de Berg--Cheong--van Kreveld--Overmars computational-geometry
textbook was searched explicitly.  The closest passages say that the center
of a smallest enclosing disc is a farthest-point Voronoi vertex (three
farthest sites) or lies on a farthest-point Voronoi edge (two farthest sites),
and describe constrained minimum-disc updates with one or two prescribed
boundary points.

Those facts do not apply to `CriticalShellSystem.centerAt`: a deletion blocker
is an arbitrary carrier point carrying a critical equidistance row.  Its row
circle is not known to enclose the carrier, to be empty, or to be centered at
the MEC/farthest-Voronoi optimizer.  The textbook therefore supplies no
missing bounded-containment or named-anchor theorem without a new optimizer
bridge.  Treating a blocker circle as an MEC circle would be an invalid
hypothesis substitution.

## Epistemic status

- Deletion survival from right-outside-support: **PROVEN**.
- Direct equality-or-survival normal form: **PROVEN**.
- Actual-map alignment adapters: **PROVEN**, but alignment production is not.
- Twenty-three-shadow row-extension/core and common-map results:
  **EMPIRICALLY VERIFIED, exact within the pinned finite abstraction**.
- Uniform direct h4/h5 equality from the live K-A geometry: **open**.
- U5 bounded-support confinement and named-anchor selection: **open**.
- Standalone prescribed deletion-criticality as a producer route: **retired by
  logical polarity**.
