# Global source-selection closure audit

Date: 2026-07-14

Status: **KERNEL-CHECKED EXACT APEX-ALIGNMENT NORMAL FORM; THE CROSS ARM
REMAINS OPEN.**

This scratch lane continues the exact `CrossSurvivalOutput` produced by the
frontier dispatcher.  It uses the live `CounterexampleData`, the ordered
`SurplusCapPacket`, the retained `CriticalPairFrontier` and common
`CriticalShellSystem`, and global `D.K4`.  It does not edit production Lean,
shared closure docs, `SurplusM44`, or the user-owned unique-row lane.

## Strongest result

The aggregate theorem is

```lean
crossSurvival_commonDeletion_or_apexCriticalAlignment
```

For every concrete cross-survival, it returns one oriented
`CrossSurvivalApexPacket` and exactly one of the following endpoints.

1. A `CommonDeletionTwoCenterPacket` from the old continuation center and a
   fresh global-K4 source, for deletion of either the original deleted source
   or the old center.
2. `ApexDoubleCriticalResidual`: the fresh source is exactly
   `S.oppApex2`; deleting either continuation point destroys K4 at that
   apex; and one chosen global row is support-equal to both resulting exact
   critical shells.
3. A `CommonDeletionTwoCenterPacket` from the old center and the deleted
   source's retained critical blocker, for deletion of the old center.
4. `DeletedBlockerApexAlignment`: the retained blocker of the deleted source
   is exactly `S.oppApex2`, and the parent second-apex row is support-equal
   to that source's chosen critical shell.

Thus the earlier broad conclusion

```lean
crossSurvival_commonDeletion_or_surplusLocalization
```

has been sharpened: no arbitrary point of the surplus cap remains.  Every
surplus-cap endpoint is forced to equal the already named second apex.

## Proof mechanism

`GlobalEscapeSource` selects a point of the surviving continuation row that
is outside both `oppCap2` and the deleted source's chosen critical shell.
Global K4 supplies a selected four-row at that point.  The two prescribed
deletion splits are branch-complete:

- survival gives a `CommonDeletionTwoCenterPacket`; or
- deletion failure gives a `CriticalSelectedFourClass` and locks the global
  row to its support.

If both deletion-failure branches occur, the global row contains the old
center and deleted source.  The parent row at `S.oppApex2` already contains
the same pair.  Both points are strictly outside the surplus cap, so
`second_center_separates_outside_pair` excludes every distinct fresh source
in that cap.  A strict-`oppCap1` source is excluded by
`firstCap_center_separates_secondApex_pair`.  Therefore the only critical
residual is source equality with `S.oppApex2`.

The same argument applies to a relocated deleted-source blocker.  If it is a
distinct point of the surplus cap, it cannot bisect the continuation pair,
so the old center is omitted from its critical shell.  The retained
`cross_deletion_survives_iff_not_mem_selected_support` then gives a common
deletion packet.  The only remaining blocker case is exact equality with
`S.oppApex2`; criticality identifies its shell with the parent apex row.

## Exact consumer boundary

The two named alignment residuals are the exact inputs expected by the
existing prescribed-deletion adapters:

- `ApexDoubleCriticalResidual.deletedBlocks` and `.centerBlocks` are direct
  prescribed-deletion failures at the second apex, already in the polarity
  used by `h4_of_prescribed_deletion_criticality` and
  `h5_of_prescribed_deletion_criticality`;
- `DeletedBlockerApexAlignment.blocker_eq_oppApex2` is the actual-map
  alignment used by
  `prescribed_deletion_failure_of_actual_blocker_alignment`; and
- `.apexRow_support_eq_shell` retains the exact row identification rather
  than merely a radius equality.

These are exact existing-consumer inputs, but they are not themselves
contradictions.  A generic `CommonDeletionTwoCenterPacket` is also a
bank-ready normal form, not a terminal.  Consequently this file does **not**
claim that K-A-PAIR or the cross-survival callback is closed.

The remaining mathematical consumer must do one of two things:

1. eliminate the common-deletion packets using additional retained parent
   incidence/metric data; or
2. feed either exact apex-alignment residual into the paired h4/h5 terminal
   with the other required row/anchor incidences.

No further source selection or surplus-cap mining is needed for this arm.

## Bank preflight

Before proving the result, the mandated current and archived theorem-bank
registries and the indexed Lean corpus were searched for common-deletion,
q-deleted U5, critical-support alignment, same-cap two-center, and prescribed
deletion consumers.  The reusable declarations were:

- `CriticalShellSystem.selectedFourClass_support_eq_shell`;
- `cross_deletion_survives_iff_not_mem_selected_support`;
- `nonempty_commonDeletionTwoCenterPacket`;
- `SelectedFourClass.inter_card_le_two`;
- `second_center_separates_outside_pair`;
- `firstCap_center_separates_secondApex_pair`; and
- the prescribed-deletion/alignment adapters in
  `scratch/atail-force/prescribed-deletion-edge` and
  `scratch/atail-force/global-k4-extension`.

No indexed declaration eliminates a generic
`CommonDeletionTwoCenterPacket` without extra incidence data.

## Rigor and validation

- **PROVEN:** global source existence in the in-cap-blocker branch; the exact
  deletion split; both cap-separation arguments; reduction of every surplus
  localization to exact second-apex alignment; and the aggregate four-way
  normal form.
- **OPEN:** elimination of the common-deletion packets and consumption of
  the two named apex-alignment residuals in the full paired h4/h5 terminal.
- **HEURISTIC:** prioritize wiring these exact residuals into that terminal
  over further cardinality/mining rounds.

From `lean/`, the source-current scratch file was checked with:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/global-source-selection \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/GlobalSourceSelection.olean \
  ../scratch/atail-force/global-source-selection/GlobalSourceSelection.lean
```

The command exited successfully.  In particular, the printed declarations

```lean
globalEscape_commonDeletion_or_apexDoubleCritical
relocatedDeletedBlocker_commonDeletion_or_apexAlignment
crossSurvival_commonDeletion_or_apexCriticalAlignment
```

depend only on `propext`, `Classical.choice`, and `Quot.sound`.  There is no
`sorryAx`, declared axiom, `admit`, or `native_decide`.  No full Lake build
was run for this scratch-only file.
