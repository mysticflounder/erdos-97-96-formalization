Rich-radius v2 minimization finished (fixed exact-17 assignment only).

Global tracked extraction from all 921 canonical clauses, followed by fresh
deletion and every drop-one replay, leaves the four-clause subset-minimal core:

- k4_equal_12_7: the arbitrary global-K4 witness at center 12 equates points
  3 and 7;
- rich_equal_2_0_7: point 7 is on D44 arm-0 radius;
- rich_equal_2_1_3: point 3 is on D44 arm-1 radius;
- rich_distinct_2: those two radii differ.

This is a transitive equality-chain contradiction, not a direct syntactic
formula/negation pair (there are none among all 921 clauses). Z3 CLI, cvc5
QF_NRA/nl-cov, and fresh internal Z3 all return UNSAT on the four clauses. All
four drop-ones return SAT in both CLIs and pass exact Z3 substitution plus
independent Fraction replay.

Packet minimization leaves 3 of 14 source packets (66 clauses): K4 common
radius, strict-cap rich-slice common radius, and D44 distinct radii. The packet
core is dual-UNSAT; all 3 packet drop-ones are dual-SAT with both exact checks.
Known SAT/UNSAT controls and all four malformed parent controls pass; all SMT
files have one check-sat; deterministic rerun preserved the SMT aggregate
hash.

Incidence defect: apex2=12, cap2={3,4,7,9,13,15}, D44 slices {7,9}/{3,4},
but arbitrary point_k4_rows[12]={3,4,7,9} crosses both arms. Production Lean
already rejects this via
selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six
(ExactFifteenApexProfile.lean:341), with direct radius uniqueness/disjointness
APIs selectedClass_radius_unique_of_mem and
selectedClass_disjoint_of_radius_ne. Reusable preflight cut: at a six-point
D44 cap, a selected equal-distance K4 support cannot cross the two rich arms;
it must equal one rich class.

Classification: encoder preflight/consumer finding only, not a live positive
producer, CE, universal theorem, or Lean closure. Full bundle is under
post_core_cut_v2/rich_core_minimization/README.md. No refinement was launched.
