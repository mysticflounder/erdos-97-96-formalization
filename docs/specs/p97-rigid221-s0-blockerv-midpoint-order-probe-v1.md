# Rigid221 S0 literal-blocker-`v` midpoint-order probe v1

**Status:** bounded source-consistent fixed-order discovery input; no
source-universal conclusion

## Purpose

The historical exact-five QF_NRA cell fixed the second-cap roles as

```text
m1, v, u, xu, m2.
```

That order conflicts with the source-entitled strict-cap midpoint relation.
`exists_sourceRow_partner_with_blocker_index_strictly_between` in
`Rigid221SourceRowCapBetweenness.lean` supplies a source-row partner and
proves that the literal blocker lies strictly between the source and that
partner in every ordered-cap presentation.  Under this probe's names, the
mapping is `source = u`, `partner = xu`, and `blocker = v`.

This v1 probe keeps every historical geometric and deletion constraint while
replacing only that inconsistent order control with the two orientations
allowed by the source theorem:

| Cell | Strict second-cap segment |
|---|---|
| `forward` | `m1, u, v, xu, m2` |
| `reverse` | `m1, xu, v, u, m2` |

Reversal of an ordered-cap presentation preserves the property that `v` lies
between `u` and `xu`, so these two cells cover the order direction permitted
by this fixed naming.  They do not cover all source shapes or all role
identifications.

## Retained formula boundary

Each cell uses the historical 13 named roles

```text
O, m1, m2, u, xu, delta, v, xv, au, bu, av, bv, cv
```

and retains the following constraints from the historical exact-five probe:

- the physical five-class, exact source and opposite rows, literal source
  blocker, mutual omission, and two deletion multiplicity conditions;
- exact second-cap membership with strict interior `{u, xu, v}`;
- Moser disk and non-obtuse conditions, exact cap predicates, and strict
  convexity for the selected full role order; and
- the rational Moser coordinates, pairwise role distinction, and finite
  named-carrier closure.

The last group remains fixed-cell control.  It is not asserted to follow from
`ExactFourRigid221PhysicalApexSourceEqUContext`.

## Source relationship and consumer

The first immediate source fact is the strict midpoint relation above.  It is
the first edge toward the planned B3 program for

```text
false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy.
```

The current source packet still lacks the second and third equal-distance
links needed by `false_of_orderedCap_three_equidistant_betweenness_cycle`.
These cells therefore test only whether a source-consistent fixed order makes
the retained larger QF_NRA formula decidable; neither an UNSAT result nor a
SAT witness would by itself discharge B3.

## Deterministic emitter

`scripts/rigid221_s0_blockerv_midpoint_order_probe.py` wraps the preserved
historical encoder without changing its archived default order.  Its smoke
check verifies that the archived order fails the midpoint preflight, both new
orders pass it, the two formulas contain 1,020 assertions each, and their
SMT-LIB uses no pseudo-Boolean operators.

At the lane base `89740da794f4eff13df74554d2baedbef6e71fca`, the smoke hashes
are:

| Cell | Formula SHA-256 |
|---|---|
| `forward` | `7281135c232bf673d0a8a353ebc1377b3f76eaceed3e60eb32ac10b3d7971fd6` |
| `reverse` | `d761d91ed6b41d22a66c33dfcb8905f405a188bf8a3e02e263218ca602296a27` |

## Execution discipline

Each emitted query-free formula must be sent through a fresh PiQD session,
with a distinct retained receipt and run manifest.  `UNKNOWN` licenses no
deletion or mathematical conclusion.  A SAT result requires exact rational
model replay; an UNSAT result remains formula-scoped discovery evidence until
there is a source bridge and a kernel-checked consumer.
