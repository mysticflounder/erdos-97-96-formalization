# LIVE helper direct-closure audit

Date: 2026-07-17

Status: **no existing LIVE-Q or LIVE-C source helper closes directly from its
current signature.  The new generic modules strengthen the parent bypass, not
the individual helper interfaces.**

## Scope

The audit checked the four `liveData_Q_l{1,2,3,4}_false` declarations and the
seven `liveData_C_center_*_false` declarations in
`U1LargeCapRouteBTail.lean`, starting with the most constrained
`liveData_C_center_t2_named_false` branch.  No declaration header was weakened
and no additional hypothesis was inserted into a proposed helper proof.

The mandatory bank preflight covered:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- indexed Lean searches for critical-row `t2` center alignments, five-point
  circle-isosceles order cores, and auxiliary base collisions; and
- the earlier field-by-field audit
  `scratch/atail-force/live_q_c_consumer_match_audit_2026-07-13.md`.

The closest bank hits remain the five-point circle-isosceles order core, the
five-row circle-intersection core, the U5 auxiliary-base collision family, and
`u1TwoLargeCapObstruction`.  Each is a contradiction consumer, not a producer
of its missing row incidences or cyclic order.

## What the newly landed bridge actually supplies

`Census554.GeneralCarrierBridge.false_of_shellMetricCoreAlternative` proves

```text
FaithfulCarrierPattern F
+ CriticalShellSystem H
+ ConvexIndep A
+ ShellMetricCoreAlternative F H
-> False.
```

Global K4 supplies `F`; the helper's `hcritical` supplies `H`; and
`CounterexampleData` supplies convex independence.  The bridge does **not**
prove `ShellMetricCoreAlternative F H`.  `Boundary.lean` kernel-checks this
exact boundary in `false_of_uniformShellMetricCoverage`: once uniform core
production is added at the parent level, every LIVE helper is bypassed without
using its slot or center split.

Likewise, `FivePointCircleIsoscelesOrderBridge` consumes an already embedded
five-role equality core together with its cyclic order.  It does not find such
an embedding in the live rows.

## Strongest constrained branch

For `center_t2_named`, the checked theorem
`center_t2_named_metric_prefix` derives exactly:

```text
|p-t1| = |p-q|
|p-t2| = |p-q|
|p-t3| = |p-q|
|t2-p| = |t2-q|
|t2-p| = |t2-f5|.
```

This is two selected circles: the dangerous `p` row and the named `t2` row.
It still does not supply either of the following sufficient continuations:

1. an ordered five-role embedding for
   `FivePointCircleIsoscelesOrderCore`; or
2. the additional chain/cross-row equalities required by
   `u5_qcritical_aux_base_collision_metric_incompatibility`.

For the auxiliary-base consumer, the first absent chain edge is already a
row equality such as `dist t1 q = dist p q` (up to relabeling); neither the
dangerous star nor the named `t2` row provides it.  For the five-point ordered
core, the two rows can supply a candidate equality graph, but the helper has
no theorem selecting the required cyclic role order.  The general outer
coverage theorem is precisely what must find an obstruction somewhere in the
whole row system.

## Shared-critical-map provenance loss

The outer wrapper constructs `rows` and `f2CriticalRow` from one concrete
`Hcritical`.  The helper headers then retain only:

- `Nonempty (CriticalShellSystem D.A)`;
- an arbitrary `CriticalSourceRows` value;
- an arbitrary additional `CriticalRowPacket`; and
- conditional comparison maps for the center and selected slot `l1`.

They do **not** retain an equality saying that these packets were constructed
from the `CriticalShellSystem` witness in `hcritical`.  Therefore
`GeneralCarrierBridge.blocker_row_support_eq_shell` cannot identify a helper
row with the corresponding global blocker row.  Even when a comparison-map
premise fires, it transports only one center and one selected label, not the
complete support or the row's position in the global carrier pattern.

Attempting to reconstruct that equality inside a helper would be circular:
it is true at the current caller because of how the caller defined the rows,
but it is not a consequence of the universally quantified helper signature.

## Branch-by-branch first missing antecedent

| Helpers | First missing antecedent after the new imports |
|---|---|
| four LIVE-Q helpers | A non-`p` aligned row or a whole-carrier core embedding; all identified rows remain copies of the `p`-centered circle. |
| `center_q`, `center_t1`, `center_t3` | A named support hit through `p` plus another dangerous label, or an ordered whole-carrier core embedding.  Center equality alone gives neither. |
| `center_t2_named` | One further cross-row chain equality/order placement; its two-circle prefix is checked but realizable in isolation. |
| `center_t2_rowFailure` | A positive row prefix after splitting the failure disjunction; it supplies no uniform equality core. |
| `center_u`, `center_fresh` | Alignment of the off-base center with a row/cap consumer and two named support incidences. |

## Conclusion

No individual helper should be patched now.  The load-bearing next theorem is
the parent whole-carrier producer

```text
UniformShellMetricCoverage D
```

or an equivalent theorem that produces `ShellMetricCoreAlternative F H` for
the faithful carrier/critical system chosen at the parent boundary.  Once
proved, `false_of_uniformShellMetricCoverage` shows the direct route to
`False`; reference mining can then delete the eleven obsolete helper
declarations and their 31 textual holes.

## Validation

`Boundary.lean` was directly elaborated as a scratch file, without a Lake
build.  Both declarations have axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, custom axiom, or `native_decide` in the file.
