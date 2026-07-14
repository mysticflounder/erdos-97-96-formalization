# Card-12 second-center named-placement census

This directory exhausts the **placement-level** surface admitted by the current
`second_center_query` card-12 preconditions for profiles `(4,5,6)` and
`(5,5,5)`.  It then quotients by every verified size-preserving cyclic carrier
automorphism.  This is authorized parallel closure research and does not edit
the source query or shared Lean files.

## Result

| profile | raw named placements | carrier automorphisms | orbits / representatives | orbit sizes |
|---|---:|---:|---:|---|
| `(4,5,6)` | 253,302 | 1 | 253,302 | 253,302 of size 1 |
| `(5,5,5)` | 683,424 | 6 | 113,904 | 113,904 of size 6 |
| total | 936,726 | — | 367,206 | — |

The unequal profile has no nonidentity cyclic automorphism preserving all
three cap sizes.  The equal profile has the expected six-element dihedral
action: rotations by `0,4,8` positions in the 12-point hull order and three
reflections.  Its action on admitted named placements is free.  Burnside gives

```text
(683424 + 0 + 0 + 0 + 0 + 0) / 6 = 113904.
```

For `(4,5,6)`, the two ordered large-cap-role counts are:

```text
surplus O1, second O2: 111006
surplus O2, second O1: 142296
```

For `(5,5,5)`, all six ordered choices of distinct surplus/second caps contain
113,904 raw placements.  The detailed counts by `p`, fixed-point counts,
automorphism maps, and orbit histograms are in `checkpoint.json`.

## What “admitted placement” means

A record consists of ordered cap roles plus six fixed named roles:

```text
(surplus_cap, second_large_cap, p, q, t1, t2, t3, u).
```

The census checks exactly these current placement gates:

- the six carrier labels are distinct;
- `{q,t1,t2,t3}` is a current `PROVEN_ROWS`-admissible four-point class at
  center `p`;
- the surplus and second-large caps are distinct and both have size at least
  five;
- `q` is in the strict interior of the surplus cap;
- the current source-row choice domain is nonempty for `q,t1,t3,u`;
- every closed cap containing `p` has at least two dangerous labels outside
  it, matching the source validator’s Q-C well-formedness assertion; and
- the current no-M44 profile-size consequence holds.

The `t2` supplied row is the dangerous row centered at `p`, just as in
`second_center_query`.  Named roles are not permuted by the quotient.  Carrier
automorphisms transport the value of each role and the two declared cap values;
the semantic “surplus” and “second-large” fields remain respectively surplus
and second-large.

## Verified quotient

The producer constructs all rotations and reflections of the concrete hull
order, then retains exactly those whose induced permutation of Moser apices is
in `multi_center_census.allowed_profile_perms` and whose closed caps and strict
interiors map exactly through `cap_image`.

For every retained map it verifies:

- bijectivity and rotation/reflection form;
- identity, group closure, and inverses;
- equality of the entire local `(center,support)` candidate domain after
  transport;
- admission-predicate invariance on every one of the 936,726 raw placements;
- Burnside’s orbit count; and
- minimality and admission of every saved representative.

`validate_placement_census.py` is independent of the producer’s enumeration
order.  It loops over ordered `(q,t1,t2,t3)` tuples first, reconstructs the
automorphisms from allowed Moser permutations, rebuilds all orbit sets, and
compares them with the saved representative arrays.  It also confirms that the
two historical `second_center_query.CASE_SEEDS` are covered; their representative
codes are `15038978` for `(4,5,6)` and `3051845` for `(5,5,5)`.

## Representative encoding

All 367,206 canonical representatives are stored in `representatives.json` as
compact integers.  The mixed-radix digits, most significant first, are

```text
surplus cap (base 3), second cap (base 3),
p,q,t1,t2,t3,u (six base-12 digits).
```

The cap digit order is `S,O1,O2`.  `placement_census.py` provides exact encode
and decode functions.  The representative file is 3.0 MiB and has SHA256

```text
1b19b5521144ab6957b6dd3764dc90162dcbb8dd30c6ffbcd7e2c4bca55cd648
```

The per-profile representative-list hashes are:

```text
(4,5,6): 16dde5cec0b906c48326e196ac941dad53054c105de13ec7284eb84eea5cb242
(5,5,5): c9cd57ce9363f4c51765128579771dad6aa751af5f15506f753a10ae9e5b61d5
```

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_placement_census/placement_census.py --check

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_placement_census/validate_placement_census.py

UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_placement_census/test_placement_census.py
```

Regenerate the checkpoint and representative file only after auditing source
hash drift:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/second_center_placement_census/placement_census.py --write
```

The producer is deterministically bounded to fewer than one million raw
placements per profile.  It makes no solver or network calls.

## Epistemic boundary

Status is `EXACT_PLACEMENT_SURFACE_ONLY`.  The census does **not** run the
`second_center_query` row-system DFS for each representative.  A representative
therefore asserts neither a compatible supplied/global/critical row system nor
SAT/UNSAT, and still less a Euclidean realization.

Metric equalities and disequalities, strict convexity, orientation, MEC and
non-obtuse geometry, arbitrary bisector hits, full live-data fields, Q-A/Q-E,
card 11, and the shared-radius/same-cap producer all remain omitted.  The full
fail-closed list is in `manifest.json`.  No count here closes a live `sorry` or
establishes target faithfulness.
