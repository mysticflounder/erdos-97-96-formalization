# Reduced-core Kalmanson decoder

## Result

`RetainedKalmansonDecoder.lean` is a generic `Fin 11` occurrence terminal for
the ten exact schemas in the kernel-only Kalmanson bank.  Its public
`RetainedOccurrence` type has exactly the 18 schema/orientation constructors
present in the reduced p5 core, and `false_of_retainedOccurrence` consumes
every constructor.

Schemas 5 and 8 intentionally have only reflected constructors: the reduced
core retains no forward clause from either schema.  This is not a claim that
their forward orientations are realizable.

## Exact inputs

- Kernel-only bank:
  `scratch/atail-force/unique4-curvature-occurrence-census/kalmanson_schema_bank.kernel_only.json`
  - file SHA-256:
    `26ccfafca4308a7415aa82fdc0cc32a4348363a9633c30663c181df8951c679e`
  - recorded full-bank SHA-256:
    `04105ec974d7e15664d9addca6473329f71f943b14a0037dad9ce3560fcda4f3`
- Reduced p5 core:
  `scratch/atail-force/unique4-exact-two-core-map/p5.input-core.cnf`
  - SHA-256:
    `1532d4d1c6fb90d89ce14697728f18b9db8b37fce2acf2f5a3244ec42e25b7a8`
- Clause/source map:
  `scratch/atail-force/unique4-exact-two-core-map/p5.input-core-map.json`
  - SHA-256:
    `9c43ca5fadd445ba22bde5dc5617ea9414caf4df8c82de198706c6076ee51747`

The decoder copies each bank `order_schema` literally as `schema0` through
`schema9`.

## Clause-to-terminal map

| Schema | Roles | Forward clauses | Reflected clauses | Kernel terminal |
|---:|---:|---:|---:|---|
| 0 | 6 | 98 | 242 | new normalized wrapper; existing endpoint K2/K1 consumer |
| 1 | 6 | 140 | 267 | existing schema-one Fin-11 terminals |
| 2 | 4 | 53 | 48 | new normalized wrapper; existing cyclic-row consumer |
| 3 | 6 | 3 | 6 | existing four-K2 consumer; new reflected wrapper |
| 4 | 5 | 285 | 225 | existing schema-four Fin-11 terminals |
| 5 | 5 | 0 | 3 | existing endpoint-K1 four-row consumer |
| 6 | 6 | 204 | 117 | existing schema-six Fin-11 terminals |
| 7 | 7 | 4 | 3 | existing round-two consumer; new reflected wrapper |
| 8 | 8 | 0 | 8 | existing three-endpoint four-row consumer |
| 9 | 6 | 134 | 222 | existing schema-nine Fin-11 terminals |

`MissingRetainedOrientations.lean` supplies the four genuinely absent
orientations using the already-proved increasing/decreasing Kalmanson
inequalities; it does not reprove the geometric primitives.

## Kernel status and scope

Both modules compile with `-DwarningAsError=true`.  Their printed axiom
closures are:

```text
propext
Classical.choice
Quot.sound
```

The reproducible check uses the project's shared build lock:

```bash
cd lean
LEAN_ROOT="$PWD" \
REAL_LAKE="../scratch/atail-force/unique4-exact-two-source-bridge/Kalmanson/locked-check.sh" \
LAKE_BUILD_NO_REFRESH=1 lake-build
```

There is no `sorry`, `admit`, declared axiom, `native_decide`, unsafe
declaration, or warning suppression in either module.

This proves only the conditional occurrence terminal:

> if a faithful card-eleven carrier pattern realizes one of the 18 retained
> increasing/reflected schema occurrences, then `False`.

It does **not** prove that the reduced source constraints force such an
occurrence, does not lift the fixed-cardinality SAT result to the live
general-carrier route, and does not by itself close a live P97 `sorry`.
