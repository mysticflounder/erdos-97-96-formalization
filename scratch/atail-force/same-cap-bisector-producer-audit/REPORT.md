# Same-cap bisector producer audit

Date: 2026-07-17

Status: **KERNEL-CHECKED TERMINAL REDUCTION AND FINITE LIVE-ROW REGRESSION.
THE RETAINED LIVE ROWS DO NOT SUPPLY THE MISSING SECOND CENTER. NO PRODUCTION
`sorry` IS CLOSED.**

## Question

Starting from the checked `RobustCollisionCapOutsidePair` projection, can any
of the five live critical source rows, the extra `f2` row, or another source
of the same retained `CriticalShellSystem` produce a second distinct center
in the same indexed cap which is equidistant from the extracted outside pair?

## Required bank preflight

Before deriving a new incidence statement, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered outside-pair cap-center
uniqueness, same-blocker fibers, critical support intersections, and a second
actual blocker through a common pair. They found the existing terminals

```text
CapSelectedRowCounting.outsidePair_unique_capCenter
ATailTwoCenterCapLocalization.false_of_two_cap_centers_equidistant_outside_pair
ATailThirdCenterCommonPair.false_of_thirdActualCenter_selectedRow_contains_frontierPair
Dumitrescu.perpBisector_apex_bound
```

but no producer deriving the required second center/equality from one
anonymous blocker fiber or from the six live rows.

## Exact checked terminal

`SameCapBisectorProducerAudit.lean` packages one actual critical shell, an
indexed cap containing its center, and two distinct points of that shell
outside the cap as

```lean
CriticalShellCapOutsidePair S H.
```

It proves the minimal geometric consumer

```lean
false_of_secondCenter_sameCap_equidistant_outsidePair
```

whose only new data are

```text
secondCenter in the same indexed cap
secondCenter != commonCenter
dist secondCenter outside1 = dist secondCenter outside2.
```

Thus row provenance is not part of the mathematical terminal. For an actual
critical row, the sufficient row-based adapter is

```lean
false_of_secondActualCenter_sameCap_contains_outsidePair.
```

It replaces the last distance equality by the two support memberships

```text
outside1 in H.selectedAt source ... .support
outside2 in H.selectedAt source ... .support.
```

Finally,

```lean
not_exists_actualCriticalRow_sameCap_contains_outsidePair
```

quantifies over **every source of the retained critical map**. Therefore it
already covers the five live rows `q,t1,t2,t3,u` and the extra `f2` row once
their constructor-level common provenance is retained. The exact missing
row producer is the conjunction

```text
centerAt(source) in the chosen cap
centerAt(source) != commonCenter
outside1 and outside2 both in selectedAt(source).support.
```

All three checked theorems have axiom closure exactly

```text
propext, Classical.choice, Quot.sound.
```

## Audit of the actual live rows

The outer Route-B wrapper constructs:

- critical rows at sources `q,t1,t2,t3,u`; and
- `f2CriticalRow` at one selected slot of the `t2` source row;

all from the same `CriticalShellSystem`.

That provenance gives only the following relevant positive facts:

1. every row contains its own source;
2. equal blocker centers force equal complete exact supports; and
3. the `f2` source is one point selected from the `t2` row.

None of these identifies either anonymous extracted outside point with a live
source, puts a live blocker center in the chosen cap, or puts both extracted
points in another live support. The p-centered dangerous row does not repair
this:

- if its center is the collision's common center, it is the first center, not
  a second one; and
- if its center is distinct, the retained fields give no lower bound of two
  on its support intersection with the anonymous common shell.

The available support-intersection theorems are upper bounds. They cannot
manufacture the two required cross-memberships.

## Exact finite regression with the live prefix

`LiveRowsFiniteBoundary.lean` gives a kernel-checked `Fin 12` incidence model.
It is not a Euclidean counterexample, but it retains all finite fields under
discussion simultaneously.

The named live labels are

```text
p=0, q=1, t1=2, t2=3, t3=4, u=5.
```

The model satisfies:

- the six labels are pairwise distinct;
- `blocker(t2)=p` and the `t2` critical support is exactly
  `{q,t1,t2,t3}`;
- the selected `f2` source can be `q`, whose blocker and complete support are
  again `p` and `{q,t1,t2,t3}`;
- the blocker map is total, fixed-point-free, exact-support-locked on fibers,
  and omits the robust center `t3`;
- every center has a selected four-row and every nonempty row-closed subset is
  the whole carrier;
- `q` and `t1` are distinct sources sharing common blocker `p` and its exact
  support; and
- the modeled cap `{p,t2,t3}` contains the common blocker, while the exact
  common support has outside pair exactly `{q,t1}`.

Nevertheless,

```lean
no_second_center_through_live_outsidePair_checked
no_live_source_supplies_second_center_checked
no_live_ordinal_triangle_checked
```

show that no other represented center, including any live-source blocker,
contains both outside points. The third theorem also shows that the same
finite live surface has no six-distinct-role completion of the checked
ordinal `O,A,X,J,C,K` incidence triangle.

This is an exact regression inside the displayed finite abstraction. It does
not show that the full Euclidean/MEC parent admits such a model. It does show
that blocker-map incidence, shared critical provenance, the p-centered exact
dangerous row, the extra `f2` row, image omission, and selected-row minimality
closure cannot by themselves derive the missing producer.

## Audit of the corrected ordinal alternative

The checked generic ordinal terminal uses

```text
O < A < X < J < C < K
O-row contains J,C     giving OJ = OC
A-row contains C,K     giving AC = AK
X-row contains J,K     giving XJ = XK.
```

Only `A` needs to be a collision-row center. The current common-blocker
collision can name its two distinct fiber sources `C,K`, so it supplies the
entire `A`-row pair automatically.

The existing live rows supply only partial prefixes of the other two rows:

- the retained first-apex/robust center `O` has global K4 rows, but neither
  full deletion robustness nor the frontier packet forces one selected
  `O`-row to contain the anonymous collision source `C` together with a
  distinct `J`;
- any live or arbitrary critical-map source can be named `J`; its own critical
  row then supplies a center `X` and the membership `J in X-row`;
- no retained field supplies the load-bearing cross-membership `K in X-row`;
  and
- no retained field puts these six anonymous roles in the required cyclic
  order.

Thus an ordinary live row **can** supply `X` and the first `X`-row membership,
but it cannot complete the triangle. The first missing incidence after
choosing `J` is exactly

```text
K in (H.selectedAt J ...).support,
```

together with the robust-row pair and cyclic placement. Equal-center support
transport does not produce this: it either returns the already-known
`A`-support or requires the desired center identification as an antecedent.

The finite regression makes the non-implication concrete. With
`O=robustCenter`, `A=commonBlocker`, and `C,K` the two collision sources, its
robust and collision rows already have the required shared `C`; nevertheless
there are no distinct `X,J` completing the `X`-row cross-incidence, even
before imposing the cyclic order.

## Route verdict

Scanning or case-splitting the six existing live rows is **blocked as an
incidence-only producer route**. The next valid step must add genuinely new
geometric/source-localizing force which proves either:

1. the minimal same-cap distance equality above; or
2. the stronger same-cap two-support-membership packet; or
3. the ordinal robust-row pair, ordinary-row cross-membership, and six-role
   cyclic placement described above.

Equivalently, a multi-fiber/order theorem may avoid choosing this terminal
and close through an ordinal Kalmanson cycle. What will not help is another
row-name split, equal-center support transport, or a second selected row at
the common blocker.

## Validation and scope

Both owned Lean files compile without `sorry`, `admit`, declared axioms,
`native_decide`, or unsafe code. The finite proofs use `decide`; their printed
closures use only the ordinary Lean quotient/propositional axioms shown by
the compiler.

No production file, plan document, generated blueprint, protected unique-row
artifact, `SurplusM44`, or shell-curvature file was modified.
