# Results

The authoritative narrative is in [`README.md`](README.md). In brief:

| Input | Prover | Result |
|---|---|---|
| `firstnonhit_base.in` | Mace4 `-n 4 -N 8 -m 1` | model at displayed domain 7 |
| `firstnonhit_base.in` + `$false` | Prover9 `-t 30` | `SEARCH FAILED` (incomplete) |
| `control_three_overlap` | Vampire default | `SZS status ContradictoryAxioms` |
| `control_three_blocked` | Vampire default | `SZS status ContradictoryAxioms` |
| either control | Prover9 `-t 10` | `SEARCH FAILED` (incomplete) |

The model shows that the source-clean incidence packet admits the
same-blocker collapse and does not produce the required distinct-center
three-overlap. The controls are synthetic malformed/positive landing tests,
not new P97 producers. No Lean closure follows.
