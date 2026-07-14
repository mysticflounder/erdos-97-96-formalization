# LIVE-Q / LIVE-C consumer-match audit — 2026-07-13

## Scope and result

This is a read-only audit of the four `liveData_Q_l*_false` contracts and the
seven `liveData_C_*_false` contracts in
`U1LargeCapRouteBTail.lean`.  It checks the current helper hypotheses against:

- `Census554.FiveRowCircleIntersectionOrderCore`;
- the six-point arc-overtake consumer and `LiveArcOvertakeFields`;
- the same-cap second-center sink;
- the current U5 class-level incompatibility bank; and
- the required theorem-bank registries and indexed Lean corpora.

No complete LIVE-Q orbit and no LIVE-C helper is closed by the fields already
present.  This is a field-level negative compatibility result, not a
nonexistence theorem.  The useful common boundary is kernel-checked in
`live_q_c_shared_consumer_boundary.lean`.

## Checked common adapter

The scratch module proves, with no `sorry`, `admit`, or `native_decide` and
with axiom closure exactly `propext`, `Classical.choice`, and `Quot.sound`:

1. all six outer center-value families represented by the seven LIVE-C
   helpers have `f2CriticalRow.center != p`;
2. every such branch therefore has two distinct points of the f2 support
   outside `{q,t1,t2,t3}`;
3. the fixed dangerous `p`-circle itself can feed the first-center half of the
   same-cap sink, so an intermediate `t2Row.center = p` realization is not
   intrinsically needed; and
4. `center_t2_named` supplies the equilateral-star prefix
   `dist p t2 = dist p q`, `dist t2 p = dist p q`, and
   `dist t2 q = dist p q`.

The direct same-cap producer boundary can therefore be stated as:

```text
there are k,c,x,w such that
  p,c are in cap k, c != p,
  x,w are distinct dangerous-base points outside cap k, and
  dist c x = dist c w.
```

This proposition contradicts the fixed dangerous circle immediately.  The
LIVE-C pair already proved in item 2 points in the opposite incidence
direction: its points are outside the dangerous base, not inside it.

## LIVE-Q: one normalized orbit, still open

All four slot helpers have the same metric content after forgetting the
selected-label permutation:

```text
t20 = q
f2CriticalRow.center = p
f2CriticalRow.support = {q,t1,t2,t3}
qRow.center = p
```

The four declarations differ only in which selected slot names `q`.  Hence a
future consumer should be slot-invariant and should replace all four helpers
at once.

| Consumer | Fields already supplied | First missing antecedent |
|---|---|---|
| Five-row circle-intersection | With `O=p` and `A,C,D,E` the dangerous four labels, the `O`-star `OA=OC=OD=OE` is supplied. | `OA=AC`: a row centered at a dangerous `A`, through `p` and a second dangerous `C`.  The f2 and transferred q-row are both centered at `p`, so neither supplies this edge. |
| Arc-overtake | Dangerous base row and all four dangerous labels are supplied. | `critical_center_at_p`: a retained critical system whose blocker for source `p` is a dangerous label `A`, followed by a second dangerous support hit `C`.  The u-row dangerous center/two hits and cyclic order are also absent. |
| Same-cap second center | The fixed dangerous `p`-circle is supplied. | Any second center `c != p` together with a same-cap placement and two dangerous points on its circle outside that cap.  The only fully identified row center in LIVE-Q is `p`. |
| U5 banked incompatibilities | The f2 row converts to a critical class relative to source `t20=q`. | The available class center is `p`; consumers such as `two_triple_points_incompatibility` require a non-`p` center with two dangerous-triple hits.  No such class is present. |

Retaining common `CriticalShellSystem` provenance would upgrade the
same-center q-row comparison from one label to full-support equality, but it
would still identify two copies of the same p-centered circle.  It does not
supply the missing second center.

## LIVE-C branch matrix

All seven helpers share the fixed dangerous circle, five source rows, the
additional f2 row, and a center case different from `p`.  Their exact positive
common consequence is the checked off-dangerous f2 pair.

| Helper | Extra positive content | Five-row / arc first missing field | Same-cap first missing field |
|---|---|---|---|
| `center_q` | `f2.center=q` | No asserted `p` hit and no second dangerous hit in the q-centered row. | A cap containing both `p` and `q`, plus two dangerous support points of the q-row outside that cap. |
| `center_t1` | `f2.center=t1` | No asserted `p` hit and no second dangerous hit in the t1-centered row. | A cap containing both `p` and `t1`, plus two dangerous support points of the row outside that cap. |
| `center_t2_named` | `f2.center=t2`; `p`, `q`, and `f5` are selected.  Under `O=p,A=t2,C=q`, this supplies `OA=OC=AC`; with the fixed triple it also supplies the other O-star spokes. | The next five-row field is `DA_DX5`; equivalently, arc-overtake next needs a dangerous-centered D-row through `A` and another dangerous `E`.  No such row alignment or cyclic-order signs are supplied. | A cap containing `p` and `t2`, and a second dangerous support point besides `q` outside that cap.  The selected point `p` is not a dangerous-base point. |
| `center_t2_rowFailure` | `f2.center=t2` and at least one of the `f5`, `p`, `q` radius tests fails. | No uniform positive `p`-and-`q` row prefix survives the disjunction; first split/produce those equalities or a different core. | Same as `center_t2_named`; the failure disjunction supplies no dangerous pair. |
| `center_t3` | `f2.center=t3` | No asserted `p` hit and no second dangerous hit in the t3-centered row. | A cap containing both `p` and `t3`, plus two dangerous support points of the row outside that cap. |
| `center_u` | `f2.center=u`, with `u` off the dangerous p-circle. | The row center is not one of the dangerous labels required for the A or D center in the current arc core; no alternate aligned main row is supplied. | A cap containing both `p` and `u`, plus two dangerous support points of the u-centered f2 row outside that cap. |
| `center_fresh` | A carrier center distinct from all six base labels and from the f2 source. | As for `center_u`: no dangerous main-row center or aligned support incidences are supplied. | A cap containing `p` and the fresh center, plus two dangerous support points of its row outside that cap. |

For the same-cap route the uniform first mathematical producer is thus the
cap-local dangerous multiplicity

```text
2 <= card (f2.support intersect (dangerousBase minus cap k))
```

together with `p` and `f2.center` in cap `k`.  The already-checked common
consequence is instead

```text
2 <= card (f2.support minus dangerousBase).
```

These inequalities cannot be substituted for one another.

## Why the other banked consumers do not close `center_t2_named`

The closest new match is `center_t2_named`.  It really does make
`p,q,t2` an equilateral triangle at the dangerous radius, so this is not an
incidence-only near miss.  The U5 class consumers still need further rows:

- the f2 critical class is critical relative to its source `t20`, not relative
  to the original deleted point `q` unless `t20=q` is separately proved;
- `q` is selected, but the dangerous triple is `{t1,t2,t3}`, so this is not a
  pair of dangerous-triple hits; and
- the equilateral-bridge, bisector, and five-row consumers each require at
  least one additional centered class with named shared points.

The unimported `u1TwoLargeCapObstruction` has a similarly precise partial
map.  Put `c=t2`, `a=p`, `d=q`, and `f=f5`.  The named branch proves its first
two equations

```text
dist c a = dist c d
dist c a = dist c f.
```

Its next equation is already missing: one needs a point `e` with
`dist q t2 = dist q e`, followed by the q-to-f equality and three further
f/e bisector equalities.  The helper contains no q-centered row or raw
equalities supplying these fields.  Thus this banked five-point consumer does
not improve the first missing cross-row antecedent.

Thus the equilateral-star theorem is a genuine checked prefix, but it does not
close the helper without a new cross-row incidence/order producer.

## Search record

The mandatory bank preflight covered:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed searches for critical p-centered dangerous rows, five-row cyclic
  circle intersections, same-cap second centers, equilateral bridges, and
  two-circle shared-point consumers.

The indexed candidates reduce to the current U5 incompatibility families and
the newly added five-row consumer.  None supplies its own live row-placement,
cap-confinement, or cyclic-order antecedents.
