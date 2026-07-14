# Five-row UNIT-core synthesis

## Result

The four row-count-five `CROSSCHECKED_UNIT` cores do **not** collapse to one
common distance-equality motif.  They share an equilateral anchor hinge, but
their tail contradictions are four different role contracts.

The exact computation in `five_row_unit_core_analysis.json` starts with all 30
pairwise equality generators supplied by each five-row core.  Eight
deterministic deletion orders use Singular over `QQ`; every retained best
subsystem is independently `UNIT` in Singular and msolve under forward and
reverse variable orders.  The best observed equality counts are:

| source | retained equalities | active theorem roles |
|---|---:|---:|
| shard 2, core 0 | 9 | 6 |
| shard 3, core 0 | 7 | 5 |
| shard 3, core 1 | 9 | 6 |
| shard 6, core 0 | 11 | 7 |

The chosen best trial for every core had no deletion timeout.  Thus each
retained subsystem is deletion-irredundant within the 30 supplied pairwise
generators.  The run does **not** prove that its observed count is a global
minimum over all subsets.

## The four collision contracts

In every display below the exact normalized ideal is `UNIT` under `A != B`, so
the coordinate-free theorem conclusion should be `A = B`.

### Shard 2, core 0: six-point hinge-tail collision

Use `(A,B,C,D,H,T) = (0,1,2,3,5,9)`:

```text
AB = AD = AH
BA = BC = BH
CA = CD = CT
DB = DH = DT
HC = HT
```

This is nine independent displayed equalities.

### Shard 3, core 0: five-point hinge-cycle collision

Use `(A,B,C,D,H) = (0,1,2,3,5)`:

```text
AB = AD = AH
BA = BC = BH
CA = CD
DB = DH
HC = HD
```

This is the smallest observed core: seven equalities on five points.

### Shard 3, core 1: six-point double-spoke collision

Use `(A,B,C,L,H,R) = (0,1,2,4,5,6)`:

```text
AB = AL = AH
BA = BC = BH = BR
LB = LC
HC = HR
RA = RC = RL
```

This is nine equalities.

### Shard 6, core 0: seven-point closed-tail collision

Use `(A,B,L,M,H,R,T) = (0,1,3,4,5,6,7)`:

```text
AB = AL = AM = AH
BA = BH = BR
LB = LH = LT
HM = HR = HT
TA = TM = TR
```

This is eleven equalities.

## No multi-core role contract

For each retained subsystem, the analysis exhausts assignments of its theorem
roles into each of the four full row closures.  Roles may alias; only the two
conclusion anchors are required to remain different.  The exact coverage
matrix is diagonal:

| candidate theorem from | shard 2/core 0 | shard 3/core 0 | shard 3/core 1 | shard 6/core 0 |
|---|---:|---:|---:|---:|
| shard 2/core 0, 9 eq | yes | no | no | no |
| shard 3/core 0, 7 eq | no | yes | no | no |
| shard 3/core 1, 9 eq | no | no | yes | no |
| shard 6/core 0, 11 eq | no | no | no | yes |

Therefore no one of the four new concrete collision theorems covers another
core.  A theorem whose hypothesis is a four-way disjunction would only package
four proofs; it would not expose a common mathematical obstruction.

## What is genuinely common

All four full cores contain the two anchor rows

```text
center A: {B, ..., H}
center B: {A, ..., H}.
```

Consequently `AB = AH` and `BA = BH`.  Under `A != B`, normalizing `A` and `B`
to `(0,0)` and `(1,0)` makes `A,B,H` an equilateral hinge; in squared
coordinates this gives `2 * H.x = 1` and `4 * H.y^2 = 3`.  This normalization
spine can be shared by four Lean proofs.  It does not imply any of the four
tail contradictions by itself.

The honest implementation choices are therefore:

1. one reusable equilateral-hinge normalization helper plus four distinct
   collision consumers; or
2. a generic finite polynomial-certificate checker instantiated four times.

The second option is common infrastructure, not a single new geometric
theorem.  The seven-equality five-point consumer is the cheapest first theorem
if a prevalence measurement shows that its motif recurs.

## Theorem-bank preflight

The three required exhaustive registries were scanned with theorem-role
aliasing allowed:

```text
333 metric-point-uniform declarations
139 declarations concluding False
130 declarations parsed by the supported simple-metric grammar
0 matches for each of the four subjects
```

The nine skipped `False` declarations lie outside that narrow grammar, so this
registry result is exact only for the 130 parsed declarations.  Independently,
the current build-gated `formalized_structural_oracle` catalog validates and
all 19 eligible unordered production detectors return no hit on each full
core.  Indexed Lean searches for the exact five-point hinge-cycle shape found
the existing seven-point/five-circle, six-row-anchor, and circle-chain
families, but no theorem with this role contract.

The preflight covered:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora via `nthdegree docs search --lean`.

## Scope

The algebraic implication behind any subsequently proved collision theorem
would be a uniform Euclidean theorem.  The **discovery evidence here is not**:

- the four inputs are fixed-placement card-12 finite shadows;
- the search is not exhaustive over the live row system;
- no live placement/row producer is proved;
- no Lean collision consumer is emitted by this analysis; and
- this closes no K-A-PAIR or other named `sorry` by itself.

Reproduce the checkpoint with:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/second_center_query/analyze_five_row_unit_cores.py \
  --trials 8 --workers 4 --timeout-seconds 12
```

Pinned source SHA-256:
`fd134391cae56056ed0b77c61b2de49bd287b078d6d0693bf458141012ef7187`.
Analysis checkpoint SHA-256:
`e4e0c280b505efddb34de83af464c25f1c1b5e12f6fd34840f473ddf97f3eea6`.
