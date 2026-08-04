> **Status 2026-08-03 — LANDED. Read as a record of a completed refactor, not
> as a proposal.** The recommendation below is implemented:
> `false_of_retainedInteriorDirectedOmission_and_all_low_hits`
> (`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:8556`) is now
> exactly the compatibility wrapper this plan describes — it normalizes via
> `nonempty_retainedOmissionAllLargeNormalForm` and dispatches to
> `false_of_retainedOmission_triApexAllLarge_core`. Live work has moved one
> layer deeper, into that core's eight open branches; see
> `docs/p97-spine-closure-audit-2026-08-03.md`.

## Yes—but refactor the **normal form**, not the theorem into a larger forest of `sorry`s

The current theorem begins one structural layer too early. It receives a `RetainedInteriorDirectedOmission`, whose orientation is still disjunctive, even though the repository already has checked machinery that converts exactly that packet into:

1. an oriented kept/deleted pair;
2. a concrete common-deletion packet;
3. either a localized reverse hit or a reverse common-deletion packet.

Those are much more useful geometric interfaces than the raw disjunction stored in `P`. ([GitHub][1])

The attached E0–E9 expansion remains an excellent semantic audit checklist, but it is too broad to serve as the working proof interface. 

# What is wrong with the current shape

The current leaf is:

```lean
theorem false_of_retainedInteriorDirectedOmission_and_all_low_hits
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  sorry
```

Its docstring says that `P` is the concrete directed-omission branch and that the missing argument must combine it with the frontier pair and the other two rich apex patterns. But the theorem does not expose the strongest checked consequences of `P`; anyone attacking it has to rediscover or manually invoke those consequences. ([GitHub][2])

There are four specific interface problems.

## 1. The orientation disjunction is already solved upstream

`RetainedInteriorDirectedOmission` stores either

[
x_2\notin\Sigma(x_1)
]

or

[
x_1\notin\Sigma(x_2).
]

The repository already converts this to `OrientedRetainedCommonDeletion`, with fields named `kept` and `deleted`, a concrete common-deletion packet, and the certified omission

```lean
deleted_not_mem_kept_shell
```

There is no benefit in carrying the original orientation disjunction into the mathematical core. ([GitHub][1])

## 2. The reverse-incidence split is already checked

From an oriented packet, the checked `RetainedReverseCouplingOutcome` gives exactly:

* `reverseHit`: the kept point lies on the deleted point’s row, with the deleted blocker localized in the first strict cap and
  [
  \Sigma(\text{deleted})\cap C_{i_1}
  ==================================

  {\text{kept},\text{deleted}};
  ]
* `pairedCommonDeletion`: the reverse incidence is absent, and hence there is a second common-deletion packet in the reverse direction.

That is already a much sharper mathematical dichotomy than “directed omission plus all other residuals.” ([GitHub][3])

## 3. In Family E, the generic three-arm large-cap outcome collapses to two arms

The generic `RetainedMatchingLargeCapConsumerOutcome` has three constructors:

1. paired common deletion;
2. first-cap fresh common deletion;
3. second-cap localized reverse hit.

The third exists only because the generic consumer may know merely that **one** opposite cap has size at least five. ([GitHub][3])

Family E is stronger: the first opposite cap has size at least six. Therefore, on every reverse-hit arm, the existing theorem

```lean
exists_fresh_firstCap_commonDeletion_of_reverseHit
```

can produce a fresh third first-cap point outside the reverse shell and a common-deletion packet at that point. There is no need to retain the generic `secondCapLocalizedReverseHit` terminal in the E-specific normal form. The cap assumptions supporting this specialization are part of the Family E bundle. 

So the real E1 dichotomy is:

[
\boxed{\text{paired common deletions}}
]

or

[
\boxed{\text{localized reverse hit plus fresh third common deletion}.}
]

That is the refactor I would make.

## 4. “and_all_low_hits” is now a misleading name

The low-hit inequality is not an independent residual hypothesis in current `main`. The generic theorem

```lean
criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich
```

already proves that any canonical shell meets any rich-apex radius slice in the opposite cap interior in at most two points. It follows from apex richness, blocker/apex separation, and the two-circle bound. ([GitHub][4])

The source itself now describes the later three-hit theorem as an **ex-falso compatibility consumer**: it is not the true positive producer that E1 is waiting for. ([GitHub][2])

The current name encourages the wrong search question:

> How do we contradict the low-hit assumption by producing three hits?

But low-hit is already a theorem under the rich-apex hypotheses. The actual question is:

> Why can no tri-apex all-large minimal configuration contain this normalized directed-omission/common-deletion geometry?

I would remove `all_low_hits` from the new core theorem’s name.

# Recommended refactor

## Step 1: Add one checked E-specific normal form

Something schematically like:

```lean
inductive RetainedOmissionAllLargeNormalForm
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R) : Type

  | pairedCommonDeletion
      (O : OrientedRetainedCommonDeletion P)
      (reverse_omission :
        O.kept ∉
          (H.selectedAt O.deleted O.deleted_mem_A)
            .toCriticalFourShell.support)
      (reversePacket :
        CommonDeletionTwoCenterPacket
          D H O.kept S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))

  | reverseHitFreshCommonDeletion
      (O : OrientedRetainedCommonDeletion P)
      (reverse_mem :
        O.kept ∈
          (H.selectedAt O.deleted O.deleted_mem_A)
            .toCriticalFourShell.support)
      (reverseBlocker_mem_capInterior :
        H.centerAt O.deleted O.deleted_mem_A ∈
          S.capInteriorByIndex S.oppIndex1)
      (reverseShell_inter_cap_eq :
        (H.selectedAt O.deleted O.deleted_mem_A)
              .toCriticalFourShell.support ∩
            S.capByIndex S.oppIndex1 =
          {O.kept, O.deleted})
      (fresh : ℝ²)
      (fresh_mem_capInterior :
        fresh ∈ S.capInteriorByIndex S.oppIndex1)
      (fresh_ne_kept : fresh ≠ O.kept)
      (fresh_ne_deleted : fresh ≠ O.deleted)
      (fresh_not_mem_reverseShell :
        fresh ∉
          (H.selectedAt O.deleted O.deleted_mem_A)
            .toCriticalFourShell.support)
      (freshPacket :
        CommonDeletionTwoCenterPacket
          D H fresh S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A))
```

Its producer should be completely sorry-free:

```lean
theorem nonempty_retainedOmissionAllLargeNormalForm
    (P : RetainedInteriorDirectedOmission R)
    (hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card) :
    Nonempty (RetainedOmissionAllLargeNormalForm P) := by
  rcases nonempty_retainedInteriorCommonDeletion P with ⟨C⟩
  rcases nonempty_orientedRetainedCommonDeletion P C with ⟨O⟩
  rcases nonempty_retainedReverseCouplingOutcome O with ⟨Q⟩
  cases Q with
  | pairedCommonDeletion homit packet =>
      exact ⟨.pairedCommonDeletion O homit packet⟩
  | reverseHit hmem hcenter hinter =>
      rcases exists_fresh_firstCap_commonDeletion_of_reverseHit
          O hinter hfirstLarge with
        ⟨fresh, hfresh, hfresh₁, hfresh₂, hfreshRow, ⟨packet⟩⟩
      exact ⟨.reverseHitFreshCommonDeletion
        O hmem hcenter hinter fresh hfresh
        hfresh₁ hfresh₂ hfreshRow packet⟩
```

The exact namespace qualifications may differ, but all substantive ingredients already exist. ([GitHub][3])

## Step 2: Flatten the tri-apex context

I would also add a checked indexed context, rather than making the core repeatedly unpack the role-specific `L`, `N`, and `T` chain:

```lean
structure TriApexAllLargeContext
    (D : CounterexampleData)
    (S : SurplusCapPacket D.A) : Prop where
  cap_card_ge_six :
    ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card

  apex_rich :
    ∀ i : Fin 3,
      ApexRichClassStructure D.A
        (S.oppositeVertexByIndex i)

  notRobustCover_card :
    D.A.card ≤ 4 * (notRobustCenters D).card

  no_center_covers_all_apices :
    ...
```

A checked constructor from `L`, `N`, and `T` can perform the three finite index cases once. The core proof then sees the configuration in the mathematically natural indexed form.

This is more than cosmetic. Power-matrix, Kalmanson, radical-axis, and row/cap occupancy arguments are naturally quantified over an arbitrary cap index; they should not repeatedly case-split between “first opposite,” “second opposite,” and “surplus.”

`B` may disappear entirely from the core interface because apex richness already implies deletion robustness. The public wrapper can retain it to preserve the existing API. ([GitHub][4])

## Step 3: Introduce one new load-bearing core

For example:

```lean
theorem false_of_retainedOmission_triApexAllLarge_core
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (Q : RetainedOmissionAllLargeNormalForm P)
    (G : TriApexAllLargeContext D S) :
    False := by
  sorry
```

The present theorem becomes a short compatibility wrapper:

```lean
theorem false_of_retainedInteriorDirectedOmission_and_all_low_hits
    ...
    (P : RetainedInteriorDirectedOmission R)
    ...
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    False := by
  have hfirstLarge :
      5 ≤ (S.capByIndex S.oppIndex1).card := by
    omega
  rcases nonempty_retainedOmissionAllLargeNormalForm
      P hfirstLarge with ⟨Q⟩
  exact false_of_retainedOmission_triApexAllLarge_core
    R Q (triApexAllLargeContext_of_residuals L N T)
```

This preserves every existing caller and exported theorem name.

# Where to put it

The present leaf is declared near line 6467, while its real consumers occur thousands of lines later. Several source-clean geometric helpers are declared immediately after it, including same-radius cap localization and selected-row overlap results. ([GitHub][2])

I would place the new core:

* after the generic source-clean helper block;
* before the first namespace containing sibling open terminal theorems;
* or in a dedicated E1 module if the residual structures are extracted cleanly.

That preserves the declaration-order firewall against accidentally proving E1 from another open `sorry`, while allowing it to use the later checked helpers. Moving it all the way below the F-(\Gamma) terminal leaves would be dangerous because those theorems would then become syntactically available as circular shortcuts.

# What I would **not** do

I would not:

* split the three apex-rich structures into all (2^3) arms;
* split the three interior patterns into another (2^3) arms;
* create a theorem whose conclusion is “there exists a three-hit shell”;
* duplicate `OrientedRetainedCommonDeletion`;
* use the generic three-constructor `RetainedMatchingLargeCapConsumerOutcome` as the final E interface;
* merely bundle `F`, `R`, `B`, `L`, `N`, and `T` into one structure without producing stronger normalized data;
* create two new permanent `sorry`s immediately.

The finite Package-E incidence/counting abstractions are already satisfiable, and the audit says the missing information is metric/global geometry plus unlabeled survival/minimality behavior. More combinatorial branch expansion over the same weak language is therefore unlikely to help. ([GitHub][5])

Initially, I would keep **one** core `sorry` and perform the two-arm case split inside it. After running separate countermodel and theorem searches on the two normalized constructors, split them into separate named leaves only when:

* one arm can already be closed; or
* the two arms demonstrably require different mathematical mechanisms.

# Why this is likely to help

The refactor changes the research target from the vague statement

[
\text{directed omission}+\text{all global residuals}\Longrightarrow\bot
]

into two explicit problems:

### Arm A

Two distinct first-cap sources have distinct blocker centers, and deleting either source leaves a common K4 witness at the first apex and the other source’s actual blocker.

This is the natural arm for:

* power-matrix support patterns;
* skew set-pair/Hall arguments;
* deletion-cycle synchronization;
* radius-potential or Kalmanson cycles.

### Arm B

The reverse cross-hit exists, forcing the reverse blocker into the first strict cap and exhausting its cap intersection with the two sources; because the first cap is large, a fresh third strict-cap point supplies another common deletion outside that shell.

This is the natural arm for:

* ordered-cap uniqueness;
* angular midpoint constraints;
* fresh-third blocker-fiber geometry;
* three-circle/radical-axis arguments;
* exact support-rank scans.

Those are genuinely different geometric situations. The current theorem hides that distinction behind the original omission disjunction.

## Bottom line

[
\boxed{\text{Yes, refactor it now.}}
]

But the right change is:

[
\boxed{
\text{raw directed omission}
;\longrightarrow;
\begin{cases}
\text{paired common deletions},\
\text{localized reverse hit + fresh common deletion},
\end{cases}
}
]

followed by one renamed tri-apex all-large core theorem.

That should be a relatively low-risk refactor—roughly a day or two of focused source work and auditing—and it would make E1 substantially more actionable without weakening the source interface or inflating the unresolved frontier.

[1]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingGeometricReduction.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingGeometricReduction.lean"
[2]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean"
[3]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingLargeCapConsumer.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingLargeCapConsumer.lean"
[4]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean"
[5]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/census/frontier-packages/SESSION3-TRIAGE-2026-07-28.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/census/frontier-packages/SESSION3-TRIAGE-2026-07-28.md"

