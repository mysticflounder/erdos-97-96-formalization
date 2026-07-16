# Terminal OMISSION circle-intersection bridge audit

**Status: exact negative boundary; no producer and no closed production
`sorry`.**

This audit checks whether the retained terminal endpoints, or the terminal
second-apex K4 witness, can produce a same-first-apex/same-actual-blocker
circle-intersection contradiction for the OMISSION branch.

## Required bank preflight

The registries required by `AGENTS.md` were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` searches were also run for terminal
omission, same-apex/same-blocker circle intersections, critical-row endpoint
incidence, common points, and second-apex K4 incidence. The relevant existing
bank declarations are:

- `Problem97.two_circle_third_point_eq`;
- `SelectedFourClass.inter_card_le_two`;
- `U5QDeletedK4Class.inter_card_le_two`;
- `U5QDeletedK4Class.not_dangerous_triple_subset_of_ne_center`; and
- `u5_common_bisector_triple_incompatibility`.

No indexed declaration produces terminal endpoint incidence in the actual
blocker row, nor does one transfer an anonymous second-apex K4 witness into
that row.

## Exact weakest circle-incidence hypothesis

Let

```text
fixedClass := SelectedClass D.A S.oppApex1 rho
K          := (H.selectedAt P.x hxA).toCriticalFourShell
```

The source point `P.x` is already in both `fixedClass` and `K.support`.
Therefore the weakest cardinality-form hypothesis needed by the
same-apex/same-blocker circle argument is

```text
3 ≤ (fixedClass ∩ K.support).card.
```

Equivalently, one may produce two further points `u,v` satisfying

```text
u ∈ fixedClass ∩ K.support
v ∈ fixedClass ∩ K.support
u ≠ P.x
v ≠ P.x
u ≠ v.
```

The bridge used by
`false_of_residualTerminalOmission_of_terminalPairSupportBridge`,

```text
rho = terminalRadius ∧ q ∈ K.support ∧ w ∈ K.support,
```

is a convenient named sufficient hypothesis, not the weakest hypothesis.
The terminal source already gives `q ≠ w`, and erased-versus-retained
provenance gives `P.x ≠ q,w`, so that bridge specializes the two extra common
points to `q,w`.

## Why the current source does not produce it

`RetainedActualBlockerTerminalPayload` exports:

- distinct `q,w` on the terminal first-apex circle in `C`;
- terminal-class cardinality four or five and uniqueness among large
  first-apex classes on `C`;
- an anonymous
  `HasNEquidistantPointsAt 4 ((C.erase q).erase w) S.oppApex2`;
- the retained actual blocker's endpoint/terminal/small-class role; and
- the actual-blocker HIT/OMISSION classifier.

It deliberately exports no endpoint, rank, or cross-incidence field. In
particular:

1. it does not identify `rho` with `terminalRadius`;
2. it does not put either `q` or `w` in `K.support`; and
3. its second-apex K4 witness supplies only four points on a circle centered
   at `S.oppApex2`, after deleting `q,w`. It does not put any witness point on
   the first-apex `rho` circle or in the actual blocker row.

The cap-order and global-K4 fields already used by
`actualBlocker_capMetricClassifier` localize the blocker and row points in
the MEC cap partition. They do not currently create any of those missing
cross-incidences. No bank adapter found in the preflight supplies them.

## The existing theorem points in the opposite direction

`criticalFourShell_fixedClass_inter_card_le_two` proves, using the distinct
circle centers,

```text
((SelectedClass D.A S.oppApex1 radius) ∩ K.support).card ≤ 2.
```

Thus every proposed same-apex/same-blocker closer must derive a third common
point from genuinely new global information; the desired incidence is
itself already contradictory with the generic circle bound.

On the fixed-single-radius cycle surface, the current exact classifier is
sharper. In the OMISSION arm,

```text
(fixedClass ∩ K.support).card = 1
```

or

```text
(fixedClass ∩ K.support).card = 2,
```

and the complementary blocker-row residual has cardinality three or two.
Consequently the off-circle residual cannot supply the missing third common
point, and both terminal endpoints cannot consistently be members of the row
once they have been aligned with that fixed circle.

## Faithful local metric/incidence model

The following exact-coordinate model satisfies the local circle, terminal,
OMISSION-row, and independent second-apex-witness clauses used by this
consumer surface. It is intentionally **not** a model of all
`CounterexampleData` fields: a full model would also have to satisfy global
strict convexity, the MEC cap system, and K4 criticality at every ambient
point.

Take the first apex and terminal radius to be

```text
A = (0,0),       terminalRadius = rho = 1,
```

and take the retained actual blocker to be

```text
b = (1,0).
```

Use blocker-row radius `1/2`. The circles centered at `A` and `b` then meet
in exactly the two points

```text
x = (7/8,  sqrt(15)/8),
z = (7/8, -sqrt(15)/8).
```

Indeed, `dist A x = dist A z = 1` and
`dist b x = dist b z = 1/2`. Let the exact four-point blocker row be

```text
K.support = {x, z, (3/2,0), (1,1/2)}.
```

All four points have distance `1/2` from `b`, and only `x,z` lie on the
first-apex unit circle.

Choose terminal endpoints and a fourth retained terminal-class point as

```text
q = (-1,0),   w = (0,-1),   t = (0,1).
```

Then `q,w,b,t` are four distinct points on the terminal first-apex circle,
`b` survives deletion of `q,w`, and neither `q` nor `w` lies in `K.support`.
Choose the robust mate, outside the terminal carrier, as

```text
y = (sqrt(3)/2, 1/2).
```

Both `x` and `y` lie on the first-apex unit circle, while
`dist b y ≠ 1/2`; hence the exact blocker row contains the source `x` and
omits its mate `y`, as required by the OMISSION metric clause.

Finally, place a second apex at `(4,0)` and add any four points on a sufficiently
small circle about it, avoiding `q,w`. Those points witness the local
`HasNEquidistantPointsAt 4` clause but create no membership in `K.support`
and no first-apex unit-circle incidence.

This model shows that terminal endpoint geometry plus an unrelated
second-apex K4 witness does not force the missing row incidences at the
exported local interface. Any successful proof must visibly consume a new
global cap/order/criticality theorem, not merely unpack the existing payload.

## Corrected next route

Do not continue mining a direct producer of

```text
rho = terminalRadius ∧ q ∈ K.support ∧ w ∈ K.support
```

from the current terminal payload alone.

The source-current positive surface is instead the exact OMISSION residual
classifier:

- one or two blocker-row points lie on the fixed first-apex circle;
- two or three blocker-row points lie off that circle;
- every off-circle residual point survives in the terminal carrier; and
- every such point is localized to a triangle vertex or a named cap
  interior.

The next producer should use cap order/global criticality to constrain those
two or three **off-circle blocker-row residual points**, or produce the named
`U5DangerousTriple` subset consumed by
`ActualBlockerOmissionExactRowPacket.false_of_dangerousTriple_subset`.
The circle-intersection bound should be used as a negative constraint inside
that analysis, not as a request to manufacture both terminal endpoints in
the blocker row.
