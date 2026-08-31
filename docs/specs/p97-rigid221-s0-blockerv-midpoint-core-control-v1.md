# Rigid221 S0 literal-blocker-`v` midpoint-core control v1

**Status:** bounded formula-scoped positive control; no source-universal
conclusion.

## Purpose

The live B3 target

```text
false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy
```

has one identified midpoint edge: the literal blocker `v` lies strictly
between the source point `u` and a source-row partner `xu` in either directed
cap presentation.  This control asks whether that one edge, together with the
five-circle, fixed cap, and MEC-disk geometry, already forces a contradiction.

It does not.  Two exact rational realizations satisfy the reduced contract.
That result blocks a proposed closure lemma whose hypotheses stop at this
first midpoint edge.

## Reduced contract

The named roles are

```text
O, m1, m2, u, xu, delta, v, xv.
```

The encoder uses these facts:

- `O = (0, 0)`, `m1 = (8/5, -4/5)`, and `m2 = (8/5, 4/5)`;
- all eight roles are distinct;
- the five physical roles `u`, `xu`, `delta`, `v`, and `xv` have one positive
  squared distance from `O`;
- every named role lies in the unit disk centered at `(1, 0)`;
- the fixed `C3` arc has exactly `m1`, `m2`, `u`, `xu`, and `v` on its closed
  opposite side, while `delta` and `xv` are on the strict other side;
- `dist²(v, u) = dist²(v, xu)`; and
- the directed midpoint turns are both positive in `forward` and both
  negative in `reverse`.

The two cells are the order directions admitted by the named midpoint edge:

| Cell | Directed cap segment |
|---|---|
| `forward` | `m1, u, v, xu, m2` |
| `reverse` | `m1, xu, v, u, m2` |

## Exact reference realization

In `forward`, take

```text
v     = (17/10, 0)
u     = (1071/650, -136/325)
xu    = (1071/650,  136/325)
delta = (3/2, -4/5)
xv    = (3/2, 4/5).
```

For `reverse`, exchange the names `u` and `xu`.  Exact `Fraction` replay
checks the following values in both cells:

| Quantity | Value |
|---|---:|
| common physical `dist²(O, ·)` | `289/100` |
| `dist²((1,0), u)` and `dist²((1,0), xu)` | `10049/16900` |
| `dist²((1,0), v)` | `49/100` |
| `dist²((1,0), delta)` and `dist²((1,0), xv)` | `89/100` |
| `dist²(v, u) = dist²(v, xu)` | `289/1625` |
| forward turns | `1156/1625`, `1156/1625` |
| reverse turns | `-1156/1625`, `-1156/1625` |

The control has 56 QF_NRA assertions per cell.  The deterministic source
formula hashes are:

| Cell | Formula SHA-256 | Query-free session SHA-256 |
|---|---|---|
| `forward` | `4270cc6c5e65adccbed8dc5af28bbc6a21dfb700332eaf39374303a51e710a99` | `6b3138af4a69eea2636bceb68a6650d9dba652ac6f067b02858dec25415b4188` |
| `reverse` | `106c4c2e1387be69d2e4d24cc15c22c6f2e4c68ef7ed772b1f353b6e7e228acd` | `656764994ff5ff418173d1f5390e9f2fa71a31e3291b727ad9cdb87333b82e1d` |

`scripts/rigid221_s0_blockerv_midpoint_core_control.py --smoke` checks both
reference realizations, parses emitted SMT-LIB, rejects a direct `False`
mutation, and checks deterministic output under two distinct Python hash
seeds.  It is silent unless `--verbose` is supplied.

## Excluded source structure

This is intentionally not a realization of the full B3 source packet.  It
does not encode:

- an opposite-row membership or its equal-distance edge;
- a canonical next blocker or its strict-cap edge;
- mutual omission, exact `2+2+1` deletion multiplicity, or full row data;
- a finite named carrier; or
- the actual `centerAt(source) = v` source assertion.

Thus the control says only that the first midpoint edge plus the displayed
geometric shell has rational models.  It cannot discharge B3 and does not
support importing a new Lean theorem.  The first missing source producer is a
second compatible opposite-row or next-blocker edge for the ordered-cap cycle
terminal.

## PiQD execution

Each post-repair query-free formula was asserted once in a fresh, closed PiQD
session using `z3-4.17.0`.  The driver retained all 56 source assertions and
requested no model or deletion pass.

| Cell | Source bytes / SHA-256 | Normalized candidate bytes / SHA-256 | Session | Result |
|---|---|---|---|---|
| `forward` | `18,245` / `6b3138af4a69eea2636bceb68a6650d9dba652ac6f067b02858dec25415b4188` | `18,356` / `629e944ca961b45201463a2cf9ee443b2901a72c283f08a3cd7144d647e5cc17` | `0c9c460f-095a-4d48-833b-0bff98ae007c` | `SAT`, 6 ms |
| `reverse` | `18,245` / `656764994ff5ff418173d1f5390e9f2fa71a31e3291b727ad9cdb87333b82e1d` | `18,356` / `bc3b630fd634a5672c205fd77b95976956ea0eb6ce96da48485306bc36965131` | `abb0cf82-d987-431e-94ca-6309acc2f1de` | `SAT`, 5 ms |

Both receipts have result SHA-256
`e1924c92e6d58322ac1609aac6ff0800aaec81edba4a925aa05a953b703fd943`,
with a requested 30,000 ms timeout and a recorded 60,000 ms effective
deadline.  This is formula-scoped corroboration of the exact reference
replay.  An UNSAT result in a later, stronger formula would still need a
source bridge and kernel-checked consumer before it affected the proof spine.
