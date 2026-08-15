# FreshThird corrected mutual-C unpinned replay v1

## Scope

This is one exact-17, direct-orientation, radial-branch-0 frozen structural leaf. It is a bounded diagnostic, not a universal FreshThird producer, a general-n lift, or a proof of Erdos 97. Euclidean coordinates are unpinned Real variables.

The roles are distinct: `C.firstSource=0`, `C.secondSource=source5`, `Q.source=q_source`, and `Q.otherOutsidePoint=q_other`. The imported canary's post-deletion B5 row cannot represent the mutual C shell because it forbids label 0. The C supports are therefore enumerated pre-deletion exact-four choices: both contain both C sources and intersect exactly in the source pair. Q.B1 remains a third, separate imported canonical shell.

## Structural selection

- Z3 enumeration terminal: `sat`
- cvc5 structural-existence replay: `sat`
- Enumerated source-entitled C support pairs: 6
- Enumeration complete: `False`
- Selected C sources: `[0, 15]`; blockers: `[7, 6]`
- Selected C rows: `[[0, 4, 6, 15], [0, 2, 9, 15]]`; exact intersection: `[0, 15]`
- Separate Q row at blocker 2: `[1, 4, 5, 13]`
- Grid supports: `[[1, 7, 11, 14], [4, 6, 8, 10]]`

## CEGAR refinements

- Source fidelity: reject the imported post-deletion B5 support as a live mutual-C support because it omits label 0; enumerate pre-deletion source-entitled supports.
- Slice compatibility: reject any grid support containing a C source together with another point of C's own strict cap. Such a leaf is exactly contradictory to the later first-apex singleton slice and is a genuine structural cut, not a numerical cut.

## cvc5 protocol controls

- `duplicate_check_sat` expected `error:protocol:expected_one_check_sat_got_2...`: status `error:protocol:expected_one_check_sat_got_2`; pass=True
- `nonzero_exit_with_sat_stdout` expected `error:exit:1...`: status `error:exit:1:(error "bad query")`; pass=True
- `cvc5_error_with_sat_stdout` expected `error:cvc5:...`: status `error:cvc5:cvc5 error: bad query`; pass=True

## Malformed controls

- `sat_rational_circle` expected `sat`: Z3 `sat`, cvc5 `sat`; pass=True
- `stale_row15_missing_cross_source` expected `unsat`: Z3 `unsat`, cvc5 `unsat`; pass=True
- `positive_row_contains_its_center` expected `unsat`: Z3 `unsat`, cvc5 `unsat`; pass=True
- `ordered_grid_supports_overlap` expected `unsat`: Z3 `unsat`, cvc5 `unsat`; pass=True

## Incremental exact NRA

- `geometry`: Z3 `sat`, cvc5 `error:exit:-6:cvc5 interrupted by timeout.` (30.017s); common exact witness=True
- `grid_members`: Z3 `unknown:timeout`, cvc5 `error:exit:-6:cvc5 interrupted by timeout.` (32.589s); common exact witness=none
- `grid_exact`: Z3 `unknown:timeout`, cvc5 `error:exit:-6:cvc5 interrupted by timeout.` (32.656s); common exact witness=none
- `rows`: Z3 `unknown:timeout`, cvc5 `error:exit:-6:cvc5 interrupted by timeout.` (32.79s); common exact witness=none
- `source_slices`: Z3 `unknown:timeout`, cvc5 `error:exit:-6:cvc5 interrupted by timeout.` (32.829s); common exact witness=none
- `kalmanson`: Z3 `unknown:timeout`, cvc5 `error:exit:-6:cvc5 interrupted by timeout.` (32.833s); common exact witness=none

## Omitted hypotheses / claim boundary

- Only one selected finite support/cap/order leaf is replayed; support enumeration is not exhaustive.
- No numerical proposal is treated as evidence; this version uses exact unpinned SMT directly.
- No general-cardinality lift, universal support choice, Lean proof, or end-to-end FreshThird consumer is supplied.
- SAT is claimed for a common coordinate witness only when rational coordinates are rebuilt exactly and both Z3 and cvc5 replay that pinned witness as SAT.
- UNKNOWN/timeout is not interpreted as UNSAT. The old pinned rational witness failing the row stage is not used as a cut.
- cvc5 `error:*` statuses are fail-closed process/protocol failures, not SAT or UNSAT.
