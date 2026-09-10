# Provenance: finite-nine Form A at v1

The target is the existing theorem `Erdos9796FiniteNine.form_a_v1`, ID
`34a0a695-2a9d-47f4-b9c6-c3b38c82705d`. Its formal source is
`lean/Erdos9796Proof/P97/N4d/ExcludesFormAv1.lean` at repository revision
`275c906536f3a1484b5c7d869dc91bb8d341df55`.

The proof imports these live Prove2Me dependencies:

- definition `Erdos9796FiniteNine_N4dPackets`, ID
  `20e77876-f67d-4a4a-bb0e-7613b5d63ace`;
- accepted theorem `Erdos9796FiniteNine.n4e_core`, ID
  `8092e252-3da6-454a-813c-702397a844f8`, proof
  `1a2e8096-87cf-4595-b748-0c0ada857b8a`; and
- accepted theorem `Erdos9796FiniteNine.form_b_v2`, ID
  `706aaedc-4e9a-4aad-8ee6-3b57c6a19423`, proof
  `4dc55b21-a512-4a1c-9e81-161649b772be`.

`generate.py` authenticates the preserved full-stream snapshot, the 171,986-byte Form A fragment,
both current source modules, and the exact current target declaration header. It extracts the
repaired 32,828-byte shared prefix, three authenticated geometry declarations from that prefix,
and authenticated units 047–049. It omits unused unit 050 and already-public declarations.

The generator replaces three `I2_card_eq_two`, two `coreSelector_v1`, one
`selectorShape_v2_split`, two `c2_vertex_same_open_side_as_v3`, and one
`zeroDefectCapLayout` reference with fields of the accepted `N4eCoreSupport` record. A local adapter
reconstructs `selectorShape_v3` from the record's public `selectorShape_v3_split` field. The three
known Lean 4.33 center-distance and radius sites and the shared shell cardinality sites are repaired
with asserted occurrence counts.

The resulting artifact is 265,766 bytes with SHA-256
`7ec0d0a7fc86089ed2236b947ca35e6026cf3d28f879961ac880aad51e36fea2`. Its isolated Lean 4.33.1
build completed in 8,752 jobs; the final-consumer audit completed in 8,753 jobs and reported
`[propext, sorryAx, Classical.choice, Quot.sound]`. The local `sorryAx` comes from offline dependency
theorem mirrors/stubs in the workspace.

Prove2Me accepted proof submission `c8238e1b-ad33-43cc-8566-185a03a405e6` for theorem
`34a0a695-2a9d-47f4-b9c6-c3b38c82705d`. The proof submission was created
`2026-09-10T05:30:23.712256+00:00` and accepted `2026-09-10T05:37:09.807499+00:00`. This platform
acceptance is the promotion evidence for the target; the offline dependency mirror/stub axiom
result remains a separate local limitation.
