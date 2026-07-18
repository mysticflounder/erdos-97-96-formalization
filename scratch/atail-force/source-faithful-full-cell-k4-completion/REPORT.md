# Source-faithful whole-carrier completion audit

Date: 2026-07-18

Status: **ONE ADDITIONAL SOURCE-ORIENTED CRITICAL ROW HAS AN EXACT
ALGEBRAIC EXISTENCE CERTIFICATE INSIDE THE 26-POINT FULL CELL.**  The source
map can be extended by

```text
uS1 -> x21
x21 exact support = {uS1,t0s,t1s,o}.
```

The certificate proves that deleting `uS1` leaves only the three retained
support members at that radius and that every alternative squared-radius gap
at `x21` is nonzero.  Thus the deletion leaves no four-point radius class at
`x21`.  This is the source-oriented local content of `no_qfree_at` for this
one source/blocker pair.

The result is an exact rational-polynomial plus rational interval certificate
checked by the scripts in this directory and cross-checked by Singular.  It is
**not a Lean theorem**, does not construct total K4 or a total
`CriticalShellSystem`, makes no coverage or UNSAT claim, and closes no
production `sorry` by itself.

This lane owns only
`scratch/atail-force/source-faithful-full-cell-k4-completion/`.  It did not
edit production Lean, shared plan documents, proof-blueprint state,
`ShellCurvature`, `SurplusM44`, or git.

## Boundary and bounded search

The boundary is the completed exact 26-point source-faithful model in
`../full-parent-t0t1-exact-model/`, coordinate digest

```text
ed4d4520d0b0a00e775ba05fe71cfacc1f2ccf2c4fc1dab65ec42d7294e59d8a
```

Its exact replay has K4 at exactly the six already parameterized centers
`o`, `right`, `left`, `c0`, `c1`, and `c2`.  Each of the other twenty centers
has maximum exact radius multiplicity one at that rational checkpoint.

`completion_cegar.py` deforms all 26 construction parameters while retaining
the full-cell equality and inequality ledger.  It enumerates candidate
four-point source rows modulo the dihedral stabilizer of the cap-coloured
cyclic word; that stabilizer has order one in this cell.  The numerical oracle
is deliberately fail-closed:

- a low-residual in-cell point is only a numerical SAT candidate;
- a failed solve is `UNKNOWN_NO_HIT`, never UNSAT; and
- no numerical failure is shrunk or banked as a MUS.

The broad nearest-support pass tried one atom at every missing center: 20
attempts, zero safety-floor hits, 20 `UNKNOWN_NO_HIT`.  This is not coverage.
The strongest relaxed atom was

```text
x21 : {uS1,t0s,t1s,o}.
```

It solved the row equations while remaining in the mathematical open cell,
but crossed the searcher's conservative `1e-7` hull safety floor.  That is why
the atom was separated from the numerical CEGAR result and validated directly.

## High-precision validation

`validate_x21_candidate.py` refines only three construction variables:

```text
apex angle, lambda1, t1s angle.
```

At 30, 50, 80, and 120 decimal digits, the new-row residual followed the
working precision.  At 120 digits it was below `6e-110`.  The stable raw open
cell margins included:

```text
strict hull                    7.568148892695257589e-8
MEC containment               1.822007676673486460e-5
cap role                      5.161554274738818008e-4
pairwise squared distance     1.795926520395488127e-6
known exact-row exclusion     1.611433440053105093e-3
known other-radius gap        8.847850863871732946e-6
reverse nonreturn             9.156416597694729001e-3
```

Bounded rational reconstructions with denominators `10^4`, `10^6`, and `10^8`
retained strict convexity but did not make the new equalities exact.  The
high-precision phase was therefore correctly labeled numerical rather than
promoted into an exact witness.

## Exact algebraic lift

`lift_x21_algebraic.py` rationalizes all fixed construction parameters using
tangent-half coordinates with denominator bound `10^8`, leaves the three
variables above algebraic, and forms the three independent exact row
equations.  Their primitive integer polynomial summaries are:

| total degree | terms | leading monomial in `(a,l,s)` |
| ---: | ---: | --- |
| 4 | 7 | `(2,2,0)` |
| 6 | 17 | `(2,2,2)` |
| 2 | 3 | `(0,2,0)` |

The exact SymPy lexicographic Groebner basis has size three and reduces all
three generators to zero.  The stable digests are

```text
polynomial system  f2249497890d97db7a8eb47c066a561da9d34202c10e05805569eb8f610583c7
Groebner basis     77df536bb1628b10fbfa1d4cf73a2c7d0bfb23ee8031eed41cdddc59248ca77d
```

A rational Krawczyk box of radius `1e-30` strictly maps into itself.  Over that
entire box the rational interval ledger certifies:

- strict convex order, point distinctness, MEC containment, cap roles, and
  nonobtuse support triangle;
- all already parameterized row equalities as symbolic identities;
- every already required exact-row exclusion, singleton-radius guard, and
  reverse nonreturn gap;
- exact support `{uS1,t0s,t1s,o}` at `x21`; and
- all alternative squared-radius gaps after deleting `uS1`.

The last two checks are the source-oriented blocker manifest.  They show that
the new row is not merely a selected four-point equality: it has the required
deletion-critical semantics at its blocker throughout the certified box.

The generated Singular system independently reports

```text
dimension       0
basis size      4
generator remainders  0, 0, 0
```

The different Groebner basis sizes are expected because the two engines use
different monomial orders; the cross-check only requires zero dimension and
zero generator remainders.

## Replay commands and results

Generate the exact certificate and run the Singular cross-check:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/source-faithful-full-cell-k4-completion/\
  lift_x21_algebraic.py --run-singular
```

Result:

```text
EXACT_ALGEBRAIC_ONE_ROW_COMPLETION_CERTIFIED
cell_certified = true
Singular: dimension 0; generator reductions 0,0,0
```

Replay the stored certificate from the high-precision input, including the
polynomial digests, Krawczyk inclusion, interval ledger, source-oriented
deletion manifest, and a fresh Singular invocation:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/source-faithful-full-cell-k4-completion/\
  verify_x21_algebraic_certificate.py
```

Result:

```text
EXACT_ALGEBRAIC_ONE_ROW_CERTIFICATE_REPLAY_PASS
deletion_kills_every_radius_class_at_x21 = true
lean_kernel_checked = false
coverage_claim = false
whole_carrier_k4_claim = false
```

Syntax-check all four Python drivers:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python -m py_compile \
  scratch/atail-force/source-faithful-full-cell-k4-completion/\
  completion_cegar.py \
  scratch/atail-force/source-faithful-full-cell-k4-completion/\
  validate_x21_candidate.py \
  scratch/atail-force/source-faithful-full-cell-k4-completion/\
  lift_x21_algebraic.py \
  scratch/atail-force/source-faithful-full-cell-k4-completion/\
  verify_x21_algebraic_certificate.py
```

Result: exit code zero.

## Artifact inventory

Drivers:

- `completion_cegar.py`
- `validate_x21_candidate.py`
- `lift_x21_algebraic.py`
- `verify_x21_algebraic_certificate.py`

Exact checkpoint:

- `x21-algebraic-certificate.json`
- `x21-algebraic-verification.json`
- `x21-system.sing`
- `x21-singular-check.txt`

Discovery and numerical logs:

- `audit-log.jsonl`, `checkpoint.json`
- `broad-audit-log.jsonl`, `broad-checkpoint.json`
- `relaxed-probes.jsonl`
- `x21-deep.jsonl`
- `x21-precision-log.jsonl`
- `x21-validation.json`

The exact checkpoint artifact hashes are:

```text
6e181dd0a0c3259d899badfe27616f123c0f28bb13c00c91e914862ddcf1b7a0  x21-algebraic-certificate.json
54c2512f554384e99371b9dc67db4323401b3bda2f8b7b3e9a54caf0601463b9  x21-algebraic-verification.json
407fc0652cea4a46c18541ceae45caa118415dd3ed3a310392b871e30816fa82  x21-system.sing
cc0f466f0c84763b07d70f8176f6c4aab3d92001e7b946bd2e314581e321d4db  x21-singular-check.txt
```

## Next checkpoint, not yet run

The second-row scan is intentionally separate.  It must seed from this exact
one-row surface, preserve `uS1 -> x21` and its full deletion blocker manifest
as hard constraints, assign a previously unmapped source to the second
blocker, and certify that source's deletion kills every radius class there.
No long pair run was started before this checkpoint was finalized.
