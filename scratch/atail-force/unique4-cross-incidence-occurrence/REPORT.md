# Exact-four actual-row cross-incidence audit

Date: 2026-07-22

## Scope

This lane tests the smallest source-faithful occurrence theorem that could feed
`false_of_one_k1_three_cyclic_selected_rows` on
`R : OriginalUniqueFourResidual F`.  Every row discussed here is a complete
critical shell selected by the same late critical system
`lateFirstApexSystem R`; no arbitrary K4 row is substituted.

## Result

The desired four-role cyclic occurrence is **not forced by the current finite
source projection**.  The strongest unconditional Lean result proved here is
the actual-blocker-orbit dichotomy

```lean
firstApex_mutualActualRows_or_threeCenterActualRowPath
    (R : OriginalUniqueFourResidual F) :
    Nonempty (FirstApexMutualActualRows R) ∨
      Nonempty (FirstApexThreeCenterActualRowPath R)
```

It says that following the actual blocker map from the first apex gives exactly
one of the following source-valid packets.

1. The successor lies in the exact first-apex class.  The late system therefore
   sends it back to the first apex, yielding a mutual two-cycle of actual rows.
2. The successor lies outside that class.  The first two blocker steps then
   visit three pairwise-distinct carrier centers and yield the two mandatory
   backwards incidences along those blocker edges.  Independently, the exact
   first-apex row at `R.interior_q` contains both `R.interior_q` and
   `R.interior_w`.

The proof uses the complete selected supports of the late critical system and
the checked equivalence

```lean
(lateFirstApexSystem R).centerAt source hsourceA = S.oppApex1 ↔
  source ∈ SelectedClass D.A S.oppApex1 radius.
```

It does not claim the reverse or cross memberships needed by the banked cyclic
consumer.

## Survivor falsification

`audit_current_survivors.py` reads the last replay-verified SAT projection in
each of the completed `cegar`, `cegar-minimality`, and
`cegar-pair-minimality` lanes, for both displayed profiles.  It verifies the
result/replay hashes and semantic replay flags before inspecting the rows.

Exact result within those six finite projections:

- every survivor has at least three actual blocker centers;
- every survivor avoids both the direct and reflected four-role schema consumed
  by `false_of_one_k1_three_cyclic_selected_rows`;
- both blocker-orbit arms from the Lean theorem occur;
- in three survivors the successor row has no hit at all in the exact
  first-apex class;
- the pair-minimality overlay still admits both an empty successor-row/class
  intersection and complete avoidance of the cyclic schema.

These are finite-projection survivors, not Euclidean realizations and not
models of every field of `OriginalUniqueFourResidual`.  They nevertheless
falsify deriving the desired occurrence from the fields presently encoded by
those source projections.

Run the audit with:

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-cross-incidence-occurrence/audit_current_survivors.py
```

## First missing positive field

The first missing source-level input is an actual cross hit, not another center
occurrence or rebase lemma.

- On the mutual arm, the successor row is forced to contain the first apex, but
  it is not forced to contain any point of the exact first-apex class.  A
  survivor realizes the empty intersection.
- On the three-center arm, the first and second non-apex rows are each forced to
  contain only their predecessor along the blocker path.  The next useful
  producer must force a second prescribed point in one of these actual rows,
  beginning with a nonempty intersection between the successor row and the
  exact first-apex class (or a stronger ordered cross-membership that directly
  matches a banked consumer).

Even that first extra hit is not yet the whole Kalmanson packet.  A terminal
proof must also supply the remaining cross membership and the compatible cyclic
order required by `false_of_one_k1_three_cyclic_selected_rows`, or target a
smaller banked consumer with an explicitly matched contract.

Therefore this lane does not close a production `sorry`.  It replaces the
incorrect target “three actual centers imply a cyclic-row contradiction” with
the precise missing geometric incidence theorem.

## Validation

The Lean file compiles with warnings as errors.  Its axiom closure is:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, `sorry`, or `admit` in the lane theorem.
