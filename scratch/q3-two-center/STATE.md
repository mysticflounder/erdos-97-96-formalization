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
       E-K×I-DISK to be evidenced by witness + perturbation control in
       verify.py instead.
3. [x] K-Q3-1 PROVEN (kill_notes.md): double cross-identification classes
       (io2=ident ∧ io1=ident) die by two-circle mirror symmetry vs
       chord-VW cap signs. Machine cross-check: z3 unsat 0.0 s on the
       subsystem. F-Q3-2 mirror-pair forcing PROVEN (incl. Thales-frame
       forcing for {U, shared-s}).
4. [~] Factory v2 sweep: 6 KILLED-PROVEN (K-Q3-1 classes, machine
       cross-checked), 20 witness, 1 NEEDS-SPECIAL (VWU_WVU equilateral),
       60 no-witness-in-menu — REGRESSION vs v1 (47 witnesses): the v2
       defining-sample loops in try_assemble commit to the FIRST region
       sample that yields the side's specials and return None if plain
       placement later fails — no backtracking over samples (v1 iterated
       mu menus at top level). FIX NEXT: validate the full side assembly
       (specials + plains) inside the candidate-sample loop before
       committing, i.e. move the plains generation into the defining loop
       or retry the tail over samples. v1's 47 witnesses are in git
       history (factory_raw.json at the pre-v2 commit) if needed for
       cross-checking; v1 had the class_id shared/sep collision bug, so
       its per-class attribution for _ss classes is unreliable — regenerate
       rather than reuse.
5. [ ] verify.py: official-system exact verification of all witnesses
       (+ mutation control).
6. [ ] specials.py: exact-algebraic witnesses for NEEDS-SPECIAL classes
       (equilateral apex; rv2=rw2=1 identifications).
7. [ ] msolve equality-ideal step on class representatives (expected
       POSDIM everywhere; certificates only if surprises).
8. [ ] Composition retest (token level, q2_token.py pattern) with the
       K-Q3-1 kill granted, n = 12–16.
9. [ ] Falsifier gate on any reported kill (W20 + lattice witnesses —
       note: those witnesses are non-convex, so order-decorated kills get
       the equality/cap/disk-only applicability check; K-Q3-1 uses no
       order constraints, so the full check applies).
10. [ ] report.md + fold into plan §7 D3 / ledger, commit.

## Environment

`uv run --with sympy --with z3-solver python` (no sympy/z3 in the project
venv); msolve at /opt/homebrew/bin/msolve. All solver artifacts in runs/.
