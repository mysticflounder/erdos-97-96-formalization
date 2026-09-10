# Provenance: finite-nine Form `c` at `v₁`

The target is the existing Prove2Me theorem `Erdos9796FiniteNine.form_c_v1`, ID
`0a9dd51c-149f-46d7-950a-fb2454f0c58f`. Its normalized source statement is bound by SHA-256
`253b1f058415bfaef33ea833eb20b052a12e17f7a4b9956802fea8bbbe599296`.

The primary authenticated source is
`submissions/finite-nine-modular/source-fragments/form_c_v1.lean`, 306,175 bytes, SHA-256
`a653d138d81fcaf23ad2e68015fbc4ccc2978dcf9f5d52f55f61535a2c6d246b`. It contains the six units
`FormCPEqCProducer`, `FormCLowerForcesV2`, `FormCcB1UpperArc`, `FormCcA3QeqC`,
`FormCQeqEb3PinClash`, and `ExcludesFormCv1`. The generator binds their current tracked source
hashes before emitting the packet.

The original local namespace environment comes from the authenticated full submission stream,
SHA-256 `1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58`. The generator retains its
51,853-byte preamble, SHA-256
`73f2fa399452705adc7a6be30960b3571fa8dc479a65caee634646b13b789e6c`, and its first 46 units,
76,512 bytes, SHA-256 `16861ab310e5d8f68b4c5aaf24e0f88e5ad8775b70793de49c4807bf55cc523f`.
The published `FiniteEndpointShell` structure, its eight public definitions, and the unused final
shell constructor are removed. The 21 witness-class, Form, and exclusion declarations duplicated
by the N4e dependency slice are also removed. The published Stage-2
`HasNEquidistantProperty` abbreviation remains the unique local name.

The N4e dependency frontier is the authenticated five-unit slice from `TwoCircleCrossing` through
`N9Endpoint.N4e`, 364,106 bytes, SHA-256
`09de892952067480541bb8aef6d405994934027cfe07eea2956aeb3e98dc2a73`. Twenty additional named
declarations needed by the Form `c` units are extracted from authenticated units 55, 57, 61, 62,
66, and 67. Their concatenated declaration bytes are 26,267 bytes with SHA-256
`00499f09e31b48e8a0010c5e8ca4723b95b422a6b46616ced02c3fb8b46a06e2`. This avoids importing the
unneeded Form-A and Form-B exclusion proofs.

The generated source applies three shell cardinality repairs and 18 distance-elaboration repairs
that match the current Lean 4.33.1 source. Ten distance repairs occur in N4e; the other eight occur
in `FormCLowerForcesV2`, `FormCcB1UpperArc`, and `FormCcA3QeqC`. The remaining three Form `c`
modules match the authenticated migration source at the relevant bodies.

The bounded project-corpus reuse preflight returned the exact exported
`N4dExcludesFormC_v1_proof` theorem. The indexed description characterizes this as the
side-chain-swapped Form `c` branch. That hit identifies the intended source theorem but does not by
itself verify the direct source transfer; the generator's statement/hash checks and a local Lean
elaboration are separate required gates.

The payload imports the published finite-nine definitions and the accepted shell theorem. The
generated-source scan rejects `sorry`, `sorryAx`, native reduction, compiler trust, unsafe/partial
code, external implementations, and named axioms. The 815,939-byte solution built under Lean
4.33.1 in 8,750 jobs with exit code 0; the retained log is
`/Users/adam/prove2me_workspace/.lake/lake-build-logs/31913-1789002926005018000.log`. The audit
built in 8,751 jobs with exit code 0; its log is
`/Users/adam/prove2me_workspace/.lake/lake-build-logs/75344-1789003576314362000.log`.

The audit reports `[propext, sorryAx, Classical.choice, Quot.sound]` for `#print axioms solution`.
The `sorryAx` enters through the locally mirrored accepted theorem nodes, which are statement-only
`by sorry` stubs; it does not occur in the generated solution source. This local audit therefore
does not establish core-clean closure. Because this source is larger than the 694,176-byte Form `b`
payload that timed out twice at Prove2Me's 300-second limit, the monolithic Form `c` proof was not
submitted. The planned route is to split its authenticated support into smaller server-verified
nodes and submit a short final consumer.
