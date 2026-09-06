# Exact-five local geometric return control

An exact rational 27-point construction permits the one-hit transition
`U → C → U` while retaining strict convexity, an acute minimum-enclosing-circle
support triangle, the five-point anchor class, a shortest admissible anchor
pair, and actual critical blockers for both original endpoints. These local
hypotheses do not imply the proposed old-row cover or exclude immediate return.
This is **not** a counterexample to the physical residual: global K4 and a
total critical-shell system fail, and global counterexample minimality is absent.

## Retained evidence and replay

- [Raw rational coordinates and row metadata](../references/exactfive-source-geometry-2026-09-05/onehit-geometric-return.json).
- [Independent Fraction verifier](../../scripts/check_exactfive_onehit_geometric_return.py).
- [Verification report](2026-09-05-exactfive-geometric-return.json), binding the model and verifier SHA-256 digests and its own canonical payload.
- Lane: `exactfive-geometric-return-control-20260905`; base commit
  `afe4c80851a55353a77d44cd7be46d51094695cd`.

```bash
uv run --no-cache --no-sync python scripts/check_exactfive_onehit_geometric_return.py
```

The verifier enumerates every positive squared-radius class at every carrier
point using exact fractions; it does not trust the advertised class list.
The replay passes. Six in-memory corruptions were separately rejected:
reversed adjacent hull vertices, duplicate coordinates, an invalid second row,
an invalid anchor, an invalid omitted-endpoint choice, and an incorrect MEC
center. The report's self-hash and both file digests were independently checked.
No Lean certificate or production theorem promotion is claimed.

## Geometry and deletion facts

All 675 directed supporting-edge tests are strictly positive, so all 27 points
are vertices in the declared convex order. The MEC center is `(0,5071/6500)`
and its squared radius is `69239041/42250000`. Exactly `O,R,L` lie on its
boundary; their triangle is acute. The center's positive barycentric weights
in that order are `129/8450,8321/16900,8321/16900`.
These weights also certify minimality of the enclosing disk: the weighted
squared distance from any trial center to the support points equals the
displayed squared radius plus the trial center's squared distance to the
displayed center. Every disk containing those support points has at least
the displayed radius.

Closed opposite-cap cardinalities at `O,R,L` are `16,8,6`; strict-cap
cardinalities are `14,6,4`. The full five-point `O` class
`E={e1,e2,w,q,e3}` lies strictly inside the first cap. **The first closed cap
does not have cardinality five.** The only centers with a class of at least
four points are `O,C,R,L,U,T`, with respective class sizes `5,4,5,4,4,4`;
each has exactly one such class.

The five-point classes at `O` and `R` survive every single deletion. All ten
unordered anchor pairs jointly preserve a four-point class at `R`.
The unique shortest pair is `{q,w}`, with squared distance `25/100000001`.
Deleting this pair leaves three members at `O` and five at `R`.
These are directly verified finite source properties, not a constructed Lean
`SurplusCapPacket` or minimum-residual witness.

## Actual local blockers and the return

Write `A=E.erase q`, `B={L,l0,l1,l2}` for the preserved selected rows.
The actual unique four-point rows used by the partial choices are:

| Center | Full four-point row |
| --- | --- |
| `U` | `{w,x0,x1,x2}` |
| `C` | `{w,f0,f1,f2}` |
| `T` | `{q,t0,t1,t2}` |

Deleting any member of one of these rows leaves its center with no four-point
radius class. Thus `q:T,w:U,f0:C,x0:U` are actual critical choices on their
specified domain. The blockers of `q,w` are distinct, and the `T` row omits `w`.

First choose `f0`, outside `E`, `A`, the old `U` row, and `B`. Its `C` row
contains `w` and omits `q`, so rechoose `w:C`. Next choose `x0`, outside `E`,
`A`, the new `C` row, and `B`. Its chosen blocker remains `U`, whose row
contains `w` and omits `q`, so rechoose `w:U`. All other partial choices stay
fixed throughout, including `q:T`; the entire partial system returns to its
initial value. Both fresh sources also avoid the four-point `L` row.

In particular, the old `U` row has three points outside `A ∪ C_row ∪ B`:
`{x0,x1,x2}`. Neither the proposed local row cover nor no-return follows from
the checked local geometry and endpoint criticality.

## Missing full-source hypotheses and next obligation

Global K4 fails at 21 centers. The union of all actual four-point class
supports has size 15; the following 12 sources occur in none:
`L,O,R,T,U,e1,e2,e3,l0,l1,l2,l3`.
A critical source must belong to an exact four-point class at its chosen
center, so no total critical-shell system exists on this carrier.
No `CounterexampleData` or `D.Minimal` has been supplied.

The result strengthens the earlier
[incidence-only return test](2026-09-05-exactfive-onehit-omission-transition.md).
A valid source no-return theorem must use additional hypotheses, such as
total critical-shell coverage, global K4 or minimality, or a stronger rule for
selecting the fresh source. A bounded indexed reuse preflight tested whether
those source APIs force a usable critical blocker at an uncovered MEC vertex
or another anchor. It found the following gap:
`selectedFourClass_exists_supportTriangle_omission` supplies a triangle vertex
omitted by each row separately; it does not supply one vertex outside the
union of the three selected rows. A further E anchor is already in the first
row, so it cannot be used directly as the required strict-fresh source.

Total `H.shellAt` supplies a critical row for any chosen carrier source, but
neither freshness of that source nor boundary location of its blocker follows
from its interface. The closest inspected producer,
`FreshThirdQFiberThreeCarrierFanView.boundary_deletionPacket` in
`FrontierLiveClosure/FreshThirdQFiberThreeCarrierFan.lean`, requires a prebuilt
exact-three-fiber boundary packet, distinct centers, two-source difference,
and deletion successors. It produces an interior-cap blocker rather than
an MEC-support blocker. That packet has not been derived in this residual.
The reuse preflight found no bridge discharging these antecedents; this is an
API gap, not a proof that full `H` cannot force a contradiction. Do not iterate
the one-hit override as a descent argument without the missing source theorem.
