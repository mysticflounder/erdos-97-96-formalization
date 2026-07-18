# Transition-global reverse outside-pair API audit

Date: 2026-07-17

Status: **THE TRANSITION API AND SINGLE-ORBIT BRIDGE ARE NOW PRODUCTION.
THE TERMINAL CONSUMER IS CHECKED. THE EXACT REMAINING FULL-PARENT PRODUCER IS
A TWO-HIT CAPTURE OF ONE TRANSITION REVERSE RESIDUAL IN THE RETAINED
FIRST-APEX RADIUS CLASS. THAT GEOMETRIC CAPTURE REMAINS OPEN.**

This lane is scratch/source-only. It did not edit production Lean, shared plan
documents, proof-blueprint state, `SurplusM44`, the protected card-five/FA-UNIQ
files, `ShellCurvature`, or git state. After the focused build gate was lifted,
this lane ran only a single-file Lean check. It did not run a Lake target build
or full project build.

The checked scratch module is `TransitionReverseOutsidePairAPI.lean`. Its
edge-local proof bodies are copied at theorem granularity from the existing
cycle API; its transition injectivity and zero-entry cycle bridge are new
kernel-checked reductions.

## Later full-parent checkpoint

Current production source now contains the work which this lane originally
drafted:

- `ATail/LargeCapUniqueFivePhysicalOmissionTransitionGlobal.lean` proves the
  transition-global mutual/all-reverse split, exact-two/outside-cap residual
  API, successor injectivity, zero-entry cycle bridge, and
  `false_of_transitionReverseOutsidePair_coRadial_firstApex`;
- `ATail/LargeCapUniqueFivePhysicalOmissionSingleOrbit.lean` proves
  `exists_entryZeroCycle_containing_continuationSources`, so both named
  continuation sources occur in one all-reverse orbit; and
- `ATail/LargeOppositeCapsBiApexSurface.lean` packages the complete parent as
  `FrontierLargeOppositeCapsBiApexRobustResidual B`, retaining the original
  frontier, common-deletion parent, both apex robustness facts, both cap-six
  bounds, `minimal`, and `noM44`.

The user stopped the active build before this later audit. No Lean, Lake, LSP,
target build, or full build was started or resumed for this checkpoint.

### Required bank and corpus result

The required P97 bank registries and focused `nthdegree docs search --lean`
queries were checked before naming another producer. They recover the current
transition terminal, retained-radius critical-fiber selector, and existing
local consumers. They do **not** contain a theorem forcing a transition
reverse outside pair onto a first-apex radius.

### Exact weakest retained-parent return

Equality with the original frontier pair is sufficient but stronger than
necessary. The smallest source-faithful occurrence expressed using a radius
already retained by the parent is:

```lean
∃ q : PhysicalVertex profile,
  (transitionReverseOutsidePair T q ∩
    SelectedClass D.A S.oppApex1 radius).card = 2
```

Production already proves that `transitionReverseOutsidePair T q` has card
two. Hence this says exactly that its two points lie in the retained
first-apex radius class. Their first-apex distances are equal, and
`false_of_transitionReverseOutsidePair_coRadial_firstApex` gives `False`.

`RetainedFirstApexRadiusCapture.lean` records the complete parent-indexed
contract and the routine terminal adapter. Because the build was stopped, the
new adapter is **ROUTINE-UNELABORATED**, not claimed kernel-checked.

### Why the current critical-fiber APIs do not produce it

`nonempty_retainedRadiusBlockerOutcome R` has two arms:

1. `RetainedRadiusCollision` supplies two anonymous distinct sources already
   co-radial from `S.oppApex1`, but no current theorem places both sources in
   one `transitionReverseOutsidePair T q`;
2. `RetainedRadiusBlockerMatching` supplies only injectivity of the blocker
   map on the retained radius class, so it does not supply a co-radial pair
   occurring in a reverse row.

The broader `FrontierCommonDeletionCriticalFiber` is always available, but
its two sources are not known to lie in the retained first-apex radius class.
`CriticalFiberClosingCore` is terminal only after one additionally produces
either its ordered six-role cross row or its source-faithful same-cap second
center. Neither constructor identifies a fiber pair with a transition reverse
outside pair.

On the collision arm, a stronger sufficient interface between the two APIs is
the positive incidence statement

```lean
∃ q Q,
  {Q.fiber.source₁.1, Q.fiber.source₂.1} ⊆
    transitionReverseOutsidePair T q
```

for a retained-radius collision `Q`. This is not equivalent to the general
capture because the selector may instead return its matching arm. The weaker
radius-class two-hit capture displayed above is therefore the preferred
full-parent target: it does not unnecessarily require the pair to arise from
a blocker collision.

### Epistemic classification

- transition-global split/exact-two/outside-cap/single-orbit API:
  **PROVEN IN CURRENT PRODUCTION**;
- co-radial transition-pair consumer: **PROVEN IN CURRENT PRODUCTION AND
  TERMINAL**;
- new parent-indexed adapter from retained-radius two-hit capture to `False`:
  **ROUTINE-UNELABORATED**;
- retained-radius two-hit capture from full `L` plus all-reverse transition:
  **OPEN, GENUINELY EUCLIDEAN/MEC/FULL-PARENT**;
- unconditional closure of the all-reverse leaf at this checkpoint:
  **NOT PROVEN**.

## Registry and corpus preflight

Before drafting a new finite/incidence normal form, this lane checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran:

```text
nthdegree docs search --lean \
  "physical actual critical omission transition reverse outside pair exact two outside cap"
```

The indexed production hits were the physical transition/cycle and parent
residual modules. The banks contain downstream local contradiction consumers,
but no theorem forcing a transition reverse residual to be co-radial from the
first apex. No new local theorem-bank consumer is needed.

## Status legend

- **PROVEN** means either an existing checked source theorem or a complete
  theorem-local mathematical deduction whose assumptions and contradiction are
  written below. It does not upgrade this draft to kernel-checked Lean.
- **ROUTINE-UNELABORATED** means the remaining Lean theorem shape is a direct
  finite argument but has not yet been added to the checked file.
- **OPEN** means genuinely new geometric force is still required.

## 1. Exact production surface

### PROVEN

Production
`ATail/LargeCapUniqueFivePhysicalOmissionCycle.lean` defines
`PhysicalActualCriticalOmissionTransition H profile` with, for every physical
vertex `q`:

1. `T.successor q != q`;
2. `T.successor q` omitted from `q`'s actual critical support; and
3. deletion of `T.successor q` surviving at `q`'s actual blocker.

The transition is total on `PhysicalVertex profile`, not merely on an eventual
normalized cycle. Production constructs a nonempty transition before it
constructs any cycle.

Production `LargeCapUniqueFiveLowHit.lean` stores exactly the embeddings needed
for the two origin-tagged sources:

```lean
first_mem_physicalInterior :
  continuation.first ∈ physicalVertices profile

second_mem_physicalInterior :
  continuation.second ∈ physicalVertices profile

first_ne_second : continuation.first ≠ continuation.second
```

Thus the following are definitionally valid and require no new geometry:

```lean
let firstV : PhysicalVertex profile :=
  ⟨continuation.first, continuation.first_mem_physicalInterior⟩

let secondV : PhysicalVertex profile :=
  ⟨continuation.second, continuation.second_mem_physicalInterior⟩
```

## 2. Transition-global mutual/all-reverse split

### PROVEN / KERNEL-CHECKED

The draft introduces
`PhysicalActualCriticalMutualOmissionTransitionEdge T` and proves the exact
transition analogue of production
`nonempty_mutualOmissionEdge_or_all_reverseMembership`:

```lean
Nonempty (PhysicalActualCriticalMutualOmissionTransitionEdge T) ∨
  ∀ q : PhysicalVertex profile,
    q.1 ∈
      (H.selectedAt (T.successor q).1
        (PhysicalVertex.mem_A (T.successor q)))
        .toCriticalFourShell.support
```

The proof is the same `by_cases`/`push negation` bookkeeping as production
lines 443-469. This repairs the provenance break before cycle normalization:
the positive arm can be specialized immediately at both `firstV` and
`secondV`.

## 3. Which cycle pair facts are edge-local?

### PROVEN classification

The following checked cycle facts use only one source edge, exact-five
membership, cap order, and reverse membership. They do not use periodicity,
minimal-period normalization, or cycle cardinality:

- successor blocker is in the physical cap interior;
- successor shell intersect physical cap is exactly `{q, successor q}`;
- the residual outside the physical cap has cardinality two;
- the residual is contained in `D.A \ physicalCap`; and
- a co-radial residual is consumed by ordered-cap outside-pair uniqueness.

These are legitimately edge-local and the transition statements in the draft
are line-by-line versions of:

- `successor_actualBlocker_mem_physicalCapInterior`;
- `successor_actualCriticalSupport_inter_physicalCap_eq_pair`;
- `successor_actualCriticalSupport_outside_physicalCap_card_eq_two`;
- `reverseOutsidePair_subset_complement`; and
- `CapSelectedRowCounting.outsidePair_unique_capCenter`.

The cycle theorems `reverseRowCenter_injective`,
`reverseOutsidePair_injective`, and the pair-capacity inequality are **not
one-edge facts**. They compare multiple rows. They can nevertheless be rebuilt
transition-globally after proving successor injectivity below. They do not need
to be generalized for the minimum-churn route.

### PROVEN / KERNEL-CHECKED API

The checked module defines:

```lean
transitionReverseRowCenter T q :=
  H.centerAt (T.successor q).1 ...

transitionReverseOutsidePair T q :=
  (H.selectedAt (T.successor q).1 ...).toCriticalFourShell.support \
    S.capByIndex S.oppIndex2
```

and proves:

```lean
transition_successor_actualBlocker_mem_physicalCapInterior
transition_successor_actualCriticalSupport_inter_physicalCap_eq_pair
transitionReverseOutsidePair_card_eq_two
transitionReverseOutsidePair_subset_complement
exists_transitionReverseOutsidePair_eq_pair
```

The last theorem packages the exact useful normal form:

```lean
∃ a b : ℝ²,
  a ≠ b ∧ transitionReverseOutsidePair T q = {a,b}
```

Specializing this chain at `firstV` and `secondV` is purely definitional.

## 4. Global all-reverse makes the transition a permutation

### PROVEN / KERNEL-CHECKED

The global positive arm forces `T.successor` to be injective.

Suppose

```text
T.successor q = T.successor r = s.
```

Reverse membership at `r` puts `r` in the actual selected shell at `s`.
Since `r` is in the physical cap, the exact cap-intersection theorem for the
edge `q -> s` gives

```text
r ∈ {q,s}.
```

If `r=q`, the sources agree. If `r=s`, then `T.successor r = r`, contradicting
`T.successor_ne r`. Therefore `q=r`.

The checked theorem is
`transition_successor_injective_of_all_reverseMembership`. On the finite
physical vertex type, `Finite.injective_iff_surjective` then makes the
transition a permutation.

### PROVEN / KERNEL-CHECKED

The same positive arm rules out two-cycles. If

```text
T.successor (T.successor q) = q,
```

then forward omission at `T.successor q` says `q` is absent from that source's
actual critical support, while reverse membership at `q` says it is present.
The checked theorem is
`transition_successor_sq_ne_self_of_all_reverseMembership`.

### ROUTINE-UNELABORATED finite closure

The physical vertex set has cardinality between three and five:

- production `physicalVertices_card_ge_three`; and
- containment in the exact-five selected class plus
  `profile.class_card_eq_five`.

Every orbit of the injective transition is periodic by
`Function.Injective.mem_periodicPts`. Fixed points and two-cycles have just
been excluded, so every orbit has at least three elements. Two disjoint orbits
would therefore require at least six physical vertices. Hence the transition
has one orbit.

This cardinal argument is complete, but its generic Lean packaging remains
unelaborated. A short implementation can reuse the checked scratch API in
`exact-five-period-four-five-parent-route/PeriodFourFiveParentRoute.lean`:

- `cycleSourcePoints`;
- `cycleSourcePoints_card_eq_period`;
- `physicalVertices_card_le_five`;
- `physicalVertices_sdiff_cycleSourcePoints_card_le_one_of_period_eq_four`;
- `cycleSourcePoints_eq_physicalVertices_of_period_eq_five`; and
- the first/second continuation occurrence theorems.

An especially direct proof builds a cycle from `firstV` with `entryTime = 0`.
If `secondV` were outside it, injectivity keeps the entire second orbit outside.
The second orbit supplies three distinct outside vertices, but the checked
cycle cardinality plus period at least three leaves at most two outside
vertices. Contradiction.

## 5. Recommended minimum-churn production route

### PROVEN / KERNEL-CHECKED, except the optional one-orbit add-on

Do **not** initially promote the full transition outside-pair duplicate API.
The lower-churn route is now checked in scratch:

1. Promote only the transition-global mutual/all-reverse split.
2. Promote `transition_successor_injective_of_all_reverseMembership`.
3. In the global all-reverse arm, use
   `hinjective.mem_periodicPts firstV` to show `firstV` is periodic.
4. Build `K : PhysicalActualCriticalOmissionCycle H profile` directly with
   `transition := T`, `start := firstV`, and `entryTime := 0`. Minimal period
   is at least two because `T.successor_ne firstV` rules out period one.
5. Transport global reverse membership to the existing cycle hypothesis via
   `K.successor_source_eq`.
6. Reuse the already-checked cycle-indexed
   `ReverseOutsidePairProducer.lean` chain. Here `K.source 0 = firstV`
   definitionally.
7. Add the still-unelaborated one-orbit/cardinality lemma only if the same proof needs
   `secondV` as a cycle source. Otherwise keep `secondV` available in the full
   parent packet without enlarging the cycle API.

The checked declarations implementing steps 3-6 are:

```lean
nonempty_zeroEntryPhysicalActualCriticalOmissionCycle_from_start
cycle_all_reverseMembership_of_transition_all_reverseMembership
nonempty_zeroEntryCycleWithReverseMembership_from_start
nonempty_firstContinuation_zeroEntryCycleWithReverseMembership
```

This repairs first-source provenance while preserving the existing checked
reverse-pair infrastructure.

## 6. General terminal plumbing

### PROVEN / KERNEL-CHECKED CONSUMER

For completeness, the checked module gives the direct transition consumer:

```lean
false_of_transitionReverseOutsidePair_coRadial_firstApex
```

It consumes distinct `a,b` in `transitionReverseOutsidePair T q` plus

```lean
dist S.oppApex1 a = dist S.oppApex1 b
```

and calls production
`CapSelectedRowCounting.outsidePair_unique_capCenter`.

All of its antecedents except the displayed first-apex equality are routine:

- pair membership gives ambient membership and exclusion from the physical
  cap;
- the successor actual shell makes its blocker equidistant from `a,b`;
- reverse membership puts that blocker in the strict physical cap; and
- `S.oppApex1` is the left endpoint of the same closed cap, hence distinct
  from the strict-interior blocker.

## 7. First genuinely geometric missing field

### OPEN

After specializing at `firstV` and `secondV`, the first missing field is not
pair existence, distinctness, cap exclusion, source provenance, blocker
localization, or successor-row equidistance. All of those are supplied by the
transition/cycle API.

The exact missing producer is one of:

```lean
∃ a b : ℝ²,
  transitionReverseOutsidePair T firstV = {a,b} ∧
  dist S.oppApex1 a = dist S.oppApex1 b
```

or

```lean
∃ a b : ℝ²,
  transitionReverseOutsidePair T secondV = {a,b} ∧
  dist S.oppApex1 a = dist S.oppApex1 b.
```

The weaker aggregate form may choose any transition source. The stronger form
may identify the residual with the retained frontier pair. Either closes
through the same existing terminal.

This equality is genuinely geometric. It must consume full-parent information
absent from the transition marginals, most plausibly the retained first-apex
double-deletion/radius class and frontier pair, full critical-fiber provenance,
or global minimality/no-`IsM44`. The transition repair does not prove it and
does not close a source `sorry` by itself.

## Validation

Focused single-file check from the Lake root:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/transition-reverse-outside-pair-api/TransitionReverseOutsidePairAPI.lean
```

Result: exit 0. Lean emitted no warnings. The host emitted the informational
line `Not privileged to set domain environment.`

Fresh `#print axioms` checks covered:

- the transition-global split;
- blocker localization, exact cap intersection, exact-two residual, and
  complement containment;
- transition successor injectivity and no-two-cycle;
- zero-entry cycle construction and reverse-membership transport;
- first-continuation anchoring; and
- the direct first-apex co-radial consumer.

Every printed declaration has axiom closure exactly:

```text
[propext, Classical.choice, Quot.sound]
```

No declaration reaches `sorryAx`. No Lake target or full-project build was
started. The optional one-orbit theorem remains prose/Lean-shaped only, the
co-radial producer remains open, and no production source or proof spine
changed.

The referenced period-four/five file reports its own prior focused Lean build
and standard-axiom closure; this lane did not repeat that build.
