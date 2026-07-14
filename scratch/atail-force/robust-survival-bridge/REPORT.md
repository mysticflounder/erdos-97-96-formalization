# ATAIL robust-survival bridge audit

Date: 2026-07-14

Status: **PROVEN SHARP LOCAL NORMAL FORM; NO CUMULATIVE RECURRENCE OR
EXISTING CONSUMER.**

The exploratory packet and falsifier remain scratch-only. The reusable exact
normal forms have since been promoted to
`P97/ATail/CriticalPairFrontier.lean`; neither the K-A-PAIR body nor shared
closure documents were edited.

Promoted declarations:

- `cumulative_deletion_blocked_at_source_blocker`;
- `cross_deletion_survives_iff_not_mem_selected_support`;
- `SurvivorPairRelocationPacket.blocker_dist_ne_of_cross_deletion_survives`;
  and
- `cross_survival_unique_radius_and_exact_support`.

## Result

Let `P` be the production `SurvivorPairRelocationPacket`, and consider the
surviving rank-1 arm

```text
K4(D.A.erase P.w, H.centerAt P.q).
```

The strongest checked consequence is substantially sharper than the old bare
survival arm.

### Exact survival criterion

`cross_deletion_survives_iff_not_mem_selected_support` proves, for any
`CriticalShellSystem`,

```text
K4(A.erase w, H.centerAt q)
  iff
w notin H.selectedAt(q).support.
```

The forward direction is where the full exact-filter field is essential. Any
surviving four-class must contain `q`; otherwise it also survives cumulative
deletion and hence deletion of `q`, contradicting `H.no_qfree_at q`. Therefore
its radius is the chosen shell radius. Since that full ambient radius class is
exactly the chosen four-shell, it cannot retain four points after erasing a
member `w`.

Consequently the live survival arm proves

```text
dist (H.centerAt P.q) P.w != dist (H.centerAt P.q) P.q.
```

This is the opposite of the cross equality required by the rank-1,
same-cap-two-center, card-five cap-local, and coincident-blocker consumers.

### Unique surviving row

`cross_survival_unique_radius_and_exact_support` strengthens the result:

```text
SelectedClass (A.erase w) (H.centerAt q) chosenRadius
  = H.selectedAt(q).support,
```

and every positive radius carrying at least four points in `A.erase w` equals
`chosenRadius`. Thus the survival witness is not a new alternate row. It is
exactly the old critical shell, which survives because `w` avoids it.

### Maximal smaller-carrier packet

In the exact card-five first-apex branch,
`card_five_cross_survival_packet` packages everything that remains true on
`D.A.erase P.w`:

- an exact four-class at `S.oppApex1`;
- K4 at `S.oppApex2` from `P.w_survives`;
- the unique exact chosen shell at `H.centerAt P.q`;
- distinct blocker radii for `P.q` and `P.w`;
- failure of K4 at `P.w`'s own blocker;
- failure after additionally erasing `P.q` at `P.q`'s blocker; and
- failure of the global K4 property on the smaller carrier.

The last item is not a missing convenience lemma. It is forced by
`H.no_qfree_at P.w`. Hence `D.A.erase P.w` cannot be repackaged as a smaller
`CounterexampleData`, and the recurrence proposed in the robust arm is
incompatible with the current critical-shell invariant.

`card_five_robust_survival_or_cross_oppositeSide` plugs this packet directly
into the production
`card_five_cross_deletion_survives_or_cross_oppositeSide` theorem. The result
is the sharp live split: either the maximal local packet above, or the existing
cross-incidence/opposite-side arm. No detached rederivation of the production
normal form is used.

## Cumulative-deletion audit

There are two separate issues.

1. At `H.centerAt P.q`, cumulative deletion is **PROVEN impossible**:
   `cumulative_deletion_blocked_at_source_blocker` shows

   ```text
   not K4((D.A.erase P.w).erase P.q, H.centerAt P.q).
   ```

   Any such class would be monotone into `D.A.erase P.q`, contradicting the
   defining blocker fact.

2. At a general center, two separate single-deletion K4 facts do not imply a
   cumulative one. `separate_deletion_countermodel.py` gives an exact rational
   Euclidean falsifier: four points lie at squared radius `1` and four at
   squared radius `4`. Delete one point from different circles. Each single
   deletion leaves the other four-circle intact, while deleting both leaves
   profiles `(3,3)` and no K4. This falsifies only the pure transport; it is
   not claimed as a model of the full ATAIL antecedent.

The production second-apex theorem already reflects this exact obstruction:
`P.q_survives` and `P.w_survives` yield either cumulative survival or two
disjoint exact four-shells. Nothing in separate survival alone chooses the
first arm.

## Existing-consumer audit

No existing consumed alternate matches the surviving packet.

- `CardFiveCapOrMutualFields` needs a cap-local cross incidence or reciprocal
  cross incidences. Survival proves that the directed `q -> w` incidence is
  absent.
- `false_of_sameCap_outsidePair_twoCenters` needs the pair equidistant from
  the second center. Survival proves those two distances are unequal at
  `H.centerAt P.q`.
- The coincident-blocker residual consumer needs a selected class containing
  the common pair. The exact surviving blocker class omits `P.w`.
- Moser-cap radius-uniqueness theorems apply at a Moser apex opposite a
  card-four cap, not at the arbitrary source blocker `H.centerAt P.q`.
- Convexity, MEC, cap order, and the apex full filters constrain the apex rows,
  but the searched banks contain no theorem transporting that information to
  this arbitrary blocker radius or placing the blocker in a consumed cap.

The first genuinely missing transport is therefore a new geometric statement
that couples the arbitrary blocker to MEC/cap order despite the proved radius
inequality. It must produce a different pair/row, localize a blocker center to
a consumed cap, or contradict the three-center local packet directly. It
cannot be a cumulative-erasure recurrence using the same source pair.

## Theorem-bank preflight

Before deriving the scratch normal forms, the required registries were
searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora via `nthdegree docs search --lean` for cumulative
  deletion, separate single-deletion survival, critical-shell source
  membership, and cap/blocker cross incidence.

The closest reusable declarations were the production
`double_erase_survives_or_two_disjoint_exact_shells`,
`source_mem_critical_support_of_no_qfree`,
`selectedFourClass_support_eq_shell`, and the selected-class erase lemmas.
None supplied cumulative survival or a matching consumed alternate.

## Validation and rigor

The Lean file elaborates successfully from the Lake root. Every printed
theorem uses exactly `propext`, `Classical.choice`, and `Quot.sound`; there is
no `sorryAx`.

The exact rational falsifier passes:

```text
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/robust-survival-bridge/separate_deletion_countermodel.py \
  --check
```

- **PROVEN:** the survival equivalence, unique-radius/exact-support normal
  form, distinct blocker radius, cumulative blocker failure, exact first-apex
  four-class, and failure of smaller-carrier global K4.
- **EXACTLY VERIFIED:** the rational eight-point falsifier for the pure
  separate-to-cumulative deletion implication.
- **NOT FOUND / OPEN:** a current bank theorem coupling the arbitrary blocker
  to MEC/cap order strongly enough to fire an existing consumer.
- **NOT CLAIMED:** a falsifier to the full K-A-PAIR antecedent.
