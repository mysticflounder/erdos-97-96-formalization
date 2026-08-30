# Rigid221 S0 piqd computation — fixed-cell canaries UNSAT

This run used piqd's stateful z3 SMT lane for the fixed S0-I, M0, all-distinct
canary cell. The relaxed base removed only the 168 strict orientation
assertions (indices 162..329) and the terminal query. It was SAT in 215 ms.
The returned model violated 15 of the omitted orientations. Those 15 exact
source assertions were appended to a fresh piqd session.

The wave-1 refined query returned `UNKNOWN` after 132,003 ms (effective piqd
deadline 150,000 ms). This is a tractability result, not UNSAT evidence.

## Decisive bounded result

To isolate the geometric obstruction, I constructed two strict subsets by
copying assertions verbatim from the frozen source cells. Each keeps fixed
`O,m1,m2`/Moser geometry, the five physical equalities (`u`, `xu`, `delta`,
`v`, `xv`), MEC enclosure, retained-role cap arms, and every global orientation
assertion involving only those retained roles. Row fibers, no-four-equal-distance
clauses, and pairwise-distinct clauses are omitted.

* S0-I: 217 assertions, SHA-256
  `c5a4347c5cf9e70e8c77e34a3039dbaac4a74bbe2186a3ca0099abf7359a031b`;
  PiQd z3 4.17.0 with deterministic nlsat returned `UNSAT` in 194 ms.
* S0-N: 208 assertions, SHA-256
  `96ca6876fbdee6c287e3ffcc6ddbf7711662a46ad07f8867fa412b11c2d8683c`;
  the same PiQd z3 configuration returned `UNSAT` in 295 ms.

Every generated assertion was checked against its source-cell S-expression.
By monotonicity, each UNSAT subset entails UNSAT for its corresponding frozen
fixed-cell encoding. This is a bounded fixed-order canary result, not a proof
of the source-universal theorem. A PiQd cvc5 cross-check of S0-I remained
`UNKNOWN` at 210,013 ms, so the independent solver did not reproduce the
verdict within the allotted wall time.

The fixed Moser coordinates, one cyclic order, and pairwise-distinct equality
cell are experimental restrictions of the upstream encoding. This run does not
cover alternative orders, source-legal equalities/overlaps, q/w cells,
the full source context, the joint-deletion packet, or the unbounded theorem.

As a tractability probe, fixed `O`, `m1`, and `m2` coordinates were substituted
and arithmetic was simplified without dropping assertions. Both normalized
cells also returned `UNKNOWN` at the 630-second piqd deadline (I and N).

Piqd daemon: `0.1.0`, SHA-256
`f89994bc10fcad69a264d8efbd7d76b8203c94c08f22b4536d3b473a12cee089`.
Solver: `z3-4.17.0`, SHA-256
`b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`.
