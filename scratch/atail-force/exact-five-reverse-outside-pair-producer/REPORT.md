# Exact-five reverse outside-pair producer audit

Date: 2026-07-17

Status: **KERNEL-CHECKED NEGATIVE ROUTE CORRECTION.  THE ALL-REVERSE
PACKET FORCES DISTINCT OUTSIDE PAIRS; A REPEATED PAIR IS ALREADY A
CONTRADICTION, NOT A WEAKER PRODUCER.**

This audit owns only
`scratch/atail-force/exact-five-reverse-outside-pair-producer/`.
It does not edit production Lean, closure documents, generated blueprint
state, the protected unique-row/555/654 lane, `surplusM44`, shell-curvature
sources, or the card-five cap/mutual-consumer file.

## Theorem-bank preflight

Before deriving the result, the audit checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed-Lean searches for:

```text
two distinct critical rows share the same two outside cap support points
outside pair uniqueness critical cap center
injective map from ordered cap centers to unordered outside equal-distance pairs
```

The closest banked declarations are:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`;
- `U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`;
- `U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility`; and
- the already-promoted exact-five cross-incidence terminal.

No banked theorem produces a repeated outside pair or the missing dangerous-
triple alignment.  The registries contain consumers after those incidences
are named, not the required global producer.

## Full retained input

The parent theorem in this audit is indexed by

```lean
R : FrontierCoupledExactFivePhysicalCycleParentResidual H F
```

so its type retains, without reselecting or anonymizing anything:

- `F : RobustLargeRadiusParentSurface D S`, including global minimality,
  no-`IsM44`, the six-point physical cap, and the parent radius;
- the first-apex `CriticalPairFrontier`;
- the two origin-tagged common-deletion sources;
- the anchored physical omission-cycle orbit;
- the exact-five second-apex radius profile; and
- the same concrete `CriticalShellSystem D.A` throughout.

The result is nevertheless independent of the extra frontier and
continuation fields.  That is the source-level reason those fields do not yet
close the reverse arm: no current theorem relates them to two different
cycle rows' outside residuals.

## Kernel-checked theorem chain

The file `ReverseOutsidePairProducer.lean` proves the following.

### 1. The cyclic index successor is injective

```lean
successorIndex_injective
```

This is the elementary modular cancellation needed to transport source
injectivity back to edge indices.

### 2. Actual reverse-row blockers are injective

```lean
reverseRowCenter_injective
```

For the successor row of edge `i`, define

```text
c_i = H.centerAt (source (successorIndex i)).
```

If `c_i = c_j`, deletion criticality forces `source (successorIndex j)` into
the selected shell at `c_i`.  The exact reverse cap split says that shell
meets the physical cap in exactly

```text
{source i, source (successorIndex i)}.
```

The first possibility would identify `c_i` with the preceding blocker's
center, contradicting the already-proved consecutive-center separation.  The
second identifies the two successor indices, hence `i = j`.

This removes the explicit center-distinctness premise from the repeated-pair
terminal.

### 3. Repetition is immediately contradictory

Define

```lean
reverseOutsidePair K i =
  selectedSupport(source (successorIndex i)) \ physicalCap.
```

The earlier reverse-closure theorem gives

```lean
(reverseOutsidePair K i).card = 2.
```

The new theorem

```lean
false_of_repeated_reverseOutsidePair
```

shows that for `i != j`, equality of these two-point sets produces two
distinct outside points equidistant from two distinct ordered-cap centers.
It calls

```lean
false_of_two_reverseRows_common_outsidePair
  -> CapSelectedRowCounting.outsidePair_unique_capCenter
  -> False.
```

Thus the proposed repeated-pair producer is extensionally equivalent to a
direct closure theorem on this arm.  It is not a lower-strength intermediate
that follows from the current marginal data.

### 4. The actual unconditional conclusion is injectivity and capacity

```lean
reverseOutsidePair_injective

period_le_choose_capComplement_two
```

The sharp checked inequality is

```text
cycle.period <= choose(card(D.A \ physicalCap), 2).
```

The complete parent-indexed packet is:

```lean
FrontierCoupledReverseOutsidePairCapacity R

nonempty_frontierCoupledReverseOutsidePairCapacity
```

It records period `3..5`, injective actual blocker centers, exactly two
outside points per row, injective outside pairs, and the pair-capacity bound.

This inequality does not close the branch.  Even with period five, a
five-point cap complement has ten available pairs.  The parent has no upper
bound strong enough to reverse the inequality into a pigeonhole collision.

### 5. The ordered-cap source pair straddles its blocker

The packet

```lean
ReverseRowCapStraddle K i

nonempty_reverseRowCapStraddle
```

constructs the physical cap's `CGN.OrderedCap`, its MEC-side and strict-order
data, and indices for the reverse row's actual blocker and two same-cap source
targets.  It proves that the source indices lie strictly on opposite sides of
the blocker index (allowing either source orientation).

The proof uses the exact reverse cap split to identify the two same-cap shell
targets and `CGN.oneSidedDistanceInjective_of_mecCapPacket` to rule out both
targets lying on the same side.  This closes the cap-order part of a possible
shell-curvature adapter without weakening the source identities or replacing
the actual critical row.

### 6. Exact U5 output and missing fields

The parent lift

```lean
nonempty_parentReverseMembershipQCriticalPair
```

retains the existing source-faithful result: for each cycle source deletion,
there are two distinct actual q-critical centers.  This is the strongest
unconditional U5 output currently available.

It still does not provide the antecedents of a banked U5 sink:

- a common `U5DangerousTriple` containing the two blocker centers;
- a named point `p` in both erased q-critical supports; and
- either the required cross-center membership or a third named common point.

The checked one-point intersection bound on the erased consecutive supports
also shows that a proposed `p` plus a distinct third common point cannot be
silently inferred from the present rows.

## Shell-curvature assessment

The other-owned, read-only
`lean/Erdos9796Proof/P97/ConvexCyclicOrder/ShellCurvature.lean` was inspected
only for theorem shape.  It does not currently supply the missing producer.

There is a plausible future role match:

1. a reverse row center lies in the physical cap;
2. its selected shell has exactly two same-cap targets and two outside-cap
   targets;
3. `nonempty_reverseRowCapStraddle` now places the two same-cap targets on
   opposite sides of the center in strict cap order; and therefore
4. in a cyclic lift starting at that center, the two outside targets should
   become the two middle targets of the shell-curvature lemma.

Step 3 is kernel-checked here.  Step 4 is not yet exposed by a checked cyclic
lift adapter.  More importantly,
`ShellCurvature.lean` itself states that construction of the compatible
`CounterclockwiseAngleChart` remains open, and its existing output is a
single-shell curvature budget.  A further **multirow curvature packing
consumer** would still be needed to turn several distinct outside pairs into
a repeated pair, a U5 incidence, or `False`.

Accordingly this audit does not import that in-flight file or claim that its
analytic core closes the cycle.

## First missing global hypothesis

The first absent theorem is not “two outside points per row”; that is proved.
It is a coupling of the following form:

```text
full first-apex frontier
+ origin-tagged continuation
+ all-center critical map
+ ordered-cap / lifted-curvature data
  -> two cycle rows repeat their outside pair
     or one source-faithful U5 terminal antecedent is complete.
```

Concretely, the most promising geometric formulation is an aggregate
curvature-packing theorem for the distinct cap centers and their exact
two-point outside residuals.  The current parent fields neither state nor
derive that aggregate budget.

## Epistemic status

| Claim | Status |
|---|---|
| Every reverse successor row has exactly two outside-cap support points | **PROVEN** |
| Reverse actual blocker centers are injective | **PROVEN** |
| Distinct reverse rows cannot repeat an outside pair | **PROVEN** |
| Reverse outside pairs are injective and satisfy the choose-two capacity bound | **PROVEN** |
| Reverse rows' same-cap source pairs strictly straddle their blockers in cap order | **PROVEN** |
| The current packet forces a repeated pair | **NOT PROVEN; route corrected** |
| The current packet completes a banked U5 sink | **NOT PROVEN; exact fields listed above** |
| The straddle packet admits the required cyclic lift and angle-chart adapter | **CONJECTURAL** |
| Shell curvature can supply an aggregate collision after those adapters | **CONJECTURAL** |

## Validation

The two scratch predecessors were rebuilt into an isolated temporary olean
directory, then the owned file was compiled against them:

```text
PhysicalOmissionCycleParentAdapter.lean : exit 0
ReverseMembershipClosure.lean           : exit 0
ReverseOutsidePairProducer.lean         : exit 0
```

Every printed declaration in `ReverseOutsidePairProducer.lean` has axiom
closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, custom axiom, native computation, or unsafe
declaration in the owned Lean file.
