# Original unique exact-four arm: direct-False audit

Date: 2026-07-22

Status: **NO DIRECT `False` FOUND. TWO SEPARATE BOUNDARY MODELS REFUTE TWO
SEPARATE WEAKENINGS OF THE LEAF. NEITHER MODEL SATISFIES THE CONJUNCTION OF
EUCLIDEAN/MEC GEOMETRY WITH ALL-CENTER K4, MINIMALITY, AND THE FIXED CRITICAL
SYSTEM. THE LIVE JOINT LEAF REMAINS OPEN.**

## Audited target

The target was the exact-four leaf

```lean
false_of_originalUniqueFourResidual
    (R : OriginalUniqueFourResidual F) : False
```

from
`scratch/atail-force/unique-arm-route-audit/OriginalUniqueResidualDispatch.lean`.
The residual retains the full parent fields: global K4 and convexity through
`D`, global cardinal minimality, global no-`IsM44`, `9 < D.A.card`, the exact
unique first-apex four-class, deletion blocking for every member of that
class, the original frontier's second-apex double deletion, and a strict-cap
interior pair with complete carrier-bisector localization.

## Required theorem-bank preflight

Before testing a new route, this audit checked all registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches covered exact unique four-classes, endpoint shells,
minimality/selected-row connectivity, alternative support triangles,
outside-pair cap centers, and opposite-apex double deletion. No banked theorem
closes this residual. The closest consumers require either a non-first-apex
common-pair center in the surplus cap or a protected unique-four contradiction
as an input; neither is produced by the live fields.

## Source audit

### Selector-dependent blocker routes are invalid

The exact four-class is deletion-critical at the first apex for every one of
its members. Existing checked scratch uses `CriticalShellSystem.overrideAt`
to choose the first apex as the blocker of both retained sources. Therefore a
claim that their arbitrary selected blockers differ from the first apex is
false on the conditional live surface.

The strict-interior pair sharpens the negative result. Its checked bisector
localization says that every carrier center other than the first apex which is
equidistant from that pair lies in the same strict opposite-cap interior.
Consequently the older proposed `ExistsSurplusPairCriticalBlocker` is not an
intermediate producer for this pair: such a non-apex center cannot lie in the
surplus cap. Producing that packet would again amount to proving the branch
contradictory.

### Opposite-apex double deletion does not imply robustness

`F.secondApexDouble` supplies one K4 class after deleting both retained
sources. It does not imply `FullyDeletionRobustAt D S.oppApex2`: the surviving
class may be a unique exact four-class avoiding both sources. Thus the checked
robust-second-apex versus swapped-unique-four terminal cannot be invoked.

### Global K4 gives continuation rows, not a collision

At either strict-cap member of the exact first-apex class, global K4 supplies
a selected four-row. Two distinct circles meet in at most two carrier points,
and cap monotonicity allows at most two support points in that cap. Hence each
such row has at least two points outside the first-apex class and at least two
outside the cap. Ordered-cap outside-pair uniqueness makes the pairs chosen at
distinct cap centers different; it does not force a repetition. This is the
same non-closing pair-capacity boundary already recorded by the generic
pair-count audits.

## Exact local Euclidean boundary

`verify_exact_local_boundary.py` replays the existing endpoint checker and
adds the exact double-deletion and all-support-triangle checks. It realizes an
exact 12-point real-algebraic packet with:

- strict convexity and a nonobtuse circumscribed MEC triangle;
- cap profile `(6,4,5)`;
- a unique exact first-apex four-class `{A,C,E,J}`;
- retained pair `(E,C)` outside the surplus cap;
- deletion of either retained source blocking the first apex; and
- deletion of both retained sources preserving the second-apex class
  `{O,G,H,K}`.

The first opposite cap has strict interior pair `(J,E)`, so the full local
exact-four geometric role split is present. The MEC boundary is exactly the
three support vertices, and neither possible choice of a cap of size greater
than four in profile `(6,4,5)` leaves two four-point opposite caps. Thus the
no-`IsM44` profile is also compatible with the local geometry.

This is not a `CounterexampleData`: every non-apex center fails K4. It proves
that MEC/cap order, exact-four uniqueness, no-`M44` cap cardinalities, and the
opposite-apex double deletion do not close the leaf without all-center K4.

## Kernel-checked all-center incidence boundary

`UniqueFourIncidenceBoundary.lean` complements the exact metric model. It
combines the existing card-four pair-count table with:

- one abstract four-row at every one of twelve centers;
- the exact first-apex four-row and three-point off-surplus marginal;
- the retained pair and a second-apex row avoiding both sources;
- distinct abstract second-apex radius labels for the retained pair;
- a fixed-point-free blocker map whose source belongs to the selected row at
  its blocker and whose fibers have cardinality at most four;
- both retained sources assigned to the legitimate first-apex blocker;
- the no-proper-row-closed-set consequence of global minimality;
- pairwise row-intersection bounds and the complete ordered-cap pair ledger;
- abstract cap profile `(6,4,5)` with no `M44` orientation; and
- no row other than the first-apex row containing both retained sources.

The declaration

```lean
uniqueFour_incidence_boundary_checked
```

is proved by kernel `decide`. It has no `sorry`, custom axiom, or native-code
trust boundary. This is an exact finite-incidence model, not a Euclidean
realization and not a counterexample to the theorem.

The two boundaries are deliberately separate:

```text
exact Euclidean/MEC/cap frontier + no-M44 profile
  (fails all-center K4)

all-center rows + minimality connectivity + critical-map incidence
  (not jointly Euclidean)
```

The exact Euclidean model refutes only the weakening obtained by dropping
global K4, minimality, and the fixed critical system. The finite incidence
model refutes only incidence-level consequences which omit Euclidean/MEC
realizability. Neither is a model of `OriginalUniqueFourResidual`, and their
separate satisfiability does not imply that their conjunction is satisfiable.
In particular, this audit does **not** establish a countermodel to the live
direct-`False` theorem. It isolates the still-open joint coupling as the first
place where additional proof force can occur.

## Parent-interface audit

The production/scratch leaf does not lose the global critical map or global
selected-row supply:

- `OriginalUniqueFourResidual F` is parameterized by the complete
  `CriticalPairFrontier D S radius H`, so the fixed `CriticalShellSystem H`
  and its retained-source data remain available through `F`;
- global all-center K4 is `D.K4`;
- global cardinal minimality is `R.minimal`;
- the no-`M44` terminal hypothesis is `R.noM44`;
- positivity of `radius` is derivable from `F.pair.q_mem_marginal` and the
  fact that the first apex belongs to the surplus cap, after which the exact
  first-apex row is canonically available as
  `SelectedFourClass.ofSelectedClass hradius R.class_card_eq_four`; and
- a four-point second-apex row avoiding both retained sources can be selected
  from `F.secondApexDouble` and lifted from the double-erased carrier.

If a continuation argument needs both apex rows inside one global selected
pattern, `exists_faithfulCarrierPattern_with_two_classes` can preserve two
prescribed rows while filling every other carrier row from `D.K4`. Therefore
an explicit `FaithfulCarrierPattern`, a duplicate copy of `H`, or a new
conditional row packet is not a genuinely missing parent field. Such a packet
should be chosen locally and late inside the direct closer.

The minimal source-faithful theorem target remains

```lean
false_of_originalUniqueFourResidual
    (R : OriginalUniqueFourResidual F) : False
```

with any faithful selected pattern existentially constructed in its proof.
The genuinely missing result is a geometric coupling from the existing joint
inputs to a terminal antecedent, not an interface adapter.

## Honest next theorem

The smallest useful next step is not another endpoint or row-count lemma. It
must be a Euclidean continuation theorem which consumes a selected K4 row at
one of the two strict first-opposite-cap class members and returns an existing
terminal antecedent. Concretely it must force one of:

1. a repeated outside pair at two distinct centers on one ordered cap;
2. a non-first-apex common-pair center in the cap required by an existing
   outside-pair terminal;
3. an alternative nonobtuse MEC packet of type `IsM44`; or
4. a proper witness-closed subcarrier, contradicting minimality.

Any proposed theorem using only row cardinalities, pairwise support
intersections, strong connectivity, blocker-fiber bounds, or cap-profile
counts is refuted by the checked finite boundary.

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** one finite incidence structure combining the
  listed abstract row, blocker, connectivity, and cap-count conditions.
- **EXACT REAL-ALGEBRAIC LOCAL VERIFICATION:** the 12-point geometric packet,
  including the opposite-apex double deletion.
- **SOURCE-GROUNDED NEGATIVE AUDIT:** no current banked terminal consumes the
  unconditional two-outside-row occurrence, and the selector-dependent and
  surplus-common-blocker targets are invalid.
- **CONJECTURED / OPEN:** the joint Euclidean + all-center K4 + minimality +
  fixed-critical-system leaf, and a continuation from it producing one of the
  four terminal outcomes above.
- **NOT CLAIMED:** a model of `CounterexampleData`, a refutation of the public
  theorem, satisfiability of `OriginalUniqueFourResidual`, or closure of any
  production `sorry`.

## Validation

Exact local replay from the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/unique4-direct-false/verify_exact_local_boundary.py
```

Lean replay from `lean/`, with the two scratch directories added to
`LEAN_PATH`:

```bash
BASE=$(lake env printenv LEAN_PATH)
lake env env \
  LEAN_PATH="../scratch/atail-force/unique4-direct-false:\
../scratch/atail-force/second-cap-incidence-coupling:\
../scratch/atail-force/generic-marginal-pair-count:$BASE" \
  lean -M 8192 -s 16384 -DwarningAsError=true \
  ../scratch/atail-force/unique4-direct-false/UniqueFourIncidenceBoundary.lean
```
