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
7. [~] Residue after passes 1–3: 13 no-witness classes. 8 of them are
       ALL the remaining isv='shared' classes → KILLED by K-Q3-5
       (kill_notes.md: shared intS member forces ρV²+ρW² ≤ 1 via the
       parallelogram identity while opposite-cap members force
       ρV²+ρW² > dV²+dW² ≥ 1; hand-PROVEN, subsumes K-Q3-3).
       7a. PENDING: lemma-level machine checks for K-Q3-5 (full
       3-aux-point subsystem is z3-unknown; check the three small
       lemmas separately: sum bound, dV²+dW² ≥ 1, strict lower bounds).
       Then mark the 8 classes KILLED-PROVEN in factory (guard
       isv=='shared' → K-Q3-5) and re-tally: 63 witness + 15 killed +
       4 special + 5 residue. Remaining TRUE residue (5): V0o2_WV0_o2i,
       V0o2_WVo1_o2i_o1d, VWU_Wso1_o1i, VWo2_Wso1_o2d_o1i,
       Vso2_Wso1_o2d_o1i_ssep — targeted hand witnesses (the
       check_kq34.py shapes are z3-SAT, so realizable-shaped) or
       UNRESOLVED (treated LIVE). msolve equality-ideal step on class
       representatives (expected POSDIM; certificates only if
       surprises).
8. [ ] Composition retest (token level, q2_token.py pattern) with the
       K-Q3-1 + K-Q3-3 kills granted, n = 12–16.
9. [ ] Falsifier gate on the kills (W20 + lattice witnesses): K-Q3-1 uses
       radii + cap signs only; K-Q3-3 additionally I-DISK + I-OBT + H1
       count — neither uses ORDER constraints, so the full applicability
       check applies to both.
10. [ ] report.md + fold into plan §7 D3 / ledger, commit.

## Environment

`uv run --with sympy --with z3-solver python` (no sympy/z3 in the project
venv); msolve at /opt/homebrew/bin/msolve. All solver artifacts in runs/.
