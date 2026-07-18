# Full-`L` exact-five all-reverse occurrence attack

Date: 2026-07-17

Status: **SOURCE-PROVENANCE BREAK IDENTIFIED. THE CURRENT
`hcycleStart` SURFACE DOES NOT ANCHOR EITHER NAMED CONTINUATION SOURCE TO THE
NORMALIZED CYCLE. THE CORRECT FIRST SPLIT IS ON THE FULL PHYSICAL TRANSITION,
BEFORE CYCLE NORMALIZATION. SHELL-CURVATURE TURN BUDGETS ARE EXACT-QF_LRA SAT
ON THE AUDITED 25-ROLE CELL. THE FULL-`L` CO-RADIAL OCCURRENCE REMAINS OPEN.**

This is a scratch-only source and regression checkpoint. It does not prove
the co-radial occurrence, close a production `sorry`, or refute the occurrence
under the full geometric parent. It edited only this directory. It did not
edit production Lean, shared docs, proof-blueprint state, `SurplusM44`, the
protected FA-UNIQ/card-five files, `ShellCurvature`, or git state. Per the
active gate, it ran no Lean, Lake, LSP, or build command.

## 1. Bank and corpus preflight

The required `AGENTS.md` preflight checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered the exact-five physical
omission transition/cycle, all-reverse membership, reverse outside pairs,
first-apex shared radius, and the ordered-cap same-pair terminal. The banks
contain downstream contradiction consumers, but no aggregate theorem which
forces one reverse residual pair to be co-radial from `S.oppApex1` while the
complete `L` parent is retained. This confirms that another local row-slot
consumer is not the missing item.

## 2. Exact source-level provenance break

The proposed occurrence surface in
`scratch/atail-force/all-reverse-occurrence-source-map/REPORT.md` includes

```lean
(K : PhysicalActualCriticalOmissionCycle H profile)
(hcycleStart : K.start.1 = continuation.first)
(hreverse : ∀ i : Fin K.period, ... K.source i ...)
```

and describes this as retaining the source-faithful continuation. That is not
enough to use `continuation.first` or `continuation.second` in the cycle facts.

The exact definitions are in
`lean/Erdos9796Proof/P97/ATail/`
`LargeCapUniqueFivePhysicalOmissionCycle.lean`:

- `PhysicalActualCriticalOmissionCycle` stores `start` and an arbitrary
  `entryTime` at lines 160-169;
- `K.base` is
  `(K.transition.successor^[K.entryTime]) K.start` at lines 174-180; and
- `K.source i` iterates from `K.base`, not from `K.start`, at lines 191-197.

The constructor `nonempty_physicalActualCriticalOmissionCycle_from_start`
at lines 521-535 proves only `K.start = start`. Its finite-normalization step
selects an `entryTime` at lines 527-535; it does not prove `entryTime = 0` or
that `start` is periodic. Consequently,

```text
K.start.1 = continuation.first
```

does **not** imply

```text
exists i, (K.source i).1 = continuation.first.
```

It says that the eventual cycle is reachable from the named source, which is
strictly weaker than putting that source on the cycle. The same proposed
surface contains no connection at all between `continuation.second` and any
`K.source i`.

This matters because the production all-reverse theorem
`nonempty_mutualOmissionEdge_or_all_reverseMembership` at lines 443-469 is
quantified only over `i : Fin K.period`. It therefore says nothing about a
transient `K.start`, even if `K.start` was chosen to equal
`continuation.first`.

### Exact finite-dynamics regression

`check_cycle_start_provenance.py` checks the fixed-point-free map

```text
0 -> 2
1 -> 2
2 -> 3
3 -> 4
4 -> 2
```

with `continuation.first = 0` and `continuation.second = 1`. Starting at `0`,
the canonical eventual cycle has `entryTime = 1` and sources `2,3,4`; neither
named continuation source is a cycle source. The checked output is:

```text
PASS
status=EXACT_FINITE_DYNAMICS_REGRESSION_NOT_GEOMETRIC
continuation_first=0
continuation_second=1
entry_time=1
cycle=[2, 3, 4]
```

This is an exact regression against the generic functional-graph inference.
It is deliberately **not** a geometric countermodel and does not claim that
the full `L` parent realizes this map. It proves that fixed-point-freeness and
cycle normalization alone cannot supply the missing anchoring.

## 3. The minimal corrected split is transition-global

Production already constructs the stronger pre-normalization object
`PhysicalActualCriticalOmissionTransition H profile` at lines 103-116 and
proves it nonempty at lines 120-155. It is a total map on **every** physical
exact-five source, retaining on every edge:

- `successor q != q`;
- `successor q` omitted from `q`'s actual selected critical support; and
- deletion of `successor q` preserves K4 at `q`'s actual blocker.

The first corrected API should split on reverse membership for this complete
transition, before discarding transient sources. The following is theorem
shape, not compiled production Lean:

```lean
theorem mutualOmission_or_allReverseTransition
    (T : PhysicalActualCriticalOmissionTransition H profile) :
    (exists q : PhysicalVertex profile,
      q.1 ∉
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q)))
          .toCriticalFourShell.support) or
    (forall q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A (T.successor q)))
          .toCriticalFourShell.support)
```

This split is just `by_cases` bookkeeping, analogous to the cycle-restricted
theorem. In the first arm, the displayed omission combines with
`T.successor_not_mem_actualCriticalSupport q` to give a genuine mutual
omission edge. In the second arm, reverse membership is available at every
physical source, including the named continuation sources.

The named source embeddings require no new geometric theorem. Production
`LargeCapUniqueFiveTwoCommonDeletionSources` stores
`first_mem_physicalInterior` and `second_mem_physicalInterior` in
`LargeCapUniqueFiveLowHit.lean:91-104`, exactly the membership predicate used
by `PhysicalVertex profile`. Thus one can define, schematically,

```lean
let firstV : PhysicalVertex profile :=
  ⟨continuation.first, continuation.first_mem_physicalInterior⟩
let secondV : PhysicalVertex profile :=
  ⟨continuation.second, continuation.second_mem_physicalInterior⟩
```

and specialize the global all-reverse arm to both immediately.

Two weaker repairs are possible but inferior:

1. add `exists i, K.source i = firstV` as a hypothesis; or
2. require `K.entryTime = 0`.

Neither follows from the current constructor, and either would merely assume
the missing provenance. The transition-global split derives all-reverse facts
for the named sources from an object already present in production.

## 4. Corrected aggregate occurrence surface

The full-`L` theorem should therefore consume the total transition and its
global all-reverse arm. It should not take a detached normalized cycle as its
only exact-five dynamics. A minimal honest target is structurally:

```lean
{F : CriticalPairFrontier D S firstRadius H}
{R : FrontierCommonDeletionParentResidual F}
{B : FrontierBiApexRobustResidual R}
(L : FrontierLargeOppositeCapsBiApexRobustResidual B)
(profile : LargeCapUniqueFiveSecondApexRadius D S)
(continuation :
  LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
(T : PhysicalActualCriticalOmissionTransition H profile)
(hreverse : forall q : PhysicalVertex profile,
  q.1 ∈
    (H.selectedAt (T.successor q).1
      (PhysicalVertex.mem_A (T.successor q)))
      .toCriticalFourShell.support) :
exists q : PhysicalVertex profile, exists a b : Real^2,
  transitionReverseOutsidePair T q = {a, b} /\
  dist S.oppApex1 a = dist S.oppApex1 b
```

`transitionReverseOutsidePair` is the transition-level analogue of the
current cycle-indexed `reverseOutsidePair`: the selected support at
`T.successor q`, minus the physical cap. The local exact-two and outside-cap
facts now proved for `reverseOutsidePair K i` should be generalized to one
transition edge. Their mathematical input is the edge, the exact-five
profile, and reverse membership; cycle normalization is not the load-bearing
geometry.

This is the first connected aggregate producer surface. It preserves:

- the original `F.pair` and both frontier splits;
- `R.minimal`, `R.noM44`, the retained K4/double-deletion data, and carrier
  bounds;
- both apex robustness facts through `B`;
- both cap-at-least-six bounds through `L`;
- MEC/cap order through `D` and `S`;
- the same total critical map `H` used by `continuation` and `T`, with their
  common exact-five `profile`; and
- both named continuation sources.

Once this theorem returns `a,b`, the existing transition-level pair facts
would feed `CapSelectedRowCounting.outsidePair_unique_capCenter`
(`CapSelectedRowCounting.lean:283`) exactly as in the earlier source map.

This correction does **not** prove the occurrence. It identifies the first
interface failure before the full-parent geometry is even used. After the
repair, the first genuinely missing mathematical step remains coupling the
transition reverse residuals to first-apex geometry. The narrowest currently
visible load-bearing parent inputs are `R.common.firstApexDouble` and the
retained first-apex exact-radius class/frontier pair; neither is present in
the local exact-five regressions.

## 5. Shell-curvature turn-budget regression

The recent shell-curvature lemmas suggest testing whether the common cyclic
order plus the exact-four shell curvature budgets already reject the audited
all-reverse word. `check_shell_curvature_turn_budget.py` performs that exact
rational linear test on the existing 25-role order with:

- the two first-source shells `T0` and `T1`; and
- three exact-five all-reverse rows.

For every four-shell it imposes the two strict open-arc turn inequalities
from the shell-curvature lemma, positive exterior turns, and total turn
`2*pi` (normalized to `4`, so `pi/2 = 1`). Z3 returns a rational model and the
script independently checks every strict arc sum. The result is:

```text
status = sat
epistemic_status = EXACT_QF_LRA_TURN_BUDGET_SAT_NOT_EUCLIDEAN_NOT_FULL_PARENT
```

All ten required open-arc sums are strictly greater than `1`; for example,
the two `T0` sums are `25/24` and `17/8`, and the two `reverse0` sums are
`23/12` and `25/24`.

Therefore the qualitative shell-curvature turn budgets alone are not the
missing aggregate consumer on this cell. This does not test nonlinear
Euclidean realizability, actual radii, MEC inequalities, full-fiber
provenance, `D.Minimal`, `noM44`, or the full `L` parent. A stronger route
would need quantitative cross-row angle relations, not another copy of the
same per-shell `> pi/2` budget.

## 6. Honest next checkpoint

When the production/build gate is released, the smallest implementation
checkpoint is:

1. prove the transition-global mutual/all-reverse split;
2. generalize the local reverse-pair normal form from `(K,i)` to `(T,q)`;
3. instantiate it at `continuation.first` and `continuation.second`; and
4. attack their coupling to `R.common.firstApexDouble`, the retained
   first-apex radius class, and `F.pair`, while keeping `L` intact.

Cycle normalization remains useful after a theorem needs periodicity, period
bounds, or cycle counting. It is not a sound place to anchor named transient
continuation sources without an additional reachability-to-periodicity
theorem.

Final epistemic classification:

- source-provenance break: **PROVEN BY DEFINITIONS + EXACT FINITE REGRESSION**;
- transition-global split: **ROUTINE THEOREM SHAPE, NOT YET ELABORATED**;
- shell-curvature turn-budget compatibility: **EXACT QF_LRA SAT IN THE STATED
  LINEAR MODEL**;
- full-`L` first-apex co-radial occurrence: **OPEN**;
- production `sorry` closure from this checkpoint: **NONE**.
