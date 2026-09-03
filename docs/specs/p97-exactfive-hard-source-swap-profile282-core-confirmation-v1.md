# Profile-282 selected-core confirmation v1

## Scope

This governed PIQD campaign checks three selected formula sets from the
completed profile-282 named-assumption source reconstruction. Its findings are
strictly about those selected unguarded formulas. It makes no theorem,
source-completeness, source-realization, all-order, Lean-ingress, promotion, or
closure claim.

The lane is
`exactfive-hard-source-swap-profile282-core-confirmation-20260903`, and its
only run is `run-0002`. The maintained PIQD SMT adapter is the only solver
transport. Every cell uses a fresh session, one solve, a 60,000 ms requested
timeout, and sequential execution (`workers = 1`). Default output is silent;
`--verbose` prints canonical JSON and errors go to stderr.

## Predecessor custody

Before any new solve, the producer authenticates the predecessor manifest,
launch, two Z3 controls, two cvc5 controls, and the published Z3 mirror target.
It then reads closed PIQD session
`040a1d20-c6c7-464a-96eb-ad09670e560c` through the maintained PIQD read API.
The stored import binds its exported journal and sole receipt to the rebuilt
302-assumption cvc5 direct query. The receipt must be `UNKNOWN`, interrupted by
the daemon deadline, with the pinned request, result, journal, solver, labels,
and assumption identities. This direct-order UNKNOWN does not adjudicate a
mirror-order core.

The prior SAT and UNSAT controls are reused through full artifact-tree
authentication; no fresh controls are run.

## Six confirmation cells

Every journal retains all 302 declarations and guarded implications. Its
`named_atoms` are ID-sorted. Only the selected IDs and corresponding self-hashed
labels are submitted, in the displayed semantic-family order.

1. Mirror five, on Z3 and cvc5:
   `normalization-000`, `row-009`, `area-059`, `area-144`, `area-244`.
2. Mirror four, on Z3 and cvc5:
   `normalization-000`, `row-009`, `area-059`, `area-244`.
   The omitted `area-144` body is already forced by the selected positive `r`
   and positive `y_c009` bodies.
3. Direct four, on Z3 and cvc5:
   `normalization-000`, `row-009`, `area-023`, `area-184`.
   The three non-normalization bodies are respectively
   `-2 + 2*r*y_c009 + 3*x_c009 - x_c009^2 - y_c009^2 = 0`,
   `-y_c009 > 0`, and
   `r - r*x_c009 + y_c009/2 > 0`.

An UNSAT cell requires a nonempty, nonterminal returned assumption core whose
terms, IDs, labels, source-system hash, and source-ledger hash all match the
selected query. A SAT cell is accepted only when exact rational readback makes
every selected unguarded ledger atom true; it is never replayed as or reported
as a full 302-formula profile witness.

## Immutable outcomes

Each cell is a create-once directory. `UNKNOWN`, reconciled transport loss, and
semantic replay rejection are published as inconclusive outcomes. Adapter,
custody, or validation failures are published as `FAILED_CUSTODY`, including a
self-hashed record and digests for every immutable partial artifact. They are
not rolled back or retried in place. Resume authenticates and reuses every
published cell without transport. The terminal record accounts for all six
cells and separately reports cross-engine agreement for the mirror five,
mirror four, and direct four sets.

Run-root creation checks lexical containment, the repository root, and every
existing ancestor both before and after directory creation. Symlinks and
existing non-directories are rejected without following them. The run root and
its `artifacts`, `events`, and `tmp` children must each be real directories;
this is rechecked for both existing and newly created trees before the manifest
is read or written.
