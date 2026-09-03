# Profile-282 B--O source QF_NRA run 0001: post-run audit

Date: 2026-09-03

Verdict: **PASS WITH STRICT FORMULA SCOPE — EMPIRICALLY VERIFIED.** The two
authenticated profile-282 order formulas returned `UNSAT/UNSAT` on Z3 and
cvc5. This is cross-engine evidence about those two exact QF_NRA formulas. It
is not a checked UNSAT proof, source coverage, source realization, a Lean
result, promotion evidence, or closure of a live obligation.

## Result and controls

The rational positive control returned `SAT/SAT`. Both models replayed exactly
as `t = 1` through verifier
`exact-rational-profile282-expansion-and-source-replay/v1`. The negative
control `t = 0` and `t > 0` returned `UNSAT/UNSAT`.

The targets used Z3 4.17.0 and cvc5 1.3.3:

- `parent-z3-mirror`: SMT-2 SHA-256
  `073a0fb9d19ed56b0b4e581bb11d1cd9dff4460a38e4504fae36b4c068963da4`;
  Z3 returned `UNSAT` in 10 ms and cvc5 returned `UNSAT` in 241 ms.
- `parent-cvc5-direct`: SMT-2 SHA-256
  `a46f48e81e4fb13e221d920fa0a1b1f1af7c8c8c1022e5859c5a574390a9ef01`;
  Z3 returned `UNSAT` in 17 ms and cvc5 returned `UNSAT` in 361 ms.

Every target engine is correctly classified as `UNSAT_DISCOVERY_ONLY`. The
receipts have empty unsat-assumption lists and `named_core_support = false`, so
the run does not identify a smaller contradiction. The terminal status
`TARGETS_UNSAT_DISCOVERY_ONLY` is therefore the strongest supported status.

## Profile and order custody

The parent is the immutable 2,798-profile order run under
`scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001`.
Its authenticated links are:

- run-manifest self-hash
  `81e3b3c6bcddef75fbc8a2d22eda9787f6f6db5c394aca2de68b689a91d86299`;
- launch self-hash
  `142ce963789fca3efb419c4be21495cdbdb5195677a32cc9f736201a027b0494`;
- terminal self-hash
  `6baab84ed88abc816965447f9b4f5ce90f62a7c90c8c4e777aa6496e6e62d9e2`;
- profile-result SHA-256
  `842b1a82c889363a14916ffd268ff15021821c436070af7e9064d77760baa28d`;
- profile source-manifest SHA-256
  `044e303e38d3b1688b9b2145353dcc76b12005b600f73db6c978d6c14cd38782`.

Parent terminal entry 282 binds key
`profile-0282-9ab4cce5c41587dc4cfe` to that result. The profile SHA-256 is
`9ab4cce5c41587dc4cfe5822d027a141d843e5ae646056a015ac185c95321f84`;
the 2,798-profile stream SHA-256 is
`fd2e737527f98dbba812db3c1769b4d8fa9a3d5f2f6298c104b8bc3fe215a6a7`.
The parent Z3 and cvc5 models are both exact-replay `SAT` models of the order
abstraction and supply these child orders:

```text
mirror: c000 c005 c003 c007 c004 c002 c010 c006 c001 c012 c008 c011 c009
direct: c000 c012 c008 c009 c005 c011 c001 c006 c007 c010 c002 c004 c003
```

The 13 classes and role aliases agree byte-for-byte with the authenticated
parent profile. This audit does not treat either abstract parent model as a
live geometric source object.

## Formula audit

The gauge fixes `B = c000 = (0,0)` and `O = c001 = (1,0)`. The profile rows
give the unit-distance intersections used to place
`A = c003 = (1/2, sigma*r)` and
`Q = c002 = (3/2, sigma*r)`, with `4*r^2 - 3 = 0`, `r > 0`, and the order's
authenticated sign `sigma`. The four classes are distinct in the profile, so
the unit scale and the non-`B` circle intersection are legal. Positive scaling
and the selected reflection preserve every encoded equality, distance
comparison, and order sign.

Each target has 19 real variables and 323 SMT commands:

- 2 normalization assertions;
- all 286 signed-area assertions, one for every triple of 13 classes;
- 13 row equalities, including one retained `0 = 0` row entry;
- one radius disequality;
- one source-strict inequality.

There are no identically-zero signed-area entries. An independent exact
rational scan also found no pair of area polynomials that are negative scalar
multiples, no area polynomial in the rational linear span of the row
equalities plus the modulus, and no negative-scalar pair after reducing by
that span. Thus this run has no visible one-area or two-area contradiction of
the kind that closed profile 1697. This negative scan does not prove that a
larger small core is absent.

## Artifact and replay audit

The child chain authenticates as follows:

- run-manifest file/self SHA-256:
  `461b20fade74dfed19f96e4678752a04106639a1a02175479786d9b4198d7e94` /
  `5a3d9ef8ca8869a04573cd1fa525cf3938f0aac5ceb172e09064b24f0deda166`;
- launch file/self SHA-256:
  `f2e6032223a35372bd982325c9438474952e824501c1f92b5eeeaaa809d84780` /
  `ff8ebbdfa89ce8428b2b2471b49a0140a27ac1ff584acdc9ccaf68d88c1c2874`;
- terminal file/self SHA-256:
  `9a56ffd719a50ed45cd6b3c2a80402b6eddd208f1820b06b95f3ebbc0d25d4ad` /
  `eacf4956d541580aae3bef79379873d375679e7371868e79ae54ec03044bbd98`.

A standalone checker recomputed 130 run-manifest, input, source-snapshot,
descriptor, formula, receipt, semantic-replay, and engine-artifact digest
records with zero mismatches. Each Z3 and cvc5 engine input has the same hash
as its query's authenticated normalized journal. No output directory contains
an unbound file.

From the repository root, the completed replay command was:

```text
env PYTHONPATH=. uv run python \
  scripts/run_exactfive_hard_source_swap_profile282_bo_source_qfnra_piqd.py \
  --timeout 60 --workers 2
```

It exited 0 without output in 2.261 seconds. A second completed replay left all
122 run files byte-stable. Before and after, SHA-256 over the sorted per-file
digest lines was
`8013599feeefdcc5bbabfbfed593065df164c7b15fe05274871aed4d1ff28fd5`.
The completed-terminal branch validates every retained query tree before the
transport object is constructed, so this replay made no PIQD request and no
solver call.

The canonical summary is:

```text
docs/computation/exactfive-hard-source-swap-profile282-bo-source-qfnra-20260903/
run-0001-summary.json
```

## Completed-wave theorem mine

Only artifacts produced by this wave were reviewed. They provide two
full-formula UNSAT verdicts, two controls, and no target models or assumption
cores. No recurring minimized shape or precise general theorem follows from
that data. The six-role projection below is a testable successor probe, not a
current theorem candidate. Accordingly, no Lean-corpus search was run.

Projecting both orders to
`{B,O,A,Q,D,E} = {c000,c001,c003,c002,c004,c010}` gives

```text
direct: B O E Q D A
mirror: B A D Q E O
```

These are the two reflected orientations of one six-role order skeleton. The
projection retains 20 order signs, six row entries, the normalization, the
radius disequality, and the source-strict inequality. Whether that subsystem
is already inconsistent was not tested in this audit.

## Recommended successor

Run a bounded, fresh PIQD-only assumption-core lane. First test the exact
six-role projection above. Guard every optional assertion with a named
assumption; keep the normalization and source identities explicit. If the
six-role seed is `UNSAT` on both engines, use fresh PIQD sessions for deletion
trials and replay the final Z3-minimized core independently on cvc5.

If the seed is `SAT` or inconclusive, return to the 13-role formula and first
shrink four natural role blocks:

```text
T0-tail={q}  K1-tail={s,t}  K2-tail={u,v}  L-tail={x,y}
```

Only then shrink individual row and signed-area assertions. Bound every trial,
stop on `UNKNOWN` or engine disagreement, retain the exact inputs, and keep all
claims formula-scoped. A common independently replayed core across the two
reflected orders would supply the next credible theorem candidate.

## Claim boundary

This audit rejects claims of live-source completeness, source realization,
all-order elimination, Lean ingress, live closure, promotion, and theorem
status. No such claim is licensed by this run.
