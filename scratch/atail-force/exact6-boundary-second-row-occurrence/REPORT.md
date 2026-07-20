# Exact-six boundary second-row occurrence

Status: **PROVEN in scratch** (kernel-checked, standard Lean axioms only).

`SelectedShellRebase.lean` proves that if two boundary exports `z` and `w`
belong to the same exact selected four-shell at a second center `c`, then:

1. deleting `z` has no four-point equidistant witness at `c`;
2. the same full shell is a `CriticalFourShell` sourced at `z` and containing
   `w`; and
3. a valid global `CriticalShellSystem` can be reselected so that the selected
   row at `z` is centered at `c` and contains `w`.

This uses only exact full-shell semantics and the chosen system's `no_qfree`
field. It does **not** use MEC, cap, or localization facts.

It does not establish either still-needed terminal incidence:

- `p` belongs to the exported row; or
- the exported row meets `C \\ {q}`.

The current exact finite row-system boundary permits those incidences to be
absent, so this result is an occurrence bridge rather than a closure of the
dangerous-triple terminal.
