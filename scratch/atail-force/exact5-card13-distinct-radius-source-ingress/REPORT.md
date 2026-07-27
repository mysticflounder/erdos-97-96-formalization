# Exact-five card-13 distinct-radius packed-rank adapters

## Scope

This scratch lane contains only the two generic packed-rank ingress adapters
requested by the distinct-radius source audit.  It does not generate or check
the 1,056 complete-class instances or the unique-K4 four-subset sweeps, and it
does not claim certificate or production closure.

## Theorem-bank preflight

The required preflight checked the general-n bank registry and its sibling
`p97-rvol` inventory, then searched the indexed Lean corpora and the current
source tree.  The banks contain many local metric/incidence contradiction
consumers but no theorem matching either packed-rank ingress clause.  Current
source does contain the needed lower-level facts:

- `finiteOrdinalRank78BitVec_eq_iff`;
- `mem_selectedClass` for complete ambient exact classes;
- `LargeCapUniqueFiveSecondApexRadius.unique_K4_radius` and the analogous
  first-apex/critical-shell uniqueness producers.

No new finite-pattern or metric contradiction was derived.

## Actual minimal statements

`distinct_completeClass_rank_ne_guard` accepts an arbitrary carrier
enumeration, 78-value table, Boolean exact-class membership vector, and the two
pair-table identifications.  It proves the exact Boolean implication normal
form

```text
same membership OR unequal seven-bit ordinal ranks.
```

`distinct_uniqueK4_rank_guard` accepts the existing source-level uniqueness
contract

```text
forall rho > 0, card (SelectedClass A center rho) >= 4 -> rho = radius
```

plus four distinct enumerated carrier points and their four pair-table
identifications.  It proves the exact Boolean implication normal form

```text
all four are in the distinguished class OR their four ranks are not all equal.
```

This is deliberately generic across the second-apex, first-apex, and actual
critical-center producers.  Generated instance sweeps are a later gate.

## Validation

`DistinctRadiusPackedRankAdapters.lean` passes the authoritative Lean 4.27
toolchain with warnings treated as errors.  Both public theorems have the exact
axiom closure

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`; the lane contains no `sorry`, `admit`, declaration-level
`axiom`, or `unsafe` escape.
