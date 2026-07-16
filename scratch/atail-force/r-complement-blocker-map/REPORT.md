# R complement: total blocker-map audit

Date: 2026-07-15

Status: **kernel-checked scratch result; no production or closure document was
changed**.

## Outcome

The total `CriticalShellSystem` map sharpens the retained robust-pair branch,
but does not close it.  The exact source-current normal form is now checked in
`RobustPairBlockerNormalForm.lean`.

For a retained ambient history pair `x,y`, write `c_x` and `c_y` for the
chosen blockers and let

```text
S_xy := K4 survives after deleting y at c_x
S_yx := K4 survives after deleting x at c_y.
```

Then:

```text
c_x = c_y  iff  not S_xy and not S_yx
c_x != c_y iff  S_xy or S_yx.
```

By `cross_deletion_survives_iff_not_mem_selected_support`, each survival is
exactly omission of the mate from the corresponding chosen exact support.
This yields the disjoint three-way normal form

```text
1. c_x = c_y, the common blocker is outside the surplus cap,
   and both directed cross incidences occur; or
2. c_x != c_y and S_xy; or
3. c_x != c_y, the x-row contains y, and S_yx.
```

The common-blocker arm consumes the ordered-cap theorem
`false_of_sourceBlocker_surplus_cross`: reciprocal cross incidence forces a
coincident blocker to be outside the surplus cap.  Conversely, if both
blockers are in the surplus cap, both cross deletions survive and the blockers
are distinct.

The pair's simultaneous survival at both prescribed apices also proves that
both actual blockers differ from both prescribed apices.

## What blocker iteration adds

`exists_reachable_blocker_cycle` strengthens the existing global
`exists_blocker_cycle`: for any named source, including the robust endpoint
`x`, some vertex on its actual blocker orbit lies on a genuine period-`k`
cycle with `2 <= k`.

This is the sharp unconditional iterated statement.  The robust-pair fields do
not propagate past the first blocker step.  A later orbit vertex is known to
be the source of its own exact critical row, but it is not known to be
co-radial with `x` or `y`, outside the surplus cap, or part of a double-survival
pair.  Therefore periodicity alone cannot be fed back into the ordered-cap
pair consumer.

## Exact finite boundary

`FiniteBlockerCycleBoundary.lean` is a finite radius-class/incidence
abstraction, not a Euclidean counterexample.  It retains:

- a `(5,5,5)` cap cover;
- two distinct strict-first-opposite-cap history endpoints;
- their ambient co-radial row;
- independent four-point rows surviving both erasures at both prescribed
  apices;
- a total source-indexed exact-card-four critical-row table;
- source membership, exact one-point destruction after source deletion, and
  no fixed blocker; and
- equality of selected supports whenever blockers coincide.

Nevertheless the two history endpoints are each other's blockers, hence form
a genuine blocker two-cycle.  Both blockers remain outside the surplus cap,
both directed cross incidences fail, deleting either mate leaves the other
source's exact four-support intact, and no recorded center contains the pair.

Thus neither totality nor blocker-cycle extraction resolves the complement at
the current finite interface.

## Theorem-bank preflight and the next missing field

The required registries were checked before proving the local normal form:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches found and reused the current reciprocal blocker and
deletion/support theorems in `ATail/CriticalPairFrontier.lean`.  They also
surfaced the sibling `p97-rvol` ordered-cap blocker-walk bank:

- `SameCapIncompatibleEdge`;
- `source_pushout_right` / `source_pushout_left`;
- `ConsecutiveOppositeEndpointEdges`; and
- the `b2a1` shared/disjoint exit family.

That bank does not yet accept the live R data.  The first missing field is a
**cap-oriented blocker-edge realization**.  For the first live orbit edge
`u -> blocker(u)`, it must provide one of:

1. a same-cap edge together with a spent cap endpoint `e` satisfying

   ```text
   dist (blocker u) u = dist (blocker u) e
   ```

   which is exactly `SameCapIncompatibleEdge.endpoint_radius_eq`; or
2. a cross-cap edge together with a strict advance in one global convex-boundary
   order.

The live pair supplies neither.  “Blocker outside the surplus cap” does not
identify which opposite cap contains it, and source membership in the chosen
critical row does not put either cap endpoint in that row.  The older opposite-
endpoint exit additionally needs its seed-fixed terminal exclusion; that is
also not present in this R normal form.

Accordingly, the next producer should target the cap-oriented blocker-edge
realization, not another unstructured blocker cycle.  Its first regression
case must reject the checked two-cycle boundary above.

## Validation

The scratch dependency chain and both owned Lean files were checked with Lean
4.27.0 and an 8192 MB cap.  Temporary dependency oleans were written only
under `/tmp/atail-r-blocker-oleans`.

```text
DoubleSurvivorConsumer.lean       PASS
SubcarrierTerminalInvariant.lean PASS
RobustPairBlockerNormalForm.lean  PASS
FiniteBlockerCycleBoundary.lean   PASS
```

Every printed endpoint depends only on the standard Mathlib axioms
`propext`, `Classical.choice`, and `Quot.sound` (one decidable finite theorem
does not need `Classical.choice`).  No `sorryAx` or custom axiom appears.

