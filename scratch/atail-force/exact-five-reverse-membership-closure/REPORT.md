# Exact-five all-reverse-membership closure audit

Status: **source-clean scratch reduction; no direct contradiction**.

Scope: the `all_reverseMembership` arm of
`PhysicalActualCriticalOmissionCycle`, using the retained global
`CriticalShellSystem`, convex/MEC cap localization, and existing theorem-bank
consumers.  This lane did not modify production, plan docs, generated
blueprint state, or other scratch lanes.

## Preflight

Before deriving a new row or finite-pattern contradiction, the lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- the legacy and older-general-theorem P97 bank registries named by
  `AGENTS.md`; and
- `nthdegree docs search --lean` for:
  - `all reverse membership actual critical omission cycle`;
  - `source deletion blocked at two distinct centers`;
  - `asymmetric critical map cycle`;
  - `ordered cap pair perpendicular bisector centers global K4`;
  - `same deleted source two critical centers`; and
  - `critical deletion multiple centers`.

The nearest banked consumers were:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility`;
- `U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility`;
- the sibling-only
  `U5QCriticalTripleClass.mutual_no_p_exact_center_incompatibility`; and
- the already-production cycle and blocker-equality lemmas.

No banked theorem consumes the current all-reverse packet without additional
positive incidences.

The existing scratch file
`scratch/atail-force/exact-five-reverse-positive-normal-form/ReversePositiveNormalForm.lean`
already proves the cap split and names the outside pair.  This lane rederived
only the pieces needed to specialize current production directly; the cap
split is not claimed as new progress.

## Kernel-checked reductions

The file `ReverseMembershipClosure.lean` elaborates with no `sorry` and reports
only `propext`, `Classical.choice`, and `Quot.sound` for all recorded theorems.

### 1. Period two is impossible

`period_ne_two_of_all_reverseMembership` proves that the all-reverse arm
cannot have period two.  On a 2-cycle, reverse membership on one edge is
literally the forward omission asserted on the other edge.

Consequently:

```lean
three_le_period_of_all_reverseMembership : 3 ≤ K.period
```

Together with the production `period_le_five`, only periods 3, 4, and 5
remain.

### 2. Every source deletion is critical at two distinct actual centers

For an edge `i -> successorIndex i`, reverse membership makes deletion of
`source i` fail K4 at the successor source's actual blocker:

```lean
reverse_source_deletion_fails_at_successorBlocker
```

The same deletion is already critical at its own actual blocker.  The two
centers are distinct by the production
`successor_actualBlockers_ne`.  The exact theorem-facing packet is:

```lean
ReverseMembershipQCriticalPair K i
```

and `nonempty_reverseMembershipQCriticalPair` constructs it from the retained
global `CriticalShellSystem`.  Both rows are packaged as
`U5QCriticalTripleClass` for the same deleted source.

Moreover,

```lean
consecutive_qCriticalSupports_inter_card_le_one
```

proves that after erasing their common deleted source, the two triple supports
share at most one surviving point.  This is the sharp two-circle intersection
normal form, not an unexploited third-common-point contradiction.

This is the strongest new global-map normal form found in this audit.

### 3. Exact cap split of every successor row

The successor blocker is in the same strict physical cap.  Its exact critical
support meets the closed cap in exactly

```text
{source i, source (successorIndex i)}
```

and therefore has exactly two support points outside the cap.  The checked
theorems are:

- `successor_actualBlocker_mem_physicalCapInterior`;
- `successor_actualCriticalSupport_inter_physicalCap_eq_pair`; and
- `successor_actualCriticalSupport_outside_physicalCap_card_eq_two`.

Again, this confirms and specializes the earlier reverse-positive normal-form
scratch result; it is included here to make the consumer audit self-contained.

### 4. Exact ordered-cap terminal

`false_of_two_reverseRows_common_outsidePair` closes immediately if two
distinct successor-row centers share two distinct support points outside the
physical cap.  It feeds those points directly to
`CapSelectedRowCounting.outsidePair_unique_capCenter`.

Thus the exact missing producer for the ordered-cap route is:

> two distinct reverse-positive rows have the same two-point outside-cap
> residual support.

The current packet gives two outside points per row but does not force a
repeat.  The ambient complement is not small enough for an available
pigeonhole argument, and the present global critical-map API has no theorem
identifying the outside pairs of different rows.

## Why the U5 pair consumers do not close this arm

The two q-critical rows are real and source-faithful, but the production U5
terminals need additional named incidences that are absent here.

`two_triple_centers_adjacent_incompatibility` needs:

1. both actual blocker centers to be members of one `U5DangerousTriple`
   around a separate center `p`;
2. `p` in both erased q-critical supports; and
3. one blocker center in the other blocker row.

`two_triple_centers_third_common_incompatibility` replaces item 3 with a third
common dangerous-triple point, but still needs items 1 and 2.

The checked one-point intersection bound shows exactly why that latter
consumer is not already present: its physical-apex point and third common
point would be two distinct surviving common points, while the current packet
provides at most one.

The sibling `mutual_no_p_exact_center_incompatibility` is even more specific:
it needs two dangerous-triple centers, mutual named support incidences, and a
third q-deleted row.  Merely having two distinct actual critical centers for
the same deletion does not match it.

No one of these missing incidences follows from cap order, exact-five physical
membership, the two-point cap intersection, or the currently exposed critical
map fields.

## Verdict and next target

The all-reverse arm is **not closed** by the currently imported consumers.
The audit reduces it to one of two genuinely global producers:

1. **outside-pair collision:** prove that two distinct reverse-positive rows
   repeat their two outside-cap support points, then use
   `false_of_two_reverseRows_common_outsidePair`; or
2. **U5 incidence completion:** for one source's two q-critical actual
   centers, produce the dangerous-triple alignment plus the common physical
   apex and adjacency/third-common incidence required by an existing U5
   terminal.

The first target is narrower and has the shortest existing consumer.  It must
use information beyond cap-local bisectors and anonymous row incidence,
because those abstractions already admit the corrected survivors.  A useful
next audit would ask whether the *full source-indexed critical map* or a global
cardinality bound forces an outside-pair collision among the period-3/4/5
rows.  Without such a theorem, another local geometry or anonymous census run
would be the wrong object.

## Validation

Focused elaboration from the Lean workspace root:

```text
lake env lean ../scratch/atail-force/exact-five-reverse-membership-closure/ReverseMembershipClosure.lean
```

Result: exit 0.  Every printed theorem has axiom closure exactly
`[propext, Classical.choice, Quot.sound]`; none reaches `sorryAx`.
