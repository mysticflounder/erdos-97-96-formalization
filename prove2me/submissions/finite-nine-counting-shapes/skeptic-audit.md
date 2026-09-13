# Math Skeptic Audit: finite-nine-counting-shapes

**Target**: `submissions/finite-nine-counting-shapes`
**Date**: 2026-09-12
**Verdict**: CERTIFIED
**Claims audited**: 5

## Summary

All five theorem statements match their pinned source declarations. A combined
isolated Lean 4.33.1 staging check compiled every statement, solution, and
validation wrapper. Direct source axiom probes report only `propext`,
`Classical.choice`, and `Quot.sound`. The packet exposes local counting tools
and their two finite-nine consequences and creates no milestone.

## Findings

### F1: Equidistant neighbours supply all unordered pairs

- **Claim**: A finite set `S` of neighbours at one distance from an apex `p`
  contributes at least `S.card.choose 2` pairs to `iCountAt A p`.
- **Evidence**:
  `Problem97.iCountAt_ge_choose_two_of_equidistant_subset` and
  `ChooseTwoEquidistantKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: Every two-element subset of `S` belongs to the filtered family
  counted by `iCountAt A p`, so finite-set cardinality monotonicity gives the
  bound.

### F2: Five equidistant neighbours supply ten local pairs

- **Claim**: Five or more neighbours at one distance from `p` force
  `10 ≤ iCountAt A p`.
- **Evidence**: `Problem97.iCountAt_ge_ten_of_five_equidistant` and
  `FiveEquidistantLocalCountKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The choose-two function is monotone, five choose two is ten, and
  F1 supplies the local-count bound.

### F3: A four-point class and one new pair supply seven local pairs

- **Claim**: Four or more equidistant neighbours together with an
  equal-distance two-point set having a designated endpoint outside the first
  class force `7 ≤ iCountAt A p`.
- **Evidence**:
  `Problem97.iCountAt_ge_seven_of_four_class_and_extra_pair` and
  `FourClassExtraPairLocalCountKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: The four-point class supplies at least six two-element subsets.
  The designated endpoint proves the additional pair is distinct, so inserting
  it raises the counted family to at least seven.

### F4: The five-neighbour shape reaches fifty-five at nine points

- **Claim**: In a nine-point set with four equidistant witnesses at every
  point, the five-neighbour hypothesis at one apex forces `55 ≤ iCount A`.
- **Evidence**:
  `Problem97.fifty_five_le_iCount_of_card_nine_K4_of_five_equidistant` and
  `NinePointFiveEquidistantKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: F2 gives ten local pairs, hence at least seven, and the accepted
  theorem `Problem97.fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven`
  supplies the total-count conclusion.

### F5: The extra-pair shape reaches fifty-five at nine points

- **Claim**: Under the same nine-point global hypothesis, the four-point class
  and extra-pair hypotheses at one apex force `55 ≤ iCount A`.
- **Evidence**:
  `Problem97.fifty_five_le_iCount_of_card_nine_K4_of_four_class_and_extra_pair`
  and `NinePointFourClassExtraPairKernelValidation.result`.
- **Verdict**: PROVEN, Lean-formalized.
- **Reason**: F3 supplies the seven local pairs required by the same accepted
  total-count theorem.

## Attribution and scope

The public explanation credits Adrian Dumitrescu's 2006 counting method and
separately credits Adam McKenna for the Lean formalization and Prove2Me proofs.
The local claims apply to finite point sets without a convexity hypothesis. The
last two claims add cardinality nine and four equidistant witnesses at every
point. None claims the finite-nine exclusion or either full Erdős problem.

## Lean trust audit

The theorem presentation files contain the statement holes required by the
Prove2Me upload format. Submitted solution and validation files contain no
`sorry`, `admit`, custom `axiom`, `native_decide`, `ofReduceBool`, `unsafe`,
`partial`, `implemented_by`, or `extern` declaration. Direct probes of all five
source declarations at commit
`bd8528ea10a12da2c84a10cc5897e36681c2e75d` report
`[propext, Classical.choice, Quot.sound]`.

The choose-two and four-class local validation wrappers have the same clean
axiom set. The other three wrappers additionally report `sorryAx` only through
imported theorem presentation stubs. This is the expected platform packaging
state before Prove2Me replaces those stubs with accepted proof artifacts; it is
not part of the submitted solution bodies.

## Weasel words and scope conflation

The public prose contains none of the banned proof-context phrases. Internal
source shorthand occurs only in the exact Lean declaration names retained for
source identity.

## Required before CERTIFIED

None.
