# Corrected unique-four curvature census and direct-overlay audit

Date: 2026-07-22

Scope: the completed prefixes of the corrected runs

```text
exact_two_opp1_4_complete_radius_v2_a61b34a6
exact_two_opp1_5_complete_radius_v2_a61b34a6
```

and the preserved, superseded direct-curvature SAT results

```text
scratch/atail-force/unique4-star-producer/uncorrected_direct_p4.json
scratch/atail-force/unique4-star-producer/uncorrected_direct_p5.json
```

This lane reads those artifacts but never mutates them.  The stored
[`census.json`](census.json) is a hash-bound snapshot of every published round
visible when it was generated.  The compact
[`direct_overlay_audit.json`](direct_overlay_audit.json) binds the later SAT
assignments by hash and checks their decoded rows against already-proved
source cap-order bounds.

## Result

The support-or-blocker local star is a **transient 25-round prefix pattern**,
not the next producer.  The two assignments audited in this directory are now
retained only as negative regression fixtures: they omit source-proved cap-row
bounds and are not the current corrected survivors.

The later direct overlay statically forbids every four-disjoint-outer-arc
terminal and returned exact replayed SAT assignments for both displayed
profiles:

```text
profile 4: VERIFIED_SAT_NO_FOUR_ARC_TERMINAL
profile 5: VERIFIED_SAT_NO_FOUR_ARC_TERMINAL
```

Therefore the 25-round occurrence cannot be extrapolated even to the stronger
finite projection already encoded by that lane.  The conjectural producer
from `OriginalUniqueFourResidual` to
`SupportOrBlockerStarMiddleArcPlacement` is withdrawn.

This does **not** make either direct-overlay assignment a source-valid
residual.  Both violate the already-proved cap-endpoint one-hit bound for
selected rows.  The profile-four assignment also violates the general
own-cap two-hit bound.  The exact first missing source fields in the direct
encoding are thus:

1. for every selected row whose center belongs to an indexed closed cap,
   at most two support points lie in that cap; and
2. when that center is either support endpoint of the cap, at most one support
   point lies in that cap.

These are not conjectures.  They are finite translations of the existing
Lean theorems

```lean
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
SurplusCapPacket.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
SurplusCapPacket.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
```

That refinement has now been decided in
`scratch/atail-force/unique4-star-producer/`: after adding both constraint
families, profiles four and five are still SAT and still avoid every checked
four-arc terminal.  Both corrected assignments are, however, UNSAT under the
full linear Kalmanson system.  Thus the first omitted layer is an incomplete
kernel-checked Kalmanson schema bank, not yet nonlinear Euclidean or MEC
geometry.  No new local-star producer should be formalized from either the
historical or corrected fixed-cardinality assignments.

In the current encoder notation `m_center_point`, the exact CNF translation is
small and requires no auxiliary variables:

```text
for each closed cap C and center c in C:
  for each distinct p,q,r in C:
    not m_c_p or not m_c_q or not m_c_r

for each endpoint e of C:
  for each distinct p,q in C:
    not m_e_p or not m_e_q
```

The endpoint sets are fixed by the displayed cap packet:

```text
surplus cap:        {first_apex, second_apex}
first-opposite cap: {second_apex, surplus_vertex}
second-opposite cap:{surplus_vertex, first_apex}
```

`row_nonself` is already encoded, so including the endpoint itself among the
enumerated cap points is harmless.  The replay metadata should name the three
Lean source theorems above and count the new clause blocks separately.

## Historical 25-round pattern

The pattern common to every completed round in the stored prefix was:

1. choose a carrier center `c` outside the image of the fixed critical system;
2. let `Kc` be its selected global-K4 row;
3. use the left and right outer arcs of `Kc` as the first and fourth arcs;
4. choose each intervening row center from

   ```text
   Kc.support union { H(s) | s in Kc.support };
   ```

5. the four resulting outer arcs form a checked strict open window.

The two intervening centers may coincide.  This is essential: profile-five
round one has a two-center witness in which the same blocker row supplies both
middle arcs.

The corresponding exact consumer boundary is kernel-checked in
[`UniqueFourCorrectedCurvatureSchema.lean`](UniqueFourCorrectedCurvatureSchema.lean):

```lean
SupportOrBlockerStarMiddleArcPlacement D H

false_of_supportOrBlockerStarMiddleArcPlacement
    (W : SupportOrBlockerStarMiddleArcPlacement D H) : False
```

`IsSupportOrBlockerCenter` retains an actual carrier source in the completion
row and proves that the selected middle center is either that source or its
actual blocker under `H`.  The packet also retains that `c` is outside the
whole blocker image.  Its consumer forgets only this provenance, maps to the
existing `FourTurnDisjointSelectedRowArcs`, and invokes the checked
shell-curvature contradiction.

The same file now exposes direct selected-row endpoint adapters:

```lean
selectedFourClass_inter_capByIndex_at_v2_card_le_one
selectedFourClass_inter_capByIndex_at_v3_card_le_one
```

The consumer and both adapters are warning-clean and have axiom closure
exactly:

```text
propext, Classical.choice, Quot.sound
```

This consumer remains kernel-checked and reusable, but no producer from
`OriginalUniqueFourResidual` is claimed or currently targeted.

## Exact direct-overlay violations

The profile-four decoded assignment has three independent cap-row failures:

```text
center 2, surplus cap:          row hits {0,3,4}       (3 > 2)
center 9, second-opposite cap:  row hits {0,7,10}      (3 > 2)
center 4, surplus endpoint:     row hits {2,3}         (2 > 1)
```

The profile-five assignment passes the generic own-cap bound but fails the
sharper endpoint theorem twice:

```text
center 4, surplus endpoint:        row hits {0,3}      (2 > 1)
center 8, first-opposite endpoint: row hits {4,7}      (2 > 1)
```

Thus the endpoint constraint is independently load-bearing; adding only the
generic `≤ 2` cap bound would leave the recorded profile-five assignment.

Both assignments choose a singleton strict-cap minimal-deletion witness.  In
the profile-five assignment the fresh row at center `9` is
`{3,5,8,10}`, the relevant cap is `{0,8,9,10}`, and the extracted outside
pair is `{3,5}`.  The installed decoded critical system has no distinct
same-cap actual center whose actual row contains both outside points.  This
matches the downstream singleton boundary `HasSameCapActualRowRepeat`, but it
is not a counterexample to that source producer because the same assignment
already violates the endpoint theorem.  If a refined survivor passes all cap
bounds, the next source-level audit should replay the checked
collision/singleton/packed-core classification and test either
`HasSameCapActualRowRepeat` or a complete alternative-M44 packet.

## Stored snapshot

The current `census.json` records 25 completed rounds:

| exact-two profile | completed rounds | terminal status at snapshot |
|---:|---:|---|
| 4 | 17 | still active |
| 5 | 8 | still active |

Across those rounds there are 814 inclusion-minimal checked terminal center
sets.

### Number of centers

| distinct centers | terminal sets |
|---:|---:|
| 2 | 38 |
| 3 | 610 |
| 4 | 166 |

### Checked terminal

| terminal kind | terminal sets |
|---|---:|
| `STRICT_OPEN_WINDOW` | 767 |
| `FULL_COVER` | 47 |

### Centers in the fixed blocker image

| blocker-image centers in the terminal | terminal sets |
|---:|---:|
| 0 | 139 |
| 1 | 354 |
| 2 | 241 |
| 3 | 74 |
| 4 | 6 |

### Sources in the fixed first-apex fiber

In every record, the fixed first-apex blocker fiber is exactly the displayed
first-apex exact class.  The terminal counts are:

| fiber sources used as terminal centers | terminal sets |
|---:|---:|
| 0 | 145 |
| 1 | 399 |
| 2 | 240 |
| 3 | 30 |

No one blocker-image count, fiber count, distinguished retained-pair role, or
combined role schema occurs in every round.

### Physical cap locations

The census uses the three triangle vertices as separate regions and the three
strict cap interiors as a disjoint partition of all remaining carrier points.
Counting center occurrences, with multiplicity across terminal sets, gives:

| physical region | center occurrences |
|---|---:|
| first apex | 122 |
| second apex | 233 |
| surplus vertex | 286 |
| strict surplus cap | 740 |
| strict first-opposite cap | 547 |
| strict second-opposite cap | 642 |

No exact physical-region multiset is common to every completed round.

### Complete-radius mutual triangles

The replay enumerates every ordered two-step mutual triangle whose last center
lies in the blocker image and asserts the checked reverse membership forced by
`mem_blockerImageSelectedRow_of_twoStep_mutualTriangle`.

- 813 of the 814 inclusion-minimal curvature terminals contain no such triangle
  entirely among their terminal centers.
- One profile-four round-two terminal on centers `{7,8,9}` contains the six
  orientations of one fully mutual three-center triangle.
- Several whole SAT records contain no such triangle at all.

Thus complete-radius triangles remain a sound refinement, but they are not a
common occurrence schema and cannot replace the curvature producer.

## What was common in the stored prefix

At the unqualified terminal level, all completed rounds contain:

- a strict-open-window terminal;
- a terminal using exactly three centers; and
- a three-row side multiplicity `left`, `left+right`, `right`.

There is no common combined schema after adding blocker-image status, fixed
first-apex fiber/source roles, cap regions, induced selected-row memberships,
or the blocker map restricted to those three centers.  In particular, the old
claim that the two singleton rows can always be the two preselected fixed-image
rows is not supported by the corrected stream.

For every one of the 25 completed rounds, at least one checked terminal had:

```text
completion center c outside image(H),
c supplies both outer arcs,
each other center is s or H(s) for some s in completionRow.support.
```

This fact is **EXACT FINITE REPLAY** for the stored `n = 11` prefixes.  The
direct-overlay SAT assignments show that it is not stable under the stronger
finite search and must not be used as occurrence evidence beyond those 25
rounds.

The local-star ablation split is:

| allowed middle centers | covered rounds |
|---|---:|
| support sources only | 22 / 25 |
| actual blockers of support sources only | 21 / 25 |
| blockers plus first apex | 21 / 25 |
| support sources or their actual blockers | 25 / 25 |

## Blocker-only local star is false

The narrower candidate requested for audit was:

```text
{c} union { H(s) | s in completionRow.support },
optionally union {first apex}.
```

It already fails at profile-four round seven.  That record has blocker image
`{0,8,9,10}`.  For every omitted center `c`, no checked terminal using both
outer arcs of the row at `c` is contained in the blocker-only star, even after
adding the first apex.

The smallest near miss is exact:

```text
c = 4
completion row support = {2,3,6,7}
support blockers = {0,8}
blocker-only allowed centers = {0,4,8}
nearest checked terminal centers = {0,3,4}
```

The missing center `3` is itself a support source of the completion row, while
its actual blocker is `8`.  Allowing support sources as well as their blockers
repairs this round and every completed round in the stored prefix.  The stored
snapshot has three further blocker-only failures: profile-four round twelve
and profile-five rounds six and eight.  The first counterexample is bound in
`census.json` to result hash
`9954cecc7d2538817d7a7111f00456ff6f119213bb68e6f92945ed6363cabe65`.

## Source-only local star is also false

The complementary ablation

```text
{c} union completionRow.support
```

first fails at profile-four round six.  One smallest repair is:

```text
c = 2
completion row support = {0,3,7,10}
source-only allowed centers = {0,2,3,7,10}
actual blocker H(7) = 9
repaired checked terminal centers = {2,9,10}
```

The same record also has repairs with completion center `3` or `4`, support
source `9`, and actual blocker `H(9)=10`.  Thus fixed-system blocker provenance
is genuinely load-bearing in the finite schema: support sources alone do not
cover the stream.  Dually, the blocker-only failure above shows that replacing
every source by its blocker is also too strong.  The source-or-blocker union is
the smallest tested local star that covers the full stored prefix.

## Current next theorem-bank step

There is no justified local-star occurrence theorem to prove next.  The
historical assignments identified the two source fields below, and the
corrected direct overlay now enforces both:

```text
selected row centered in cap      -> own-cap support count <= 2
selected row centered at endpoint -> incident-cap support count <= 1
```

The corrected assignments pass those cap bounds but fail full linear
Kalmanson feasibility.  The next checkpoint is therefore to normalize their
small row-instance-preserving equality/Kalmanson cores, kernel-check the
corresponding general consumers, add the schemas to the checked finite bank,
and rerun the corrected overlay.  Only a survivor of that augmented full-linear
gate would justify escalation to nonlinear Euclidean/MEC or `noM44` geometry.

For a cap-bound-clean singleton survivor, the known terminal-grade boundary is
`HasSameCapActualRowRepeat` from the full
`SingletonCoreOutsidePairIngress`, or a complete alternative-M44 packet.  That
is a later branch-specific target, not a reason to revive the local-star
conjecture.

## Theorem-bank preflight

Before stating the new boundary, the required general-n, sibling `p97-rvol`,
legacy `erdos/97`, and older `erdos-general-theorem/97` registries were checked.
Focused indexed Lean searches covered selected-row curvature, blocker-image
support locking, mutual complete shells, and three-row Kalmanson terminals.
They recovered the existing aggregate curvature consumers,
`false_of_selected_rows_in_five_ccw_order`, and the complete-radius support
lock, but no theorem producing this support-or-blocker local-star occurrence.
No bank theorem was rederived.

## Replay and validation

Regenerate the read-only snapshot:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-corrected-curvature-schema/census_checked_terminals.py \
  scratch/atail-force/unique4-curvature-occurrence-census/exact_two_opp1_4_complete_radius_v2_a61b34a6 \
  scratch/atail-force/unique4-curvature-occurrence-census/exact_two_opp1_5_complete_radius_v2_a61b34a6 \
  --output scratch/atail-force/unique4-corrected-curvature-schema/census.json
```

Check a stable snapshot with the same command plus `--check`.  While the input
runs are active, a new published round is expected to make `--check` fail until
the snapshot is deliberately regenerated.

The schema comparison is:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-corrected-curvature-schema/analyze_common_schema.py \
  scratch/atail-force/unique4-curvature-occurrence-census/exact_two_opp1_4_complete_radius_v2_a61b34a6 \
  scratch/atail-force/unique4-curvature-occurrence-census/exact_two_opp1_5_complete_radius_v2_a61b34a6
```

Replay the historical direct-overlay source-gap audit from its preserved
fixtures:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-corrected-curvature-schema/audit_direct_overlay.py \
  scratch/atail-force/unique4-star-producer/uncorrected_direct_p4.json \
  scratch/atail-force/unique4-star-producer/uncorrected_direct_p5.json \
  --output scratch/atail-force/unique4-corrected-curvature-schema/direct_overlay_audit.json \
  --check
```

The Lean file was checked warning-as-error against the already validated
scratch dependency oleans.  Its four printed declarations contain no
`sorryAx`.

## Epistemic boundary

- **PROVEN / KERNEL-CHECKED:** the local-star packet maps to the existing
  strict-window terminal and proves `False`.
- **PROVEN / KERNEL-CHECKED:** the direct selected-row forms of both indexed
  cap endpoint one-hit bounds.
- **EXACT FINITE REPLAY:** all classifications and the 25-round support-or-
  blocker local-star coverage in `census.json`.
- **EXACT FINITE REPLAY:** the two direct-overlay assignments contain no
  four-disjoint-arc terminal.
- **PROVEN SOURCE REJECTION OF THE RECORDED ASSIGNMENTS:** their decoded rows
  violate existing cap endpoint one-hit theorems; profile four also violates
  the general own-cap two-hit theorem.
- **EXACT FINITE REPLAY IN THE SUCCESSOR LANE:** both cap-corrected assignments
  are SAT for the checked four-arc gate but UNSAT for the full linear
  Kalmanson system.  This is theorem-discovery evidence until the extracted
  schemas are kernel-checked and their occurrence is proved.
- **EXACT FINITE COUNTEREXAMPLE:** profile-four round seven refutes the
  blocker-only local star, even with the first apex added.
- **WITHDRAWN:** the source producer from arbitrary
  `OriginalUniqueFourResidual` and exact-two distribution to the
  support-or-blocker local star.  The direct overlay rejects that occurrence
  at the finite-projection level.
- **NOT CLAIMED:** closure of the unique-four branch, closure of a production
  `sorry`, Euclidean realizability/nonrealizability of a SAT projection, or
  arbitrary-cardinality coverage from the `n = 11` census.
