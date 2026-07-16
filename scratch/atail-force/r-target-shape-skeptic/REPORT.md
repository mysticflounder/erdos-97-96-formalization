# R-target adversarial shape audit

Date: 2026-07-15

Status: **kernel-checked logical-shape audit; theorem-bank source and axiom
preflight complete; no production or closure document changed**.

## Verdict

`Nonempty (StrictSurplusRowCapturesErasedPair N)` is a valid sufficient
terminal, but the evidence does not justify calling it the unique, weakest, or
demonstrably tractable R producer.  As the **sole allowed producer outcome** it
is plausibly too specific: it requires one strict-surplus selected row to repeat
one exact pair from the ambient erasure history, while the checked full-history
and arbitrary-critical-map normal forms produce no selector for that pair.

This is a **CONJECTURED shape risk**, not a refutation.  The finite boundaries
and corrected target-negated census omit parts of the Euclidean/full-parent
surface, so they do not prove that the full live telescope cannot force the
capture.

The proposed alternative “strict-surplus capture OR a cap-oriented blocker
edge” is not yet an honest closing interface either.  A raw
`SameCapIncompatibleEdge` is a nonterminal transition input.  The sibling bank
uses one such edge to prove source pushout; it needs a second edge, a strict
rank inclusion, a full strict lap, or additional terminal/cardinality fields
before any branch closes.  Replacing the row-capture target by a raw-edge
disjunction would therefore weaken the conclusion without adding a consumer.

The recommended proof shape is:

```text
R normal form
  -> strict-surplus pair capture
   OR complete cap-walk transition/terminal packet
  -> existing capture consumer
   OR well-founded rank descent / strict-lap / fully populated endpoint consumer
  -> False.
```

Until the invariant-preserving cap-walk transition is actually sourced, keep
strict-surplus capture as the smallest current **sufficient** target, but keep
the parent content theorem return type at `False`.  Do not freeze the research
plan to capture as the only admissible route, and do not describe one raw edge
as a terminal.

## Exact Lean shape result

`RTargetShapeAudit.lean` kernel-checks the following facts.

For a retained ambient robust pair `P`, the pair-specific packet

```text
Nonempty (InteriorSelectedRowCapturesPair P)
```

is equivalent to `False`.  For the closure-facing normal form `N`, so is

```text
Nonempty (StrictSurplusRowCapturesErasedPair N).
```

Consequently, for every proposition `E`, the checked theorems

```text
interiorCapture_or_iff :
  Nonempty (InteriorSelectedRowCapturesPair P) OR E <-> E

strictCapture_or_iff :
  Nonempty (StrictSurplusRowCapturesErasedPair N) OR E <-> E
```

show that adjoining a capture arm does not make an alternative proposition
easier in the logical sense.  This does **not** say that constructing the
structured capture is operationally as difficult as proving an unstructured
`False`; it says that every added alternative must carry its own closing
consumer.

The same file names the already-proved directed CSS complement:

```text
mate selected AND source blocker outside the surplus cap
OR
mate omitted AND mate-deletion K4 survives at the source blocker.
```

`directedCriticalShellComplement` proves this proposition for every retained
pair and every critical-shell system.  The checked equivalence

```text
capture OR directed CSS complement <-> directed CSS complement
```

is the precise reason the current exact split is branch-complete but not a
closure theorem.

## Full parent telescope audit

The parent adapter retains substantially more data than the R normal-form
consumer currently uses:

- the nonobtuse MEC triangle and its cap triple;
- the second-large-cap and no-`IsM44` hypotheses;
- `9 < D.A.card` and global non-removability;
- the concrete common `CriticalShellSystem`;
- the named `U3LocalizedNoQFreePacket`, fixed dangerous triple, six-point
  distinctness, and `U1LargeCapRouteBTailLiveData`.

The checked R descent/history consumes global K4, the promoted cap packet, and
the concrete CSS.  The exact transition theorem with second-large-cap and
no-`IsM44` arguments does not consume either added argument.  No current
theorem maps the named `q,p,t1,t2,t3,u` data to an arbitrary erased history
pair.  Global non-removability can construct critical rows at arbitrary
sources, but it still does not force a chosen row to contain the robust mate
or a cap endpoint.  Thus the full telescope contains plausible missing power,
but the required coupling theorem is not presently in the bank.

This supports two conclusions:

1. the direct row-capture producer must visibly use a still-unused global
   parent field; and
2. a cap-walk alternative must also visibly derive its endpoint equality,
   order, and invariant-preservation fields from that surface.  Merely
   reclassifying the arbitrary CSS blocker by cap membership is insufficient.

## Sibling cap-order bank preflight

The required registries and indexed Lean corpus were checked before this
assessment:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The source audit also rechecked
`docs/audits/2026-07-13-atail-legacy-samecap-blocker-audit.md` and the current
sibling files `WitnessLapInterface.lean`, `U1kSourcePushout.lean`,
`U1kWrongSideDischarge.lean`, and `U1kOppositeEndpoint.lean`.

`BankConsumerAxiomAudit.lean` fresh-checks the relevant sibling declarations.
Every printed theorem has exactly the standard axiom closure

```text
propext, Classical.choice, Quot.sound.
```

Their actual contracts are:

- `source_pushout_left/right` consume one already-constructed
  `SameCapIncompatibleEdge` and return strict interval membership, not
  `False`;
- `samecap_wrongSide_left/right_contradiction` close only the wrong-side
  order branches;
- `rank_drop` needs an already-proved strict inclusion between two rank
  intervals;
- `strictLapPacket_nonreturn` closes a packet which already contains all three
  strict pushes in one global order;
- `ConsecutiveOppositeEndpointEdges.b2a1e_disjoint_fires_exit` returns `False`
  only after receiving two edges, `MoserOnlyIncompatibles`, two exact card-four
  class facts, and all strict-interior data; and
- `ConsecutiveOppositeEndpointEdges.b2a1_fires_exit` returns
  `U1kSharedExit`, not `False`.  Its duplicate and rank-descent outputs still
  need parent terminal/minimality consumers.

The bank is therefore useful downstream, but it does not make “one
cap-oriented edge” an eliminable R terminal.  It is also a sibling `RVOL`
module surface, not currently imported by this formalization's production
graph.

## Recommended branch-complete interface

Do not introduce an inductive wrapper merely to rename the open theorem.  The
next useful geometric theorem should have one of these two shapes.

### Direct shape

```text
full live parent telescope + R normal form
  -> Nonempty (StrictSurplusRowCapturesErasedPair N).
```

This remains the smallest current sufficient packet.  Its status is
**CONJECTURED**, not tractability-proven.

### Transition shape

If the geometry naturally produces cap-order data, prove a real transition
theorem, not a raw-edge existential:

```text
state s
  -> capture
   OR wrong-side same-cap terminal
   OR invariant-preserving successor s' with rank(s') < rank(s)
   OR cross-cap strict advance carrying enough global-order history to
      complete a StrictLapPacket.
```

Then prove a separate well-founded driver.  The terminal arms can reuse the
checked sibling consumers; the smaller-state arm recurses; the cross-cap arm
must preserve enough state to assemble the complete strict lap.  For an
opposite-endpoint two-edge route, the transition must additionally produce the
exact `MoserOnlyIncompatibles`, class-cardinality, and final duplicate/rank
terminal exclusions consumed by that bank.

This is a genuinely branch-complete interface.  It is larger than the direct
capture theorem, so it should become primary only after a source lemma emits
several of these fields together.  Otherwise it recreates the older U1k
producer gap and adds more open antecedents than it removes.

## Regression evidence and rigor boundary

**PROVEN:** the robust-history construction, capture consumers, directed CSS
split, two-blocker normal form, logical equivalences above, and sibling bank
consumer contracts.

**SOURCE-AUDITED:** no current or sibling bank theorem constructs the missing
pair capture or complete cap-walk transition from the live R data.

**EMPIRICALLY VERIFIED / exact only within stated finite abstractions:** the
finite robust-history and blocker-cycle boundaries realize outside-blocker,
cross-omission, and off-surplus two-cycle behavior; the corrected fixed-map
CEGAR continuation ends in another target-negating residual.  None is a
Euclidean counterexample or a proof against the full parent telescope.

**CONJECTURED:** the full parent telescope forces either direct capture or a
complete eliminable cap-walk outcome.

## Validation

The local shape audit was checked against temporary scratch oleans:

```text
RTransitionLiveSurface.lean PASS
RTargetShapeAudit.lean      PASS
```

The sibling bank audit was checked in the `p97-rvol` Lake environment:

```text
BankConsumerAxiomAudit.lean PASS
```

All printed endpoints use only `propext`, `Classical.choice`, and
`Quot.sound`.  `RTargetShapeAudit.lean` contains no `sorry`, `sorryAx`,
`admit`, custom `axiom`, `native_decide`, or `unsafe` declaration.  No full
Lake build was run.
