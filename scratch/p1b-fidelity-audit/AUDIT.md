# P1b Statement-Fidelity Audit — U1LargeCapRouteBTail.lean helper extraction

Date: 2026-07-12
Auditor: statement-fidelity subagent (adversarial default: NEEDS WORK)
Baseline: `git show HEAD:lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean` (5475 lines) → `scratch/p1b-fidelity-audit/baseline.lean`
Candidate: working tree (9478 lines) → `scratch/p1b-fidelity-audit/candidate.lean`
No Lean file was edited; no build or `lake env lean` was run (per instructions).

## Headline verdict: PASS (commit-ready)

Blocking findings: 0.
Non-blocking observations: 3 (OBS-1..3 below).
Items verified textually only (no elaboration run): 5 (VT-1..5 below).

## Check 1 — Public surface unchanged: PASS

- Lines 1–3400 of both files are byte-identical (verified by `diff`; first hunk
  starts at 3401). This covers all imports, all prior declarations, and
  `DoubleApexOffSurplusSharedRadiusPair` (baseline/candidate 2516) with its
  single `sorry` hole (line 2561 in both).
- The statement of `u1_largeCap_routeB_tail_liveData_false` (header through
  `False := by`, 37 lines) is byte-identical: baseline 3433–3469 ==
  candidate 7764–7800. Its docstring is also byte-identical (baseline
  3401–3432 == candidate 7732–7763).
- The suffix after the main theorem is byte-identical: baseline 5192–5475 ==
  candidate 9195–9478 (covers `u1_largeCap_routeB_tail_false` and everything
  else to EOF).
- The changed region (candidate 3401–9194) contains exactly 36 declarations:
  the 35 new `liveData_*_false` helpers and the main theorem. No other
  declaration was added, removed, or restated.
- OBS-1: the candidate main theorem is now prefixed by
  `open U1LargeCapRouteBTailMetricResidualTarget in` (candidate 7731); the
  baseline main theorem had no such prefix. The namespace's members were
  enumerated (f2CriticalRow_*, false_of_*, DoubleApex..., leafSurplusPacket,
  etc.); none collides with any identifier occurring in the theorem statement,
  so the elaborated statement is unchanged; the open affects only proof-body
  name resolution (needed since the body now calls unqualified namespace-free
  helpers and previously-qualified lemmas the same way as before — baseline
  body lines are otherwise unchanged). VERIFIED-TEXTUALLY-ONLY (VT-4).

## Check 5 — Hole conservation: PASS

`grep -o sorry | wc -l` = 81 in both files. Distribution:

| Location | Baseline | Candidate |
|---|---|---|
| Comment ("The remaining `sorry` ...") | line 27 (1) | line 27 (1) |
| `DoubleApexOffSurplusSharedRadiusPair` | 2561 (1) | 2561 (1) |
| Q family | 24 in main thm (4 blocks x 6) | 24 in 4 helpers (6 each) |
| T1 family | 24 in main thm (12 pairs) | 24 in 12 helpers (2 each) |
| T3 family | 24 in main thm (12 pairs) | 24 in 12 helpers (2 each) |
| C family | 7 in main thm | 7 in 7 helpers (1 each; `False := sorry`) |
| Candidate main theorem | — | 0 (verified) |

## Check 4 — Call-site fidelity: PASS

`diff` of the two main-theorem bodies (baseline 3470–5191 vs candidate
7801–9194) produces exactly 30 hunks covering exactly 35 replacements; every
hunk replaces a baseline terminal block (the final `rcases`/`by_cases` +
sorries of one branch) with a single `exact liveData_..._false <args>` call,
and NOTHING else in the body changed (all `have`s, `by_cases`, `rcases`
producing the branch context are untouched context lines). Each helper is
applied exactly once, in the same branch as its baseline sorry site(s), and the
argument list matches the helper's explicit binder order name-for-name (20
explicit theorem binders + 5 shared haves + branch-path hypotheses; implicits
D, p, q, t1, t2, t3, u, hncol, M, i are inferable from the explicit args —
VT-5, positional/implicit resolution not elaborator-confirmed here). Mapping
1:1: Q 4 call sites covering 24 baseline holes, T1 12 covering 24, T3 12
covering 24, C 7 covering 7 — total 79. No branch is discharged by a different
family's helper (each helper body is a unique verbatim match at its own branch;
see below), and no helper is applied at two branches.

## Checks 2 & 3 — Surface completeness and no invented content: PASS

Method actually used (stronger than the minimum requested):

- Body verbatim matching (automated): each of the 28 Q/T1/T3 helper bodies was
  matched as a contiguous indentation-normalized line sequence against the
  baseline; every body matched EXACTLY ONCE, at exactly the expected branch
  (match ranges in the table). This proves the regenerated context inside each
  helper (final rcases, case names, comments, inline branch closers) is
  byte-faithful, and rules out T1/T3 mirror swaps and cross-slot mislabeling
  of bodies. C helpers have no body (`False := sorry`).
- Binder census (automated): full ordered binder-name extraction for all 35
  helpers; all carry the 28 theorem binders verbatim (byte-identical to the
  main statement, checked by diff on Q_l1 and by pairwise diffs for the rest)
  plus the 5 shared `have`-derived hypotheses, plus the branch-path binders.
- Slot-content extraction (automated): all `hq_slot*`, `hsource_l*`,
  `hl*_t1`/`hl*_t3`, `htail_set` binder contents extracted and checked:
  slot_k <-> l_{k+1} and src_j <-> l_j everywhere; T1 uses `= t1`, T3 uses
  `= t3`; the 10 `htail_set` contents match the baseline's 10 occurrences 1:1.
- Full binder-by-binder checks against the reconstructed baseline branch
  context for 19 helpers; representative-diff structural checks for the other
  16 (each differs from a fully-verified family sibling ONLY in the expected
  slot-varying binders; confirmed for all 16 by filtered diffs).

Baseline branch contexts were reconstructed by direct reading of the whole
proof spine: shared prefix 3494–3589 (5 lambda-haves + 7-way center rcases),
Q region 3590–3943, T1 region 3944–4720, T3 region 4721–5163, closing exacts
5164–5179, C leaves 5180–5191. Per-branch conclusions:

- Consumed hypotheses (`hq_named`, `hsource_named_except`) are correctly
  ABSENT from helper binders (rcases clears them in baseline).
- All in-scope haves at each sorry are present: including the easily-dropped
  ones — `hqRow_center_p` (Q only), `ht1Row_center_p`/`hf2_l1_eq_t1Row_l1`/
  4x`hfalse_of_*` (T1 only), `ht3Row_center_p` (T3 only), `hl2_ne_l1` (Q_l2
  only), `hlabel_mem_base`+`hl*_mem` (Q_l3/Q_l4 only), `hlabels_ordered`
  (T1_ql2_srcl1 only). Family-asymmetric extras match baseline exactly.
- Branch-condition polarities correct: Q helpers have `hq_t20 : q = t20`;
  T1 helpers have `¬q`, `+t1`; T3 helpers have `¬q`, `¬t1`, `¬t2`, `+t3`
  (checked in full on representatives; shared blocks byte-identical across
  each family by representative diffs).
- C case binders match the source lemmas verbatim: the 7-way disjunction of
  `f2CriticalRow_center_baseSix_or_fresh` (baseline 1739–1754; `hcenter_fresh`
  keeps the full 8-fold conjunction un-destructured, as in baseline's rcases
  pattern) and the two sides of
  `f2CriticalRow_all_named_or_t2ResidualHRowFailure` (baseline 1660–1689;
  named triple destructured to `hf5_named`/`hp_named`/`hq_named`, rowFailure
  kept whole) — matching baseline 5182–5188 exactly.
- No helper binder asserts anything not derivable at its branch: every binder
  is the stated type of a baseline `have`/`by_cases`/`rcases` product on that
  exact path (modulo VT-1..3 spellings below).

### Textual-equivalence items (no elaboration run — VERIFIED-TEXTUALLY-ONLY)

- VT-1: baseline states some haves as
  `f2CriticalRow.selected.toCriticalFourShell.support`; helpers write
  `f2CriticalRow.selected.support`. `CriticalSelectedFourClass extends
  CriticalFourShell` (U1CarrierInjection.lean:636–652, field
  `support : Finset ℝ²` at :555), so dot-resolution goes through the parent
  projection and both spellings denote the same term.
- VT-2: some helper set literals drop the `: Finset ℝ²` ascription present in
  baseline (e.g., `hselected_support_eq_base` in Q/T1 helpers) or keep it
  (T3 helpers); elaboration is forced by the LHS type `Finset ℝ²` in every
  case. `hlabels_base`/`htail_set` literals keep explicit ascriptions on both
  sides, byte-matching baseline.
- VT-3: baseline `have`s with named premises (the 5 shared lambdas, the 4
  `hfalse_of_*` lambdas, `hselected_support_eq_base_of_q_named`,
  `hlabel_mem_base`) appear in helpers as the equivalent `∀`/`→` binder types
  with identical implicit/explicit structure.
- VT-4: `open ... in` before the main theorem (see Check 1).
- VT-5: implicit-argument inference at the 35 call sites (see Check 4).

The implementing agent gated elaboration; these five items are the complete
list of places where this audit relies on standard Lean elaboration semantics
rather than byte equality.

### Non-blocking observations

- OBS-1: `open U1LargeCapRouteBTailMetricResidualTarget in` added before the
  main theorem (candidate 7731). No statement capture.
- OBS-2: ascription style inconsistency between families in
  `hselected_support_eq_base(_of_q_named)` (T3 with ascription, Q/T1 without).
  Same elaborated statement; cosmetic.
- OBS-3: helper context binders use 2-space indentation vs 4-space for the
  copied theorem binders; cosmetic.

## Per-helper verdict table

Columns: baseline branch (sorry lines) / candidate helper decl line (sorry
lines) / surface complete / no invention / call-site OK / check depth.
"body=BASE a–b" = helper body matched baseline lines a–b verbatim (unique).

| Helper | Baseline branch | Candidate | Surface | No invention | Call site | Depth |
|---|---|---|---|---|---|---|
| liveData_Q_l1_false | q_t20, q=l1 (3657–3672); body=BASE 3649–3672 | 3404 (3509–3524) | yes | yes | yes | FULL |
| liveData_Q_l2_false | q_t20, q=l2 (3776–3791); body=BASE 3768–3791 | 3530 (3636–3651) | yes | yes | yes | FULL |
| liveData_Q_l3_false | q_t20, q=l3 (3852–3867); body=BASE 3844–3867 | 3657 (3771–3786) | yes | yes | yes | FULL |
| liveData_Q_l4_false | q_t20, q=l4 (3928–3943); body=BASE 3920–3943 | 3792 (3906–3921) | yes | yes | yes | FULL |
| liveData_T1_ql1_srcl2_false | t1_t20, q=l1, t20=l2 (4103, 4111); body=BASE 4092–4111 | 3927 (4053, 4061) | yes | yes | yes | FULL |
| liveData_T1_ql1_srcl3_false | t1_t20, q=l1, t20=l3 (4191, 4199); body=BASE 4180–4199 | 4067 (4193, 4201) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql1_srcl4_false | t1_t20, q=l1, t20=l4 (4279, 4287); body=BASE 4268–4287 | 4207 (4333, 4341) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql2_srcl1_false | t1_t20, q=l2, t20=l1 (4367, 4375); body=BASE 4358–4377 | 4347 (4475, 4483) | yes | yes | yes | FULL |
| liveData_T1_ql2_srcl3_false | t1_t20, q=l2, t20=l3 (4411, 4419); body=BASE 4400–4419 | 4491 (4617, 4625) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql2_srcl4_false | t1_t20, q=l2, t20=l4 (4453, 4461); body=BASE 4442–4461 | 4631 (4757, 4765) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql3_srcl1_false | t1_t20, q=l3, t20=l1 (4507, 4515); body=BASE 4492–4517 | 4771 (4899, 4907) | yes | yes | yes | FULL |
| liveData_T1_ql3_srcl2_false | t1_t20, q=l3, t20=l2 (4545, 4553); body=BASE 4528–4553 | 4915 (5045, 5053) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql3_srcl4_false | t1_t20, q=l3, t20=l4 (4581, 4589); body=BASE 4564–4589 | 5059 (5189, 5197) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql4_srcl1_false | t1_t20, q=l4, t20=l1 (4635, 4643); body=BASE 4620–4645 | 5203 (5331, 5339) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql4_srcl2_false | t1_t20, q=l4, t20=l2 (4673, 4681); body=BASE 4656–4681 | 5347 (5477, 5485) | yes | yes | yes | STRUCTURAL |
| liveData_T1_ql4_srcl3_false | t1_t20, q=l4, t20=l3 (4709, 4717); body=BASE 4692–4717 | 5491 (5621, 5629) | yes | yes | yes | FULL |
| liveData_T3_ql1_srcl2_false | t3_t20, q=l1, t20=l2 (4791, 4795); body=BASE 4778–4795 | 5635 (5749, 5753) | yes | yes | yes | FULL |
| liveData_T3_ql1_srcl3_false | t3_t20, q=l1, t20=l3 (4819, 4823); body=BASE 4806–4823 | 5759 (5873, 5877) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql1_srcl4_false | t3_t20, q=l1, t20=l4 (4847, 4851); body=BASE 4834–4851 | 5883 (5997, 6001) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql2_srcl1_false | t3_t20, q=l2, t20=l1 (4895, 4899); body=BASE 4882–4899 | 6007 (6121, 6125) | yes | yes | yes | FULL |
| liveData_T3_ql2_srcl3_false | t3_t20, q=l2, t20=l3 (4923, 4927); body=BASE 4910–4927 | 6131 (6245, 6249) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql2_srcl4_false | t3_t20, q=l2, t20=l4 (4951, 4955); body=BASE 4938–4955 | 6255 (6369, 6373) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql3_srcl1_false | t3_t20, q=l3, t20=l1 (4999, 5003); body=BASE 4986–5003 | 6379 (6493, 6497) | yes | yes | yes | FULL |
| liveData_T3_ql3_srcl2_false | t3_t20, q=l3, t20=l2 (5027, 5031); body=BASE 5014–5031 | 6503 (6617, 6621) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql3_srcl4_false | t3_t20, q=l3, t20=l4 (5055, 5059); body=BASE 5042–5059 | 6627 (6741, 6745) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql4_srcl1_false | t3_t20, q=l4, t20=l1 (5103, 5107); body=BASE 5090–5107 | 6751 (6865, 6869) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql4_srcl2_false | t3_t20, q=l4, t20=l2 (5131, 5135); body=BASE 5118–5135 | 6875 (6989, 6993) | yes | yes | yes | STRUCTURAL |
| liveData_T3_ql4_srcl3_false | t3_t20, q=l4, t20=l3 (5159, 5163); body=BASE 5146–5163 | 6999 (7113, 7117) | yes | yes | yes | FULL |
| liveData_C_center_q_false | hcenter_q leaf (5180) | 7122 (7200) | yes | yes | yes | FULL |
| liveData_C_center_t1_false | hcenter_t1 leaf (5181) | 7205 (7283) | yes | yes | yes | FULL |
| liveData_C_center_t2_named_false | hcenter_t2 / hnamed (5187) | 7288 (7382) | yes | yes | yes | FULL |
| liveData_C_center_t2_rowFailure_false | hcenter_t2 / hrowFailure (5188) | 7387 (7471) | yes | yes | yes | FULL |
| liveData_C_center_t3_false | hcenter_t3 leaf (5189) | 7476 (7554) | yes | yes | yes | FULL |
| liveData_C_center_u_false | hcenter_u leaf (5190) | 7559 (7637) | yes | yes | yes | FULL |
| liveData_C_center_fresh_false | hcenter_fresh leaf (5191) | 7642 (7729) | yes | yes | yes | FULL |

Check-depth totals: 19 FULL (all 4 Q; T1 ql1_srcl2, ql2_srcl1, ql3_srcl1,
ql4_srcl3; T3 ql1_srcl2, ql2_srcl1, ql3_srcl1, ql4_srcl3; all 7 C), 16
STRUCTURAL (remaining 8 T1 + 8 T3). Every STRUCTURAL helper additionally has a
verbatim-unique body match and a representative-diff showing only slot-varying
binder lines, so the structural tier here is close to full strength; the four
FULL representatives per family cover each family's distinct structural
variants (card-derived htail_set, hlabels_ordered, no-htail_set direct-rcases,
lambda-flip argument variants).
