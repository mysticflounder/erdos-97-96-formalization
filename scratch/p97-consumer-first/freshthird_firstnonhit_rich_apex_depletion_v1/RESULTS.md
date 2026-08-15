# Results

## Outcome

`SAT_LOCAL_PACKET` for the first source-allowed alias-aware `2+1` arm.

The bounded rational-rotation search found this exact witness:

| role | x | y |
|---|---:|---:|
| `q` | 0 | 0 |
| `p` | 1/2 | 1 |
| `k0` | 1 | 0 |
| `k1` | -3/5 | 4/5 |
| `k2` | -4/5 | 3/5 |
| `k3` | 24/25 | -7/25 |
| `r1a` | 3/10 | -1/10 |
| `r1b` | -3/13 | 2/13 |
| `r2a` | -39/50 | 27/50 |
| `r2b` | -71/85 | 63/85 |

The rational-rotation parameters are `1/7`, `-1/8`, `-1`, and `-7/6`.
The strict CCW boundary is:

```text
r2b, k2, r2a, r1b, q, r1a, k3, k0, p, k1
```

Exact readback verifies:

- the `q`-unit circle contains exactly `k0,k1,k2,k3` among the ten points;
- the squared-`p`-radius `5/4` class is exactly
  `q,k0,k1,r1a,r1b`;
- the squared-`p`-radius `37/20` class is exactly
  `k2,k3,r2a,r2b`;
- `V={k0,k1,k2}` has radius partition `2+1`;
- deleting `V` leaves exactly three members in each represented class;
- restoring any single member of `V` gives exactly four members in its class;
- `q` and `k3` realize the allowed survivor aliases; and
- all ten named points are pairwise distinct strict convex-hull vertices.

The exact checker performs this validation three times: once from the generated
witness record and once from each solver's returned rational model.

Z3 4.16.0 and cvc5 1.3.3 both return:

| artifact | expected | Z3 | cvc5 |
|---|---:|---:|---:|
| pinned `2+1` witness | SAT | SAT | SAT |
| independent known-SAT control | SAT | SAT | SAT |
| malformed q-shell membership | UNSAT | UNSAT | UNSAT |
| malformed deleted-class count | UNSAT | UNSAT | UNSAT |
| malformed strict convexity | UNSAT | UNSAT | UNSAT |

## Interpretation

The rich-apex equality depletion packet is locally metric-consistent even after
adding exact class multiplicities, minimal one-point restorations, all named
q-shell nonmemberships, pairwise distinctness, source-allowed aliases, and
strict convex position. Consequently those facts alone do not yield the direct
contradiction sought for FreshThird FirstNonHit.

This is not a P97 counterexample and not a universal non-derivability theorem.
The full source contains omitted global row/cap/blocker/order information. The
next useful obstruction must use at least one omitted global synchronization
fact, such as identifying the blocking center's canonical selected row with a
clean three-overlap consumer. No broader radius partition was searched because
the first permitted arm already produced an exact witness.

## Reproduction checks

```bash
uv run python -m py_compile \
  scratch/p97-consumer-first/freshthird_firstnonhit_rich_apex_depletion_v1/run_wave.py \
  scratch/p97-consumer-first/freshthird_firstnonhit_rich_apex_depletion_v1/test_run_wave.py
uv run python -m unittest discover \
  -s scratch/p97-consumer-first/freshthird_firstnonhit_rich_apex_depletion_v1 \
  -p 'test_*.py' -v
uv run --with ruff ruff check \
  scratch/p97-consumer-first/freshthird_firstnonhit_rich_apex_depletion_v1/run_wave.py \
  scratch/p97-consumer-first/freshthird_firstnonhit_rich_apex_depletion_v1/test_run_wave.py
uv run python \
  scratch/p97-consumer-first/freshthird_firstnonhit_rich_apex_depletion_v1/run_wave.py
```

`SHA256SUMS` authenticates the complete handoff. The wave is deterministic and
runs solver jobs serially (`solver_concurrency = 1`).
