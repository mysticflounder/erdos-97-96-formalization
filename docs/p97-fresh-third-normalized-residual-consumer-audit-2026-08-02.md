# FreshThird normalized-residual consumer audit (2026-08-02)

## Checkpoint

The target

`Problem97.ATailFrontierLiveClosure.false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`

remains the live terminal obligation.  Its three constructors are
`firstNonHit`, `secondNonHit`, and `equalCrossRowCenters`.

## Reuse audit

The indexed Lean search and a read-only source audit found no source-clean
consumer that closes any of these three constructors.

* The two non-hit arms normalize only to a source-row omission/deletion
  survival fact (or a same-blocker equality).  Existing relocation and exact-
  row consumers require stronger packets, such as both endpoint deletions
  blocked, that are not present here.
* The equal-center arm can be normalized to an exact four-point row and can
  prove omission of all four named collision endpoints.  No source-clean
  terminal consumes that FreshThird packet.
* Existing cap-localization, first-fiber, and exact-five consumers require
  cap membership/outside-cap data, first-apex equidistance, or the
  `FreshOutsideFirstBlockerFiber`/`OriginalUniqueFourResidual` interfaces.
  `FreshThirdBlockerFiber` deliberately does not retain those fields.

The closest existing adapters either require the missing fields or re-enter
the open normalized-residual theorem, so wiring them would be circular.

## Consequence

The next proof step is a genuine source-faithful bridge or terminal that
preserves enough cap/apex/order provenance for the FreshThird fiber.  A bank
alias, source-clean wrapper, solver `unknown`, or conditional contradiction
does not close this obligation.  The eight project Lean shards committed at
this checkpoint are producers/obstruction kernels only; none changes this
closure classification.
