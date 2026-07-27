# Blocker-cycle geometry audit

## Result

A directed blocker cycle cannot be excluded from convex independence plus the
cycle rows' exact-four/unique-radius data.  `TwoCycle.lean` gives an exact
rational, kernel-checked local two-cycle.  Consequently no analysis of a
three-cycle is needed to refute a cycle-local contradiction.

Normalize the cycle vertices and common radius to

```text
p = (0,0),  q = (1,0),  r = 1.
```

The carrier has six further points:

```text
a = (-3/5,   -4/5)       d = (98/85, -84/85)
b = (-85/157,-132/157)   e = (1,     -1)
c = (35/37,   12/37)     f = (32/41, 40/41).
```

The exact radius-one classes are

```text
SelectedClass carrier p 1 = {q,a,b,c}
SelectedClass carrier q 1 = {p,d,e,f}.
```

Thus the row sourced by `q` may choose blocker `p`, and the row sourced by `p`
may choose blocker `q`.  Both centers are `IsUniqueFourCenter`: for every
positive radius other than one, the class at `p` is contained in `{d,e,f}`,
and the class at `q` is contained in `{a,b,c}`, so it has cardinality at most
three.  The file also constructs the corresponding exact
`CriticalFourShell carrier q p` and `CriticalFourShell carrier p q`.

Convex independence is certified by eight strict rational supporting
functionals, one at every carrier point.  This avoids any floating-point or
diagrammatic convexity assumption.

Validation:

```bash
cd lean
lake env lean ../scratch/blocker-cycle-geometry/TwoCycle.lean
```

This exits successfully with no `sorry`.

## Exact scope boundary

This is a local model of the two cycle rows, not a full counterexample to the
live parent.  In particular it does **not** provide:

- a `CriticalShellSystem` row for each of the other six carrier vertices;
- the full `CounterexampleData` / per-vertex K4 hypotheses;
- the live minimum-enclosing-circle support triangle and cap partition;
- tri-apex deletion robustness, physical-cap incidence, or the downstream
  common-deletion/frontier data;
- `noM44`, global minimality, or the other production terminal hypotheses.

Therefore a cycle exclusion, if true in the live branch, must spend some such
global cross-row or MEC/cap data.  Unique-four exactness at the cycle vertices
and strict convexity alone are insufficient.
