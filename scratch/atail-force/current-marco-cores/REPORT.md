# Current-shard multi-core and row-extension audit

## Closed computational implication

The fresh current-bank-clean 23-case stream has a uniform **consumer** after
one radius-row extension.  Using the preferred nearest assignment from the
pinned U1 role audit gives this split:

- 11 shards need `h5`;
- 5 shards need `h4`; and
- 7 shards were nominally two edges short (`h5+h7`).

All 23 base shadows are clean under the pinned current classifier.  Adding
only the preferred `h4` or `h5` equality closes every shadow under an already
formalized metric-core consumer.  The first new hit is `DuplicateCenterCore`
in 21 cases and `ExactOffCircleCore` in 2 cases.  In particular, `h5` alone
closes all seven nominal `h5+h7` cases; `h7` is not needed.

Every tested `h4`/`h5` edge has the same row-extension form: its left endpoint
is in the selected exact support at the named center, while its right endpoint
is outside that support.  The center and endpoint cap roles vary substantially,
so the cap-role data does not supply a narrower uniform producer.

The drift-pinned per-shard evidence is
`row_extension_completion_checkpoint.json`.  Replay it with:

```bash
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/current-marco-cores/row_extension_completion.py --check
```

The replay re-hashes the current survivor checkpoint, preferred-role audit,
Python classifier, and the Lean `EqualityCore`/general-carrier consumer files,
then recomputes the first bank hit for all 23 added edges.

## What this changes

No new metric consumer theorem is required for the base-clean shadows.  The
uniform computational target is:

> force one `h4`- or `h5`-shaped equality extending a selected exact radius
> row.

That is a producer target, not yet a theorem.  The checkpoint is a fixed
card-12 `(5,5,5)` finite shadow; it does not prove that every live K-A-PAIR
packet admits the preferred five-role assignment or forces the added equality.
It therefore does not close K-A-PAIR.

## Bank and index preflight

The P97 sibling/legacy/general theorem-bank registries were searched before
treating the completion as new.  The relevant consumers are already in the
current import closure:

- `Problem97.Census554.DuplicateCenterCore` and
  `not_realizes_of_duplicateCenterCore`; and
- `Problem97.Census554.ExactOffCircleCore` and
  `false_of_exactAt_of_exactOffCircleCore`.

The indexed Lean searches for an exact-row outside-point extension and a
duplicate equidistant center found these existing consumer families but no
general live producer forcing the missing `h4`/`h5` equality.

## Critical-map cycle test

The 16 fresh survivors whose witnesses are unchanged and already have exact
equality-minimized CAS cores were joined to the allowed blocker relation
`source → center` iff `source` belongs to the selected exact row at `center`.
The drift-pinned result is `cycle_support_checkpoint.json`; replay it with:

```bash
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/current-marco-cores/cycle_support_audit.py --check
```

Every minimized core uses 6--8 distinct centers.  Consequently no core is
carried by one mutual 2-cycle, or by any directed cycle of length at most 5.
The core center sets collectively contain 37 mutual 2-cycles, but the two full
exact rows on every one of those pairs are `CROSSCHECKED_NONUNIT` in Singular
and both msolve variable orders.  A mutual pair therefore does not carry the
contradiction by itself.

Eleven of the 16 center sets admit an allowed Hamiltonian blocker cycle and
five do not, so even the 6--8-center cycle carrier is not uniform.  The 16
whole equality cores are also 16 distinct exact point-relabeling classes.
Thus generic critical-map cycle existence does not select a recurring banked
core on this sample.  The seven replacement survivors still need a fresh
equality-oracle pass before this negative cycle audit covers all 23.

## Multi-order MUS run (stopped incomplete)

The reusable bounded driver is `mine.py`.  It pins the fresh current-bank
stream but admits only the 16 unchanged witnesses whose older exact-oracle row
cores still match by witness digest.  It accepts an equality deletion only
after independent msolve/Singular `UNIT`, and it labels deletion minimality
only when every one-equality deletion is `CROSSCHECKED_NONUNIT` in Singular and
both msolve orders.

The requested run was stopped once the negative cycle result made further CAS
mining lower value.  Before interruption, shards 0--8 had completed two orders:
their distinct candidate-core counts were respectively `2, 2, 1, 2, 2, 1, 1,
2, 1` (14 candidates total).  Every candidate remained fail-closed as
**minimality uncertified** at the wall budget.  Because the driver writes only
an atomic all-case checkpoint, the interrupted run did not publish
`checkpoint.json`; these progress counts are not a banked certificate and no
recurrence claim is based on them.  No short universal motif emerged before
the stop.

## Epistemic status

- All 23 row-extension implications: **exact within the pinned finite shadow**,
  replayed by the deterministic combinatorial classifier.
- Consumer contradiction families: **Lean-proved** in the current theorem
  bank.
- Uniform row-extension producer from live K-A-PAIR hypotheses: **open**.
- Two-row mutual-cycle nonunit results: **trusted exact-CAS computations** on
  the 16 unchanged fresh survivors; no real-feasibility claim is made.
- Multi-order candidates: **incomplete and unbanked** after the authorized
  stop; no deletion-minimality or recurrence claim.
