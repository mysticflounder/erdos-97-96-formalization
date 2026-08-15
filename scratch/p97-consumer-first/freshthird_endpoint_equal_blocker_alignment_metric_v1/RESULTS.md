# Results

## Verdict

**REFUTED BY A FULL SOURCE-FAITHFUL LOCAL EUCLIDEAN MODEL.**

The proposed missing alignment implication is false at the exact local level
tested here.  The full geometric/cap/order branch can hold while no indexed
cap contains both the endpoint-row center `c` and common actual blocker `b`
with both repeated-blocker row points `z,w` outside.  In particular,
`blockerCap != rowCap`, and `z,w` are not both outside `blockerCap`.

This verdict is for the isolated implication, not for the enclosing theorem:
the witness does not instantiate all global `CounterexampleData`, frontier,
seed, multiplicity, and carrier-wide shell-system hypotheses.

## Exact witness spine

Core points are

```text
c = (0,0)             b = (2,0)
z = (1,3/4)           w = (1,-3/4)
```

The other seven exact rational coordinates are recorded in
`readback/witness.json`.  All eleven form the strict CCW convex boundary

```text
x, y2, y1, ra, rb, w, b, ka, kb, z, c.
```

The exact MEC has center `(6031/6148,-3/1537)`, radius squared
`3546/1537`, and the non-obtuse circumscribed triangle
`(v1,v2,v3)=(x,ka,ra)`.  The Lean `OnArcOpposite` predicate gives

```text
C1 = {ra, rb, w, b, ka}       strict C1 = {rb, w, b}
C2 = {x, y2, y1, ra}          strict C2 = {y2, y1}
C3 = {x, ka, kb, z, c}        strict C3 = {kb, z, c}
```

Take the fan's `blockerCap=C1`, while `oppIndex1=C2` and
`freshCap=rowCap=C3`.  The order-named fresh center is `kb`; it is deliberately
kept distinct from the fan's common actual blocker `b`.  Then

```text
Row(c) = {ra, rb, w, z},       radius squared 25/16
K_b(z) = K_b(w) = {ka, kb, w, z}, radius squared 25/16
Row ∩ C3 = {z},                Row \ C3 = {ra, rb, w}
Row ∩ K_b = {z,w},             c != b
```

Deleting `z` or `w` leaves at most three carrier points at any positive
radius about `b`, so `b` is a genuine deletion blocker for either source.
The fourth order arm is exact:

```text
sourceCenter=y2 < canonicalSource=y1 < qBetween=rb
  < freshCenter=kb < qOutside=id=c.
```

No cap contains both `c` and `b`: `c` belongs only to `C3`, while `b`
belongs only to `C1`.  Therefore every instance of the proposed existential
alignment conclusion is false.

## Solver and validator results

| Artifact | Z3 4.17.0 | cvc5 1.3.3 | Expected |
|---|---:|---:|---:|
| incidence abstraction | `sat` | `sat` | `sat` |
| exact rational Euclidean realization | `sat` | `sat` | `sat` |
| malformed control: force proposed alignment | `unsat` | `unsat` | `unsat` |
| malformed control: give `z` a second row radius | `unsat` | `unsat` | `unsat` |

Both solvers returned all 30 requested geometric rational values exactly;
both readbacks match the intended witness.  The independent standard-library
`fractions.Fraction` validator reports `PASS` for every check, including:

- strict convexity and boundary order;
- exact MEC containment and non-obtuse triangle;
- all three signed-area cap classifications and strict interiors;
- exact four-point row and blocker radius classes;
- equal blocker supports, distinct sources, and exact two-point overlap;
- deletion blocking after erasing either source;
- endpoint row-cap counts `1` inside and `3` outside;
- all source/fresh/endpoint order and cap localizations; and
- falsity of the alignment target for `C1`, `C2`, and `C3`.

The machine-readable evidence is in `results.json` and
`readback/exact_validator.json`.  Solver stderr is empty for all eight runs.
Processes ran sequentially, so the wave used at most one solver process at a
time.

## Consequence for the proof route

The existing equal-blocker obstruction is usable only after a cap containing
`c,b` with `z,w` outside has been produced.  The local source hypotheses do not
produce such a cap.  Any successful continuation must use an additional
global hypothesis from the enclosing residual to rule out this model or must
replace the alignment step; cap/order geometry alone cannot supply it.

The single wave-derived theorem search found only consumers of the missing
alignment, not a producer.  See `THEOREM_SEARCH.md`.
