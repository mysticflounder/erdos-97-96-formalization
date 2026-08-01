# Exact-11 common-center full-radius v7

## Terminal finite result

V7 preserves the exact v6 prefix and adds the complete global two-center
cyclic-alternation family:

- variables: 49,357 (no new variables);
- clauses: 1,370,778;
- v6 prefix: 1,180,698 clauses, byte-for-byte reconstructed;
- v7 suffix: 190,080 ternary clauses.

All four canonical shell formulas are UNSAT, and every exact DIMACS/DRAT pair
was independently replayed by `drat-trim`:

| case | solve seconds | proof bytes | CNF SHA-256 | proof SHA-256 | replay |
|---|---:|---:|---|---|---|
| `s2_o0` | 12.305 | 29,451,925 | `94bc1ddb59166cc86e146c036ab7229a7eea878c28579e2df0520eec1b2a892d` | `0735adbd23bd5e3240018b946e2e2cdf74ce6b6caa9c10acfa4f560f5d0064df` | VERIFIED |
| `s2_o9` | 17.262 | 35,174,655 | `bdd863e9d146cd64693d9c201f770b64b43082d34598d554434abcfd1bc50b57` | `25ae966a5c3ec7a3f84b7514d67a50f4805ab4f13c27278baa1d61845a1d84b8` | VERIFIED |
| `s3_o0` | 69.190 | 59,273,854 | `062a4dc3659894758daf047119207f4889d5372d5a11d06c99a5b0ed656561d8` | `eb31f6d13e5910d0dc0eed9264535a858012e75d2d527a7c37b1667ee658af18` | VERIFIED |
| `s3_o9` | 138.318 | 131,826,852 | `764ad8c855afde936150fd0bc422bc315b75311286fa15cfb3cb8dff23b739ee` | `b45483f94deca4e66a8ea8c8208ba7200eb330d834df4aad605678db6761c2a3` | VERIFIED |

The run was serial, with at most one CaDiCaL process.  The first `s2_o9`
replay exceeded its initial 600-second verifier allowance; replaying the
already-written exact artifacts with an 1,800-second allowance succeeded.
The untouched `s3` cases were then run through the exact case selector.  The
finalizer hash-checked and merged all four result records without rebuilding
or overwriting the preserved `s2` artifacts.

Replay core statistics:

| case | input clauses in core | lemmas in core / parsed | resolution steps | RAT lemmas |
|---|---:|---:|---:|---:|
| `s2_o0` | 81,253 | 56,184 / 734,681 | 3,078,796 | 15,910 |
| `s2_o9` | 110,920 | 90,540 / 821,487 | 6,478,940 | 23,253 |
| `s3_o0` | 147,827 | 193,146 / 1,040,637 | 26,588,406 | 36,456 |
| `s3_o9` | 203,437 | 509,038 / 1,864,691 | 83,188,616 | 62,113 |

The independent verifier reconstructs the v6 prefix and all v7 clauses
without importing the encoder.  The self-test checks the exact v6 prefix,
rejects a v7-clause mutation, and compares the Boolean/order predicate on
1,152 assignments.

## Lean consumer audit

Exactly one fresh agentic Lean-corpus search was run after all four replays:

```text
nthdegree docs search --lean --agentic "card eleven fixed labelled four shell cases source-to-valuation adapter certificate consumer boundary order global distance equality" --limit 20
```

No second agentic search was run.  The result pointed to the following
locally verified reusable pieces:

1. `ATailFiniteN11ExactFiveCommonShellAdapter.
   exists_pointed_commonCenter_card11CapLabeling` constructs a cap-aware
   card-eleven labeling with sources `6`,`7` and their common center `8`.
2. `Card11CapLabeling.exists_canonical_outer_reindex` normalizes the relevant
   outer labels to `2` or `3` and `0` or `9`, fixing `6`,`7`,`8`.
3. `P5IndexedSourceScratch.false_of_nonalternating_equidistant` is the
   source-clean terminal for the exact v7 order/equality clause schema.
   `fullClassCyclicAlternationSat_direct` and
   `fullClassCyclicAlternationSat_mirror` show its existing direct/mirror
   packet consumption.
4. `FullClassCyclicAlternationSat` is the matching quantified Boolean-family
   interface.

The three named theorem-bank registries contain no direct
`FullClassCyclicAlternationSat`, source-to-valuation, or occurrence-agreement
consumer for the exact-five common-center schema.  The exact-four
`P4StrictUnitValuation`/literal-632 and checked certificate route is only an
architectural analogy.

The current live consumer remains
`false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven`
in `FiniteN11Frontier.lean`; its body is still `sorry`.
`ExactFiveCommonShellAdapter.lean` explicitly contains no finite-certificate
ingress and is not imported by another Lean module.

## P5 occurrence-bridge architecture and recommended granularity

The existing P5 exact-two route supplies a suitable decomposition pattern:

1. `IndexedSourceValuation.lean` defines the semantic atoms and one
   `DenseFamilySatisfaction` field per formula family.
2. Direct and mirror source modules prove those family fields, including
   `fullClassCyclicAlternationSat_direct` and `_mirror`.
3. `OccurrenceBridge/BridgeCore.lean` defines the exact encoder numbering and
   source valuation.
4. `BridgeFamilies.lean` proves family-to-occurrence-map transfer, in bounded
   shards, and `BridgeMain.bridge_clauses_sat` aggregates the exact 8,703
   stored clauses.
5. `P5ExactTwoClosure.false_of_bridgeClauses_sat` composes clause satisfaction
   with the kernel-checked replay; `false_of_p5ExactTwo` is the thin source
   consumer.

For v7, the recommended implementation unit is therefore not one theorem per
190,080 cyclic clause.  Use:

- one exact-five common-center labelled packet/case structure produced from
  the two existing shell-adapter theorems;
- one source valuation with explicit atom-number round trips for every v7
  variable family;
- one aggregate satisfaction structure, split by the existing v3-v7 clause
  families, with direct/mirror or four-case fields only where orientation
  genuinely differs;
- bounded occurrence-map shards proving that the family interfaces satisfy
  the exact stored v7 clauses;
- one authenticated CNF/checkpoint identity and kernel replay theorem;
- one thin theorem consuming the four normalized cases and discharging the
  live fixed-cardinality-eleven obligation.

The first missing bridge is the labelled packet-to-v7 valuation agreement:
selected rows, source choices and no-qfree conditions, local equality
equivalence, global edge equality, boundary-order selector, all Tseitin helper
iff variables, and the exact four-case selector must be shown faithful.
Only after that must the exact hashed v7 CNF/DRAT proof be brought through a
kernel checker and connected to the live consumer.

## Trust boundary

The four UNSAT/DRAT results are independently verified external finite
certificates for the four exact v7 formulas.  They are not Lean
kernel-checked, do not supply the geometric-to-valuation adapter, and do not
close the load-bearing `sorry`.  No production Lean file was edited.

