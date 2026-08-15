# Rich-radius global core minimization

This directory audits the first joint Z3+cvc5 `UNSAT` reported at the
921-clause cumulative `rich_radius_pattern` stage of `post_core_cut_v2`.
It applies only to the one frozen exact-17 direct-crossed assignment in the
parent directory. It is neither a Problem 97 counterexample nor a universal or
Lean closure result.

## Result

Rebuilding all 921 canonical clauses from `../unified_metric.py` and
`../generated/post_core_cut_v2_assignment.json`, Z3 `assert_and_track` over the
complete universe extracted this four-clause seed:

| Clause | Exact meaning |
|---|---|
| `k4_equal_12_7` | The chosen K4 row at center 12 puts points 3 and 7 at the same radius. |
| `rich_equal_2_0_7` | Point 7 lies on the first D44 radius at apex 12. |
| `rich_equal_2_1_3` | Point 3 lies on the second D44 radius at apex 12. |
| `rich_distinct_2` | The two D44 radii at apex 12 are distinct. |

The three equalities force the two D44 radii equal, contradicting the fourth
clause. A fresh deletion pass leaves all four clauses, and every drop-one is
SAT. Thus this is a globally extracted, subset-minimal core; it is not claimed
to be the unique core or a minimum-cardinality core.

There are no direct syntactic formula/negation pairs among the 921 simplified
clauses. The defect is instead the short transitive equality chain above.

The frozen assignment makes the incidence error visible without coordinates:

- third apex: point 12;
- third closed cap: `{3,4,7,9,13,15}` (cardinality six);
- D44 strict-interior slices: `{7,9}` and `{3,4}`;
- chosen K4 support at point 12: `{3,4,7,9}`.

The chosen K4 support crosses—and in fact is the union of—both D44 slices.
That is impossible in a six-point D44 cap.

## Source localization

The four encoded clauses are faithful local consequences, but the source tree
already contains a stronger incidence-level theorem that rejects this proposal
before metric solving:

- `D.K4` is materialized as `SelectedFourClass` by
  `exists_selectedFourClass_of_globalK4` in
  `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1439`.
- `k4_equal_12_7` is the squared-distance encoding of
  `SelectedFourClass.support_eq_radius`, whose structure is declared at
  `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:400`.
- `rich_equal_2_0_7`, `rich_equal_2_1_3`, and `rich_distinct_2` are the two
  distinct-radius branch of `ApexRichClassStructure`, defined at
  `lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean:50`, restricted to
  the two strict-cap slices by
  `twoRichClassSlices_partition_of_capInterior_card_eq_four` at
  `lean/Erdos9796Proof/P97/ATail/ExactFifteenApexProfile.lean:170`.
- Most directly,
  `selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six` at
  `lean/Erdos9796Proof/P97/ATail/ExactFifteenApexProfile.lean:341` proves that
  every selected K4 support in a six-point D44 cap is one of the two full rich
  classes. Its global-K4 corollary is
  `exists_selectedFourClass_support_eq_one_of_twoRichClasses_of_globalK4` at
  line 581.
- The four-clause equality chain can also be discharged directly by
  `selectedClass_radius_unique_of_mem` at
  `lean/Erdos9796Proof/P97/ATail/MinimalUniqueFourCover.lean:54`, or by the
  equivalent disjointness interface `selectedClass_disjoint_of_radius_ne` at
  `lean/Erdos9796Proof/P97/ATail/PairedCommonDeletionNormalForm.lean:243`.

So the reusable preflight implication is:

> At the opposite apex of a six-point cap with two distinct K4-rich radii, a
> selected four-point K4 support cannot contain a point from each strict-cap
> radius slice; it must equal one entire rich class.

For this frozen proposal, applying that checked theorem would reject the
assignment before any coordinate generation. In particular,
`point_k4_rows[12]` is an arbitrary incidence witness chosen to satisfy global
K4; it is not a source-derived positive producer for the live residual. This
is therefore a reusable encoder preflight cut, not a new source theorem and
not a closure of a live residual.

## Packet minimization

The 921 clauses form 14 semantic packets keyed by generator stage and source
meaning. Packet-level tracking and deletion leaves three indispensable
packets, totaling 66 clauses:

1. K4 common-radius equalities (51 clauses);
2. strict-cap rich-slice equalities (12 clauses);
3. D44 radius disequalities (3 clauses).

The 66-clause packet core is dual-UNSAT. Dropping any one packet is dual-SAT,
and every SAT model passes exact Z3 substitution and independent Python
`Fraction` replay.

## Replay and controls

`results.json` records independent Z3 CLI, cvc5 (`QF_NRA`, `--nl-cov`), and
fresh internal-Z3 results for the clause core, all four clause drop-ones, the
packet core, all three packet drop-ones, a known-SAT control, a deliberately
malformed known-UNSAT control, and the four parent malformed controls. There
are no status disagreements. Every SAT result passes both exact validation
paths; every SMT artifact contains exactly one `check-sat`.

Run:

```bash
uv run python minimize.py --timeout-ms 120000
uv run python verify.py
uv run --with pytest pytest -q tests
uvx ruff check minimize.py verify.py tests
uv run python -m py_compile minimize.py verify.py tests/test_minimize.py
```

`SHA256SUMS` authenticates the frozen inputs and current output snapshot.
`verify.py` additionally rebuilds every SMT query from the canonical generator
and checks byte identity, giving a deterministic rerun check for the actual
formula artifacts while ignoring nondeterministic solver timings.

Two consecutive full runs produced the same aggregate SHA-256 over all SMT2
artifact hashes:
`14819f9c103e9a53e9c12d66b5efe76eed777f77830922d43fc944a110299af7`.
