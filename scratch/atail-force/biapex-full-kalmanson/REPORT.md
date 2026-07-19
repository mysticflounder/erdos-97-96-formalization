# Bi-apex full-Kalmanson audit

Date: 2026-07-17

Status: **THE PROPOSED `Fin 12` REGRESSION IS KALMANSON-DEAD; THE CORE IS
PRODUCTION-FORMALIZED.**

`audit_fin12_full_kalmanson.py` replays the complete selected-row system from
`biapex-strategy-audit/BiApexFiniteBoundary.lean` in abstract distance
variables. It adds both strict Kalmanson inequalities for every increasing
boundary quadruple and quotients distances by all selected-row equalities.
Z3 returns UNSAT. Deletion minimization gives the four-constraint input core
recorded in `fin12_full_kalmanson_mus.json`:

```text
row 0: d(0,1) = d(0,2)
row 0: d(0,1) = d(0,3)
row 1: d(1,2) = d(1,3)
order 0 < 1 < 2 < 3:
  d(0,3) + d(1,2) < d(0,2) + d(1,3)
```

Equivalently, row 0 gives the strict ordinal comparison
`d(1,2) < d(1,3)`, while row 1 identifies its endpoints. Thus the generic
ordinal relation has a self-loop once term equality is represented correctly.

Production theorem

```lean
Problem97.CapCrossingKalmansonBridge
  .false_of_two_selected_rows_shared_late_pair
```

now proves this two-row cancellation directly with only the standard three
core axioms. The model is not a valid regression against a generic ordinal or
full-Kalmanson coverage theorem.

This audit does not prove the full bi-apex coverage statement. All 101 old
survivors also fail the second-apex blocker omission, but the fresh
two-omission current-bank query remains bounded `UNKNOWN`, not UNSAT. The next
search must apply equality-quotiented ordinal/full-Kalmanson closure eagerly
and admit only a verifier-clean replacement survivor.
