# Exact-five opposed-turn profile mine v1

## Boundary

This deterministic lane authenticates and replays the completed 2,798-profile
order run at
`scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001`.
It uses no solver transport. Its findings concern only the authenticated order
formulas, alias profiles, and individual engine cells. It explicitly makes no
theorem, source-realization, source-completeness, Lean-ingress, or promotion
claim.

The lane is `exactfive-opposed-turn-profile-mine-20260903`; the run is
`run-0002`. Default output is silent, `--verbose` prints canonical JSON, and
errors go to stderr. `--init-only` creates or verifies only the run manifest.

## Parent authentication

The analysis pins and checks the parent manifest, launch, terminal, profile
stream, producer and input source digests, and both controls. All 2,798
terminal profile links are checked against create-once result trees with exact
query reconstruction, receipt/result custody, engine-cell accounting, and the
parent's exact rational SAT readback verifier. The analysis reparses every SAT
cell's exact values and replays its rank and distance assignment before using
its ranks. Parent input directory ancestry is checked for repository
containment, real directories, and absence of symlink traversal.

## Deterministic filter and turn test

For each profile, row roles are reconstructed from the authenticated role-to-
class map. The structural filter retains precisely those profiles satisfying

```text
c2 ∈ T0   and   T0 ∩ K1 ⊆ {a,c2}.
```

Here `T0` and `K1` denote their source support sets, and the subset test is on
profile quotient classes. The authenticated `K1` center is `c1`; that
profile-local role is `B` for the turn test.

For every SAT engine cell in a retained profile, cyclic ranks determine the
signs of

```text
signedArea(B,O,c2), signedArea(B,O,w), signedArea(c2,O,w)
```

for `w=u,v`. A cell matches when one candidate's latter two nonzero signs both
oppose the first sign. A retained SAT-bearing profile is killed only when
every one of its SAT engine cells matches.

The required recomputed totals are:

- 558 structurally retained profiles;
- 34 SAT-bearing profiles and 56 SAT engine cells;
- 50 matched SAT engine cells;
- 28 profiles whose every SAT cell matches; and
- residual indices `360, 363, 376, 467, 470, 483`.

Residual engine identity is pinned as well. Profiles 360 and 467 have a
nonmatching Z3 SAT cell and a matching cvc5 SAT cell. Profiles 363, 376, 470,
and 483 have one nonmatching Z3 SAT cell and a cvc5 UNKNOWN cell. Any count,
outcome, order, or engine-identity drift fails closed.

## Durable output and safety

The run publishes one self-hashed record for each of the 2,798 profiles, plus
create-once launch and terminal records. A parent-authentication or mid-run
verification failure leaves prior records intact and publishes a self-hashed
incomplete-failure record identifying its stage; it is never overwritten or
resumed in place.

Every create-once write checks the completed descriptor with `fstat`. Manifest,
launch, terminal, profile, and failure publications are reread as single-link
regular files and checked against their expected canonical JSON. Ordinary
exceptions after safe run-root setup enter the same failure-custody path;
process-control exceptions are not intercepted.

Repository containment and every existing ancestor are checked before and
after root creation. The repository root, run root, output classes, and profile
output directory must be real directories rather than symlinks or other file
types. Every source and output artifact must be a single-link regular file.
The `artifacts`, `events`, and `tmp` subtrees reject unknown files and
directories before execution or resume. A successful terminal requires all
2,798 expected profile filenames, exactly the launch and terminal event files,
and an empty temporary subtree.
