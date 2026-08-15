# FreshThird exact 2+2 two-shell probe

The companion script `freshthird_two_shell_22_probe.py` models the residual in
which an endpoint selected-four row has four points covered by the source and
fresh four-shells, with exactly two source-only points and two fresh-only
points.  The two shells share `source1, source2`.

It imposes strict positivity/triangle inequalities on all eleven named
points, the four source-proved five-point Kalmanson orders on the five named
roles, and only the shell/row equal-radius equations already exposed by the
Lean packet.  It does not invent cyclic placements for the six auxiliary
shell/row points.

Run (Lean 4.27 workspace):

```text
uv run python scratch/p97-consumer-first/freshthird_two_shell_22_probe.py
```

Result (`freshthird_two_shell_22_probe.results.txt`): all 8 combinations
(four order arms × endpoint `qBetween`/`qOutside`) are **SAT**; none are
UNSAT or UNKNOWN.  This is a satisfiable linear abstraction, not a Euclidean
counterexample and not a closure result.

## Required promotion contract

To turn a future UNSAT probe into a Lean closure, a source-level producer must
prove that every live `false_of_freshThird_commonRadius_distinctCaps_survivingRow`
instance either supplies this exact 2+2 packet on the same `BoundaryIndexing`
or escapes the two-shell union.  A checked consumer must then replay the exact
certificate under the full packet (including any proved cyclic placements of
auxiliary points), and a universal lift must cover all four order arms and both
endpoint choices.  The current SAT result supplies no such producer or lift.
