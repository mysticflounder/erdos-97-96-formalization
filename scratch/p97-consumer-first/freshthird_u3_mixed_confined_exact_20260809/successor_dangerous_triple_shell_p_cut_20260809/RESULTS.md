# Results: universal shell-p cut successor wave

Status: `EMPIRICALLY VERIFIED`, exhaustive in the finite eight-label support
abstraction of the mixed/no-shift arm only. This is not a geometric
counterexample, universal closure, or Lean closure.

## Encoding audit and smoke gate

Critical-four-shell rows use the parent runner's exact four-label support and
carry `closure[x] = (x ∈ support)` for all eight labels. Thus the new theorem
field `shell_p_at_most_two` is encoded as actual support membership: among all
six audited rows, at most two rows may both be in mode `S` and contain `p`.
It is not a mode-only proxy.

Before admitting the new cut, the runner reproduced the prior census exactly:
1,552,476 support tuples, including `QQQQQQ = 468` and `SSSSSS = 216`.
This passed the known-result smoke gate.

## Exact wave verdict

- 64/64 mode vectors exhaustively checked.
- 63 mode vectors remain SAT in the abstraction.
- `SSSSSS` is UNSAT in the abstraction: all 216 pre-cut tuples are removed.
- The cut removes 65,520 of 1,552,476 pre-cut tuples across 42 mode vectors,
  leaving 1,486,956 tuples.
- Z3 and cvc5 agree on every mode vector: 63 SAT and one UNSAT.
- `readback.py` independently reconstructed the domains, recounted all 64
  arms, and checked every retained example.

The cut is therefore non-vacuous and gives one finite mode exclusion: a
source-extracted mixed pattern cannot have all six rows in critical-shell
mode. Equivalently, at least one audited row must be q-deleted. A small finite
Lean consumer proving that existential mode statement is the immediate
promotion candidate. It still needs a geometric consumer that turns the
q-deleted row, together with the live exact-radius obstruction and no-shift
antecedent, into an escaping shift or contradiction.

## Surviving motifs

Grouped by total shell-row count, the surviving support motifs are:

| shell rows | shell rows containing `p` | q-deleted rows containing `p` | tuples |
|---:|---|---|---:|
| 0 | 0 | 3–4 | 468 |
| 1 | 0–1 | 2–4 | 35,928 |
| 2 | 0–2 | 1–4 | 483,732 |
| 3 | 0–2 | 0–3 | 806,520 |
| 4 | 1–2 | 0–2 | 155,664 |
| 5 | exactly 2 | 0–1 | 4,644 |
| 6 | none survive | none | 0 |

The highest-shell survivors are therefore rigid: every five-shell model has
exactly two shell supports containing `p`, while the unique q-deleted row may
or may not contain `p`. That is the smallest remaining finite motif family to
target after promotion of the all-shell exclusion.

## UNSAT minimization

For `SSSSSS`, the six source clause families were deletion-tested over all 64
subsets with fresh Z3 instances. Two syntactically distinct inclusion-minimal
UNSAT families remain, and cvc5 independently returns UNSAT on both:

1. exact card-four supports + all-shell mode + `q` membership + dangerous
   circle intersection at most two + pairwise row overlap at most two + the
   shell-`p` at-most-two cut;
2. the same family with “at least two off-circle labels” replacing the
   dangerous-circle cap.

Those two formulations are equivalent here because every support has cardinality
four and the dangerous-circle/off-circle label sets partition the eight labels.
Center omission is not required for the all-shell finite contradiction.

## Reproduction

From this directory:

```text
uv run python enumerate_successor.py
uv run python readback.py results.json
uv run python analyze_wave.py
```

No successor wave was started. A mandatory fresh global theorem-bank search is
required before any later CEGAR wave.
