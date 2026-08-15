# Source34 cell-8 six-row audit

## Verdict

**PASS, finite proof-backed cut only.** This is not a terminal UNSAT result,
not all-cell coverage, and not a universal or live-theorem closure.

## Checks

- `SOURCE_ORDERS` contains exactly 48 disjoint orders: 24 `direct` and 24
  `mirror`. Independent replay of the new cube covers all 48. Each order is
  handled by `convex-five-point-common-orientation`; each listed core covers
  24 orders, split 12 direct / 12 mirror, with both forward and reverse
  orientations represented.
- The six choices are sufficient and source-faithful. The Lean list at
  `ExactTwelveRigid221MixedV7Cell8FourthPositiveCut.lean:33-39` exactly matches
  the binding-generated centers/supports at
  `exact12_v14_ordered_coverage.py:2007-2013`:

  ```text
  (1, [0,2,6,8])   (2, [0,5,10,11])   (3, [1,2,9,10])
  (6, [2,4,8,10])  (7, [1,6,8,11])   (9, [4,5,7,10])
  ```

  Replay selected exactly these six rows and reported all six supports as
  present in the cube. The positive-row Lean hypotheses establish the same
  six support inclusions (`...PositiveCut.lean:145-163`).
- The two preferred cores are exactly the Lean cores:

  ```text
  A: a=2, x=1, b=8, c=7, y=6
  B: a=5, x=2, b=10, c=3, y=9
  ```

  Direct membership replay validates all eight row witnesses. The Lean
  construction uses `EdgeClosure.row` for each witness
  (`...PositiveCut.lean:164-187`); `EdgeClosure.row` is the direct same-row
  equality constructor (`Census554/EqualityCore.lean:104-113`), and the
  consumer turns these closures into metric equalities before applying the
  convex-five-point obstruction. The coverage theorem dispatches to A or B
  (`...PositiveCut.lean:188-190`).
- Binding provenance matches the live source: 9,600 bytes and SHA-256
  `017a21c98d0b4870033cf907d2a7454faee7b07405050e97550405ad6d0ac76e`.
  Recomputed bytes/SHA and cube SHA both match the binding; source and
  coverage source metadata point to the audited Lean file.
- Proof-backed clause compilation returns exactly:

  ```text
  (-55, -158, -312, -1366, -1641, -2371)
  ```

  The compiler also checks that selected rows equal the generated Lean
  choices and that the clause has one distinct literal per choice.

## Executed validations

```text
LAKE_BUILD_NO_REFRESH=1 lake env lean \
  Erdos9796Proof/P97/ATail/FrontierLiveClosure/\
  ExactTwelveRigid221MixedV7Cell8FourthPositiveCut.lean
=> exit 0, no diagnostics

6 targeted unittest cases (coverage, replay, binding, clause, source bank)
=> Ran 6 tests in 34.060s; OK
```

The source-bank metadata explicitly retains `terminal_unsat=False`,
`aggregate_cell_coverage=False`, `universal_lift=False`, and
`live_theorem_closure=False`; those limitations are preserved by this audit.
