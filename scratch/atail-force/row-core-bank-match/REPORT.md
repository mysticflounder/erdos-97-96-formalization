# Fixed-shadow row-core bank match

## Result

There is no direct theorem-bank match for the fixed `(5,5,5)` eleven-equality
core.  This remains true when theorem roles are allowed to alias.

The core uses labels `{0,1,2,4,5,8,10}` and rows

```text
1  : 0 = 8 = 10
2  : 0 = 4 = 5
4  : 1 = 10
5  : 0 = 1 = 4
8  : 2 = 4 = 10
10 : 0 = 2 = 5
```

Its per-center equality-count multiset is `[2,2,2,2,2,1]`.  In particular,
the two existing seven-point six-circle families have multiset
`[3,2,2,2,1,1]`, and neither embeds into this equality closure.

Two independent checks support the no-match result:

1. The current build-gated `formalized_structural_oracle` catalog validates,
   and all 19 eligible unordered family detectors return `None` on the core.
2. `bank_match.py` scans the three required exhaustive registries.  Of 333
   metric-point-uniform declarations, 139 conclude `False`; 130 have the
   supported simple metric grammar, and none instantiate.  Its positive and
   negative matcher smoke tests pass.

Reproduce the live-oracle check with

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python -c \
  'from census.census_554 import formalized_structural_oracle as o; \
o.validate_catalog_manifest(o.catalog_manifest(), require_passed=True); \
p={1:[0,8,10],2:[0,4,5],4:[1,10],5:[0,1,4],8:[2,4,10],10:[0,2,5]}; \
hits=[f.stage for f in o.UNORDERED_FAMILIES \
if o.detect_stage(p,f.stage) is not None]; \
print({"catalog":"validated","unordered_families":len(o.UNORDERED_FAMILIES),"hits":hits})'
```

It prints

```text
{'catalog': 'validated', 'unordered_families': 19, 'hits': []}
```

The nine unparsed `False` declarations do not hide a candidate: one requires
an off-radius inequality, two are opaque packet wrappers whose direct metric
kernels are among the parsed declarations, and six are duplicated legacy
Radon statements with no distance hypotheses.

Reproduce the registry check with

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/row-core-bank-match/bank_match.py --check \
  certificates/p97_rvol_general_n_mining.json \
  certificates/erdos97_legacy_general_n_mining.json \
  certificates/erdos_general_theorem_p97_mining.json
```

The required indexed Lean searches likewise found coordinate helpers and
`u1TwoLargeCapObstruction`, but no collision theorem with this equality shape.
The latter theorem is parsed by the matcher and does not instantiate.

The 194 non-`False` metric declarations were also classified by name and
statement.  The only generic point-equality producer is
`eq_of_equidistant_three_noncollinear`; it requires a noncollinearity side
condition and two centers equidistant from the same three points.  This core
has neither input (its chosen row equality classes have no cross-center
overlap), so it does not provide a smaller route.

## Best standalone Lean statement

Use the relabeling

```text
A = p4, E = p0, B = p1, C = p2, D = p5, F = p8, G = p10.
```

The honest coordinate-free conclusion is a two-collision alternative:

```lean
theorem seven_point_six_circle_collision_c
    {A B C D E F G : ℝ²}
    (hBE_BF : dist B E = dist B F)
    (hBE_BG : dist B E = dist B G)
    (hCE_CA : dist C E = dist C A)
    (hCE_CD : dist C E = dist C D)
    (hAG_AB : dist A G = dist A B)
    (hDE_DB : dist D E = dist D B)
    (hDE_DA : dist D E = dist D A)
    (hFC_FA : dist F C = dist F A)
    (hFC_FG : dist F C = dist F G)
    (hGE_GC : dist G E = dist G C)
    (hGE_GD : dist G E = dist G D) :
    A = E ∨ E = B
```

Proof shape: split on `A = E`.  In the nondegenerate branch, normalize `A,E`
with `normSim`, convert the eleven distance equalities to polynomial zeros,
and apply the ideal-membership certificate for

```text
(B 0 - 1)^2 + (B 1)^2 = 0.
```

Nonnegativity then gives the normalized `B = (1,0)`, hence `E = B` by
injectivity of the similarity.  The corresponding equality-closure structure
should record both `hAE : A ≠ E` and `hEB : E ≠ B`; `Realizes.injective`
contradicts either disjunct.  A normalized theorem returning `False` would
overstate the algebra: the computed ideal is nonunit and proves a collision,
not inconsistency without the distinctness conditions.

## Certificate production route

There is no reusable small theorem, but there is a reusable generator
architecture:

```text
scratch/atail-force/second_center_query/
  emit_shard15_parallel_lean_certificate.py
  emit_shard15_lean_certificate.py
  plan_shard15_certificate_stages.py
  emit_shard15_split_lean_certificate.py
```

`emit_shard15_parallel_lean_certificate.py` generated the production
`SevenPointSixCircleCollisionBCertificate` modules from an 85,774-character
optimized Singular lift.  Generalize it from a UNIT target to an arbitrary
target polynomial:

1. read the eleven generators, lift coefficients, and target;
2. verify `sum c_i * p_i = target` exactly in SymPy;
3. clear denominators and emit independently buildable summand shards;
4. combine them into `D * target = 0`, discharge `D != 0`, and conclude
   `target = 0`;
5. let the geometric wrapper turn squared-distance zero into point equality.

The present raw lift is 529,234 coefficient characters, so first scan
normalization-anchor choices and Singular variable orders, then materialize
the smallest exact replay.  This is the same optimization that reduced the
existing B-family lift to 85,774 characters.  The producer must remain an
ideal-membership collision certificate; a Rabinowitsch UNIT certificate would
change the theorem's dependency shape.
