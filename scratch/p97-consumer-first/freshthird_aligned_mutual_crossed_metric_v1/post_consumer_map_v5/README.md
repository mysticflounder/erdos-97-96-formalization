# FreshThird post-consumer map v5

This round is a consumer-first **obstruction audit** of the closure-clean v4
survivor.  Neither allowed live consumer has a complete source-entitled role
map, so the round stops before metric SMT.

The positive and negative FiveRow consumers were checked first.  Once all six
signed-area hypotheses are required, the best literal map realizes only 6 of
the 10 normalized distance-equality fields.  The SevenPoint consumer was then
checked against its exact 13-equality signature.  Its four formal min-two maps
are now classified
`FORMALLY_MINIMAL_BUT_CONSUMER_INFEASIBLE`: each missing equality compares a
nonzero distinct-point edge with a diagonal self edge.

A fail-closed filter now retains a missing equality only when both of its
literal carrier edges are non-diagonal.  The corrected theorem-faithful viable
frontier needs four missing fields (10 alternatives); the all-role-injective
frontier also needs four (one alternative).  “Viable” here means consumer-
eligible at the mapping layer, not Euclidean metric feasibility.

## Artifacts

- `mapping.json`: machine-readable signatures, provenance hashes, mapping
  matrices, closure paths, formal and viable omission frontiers, exact
  source-labeled metric equations, and the explicit SMT stop.
- `map_consumers.py`: deterministic finite enumerator.
- `RESULTS.md`: mathematical classification and smallest missing premises.
- `INGRESS-CONTRACT.md`: exact accepted source facts and exclusions.
- `test_v5.py`: regression and malformed-provenance controls.
- `verify.py`, `verification.json`: artifact verifier and its result.
- `SHA256SUMS`: hashes for every substantive artifact in this directory.

## Reproduce

From the repository root:

```bash
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_consumer_map_v5/map_consumers.py
uv run python -m unittest discover -v -s scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_consumer_map_v5 -p 'test_*.py'
uv run python scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_consumer_map_v5/verify.py
```

Formatting and static checks use:

```bash
uvx ruff format --check scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_consumer_map_v5
uvx ruff check scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_consumer_map_v5
uv run python -m py_compile scratch/p97-consumer-first/freshthird_aligned_mutual_crossed_metric_v1/post_consumer_map_v5/*.py
```

No production Lean declaration, project document, or prior scratch artifact is
modified by this round.
