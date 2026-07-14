# ATAIL blocker-to-cap geometry audit

Date: 2026-07-14

Status: **PROVEN CAP-LOCATION SPLIT; EXACT THREE-CENTER FALSIFIER.**

## Verdict

The robust branch does not force the actual blocker into the surplus cap.
The strongest unconditional live localization is the checked split

```text
blocker = surplus Moser apex
or
blocker lies in the strict interior of one of the three caps.
```

The exact algebraic model in this directory realizes the second alternative
with the blocker in the first opposite cap.  More importantly, it retains all
three local centers present in the robust packet:

1. a card-five row at the first opposite apex;
2. both source-deletion survivors at the second opposite apex; and
3. the source-critical exact four-shell at the actual blocker, with the cross
   deletion surviving and the two blocker radii unequal.

It also retains strict convexity, the actual non-obtuse circumscribed MEC
triangle, the induced closed-cap partition, and the no-`M44` cap profile.
Thus no contradiction or surplus-cap localization can follow from this
three-center local geometry alone.

The first possible missing ingredient is a **fourth-center/global-incidence
input**: global K4 or critical-shell information at another source (most
naturally the other survivor's actual blocker), coupled to the displayed
three-center packet.  Reusing only the first apex, second apex, and `q`'s
blocker cannot close the robust arm.

## Required theorem-bank preflight

Before deriving the split or constructing the model, the following required
registries were inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for critical-shell blocker localization,
perpendicular-bisector cap placement, three-center equal-radius
contradictions, and surviving deletion rows.  The closest reusable results
were:

- `SurplusCapPacket.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem`;
- `selectedFourClass_inter_capByIndex_card_le_two`;
- `outsidePair_unique_capCenter`;
- `Dumitrescu.dist_lt_of_same_side_perpBisector`;
- `eq_of_equidistant_three_noncollinear`; and
- the production robust normal forms in `ATail.CriticalPairFrontier`.

The first theorem gives the checked cap split below.  The remaining hits are
upper bounds, uniqueness statements whose equal-distance antecedent is
explicitly false in the robust arm, or comparison kernels requiring a new
side/order producer.  No bank theorem places an arbitrary blocker in the
surplus cap or couples it to a fourth center.

## Kernel-checked cap split

`blocker_cap_location.lean` proves:

```lean
surplusApex_or_exists_capInterior_of_ne_oppositeApices
```

For any carrier point different from the two surplus-cap endpoints, it is
either the surplus apex or lies in a strict cap interior.  Its specialization

```lean
card_five_blocker_location
```

applies directly to a `SurvivorPairRelocationPacket` in the card-five branch.
Card five makes the chosen blocker differ from `oppApex1`; the packet already
records separation from `oppApex2`.

Both printed axiom sets are exactly:

```text
propext, Classical.choice, Quot.sound
```

This split is exhaustive, but it is not itself a contradiction.  The cap
interior index remains arbitrary.

## Exact algebraic countermodel

`exact_blocker_cap_countermodel.py` uses symbolic real-algebraic arithmetic,
not floating-point tolerances.  The carrier has 13 points in exact strict hull
order

```text
O, t1, I, F, t2, A, D, J, E, C, G, K, H.
```

The script checks every carrier point strictly against every oriented hull
edge, not only consecutive local turns.

The MEC triangle is

```text
(surplus apex, first apex, second apex) = (C, O, A).
```

It is equilateral, all three vertices lie on the displayed circumcircle, and
every other carrier point lies strictly inside its disk.  The exact oriented
arc tests produce the closed caps

```text
C1 = {O,t1,I,F,t2,A}      card 6  (surplus)
C2 = {A,D,J,E,C}          card 5
C3 = {C,G,K,H,O}          card 5.
```

Every non-Moser point belongs to exactly one cap and every Moser point to
exactly two.  Hence the profile is `(6,5,5)`, so it is explicitly not
`M44`.

Set

```text
q = E,
w = C,
blocker = D.
```

The exact positive squared-radius classes are:

```text
at O, radius^2 1:       {A,C,D,E,J}       (card five)
at A, radius^2 1:       {C,G,H,K,O}       (card five)
at D, radius^2 2/13:    {A,E,F,I}         (exact four-shell).
```

Consequently:

- `q,w` are distinct, off the surplus cap, and co-radial at the first apex;
- deleting either `q` or `w` leaves K4 at the second apex;
- deleting `q` kills every K4 radius at its blocker `D`;
- deleting `w` preserves the exact chosen four-shell at `D`;
- `dist D w != dist D q`;
- `D` is a non-Moser point in `C2`, outside the surplus cap.

This is exactly the local content needed to realize the robust branch while
falsifying the proposed surplus-cap localization.

## Dependency boundary

The model is **not** a counterexample to K-A-PAIR.  It deliberately does not
construct:

- global `HasNEquidistantProperty 4` at all 13 carrier centers;
- a `CriticalShellSystem` assigning a deletion blocker to every source; or
- the remaining parent-level no-removable consequences tied to those other
  centers.

It does check K4 at each of the three centers used by the robust local packet
and the exact deletion behavior at the actual `q` blocker.  Therefore a valid
next producer cannot be a new three-center metric identity or a claim that
MEC/cap/no-`M44` geometry localizes that blocker.  It must introduce at least
one other source/center, or use a genuinely global incidence count that has
the same effect.

The best next target is a **two-blocker/four-center coupling**:

```text
q's robust blocker packet
+ w's actual critical blocker packet
+ their cap-interior indices
  => existing mutual-incidence/cap-local consumer
     or a new four-center contradiction.
```

The countermodel shows why producing only `D in surplusCap` is the wrong
intermediate theorem.

## Validation and rigor

Validated commands:

```text
lake env lean ../scratch/atail-force/blocker-cap-geometry/blocker_cap_location.lean

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/blocker-cap-geometry/exact_blocker_cap_countermodel.py \
  --check
```

- **PROVEN / kernel-checked:** the exhaustive blocker cap-location split and
  its card-five survivor specialization.
- **EXACTLY VERIFIED:** the 13-point real-algebraic MEC/cap/three-center
  countermodel.
- **PROVEN dependency boundary within the stated local abstraction:** the
  three-center robust packet does not force surplus-cap blocker localization.
- **NOT CLAIMED:** a counterexample to global K4, the full
  `CriticalShellSystem`, or K-A-PAIR.
