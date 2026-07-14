# ATAIL legacy same-cap blocker audit (2026-07-13)

## Question

Does the older same-cap blocker/rank-lap development already provide the
missing producer for
`Problem97.ATAILForceScratch.DangerousRowSameCapSecondCenter`, or an alternate
direct contradiction from the live K-A-PAIR hypotheses?

This is proof-local parallel research explicitly authorized by Adam. The
current Route-B source and the separately owned LIVE-T1 lane were not edited.

## Sources checked

The required local theorem-bank registries and indexed Lean corpus were
searched before inspecting the source. The relevant source-proved sibling
declarations are catalogued in
`certificates/p97_rvol_general_n_mining.json` under
`RVOL.P97.WitnessLapInterface`, `RVOL.P97.U1kSourcePushout`, and
`RVOL.P97.U1kOppositeEndpoint`.

The concrete source audit used the sibling worktrees:

- `~/projects/math-projects/p97-rvol/lean/RVOL/P97/WitnessLapInterface.lean`;
- `~/projects/math-projects/p97-rvol/lean/RVOL/P97/U1kSourcePushout.lean`;
- `~/projects/math-projects/p97-rvol/lean/RVOL/P97/U1kWrongSideDischarge.lean`;
- `~/projects/math-projects/p97-rvol/lean/RVOL/P97/U1kOppositeEndpoint.lean`;
- the older `erdos-97-96-n8-worktree` copies of those files plus
  `ArcBlockContiguity.lean`, `WitnessLapGlue.lean`, and
  `docs/u-lane/97-u1k-b2a1-interface-plan.md`.

## Verdict

**PROVEN, source-audited:** the bank contains consumer-side same-cap order
machinery, not the missing ATAIL producer.

The current sibling interface calls the input
`SameCapIncompatibleEdge` (the older worktree calls it
`SameCapBlockerEdge`). Its fields already include:

```text
source index ix in an ordered cap,
center index ip in the same ordered cap,
a spent endpoint side used,
dist(center, source) = dist(center, spent endpoint).
```

No P97 source file in either audited worktree constructs this structure. An
exact-name search finds only its definition and declarations which take it as
an argument. In particular:

- `source_pushout_left` and `source_pushout_right` derive strict cap-order
  placement from an existing edge;
- `ConsecutiveOppositeEndpointEdges` packages two existing edges;
- `shared_witness_identify`, `shared_witness_degenerate`, and
  `shared_branch_fires_exit` consume that two-edge packet;
- `b2a1e_disjoint_fires_exit` and `b2a1_fires_exit` additionally assume the
  terminal `MoserOnlyIncompatibles` packet and exact class-cardinality facts;
- `StrictLapPacket` already carries the three strict global-order pushes, and
  `strictLapPacket_nonreturn` merely refutes that supplied packet.

Thus these declarations prove consequences after the production and terminal
routing work has been encoded in their hypotheses. They do not derive a
same-cap edge, a terminal packet, or a strict lap from
`DoubleApexOffSurplusSharedRadiusPair`'s binders.

The current card-11 ERASE bridge does not supply the missing geometric
production either. `ErasedCertificate/CardElevenBlocker.lean` explicitly
keeps the original `CriticalShellSystem` and defines `erasedBlocker` by
overriding only the finite-label blocker map on a prescribed row. Its
`erasedBlocker_eq_center_of_mem_row` theorem therefore routes those finite
sources to the label of `p`, but does not prove that their geometric
`CriticalShellSystem.centerAt` values equal `p` (or any other prescribed
center). The module header records exactly this limitation. Consequently that
classifier plumbing cannot be reinterpreted as a second geometric center for
the dangerous outside pair.

## Shape mismatch with the ATAIL target

**PROVEN:** even an available `SameCapIncompatibleEdge` would not directly
instantiate `DangerousRowSameCapSecondCenter`.

The legacy edge equality has this shape:

```text
dist c x = dist c e,
```

where `c`, the source `x`, and the spent cap endpoint `e` are all represented
inside one ordered cap. The ATAIL sink instead needs:

```text
p,c inside one ordered cap,
x,w outside that cap,
dist p x = dist p w,
dist c x = dist c w.
```

The dangerous exact row supplies the first outside-pair equality about `p`.
The legacy interface supplies neither a second center on that outside pair nor
a theorem moving its inside source/endpoint pair outside the cap. Calling
`outsidePair_unique_capCenter` therefore remains impossible without a new
bridge containing exactly the missing producer content.

## Conditional value of the bank

**PROVEN:** the bank is reusable if a future argument naturally produces two
consecutive same-cap incompatible edges together with the terminal packet and
card-four facts. At that point the shared/disjoint split and rank-drop
assembly should be imported rather than reproved.

**PROVEN:** it does not currently shorten K-A-PAIR. To use it as an alternate
closure route one would first need all of the following new statements from
the live ATAIL surface:

1. production of a `SameCapIncompatibleEdge` from a chosen deletion blocker;
2. production of a consecutive opposite-endpoint pair or a full strict lap;
3. discharge of the opaque terminal `MoserOnlyIncompatibles` input and the
   surviving exact-class cardinality inputs; and
4. wiring from the live five-row or six-row critical system to those packets.

That stack is strictly larger than the presently isolated one-field target
unless a new forcing theorem produces several of these packets at once.

## Decision

**HEURISTIC, evidence-backed:** keep the legacy route as a theorem bank and
regression/reference source, but do not make it the primary ATAIL producer.
The primary query remains the target-specific same-cap outside-pair
second-center implication. A future finite or geometric core which emits a
legacy edge should be checked against this bank immediately; absent such a
core, porting the interface would only move the open hypothesis into a new
structure.
