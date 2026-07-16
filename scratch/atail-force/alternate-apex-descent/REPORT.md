# Alternate-apex descent audit

Date: 2026-07-14

Status: **SECOND-APEX COMPLETION EXACT IN THE PINNED SHADOW; NEWNESS
CONDITIONAL KERNEL-CHECKED; IMMEDIATE-TERMINAL ALTERNATION DOES NOT CLOSE.**

## Mirrored second-apex completion

`audit_second_apex.py` re-hashes the current 23-survivor checkpoint and the
same formalized metric-core matcher and Lean consumer sources used by the
first-apex audit.  At `oppApex2 = 2`, the strict interior of `oppCap2` is
`{9,10,11}`.  Across its three unordered pairs in all 23 survivors:

- 23 pair equalities are already in the saved equality closure;
- all other 46 one-equality extensions hit an existing Lean core;
- 26 first hit `DuplicateCenterCore`;
- 20 first hit `ExactOffCircleCore`; and
- no nonexisting strict-pair equality remains uncovered.

This is exact theorem-discovery evidence only in the pinned fixed-card-12
`(5,5,5)` finite shadow.  It is not a live pair producer or a Lean proof of
K-A-PAIR.

Replay:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/alternate-apex-descent/audit_second_apex.py --check
```

## What descent actually proves about newness

`AlternateApexDescent.lean` proves the exact unconditional alternative for a
co-radial descent pair relative to an initial ambient exact shell:

```text
same radius, and both points are already in the initial exact support
or
different radius, both points are outside the support, and their ambient
first-apex distances are equal.
```

Thus one endpoint outside the initial support is sufficient to select the
genuinely new branch.  Nontrivial double-deletion survival by itself does not
supply that endpoint nonmembership: the erased pair may be chosen from the
initial exact row while a different row supplies the surviving K4 witness.

The two scratch theorems check with no `sorry` and axiom closure exactly
`propext`, `Classical.choice`, and `Quot.sound`.

## Immediate-terminal alternation

Alternating the apex roles does **not** close the immediate-terminal case at
the currently exported row interface.  The kernel-checked shard-zero witness
records the two current exact rows

```text
oppApex1 row = {0,2,6,7}
oppApex2 row = {0,1,9,10}.
```

Their strict pairs `{6,7}` and `{9,10}` are already in the respective initial
rows.  Erasing `{6,7}` leaves the second row unchanged, and erasing `{9,10}`
leaves the first row unchanged.  So role alternation can reproduce two old
equalities while preserving the other recorded apex row; it does not force
either of the 46/44 missing equality extensions detected by the completion
audits.

This last witness is exact within the finite recorded-row interface.  It is
not a Euclidean `CounterexampleData` model and does not rule out a stronger
geometric theorem using MEC, convex order, total exact-radius information, or
critical deletion provenance.

The remaining producer is therefore precise: prove that some descent pair has
an endpoint outside the corresponding initial exact apex row (equivalently,
its radius differs), or obtain the needed off-frontier equality from a
prescribed deletion-criticality/metric coupling.  Merely alternating the
existing exact rows is not enough.

## Lean validation

From `lean/`:

```bash
lake env lean -M 8192 \
  ../scratch/atail-force/alternate-apex-descent/AlternateApexDescent.lean
```

The direct check exits zero.  All three printed declarations have only the
three standard axioms listed above.
