# v14 exact induced-subset audit

## Terminal result

The hash-pinned 17-class v14 survivor fails its induced ordered-Euclidean
necessary condition on a five-class subset.

- Four-class census: 2,380 SAT, 0 UNSAT, 0 UNKNOWN.
- Five-class census: 6,187 SAT, 1 UNSAT, 0 UNKNOWN.
- Smallest validated obstruction size: 5.
- Epistemic scope: exact evidence for the positive-equality induced abstraction,
  not the full CEGAR survivor formula and not Lean/kernel closure.

The initial exhaustive pass left three five-class formulas UNKNOWN.  Exact
follow-up resolved two by rational witnesses and one by an exact normalized
UNSAT schema.  Thus the combined census, rather than the initial miner's
timeout-dependent terminal field, is final.

## Five-class obstruction

The ordered quotient classes, in local order `p0,...,p4`, are:

1. class 1: `{bs,r3,e3}`;
2. class 4: `{z,be}`;
3. class 14: `{escape}`;
4. class 15: `{source}`;
5. class 16: `{a2,s3,e4}`.

The induced source equalities are 16, 22, and 29:

```text
d01 = d12 = d14
d03 = d04
```

After the sound consecutive-edge gauge `p0=(0,0)`, `p1=(1,0)`, write

```text
C(s) = ((1-s^2)/(1+s^2), 2s/(1+s^2))
p2 = p1 + C(t)
p4 = p1 + C(u)
p3 = rotate(p4, C(v)).
```

Four required positive orientations have, after removal of positive
denominators, the numerators

```text
 orient(p1,p2,p0):       2t
 orient(p3,p4,p2):      -8v(t-u)(t-v)
 orient(p4,p0,p2):      -4(t-u)
 orient(p4,p0,p3):      -8v.
```

Their positivity forces `t>0`, `u>t`, and `v<0`, hence `t-v>0`; the second
displayed numerator is then negative, a contradiction.  The half-angle chart's
omitted antipodal case is also impossible because it makes
`orient(p4,p0,p3)=0`.

Fresh Z3 and cvc5 both return `unsat` on the normalized schema.  Singular
returns zero for all four source-to-normal-form factorization identities and
the antipodal identity.

## Exhaustive census details

For four classes, 1,957 zero-equality subsets use one shared exact integer
witness, and the remaining 423 are exact-solver SAT.

For five classes:

- 3,892 zero-equality subsets use one shared exact integer witness;
- 2,290 nonempty subsets are Z3 SAT with exact model substitution;
- 3 are cvc5 SAT after the initial Z3 timeout;
- 2 initially doubly-UNKNOWN cases have exact rational witnesses replayed SAT
  by both Z3 and cvc5;
- 1 initially doubly-UNKNOWN case is the exact UNSAT schema above.

The equality-count histograms are:

```text
k=4: 0:1957, 1:391, 2:12, 3:19, 4:1
k=5: 0:3892, 1:1799, 2:243, 3:222, 4:25, 6:6, 7:1
```

## Six-class ranking

All `C(17,6)=12,376` subsets were structurally ranked; 7,211 have nonempty
induced equality sets.  The top 24 were solver-tested.  The initial pass gave
21 exact-substitution SAT and 3 UNKNOWN.  Exact follow-up resolves those three:

- rank 2, `(0,1,4,6,8,14)`: exact rational SAT, independently replayed by Z3
  and cvc5;
- rank 4, `(0,2,5,7,10,11)`: exact normalized UNSAT, independently replayed by
  Z3 and cvc5 with Singular identity checks;
- rank 5, `(0,3,5,7,10,11)`: the same local equality schema and exact normalized
  UNSAT.

Therefore the tested top 24 finish as 22 SAT, 2 UNSAT, 0 UNKNOWN.  These
six-class obstructions are secondary because the five-class obstruction is
strictly smaller.

## Reproduction

From the repository root:

```bash
uv run --with z3-solver python \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v14-exact-subset-mining/resolve_v14_exact_remaining.py

z3 -smt2 \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v14-exact-subset-mining/five-q1-4-14-15-16-normalized-unsat-schema.smt2

cvc5 --lang smt2 --nl-cov \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v14-exact-subset-mining/five-q1-4-14-15-16-normalized-unsat-schema.smt2

Singular \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v14-exact-subset-mining/normalized-schema-identities.sing
```

The two solver commands must print `unsat`.  Every labeled Singular remainder
must be `0`.

## Trust boundary

The source is an `ALIVE` CEGAR artifact, but this audit uses only its 34
recorded positive quotient equalities and the induced strict cyclic order.
Pinned false-row disequalities and other global facts are omitted.  An UNSAT
result is therefore a sound contradiction to a necessary induced realization
of this particular hash-pinned survivor; it is not a universal quotient
theorem, a proof of the production publish target, or a Lean/kernel proof.
