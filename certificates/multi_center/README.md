<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center Certificates

This directory stores certificate-facing artifacts for the multi-center joint
census.

The first certificate layers are the L2 sweep inventory certificate, the L2
profile inventory certificate, and the L2 class inventory certificate.  They
recompute project-level inventory from class keys across the overlapping sweep
artifacts in `census/multi_center/sweeps`, then emit:

- `reports/l2_sweep_inventory_certificate.json`;
- `reports/l2_sweep_inventory_certificate.md`;
- `reports/l2_profile_inventory_certificate.json`;
- `reports/l2_profile_inventory_certificate.md`;
- `reports/l2_class_inventory_certificate.json`;
- `reports/l2_class_inventory_certificate.md`;
- `reports/l2_profile_class_incidence_certificate.json`;
- `reports/l2_profile_class_incidence_certificate.md`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/Sweep.lean`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/ProfileInventory.lean`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/ClassInventory.lean`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/TypedClass.lean`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/TypedClassBank.lean`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/ProfileClassIncidence.lean`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/ClassPermutationTable.lean`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/Completion.lean`.

The trusted semantic checker is a separate stdlib-only pass.  It does not
import `census.multi_center` or `analyze_sweeps`; it independently parses the
raw sweep artifacts, validates class-key local support-incidence semantics and
canonicality, recomputes profile/artifact metadata totals, and emits:

- `reports/l2_trusted_sweep_semantics.json`;
- `reports/l2_trusted_sweep_semantics.md`;
- `lean/Erdos9796Proof/P97/MultiCenter/Certificate/TrustedSweep.lean`.

Regenerate from the project root with:

```bash
UV_CACHE_DIR=.uv-cache \
  uv run python scripts/multi-center-sweep-certificate.py
```

Run the trusted semantic checker with:

```bash
UV_CACHE_DIR=.uv-cache \
  uv run python scripts/multi-center-trusted-sweep-check.py
```

Build the generated Lean bank with:

```bash
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.Sweep
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.ProfileInventory
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.ClassInventory
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.TypedClassBank
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.LocalEnumeratorCertificate
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.ProfileClassIncidence
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.ClassPermutationTable
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.ProfileClassCompletion
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.Completion
lake-build Erdos9796Proof.P97.MultiCenter.Certificate.TrustedSweep
```

Scope note: these certificates record finite metadata about the imported sweep
rows and digest-identified class keys.  They verify that the loaded rows have no
bad status cells, that every loaded profile has `local_classes = SAT`, that the
distinct LOCAL class-key inventories are SAT, that no SAT class disappears
between consecutive loaded `n` rows, and that every class imprint in the loaded
inventory is present at terminal `n=32`.  The typed class bank gives Lean a
raw-row decoding of the class keys into `JointClass` data, with finite
structural checks over masks and cap-count slots.  The completion-surface
module exposes the generated profile rows and typed class bank in the
`ProfileRealizationSurface` shape.  The profile/class incidence bank gives Lean
the concrete artifact relation from generated profile rows to typed class rows:
489 profile rows, 977,975 profile/class pairs, and 40,369 compressed class-id
ranges.  The trusted checker also verifies that every raw class key parses,
satisfies the local support-incidence constraints used by the census, is
canonical under size-preserving profile symmetries, and agrees with the
generated Lean banks at the summary level.
The base sweep-import artifacts, considered alone, do not prove the DFS
implementation complete or certify any unscanned `n`; the independent
enumerator checkpoint below closes the first limitation on the scoped
L2/full-participant surface. The base artifacts also do not close the broad
`Completion.CoversLocalFrom ProfileClassIncidence.certifies` statement as
currently written: `JointClass.LocallyAdmissible` includes L1 and
empty-participant classes, while the generated incidence relation is an
L2/full-participant canonical-representative bank.  The generated Lean module
therefore records `ProfileClassIncidence.not_coversLocalFrom_certifies` as a
checked obstruction to that over-broad target.

The corrected proof-facing interface is now explicit in
`Certificate.Completion`: `L2FullLocal` scopes the local premise to the
generated L2/full-participant surface, `HasCertifiedRepresentative` closes a
literal bank certificate under `JointClass.EquivalentUnder profile`, and
`CoversL2FullLocalModuloFrom` is the scoped, equivalence-aware completion
obligation discharged below.  `ProfileClassIncidence.representativeSurface` exposes
the representative-closed realization surface, and
`ProfileClassIncidence.hasCertifiedRepresentative_of_certifies` proves that
literal incidence certificates feed that surface.

## Enumerator-completeness checkpoint

As of 2026-07-09, `Certificate.LocalEnumerator` is kernel-checked.  It provides
an independent 21-cell L2/full-participant LOCAL enumerator, proves its recursive
count-vector search complete, and prunes the 64 Moser assignments with three
exact center-use budgets, six H1 budgets, and three pair-sharing budgets.  Every
semantic L2/full LOCAL class is proved to occur in its accepted rows.

`Certificate.LocalEnumeratorCertificate` is also kernel-checked.  Its sorted
support-data equality identifies the accepted rows exactly with the 3,375-row
`TypedClassBank`; the optimized native check completes in under 30 seconds.
`Certificate.ProfileSymmetry`, the generated six-permutation class table, and
`Certificate.ClassPermutationBridge` are kernel-checked and connect every table
entry to semantic `JointClass.EquivalentUnder` transport.  The table contains
20,250 source/permutation entries and uses direct typed-row array lookup.

`Certificate.ProfileClassCoverageCertificate` is kernel-checked over all 489
profile rows and 3,375 typed class rows.  `Certificate.ProfileClassCompletion`
then proves `ProfileClassIncidence.finiteCodeWitnesses`,
`coversL2FullLocalModuloFrom`, and
`completesL2FullFrom_representativeSurface`.

Scope remains important: this closes completeness of the generated
L2/full-participant representative surface modulo profile automorphisms.  It is
not a geometric GLOBAL-realization theorem and does not alone prove quantitative
eventual stabilization of the original incidence census. Independently, exact
LOCAL frontier scans through `n = 64` find the same 3,375 classes, but that
bounded computation does not change the theorem boundary.
