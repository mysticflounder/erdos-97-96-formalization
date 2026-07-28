# B-family bank — report (2026-07-27)

Written by the coordinating session on behalf of the prover agent (whose
harness blocked file writes to this path); content is the agent's delivered
report, verbatim in substance.

**Artifact:** `BFamilyBank.lean` (1136 lines, 13 theorems + 1 def).

**Gate:** `cd lean && lake env lean scratch/b-family-bank/BFamilyBank.lean` →
zero errors, zero warnings, zero sorries. Inline `#print axioms` on all 13
declarations → exactly `[propext, Classical.choice, Quot.sound]` each. No
`sorryAx`, no `Lean.ofReduceBool`, no project axiom. No production file
touched.

## Statement fidelity

Hypothesis lists copied verbatim from the leaves (B1 `:694–741`, B2
`:1166–1232`, B3 `:1241–1332`). Only edits: removing the `_` linter prefix
from binders the proof uses, and appending the labelled gap hypothesis in the
two gap-reduction theorems. Verified mechanically (whitespace-normalised,
`_`-stripped substring match of the leaf block inside each bank signature):
11/11 pass. `b3_gap_refuted` carries the verbatim leaf prefix through
`_hfirstBlockerNeApex` and needs nothing after it.

## Target 1 — B1 normal form + B1-gap reduction: PROVEN

| Claim | Theorem (line) |
|---|---|
| (a) `K ∩ C = {z₁,z₂}` | `b1_sharedSupport_inter_class_eq_pair` (:69) |
| (b) `b ≠ a₂`, both `∈ D.A`, both equidistant from `z₁,z₂` | `b1_two_carrier_bisector_points` (:155) |
| (c) any third bisecting carrier point ⟹ `False` | `b1_false_of_third_bisector_carrier` (:236) |
| doc claim (4): bisector set `= {b,a₂}` | `b1_bisectorSet_eq_pair` (:960) |

The membership-proof mismatch (`first.uPacket.q_mem_A` vs `first.deleted.2`
inside `centerAt`) needed no handling — definitional `Prop` proof irrelevance
makes `actual_blocker_ne_center₂` apply directly. (c) uses
`perpBisector_apex_bound` with `D.convex` + `Finset.two_lt_card`. Structural
assumptions: `ConvexIndep D.A`, shell exactness (`support_eq`,
`support_card = 4`), `hclassIntersectionTwo` for (a). No minimality, no
K4-everywhere.

## Target 2 — B3-rem + B3-gap: PROVEN, but the target is refutable

`b3_removable_iff_survival_off_named_centers` (:343) proves (B3-rem) in both
directions; `b3_false_of_survival_off_named_centers` (:466) proves (B3-gap)
⟹ `False` via `R.minimal`. Four named centers' survival from
`first.uPacket.survives₂/₁`, `first.vPacket.survives₁`,
`crossPacket.survives₁`. No new subset lemma needed —
`CounterexampleData.not_isRemovableVertex_of_minimal` already routes through
`ConvexIndep.erase`. B3's `_hsquare` is unused by either proof.

**Decisive finding: (B3-gap) is false under B3's own hypotheses.**
`b3_gap_refuted` (:901) — `β(z₁) ∈ D.A.erase z₁` (shell `center_mem`), it
differs from all four named centers by B3's own
`_hfirstBlockerNeApex`/`_hfirstBlockerNeU`/`_hfirstBlockerNeV`/
`_hdeletedBlockersNe`, and `no_qfree` at `z₁` denies survival there. One
step.

**Consequence:** `not_isRemovableVertex_of_criticalShellSystem` (:890) — for
*any* `CriticalShellSystem A` and any `x`, `¬ IsRemovableVertex A x`. The
"delete a source, contradict minimality" mechanism is fully absorbed by
`no_qfree` and adds nothing.

## Target 3 — B2: partly PROVEN, no `False`

- **Canonical-row forcing PROVEN and unconditional** — upgrades the round-1
  CONJECTURE. No uniqueness input missing, no collision hypothesis needed:
  in-file lemma `qDeletedRow_at_actualBlocker_eq_canonicalSupport`
  (`FrontierLiveClosure.lean:1110`) applies verbatim to
  `first.uPacket.row₁`, `first.vPacket.row₁`, `crossPacket.row₁`
  (`b2_canonicalRow_forcing`, :583). The "uniqueness" comes from `no_qfree` +
  shell exactness + `card 4 = card 4`.
- **Center exclusion per arm** — `b2_collision_center_exclusion` (:672), via
  `CriticalFourShell.center_not_mem_support` after rewriting along
  `_hcollision`. Arms 1–2 duplicate packet fields
  `deleted_not_mem_uRow`/`_vRow`; arm 3 (`z₁ = β(z₂)`) is new.
- **Mutual omission + bidirectional single-deletion survival** —
  `b2_mutualOmission_bidirectional_survival` (:773), via FLC `:1047` plus new
  helper `survives_at_blocker_of_not_mem_row` (:43): `x ∉ Row(s) ⟹
  HasNEquidistantPointsAt 4 (A.erase x) (β(s))`.
- **NOT PROVEN: no arm yields `False`.** Exact obstruction: in arm 1,
  `first.uPacket.survives₁` reads `HasNEquidistantPointsAt 4 (A.erase z₁)
  z₁`, uncontradicted by `no_qfree` at `u` (erases `u`, not `z₁`) or at `z₁`
  (names `β(z₁)`, and `_hfirstBlockerNeU` gives `β(z₁) ≠ z₁`). Missing
  input: a positive row incidence, or radius-uniqueness at a non-`oppApex1`
  center — `R.unique_K4_radius` holds only at `S.oppApex1`, and
  `R.bisector_center_mem_interior` only for the `oppApex1` pair
  `interior_q/interior_w`.

## Target 4 — status of both boxed gaps

Both round-1 gaps now have short, complete, leaf-independent proofs of their
negation from the leaf binders: (B3-gap) by one `no_qfree` instance; (B1-gap)
because the carrier bisector set of `z₁z₂` is exactly `{b,a₂}`.
`b1_uv_blockers_not_bisectors` (:1039) proves `β(u)` and `β(v)` do **not**
bisect (via `uPacket.actual_blocker_ne_center₁` + `centers_ne`),
strengthening the doc's "not stated or presently proved to bisect".

Precise reading, no overclaim: `Γ ∧ T → False` always yields `Γ → ¬T`, which
is not itself a defect. What is decisive is that the *shortest* proof of
`Γ → ¬T` is already in hand and does not route through the leaf — one
hypothesis instance for (B3-gap); `D.convex` + Dumitrescu L1 + two identified
points for (B1-gap). Neither is a viable round-2 production target; each is
task-equivalent to its leaf.

## Could not verify

- "The B3 survival square does not establish the RHS of (B3-rem)" — a
  non-derivability claim, not a Lean theorem; not attempted. Consistent with
  `_hsquare` being unused.
- The doc's `E₄(A∖c, β(z₁)) ⟺ c ∉ Row(z₁)`: `⟸` is banked as
  `survives_at_blocker_of_not_mem_row`; `⟹` not written (provable by the
  same `no_qfree` + exactness argument, but no target needs it).
- The three harness-side files cited by round 1
  (`scratch_BlockerCoincidence.lean`, `scratch_SurvivalSquare.lean`,
  `scratch_CrossBlockerEqualityAudit.lean`) are absent from this repo;
  unverifiable.

## Ranked next steps (from the agent)

1. Drop the (B3-gap) route — its negation is a one-line `no_qfree`
   consequence.
2. Drop the "delete + contradict minimality" shape inside any
   `CriticalShellSystem` context — the lever is spent
   (`not_isRemovableVertex_of_criticalShellSystem`).
3. B2 arm 3 (`z₁ = β(z₂)`) is the only arm whose center exclusion is not
   already a packet field; an attack there needs radius-uniqueness at
   `β(z₂)` analogous to `R.unique_K4_radius`.
4. B1's local normal form is fully banked and the local geometry proved
   saturated — consistent with round-1's conclusion that closure needs
   global shell/cap/no-`(m,4,4)` structure, not more local circle geometry.
