# Incidence-surplus producer shape audit

Date: 2026-07-15

Status: **EXISTING PRODUCER BOUNDARY CONFIRMED; MINIMALITY-ONLY UPGRADE
REFUTED ON THE CURRENT FINITE STRUCTURAL WITNESSES; FULL METRIC PRODUCER
OPEN.**

This audit is scratch-only. It does not edit production, closure documents,
`SurplusM44`, or the user-owned `unique-row-producer` lane. The provisional
Lean adapter written during the audit was removed after comparison showed
that all of its useful declarations already existed.

## Rebase onto the existing checked surfaces

The generic robust sink is already kernel-checked in
`robust-live-bank-adapter/RobustLiveBankAdapter.lean`:

```text
false_of_surplusInterior_row_contains_marginalPair
```

It closes from one selected four-row centered at a strict point of the surplus
cap and containing two distinct points of one off-surplus first-apex marginal.
The live q-shell packet is only one strategy for choosing that center and
pair.

Specializing the row center to the actual blocker of one marginal source and
using the other frontier source as the second marginal point does not define a
new lane. It is exactly the user-owned field

```text
CardFiveDistinctCapLocalCrossHypothesis
```

in
`unique-row-producer/card_five_distinct_cap_local_producer.lean`: one directed
cross membership whose source blocker lies in the surplus cap. Its checked
consumer is `false_of_frontier_cardFive_distinct_capLocalCross`.

The later scratch theorem

```text
false_of_frontier_cardFive_capSeparatedDirectedCross
```

in `cap-local-transport-proof/CapSeparatedDirectedCross.lean` is already
strictly more flexible. It permits any indexed cap containing both the first
apex and the chosen blocker while excluding the two marginal sources. It also
proves that blocker separation from the first apex is automatic on the exact
card-five arm, so the distinct-blocker split is not needed by this consumer.

Finally, the apparent new deletion reformulation is already checked twice:

- production
  `cross_deletion_survives_iff_not_mem_selected_support`; and
- scratch `CommonSystemParent.deletion_blocked_iff_mem_selected_support`.

At the actual blocker of source `q`, these give the exact equivalence

```text
w belongs to selectedAt(q).support
  iff
K4 at blocker(q) fails after deleting w.
```

The card-five branch normal form and automatic blocker separation are also
already recorded in
`rank1-producer/cross_membership_orientation.lean`, especially
`card_five_cross_deletion_survives_or_cross_oppositeSide`.

Therefore this audit adds no new conditional producer and no promotion
candidate.

## What the full-parent hypotheses currently provide

The retained layers stop on opposite sides of the missing incidence:

- `D.K4` supplies at least one four-point selected row at every carrier
  center. It does not prescribe either marginal point in that row.
- `CriticalShellSystem` supplies a total source-to-blocker map, a chosen exact
  critical row at each blocker, and the exact deletion/membership equivalence
  above. It does not place an arbitrary blocker in a cap or force a cross
  deletion to fail.
- MEC/cap order and `outsidePair_unique_capCenter` close once a second cap
  center and two repeated outside points are known. They are upper-bound
  consumers, not an existence theorem for the repeated pair.
- `hNoM44` constrains the global cap profile but exposes no source-indexed
  blocker localization or prescribed selected-row membership.
- The second-cap data has not yet been connected to the first-apex marginal
  by a checked incidence or distance-class transport theorem.

The real caller in
`RemovableVertexAxiom/Continuation.lean` constructs `hmin : D.Minimal`, then
calls `u1_largeCap_routeB_tail_false` without passing it. Restoring that
argument is a legitimate interface cleanup, but its pure selected-row closure
consequence does not by itself produce the missing two-hit.

## Exact finite minimal-closure audit

`check_minimal_closure.py` audits the canonical corrected robust MARCO
checkpoint

```text
scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json
```

at SHA-256

```text
b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9
```

The checkpoint status is `SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW`. It
contains 101 stored structural witnesses and 524 bank cuts; its terminal event
is a verified bank-clean corrected shadow. For every witness the checker
verifies:

- one four-point center-omitting row for every represented carrier label;
- no repeated row center and no support label outside the represented
  carrier;
- a total blocker map on the same carrier; and
- avoidance of the checkpoint's q-shell-anchored sharpened live target.

For each seed label, the checker repeatedly adds the full selected support of
every center already reached. This computes the least selected-row-closed set
containing that seed. A finite row system has no proper nonempty closed subset
exactly when every one-seed closure is the full carrier. This is the finite
incidence consequence used by
`FaithfulCarrierPattern.eq_carrier_of_nonempty_closed` under `D.Minimal`.

Result:

```text
survivors                                 101
total blocker maps                        101
sharpened live target avoided             101
every one-seed row closure is full        101
proper one-seed closure found               0
```

Thus a minimality/row-closure cut excludes none of the 101 current structural
witnesses. In particular, merely threading `hmin` into the tail and invoking
`exists_row_escape_of_proper_subset` cannot close the q-shell producer at the
present incidence abstraction. Any useful minimality argument must combine
the escape sequence with additional metric or convex-order information.

This result is **exact only for the stored finite row systems**. The witnesses
are theorem-discovery objects, and the SAT verdict is only for the corrected
structural encoding. They are not Euclidean realizations, not models of the
full Lean parent, not a Lean satisfiability result, and not counterexamples to
K-A-PAIR.

## Smallest viable remaining producer

There are two equivalent ways to state the actual-blocker specialization.
For frontier marginal sources `q,w`, it is enough to prove one orientation of

```text
blocker(q) lies in a cap with the first apex and outside sources q,w
and
NOT K4(A.erase w, blocker(q)),
```

or the reverse orientation. The deletion failure is exactly the directed
cross hit; the cap placement feeds the already checked adaptive-cap consumer.
Choosing the distinguished surplus cap recovers the user-owned
`CardFiveDistinctCapLocalCrossHypothesis`.

The genuinely more general robust route is still the aggregate/two-hit
producer:

```text
there is a strict surplus center z and a selected row Kz
with two distinct points of the first-apex marginal in Kz.support.
```

Equivalently, for strict centers `I` and marginal `T`, a theorem of the form

```text
|I| < sum z in I, |Kz.support intersect T|
```

would force the desired row. The existing card-12 shadows attain equality,
so raw cap counting cannot prove this strict surplus.

The two negative abstractions isolate the missing interaction:

- the exact cap-local Euclidean model retains MEC/cap/no-M44/card-five and
  two named blockers but omits all-center K4 and a total critical system; and
- the current 101 structural witnesses retain all-center abstract rows, total
  blocker maps, target avoidance, and the minimal row-closure consequence,
  but omit simultaneous Euclidean/MEC realization.

Consequently the next theorem must cross that boundary. It must combine
simultaneous metric all-center K4 and total critical provenance with
MEC/cap/no-M44 or physical second-cap coupling to force one extra marginal
incidence, a cap-separated prescribed deletion failure, or a different
already-banked terminal. More MARCO refinement of the same pure row-closure
surface cannot supply that geometric interaction.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/incidence-surplus-producer/check_minimal_closure.py \
  --check \
  --expect-survivors 101 \
  --expect-sha256 \
  b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9 \
  --summary
```

This checker uses only Python's standard library. No Lean or Lake build is
needed for the new audit; every cited Lean declaration belongs to an existing
checked lane.
