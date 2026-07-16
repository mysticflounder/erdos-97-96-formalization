# Terminal cap-row geometry audit

Date: 2026-07-16

Status: **KERNEL-CHECKED CONDITIONAL BRIDGES; EXACT FINITE
INCIDENCE/CAP-PLACEMENT NEGATIVE BOUNDARY; PRODUCER OPEN.**

No production `sorry` is closed by this audit.

## Verdict

The currently retained MEC, cap-cover, cap-order, global-K4, and
critical-system interfaces do **not** presently force the unique source-row
terminal marginal hit to equal the unique second-apex-row terminal marginal
hit. No existing theorem was found that otherwise contradicts
`TerminalThreePointCapRowNormalForm`.

This is an interface and theorem-bank audit, not a logical independence
result for the complete full-parent telescope. A new theorem could combine
the full global fields in a way that no current declaration does.

The smallest useful metric target is one scalar equality attached to the
already-existing second-apex-row marginal hit:

```lean
∃ z,
  z ∈ SelectedClass T.carrier S.oppApex1 radius \ S.surplusCap ∧
  z ∈ R.secondApexRow.support ∧
  dist R.firstCenter z = R.sourceRow.radius
```

`TerminalCapRowMetricBridge.lean` proves

```text
false_of_secondApexMarginal_hit_on_sourceCircle
```

from exactly this antecedent. The reason this direction is sharp is that
`R.sourceRow` is an **exact** `CriticalFourShell`: an ambient point at its
radius is forced into its support. By contrast, `R.secondApexRow` is merely a
chosen `SelectedFourClass`, so the reverse distance equality at
`S.oppApex2` would not by itself force support membership.

## Parent-aligned target

For the dangerous-retaining full-parent system, the exact conditional
specialization is:

```lean
R.firstCenter = p
```

together with

```lean
∃ z,
  z ∈ terminalMarginal ∧
  z ∈ R.secondApexRow.support ∧
  z ∈ {q,t1,t2,t3}.
```

The checked theorem

```text
false_of_aligned_secondApexMarginal_hit_in_dangerousBase
```

closes from these fields because alignment gives

```text
R.sourceRow.support = {q,t1,t2,t3}.
```

Since the terminal marginal is off the surplus cap and the parent retains
`q ∈ S.surplusCap`, a future producer may equivalently target membership in
`{t1,t2,t3}`.

Neither part is currently unconditional:

- the frontier source is selected independently of the rebuilt critical
  system, so the parent does not force `R.firstCenter = p`; and
- even in the aligned branch, no theorem places the unique second-apex-row
  terminal hit in the dangerous base.

## What the retained fields actually give

### Terminal and row geometry

`TerminalThreePointResidual.lean` already proves:

- the terminal first-apex class has exactly four points;
- exactly one is in the surplus cap;
- the off-surplus marginal is exactly
  `{deleted, sourceHit, secondHit}`;
- the source-row and second-apex-row marginal intersections each have
  cardinality one;
- the two singleton intersections are disjoint; and
- the cap multiplicities are `(strict oppCap1, oppCap2) = (3,0)` or `(2,1)`.

Thus an equality theorem for the two row hits is already
contradiction-strength. It is not a neutral bookkeeping fact.

The source row is exact and deletion-critical. The second-apex row is a
four-point witness chosen from a surviving K4 class after deleting the source
and `deleted`; its interface gives no converse from radius equality to
support membership.

### MEC and cap order

The retained cap theorems have already been spent to prove:

- the exact-radius cover by surplus, `oppCap2`, and strict `oppCap1`;
- at most one surplus hit; and
- at most one `oppCap2` hit.

Those are upper bounds and a partition. They do not assign the named
`sourceHit` and `secondHit` to the same singleton cell. The consistent
assignment

```text
deleted, sourceHit : strict oppCap1
secondHit          : oppCap2
```

survives every current cap-count conclusion.

The Q3 adjacent-interior consumers require a named point in one cap interior
and two additional selected-class incidences at the two Moser apices. The
terminal packet does not supply that three-point placement or identify
`R.firstCenter` with the relevant Moser apex. The pinned-row Q3 wrappers
require their own pinned residual packets, and the stronger K4 exclusions
also enter the `IsM44` regime, opposite to the live parent.

### Full-parent dangerous row

The dangerous-retaining rebuild contributes the exact equivalence

```text
R.firstCenter = p ↔ R.sourcePair.x ∈ {t1,t2,t3}
```

and, in the aligned arm,

```text
R.sourceRow.support = {q,t1,t2,t3}.
```

`U3FixedTriplePacket` then supplies all four equalities at the `p`-circle.
These fields would discharge the metric bridge after the second-apex-row hit
were identified with one of `q,t1,t2,t3`. No current theorem provides that
identification. Off alignment the only available relation to the dangerous
base is the upper bound

```text
|R.sourceRow.support ∩ {q,t1,t2,t3}| ≤ 2.
```

### Global K4, total critical map, and no-`IsM44`

Global K4 chooses some four-point row at every center but does not prescribe
the terminal marginal hit in that row. The total critical map makes the
source row exact and records deletion-criticality, but it does not relate the
chosen second-apex survivor row to that exact shell.

For the fixed leaf packet, no-`IsM44` has already produced a distinct cap of
cardinality at least five. The current theorem surface contains no
source-indexed transport from that second large cap to either terminal row
hit. Many sibling U5 cap-order declarations instead require positive
`D.IsM44` or their own bounded-support packet.

## Theorem-bank preflight

The required registries were checked before deriving the adapters:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered terminal marginal
hits, exact source-row circles, second-apex selected rows, shared row points,
MEC/cap placement, and opposite-cap one-hit results.

The closest sibling hits were the `C5D3B` same-side-terminal and fresh-witness
families, including:

- `exists_two_off_rowCircle_of_sameSideTerminal`; and
- `selected_offRow_mem_anchor_or_fresh`.

They consume a different `C5D3BSameSideTerminalPacket` /
`U5QAllowedK4Class` bounded-support interface and do not map the current
terminal hit into `R.sourceRow`. Their conclusions are also primarily
off-row/fresh alternatives, not the missing on-source-circle equality.
No import-reachable adapter was found.

## Exact finite countermodel boundary

`TerminalCapRowIncidenceCountermodel.lean` kernel-checks a `Fin 16` model
containing all of the following:

- an aligned live dangerous row
  `sourceRow = {q,source,sourceHit,thirdDangerous}`;
- `q` in the surplus cap;
- a four-point terminal class with one surplus point;
- off-surplus marginal `{deleted,sourceHit,secondHit}`;
- exactly one source-row hit and exactly one second-apex-row hit;
- `deleted` as the unique marginal point outside both rows;
- distinct row hits and row overlap at most two;
- the ambient five-point off-surplus marginal obtained by adding the erased
  source and its mate;
- at most one `oppCap2` point;
- the exact `(2 strict, 1 oppCap2)` terminal cap split; and
- the source and `deleted` both in strict `oppCap1`.

The model assigns `sourceHit ≠ secondHit`. It is **PROVEN exact within this
finite incidence/cap-placement abstraction**.

It is not a Euclidean realization, an MEC packet, a `CounterexampleData`, or
a total `CriticalShellSystem`. Therefore it does not refute a future theorem
that visibly combines global metric K4/criticality with MEC order. It does
show that more repackaging of the current set/cardinality/cap fields cannot
produce the equality.

## Recommended next producer

The smallest generic target is:

```text
the unique second-apex-row terminal marginal hit lies on the exact
source-row circle.
```

The smallest aligned parent target is:

```text
R.firstCenter = p, and the unique second-apex-row terminal marginal hit lies
in {t1,t2,t3}.
```

A successful proof must visibly use one of the currently uncoupled global
interactions:

1. total critical-map continuation plus global K4 to transport the terminal
   hit into the source shell;
2. MEC/cap order plus the live dangerous labels to identify the hit with a
   member of `{t1,t2,t3}`; or
3. a different metric contradiction for the distinct-hit cap assignment.

Generic cardinality refinement or another anonymous selected-row census is
not aimed at the missing object.

## Validation

Both scratch files were checked directly as deliberate single-file
validations:

```bash
env LEAN_PATH=/private/tmp/p97-r-orbit-entry-oleans \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/r-terminal-cap-row-geometry/TerminalCapRowMetricBridge.lean

lake env lean -R .. -M 16384 \
  ../scratch/atail-force/r-terminal-cap-row-geometry/TerminalCapRowIncidenceCountermodel.lean
```

Both pass with only:

```text
propext, Classical.choice, Quot.sound
```

No full Lake build was run.
