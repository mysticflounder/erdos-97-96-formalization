# x21 blocker semantic audit

## Verdict

All four proposed sources

```text
uS1  t0s  t1s  o
```

are valid source choices for the `x21` blocker row of the audited algebraic
completion.  For every choice the independent audit verifies:

- the source belongs to the 26-point carrier;
- `x21` is different from the source;
- the positive-radius class at `x21` is exactly
  `{uS1, t0s, t1s, o}`;
- deleting the chosen source leaves that class with cardinality three; and
- every other positive-radius class at `x21` has cardinality at most one.

Consequently, after any one of the four sources is deleted there is no distance
class of cardinality at least four at `x21`.  Thus the full `no_qfree`
condition required by `BlockerRowManifest` holds for all four source choices,
not merely the selected-four row equalities.

The result is an **exact rational interval and CAS replay, not a Lean/kernel
proof**.  It validates the semantics of this one row in this one algebraic
completion.  It does not prove carrier-wide K4, coverage, global minimality, a
live parent contradiction, or close a `sorry`.

## Pinned input

The audit consumed these exact versions of the active lane artifacts without
modifying that directory:

| input | SHA-256 |
| --- | --- |
| `source-faithful-full-cell-k4-completion/x21-validation.json` | `11ba88b63520a6472a8d40c11ee9fc4285e3f9050488bb3fe854d3b19b076d08` |
| `source-faithful-full-cell-k4-completion/x21-algebraic-certificate.json` | `6e181dd0a0c3259d899badfe27616f123c0f28bb13c00c91e914862ddcf1b7a0` |

The independent reconstruction produced polynomial-system SHA-256
`f2249497890d97db7a8eb47c066a561da9d34202c10e05805569eb8f610583c7`,
matching the source certificate.  Its three generators have respective
degree/term-count/leading-monomial profiles

```text
(4,  7, [2,2,0])
(6, 17, [2,2,2])
(2,  3, [0,2,0])
```

The independently recomputed exact-rational Krawczyk image matches the source
artifact exactly and is strictly inside the supplied root box.  The rational
denominator lower bound is positive.  SymPy's exact Groebner replay has three
basis elements and reduces every generator to zero.  The independent Singular
4.4.1 replay reports dimension zero, basis size four in its own ordering, and
also reduces all three generators to zero.  The different displayed basis
sizes are not a discrepancy in the checked claim.

## Complete distance partition

The machine-readable certificate in `audit.json` contains the exact rational
interval for every comparison.  The decisive lower bounds are:

| check | count | minimum certified lower bound |
| --- | ---: | ---: |
| squared distance from `x21` to a candidate source | 4 | `0.895078721232590416` |
| support radius versus an outside point | 21 | `0.00166882307203217212` |
| two outside-point squared distances | 210 | `0.000294071217884829427` |

There are 21 points outside the four-point support.  The 21 support/outside
separations show that none joins the support radius class.  The 210 pairwise
outside separations show that the outside radius classes are singletons.  The
positive source distances separate the support class from the zero-distance
class of `x21` itself.  This is the exhaustive distance partition needed for
the deletion argument.

The numerical root replay was also run at a precision ladder:

| decimal precision | maximum support residual | minimum source squared distance | minimum support/outside gap | minimum outside-pair gap |
| ---: | ---: | ---: | ---: | ---: |
| 40 | `1.1479437019748901445e-41` | `0.89507872123259041559` | `0.0016688230720321721195` | `0.00029407121788482942693` |
| 80 | `2.1084395886461046449e-81` | `0.89507872123259041559` | `0.0016688230720321721195` | `0.00029407121788482942693` |
| 120 | `2.9044439361369887046e-121` | `0.89507872123259041559` | `0.0016688230720321721195` | `0.00029407121788482942693` |
| 180 | `7.4176401303612571925e-140` | `0.89507872123259041559` | `0.0016688230720321721195` | `0.00029407121788482942693` |

The precision ladder is a cross-check only; the stated separation result comes
from the exact rational interval ledger.

## Source-by-source manifest

| source | member | center/source distinct | exact class size | class size after deletion | all other class sizes | `no_qfree` |
| --- | --- | --- | ---: | ---: | ---: | --- |
| `uS1` | yes | yes | 4 | 3 | at most 1 | yes |
| `t0s` | yes | yes | 4 | 3 | at most 1 | yes |
| `t1s` | yes | yes | 4 | 3 | at most 1 | yes |
| `o` | yes | yes | 4 | 3 | at most 1 | yes |

In the terminology of the existing exact-class API, this supplies the semantic
evidence needed for `overrideExactSelectedClass`'s `hblocked` premise for each
of the four support members simultaneously.  A production theorem still needs
a Lean-checkable algebraic/interval certificate (or a small verified interval
checker) before this can be used on the kernel-checked proof spine.

## Bank preflight

Before writing the audit, the required theorem-bank registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The Lean corpus was also queried with:

```bash
nthdegree docs search --lean \
  "x21 blocker exact four point radius class deletion no qfree"
nthdegree docs search --lean \
  "CriticalShellSystem no_qfree blocker row source deletion alternate radius class"
```

The closest reusable declarations were `CriticalShellSystem.no_qfree_at`,
`criticalSelectedFourClass_at_of_no_qfree`,
`source_mem_critical_support_of_no_qfree`, and
`actual_blocker_ne_of_deletion_survives`.  No banked x21 interval or exact
algebraic certificate was found.

## Commands and results

```bash
UV_CACHE_DIR=/tmp/uv-cache-x21-audit uv run python \
  scratch/atail-force/x21-blocker-semantic-audit/audit_x21_blocker.py
# exit 0; status ALL_FOUR_SOURCES_INTERVAL_CERTIFIED

singular \
  scratch/atail-force/x21-blocker-semantic-audit/x21-replay.sing
# exit 0; dimension 0; all three generator reductions are 0
```

`singular-output.txt` records the material replay output.  `audit.json` is the
full exact-rational ledger; it intentionally retains all 21 support/outside and
210 outside/outside comparisons instead of only the three minima.

## Trust boundary

Trusted for this audit:

- the two pinned JSON inputs;
- the independent Python reconstruction and interval implementation;
- Python/SymPy exact integer and rational arithmetic;
- the Krawczyk existence/uniqueness criterion as implemented; and
- Singular as an independent exact polynomial-reduction cross-check.

Not claimed:

- Lean elaboration or kernel checking;
- a proof about the original theorem's arbitrary real configuration;
- a proof beyond the fixed denominator-`10^8` rationalized algebraic
  completion;
- a coverage theorem for other completions or centers; or
- any direct `sorry` closure.

## Owned files

- `audit_x21_blocker.py`
- `audit.json`
- `x21-replay.sing`
- `singular-output.txt`
- `REPORT.md`

No production source, plan document, git state, proof-blueprint state, or file
in the active completion directory was edited by this lane.
