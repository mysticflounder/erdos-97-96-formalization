# Exact-13 representative certificate lane

- Lane: `exact13-representative-certificate-20260906`
- Owner: `luna-swarm-lemma-lantern-97`
- Base head: `fd020fbb3255253b07ffc8229ca6b2c7883ff1d1`
- Scope: one typed checked `Entry`, one typed checked two-form `Entry`, and
  source-key `KeyEntryCovers` witnesses for the representative candidates.

## Delivered

`CardGeThirteenExact13RepresentativeCertificate.lean` defines the source
center/support charts and translates the authenticated wave5 records at bank
indices `0` and `8949`.  The one-form entry uses atoms `L11,L8,T11,T8`; the
two-form entry uses `G12_1,G12_9,G8_1,G8_12,L_12,L_9`, with forms
`(0,1,9,12,1)` and `(1,8,9,12,0)` in mirror orientation.  Both entries prove
their `data.check` field by computation.  The generic
`keyEntryCovers_of_source_candidates` helper packages the explicit candidate
lists, and the one-form and two-form theorems prove the exact
`KeyEntryCovers` equations by reduction and finite-set simplification.

The authenticated parent records are `events/cuts/imported-0000.json` with
SHA-256 `cfc1d33717f0ea66576fd1d67d92d0056e95b58a0c06e93c0066456094856aee`
and parent-model SHA-256
`beedeb88e5181b95eda5136298d56c1a7962bad92ae54998c29753d7ea2c2959`, plus
`events/cuts/imported-8949.json` with SHA-256
`7ae23cea4aa21212de6f1bbb5c90f00b4eb114e92cb51750760e1d36510f1179` and
parent-model SHA-256
`f860285ea82fc4cd41269c43019d1947aa532275ce2c7fe4bdbd2696aa1709aa`.

`CardGeThirteenExact13RepresentativeCertificateTest.lean` imports the module
and checks both data certificates and both coverage theorems.

## Validation

- Direct source probe: `lake env lean` exited 0.
- Governed target build: `lake-build
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13RepresentativeCertificate`
  exited 0 after 12007 jobs.  Final build log:
  `lean/.lake/lake-build-logs/7661-1788739683556720000.log`.
- Focused import test: `lake env lean
  Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13RepresentativeCertificateTest.lean`
  exited 0.
- Coverage membership proofs use explicit list-membership disjunctions and
  compile without module-local linter warnings.
- The module's four `#print axioms` probes report only
  `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` occurs.
- No exhaustive `StrongValidKeyCover`, closure, solver, or certificate claim
  is made.

Source SHA-256 after the authenticated translation:
`9d036ca216d4d5554540a38d1498e61b57c6f4c321a44a017c73c2389bd6dc43`.

The governed build's best-effort proof-blueprint resync encountered an
unrelated absent private declaration, then indexed the changed module and
left the pre-existing `docs/live-blueprint.md` dirty.  That foreign path is
not part of this lane.

No commit or push was performed, per the swarm assignment.
