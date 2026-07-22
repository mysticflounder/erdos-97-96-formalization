# Exact-five coincident global-connectivity terminal audit

Date: 2026-07-22

Status: **THE FIXED FINITE TABLE IS INCOMPATIBLE WITH STRICT KALMANSON
GEOMETRY, VIA A TEN-ATOM CORE. THIS DOES NOT CLOSE THE LIVE COINCIDENT LEAF:
THE RESIDUAL FORCES ONLY ONE OF THE CORE'S FIVE CO-RADIAL EQUALITIES. THE
FIRST MISSING THEOREM IS THE SOURCE-LEVEL OCCURRENCE OF THE OTHER FOUR ROWS
WITH ONE COMPATIBLE CYCLIC ORDER, OR AN ALTERNATIVE MEC/`noM44` TERMINAL.**

This lane owns only
`scratch/atail-force/unique5-coincident-global-connectivity-terminal/`.
It changes no production Lean, shared plan document, or proof-blueprint
state.

## Exact question

The source-clean predecessor constructs, unconditionally from

```lean
R : OriginalUniqueFiveCoincidentBlockerResidual F
```

the chain

```lean
L : CoincidentBlockerFreshCommonDeletion R
C : CoincidentBlockerMutualOmissionCycle R L
J : CoincidentBlockerJointDeletion R L C.
```

The open direct consumer remains

```lean
CoincidentBlockerJointDeletionClosingStatement R.
```

This audit asks whether global selected-witness strong connectivity, together
with the defining critical-shell fact that every deleted source belongs to
the complete row at its actual blocker, forces one of the two already checked
`CriticalFiberClosingCore` terminals.

## Theorem-bank preflight

Before constructing the scope guard, the registries required by `AGENTS.md`
were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed-corpus searches covered selected-witness strong
connectivity, exact critical shells, coincident blocker joint deletion, and
third-source pair rows.  The relevant existing checked declarations are:

- `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`;
- `exists_selectedRow_escape_of_minimal`;
- `selectedWitnessEdge_reflTransGen`;
- `source_mem_critical_support_of_no_qfree`;
- `CriticalFiberClosingCore.OrderedCrossRowCore.false`; and
- `CriticalFiberClosingCore.SameCapCollisionPairCore.false`.

No bank theorem turns a reachability path into the paired row and compatible
boundary order required by either terminal.

## What global minimality actually supplies

For any simultaneous choice of one four-point witness row at every carrier
center, minimality proves that the directed selected-witness graph is strongly
connected.  The edge relation is only

```text
target belongs to the selected row centered at source.
```

For every source `q`, the fixed critical system separately supplies the
reverse-looking incidence

```text
q belongs to the complete critical row centered at H.centerAt q.
```

These facts do not identify a path edge with an actual critical row, and a
path contributes only one target membership at each step.  The terminals
need two prescribed points in one actual row, plus either cap separation or
one six-role cyclic order.

## Kernel-checked scope guard

`CoincidentConnectivityScopeGuard.lean` gives a twelve-label exact finite
model.  It retains all of the following finite projections simultaneously:

- one four-point row at every center and no self-incidence;
- a total fixed-point-free blocker map;
- every source in the row at its actual blocker;
- no nonempty proper row-closed subset, hence strong connectivity;
- an exact five-member first-apex class whose selected first-apex row is a
  four-subset;
- full singleton-deletion robustness of that five-class in the one-radius
  shadow and failure after deleting the named pair;
- two distinct sources with one common blocker and mutual membership in its
  exact row;
- a fresh exact-five source outside the common row, whose actual row omits
  one collision source;
- a fifth source omitted by both relevant actual rows, matching the joint
  deletion construction;
- a seven-point first-cap block containing the collision, both blocker
  centers, and the fresh/joint sources, but not the first apex;
- at most two same-cap row targets for every center in that cap;
- outside-pair uniqueness for distinct centers of that cap; and
- at most two row centers through every unordered target pair.

The checked conclusions are:

```lean
only_known_centers_contain_collision_pair_checked
no_distinct_actual_blocker_through_collision_pair_checked
no_ordered_criticalFiber_occurrence_checked
```

Thus the only rows through the collision pair are the already known common
blocker row and first-apex row.  Since the blocker map omits the robust first
apex, no genuinely new actual critical row contains the pair.  The selected
row digraph is nevertheless strongly connected.  The fixed cap-compatible
boundary order also has no ordered third-source cross-row occurrence.

This is an **exact finite incidence/cap scope guard**, not a Euclidean
counterexample.  It does not realize points in `Real^2`, a common distance
matrix, the MEC disk, all three physical cap packets, or the absence of every
alternative `IsM44` support triangle.  It therefore does not refute the live
Lean residual.  It proves only that strong connectivity, critical source
membership, the exact-five continuation incidences, and the standard finite
cap/pair bounds cannot by themselves prove the terminal occurrence.

## Full strict-Kalmanson audit of the fixed table

`check_full_kalmanson.py` imposes, on all 66 abstract symmetric distances,
positivity, all 660 triangle inequalities, the 36 selected-row equalities,
the four equalities completing the exact first-apex five-class, and both
strict Kalmanson inequalities for all 495 cyclic quadruples.  Homogeneity
normalizes every strict slack to one.  The result is `UNSAT`.

Deletion minimization produces the ten-atom core recorded in
`kalmanson_result.json`:

```text
row:1:0:4                 row:1:0:8
row:4:1:3                 row:4:1:6
row:6:2:7                 row:6:2:8
row:7:4:6
row:8:3:7
kalmanson:4:8:7:1:outer
kalmanson:4:8:6:3:outer
```

Writing the six cyclically ordered points as

```text
o=4 < u=8 < v=7 < a=1 < x=6 < j=3,
```

the eight row atoms reduce to five co-radial equalities:

```text
d(a,o)=d(a,u)   d(o,j)=d(o,x)   d(x,v)=d(x,u)
d(v,o)=d(v,x)   d(u,j)=d(u,v).
```

The two strict Kalmanson inequalities then give opposite strict comparisons
between the same two distances.  Lean checks this exact algebraic consumer as
`false_of_fiveCenter_twoKalmansonCore`; the solver is used only to discover
the core.

### Occurrence audit

The live residual forces `d(o,j)=d(o,x)` from the complete exact-five
first-apex class.  It does **not** force the other four paired rows:

- the row centered at `a` is an arbitrary globally selected K4 row, not a
  row selected by the fixed critical system from the residual;
- the row centered at `x` is likewise not forced by the actual blocker row
  of the fresh source;
- the centers `v` and `u` are unnamed and unselected by the residual; and
- strong connectivity yields only one target membership per path edge, not
  two prescribed targets in each of these rows or their joint cyclic order.

Therefore fixed-table `UNSAT` eliminates this particular incidence model but
is not a proof of `OriginalUniqueFiveCoincidentBlockerResidual → False`.
The ten-atom theorem is a candidate consumer, not a live producer.

## First missing source-level theorem

The strong-connectivity lane is blocked at exactly the occurrence lift.  A
successful theorem must use information absent from the scope guard and
produce one of:

1. a third source `Y`, distinct from the collision sources, whose actual
   complete critical row contains both collision sources and whose blocker
   has the cap placement required by `SameCapCollisionPairCore`;
2. six carrier points in cyclic order satisfying the five co-radial
   equalities consumed by `false_of_fiveCenter_twoKalmansonCore` (four of
   those equalities are not yet source-forced); or
3. a complete alternative `SurplusCapPacket D.A` satisfying `IsM44`, so
   `R.base.noM44` closes the branch directly.

The theorem must visibly consume simultaneous Euclidean circle geometry, the
full MEC/three-cap partition, or `noM44`.  Another reachability theorem,
one-point escape, or finite-card row census cannot supply the missing paired
incidence.

## Validation

From `lean/`:

```bash
lake env lean -s 8192 -DwarningAsError=true \
  ../scratch/atail-force/unique5-coincident-global-connectivity-terminal/\
CoincidentConnectivityScopeGuard.lean
```

The expected axiom closure is only:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, custom axiom, `native_decide`, or
`unsafe` declaration.  No source `sorry` is closed by this audit.

From the repository root, replay the exact linear audit with:

```bash
UV_CACHE_DIR=/tmp/p97-coincident-global-uv \
  uv run --no-project --with z3-solver python \
  scratch/atail-force/unique5-coincident-global-connectivity-terminal/\
check_full_kalmanson.py --check \
  scratch/atail-force/unique5-coincident-global-connectivity-terminal/\
kalmanson_result.json
```
