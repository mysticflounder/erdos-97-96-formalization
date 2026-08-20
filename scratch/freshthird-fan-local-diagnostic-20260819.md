# FreshThird fan-local diagnostic — 2026-08-19

Status: bounded theorem-mining evidence; no cut is admitted and no Lean result
is claimed.

The v2 order-refined canary left `fan_local_0` as the isolated source replay
family in all four cells. This diagnostic partitioned its 46 tracked conjuncts
directly from the source payload: four local structural facts, 38
deletion/incidence relations, and four blocker-row deletion facts. Each
deletion trial used a fresh solver with only the retained conjuncts and the
complete v2 model signature.

All four cells shrink to the same singleton:

`fan_local_0` → `blocker_center_interior`.

Thus the immediate missing CNF predicate is the source fact that the first
fan blocker center lies in its selected blocker cap. The v1/v2 vocabulary
already has `blocker_cap_i` and `interior(blockerCenter_i, cap)` literals; the
new v3 namespace should add the three source-mapped implications
`blocker_cap_0 = cap → interior(blockerCenter0, cap)` for `cap = 0,1,2`.
Do not add only the index-0 form generically: the source packet supplies the
same guarded fact for each of the four blocker rows, so the candidate
refinement must include all four indices or record a narrower antecedent.

Run root:
`scratch/runs/freshthird-fan-local-diagnostic-20260819/canary-0001/`.
