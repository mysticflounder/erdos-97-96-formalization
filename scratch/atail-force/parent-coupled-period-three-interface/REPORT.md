# Parent-coupled period-three interface

Date: 2026-07-17

Status: **SOURCE-CLEAN SCRATCH COORDINATOR. THE ORIGINAL FIRST-APEX
`F0, R` DATA AND THE ACTUAL `K := E.cycle` ARE NOW ASSEMBLED WITHOUT A
FRONTIER EQUALITY. BOTH AUXILIARY PACKETS ARE PRODUCED, BUT THE PERIOD-THREE
`False` PROPOSITION REMAINS OPEN. NO PRODUCTION CONSUMER OR `sorry` IS
CLOSED.**

This lane owns only
`scratch/atail-force/parent-coupled-period-three-interface/`. It does not edit
production Lean, other scratch lanes, shared documents, proof-blueprint state,
or git.

## Required preflight

The lane read `AGENTS.md` and `CLAUDE.md`, checked the theorem-bank registries
required there, and searched the indexed Lean corpora for:

- an exact-five parent residual already coupled to original first-apex rows;
- a shared reverse-cycle cap order produced by all-reverse membership; and
- a period-three physical omission-cycle closer.

The indexed corpus returned the production
`ExactFivePhysicalCycleParentResidual`,
`nonempty_exactFivePhysicalCycleParentResidual`,
`nonempty_physicalActualCriticalOmissionCycle`, and `period_le_five`. It did
not return an existing parent-coupled period-three closer. The source audit
also confirmed that the theorem-bank registries contain bounded local and
incidence consumers, not the missing producer or final multirow
contradiction.

## Exact parent-coupled leaf

The remaining proposition is stated directly on the cycle stored by the
production residual:

```lean
abbrev FalseOfParentCoupledPeriodThreeAllReverse
    (F0 : CriticalPairFrontier D S radius H)
    (_R : FrontierCommonDeletionParentResidual F0)
    (E : ExactFivePhysicalCycleParentResidual H F) : Prop :=
  E.cycle.period = 3 → AllReverseMembership E.cycle → False
```

The underscore on `_R` records that the raw logical formula needs only the
two cycle-branch hypotheses. The original `F0, R` become mathematically
active when the equivalent packet consumer is exposed below; they are never
identified with a frontier reconstructed by the exact-five reduction.

## Source-clean packet assembly

The coordinator defines:

```lean
structure ParentCoupledPeriodThreePacket
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0)
    (E : ExactFivePhysicalCycleParentResidual H F) : Type where
  firstApex : FirstApexShellRolePacket F0 R
  sharedCapOrder : ReverseCycleSharedCapOrder E.cycle
  period_eq_three : E.cycle.period = 3
  allReverse : AllReverseMembership E.cycle
```

and proves:

```lean
theorem nonempty_parentCoupledPeriodThreePacket
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0)
    (E : ExactFivePhysicalCycleParentResidual H F)
    (hperiod : E.cycle.period = 3)
    (hreverse : AllReverseMembership E.cycle) :
    Nonempty (ParentCoupledPeriodThreePacket F0 R E)
```

The proof chooses:

- `FirstApexShellRolePacket F0 R` using
  `nonempty_firstApexShellRolePacket`; and
- `ReverseCycleSharedCapOrder E.cycle` using
  `nonempty_reverseCycleSharedCapOrder E.cycle hreverse`.

It then proves the exact equivalence:

```lean
FalseOfParentCoupledPeriodThreeAllReverse F0 R E ↔
  (ParentCoupledPeriodThreePacket F0 R E → False)
```

Thus neither packet is an independent public hypothesis. The earlier generic
scratch consumer `FalseOfPeriodThreeAllReverseFirstApexRows F0 R` also
specializes definitionally to `E.profile` and `E.cycle`.

## Fixed-`n = 11` counterexample / UNSAT handoff

The target for a fixed-11 search is the negation of the raw leaf, equivalently
the existence of a complete instantiated
`ParentCoupledPeriodThreePacket F0 R E`. A source-faithful finite encoding
must therefore preserve all fields of:

1. `F0 : CriticalPairFrontier D S radius H`;
2. `R : FrontierCommonDeletionParentResidual F0`;
3. `E : ExactFivePhysicalCycleParentResidual H F` with `K := E.cycle`;
4. `P : FirstApexShellRolePacket F0 R`;
5. `Q : ReverseCycleSharedCapOrder E.cycle`;
6. `E.cycle.period = 3`; and
7. `AllReverseMembership E.cycle`.

The search must not identify `F0` with any separately reconstructed exact-five
frontier, add exact-shell converses for the two selected first-apex rows,
assume global blocker/source distinctness, or fix one order orientation. SAT
would be a countermodel only to the exact abstraction encoded; UNSAT would
close the Lean leaf only after a checked coverage reduction from all packet
fields to the finite encoding.

## Validation

A fresh temporary `.olean` chain was built in
`/private/tmp/p97-parent-period3.lOwuIb` from the repository `lean/`
directory. Each scratch module was compiled with a matching `-R` source root,
the same temporary `LEAN_PATH`, explicit temporary `.olean`/`.ilean` outputs,
and `-DwarningAsError=true`.

The dependency order was:

1. `PhysicalOmissionCycleParentAdapter`;
2. `ReverseMembershipClosure`;
3. `ReverseOutsidePairProducer`;
4. `ReverseShellCurvatureAdapter`;
5. `CandidateAdapter`;
6. `FirstApexShellRolePacket`;
7. `FirstApexShellRoleExtractor`;
8. `PeriodThreeSharedOrderPacket`;
9. `ReverseCycleSharedCapOrderProducer`; and
10. `ParentCoupledPeriodThreeInterface`.

Every command exited successfully. The three new theorem axiom closures are
exactly:

```text
propext, Classical.choice, Quot.sound
```

The lane contains no `sorry`, `admit`, named axiom, `native_decide`, or
generated solver trust boundary.

## Consumer status

This checkpoint remains **scratch-only**. It feeds the existing scratch
`FalseOfPeriodThreeAllReverseFirstApexRows` interface and removes its two
packet-producer gaps, but no production theorem currently consumes the new
coordinator. In particular, production reconstructs a fresh frontier in
`FrontierCoupledExactFivePhysicalCycleParentResidual`; it does not supply the
original `F0, R` tuple used here. The higher-parent `B, L` routing and the
actual period-three multirow contradiction remain to be wired and proved.
