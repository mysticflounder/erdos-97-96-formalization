# Exact-five card-13 rank-instance ingress

Status: **source-clean and Werror-validated**. This directory supplies the
remaining complete-class and unique-K4 rank assertions from the audited
direct-source encoding. It does not itself contain the terminal LRAT
contradiction.

## Generated coverage

- Complete-class inequalities: source indices `[44232, 45288)`, 1,056
  assertions, 17 chunks.
  - SHA-256 of normalized source s-expressions:
    `bd4f3de59902a490bd2aedacda0652975cf58127c92fab1eb64fed6c82b5646c`.
- Unique-K4 second-apex inequalities: `[45288, 45783)`, 495 assertions.
  - SHA-256:
    `c339cc24684de6dec5e77cced381e7028a0d95349c5b8fc567241b45ee211f7e`.
- Unique-K4 first-apex inequalities: `[45783, 46278)`, 495 assertions.
  - SHA-256:
    `2b0d2825cc934dafb811ed4501aacb391945dd1ff9e91b733964fc221822eb24`.
- Unique-K4 actual-critical inequalities: `[46278, 52713)`, 6,435
  assertions.
  - SHA-256:
    `7a04a5805d01bd83c323c1d35970741559e9541220bc4cc238c38646c06a74c5`.
- Total unique-K4 coverage: 7,425 assertions in 117 chunks.

Both generators reconstruct the expected formulas independently, compare the
complete normalized s-expression stream against both audited source orbits,
and abort before writing unless the counts, source ranges, and hashes match.
The two orbit streams are identical for both generated families.

## Source fidelity

`RankSourceAdapters.lean` proves each Boolean assertion from the geometric
source packet. The actual-critical guard uses `actualBlockerImageBit`, whose
thirteen disjuncts are the actual values of
`blockerAt (directSourceBlockers T)`; it does not choose or reassign blocker
indices.

The public ingress endpoint is:

```lean
canonicalRankAssertions P C hcard hdistinct : CanonicalRankAssertions P C
```

Its arguments exactly match the generic `P`, `C`, card-13, and
distinct-radius data available inside either direct or mirror callback of the
canonical distinct-radius dispatcher. The packet contains:

- `completeClass : CanonicalCompleteClassAssertions P C`;
- `uniqueK4 : CanonicalUniqueK4Assertions P C`.

The final certified endpoint can therefore consume both families without
reopening generated chunks.

## Validation

- All 17 complete-class chunks compile with `-DwarningAsError=true`.
- All 117 unique-K4 chunks compile with `-DwarningAsError=true`.
- Both generated coordinators and `CanonicalRankAssertions.lean` compile with
  `-DwarningAsError=true`.
- A source scan finds no `sorry`, `admit`, `axiom`, or `unsafe` declaration in
  the Lean files in this directory.
- The coordinator axiom audits report only:
  `propext`, `Classical.choice`, and `Quot.sound`.

## Remaining boundary

This checkpoint proves source ingress for the audited ranges. Closure still
requires a checked certificate endpoint that combines these assertions with
the rest of the encoded stream and derives `False` for each canonical orbit.
