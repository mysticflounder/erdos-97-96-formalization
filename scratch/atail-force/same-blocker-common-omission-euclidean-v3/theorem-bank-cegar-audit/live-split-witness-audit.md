# Surviving witness versus the outside-pair production split

This is a source/artifact audit only.  No Lean, Lake, solver, coordinate,
kernel, or transitive-axiom check was run.

## Exact witness instantiation

The surviving witness is
`n17-profile-6-8-6/witness.json`.  Its model convention uses the fresh cap
sources `q1,q2`, so the cap-source center is their common blocker `bq`; the
opposite first-collision source is `r1`, so its blocker is `br`.

| production role | witness value | selected row |
|---|---:|---|
| `Q.source` | `a1` | — |
| `Q.otherOutsidePoint` | `t2` | — |
| cap-source center `H.centerAt source` | `bq = p1` | `{a1,t1,q1,q2}` |
| opposite blocker `H.centerAt Pρ.source₁` | `br = p2` | `{t3,r1,r2,s2}` |

Thus the four row-incidence patterns of
`FirstFiberOutsidePairFiveCenterOrCrossedResidual` evaluate as follows:

| arm | row-level result |
|---|---|
| common deletion of `Q.source = a1` | false: `a1 ∈ row(p1)` |
| common deletion of `Q.otherOutsidePoint = t2` | **true**: `t2 ∉ row(p1)` and `t2 ∉ row(p2)` |
| crossed `a1 ∈ row(p1) ∧ t2 ∈ row(p2)` | false: the second atom fails |
| crossed `t2 ∈ row(p1) ∧ a1 ∈ row(p2)` | false: both atoms fail |

At the selected-row incidence layer the witness therefore lands uniquely in
the second arm, common deletion of `Q.otherOutsidePoint`.  In production, the
proved producer combines these two omissions with the three rich-apex deletion
robustness hypotheses to construct the full five-center survival predicate.
The finite witness is not itself a Lean term satisfying those production
hypotheses.

Do not confuse this classification with the witness field
`five_center_deletion_residual.selected_arm = delete-Prho.source1`, whose
deleted point is `r1` and whose recorded opposite center is `r2`.  That is the
older collision-endpoint deletion selector, not the new outside-pair split.

## Complete five-point match inventory

The complete per-match points and membership obligations are in
`n17-profile-6-8-6/independent-theorem-shape-replay.json`.  The following table
accounts for every five-point record in that file.  “Split rows” counts matches
having at least one positive membership centered at `p1` or `p2`.

| theorem schema | anchored | rotation-only | rotation-only using split rows | using incidental `p1 ∋ a1` |
|---|---:|---:|---:|---:|
| `false_of_five_ccw_two_selected_rows` | 3 | 18 | 9 | 2 |
| `false_of_five_ccw_second_two_selected_rows` | 0 | 8 | 0 | 0 |
| `false_of_five_ccw_reversed_second_two_selected_rows` | 1 | 18 | 9 | 2 |
| `false_of_selected_rows_in_five_ccw_order` | 1 | 5 | 2 | 0 |
| `false_of_five_ccw_three_shell_equalities_012_124_314` | 0 | 0 | 0 | 0 |
| **total** | **5** | **49** | **20** | **4** |

Membership classification:

- All 5 anchored matches use no membership centered at either live split row.
- Of the 49 rotation-only matches, 20 use `row(p1)` or `row(p2)`.  Four of
  those contain the true atom `a1 ∈ row(p1)`.
- No match contains `t2 ∈ row(p1)` or `t2 ∈ row(p2)`, consistently with the
  selected common-deletion arm.
- The selected arm asserts deletion survival (and, at the selected-row layer,
  the two negative omissions of `t2`); it asserts **no positive membership**.
  Consequently every positive membership atom in all 54 theorem matches is an
  SAT row choice not forced by this live residual.  In particular,
  `a1 ∈ row(p1)` helps determine why this concrete truth table does not take
  the first deletion arm, but it is not a conclusion of the second arm.

The target theorem used by the bounded CEGAR cut remains at 0 anchored and 8
rotation-only matches.  The latter are outside the encoded cut because the run
generated neither cyclic-rotation nor reversal adapters.

## Production and trust boundary

- Four-arm proposition:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9522`.
- Source-clean case-split producer:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9597`.
- Downstream terminal still containing `sorry`:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9762` (body at
  line 9790).
- Finite witness:
  `n17-profile-6-8-6/witness.json`.
- Independent complete theorem-shape replay:
  `n17-profile-6-8-6/independent-theorem-shape-replay.json`.
- CEGAR scope and omissions:
  `README.md:40-51`.

The producer is source-clean by inspection and production-imported, but this
turn did not check current elaboration or its transitive axioms.  The surviving
artifact is finite Boolean/incidence evidence conditional on a common
injective strict-CCW Euclidean interpretation; it supplies no coordinates,
QF_NRA realization, full `CounterexampleData`, cyclic/reversal adapter, or
kernel closure.  The open downstream terminal prevents a closure claim.
