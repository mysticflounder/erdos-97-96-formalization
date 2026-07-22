# Turn-disjoint shell-curvature aggregate terminal

Date: 2026-07-22

Status: **CARDINALITY-GENERIC DIRECT-`False` CONSUMER KERNEL-CHECKED. THE
12 STORED EXACT-TWO SURVIVORS EACH HAVE A MATCHING FINITE TURN-DISJOINT
WITNESS. SOURCE OCCURRENCE FROM `OriginalUniqueFourResidual` IS NOT PROVED.**

## Result

`TurnDisjointCurvatureTerminal.lean` proves:

```lean
Problem97.ShellCurvature
  .false_of_four_turnDisjoint_quarter_turn_arcs
```

For four nonempty open arcs `[aᵢ,bᵢ]` in one fundamental angle-chart window,
the theorem assumes

```text
b₁ - 1 ≤ a₂,
b₂ - 1 ≤ a₃,
b₃ - 1 ≤ a₄,
b₄ - 1 < windowEnd,
```

the strict full-window budget `< 2 * π`, and curvature `> π / 2` on every
arc.  It concludes `False`.

These are the turn-support bounds actually used by
`openWindowArcCurvature`: the contribution of `[a,b]` ends at edge argument
`b - 1`.  Therefore adjacent arcs may overlap in one boundary vertex while
their edge-turn supports remain disjoint.  The production theorem
`false_of_four_separated_quarter_turn_arcs` instead assumes the stronger
vertex-interval bounds `bᵢ ≤ aᵢ₊₁`.

The proof reuses the current production stack through
`ShellCurvatureTransport` (and hence Aggregate, Rows, Construct, and the base
ShellCurvature module).  Monotonicity gives the three inequalities between
successive endpoint edge arguments.  The four open curvatures then sum to at
most the curvature of the containing subarc, which is at most the full-window
curvature.  Four strict quarter turns exceed `2 * π`, contradicting the
strict budget.

The theorem is independent of the carrier cardinality.  Its index hypotheses
are exactly the ordered disjoint-turn-support conditions plus nonemptiness and
containment in one open fundamental window.

## Relation to the 12 exact-two survivors

The checked finite audit

```text
scratch/atail-force/unique4-exact-two-core-port/all_rounds.curvature.json
```

records:

```text
record_count = 12
all_scalar_ledgers_unsat = true
all_have_four_separated_arc_witness = false
all_have_four_turn_disjoint_arc_witness = true
```

A direct `jq` replay also checked that the stored first witness in every
record has four nonempty normalized arcs, satisfies all three bounds
`bᵢ - 1 ≤ aᵢ₊₁`, and satisfies `b₄ - 1 < 11` in the audited 11-point window.
Thus the new Lean consumer matches the exact aggregate shape found in all 12
records; it removes the artificial one-index loss responsible for the failed
old-consumer match.

This is not a source-coverage theorem.  The JSON audit is exact only within
its finite incidence and rational scalar-turn projection.  This lane does not
prove that an arbitrary `OriginalUniqueFourResidual` constructs one of these
four-arc witnesses, nor does it identify the selected finite rows with a
particular source-level occurrence packet.  Consequently it does not by
itself close a production `sorry`.  The remaining bridge is a source-faithful
occurrence theorem that supplies one common chart, four actual equal-radius
row arcs, their quarter-turn inequalities, and the displayed turn-support
ordering.

## Theorem-bank preflight

Before proving the consumer, the required registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered shell curvature, quarter-turn
aggregation, turn-support separation, and direct-`False` consumers.  They
found the current production construction/rows/aggregate/transport stack but
no theorem with the weakened `b - 1 ≤ a'` interface.

## Validation

From `lean/`:

```text
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-turn-disjoint-curvature-terminal/\
    TurnDisjointCurvatureTerminal.lean
```

Result: exit 0.  `#print axioms` reports exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.  No production Lean, shared plan,
proof-blueprint state, or other scratch lane was edited.
