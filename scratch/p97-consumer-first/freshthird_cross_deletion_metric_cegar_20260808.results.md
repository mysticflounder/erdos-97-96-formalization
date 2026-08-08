# FreshThird cross-deletion metric CEGAR (2026-08-08)

trust: source-faithful structural complement plus exact QF_LRA; cvc5 agreement required before blocking
closure_rule: only structural UNSAT after exact blocks is finite abstraction coverage; metric-SAT/unknown/unverified models remain survivors
quotient: none; all branches enumerated (no unproved S4 symmetry assumption)
branch_limit: 1
branches_examined: 1
branch_limit_hit: True
structural_iterations: 1
metric_counts: {'unsat': 1}
status_counts: {'metric_unsat_unverified_survivor': 1}
max_models_per_branch: 1
timeouts_ms: structural=2000, metric=15000
verified_cut_count: 0
verified_cut_widths: []
cut_cache_reuse: 0/0 (0.000)
bank_schema_counts: {}

## First branch traces

{'branch': 1, 'order': 'outside_fresh_between_source_canonical', 'fresh_cap': 1, 'row_cap': 1, 'cap_pair': '0-1', 'mutual_pair': '0-2', 'models_checked': 1, 'metric_unsat_blocks': 0, 'block_widths': [], 'last_metric': {'result': 'unsat', 'occupied': 23, 'metric_assertions': 228, 'active_directions': 'cross:1->0,mutual:0->2,mutual:2->0', 'core_initial': 14, 'core_minimized': 6, 'cut_width': 28, 'cut_terms': ['pure_rank_a0_0', 'pure_rank_a0_1', 'pure_rank_a0_2', 'pure_rank_a1_0', 'pure_rank_a2_0', 'pure_rank_a2_2', 'pure_rank_a3_0', 'pure_rank_a3_1', 'pure_rank_b1', 'pure_rank_b2', 'pure_rank_b3', 'pure_rank_c2', 'pure_rank_canonicalSource', 'pure_rank_drowCenter', 'pure_rank_e0', 'pure_rank_e1', 'pure_rank_e2', 'pure_rank_e3', 'pure_rank_f1', 'pure_rank_f2', 'pure_rank_freshCenter', 'pure_rank_qBetween', 'pure_rank_qOutside', 'pure_rank_sourceCenter', 'pure_rank_w0', 'pure_rank_w1', 'pure_rank_w2', 'pure_rank_w3'], 'cvc5_result': 'timeout', 'cvc5_smt2': '/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/p97-consumer-first/freshthird_cross_deletion_metric_cegar_20260808.core.smt2', 'core_reused': False}, 'status': 'metric_unsat_unverified_survivor', 'survivor': {'summary': {'alias_classes': 'qOutside/pinnedCenter,qBetween/drowCenter,canonicalSource/e1,w3/b0,w2/b3', 'blocker_caps': '2202', 'blocker_rows': '1000,0100,0010,0001', 'cap_profiles': 'pinnedCenter:001,drowCenter:011,w0:100,w1:100,w2:001,w3:001,e0:010,e1:001,e2:100,e3:010'}, 'missing': {'insufficient_shared_support_points': 6, 'no_two_center_motif': 1}, 'distinct_center_pairs': 6, 'shared_pairs': 0}}

elapsed_seconds: 32.334
