# Phase-3 P3 classification-context benchmark

Date: 2026-08-02

This is a diagnostic differential benchmark for the successor
`projected_static_v3` implementation.  The context is an acceleration layer;
it does not change any schema, clause, certificate, or journal contract.

## Implementation under test

- `census/p97_search/phase3_classification_context.py`
- `census/global_confinement/cap_selected_nogood_certificate_probe.py`
- `census/p97_search/phase3_order_universe.py`
- `census/p97_search/phase3_structural_cegar_projected_static_v3.py`

The context shares normalized row data, equality-edge data, row-mask closure
results, one closure graph per selected row mask, Phase-3 order positions, and
canonical order hashes.  The certificate producer still performs the legacy
deterministic witness traversal after the finite predicate succeeds.

## Results

### Cap-order certificate corpus

The first 40 records from
`census/p97_search/out/phase3-production/k4-n10-profile-445-combined-bounded100-current-20260728/models.jsonl`
were decoded with the successor encoding.  Each record produced a cap-order
certificate in both paths.

| check | result |
| --- | ---: |
| assignments | 40 |
| winning certificates | 40 |
| exact certificate equality | 40/40 |
| non-reused-context path | 23.3859 s |
| reusable-context path | 11.1587 s |
| measured speedup | 2.096x |

The comparison includes the complete certificate object, including closure
certificates, order coverage, minimization, and hashes.

### Closure graph reuse

For the `equality-six-point-two-pair-collision` fixture, nine obligations were
replayed 1,500 times.  The legacy path rebuilt the graph for each obligation;
the context path built it once for the selected row mask.

| check | result |
| --- | ---: |
| selected rows | 5 |
| obligations | 9 |
| repetitions | 1,500 |
| exact path equality | true |
| graph-per-path path | 7.197844 s |
| shared-graph path | 0.028944 s |
| measured speedup | 248.683x |

### Shared-pair minimization predicate

The first current-model assignment supplied seven source cap facts and 36
shared-pair cores.  All 128 source-fact subsets were checked through both
paths.

| check | result |
| --- | ---: |
| subsets | 128 |
| exact coverage equality | true |
| legacy path | 3.988816 s |
| reusable-context path | 3.375674 s |
| measured speedup | 1.182x |
| cached order hashes | 15,120 |

The context path uses precomputed order positions and preserves the existing
first-violating-core and legacy-order stream selection.

### Residual ordered consumers

The same context hook was differentially measured on the remaining ordered
consumers using the first current-model assignment. Both complete certificate
objects were byte-identical to the non-reused path.

| consumer | non-reused | reusable context | speedup | decision |
| --- | ---: | ---: | ---: | --- |
| rhombus cap-order | 0.678382 s | 0.246177 s | 2.756x | retain context path |
| Kalmanson cap-order (prior eager/context hook, historical) | 13.169638 s | 14.640893 s | 0.900x | superseded by lazy path |
| Kalmanson cap minimization (lazy query) | 2.836801 s | 0.105473 s | 26.896x | promote lazy path |
| Kalmanson full certificate (lazy query) | 25.368731 s | 20.823326 s | 1.218x | promote lazy path |

The exact Kalmanson order-position detector and covered-order bitmask are now
implemented and differentially tested.  The eager mask construction remains a
diagnostic only, but the new lazy query evaluates compatible orders in stable
order and stops at the first uncovered one.  On the fixed first-model
diagnostic, cap-fact minimization improved 26.896x and the complete Kalmanson
certificate improved 1.218x, with byte-identical certificate objects.  The
lazy path uses 100 coverage queries and 147 cached detector results in the
cap-minimization measurement; it does not compile all 15,120 orders for each
candidate.  The rhombus hook reuses the row-mask closure cache and is retained.

## Acceptance status

The P3 Class-A Boolean-coverage slice remains the primary fixed-corpus gate;
its retained benchmark is 4.91x. This context tranche is exact on every
measured target. It improves cap-order, rhombus, closure-graph, and shared-pair
paths, but the cap-order context measurement is 2.096x, below the provisional
3x context-only target.  The lazy Kalmanson query clears its own exact
no-regression gate at 1.218x for the complete certificate, so it is promoted
alongside the structural/cap/rhombus/shared-pair paths.  The eager compiled
mask remains diagnostic and the context-only 3x gate is not claimed.

The affected regression suite passes:

```text
139 passed, 10 subtests passed in 788.57s (0:13:08)
```

Command:

```text
PYTHONPATH=. uv run --with pytest pytest -q \
  census/global_confinement/tests/test_cap_selected_nogood_certificate_probe.py \
  census/p97_search/tests/test_phase3_structural_cegar.py \
  census/p97_search/tests/test_phase3_order_universe.py \
  census/p97_search/tests/test_phase3_ordered_metric_rules.py \
  census/p97_search/tests/test_phase3_structural_cegar_projected_static_v3.py
```

Source hashes at report time:

```text
5fd4f94b536896921c0f88ea860802b212aeb8c97e5c77e0d4445cc7e38e6837  census/p97_search/phase3_classification_context.py
9e21350a4126eb40d09e5fb454c9dee691e6dc1aaccf026a4ca6e238fc96aa13  census/global_confinement/cap_selected_nogood_certificate_probe.py
67fe7a6fb086b82925a5f7b365b34c8a7f5307960f790e914ad86c47b84d86b0  census/p97_search/phase3_order_universe.py
f1819c9f595b12578171e8bdbdb8a130b0bb0f64466b624aa53677c13d71d1db  census/p97_search/phase3_structural_cegar_projected_static_v3.py
1f36e03abc000ae8cd3aa21a8cc2dafe4754f23760d53d86fd2d9cf68b1114a0  census/p97_search/phase3_ordered_metric_rules.py
```
