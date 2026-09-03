# Three-fan collision from distinctness

Date: 2026-09-03

## Objective

Strengthen the profile-1697 Euclidean core so that it does not depend on a
chosen orientation. For points `B,O,A,S,Q`, assume the six distance equalities
from the three circle rows, together with

```text
B != O, A != S, B != Q.
```

The first two equilateral fans put `A` and `S` at the two different apexes over
the base `BO`. The third fan puts `Q` at one of the two apexes over `OA`; the
condition `B != Q` removes the returning apex. The remaining point makes
`S,O,Q` collinear. Thus any hypothesis that this final signed area is nonzero
is contradictory.

## Reuse preflight

A bounded search of the repository's indexed Lean corpus found the existing
oriented three-fan theorem and general equilateral helpers, but no theorem with
the distinctness-only conclusion. The immediate consumer is a conditional
profile-1697 source-row adapter. The first missing live antecedent remains the
profile alias packet: the broad source theorem does not supply `p = s` or
`c2 = q`. The search used the corpus indexed at revision `55d0a0941`; the lane
base is `927720d0a`.

## Claim boundary

This lemma removes full cyclic-order enumeration and chirality from profile
1697 once its alias classes and row memberships are supplied. It does not prove
that profile 1697 covers the live branch, that the 2,798 Python alias profiles
are exhaustive in Lean, or that the remaining abstract survivors have the same
collision pattern. No live endpoint is closed by this checkpoint alone.
