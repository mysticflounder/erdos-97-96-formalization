<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Endpoint Certificates

This directory stores the generated endpoint certificate set for the
117-pattern COMP-G-EP residual.

Each JSON file has schema `endpoint_certificate.v1` and verifies one identity:

```text
sum_i coefficients[i] * generators[i] = 1
```

The two `base_empty` rows are direct Nullstellensatz certificates for the base
metric system.  The remaining 115 `forced_collapse` rows add one Rabinowitsch
generator for the globally forced pair `s1=s3`.

Regenerate from the project root with:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/endpoint-certificate.py \
    --all \
    --out-dir certificates/endpoint \
    --timeout-s 300 \
    --quiet
```

Verify the checked-in JSON without calling Singular:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/endpoint-certificate.py \
    --check certificates/endpoint \
    --quiet
```

Emit the lifted-column support census used to scope the endpoint bridge:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/endpoint-certificate.py \
    --emit-core-census certificates/endpoint \
    --core-census-out certificates/endpoint/reports/endpoint_core_census.json \
    --core-census-markdown-out certificates/endpoint/reports/endpoint_core_census.md \
    --quiet
```

The report records which certificate generators have nonzero lift
coefficients.  It is not a minimal-core certificate: a smaller certificate
support may exist.

Emit the first Lean vertical-slice data module:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/endpoint-certificate.py \
    --emit-lean certificates/endpoint/ep_Q2_000.json \
    --lean-out lean/Erdos9796Proof/P97/EndpointCertificate/EpQ2000.lean \
    --lean-name ep_Q2_000 \
    --quiet
```

The generator extracts the lifted column from Singular over characteristic 0 and
then independently checks the polynomial identity using exact rational
arithmetic in `scripts/endpoint-certificate.py`.

## Computed product rows

The twelve product-sum endpoint rows are emitted with
`--emit-lean-term-sharded` into `EndpointCertificate.Patterns`.  Their Lean
representation stores each product block as a bounded coefficient list and a
generator index.  `ComputedProductBlock` computes the product from that data,
and `evaluationZeros_of_computedProductBlocks` supplies the reusable soundness
theorem for the row-zero layer.  Each product row has one final
`native_decide` identity check; it does not repeat a multiplication check for
every expanded product block.

The emitter keeps coefficient blocks at most 100 terms and bundles at most 24
blocks or 200 KB per generated module.  Regenerate one product row with:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/endpoint-certificate.py \
    --emit-lean-term-sharded certificates/endpoint/ep_Q1_008.json \
    --lean-out lean/Erdos9796Proof/P97/EndpointCertificate/Patterns/EpQ1008.lean \
    --lean-shard-out-dir lean/Erdos9796Proof/P97/EndpointCertificate/Patterns/EpQ1008TermShards \
    --block-size 100 \
    --quiet
```

The live endpoint generated tree is currently 23 MB: 18 MB across 219 pattern
modules and 344 KB across the 13 product row-zero modules.  The largest live
generated source file is 204622 bytes.  The former per-term product shards and
product `BlockZeros` directories are archived under
`attic/surplus-certificate-legacy-2026-07-09/EndpointCertificate` and are not
part of the Lean source tree.

The refactor was checked with `lake-build` for `Patterns.EpQ1008`,
`RowZeros.Product.EpQ1008`, `RowZeros.Product.Bank`, and
`EndpointCertificate.ResidualSoundness`; all passed.  The full changed
row-zero-bank replay used 8375 jobs, and the residual-soundness replay used
8592 jobs.
