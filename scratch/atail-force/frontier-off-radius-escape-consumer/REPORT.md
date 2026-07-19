# Frontier off-radius escape consumer report

Status: **kernel-checked reduction; not a contradiction**.

Scope: the `dist z S.oppApex1 ≠ radius` arm of
`FrontierSecondRowOffConfinementEscape`, while retaining the full
`FrontierCommonDeletionParentResidual F` as an index.

## Preflight

Before introducing the scratch declarations, the required theorem-bank
registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The nthdegree Lean corpus was also searched for off-confinement escape,
off-radius common-deletion, critical-shell, cross-survival, critical-row, and
cap-order consumers.  The closest existing interfaces are
`CommonDeletionTwoCenterPacket`, `exists_third_commonDeletionSource`, the
common-deletion critical expansion, and the global cross-survival selection
surface.  None consumes this off-radius arm directly.

## Checked theorem chain

The file `FrontierOffRadiusEscapeConsumer.lean` proves:

1. `FrontierOffRadiusEscape.point_ne_companion`:
   the escape point is different from both original frontier sources.  The
   deleted-source inequality comes from the production escape packet, and the
   companion inequality follows from the off-radius hypothesis.

2. `commonDeletion_or_offRadiusCriticalRow`:
   global K4 at the first apex gives an exhaustive split:

   - deleting the escape point survives at the first apex; combined with the
     already-checked survival at the original deleted source's actual blocker,
     this constructs a source-faithful `CommonDeletionTwoCenterPacket`; or
   - deleting the escape point is blocked at the first apex and produces a
     `CriticalSelectedFourClass` through the escape point.

   In the critical arm, the exact critical radius is the escape-point distance,
   differs from the frontier radius, and the complete critical support is
   disjoint from the complete frontier radius class.

3. `firstApexSurvival_of_frontierRadiusClassRetained`:
   if the complete frontier radius class has cardinality at least four, the
   escape point is absent from that class and erasing it preserves the class
   unchanged.  Hence first-apex deletion survival follows immediately.

4. `nonempty_frontierOffRadiusCommonDeletion_of_coupledIngress`:
   the cardinality field is already present one level up in
   `FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual`.  Keeping that
   coupled parent, instead of weakening to bare
   `FrontierCommonDeletionParentResidual`, produces the new source-faithful
   two-center row without mining or additional geometry.

All four theorem endpoints have axiom closure exactly:

```text
[propext, Classical.choice, Quot.sound]
```

Focused validation command:

```bash
cd lean
lake env lean -R .. -M 16384 \
  -o /tmp/p97-frontier-off-radius/FrontierOffRadiusEscapeConsumer.olean \
  ../scratch/atail-force/frontier-off-radius-escape-consumer/FrontierOffRadiusEscapeConsumer.lean
```

## Architectural conclusion

This arm confirms that the row producer is easier to prove by weakening the
**consumer target**, not by weakening the available parent context.  The
current direct parent interface discards
`frontierRadius_class_card_ge_four`, even though the coupled ingress already
owns it.  Threading that field eliminates the alternate-radius critical arm.

This does **not** close the parent residual.  The resulting packet has centers

```text
S.oppApex1
H.centerAt F.pair.q F.pair.q_mem_A
```

and source equal to the escape point.  Generic common-deletion expansion is
known to be recursive/nonterminal.  The next terminal theorem must retain and
consume the additional origin data still attached here:

- the escape point lies in the original second-apex q-deleted row;
- it avoids q's actual critical support;
- q's actual blocker survives its deletion;
- it is off the complete first-apex frontier radius;
- the original two frontier sources and both double-deletion witnesses remain;
- minimality, no-`IsM44`, cap order, and MEC data remain available through the
  full parent and `S`.

In particular, the next consumer should not project this result to an
unindexed generic `CommonDeletionTwoCenterPacket`.  It must use at least one of
the retained row-origin, cap-order, or parent-global fields to prevent return
to the already-audited common-deletion cycle.

