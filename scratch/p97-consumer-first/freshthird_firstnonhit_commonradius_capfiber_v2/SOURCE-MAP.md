# Source map and guard audit

The rows below are the complete hard-clause map for `runner.py`.

| source clause | encoded variables/guard | audit note |
|---|---|---|
| C/Q source distinctness | `c0 != c1`, `q0 != q1` | direct source clauses |
| selected support | `K_i`, `ΣK_i = 4`, all named sources in `K` | exact bounded row support |
| canonical cap | `Cap_i`, C sources and `b` in `Cap` | no cap geometry or order |
| cap intersection | `K_i ∧ Cap_i → i=c0 ∨ i=c1` | with C membership gives equality |
| witness existence | `Distinct(u0..u3)`, `Cap(ui)`, `¬K(ui)` | at-least four; no exhaustion |
| common-radius class | positive equal radius atoms for C sources | no metric lift |
| alias split | four equality arms or exact named shell and Q outside cap | malformed and alias controls retained |
| same-blocker rows | C0/C1 support literals equal K and blockers equal b | source-faithful for this named arm |
| distinct-blocker row rule | R0/R1 card4, own source, pair overlap ≤2 | only materialized diagnostic rows |
| cap-fiber bound | all named triples in Cap with blocker b forbidden | named-source bound, not a carrier theorem |

No clause mentions old `v*`, `blocked_after_v`, `shared_arm`, `pair*`, or
`core_arm` fields. The encoder never assigns a blocker to a `ui` unless a
control explicitly asks for it, and the regression control asks for a
non-`b` blocker.

The named-row negative query is therefore a bounded query over rows already
asserted in the model. It does not quantify over all carrier sources and does
not negate the Lean target.
