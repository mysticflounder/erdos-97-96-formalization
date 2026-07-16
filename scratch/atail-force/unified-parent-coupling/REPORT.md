# Unified parent-coupling audit

Date: 2026-07-14

Status: **SOURCE-CURRENT SCRATCH; KERNEL CHECKED.**

## Result

The current continuation frontier has one honest parent-facing interface, but
it must remain branch-indexed.  There is no source-current common point/pair
selection lemma that feeds all arms without adding unsupported incidences.

`UnifiedParentCoupling.lean` defines
`UnifiedFrontierParentCoupling F` with exactly three dispatcher fields:

| Dispatcher arm | Weakest current closing output |
|---|---|
| cross survival | choose one oriented `SurvivingContinuationRow` and a first-apex radius with at least two outside-row hits |
| non-equilateral | choose one point common to the two native continuation rows and lying in strict `oppCap1` |
| equilateral joint | choose one of: a LowHit reciprocal-critical fresh pair for `Ku`; the corresponding pair for `Kv`; or a reverse-mixed third carrier bisector center |

The equilateral output is a disjunction, not a structure demanding all three
callbacks.  This matters when two profile propositions can coexist: only one
closing selection is required.

## PROVEN

- `CrossSurvivalClosingSelection.false` consumes the cross selection using
  `SurvivingContinuationRow.false_of_two_firstApexRadius_hits`.
- `false_of_jointTransition_of_closingSelection` consumes every alternative
  of the equilateral selection using the checked LowHit or reverse-mixed
  terminal.
- `jointTransitionClosingSelection_of_branchProducers` lets the existing
  profile classifier choose one output from three branch callbacks; those
  callbacks are a construction guide, not part of the weakest returned
  disjunction.
- `frontierContinuationEliminators_of_unifiedParentCoupling` constructs all
  three fields of `FrontierContinuationEliminators F`.
- `commonCriticalMapContinuationContent_of_unifiedParentCoupling` preserves
  the full parent quantifier order and converts the unified contract to the
  dispatcher's content contract.
- `commonCriticalMapClosingProducer_of_unifiedParentCoupling` reaches the
  existing parent direct-false producer surface conditionally on that
  contract.

All printed axiom closures contain only `propext`, `Classical.choice`, and
`Quot.sound`.

## OPEN

No theorem in this file constructs `UnifiedFrontierParentCoupling F`.
Concretely, the missing parent content remains:

1. on cross survival, force the contradictory repeated first-apex radius in
   one oriented survivor row;
2. on non-equilateral output, force a strict-`oppCap1` common row hit; and
3. on an equilateral joint packet, force one of the two LowHit
   reciprocal-critical/separated-blocker pairs or the reverse-mixed third
   bisector center.

The full MEC, cap, no-M44, cardinality, non-removability, retained critical
map, localized U3 data, fixed triple, base distinctness, and live-data
hypotheses remain in scope for a future producer.  The contract also retains
the original quantifiers over `j`, the five-point other cap, `r`, its positive
four-class, and every `CriticalPairFrontier` at that radius.

## Overstrength audit

A single untyped “select two fresh points” field is not justified:

- Cross survival already proves that any two distinct outside support points
  have *different* first-apex distances.  Equality of that radius is the
  terminal contradiction itself, not a reusable neutral selector.
- The non-equilateral exact rational regression has disjoint native row
  supports.  It refutes any geometry-free or local-cap-only claim that a
  common hit is automatic.  It is not a full `CounterexampleData` model and
  therefore does not refute a future parent-geometric producer.
- LowHit supplies three fresh support candidates, but reciprocal membership
  in their selected critical shells and three blocker-separation fields are
  additional content.
- The reverse-mixed arm already realizes two pair bisectors; its missing datum
  is a *third carrier center*, not a pair of row-support sources.

The common reusable mechanism is the perpendicular-bisector carrier bound,
not a common selection object.  The right higher-level shape is therefore a
dependent/branch-indexed parent selection, exactly as encoded here.

## Bank preflight

The current source bank, sibling `p97-rvol` registry, legacy `erdos/97`
registry, and older `erdos-general-theorem/97` registry were searched before
writing the interface.  Focused nthdegree searches covered critical-map
selection, continuation cross survival, LowHit fresh pairs, reverse-mixed
profiles, strict-cap common hits, and third bisector centers.  The closest
hits are the same branch consumers imported by this file and the generic U5
common-bisector kernels; no bank theorem produces all branch outputs or
removes one of the three missing parent incidences.

## Validation

The four imported branch files were compiled source-current into the temporary
scratch olean directory.  The final check, from `lean/`, was:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/unified-parent-coupling \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/UnifiedParentCoupling.olean \
  ../scratch/atail-force/unified-parent-coupling/UnifiedParentCoupling.lean
```

The source scan finds no `sorry`, `admit`, `native_decide`, or named `axiom`.
The non-equilateral exact validator was rerun and reports `PASS`, with native
row overlap `0`.

No production file, shared closure document, `SurplusM44`, or unique-row file
was edited in this lane.
