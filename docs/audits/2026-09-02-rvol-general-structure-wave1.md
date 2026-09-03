# RVOL general-structure Wave 1 preflight (n=18)

This governed lane records a fail-closed preflight for the channel request
`#8251`; it is not a solver result.

| Item | Current source fact | Disposition |
|---|---|---|
| Four comparison modes | Existing runner has `baseline`, `dual2`, `scc`, `dual2_scc` | Reusable only for generic A-ROW |
| Exact-card-18 surface | `Rigid221Card18SearchBase` exists, but no four-mode serializer/solver runner is authenticated | Blocked |
| Source packet custody | Card18 source pin is stale against current `Rigid221SourceHeavy.lean` | Fail closed |
| Solver path | Existing runner calls direct CaDiCaL; SAT policy requires piqd | No solver call |
| Metric claim | Neither available surface proves metric realizability | Explicitly excluded |

The prior generic n=18 run is retained under its own lane and reports
`PARTIAL_SURVIVOR_CAP` for all four modes after 16 accepted survivors per mode.
It is not Card18, not metric-faithful, and not a closure result.  This lane
therefore stops before CNF generation and records the missing successor work:
refresh the authenticated Card18 source packet, expose the exact mode
serializer/variable map, and run the byte-identical CNF through piqd with
model/proof custody and independent replay.
