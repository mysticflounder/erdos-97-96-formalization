# Sharpened one-row producer audit

## Result

The proposed q-shell route is not a routine consequence of the live packet.
Two pinned exact Euclidean regressions already have both eligible centers
`F,I` in

```text
q-blocker shell ∩ strict surplus interior,
```

and each eligible center has an exact four-point radius class.  Nevertheless,
the complete squared-distance profiles at `F` and `I` contain **no** radius
class of cardinality at least four containing `q=E` together with any distinct
first-apex off-surplus marginal point (`C`, `D`, or `J`).  This checks every
possible `SelectedFourClass` at those centers, not merely the selected rows in
the saved witnesses.

The 35-point regression additionally realizes a total
`CriticalShellSystem`, so total criticality alone does not repair the missing
incidence.  Neither model satisfies all-center global K4; therefore neither is
a `CounterexampleData` or K-A counterexample.  The exact conclusion is the
smaller one: the desired two prescribed memberships require genuinely new
geometry beyond q-shell provenance, surplus placement, local K4 at `z`, and
even a total critical-shell map.

## Exact target and factorization

The checked consumer in `robust-live-bank-adapter` needs one packet with:

1. `z ∈ qShell ∩ surplusInterior`;
2. `j` in the off-surplus first-apex marginal and `j ≠ q`;
3. a `z`-centered `SelectedFourClass`; and
4. both `q` and `j` in that row.

Card five supplies a distinct marginal point by counting, and global K4
supplies some row at every carrier center.  Neither fact prescribes a member
of that row.  The logical mismatch is visible directly in the definitions:

- `z ∈ qShell` is an equality of distances **from the blocker center of q**;
- `q ∈ zRow` and `j ∈ zRow` are equalities of distances **from z**.

Thus the first genuinely geometric missing field is a second-order incidence
or prescribed-deletion-criticality statement: for some eligible `z`, two
distinct points from the first-apex marginal must occur in one exact radius
class centered at `z`.  In the present naming, the useful special case is

```text
dist z q = dist z j
```

with a radius class at `z` large enough to select four points.  Total CSS only
ensures own-source membership at actual blocker-image centers; its unanchored
cycle does not supply this prescribed pair.

It is useful to keep the producer split into two open assertions:

- localization: some q-shell support point lies in strict surplus interior;
- incidence: at such a point, one radius class contains `q` and a distinct
  marginal point.

The saved exact models happen to satisfy localization and refute incidence.
They do not prove that localization follows for every live parent.

## Evidence ledger

| evidence | exact content | omitted layer | conclusion |
|---|---|---|---|
| 29-point strict-convex regression | MEC/caps, no `IsM44`, robust local packet, exact K4 at `F,I` | total CSS and all-center global K4 | every eligible-center radius class avoids the prescribed pair |
| 35-point total-CSS regression | all preceding fields plus a total `CriticalShellSystem` | all-center global K4 | total CSS still does not force the pair incidence |
| corrected finite all-center MARCO/CEGAR | one row per encoded center, ambient five-class compatibility, blocker map and current finite cuts | Euclidean/MEC/cap realization; exhaustive completion | the terminal checkpoint has 101 independently verified target-avoiding shadows; the first 100 are bank-matched and the 101st is bank-clean but exact-CAS UNIT |

The corrected all-center search must retain the ambient first-apex five-class
in every compatibility and pair-center check.  The old all-center seed omitted
that exactness layer: its `I` row did contain `E,J`, but the row is incompatible
with the full `O`-centered class and cannot be reused.

The synchronized checkpoint is
`robust-all-center-marco/bank_cegar_checkpoint.json`.  It ends
`SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW`, with 101 verified structural
shadows, 100 bank rejections, 524 sound MARCO row-core cuts, and one terminal
bank-clean shadow.  Every shadow has eligible centers `{F,I}` and reports the
sharpened target false.  The terminal shadow's 43 simultaneous squared-distance
equalities are exact-CAS UNIT in Singular and two msolve variable orders, so it
is not a Euclidean realization.  This is still theorem-discovery evidence, not
an exhaustive map result or a Lean proof.  Its useful message is that raw
global-K4 row existence and encoded cap order do not select the prescribed
pair, while simultaneous metric realization supplies a new contradiction not
yet present in the formalized bank.

## Omitted-parent-field ledger

The corrected 14-role structural run **does encode** the following shadows of
the live parent:

- one selected four-row at every encoded center (the global-K4 existence
  shadow);
- the full exact five-point first-apex class in every represented two-circle
  compatibility and pair-center check;
- the fixed cap profile and cyclic order constraints used by the finite row
  candidate generator;
- distinct-center row intersection at most two and at most two represented
  bisector centers for any carrier pair;
- a non-self blocker choice for every encoded source, with the prescribed
  `E -> D` and `D -> t1` arrows and source membership in its represented row;
- the robust cross omissions, second-apex one-marginal hit, and the six
  off-source support-center rows; and
- every currently formalized producer-bank cut recognized by the matchers.

Consequently, a proof that cites only the existence of some global-K4 row or
only the same fixed row/cap-order consequences has not used enough force.
Relative to the live parent, the finite run still **omits**:

- simultaneous Euclidean coordinate realization of all represented radius
  equalities and inequalities;
- the strict-convex and minimum-enclosing-disk inequalities, including the
  minimum-radius quantification behind the MEC cap decomposition;
- literal `noM44` geometry rather than only the banked consequences already
  recognized on a row pattern;
- ambient radius classes not represented by the one chosen row at a center,
  hence literal deletion-criticality against every possible surviving class;
- extra carrier points, their rows, and cap profiles/cardinalities outside the
  fixed 14-role surface; and
- an exhaustive completion even of the fixed structural surface.

The 35-point exact regression separately restores strict convexity,
MEC/caps, `noM44`, simultaneous Euclidean distances, and literal total
criticality, while still refuting the local incidence at `F,I`; what it omits
is global K4 away from those eligible centers.  Reading both regressions
together leaves a narrow but honest burden: a successful uniform argument
must couple global information away from `z` back into the prescribed
`q,j`-incidence at `z`, or use another full-parent geometric consequence not
present in either local exact model or the fixed structural shadow.

## Bank preflight

Before this audit, the required registries and indexed Lean corpus were
searched for prescribed selected-row membership, blocker-shell transport,
critical-support incidence, and two-center outside-pair producers:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- all three concise and JSON theorem-bank registries under `certificates/`;
- `CriticalShellSystem.source_mem_selectedFourClass`;
- `selectedFourClass_support_eq_shell`;
- `Census554.GeneralCarrierBridge.blocker_row_support_eq_shell`;
- `source_mem_critical_support_of_no_qfree`;
- `exists_blocker_cycle` and `exists_selectedFourClass_of_globalK4`; and
- `CapSelectedRowCounting.outsidePair_unique_capCenter`.

The first three critical-shell facts apply at the actual blocker center of a
source.  No indexed result transports membership from q's blocker shell to a
new row centered at a support point of that shell.  The outside-pair theorem
is the already-checked sink once the two z-row memberships are supplied.

## Replay

```bash
env UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/one-row-producer-audit/check.py --check
```

The checker pins both source verifiers by SHA-256, reruns their exact symbolic
strict-convex/MEC/cap/no-`IsM44` gates, and enumerates the full exact radius
profiles at `F,I`.  Its trust boundary is `EXACT_SYMBOLIC_SYMPY_NOT_LEAN_KERNEL`.
