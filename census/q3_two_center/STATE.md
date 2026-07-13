# Q3 two-center probe — state

Run inline by the orchestrating session (Adam: no subagents), 2026-07-07.
Read formulation.md, then kill_notes.md, then this file.

## Status

1. [x] Formulation (formulation.md): window grounded to in-tree H1
       theorems (SurplusM44Packet.lean:423 ff verified against source);
       87 mirror-reduced joint classes, 375 conjunctive sub-cases;
       Q3-A′ (corner-max FAILS for opposite-vertex centers — antipode in
       the far lens under non-obtuseness), Q3-B/Q3-C (corner-max from lens
       corners) PROVEN in formulation §2.
2. [x] Smoke gates (smoke.py, smoke_results.json): SG1 vesica kill via my
       harness PASS (msolve [-1] + GB={1}); SG2 Q1-witness re-verified via
       imported machinery PASS; SG3(b) contiguity mutation unsat PASS.
       SG3(a)/(c): z3 unknown on full decorated windows (matches Q1
       experience) — SAT side moved to the exact factory; binding of
       E-K×I-DISK evidenced by witness + mutation controls in verify.py.
3. [x] KILLS PROVEN (kill_notes.md):
       - K-Q3-1: double cross-identification classes (io2=ident ∧
         io1=ident) die by two-circle mirror symmetry vs chord-VW cap
         signs. z3 subsystem unsat. 6 classes.
       - K-Q3-3: shared-apex + shared-S (VsU_WsU_sshared) dies: F-Q3-2
         forces the Thales frame, then the foot of the perpendicular
         from V onto chord WU is U itself, so intO1 has no point at
         radius ‖UV‖ from V. z3 subsystem unsat (check_kq33.py) with
         even a single intO1 member. 1 class.
       - F-Q3-2 mirror-pair forcing PROVEN (incl. Thales-frame forcing
         for {U, shared-s}).
       - check_kq34.py: the anchored single-ident subsystems (V0o2_WV0_o2i
         and V0U_WVo1_o1i shapes) are z3-SAT at skewed apexes — NOT kills
         at 1-aux-point granularity; realization gap was menu coverage.
4. [x] Factory v3 (factory.py): staged generators with full backtracking
       (the v2 defining-sample regression fixed); split ps/qs tail; qs
       subset-retry for convexity; wiggle-outer angularly-diverse
       circle_cands; U_SKEW (right-angle frames) + u_conic_ident
       (rational two-circle intersections via duv = 4b²/(a²+b²)) +
       u_thales fixed (was returning [] — rotations of V land below the
       axis; rotate W instead). Rational witnesses: 47 (full sweep)
       + residue passes ongoing (52+ at last count); merge mode:
       `factory.py <class ids>` updates factory_raw.json in place.
5. [x] verify.py: all 47 sweep witnesses VERIFIED through official
       build_w2c + verify_exact (sympy exact), 0 failures, mutation
       control rejects. RE-RUN after the final residue pass to cover
       late witnesses.
6. [x] specials.py: all 4 NEEDS-SPECIAL classes VERIFIED over Q(√3) with
       per-class mutation controls (specials_witnesses.json):
       VWU_WVU (equilateral apex), VW0_WVo1_o1i, VWU_WVo1_o1i (both:
       rv2=rw2=1 force ident z=(1/2,√3/2)), VWo2_WVo1_o2d_o1i (hand
       witness at U=(1/5,6/5) — auto-aim misses the feasible corner).
       These classes are NEEDS-SPECIAL by PROOF: the ident point on both
       unit circles is (1/2,±√3/2), never rational.
7. [~] Residue resolution.
       7a. [x] K-Q3-5 machine-checked lemma-by-lemma
       (check_kq35_lemmas.py: L1 sum bound, L2 dV²+dW² ≥ 1 nonobtuse,
       L3/L3′ strict cap-interior bounds — all z3-unsat on negations;
       chaining is linear arithmetic). Factory guard isv=='shared' →
       K-Q3-5 landed; retally CONFIRMED: 63 witness + 15 KILLED-PROVEN
       + 4 NEEDS-SPECIAL + 5 residue. verify.py re-run: ALL 63
       witnesses VERIFIED, 0 failures, mutation control rejects.
       7b. [x] TRUE residue (5) ALL REALIZED: right-angle apexes are
       provably order-dead (at ux∈{0,1} the last-p exit turn p·U < rv2
       contradicts I-DISK exactly — the residue4 sweep aimed at the
       wrong apexes; check_kq34's SAT models are order-free), so a
       float feasibility probe over the OFFICIAL encoding
       (float_resid.py: build_w2c lambdified, SLSQP multistart) found
       full-window float points for all 5 classes; rationalize_resid.py
       (ident point via rational circle parametrization pins the radii;
       members by exact rational rotations; margin-polished to 5e-4)
       produced exact rational witnesses, ALL 5 VERIFIED via
       build_w2c + verify_exact with mutation controls
       (resid_witnesses.json). eq_ideal step moot: verified witnesses
       are variety points with nonzero separators, so C-EMPTY is
       impossible for the witnessed subcases.
       CLASSIFICATION COMPLETE: 87 = 68 witnessed (63 factory +
       5 rationalized) + 4 NEEDS-SPECIAL (Q(√3), verified) +
       15 KILLED-PROVEN. Zero unresolved.
8. [x] Composition retest (q3_token.py): q2_token model + the Q3 joint
       kills on all three Moser pairs (K-Q3-5 no shared member in the
       common cap; K-Q3-1 no cross-cap shared pair; both transfer by
       cap relabeling), ALL unordered cap profiles per n (broader than
       q2_token's one profile). Verdict: SAT at every n = 12–16 for
       both K_proven and K_plus (q3_token_{proven,plus}.json) — the
       joint kills do NOT close the token-level D1 evasion.
9. [x] Falsifier gate (falsifier_gate.py): kills checked GEOMETRICALLY
       (config MEC computed, nonobtuse boundary triangles enumerated,
       strict chord-sign cap membership + I-DISK) against W15/W16
       lattice + W16/W20 ring witnesses (t1, t1b, t9 files): 396
       nonobtuse MEC triangles, ZERO killed-type realizations — GATE
       PASS. Note: cube-level cap LABELS in those witnesses do not
       carry chord geometry (labeled triangles can be off-MEC); a
       label-level check false-alarms — the gate must be geometric.
10. [x] report.md written; verdict folded into the current closure plan's
       A.3/Candidate-D narrative. PROBE COMPLETE.
11. [x] Permanent checkpoint (2026-07-13): `checkpoint.py` exact-replays
       all 68 rational and 4 Q(sqrt(3)) realized windows with mutation
       rejection, verifies all 44 stored profile/tier SAT assignments,
       pins input SHA-256 digests, and re-runs the repaired falsifier gate
       (9 configurations, 396 nonobtuse triangles, zero findings). The
       checkpoint explicitly does not replay the 15 hand/Z3 kill proofs and
       does not promote token SAT to a full configuration. ATAIL-Q3 is a
       DONE-NEGATIVE decider; ATAIL-FORCE remains open on a selection-robust
       full-filter, multi-window, or critical-row producer.

## Environment

`uv run --with sympy --with z3-solver python` (no sympy/z3 in the project
venv); msolve at /opt/homebrew/bin/msolve. All solver artifacts in runs/.
