# First-apex strict-pair completion audit

Status: exact theorem-discovery result inside the pinned fixed-card-12 finite
shadow; not a live producer proof.

The current-bank-clean `(5,5,5)` stream has 23 saved survivors.  In its pinned
frame the surplus cap is `S`, the first opposite apex is label `1`, and the
strict interior of its opposite cap `O1` is `{6,7,8}`.  Across the three
unordered pairs in that triple and all 23 survivors:

- 25 pair equalities are already present in the saved equality closure;
- each of the other 44 one-equality extensions immediately hits an existing
  Lean metric consumer;
- the first hit is `DuplicateCenterCore` in 30 cases and
  `ExactOffCircleCore` in 14 cases; and
- there are no uncovered nonexisting strict-pair equalities.

Replay the hash-pinned audit with:

```bash
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/apex-strict-pair-completion/analyze.py --check
```

This is a better match to the bi-apex descent than the label-varying U1
near-match: a nontrivial descent can expose an alternate first-apex radius and
therefore a new co-radial pair in the strict opposite cap.  The remaining
mathematical task is to prove that the live descent really exports a pair
whose equality is new relative to the relevant ambient exact row, or else to
consume the immediate-terminal branch separately.

The audit does not prove that the one saved placement covers the live
K-A-PAIR hypotheses, that an ambient global K4 row is exact, or that every
cardinality at least 12 reduces to this frame.  Those are precisely the
selection/extraction obligations that keep the result at theorem-discovery
status.

