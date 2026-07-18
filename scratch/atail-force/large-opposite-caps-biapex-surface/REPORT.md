# Cap-strengthened bi-apex surface and rebase ladder

Date: 2026-07-17

Status: **PROMOTED TO PRODUCTION; FOCUSED BUILD PASSES; CORE AXIOMS ONLY.
NO SOURCE `sorry` IS CLOSED.**

`LargeOppositeCapsBiApexSurface.lean` records two route corrections:

1. the honest live robust branch is `FrontierBiApexRobustResidual` together
   with `6 <= S.oppCap1.card` and `6 <= S.oppCap2.card`; and
2. a proof may rebase the already-selected physical frontier and common
   deletion packet to one late favorable `CriticalShellSystem`.

The file defines the cap-strengthened wrapper and drafts the complete rebase
ladder for the common packet, common residual, parent residual, bi-apex
residual, and cap-strengthened residual.  It also exposes the immediate
carrier bound `14 <= D.A.card`.

The public missing theorem is deliberately **not** another structure producer:

```lean
false_of_largeOppositeCapsBiApexRobust
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) : False
```

If its proof happens to use production `CriticalFiberClosingCore`, the rebase
ladder permits selecting one favorable late critical system internally.  The
fixed-initial-system core theorem is not the proof-search contract.

The build gate was lifted on 2026-07-17.  The current source required one
namespace-drift repair: `CommonDeletionTwoCenterPacket` is now referenced as
`ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket`.  After that
repair, the focused command

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/large-opposite-caps-biapex-surface/\
LargeOppositeCapsBiApexSurface.lean
```

exits zero.  The file now prints the axiom closure of all six declarations;
every declaration uses only `propext`, `Classical.choice`, and `Quot.sound`.
There is no `sorry`, `admit`, or custom axiom in this scratch surface.  The
checked definitions were subsequently promoted to production as
`ATail/LargeOppositeCapsBiApexSurface.lean`, whose focused build passes and
whose carrier-cardinality endpoint has only the three core axioms.  The
promotion is plumbing for the load-bearing parent theorem, not proof closure
by itself.
