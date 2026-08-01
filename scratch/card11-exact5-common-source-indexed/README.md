# Card-11 exact-five common source-indexed shadow

This lane strengthens `scratch/card11-exact5-common/` with a total, functional
finite map for every carrier label `s ∈ {0,…,10}`:

```
valuation(s) = (blocker center c, selected exact-four Census row R_c)
```

Each `R_c` contains `s`; therefore `R_c \ {s}` has exactly three labels.  The
four common-blocker cases retain the earlier constraints: center `V=1` and
blocker `B=8` contain `{Q=6,W=7}`, while `V`'s row lies in the displayed U5
shell.  This lane additionally forces both `valuation(6)` and `valuation(7)`
to use `B=8`.  C4 gives pair-center capacity at most two, hence the displayed
pair is saturated; C2 gives triple-center capacity at most one.

The mapping is sourced from `CriticalShellSystem.shellAt`,
`source_mem_selectedFourClass`, and `selectedFourClass_support_eq_shell` in
`U1CarrierInjection.lean`.  It is deliberately only an incidence shadow:
`CriticalShellSystem.no_qfree` says that *all* K4 witnesses at the selected
geometric center disappear after source deletion.  Census-554 contains one
selected row per labelled center, not every same-radius class, so that universal
post-deletion condition is not encoded.  Neither SAT nor DRAT-checked UNSAT is
promotable to Lean closure without a source-to-valuation quotient theorem and
that no-qfree ingress.

Run the audit before the solver cases:

```bash
uv run python scratch/card11-exact5-common-source-indexed/self_test.py
uv run python scratch/card11-exact5-common-source-indexed/probe.py --timeout 900
```

The solver driver is serial and rejects timeout settings above 1,800 seconds.
It persists CNF, solver transcript, DRAT (for UNSAT), SHA-256 hashes,
provenance, and an independently decoded SAT source map in `runs/`.
