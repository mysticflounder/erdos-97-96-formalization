<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned Surplus COMP-G Bank

This directory stores the local 135-row pinned surplus COMP-G pattern bank.

The JSON file has schema `pinned_surplus_comp_g_bank.v2`.  It records the
joined incidence rows from the rvol pinned surplus shadow together with the
COMP-G verdict metadata and a canonical proof-facing shadow signature:

```text
135 rows = 41 s1 + 71 s2 + 23 s3
K_v = {Pu, Pw, u, s*} in every row
2 base C-empty rows
133 no-valid-real rows after forced-pair/Rabinowitsch follow-up
135 unique ten-class bitset shadows over label order
  u, v, w, s1, s2, s3, Pw, Pu, Q1, Q2
```

Regenerate the bank from the sibling `../p97-rvol` checkout:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/surplus-compg-shadow.py \
    --emit-bank certificates/surplus/pinned_surplus_comp_g_bank.json
```

Emit the Lean incidence-shadow module:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/surplus-compg-shadow.py \
    --emit-lean-shadow lean/Erdos9796Proof/P97/SurplusCOMPGBank.lean
```

Check the committed bank against the current rvol source artifacts:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/surplus-compg-shadow.py \
    --check-bank certificates/surplus/pinned_surplus_comp_g_bank.json
```

Mine the lifted-column support of the metric certificates:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --json-out certificates/surplus/reports/pinned_surplus_lift_support.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_lift_support.md \
    --timeout-s 20 \
    --allow-timeout
```

The support census is a certificate-support audit, not a minimal-core census.
The current report solves 134 of the 135 rows and records one Singular lift
timeout, `s1_030`; the separate artifact
`reports/pinned_surplus_lift_support_s1_030_timeout180.json` records that the
same row still times out with a 180-second single-row limit.  Every solved row
uses at least one center outside the exact-mask-safe pair `{v, w}`.

Test whether the exact-mask-safe centers alone already kill the rows:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --uniform-center-test \
    --json-out certificates/surplus/reports/pinned_surplus_uniform_center_test.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_uniform_center_test.md \
    --timeout-s 20
```

This is a Singular `std` unit-ideal test using only the selected center
equations, by default `{v,w}`, plus the row's forced-pair separator.  The
current result is `nonunit` for all 135 rows, so simply regenerating the pinned
certificates with support restricted to exact-mask-safe centers will not close
the general-`m` branch.

Generate the relaxed incidence projection census:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --relaxed-incidence-census \
    --json-out certificates/surplus/reports/pinned_surplus_relaxed_incidence_census.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_relaxed_incidence_census.md
```

The default policy keeps exact masks only at the currently geometry-safe
centers `{v,w}` and erases every other center to the empty guaranteed submask.
Under that projection the 135 exact rows collapse to 15 relaxed incidence
rows: 8 for `s1`, 4 for `s2`, and 3 for `s3`.  Twelve of the 15 relaxed rows
have multiple exact completions, with a largest completion fiber of 36 rows.
The report also records, per relaxed row, the exact completion pids and the
intersection/union of their erased-center masks.  Those common erased
incidences are finite-bank consequences of the exact completions; they are not
geometric facts unless a separate relaxed/sub-mask bridge proves the completion
hypothesis.

Probe the relaxed projection as an algebraic support-mining problem:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --relaxed-certificate-probe \
    --json-out certificates/surplus/reports/pinned_surplus_relaxed_certificate_probe.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_relaxed_certificate_probe.md \
    --timeout-s 20
```

The probe branches the 15 relaxed incidence rows by final COMP-G separator,
giving 17 separator cases.  It tests exact `.v`, exact `.w`, the branch
separator when present, and all branch-common erased-center submask equations.
Current result: required `.v/.w` data alone is `nonunit` for all 17 cases; all
common optional erased incidences give `unit` for 5 cases, `nonunit` for 5
cases, and timeout for 7 cases under the 20-second Singular budget.  The
definite `nonunit` cases mean the `{v,w}` projection is too coarse as a
complete relaxed-bank route; the next finite object must split variable
erased-center submask choices rather than relying only on common intersections.

Generate the recursive split probe:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --relaxed-split-probe \
    --json-out certificates/surplus/reports/pinned_surplus_relaxed_split_probe.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_relaxed_split_probe.md \
    --timeout-s 20 \
    --split-max-depth 8
```

The split probe recursively splits relaxed rows by variable erased-center
label incidences and tests each node using the submask equations common to that
node.  The current result closes all 17 separator cases: 63 leaves, all
`unit`, with no unresolved cases.

Emit the relaxed split coefficient certificates:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --relaxed-split-certificates \
    --json-out certificates/surplus/reports/pinned_surplus_relaxed_split_certificate_census.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_relaxed_split_certificate_census.md \
    --certificate-dir certificates/surplus/relaxed_split \
    --timeout-s 60
```

The first pass emits 58 of the 63 split-leaf lifted-column certificates.  The
remaining five are handled by:

- a long single-leaf retry for `R011:u=v:R011NNN`, recorded in
  `reports/pinned_surplus_relaxed_split_long_retry_census.{json,md}`;
- singleton refinements for the four hard grouped leaves
  `R003:u=v:R003Y`, `R004:u=v:R004NY`, `R009:u=v:R009NYYY`, and
  `R009:u=v:R009NYN`, recorded in
  `reports/pinned_surplus_relaxed_split_singleton_replacement_census.{json,md}`.

The directory `certificates/surplus/relaxed_split` contains the 70-file grouped
certificate pass: 58 direct split-leaf certificates, 1 long retry, and 11
singleton replacement certificates.  This grouped pass is retained as the
support-mining artifact, but it is not the Lean ingestion target; some grouped
certificates are too large for practical direct Lean checking.

The Lean-ingested certificate cover is the fully singleton split.  Generate the
singleton probe:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --relaxed-split-probe \
    --json-out certificates/surplus/reports/pinned_surplus_relaxed_split_singleton_probe.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_relaxed_split_singleton_probe.md \
    --timeout-s 20 \
    --split-max-depth 12 \
    --split-continue-unit-above 1
```

Emit the singleton coefficient certificates:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --relaxed-split-certificates \
    --relaxed-split-probe-in certificates/surplus/reports/pinned_surplus_relaxed_split_singleton_probe.json \
    --json-out certificates/surplus/reports/pinned_surplus_relaxed_split_singleton_certificate_census.json \
    --markdown-out certificates/surplus/reports/pinned_surplus_relaxed_split_singleton_certificate_census.md \
    --certificate-dir certificates/surplus/relaxed_split_singleton \
    --timeout-s 180
```

The singleton probe/certificate pass has 135 leaves, all `unit`, and
`certificates/surplus/relaxed_split_singleton` contains 135 certificate JSON
files.  The two singleton reports and all 135 certificate JSON files parse
cleanly with `jq`.

Emit the Lean singleton certificate bank:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --emit-relaxed-split-lean-dir certificates/surplus/relaxed_split_singleton \
    --lean-out-dir lean/Erdos9796Proof/P97/SurplusCertificate/RelaxedSplit \
    --lean-aggregate-out lean/Erdos9796Proof/P97/SurplusCertificate/RelaxedSplit/All.lean \
    --block-size 100 \
    --lean-shard-threshold 40000
```

The current `RelaxedSplit` source tree has 392 Lean modules and occupies 36 MB.
It consists of 135 certificate coordinators, 34 generator modules, 220 bundled
coefficient-shard modules, and the `All`, `Bank`, and `Payload` modules. No
source module exceeds 205 KB. The aggregate module
`Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.All` defines
`allRelaxedSplitSingletonCertificates`, a 135-entry list of checked facts.
Direct rows prove `checkCertificate = true`. For the 34 product-sum rows, each
coefficient definition contains at most 100 terms, and each source shard holds
at most 24 definitions or 200 KB of coefficient data. Products are computed
from a coefficient and generator index by the shared `ComputedProductBlock`
interface; generated source does not repeat expanded products or prove a
separate multiplication identity for every block. Each product certificate
uses one final `native_decide` proof of `checkProductSum ... = true`.

Emit the finite row metadata/alignment bank:

```bash
UV_CACHE_DIR=/private/tmp/uv-cache-endpoint \
  uv run python scripts/pinned-surplus-certificate.py \
    --emit-relaxed-split-row-bank certificates/surplus/relaxed_split_singleton \
    --lean-row-bank-out lean/Erdos9796Proof/P97/SurplusCertificate/RelaxedSplit/Bank.lean
```

`Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.Bank` records the 135
singleton row ids, case ids, leaf ids, split paths, exact completion pids, and
common erased masks, pairs those rows with
`allRelaxedSplitSingletonCertificates`, and proves row-id/certificate-id
alignment plus `exists_certifiedRelaxedSplitRow_of_rowIdInBank`.

The aggregate soundness module
`Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness` reuses the endpoint
polynomial checker soundness layer and exposes `false_of_verifiedCertificate`,
turning a checked relaxed split payload plus its zero-evaluation hypotheses
into `False`.  `Erdos9796Proof.P97.SurplusCertificate.BankSoundness` composes
row-id membership with that aggregate soundness through
`false_of_relaxedSplitRowIdInBank_of_payload_zeros`.
`Erdos9796Proof.P97.SurplusCertificate.ExactBridge` connects exact
`SurplusCOMPGBank.shadowInBank` membership to the singleton relaxed split row
bank by exact pid and exposes `false_of_shadowInBank_of_payload_zeros`.  It
also proves the finite alignment between each matched exact row and its relaxed
row common masks/members.  `Erdos9796Proof.P97.SurplusCertificate.GeometryBridge`
composes that alignment with `SurplusCOMPGBank.shadowOfPointClasses`, proving
that matched relaxed common-mask members are present as bits/classes in the
induced geometric shadow.  Under `EndpointMetricShadow` it also proves equal
normal-axis coordinate squared distances for two such members, and zeros the
all-variable `sqDistToCenterDiffPoly` shape when the involved labels map to
ordinary endpoint variables.  It also proves the exact-row mask-bit-to-class
helper and zeros every distance-equation generator family observed in the
relaxed singleton metadata:
common-center/two-ordinary, common-center fixed `.v` member, common-center fixed
`.w` member, common-center `.v`/`.w` frame, exact `.v` center, exact `.w`
center, and exact `.w` center unit-radius shapes.  The bridge now also covers
the separator Rabinowitsch generators: variable-variable separators use the
pair-distance Rabinowitsch adapter, and fixed-`.v` separators use
`rabinowitschSqNormPoly`. Thus the relaxed singleton metadata is fully
classified at the generator-shape level. Payload-level row-zero transport is
also complete for all 135 rows: 101 direct coordinators live under
`RowZeros/Direct`, and 34 computed product-sum coordinators live under
`RowZeros/Product`. `GeometryCore` contains the row-local geometric
interpretation without importing the aggregate bank. The general theorem
`evaluationZeros_of_computedProductBlocks` lifts generator zeros to every
computed coefficient-generator product, so product row modules contain only
finite rule data and one small Boolean rule check.

The validation commands

```bash
lake-build Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.All
lake-build Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.Bank
lake-build Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
lake-build Erdos9796Proof.P97.SurplusCertificate.BankSoundness
lake-build Erdos9796Proof.P97.SurplusCertificate.ExactBridge
lake-build Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
lake-build Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank
```

succeed. The first full `RowZeros.Bank` migration build after regenerating the
new layout took 10m48s. Its largest shared steps were `RelaxedSplit.All` at
90s, `RelaxedSplit.Bank` at 158s, and `ExactBridge` at 108s; the final
`RowZeros.Bank` coordinator took 6.5s. A later rebuild after changing the
foundational `ComputedProductBlock` interface took 13m25s because it invalidated
every generated product and aggregate bridge. An immediate warm rebuild of the
same target took 2.7s. Representative row-local targets took 28s for
`RowZeros.Product.R006UeqvR006` and 17s for the cached largest-row check
`RowZeros.Product.R013UeqvR013YYNYN`. Row-local targets are the normal edit
loop; the full bank target is now a checkpoint build rather than an hours-long
dependency replay.

The original incidence bank is still a pattern/verdict bank.
`Erdos9796Proof.P97.SurplusCOMPGBank` checks the finite incidence bank in
Lean with `native_decide`, exposes
`SurplusCOMPGBank.shadowInBank : Shadow -> Bool`, and also checks the pinned
fragment enumeration via `isValidPinnedFragment`,
`validFragmentShadowKeys`, and
`shadowInBank_of_fragmentShadowInEnumeration`.

The generated Lean module also contains a finite-search certificate bridge.
The Python generator computes the DFS census from the normalized candidate-mask,
separation, and no-three rules, verifies before emission that this computed
census is the same 135 tagged rows as the bank, then emits
`rawFragmentSearchEntries`.  Lean checks the emitted search certificate with
`candidate_masks_match_filter`, `raw_fragment_search_entries_length`,
`raw_fragment_search_entries_all_valid`,
`raw_fragment_search_shadow_keys_unique`,
`fragment_search_entries_eq_validFragmentEntries`, and exposes
`shadowInBank_of_fragmentShadowAcceptedBySearch`.

The proof-facing bridge is wired through
`Problem97.pinnedSurplusCOMPGBankBridge`, which is consumed by the current
P97/P96 spine residual
`Problem97.RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`.  Its current
axiom closure is the `native_decide` closure: `propext`, `Lean.ofReduceBool`,
and `Lean.trustCompiler`.  The generated module and emitter have no `unsafe`,
`extern`, or `implemented_by` declarations, but `Lean.trustCompiler` remains a
blueprint-reported trust surface unless the incidence certificate is later
reworked into a pure-kernel/sharded proof.

It does not yet prove that a formal geometric residual matches one of the rows.
The remaining proof work is the faithfulness bridge from the formal local
residual to a `Shadow` satisfying `fragmentShadowAcceptedBySearch = true`,
followed by either Lean-checkable COMP-G certificates or an explicitly accepted
external-certificate boundary.
