# Card-11 exact-five common full-radius lane

This lane wraps `scratch/card11-exact5-common-source-indexed/` and adds the
complete finite radial equality information needed by
`CriticalShellSystem.no_qfree`.

At each labelled center `c`, the ten incident unordered edges `{c,u}` with
`u != c` are partitioned by equal distance.  The encoding uses one canonical
Boolean for each unordered pair of distinct incident edges.  Reflexivity is
implicit, symmetry is built into canonical indexing, and exhaustive
transitivity clauses make the relation an equivalence relation.  Center
exclusion is structural: the center is not one of its ten incident edges.
Because the carrier labels denote distinct points, all represented radii are
positive.

Every selected Census-554 exact-four row is required to be the entire local
radius class: its six internal equalities hold and all 24 comparisons with the
other incident labels are unequal.  In each target case the named five labels
at the first apex are likewise exactly one entire class.

The inherited source map remains total and functional.  A chosen row contains
its source and is the selected row at its blocker center.  `used[c]` has exact
iff semantics for the existence of such a source choice.  For a used row,
deleting a mapped source leaves three members of that class; clauses forbid
every four-subset of the other six incident labels from being one class.  Under
the exact-class and equivalence clauses this is exactly the finite form of:

```
no distance class among the remaining carrier points has cardinality >= 4
```

Run the independent model/mutation gates and then the four serial CaDiCaL
cases:

```bash
uv run python scratch/card11-exact5-common-fullradius/self_test.py
uv run python scratch/card11-exact5-common-fullradius/probe.py --timeout 900
```

The driver permits at most 1,800 seconds per case and deliberately runs only
one single-threaded CaDiCaL process at a time.  Every UNSAT result is checked
against the exact persisted CNF and DRAT proof by `drat-trim`; every SAT model
is checked by `verify_artifact.py`, which does not import the encoder.

DRAT closes the solver-to-CNF gap only.  It does not prove the theorem-facing
adapter from an arbitrary geometric `CriticalShellSystem` to this fixed
labelled Census-554 valuation.
