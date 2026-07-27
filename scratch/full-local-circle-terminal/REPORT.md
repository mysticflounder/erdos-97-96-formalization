# Exact full local two-circle terminal witness

## Verdict

The sharp local configuration is compatible with strict convexity.  In
particular, the two full exact-four carrier circles do not by themselves give
a local contradiction.

Let the finite carrier be the following eight rational points:

\[
\begin{array}{c|c}
\text{point} & (x,y)\\ \hline
p&(-1,0)\\
c&(0,1/4)\\
q&(1,0)\\
O&(0,-1/4)\\
e&(659/641,-225/1282)\\
f&(38/37,-6/37)\\
g&(-32/37,-23/74)\\
h&(304/325,-119/650).
\end{array}
\]

Their counterclockwise hull order is

```text
p, g, O, h, e, f, q, c.
```

Thus all eight points are distinct hull vertices.  The three-point cap is
ordered clockwise as

```text
p < c < q,
```

while `O,e,f,g,h` lie strictly on the other side of the endpoint chord
`pq`.

## Exact circle classes

Both centers lie on the perpendicular bisector of `pq`, and the common
squared radius is \(17/16\).  Direct rational arithmetic gives the exact
carrier intersections

\[
\{x\in A:\lVert x-O\rVert^2=17/16\}=\{p,q,e,f\},
\]

and

\[
\{x\in A:\lVert x-c\rVert^2=17/16\}=\{p,q,g,h\}.
\]

These are full four-point carrier classes: none of the other four carrier
points lies on the relevant circle.

## Ordered-cap and convexity certificates

For the endpoint orientation from `p` to `q`,

\[
\operatorname{area}_2(p,q,c)=1/2,
\]

whereas the signed areas of `O,e,f,g,h` are all strictly negative.  For
`L=[p,c,q]`, the sole consecutive turn is

\[
\operatorname{area}_2(p,c,q)=-1/2.
\]

The checker additionally verifies, for each of the three ordered subchords,
that its positive-side carrier points are exactly the cap indices strictly
between its endpoints.  This is the finite incidence content of
`CGN.StrictCapOrder.subchord_open_side_iff_A` for this model.

Taking `O` as the cap-disk center also gives the elementary `MecCapPacket`
side data: `p,q` lie on the radius-\(\sqrt{17}/4\) circle,
\(\lVert O-c\rVert^2=1/4<17/16\), and
\(\operatorname{area}_2(p,q,O)=-1/2\).

Strict convexity is certified independently: for every directed edge in the
displayed counterclockwise hull order, all six nonincident carrier points have
strictly positive signed area.  All 48 inequalities are checked as exact
rational inequalities.

Run:

```bash
uv run python scratch/full-local-circle-terminal/check_model.py
```

## Consequence for the live route

This exact model upgrades the earlier partial witness: it includes both full
four-point classes sharing the ordered cap endpoints.  Therefore no theorem
whose premises are only strict convexity, the ordered-cap incidence, the two
endpoint equidistances, exact cardinality four for the two circles, off-cap
membership of `e,f,g,h`, and the named distinctness can contradict the live
configuration.

Any applicable production contradiction must use at least one additional
field from the collision-row/global packet (for example a second row, a
selected-row alternation/shared-pair hypothesis, a unique-four-center
interaction involving another source, or a deletion/MEC constraint not
captured by this one-row local packet).

## Existing theorem-bank map

The strongest same-pair order theorem is
`Problem97.SurplusCOMPGBank.btw_sep` in
`lean/Erdos9796Proof/P97/SurplusCOMPGBankSep.lean`.  Map its two centers to
`O,c` and its two bisector points to `p,q`.  It concludes that `p,q`
separate `O,c` cyclically.  The displayed distinguished order is alternating
(`p,O,q,c` counterclockwise), so the theorem is satisfied.  A contradiction
would need the absent, false premise that the four roles are non-alternating.

The four non-alternating cases are exactly the hypotheses of
`Problem97.false_of_two_centers_equidistant_pair_after/enclosed/split/before`
in `lean/Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean`.  Likewise,
`Problem97.CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`
in `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean` requires the
non-alternating order `center,center,point,point`.  Their first missing premise
is therefore an order chain incompatible with this witness.

The sharp circle-overlap result is
`Problem97.SelectedFourClass.inter_card_le_two` in
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean`.  It only proves that two
distinct-center four-point supports overlap in at most two points.  This
witness saturates the bound with the exact intersection `{p,q}`.  Its first
missing premise for a contradiction would be a third common circle point.

At the live consumer
`Problem97.ATailFrontierLiveClosure.exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`,
the first missing local object beyond this witness is the second distinct
exact-four first-apex radius class and its retained source pair.  The full
consumer also retains the two localized omission cycles and global
tri-apex/incidence fields; none is represented by this one-row local model.
