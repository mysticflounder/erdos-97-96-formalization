# Unique-four swapped global-terminal audit

Date: 2026-07-22

Scope: scratch only. This lane starts from the source-clean
`unique4-swapped-terminal/SwappedExactFourCoupling.lean` surface and asks
whether the four outputs of

```lean
Problem97.ATailContinuationBankMatchScratch
  .biApex_two_by_two_survival_normal_form
```

can be closed by retaining global K4, minimality, the complete parent packet,
MEC/cap order, the fixed critical system, and `noM44`. No production Lean or
shared closure document is changed here.

## Decision

No direct terminal was proved.

The corrected local full-linear surface is **SAT in all four continuation
arms**, even after strengthening the displayed continuation rows to unique
exact four-classes and requiring one of them to escape the retained parent
set. Adding global selected K4 to each of the four *fixed* returned tables
makes each table QF_LRA UNSAT, but this is not an occurrence theorem:
re-searching the full outcome surface with K4 at the unused strict
second-cap point is again SAT in all four arms.

Therefore the first absent global layer is not one more row at a predetermined
point. It is a **collective selected-row occurrence/coverage theorem**. The
narrowest current terminal target is an arbitrary-cardinality occurrence of
the three-row, nine-membership boundary schema consumed by

```lean
Problem97.CorrectedOwnCapKalmansonCoresScratch
  .false_of_four_endpoint_k2_three_row_instances
```

from the full coupled parent and one of the four two-by-two outcomes. The
fixed-`n = 11`, profile-four DRAT certificate proves coverage only for its
hash-bound finite projection; it does not prove this source-level
arbitrary-cardinality occurrence.

No conditional Lean adapter is added: the available adapter would stop at a
single escaping row and would not feed any existing terminal.

## Theorem-bank and indexed-corpus preflight

Before searching, this lane checked the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered exact-four swapped classes,
two-center common deletion, three-center coupling, residual/full-fiber
returns, support or blocker stars, and Kalmanson terminal schemas. The
closest reusable declarations are:

```lean
biApex_two_by_two_survival_normal_form
biApex_three_center_two_deletion_coupling
exists_center_every_selectedFourClass_escapes_of_minimal
false_of_four_endpoint_k2_three_row_instances
outsidePair_unique_capCenter
```

No banked theorem was found that turns one of the four two-by-two outputs,
together with the retained full parent, into `False`.

## Source-clean starting surface

`CoupledSwappedExactFourSurface R` already supplies:

1. unique exact four-classes at the two physical apices;
2. identification of the retained second-apex ingress support with the
   swapped exact class;
3. mutual avoidance of the original and swapped retained pairs;
4. disjoint retained pairs;
5. an ingress center distinct from both apices;
6. at least two strict hits in each opposite cap; and
7. intersection cardinality at most two for the apex classes.

Choosing two strict points in each exact class feeds
`biApex_two_by_two_survival_normal_form`, which produces:

1. common deletion of the first strict first-cap point at both selected
   second-cap centers;
2. common deletion of the second strict first-cap point;
3. one crossed critical orientation; or
4. the reverse crossed orientation.

The common-deletion output has two selected rows but does not force a common
outside pair. The crossed output has two exact critical rows and forced
cross omissions but does not force a dangerous-triple packet, a common
outside pair, or a terminal Kalmanson occurrence.

## Correction to the empirical boundary

An earlier fixture reported during this audit used an apex class with two
non-center hits on one endpoint cap. That violated the already-proved
endpoint one-hit bound and was not source-shaped. The predecessor
`unique4-swapped-terminal` lane has since corrected its own checker.

This lane independently enforces the corrected endpoint constraints in
`audit_two_by_two_outcomes_lra.py`:

- the first-apex class contains its two strict first-cap points, at most one
  non-center surplus-cap point, and at most one non-center second-cap point;
- the second-apex class contains at least two strict second-cap points, at
  most one non-center surplus-cap point, and at most one non-center
  first-cap point;
- every additional selected row obeys the selected-row cap bound for every
  displayed cap containing its center.

The eleven boundary roles are:

```text
0       O1
1,2,3   surplus strict points
4       O2
5,6     first-opposite-cap strict points
7       third Moser vertex
8,9,10  second-opposite-cap strict points
```

Every replay includes positive distances, all triangle inequalities, and
both strict Kalmanson inequalities for every cyclic quadruple.

## EMPIRICALLY VERIFIED: all four corrected local outcomes are QF_LRA SAT

`audit_two_by_two_outcomes_lra.py` strengthens both displayed continuation
rows to unique exact four-classes. It also requires the first continuation
row to have a target outside

```text
B = {O1,O2} ∪ firstApexClass ∪ secondApexClass.
```

All four outcomes are exactly rational QF_LRA SAT:

```text
common_delete_5
  C1=(1,5,6,8) C2=(0,5,9,10) z=(9,10)
  rows=(0,2,3,6),(2,4,7,8)

common_delete_6
  C1=(1,5,6,8) C2=(0,5,9,10) z=(9,10)
  rows=(0,2,3,5),(2,4,7,8)

cross_5_at_9_6_at_8
  C1=(1,5,6,8) C2=(0,5,9,10) z=(9,10)
  rows=(0,2,6,7),(3,4,5,7)

cross_6_at_9_5_at_8
  C1=(1,5,6,8) C2=(0,5,9,10) z=(9,10)
  rows=(0,2,3,5),(0,4,6,7).
```

Each witness also includes a source-shaped retained ingress row; the replay
prints it in full.

This is exact only in the rational linear-distance abstraction. It is not a
Euclidean coordinate realization, a `CounterexampleData`, a coherent
all-source `CriticalShellSystem`, a proof of full minimality, or a model of
global `noM44`.

## PROVEN upstream but nonterminal: one universal escape from `B`

There is a source-valid way to obtain the escape condition modeled above.
The coupled apex classes give

```text
B.card ≤ 10.
```

The exact-four residual gives `11 ≤ D.A.card` through
`carrier_card_ge_eleven R`; hence `B` is a nonempty proper subset of the
carrier. The kernel-checked theorem

```lean
exists_center_every_selectedFourClass_escapes_of_minimal
```

then yields one `center ∈ B` for which every selected ambient four-class has
a target outside `B`. The center cannot be either apex, because the displayed
apex exact class is contained in `B`. Thus it lies in one of the two exact
apex supports.

This is stronger than choosing one favorable row, but it still supplies only
one escaping row at an unspecified support center. The corrected SAT replay
shows that such an escape plus the four two-by-two outcomes does not by
itself force the present terminal packets. Formalizing another thin adapter
to this nonterminal output would not advance the proof spine.

## EMPIRICALLY VERIFIED: global K4 kills the four fixed tables

`check_fixed_global_k4.py` freezes the four tables above and adds a
source-shaped selected K4 disjunction at every one of the eleven centers.
All four fixed tables become QF_LRA UNSAT:

```text
common_delete_5                 UNSAT
common_delete_6                 UNSAT
cross_5_at_9_6_at_8             UNSAT
cross_6_at_9_5_at_8             UNSAT
```

For these fixed tables, a K4 row at a single named center already suffices:

```text
common_delete_5      centers 1,3,5,8
common_delete_6      centers 1,3,5,8
cross 5/6            centers 1,2,3,6,7,8
cross 6/5            centers 1,2,3,7,8.
```

This result is table-specific. It does not prove that the same center, row,
or terminal schema occurs for every realization of a continuation outcome.

## EMPIRICALLY VERIFIED: one additional named K4 row does not close

`search_unused_strict_k4.py` re-searches the corrected classes,
continuation rows, and ingress rather than freezing them. It additionally
requires selected K4 at the third strict second-cap role not used as one of
the two continuation centers.

All four outcomes remain exact rational QF_LRA SAT. Therefore the fixed-table
UNSAT result cannot be lifted as:

```text
choose the unused strict cap point and apply global K4 there.
```

The continuation supports can move and avoid that one-row obstruction.

A root checkpoint reran the four parent-set outcomes independently with
selected K4 simultaneously at every center of `B`.  The `common_delete_5`
outcome is exact rational QF_LRA `SAT`, with

```text
C1=(1,5,6,9) C2=(1,6,8,10)
rows=(3,6,7,9),(2,3,8,9)
ingress=(0,4,5,8).
```

The other three outcome processes were still unresolved under the run budget
at this checkpoint and are not assigned a verdict here.  The single SAT arm
is already enough to refute the proposed local implication

```text
K4 at every center of B -> current three-row terminal.
```

It does not refute a source theorem using the complete critical system,
nonlinear Euclidean/MEC geometry, or `noM44`, all of which remain absent from
the linear abstraction.

## Relationship to the fixed profile-four certificate

`unique4-p4-full-linear-certificate/REPORT.md` records a `drat-trim`-verified
UNSAT terminal for the exact fixed-`n = 11`, `opp1_card = 4` CNF. Its final
transported core is the cardinality-generic Lean theorem

```lean
false_of_four_endpoint_k2_three_row_instances
```

with eight ordered boundary roles, three selected row instances, and nine
named memberships.

The formal consumer is already warning-clean and source-clean. The missing
part is not another Kalmanson inequality theorem. It is coverage from the
live arbitrary-cardinality parent. Neither `carrier_card_ge_eleven` nor the
current exact-four residual proves `D.A.card ≤ 11`, so the fixed finite
certificate cannot be invoked directly on the live branch.

## First missing source-level theorem

The narrowest theorem that would lift the deciding fixed evidence is an
arbitrary-cardinality occurrence result of the following shape:

```lean
exists_p4KalmansonOccurrence_of_coupledSwapped_twoByTwoOutcome
    (R : OriginalUniqueFourResidual F)
    (C : CoupledSwappedExactFourSurface R)
    -- strict points and their source memberships
    (hout :
      Nonempty (CommonDeletionTwoCenterPacket D H a z₁ z₂) ∨
      Nonempty (CommonDeletionTwoCenterPacket D H b z₁ z₂) ∨
      Nonempty (CrossedCriticalNormalForm D H K₁ a b z₁ z₂) ∨
      Nonempty (CrossedCriticalNormalForm D H K₁ b a z₁ z₂)) :
    ∃ i0 i1 i2 i3 i4 i5 i6 i7
        (Row0 Row1 Row3 : SelectedFourClass D.A _),
      i0 < i1 ∧ i1 < i2 ∧ i2 < i3 ∧
      i3 < i4 ∧ i4 < i5 ∧ i5 < i6 ∧ i6 < i7 ∧
      -- the exact nine support memberships consumed by
      -- false_of_four_endpoint_k2_three_row_instances
      ...
```

The boundary enumeration and convex-order contract are suppressed in this
architectural signature; a production statement must carry them exactly as
required by the consumer.

Equivalently, and preferably for the final spine, prove `False` directly
from these inputs by constructing the occurrence locally and immediately
calling `false_of_four_endpoint_k2_three_row_instances`.

This theorem must:

- retain the full parent `R`, not only the two selected exact classes;
- use global K4/minimality through a collective row argument rather than
  selecting one predetermined center;
- work for arbitrary `D.A.card ≥ 11`, or explicitly prove an upper bound
  reducing to the fixed-11 projection;
- preserve actual row instances and all nine memberships; and
- discharge all four two-by-two outcomes.

A valid alternative is a coverage disjunction whose other constructors feed
an already-proved terminal such as a same-cap common outside pair or a
genuine alternative `M44` packet. A new nonterminal packet is not progress.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with z3-solver \
  python -B \
  scratch/atail-force/unique4-swapped-global-terminal/\
audit_two_by_two_outcomes_lra.py

UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with z3-solver \
  python -B \
  scratch/atail-force/unique4-swapped-global-terminal/\
search_unused_strict_k4.py

UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline --with z3-solver \
  python -B \
  scratch/atail-force/unique4-swapped-global-terminal/\
check_fixed_global_k4.py
```

Expected final markers:

```text
PASS_EXACT_QF_LRA_ALL_FOUR_TWO_BY_TWO_OUTCOMES_WITH_ESCAPE
PASS_EXACT_QF_LRA_ALL_FOUR_OUTCOMES_WITH_UNUSED_STRICT_K4
PASS_FIXED_FIXTURES_GLOBAL_K4_UNSAT
```

Current script SHA-256 values:

```text
4325dd4a9ee47610fd4244f9e696de1cdff74b1eefbf9e88989f6cda40dfe7f2  audit_two_by_two_outcomes_lra.py
8cefe0a9cf14d9dd6479e1311c3e65cc9a7bfdf2b38875e32ff59fb35a15ee58  check_fixed_global_k4.py
713e7ea09ba06533fa14d6cbdbdb874a12eaadd459aa28f77e149f1dee2b5e70  search_unused_strict_k4.py
```

No Lean file is added in this lane, because no terminal proof was obtained
and the only immediately formalizable adapter is explicitly nonterminal.
