# Corrected B1 closure consult

Consult: `01M1PQD26PDSCAYBB6F5AKWEXH`  
Audited source: current B1 production source at HEAD `f8dd9c3d445e1dd9b68ca4d4d7e0d81d785690ca` and the later source-compatible audit messages in the nthdegree thread.

## Executive verdict

Choose **A**, but make it more source-canonical than the prompt suggests:

> Replace the current lossy survival-square projection by an **arm-indexed actual-blocker refinement**. For the square point `X`, take the failure center to be the canonical actual blocker
>
> ```lean
> p := (lateFirstApexSystem R).centerAt X.1 X.2
> ```
>
> and retain its canonical selected four-shell, rather than choosing an arbitrary minimality witness `p` and then trying to recapture it.

This refinement is already implied by the current hypotheses. It needs no new field in `B1GlobalTransportContext`; it only needs the already available robust surface passed explicitly at the point where the current splitter is called. The new mathematics begins **after** this refinement, in the terminal for the named-row-hit/fresh-actual-blocker branches.

Reject B and C at their current interfaces. Do not open D as the next lane: no current cap, support-minimality, blocker-fiber, or unique-four API finitely captures an arbitrary failure center, and source-interface models allow an arbitrarily fresh center and row.

The current direct

```lean
false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare
```

lane should be retired at its existing projected signature. It has discarded exactly the selected-row provenance needed to distinguish the known-center cases. The corrected `apex ∉ first.uPacket.B₁` sublane must also remain retired: in the `X=apex, p=bu` cell the unique-four obstruction requires **positive** membership `apex ∈ first.uPacket.B₁`, not nonmembership.

The recently proposed unconditional card-six two-deletion cross residual is also invalid: `exactFour_twoDeletion_crossOmission` already requires deleted-blocker inequality, so its omission conclusion cannot be used to prove that same inequality.

## Why routes B, C, and D are not the next move

### B. Winning live-pair geometry

Independent source audits have exhausted both clean global branches at their current interfaces.

- `B1GoodCanonicalDeletionEndpointResidual` carries canonical-deletion order/separation and negative omission data, but no positive cross-row incidences or live-slice same-side bit. Both its adjacent-cap and blocker-between arms admit source-interface cyclic configurations with no live same-arc witness.
- `B1EscapeSourceContext` carries a named source, strict-second-cap membership, outside-first-apex-fiber membership, retained q/w deletion survival, row orientation, and cross omission, but no `BoundaryIndexing`, no `B1SliceSameBoundaryArc`, no identity with the independently selected `B1FiveSixWaveIngress`, and no full geometric residual tied to the same source.
- The clean endpoint is still
  `false_of_b1WinningLiveSliceSameBoundaryArc`, or equivalently the signed-area consumer in `B1LiveSignedAreaConsumer.lean`; no current producer reaches it.

Therefore a new live-pair theorem would need genuinely new global cap/order information, not a repackaging of existing endpoint residuals.

### C. A different existing clean sink

The richest B1 packets do not instantiate the nearest clean consumers:

- `ThreeCenterCommonDeletionExactRows` needs a third common-deletion center/row or fresh-point data not supplied by the square projection;
- five-survivor/faithful-carrier APIs can package rows once a fifth surviving center is found, but their metric-core/occurrence consumer is still external;
- ordinal/Kalmanson sinks need a single named boundary and explicit positive row equalities/order roles;
- retained source-return consumers need oriented retained common-deletion/walk identities absent from this packet.

Thus no existing sink removes the open B1 leaf directly.

### D. Finite capture of arbitrary `p`

Current minimality and critical-shell APIs provide a failure center and selected four-class, but do not place it in a bounded named set. Support minimality and strong connectivity produce an escaping row or a path, not a cardinality bound on the blocker image. `actualBlockerFiber_card_le_four` bounds each fiber, not the number or placement of centers. Abstract support-minimal/SCC row systems admit fresh centers indefinitely while satisfying the exported cardinality/intersection constraints.

A theorem forcing an arbitrary minimality center into `{apex,bu,bv,br,bq}` would therefore be a major new global geometric theorem, not a plausible next adapter. The canonical actual blocker of `X` is already available and strictly stronger provenance.

## Existing splitter and the information it loses

The clean splitter is

```lean
Problem97.exactFour_fourSurvivingCenters_survivalSquare_split
```

in `ATail/FrontierLiveClosure/TwoDeletionCollision.lean`. Its explicit arguments are:

```lean
hrho
first
second
hsecondBlockerNeU
hsecondBlockerNeV
hsecondBlockerNeApex
crossPacket
```

with the surrounding implicit B1/CounterexampleData parameters.

Write

```lean
Hlate := lateFirstApexSystem R
q     := first.deleted
r     := second.deleted
a     := S.oppApex2
bu    := Hlate.centerAt u.1 u.2
bv    := Hlate.centerAt v.1 v.2
bq    := Hlate.centerAt q.1 q.2
br    := Hlate.centerAt r.1 r.2
Kq    := (Hlate.selectedAt q.1 q.2).toCriticalFourShell
```

The proof invokes

```lean
four_mem_card_four_split
  (K := Kq.support)
  (q := q.1)
  (a := a)
  (b := bu)
  (c := bv)
  (d := br)
```

using `Kq.support_card`, `Kq.q_mem_support`, and the six pairwise distinctness facts among `a,bu,bv,br`.

Its eight internal cases are

```text
q=a | q=bu | q=bv | q=br |
a∉Kq | bu∉Kq | bv∉Kq | br∉Kq.
```

The `q=a` case is discharged from the packet. The next three become the blocker-coincidence alternatives. In the remaining four cases, if `X` is respectively `a`, `bu`, `bv`, or `br`, the proof has the exact branch-local fact

```lean
X ∉ Kq.support.
```

The q-deletion survival at `X` comes from, respectively,

```lean
first.uPacket.survives₂
first.uPacket.survives₁
first.vPacket.survives₁
crossPacket.survives₁.
```

The X-deletion survival at `bq` comes from

```lean
Problem97.cross_deletion_survives_iff_not_mem_selected_support
  Hlate first.deleted.2
```

applied to the branch-local nonmembership.

The public result retains only the resulting `HasNEquidistantPointsAt` statements. It drops the named omitted support fact and does not inspect the actual blocker of `X`.

## Proposed source-clean refinement

Use a small packet and outcome type. The exact namespace may follow `Problem97.ATailFrontierLiveClosure`.

```lean
structure B1SquareActualBlockerPacket
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (q X : CarrierVertex D.A) where
  X_is_named :
    X.1 = S.oppApex2 ∨
    X.1 = (lateFirstApexSystem R).centerAt u.1 u.2 ∨
    X.1 = (lateFirstApexSystem R).centerAt v.1 v.2 ∨
    X.1 = (lateFirstApexSystem R).centerAt
      second.deleted.1 second.deleted.2
  q_ne_X : q.1 ≠ X.1
  q_survives_at_X :
    HasNEquidistantPointsAt 4 (D.A.erase q.1) X.1
  X_not_mem_qSupport :
    X.1 ∉
      ((lateFirstApexSystem R).selectedAt q.1 q.2)
        .toCriticalFourShell.support
  X_survives_at_qBlocker :
    HasNEquidistantPointsAt 4 (D.A.erase X.1)
      ((lateFirstApexSystem R).centerAt q.1 q.2)
```

For `P : B1SquareActualBlockerPacket ...`, set

```lean
bX := (lateFirstApexSystem R).centerAt P.X.1 P.X.2
KX := ((lateFirstApexSystem R).selectedAt P.X.1 P.X.2)
        .toCriticalFourShell
```

and define an outcome with five terminal-facing constructors:

```lean
inductive B1SquareActualBlockerOutcome (P : B1SquareActualBlockerPacket ...) where
| knownU
    (hcenter : bX = bu)
    (hmem : P.X.1 ∈
      ((lateFirstApexSystem R).selectedAt u.1 u.2)
        .toCriticalFourShell.support)
| knownV
    (hcenter : bX = bv)
    (hmem : P.X.1 ∈
      ((lateFirstApexSystem R).selectedAt v.1 v.2)
        .toCriticalFourShell.support)
| knownR
    (hcenter : bX = br)
    (hmem : P.X.1 ∈
      ((lateFirstApexSystem R).selectedAt
        second.deleted.1 second.deleted.2)
        .toCriticalFourShell.support)
| freshHit
    (hneA : bX ≠ S.oppApex2)
    (hneQ : bX ≠ bq)
    (hneU : bX ≠ bu) (hneV : bX ≠ bv) (hneR : bX ≠ br)
    (hq : q.1 ∈ KX.support)
| freshOmission
    (hneA : bX ≠ S.oppApex2)
    (hneQ : bX ≠ bq)
    (hneU : bX ≠ bu) (hneV : bX ≠ bv) (hneR : bX ≠ br)
    (hq : q.1 ∉ KX.support)
```

The source-facing theorem should be:

```lean
theorem exactFour_fourSurvivingCenters_actualBlocker_split
    (surface : ExactFourPostCardElevenRobustSurface R)
    (hrho : 0 < rho)
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hsecondBlockerNeU : br ≠ bu)
    (hsecondBlockerNeV : br ≠ bv)
    (hsecondBlockerNeApex : br ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
        first.deleted.1 br S.oppApex2) :
    first.deleted.1 = bu ∨
    first.deleted.1 = bv ∨
    first.deleted.1 = br ∨
    ∃ X : CarrierVertex D.A,
      ∃ P : B1SquareActualBlockerPacket
        R surface first.deleted X,
        Nonempty (B1SquareActualBlockerOutcome P)
```

The exact implicit parameters should be copied from the current splitter. The only new explicit input is `surface`, because `surface.secondApex_robust` is needed to exclude `bX = S.oppApex2`; the existing splitter itself does not carry that robust field.

This theorem is an honest strengthening rather than an empty wrapper: it retains the support nonmembership that creates the square, replaces an arbitrary existential failure center by the canonical selected-row center of `X`, and converts center aliases into positive row incidences.

## Proof spine — current declarations suffice

After the existing splitter chooses the arm-indexed `X`:

1. Build the square packet using the packet survival listed above and the branch-local `X ∉ Kq.support`.
2. Define `bX := Hlate.centerAt X.1 X.2` and use:

```lean
Problem97.ATailMinimalUniqueFourCover.isUniqueFourCenter_centerAt
Problem97.ATailMinimalUniqueFourCover.centerAt_ne_source
Problem97.ATailMinimalUniqueFourCover.source_mem_uniqueFourClass_centerAt
Problem97.ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
Problem97.CriticalShellSystem.no_qfree_at
```

Thus `bX` is a source-canonical unique-four failure center, `X ∈ KX.support`, and deleting `X` destroys K4 at `bX`.

3. Exclude the second apex with

```lean
Problem97.ATailDeletionRobustness.FullyDeletionRobustAt.centerAt_ne
```

applied to `surface.secondApex_robust`.

4. Exclude `bX=bq`: the square arm gives K4 after deleting `X` at `bq`, while `Hlate.no_qfree_at X` forbids it at `bX`.

5. Split `bX=bu`, `bX=bv`, `bX=br`, or fresh.

6. In a known-center arm, transport the selected support by

```lean
Problem97.ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
```

and rewrite `KX.q_mem_support`. The packet-facing support identities are available through

```lean
Problem97.ATailPhysicalSecondApexCommonDeletion.
  firstRow_support_eq_criticalShell_of_center_eq

Problem97.ATailPhysicalSecondApexCommonDeletion.
  secondRow_support_eq_criticalShell_of_center_eq
```

as appropriate.

7. In the fresh arm, split `q ∈ KX.support` versus `q ∉ KX.support`. In the omission subarm, `cross_deletion_survives_iff_not_mem_selected_support` gives a fifth center `bX` surviving deletion of `q`, in addition to `a,bu,bv,br`. This is exactly the point at which the existing five-survivor/faithful-carrier infrastructure becomes relevant. In the hit subarm, retain the genuinely new positive incidence `q ∈ KX.support`.

No backward import from `Rigid221Closure`, `TwoDeletion/Coordinator`, or a sorry-backed terminal is required.

## Module placement

The lowest-risk first implementation is **immediately after**

```lean
exactFour_fourSurvivingCenters_survivalSquare_split
```

in `ATail/FrontierLiveClosure/TwoDeletionCollision.lean`, before the two open exact-four consumers. Declaration order is acyclic and all packet types are already in scope.

For a cleaner later extraction, move the current splitter and the new outcome together into

```text
ATail/FrontierLiveClosure/JointDeletion/FourSurvivingActualBlocker.lean
```

importing only the JointDeletion packet definitions, robust-surface/deletion-robustness APIs, minimal unique-four cover, and survival-cover support equality. `TwoDeletionCollision.lean` should import that module. Do not create a new module that imports `TwoDeletionCollision` and is then imported back by it.

## What is already proved versus what is new

### Already implied by current hypotheses

- the four named square alternatives and their exact support nonmemberships;
- both deletion-survival statements in each square arm;
- the canonical actual blocker `bX`, unique-four center, selected support, and own-source membership;
- `bX ≠ S.oppApex2`, `bX ≠ bq`, and `bX ≠ X`;
- known-center support transport;
- the known/fresh and fresh-hit/fresh-omission splits.

This part is Lean engineering and case analysis. It does not require strengthening the global B1 ingress.

### First genuinely new mathematics

No current theorem consumes all non-five-survivor constructors. The next mathematical target is a consumer of

```text
knownU | knownV | knownR | freshHit.
```

A Lean-shaped target is:

```lean
theorem false_of_b1SquareActualBlocker_hit
    (P : B1SquareActualBlockerPacket ...)
    (h :
      (bX = bu ∧ P.X.1 ∈ Ku.support) ∨
      (bX = bv ∧ P.X.1 ∈ Kv.support) ∨
      (bX = br ∧ P.X.1 ∈ Kr.support) ∨
      (bX ≠ a ∧ bX ≠ bq ∧ bX ≠ bu ∧ bX ≠ bv ∧ bX ≠ br ∧
       q.1 ∈ KX.support)) : False
```

This is not presently derivable. It must use real geometry/deletion interaction: a named cap order, a third bisector carrier, a radius comparison, or a source-faithful affine/Kalmanson occurrence. The fresh-omission arm is different: it creates a fifth q-surviving center and should first be routed through the existing five-survivor/faithful-carrier producer rather than folded into this theorem.

## Smallest decisive test case

Test the corrected first named cell only:

```text
X = S.oppApex2,
bX = bu,
S.oppApex2 ∈ first.uPacket.B₁,
S.oppApex2 ∉ Kq.support,
erase q survives at S.oppApex2,
erase S.oppApex2 survives at bq.
```

The positive membership is load-bearing. The old proposed premise
`S.oppApex2 ∉ first.uPacket.B₁` is incompatible with the intended unique-four obstruction at `bu`.

Use a source-faithful finite alias enumeration for the three exact rows centered at `S.oppApex2`, `bu`, and `bq`, followed only for surviving aliases by an exact strict-convex QF_NRA realization check. Include the complete four-point supports, center omissions, q-deletion omissions, pairwise center inequalities, and exact row fibers; do not add global identities absent from the packet.

Interpretation:

- exact UNSAT with a small replayable core gives the first real named-center lemma, provisionally
  `false_of_survivalSquare_apex_actualBlocker_eq_uBlocker`;
- an exact SAT realization proves that even the corrected positive-incidence cell is locally geometric, so theorem effort should shift immediately to the fresh actual-blocker/five-survivor route and genuinely global minimality/cap input.

This one cell is more decisive than another broad B1 static-row wave or a speculative finite-capture theorem.

## Ranked recommendation

1. **Implement the source-canonical actual-blocker refinement above.** It is already supported and repairs the information loss at the real boundary.
2. **Run the single corrected `X=apex, bX=bu` test.** Prove or refute the smallest new geometric cell before generalizing.
3. **Route `freshOmission` into five-survivor/faithful-carrier infrastructure.** Keep `freshHit` as a separate positive-incidence residual.
4. Do not resume the current direct survival-square/arbitrary-p capture lane, the endpoint/CardArc producer lane, or the circular unconditional two-deletion-cross residual.

## Final status

The recommended producer is realistically formalizable now and source-clean. It does not itself close B1. Its value is that it replaces an underpowered open leaf with a finite set of positive-incidence branches plus a source-canonical fresh-center branch, while exposing exactly where new geometry is required. That is the narrowest honest next move supported by the current production source.
