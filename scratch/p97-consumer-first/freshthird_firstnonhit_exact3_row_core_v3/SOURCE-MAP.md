# Source and encoding map

## Exact pinned ingress

`input.json` pins the exact v2 input and result bytes and the v1 source packet.
The runner checks all three SHA-256 values and checks that all three copies of
the 13-row support table agree before any solver call. The v2 result is used
only as the authenticated fallback full-row `UNIT` set if this run cannot
authenticate a smaller final candidate.

## Row groups

Each row group is named by its center and consists of exactly three expanded
quadratic equal-distance equations for the four listed supports. Gauge
equations `x0=0`, `y0=0`, `x1-1=0`, `y1=0` are permanent base equations and
are never candidates for deletion. Adding row groups preserves `UNIT`, so the
greedy deletion surface has the required monotonicity.

The runner records the exact retained centers and supports. Its wave-data-only
mine constructs two finite row-intersection graphs on the retained groups:

- the nonempty-intersection graph joins rows sharing at least one support;
- the pair-overlap graph joins rows sharing at least two supports.

For each it records labeled edges, components, degrees, cycle rank, bridges,
and a deterministic fundamental cycle basis. These are descriptions of this
fixed packet only, not a universal geometric theorem.

## Trust and claim boundary

msolve is a fallible discovery engine, so every decisive system is checked in
two variable orders. Singular characteristic-zero `dp`/`std` is the independent
arbiter. Even three-way agreement is trusted computation, not a checkable
algebra certificate. `UNIT` proves complex emptiness of the fixed equality
system; `NONUNIT` is not a real witness. No Lean or theorem-bank search is part
of this wave.
