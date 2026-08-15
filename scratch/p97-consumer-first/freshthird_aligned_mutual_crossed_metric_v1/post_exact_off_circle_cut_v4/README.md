# FreshThird post-ExactOffCircle cut v4

This directory implements a source-entitled lazy incidence separator for the
exact-17 direct-crossed FreshThird packet. It starts from all constraints in
`post_rich_cut_v3`, converts the chosen point-K4 rows into canonical unordered
edge-equality components, and blocks an assignment whenever an actual blocker
center has a support edge connected to an off-support edge.

The CEGAR loop terminated after six SAT assignments and nine guarded path
cuts. The final incidence assignment is closure-clean and was independently
reported SAT by external Z3 4.17.0 and cvc5 1.3.3. The known v3 assignment is
rejected, including its center-8/support-to-point-13 obstruction.

The staged shared-coordinate replay was then run to completion. It found no
stage jointly UNSAT in external Z3 and cvc5 within 60 seconds per engine. The
geometry-core and cap-classification stages are SAT in Z3 with exact
substitution and `Fraction` replay; later stages are timeout or unknown. This
is a computational candidate pattern, not a verified P97 counterexample.

Reproduce from this directory:

```bash
uv run python incidence_round.py --max-iterations 200 --timeout-s 120 --reset
uv run python metric_round.py --timeout-ms 60000 --cvc5-timeout-ms 60000
uv run python -m unittest test_v4.py
uv run python verify.py --write-sha
uv run python verify.py
```

The final two commands produce and then verify `verification.json` and
`SHA256SUMS`. Every SMT artifact contains exactly one `check-sat`.
