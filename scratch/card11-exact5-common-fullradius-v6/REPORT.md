# Exact-11 common-center full-radius v6

## Result

All four canonical shell cases remain satisfiable:

| case | variables | clauses | verdict | CNF SHA-256 | model SHA-256 |
|---|---:|---:|---|---|---|
| `s2_o0` | 49,357 | 1,180,698 | SAT | `63b74de445f55b77564f489cd3640ef09de61eb7b5c64620c30aa1d9e46e0f11` | `ffc41ee12a6f11f166cb8a36bd993b7dde0bbb674305fe6828e1247099e5e100` |
| `s2_o9` | 49,357 | 1,180,698 | SAT | `3e29434434eed6e3536729e40a50a5d9e91b98b9b9b7e01e63cb63a4f20cd7ea` | `f44ed277a607b3947a3ba06c0367947a4dd377ce1b78ea18b1d0e0e8244017b4` |
| `s3_o0` | 49,357 | 1,180,698 | SAT | `76846f2f6cc96fb5c34158ffa88b619ae417e5ae1f285dd85d58c6345279a7d5` | `10f367246f2e40d69a168a0ac9c187154dfe1de967e4f38163bab01798b7f7f6` |
| `s3_o9` | 49,357 | 1,180,698 | SAT | `9ba3fa4796b36c40f87e353765d549fdfd09d6b2d8c1a336a8c71c7f1df0f062` | `210cee7d282358105d0a84811d1fc9d0f9665ba6513f5176059ea075e36eae7f` |

Each model was independently checked against its exact DIMACS formula and
manifest semantics by `verify_artifact.py`.

## Exact extension over v5

The v5 prefix is unchanged at 43,087 variables and 927,138 clauses.  V6 adds
6,270 variables and 253,560 clauses:

- local size-four equality-class witness iff: 2,310 variables, 9,240 clauses;
- q-deleted pair witness iff: 3,960 variables, 87,120 clauses;
- complete compact U5 nontriple-equilateral incompatibility: 117,900 clauses,
  projection-equivalent to the 51,993,900-clause direct expansion;
- U5 common-bisector triple incompatibility: 39,300 clauses.

The self-test verifies the exact v5 prefix, rejects one mutation in each of the
four new components, and checks 756 differential Boolean assignments.

## Survivor motifs and the next complete imported cut

`survivor-motifs.json` records invariant fingerprints of the four assignments.
These fingerprints are useful for comparison but are not claimed to be
complete graph-isomorphism classifiers.

| case | selected-row intersection histogram | complete two-center parity violations |
|---|---|---:|
| `s2_o0` | `{0: 5, 1: 34, 2: 16}` | 11 |
| `s2_o9` | `{0: 4, 1: 36, 2: 15}` | 8 |
| `s3_o0` | `{0: 2, 1: 38, 2: 15}` | 9 |
| `s3_o9` | `{0: 5, 1: 33, 2: 17}` | 5 |

The rejecting family is the complete selected-order global two-center
cyclic-alternation family:

```text
not O_pi or not G({p,a},{p,b}) or not G({q,a},{q,b})
```

for every order selector `pi`, pair of centers `p,q`, and endpoint pair `a,b`
whose two centers and endpoints do not alternate.  It has 1,320 clauses per
selector, 144 selectors, and 190,080 clauses total, split evenly among the
`after`, `enclosed`, `split`, and `before` order configurations.

Unlike the older selected-row separation clauses, this family ranges over
global edge-equality atoms.  It therefore detects equal-radius pairs whether
or not both equalities happen to be exposed by the selected row supports.

Its imported geometric kernel is
`Problem97.P5IndexedSourceScratch.false_of_nonalternating_equidistant`, backed
by the four theorems
`false_of_two_centers_equidistant_pair_after`, `_enclosed`, `_split`, and
`_before`.  The direct and mirror exact-two packet consumers are
`fullClassCyclicAlternationSat_direct` and
`fullClassCyclicAlternationSat_mirror`.

The smaller 55,440-clause seven-literal U1 obstruction also rejects the four
models, but its source-unit consumer is in an unimported sibling bank.  The
q-critical adjacent and third-common families have no matching witnesses in
these models.  Thus the 190,080-clause family is the smallest complete cut
found here with an already imported production geometric kernel.

## Trust boundary

V6 is SAT evidence about these four exact formulas.  It does not construct the
geometric-to-labelled valuation from the live exact-five common-center
residual.  It makes no change to production Lean and closes no Lean obligation.

