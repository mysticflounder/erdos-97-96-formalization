# Current exact-core small-motif audit

Date: 2026-07-14

Status: **EXACT RELABELING AUDIT; NO SMALL CONTRADICTION PRODUCER FOUND.**

## Result

`analyze.py` combines the 8 six-row, 11 seven-row, and 3 eight-row saved
equality subsystems from the current 23-shard stream.  Every one of these 22
subsystems has already been replayed as `CROSSCHECKED_UNIT` by Singular and by
msolve in both variable orders.

For every connected subset of two, three, or four retained equalities that
uses at least two centers, the checker computes an exact point-relabeling
isomorphism key.  Centers are distinguished from the two symmetric endpoints
of an equality.  The totals are:

| equalities | distinct connected motifs | motifs present in all 22 cases |
|---:|---:|---:|
| 2 | 6 | 4 |
| 3 | 65 | 22 |
| 4 | 937 | 8 |

The universal four-equality motifs are all weak radial chains.  A typical
one consists of two three-point radial classes at two centers sharing one
point.  Such a packet is plainly Euclidean-realizable and is not a collision
theorem.  The other universal motifs have the same issue: their recurrence
comes from dense row equality closure, not from an inconsistent local core.

Therefore the 22 distinct whole-core classes do hide recurring small
submotifs, but none of the recurring motifs through size four is a usable
producer or a new metric contradiction.  A successful compression must use
a larger closure completion, an order/cap field, or a theorem that forces one
of the existing bank cores from one of these weak chains.

## Rigor boundary

- Exact: source digests, subset enumeration, connectedness filter, and
  relabeling canonicalization for the listed motif sizes.
- Previously exact within the equality shadow: each complete saved subsystem
  is `CROSSCHECKED_UNIT` over `QQ`.
- Not claimed: deletion minimality of every saved subsystem, a Euclidean or
  convex realization of a complete subsystem, a Lean theorem, or a producer
  covering the live K-A hypotheses.

## Replay

From the repository root:

```text
.venv/bin/python \
  scratch/atail-force/current-core-motif-audit/analyze.py \
  --max-size 4 --check
```

The replay passes and pins all three source checkpoint digests in
`checkpoint.json`.
