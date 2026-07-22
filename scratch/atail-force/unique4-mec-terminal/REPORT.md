# Exact-four fresh-center MEC terminal audit

Date: 2026-07-22

Status: **ONE SOURCE FIELD RECOVERED AND ONE COMPLETE CAP-LOCATION ARM
ELIMINATED.  NO DIRECT `False` FOR THE REMAINING TRANSITION ARMS.  A FOURTH
MEC-BOUNDARY POINT IS PROVABLY INSUFFICIENT BY ITSELF; THE FIRST MISSING
GEOMETRIC INPUT IS A COLLISION/CORE-DRIVEN EXACT-CAP RETRIANGULATION THEOREM.**

## Scope

This lane starts from

```lean
Problem97.ATailUniqueFourGlobalCouplingScratch
  .exists_strictCap_collision_or_singletonCore_or_packedCore
```

and its checked collision classification

```lean
Problem97.ATailUniqueFourGlobalCouplingScratch
  .collision_sources_exact_cap_residual.
```

It uses the full source object

```lean
R : OriginalUniqueFourResidual F
```

including `R.minimal`, `R.noM44`, the actual `SurplusCapPacket`, the exact
first-apex class, and the MEC data retained by `S`.  No production file,
closure document, outer search, or other scratch lane is modified.

## Required theorem-bank preflight

The following required registries were checked before deriving a new local
geometric statement:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered exact-four strict-cap
collisions, two equidistance centers and cyclic order, replacement of a Moser
vertex by another MEC-boundary point, alternative support triangles, and
same-carrier `IsM44` construction.  The closest reusable declarations are:

```text
false_of_two_centers_equidistant_pair_{after,enclosed,split,before}
outsidePair_unique_capCenter
isM44Packet_of_capTriple_two_exact_of_card_gt_nine
MEC.exists_nonobtuse_circumscribed_triple
```

The first two families explain the already-checked one-in/one-out collision
normal form.  The `IsM44` constructor requires a complete nonobtuse MEC
support triple and two exact cap-cardinality proofs.  The general nonobtuse
triple extractor neither retains a specified fresh center nor supplies those
two exact caps.  No banked theorem bridges that gap.

## Recovered source field

The proof of the original transition chooses

```lean
center ∈ D.A \ protectedDeletionSet R,
```

but its theorem statement weakens this to `center ∈ D.A`.  The discarded
complement fact matters: `protectedDeletionSet R` contains both the complete
exact first-apex class and all three displayed Moser vertices.

`UniqueFourFreshCenterMECBoundary.lean` replays the same source construction
and retains the field in

```lean
exists_fresh_strictCap_collision_or_singletonCore_or_packedCore
```

with the same collision/singleton/packed trichotomy.  This is not a selector
reassignment and not a conditional adapter.  The new center is the actual
minimality witness chosen outside the deletion set.

## PROVEN: the exact-four first-cap location disappears

The residual already carries distinct strict first-opposite-cap points

```text
R.interior_q, R.interior_w
```

inside the exact first-apex class.  A fresh center is outside that class.  If
it also lies in the same strict cap, those three distinct points force the
closed cap to have cardinality at least five:

```lean
firstOppCap_card_ge_five_of_fresh_center
    (R : OriginalUniqueFourResidual F)
    (hcenterFresh : center ∈ D.A \ protectedDeletionSet R)
    (hcenterInterior :
      center ∈ S.capInteriorByIndex S.oppIndex1) :
    5 ≤ (S.capByIndex S.oppIndex1).card
```

Consequently, if the first opposite cap has cardinality four, every fresh
collision, singleton-core, or packed-core center lies in one of the other two
strict caps.  This eliminates one complete cap-location arm of all three
transition outputs:

```lean
fresh_center_avoids_exact_firstOppCap
```

The same exact-four-cap hypothesis combines with `R.noM44` and the source
lower bound on both opposite caps to force the second opposite cap to be
large:

```lean
secondOppCap_card_ge_five_of_firstOppCap_card_eq_four
```

Finally,

```lean
collision_sources_residual_of_firstOppCap_card_eq_four
```

feeds the recovered freshness into the existing collision classifier.  The
old `k = S.oppIndex1` output is removed.  The exhaustive collision residue on
this cap profile is now:

1. one deleted source is a displayed Moser vertex outside the exact class; or
2. both sources are in the exact class and exactly one lies in the fresh
   center's cap.

The second opposite cap is simultaneously known to have at least five
points.  Neither remaining output matches a current terminal: the vertex arm
lacks first-apex co-radiality, while the split arm has the opposite polarity
from `outsidePair_unique_capCenter`.

## PROVEN: exact MEC dichotomy for the fresh center

The recovered field also proves

```lean
fresh_center_strictlyInsideMEC_or_four_boundary_points
```

whose alternatives are exactly:

```text
dist center mec.center < mec.radius

or

4 ≤ (MEC.boundary D.A S.hA).card.
```

In the boundary arm, the fresh center is distinct from all three displayed
Moser vertices, so it is genuinely a fourth MEC-boundary carrier point.  This
uses the actual minimum enclosing disk and the three actual support-boundary
witnesses in `S`; it does not conflate convex-hull extremality with MEC
boundary membership.

## Exact boundary regression: four boundary points do not force `IsM44`

`verify_boundary_ingress_not_m44.py` gives an exact real-algebraic regression
against treating the boundary alternative as a terminal.

It constructs twelve strictly convex points at angular positions in multiples
of 30 degrees.  Indices `{0,1,5,9}` are on the unit circle and every other
point is scaled by `999/1000`.  Exact symbolic checks establish:

- the unit disk is the MEC (the origin is the equal-weight convex combination
  of boundary points `1,5,9`);
- the MEC boundary is exactly `{0,1,5,9}`;
- the displayed nonobtuse support triangle `(0,5,9)` has cap profile
  `(6,5,4)`;
- point `1` is a fourth boundary point in the strict interior of its
  six-point cap; and
- the only nonobtuse boundary triples have profiles `(6,5,4)` and `(5,5,5)`.

Thus no boundary triple has two exact four-caps.  This is an exact
countermodel to the implication

```text
fresh strict-cap MEC-boundary point
  → alternative same-carrier IsM44 packet.
```

It is explicitly **not** `CounterexampleData`: it supplies no global K4,
minimality, critical map, or transition collision/core.  It shows only that
boundary ingress and the original cap packet do not complete the
retriangulation; the remaining proof must use the transition's metric or
minimality data.

## First exact missing geometric theorem

The next theorem cannot merely prove that the fresh center is on the MEC
boundary.  Even that stronger branch survives the exact regression above.
The first terminal-grade statement must use one of the actual collision or
minimal-deletion-core outputs to force a **cap-counted retriangulation**:

```lean
fresh_transition_exactPair_retriangulation
    (R : OriginalUniqueFourResidual F)
    (fresh transition data at center) :
    ∃ MT hCirc CP,
      -- MT is a nonobtuse circumscribed MEC triangle on D.A,
      -- center is one of its three support vertices,
      -- CP is its complete physical CapTriple, and
      CP.HasExactPair
```

Together with `R.carrier_card_gt_nine`, the exact pair feeds

```lean
isM44Packet_of_capTriple_two_exact_of_card_gt_nine
```

and contradicts `R.noM44` immediately.

The regression shows that the theorem must visibly consume more than
`center ∈ MEC.boundary`: for the collision arm it must use the actual two
deleted sources and their equal radius at `center`; for the singleton or
packed arm it must use the complete critical shells and minimal-deletion
provenance.  Without that coupling, the desired exact pair is false.

The complementary strict-MEC-interior arm also remains live.  No existing
terminal turns a fully deletion-robust or critical strict-cap center inside
the MEC disk into a contradiction.  Its first missing input is therefore a
genuine metric continuation from the collision/core to a checked multicenter
row occurrence, rather than another boundary or cap-cardinality lemma.

## Validation

The Lean file was freshly elaborated with warnings as errors.  Every printed
declaration has axiom closure exactly

```text
propext
Classical.choice
Quot.sound
```

with no `sorry`, `admit`, `native_decide`, unsafe declaration, or custom axiom.

The exact regression passes via:

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-mec-terminal/verify_boundary_ingress_not_m44.py
```

and reports

```text
PASS_EXACT_BOUNDARY_INGRESS_NOT_M44
```

The result is exact within the documented Euclidean/MEC/cap model and is not
a Lean proof or a model of the live source residual.

## Epistemic status

- **PROVEN / KERNEL CHECKED:** recovered fresh-center transition, first-cap
  cardinality lower bound, exact-first-cap location elimination, no-M44
  second-cap lower bound, sharpened collision residue, and MEC dichotomy.
- **EXACT REAL-ALGEBRAIC REGRESSION:** a fourth strict-cap MEC-boundary point
  does not force an alternative `IsM44` packet.
- **OPEN / CONJECTURED:** collision/core-driven exact-pair retriangulation and
  a terminal continuation for the strict-MEC-interior center arm.
- **NOT CLAIMED:** `OriginalUniqueFourResidual F → False`, closure of a
  production `sorry`, or a countermodel to the full live theorem.
