# Post-v37 global theorem-bank and efficiency audit

Date: 2026-08-03

Inputs:

- `v37_endpoint_frontier_adjacent_singleton_pilot.py`
- `v37-adjacent-frontier-singleton-forced-producer.json`

## Verdict

**Closure status: OPEN.** No retained-omission leaf is closed by v37, and the
coordinator-interface frontier is unchanged.  The 12/12 SAT result is only an
**EMPIRICALLY VERIFIED** result for the finite Boolean relaxation.  It is not a
Euclidean realization, a Lean counterexample, or a proof of the live terminal.

There is a genuine global theorem-bank hit:

```text
Problem97.selectedFourClass_outside_overlap_card_le_one
```

at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9097`.  It is a
source-proved, import-reachable **producer/localizer**, not a terminal consumer,
but the subsequent minimal proof audit shows it is redundant for this exact
localization.  The carrier-level two-circle bound, singleton cap trace, common
point, and overlap lower bound already force the exact one-inside/one-outside
pattern.  That minimal consequence is now banked as
`SelectedFourClass.exact_overlap_of_cap_singleton` in
`P97/U1CarrierInjection.lean`; a direct Lean check passes and its axiom print is
`[propext, Classical.choice, Quot.sound]`.

## What v37 establishes

The pilot combines three Boolean assumptions:

1. pairwise selected-row alternation;
2. a forced branch-local selected row sharing at least two points with the
   retained first-apex row; and
3. the banked adjacent-cap singleton: the retained first-apex row meets the
   adjacent closed cap containing `J` exactly at `J`.

All 12 hard canaries remained SAT (`0` UNSAT, `0` UNKNOWN).  Each case included
8,921 Boolean constraints, of which 40 were adjacent-frontier singleton
constraints.  Aggregate case time was 79.644 seconds, or 6.637 seconds per
case on average.

Thus the singleton theorem is not, by itself, a contradiction with the forced
branch-local two-hit producer and the already-encoded alternation theorem.

## Exact theorem hit and the surviving packet

Let `Kq` be the selected four-class at the first apex, let `J` lie in one
adjacent closed cap `C`, and let `Kz` be the selected row centered at a distinct
branch point `z ∈ C`.  V37 forces

```text
J ∈ Kq.support,
Kq.support ∩ C = {J},
2 ≤ (Kq.support ∩ Kz.support).card.
```

The generic two-circle theorem

```text
SelectedFourClass.inter_card_le_two
```

at `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:474` gives total overlap at
most two.  Together with the singleton cap trace, this alone makes the v37
overlap exactly two points, one of them `J` and the other outside `C`:

```text
Kq.support ∩ Kz.support = {J, x_out},  x_out ∉ C.
```

This is a strict narrowing of the branch-local producer.  It does not refute
the remaining mixed placement.

The finite-set consequence is packaged by
`SelectedFourClass.exact_overlap_of_cap_singleton`.  The remaining ingress is
mathematical rather than finite-set bookkeeping: a live endpoint leaf must
supply the two selected full classes, their distinct centers, and the two-hit
lower bound before the localizer applies.

## Global theorem-bank audit

The mandated registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the sibling
  `p97-rvol` bank section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpora were also searched for the mathematical shape, cap
placement, shared pair, cyclic order, endpoint/branch-center roles, and a third
center.  The useful hits classify as follows:

| Candidate | Classification | Applicability to v37 |
|---|---|---|
| `selectedFourClass_outside_overlap_card_le_one` | proved producer/localizer | Valid but redundant for this exact localization; retained for its other consumer. |
| `SelectedFourClass.inter_card_le_two` | proved producer/localizer | Combined with singleton cap trace and the two-hit premise by the newly banked exact-overlap theorem. |
| `selectedFourClass_shared_pair_separated` | proved order consequence | Already represented by v36/v37 pairwise alternation; not a new contradiction. |
| `false_of_two_selected_rows_shared_late_pair` | proved terminal | Requires the centers to occupy the first two roles and the shared points the last two roles of a strict increasing quadruple. V37 does not force that role order. |
| `false_of_two_selected_middle_rows_shared_endpoint_pair` | proved terminal | Requires the centers to be the middle roles and the shared points the endpoints. V37 does not force that role order. |
| `false_of_thirdActualCenter_selectedRow_contains_frontierPair` | proved terminal | Requires the full relocation packet and a third center distinct from both the first apex and q-blocker. The v37 witness supplies only the two selected-class centers. |
| `shortCap_inter_singleton_or_pair_union_card_of_mem_minimal_u3` | proved classification theorem in `p97-rvol` | Wrong packet and no contradiction; it only classifies a short-cap intersection. |
| left/right adjacent-cap `...triApexAllLarge_core` leaves | active obligations | Their bodies are `sorry`; they are the target, not banked closure. |

No candidate in the sibling, legacy, or older-general registries directly
contradicts a selected-row shared pair consisting of `J` inside the adjacent
cap and one point outside it.  The nearest proved Kalmanson terminals need an
additional cyclic-role placement theorem.  Mixed cap membership alone does not
supply that theorem, and pairwise alternation specifically excludes the two
consecutive-role configurations handled by the displayed four-point
terminals.

## Process and efficiency audit

Do **not** resume aggregate metric CEGAR, enlarge solver budgets, add workers,
or sweep more seeds.  V35 already showed that normalization and fresh model
reconstruction dominate that lane, while v37 now gives clean SAT Boolean
survivors under the stronger producer and singleton assumptions.  More of the
same computation has neither a terminal theorem nor a finite-cover signal to
target.

The smallest justified next step is theorem-first:

1. Prove a thin Lean adapter applying
   `selectedFourClass_outside_overlap_card_le_one` and
   `SelectedFourClass.inter_card_le_two` to the live endpoint-first-apex row
   and branch-local row.  Its conclusion should state the exact shared pair
   `{J, x_out}` with `x_out` outside the chosen adjacent cap.
2. Only after that adapter exists, run a **single symmetry-orbit Boolean role
   census**, not aggregate metric CEGAR.  Add the outside-overlap-at-most-one
   clause, enumerate/canonicalize the four cyclic roles
   `(first apex, branch center, J, x_out)`, and log the escape point separately.
3. Expand from one orbit to the 12 canaries only if the first census reveals
   genuinely different cyclic-role classes.  Promote a terminal only if every
   surviving class maps to an already-proved Kalmanson signature or a newly
   proved order lemma.

Stop after the role census if alternating mixed placements remain.  That
outcome would confirm the current missing bridge: a new placement/order
producer (or a genuinely new mixed-placement metric consumer), not additional
Boolean cardinality or runtime.

## Audit boundary

This report made no shared Lean or documentation edits beyond this scratch
audit.  It ran no Lean build and performed no new axiom closure check.  The
result is therefore:

- v37 finite result: **EMPIRICALLY VERIFIED, SAT 12/12**;
- global theorem hit: **source-proved producer/localizer**;
- mixed one-inside/one-outside terminal: **OPEN**;
- publish-target closure: **NOT ACHIEVED**.
