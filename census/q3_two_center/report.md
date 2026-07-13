# Q3 two-center window probe — report (2026-07-07/08)

**Spine context.** Register U4, named residual
`DoubleApexOffSurplusSharedRadiusPairCard12Up`
(`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`). Successor to
the candidate-D probe (`census/candidate_d_probe/report.md`), which
closed the pure per-type route and identified cross-center coupling as
the smallest viable Candidate D object. This probe decides the
two-center (V,W) joint-class layer. Run inline, no subagents (Adam).
No Lean production; deliverable is the verdict table plus proven joint
constraints for successor routes.

## Verdict

**The 87 mirror-reduced (V,W) joint classes are completely classified:**

| verdict | count | certificate |
|---|---|---|
| REALIZED (exact ℚ witness) | 68 | `factory_raw.json` (63) + `resid_witnesses.json` (5), all verified via `build_w2c` + `verify_exact`, mutation controls reject |
| REALIZED over ℚ(√3) (NEEDS-SPECIAL by proof) | 4 | `specials_witnesses.json`; ident point (1/2, ±√3/2) never rational — PROVEN |
| KILLED-PROVEN | 15 | K-Q3-1 (6 classes), K-Q3-5 (9 classes, subsumes K-Q3-3) — `kill_notes.md` |

Zero unresolved. Every claim label: witnesses PROVEN (exact arithmetic,
official encoder, mutation controls); kills PROVEN (hand proofs +
machine cross-checks: K-Q3-1/K-Q3-3 z3-unsat subsystems, K-Q3-5
lemma-level z3-unsat ×4 in `check_kq35_lemmas.py`).

## Proven joint kills (leaf-implied, exportable)

- **K-Q3-1** (6 classes): no two distinct members of K(V) ∩ K(W) on the
  same open side of line VW — circle-intersection mirror symmetry vs cap
  signs. Uses radius equalities + cap signs only.
- **K-Q3-5** (9 classes): no shared member in intS at all. For z ∈ intS:
  ρV² + ρW² ≤ 1 (parallelogram identity + E-MEC + I-DISK + I-OBT), while
  H1 opposite-cap members force ρV² + ρW² > dV² + dW² ≥ 1 (nonobtuse).
  Uses E-MEC, radii, I-DISK, I-OBT, cap signs, H1 counts.
- Neither uses ORDER constraints; both transfer to every |A| ≥ 12
  configuration exhibiting the joint type, and by cap relabeling to all
  three Moser pairs.

**Falsifier gate PASS** (`falsifier_gate.py`): checked geometrically
(real MEC, nonobtuse boundary triangles, strict chord-sign caps) against
the W15/W16 lattice and W16/W20 ring witnesses — 396 triangles, zero
killed-type realizations. Caveat recorded: the d3 witnesses' cube-level
cap labels carry no chord geometry (labeled triangles can sit off-MEC);
a label-level check false-alarms.

## Composition retest (token level) — the D1 answer

`q3_token.py`: census/D3 admissibility (C1, C2, C4, full H1, m ≤ 2)
plus the Q3 joint kills on all three Moser pairs, swept over ALL
unordered cap profiles per n. **SAT at every n = 12–16, for both
K_proven and K_plus** (`q3_token_{proven,plus}.json`). The two-center
joint kills do not close the token-level D1 evasion.

## Structural findings

- **Right-angle apexes are order-dead** (PROVEN, elementary): at
  ux ∈ {0,1} the convex-order exit turn at the last p-block member
  (p·U < rv2) contradicts I-DISK exactly (U on the MEC makes the two
  conditions complementary). This is why order-free subsystem SAT
  results (`check_kq34.py`) do not lift to witnesses at those apexes.
- The 5 hardest classes are realizable only in thin apex windows; the
  decisive tool was a float feasibility probe over the official
  encoding (`float_resid.py`) followed by exact rationalization
  (`rationalize_resid.py`: ident point pins both radii rationally,
  members placed by exact rational rotations, margins polished first).

## Consequence for U4 / Candidate D

The two-center window yields real, exportable joint kills (15/87), but
72/87 joint classes are realizable at the decorated minimal window and
the kills do not close composition at token level. A viable Candidate D
must couple strictly more than one (V,W) pair's decorated window —
three-center coupling, order-coupled multi-window systems, or the gated
census route (§7 D3 C-split) remain the live directions.

## Artifacts

All in `census/q3_two_center/`: `formulation.md` (read first),
`kill_notes.md` (proofs), `STATE.md` (10-item checklist, all closed),
`q3lib.py` (official window builder over the D-probe encoder),
`factory.py` + `factory_raw.json`, `verify.py` + `q3_witnesses.json`,
`specials.py` + `specials_witnesses.json`, `float_resid.py` +
`float_resid.json`, `rationalize_resid.py` + `resid_witnesses.json`,
`check_kq33.py`/`check_kq34.py`/`check_kq35.py`/`check_kq35_lemmas.py`,
`q3_token.py` + results, `falsifier_gate.py`, `eq_ideal.py` (moot —
witnesses settle non-emptiness), `smoke.py` + `smoke_results.json`,
`residue*.txt/.log`, `runs/` (solver files, gitignored).

## Permanent checkpoint addendum (2026-07-13)

`checkpoint.py` / `checkpoint.json` now make the negative Q3 verdict
reproducible and fail closed. The checkpoint exact-replays all 72 realized
windows (68 rational and 4 over `Q(sqrt(3))`), requires every radius mutation
to fail, validates the stored token assignments for all 22 profiles under both
the base and post-SUB2 proved cut sets, and pins every runtime input digest.
The formerly stale falsifier gate path now resolves the five tracked
`scratch/d3-formulation/` inputs and passes on 9 configurations / 396
nonobtuse boundary triangles; regression tests cover the path and gate.

Epistemic boundary: the token assignments are exact only within the token
model, the falsifier gate remains guard-banded floating evidence, and the
checkpoint does not independently replay the 15 hand/Z3 kill proofs. Thus Q3
is DONE-NEGATIVE as a selected-four/two-center decider, not a closure proof.
ATAIL-FORCE still requires a selection-robust full exact-radius overlap,
multi-window, or critical-row producer; see
`docs/atail-force-producer-plan-2026-07-13.md`.
