# Profile 282 B--O source QF_NRA diagnostic v1

## Scope

This producer asks two formula-scoped realizability questions for source-alias
profile 282. It does not establish source coverage, a Lean ingress, a theorem,
promotion, or closure of a live proof obligation.

The immutable parent is
`scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001`.
The producer replays its run manifest, launch, terminal, profile result, both
engine receipts, and profile source manifest before building a child query.
The pinned profile has index 282 and SHA-256
`9ab4cce5c41587dc4cfe5822d027a141d843e5ae646056a015ac185c95321f84`.

## Source quotient and orders

The 13 source classes are:

```text
c000=(U,c1)  c001=O       c002=(c2,p)  c003=a
c004=d       c005=q       c006=s       c007=t
c008=u       c009=v       c010=e       c011=x       c012=y
```

The authenticated z3 parent model supplies the mirror order

```text
c000 c005 c003 c007 c004 c002 c010 c006 c001 c012 c008 c011 c009
```

and the authenticated cvc5 parent model supplies the direct order

```text
c000 c012 c008 c009 c005 c011 c001 c006 c007 c010 c002 c004 c003
```

## Normalized formulas

For each order, set

```text
B=c000=(0,0)
O=c001=(1,0)
A=c003=(1/2,sigma*r)
Q=c002=(3/2,sigma*r)
4*r^2-3=0
r>0
```

where `sigma=-1` for the z3 mirror order and `sigma=+1` for the cvc5
direct order. Both coordinates of `c004` through `c012` remain variables, so
each target formula declares 19 real variables.

Each target retains the following assertions without deleting zero or repeated
polynomials:

- all 286 strict signed-area assertions induced by its authenticated order;
- all 13 row equalities from rows T0, K1, K2, and L;
- `QO^2 != QD^2`;
- `ED^2 < EA^2`;
- the normalization modulus and positive-root assertion.

The rational SAT control is `t=1`. The UNSAT control is `t=0` together with
`t>0`. Both engines must return the required control status before target
results are accepted into the terminal record.

## Execution and trust boundary

All solver calls use the maintained PIQD HTTP SMT adapter. There is no direct
solver subprocess and no fallback transport. The default is two target workers
and 60 seconds per engine.

SAT readback is fail-closed. Only exact rational numerals are expanded to all
13 class coordinates, transformed into the authenticated rank gauge, and
checked against every original source assertion. Unsupported algebraic
readback is inconclusive. UNSAT remains a diagnostic verdict about the exact
submitted formula.

The run root is create-once and resumable. A completed terminal replay performs
no PIQD transport. Every file is content-bound through the lane checkpoint,
run manifest, source snapshots, adapter custody, launch, and terminal hashes.
