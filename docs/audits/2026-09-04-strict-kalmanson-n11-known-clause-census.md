# Strict-Kalmanson n=11 known-clause census

**Local date:** 2026-09-04

**Result:** the semantic 8,400-clause n=10 complete-Berge family is
reconstructed; the missing n=11 base bytes and UNSAT proof are not

## Main recovery

The n=10 announcement in conversation message `#10326` split its 9,280
clauses into 8,400 complete-Berge, 840 shared-pair nonalternation, and 40
complementary-arc clauses. The first count is no longer just a numerical
factorization.

The 19 six-role declarations in
`KalmansonThreeEqualitySchemas.lean`, closed under orientation-preserving
cyclic shifts of the six roles, give exactly 40 distinct full-support equality
patterns. They agree pattern-for-pattern with the exact classifier output
promoted at
`scratch/rigid221-blockerv-exact17-20260806/three-shell-classification-n6.json`.
That file has 7,337 bytes and SHA-256
`7a8bd4b51649a54c76d049e7edb7e8c77beeab575c3f7d31f0dbf328a702909f`.

The 40 patterns form eight cyclic orbits, of sizes
`2, 2, 6, 6, 6, 6, 6, 6`. Every pattern uses all six roles, so instantiating
once on each increasing six-subset creates no cross-subset duplicates:

```text
n=10: 40 * C(10,6) =  8,400
n=11: 40 * C(11,6) = 18,480
```

This authenticates the semantic no-good family and its counts. It does not
recover whether the missing producer used equality variables, direct
membership variables, or another primitive encoding, and it does not recover
the producer's byte ordering.

## Reconstructed baseline trio

The other two n=10 components also have concrete source patterns:

| family | n=10 | n=11 | source boundary |
|---|---:|---:|---|
| complete Berge | 8,400 | 18,480 | 40 full-support six-role patterns |
| shared-pair nonalternation | 840 | 1,320 | four patterns per increasing quadruple |
| complementary arcs, r=2,3 | 40 | 44 | two dihedral orbits |
| **total** | **9,280** | **19,844** | pairwise-disjoint membership clauses |

The four shared-pair patterns are the checked early-, middle-, endpoint-, and
late-pair consumers in `CapCrossingKalmanson.lean`.

For each of `r=2,3`, the complementary-arc template has a free dihedral orbit:
`2n` clauses, split into `n` rotations and `n` reflections. The generic chain
theorem supplies the canonical contradiction, and existing cyclic-shift
utilities provide the ingredients for rotation transport. The repository has
no public chirality-aware reversal transport for the reflected copies;
`ConvexCyclicOrder.reverse` remains a TODO. The 44-clause n=11 orbit count is
therefore authenticated bookkeeping, while reflected Lean proof coverage is
not promoted.

Subtracting the reconstructed baseline from the announced n=11 base gives

```text
42,504 - 19,844 = 22,660.
```

This is an arithmetic remainder under the transported baseline rules, not an
authenticated decomposition of the missing base.

## Expanded source-backed census

`KalmansonThreeEqualitySchemas.lean` also contains four-role and five-role
schemas. Instantiating all 40 unique declarations at their true arities gives

```text
4*C(n,4) + 17*C(n,5) + 19*C(n,6).
```

That broader family has 9,114 clauses at n=10 and 17,952 at n=11. It overlaps
the complete-Berge family in precisely the 19 six-role seeds: 3,990 concrete
clauses at n=10 and 8,778 at n=11. Shared-pair and complementary-arc clauses
have no overlap with either family. The distinct expanded union is therefore:

| n | raw family sum | known overlap | distinct union |
|---:|---:|---:|---:|
| 10 | 18,394 | 3,990 | 14,404 |
| 11 | 37,796 | 8,778 | 29,018 |

The difference `42,504 - 29,018 = 13,486` is also arithmetic only. The missing
producer has not authenticated that this broader mixed-arity family was part
of its base.

## Survivor check

None of the 29,018 known n=11 membership clauses occurs in the retained
strict-Kalmanson survivor. This is consistent with the exact strict metric:
the source-backed Kalmanson no-goods do not remove that row assignment. Its
separate six-role equilateral-chain motif remains the Euclidean obstruction.

## Reproduction

```bash
uv run python scripts/generate_strict_kalmanson_known_clause_census.py --n 10
uv run python scripts/generate_strict_kalmanson_known_clause_census.py --n 11
uv run pytest -q scripts/test_generate_strict_kalmanson_known_clause_census.py
uv run --with ruff ruff check \
  scripts/generate_strict_kalmanson_known_clause_census.py \
  scripts/test_generate_strict_kalmanson_known_clause_census.py
```

The focused suite pins the source inventory, classifier digest, orbit sizes,
family counts, pairwise overlaps, both arithmetic ledgers, and the zero-hit
survivor check.

## Remaining promotion gate

The original 42,504-clause base serialization, later CEGAR family definitions,
nine-role ladder scope, fixed-cardinality encoding, and solver proof remain
missing. Consequently the announced 375,144-clause SHA and case-20
`EXACT_MASTER_UNSAT` result are still unverified.
