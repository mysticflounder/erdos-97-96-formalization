# One-row outside-cap extension audit

Date: 2026-07-17

Status: **REFUTED AS A ONE-POINT / ONE-ROW-LOCAL IMPOSSIBILITY BY AN
EXTERNALLY EXACT RATIONAL COUNTERMODEL; NOT YET KERNEL-FORMALIZED.**

This audit answers the narrower question suggested by the deformable
all-reverse full-row search:

> Given a physical Moser apex `o`, two same-cap sources `q,q'` on one
> `o`-circle, and a same-cap blocker center `c` strictly between them with
> `dist c q = dist c q'`, can a point `x` on that blocker circle lie outside
> the physical cap, inside the nonobtuse Moser circumdisk, and remain a strict
> convex-hull vertex?

Yes.  `verify_exact_countermodel.py` gives an exact rational model.  Therefore
the zero-hit signal in `all-reverse-fullrow-model` does **not** justify a
one-row impossibility theorem.  Any valid theorem must retain additional
cycle-core, full-row, or global-parent data.

This is an exact rational external replay, not a Lean kernel theorem.  No
Lean/Lake build was run under the active build gate.

## Required theorem-bank preflight

Before testing a new local claim, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches included perpendicular-bisector cap geometry,
same-cap co-radial sources, blocker-centered circles, outside-cap escape, MEC
containment, and hull vertices.  No theorem in the registries has the target
statement.

The closest source declarations do not apply:

1. `Dumitrescu.cap_witness_uniqueness` in `Dumitrescu/L5.lean` consumes an
   already supplied `CapWitnessRanking`.  It neither constructs that ranking
   nor excludes one point of a blocker-centered circle.
2. `Dumitrescu/Lc1Strict.lean` supplies perpendicular-bisector half-plane to
   distance comparisons.  Its proved `convex_order_implies_perpBisector_side`
   assumes metric betweenness on a segment (`Wbtw`), not cyclic boundary
   betweenness in this configuration.
3. `no_adjacent_escape_on_apex_radius` in `U2NonSurplusOneHit.lean` excludes a
   point which is itself co-radial from the physical Moser apex.  Here `x` is
   co-radial from the blocker `c`; the model explicitly has
   `dist o x != dist o q`.
4. `Dumitrescu.perpBisector_apex_bound` limits how many *centers* can be
   equidistant from a fixed pair.  The target `x` is a point on `c`'s circle,
   not a third center equidistant from `q,q'`.
5. The indexed sibling `cap_arc_midpoint_inequality_v{1,2,3}` only gives the
   apex-versus-chord midpoint inequality.  It does not forbid the model below;
   the current `U1LargeCapRouteBTail.lean` also already records that the
   cap-arc-midpoint route is false as a local removability mechanism.

## Exact rational countermodel

For rational `t`, put

```text
U(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2)).
```

Let

```text
o            = (0,0)
left         = U(0)
right        = U(163/192)
q            = U(4/231)
q'           = U(123/184)
thirdSource  = U(3/4)
c            = (45/86) * (q + q')
x            = c + Rot(-47/149) * (q - c),
```

where `Rot(t)` is the rational rotation with cosine
`(1-t^2)/(1+t^2)` and sine `2t/(1+t^2)`.

The exact counterclockwise boundary order is

```text
o, x, left, q, c, q', thirdSource, right.
```

The replay verifies, using `fractions.Fraction` only:

- every non-edge vertex is strictly left of every displayed boundary edge,
  so all eight points are strict hull vertices;
- `left,q,q',thirdSource,right` are exactly five named points at squared
  distance `1` from `o`, while `c` and `x` are off that circle;
- `c` lies in the physical cap strictly between `q` and `q'`;
- `dist c q = dist c q' = dist c x` exactly;
- `x` lies strictly on the side of the endpoint chord opposite the physical
  cap;
- `x` lies strictly inside the exact circumdisk of `(o,left,right)`; and
- the Moser triangle `(o,left,right)` is nonobtuse by all three exact
  squared-side inequalities.

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/one-row-extension-audit/verify_exact_countermodel.py
```

Recorded output:

```text
PASS: exact rational normalized one-row extension countermodel
boundary=o,target,left,q,center,q_prime,third_source,right
physical_class_card=5
min_strict_hull_margin=23259648/15536327525
target_outside_cap_margin=6048097762026283586/17408796949438590755
target_mec_disk_margin=412453844130246407/2265808453243028160
row_radius_sq=284751763277/966905833181
```

`search_one_row.py` records the independent numerical discovery path.  It is
not needed for the exact verdict.

## Correct scope of the negative result

This countermodel refutes the proposed **single outside target** impossibility,
including the exact-card-five physical apex class.  It does not instantiate
`CounterexampleData` and does not refute direct `False` from the full
`FrontierCoupledExactFivePhysicalCycleParentResidual`.

In particular, the model does not supply:

- the second outside target needed to complete this selected exact four-shell;
- the other cycle blocker centers and their complete rows;
- a total source-indexed `CriticalShellSystem`;
- global K4 or deletion criticality;
- minimality, `noM44`, the retained first-apex frontier, or the origin-tagged
  continuation.

The earlier full-row search tested each candidate target against a carrier
already containing **all three** physical sources and **all three** blocker
centers.  The projected one-row carrier above admits `x` exactly.  Hence its
zero-hit observation can only support a theorem at least as strong as a
source-indexed cycle-core extension statement.  It cannot be renamed or used
as a one-row geometric closer.

## Precise route correction

Classification:

```text
one outside target from one cap-straddling row       REFUTED
one complete 2+2 row on the projected carrier       UNKNOWN in this exact audit
all full rows on the common period-three cycle core  UNKNOWN / no sampled hit
full retained parent plus all-reverse membership     OPEN
```

The next honest theorem target must visibly use at least one field absent from
the exact model: simultaneous complete rows on the common cycle carrier,
cross-row incidence from the total critical map, global K4/deletion
criticality, or another retained-parent coupling.  The one-row shortcut should
be retired.

No production, shared docs, blueprint state, `ShellCurvature`, `surplusM44`,
card-five, or protected 555/654 file was modified.
