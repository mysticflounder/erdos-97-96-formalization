# Provenance: finite-nine N4e core support

The public theorem is `Erdos9796FiniteNine.n4e_core`. For every
`Batch3N9.Problem97.FiniteEndpointShell S`, it returns a nonempty
`Batch3N9.Problem97.FiniteEndpointShell.N4eCoreSupport S`. The record exposes 24 exact proof facts
needed by later N4d branches, plus the zero-defect cap layout.

Prove2Me published definition `Erdos9796FiniteNine_N4dPackets` as
`20e77876-f67d-4a4a-bb0e-7613b5d63ace` and theorem `Erdos9796FiniteNine.n4e_core` as
`8092e252-3da6-454a-813c-702397a844f8`. Proof submission
`1a2e8096-87cf-4595-b748-0c0ada857b8a` has status `ACCEPTED`.

The source declarations come from `lean/Erdos9796Proof/P97/N9Endpoint/N4e.lean`. The generator
delegates source authentication and the Lean 4.33.1 repairs to the checked Form-`b` generator. That
parent generator binds the current N4e source at SHA-256
`77566bdfe7e3b1b3e944a43713bcf3c5e0b56f53bc93ec7e69bb453f8671be7a`, the preserved full-stream
snapshot at `1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58`, its 51,853-byte
preamble at `73f2fa399452705adc7a6be30960b3571fa8dc479a65caee634646b13b789e6c`, and its 76,512-byte
units 1–46 prefix at `16861ab310e5d8f68b4c5aaf24e0f88e5ad8775b70793de49c4807bf55cc523f`.

The public definition module moves every type appearing in the support record out of the solution.
It includes the exact N4e packet declarations requested by the later Form-`b` branches and the
private source helper needed to define `ZeroDefectCapLayout.swapI2`. The source-private
`FormBv1B2SelectorV2LowerPacket` is published under that mathematical name. No proof fact relies
on a declaration that exists only inside the submitted solution: all 24 proof facts and the layout
are explicit fields of `N4eCoreSupport`.

The solution retains the authenticated prefix and the N4e proof slice through
`b3n9m051_exists_base_transportData`. It subtracts the declarations moved to the public definition
module, constructs the support record from the original theorems, and contains no `sorry`, named
axiom, native reduction, compiler-trust primitive, unsafe declaration, partial declaration, or
external implementation.

Local theorem mirrors for accepted Prove2Me dependencies remain statement-only files containing
`sorry`. Therefore the local transitive axiom report is expected to include `sorryAx`; server
verification uses the accepted dependency proofs and accepted this submission. This establishes
the theorem as platform-verified. The local `sorryAx` remains an artifact of the offline mirrors;
a local transitive core-only axiom closure was not separately observed.
