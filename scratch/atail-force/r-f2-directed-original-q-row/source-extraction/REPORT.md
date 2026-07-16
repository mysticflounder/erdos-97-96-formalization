# Original-q source extraction report

## Scope

This lane owns only:

- `OriginalQSourceExtraction.lean`;
- this report.

It changes no production Lean, closure document, proof-blueprint state,
protected file, or unique-row lane.

## Theorem-bank preflight

Before writing the packet, I checked the current source declarations and ran
focused indexed Lean searches for:

- critical-system rows sourced at the original live point `q`;
- exact q-deleted/q-critical rows centered at a named F2 point; and
- directed center/support incidence.

The relevant existing producer is

```text
U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
```

together with

```text
U5QCriticalTripleClass.exists_card_three_of_qCritical.
```

The `CriticalShellSystem` and `CriticalSourceRows` constructors serve a
different role: a critical row is indexed by the point whose deletion blocks
its chosen center. They do not choose an arbitrary K4 row centered at a named
F2 point.

## Kernel-checked extraction

### Actual source-q critical row

`originalQCriticalSourceProfile` proves that the concrete critical-system row
sourced at the original live point `q` has:

```text
source       = q
source cap   = surplusCap
center       = p
support      = {q,t1,t2,t3}
q in support
delete q     destroys K4 at p
```

The row is built explicitly with
`U1Depth5.CriticalRowPacket.ofCriticalShellSystem W.H`, so this is the exact
constructor behavior, not an extensional replacement row.

### Named generated center

`originalQGeneratedCenterProfile_of_middle_strict_dangerous` starts with a
named point `z` satisfying:

```text
z in the retained middle row
z in strictSecondCap
z in {t1,t2,t3}.
```

It proves:

```text
z in D.A
z != q
z in the actual source-q critical support
the source-q critical row is not centered at z
```

and the exact source-preserving deletion split centered at `z`:

```text
exists an exact U5QDeletedK4Class D q z
or
exists an exact U5QCriticalTripleClass D q z.
```

The two live-heavy named centers `x,y` both receive this profile through
`AnchoredF2LiveHeavyReduction.originalQGeneratedCenterProfiles`. The unique
strict live center `x` on the mixed boundary receives it through
`NamedF2MixedWitnesses.originalQGeneratedCenterProfileAtX`.

## Route consequence

This is the strongest automatic source extraction currently available.

It provides one directed incidence:

```text
generated center z belongs to the actual source-q critical row.
```

It does **not** provide the reverse-direction incidence needed by the current
U5 consumers:

```text
p, the other named center, or the coherent predecessor source
belongs to the generated row centered at z.
```

In particular, `CriticalSourceRows.ofCriticalShellSystem` cannot be used to
obtain a critical row sourced at `q` and centered at `x` or `y`: the retained
system forces the source-`q` row center to be `p`, while `x,y` lie in its
support and therefore cannot be its center.

The next proof target must therefore consume the exact q-deleted/q-critical
class returned by global K4 at the named center and derive an incidence
*inside that generated class*. Mining another source-q critical-row
constructor would target the wrong object.

## Validation

The focused repository-pinned Lean check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-live-mixed-handler-root-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-original-q-source-extraction-oleans/OriginalQSourceExtraction.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/source-extraction/OriginalQSourceExtraction.lean
```

It exited successfully. Every printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in this lane. No
full `lake-build` was run.
