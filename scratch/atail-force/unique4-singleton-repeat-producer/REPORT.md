# Exact-four singleton actual-row repeat audit

Date: 2026-07-22

Scope: the singleton arm of
`exists_strictCap_collision_or_singletonCore_or_packedCore`, after construction
of

```lean
P : SingletonCoreOutsidePairIngress R Q
```

for the exact `2+1+1` distribution `Q`. This lane changes no production Lean
and does not close the original unique-four arm.

## Result

The requested producer

```lean
P → HasSameCapActualRowRepeat P
```

is **not supported by the current complete-radius/incidence abstraction**.
Both oriented card-11 cap profiles have exact SAT projections satisfying the
singleton ingress while omitting the same-cap distinct-center row repeat.

This is not a counterexample to the Lean theorem or to Problem 97. The models
do not contain Euclidean coordinates, complete MEC geometry, or the
alternative-support-triangle content of `R.noM44`. They prove a narrower and
load-bearing negative result: no proof of the repeat can use only the finite
constraints listed below. A successful proof must use geometry absent from
that abstraction.

The source-clean replacement is the exact actual-row normal form

```lean
outsideSourceRows_normalForm P
```

It proves that the two outside-source rows satisfy one of:

1. the first outside source's actual blocker is `P.center`;
2. the second outside source's actual blocker is `P.center`;
3. the sources share a blocker outside `P`'s physical cap, and its complete
   row contains both outside points; or
4. their blockers and `P.center` are three distinct centers, with each
   outside source occurring in its own actual row.

This is the weakest unconditional multicenter occurrence obtained from the
full installed critical system. The contradictory same-cap repeat is not one
of its forced branches.

## Kernel-checked source theorem

`UniqueFourSingletonRepeatProducer.lean` proves:

```lean
outsideSourceRows_distinct_or_common_at_center_or_outside_cap
outsidePair_mem_actualRow_of_center_eq_singleton
outsideSourceRows_normalForm
```

The proof uses the mandatory source incidence of both actual critical rows.
If their blocker centers agree, then

```lean
ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
```

identifies their complete supports, so one actual row contains the full
outside pair. The existing checked terminal

```lean
false_of_hasSameCapActualRowRepeat
```

then excludes exactly the subcase in which that common blocker is distinct
from `P.center` but lies in the same physical cap. No favorable selected row
is assumed.  The center-return adapter separately proves that an outside
source whose actual blocker is `P.center` has the singleton row's exact
support and therefore contains both outside points; it deliberately does not
claim that this repeated row has a distinct center.

Both new declarations elaborate with warnings as errors and depend only on:

```text
propext
Classical.choice
Quot.sound
```

They contain no `sorry`, `admit`, custom axiom, `unsafe`, or
`native_decide`.

## Terminal adjacency audit

No arm of `outsideSourceRows_normalForm` is terminal with its displayed
fields alone.  The nearest checked consumers, and the exact fields still
missing at each arm, are as follows.

| normal-form arm | nearest checked consumer | exact missing input |
| --- | --- | --- |
| `center₁ = P.center` or `center₂ = P.center` | `ATailSurvivalCover.actualBlockerFiber_card_le_four`, followed in the favorable case by `false_of_hasSameCapActualRowRepeat` | `outsidePair_mem_actualRow_of_center_eq_singleton` supplies the full pair in the returned source row, but at the already-known center.  The equality gives only one additional outside source in the singleton-center blocker fiber.  A fiber contradiction needs five distinct sources with that blocker.  The same-cap terminal instead needs a second blocker center in `S.capByIndex P.capIndex`, distinct from `P.center`, whose row contains both outside points. |
| `center₁ = center₂`, with the common center outside `P`'s cap and its row containing both outside points | `CapSelectedRowCounting.outsidePair_unique_capCenter`; alternatively the perpendicular-bisector three-center terminal `ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair` after a suitable adapter | `outsidePair_unique_capCenter` requires both pair-centers to lie in one ordered cap while both pair points lie outside that cap.  Here `P.center` lies in `S.capByIndex P.capIndex`, but the common blocker is proved outside it.  One must produce another indexed cap containing both centers with both outside points outside, or produce a third distinct actual center whose row contains the pair. |
| `P.center`, `center₁`, and `center₂` pairwise distinct, with one source incidence in each outside-source row | `UniqueFourKalmansonCoresScratch.false_of_one_k1_three_cyclic_selected_rows` (or its other three-row Kalmanson variants); the nearest nonlinear bank is `ATailTetrahedronBankAdapterScratch.false_of_three_selected_classes_tetrahedron`; the aggregate curvature sinks are `false_of_fourTurnDisjointSelectedRowArcs` and `false_of_fourTurnCoveringSelectedRowArcs` | The normal form supplies the base row through both outside points, `center₁`'s row through `outside₁`, and `center₂`'s row through `outside₂`: four positive memberships in total.  The smallest Kalmanson three-row consumer needs six memberships forming a cyclic equality pattern plus the required cyclic boundary order.  The tetrahedron consumer needs eight displayed memberships.  The curvature sinks need four ordered outer arcs and their disjoint-gap or period-cover relations.  None of those cross-memberships, placements, or a fourth arc is present. |

In particular, the shared-blocker-outside-cap arm is **not** already closed
by `outsidePair_unique_capCenter`.  The theorem's decisive hypothesis is the
same-cap placement of its two centers, and this arm supplies the opposite
placement relative to the only named cap.  Conversely, the three-distinct-
center arm does not yet instantiate a checked curvature or Kalmanson
consumer: it is an occurrence prefix, not the required incidence cycle or
four-arc packet.

This audit fixes the next theorem target more narrowly than “use the normal
form”: a useful producer must add one of

- four further singleton-center fiber sources;
- a common ordered-cap placement (or a third pair-center) on the shared-
  blocker arm;
- two cross-row memberships and their cyclic order on the three-center arm;
  or
- a fourth source-faithful outer arc together with the aggregate curvature
  ordering relations.

## Exact finite audit

`audit_singleton_repeat_projection.py` extends the current n=11 exact-four
outer with:

- the exact-two strict-hit distribution `Q`;
- a total fixed-point-free critical blocker map;
- exact complete critical supports containing their sources;
- equality of complete supports at equal blocker centers;
- complete ambient radius partitions at every carrier center;
- global K4 through one selected four-row at every center;
- exact uniqueness of the first-apex K4 class;
- the retained frontier pair and second-apex double-deletion row;
- the strict-pair bisector localization;
- full two-circle intersection, two-center-per-pair, and cyclic-alternation
  constraints;
- all currently installed planar, Kalmanson, and signed-U5 schema cuts;
- an exact singleton global-deletion witness inside the protected set; and
- the missing source-valid own-cap bound: every complete radius class at a
  center belonging to an indexed cap meets that cap in at most two points.

The CaDiCaL assignments were checked against all emitted CNF clauses before
decoding. Independent semantic replay also checked the two added singleton
facts and recomputed the installed-system override and repeat query.

Both profiles are SAT:

| first opposite cap | variables | clauses | solver time | no-repeat pair |
| ---: | ---: | ---: | ---: | --- |
| 4 | 10,208 | 2,603,983 | 104 s | `(3,5)` |
| 5 | 10,208 | 2,604,007 | 404 s | `(4,5)` |

The profile-4 witness is the sharper regression because neither outside
point is the singleton deleted source:

```text
singleton center = 8
singleton source = 9
center cap       = {0,7,8,9,10}
singleton shell  = {0,3,5,9}
outside pair     = {3,5}
blocker(3)       = 8
blocker(5)       = 0
```

Thus the installed singleton row at center `8` contains `{3,5}`, but no
actual critical row with a distinct center in the same cap contains both.
The two outside-source blockers are distinct, so this witness lands in the
first, singleton-center fiber-return branch of the normal form: source `3`
returns to center `8`, while source `5` uses center `0`.

The independent universal-minimality replay checks all 2,046 nonempty proper
subsets in each model. Both models have:

```text
no K4-closed nonempty proper subset
one exact four-point K4 class at every center
that exact class equal to the selected row
```

Therefore replacing one chosen strongly-connected row graph by the full
radius-class form of global minimality does not force the repeat either.

Artifacts:

```text
opp1_4.checkpoint.json
opp1_4.universal_minimality.json
opp1_5.checkpoint.json
opp1_5.universal_minimality.json
```

The large DIMACS files and solver logs are reproducible and ignored rather
than banked.

## Precise remaining geometric input

The repeat route can proceed only by eliminating all four branches of
`outsideSourceRows_normalForm`. The finite audit shows that complete radius
partitions, actual critical-map provenance, protected singleton deletion,
own-cap counting, and universal minimality do not do so.

The next producer must therefore use at least one of:

- nonlinear Euclidean distance relations beyond equality partitions and
  linear cyclic alternation;
- MEC boundary/interior placement of the singleton center or shell points;
- a contract-complete alternative support triangle contradicting `R.noM44`;
  or
- a new cap-order consumer for the three-center one-sided-incidence branch.

The immediate source-level target should be a direct terminal split over the
four normal-form cases, not another attempt to derive the bare same-cap
repeat. In particular, the first and second branches require a theorem using
the enlarged singleton-center blocker fiber; the third requires a
cross-cap two-center consumer; and the fourth requires additional incidence
or Euclidean geometry before any current three-center bank theorem applies.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-singleton-repeat-producer/\
audit_singleton_repeat_projection.py --check \
  scratch/atail-force/unique4-singleton-repeat-producer/\
opp1_4.checkpoint.json

UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-curvature-occurrence-census/\
audit_universal_minimality.py --source \
  scratch/atail-force/unique4-singleton-repeat-producer/\
opp1_4.checkpoint.json --output \
  scratch/atail-force/unique4-singleton-repeat-producer/\
opp1_4.universal_minimality.json --check
```

Repeat both commands with `opp1_5` for the second profile.

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** the actual-row normal form above.
- **EXACT WITHIN THE FINITE ABSTRACTION:** both n=11 profiles admit a
  singleton ingress without a same-cap distinct actual-row repeat, including
  the full radius-class universal-minimality replay.
- **NOT PROVEN:** that `HasSameCapActualRowRepeat P` is false under all full
  Lean source hypotheses independently of the existing terminal; that would
  amount to closing this branch.
- **OPEN:** a Euclidean/MEC/noM44 terminal split consuming the normal form.
