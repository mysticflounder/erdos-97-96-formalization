# Candidate-D probe — STATE (heartbeat)

Dispatch: 2026-07-07, register U4, ledger row 4, residual
`DoubleApexOffSurplusSharedRadiusPairCard12Up`. Working dir:
`census/candidate_d_probe/` (only writable location). No git ops by the
probe agent (orchestrator validates/commits).

## Protocol status

1. [x] Mandatory reads (dead-ends incl. all cited entries; closure plan
       §7+§12; d3 report; candidateB report + witness JSONs; leads §7;
       escape-census.py; N8/FourSubpacket.lean; N8bEndpointPair.lean;
       N9Endpoint/Shell.lean; Cap/Structure.lean; Foundation.lean;
       CircumscribedMECPacket.lean; census554_lib.py).
2. [x] Solvers: z3 4.17 CLI + z3py 4.16, cvc5, msolve 0.10, cadical, mace4,
       prover9, sympy 1.14 (`uv run --with sympy --with z3-solver python`).
       QEPCAD/Redlog NOT installed.
3. [x] Token re-verification 31/19 (verify_tuples.py PASS, p <= 200).
4. [x] formulation.md — all 19 grounded, 72 conjunctive cases, no UNGROUNDED.
5. [x] encoder.py + gates: G1 PASS (vesica KILLED dual-engine exact),
       G2 PASS (exact hand witness + z3 sat), G3 PASS (W20 incidence exact
       eval + msolve POSDIM). Details in "Gate results" below.
6. [x] Q1: verdict table below (13 REALIZED exact, 2 KILLED-PROVEN,
       4 unresolved riding SUB2).
7. [x] Q2: SAT n = 12..16 for BOTH K variants (q2_results_{proven,plus}.json)
       — obstruction D1 CONFIRMED token-level; witnesses banked.
8. [ ] Q3: NOT REACHED (budget went to Q1 kill mechanisms + SUB2).

## Gate results

- G1 PASS: k=4 vesica collapse — msolve `[-1]` AND sympy GB == {1}, with
  all-pair separators AND single separator d2(p1,p3). runs/G1_vesica_k4_*.
- G2 PASS: cocircular-minor-arc control — exact rational hand witness
  through verify_exact; z3 sat 0.01 s. Encoder not falsely exclusive.
- G3 PASS: W20 center O0 class {O2,O8,I2,I7} — incidence system exactly
  true at witness (sympy, phi-identities); msolve POSDIM `[1,20,-1,[]]`.

## Q1 per-class verdicts (reflected classes)

REALIZED-MINIMAL-WINDOW (exact rational witness, every constraint verified
exactly through the SAME system the solvers see; witnesses.json):
  (0,0,0,4) k0; (0,0,1,3) k0; (0,0,2,2) k0; (0,1,0,3) k1; (0,1,1,2) k1;
  (0,2,0,2) k1 (straddle); (0,2,1,1) k1 (straddle); (1,0,0,3) vc=v2;
  (1,0,1,2) vc=v2; (1,1,0,2) vc=v2; (1,1,1,1) vc=v2; (2,0,0,2) vc=v2v3;
  (2,0,1,1) vc=v2v3.   [13 classes]

KILLED (PROVEN, kill_notes.md K-C: full-lens corner-max K-A + bisector
position K-B + non-obtuseness; no solver needed):
  (2,1,0,1); (2,2,0,0).   [2 classes — every vertex choice]

UNRESOLVED (ride SUB2 = same-side own-pair sub-window, kill_notes.md K-D;
kill CONJECTURED on strong float evidence, margins -> 0- with member
collapse; z3 300s unknown, cvc5/z3-1800s escalation artifacts in runs/):
  (0,3,0,1); (0,4,0,0); (1,3,0,0)  [fully decided by SUB2]
  (1,2,0,1)  [k in {0,2} ride SUB2; k=1 straddle separately open,
              factory exhausted without witness]   [4 classes]

Sub-case refinement (PROVEN direction): s = 2 classes realized ONLY in
straddle form (k = 1); their k in {0,2} cases ride SUB2.

z3 full-window sweep (q1_sweep.log, q1_results.json): TERMINATED at 40/72
cases (external stop) — every completed case z3-unknown at 60 s. Superseded
by the factory witnesses and K-C proofs; treat as obstruction-D3
documentation only. msolve step-(i): POSDIM everywhere tried (equality
layer far underdetermined, as predicted).

SUB2 solver escalation FINAL: z3 qfnra-nlsat 300 s unknown (both sides);
cvc5 900 s "interrupted by timeout" (both sides,
runs/SUB2_{left,right}.cvc5.out); the 1800 s z3 runs did not complete
before session end (runs/SUB2_*.z3long.out empty). SUB2 remains
solver-unresolved; kill CONJECTURED on the float evidence (K-D).

## Q2 (composition, D1)

q2_token.py (census554-style DFS; C1, C2, C4, FULL H1, m <= 2 enforced
— m <= 2 is geometric, formulation.md 2.1; first run lacked it and leaned
on m=3 types, caught and fixed). K_proven = {(2,1,0,1),(2,2,0,0)};
K_plus = + {(0,3,0,1),(0,4,0,0),(1,3,0,0)}.
RESULT: SAT at every n in {12,13,14,15,16} for BOTH sets
(profiles (5,5,5),(6,5,5),(6,6,5),(6,6,6),(7,6,6)); evasion patterns with
full class maps + per-center types in q2_results_proven.json /
q2_results_plus.json. Types used are all REALIZED or unresolved ones.
=> Per-type kills (even granting the conjectured s>=3 kills) do NOT
compose to a global kill at any probed order. Obstruction D1 confirmed.

## Files

- formulation.md — window semantics, soundness contract, case table.
- kill_notes.md — K-A/K-B/K-C proofs (PROVEN), K-E identity + one-sided-sup
  WARNING, K-D (SUB2) status + dependency map.
- encoder.py — windows, gates, msolve/z3/verify drivers, SUB2 builder.
- witness_factory.py — exact rational witness search (5 frames).
- witnesses.json — 13 exact witnesses (vc, k, full coordinate maps).
- verify_tuples.py; float_probe_sub2.py; float_refine_sub2.py.
- q2_token.py; q2_results_{proven,plus}.json; q2_{proven,plus}.log.
- q1_results.json, q1_sweep.log, runs/*.smt2, runs/*.msolve.*, sub2_results.json,
  runs/SUB2_*.{cvc5,z3long}.out (escalation; may finish after the probe).

## Resume instructions

Read formulation.md, then kill_notes.md, then this file. The one live
mathematical question on the kill side is SUB2-H (7-var NRA sentence;
build_sub2 in encoder.py + the PROVEN H-reduction in kill_notes.md K-D):
decide it by CAD QE (install QEPCAD/Redlog) or hand proof via the
collapse-limit tangent conditions. If SUB2-H is UNSAT, 3.5 more classes
become KILLED (see dependency map) — but Q2 already shows even that does
not close the composition (rerun q2_token.py with the enlarged K if a new
kill lands, and with any new kill classes appended). (1,2,0,1) k=1 needs
either a cleverer witness (deep-left member + x-extremality tension) or a
proof. Q3 (the {V,W} two-center window sweep) is untouched; K-A/K-B/K-E
are the intended toolkit.
