# Global theorem-bank audit for the offline 2,875-model classification

Date: 2026-07-29

## Executive verdict

The offline sweep is a valid scoped classification artifact, but it is not a
Lean theorem and not a terminal exhaustive-search certificate.

The 2,875 formerly unclassified projected-static-v2 models split as follows:

- 2,869 are `stale-current-antichain`;
- one is cut by the exact equilateral-shell artifact; and
- five sequential residuals are cut by `equality-duplicate-center`.

The two mathematical cut families have different formalization status:

1. **Equilateral shell:** the full shell contradiction is **not Lean-banked**.
   A newly added, kernel-clean equilateral-apex orientation theorem supplies
   the real-to-two-orientations bridge, but it is currently unimported and the
   shell-specific 32 algebraic branch closers and coordinator do not exist in
   Lean.
2. **Duplicate center:** the exact general theorem family and a fixed-`Fin 10`
   executable checker consumer are already **kernel-checked**.  However, none
   of the five new concrete patterns/certificates is materialized in Lean, and
   the Phase-3 checker bank is off the live import root.

Consequently, the sweep does not yet give a kernel-checked elimination of the
2,875 models.

## Audited sources

The audit checked the prescribed registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also searched the indexed Lean corpora with `nthdegree docs search --lean`
for the shell graph, equilateral-apex orientation, five-equilateral-cycle,
duplicate-center, and three-common-equidistant-center formulations.

The earlier exhaustive shell-promotion matcher is recorded in
`scratch/p97-search-lane/projected-static-v2-shell-exact-lean-promotion-audit-20260729.md`.
It checked 129 unique metric contradiction declarations across the three
registries and found zero graph-homomorphic consumer matches for the displayed
20-edge shell.  Current source/corpus search still finds no shell-specific
contradiction theorem.

## Scope and trust of the offline artifact

Primary artifact:

`scratch/p97-distinct-distance-lane/phase3_structural_cegar_projected_static_v2_cube19_20260729/offline-exact-shell-sweep.json`

- Schema: `p97-projected-v2-offline-exact-shell-sweep-v1`.
- SHA-256:
  `1786357d5c13a16bd105d606ccc3f95bc5fbf9d8f3ac396a118a69d42ffd41fa`.
- Recorded scope: “Offline replay against the exact shell cut only; this is
  not a terminal exhaustive-search certificate.”
- Raw SAT records: 3,528.
- Previously classified: 653.
- Previously unclassified: 2,875.
- Offline outcomes among those 2,875: 2,869 stale under the current
  antichain, one exact-shell match, and five sequential new structural cuts.

`stale-current-antichain` is a search-state disposition, not an independently
kernel-checked geometric contradiction.  The one shell cut and five
duplicate-center cuts are Python-side exact classification results.  The
artifact itself does not bridge SAT variables or saved rows to a live
`FaithfulCarrierPattern`.

## Equilateral-shell family

### External exact result

The exact shell artifact is under:

`scratch/p97-distinct-distance-lane/phase3_projected_v2_shell_exact_20260729`

It concerns ten pairwise-distinct real planar points whose 20 shell edges all
have one common squared length.  The graph consists of an inner 5-cycle, a
step-2 outer 5-cycle, and five equilateral triangles joining them.  After
similarity normalization, the five apex choices give 32 signed
60-degree-orientation branches.

All 32 branches have explicit Nullstellensatz identities replayed exactly in
SymPy and Singular.  Pairwise distinctness is used to make the common length
positive and obtain the final real contradiction; strict convexity is not
used.

This status is **external exact algebra**, not Lean:

- schema `p97-projected-v2-shell-exact-algebra-final-v1`;
- 32 orientation branches and 32 unit branches;
- shell bank manifest SHA-256
  `824e6522fcc40fc81b5e0f32ee07ae600c064f48c9dd2b9e12827d1fcd06d7ac`;
- source row SHA-256
  `851c782cb69ce8058138a40ab4145ac2a2df1236ea1fbad1c588f5d4793a3dec`;
- source record SHA-256
  `0449d1de14457c4b990d43ccff3159dee8fb61840c459cb706bea780be779d01`;
- `lean_kernel_checked: false`.

### Lean-bank result

There is no declaration equivalent to either proposed shell endpoint

```lean
false_of_projectedV2Shell_commonDistance
not_realizes_projectedV2Shell
```

and no theorem in the three prescribed registries matches the exact 20-edge
shell.

The closest reusable geometric producer is now:

```lean
Problem97.Census554.EqualityCore.
  equilateral_apex_eq_rotate60_or_rotateNeg60
```

at
`lean/Erdos9796Proof/P97/Census554/EquilateralApexOrientation.lean:156`.
It proves that an apex equidistant from the endpoints of a nondegenerate base
is obtained by rotating the base vector by either `60` or `-60` degrees.  A
live axiom audit reports only `propext`, `Classical.choice`, and `Quot.sound`;
there is no `sorryAx`.

That theorem is nevertheless not currently bank/import reachable:

- its file is new relative to the proof-blueprint source index;
- it has no downstream Lean reference;
- it has no built `.olean`; and
- `Phase3StructuralConstraintBank.lean` imports only
  `ExactTenSelectedShellMincut`, not the orientation module or a shell
  contradiction module.

Thus the shell status is:

| Layer | Status |
|---|---|
| 20-edge shell extraction and 32-way reduction | external Python/exact artifact |
| 32 branch algebraic identities | externally replayed exactly |
| generic real equilateral-apex orientation split | kernel-checked standalone |
| shell-specific 32 branch closers | missing in Lean |
| shell-specific contradiction coordinator | missing in Lean |
| live row/SAT-to-shell producer | missing in Lean |
| import-reachable shell consumer | none |

### First missing positive producer

At the kernel-mathematics layer, the first missing producer is a
shell-specific theorem taking an injective `Fin 10 → ℝ²` realization plus the
20 common-distance shell hypotheses to `False`.  The orientation split is now
available; the immediate remaining proof layer is the Lean replay of the 32
algebraic branch identities and their coordinator.

After that consumer exists, the first live-route producer is an adapter that
derives its 20 edge equalities (or a suitable `Realizes shellPattern`)
from the 26 selected membership antecedents.  Python currently performs this
in `_equilateral_shell_antecedent` and `_find_algebraic_match` in
`census/p97_search/phase3_structural_cegar.py`; no Lean analogue was found.

## Duplicate-center family

### Exact general consumer

The exact ambient-label theorem family is already formalized in:

`lean/Erdos9796Proof/P97/Census554/EqualityCore.lean`

```lean
Problem97.Census554.EqualityCore.DuplicateCenterCore

Problem97.Census554.EqualityCore.not_realizes_of_duplicateCenterCore
  (core : DuplicateCenterCore P) :
  ¬ ∃ pointOf : α → ℝ², Realizes P pointOf
```

`DuplicateCenterCore P` records two distinct centers whose equality closures
make both centers equidistant from the same three pairwise-distinct labels.
The terminal theorem uses
`Problem97.not_dist_eq_three_of_ne`; it is independent of the ambient
cardinality.

The generic endpoint is source-proved, kernel-clean, and occurs on the
`Problem97.erdos97_rhs` proof-blueprint spine.  A live axiom audit reports only
`propext`, `Classical.choice`, and `Quot.sound`.

The exact proof-facing fixed-`Fin 10` consumer is:

```lean
Problem97.Phase3DuplicateCenterCertificate.
  DuplicateCenterCertificate.not_realizes_of_check
    (hcheck : cert.check P = true) :
    ¬ ∃ pointOf : Fin 10 → ℝ², Realizes P pointOf
```

at
`lean/Erdos9796Proof/P97/Phase3DuplicateCenterCertificate.lean:182`.
The checker validates finite row/flip equality-closure paths and constructs
the generic `DuplicateCenterCore`.  It is compiled and its live axiom audit
again reports only the three standard axioms above, with no `sorryAx`.

### Concrete bank and import status

The existing materialized Phase-3 bank contains:

- 100 earlier saved source records, deduplicated to 23 checked certificates,
  with scoped endpoints
  `Phase3Bounded100DuplicateCenterData.source_not_realizes`; and
- one separate 14-membership obstruction
  `Phase3DuplicateCenterA2B5P0Q1R6.not_realizes`.

Those endpoints are kernel-clean under the same axiom audit.  The collector
`Phase3DuplicateCenterCertificates.lean` explicitly makes no coverage claim.
The checker, the bounded-100 data, the A2B5 instance, and the collector are
compiled but off-root: no live Lake import chain reaches them.

None of the five new clause hashes occurs under `lean/`, and every associated
sweep record has `certificate_schema: null`.  Therefore the five new cuts are
not concrete Lean certificate ingress.

### The five exact family instances

Recomputing the Python equality closures yields:

| Cube | Common labels `(p,q,r)` | Centers `(a,b)` | Clause length | Clause SHA-256 |
|---:|---|---|---:|---|
| 8 | `(0,1,3)` | `(2,8)` | 16 | `6f3e4142af8f1d88518a31146959210b5eb21827ca358fac87469b886c11301e` |
| 9 | `(0,1,2)` | `(3,7)` | 12 | `8e8f7c0903030fbf78ac69f4e92226554c643f09fdb86c20205ba7d716b08bf6` |
| 16 | `(0,1,4)` | `(6,7)` | 10 | `f014051747ec20538854b24f0f1f41d058c8dfe7a742bdc11681271f2d4cbe27` |
| 17 | `(0,1,2)` | `(3,7)` | 13 | `a3526b9958a57abfb56fffc96ec95900223368060cc4e8a0d4584a96a4ec4302` |
| 18 | `(0,3,4)` | `(2,6)` | 17 | `c2480021d5f51a346d63d897d5c6e5fcb67eafadfc34dd5f63da51b661b6ad81` |

Each is an exact instance of the already proved `DuplicateCenterCore`
family.  The external classifier has found the right mathematical
obstruction, but the five proof-free certificates and their reduction proofs
have not been emitted into Lean.

The other registry hits are weaker or less direct:

- RVOL has reachable noncollinearity-based
  `eq_of_equidistant_three_noncollinear` variants.
- Both legacy registries contain a reachable
  `three_common_equidistant_centers_eq`, also requiring explicit
  noncollinearity.

The current pairwise-distinct
`not_realizes_of_duplicateCenterCore` is the exact fit and should be preferred.

### First missing positive producer

There are two explicit gates:

1. **Concrete ingress:** for each of the five rows, materialize a
   `RowPattern`, a `DuplicateCenterCertificate`, and a kernel reduction
   `cert.check pattern = true`.  The existing checker then supplies
   non-realizability immediately.
2. **Live-route producer:** prove that a live Phase-3 assignment or
   `FaithfulCarrierPattern` supplies one of those checked row patterns.
   Importing the checker or adding five closed data theorems does not establish
   this coverage bridge.

## Final classification

| Family | Exact external evidence | Kernel consumer | Concrete new instances in Lean | Live/import-reachable closure |
|---|---|---|---|---|
| equilateral shell | yes, 32/32 exact identities | no full shell consumer; orientation bridge only | no | no |
| duplicate center | yes, five exact closure detections | yes, generic and checked `Fin 10` consumer | no | no |

The mathematically reusable result is therefore narrow but clear:

- the five duplicate-center residuals should be promoted by data emission into
  the already verified checker, then connected to a live producer;
- the shell still requires genuine kernel mathematics (32 branch replay plus
  coordinator) before its 26-membership cut can be promoted; and
- neither promotion by itself converts this offline replay into terminal
  exhaustive-search or Problem 97 closure.
