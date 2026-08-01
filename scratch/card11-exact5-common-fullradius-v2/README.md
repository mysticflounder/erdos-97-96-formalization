# Card-11 exact-five common full-radius v2

This is the corrected full-radius extension of
`scratch/card11-exact5-common-source-indexed/`.  It supersedes the v1
full-radius experiment without modifying it.

The correction is essential: `FaithfulCarrierPattern.classAt` supplies a
selected equidistant four-subset, not an entire radius class.  Therefore every
selected Census row receives only its six internal equalities.  The 24
support/outside inequalities are imposed only at a center selected by the
total source-to-blocker map.  That gate is exactly where the live theorems
`selectedFourClass_support_eq_shell` and
`GeneralCarrierBridge.exactAt_blocker` establish whole-class exactness.  In
particular, the selected four-row at the first apex may be a proper subset of
the named exact five-shell.

At each of the 11 labelled centers, 45 canonical variables compare the ten
positive incident edges.  Reflexivity is implicit, symmetry is canonical, and
three Horn clauses for every incident triple enforce transitivity.  Thus every
SAT assignment reconstructs a complete local equality partition.

For each source, the inherited map is total and functional, its chosen row
contains the source, and the chosen row is selected at its blocker.  A direct
`no_qfree` block forbids any four of the nine incident labels remaining after
source deletion from one equality class.  The first-apex five-shell is one
entire class, while its selected four-row is allowed to be proper.

Run:

```bash
uv run python scratch/card11-exact5-common-fullradius-v2/self_test.py
uv run python scratch/card11-exact5-common-fullradius-v2/probe.py --timeout 900
```

The four cases run serially, so at most one CaDiCaL process is active.  Each
SAT case preserves `input.cnf`, `manifest.json`, raw solver output, a complete
hashed `model.json`, an independent semantic check, and provenance.  UNSAT
cases would additionally preserve a DRAT proof checked against the exact CNF
by `drat-trim`.

All four corrected target cases are SAT and independently model-verified.
This refutes the v1 finite contradiction; it does not establish geometric
realizability or close the Lean residual.  See `REPORT.md` for the exact
semantics, hashes, and trust boundary.
