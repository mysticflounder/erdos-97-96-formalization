# Terminal directed-cross second-apex equality consumer

Status: **conditional regression consumer implemented; not a producer
target**.

The coherent least-terminal-hit split now exposes the exact asymmetric branch
as:

```lean
CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual R
```

That packet already contains:

- distinct source and deleted points, both outside the surplus cap and on the
  same first-apex radius;
- deletion omitted from the source's selected critical row;
- source contained in the deletion's selected critical row;
- both individual deletions preserving K4 at both opposite apices; and
- distinct selected blocker centers, plus the existing row-overlap and
  signed-area consequences.

`TerminalSecondApexEqualityConsumer.lean` proves:

```lean
ReciprocalDirectedCrossResidual.false_of_secondApex_distance_eq
```

Its sole additional conditional input is:

```lean
dist S.oppApex2 R.sourcePair.x = dist S.oppApex2 R.deleted
```

The first apex bisects the source-deletion pair by fixed-radius coherence.
The deletion's actual blocker bisects it by the directed row hit.  The added
equality makes the second apex a third bisector center.  Individual deletion
survival keeps the deletion's blocker distinct from both apices, and the two
apices are distinct triangle vertices.  The existing
`false_of_three_carrier_bisector_centers` wrapper around
`Dumitrescu.perpBisector_apex_bound` therefore yields `False`.

This equality must **not** be mined as a closure producer.
`second-apex-joint-fiber/JointFiberNormalForm.lean` already proves that
distance to the second apex is injective on an off-surplus first-apex fiber.
The residual's two named points are distinct and lie in that fiber, so the
displayed equality is an impossible/overstrong target on this packet.  The
consumer is useful as a checked regression boundary for the three-bisector
route, but the real remaining producer must instead exploit the already
forced strict second-apex separation (or some other consequence of the
terminal asymmetric residual).

## Validation

Focused direct elaboration from `lean/` against the current scratch dependency
oleans succeeded:

```bash
BASE_LEAN_PATH="$(lake env printenv LEAN_PATH)"
lake env env \
  LEAN_PATH="/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans:${BASE_LEAN_PATH}" \
  lean -M 16384 \
  -R ../scratch/atail-force/r-terminal-second-apex-equality-consumer \
  -o /private/tmp/TerminalSecondApexEqualityConsumer.olean \
  ../scratch/atail-force/r-terminal-second-apex-equality-consumer/TerminalSecondApexEqualityConsumer.lean
```

The printed dependency set is exactly:

```text
[propext, Classical.choice, Quot.sound]
```

The scratch directory has no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.

No production file, protected scratch file, or closure document was edited.
