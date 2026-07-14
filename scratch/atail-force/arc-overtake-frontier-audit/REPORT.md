# Arc-overtake versus the critical-pair frontier

Date: 2026-07-14

Status: **CONSUMER AVAILABLE; NO DIRECT FRONTIER PRODUCER; SMALLEST FORCING
THEOREM IDENTIFIED.**

## Verdict

`SixPointTwoCircleArcOvertakeOrderCore` is not directly produced by the
current `K-A-PAIR` or `CriticalPairFrontier` fields.  Its arbitrary-carrier
adapter needs three rows with the following support incidences and the cyclic
subsequence `O,A,D,E,F,C`:

```text
O-row: A,C,D,E
A-row: O,C
D-row: A,E,F
```

The robust one-way branch supplies two exact critical rows, distinct blocker
centers, and precisely one directed **source** incidence.  It supplies none of
the following additional facts required to identify those rows with two of
the arc-overtake rows:

- a blocker center in the other blocker's exact support;
- a second common support point when the blocker rows are used as the `O` and
  `D` rows;
- a third selected row with the required two or three named hits; or
- the six-label cyclic subsequence.

The first-apex and second-apex K4 rows do not repair this mismatch.  Their
centers are the prescribed apices, while the frontier has no theorem putting
either actual blocker center in an apex row or putting the required apex and
support labels in a blocker-centered row.

On the original five-row `K-A-PAIR` surface, the existing
`LiveArcOvertakeFields` interface remains the sharp conditional adapter.  It
still needs a dangerous blocker-center alignment, a second dangerous hit in
the selected `u` row, a second dangerous point in the critical `p` row, and
the cyclic order.  The critical-pair extraction does not imply those fields:
its survivor sources are newly chosen off-surplus points and are not the fixed
dangerous labels.

## `(4,5,6)` one-way replay

The saved total-critical-map shadow has the one-way endpoint packet

```text
q = 0, w = 10, centerAt(q) = 1, centerAt(w) = 3,
10 notin row(1), 0 in row(3).
```

Running the exact arc-overtake matcher on all twelve saved rows finds no match
in either orientation of the saved cyclic order.  This is a deterministic
finite-shadow diagnostic, not a live or Euclidean countermodel: its first-apex
row has cardinality four, so it is not an instance of the production
card-five blocker classifier.

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/arc-overtake-frontier-audit/audit.py --check
```

## Smallest missing theorem

No new adapter is needed.  The existing generic three-row adapter already
turns the support packet above into the arc-overtake core.  The smallest new
mathematical theorem should therefore be a forcing disjunction, not another
consumer wrapper:

```text
robust one-way CriticalPairFrontier arm
  -> ThreeRowSupportData with cyclic O,A,D,E,F,C
   or one already-consumed cap/MEC/metric alternate.
```

Equivalently on the original live five-row surface, prove
`Nonempty LiveArcOvertakeFields` or a named alternate.  Omitting the alternate
would overstate what the current data suggests: the saved one-way shadow has
no arc-overtake instance at all.

The first useful theorem below that disjunction would have to create a new
cross-center incidence, for example a blocker center in the other blocker's
selected support together with the third-row hits.  A theorem that only
repackages the already-proved directed source hit cannot instantiate the
consumer.

## Theorem-bank preflight

The required sibling and legacy registries were searched, and the indexed
Lean corpora were queried for the three-row equal-distance and cyclic-order
shape.  The searches returned the existing six-point order consumers and
carrier adapters, but no theorem producing this arc-overtake packet from a
critical-pair or one-way blocker branch.
