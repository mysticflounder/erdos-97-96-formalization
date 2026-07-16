# MEC-boundary critical rows: exact endpoint

## Verdict

The three actual `CriticalShellSystem` rows sourced at the three Moser/MEC
boundary vertices do **not** by themselves produce the prescribed reciprocal
cross-deletion failures, an existing MEC/nested/arc core, or a contradiction.
Their sharp automatic consequence is a two-arm dichotomy:

1. some pair of Moser sources has reciprocal cross-deletion **survival**; or
2. the three cross-hits form a bare directed 3-cycle.

The first arm is the existing robust-survival residual.  The second has only
three separate perpendicular-bisector incidences and does not provide the
shared support, cross-chords, strict straddle, or cyclic equality closure
needed by a current consumer.

## Registry and indexed-corpus check

Before deriving the endpoint, I checked the required registries

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- all three concise and JSON theorem-bank inventories under `certificates/`;
- the nthdegree Lean index for `CriticalShellSystem`, cross deletion,
  radical-axis/MEC inequalities, `MECStraddlingRowCore`,
  `NestedEqualChordCore`, and the six-point arc-overtake bridge; and
- the ingested computational-geometry textbook entries concerning minimum
  enclosing disks and intersecting circles.

The relevant existing consumers were found, but no producer from these three
rows was found.  In particular, the indexed textbook's minimum-enclosing-disk
intersection lemma does not apply to a blocker circle: that circle is neither
known to enclose the carrier nor known to be minimal, and its center has no
required alignment with the global MEC center.

## The exact MEC power law

Let `O,R` be the global MEC, let `q` be a boundary source, let `s` be its
chosen blocker center, and let `z` be any point of its exact selected shell.
Then

```text
|q-O|^2 = R^2,       |z-O|^2 <= R^2,
|s-z|^2 = |s-q|^2.
```

Subtracting the two shell equations gives the exact identity

```text
|z-O|^2 - |q-O|^2 = 2 <s-O, z-q>.
```

Consequently

```text
<s-O, z-q> <= 0.
```

Equality holds exactly when `z` is also on the global MEC boundary.  Thus the
entire automatic radical-axis content is one closed half-plane: all support
points lie on the inward side of the line through `q` perpendicular to
`s-O`.  It does not supply a strict straddle.

This implication is kernel-checked as
`shell_support_halfspace_of_mec` in `MECBoundaryCriticalRows.lean`.

## Why only a reciprocal-survival / 3-cycle dichotomy remains

For a row whose center is not a Moser vertex, the existing
`nonMoser_inter_moser_card_le_two` theorem bounds its Moser intersection by
two.  If its center is a Moser vertex, the positive-radius row omits its
center, so the same bound is immediate.  Since the source itself belongs to
its exact shell, each source row contains at most one of the other two Moser
vertices.

Put a directed edge `q -> q'` exactly when `q'` lies in the shell sourced at
`q`.  By `cross_deletion_survives_iff_not_mem_selected_support`, this is
exactly the cross-deletion **failure** relation.  Every vertex has outdegree
at most one.  Therefore either an unordered pair has no edge in either
direction, or all three unordered pairs are covered and the graph is one of
the two directed 3-cycles.  The propositional endpoint is kernel-checked as
`three_source_hit_dichotomy`.

Neither outcome yields the current consumers:

- h4/h5 require prescribed reciprocal cross-deletion failure, while a
  directed cycle has no reciprocal pair;
- `MECStraddlingRowCore` additionally requires a radius/side chain and two
  strict opposite-side row points;
- `NestedEqualChordCore` requires two radius-length cross-chords in one row;
  and
- the arc-overtake bridge requires seven cross-row equality closures and a
  six-label cyclic subsequence.

## Exact local countermodels

`verify_model.py` works entirely in `Q(sqrt(3))`; it contains no numerical
tolerance checks.  Start with the equilateral MEC-boundary triangle

```text
A = (1,0)
B = (-1/2,  sqrt(3)/2)
C = (-1/2, -sqrt(3)/2).
```

In the `A`--`B` cap put

```text
xAB = (-1/2 + 4 sqrt(3)/5,  sqrt(3)/10)
yAB = (-1/2 + 7 sqrt(3)/25, 23 sqrt(3)/50),
```

and rotate these points by 120 and 240 degrees to obtain `xBC,yBC,xCA,yCA`.
The three exact source rows are

```text
source A, center C: {A,B,xAB,yAB}
source B, center A: {B,C,xBC,yBC}
source C, center B: {C,A,xCA,yCA}.
```

Every row is the full squared-radius-3 class at its center, and deleting any
one of its four support points leaves no 4-class at that center.  Cross-hits
are exactly `A -> B -> C -> A`.  All non-source support points are strictly on
the same side of the source-center line, so the MEC-straddling antecedent is
absent even though the equilateral construction supplies its side/radius
equalities.

Two exact variants are audited:

- The 9-point carrier has cap profile `(4,4,4)`.  It is strictly convex, lies
  in the unit MEC disk, and the three displayed shells cover every point.
  Hence they can be used to define a full `CriticalShellSystem`.  Its only K4
  centers are `A,B,C`; it lacks all-center K4 and the two-large-cap profile.
- Add `wAB=(2/5,2 sqrt(3)/5)` and its 120-degree rotation `wBC`.  The resulting
  11-point carrier remains strictly convex and has cap profile `(5,5,4)`, so
  it has the requested two-large-cap/no-`M44` shape.  The same three boundary
  rows remain exact and critical.  Its only K4 centers are still `A,B,C`, and
  exactly the two added points are not covered by those shells.

The verifier also exhaustively checks, within the three displayed rows, that
there is no NestedEqualChord metric antecedent and no six-label arc-overtake
equality antecedent.

## Smallest remaining field

The local MEC/nonobtuse/convex/cap information and the three exact boundary
rows stop at the dichotomy above.  The missing producer must use the genuinely
global rows, concretely all-center K4 at the off-boundary shell points (and the
corresponding full critical-system data at the added large-cap points), to do
one of two things:

1. rule out reciprocal cross-deletion survival; or
2. upgrade a bare directed 3-cycle to shared-support, cross-chord, strict
   orientation, or arc-order data consumed by an existing core.

Without that additional global coupling, the exact models show that the MEC
power law alone cannot complete either frontier arm.

## Validation

```text
lake env lean ../scratch/atail-force/mec-boundary-critical-rows/MECBoundaryCriticalRows.lean
UV_CACHE_DIR=/tmp/uv-cache uv run python ../scratch/atail-force/mec-boundary-critical-rows/verify_model.py
```

Both checks pass.  The Lean `#print axioms` output contains no `sorryAx`.
