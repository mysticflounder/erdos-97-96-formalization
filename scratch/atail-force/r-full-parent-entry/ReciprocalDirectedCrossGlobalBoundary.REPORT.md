# Reciprocal directed-cross global boundary

## Outcome

`ReciprocalDirectedCrossGlobalBoundary.lean` is final and clean as a scratch
theorem:

- direct Lean compilation succeeds;
- every printed declaration is free of `sorryAx`;
- the only reported axioms are `propext`, `Classical.choice`, and
  `Quot.sound`; and
- no production file, protected closure document, or other agent's file was
  changed.

It does **not** prove `False`.  It proves a strictly stronger, consumer-ready
continuation from the exact `ReciprocalDirectedCrossResidual`.

## Kernel-checked strengthening

For the deleted endpoint's actual critical row, the file proves:

1. its intersection with the fixed first-apex radius class is exactly
   `{deleted, source}`;
2. consequently its off-fixed-radius residual has cardinality exactly `2`;
3. at least one of those two points, say `z`, is outside the predecessor
   source row;
4. `z` is retained in the terminal carrier;
5. after deleting both `deleted` and `z`, the predecessor source row remains
   the exact K4 row at `firstCenter`, and its radius remains the unique
   four-capable radius there;
6. the original directed-cross signed-area product remains negative; and
7. global K4 at `oppApex2` gives the exact split

   ```text
   deletion of z survives at firstCenter and oppApex2
     -> CommonDeletionTwoCenterPacket at z

   or

   deletion of z is critical at oppApex2
     -> a CriticalSelectedFourClass through z at oppApex2
     -> its exact support is the retained secondApexRow.support.
   ```

The main declaration is

```text
ReciprocalDirectedCrossResidual.
  exists_fresh_commonDeletion_or_secondApexCritical
```

The exact/unique source-row transport is separately exposed as

```text
ReciprocalDirectedCrossResidual.
  sourceRow_exact_unique_after_deleted_and_omitted
```

## What is load-bearing

The one-way cross incidence and the two-circle intersection bounds are
load-bearing:

- `source_mem_deletedRow` places both named fixed-radius points in the deleted
  row;
- deletion survival at the first apex separates the deleted-row blocker from
  that apex, so the two circles meet in at most two points;
- the deleted/source row overlap bound is at most two and already contains
  the source, so both off-fixed points cannot remain in the source row; and
- global K4 gives the second-apex survival-or-criticality split.

The signed-area-negative field is retained in the final theorem but does not
choose either branch.  The current bank has no theorem forcing the opposite
sign from the available full-parent fields.

## Bank audit

### U5 residual payload

The closest registry hits are

```text
u5ResidualLocalPayloadCandidate_of_confinedK4AuditPayload
false_of_u5ResidualLocalPayloadCandidate
```

The constructor is only vocabulary reuse.  The closing theorem requires
`D.IsM44`, together with U2 and U5 Mode A data.  The live K-A parent assumes
the opposite cap regime:

```text
hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44)
```

Therefore this is not a no-M44 consumer and cannot close the new critical
arm.

### N8e endpoint residual

`N8e_own_mid_residual_false` requires a `FiniteEndpointShell`,
`N4eCapContainment`, and an `EndpointOwnMidAdjacentResidual` containing two
distinct hits in one adjacent strict cap.  The reciprocal residual supplies
neither that endpoint-shell package nor the required adjacent-cap two-hit
support equality.  It is not directly applicable.

### Prescribed second-apex criticality

The new critical arm has the same basic certificate shape used by the
apex-alignment work:

```text
CriticalSelectedFourClass D.A z S.oppApex2
¬ HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2
critical support = retained apex row
```

No current bank theorem turns that certificate alone into `False` under
no-M44.  The existing apex-alignment consumer explicitly observes that the
resulting support equality and prescribed-deletion radius equality are
already present in the parent apex row; its terminal input is an additional
selected row at the same apex which omits the deleted point.  This lane does
not produce that extra row.

### Common deletion

`CommonDeletionTwoCenterPacket` is also not terminal.  The checked common
deletion expansion produces a successor packet or aligned prescribed
critical sources.  Closing that continuation still needs a provenance-aware
MEC/cap/order coupling theorem.

## Exact remaining boundary

The reciprocal residual is no longer stuck at an unstructured directed
cross.  Its remaining alternatives are now:

- a standard common-deletion continuation at a named retained off-fiber
  point; or
- a named prescribed second-apex critical shell whose support is exactly the
  retained second-apex row.

A local `False` would overclaim.  The next load-bearing theorem must consume
one of these alternatives together with global MEC/cap/no-M44 placement.  In
particular, merely replaying the M44 U5 bank, the generic common-deletion
expansion, or the already-known h5 radius equality cannot close it.

## Validation

From `lean/`:

```bash
env LEAN_PATH=/tmp/p97-r-orbit-entry-oleans lake env lean \
  -R .. -M 8192 \
  -o /tmp/p97-r-orbit-entry-oleans/ReciprocalDirectedCrossGlobalBoundary.olean \
  ../scratch/atail-force/r-full-parent-entry/ReciprocalDirectedCrossGlobalBoundary.lean
```

The command completed successfully.
