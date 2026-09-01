<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Scratch computational-output pattern audit (2026-08-16)

> **Status refresh (2026-08-28): HISTORICAL OUTPUT-SHAPE SNAPSHOT.** The
> census below remains evidence for revision `6abb9933`, but the derived
> operator set—especially recommendations P1 and P3–P5—was later withdrawn.
> See the canonical closure plan's “2026-08-16 operator set — WITHDRAWN”
> section before reusing any recommendation as a current route.

Date: 2026-08-16

## Scope

This audit surveys the computational output corpus under `scratch/` — the
CEGAR/wave-miner family banks, the SAT/PIQD survivor certificates, and the
post-CEGAR audit artifacts — and records the structural patterns that recur in
the output but are **not yet mined into a source theorem**.  The corpus is large
and heterogeneous: 330 top-level lane directories, ~222 k `.lean`, ~72 k `.cnf`,
~53 k `.drat`, ~7 k `.lrat`, 159 `*_bank.json` family banks, and ~340
`suvvivor.json`/`summary.json` pairs.

This is an output-shape census, not a proof.  Every pattern below is evidence
about the *combinatorial/miner model*.  It is not an Euclidean realization and
not a Lean closure.  Verdicts use the repository's standing convention: a
finite SAT/SURVIVOR verdict is diagnostic only.

The recurring question behind this audit is the one the coordination notes keep
raising (`scratch/coordination/firstnonhit-twelvefold-20260813.md`,
`scratch/coordination/twelvefold-firstnonhit-bridge-20260813.md`,
`scratch/post-cegar-bank3/shared-result.md`): the miner emits the *family* but
never the *producer* that lifts a family to a terminal.  The patterns below are
that gap, made concrete from the output itself.

## Method

Counts are computed by streaming the corpus with `jq`/Python so that the
multi-megabyte family banks never enter context.  Keyed on:

- `summary.json` `status` / `discovery_verdict` / `terminal_promotion_status`;
- `survivor.json` `classification` and `structural_certificate.{core,closure_paths,side_conditions,stage}`;
- `*_bank.json` `claims.*` verdict vector and `semantic_status`.

## Findings

### P1. The output mass is SAT/UNRESOLVED; the terminal channel is a thin stall

Across all `summary.json` records (1641 object files + 2 list-shaped files =
1698 records; `terminal_promotion_status` field-level, `None`-safe) the leading
states are:

```text
501  ITERATION_LIMIT               | SAT
471  (blank)                       | (legacy / no status fields)
351  SAT_WITNESS_REPLAYED          | SAT
 97  ITERATION_LIMIT
 74  STRUCTURALLY_UNRESOLVED       | SAT
 57  CERTIFIED-UNSAT-CANDIDATE-TRANSCRIPTION            <- new: candidate UNSAT not yet transcribed
 32  UNSAT_DRAT_VERIFIED           | UNSAT             <- only these are promoted terminals
 22  BOOTSTRAP_AUDITED
 19  STRUCTURALLY_UNRESOLVED       | SAT | UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE
  9  UNKNOWN                       | UNKNOWN | UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE
  8  UNADMITTED_STRUCTURAL_SURVIVOR | SAT              | UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE
  7  ITERATION_LIMIT               | SAT | UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE
  6  STRUCTURALLY_UNRESOLVED       | SAT | AWAITING_LEAN_STATIC_AUXILIARY_VALUATION
  4  UNADMITTED_STRUCTURAL_SURVIVOR | SAT | AWAITING_LEAN_STATIC_AUXILIARY_VALUATION
  2  SAT_WITNESS_REPLAYED          | SAT | UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE
```

`survivor.json` `classification` over the whole corpus: `STRUCTURALLY_UNRESOLVED`
(21), `UNADMITTED_STRUCTURAL_SURVIVOR` (13), `NONE` (45, legacy/pre-marker).

The pattern is: **the solver almost always returns SAT or an iteration limit,
and the runs that do reach a terminal do not promote.**  The terminal channel is a
three-stage funnel:

```text
57  CERTIFIED-UNSAT-CANDIDATE-TRANSCRIPTION      <- candidate UNSAT, awaiting transcription
45  terminal_promotion = ..._AWAITING_LEAN_TERMINAL_CERTIFICATE
10  terminal_promotion = AWAITING_LEAN_STATIC_AUXILIARY_VALUATION
32  UNSAT_DRAT_VERIFIED (already promoted)
```

So 55 runs (`UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE` × 45,
`AWAITING_LEAN_STATIC_AUXILIARY_VALUATION` × 10) hold a DRAT-verified or
structurally-resolved result but have no Lean terminal certificate or static
valuation, and a further 57 are UNSAT candidates still in transcription.  Only
32 cross the terminal line.  `AWAITING_LEAN_STATIC_AUXILIARY_VALUATION` holds a
value the output already contains but has not yet lifted into Lean.

The `UNSAT_DRAT_VERIFIED` core holds the proofs but the compact ingress is
pure-RUP; promotion needs a fresh `cadical --plain` rerun on the identical CNF
(`docs/exact12-next-row-arm-terminal-promotion-2026-08-13.md`, which closed the
four cells 52/58/65/71 through exactly this rerun).  The missing pattern is a
*terminal-promotion sweeper* over the already-terminal-and-awaiting population
(55 + 57) rather than per-cell manual promotion.

### P2. Family-bank claim vector is uniformly false — the family is mined, the producer is not

Every `*_bank.json` carries a `claims` verdict vector:

- `terminal_unsat`
- `universal_lift`
- `live_theorem_closure`
- `lean_terminal_ingress_ready`
- `aggregate_placement_coverage`

Across the 159 family banks (73 with the full vector) the dominant outcome is the
all-false row:

```text
61  terminal_unsat=False universal_lift=False live_theorem_closure=False lean_terminal_ingress_ready=False aggregate_placement_coverage=False
```

The `semantic_status` of the mined banks is uniformly of the form
`FINITE_SOURCE_PROVED_*_MEMBERSHIP_FAMILY` (e.g.
`FINITE_SOURCE_PROVED_LABEL_GENERAL_ALL_ORDER_COMMON_FIVE_MEMBERSHIP_FAMILY`,
`FINITE_SOURCE_PROVED_THREE_TRIAD_POSITIVE_MEMBERSHIP_CUT`, and ~20
`*_MEMBERSHIP_FAMILY` variants).  The single claim that ever reads `True` is
`lean_cut_source_pinned`, and only in the `source_order_bank.json` of the
`arm-static-cell6-v2{2,3,4}` lanes — i.e. "the source-pinned cut is present", a
membership fact, not a producer.

The pattern is: **the output schema explicitly asks for five closure verdicts and
answers all five "no" on every bank.**  The miner emits the membership family
and a `reused_requirement_count` (583 in the v24 all-order bank) but the
`universal_lift` / `terminal_unsat` producers are the missing objects.  This is
the same gap stated in prose at
`scratch/post-cegar-bank3/shared-result.md`: no source-clean theorem converts the
exact-17 `(8,6,6)` result, the B3/B4 exclusions, or the "at least five blocker
centers" fact into `False`.

### P3. The "smallest missing source theorem" recurs, always a global pair-cover / incidence producer

The named gap repeats verbatim across the coordination and audit surface:

- `scratch/post-cegar-bank3/shared-result.md`: the smallest missing theorem is a
  *global pair-cover/incidence producer* — from the six-center source-provenance
  boundary plus the exact `(8,6,6)` cap/cardinality and K4/minimality/order data,
  force one of `P-pair ⊆ B3`, `P-pair ⊆ B4`, `Pρ-pair ⊆ B3`, `Pρ-pair ⊆ B4`
  (contradicting the ≤1 cut), or a source-faithful blocker-image/lift theorem that
  turns the 17-source fiber bound into a consumable terminal.
- `scratch/post-cegar-bank3/shared-result.md`: `actualBlockerFiber_card_le_four`
  gives only a per-anchor fiber upper bound; it does not package the global
  image/pigeonhole lower bound *"17 carrier vertices to at least five distinct
  blocker centers"*, nor couple those centers to B3/B4 rows.
- `scratch/coordination/firstnonhit-twelvefold-20260813.md` lists the three
  candidate producers that would unblock the `FreshThirdPinnedCenterBlocker`
  terminal: (1) Q-row/fan-row overlap ≥ 3, (2) three Q-support deletions blocked
  at the fan row's distinct actual center, (3) a different complete premise for an
  existing source-clean terminal.
- `docs/computational-closure-plan-2026-07-28.md` carries the same
  *"overlap at least three"* / *"at least five blocker centers"* language.

The pattern is: the local incidence (per-anchor, per-row, per-center) is mined in
full, but the **global image/pigeonhole coupling** (17 carriers → ≥5 centers;
Q-overlap ≥3 coupled to B3/B4) is the absent producer.  This single pattern
accounts for the all-false `claims` vectors of P2.

### P4. Pentagon closure-path signature with an alternating row/flip chain

`structural_certificate.closure_paths` over the whole survivor corpus uses exactly
six edge-fields, each recurring a constant 4 times (24 paths total):

```text
  BC_BD   BD_DA   CA_CD   CD_CE   EA_EB   EB_ED
   4        4       4        4        4        4
```

These are the edges of a five-gon cycle (the pentagon blocker, `pentagonBlockerV`
in the exact-17 cap-9 leaf).  Each path is an alternating chain of two step
kinds:

- `{"kind":"row","center":c,"first":i,"second":j}` — a center-mediated row
  equality;
- `{"kind":"flip","first":i,"second":j}` — a field-flip equality.

Path `length` distribution is `{1:20, 2:3, 10:1}`: most fields close in a single
row step, but one field (`BD_DA`) needs `length = 10` / `row_equality_steps = 5`
— a long alternating row/flip chain.  The pattern to mine is the **long
row/flip alternation**: the 10-step chain is the closure path that does not admit
a one-step row, and it is where a global (not local) incidence statement would
attach.  No current bank records the *shape class* of a closure path (number of
flips, field it resolves); that shape class is an unmined invariant.

`side_conditions` is nearly empty (only `injective-realization`, 4 occurrences);
the structural certificate does not yet carry the metric/realizability
side-condition, which is consistent with P3's "metric beyond the incidence" gap.

### P5. First-hit export retains a representative, not all distinct cuts

`docs/p97-exact17-cap9-all-core-replay-audit-2026-08-08.md` records that the
earlier first-hit export **retained only 20 of 596 distinct endpoint-comparison
clauses** (750 exact serialized cores across the twenty v10 source models) and
that the two-Kalmanson bank migrated 274 legacy occurrences into 408 exact cores
before deduplication.  The v11 successor enumerates every exact admissible core.

The pattern: the output historically carried a *first-hit proxy* and the full cut
family was not retained; the repair (enumerate + certify every exact core) is the
mined invariant.  Any lane still using a first-hit family representative is
silently dropping the pattern class — a missing-pattern check the census should
enforce uniformly.

### P6. Recurring family-bank "membership" labels with no terminal consequence

The `semantic_status` distribution of family banks is entirely
`FINITE_SOURCE_PROVED_*` membership families:

```text
 FINITE_SOURCE_PROVED_THREE_TRIAD_POSITIVE_MEMBERSHIP_CUT
 FINITE_SOURCE_PROVED_SECOND_CAP_APEX_SURPLUS_MEMBERSHIP_FAMILY
 FINITE_SOURCE_PROVED_ADJACENT_APEX_CROSS_BLOCK_MEMBERSHIP_FAMILY
 FINITE_SOURCE_PROVED_ZERO_CENTER_CROSS_BLOCK_MEMBERSHIP_FAMILY
 FINITE_SOURCE_PROVED_SURPLUS_THREE_TRIAD_MEMBERSHIP_FAMILY
 FINITE_SOURCE_PROVED_SURPLUS_PAIR_SECOND_OPPOSITE_APEX_PAIR_COMMON_FIVE_MEMBERSHIP_FAMILY
 FINITE_SOURCE_PROVED_LABEL_GENERAL_ALL_ORDER_COMMON_FIVE_MEMBERSHIP_FAMILY
 ... (~20 variant families, each mined 3-5 times)
```

Each family's `patterns` array is thousands of atomic `{center, support}`
memberships (e.g. 11052 patterns of a few 3-member rows in the v24 all-order
bank).  The pattern that is present but unmined is the **cross-family
conjunction**: no bank records that the intersection of, say,
`ADJACENT_APEX_CROSS_BLOCK` and `SURPLUS_THREE_TRIAD` forces a terminal.  The
miner treats each family independently; the missing producer is a *join* across
families.

## Verdict

The corpus already contains, as raw output, the objects the proof says it
"needs": DRAT-verified UNSAT terminals (P1), a global pair-cover producer
(P3), a long pentagon closure-path invariant (P4), and the full distinct-cut
family (P5).  The missing work is three operations:

1. a **terminal-promotion sweeper** over the 37
   `UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE` runs plus the 10
   `AWAITING_LEAN_STATIC_AUXILIARY_VALUATION` runs (P1);
2. a **global image/pigeonhole join** packaging "17 carriers → ≥5 blocker
   centers" coupling the blocker centers to B3/B4 (P3, P6);
3. a **closure-path shape-class invariant** over the pentagon fields that flags
   the ≥2-flip chains needing a global statement, not a one-row replay (P4, P5).

Each is a producer over already-computed output.  None closes a Lean leaf by
itself; each is an ingress toward `live_theorem_closure`/`terminal_unsat`,
which every family bank currently reports `False` (P2).

## Recommendations

Ranked by leverage-to-effort.  All three operators are producers over
*already-computed* output, so none requires a new mathematical search — which
is why they are individually cheaper than the open leaves they feed.

1. **Terminal-promotion sweeper — do first.**    55 runs await the Lean lift
    (`UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE` × 45,
    `AWAITING_LEAN_STATIC_AUXILIARY_VALUATION` × 10) and a further 57 are UNSAT
   candidates still in `CERTIFIED-UNSAT-CANDIDATE-TRANSCRIPTION`; only 32 cross
   the terminal line.  In each awaiting case the UNSAT proof or value exists and
   only the Lean lift is missing.  The recipe already works — cells 52/58/65/71
   were promoted by a fresh `cadical --plain` rerun plus pure-RUP normalization
    (`docs/exact12-next-row-arm-terminal-promotion-2026-08-13.md`).  Generalize
   that to the whole 55 + 57 population instead of promoting cell-by-cell.
   Highest kernel-checked facts per unit of work; zero new mathematics.
2. **Global image/pigeonhole producer — the hard math bottleneck.**  Package
   "17 carriers → ≥5 distinct blocker centers" and couple the blocker centers to
   the B3/B4 ≤1 cuts (`scratch/post-cegar-bank3/shared-result.md`).  This is the
   `smallest missing source theorem` the coordination notes name repeatedly, and
   it is the single gap that explains the uniformly all-false `claims` vectors
   (P2).  Open and hard — this is where the leaves actually stall — but the one
   worth a dedicated effort, since everything downstream needs it.
3. **Closure-path shape-class census — cheap to build, medium to prove.**  Add
   a detector that flags pentagon closure paths with ≥2 flips (the lone
   `length=10 / 5-flip` chain, P4).  It isolates *where* a global statement must
   attach instead of a one-row replay.  Cheap census, high diagnostic value.
4. **Cross-family join + first-hit enforcement — cheap, prevents
   re-derivation.**  Mine the intersection of the independent
   `*MEMBERSHIP_FAMILY` banks (P6) and enforce that no lane reuses a first-hit
   proxy that drops distinct cuts (P5, 20-of-596).  Low cost; keeps future waves
   from re-mining the same gap.
5. **Make the audit reproducible.**  The findings are a snapshot at
   `6abb9933`.  A small census script computing the P1–P6 distributions lets us
   track cheap drift after each wave mine instead of re-streaming the corpus.

Sequencing: operator 1 unblocks already-proved terminals with no new math;
operators 3–4 harden the census so future waves flag P2/P5 automatically;
operator 2 is the only route past the current stall and should run in parallel
as the long pole.  Operators 1–3 are also folded into
`docs/computational-closure-plan-2026-07-28.md` as the 2026-08-16 operator set.

## Standing limitations

- All counts are empirical over the `scratch/` tree at
  `git` revision `6abb9933` and are a snapshot; rerun after the next wave mine.
- The `NONE` classifications (45 survivors) and `PARSEFAIL` (1 bank) are
  pre-marker or malformed and excluded from the verdict-distribution counts.
- This audit records output shape only.  A SAT survivor or a
  `FINITE_SOURCE_PROVED_*` family is not a Euclidean realization and not a
  terminal UNSAT for any live leaf.
