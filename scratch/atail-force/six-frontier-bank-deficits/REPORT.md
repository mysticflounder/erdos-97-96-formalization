# Six-frontier theorem-bank deficit audit

Status: **EXACT SYNTACTIC / METRIC-CLOSURE ANALYSIS**.  This report proves no
producer theorem, no Euclidean realization statement, and no K-A-PAIR closure.
The six inputs are the smallest `CROSSCHECKED_UNIT` frontiers, not certified
deletion-minimal cores.

## Result

The scan finds **no exact simple metric-bank match on any of the six
frontiers**.  Thus no registry theorem can be wired using only the retained row
equalities and parsed side conditions as written.

There are deficit-one near-matches on every frontier.  The enumeration unit is
a theorem plus a concrete missing equality, canonical theorem-hypothesis
partition, and source-order atomic-deficit signature.  Equivalent raw role
assignments are counted in each record rather than emitted repeatedly.  All
101 reported representative mappings replay through a fresh equality closure.

| shard | rows | exact theorems | deficit-one theorems | deficit signatures |
|---:|---:|---:|---:|---:|
| 0 | 7 | 0 | 22 | 27 |
| 1 | 7 | 0 | 1 | 3 |
| 2 | 8 | 0 | 1 | 1 |
| 3 | 9 | 0 | 3 | 4 |
| 16 | 9 | 0 | 21 | 55 |
| 20 | 8 | 0 | 3 | 11 |

The only consumer schema with a one-class-join match on all six is

```text
Problem97.u5_qcritical_exact_selected_mid_aux_qcritical_collision_metric_incompatibility
```

Its hypotheses contain one shared scalar radius.  On each frontier the mapped
radius edges occupy exactly two current distance classes; one new equality
between those classes makes the whole theorem applicable.  This is a common
**consumer normal form**, not a common proved producer.

The useful fixed-slot specialization is narrower.  A mapping whose sole
source-order missing atom is

```text
ht₁q : dist t₁ q = r
```

exists on shards `0,1,2,16,20`, but not shard `3`.  Each of those five shards
has a representative for which the missing equality is not already excluded
by a retained complete row.  Therefore a uniform `ht₁q`/apex-bisector producer
still covers exactly five of six frontiers, agreeing with the finalized
fresh-MARCO report.

Shard `3` has two different one-class-join maps for the same consumer:

1. `(p,q,t₁,t₂,d) = (2,1,0,9,5)` splits the six radius hypotheses `4+2`;
   joining `dist(0,1)` and `dist(0,9)` completes the class.  The older
   source-order star sees two missing atoms, `ht₁t₂` and `ht₂d`.
2. `(p,q,t₁,t₂,d) = (5,0,7,8,9)` splits them `1+5`, with `hpq` isolated;
   joining `dist(0,5)` and `dist(0,7)` completes the class.  Since the older
   star is rooted at `hpq`, it sees five missing atoms.

Both shard-3 class joins are marked off-radius by retained complete-row data.
Consequently the six-of-six observation does not supply one fixed geometric
edge producer: it would require a more abstract, selection-dependent theorem
saying that the two radius classes coincide.  The concrete producer target
identified by the older scan remains five-of-six.

## Reconciliation with `fresh-continuation-marco`

There is no source or role-aliasing discrepancy.  The two scans use different
notions of an “atomic” shared-radius deficit:

- `fresh-continuation-marco/deficit_one_scan.py` turns
  `dist eᵢ = r` into a source-order star rooted at the first radius edge and
  asks that exactly one star comparison fail;
- this audit asks how many equality joins are needed between the current
  distance-equivalence classes, independently of the chosen star basis.

For a `4+2` or `1+5` split, one class join suffices even though two or five
star edges fail.  The checkpoint records both numbers for every mapping.
Accordingly:

- invariant one-class-join coverage of the recurring U5 consumer is `6/6`;
- source-order-star deficit-one coverage is `5/6`; and
- there is no theorem with source-order-star deficit one on all six.

The shard-3 regression test fixes both injective role maps and requires star
deficit counts `{2,5}`, so this distinction cannot silently drift.

## `u1TwoLargeCapObstruction`

The U1 obstruction has no exact match.  It is one equality short only on
shards `0` and `16`.

The apex rows in every source shadow are normalized as center `1` (first apex)
and center `2` (second apex).  Under this normalization the canonical
apex-edge completion on both relevant shards is

```text
dist(1,2) = dist(1,10).
```

- On shard `0`, roles `(a,c,d,e,f)=(9,2,1,7,10)` identify this as theorem
  hypothesis `h4 : dist d c = dist d f`.
- On shard `16`, roles `(a,c,d,e,f)=(2,1,10,5,6)` identify the same geometric
  equality as theorem hypothesis `h1 : dist c a = dist c d`.

Thus `h4`/`h5` numbering is not invariant under the role relabeling.  The
stable description is: extend the first-apex row at center `1` from the
apex-apex edge `(1,2)` to second-strict-pair endpoint `10`.  The exhaustive
scan also finds a secondary shard-16 `h5` map,
`dist(5,2)=dist(5,10)`, but it is not the two-apex-row normalization and does
not occur on the other fronts.

All three U1 completion signatures are flagged by the complete-row
off-radius relation in their fixed shadows.  This is consistent with the
existing equality-or-deletion-survival normal form: it does not manufacture a
live equality producer.

Therefore `u1TwoLargeCapObstruction` covers only two of six frontiers after
one equality; it is not the common producer/consumer route.

## Grammar and evidence boundary

The three required JSON registries contain 136 deduplicated
metric-point-uniform `False` declarations.  The matcher parses all 131 simple
metric kernels, including:

- direct distance equalities;
- shared scalar-radius equalities;
- point inequalities;
- positive distances and positive radii; and
- distance/distance and distance/radius inequalities.

Aliases are allowed exactly when the theorem permits them.  Positivity and
point inequalities reject forbidden aliases.  A proposed missing equality is
also rejected if it equates a zero distance to a distance between two distinct
frontier labels.  Complete-row off-radius facts are used to discharge parsed
inequality hypotheses and are recorded, rather than hidden, when they oppose a
proposed completion.

The five skipped declarations are the two opaque packet wrappers and three
nonmetric Radon consumers.  See `BANK_PREFLIGHT.md` for the registry and
indexed-corpus searches.

Registry statements marked source-proved remain source-census evidence until
the chosen consumer is imported, freshly elaborated, and axiom-audited.  No
such import or Lean production change is part of this scratch audit.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/six-frontier-bank-deficits/bank_deficits.py --check

UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python -m unittest -v \
  scratch/atail-force/six-frontier-bank-deficits/test_bank_deficits.py
```

The first command verifies every pinned input, rebuilds the full checkpoint,
compares it byte-for-byte, and independently replays all 101 reported
deficit-one representatives.  The focused test suite has four passing tests.

Pinned output hashes:

```text
348e5d988df5f7def6cde6acd9056d59acd553f0327df5d125089c382ae68712  bank_deficits.py
be2f8bb836867c271748ba48408524c39df061e684c2f2ef849f57f742508a7a  checkpoint.json
88b6a192b7de7775006b80114241fd7fbe8328fc4d9024cb68e1f25603777646  test_bank_deficits.py
524af28494a489a3912274b4cd893aef82a41ce6842b00dc7712ed8a04d9e65b  BANK_PREFLIGHT.md
```

The checkpoint itself pins the six-frontier analysis, source shadow,
frontier bank, prior star-based scan/checkpoint, generalized matcher source,
and all three registry JSON files.
