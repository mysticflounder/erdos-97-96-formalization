# Lean handoff — exact-five outside-blocker fiber trichotomy

Date: 2026-09-01
Last exact source head reported in the lane: e6245182bdc23afd6860ee2cd1539bd18ea66861
Claim boundary: implementation specification; not a compile receipt.

## Target

Replace the current distinct exact-five three-successor interface by a source-clean trichotomy over actual blocker fibers outside the exact first-apex support.

Let `F` be the exact first-apex support, `C` the robust exact second-apex five-class, `Y=A\F`, and `T0=F∩C`. For each blocker center `b` in the image of `centerAt` on `Y`, define the restricted fiber `X_b`, a representative common critical support `K_b`, and trace `T_b=K_b∩C`.

Required source facts:

```text
|F|=4, |C|=5, 12≤|A|,
1≤|X_b|≤4,
X_b⊆K_b,
|K_b|=4,
|T_b|≤2,
b≠O1, b≠O2,
Y is the disjoint union of the X_b.
```

Use `selectedSupports_eq_of_actualBlockers_eq` to prove support independence from the chosen fiber representative.

## Same-two-trace lemma

Prove that two distinct outside blocker centers cannot have the same two-point trace. Extract the two trace points. The robust center O2 and both blocker centers are three pairwise-distinct carrier points equidistant from that pair. Contradict `Problem97.Dumitrescu.perpBisector_apex_bound` or the `ConvexPerpendicularBisectorSides` wrapper.

## Four-survivor branch

If distinct outside blockers b,c leave

```text
d ∈ C \ (T0 ∪ T_b ∪ T_c),
```

then deletion d survives at the four pairwise-distinct centers O1,O2,b,c and its actual blocker differs from all four. Store this as a neutral packet. Do not assert d differs from O1,b,c; a downstream split must return

```text
d=O1 ∨ d=b ∨ d=c ∨ survival-square.
```

The d=O2 arm is impossible by positive radius.

## Pairwise-cover finite theorem

Otherwise every distinct blocker pair satisfies

```text
T0 ∪ T_b ∪ T_c = C.
```

Prove in a pure finite module that exactly one of the following occurs.

1. `threeBlockerSaturation`:
   - exactly two outside blocker fibers;
   - `|A|=12`;
   - both fibers have card four and equal their critical supports;
   - `A=F ⊔ K_b ⊔ K_c`;
   - physical trace sizes are `1+2+2` or `2+1+2` up to swapping the outside blockers.

2. `triangleFiber`:
   - `|T0|=2`;
   - exactly three outside blocker centers;
   - their traces are the three 2-subsets of `R=C\T0`;
   - `12≤|A|≤13`;
   - for each trace class, `|X_T|≤2+|X_T∩T|` and the sum of the intersection terms is 3;
   - at card13 every capacity is saturated, at card12 total defect is one.

Suggested files:

```text
P97/ATail/OutsideBlockerFiberFinite.lean
P97/ATail/ExactFiveOutsideBlockerFiber.lean
```

## Source implementation order

1. Define the outside blocker image/fibers on carrier subtypes.
2. Prove representative support independence.
3. Prove fiber partition/cardinality/support containment.
4. Prove blocker trace card≤2 and both apex inequalities.
5. Prove same-two-trace blocker uniqueness.
6. Implement the pure pairwise-cover classification.
7. Construct `OutsideBlockerFourSurvivorPacket`, `ExactFiveThreeBlockerSaturationPacket`, and `ExactFiveTriangleFiberPacket`.
8. Add the source/center-coincidence-or-square consumer as a separate generic theorem.
9. Do not remove the existing exact-five successor leaves until a terminal consumer is proved and reachability is regenerated.

## Acceptance gates

Focused builds of both modules; `#print axioms` core-only; no native_decide; exact finite regression of the pairwise-cover classifier; source representative-choice test; no fabricated `OriginalUniqueFourResidual`/TwoDeletion packet; regenerated obligation and axiom surfaces before any count claim.
