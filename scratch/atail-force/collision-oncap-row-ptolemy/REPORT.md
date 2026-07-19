# Serial on-cap two-circle residual

Date: 2026-07-17

Status: **KERNEL-CHECKED DIRECT `False` FOR THE EXACT SERIAL TWO-ROW
OVERLAP. THE PLANAR RESIDUAL IS CLOSED, BUT THE FULL ON-CAP PAIR-BANK ARM IS
NOT: ITS PRESENT PRODUCTION DATA DO NOT FORCE THIS OVERLAP. NO PRODUCTION
`sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/collision-oncap-row-ptolemy/`. It does not edit
production Lean, generated files, closure documents, or protected lanes.

## The residual decided

The predecessor audit in
`scratch/atail-force/collision-oncap-kalmanson/` found one abstract serial
order, up to reversal:

```text
s1 < A < s2 < B < f < x < y < z.
```

Its hardest minimal overlap used the complete rows

```text
A-row support = {s1,s2,x,y}
B-row support = {f,s2,y,z}.
```

Thus the distinct centers `A,B` have the two common support points `s2,y`,
while `s1` is a further point on the `A` circle and `f` is a further point on
the `B` circle. The six-point cyclic subsequence is

```text
s1, A, s2, B, f, y.
```

`SerialTwoCircleCore.lean` proves that this six-point packet is impossible.
The fourth points `x,z`, support exactness, Ptolemy, cap nonacuteness, MEC,
the critical map, and deletion minimality are not needed.

The checked geometric theorem is

```lean
theorem serial_twoCircle_order_incompatible
    {s1 A s2 B f y : ℝ²}
    (hAB : A ≠ B)
    (hA_s1_s2 : dist A s1 = dist A s2)
    (hA_s1_y : dist A s1 = dist A y)
    (hB_s2_f : dist B s2 = dist B f)
    (hB_s2_y : dist B s2 = dist B y)
    -- the nine strict signs inherited from cyclic order
    ... : False
```

The boundary-facing wrapper

```lean
theorem false_of_ccw_serial_twoCircle
```

accepts six strictly increasing indices in an injective CCW convex boundary,
derives every required strict sign with `signedArea2_pos_of_between`, and
calls the geometric theorem. Reversing the six-point order is the same result
after swapping `A ↔ B` and `s1 ↔ f` and rotating the cyclic cut.

The actual-row adapter

```lean
theorem false_of_serial_criticalRows
```

accepts two sources in a `CriticalShellSystem`, membership of the two shared
points in both complete critical supports, and the serial inequalities between
their canonical boundary indices. It obtains the four distance equalities
directly from `CriticalFourShell.support_eq_radius` and calls the boundary
wrapper. Thus the remaining integration obligation is incidence/order
production, not another metric bridge.

## Proof mechanism

Normalize `A=(0,0)` and `B=(1,0)`. The two shared-circle equalities force

```text
s2 = (t,h),  y = (t,-h).
```

The cyclic signs force `h>0` and `0<t<1`. Write

```text
s1 = (u,v),  f = (w,z).
```

The two signs at `A` together with

```text
u² + v² = t² + h²
```

give

```text
v < -h,  u < t.
```

The symmetric two signs at `B` and its circle equation give

```text
z < -h,  t < w.
```

But the terminal signed area has the exact decomposition

```text
signedArea2 s1 f y
  = (w-t) * (-h-v) + (t-u) * (-h-z),
```

which is strictly positive. Cyclic order requires it to be strictly negative.
This is the contradiction. The Lean proof carries out only these squared
distance identities, products of strict inequalities, and `nlinarith`.

## Exact solver audit

`audit_six_point_core.py` independently encodes the normalized circle
equations and strict signs as `QF_NRA`. It first checks one hand-known SAT and
one hand-known UNSAT instance. Z3 4.16.0 then returns

```text
known SAT smoke gate    SAT
known UNSAT smoke gate  UNSAT
serial six-point core   UNSAT
```

The target run takes about 24 seconds on this host. This solver result was
discovery evidence only. The Lean theorem is the proof and no solver verdict
is imported into the kernel.

The predecessor's optional **abstract-distance** row-Ptolemy system is not
claimed UNSAT here. A Ptolemy equality inside an arbitrary metric table is
weaker than an actual realization by points of `ℝ²`. The direct planar theorem
makes deciding that weaker encoding unnecessary for this residual.

## Theorem-bank preflight

Before deriving the core this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` banks;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered Ptolemy, two distinct centers with two common
circle points, perpendicular-bisector order, and two-circle convex-order
cores. The closest existing theorem is

```text
Census554.FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side.
```

It rejects common points on the same side of the center chord. Here `s2,y`
are on opposite sides, so it does not apply. The six-point
`SixPointTwoCircleOrderCore` and `SixPointTwoCircleArcOvertakeOrderCore` have
additional equilateral/cross-row equalities absent from this packet. No
indexed or archived theorem had the serial centered-circle statement above.

## Exact coverage boundary

This closes the exact overlap cell tested by the predecessor audit:

```text
one common cap support point
+ one common outside support point
+ serial center/source order
  -> False.
```

It does **not** close
`LocalizedCollisionOnCapOutsidePairSeparation`. That production structure
currently proves only that the two complete rows contribute disjoint
unordered outside-pair banks. Disjoint pair banks may have disjoint endpoints,
and the fresh row is not currently forced to contain the unchosen collision
source. Therefore the two common support points `s2,y` used by this theorem
are not unconditional outputs of the on-cap arm.

The next honest coverage theorem should split the actual on-cap arm by these
two incidences:

1. if the fresh row contains the other collision source and its outside pair
   shares an endpoint with the collision outside pair, route the induced
   boundary order to this six-point core (the former serial survivor is now
   dead; the other orders already have strict Kalmanson contradictions);
2. otherwise retain the exact missing cap incidence or endpoint-disjoint pair
   packet and couple it to a third critical row, a capacity theorem, or the
   parent frontier/second-apex data.

Treating this result as a contradiction from pair-bank disjointness alone
would overclaim its coverage.

## Validation

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/collision-oncap-row-ptolemy/audit_six_point_core.py

cd lean
lake env lean -s 65536 \
  ../scratch/atail-force/collision-oncap-row-ptolemy/SerialTwoCircleCore.lean
```

The direct single-file Lean command is the repository's scratch exception.
It exits zero with no warnings. All four explicit axiom queries report only

```text
propext, Classical.choice, Quot.sound.
```

The directory contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or `unsafe` declaration.
