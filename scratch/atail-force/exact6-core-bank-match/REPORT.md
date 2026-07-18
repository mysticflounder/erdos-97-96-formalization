# Exact-six provisional equality core: theorem-bank match audit

Date: 2026-07-18

## Result

**No existing Lean contradiction theorem or banked certificate core is an
injective equality-subcore of the provisional 15-equation exact-six core.**

The exhaustive matcher checked, at the current file snapshots:

- 231 retained 555/654 full cores (89 unit-555, 17 forced-pair-555,
  48 unit-654, 77 forced-pair-654);
- 49 independently replayed certificate-active unit kernels;
- all 23 current production equality-only `EdgeClosure` cores; and
- all 130 source-proved pure metric `False` declarations extracted
  fail-closed from the three required general-n registries.

Every group has `full_match_count = 0` in `result.json`.  In particular,
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
is included in the 130 registered pure metric declarations and does not
match.

This is a structural no-reuse result, not a proof that the provisional core is
realizable.  The separate exact-CAS calculation reports that the literal
15-equation ideal is the unit ideal.

## Matching semantics

The target is

```text
c0 ref1 -> 2,5,7
c1 ref2 -> 3,8
c2 ref3 -> 4,7,9
c3 ref4 -> 5,8
c4 ref5 -> 9
c7 ref0 -> 8,9
c8 ref1 -> 9
c9 ref0 -> 2
```

Each row is expanded into individual equalities between undirected distance
edges.  The matcher computes transitive equality closure, then searches for an
injective point-label map under which **every candidate equation** holds.
This deliberately permits equation-subset reuse and equality paths across
stored row boundaries; it is strictly more permissive than requiring a whole
candidate row to equal or lie inside one stored target row.

Smoke gates check target self-match, a proper equation-subset match, and
rejection of an eleven-role pattern into the ten target labels.

## Closest banked certificate core

The exact maximum-overlap pass for certificate-active kernels with at most
eight roles identifies `source-indexed-unit-core-654-13` as closest by matched
fraction: 8 of its 11 equations hold under

```text
0 -> 9
1 -> 2
4 -> 8
6 -> 3
7 -> 7
8 -> 0
11 -> 1
```

The exact missing delta is:

```text
dist 2 3 = dist 3 7
dist 2 3 = dist 0 3
dist 0 2 = dist 0 8
```

The underlying seven-label kernel has rows

```text
1  -> {0,6,7}
6  -> {1,7,8}
7  -> {0,4,8}
8  -> {1,4,7,11}
11 -> {1,4,6}
```

and is backed by
`unit_core_source_indexed_654_13_verification.json`.  It has no generic
arbitrary-label Lean transport wrapper, so even supplying the three missing
equalities would still require the already-identified checker/transport seam
before it could close production Lean.

## Closest existing Lean core

The nearest production equality theorem is

```text
Problem97.Census554.EqualityCore.
  not_realizes_of_sevenPointCircleNetworkCollisionCore
```

Again 8 of 11 equations hold, under

```text
O -> 0, A -> 1, B -> 7, C -> 8, U -> 2, V -> 3, W -> 9
```

Its exact missing delta is:

```text
dist 0 1 = dist 1 3
dist 1 8 = dist 2 8
dist 3 7 = dist 3 9
```

These are not consequences of the current 15-equation closure.  Therefore the
existing theorem cannot be wired as written.

## Registry boundary

The p97-rvol registry contains 133 source-proved metric-point-uniform
contradictions.  The parser accepts 130 whose explicit hypotheses consist only
of distance equalities, positive radii/distances, and point disequalities;
injectivity discharges the latter two kinds.  It rejects two declarations with
no nontrivial distance-equality requirement and one with the unsupported
inequality `dist p x ≠ r`.  The legacy and older general-theorem registries
each have three eligible metric contradictions, but none has a nontrivial
pure distance-equality interface.  Unsupported declarations are never counted
as misses.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/exact6-core-bank-match/match_core_bank.py \
  --output scratch/atail-force/exact6-core-bank-match/result.json \
  --quiet
```

`result.json` records source hashes, exact counts, every full hit (none), and
the closest exact partial witnesses.  Epistemic status:
`EXHAUSTIVE_STRUCTURAL_MATCH_NOT_LEAN_PROOF`.
