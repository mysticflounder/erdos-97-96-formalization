# Coherent R continuation collapse

## Result

The file proves a source-current logical projection from the
provenance-bearing resolved normal form to three coarse outputs:

1. the protected first-apex unique-card-four/five branch;
2. one generic `CommonDeletionTwoCenterPacket`; or
3. the same unique-card-four dependency after swapping the two non-surplus
   roles.

The projection is theorem-level:

- every anchored transition, whether terminal-hit or minimal-cycle, is sent
  to `RowExternalCommonDeletionSource.toSharedRowCommonDeletionPacket` by the
  checked anchored two-row-cover consumer;
- reciprocal common deletion remains the same generic packet;
- reciprocal criticality is the checked swapped `FA-UNIQ4` dependency; and
- the radius-spent-at-entry arm already has the generic common-deletion shape.

This is an information-forgetting audit, not a closure interface.  The generic
`CommonDeletionTwoCenterPacket` is explicitly nonterminal, and the current
bank/countermodel audit does not justify a uniform eliminator from that packet
alone.  In particular, projecting anchored, reciprocal, and spent branches to
the same packet does not prove that their provenance is dispensable.

## Remaining boundary

No production `sorry` is closed by this projection.

The load-bearing coordinator remains
`ResolvedCurrentFirstApexFixedRadiusNormalForm`, together with its full-parent
connector.  Its anchored, reciprocal, and spent provenance may still be
needed to reach the existing terminal metric, incidence, or cap-placement
consumers.  The protected `FA-UNIQ4`/`FA-UNIQ5` dependency is unchanged.

Accordingly, no uniform generic-packet eliminator is currently justified.
The collapsed theorem is useful for checking what information a proposed
uniform argument would have available, but it must not replace the
provenance-bearing resolved normal form on the closure path.

## Validation

The authoritative project toolchain is the repository-pinned Lean `4.27.0`.
The host-global Lean `4.30.0-rc2` is not the current project toolchain: it
rejects the existing production oleans as incompatible, and the repository
pin and production dependency build have not been migrated.

The exact recursive scratch import closure contains 60 modules including
`CoherentContinuationCollapse.lean`.  All 59 scratch dependencies were
rebuilt from current source in topological order into:

```text
/private/tmp/p97-r-collapse-lean427-current-pb2jam3_
```

Each dependency used this command shape from `lean/`:

```text
env LEAN_PATH=/private/tmp/p97-r-collapse-lean427-current-pb2jam3_ \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-collapse-lean427-current-pb2jam3_/<Module>.olean \
  ../<scratch-source>.lean
```

The first target check exposed one Lean name-resolution error: field notation
looked for the resolved-frontier theorem in the type namespace rather than
`ATailRReciprocalSwapIntegrationScratch.CriticalPairFrontier`.  Opening that
namespace and calling the theorem by its declaration name fixed the proof
without changing any theorem statement.

The final target command was:

```text
env LEAN_PATH=/private/tmp/p97-r-collapse-lean427-current-pb2jam3_ \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-collapse-lean427-current-pb2jam3_/CoherentContinuationCollapse.olean \
  ../scratch/atail-force/r-coherent-continuation-collapse/CoherentContinuationCollapse.lean
```

Exit status: `0`.

All four printed theorems depend only on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` in the printed closure.  The Lean source contains no
`sorry`, `admit`, declared `axiom`, `native_decide`, or `unsafe` declaration.
No full `lake-build`, proof-blueprint refresh, or publication gate was run.
