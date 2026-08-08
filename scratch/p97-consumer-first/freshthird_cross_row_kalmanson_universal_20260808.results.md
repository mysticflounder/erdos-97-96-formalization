# FreshThird cross-row Kalmanson coverage query (2026-08-08)

trust: source-faithful configured branch slice; no universal conclusion
coverage: schemas=4, blocker_pairs=6, cap_witnesses=3, directions=2, row_permutations=6, six-index-orders=all strict chains
branches=1
counts={'sat_survivor': 1}
survivors_recorded=1

## traces

{'branch': 1, 'order': 'outside_fresh_between_source_canonical', 'fresh_cap': 1, 'row_cap': 1, 'cap_pair': (0, 1), 'mutual_pair': (0, 1), 'lazy_motif_cuts': 0, 'verified_metric_cuts': 5, 'result': 'sat_survivor_under_complement', 'rank_model': {'qOutside': 6, 'qBetween': 11, 'canonicalSource': 22, 'c2': 12, 'f1': 10, 'f2': 1, 'sourceCenter': 17, 'freshCenter': 9, 'pinnedCenter': 6, 'drowCenter': 11, 'w0': 2, 'w1': 5, 'w2': 19, 'w3': 10, 'e0': 13, 'e1': 1, 'e2': 9, 'e3': 7, 'b0': 18, 'b1': 14, 'b2': 20, 'b3': 0, 'a0_0': 10, 'a0_1': 7, 'a0_2': 8, 'a1_0': 6, 'a1_1': 4, 'a1_2': 3, 'a2_0': 21, 'a2_1': 13, 'a2_2': 6, 'a3_0': 15, 'a3_1': 8, 'a3_2': 6}, 'metric_replay': 'unsat', 'metric_stats': {'cvc5_result': 'timeout', 'core_minimized': 8, 'cut_width': 28, 'cut_terms': ['pure_rank_a0_2', 'pure_rank_a1_0', 'pure_rank_a1_1', 'pure_rank_a1_2', 'pure_rank_a2_0', 'pure_rank_a3_0', 'pure_rank_b0', 'pure_rank_b1', 'pure_rank_b2', 'pure_rank_b3', 'pure_rank_c2', 'pure_rank_canonicalSource', 'pure_rank_e0', 'pure_rank_e3', 'pure_rank_f1', 'pure_rank_f2', 'pure_rank_freshCenter', 'pure_rank_pinnedCenter', 'pure_rank_qBetween', 'pure_rank_qOutside', 'pure_rank_sourceCenter', 'pure_rank_w0', 'pure_rank_w1', 'pure_rank_w2', 'pure_rank_w3', 'shell_0_contains_w0', 'shell_0_contains_w3', 'shell_1_contains_w1'], 'core_reused': False}}
