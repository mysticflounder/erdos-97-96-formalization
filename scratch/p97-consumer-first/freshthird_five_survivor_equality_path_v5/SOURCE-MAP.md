# Replayable source map

| Encoded fact | Source label in JSON | Pinned source |
|---|---|---|
| Corrected exact-17 roles, rows, incidences, cardinalities, overlap bounds | `v2` | `freshthird_five_survivor_alias_aware_v2/run_query.py` and its ingress contract |
| Every selected named row omits its center | `row_center_omission` | v3 `row_center_omissions` |
| Aliased exact centers have equal exact support | `exact_center_alias` | v3 `exact_blocker_alias_constraints` |
| `C3,C4 in Cap`, and neither aliases `Q0,Q1` | `v4_endpoint` | pinned v4 `SOURCE-MAP.md` |
| Two support points in one named row have equal center distances | `named_row_equality` | `CriticalFourShell.support_eq_radius` / named row radius equality |
| A carrier point outside an exact support is off that exact radius | `exact_offsupport` | exact support for PRow, PRhoRow, S0Row, S1Row, DBRow only; generic blocker interface `GeneralCarrierBridge.exactAt_blocker` |

Each learned-cut record in `results.json` and `journal.jsonl` contains its
exact row, physical distance-edge path, row provenance per equality edge,
source atoms, and emitted Boolean clause.  `manifest.json` pins the v2, v3, and
v4 source-map hashes used by the run.

