<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: OpenAI Codex
-->

# Audit note: multi-center-joint-census spec (2026-07-07)

Audited document:
`docs/multi-center-joint-census-spec-2026-07-07.md`.

This note records the original audit questions/concerns and their
subsequent resolutions in the spec text. The blocking spec defects found
in the first pass were corrected in the owner doc: unequal-profile
under-enumeration, unsound GLOBAL pruning by fresh-LOCAL only, the coarse
L1/L2 quotient, and the missing statement of which tier the headline
verdict refers to.

## Original questions

1. Sweep ceiling: the spec still carries
   `{{NEEDS_ADAM_INPUT: extend past 30 if cheap?}}`. The report format is
   clear without that answer, but the eventual verdict threshold depends
   on whether `n = 30` is a hard stop or just the first pass.

2. CONJECTURED tier scope: the spec correctly keeps PROVEN and
   CONJECTURED separate, but it does not yet say whether the final
   results note must include a full parallel L1/L2 sweep for the
   CONJECTURED tier or only the PROVEN headline plus optional appendix
   tables.

3. Growth-fit semantics: if the L2 GLOBAL surface is still growing but
   with irregular increments, “fitted closed forms in `p = n - 9`” needs
   a minimum bar. Right now the spec names the output shape, not the
   acceptance rule for a fit that is weak, piecewise, or obviously
   unstable.

## Original concerns

1. The full-support L1/L2 quotient is the right correctness boundary,
   but it may enlarge the class inventory substantially relative to the
   original shared-set summary. That is a good trade, but it raises the
   risk that the GLOBAL tier becomes the runtime bottleneck before the
   `n = 30` sweep completes.

2. The spec now forbids monotonicity-based carry-forward until an actual
   proof exists. That fixes soundness, but it also means any performance
   plan has to come from engineering choices inside the DFS harness
   rather than from mathematical pruning assumptions.

3. The deliverables still depend on “fresh class for the last K = 4
   consecutive values of n”. That detector is operationally clear, but
   it is only an empirical stopping rule. The results note should state
   explicitly when stabilization is “no new class seen in the swept
   range” versus “proved constant above n*”.

## Resolutions (2026-07-07, folded into the spec)

All six items are resolved by spec decisions in
`docs/multi-center-joint-census-spec-2026-07-07.md`:

- Q1 (sweep ceiling): §4 Sweep — n = 12..30 first pass; auto-extend in
  +5 steps while total DFS nodes per n stay under 10⁸; beyond budget,
  stop and report; further extension is Adam's call. The
  NEEDS_ADAM_INPUT marker is removed.
- Q2 (CONJECTURED tier scope): §3 Cuts — one mandatory appendix table
  (L2 GLOBAL under PROVEN + CONJECTURED, side-by-side with the PROVEN
  headline; purpose: does proving SUB2-H change stabilization);
  CONJECTURED L0/L1 optional, only if that comparison shows a
  difference.
- Q3 (growth-fit bar): §2 Deliverables — a closed form is reportable
  only as an exact integer polynomial (degree ≤ 3) fitted on the first
  half of the swept range and matching the second half exactly;
  otherwise report the raw sequence labeled NO-CLOSED-FORM.
- C1 (GLOBAL bottleneck risk): §4 GLOBAL budget discipline — >10%
  INDETERMINATE cells at any n stops the sweep with verdict
  INCONCLUSIVE-BUDGET; the detector counts DETERMINED cells only, so
  budget pressure degrades to an explicit inconclusive verdict, never
  to a false STABILIZED/GROWING claim.
- C2 (engineering-only speedups): §4 — the allowed speedups are
  enumerated (seeded DFS, precomputed candidate lists, fewest-candidate
  ordering, worker pool), all semantics-preserving; mathematical
  pruning stays banned until §6's lemma is proved.
- C3 (empirical vs proven stabilization): §2 verdict vocabulary —
  headline must use STABILIZED-EMPIRICAL / STABILIZED-PROVEN / GROWING
  / INCONCLUSIVE-BUDGET verbatim; §6 ties the PROVEN label to the
  monotonicity lemma.

## Implementation follow-up (2026-07-09)

The audited requirements are now implemented on the PROVEN tier. The GLOBAL
sweep completed through `n = 32`, exact LOCAL frontier scans remained flat
through `n = 64`, and the L2/full-participant representative-surface
enumerator-completeness bridge is kernel-checked. The original audit's rigor
distinction remains operative: neither the finite scan nor the representative
certificate proves geometric GLOBAL realization or eventual quantitative
stabilization. The spec-mandated CONJECTURED-tier appendix remains open.
