# Period-three one-target-per-row geometry audit

Date: 2026-07-18

Status: **EXACT RATIONAL COUNTERMODEL, KERNEL-CHECKED IN LEAN.  THE LOCAL
ONE-TARGET-PER-BLOCKER-ROW SURFACE IS REALIZABLE AND CANNOT SUPPORT A DIRECT
`False` THEOREM.  NO PRODUCTION `sorry` IS CLOSED.**

## Exact question decided

This lane retains the exact period-three physical source/blocker order

```text
left < q0 < c0 < c2 < q1 < c1 < q2 < right
```

with `left,q0,q1,q2,right` co-radial from a physical apex `o`, and

```text
dist c0 q0 = dist c0 q1,
dist c1 q1 = dist c1 q2,
dist c2 q2 = dist c2 q0.
```

It asks whether one point on the complementary side of the physical cap can
lie on each blocker circle simultaneously, while all named points remain in
strict convex position inside the non-obtuse Moser circumdisk.

The answer is yes.  There are distinct targets `x0,x1,x2` with

```text
dist c0 x0 = dist c0 q0,
dist c1 x1 = dist c1 q1,
dist c2 x2 = dist c2 q2.
```

The exact counter-clockwise boundary order is

```text
o, x2, x0, left, q0, c0, c2, q1, c1, q2, right, x1.
```

Thus the earlier broad numerical `UNKNOWN_NO_HIT` was a search miss, not an
infeasibility signal.

## Theorem-bank preflight

Before deriving or formalizing a local contradiction, the required registries
were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed-Lean searches covered a period-three blocker cycle with one
outside-cap target per row, strict convexity, MEC containment, and cyclic
equal-radius rows.  The nearest results are general equal-distance and
Kalmanson kernels; no banked declaration decides this simultaneous local
realizability surface.

## Exact rational model

For rational `t`, put

```text
U(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2))
```

and let `Rot(t)` be the corresponding rational rotation.  Set

```text
o     = (0,0)
left  = U(0)
right = U(15091/15143)
q0    = U(943/92200)
q1    = U(9643/22662)
q2    = U(194/199)

c0 = (12637/25058) * (q0+q1)
c1 = (45957/91523) * (q1+q2)
c2 = (66359/95986) * (q2+q0)

x0 = c0 + Rot(-12309/65752) * (q0-c0)
x1 = c1 + Rot(-174207/42424) * (q1-c1)
x2 = c2 + Rot(71631/59831) * (q2-c2).
```

`verify_exact_countermodel.py` replays the model using
`fractions.Fraction` only.  It checks every non-edge/edge strict hull
inequality, all pairwise distinctions, the exact named physical and blocker
radius classes, the cap-side split, circumdisk containment, and all three
non-obtuse squared-side inequalities.

Recorded output:

```text
PASS: exact rational period-three core with one target per blocker row
boundary=o,x2,x0,left,q0,c0,c2,q1,c1,q2,right,x1
physical_class={left,q0,q1,q2,right}
row0_class={q0,q1,x0}
row1_class={q1,q2,x1}
row2_class={q2,q0,x2}
min_strict_hull_margin=2222306838718754944693334260017260841348116014/1920056355207781326996786394352058143492975478055
min_pairwise_dist_sq=3556996/8501729249
min_outside_cap_margin=51669674364622940796182729227427191658/353314168544761923438270254316095983475
min_physical_cap_margin=955970726119286/47386640927552485
min_mec_disk_margin_nontriangle=2597230121986/128741686017607
min_row_class_exclusion=964590469267177641748/64608986813751476892653
```

## Lean kernel regression

`PeriodThreeOneTargetCountermodel.lean` kernel-checks the same exact rational
configuration.  Its named theorems prove:

1. all strict boundary-edge half-plane inequalities;
2. a unique supporting linear functional at every vertex and therefore
   `ConvexIndep carrier`;
3. the exact card-five physical radius class on the named carrier;
4. all three one-target blocker rows;
5. the exact three-point radius class of each blocker on the named carrier;
6. the strict cap-side split;
7. containment of all twelve points in the exact circumdisk; and
8. non-obtuseness of the support triangle by squared-side inequalities.

Every printed theorem has axiom closure exactly

```text
propext, Classical.choice, Quot.sound
```

with no `sorryAx`.

Validation:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --no-project \
  scratch/atail-force/period3-one-target-per-row-geometry/verify_exact_countermodel.py

cd lean
lake env lean \
  ../scratch/atail-force/period3-one-target-per-row-geometry/PeriodThreeOneTargetCountermodel.lean
```

## Discovery and logging

`search_fixed_core.py` fixes a positive simultaneous triangle-edge-reach core
and varies only one exact-circle angle per blocker.  Unlike the historical
checkpoint, it prints the complete core, target angles, cyclic order, point
coordinates, and every margin-group minimum.  Seed `20260718` finds a positive
candidate in the `LRL` edge-escape cell; the exact reconstruction above, not
the floating-point candidate, is the verdict-bearing artifact.

## Route consequence

The following implication is false:

```text
period-three physical source/blocker geometry
+ one outside-cap equal-radius target for every blocker row
+ strict convexity and non-obtuse MEC containment
-> False.
```

Therefore the local proof route must retain at least one field absent here:

- the second outside target completing each exact `2+2` row;
- the common total `CriticalShellSystem` and cross-row source provenance;
- deletion criticality/global K4/minimality; or
- another full-parent coupling.

This countermodel does **not** decide simultaneous completion of all three
`2+2` rows and does not instantiate `CounterexampleData`.  It closes no
production `sorry`; it removes an overstrong local producer target from the
search space.

No production Lean, shared plan document, blueprint state, `ShellCurvature`,
`surplusM44`, card-five, or protected 555/654 file was modified.
