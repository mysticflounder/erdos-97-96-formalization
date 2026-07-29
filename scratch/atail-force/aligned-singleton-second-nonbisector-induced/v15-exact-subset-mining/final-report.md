# v15 exact induced-subset audit

## Terminal result

The hash-pinned 18-class v15 survivor fails its induced ordered-Euclidean
necessary condition on one deletion-minimal five-class core.

- Four-class census: 3,060 SAT, 0 UNSAT, 0 UNKNOWN.
- Five-class census: 8,567 SAT, 1 UNSAT, 0 UNKNOWN.
- Smallest validated obstruction size: 5.
- Six-class scan: not run, because a five-class obstruction is already
  subset-minimal.
- Epistemic scope: exact Z3/cvc5/Singular evidence for the positive-equality
  induced abstraction, not the full CEGAR formula and not Lean/kernel closure.

The initial exhaustive five-class pass had 5,563 shared exact-integer-witness
SAT cases, 2,997 exact-substitution Z3 SAT cases, four cvc5 SAT fallbacks,
and four doubly-UNKNOWN formulas. A bounded long replay gave exact-substitution
Z3 SAT models for three of those four. The remaining formula was reduced to
the exact normalized UNSAT schema below. Thus the combined census has no
UNKNOWN.

## Deletion-minimal five-class core

In increasing quotient order, set

```text
W = class 4  = {a0}
F = class 6  = {r1,z4,y,e3}
P = class 9  = {source}
X = class 10 = {r2,b1,s3,z2}
Z = class 15 = {bs,r4}
```

The exact core order literals are

```text
orient(W,F,X) > 0
orient(W,F,Z) > 0
orient(F,P,X) > 0
orient(P,X,Z) > 0
orient(X,Z,W) > 0
```

and its three source row equalities are

```text
source 18: d(4,6)  = d(4,10)   i.e. WF = WX
source 19: d(4,6)  = d(4,15)   i.e. WF = WZ
source 36: d(9,15) = d(10,15)  i.e. PZ = XZ
```

The induced source equality 23, `d(4,10)=d(4,15)`, is redundant and is omitted.
Deleting any one of the five order literals or any one of the three displayed
equalities gives a Z3 SAT model that passes exact model substitution. The full
four-class census is SAT, so the core is also minimal by vertex subset.

## Exact normalized contradiction

Use the sound gauge `W=(0,0)`, `F=(1,0)`. The first two equalities put `X` and
`Z` on the unit circle centered at `W`; write them in rational half-angle
coordinates `X=C(t)` and `Z=C(u)`. The last equality lets us write
`P=Z+rotate_C(v)(X-Z)`. The omitted antipodal charts force one of the displayed
strict orientations to vanish, so they cannot realize the core.

After clearing positive denominators, the five core orientations have factors

```text
orient(W,F,X):             2t
orient(W,F,Z):             2u
orient(X,Z,W):            -2(t-u)(tu+1)
orient(P,X,Z):            -8v(t-u)^2
orient(F,P,X):             8tv(t-u)(uv-1)
```

Positivity gives `t>0`, `u>0`, then `t<u`, then `v<0`. Hence `uv-1<0`, while
the first four sign facts make the final displayed factor negative, a
contradiction.

Fresh Z3 and cvc5 both print `unsat` on
`five-q4-6-9-10-15-normalized-unsat-schema.smt2`. Singular prints zero for
the three source-distance parameterization identities and all five
orientation-factor identities. The unreduced direct coordinate formula itself
remains fail-closed UNKNOWN at the 120-second solver bounds; only the
independently checked exact normalization upgrades the case to UNSAT.

## Registered theorem-bank match

This is an exact match, not a new pattern:

```text
Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw
```

The registered roles are precisely the strict convex order `W,F,P,X,Z` with
`WF=WX=WZ` and `PZ=XZ`. The registry is
`docs/general-n-certificate-bank-mining-2026-07-09.md`, section
“555/654 five-point order consumer,” and the source is
`lean/Erdos9796Proof/P97/Census554/FivePointCircleIsoscelesOrderBridge.lean`.
The required single agentic Lean-corpus query also returned
`false_of_core_of_ccw`; its transcript is in `reflection-lean-search.txt`.

## Reproduction

From the repository root:

```bash
uv run --with z3-solver python \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v15-exact-subset-mining/resolve_v15_five.py

uv run --with z3-solver python \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v15-exact-subset-mining/validate_v15_core.py

z3 -smt2 \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v15-exact-subset-mining/five-q4-6-9-10-15-normalized-unsat-schema.smt2

cvc5 --lang smt2 --nl-cov \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v15-exact-subset-mining/five-q4-6-9-10-15-normalized-unsat-schema.smt2

Singular \
  scratch/atail-force/aligned-singleton-second-nonbisector-induced/v15-exact-subset-mining/five-q4-6-9-10-15-identities.sing
```

## Trust boundary

The source is an `ALIVE` CEGAR artifact, but this audit uses only its 38
recorded positive quotient equalities and the induced strict cyclic order.
Pinned false-row disequalities and other global facts are omitted. The UNSAT
result therefore contradicts a necessary induced realization of this
particular hash-pinned survivor. It does not prove that the three row
equalities are universal consequences of the quotient constraints, close a
production publish target, or add a new Lean/kernel theorem.
