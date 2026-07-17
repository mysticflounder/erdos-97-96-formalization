# Anchored double-deletion producer audit

Date: 2026-07-16

Status: **SOURCE-FAITHFUL NORMAL FORM KERNEL-CHECKED; PROPOSED THIRD-BLOCKER
PRODUCER IS ALREADY THE CONTRADICTION; SURVIVAL-COVER RESIDUAL IS OPEN.**

## Verdict

Outside the exact-card-four first-apex escape, the proposed source

```text
centerAt(source) != oppApex1,
centerAt(source) != centerAt(frontier.q),
deleting frontier.q blocks K4 at centerAt(source),
deleting frontier.w blocks K4 at centerAt(source)
```

does not exist on the directed cross-membership arm.  This is now a
kernel-checked theorem, not an empirical search conclusion.

The exact source-faithful normal form is stronger:

```text
both frontier deletions fail at centerAt(source)
  <->
centerAt(source) = centerAt(frontier.q).
```

Thus "produce a genuinely third blocker with both deletion failures" is not
an intermediate witness that the remaining parent data should be expected to
construct.  Proving such an existence theorem would already prove the whole
branch inconsistent.

The useful residual is instead a finite-fiber survival cover.  The known
`q`-blocker has at most four sources in its blocker fiber.  Since the live
parent has `9 < D.A.card`, at least six carrier sources lie outside that
fiber, and every one of those sources preserves deletion of `frontier.q` or
preserves deletion of `frontier.w` at its actual blocker.  No current theorem
turns that two-color survival cover into a cap/order or metric contradiction.

## Kernel-checked normal form

`AnchoredDoubleDeletionProducer.lean` imports the checked sibling scratch
module `ThirdCenterCommonPair` and proves without `sorry`:

```text
firstApexClass_card_eq_four_of_qDeletion_blocked_at_actualFirstApex
```

If an actual blocker equals the first apex and deleting the first frontier
point fails there, exact critical-shell membership identifies the shell
radius with the frontier radius.  Therefore the full ambient first-apex
class has cardinality exactly four.

```text
qDeletion_survives_of_actualBlocker_eq_firstApex_of_not_cardFour
```

Consequently, away from exact card four, every actual blocker equal to the
first apex preserves deletion of the first frontier point.

```text
criticalSupports_eq_of_actualBlocker_eq
source_mem_qBlockerShell_of_actualBlocker_eq
```

If two sources choose the same actual blocker, their exact critical supports
agree.  This is proved from the retained `no_qfree_at` polarity and full
critical-shell exactness, not by identifying anonymous selected rows.  Every
source in the known `q`-blocker fiber therefore belongs to the four-point
critical shell sourced at `frontier.q`.

```text
qBlockerFiber_card_le_four
six_le_sources_outside_qBlockerFiber
```

The blocker fiber injects into that exact support, so it has cardinality at
most four.  Under `9 < D.A.card`, its carrier complement has cardinality at
least six.

```text
both_frontierDeletions_blocked_iff_actualBlocker_eq_qBlocker
```

On a directed cross hit

```text
frontier.w in selectedAt(frontier.q).support,
```

simultaneous failure of both frontier deletions is equivalent to equality
with the known `frontier.q` blocker.  The forward direction combines the
third-center perpendicular-bisector classifier with the new exact-card-four
exclusion.  The reverse direction uses exact support locking: every source
mapped to the same blocker has the same selected critical support, hence
contains both frontier points.

```text
frontierDeletion_survival_or_actualBlocker_eq_qBlocker
```

This is the parent-facing cover form.  Every source satisfies one of:

1. deletion of `frontier.q` preserves K4 at its actual blocker;
2. deletion of `frontier.w` preserves K4 there; or
3. its actual blocker is the known `frontier.q` blocker.

```text
not_exists_distinct_actualBlocker_with_both_frontierDeletions_blocked
```

This is the exact negation of the requested positive producer.

Every printed theorem has axiom closure exactly

```text
propext, Classical.choice, Quot.sound.
```

## Source-indexed finite regression boundary

`AnchoredDoubleDeletionFiniteBoundary.lean` is a kernel-checked finite
incidence/radius-class abstraction on `Fin 12`.  It is deliberately not a
Euclidean counterexample and not a model of the full Lean parent.

It retains:

- a `(5,5,5)` cap frame with two frontier points strictly off the surplus cap;
- an ambient exact card-five first-apex class containing the frontier pair;
- a selected four-row at every represented carrier center;
- a total source-to-blocker map with source membership, no fixed blockers,
  same-blocker support locking, and loss of the recorded four-row after
  deleting its source;
- pairwise selected-row intersection cardinality at most two;
- second-apex simultaneous deletion survival;
- a directed cross hit at the actual blocker of the first frontier source;
- exactly the first apex and that known blocker as recorded centers through
  the frontier pair; and
- the full selected-witness closure consequence of minimality: every
  nonempty selected-row-closed subset is the whole represented carrier.

The model kernel-checks both

```text
both_deletions_blocked_iff_known_qBlocker_checked
anchored_third_blocker_target_avoided_checked.
```

This is exact within the displayed finite abstraction.  It does **not**
assert coordinates, Euclidean circle realizability, cyclic separation for
every shared pair, an MEC/non-obtuse Moser certificate, or the full quantified
geometric meaning of every alternative radius.  Those omissions are the
trust boundary, not hidden evidence that the Lean parent is satisfiable.

The finite boundary rules out another pure blocker-map, support-table, or
minimal-closure attempt at this producer.  A new positive argument must
visibly consume the simultaneous Euclidean/MEC/cap-order layer (or another
equally strong parent field) to contradict the survival cover.

## Correct next target

The next theorem should not request a third blocker as a free-standing
witness.  It should attack one of these equivalent direct-contradiction
surfaces:

1. prove that the six-or-more sources outside the known blocker fiber cannot
   all be covered by the two deletion-survival classes once cap order, MEC,
   no-`IsM44`, and both large caps are retained; or
2. prove that one outside-fiber source has both deletion failures, then invoke
   `both_frontierDeletions_blocked_iff_actualBlocker_eq_qBlocker` immediately;
   or
3. derive an already-checked Kalmanson/cap consumer directly from one of the
   two survival classes, without manufacturing the impossible third-center
   packet.

The first missing field is therefore a **geometric consumer of the
source-indexed two-deletion survival cover**, not another row-existence or
blocker-cycle theorem.  The cap profile, `hNoM44`, second-large-cap data, and
full MEC boundary order are not consumed by the normal-form proof and are the
available load-bearing inputs for that consumer.

## Bank and indexed-corpus preflight

Before deriving the normal form, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered prescribed double
deletion failure, selected rows through a prescribed pair, blocker cycles,
first-apex exact critical shells, and minimal selected-witness connectivity.
The relevant existing endpoints were:

- `cross_deletion_survives_iff_not_mem_selected_support`;
- `selectedFourClass_support_eq_shell`;
- `actual_blocker_ne_of_deletion_survives`;
- the third-center common-pair terminal/classifier;
- the blocker-center mutual-cross equivalences; and
- `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`.

No banked theorem consumes the new six-source survival cover with the live
MEC/cap geometry, and no banked theorem produces the impossible genuinely
third double-blocked blocker.

## Validation

The sibling scratch dependency was compiled to a temporary olean outside the
repository, then the normal form was elaborated from `lean/`:

```bash
lake env lean -R .. -M 16384 \
  -o /tmp/p97-anchored-double-deletion-oleans/ThirdCenterCommonPair.olean \
  ../scratch/atail-force/third-center-common-pair/ThirdCenterCommonPair.lean

env LEAN_PATH="/tmp/p97-anchored-double-deletion-oleans:<lake LEAN_PATH>" \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/anchored-double-deletion-producer/AnchoredDoubleDeletionProducer.lean
```

The finite boundary was checked with a larger Lean thread stack because the
exhaustive `Finset (Fin 12)` closure decision is recursive:

```bash
lake env lean -R .. -M 16384 -s 65536 \
  ../scratch/atail-force/anchored-double-deletion-producer/AnchoredDoubleDeletionFiniteBoundary.lean
```

All commands exited zero.  A source scan found no `sorry`, `admit`, custom
`axiom`, `native_decide`, or `unsafe` declaration in either owned Lean file.
No production Lean, closure document, proof-blueprint state, protected
unique-row/555/654 artifact, `SurplusM44`,
`SevenPointTwinFourCircleCollision`, `CriticalPairFrontier`, or other agent
file was modified.

## Epistemic status

- First-apex card-four exclusion, support locking, fiber bound, survival
  cover, and exact double-failure classifier: **PROVEN / KERNEL-CHECKED**.
- Absence of the requested genuinely third double-blocked blocker on this
  branch: **PROVEN / KERNEL-CHECKED**.
- Finite source-indexed regression model: **EXACT WITHIN THE STATED FINITE
  ABSTRACTION; NOT EUCLIDEAN AND NOT A FULL-PARENT COUNTERMODEL**.
- Registry/corpus absence of a cover consumer: **SEARCH-VERIFIED WITHIN THE
  LISTED CORPORA**.
- Contradiction from the six-source survival cover plus full parent geometry:
  **OPEN**.
- Production `sorry` closed by this lane: **NONE**.
