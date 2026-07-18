# Period-three rank-two coordinate probe

Date: 2026-07-17

Status: **THE ONE FIXED 25-ROLE CELL REMAINS UNRESOLVED IN PLANAR
COORDINATES.  Z3 AND CVC5 BOTH TIMED OUT AT 120 SECONDS ON THE COMPLETE
COORDINATE-ONLY FORMULA.  THIS IS `UNKNOWN`, NOT SAT, UNSAT, OR EVIDENCE FOR
EITHER.  NO MEC RUN WAS PERMITTED BY THE PREDECLARED LADDER, AND NO
PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/period-three-rank2-coordinate-probe/`.  It did not edit
production Lean, shared docs, proof-blueprint state, git, protected lanes,
`ShellCurvature`, or `SurplusM44`, and it ran no Lean/Lake/LSP command.

## Source and theorem-bank preflight

The probe consumes the fully-disjoint unequal-radius cell recorded in
`period-three-full-role-identity-quotient/{REPORT.md,RESULT.json}`.  That lane
already checked all theorem-bank registries required by `AGENTS.md`.  I also
ran a focused `nthdegree docs search --lean` for strict convex cyclic order,
exact support, equidistant rows, and planar rank two.  It recovered the known
small cyclic-order consumers and U5 rank-two kernels, but no theorem deciding
this aggregate six-row 25-role cell.

## Encoded cell

`coordinate_probe.py` gives every role in the fixed word

```text
first, t0s, nS, second, q, w, t0i, t1i0, t1i1, t1i2, nI,
x0, y0, x1, y1, x2, y2, surplus,
c0, b0, b2, c1, b1, c2, t1o
```

one point in `R^2`.  Similarity is fixed by

```text
first = (0,0),  second = (1,0).
```

The complete coordinate-only query has 46 free real variables and 981 named
atoms:

| block | count |
| --- | ---: |
| every non-edge vertex strictly left of every directed boundary edge | 575 |
| explicit pairwise squared-distance positivity | 300 |
| exact named-support exclusions | 79 |
| row radius positivity and shell equalities | 25 |
| unequal T0/T1 radii | 1 |
| unequal second-apex distances to `q,w` | 1 |

The 19 actual row equalities are the three T0 equalities, three T1
equalities, four physical exact-five equalities, and three equalities in each
of the three reverse rows.  T0/T1 are selected rows and therefore deliberately
receive no exact-support exclusions.  The physical and reverse rows exclude
every other named point.  In particular, each reverse row excludes the
physical apex, matching the Round-13 opposite-apex handoff.

Every named vertex lying strictly on the interior side of every directed
boundary edge is a direct fixed-word certificate of strict convexity.  The
300 explicit distinctness atoms are redundant but were retained in the full
query as an auditable ledger.

## Encoding gates

The local smoke suite checks:

- a counterclockwise square satisfies the edge-side encoding;
- a crossed square order is rejected;
- four unit-shell points satisfy the equidistance encoding; and
- one perturbed shell point makes that equality packet inconsistent.

Z3 passes all four.  cvc5 separately passes a nonlinear SAT instance and an
inconsistent-order UNSAT instance.  Both engines receive the same asserted
formula.  The stable digest of the ordered `(atom name, family, assertion)`
manifest is

```text
0efe2aa64d0a6bc18688cb2bf708acf8523106f8746808290fdfec29a70b25f8.
```

In the full runs, Z3 serialized that manifest to SMT-LIB with the byte digest

```text
f61bf7b51c2cbc054a7fc871beef3b61c34a2b0825fdcdb1df1ab825123e655c
```

Z3 consumes those assertions in memory.  cvc5 consumes the serialized
formula plus a post-`check-sat` `get-value` command, so the complete cvc5
command stream has the separate digest

```text
685e8a1e4dd169a05e5d9a77a8cf78d3a7aa54e1c28130058f8e4f6d492d662b.
```

This distinction is metadata only; `get-value` adds no assertion.  Z3's
whole-query serialization can choose different internal sharing depending on
which unrelated ASTs were constructed earlier in the process, so the two
whole-query byte hashes are replay identifiers, not canonical formula
identities.  The named-atom manifest hash and the 981-name ledger are the
stable semantic identifiers.

## Full verdict

The exact invocations were:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-rank2-coordinate-probe/coordinate_probe.py \
  --engine z3 --phase coordinate --timeout-seconds 120 \
  --output scratch/atail-force/period-three-rank2-coordinate-probe/Z3_COORDINATE.json

UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-rank2-coordinate-probe/coordinate_probe.py \
  --engine cvc5 --phase coordinate --timeout-seconds 120 \
  --output scratch/atail-force/period-three-rank2-coordinate-probe/CVC5_COORDINATE.json
```

Results:

| engine | result | recorded reason |
| --- | --- | --- |
| Z3 4.16 `SolverFor(QF_NRA)` | `UNKNOWN` | `timeout` |
| cvc5 1.3.3 `--nl-cov` | `UNKNOWN_NO_VERDICT` | internal timeout, no verdict line |

Neither solver exported a SAT model, so there was no model to substitute.
Neither produced an UNSAT certificate.  The only correct mathematical status
is **unresolved under these budgets**.

The full raw JSON files predate the later diagnostic CLI metadata fields, but
their stored serialization digest is the `f61bf7...` full-run identifier.
The current default `--exact-scope all --row-prefix all` source reproduces the
same 981 named atoms and the stable `0efe2a...` manifest digest.  `RESULT.json`
binds the raw artifacts, manifest, serialization identifiers, and exact
classifications explicitly.

## Diagnostic ladder

### Exact-support exclusions are not the diagnosed bottleneck

Removing all 79 exact-support disequalities and omitting the 300 redundant
distinctness atoms leaves 602 atoms: the same fixed convex word, all six row
equalities, the two requested radius inequalities, and radius positivity.
Both engines again timed out (`UNKNOWN`) at 60 seconds.  Therefore the current
evidence does **not** support blaming disequality branching.  It also does not
show that the exclusions are cheap; it simply reaches no verdict before they
are present.

### Row-family prefixes do not locate a first bad coupling

On the same no-exclusion fixed-convex formula, 20-second runs gave:

| row prefix | atoms | row equalities | Z3 | cvc5 |
| --- | ---: | ---: | --- | --- |
| T0 + T1 | 584 | 6 | `UNKNOWN` | `UNKNOWN` |
| + physical | 590 | 10 | `UNKNOWN` | `UNKNOWN` |
| + reverse0 | 594 | 13 | `UNKNOWN` | `UNKNOWN` |
| + reverse1 | 598 | 16 | `UNKNOWN` | `UNKNOWN` |
| + reverse2 | 602 | 19 | `UNKNOWN` | `UNKNOWN` |

Because even the first prefix times out, this ladder does not identify a
mathematical coupling.  It identifies an instrument problem: blind QF_NRA
search over the 46 coordinate variables and 575 bilinear strict-convexity
constraints is already too expensive for these budgets.

## MEC phase

The requested MEC extension is implemented but was not run.  The declared
protocol says to add it only after a substitution-checked coordinate SAT
model.  Its construction smoke succeeds with 49 variables and 1013 uniquely
named atoms.  It adds:

- one disk center and squared radius;
- `first`, `second`, and `surplus` on the disk boundary;
- all 25 points in the disk; and
- the three nonobtuse support-triangle dot products.

Running it after an `UNKNOWN` coordinate query would not answer the intended
ladder and could only produce another non-verdict or a conditional cell result.

## Consequence and next instrument

This probe neither refutes nor realizes the fully-disjoint cell.  It therefore
does not restore the linear Kalmanson route, close the period-three branch, or
close any production `sorry`.

The next bounded experiment should change instruments rather than extend the
SMT timeout:

1. use numerical constrained optimization or homotopy on the 19 row
   equalities with the fixed edge-side inequalities as barriers;
2. substitution-check any high-precision hit against all 981 named atoms;
3. use the hit to select exact-support signs and narrow rational intervals;
4. only then ask an exact solver to certify a small box or reconstruct an
   algebraic point; and
5. add the MEC block only after coordinate feasibility is established.

The formula has 46 free coordinates and only 19 named row equalities, so it is
not generically overdetermined by equality count.  That dimension heuristic
is not a feasibility result; it only explains why a witness-directed numerical
instrument is more appropriate than treating the timeouts as near-UNSAT.

## Epistemic ledger

- **SOURCE-AUDITED FIXED CELL:** inherited from the full-role/identity quotient.
- **SMOKE-TESTED ENCODING:** exact small SAT/UNSAT gates passed.
- **FULL COORDINATE RESULT:** `UNKNOWN` on both engines at 120 seconds.
- **NO-EXCLUSION RESULT:** `UNKNOWN` on both engines at 60 seconds.
- **ROW-PREFIX RESULTS:** all `UNKNOWN` on both engines at 20 seconds.
- **MEC:** encoded and construction-checked, not run.
- **NOT CLAIMED:** SAT, UNSAT, Euclidean realization, MEC realization,
  source coverage, Lean theorem, direct `False`, or production closure.
- **PRODUCTION `sorry` CLOSED:** none.
