# Profile 0034 fixed-order source QF_NRA diagnostic v1

## Scope

This PIQD-only producer asks two formula-scoped realizability questions for
hard-source profile 34. It does not establish source coverage, source
realizability, a Lean ingress, a theorem, promotion, or closure of a live proof
obligation. A terminal UNSAT result concerns only the exact submitted fixed-order
formula. A SAT result is accepted only after exact rational coordinate replay.

The immutable parent is
`scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001`.
The producer revalidates its run manifest, launch, terminal, profile result,
engine receipts, and profile source manifest before constructing a query. The
pinned profile has index 34 and SHA-256
`16765c10e871a525d6e28bb4b02028fb9504766f7cd2bcdf242f29d4fcd575fa`.

## Source quotient and fixed orders

The 13 role classes are:

```text
c000=(U,c1)  c001=O   c002=c2  c003=a   c004=d
c005=p       c006=(q,e)  c007=s  c008=t  c009=u
c010=v       c011=x   c012=y
```

Thus `c2` is absent from T0 and remains separate from every T0 support class;
the profile also keeps the source K1 and K2 rows distinct. The authenticated z3
parent model supplies the mirror order

```text
c000 c005 c007 c003 c004 c002 c006 c001 c012 c011 c010 c008 c009
```

and the authenticated cvc5 parent model supplies the direct order

```text
c000 c007 c012 c005 c008 c009 c011 c010 c001 c006 c002 c004 c003
```

## Target formulas

Each target declares both real coordinates of all 13 classes: 26 real
variables. For its fixed order `p0,...,p12`, the four gauge assertions are

```text
x_p0=0  y_p0=0  x_p1=1  y_p1=0.
```

The formula then retains:

- all 286 strict positive signed-area constraints for triples in order;
- all 13 row equalities induced by source rows T0, K1, K2, and L;
- the source radius disequality `c2O^2 != c2d^2`; and
- the source-strict inequality `ed^2 < ea^2`.

No algebraic substitution or equality deletion is applied. The positive control
is `t=1`; the negative control is `t=0` together with `t>0`. Both z3 and cvc5
must pass the controls before either target result reaches the terminal record.

## Execution and custody

All solving uses the maintained PIQD HTTP SMT adapter. The producer has no direct
solver subprocess and no fallback transport. The default per-engine timeout is
60 seconds, with at most two target workers.

The run root is create-once and resumable. A completed terminal replay performs
no PIQD transport. The checkpoint, run manifest, source snapshots, adapter
artifacts, launch, and terminal records bind their inputs by SHA-256. Unsupported
algebraic model values fail closed as inconclusive; exact rational models are
checked against the gauge, all signed areas, every row equality, the radius
disequality, and the source-strict inequality.
