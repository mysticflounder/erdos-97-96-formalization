# Verification of the scratch computational-output pattern audit (2026-08-16)

Verifies the six findings P1–P6 of
[the scratch computational-output pattern audit](2026-08-16-scratch-computational-output-pattern-audit.md).

**None of the six survives as stated.** Four rest on hardcoded generator
constants read as achieved results, one restates a 2026-08-08 note while
missing an existing theorem, and one describes a defect repaired on
2026-08-08.

This document records evidence, not blame. The audited corpus is genuinely
hostile to inference: its status vocabulary is written by generators that
stamp constants, so a reader who does not open the writer will draw exactly
these conclusions. The same failure mode appears in the LLM pattern mine
recorded in `data/p97-pattern-bank.db`, where all three nominated candidates
also died as encoder artifacts.

## Verdicts

| Finding | Verdict | Load-bearing reason |
|---|---|---|
| P1 terminal-promotion backlog | **REFUTED** | `terminal_promotion_status` is a hardcoded constant; all 36 runs carrying it are SAT or UNKNOWN, none UNSAT |
| P2 all-false claims vector | **REFUTED** | All five `claims` fields are literal `False` in all 73 writers; a validator fails closed if any is ever `True` |
| P3 missing pair-cover producer | **PARTLY / NOT NEW** | Restates `post-cegar-bank3/shared-result.md` (2026-08-08); the pigeonhole half already exists in Lean |
| P4 pentagon closure-path shape | **REFUTED** | Six fields hardcoded in a stage dispatch table; not a pentagon; shape class already computed and in Lean |
| P5 first-hit representative | **ALREADY FIXED** | Repaired 2026-08-08, regression-tested, re-audited 2026-08-12, lane superseded 2026-08-10 |
| P6 missing cross-family join | **REFUTED** | `semantic_status` hardcoded in 23 modules; the "missing join" is the actual construction of the bank chain |

## The dominant failure mode

P1, P2, P4 and P6 each read a hardcoded generator constant as a result.

- `census/card_head/exact12_next_row_arm_static_canary.py:242` defines
  `TERMINAL_STATUS = "UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE"`
  and writes it unconditionally at `:1166` and `:1925`, beside a hardcoded
  `"lean_terminal_ingress_ready": True`.
- All five `claims` fields are bare literals in every writer, for example
  `census/card_head/exact12_all_order_common_five_membership_family_bank.py:1259`.
- The six closure-path edge-fields are a literal tuple in a stage dispatch
  table, `census/global_confinement/cap_selected_nogood_certificate_probe.py:168`.
- `semantic_status` is one module-level literal per generator across 23
  modules; `PROVED` in those names is a naming convention, and the same banks
  carry an all-false `claims` vector.

P2 inverts its source's meaning. `_false_claims()` in
`census/card_head/exact12_next_row_arm_static_v24_validator.py:107,293`
*requires* the claims be `False` and rejects any run containing an
"affirmative/ambiguous claim". The vector is an anti-overclaim seal — the
repository's own rigor discipline working correctly — not five closure
verdicts answered "no".

For contrast, `reused_requirement_count = 583` **is** computed and checked:
the generator raises when the computed length disagrees
(`exact12_all_order_common_five_membership_family_bank.py:1188`). That is the
shape of a field a reader may trust.

## Count inflation

The audit used raw, undeduplicated counts throughout. `scratch/` contains
whole repository copies under `exact-sha-worktrees/` and `*-source/scratch/`.

| Artifact | Deduplicated | Raw | Audit |
|---|---|---|---|
| top-level lanes | 335 | — | ~330 |
| `*_bank.json` | 83 | 159 | 159 |
| `summary.json` | 830 | 1643 | — |
| distinct bank file contents | 62 | — | — |

Beyond repo-copy duplication, the 61 all-false bank rows are 20 distinct
family generators re-emitted across the v22/v23/v24 lane snapshots, and the
21 distinct `final_dimacs_sha256` values are 20 successive prefixes of one
accumulating CNF chain over one frozen base. "Each family mined 3–5 times"
describes re-emission, not independent evidence.

**Preflight rule:** before drawing any conclusion from a count over
`scratch/`, exclude `.lake/`, `vendor/`, `exact-sha-worktrees/`,
`__pycache__/` and `*-source/scratch/`, then count distinct base-instance
hashes. Where that count is 1, no volume of records supports an
n-independent claim.

## Circular corroboration

The audit writes its conclusions into
`docs/computational-closure-plan-2026-07-28.md` and then cites the plan as
independent support. The section at `:13450` is headed
`## 2026-08-16 operator set (from scratch output-pattern audit)` with the
audit named as its `Source:`. `git show HEAD:` has no occurrence of that
heading, of "17 carriers", or of "5-flip".

The inserted text also carries the inflated `159 family banks` figure into a
governance document, and at `:13473` prescribes flagging
"the lone `length=10 / 5-flip` chain".

**This text was uncommitted at the time of writing and should be reviewed
before the closure plan is next committed.** This verification made no edit
to that file; it is owned by another lane.

## Corrections to the verification itself

The verifier assigned to P4 reported the `length=10 / row_equality_steps=5`
`BD_DA` path as fabricated. That is wrong. The path exists exactly once, in
`scratch/arm-static-cell6-v24-live-5fc7ade0-20260815/survivor.json`, which
that verifier's carrier enumeration missed. What fails in P4 is the framing:
one occurrence in a large corpus rather than "the lone chain" of a 24-path
set, and the claimed `{1:20, 2:3, 10:1}` distribution is not reproducible at
any scope.

`length` is additionally a BFS shortest-path distance in a closure graph
(`cap_selected_nogood_certificate_probe.py:593-618`), so it varies with graph
construction order and is unsound as an invariant regardless of its value.

## What survives and is worth acting on

1. **A ported pigeonhole producer.**
   `lean/scratch/md-blocker-closed-bank/MDBlockerClosed.lean:381` proves
   `card_le_four_mul_card_blockerImage : V.card ≤ 4 * (V.image (blockerMap H)).card`,
   sorry-free with an `#print axioms` gate at `:390`. At `V.card = 17` this
   yields the "≥ 5 distinct blocker centers" fact P3 calls absent. It is
   unreachable: `lean/scratch/` is not a `lean_lib` root and nothing imports
   it. This needs **porting, not proving**. Only the B3/B4 coupling — the
   second conjunct of `post-cegar-bank3/shared-result.md` — is genuinely
   missing. Status remains **PROVEN-PRODUCER** at best; porting alone closes
   nothing.
2. **The composed prefix does not force a terminal.**
   `ExactTwelveRigid221FullMembershipPrefixTerminalConsumer.lean` (1627
   lines, no `sorry`) already composes the membership families and
   terminates at `false_of_terminalFullMembershipNamedDeletionArmBank:1527`.
   The bank chain is contiguous — each bank's `initial_n_clauses` equals its
   predecessor's `final_n_clauses`, 635405 through 676147 — so the
   conjunction P6 calls unrecorded is the construction itself. The open
   problem is a terminal UNSAT on the composed prefix.
3. **Twenty membership families mined without a producer lift.** Real, and
   the defensible core of P2 — but it must be sourced from the prose in
   `scratch/post-cegar-bank3/shared-result.md`, not from the `claims` vector,
   which carries no information about it.

## Method

Five verification agents, one per finding P2–P6, each instructed to locate
the writer of any field before trusting its value; P1 was verified directly.
Every load-bearing claim in each agent's report was then re-checked by the
host session against the repository, which is how the P4 correction above was
found. Verdicts and salvage are recorded in `data/p97-pattern-bank.db` under
run `local-llm-audit-20260816`; see
[the scratch pattern bank](../../../scratch-pattern-bank-2026-08-16.md).

## Standing limitations

- Counts are a snapshot at `6abb9933` plus the working tree of 2026-08-16.
- The audited document was being edited during verification (239 → 295
  lines); findings P1–P6 were unchanged, and a `## Recommendations` section
  was added. Its recommendation 1, ranked "do first", restates P1 at the raw
  counts and is refuted here.
- No Lean build was run. Whether `card_le_four_mul_card_blockerImage`
  typechecks against the live B3/B4 interfaces after porting is untested.
- This document records output-shape and provenance verification only. It
  closes no leaf and promotes nothing.
