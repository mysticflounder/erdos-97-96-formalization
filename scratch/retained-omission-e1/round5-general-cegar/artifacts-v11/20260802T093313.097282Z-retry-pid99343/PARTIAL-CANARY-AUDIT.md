# v11 partial canary audit

Status: **stopped; not a terminal matrix run**.

- Target: `Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
- v11 script SHA-256: `a5c01ed7bcf8e8ee012255bb21f85ee6f89852fdf5347cb87cc595a0c1b81c4f`
- schema SHA-256: `a1a20af7a83e81b2f286fb1e036f24e5bacd3639307fd7b90b3885e404f9340a`
- workers: 8, nice level 10
- requested full timeout: 600000 ms
- requested Boolean-prepass timeout: 30000 ms

The run was stopped after 16 case artifacts because the Boolean prepass never
reached a solver call. In all 16 cases:

- prepass status was `budget` with reason
  `boolean_wall_clock_budget_exhausted`;
- `solver_checks = 0`, `models_examined = 0`, `candidate_count = 0`;
- `learned_cut_count = 0` and `pre_first_check_power_cut_count = 0`;
- the initial and final Boolean formula hashes matched;
- the base-full, first-check, and final full-encoding hashes matched.

Boolean-relaxation construction/filtering took 119.595--122.247 seconds per
case (mean 121.030 seconds), already exceeding the nominal 30-second deadline.
The first eight full checks then returned `unknown`/`canceled` after about 729
seconds total per case. The next eight were interrupted during shutdown after
about 433 seconds total per case. Therefore the 16 result files are evidence
for prepass futility, not a completed 16-case result bank.

The exact process group was PGID 99311. It was terminated after resolving its
membership; no processes remained in that group afterward. There is no matrix
summary, and nine empty case directories were left by canceled queued work.

Conclusion: do not resume v11 unchanged. A replacement must first demonstrate
on one case that relaxation construction finishes and at least one Boolean
solver check occurs before any matrix launch.
