# FreshThird U3 dangerous-triple shell-p successor wave

This directory is one bounded successor wave over the source-faithful
eight-label mixed-row support abstraction on the mixed/no-shift arm produced
after the escaping-shift alternative is separately ruled out. It does not
cover the escaping-shift arm or the whole live hard residual. It adds exactly the source-proved
cut `shell_p_at_most_two`: among all six audited centers, at most two rows can
simultaneously be `criticalFourShell` rows whose supports contain label `p`.

The parent runner represents a critical shell by its exact four-label support
and records `closure[x] = (x ∈ support)` for every ambient label. Therefore the
new cut tests actual shell-support membership, not a mode-only proxy. It is
non-vacuous whenever a pre-cut model has at least three `S` rows whose exact
supports contain `p`.

This is a finite abstraction only. SAT models are not geometric
counterexamples, and an UNSAT result would not by itself close a universal
Lean obligation.

Reproduce from this directory with:

```text
uv run python enumerate_successor.py
uv run python readback.py results.json
```
