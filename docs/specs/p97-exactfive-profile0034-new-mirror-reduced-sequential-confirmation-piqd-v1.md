# Profile-0034 new-mirror reduced sequential confirmation (v1)

This lane is a fresh, sequential (`workers=1`) four-cell PIQD producer:

* `z3-target-gt`: the GT7 cell with edge groups 00, 01, 03, 04 and source-row
  equalities 00, 03, 05;
* `z3-target-lt`: the LT8 cell with edge groups 00, 01, 03, 04, 06 and
  source-row equalities 02, 03, 05;
* fresh positive and negative Z3 controls.

The completed singleton parent run is authenticated by its manifest, launch,
terminal, execution commit, custody hash, and all nineteen result digests.
The producer uses the maintained PIQD HTTP SMT adapter only. It emits fresh
system, descriptor, result, launch, terminal, and run-manifest schemas with
create-once publication and no resume. Run-0001 and run-0002 were initialized
by obsolete preflight/audit code and are immutable manifest-only roots,
quarantined recoverably at:

* `scratch/quarantine/exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-20260905-manifest-only-precommit/run-0001`;
* `scratch/quarantine/exactfive-profile0034-new-mirror-reduced-sequential-confirmation-piqd-20260905-manifest-only-precommit/run-0002`.

The active fresh run is `run-0003`; it is not initialized by this handoff.
No assumptions or guarded assertions
are permitted, and cvc5 is outside this lane.

SAT targets are `SAT_REPLAYED` only when exact semantic readback succeeds;
otherwise they remain unresolved. Target UNSAT is finite discovery evidence,
not a theorem or minimality claim. Controls must be `SAT_REPLAYED` and
`UNSAT_CUSTODY_VALID`. Every theorem, source-realization, simultaneous,
minimality, Lean-ingress, closure, and promotion claim is false.
