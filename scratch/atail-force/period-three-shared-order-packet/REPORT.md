# Period-three shared-order / first-apex packet interface

Date: 2026-07-17

Status: **THE SMALLEST HONEST ON-SPINE CLOSER IS `P + K + PERIOD=3 +
ALL-REVERSE -> FALSE`.  IT MUST NOT ACCEPT A NEW `hsharedOrder` HYPOTHESIS.
THE CONVEX BOUNDARY AND REVERSE SHARED-CAP ORDER ARE DERIVED PRODUCERS.  THE
REUSABLE GEOMETRY IS A PERIOD-PARAMETRIC LOCAL-EXTREMUM DISJOINTNESS LEMMA;
THE PERIOD-THREE GLOBAL PRUNING AND THE FINAL T0/T1 METRIC CONTRADICTION ARE
SEPARATE.  THE CURRENT SIX-CELL/16-POINT SOLVER IS NOT SOURCE COVERAGE.  NO
PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/period-three-shared-order-packet/`. It did not edit
production Lean, shared plans, proof-blueprint state, protected scratch lanes,
`ShellCurvature`, `SurplusM44`, or git state. No Lean or Lake command was run.

## Required theorem-bank preflight

Before designing the interface, this lane checked every registry required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered period-three critical
omission cycles, all-reverse rows, shared convex boundary order, strict
Kalmanson closure, and convex-boundary enumeration. No banked theorem closes
this surface. The nearest indexed candidate,
`WitnessLapInterface.strictLapPacket_nonreturn`, consumes a separately
produced global strict-lap packet and does not derive that packet from the
current cycle. It is not an immediate reuse.

The preflight did confirm current reusable endpoints:

- `ConvexCyclicOrderConstruct.exists_isCcwConvexPolygon_of_convexIndep`;
- the two full strict inequalities in `ATail.CapCrossingKalmanson`;
- `ATailOrdinalKalmansonCycle` for ordinal cycles;
- the scratch `KalmansonFarkasConsumer.HomogeneousFarkasCore` checker; and
- the exact reverse-row/outside-pair facts already listed below.

## 1. Public closer: no independent shared-order hypothesis

`PeriodThreeSharedOrderPacket.lean` records the immediate consumer as:

```lean
abbrev FalseOfPeriodThreeAllReverseFirstApexRows
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0) : Prop :=
  forall (P : FirstApexShellRolePacket F0 R)
      (profile : LargeCapUniqueFiveSecondApexRadius D S)
      (K : PhysicalActualCriticalOmissionCycle H profile),
    K.period = 3 -> AllReverseMembership K -> False
```

The theorem consumes exactly:

```lean
P : FirstApexShellRolePacket F0 R
profile : LargeCapUniqueFiveSecondApexRadius D S
K : PhysicalActualCriticalOmissionCycle H profile
hperiod : K.period = 3
hreverse : AllReverseMembership K
```

This shape is preferable to

```lean
... (hsharedOrder : SourceFaithfulSharedBoundaryOrder P K) : False
```

for a substantive reason: a whole-carrier CCW boundary follows from
`D.convex` and `S.hncol`, while one shared strict-cap order for the reverse
cycle is intended to follow from `K + allReverse`. Making either one a new
public hypothesis creates another missing producer and moves the obligation
off the parent surface.

The finite case split and any rational Farkas certificates belong inside the
proof of the displayed proposition. They are proof terms, not mathematical
hypotheses of the parent theorem.

## 2. Field-by-field implication audit

| Field or fact | Status | Exact implication direction |
| --- | --- | --- |
| `D.convex`, `S.hncol`, global `D.K4` | **PRODUCTION-PROVEN DATA** | Live data from `D` and the common `SurplusCapPacket S`; a whole-carrier CCW boundary can be produced from the first two. |
| `F0 : CriticalPairFrontier D S radius H` | **PRODUCTION-PROVEN EXTRACTOR** | Global K4 plus the retained concrete `H` produces the first-apex pair/frontier. |
| `R : FrontierCommonDeletionParentResidual F0` | **LIVE PARENT DATA** | Carries minimality, no-`M44`, and both prescribed-apex common-deletion facts; it is not reconstructed from the cycle. |
| `P : FirstApexShellRolePacket F0 R` | **SOURCE-AUDITED STATEMENT; EXTRACTOR NOT YET LEAN-IMPLEMENTED** | Intended finite subset selection from `F0` and `R.common.firstApexDouble`. Accepting `P` is honest only if the implementation also lands its producer. |
| `P.retainedRow`, `P.doubleRow` | **SELECTED ROWS ONLY** | Membership implies equal distances from `S.oppApex1`. Neither support is an exact ambient radius class or a critical CSS shell. |
| `P.sameRadius_six` | **CARDINALITY LOWER BOUND** | `doubleRadius = radius -> 6 <= SelectedClass.card`; it does not say the class has exactly six points or that T0/T1 overlap maximally. |
| `P.distinctRadius_disjoint` | **SUPPORT DISJOINTNESS** | `doubleRadius != radius -> Disjoint T0 T1`; it supplies no exactness for either row. |
| `profile` | **PRODUCTION-PROVEN BRANCH DATA** | The physical second apex has one complete unique K4 radius class of cardinality five. It is independent of `F0` except for shared `D,S,H`. |
| `K : PhysicalActualCriticalOmissionCycle H profile` | **PRODUCTION-PROVEN EXTRACTOR** | The exact-five omission successor produces a genuine cycle indexed by the same global `H`. |
| `hreverse` | **PRODUCTION-PROVEN EXHAUSTIVE SPLIT ARM** | `nonempty_mutualOmissionEdge_or_all_reverseMembership K` supplies this arm; it is not automatic for every cycle. |
| `hperiod : K.period = 3` | **ARITHMETIC CASE ASSUMPTION** | All-reverse proves only `3 <= period`; production proves `period <= 5`. Periods 4 and 5 remain sibling branches. |
| reverse support has adjacent cap pair plus two outside points | **CHECKED SCRATCH CONSEQUENCE OF `K + hreverse`** | `successor_actualCriticalSupport_inter_physicalCap_eq_pair` and the outside-cardinality theorem; do not duplicate as free fields. |
| reverse centers and outside pairs are injective | **CHECKED SCRATCH CONSEQUENCE OF `K + hreverse`** | `reverseRowCenter_injective` and `reverseOutsidePair_injective`; a blocker may still equal a nonincident cycle source. |
| one shared strict-cap order with every blocker straddling its incident source pair | **SOURCE-FAITHFUL PRODUCER STATEMENT; NOT YET LEAN-PROVED** | Derivable by choosing one `StrictCapBlockData` and factoring the fixed-block version of the existing per-row straddle proof. |
| full strict Kalmanson inequalities for distinct named points | **PRODUCTION-PROVEN AFTER BOUNDARY EXTRACTION** | Apply the two `CapCrossingKalmanson` theorems to a whole-carrier CCW enumeration. Identity branches must be quotiented before strict inequalities are instantiated. |
| `False` from all named T0/T1 and reverse rows | **OPEN NEW MATHEMATICS** | This is the actual period-three closer. No current theorem or source-complete finite certificate proves it. |

The most important negative entry is the selected-row direction:

```text
x,y in T0.support  -> dist O x = dist O y
x,y in T1.support  -> dist O x = dist O y
```

There is no converse and no exact-shell conclusion. Any finite encoding that
excludes unnamed points from either radius class is stronger than the live
source.

## 3. Reusable decomposition

### A. Period-parametric shared cap order

The scratch file records the smallest generic packet:

```lean
structure ReverseCycleSharedCapOrder (K : ...) where
  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)
  sourceIndex : Fin K.period -> Fin block.m
  blockerIndex : Fin K.period -> Fin block.m
  source_point : ...
  blocker_point : ...
  straddle : forall i,
    sourceIndex i < blockerIndex i < sourceIndex (successorIndex i) or
    sourceIndex (successorIndex i) < blockerIndex i < sourceIndex i
```

It deliberately omits source/blocker injectivity fields because those are
derived from point identities and the already-proved injectivity theorems. It
also does not assert that all source and blocker roles are distinct.

### B. Uniform local-extremum metric lemma

For a predecessor `j` of `i`, if the shared-order index of source `i` is a
strict local minimum or maximum relative to sources `j` and `succ i`, then
the two incident outside pairs are disjoint:

```lean
Disjoint (reverseOutsidePair K j) (reverseOutsidePair K i).
```

This is the reusable theorem for periods 3, 4, and 5. Its proof is the
pointwise same-side argument from
`shared-order-pointwise-consumer/REPORT.md`: a hypothetical common outside
point and the common cap source are co-radial from two distinct cap centers on
the same side of that source, contradicting strict convex cap order.

The remaining Lean precursor is the pointwise extreme-pair hull-line wrapper,
an API factoring of geometry already proved in `CapCrossingKalmanson`; it is
not a new finite-pattern conjecture.

### C. Period-three-only global pruning

For a 3-cycle, the minimum and maximum source positions are adjacent in the
transition cycle. Applying the local theorem twice makes one reverse outside
pair disjoint from both other pairs. Together with pair cardinality two and
outside-pair injectivity, this forces the three-pair union to have cardinality
at least five.

This is pruning, not `False`. The analogous global conclusion is not uniform
in periods four and five: their minimum and maximum can be nonadjacent. The
uniform local theorem should be promoted once, while the union argument stays
inside the period-three closer.

### D. Final period-three T0/T1 metric contradiction

The only genuinely new terminal step must combine:

- the actual T0/T1 selected supports and role domains from `P`;
- the three actual exact reverse rows and outside residuals from `K`;
- the true identity quotient among these roles;
- the common convex boundary order; and
- enough strict Kalmanson inequalities to derive `False`.

If a source-complete UNSAT decision exists, its small rational cores can be
lowered through `KalmansonFarkasConsumer.HomogeneousFarkasCore` and the
existing strict Kalmanson theorems. The generated coverage theorem must prove
that every live role/identity/order assignment selects one checked core.

## 4. Why the current finite decision is not the interface proof

`period-three-first-apex-kalmanson/SOURCE_AUDIT.md` correctly classifies
`decide_quotient.py` as a SAT-first diagnostic. Its six coarse cells fix one
16-point representative each. The missing live coverage includes:

1. all 31 labelled same-radius role assignments;
2. equal-radius T0/T1 overlap sizes zero, one, and two, with fresh completion
   points and ambient first-apex classes larger than six;
3. all legal unequal-radius completion roles for both rows;
4. all equality partitions between the independent F0/T0/T1 and exact-five
   cycle surfaces;
5. physical exact-five profiles with three, four, or five strict-cap hits;
6. legal reverse-center/nonincident-source identifications;
7. fresh reverse outside targets and all cross-row sharing partitions;
8. arbitrary carrier cardinality after every required named point is retained;
9. a proved common-order adapter; and
10. both boundary orientations, or a proved reflection invariance.

Therefore:

- **fixed-cell SAT** means only that the projected abstract linear metric
  constraints in that cell are compatible;
- **fixed-cell UNSAT** is valid only for that cell;
- the current loop reaching its end would not be source-coverage UNSAT; and
- no result from that script alone justifies the public `False` proposition.

## 5. Exact decision boundary

### If a repaired quotient is coverage-UNSAT

Implementation is justified only after the enumerator supplies:

- a source-to-cell coverage proof for every role, identity, and order branch;
- both reflections or a checked invariance theorem;
- exact rational Farkas cores for every normalized cell/orbit; and
- a Lean transport from actual row memberships to each core equality.

Then the implementation order is:

1. land the `FirstApexShellRolePacket` producer;
2. land the generic `ReverseCycleSharedCapOrder` producer;
3. land the pointwise local-extremum disjointness theorem;
4. land the period-three global pruning theorem;
5. kernel-check the generated cell coverage and Farkas cores; and
6. prove `FalseOfPeriodThreeAllReverseFirstApexRows`, then wire it into the
   period split before downstream LIVE slot enumeration.

### If a repaired quotient is SAT

A SAT result must be classified by the strongest constraints actually in the
model:

- SAT under the complete abstract metric plus full Kalmanson closure shows
  that cyclic-order linear inequalities and the named row equalities are
  insufficient;
- it is not a planar Euclidean realization unless a Euclidean distance
  embedding is separately certified;
- it is not an MEC realization unless the enclosing-disk and cap-segment
  conditions are included; and
- it is not a live source countermodel unless the total CSS, deletion
  failure, minimality, and no-`M44` fields extend to the witness.

The exact next omitted-field boundary is then the first one of these extensions
that rejects every surviving source-complete linear cell. It should be tested
in this order:

1. planar Euclidean realizability of the named distance table;
2. MEC/cap-segment constraints for the same named points;
3. extension of the three reverse rows to the retained total CSS and
   source-by-source deletion failure; and
4. the parent `D.Minimal` / `R.noM44` constraints.

Do not respond to SAT by adding another arbitrary producer packet. Add the
first rejected live extension directly to the theorem proof or state its
precise antecedent and immediate consumer together.

## 6. On-spine wiring and remaining branches

The intended branch call is:

```text
robust exact-five parent
  -> physical omission cycle
  -> mutual-omission arm or all-reverse arm
  -> period split 3 / 4 / 5
  -> period-three all-reverse first-apex closer (this interface)
  -> False.
```

This closes only the period-three all-reverse subbranch. Mutual omission and
periods four/five remain separate obligations. The period-four/five audit
shows that the local-extremum lemma remains useful there, but its period-three
union consequence does not transfer unchanged.

The parent also needs an implemented producer for
`FirstApexShellRolePacket F0 R`; that is finite selection/provenance plumbing,
but it is still a real Lean dependency and must not be hidden by accepting
`P` as if it were already constructed.

## Epistemic ledger

| Claim | Status |
| --- | --- |
| Production cycle, period bounds, and all-reverse split | **PRODUCTION-PROVEN** |
| Exact reverse cap intersection and two-point outside residual | **CHECKED SCRATCH SOURCE** |
| `FirstApexShellRolePacket` field statement | **SOURCE-AUDITED; PRODUCER NOT YET ELABORATED** |
| Generic shared-cap order producer | **SOURCE-FAITHFUL STATEMENT; NOT YET LEAN-PROVED** |
| Local-extremum outside-pair disjointness | **PAPER REDUCTION TO EXISTING GEOMETRY; NOT YET LEAN-PROVED** |
| Period-three isolated-pair / union-at-least-five conclusion | **FINITE/PAPER CONSEQUENCE; NOT YET LEAN-PROVED** |
| Current six-cell solver as source coverage | **REFUTED BY SOURCE AUDIT** |
| Period-three direct `False` | **OPEN** |
| Production `sorry` closed | **NONE** |
| Lean/Lake validation | **NOT RUN BY INSTRUCTION** |
