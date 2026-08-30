# [HISTORICAL REVIEW] B1 Global Transport Closure Plan (2026-08-17)

> This dated review rejects the archived 2026-08-17 plan. Current B1 work is
> governed by the [2026-08-29 continuation plan](../plans/2026-08-29-b1-global-continuation.md).

**Reviewed document**: [`docs/archive/2026-08-17-b1-global-transport-closure.md`](../archive/2026-08-17-b1-global-transport-closure.md)
**Target declaration**: `Problem97.ATailFrontierLiveClosure.b1_globalGapOrClosedTerminal_of_counterexample`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoDeletionCollision.lean:142`)
**Review date**: 2026-08-17
**Reviewer**: Claude (Fable 5), session 020a5259
**Verdict**: **REJECT as written.** The plan does not close the target. It moves
the `sorry` to a sub-case, and its geometric case split is wrong on two points.

---

## 1. Summary

The plan proposes to prove the disjunction `B1GlobalGapOrClosedTerminal C` by a
case split on whether a third carrier point lies on the perpendicular bisector
PB(q₁, q₂) of the two deleted sources.  Under the exact B1 binders:

* Branch 1 (third carrier on the bisector) and Branch 2 (bisector fibre card ≥ 3)
  are **already refuted** by the sorry-free lemma `b1_live_bisectorSet_eq_pair`
  (`B1Live.lean:161`).  They are not open cases.
* **PROVEN** (kernel-checked, see §7): for every fixed context
  `C : B1GlobalTransportContext`, the sorry-free consumer refutes each arm:

      Branch 3 C → False,   B1GlobalGapOrClosedTerminal C → False

  (axioms `[propext, Classical.choice, Quot.sound]` only).  Per fixed `C`
  this says only that both propositions are refuted; the reverse
  implications from `False` are `False.elim` and carry no content.  The
  non-trivial consequence is at the level of obligations quantified over
  `C`: the three statements

      ∀ C, Branch 3 C        (Branch-3 producer)
      ∀ C, Terminal C        (target producer)
      ∀ C, False             (parent leaf `…_blockerCollision`)

  are interderivable in one step each way (`False.elim`, or one consumer
  application).  So proving the producer, or Branch 3 alone, is exactly as
  strong as proving that no `C` exists.  Branch 3 is not a narrow interface;
  it is the whole obligation.
* The plan's Phase 2 code leaves exactly this arm as `sorry`.

No mathematics is offered for the arm that carries all of the content.

---

## 2. Facts checked against source

All checks were made at the working tree on 2026-08-17.

| Claim in plan | Status | Evidence |
|---|---|---|
| Target at `TwoDeletionCollision.lean:142`, body is `sorry` | Correct | Lines 142–149 |
| Consumer `false_of_b1_global_gap_or_closed_terminal` at `B1Live.lean:756` is sorry-free | Correct (PROVEN) | `#print axioms` → `[propext, Classical.choice, Quot.sound]` (§7) |
| Definition of `B1GlobalGapOrClosedTerminal` (`B1Live.lean:723`) | Correct | Matches the transcription in the plan |
| Structure `B1GlobalTransportContext` (`B1Live.lean:695`) | Correct | Fields as listed |
| 37 open on-spine obligations | Correct | `proof-blueprint spine` on 2026-08-17 reports 37 open, `sorryAx` unapproved |
| Per-file sorry counts in §1 (3 / 15 / 9 / 6 / 4) | Not verified | Not needed for this verdict |
| Reduction is acyclic, no solver certificate | Correct | Spine tree shows `b1_globalGapOrClosedTerminal_of_counterexample` directly under `..._blockerCollision` with 6 closed deps |
| "Case A: ∃ c ∈ D.A ∩ 𝓛, c ≠ oppApex2, c ≠ blocker" is a live case | **Wrong** | See §3.1 |
| "Case B: the 4-shells of q₁ and q₂ ... overlap in ≥ 3 points, satisfying Branch 3" | **Wrong** | See §3.2 |
| Phase 3: open node count decreases 37 → 36 | **Will not happen** | Phase 2 code still contains `sorry` |

---

## 3. Findings

### 3.1 Branches 1 and 2 are closed terminals, not open cases

`b1_live_bisectorSet_eq_pair` (`B1Live.lean:161`; `#print axioms` →
`[propext, Classical.choice, Quot.sound]`, §7) proves, from the same binders
packaged in `B1GlobalTransportContext`:

```
D.A.filter (fun p ↦ dist p first.deleted.1 = dist p second.deleted.1)
  = {(lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2, S.oppApex2}
```

So:

* No carrier point c with c ≠ blocker, c ≠ oppApex2 lies on PB(q₁, q₂).  The
  plan's Case A is empty.
* The bisector fibre has cardinality 2, so Branch 2 is false.

This is why the consumer can send both arms to `False`
(`b1_live_false_of_third_bisector_carrier`, `b1_live_false_of_bisector_fiber_card_ge_three`).
The consumer arms are refutations, not routes a producer can land on.

The plan's Phase 1 helpers (`oppApex2_mem_deleted_bisector`,
`blocker_mem_deleted_bisector`, `oppApex2_ne_blocker`) re-derive facts already
present in `b1_live_normalForm` (`B1Live.lean:52`) and in
`first.uPacket.actual_blocker_ne_center₂`.  They add no new capability.

### 3.2 Branch 3 is the entire B1 collision obligation

`b1_live_escape_small_overlap` (`B1Live.lean:394`; `#print axioms` →
`[propext, Classical.choice, Quot.sound]`, §7) produces an escape point t in
the strict second cap, in the physical class, outside the common row, with a
distinct blocker, and with

```
|support(selectedAt t) ∩ support(selectedAt q₁)| ≤ 2 .
```

Branch 3 asserts ≥ 3 for every such t.  Hence Branch 3 → `False` under the
context.  **PROVEN** (§7, kernel-checked; the Lean statements are `Iff`s whose
`False → _` direction is `False.elim`):

    b1_branch3_iff_false    : Branch 3 C → False        (and back by False.elim)
    b1_terminal_iff_false   : Terminal C → False        (and back by False.elim)
    b1_branch3_iff_terminal : Branch 3 C → Terminal C   (Or.inr ∘ Or.inr) and
                              Terminal C → Branch 3 C   (via the consumer, then False.elim)

Per fixed `C` these say only that both propositions are refuted.  Their
content is at the obligation level:
producing Branch 3 for all `C` is producing `False` for all `C`, which is the
statement of the parent
`false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`;
the reduction from parent to producer has zero gain.
The docstring on `b1_live_false_of_escape_overlap_ge_three`
(`B1Live.lean:503–508`) states the same point informally:

> The lower-bound premise is intentionally explicit: it is not derivable from
> the current B1 binders and must not be smuggled in as a local consequence.

The plan's §1 claim that the target is "the most tractable sorry" because the
consumer is complete and the interface is narrow inverts the situation: a
complete consumer means all difficulty lives in the producer, and a proof
of the "narrow" disjunction yields a proof of the full leaf in one consumer
application (and conversely by `False.elim`).

The plan's Case B statement — "the 4-shells of q₁ and q₂ in the strict cap
interior are forced to overlap in ≥ 3 points" — is also not the statement of
Branch 3.  By `b1_live_normalForm` the two deleted sources have the **same**
selected shell (equal blockers ⟹ equal supports).  Branch 3 compares the shell
of an escape point t against the shell of q₁.  No argument is given for that
comparison.

### 3.3 Phase 2 leaves the `sorry` in place

```lean
  by_cases hthird : ∃ c : ℝ², ...
  · exact Or.inl hthird
  · sorry -- (Or.inr (Or.inr ...))
```

The first arm is vacuous (§3.1).  The second arm is the whole obligation
(§3.2).  Merging this changes nothing on the spine; the Phase 3 check
"37 → 36" would fail.

### 3.4 Prior audits already reached this conclusion

The plan does not cite the recorded B1 audits.  From `nthdegree recall`:

* **P83EP1** (2026-08-05): no direct source or theorem-bank producer exists;
  `b1_live_escape_small_overlap` gives only overlap ≤ 2; a new
  reanchoring/transport lemma is required; do not promote an overlap ≥ 3
  conditional as closure.
* **3E49C2**: `b1_live_bisectorSet_eq_pair` saturates the fibre at the two
  known carriers; "do not reopen B1 as a composition/search task."
* **M3R2JX**: `b1_live_normalForm` already proves equal supports and both
  cross-memberships; the only remaining obstruction is a genuinely new global
  centre-transport producer.
* **JF7KVB**: consumer packet landed 2026-08-05; `producer_theorem` and
  `lift_theorem` remain unset.

The plan is consistent with these audits only in its transcription of the
interface; its route contradicts them without new evidence.

---

## 4. What the plan gets right

* Locations, signatures, and the consumer/producer wiring are transcribed
  correctly.
* The reduction from `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
  through the producer is acyclic and uses no solver certificate.
* The spine count of 37 is current.

---

## 5. Recommendation

1. **Do not execute this plan.**  It would add helper lemmas with no new
   capability and leave the target `sorry` unchanged.
2. If B1 stays on the active goal set, the required work is mathematics, not
   Lean assembly: a transport argument that takes the escaped point t (with its
   distinct blocker and small overlap) to a contradiction, or a different
   terminal not yet packaged in `B1GlobalGapOrClosedTerminal`.  This is
   recorded as an open problem in the project audits above.
3. Any future B1 plan must (a) cite `b1_live_bisectorSet_eq_pair` and
   `b1_live_escape_small_overlap` and explain why its route is not already
   refuted by them, and (b) state the new geometric fact it depends on with a
   `{{NEEDS_PROOF}}` marker until that fact is proven.

---

## 6. Repository state

* `docs/plans/` is untracked as of this review; neither the plan nor this
  review has been committed.
* No Lean source was modified for this review.  The check in §7 was
  elaborated from a file outside the repository against the built `.olean`
  of `B1Live`; nothing was added to `lean/`.

---

## 7. Kernel check for the implication claims

**Status**: PROVEN under the pinned toolchain, 2026-08-17.  Not promoted; the
statements below are review evidence, not spine declarations.

Procedure:

1. `./scripts/lake-build.sh Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1Live`
   — "Build completed successfully"; `B1Live.lean` unmodified in the working
   tree.
2. `cd lean && lake env lean -M16384 -s2097152 <scratch>/B1EquivCheck.lean`
   with the file below.

```lean
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1Live

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.CapSelectedGeometry

theorem b1_terminal_iff_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    B1GlobalGapOrClosedTerminal C ↔ False :=
  ⟨false_of_b1_global_gap_or_closed_terminal C, False.elim⟩

-- `Branch3 C` below abbreviates the third disjunct of
-- `B1GlobalGapOrClosedTerminal C`, copied verbatim from `B1Live.lean:723`.
theorem b1_branch3_iff_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    (∀ (t : ℝ²),
      t ∈
        (SelectedClass D.A S.oppApex2 C.rho ∩
          S.capInteriorByIndex S.oppIndex2) →
      ∀ (htA : t ∈ D.A),
        t ≠ C.first.deleted.1 →
        t ≠ C.second.deleted.1 →
        t ∉
          ((lateFirstApexSystem C.R).selectedAt
            C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support →
        (lateFirstApexSystem C.R).centerAt t htA ≠
          (lateFirstApexSystem C.R).centerAt
            C.first.deleted.1 C.first.deleted.2 →
        3 ≤
          (((lateFirstApexSystem C.R).selectedAt t htA).toCriticalFourShell.support ∩
            ((lateFirstApexSystem C.R).selectedAt
              C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support).card)
    ↔ False :=
  ⟨fun h ↦ false_of_b1_global_gap_or_closed_terminal C (Or.inr (Or.inr h)),
   False.elim⟩

theorem b1_branch3_iff_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    (∀ (t : ℝ²), /- same Branch 3 body as above -/
      t ∈
        (SelectedClass D.A S.oppApex2 C.rho ∩
          S.capInteriorByIndex S.oppIndex2) →
      ∀ (htA : t ∈ D.A),
        t ≠ C.first.deleted.1 →
        t ≠ C.second.deleted.1 →
        t ∉
          ((lateFirstApexSystem C.R).selectedAt
            C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support →
        (lateFirstApexSystem C.R).centerAt t htA ≠
          (lateFirstApexSystem C.R).centerAt
            C.first.deleted.1 C.first.deleted.2 →
        3 ≤
          (((lateFirstApexSystem C.R).selectedAt t htA).toCriticalFourShell.support ∩
            ((lateFirstApexSystem C.R).selectedAt
              C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support).card)
    ↔ B1GlobalGapOrClosedTerminal C :=
  ⟨fun h ↦ Or.inr (Or.inr h),
   fun h ↦ (false_of_b1_global_gap_or_closed_terminal C h).elim⟩

#print axioms b1_terminal_iff_false
#print axioms b1_branch3_iff_false
#print axioms b1_branch3_iff_terminal
#print axioms false_of_b1_global_gap_or_closed_terminal
#print axioms b1_live_bisectorSet_eq_pair
#print axioms b1_live_escape_small_overlap

end ATailFrontierLiveClosure
end Problem97
```

Output (verbatim, module-docstring linter warning omitted):

```
'Problem97.ATailFrontierLiveClosure.b1_terminal_iff_false' depends on axioms: [propext, Classical.choice, Quot.sound]
'Problem97.ATailFrontierLiveClosure.b1_branch3_iff_false' depends on axioms: [propext, Classical.choice, Quot.sound]
'Problem97.ATailFrontierLiveClosure.b1_branch3_iff_terminal' depends on axioms: [propext, Classical.choice, Quot.sound]
'Problem97.ATailFrontierLiveClosure.false_of_b1_global_gap_or_closed_terminal' depends on axioms: [propext, Classical.choice, Quot.sound]
'Problem97.ATailFrontierLiveClosure.b1_live_bisectorSet_eq_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
'Problem97.ATailFrontierLiveClosure.b1_live_escape_small_overlap' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Scope of what this proves: for every fixed `C : B1GlobalTransportContext`,
Branch 3 and the full disjunction each imply `False`, and each of the three
`Iff` statements holds with the stated one-step proofs, relative to the pinned
toolchain and the imported repository state on 2026-08-17.  It does not prove or disprove that
such a `C` exists; that is exactly the open obligation.
