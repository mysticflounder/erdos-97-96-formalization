# LIVE-C `center_t2_named` cross-row boundary (2026-07-13)

## Result

The current helper data do not produce the first new cross-row equality for
the five-row order consumer.  The exact missing input is a **cross-source
blocker alignment plus one full-shell membership**:

```text
there exist a source s and dangerous D != t2 such that
  (rows.rowAt s).center = D
  t2 is one of the four selected labels of rows.rowAt s.
```

The source point of that row can then be used as `X5`, because every critical
row contains its own source.  Hence the displayed packet immediately gives

```text
dist D t2 = dist D X5,
```

which is the metric content of `DA_DX5`.

This boundary is kernel-checked in
`live_c_t2_named_crossrow_boundary.lean`.

## Five-row field map

Use `O = p`, `A = t2`, `C = q`, and take `D,E` to be the remaining dangerous
labels in the cyclic order selected by the eventual order producer.

| Core field | Current source | Status |
|---|---|---|
| `OA_OC` | fixed dangerous `p`-circle | supplied |
| `OA_OD`, `OA_OE` | fixed dangerous `p`-circle | supplied once `D,E` are chosen from `t1,t3` |
| `OA_AC` | `center_t2_named_equilateral_star` | supplied |
| `DA_DX5` | a `D`-centered row through `t2` and another row point | first missing field |

The later `E`, `A`, `C`, `X6`, and `X9` rows remain downstream; this pass only
settles whether the first missing field can be obtained from the present
comparisons.

## Why the live comparison maps do not supply it

Both comparison maps have the same premise

```text
t2[0] = rows.sourcePoint s.
```

On that premise, `f2CriticalRow.center = t2` and
`hf2Center_eq_rowAt_center` imply

```text
(rows.rowAt s).center = t2.
```

Thus a comparison hit recovers the already-used `A`-centered row, not a row
centered at `D != t2`.  The checked theorem
`dangerousCrossRow_requires_unmatched_source` shows that any successful
`D`-centered cross-row must occur at a source for which the comparison premise
is false.

The second comparison transfers only selected slot `l1`, under that same
premise.  It does not provide full-support equality or membership of `t2` in a
row at a new center.

There is a second structural exclusion: a critical source row is never
centered at its own source.  Hence `qRow` cannot be the needed q-centered row,
`t1Row` cannot be the needed t1-centered row, and `t3Row` cannot be the needed
t3-centered row.  A dangerous-centered row must be genuinely cross-source.

## Banked five-point alternate

For `u1TwoLargeCapObstruction`, use

```text
(c,a,d,f) = (t2,p,q,t2[1]).
```

The named branch supplies the first two equalities:

```text
dist t2 p = dist t2 q
dist t2 p = dist t2 (t2[1]).
```

The next equality already needs a q-centered row through `t2` and a point
`e`.  The named `qRow` cannot have center `q`, and no cross-source q-center
alignment is present.  The banked five-point consumer therefore reaches the
same missing cross-row boundary and does not bypass it.

## Preflight and rigor

The required sibling, legacy, and older theorem-bank registries were checked,
along with indexed `nthdegree docs search --lean` queries for five-row circle
intersections, dangerous-centered cross rows, equilateral-star rows, and the
two-large-cap obstruction.  No existing theorem supplies the absent live
alignment or shell membership.

Classification: the conditional metric adapter and comparison-map exclusion
are **PROVEN** with kernel axiom closure exactly `propext`,
`Classical.choice`, and `Quot.sound`.  Non-production from the helper is a
field-level compatibility result, not a model-theoretic independence theorem.
No live `sorry` is closed by this artifact.
