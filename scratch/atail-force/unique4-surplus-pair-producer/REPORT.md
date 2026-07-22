# Exact-four surplus-pair producer audit

Date: 2026-07-22

Status: **REQUESTED PRODUCER IS TERMINAL-EQUIVALENT; NO DIRECT `False` AND NO
NEW PRODUCER FROM `OriginalUniqueFourResidual`.  THE FIXED INCIDENCE GUARD IS
EXACTLY STRICT-KALMANSON IMPOSSIBLE, BUT THIS IS NOT LIVE COVERAGE.**

## Target and verdict

The requested target was

```lean
ExistsSurplusPairCriticalBlocker
  S S.oppApex1 F.pair.q F.pair.w
```

from

```lean
R : OriginalUniqueFourResidual F.
```

This packet is not a useful intermediate.  The retained frontier already
puts `F.pair.q` and `F.pair.w` outside the surplus cap on one first-apex
radius.  A non-apex surplus-cap center equidistant from that same pair is
forbidden by `outsidePair_unique_capCenter`.  Consequently producing the
packet is logically as hard as proving the leaf contradictory.

The audit did **not** derive that packet, its weaker row occurrence, or
`False` from `R`.  It therefore closes no production `sorry`.

## Bank and source preflight

The required theorem-bank registries were checked before deriving anything:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches covered exact-four critical classes, surplus-cap
pair centers, witness-row strong connectivity, minimal-deletion cores, and
shell-curvature aggregation.  The closest results were the existing
`false_of_existsSurplusPairCriticalBlocker`, the late-choice exact fiber, the
global-deletion three-way reduction, and the production shell-curvature
transport/aggregate modules.  None supplies the missing occurrence.

## Kernel-checked source boundary

`UniqueFourSurplusPairBoundary.lean` proves the following without `sorry`.

### Universal pair-free surplus-center theorem

```lean
nonapex_surplusCenter_firstApexOffCap_inter_card_le_one
```

For every non-first-apex center in the surplus cap and every radius, its full
ambient radius class contains at most one off-surplus point from a fixed
first-apex radius class.  This theorem uses the actual convex carrier and
ordered cap, not selected-row incidence.

### Strictly weaker terminal occurrence

```lean
ExistsSurplusFirstApexClassPairCenter
false_of_existsSurplusFirstApexClassPairCenter
```

This occurrence forgets the critical source, deletion blocking, selected
shell, and retained pair.  It merely asks for some non-apex surplus-cap
center/radius containing any two off-surplus members of the first-apex class.
It is immediately contradictory.

```lean
existsSurplusFirstApexClassPairCenter_of_criticalBlocker
```

shows that the old critical-blocker packet implies this weaker occurrence
when its named pair lies in the first-apex class.  This is a consumer-boundary
result only: the weaker occurrence is not derived from `R` and is therefore
not proof progress on the live leaf.

### Full-source negation of the requested packet

```lean
not_existsSurplusPairCriticalBlocker_of_originalUniqueFourResidual
```

proves directly that `R` negates the requested producer.  This pins the
architectural point in Lean: any derivation of that producer from `R` would
already be a derivation of `False`.

All printed declarations close over exactly

```text
propext, Classical.choice, Quot.sound
```

with no `sorryAx`, custom axiom, `native_decide`, or unsafe declaration.

## Why the proposed global mechanisms do not currently produce it

### Witness-row strong connectivity

Minimality's strong-connectivity theorem concerns rows centered at each
source.  The late critical system instead maps a deletion source to its
blocker center.  These are different directed relations.  The fact that all
four exact-class sources can be sent to `S.oppApex1` does not make the exact
class a witness-row-closed subset and cannot be fed to the connectivity
theorem as such.

The theorem

```lean
exactFour_connectivity_lateFiber_scopeGuard
```

reuses the checked twelve-label incidence boundary: all-center four-rows, no
proper selected-row-closed subset, both retained sources assigned to the
first-apex blocker, and the second-apex double-deletion row coexist while
every represented strict cap row has at most one point of the first-apex
marginal.  This is an incidence abstraction, not a Euclidean model.

### Minimal deletion

The checked global-deletion reduction returns a fresh strict-cap collision,
a singleton core, or a packed nontrivial core.  It does not place a critical
center in the surplus cap with two first-apex-class hits.  In the collision
arm the repeated ambient radius has cardinality at least five, so the center
is deletion-robust rather than the requested exact critical blocker.  The
singleton and packed arms still need a cap/order occurrence or an alternative
MEC packet.

### Shell curvature

Production shell curvature gives strict quarter-turn separation inside each
actual critical row and transports all rows to one global periodic lift.  Its
aggregate contradiction still requires four separated intervals.  The late
first-apex fiber repeats one support at one center, and current provenance
does not separate four intervals or force a second center through a pair.

## Full strict-Kalmanson test of the fixed guard

`verify_full_kalmanson_scope.py` independently audits the entire fixed
twelve-row table.  The named cap roles force closed-cap blocks

```text
C0 = 0 -- (1,2,3,4) -- 5
C1 = 5 -- (7,8)     -- 6
C2 = 6 -- (9,10,11) -- 0.
```

The checker enumerates all

```text
2 * 4! * 2! * 3! = 576
```

within-cap cyclic orders, including both orientations.  For every order it
quotients all distance variables by all equal-radius equations from all
twelve represented rows, then checks every cyclic quadruple and both strict
Kalmanson inequalities.  Every order has an inequality whose two sides are
equal in the row quotient.

Exact replay output:

```text
PASS: full unique-four incidence guard is strict-Kalmanson impossible
orders_checked=576 positive=288 negative=288 killed=576
distinct_minimal_row_cores=9
distinct_first_signatures=11
```

Thus **linear convex-order geometry already kills this particular fixed row
table**; nonlinear Euclidean or MEC geometry is not needed to reject it.

This is not coverage of `OriginalUniqueFourResidual`.  The live residual does
not select this global twelve-row table, and the script does not quantify over
all source-valid row choices or carrier cardinalities.  The result therefore
cannot be promoted to `False` for the live leaf.

## Exact remaining target

The source-level work is still one of:

1. derive `ExistsSurplusFirstApexClassPairCenter S radius` from the complete
   `OriginalUniqueFourResidual`; or
2. derive a different existing terminal directly, such as a strict ordinal
   cycle, an alternative `IsM44` packet, or a proper witness-closed carrier.

The first target is strictly weaker than the old critical-blocker packet, but
it remains open.  A new finite search would be relevant only if it quantifies
over every source-valid all-center row choice and proves coverage, rather than
testing another literal row table.

## Replay

From `lean/`, after compiling the existing scratch dependency
`card_four_parent_boundary.lean` to an importable `.olean`, the new module was
checked warning-as-error with the scratch dependency directories in
`LEAN_PATH`.

The exact order audit is replayed from the repository root with:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run --no-project python \
  scratch/atail-force/unique4-surplus-pair-producer/verify_full_kalmanson_scope.py
```

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** the universal pair-free theorem, the weaker
  terminal consumer, implication from the old packet, full-source negation of
  the old packet, and incidence-only scope guard.
- **EXACT FOR THE FIXED FINITE TABLE:** all 576 cyclic orders are
  strict-Kalmanson impossible under all twelve represented row equalities.
- **CONJECTURED / OPEN:** source-valid production of the weaker occurrence or
  any other terminal from `OriginalUniqueFourResidual`.
- **NOT CLAIMED:** a Euclidean countermodel, live coverage, direct `False`, or
  closure of a production `sorry`.
