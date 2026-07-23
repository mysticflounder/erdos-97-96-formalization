# Card-eleven aligned-p5 exact-four checkpoint

Date: 2026-07-22

Status: **EXACT FIXED-CNF UNSAT, SOURCE-AUDITED, DRAT-VERIFIED; LEAN
SOURCE-TO-CNF/OCCURRENCE LIFT OPEN; NO SOURCE `sorry` CLOSED.**

## Result

The previously uncovered `alignedP5` constructor of
`CardElevenUniqueFourCoverage` now has a source-audited finite projection
whose exact DIMACS artifact is independently DRAT-verified UNSAT.

The full artifact has:

```text
variables:  15,192
clauses:    2,791,032
CNF SHA-256:
50a8062cb9b089cc6f3a47497face0a46ceacb5e86152ec04fc5f3c6557b9c7f
DRAT SHA-256:
6a58c8c26732122f53f1d883c44fcd9a0ddee34f501d61e24dd94605abe127f4
```

CaDiCaL returned exit `20`. `drat-trim` checked the exact CNF/proof byte pair,
returned exit `0`, and printed one standalone `s VERIFIED`. Its backward core
contains 18,821 input clauses.

This closes the solver-verdict question for that exact artifact. It does not
yet prove the source theorem in Lean.

## Source audit

The field-by-field audit in `source-map-audit/REPORT.md` found no overstrong
aligned or base hard clause.

In particular:

- the three strict first-opposite-cap vertices are all in the exact
  first-apex class;
- `AlignedInteriorFrontier.residual` preserves the retained pair and strict
  pair in the same order, not merely up to swapping;
- the second-apex deletion row omits that pair;
- the complete-radius, cyclic-order, selected-row, cap-intersection, and
  minimality implications used by the encoder all have source-valid
  mathematical producers.

The initial full formula includes a 2,106,720-clause U5 bank whose consumers
are not locally rebuilt. Clause-family ablation shows that this entire bank is
non-load-bearing here, together with the planar bank, the fixed critical
system, both minimality overlays, the shell-curvature overlay, the four seeded
Kalmanson cuts, and the retained/strict pair-identification clauses. Therefore
none of those families is required by the compact fixed-card contradiction.

## Load-bearing boundary

After removing those families, the formula remains UNSAT with 32,203 clauses.
Removing any one of the following five groups from that stripped formula makes
it SAT:

1. the three aligned-class units;
2. the displayed-cap selected-row bounds;
3. the global selected-four-row and strong-connectivity clauses;
4. the complete-radius/local metric clauses; or
5. the base order-preserving Kalmanson schema bank.

The base bank has ten cardinality-generic consumers in
`unique4-kalmanson-core-port/UniqueFourKalmansonCores.lean`. A fresh
warning-as-error Lean check confirms that all ten elaborate and that their
axiom closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

Greedy schema deletion and a compact DRAT/core extraction are recorded under
`core-audit/`. Their purpose is theorem discovery: expose the smallest
disjunction of already-checked Kalmanson occurrences that the source lift
must produce.

The greedy compact formula keeps schema indices `1, 4, 6, 9`, has 27,781
clauses, and is independently DRAT-verified. Its exact hashes are:

```text
compact CNF:
081ba956b308c643fa9e845e0340017647de405aea42e6d0601679a1267f12f4
compact DRAT:
f7008bc65433436329029c0b2f041847f5464d3a68046e6377f5a2d1a7511c72
```

`drat-trim` reports `s VERIFIED` and a 6,350-clause input core. The exact
core-to-generator map has no unmatched clauses. In particular, the checker
core uses selected-row exactness, complete-radius equalities and transports,
cyclic alternation/intersection constraints, the three aligned class units,
displayed-cap row bounds, and the four retained Kalmanson schema families.
It does **not** use selected-row strong connectivity, the retained pair, the
second-apex deleted row, the fixed critical map, either minimality overlay,
curvature, planar cuts, or U5 cuts.

## Exact remaining Lean obligation

There are two acceptable formal endpoints.

Preferred:

```text
aligned card-eleven source surface
  -> one of the compact bank's order-preserving selected-row occurrences
  -> existing Kalmanson consumer
  -> False
```

Fallback:

```text
aligned card-eleven source surface
  -> satisfying valuation of one Lean-defined compact CNF
  -> kernel-checked LRAT UNSAT
  -> False
```

The preferred endpoint avoids exposing a large generated formula on the
proof spine. The fallback is valid only after proving the source-to-valuation
theorem for every retained clause family.

Even after this fixed-card lift, the live theorem
`false_of_originalFrontierUniqueRadiusArm` remains arbitrary-cardinality and
also contains the exact-five unique-radius leaves. This checkpoint therefore
does not by itself close either live source `sorry`.

## Reproduction

- full driver: `run_aligned_p5_full_linear_cegar.py`
- full result: `aligned_p5_cegar.json`
- exact DRAT replay: `drat-verification/REPORT.md`
- source map: `source-map-audit/REPORT.md`
- family/schema reduction: `core-audit/`
