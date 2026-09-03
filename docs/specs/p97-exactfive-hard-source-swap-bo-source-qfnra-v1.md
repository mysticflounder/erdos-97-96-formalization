# P97 exact-five hard source-swap B--O source QF_NRA v1

Status: implementation specification. No solver run is authenticated by this
document.

## Purpose and boundary

This lane tests the two current authenticated profile-1697 cyclic-order cells
after a fixed source-valid normalization. It binds and replays the completed
adaptive-order custody before building either target. It does not supply the
missing live-source-to-profile-1697 alias completeness bridge and therefore
makes no live closure, Lean, promotion, or theorem claim.

The bounded Lean reuse preflight at revision
`c07dbadc08332e1e52a4857e5365611029a9f814` searched for a theorem proving
`B != O` for this source configuration. It found no candidate. The candidate
was `B != O`, its immediate consumer was the B--O source gauge, and the first
missing antecedent remained the live-source-to-profile-1697 alias completeness
bridge. The search must not be repeated unless its key materially changes or a
new theorem candidate arises.

## Authenticated inputs

Profile index `1697` has digest
`59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e`.
The producer invokes the no-transport replay in the completed adaptive-order
lane through the equality-core custody wrapper. It pins these current orders:

1. `c000,c010,c009,c005,c008,c007,c001,c006,c002,c004,c003`;
2. `c000,c008,c009,c007,c005,c010,c001,c006,c002,c004,c003`.

Their recorded engine, order digest, origin digest, prior manifest, launch,
terminal, and durable summary must all revalidate before query construction.
No older fixed-order canary order may replace them.

## Exact normalization and substitution

The quotient role map is authenticated from the profile. Write `B=c000`,
`O=c001`, `Q=c002`, `A=c003`, and `S=c005`. The query fixes

```text
B = (0,0)       O = (1,0)
A = (1/2,r)     S = (1/2,-r)     Q = (3/2,r)
4*r^2 - 3 = 0  r > 0
```

The signs are checked against each current order, not assumed from an obsolete
order list. In both cells, the signed areas for `(B,S,O)`, `(B,O,A)`, and
`(B,O,Q)` reduce to `r`. The source row equations used by the normalization
reduce to zero after `r^2=3/4`.

The substitution is forced, rather than merely a satisfying specialization.
The `T0` and `K1` rows make both `A` and `S` unit distance from `B` and
`O`; subtracting their two circle equations fixes their first coordinate at
`1/2` and their second-coordinate square at `3/4`. The two order signs select
`A_y=r>0` and `S_y=-r`. For `Q=(q_x,q_y)`, the `T0` and `K2` rows give
`QO^2=1` and `QA^2=QO^2`. Subtraction gives `q_x=2*r*q_y`, and substitution
gives `4*q_y*(q_y-r)=0`. The strict sign for `(B,O,Q)` makes `q_y` nonzero,
so `q_y=r` and `q_x=3/2`. This uses no division by `r`.

There are 13 declared variables: `r` and both coordinates of
`c004,c006,c007,c008,c009,c010`. Eliminated coordinates are recorded explicitly
in the semantic system.

## Complete source ledger

Each target retains, in original source order:

- all 165 strict signed-area assertions, one per ordered triple;
- all 13 row-distance equalities from `T0`, `K1`, `K2`, and `L`, including
  entries that reduce to zero;
- `dist^2(Q,O) != dist^2(Q,D)`; and
- `dist^2(E,D) < dist^2(E,A)`.

No assertion is deduplicated. Every source assertion has an exact polynomial
and emitted SMT term in the semantic ledger. As an encoding regression, the
fixed triple `(S,O,Q)` must reduce identically to zero in both current orders;
its strict assertion remains in each query.

## PIQD execution and controls

The only solver transport is the maintained PIQD SMT HTTP adapter. Both `z3`
and `cvc5` run for every query. Direct solver subprocesses and local fallback
are absent. A rational positive control (`t=1`) must return SAT in both engines
and pass exact replay. A negative control (`t=0` and `t>0`) must return UNSAT in
both engines before target results are interpreted.

SAT readback is fail-closed. The maintained response paths use `root-obj` for
Z3 and `(_ real_algebraic_number ...)` for cvc5 on algebraic values; the
existing exact-five replay stack has no authenticated parser for either form.
The producer supports exact integer, decimal, and rational readback only. Any
unsupported algebraic value yields an inconclusive semantic-verifier result,
never source feasibility. A rational target readback must expand all eleven
classes, transform exactly to the original rank gauge, and pass
`exactfive_hard_source_swap_nra_piqd.check_coordinates`.

UNSAT is formula-scoped discovery only. UNKNOWN, transport loss, engine
disagreement, malformed artifacts, digest drift, incomplete values, semantic
rejection, and unsupported algebraic syntax are inconclusive.

## Run custody

The sole generated root is
`scratch/runs/exactfive-hard-source-swap-bo-source-qfnra-20260903/run-0001/`.
It must contain a `worktree-run-manifest/v1` with the lane checkpoint base head
before execution. Query trees and launch/terminal records are immutable and
content-bound. A completed resume reconstructs every query from current source
bytes and performs no solver transport.

The command is silent on success unless `--verbose` is passed. Errors are
always written to standard error.
