# Unique-four escape-localization audit

Date: 2026-07-22

Scope: scratch only.  This lane starts from the exact-four robust/swapped
minimality escape recorded in
`unique4-robust-global-terminal/REPORT.md` and asks whether one genuine K4 row
escaping the protected parent set can be localized into an already-proved
terminal.

## Decision

**No source-level terminal occurrence or direct contradiction was proved.**

There is a sharper source-valid localization of the escape center than the
previous report recorded:

```text
B =
  original first-apex exact row
  ∪ retained physical-second-apex row
  ∪ {first apex, second apex}.
```

The third Moser vertex is unnecessary.  The two row supports have cardinality
four, so `B.card ≤ 10`.  The live unique-four residual has carrier cardinality
at least eleven, hence `B` is proper.  Universal minimality therefore gives a
center in `B` for which every selected K4 row has a target outside `B`.
Neither physical apex can be that center, because each has a displayed K4 row
contained in `B`.  Thus the escape center lies in the union of the two
displayed apex-row supports.

This is stronger than an anonymous center in the old protected set, but it is
still nonterminal.  One escaping row need not:

- be the row chosen by the fixed critical system at any source;
- contain a pair whose actual common blocker supplies a usable second center;
- place a shared pair and its two centers in a nonalternating cyclic order;
- put both centers in one displayed cap while keeping the pair outside it; or
- contain a point on the MEC boundary from which a complete alternative
  `IsM44` packet can be constructed.

Accordingly no Lean declaration was retained.  A theorem stopping at the
sharper escape center would be another bare escape adapter with no existing
consumer.

## Live proof anchor

The live production target for this scratch audit is:

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_originalFrontierUniqueRadiusArm
```

It remains source-`sorry`.  The separate large-opposite-cap robust target is
another open branch and is not changed here.

## Theorem-bank preflight

Before constructing the audit, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed `nthdegree docs search --lean` queries for escaping K4 rows,
  common deletion, critical fibers, repeated pairs, Kalmanson occurrence,
  cap localization, and alternative `M44` packets.

The closest existing consumers remain:

```lean
ATailCriticalFiberClosingCore.false_of_criticalFiberClosingCore
ATailCapCrossingKalmanson.false_of_selected_rows_in_five_ccw_order
ATailOrdinalKalmansonCycle.false_of_transGen_cycle
Problem97.false_of_two_centers_equidistant_pair_*
```

and contradiction of the parent no-`IsM44` hypothesis by construction of a
complete alternative `SurplusCapPacket`.

No banked theorem turns one escaping row at a support point into any of these
terminal antecedents.  The sibling `p97-rvol` escape lemmas found by the
search are specialized to their U2/`IsM44` same-side interfaces and do not
consume the present full unique-four parent.

## PROVEN source-level strengthening

Let `K₁` be the original exact first-apex row and `K₂` the retained
physical-second-apex row.  Put

```text
B = K₁.support ∪ K₂.support ∪ {O₁, O₂}.
```

Then:

1. `B.card ≤ 4 + 4 + 2 = 10`;
2. `11 ≤ D.A.card`, by the existing unique-four carrier lower bound;
3. hence `B` is a nonempty proper carrier subset;
4. `exists_center_every_selectedFourClass_escapes_of_minimal` gives
   `c ∈ B` such that every selected four-class centered at `c` meets
   `D.A \ B`;
5. `c ≠ O₁`, because `K₁` is a selected four-class centered at `O₁` and is
   contained in `B`;
6. `c ≠ O₂`, by the retained physical-second-apex row `K₂`; and therefore
7. `c ∈ K₁.support ∪ K₂.support`.

The third support-triangle vertex played no role.  This removes one artificial
degree of freedom from the old protected-set argument.

The conclusion is deliberately not packaged as a Lean theorem here: it does
not feed an imported terminal.

## Exact finite incidence regression

The self-contained checker is:

```text
scratch/atail-force/unique4-escape-localization/
  audit_escape_pair_projection.py
```

It embeds the `n = 12`, profile-four terminal-coverage table from
`unique4-occurrence-feasibility` and checks:

- one nonself four-row at every carrier center;
- selected-witness strong connectivity;
- displayed-cap endpoint/interior row-hit bounds;
- pairwise selected-row intersections of cardinality at most two;
- a total fixed-point-free blocker map;
- membership of every source in its actual blocker row;
- first-apex blocker fiber equal to the displayed exact row;
- omission of the physical second apex from the blocker image; and
- avoidance of every nonalternating shared-pair parity terminal.

For the displayed apices `O₁ = 0` and `O₂ = 4`,

```text
K₁ = {1,5,6,8}
K₂ = {2,5,10,11}
B  = {0,1,2,4,5,6,8,10,11}.
```

Center `6 ∈ B` has the escaping row

```text
K₆ = {2,5,7,9},
```

whose targets outside `B` are exactly `{7,9}`.

### Why the available repeated pairs still do not close

The escape row and the physical-second-apex row share `{2,5}`, but the pair
and centers `{4,6}` alternate in the cyclic order.  Hence the four-role
nonalternating two-center terminals do not apply.

The escape row also contains the repeated-blocker pair `{2,7}` with actual
common blocker `11`.  This still does not enter a source-faithful closing
core:

- the escape center `6` is omitted from the blocker image;
- the first-apex row does not contain `{2,7}`;
- `{2,7}` and centers `{6,11}` again alternate cyclically; and
- no displayed cap contains both centers while excluding both pair points.

In fact all nineteen shared row-pairs in the table are alternating.  Thus the
failure is not repaired by choosing a different shared pair within this
projection.

### Epistemic boundary

This is an **exact finite incidence replay**, not a source counterexample.  It
deliberately omits:

- complete ambient radius partitions and `no_qfree_at`;
- universal minimality over every possible selected row;
- full rational triangle/Kalmanson distance feasibility;
- nonlinear planar Euclidean realizability;
- MEC boundary geometry; and
- the global alternative-triangle content of no-`IsM44`.

The underlying terminal-coverage table is known to be full-linear UNSAT.
Therefore it must not be described as a Euclidean, Kalmanson, or Problem-97
survivor.  Its role is narrower: it proves that the incidence and fixed-map
facts alone do not make a single escaping row source-faithfully terminal.

## First missing source-level implication

The next theorem must be collective.  It must use the whole selected-row
closure generated from the protected set together with the fixed critical
system, MEC/cap order, minimality, and no-`IsM44`; selecting only the first
escaping row is insufficient.

A terminal-ready statement should have the following shape:

```lean
terminal_of_uniqueFour_protectedRowClosure
    (R : OriginalUniqueFourResidual F)
    (C : CoupledSwappedExactFourSurface R)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44) :
    Nonempty (CriticalFiberClosingCore ...)
      ∨ Nonempty (P4KalmansonOccurrence ...)
      ∨ ∃ T : SurplusCapPacket D.A, T.IsM44
```

The schematic names suppress the exact dependent parent arguments.  A
production theorem should preferably construct one disjunct locally and call
its existing contradiction immediately.

In concrete terms, the collective argument must force at least one of:

1. a repeated-fiber pair together with a second source-faithful row and the
   cap/order placement required by `CriticalFiberClosingCore`;
2. a shared pair in one of the existing nonalternating two-center placements,
   or the already-banked profile-four three-row Kalmanson occurrence; or
3. an escaping MEC support vertex carrying the complete alternative
   nonobtuse support triangle and exact cap counts required for `IsM44`.

The key missing word is **source-faithful**.  Co-radiality at an arbitrary
minimality center does not identify that center with a row chosen by the fixed
critical system, and a repeated blocker pair does not by itself supply the
other terminal row.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python -B \
  scratch/atail-force/unique4-escape-localization/\
audit_escape_pair_projection.py --check
```

Expected marker:

```text
PASS_ESCAPE_PAIR_PROJECTION \
4524c38367ba94b4bd5a574aaa03437ad1b062fd4ab15a9daa3619c0d56cbe30
```
