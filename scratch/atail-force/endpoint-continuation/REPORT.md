# Endpoint-continuation scratch audit

## Verdict

The current `CriticalShellSystem` / `BoundaryIndexing` incidence-and-order
surface does **not** uniformly force either return-row endpoint membership or
a strict cross-cap continuation.  This route therefore cannot close K-A-PAIR
without a new geometric producer.

The useful conclusion is sharper than a generic failed search:

1. endpoint landing must be an explicit continuation branch; and
2. after endpoint blockers are excluded, the remaining interior continuation
   branch must consume genuinely geometric data absent from the finite
   incidence/order interface (for example MEC, the full all-center K4 system,
   a minor-cap-chain theorem, or a global lifted-rank field).

## Mandatory bank preflight

Searched the current and archived registries named by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Also queried the indexed Lean corpus with `nthdegree docs search --lean` for
endpoint support, same-cap blockers, source pushout, rank drop, strict laps,
and cross-cap continuation.

The nearest banked results are `source_pushout_right/left`, `rank_drop`,
`strictLapPacket_nonreturn`, `SameCapBlockerEdge`,
`SameCapIncompatibleEdge`, `ConsecutiveOppositeEndpointEdges`, and
`Dumitrescu.cross_cap_edge_good`.  None is a producer from the live frontier
or shell hypotheses:

- the source-pushout results consume an already-produced incompatible edge,
  chain model, used endpoint, and endpoint/blocker inequalities;
- `strictLapPacket_nonreturn` consumes a strict-lap packet rather than
  constructing one; and
- `cross_cap_edge_good` classifies an already-strict cross-cap pair rather
  than producing cross-cap motion.

Thus no indexed theorem supplies the missing direction.

## Exact Euclidean obstruction at the current residual surface

`analyze.py --check` replays `residual_456_exact_witness.py`.  In its exact
biquadratic strict-convex configuration:

- the ordered cap is `(2, 5, 6, 7, 0)`;
- source `5` has blocker `0`;
- blocker row `0` is `{1, 3, 4, 5}`; and
- that row omits both cap endpoints `2` and `0`.

The source belongs to its blocker row at exact squared radius one, and deleting
the source destroys every four-point class at that blocker.  The blocker is
itself the right cap endpoint.  Hence endpoint membership is not forced even
at the exact metric critical-shell surface, and endpoint landing cannot be
discarded.

Epistemic boundary: this is an exact Euclidean critical-system residual, not
full `CounterexampleData`; in particular it fails the all-center K4 and MEC
fields.  It identifies which omitted geometry a successful producer must use.

The saved exact report predates an upstream probe-bank improvement.  Its
recorded probe digest is stale, but replay shows the pinned assignment and all
semantic fields are unchanged.  `analyze.py` isolates and reports this
digest-only provenance drift rather than accepting it silently.

## Kernel-checked interior-cycle countermodel

`finite_countermodel.lean` constructs an order-13 row design with:

- four elements in every row;
- the center absent from its row;
- intersection size at most two for distinct rows;
- a fixed-point-free blocker map;
- every source contained in its blocker row;
- an injective cyclic boundary and contiguous 12-label cap; and
- the blocker cycle `1 -> 6 -> 2 -> 1` wholly inside the cap.

All three sources and blockers are strict cap-interior labels, while every
blocker row on the cycle omits both endpoints.  The theorem
`endpoint_or_cap_exit_not_forced` refutes the natural incidence-only
continuation disjunction.  The printed axiom sets contain only `propext` and
`Quot.sound`; there is no `sorryAx`.

This finite model is deliberately not claimed to be Euclidean or full
`CounterexampleData`.  Its role is exact: merely adding endpoint-blocker
inequalities to the incidence/order hypotheses still does not prove the
interior continuation step.

## Minimal producer interface

An honest one-step continuation theorem must explicitly return a disjunction
at least as strong as

```text
blocker = left endpoint
or blocker = right endpoint
or left endpoint is selected in the blocker row
or right endpoint is selected in the blocker row
or a strict cross-cap advance carrying a retained global-boundary lift/rank
or a named already-consumed terminal sink.
```

The strict cross-cap branch must carry a well-founded progress field—such as a
strictly increasing common global-boundary lift or a produced
`StrictLapPacket`.  Bare membership in another cap, or landing on a shared
endpoint, does not close a cycle.

For the live card-five pair blockers, existing lemmas exclude some prescribed
apex endpoints.  They do not connect the active q/w pair to the arbitrary
cycle supplied by `exists_blocker_cycle`, so they do not remove the endpoint
branch globally.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/endpoint-continuation/analyze.py --check

cd lean
lake env lean \
  ../scratch/atail-force/endpoint-continuation/finite_countermodel.lean
```
