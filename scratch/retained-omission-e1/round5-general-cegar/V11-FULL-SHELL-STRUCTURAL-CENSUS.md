# V11 full-shell structural census

Date: 2026-08-02

## Result

All 16 authenticated v11 `boolean_encoding.smt2.gz` formulas replayed `sat`
under Z3 4.15.3 with `random_seed=97`, `threads=1`, a 30 s per-formula
timeout, and at most eight worker processes.  Every assertion evaluated true in
the returned model.  The run took 62.71 s wall-clock.

The strongest discrete omission exposed by these particular first models is an
**apex exact-four/profile tie**:

- at a `D` apex, every exact-four circle centered at the apex must equal one of
  its two named, disjoint rich exact-four classes;
- at an `S` apex, every exact-four circle centered at the apex must be a subset
  of its named rich exact-six class.

For the three `globalK4_apex` circles, that condition fails in 30 apex
instances across 15 of the 16 replay models.  The only satisfying replay model
is `fresh_SDD_k0_d2_f1`.  Extending the same check to every active apex-centered
exact-four circle (`globalK4` plus both packet-B1 names where present) fails in
53 instances and in all 16 replay models.

This is a sound direct Boolean projection of constraints already present in
v8/v11, but it is not a closure result.  It supports a v13-style refinement
family.  In light of the separate hardest-survivor v13 canary ending `UNKNOWN`,
it does not predict that a 16-case v13 run will terminate.

The exact machine-readable census is
`v11_full_shell_structural_census.json`; the producing script is
`census_v11_full_shell_models.py`.

## Why the apex tie is sound

For a fixed rich apex `a`, v8 makes every named rich support exactly the
distance class of its named radius.  In profile `D`, the two radii are distinct,
the two exact-four supports are disjoint, and every point outside their union
has distance-class multiplicity at most three.  In profile `S`, the named
support is an exact-six distance class and every point outside it likewise has
distance-class multiplicity at most three.

Every `globalK4_a` support is an exact-four set whose four positive members all
have one common radius about `a`.  Therefore it cannot contain a point outside
the named rich union.  In profile `S` it is a four-subset of the exact-six
class.  In profile `D` it cannot mix the two distinct radii, so its four members
must be exactly one of the two exact-four classes.  The same reasoning applies
to packet-B1 exact-four circles centered at that apex.

The v12 Boolean classifier admits the rich and critical full-shell rows to its
existing power-pattern cut machinery, but it contains no direct projection of
this global-K4/packet-B1 relation to the rich profile.  The violating replay
assignments are concrete witnesses that the current Boolean relaxation does
not already entail the projection.

## Requested pair/triple capacity checks

Circle names were first collapsed by their evaluated carrier center.  A center
was counted once even if several active circle names at that center contained
the same target set.

| Carrier family | Bound checked | Violating models | Violating instances |
|---|---:|---:|---:|
| `globalK4` | each pair in at most 2 distinct centers | 0/16 | 0 |
| `globalK4` | each triple in at most 1 distinct center | 0/16 | 0 |
| all active circles, center-collapsed | each pair in at most 2 distinct centers | 0/16 | 0 |
| all active circles, center-collapsed | each triple in at most 1 distinct center | 0/16 | 0 |

Thus neither requested capacity family cuts any returned replay model.  This
negative result would have been wrong if duplicate circle names were counted as
distinct centers: across the 16 models there are 449 same-center name pairs,
237 of which have exactly equal supports.  Typical duplicates are an active
`critical_c` and `globalK4_c`, with packet B2 names sometimes joining the same
support; rich-apex names can duplicate `globalK4` or packet B1 as well.

## Structural census

“Licensed full shells” means exactly the rows returned by
`round5_cegar_v9.active_full_shells`: active critical full rows plus every rich
full class.  Global K4 and packet circles are included in the separate
all-active-circle and apex-tie analyses, not silently promoted into that
theorem-licensed set.

- Licensed rows per model: 12--17.
- Active critical centers: 7--11; licensed distinct centers: 10--14.
- Point incidence degree among licensed rows: 2--6.  The distinct-center degree
  has the same aggregate range.
- Every pair of licensed rows at distinct centers overlaps in at most two
  points in all 16 models.
- Support Hall deficiency is 0 in 11 models, 1 in four, and 2 in one.
- Private-support Hall deficiency is 12, 13, 14, 15, 16, or 17 with histogram
  `1,1,4,5,4,1`; in particular there is no useful system of private witnesses.
- The center-collapsed membership graph has 31--64 directed edges and the
  complementary nonmembership graph has 59--118.  In every model, both graphs
  have a strongly connected component containing every licensed center.
- Both graphs have cycles of every length from 2 through a model-dependent
  maximum.  The maximum cycle length distribution is: 10 in one model, 11 in
  four, 12 in five, 13 in five, and 14 in one.  Cycle/SCC structure therefore
  supplies no acyclicity cut on these models.
- No complete licensed-shell collection repeats: all 16 collection
  fingerprints are distinct.  Only seven exact `(role, center-zone, support)`
  motifs recur, each in exactly two cases.  The most frequent coarse cap-shape
  motifs are rich-A2 `(1,1,2)` across the three interiors (19 occurrences),
  rich-A1 `(1,2,1)` (12), and rich-A0 `(2,1,1)` (8), all with no apex member.

The JSON records every support, center, role, overlap histogram, point degree,
Hall matching and witness, SCC, cycle-length spectrum, duplicate-name group,
capacity histogram, apex tie, and recurring motif.

## Per-model summary

`gK4 bad` counts bad apex-global-K4 ties; `all E4 bad` also includes active
packet-B1 exact-four names.

| Case | rows | centers | support Hall def. | private Hall def. | gK4 bad | all E4 bad |
|---|---:|---:|---:|---:|---:|---:|
| `fresh_DDD_k0_d2_f1` | 16 | 13 | 1 | 16 | 2 | 3 |
| `fresh_DDD_k0_d2_f3` | 15 | 12 | 0 | 15 | 2 | 3 |
| `fresh_DDD_k0_d3_f1` | 16 | 13 | 1 | 16 | 3 | 5 |
| `fresh_DDD_k0_d3_f2` | 15 | 12 | 0 | 15 | 2 | 4 |
| `fresh_DDD_k1_d3_f0` | 15 | 12 | 0 | 15 | 2 | 4 |
| `fresh_DDD_k1_d3_f2` | 16 | 13 | 1 | 16 | 2 | 3 |
| `fresh_DDD_k2_d0_f1` | 16 | 13 | 1 | 16 | 3 | 4 |
| `fresh_DDD_k2_d0_f3` | 14 | 11 | 0 | 14 | 1 | 3 |
| `fresh_DDD_k3_d0_f1` | 14 | 11 | 0 | 14 | 1 | 3 |
| `fresh_DDD_k3_d0_f2` | 15 | 12 | 0 | 15 | 2 | 4 |
| `fresh_DDD_k3_d1_f0` | 17 | 14 | 2 | 17 | 2 | 3 |
| `fresh_DDD_k3_d1_f2` | 14 | 11 | 0 | 14 | 2 | 4 |
| `fresh_SDD_k0_d2_f1` | 13 | 11 | 0 | 13 | 0 | 2 |
| `fresh_SDD_k0_d2_f3` | 14 | 12 | 0 | 14 | 2 | 3 |
| `fresh_SDD_k0_d3_f1` | 15 | 13 | 0 | 15 | 2 | 2 |
| `fresh_SDD_k0_d3_f2` | 12 | 10 | 0 | 12 | 2 | 3 |

## Authentication

The script recomputed the SHA-256 of every compressed input and every
decompressed SMT-LIB formula, compared both to the case `result.json`, and
failed closed unless exactly 16 inputs were present.  All 32 comparisons
matched.

Aggregate manifests use sorted lines of the form
`<sha256>  <relative-path>\n`:

- compressed-input manifest:
  `59b894b28e6de256f40d2d9279d1d55ab4a3a9cb19a418eacd257d6cb0578a5f`
- decompressed-formula manifest:
  `54f3f8c4e97817593e984fe1ef208c76f511773d7f9023d49de3d9b0df076999`
- invocation JSON:
  `2a7af78eac6f2949b2ce9dc4d5808fffd6b87d3af1cb3ab9118cfb28ed76d4b5`
- census script:
  `ad7350e011738ffcc22088db874fd0d25450e9219dfbefded6ec01698d1d34e6`
- census JSON:
  `9ad05e676c9c00d2138dcdaa3fa1d24aa22e4d2983d8ada0d18b9dfcb753f8d5`

Authenticated source hashes:

| Source | SHA-256 |
|---|---|
| `round5_cegar_v8.py` | `e0c98be80b2729cf50ee1d9da6c081fc4db2095e66abfb3c85abfbf5799b7162` |
| `round5_cegar_v9.py` | `f0bcb74f5117cd0fc47e524fc222e7c1a435bc8a85785f7e4dbbc504f35cc25e` |
| `round5_cegar_v11.py` | `a5c01ed7bcf8e8ee012255bb21f85ee6f89852fdf5347cb87cc595a0c1b81c4f` |
| `round5_cegar_v12.py` | `8da7127a36dafdbce667edcd44ebef0db62eb2245ad832f373817c4bc28df1c9` |
| `schema_v11.json` | `a1a20af7a83e81b2f286fb1e036f24e5bacd3639307fd7b90b3885e404f9340a` |
| `schema_v12.json` | `db25ceb76e903cc57b14a9b9baab84228b63188c7e9994b9f21deed0c5be2bf7` |
| `diagnose_v11_boolean_models.py` | `3090c1157241c8a4d36ec934ed8fb9ff27d92d22a3ffa84b0307911e18b741f1` |
| `uv.lock` | `a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c` |

The recorded v8, v9, v11, and v11-schema hashes in the original v11 invocation
all equal the corresponding live source hashes above.

Per-case compressed/formula hashes (the replay assignment hashes are retained
in the JSON):

| Case | `.smt2.gz` SHA-256 | decompressed formula SHA-256 |
|---|---|---|
| `fresh_DDD_k0_d2_f1` | `bf5b9410838842dc645ade3e6099e369d355b6476d649af35c65147ee2185300` | `a6a8848df66458fd17e4843243178337b38efbc2bdda5db99c24566932cff9df` |
| `fresh_DDD_k0_d2_f3` | `fe1fe44ecd97954e3cfa5a1a30bdccda1a020d01867f18b034be00a87b6b831a` | `dff731a87cebf140836c0c73813f04900806f7747c422d8c5e1b81d6b847abf4` |
| `fresh_DDD_k0_d3_f1` | `b2c5a7f05fc4a731b0805bfd1af78039f21e0e5a3b846ff5405e30ceb03c3d8e` | `8a1d880de69037284728ae2f99bac5be5cde8f2aa8576646233ca02c8b364e82` |
| `fresh_DDD_k0_d3_f2` | `626d12e8035fb13f1d89bc0fa90d5d6db76d342ce192ef426674af109ea556ef` | `92a1f47a80338e93e1a598df0fc6ae83ee9a080e2baefa4f5d62d57a741f2956` |
| `fresh_DDD_k1_d3_f0` | `ee67334697d7bd032a24f5e9b7267d2cdedd22bbb83ca2ddc78b4f0dfd4a68f2` | `33deeb53cc255762cb4f12b651101fb5354ee916dfdbf5624f8a72224328a652` |
| `fresh_DDD_k1_d3_f2` | `30543052227739f07af70c98d5b48b8e95bee22a3565758a3690d52bf842db12` | `2901751a6d7c5be9c6c58259d40d368c307d6c05f9ffd81968236fcd9c9d89d1` |
| `fresh_DDD_k2_d0_f1` | `1a4f7981838b01faccf814c9975945963ed829719d154afc6b89829449e5a887` | `f9f8568077af8db76d50a3b75197d6742d999aef7ed7aded64b099d39ab31337` |
| `fresh_DDD_k2_d0_f3` | `2d6cb04445f4381a7fa76dbe33f7472221035be96c4d2682e39c7a9671850c47` | `063652709987883c6b37dec76342968d2af927b079f6bfe8f44cd9c17dc7964e` |
| `fresh_DDD_k3_d0_f1` | `05cb5a115876d6f06686b3e98ff7b216db798b316b96efd21749424e6dc25c07` | `23180e2e85e2fc1b87dd3dca57d1dfc4d2aa7fa16421dd3e580f845b20349690` |
| `fresh_DDD_k3_d0_f2` | `9d3354f6412430be6d7aeff56681069bea9074b01729f26022b9f973449603a0` | `b353b111de33f99d7b94c71eed650727f17a7aded37ddf2e538ead4774839e8f` |
| `fresh_DDD_k3_d1_f0` | `40c5111a03e56b53cca528be4bcc918e6daa4270dea0c8592e102ab8b59c5777` | `093172aed4187f759b8df0b202df4cab65981970a6a9446ca6369a2edff920a9` |
| `fresh_DDD_k3_d1_f2` | `05feb003d5897de5d8e67c7e2113db46ed7086dd44b477c9f95031e47aa6d54a` | `a9ecbd14516d9188eae486e2c8d138077a3063becbe5279cb6f12e57fee49981` |
| `fresh_SDD_k0_d2_f1` | `6823a84dae9dae6663249662d0c5393a58256681dfca5785055c6590915e7f06` | `45dfad05899ac84e5584c1686a2e2e7ea0b61144320fab29629a8f9bb176b848` |
| `fresh_SDD_k0_d2_f3` | `803819dbe6f4e3037798dc8e6615cca352edf24cee627661d6a3ef2f93782027` | `de207706f33e2f8e2f5178977c5f71b5ca67caf3244c5f01ad3e25a791823cce` |
| `fresh_SDD_k0_d3_f1` | `50751662b500ce16ffe68edaa37a599e6aca6c80a06bcbf2ff0995a847b09bfc` | `1f8654cc31507bfcfaba4c915553498fd6af21d625fa5a266a48c628e5c06c34` |
| `fresh_SDD_k0_d3_f2` | `c0e187f65290258a4845cff77ce43f026049c00d2c6c7dbd7a714ed9e5eb2df9` | `af5af07c3d3c55e6f0ac29f21f3a50f6df114002b0e780d467bc444bfc660b4a` |

## Trust boundary and implementation caveats

- This is a read-only census of one reconstructed Z3 model per authenticated
  Boolean formula.  The original v11 run did not save a complete assignment.
  The JSON therefore hashes every returned Boolean assignment; counts such as
  “30 bad apex instances” characterize this pinned replay, not every model of
  each formula.  An earlier ad-hoc replay with different solver settings chose
  a different satisfying survivor, which is why assignment hashes matter.
- The apex tie is theorem-sound for the exact-n15 v8 encoding by the mixed Real
  equal-distance/profile constraints above.  It has not been promoted to a
  Lean theorem or a certified learned-cut schema here.
- The pair/triple checks are empirical on these models.  Zero violations is not
  an entailment proof for the Boolean formulas.
- Directed simple-cycle enumeration is exhaustive for the at-most-14-center
  graphs in these models and is guarded by an internal state cap.  No cap was
  reached.
- No CEGAR loop, nonlinear/full geometric solve, Lean/Lake command, production
  edit, or nthdegree agentic theorem search was run.
