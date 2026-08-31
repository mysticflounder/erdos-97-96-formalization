# Rigid221 S0 literal-blocker-v exact-five probe v1

**Status:** bounded fixed-order discovery input; no source-universal claim

## Objective

This probe tests the narrow branch of
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`
in which the actual source blocker is `v`, the closed physical second cap has
cardinality five, and the contextual peer is `v`.

The closed source consequences give a three-point strict-cap interior:

```text
J = {u, xu, v}
```

where `u` and `xu` are the source-row physical trace and `v` is their actual
blocker.  The current live theorem does not yet consume this normal form.
This formula asks whether one fixed Moser normalization and one cyclic order
already refute the resulting geometry.

## Boundaries

The formula has thirteen pairwise-distinct named carrier roles:

```text
O, m1, m2, u, xu, delta, v, xv, au, bu, av, bv, cv.
```

There is no separate `cu` role: the source-row center is literally `v`.
The source row is `{u,xu,au,bu}`, the opposite row is `{v,xv,av,bv}`, and
the physical class is `{u,xu,delta,v,xv}`.  The formula imposes exact fibers,
mutual omission, strict convexity, the non-obtuse Moser disk, exact cap
construction from `OnArcOpposite`, the rotated second-cap interior, and the
two modeled deletion multiplicity bounds.

The following controls are not supplied by the live Lean packet and are kept
as explicit fixed-cell assumptions:

- the rational Moser coordinates;
- this one cyclic order;
- pairwise distinctness of all thirteen modeled roles; and
- finite closure of the carrier at these roles.

Consequently a SAT result is a bounded encoding model until its rational
coordinates are independently replayed.  An UNSAT result is a statement about
the authenticated formula only.  Neither result closes a Lean theorem without
a source bridge, coverage, and a named consumer.

## Clause inventory

| Class | Content | Status |
|---|---|---|
| `ROOT_STATIC` | exact physical five-class, exact source/opposite rows, row omissions, literal source blocker, cap construction, and cap cardinality five | source-mapped only for the listed fields |
| `ASSUMPTION_CONTROL` | rational Moser shape, cyclic order, finite named carrier, role distinctness | fixed-cell control |
| `ASSUMPTION_CONTROL` | exact five closed second cap and `J={u,xu,v}` | selected live branch, not a universal cap profile |
| `ROOT_STATIC` | deletion multiplicity bounds at `v` and `cv` | modeled source-facing consequences; wider robust-surface fields omitted |

## Required execution discipline

1. Run the local serialization and contradictory-mutation smoke check.
2. Emit exact SMT-LIB2 bytes beneath the governed run root.
3. Submit those bytes through a fresh PiQD SMT session and retain the receipt.
4. For SAT, read a model with an independent local solver and replay every
   active predicate over `Fraction` values.
5. For UNSAT, obtain an independent cvc5 `--nl-cov` result before using it as
   discovery evidence.

The run report must record the formula hash, solver identities, exact scope,
and the result classification.  No learned clause is admitted from this probe
without a separate source-preservation argument.
