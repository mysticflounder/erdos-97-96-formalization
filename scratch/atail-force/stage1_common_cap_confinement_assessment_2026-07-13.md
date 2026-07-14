# ATAIL Stage-I common-cap confinement assessment

Date: 2026-07-13

## Verdict

The second proposed Stage-I sublemma is **not currently derivable** from the
common-cap premise by any banked cap-count, incidence, or legacy same-cap
theorem.

The useful positive reduction is now kernel-checked in
`stage1_common_cap_confinement_boundary.lean`:

```text
common cap for p and uRow.center
  -> off-dangerous confinement
     or a p-separated outside u-row pair.
```

More explicitly, failure of confinement gives points `z,w` such that

```text
p, uRow.center are in cap[k];
z,w are distinct uRow support points outside cap[k];
z is outside {q,t1,t2,t3};
dist uRow.center z = dist uRow.center w;
dist p z != dist p w.
```

The last inequality is not an added hypothesis. If it were an equality, the
already-proved `CapSelectedRowCounting.outsidePair_unique_capCenter` theorem
would immediately contradict convexity and the strict ordered-cap geometry.
Thus that existing consumer is fully exhausted on this branch: every genuine
escape which survives it is necessarily `p`-separated.

The live exact-dangerous packet also proves

```text
dist p z != dist p q
```

for the escaped point `z`. This is checked by
`offDangerousEscape_to_metricEscape`; it uses the exact q-deleted dangerous
radius class in `H` rather than treating off-dangerous label membership as a
metric fact.

No current theorem sends the remaining `p`-separated packet to an existing
MEC/order obstruction. That classification is the first unavailable
antecedent. Therefore the honest next theorem has one of the following
shapes:

```lean
URowOffDangerousSeparatedPairFields S p q t1 t2 t3 u rows ->
  KnownConsumedAlternate
```

or, after composing the known consumer,

```lean
URowOffDangerousSeparatedPairFields S p q t1 t2 t3 u rows -> False
```

The checked theorem
`confinement_of_pSeparatedPair_classifier_and_consumer` performs the rest of
the wiring. A new cap-cardinality inequality is not a substitute for this
metric/order classifier.

## Required theorem-bank preflight

Before deriving the boundary, the following registries required by
`AGENTS.md` were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling-bank and cyclic-separation sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for:

- critical-shell support confinement in a cap;
- common-cap blocker centers and outside row points;
- no-`M44` support localization;
- same-cap outside-pair uniqueness;
- source pushout / wrong-side contradictions; and
- an outside pair equidistant from one cap center but separated by another.

The relevant hits were:

- `selectedFourClass_inter_capByIndex_card_le_two`;
- `outsidePair_unique_capCenter`;
- `selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`;
- `source_pushout_left` / `source_pushout_right`;
- `samecap_wrongSide_left_contradiction` /
  `samecap_wrongSide_right_contradiction`; and
- `MECStraddlingRowCore.metric_orientation_incompatibility`.

None proves the desired confinement or consumes the surviving `p`-separated
packet:

- the intersection theorem is only an upper bound after center membership is
  supplied;
- the adjacent-cap theorem applies to a class centered at the opposite Moser
  apex with endpoint-radius hypotheses absent here;
- the source-pushout/wrong-side family assumes a preconstructed
  `SameCapIncompatibleEdge` whose equality pair lies inside the ordered cap;
  and
- `MECStraddlingRowCore` requires a specific six-point equality/orientation
  realization not produced by an arbitrary escape.

The indexed search for the exact surviving shape returned only
`outsidePair_unique_capCenter`, confirming that equality at `p` is banked but
the unequal-radius branch is not.

## Kernel-checked boundary

The scratch file defines and proves:

- `URowCommonCapFields`;
- `URowCommonCapOffDangerousConfinement`;
- `URowOffDangerousEscapeFields`;
- `URowOffDangerousMetricEscapeFields`;
- `commonCap_confinement_or_offDangerousEscape`;
- `offDangerousEscape_to_metricEscape`;
- `URowOffDangerousSeparatedPairFields`;
- `sameCap_outsidePair_pDistance_ne`;
- `offDangerousEscape_to_pSeparatedOutsidePair`;
- `commonCap_confinement_or_pSeparatedOutsidePair`; and
- the generic classifier/consumer adapters.

This is real narrowing, not closure: no live `sorry` is closed by the file.
The remaining packet still needs a producer into a checked MEC/order core.

## Scoped countermodel

The same Lean file kernel-reduces a `Fin 12` shadow matching the saved
`(4,5,6)` placement layer:

```text
p = 0, center = 1, u = 2,
dangerous = {1,3,4,5},
support   = {0,2,5,6},
cap       = {0,1,8,9,10,11}.
```

Lean checks:

- `p` and `center` lie in the common cap;
- both rows have cardinality four;
- the row center is absent from its support;
- `u` is an off-dangerous support point;
- both standard intersection upper bounds and complement lower bounds hold;
- off-dangerous confinement fails, with `2` and `6` escaping the cap; and
- the dangerous outside multiplicity is exactly one.

This is a countermodel only to implication from the extracted
set/cardinality facts. It omits Euclidean realization, convexity, MEC,
global center-K4, exact critical filters, and no-`M44`; it is not a
counterexample to the full live theorem. Consequently full live confinement
remains **CONJECTURED**, while the insufficiency of the existing local counts
is **PROVEN**.

## Validation

A deliberate direct single-file Lean check passed from the Lake root:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/stage1_common_cap_confinement_boundary.lean
```

All printed endpoints depend only on
`propext`, `Classical.choice`, and `Quot.sound`. The file contains no
`sorry`, `admit`, named axiom, or `native_decide`, and it emits no linter
warning.

Epistemic labels:

- **PROVEN / kernel-checked:** the escape dichotomy, live metric upgrade,
  `p`-separated outside-pair reduction, adapters, and finite shadow;
- **PROVEN dependency boundary:** common-cap placement plus the presently
  extracted count/incidence facts does not force confinement;
- **NOT CLAIMED:** a counterexample to the full Euclidean K-A-PAIR surface;
- **CONJECTURED:** full live hypotheses classify every `p`-separated escape
  into an already-consumed MEC/order obstruction.
