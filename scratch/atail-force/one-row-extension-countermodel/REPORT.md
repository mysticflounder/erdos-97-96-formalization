# Period-three cycle-core outside-target audit

Date: 2026-07-17

Status: **EXACT RATIONAL COUNTERMODEL (EXTERNALLY CHECKED, NOT LEAN
KERNEL-CHECKED).**

## Result

Retaining the complete period-three co-radial source / cap-straddling-blocker
core does **not** prevent even one outside-cap target from lying on a blocker
circle while remaining a strict convex-hull vertex inside the nonobtuse Moser
circumdisk.

The earlier zero-hit search in
`scratch/atail-force/all-reverse-fullrow-model/` is therefore a sampling
artifact at this strength.  Its proposed immediate theorem

```text
full period-three directed-cycle core
+ one outside-cap point on one blocker source-radius circle
-> False
```

is false.

This lane starts from the independently found rational one-target carrier in
`scratch/atail-force/one-row-extension-audit/` and adds the two missing
directed-cycle blocker centers.  It does not duplicate or reclassify the
one-row result.

## Theorem-bank preflight

Before testing the strengthened local claim, this lane checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered convex-cap perpendicular bisectors, co-radial
same-cap sources, outside-cap blocker-circle targets, MEC containment, and
strict hull vertices.  The nearest declarations remain
`Dumitrescu.perpBisector_apex_bound`, the half-plane comparisons in
`Dumitrescu/Lc1Strict.lean`, and the cap-witness counting interface in
`Dumitrescu/L5.lean`.  None excludes the configuration below:

- the target is a point on a blocker circle, not a third center on one
  perpendicular bisector;
- the proved `convex_order_implies_perpBisector_side` consumes segment
  betweenness (`Wbtw`), not this cyclic cap order; and
- `cap_witness_uniqueness` consumes an already supplied
  `CapWitnessRanking` and does not construct one.

## Exact rational construction

For rational `t`, put

```text
U(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2)).
```

Define

```text
o     = (0,0)
left  = U(0)
right = U(163/192)
q0    = U(4/231)
q1    = U(123/184)
q2    = U(3/4)

c0 = (45/86)  * (q0 + q1)
c1 = (251/500) * (q1 + q2)
c2 = (271/500) * (q2 + q0)

target = c0 + Rot(-47/149) * (q0 - c0),
```

where `Rot(t)` is the rational rotation with cosine
`(1-t^2)/(1+t^2)` and sine `2t/(1+t^2)`.

The exact counterclockwise boundary order is

```text
o, target, left, q0, c0, c2, q1, c1, q2, right.
```

The source-indexed period-three incidence skeleton can be read as

```text
row deleting q2: center c0, cap pair {q0,q1};
row deleting q0: center c1, cap pair {q1,q2};
row deleting q1: center c2, cap pair {q2,q0}.
```

Thus every row omits its deleted source and contains the adjacent reverse
source pair.  The blocker centers straddle their source pairs in the displayed
cap order.

## Exact replay and encoded ledger

Run:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/one-row-extension-countermodel/verify_exact_cycle_core_extension.py
```

Recorded output:

```text
PASS: exact rational period-three cycle-core target extension
boundary=o,target,left,q0,c0,c2,q1,c1,q2,right
physical_class_card=5
min_strict_hull_margin=523615908/1942040940625
target_outside_cap_margin=6048097762026283586/17408796949438590755
target_mec_disk_margin=412453844130246407/2265808453243028160
c1_multiplier=251/500
c2_multiplier=271/500
row0_radius_sq=284751763277/966905833181
```

The replay uses `fractions.Fraction` only and checks exactly:

1. every non-edge point is strictly left of every displayed boundary edge;
2. `left,q0,q1,q2,right` are the exact five named points at radius one from
   `o`, while `target,c0,c1,c2` are off that circle;
3. `c0` bisects `q0,q1`, `c1` bisects `q1,q2`, and `c2` bisects `q2,q0`;
4. among all named physical-cap vertices, each blocker-radius class meets the
   cap in exactly its named source pair;
5. `target` is on `c0`'s source-radius circle and lies strictly outside the
   physical cap;
6. every point lies in the exact circumdisk of `(o,left,right)`; and
7. all three squared-side inequalities for nonobtuseness of that Moser
   triangle hold.

This is an externally exact countermodel.  It is not a Lean theorem and no
Lean/Lake build was run under the active build gate.

## Scope and route correction

The model does **not** contain:

- a second outside target completing `c0`'s selected exact four-shell;
- either outside target for the `c1` and `c2` rows;
- three simultaneous complete `2+2` critical rows;
- a total source-indexed `CriticalShellSystem` beyond this local cycle;
- global K4 or deletion criticality; or
- minimality, `noM44`, the retained first-apex frontier, and the other fields
  of `FrontierCoupledExactFivePhysicalCycleParentResidual`.

Consequently this does not refute direct `False` from the full retained
parent.  It does settle the requested distinction:

```text
projected one-row carrier + one outside target     realizable;
full period-three source/blocker core + one target realizable;
full period-three complete 2+2 rows                still OPEN;
full retained parent + all-reverse membership      still OPEN.
```

The next honest local target must retain at least the second outside member
of a complete row, simultaneous complete rows, or a genuinely global
critical-map/deletion/parent coupling.  A theorem forbidding the first target
on the full directed-cycle core should be retired.

No production, shared docs, blueprint state, `ShellCurvature`, `surplusM44`,
card-five, or protected 555/654 file was modified.
