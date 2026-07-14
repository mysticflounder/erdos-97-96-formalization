# ATAIL Stage-I critical-map geometry assessment

Date: 2026-07-14

## Verdict

The cap-local critical-map refinement is written in
`stage1_critical_map_geometry_2026-07-14.lean`.  After its two mixed-count
proof-engineering goals were repaired, a fresh focused direct-file check
elaborated the complete module and exited 0.  Every printed endpoint has only
the standard core axiom closure.

The exact mixed capacity proved there is

```text
|sources in C|
  <= 2 * |blocker-image centers in C|
     + 4 * |blocker-image centers outside C|.
```

The coefficient two uses full ordered-cap geometry: exact support locking puts
one blocker fiber into one selected four-class, and
`selectedFourClass_inter_capByIndex_card_le_two` bounds its cap intersection.
The coefficient four is the unrestricted exact-support cardinality.

If at most one blocker-image center used by cap sources lies in `C`, the bound
reduces to

```text
|C| <= 2 + 4 * |A \ C|.
```

This is a genuine strengthening of the bare four-per-center fiber count.  It
does not force the missing Stage-I producer at card 12.

## Exact card-12 arithmetic

For the cap sizes in the current card-12 profiles, the one-inside-center
capacity is:

| `|C|` | `|A \ C|` | capacity `2 + 4|A \ C|` | slack |
|---:|---:|---:|---:|
| 4 | 8 | 34 | 30 |
| 5 | 7 | 30 | 25 |
| 6 | 6 | 26 | 20 |

Thus even the improved count is far from a same-cap-center pigeonhole.  This
is an arithmetic consequence of `|A| = 12` and `C ⊆ A`; it does not use a
finite search or a geometric relaxation.

## Lean validation status

The complete focused run established:

```text
centerFiberIn_capByIndex_card_le_two:
  [propext, Classical.choice, Quot.sound]
sourcesIn_capByIndex_card_le_two_mul_inside_add_four_mul_outside:
  [propext, Classical.choice, Quot.sound]
capByIndex_card_le_two_add_four_mul_complement_of_unique_inside_center:
  [propext, Classical.choice, Quot.sound]
one_inside_center_capacity:
  [propext, Quot.sound]
card_twelve_cap_four_to_six_not_mixed_capacity_threshold:
  [propext, Classical.choice, Quot.sound]
```

The first run's later `sorryAx` reports came only from the two then-unsolved
local goals in `sourcesIn_filter_center_eq_centerFiberIn` and
`sourcesIn_card_eq`.  Their replacements now elaborate.  No current source
declaration contains `sorry`, `admit`, a named axiom, or `native_decide`.

The current Lean source SHA-256 is:

```text
d2d7d1bc265ba9e524e3ac3222b99332fbf04f363a02d26eacf46ae56bdeb38c
```

The full repaired module, including the mixed-capacity and unique-inside
corollaries, is now **CHECKED-SCRATCH**.  Consolidated command and axiom record:
`stage1_scratch_validation_2026-07-14.md`.

## Strengthened finite-shadow check

The existing deterministic artifacts were replayed:

- `scratch/atail-force/global_count_boundary/manifest.json`;
- `scratch/atail-force/global_count_boundary/shadows.json`;
- `scratch/atail-force/global_count_boundary/checkpoint.json`; and
- `scratch/atail-force/global_count_boundary/validator.py`.

The replay status remains
`VALIDATED_STRENGTHENED_FINITE_SHADOW_ONLY`, with checkpoint match for both
saved cases.  The checkpoint pins canonical digests

```text
manifest  21a7345c9249fa98959494a64ef78c151c43e8a2f982d9b7d4a77122da6d55ed
shadows   6eed843ad497cc089c3403e5fe03ad153cb3a8f57c8ebd2c34d7f8064ee7e97c
```

Using zero-based cap indices, the relevant blocker-map statistics are:

- profile `(4,5,6)`, cap 0: an inside blocker fiber has size two, so the new
  local coefficient two is sharp in the encoded finite abstraction;
- profile `(5,5,5)`, cap 2: exactly one inside blocker-image center and two
  outside blocker-image centers serve its five cap sources;
- profile `(4,5,6)`, cap 1: exactly one inside and two outside blocker-image
  centers serve its five cap sources; and
- profile `(4,5,6)`, cap 2: exactly one inside and four outside blocker-image
  centers serve its six cap sources.

Both saved cases also retain maximum off-surplus joint selected-radius fiber
one.  They therefore realize the cap-local bound and one-inside-center regime
without producing the desired two-point joint apex fiber.

These are exact statements about the encoded finite models only.  The models
omit Euclidean coordinates, full convex/MEC realizability, and other live
K-A-PAIR fields.  They are not counterexamples to the full geometric theorem
and do not prove its consistency.

## Producer consequence

The theorem-bank preflight required by `AGENTS.md` and indexed Lean searches
found the same downstream consumers already recorded in the global-count and
bisector audits, but no producer from the cap-local fiber inequality.

Accordingly, this refinement does **not** force:

- reciprocal critical-source incidence for a separated outside pair;
- two dangerous-row points in a second same-cap exact shell;
- the two missing dangerous equalities at `rows.uRow.center`; or
- a banked equality, cyclic-order, or row-slot contradiction core.

It also gives no reason to raise or re-adjudicate the lane beyond
`CARD-GE-12`.  The obstruction is missing global metric/order coupling, not a
new carrier-cardinality threshold.  Any successful next producer must use a
field absent from this mixed count, such as pair-specific cross-row incidence,
dangerous-circle equality, or cyclic cap order.

## Epistemic status

- **CHECKED-SCRATCH:** the complete repaired cap-local module, including the
  filter/cardinality helpers, mixed capacity, one-inside-center corollary, and
  card-12 arithmetic endpoint, with the core-only closures printed above;
- **EMPIRICALLY VERIFIED, EXACT WITHIN THE ENCODED ABSTRACTION:** the saved
  finite-shadow statistics and checkpoint replay; and
- **NOT CLAIMED:** Euclidean realizability of the saved shadows or consistency
  of the full K-A-PAIR hypotheses.
