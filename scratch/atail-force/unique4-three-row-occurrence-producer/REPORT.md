# Exact-two three-row curvature occurrence audit

Date: 2026-07-22

Status: **KERNEL-CHECKED SOURCE REDUCTION; LITERAL FIXED-LEFT TARGET
REFUTED IN THE PINNED FINITE PROJECTION; CORRECTED OUTER-ARC OCCURRENCE OPEN.**

## Verdict

The exact source theorem is not yet proved.  The useful part of the proposed
shape is correct after one correction:

```text
two fixed-critical-image rows contribute one outer arc each;
one late global-K4 completion row contributes both outer arcs.
```

Requiring the two fixed rows to contribute their literal `left` arcs is too
strong and is not invariant under cyclic reflection.  Exact replay of the 12
pinned `n = 11` exact-two records gives:

- all 12 have the corrected three-row occurrence;
- three records have no occurrence in which both fixed rows use their literal
  left arcs; and
- the independently pinned round-20 full-radius-partition projection also has
  the corrected occurrence but no literal-fixed-left occurrence.

Thus the source target must allow either transported outer arc at each fixed
row.  The completion row can still be re-cut to contribute its native left
and right arcs.

## PROVEN: all source rows exist before placement

[`UniqueFourThreeRowOccurrenceProducer.lean`](UniqueFourThreeRowOccurrenceProducer.lean)
proves the source reduction without a `sorry` or a custom axiom.

The boundary helper

```lean
ShellBoundaryIndexing.recutAt
```

cyclically re-cuts a common boundary indexing at any chosen carrier center.
The checked simp theorem

```lean
recutAt_globalChartStartAt_center
```

puts that center at global lift coordinate zero.  This removes period and
window bookkeeping from the completion row: its left outer arc starts at
zero and its right outer arc ends at the fundamental-window endpoint.

The source packet

```lean
FixedImageTwoRowIngress R Q
```

retains:

1. one common `ShellBoundaryIndexing D.A`;
2. two carrier sources selected under the same `lateFirstApexSystem R`;
3. their two actual blocker centers, both in `D.A`, both different from the
   first apex, and distinct from each other;
4. the two sources outside the exact first-apex class; and
5. the exact `2+1+1` cap distribution of the first-apex row.

The theorem

```lean
exists_fixedImageTwoRowIngress
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) :
    Nonempty (FixedImageTwoRowIngress R Q)
```

is kernel-checked.  Its two row definitions are the actual complete selected
shells of the late critical system:

```lean
FixedImageTwoRowIngress.row₁
FixedImageTwoRowIngress.row₂
```

Both retain their mandatory source membership, and the selected-four-class
curvature adapter supplies both transported outer quarter-turn arcs for each
row.

For every chosen carrier center, `D.K4` proves that at least one actual
`SelectedFourClass` exists.  Crucially, the formal placement packet does not
use the earlier fixed `Classical.choice` function `globalK4SelectedRow`.
Instead it carries

```lean
completionCenter : CarrierLabel D.A
completionRow : SelectedFourClass D.A completionCenter.1
```

so the center and its row are selected jointly and late.  This is the weaker,
source-valid target: a favorable row may be chosen after the two fixed-image
rows are known.

## Exact first missing implication

After re-cutting at the completion center, define its outer arcs as

```text
completion-left, completion-right.
```

The checked structure

```lean
ThreeRowMiddleArcPlacement P
```

asks for one outer arc from each fixed-image row and exactly these three gap
inequalities:

```text
end(completion-left) - 1 <= start(fixed-1),
end(fixed-1)         - 1 <= start(fixed-2),
end(fixed-2)         - 1 <= start(completion-right).
```

No center-distinctness premise is imposed because the aggregate terminal does
not consume one.  The 12-record common schema happens to use three centers,
but promoting that empirical feature into the source theorem would strengthen
the obligation without helping the consumer.

The conversion

```lean
ThreeRowMiddleArcPlacement.toFourTurnDisjointSelectedRowArcs
```

is kernel-checked, and

```lean
false_of_threeRowMiddleArcPlacement
```

immediately invokes the existing aggregate terminal.  Therefore the exact
remaining producer is:

```lean
-- CONJECTURED / OPEN; deliberately not declared with `sorry`.
∃ P : FixedImageTwoRowIngress R Q,
  Nonempty (ThreeRowMiddleArcPlacement P)
```

The existential must choose the two fixed-image sources, the completion
center, and the completion row jointly.  Producing an arbitrary pair or a
fixed global-choice row first and then asking it to be favorable would be
stronger than the finite evidence supports.

## Field-by-field ingress and consumer audit

| Input | Checked consequence | Consumed by final terminal? |
|---|---|---|
| `R.class_card_eq_four`, `R.every_class_member_blocks` | legal late system with exact four-source first-apex fiber | indirectly, to obtain fixed-image rows |
| `R.carrier_card_gt_nine` | at least six sources outside that fiber | indirectly, to force two distinct outside actual blockers |
| retained `CriticalShellSystem` / late override | two source-faithful fixed-image rows under one system | yes, as the two middle rows |
| `Q : ExactTwoStrictHitDistribution R` | exact `2+1+1` first-apex support distribution | retained, but no checked implication to a middle-arc gap yet |
| `D.convex` and carrier cardinality | common cyclic boundary indexing | yes |
| `D.K4` | existence of a row at every center, with the favorable row left for late existential choice | yes |
| selected-class curvature transport | two strict quarter-turn outer arcs at every displayed row | yes |
| three ordered gap inequalities | `FourTurnDisjointSelectedRowArcs` | yes, immediately gives `False` |
| `R.minimal`, `R.bisector_center_mem_interior`, complete-radius geometry | not used by the placement reduction itself | must supply new force if they prove the gaps |
| `R.noM44`, MEC/cap exchange content | not used by the placement reduction itself | another available source of missing force |

This accounting prevents the positive 12-record census from being promoted
silently into an arbitrary-cardinality theorem.  None of the existing fields
currently implies the three gap inequalities in Lean.

## Exact finite evidence and regression

[`audit_three_row_occurrence.py`](audit_three_row_occurrence.py) regenerates
[`audit.json`](audit.json).

**EXACT FINITE REPLAY:** every one of the 12 stored exact-two full-partition
projections has at least one corrected three-row witness with two fixed-image
centers and one completion center outside the fixed blocker image.  The
round-20 projection has 16 such witnesses.

The literal-left restriction fails:

- `round_001/opp1_5` has zero;
- `round_002/opp1_4` has zero;
- `round_003/opp1_5` has zero; and
- the round-20 projection has zero.

The sibling exact cyclic regressions for both physical exact-two profiles
replay with zero four-arc packing at all.  Each has one selected nonself
four-row at every center, exact `2+1+1`, a strongly connected selected-row
digraph, and an exact rational scalar-curvature model.  Consequently the
missing placement cannot follow from only global K4 row availability,
`2+1+1`, selected-row strong connectivity, and the scalar curvature ledger.

Those regressions are not Euclidean realizations and do not model the full
`OriginalUniqueFourResidual`.  They omit the complete critical-map and
radius-partition geometry, deletion criticality, MEC data, and `noM44`.
They refute only that weaker proposed ingress.

## Theorem-bank preflight

Before deriving the reduction, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered four separated
quarter-turn arcs, three selected rows, global K4 completion rows, exact-two
cap hits, and shell-curvature transport.  They found the existing aggregate
terminal and transport lemmas, but no source theorem producing the three
cyclic gaps.

## Validation

The full scratch dependency chain and the owned Lean file were elaborated
with `-DwarningAsError=true`.  Every printed proof-facing declaration has
axiom closure exactly:

```text
propext
Classical.choice
Quot.sound
```

The finite artifact was regenerated and checked with:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-three-row-occurrence-producer/\
    audit_three_row_occurrence.py --check
```

No production Lean, shared plan, generated blueprint, or other scratch lane
was edited.
