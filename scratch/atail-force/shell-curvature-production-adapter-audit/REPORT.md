# Shell-curvature production adapter audit

Date: 2026-07-16

Status: **MULTI-CORE SOURCE ADAPTER KERNEL-CHECKED; FINITE ANGLE-CHART
CONSTRUCTOR AND TERMINAL CURVATURE CONSUMER OPEN. NO PRODUCTION `sorry` IS
CLOSED.**

## Scope

This lane is read-only with respect to:

- `scratch/atail-force/shell-curvature/ShellCurvature.lean`;
- `scratch/atail-force/shell-curvature/REPORT.md`; and
- all production Lean and shared closure documents.

The audit asks two separate questions:

1. can the production convex-boundary representation construct the scratch
   `LiftedPolygonAngleChart`; and
2. does an existing retained-shell, Kalmanson, or cap-block theorem consume
   either shell-curvature headline conclusion?

The answer to both questions is currently **no**, but the robust multi-core
endpoint does source the exact two-shell input on which a new curvature
consumer should be stated.

## `RobustSecondApexMinimalDeletion` status

`RobustSecondApexMinimalDeletion` is not an unproved theorem. The checked
theorem

```text
robustSecondApexMinimalDeletion_reduction
```

already returns the collision, multi-core, or installed-singleton endpoint.
The open work is terminal consumption of those endpoints.

Only the multi-core endpoint matches shell curvature:

- collision: one equal-distance pair at the fresh center, not four ordered
  shell targets;
- multi-core: at least two exact four-shells, all centered at the fresh
  carrier point, with pairwise-disjoint supports;
- installed singleton: one installed exact shell plus one omitted target,
  not two disjoint shells.

The owned theorem

```text
exists_two_disjoint_exactFourShells_at_freshCenter
```

selects two actual source indices from the multi-core and returns their
pairwise-disjoint exact supports. The companion

```text
freshCenter_mem_carrier
```

records that their common center is an actual vertex of the counterexample.
Both kernel-check with only `propext`, `Classical.choice`, and `Quot.sound`.

This is a source adapter, not a contradiction.

## Production boundary data that is available

The source graph already exports the finite combinatorial geometry needed to
locate a shell on one convex boundary:

- `CGN4g0_globalBoundaryOrder_of_convexIndep` constructs an injective
  `phi : Fin n -> R^2` with the correct image and
  `EuclideanGeometry.IsCcwConvexPolygon phi`;
- `CGN.StrictCapBlockData` retains the ambient boundary, a local ordered cap,
  and a strictly increasing local-to-global index map;
- `SurplusCapPacket.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices`
  supplies the parent boundary cut and the Moser-apex indices;
- `ConvexCyclicOrder.isCcwConvexPolygon_subsequence` transports CCW order to
  an increasing selected subsequence; and
- `IsCcwConvexPolygon.sign_oangle` and the current signed-area wrappers supply
  the orientation signs used by the equal-radius headline theorems.

Those declarations are enough for finite index order and cap-block placement.
They are not a real direction lift.

## Exact angle-chart gap

`LiftedPolygonAngleChart` asks for all of the following on `Nat`:

```text
point
edgeArg
chordArg
edgeArg_lifts
chordArg_lifts
edgeArg_strictMono
chordArg_bounds
chordTurn_le_pi
```

Production has no declaration constructing the last five proof fields from
`IsCcwConvexPolygon`. In particular:

| Chart field | Current source status |
| --- | --- |
| finite `point` window | derivable from the global boundary enumeration |
| pointwise real angle representative | derivable via `Real.Angle.toReal`, modulo a branch choice |
| one compatible unwrapped edge lift | absent |
| strict monotonicity of that lift | absent |
| every chord direction between its endpoint edge directions | absent |
| principal forward chord-turn bound `<= pi` | absent |
| exact one-cycle `+ 2*pi` edge period | absent |

`ConvexCyclicOrderConstruct.cutKey` is not this constructor. It linearizes
radial `arcAngle c point` values around an interior reference center; the
scratch chart lifts directions of polygon edges and arbitrary chords.
`CGN.StrictCapOrder.chord_projection_strict` is also insufficient: it orders
projection onto one endpoint chord, not all edge and chord arguments.

The legacy `N9Geometry.lean` inventories contain useful local branch lemmas:

```text
angle_toReal_sub_eq_sub_of_mem_Ioc
angle_toReal_sub_eq_sub_sub_two_pi_of_pi_lt
angle_toReal_sub_eq_sub_add_two_pi_of_le_neg_pi
angle_toReal_between_of_pos_subangles
angle_toReal_outside_of_pos_subangles_wrap
```

They are not import-reachable production constructors, and even together they
do not prove edge-lift monotonicity, chord bounds, or the full-turn period.

### Required constructor theorem

The current global-`Nat` chart is not the right production-facing interface:
the source is one finite `Fin n` polygon, while the chart requires its laws at
every natural index, including indices outside the one cycle used by the
proof. A source-faithful next object should be a finite-window chart whose
laws are bounded by `cycleEnd`.

The required theorem shape is:

```text
exists_finiteLiftedPolygonAngleChart_of_ccw
  (hn : 3 <= n)
  (hinj : Function.Injective phi)
  (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
  (cut : Fin n) :
  Nonempty (FiniteLiftedPolygonAngleChart phi cut)
```

where `FiniteLiftedPolygonAngleChart phi cut` must provide, on exactly one
cut-open cycle:

1. real edge and forward-chord lifts tied to `arcAngle`;
2. strict increase of consecutive edge lifts;
3. `edgeArg i <= chordArg i j <= edgeArg (j-1)`;
4. `chordArg j k - chordArg i j <= pi`; and
5. the closing-edge lift equal to the pre-cut edge lift plus `2*pi`.

After that bounded constructor exists, the existing shell-curvature algebra
should be generalized from the global chart to the bounded interface. Trying
to construct arbitrary geometry outside the finite cycle solely to inhabit
the current `Nat` record would add a non-source obligation.

## Consumer audit

No current theorem mentions `arcCurvature`, `exteriorTurn`,
`two_sided_quarter_turn_separation_of_equal_radius`, or
`closed_middle_arc_add_center_turn_lt_pi_of_equal_radius` outside the
shell-curvature scratch lane.

The production Kalmanson sink

```text
CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order
```

does not consume curvature. It needs five ordered boundary labels, three
actual selected rows, and six named support memberships. Neither headline
curvature conclusion produces those row incidences. Conversely, Kalmanson
strict inequalities do not construct the chart's real angle lifts.

The earlier parent-order adapter supplies an ambient boundary and a two-arm
internal cap order, but not the fixed five-role order or row memberships. It
therefore does not bridge this gap.

The shell-curvature result alone is not terminal. The original Lemma 30 route
also needs the unformalized cap statement that the two middle targets occupy
separate cap blocks. The current scratch theorem deliberately omits that
conclusion, and there is no retained-shell theorem consuming only its four
quarter-turn inequalities.

## Smallest honest next consumer

The next direct mathematical target should be restricted to the multi-core
arm and should visibly consume both the cap placement and the two exact
shells. It must not be stated as the false universal claim that any two
disjoint concentric four-shells at a convex-boundary vertex are impossible.

The dependency split should be:

```text
middle_targets_cross_capBlocks_of_exactFourShell_at_strictCapCenter
```

which orders one exact support around the common center and proves the
source-valid cross-block placement, followed by

```text
false_of_two_disjoint_exactFourShells_at_strictCapCenter
```

which consumes:

- `D.convex` and one shared CCW boundary;
- `fresh.center_mem_capInterior`;
- the two exact shell supports returned by the owned adapter;
- their support disjointness;
- the bounded lifted-angle chart; and
- the cross-block placements of both shells.

The terminal proof may then use the checked quarter-turn separation and
closed-middle-arc budget. Until the cross-block theorem and the terminal
packing argument exist, promoting the chart alone will not close the
multi-core arm.

The collision and installed-singleton arms still require different consumers.

## Bank and indexed-corpus preflight

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- real lifts of convex-polygon edge and chord directions;
- unwrapped exterior-angle sums and a `2*pi` period;
- chord directions between boundary edge directions;
- retained critical shells plus curvature/quarter-turn conclusions; and
- Kalmanson or cap-block consumers of the two headline theorems.

No exact chart constructor or curvature consumer was found. The useful hits
were the current `cutKey`, the production Kalmanson bridge, the sibling
strict-lap interface, and the legacy local `Real.Angle.toReal` branch lemmas
listed above. None fills either open theorem.

## Validation

Focused compile:

```text
lake env lean -DwarningAsError=true -R .. \
  ../scratch/atail-force/shell-curvature-production-adapter-audit/\
    ShellCurvatureProductionAdapterAudit.lean
```

Result: exit 0. The two printed axiom closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.
