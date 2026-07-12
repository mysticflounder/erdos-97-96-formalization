# ATAIL-SUB2 — reconstructed SUB2-H statement (STEP 0)

Decider dispatch per `docs/audits/2026-07-12-ka-route-scoping.md:83-87` and
matrix row ATAIL-SUB2 (`docs/closure-matrix-2026-07-09.md:164`): "Decide the
seven-variable half-disk `SUB2-H` statement by hand proof or independently
checked CAD/QE."

## Sources (all read; statement is verbatim-reconstructible, no ambiguity)

1. `census/candidate_d_probe/kill_notes.md` §K-D — defining prose: sub-window
   SUB2 = "x, w_a, w_b ∈ L1 with ‖x−w_a‖ = ‖x−w_b‖ = ρ, both w on ONE side of
   x in the own block, disk + below-axis + all-triples order on
   (v2, block, v3), R² = 1/4 + ω² substituted, ω ≥ 0", plus the PROVEN
   H-reduction: "every ω ≥ 0 lens is contained in the ω = 0 lower half-disk
   H = {p₀² + p₁² ≤ p₀, p₁ < 0}, so SUB2-H (ω eliminated) UNSAT would
   suffice."
2. `census/candidate_d_probe/encoder.py:489-518` (`build_sub2`) — the
   authoritative constraint generator (closed disk `ge`, strict below-axis
   `gt`, `add_convex_order` on the 5-chain; sides `left`/`right`).
3. `census/candidate_d_probe/runs/SUB2_left.smt2`, `runs/SUB2_right.smt2` —
   the emitted ω-carrying systems (8 declared reals incl. `oy`); SUB2-H is
   exactly these with `oy = 0`, leaving the 7 variables
   `xx, xy, wax, way, wbx, wby, rho2` (matches "7-var NRA sentence",
   `census/candidate_d_probe/STATE.md:102`).
4. `census/candidate_d_probe/float_probe_sub2.py:2-5` — H-form restated:
   "(v2, w_a, w_b, x, v3) convex CCW (all 10 triples positive), w_a, w_b, x
   in the open lower half-disk H ..., |x−w_a| = |x−w_b| = rho. 2-left
   pattern; 2-right is its mirror."
5. `census/candidate_d_probe/report.md:92` (terminal solver record),
   `census/candidate_d_probe/sub2_results.json`,
   `runs/SUB2_{left,right}.cvc5.out` — prior status: solver-UNDECIDED,
   CONJECTURED-UNSAT on float evidence.
6. Dead-ends registry `docs/dead-ends.md:786-815`
   (`doubleapex-card12up-per-type-window-kills`) — SUB2 recorded as
   CONJECTURED-UNSAT, 7-var NRA, infimum-zero boundary; and the K-A
   one-sided-sup WARNING (not consumed here).

## The statement (exact)

Fix v2 = (0,0), v3 = (1,0). Let

  H := { p ∈ ℝ² : p₀² + p₁² ≤ p₀ and p₁ < 0 }

(the strictly-below-axis part of the closed disk with diameter [v2,v3];
closed on the circle per `build_sub2`'s `ge`, strict below the axis per its
`gt`). Variables: x = (xx, xy), w_a = (wax, way), w_b = (wbx, wby), rho2 —
seven reals.

**SUB2-H-left**: the conjunction
- E-PKT: ‖w_a − x‖² = rho2, ‖w_b − x‖² = rho2;
- I-POS: rho2 > 0;
- H-membership: x, w_a, w_b ∈ H (three closed-disk inequalities
  p₀ − p₀² − p₁² ≥ 0 and three strict below-axis inequalities p₁ < 0);
- I-ORD: all 10 triples (i<j<k) of the sequence
  σ_L = (v2, w_a, w_b, x, v3) have signedArea2 > 0, where
  sA2(v,vj,vk) = (vj₀−v₀)(vk₁−v₁) − (vk₀−v₀)(vj₁−v₁).

**SUB2-H-right**: same with σ_R = (v2, x, w_a, w_b, v3).

**SUB2-H (the ATAIL-SUB2 object)**: both systems are UNSAT.

Note the below-axis strictness of σ-triples with both v2 and v3 coincides
with the H-strictness (sA2(v2, p, v3) = −p₁), so the encodings in
`runs/SUB2_*.smt2` assert some atoms twice; the conjunction above is
semantically identical to those artifacts at `oy = 0` (checked term-by-term;
see `encoding.py` cross-check).

## Downstream semantics (why UNSAT suffices, and what it kills)

PROVEN reduction chain (kill_notes K-D + formulation.md §3): in any full
decorated window whose own block places two packet members on the same side
of the center x, the SUB2 constraints (with ω) form a SUBSET of the window
constraints (subsequence triples of I-ORD are asserted by I-ORD; E-PKT,
I-DISK, own-cap-side, ω ≥ 0 are all leaf-implied), and the ω ≥ 0 lens embeds
in H (2ωp₁ ≤ 0 term). Hence SUB2-H UNSAT ⟹ SUB2 UNSAT ⟹ kills, per the
K-D dependency map: (0,3,0,1), (0,4,0,0), (1,3,0,0) outright; the k ∈ {0,2}
(non-straddle) cases of the s = 2 classes (0,2,0,2), (0,2,1,1); and
(1,2,0,1)'s k ∈ {0,2} cases. It does NOT decide (1,2,0,1) k = 1 (straddle),
which stays open, and it must NOT kill straddle (k=1) witnesses — banked
realizable: `witnesses.json` "0202"/"0211" (k=1).

## Ambiguity notes (resolved, not blocking)

- "Seven-variable" vs the 8-declared-variable SMT artifacts: SUB2-H is the
  ω-eliminated (oy = 0) form per kill_notes K-D and STATE.md:102. Resolved.
- Closed vs open disk: encoder (authoritative) uses the CLOSED disk; the
  float probe used open ε-margins only as a conservative witness hunt.
  The decision below proves the CLOSED-disk version (the stronger UNSAT),
  which subsumes every sub-region variant.
- Doc discrepancy recorded (not blocking): `report.md:102` and
  `docs/dead-ends.md:806-808` list "s = 2 straddle-only" among PROVEN cuts,
  while `kill_notes.md` K-D and `STATE.md:58-59` mark its kill direction
  (k ∈ {0,2}) as riding SUB2, i.e. CONJECTURED at probe time — the PROVEN
  content there was realizability of the straddle form only. The present
  SUB2-H decision makes the kill direction PROVEN either way, mooting the
  discrepancy going forward.
