# Seven-role row-core CEGAR audit

Date: 2026-07-14

Status: **EXACT MATCH CENSUS ON BOTH PINNED SAVED SHADOWS; THE CORE OCCURS ONCE
IN `(5,5,5)` AND DOES NOT OCCUR IN `(4,5,6)`.  THE CURRENT FORMALIZED BANK
ALREADY KILLS THE SAVED `(5,5,5)` SHADOW BY A DIFFERENT SMALLER CORE.**

## Scope and bank preflight

This directory studies the eleven-equality characteristic-zero collision core
extracted in `../critical-map-geometry/`.  The input is the exact pinned file

```text
scratch/atail-force/global_count_boundary/shadows.json
SHA-256 e771d39cd7291aaf8e6adb7a7853495623e54439b2205d5fcdac4a085161064c
```

The required P97 theorem-bank preflight was rerun before treating the motif as
new.  The three exhaustive registries contain 333 metric-point-uniform
declarations; 139 conclude `False`, 130 have the supported simple metric
grammar, and none instantiate on this core, even with theorem roles allowed to
alias.  Indexed Lean searches found the existing six- and seven-point collision
families but no theorem with this equality shape.  This agrees with the more
detailed report in `../row-core-bank-match/REPORT.md`.

The saved shadows themselves were also replayed through the **current**
`_formalized_metric_core` scanner.  This is important because it is a different
question from whether the new eleven-equality shape has a direct bank match:

| profile | current formalized-bank replay |
|---|---|
| `(5,5,5)` | killed by `equality-convex-five-point-reverse`, roles `{a=4,x=2,b=0,c=10,y=5}` |
| `(4,5,6)` | no current formalized core detected |

Thus the new core is a genuine new theorem shape, but it is not needed to reject
this particular saved `(5,5,5)` assignment.  The live value of the shape would
be as a new monotone cut on future total-row assignments that escape the current
bank.

## Exact directed motif

Use seven pairwise-distinct carrier roles `A,B,C,D,E,F,G`.  A directed atom
`R(c,x)` means that `x` belongs to the chosen equal-radius row at center `c`.
The motif is

```text
B : E,F,G       C : E,A,D       A : G,B
D : E,B,A       F : C,A,G       G : E,C,D
```

These are 17 directed row-membership atoms.  Comparing the members in each
displayed row to its first member yields exactly eleven equal-distance
equations: `2+2+1+2+2+2 = 11`.  Extra row members and extra distance equalities
are allowed.  Consequently the correct matcher is an injective, non-induced
directed-subgraph matcher, not induced graph isomorphism.

The motif's directed automorphism group has size one.  This makes its role map
rigid: there is no quotient multiplicity hidden by a symmetric presentation.

The collision certificate has coordinate-free conclusion

```text
A = E or E = B.
```

Pairwise distinct carrier roles contradict either disjunct.  Role aliases are
therefore not valid CEGAR hits.  For completeness, the matcher exhaustively
also enumerates non-injective homomorphisms as diagnostics; neither pinned
shadow has one.

## Saved-shadow census

The exhaustive matcher result is:

| profile | injective embeddings | motif-automorphism orbits | alias homomorphisms |
|---|---:|---:|---:|
| `(5,5,5)` | 1 | 1 | 0 non-injective |
| `(4,5,6)` | 0 | 0 | 0 |

The unique `(5,5,5)` role map is

```text
A=4, B=1, C=2, D=5, E=0, F=8, G=10.
```

It is exactly the role map used by the Singular certificate.  The zero count on
`(4,5,6)` is not a search-budget statement: it is exhaustive for this pinned
12-vertex directed row system.  In particular, the eleven-equality cut cannot
remove the surviving saved `(4,5,6)` shadow under any relabeling.

## Exact CEGAR clause

For every injection `phi : {A,...,G} -> carrier`, add the nogood

```text
OR_{(c,x) in motif} NOT R(phi(c), phi(x)).
```

Equivalently, in a 0/1 linear encoding,

```text
SUM_{(c,x) in motif} R(phi(c), phi(x)) <= 16.
```

The 17 atoms, in canonical order, are

```text
A->B A->G
B->E B->F B->G
C->A C->D C->E
D->A D->B D->E
F->A F->C F->G
G->C G->D G->E
```

This clause is monotone and needs no exact-row exclusions: the collision theorem
uses only the asserted equalities.  However, it is suitable for a
**theorem-provenance CEGAR oracle only after the collision theorem is formalized
and build/axiom audited**.  Until then, it may be used as a scratch discovery cut
backed by the exact external characteristic-zero certificate, but it must not be
reported as a formalized-kernel exclusion.

## The surviving `(4,5,6)` boundary

The `(4,5,6)` total row system has no copy of this motif and no hit in the
current formalized scanner.  A complete 36-equality Singular run over the large
prime `32003` returns a nonunit, dimension-three ideal and reduces
`dist(0,1)^2` to zero.  This is useful **finite-field discovery evidence**, but
it is not a characteristic-zero collision proof.  The corresponding `QQ` run
timed out at 30 seconds, and bounded deletion probes did not produce a compact
verified core.  Therefore no analogous `(4,5,6)` CEGAR clause is claimed here.

`minimize_456_collision.py` preserves the fail-closed boundary: large-prime
runs only propose candidates, while a final result is emitted only after the
target membership and all retained single-deletion checks are replayed over
`QQ`.  The current bounded run does not pass that final gate.

## Validation

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/row-core-cegar/match_row_core.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python -m unittest -v \
  scratch/atail-force/row-core-cegar/test_match_row_core.py

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/row-core-cegar/replay_formalized_bank.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/row-core-bank-match/bank_match.py --check \
  certificates/p97_rvol_general_n_mining.json \
  certificates/erdos97_legacy_general_n_mining.json \
  certificates/erdos_general_theorem_p97_mining.json

PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/global_count_boundary/validator.py --check
```

All five gates pass on the pinned input.  The exact matcher result is scoped as
`EXACT_EXHAUSTIVE_FOR_THE_TWO_PINNED_SAVED_FINITE_SHADOWS_ONLY`; it is neither
an exhaustive census of all total critical maps nor a proof of K-A-PAIR.
