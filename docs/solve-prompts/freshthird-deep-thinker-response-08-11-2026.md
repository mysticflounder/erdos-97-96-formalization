## Diagnosis

This is a **missing global-incidence theorem**, not a Lean tactic or elaboration problem. I could not honestly produce a kernel-checked closure from the current theorem bank.

The current source already rules out the obvious witnesses. Both `FreshThirdCapSourceNonHit` and `FreshThirdCapSourceInteraction` imply that the corresponding named cap-source row either has the same center as Q’s row or has distinct center and intersection cardinality at most two. Consequently, neither `C.firstSource` nor `C.secondSource` can prove the target; a genuinely new carrier source must be manufactured.

There is also an important asymmetry in `hingress`:

```lean
FreshThirdAlignedRetainedConsumerPacket C ∨
  Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
```

The retained packet belongs to the original surface `C`, but the common-radius packet may contain an entirely different surface `Cσ.surface`. There is no equality relating it to `C`. Therefore, destructuring `hingress` and applying one uniform producer cannot work.

Finally, the later theorem

```lean
false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius
```

is not an independent common-radius closer: its non-hit branches eventually return to `false_of_freshThird_firstNonHit`, hence to the very theorem under construction. Calling or rearranging that theorem would merely create a logical/declaration dependency cycle.

## The adapter that should be banked now

The “three blocked deletions imply three selected-row incidences” step is straightforward and reusable. This is the precise adapter I would add before the target:

```lean
theorem
    exists_freshThird_selectedRow_overlap_card_ge_three_of_blockedSet
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenter :
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (W : Finset ℝ²)
    (hWQ :
      W ⊆
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hWcard : 3 ≤ W.card)
    (hblocked :
      ∀ w ∈ W,
        ¬ HasNEquidistantPointsAt 4
          (D.A.erase w) (H.centerAt source.1 source.2)) :
    ∃ source : CriticalShellSystem.CarrierVertex D.A,
      H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
      3 ≤
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card := by
  refine ⟨source, hcenter, hWcard.trans (Finset.card_le_card ?_)⟩
  intro w hw
  exact Finset.mem_inter.mpr
    ⟨ATAILStageOnePrescribedApexDichotomy
        .source_mem_critical_support_of_no_qfree
          (H.selectedAt source.1 source.2)
          (hblocked w hw),
      hWQ hw⟩
```

The invocation of `source_mem_critical_support_of_no_qfree` matches its existing use in `endpointCentered_dist_eq_of_two_blocked_deletions`. I source-audited this body, although I could not run Lean on the exact snippet in this environment.

It is useful to package its premise:

```lean
abbrev FreshThirdBlockedTriple
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ∃ source : CriticalShellSystem.CarrierVertex D.A,
    H.centerAt source.1 source.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2 ∧
    ∃ W : Finset ℝ²,
      W ⊆
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support ∧
      3 ≤ W.card ∧
      ∀ w ∈ W,
        ¬ HasNEquidistantPointsAt 4
          (D.A.erase w) (H.centerAt source.1 source.2)
```

That makes the real retained obligation explicit and prevents the proof search from drifting back into local row classifiers.

## The correct top-level split

The target should eventually have exactly this shape:

```lean
by
  rcases hingress with hretained | ⟨Cσ⟩
  · rcases
      exists_freshThird_retained_firstNonHit_blockedTriple
        (P := P) (Pρ := Pρ)
        C Q hretained data secondInteraction with
      ⟨source, hcenter, W, hWQ, hWcard, hblocked⟩
    exact
      exists_freshThird_selectedRow_overlap_card_ge_three_of_blockedSet
        (P := P) (Pρ := Pρ)
        Q source hcenter W hWQ hWcard hblocked
  · exact False.elim <|
      false_of_freshThird_firstNonHit_of_commonRadius
        (P := P) (Pρ := Pρ)
        C Cσ Q data secondInteraction
```

The two real mathematical declarations are therefore:

```lean
theorem exists_freshThird_retained_firstNonHit_blockedTriple
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hretained :
      FreshThirdAlignedRetainedConsumerPacket
        (P := P) (Pρ := Pρ) C)
    (data :
      FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    FreshThirdBlockedTriple (P := P) (Pρ := Pρ) Q
```

and

```lean
theorem false_of_freshThird_firstNonHit_of_commonRadius
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Cσ : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data :
      FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    False
```

The second signature is deliberately **not**

```lean
Cσ → Q → False
```

because that would throw away the original non-hit and interaction data and demand a stronger theorem than the spine needs. The common-radius arm should use both surfaces.

## What the retained packet actually gives

In the `sourceRowOmission` constructor, combine the retained deletion core for `C.firstSource` with the omitted fresh endpoint `q`. One obtains points

```text
x ∈ {P.source₁, P.source₂}
y ∈ {Pρ.source₁, Pρ.source₂}
q ∈ {Q.source₁, Q.source₂}
```

and two centers

```text
c  = H.centerAt C.firstSource
O1 = S.oppApex1
```

such that deleting each of `x`, `y`, and `q` preserves K₄ at both `c` and `O1`:

* `x` and `y` are absent from the selected row at `c`;
* `q` is absent from that row by `sourceRowOmission`;
* all three deletions survive at `O1` by first-apex robustness.

At the same time, each deletion blocks K₄ at its own actual blocker center:

```text
x blocks at blocker(x)
y blocks at blocker(y)
q blocks at blocker(q) = Q’s blocker center.
```

The retained producer already supplies the first two omissions and the double-deletion core; `FreshThirdCapSourceNonHit` supplies the third omission.

This is a clean, source-faithful **two-surviving-centers by three-blocker-centers grid**. But it has the wrong polarity for the desired theorem: `x`, `y`, and `q` all *survive* at `c`, whereas the blocked-triple adapter requires three Q-row points that all *block* at one new center.

That rules out the tempting reuse of `CommonDeletionTwoCenterPacket`: it formalizes shared survival under deletion, not shared obstruction.

The new retained theorem therefore needs genuine **blocker transport**. Its job is to use the two unnamed points of Q’s exact four-row, together with the retained grid and `secondInteraction`, to force one actual blocker row to contain at least three Q-row points—or else derive `False` directly.

I would formulate the mathematical heart as:

```lean
theorem freshThird_blockerTransport_of_retainedFirstNonHit
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hretained :
      FreshThirdAlignedRetainedConsumerPacket
        (P := P) (Pρ := Pρ) C)
    (data :
      FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    FreshThirdBlockedTriple (P := P) (Pρ := Pρ) Q
```

That should be the only retained-arm hole. Further splitting it over all interaction-constructor products would recreate the already-unproductive local incidence search.

## How to isolate the common-radius arm

For `Cσ.surface`, interactions with Q can be generated using the existing no-alignment-to-interaction producer. Then the normalization is:

1. Two cross-row hits with distinct centers close by the existing three-center theorem.
2. Two cross-row hits with equal centers should be sent to the common-radius equal-center geometry already developed later in the residual file.
3. The only genuinely new common-radius residue is that at least one row of `Cσ.surface` is itself a non-hit. This should then be combined with the original non-hit on `C`.

The crucial refactor is to extract the non-circular equal-center common-radius argument from the later normalized core. Do **not** call the current `core_commonRadius`, because its non-hit branches call the target.

A useful narrowed residual would be:

```lean
theorem false_of_freshThird_crossSurface_commonRadius_nonHits
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Cσ : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data :
      FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (σdata :
      FreshThirdCapSourceNonHit
        P Pρ Cσ.surface.firstSource Q)
    (σsecondInteraction :
      FreshThirdCapSourceInteraction
        P Pρ Cσ.surface.secondSource Q) :
    False
```

plus its source-swapped companion. This is substantially stronger input than the present single-surface branch: it has four canonical cap-source rows distributed across the original retained-radius surface and a separate common-radius surface.

## Declaration-order refactor

The target occurs before most of the common-radius geometry in `TwoSourceFreshThirdResidual.lean`. Even after removing logical circularity, Lean cannot call those later declarations. The clean module arrangement is:

```text
TwoSourceFreshThirdResidualBase.lean
  definitions, interactions, normalized residual types, local classifiers

TwoSourceFreshThirdCommonRadiusConsumer.lean
  independent common-radius equal-center and cross-surface consumers

TwoSourceFreshThirdResidual.lean
  blocked-triple adapter
  retained producer
  common-radius producer
  on-spine target
  downstream False adapters
```

This also makes an import-cycle audit much easier: `CommonRadiusConsumer` must not import or invoke `false_of_freshThird_firstNonHit`.

## Recommended next move

The most productive next theorem is **not** another cap-interaction case split. It is:

```lean
freshThird_blockerTransport_of_retainedFirstNonHit
```

using the actual blocker map on the two unnamed points of Q’s four-row. In parallel, extract the common-radius equal-center terminal into a pre-target module and reduce the common arm to the cross-surface non-hit statement above.

The blocked-set adapter is essentially finished plumbing. The unresolved content is exactly two global statements: retained blocker transport and common-radius cross-surface incompatibility. That is the smallest faithful decomposition of the displayed on-spine obligation.
