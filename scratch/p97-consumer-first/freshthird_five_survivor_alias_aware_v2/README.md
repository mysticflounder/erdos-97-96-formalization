# FreshThird five-survivor alias-aware v2

This directory contains the smallest current exact-17 finite incidence
preflight
for the five-row deletion arms of
`FreshThirdAlignedDistinctBlockerFirstCapResidual`.

It repairs the v1 modeling defect in which named centers were fixed to distinct
numeric slots instead of being genuine carrier-valued variables.  It also adds
the source-exact B0/B1 canonical-shell links and the actual deleted blocker.

Run:

```bash
uv run python scratch/p97-consumer-first/freshthird_five_survivor_alias_aware_v2/run_query.py
uv run python -m unittest discover \
  -s scratch/p97-consumer-first/freshthird_five_survivor_alias_aware_v2 \
  -p 'test_*.py'
```

The runner executes five smoke controls, then checks all eight ingress tags and
forces each of three previously proposed consumer predicates in every tag.  It
uses both z3 and cvc5 and independently checks every SAT assignment in Python.

See `INGRESS-CONTRACT.md` for the exact source map and omissions and
`RESULTS.md` for the current run.
