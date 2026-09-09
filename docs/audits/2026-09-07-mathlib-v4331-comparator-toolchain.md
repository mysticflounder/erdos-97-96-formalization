# Comparator / lean4export pin selection for Lean v4.33.1

Date: 2026-09-07. Research only. No build was run. Every claim below that
rests on a build or a run is marked {{NEEDS_PROOF}}. Everything else is a
reading of upstream sources retrieved on 2026-09-07 through the GitHub REST
API and raw.githubusercontent.com; the exact URLs are in section 7.

Context: `docs/plans/2026-09-05-lean-mathlib-v4331-upgrade-audit.md`
section 6 (U14, U15) left the pin selection open. This document closes the
selection and records the old v4.27.0 recipe next to the new one so the two
can be diffed.

## 1. Recommendation

| Component | Pin | lean-toolchain at that pin | Note |
|---|---|---|---|
| leanprover/comparator | tag `v4.33.0` = `3927ad383f208ae977c340a91c48ac9b497d2097` | `leanprover/lean4:v4.33.0` | No `v4.33.1` tag exists. Override `lean-toolchain` to `v4.33.1` before `lake build`. |
| leanprover/lean4export | tag `v4.33.0` = `15f6055e299ad5b89345e533cc2192f4cc00f659` | `leanprover/lean4:v4.33.0` | No `v4.33.1` tag exists. This is exactly the commit comparator `v4.33.0` pins in its `lake-manifest.json`. Override `lean-toolchain` to `v4.33.1` before `lake build`. |
| ammkrn/nanoda_lib | not pinned upstream; see section 5 | Rust, no Lean toolchain | Optional second kernel. {{NEEDS_PROOF}} which branch accepts export format 3.1.0 from this exporter. |
| Zouuup/landrun | `main` per comparator README | Go | Linux only; use `scripts/fake-landrun.sh` from the comparator checkout elsewhere. |

Reasons, in order of weight:

1. Comparator `v4.33.0` and lean4export `v4.33.0` are a matched pair by
   construction: `comparator/lake-manifest.json` at `3927ad3` records
   `lean4export rev 15f6055e...`, which is the lean4export `v4.33.0` tag
   commit. The comparator's export parser is `Export.Parse` imported from
   that same lean4export revision, so the exporter output format and the
   parser cannot drift. This removes the `2.0.0` vs NDJSON trap that the
   v4.27.0 recipe had to work around.
2. Lean `v4.33.1` is a kernel soundness patch release (section 4). The
   comparator replays the solution environment in-process with the kernel
   of the Lean it was compiled with (`Main.lean`, `env.replay constMap`).
   A comparator compiled at `v4.33.0` would replay with the pre-fix kernel.
   So the comparator itself, not only the exporter, must be built at
   `v4.33.1`.
3. The exporter reads the project's `.olean` files through `importModules`.
   Lean's olean loader compares the header `githash` with the running
   binary's `LEAN_GITHASH` when Lean was built with `CHECK_OLEAN_VERSION`;
   the CMake default is OFF, and whether official release binaries enable it
   is {{NEEDS_PROOF}}. Independent of that check, an exporter built at
   `v4.33.1` reading `v4.33.1` oleans is the only combination with no
   mismatch to reason about, and it is the same override the v4.27.0
   recipe already used (rc1 to final).

Nearest-commit analysis, in case a later comparator fix is wanted:

* comparator commits after `v4.33.0` that still carry `lean-toolchain =
  v4.33.0`: `2f86e10c44b4` ("fix: comparator should not abort early when
  nanoda behaves oddly") and its merge `c0c5a52d2aff` (2026-08-10T08:34Z).
  Its `lake-manifest.json` still pins lean4export `15f6055e...`. The next
  commit `011e9d35a10a` bumps to `v4.34.0-rc1`. So `c0c5a52d2aff` is the
  last v4.33.x-toolchain comparator commit and differs from the tag by one
  nanoda-robustness fix only. Either is acceptable; the tag is preferred
  because it is a named release. Later fixes (`41a09078c793` "fix: issue
  71", multi-kernel support `6dc2594b6ee6`) sit on `v4.34.0-rc1`/`rc2` and
  are not eligible.
* lean4export commits after `v4.33.0`: the next commit is `b18d673bd29b`
  "bump toolchain to v4.34.0-rc1". There is no v4.33.x commit other than
  the tag itself. The later `0c79a8b2ac30` "omit partial declarations
  unless exportUnsafe is true" (2026-08-25) is on `v4.34.0-rc2` and is not
  eligible without a backport.
* Both `master` branches are at `leanprover/lean4:v4.34.0-rc2` (comparator
  `19e111e2141c` merge, lean4export `cacf989bd75f` merge) and must not be
  used against v4.33.1 oleans.

## 2. Tag census (retrieved 2026-09-07)

`GET /repos/leanprover/comparator/git/matching-refs/tags/v4.3`:

```
v4.30.0      1cfc5d8ad183bf65efe7accd0efc175b6b8f25b6
v4.30.0-rc1  0ff36dde148dfea82dbdcf3baf91d6e1a8195554
v4.30.0-rc2  95e46e658f5955ba1b01596d4ac668630476008c
v4.31.0      fd2e25de155523dbce1f35d410511f9f63998461
v4.31.0-rc1  3afea238d63125383110f8b59acaf11d7788c3e1
v4.31.0-rc2  5fb6e55e87cc2308e29e0916a3cb39522dbfebfd
v4.32.0      07bc4ea40f2266dcb861820a2ec1fa3244ed307f
v4.32.0-rc1  1b82ba006811f7e25d53858252372e4d85fd3921
v4.33.0      3927ad383f208ae977c340a91c48ac9b497d2097   (2026-08-10T06:47:41Z, "chore: bump toolchain to v4.33.0 (#69)")
v4.33.0-rc1  c3903e1ed0148a32cd39510707c632dc4d265514
v4.33.0-rc2  75c730e9b6ef5c2c3b334fad7c3d51fe20624c88
v4.34.0-rc1  011e9d35a10a054ed4b66d8379115ad870f2b0ce
v4.34.0-rc2  19e111e2141cf333c7daff0f64c5f24acc91dd2e
```

`GET /repos/leanprover/lean4export/git/matching-refs/tags/v4.3`:

```
v4.30.0      a3e35a584f59b390667db7269cd37fca8575e4bf
v4.30.0-rc1  fb517af7d71065b28c256348afdf764308acc369
v4.30.0-rc2  12581a6b680d8478175596338eb2d53383a323e3
v4.31.0      8554815c2dc6b7abe99ec1f08849c9759ba77947
v4.31.0-rc1  cd502a76e05515e7d3e09eaefee1dfd8349ca592
v4.31.0-rc2  b66b1cd7b8819db6059bc3d6093b22b0a380e793
v4.32.0      4e7915201d3f9f04470d9eae002fa695f7cdc589
v4.32.0-rc1  3de59f10bc4b4a0f2de698597aeb1246caa0df0a
v4.32.2      86e4a339507466921dc8c5417c8cb1de1ce7df60
v4.33.0      15f6055e299ad5b89345e533cc2192f4cc00f659   (2026-08-10T06:28:36Z, "chore: bump toolchain to v4.33.0 (#44)")
v4.33.0-rc1  af5aa64bb914c3c2c781f378088dbd38acf4f804
v4.33.0-rc2  9fb131bb100eb32ccf6836f14e4f8328d13b6792
v4.34.0-rc1  b18d673bd29b476466a51a3be1012df2ed322b10
v4.34.0-rc2  cacf989bd75f608700820f6afc595f32e7a99a4d
```

Neither repository has a `v4.33.1` tag. Neither has a `v4.33.1` or
`bump_to_v4.33.*` branch (branch listings retrieved; the bump branches
stop at `bump_to_v4.29.0-rc8` and resume at `bump-to-v4.34.0-rc2`).

All tags above are lightweight tags (`object.type = commit`), so the SHA is
the commit SHA.

## 3. What comparator v4.33.0 looks like, versus the v4.27.0 notes

The four differences the README recorded against `v4.27.0` are all gone at
`v4.33.0`:

| v4.27.0 workaround | State at v4.33.0 (`3927ad3`) |
|---|---|
| `lake build lean4export` unsupported; build exporter from its own repo | `lakefile.toml` has `[[require]] scope="leanprover" name="lean4export" rev="master"`, pinned in `lake-manifest.json` to `15f6055e...`. README flow is `lake build lean4export comparator`. Building the exporter from its own checkout still works and is what this document recommends, so the toolchain override is explicit. |
| `COMPARATOR_LANDRUN` / `COMPARATOR_LEAN4EXPORT` / `COMPARATOR_NANODA` do not exist | Present: `Main.lean` lines 299-301, `IO.getEnv "COMPARATOR_LEAN4EXPORT"` defaulting to `lean4export`, `"COMPARATOR_LANDRUN"` defaulting to `landrun`, `"COMPARATOR_NANODA"` defaulting to `nanoda_bin`. |
| No `scripts/fake-landrun.sh` | Present (`scripts/` at `v4.33.0` contains `fake-landrun.sh`). |
| Parser requires bare `2.0.0` header; must use pre-JSON exporter `bd93e5e` | Parser is `Export.Parse` from lean4export `15f6055e`; exporter emits NDJSON format `3.1.0` (`Export.lean` line 423-426, `format_ndjson.md` line 1). Same revision on both sides. |

Unchanged from v4.27.0:

* `enable_nanoda : Bool` is still a required `Config` field with no default
  (`Main.lean` line 292). `definition_names` is optional. The project's
  `comparator/config.json` already carries `enable_nanoda`.
* Nanoda invocation: comparator writes a temp JSON config with
  `use_stdin: true`, `permitted_axioms`, `unpermitted_axiom_hard_error:
  true`, `nat_extension: true`, `string_extension: true` and pipes the
  solution export to `nanoda_bin` through landrun (`Main.lean` 153-192).
  Statement identity (`compareAt`) and axiom compliance (`checkAxioms`) run
  before either kernel leg, so `enable_nanoda: false` still loses only the
  second-kernel replay.
* The Lean kernel leg is `env.replay constMap` in-process (`Main.lean`
  line 204), using the kernel of the Lean that compiled the comparator.
  Comparator `3c972ca2d4e3` (2026-07-07, before `v4.32.0`) replaced the
  `lean4checker` dependency with upstream `replay`, so there is no
  lean4checker pin to manage.

## 4. Why v4.33.1 and not v4.33.0 for the toolchain override

`GET /repos/leanprover/lean4/compare/v4.33.0...v4.33.1` lists 14 commits.
Lean tags: `v4.33.0 = d8b18978322de05a8f3dba51ef03cf5461676c17` (same commit
as `v4.33.0-rc2`), `v4.33.1 = 819816b2e0a3bf405af45ae5c7af2491d8f5bee6`,
released 2026-08-21. The release notes
(https://lean-lang.org/doc/reference/stable/releases/v4.33.1/) list kernel
fixes: #14806 (order-dependent `is_def_eq` cache), #14807 and #14843
(`is_prop` must require a sort; proof-irrelevance guard could be skipped),
#14808 (type-check generated recursors), #14582 (non-uniform occurrences in
inductive declarations), #14849 (bound kernel `Nat` literal size), #14838
(refcount overflow), #14833 (require GMP >= 6.3.0).

Consequences for the pin:

* Because comparator's Lean-kernel leg is in-process, the kernel that
  replays the export is the kernel of the comparator's build toolchain.
  Compiling comparator at `v4.33.0` would replay with a kernel that has the
  soundness bugs fixed in `v4.33.1`. Override to `v4.33.1`.
* The project's `Solution.olean` will be produced by `v4.33.1`; the exporter
  must be built with the same Lean (same argument the README makes for
  v4.27.0). Override to `v4.33.1`.
* Whether the source of comparator `3927ad3` and lean4export `15f6055e`
  compiles unchanged under `v4.33.1` is {{NEEDS_PROOF}}. The v4.33.0 to
  v4.33.1 delta is C++ kernel/runtime plus one test change; no change to
  `Lean.*` library APIs appears in the commit list, so a clean build is
  expected. The old recipe did the same rc1-to-final override successfully.

## 5. Nanoda

The comparator README at `v4.33.0` says only "compiled with a recent version
of Rust" and names no branch or commit. The CI workflow
(`.github/workflows/lean_action_ci.yml` at `v4.33.0`) does not build or run
nanoda at all, so upstream CI gives no compatibility evidence.

`ammkrn/nanoda_lib` branches on 2026-09-07: `master` at
`05055695879dfebb6628a67da88ceca6cd6b0421` (2026-08-25, "Merge pull request
#28 from ammkrn/empty_recursor_ck"); `debug` at
`e5438ac0a85a036b6dfe093aa457bc3448498014` (2025-10-26, "Test adjustment for
String.mk redefinition"). The old recipe used `debug`; it is ten months
stale relative to `master`, and the comparator's own `builtinTargets` still
carries a "TODO: fix when nanoda fixes its string handling" workaround
(`Main.lean` line 240). nanoda's README says it reads the lean4export JSON
format and supports `use_stdin`, matching the comparator's invocation.

{{NEEDS_PROOF}}: which of `master` (`0505569`) or `debug` (`e5438ac`)
accepts format `3.1.0` output from lean4export `15f6055e` and the
comparator's temp config. Try `master` first; fall back to `debug`. Record
the commit that passes.

## 6. Recipes side by side

### 6a. Old recipe, Lean v4.27.0 (verbatim from `comparator/README.md`, "Running the real comparator at Lean v4.27.0")

```bash
git clone --branch v4.27.0 https://github.com/leanprover/comparator /tmp/cmp
( cd /tmp/cmp && lake build )

git clone https://github.com/leanprover/lean4export /tmp/l4e
( cd /tmp/l4e && git checkout bd93e5e \
    && echo leanprover/lean4:v4.27.0 > lean-toolchain && lake build )

git clone --branch debug https://github.com/ammkrn/nanoda_lib /tmp/nanoda
( cd /tmp/nanoda && cargo build --release )

mkdir -p /tmp/shimbin
ln -sf /tmp/l4e/.lake/build/bin/lean4export      /tmp/shimbin/lean4export
ln -sf /tmp/nanoda/target/release/nanoda_bin     /tmp/shimbin/nanoda_bin
# on non-Linux, also drop a `landrun` shim in /tmp/shimbin (v4.30.0's
# scripts/fake-landrun.sh, renamed); on Linux use the real landrun sandbox

cd lean
PATH=/tmp/shimbin:$PATH lake env /tmp/cmp/.lake/build/bin/comparator \
  ../comparator/config.json
```

Pins in that recipe: comparator tag `v4.27.0`; lean4export commit
`bd93e5e` (2026-01-07, last pre-JSON commit, `semver = "2.0.0"`, toolchain
file overridden from `v4.27.0-rc1` to `v4.27.0`); nanoda branch `debug`;
binaries found by hardcoded `PATH` names. Recorded pass: 2026-07-26,
"Checked 41239 declarations with no errors", both kernels accepted.

### 6b. Proposed recipe, Lean v4.33.1 ({{NEEDS_PROOF}} until run)

```bash
# comparator: tag v4.33.0 = 3927ad383f208ae977c340a91c48ac9b497d2097,
# toolchain overridden v4.33.0 -> v4.33.1 so the in-process kernel replay
# uses the v4.33.1 kernel.
git clone https://github.com/leanprover/comparator /tmp/cmp
( cd /tmp/cmp && git checkout 3927ad383f208ae977c340a91c48ac9b497d2097 \
    && echo leanprover/lean4:v4.33.1 > lean-toolchain && lake build comparator )

# lean4export: tag v4.33.0 = 15f6055e299ad5b89345e533cc2192f4cc00f659, the
# same revision comparator's lake-manifest.json pins; toolchain overridden
# v4.33.0 -> v4.33.1 to match the project's oleans.
git clone https://github.com/leanprover/lean4export /tmp/l4e
( cd /tmp/l4e && git checkout 15f6055e299ad5b89345e533cc2192f4cc00f659 \
    && echo leanprover/lean4:v4.33.1 > lean-toolchain && lake build )

# nanoda: branch/commit to be selected by test, see section 5.
git clone https://github.com/ammkrn/nanoda_lib /tmp/nanoda
( cd /tmp/nanoda && git checkout 05055695879dfebb6628a67da88ceca6cd6b0421 \
    && cargo build --release )

cd lean
COMPARATOR_LEAN4EXPORT=/tmp/l4e/.lake/build/bin/lean4export \
COMPARATOR_NANODA=/tmp/nanoda/target/release/nanoda_bin \
COMPARATOR_LANDRUN=/tmp/cmp/scripts/fake-landrun.sh \
  lake env /tmp/cmp/.lake/build/bin/comparator ../comparator/config.json
# On Linux replace COMPARATOR_LANDRUN with a real landrun built from
# Zouuup/landrun main, and wrap in the systemd-run line from the comparator
# README.
```

Diff of the two recipes:

* comparator: `v4.27.0` tag, no toolchain override -> `3927ad3` (`v4.33.0`
  tag) with toolchain override to `v4.33.1`.
* lean4export: `bd93e5e` pre-JSON with override to `v4.27.0` -> `15f6055e`
  (`v4.33.0` tag) with override to `v4.33.1`. The format-version trap is
  gone; parser and exporter are the same revision.
* nanoda: `debug` branch -> commit selected by test (section 5).
* binary discovery: `PATH` shim directory with literal names ->
  `COMPARATOR_*` environment variables (still fall back to `PATH` names).
* landrun shim: had to be fetched from `v4.30.0` -> ships in the checkout.
* `enable_nanoda` remains required in `config.json`.

The comparator's own README also builds the exporter as a Lake dependency
(`lake build lean4export comparator` inside the comparator checkout, binary
at `.lake/packages/lean4export/.lake/build/bin/lean4export`). That path is
acceptable only if the comparator checkout's `lean-toolchain` has already
been overridden to `v4.33.1`, because the dependency is built with the
root package's toolchain. The separate-checkout form above makes the
override visible in the recipe and is preferred.

## 7. Evidence URLs (all retrieved 2026-09-07)

Tags, branches, commits:

* https://api.github.com/repos/leanprover/comparator/git/matching-refs/tags/v4.3
* https://api.github.com/repos/leanprover/lean4export/git/matching-refs/tags/v4.3
* https://api.github.com/repos/leanprover/comparator/branches?per_page=100
* https://api.github.com/repos/leanprover/lean4export/branches?per_page=100
* https://api.github.com/repos/leanprover/comparator/commits?sha=master&per_page=40
* https://api.github.com/repos/leanprover/lean4export/commits?sha=master&per_page=40
* https://api.github.com/repos/leanprover/comparator/commits/3927ad383f208ae977c340a91c48ac9b497d2097
* https://api.github.com/repos/leanprover/lean4export/commits/15f6055e299ad5b89345e533cc2192f4cc00f659
* https://api.github.com/repos/leanprover/lean4/git/matching-refs/tags/v4.33
* https://api.github.com/repos/leanprover/lean4/compare/v4.33.0...v4.33.1
* https://api.github.com/repos/leanprover/lean4/releases/tags/v4.33.1
* https://api.github.com/repos/ammkrn/nanoda_lib/branches?per_page=100
* https://api.github.com/repos/ammkrn/nanoda_lib/commits/master
* https://api.github.com/repos/ammkrn/nanoda_lib/commits/debug

File contents at pinned revisions:

* https://raw.githubusercontent.com/leanprover/comparator/v4.33.0/lean-toolchain (`leanprover/lean4:v4.33.0`)
* https://raw.githubusercontent.com/leanprover/comparator/master/lean-toolchain (`leanprover/lean4:v4.34.0-rc2`, moving)
* https://raw.githubusercontent.com/leanprover/comparator/c0c5a52d2aff/lean-toolchain (`v4.33.0`)
* https://raw.githubusercontent.com/leanprover/comparator/2f86e10c44b4/lean-toolchain (`v4.33.0`)
* https://raw.githubusercontent.com/leanprover/comparator/v4.33.0/lakefile.toml
* https://raw.githubusercontent.com/leanprover/comparator/v4.33.0/lake-manifest.json
* https://raw.githubusercontent.com/leanprover/comparator/c0c5a52d2aff/lake-manifest.json
* https://raw.githubusercontent.com/leanprover/comparator/v4.33.0/README.md
* https://raw.githubusercontent.com/leanprover/comparator/v4.33.0/Main.lean
* https://raw.githubusercontent.com/leanprover/comparator/v4.33.0/.github/workflows/lean_action_ci.yml
* https://api.github.com/repos/leanprover/comparator/contents/scripts?ref=v4.33.0
* https://raw.githubusercontent.com/leanprover/comparator/v4.33.0/tests/projects/simple_mismatch/config.json
* https://raw.githubusercontent.com/leanprover/lean4export/v4.33.0/lean-toolchain (`leanprover/lean4:v4.33.0`)
* https://raw.githubusercontent.com/leanprover/lean4export/master/lean-toolchain (`leanprover/lean4:v4.34.0-rc2`, moving)
* https://raw.githubusercontent.com/leanprover/lean4export/v4.33.0/lakefile.toml
* https://raw.githubusercontent.com/leanprover/lean4export/v4.33.0/lake-manifest.json (no packages)
* https://raw.githubusercontent.com/leanprover/lean4export/v4.33.0/Export.lean (format version `3.1.0`)
* https://raw.githubusercontent.com/leanprover/lean4export/v4.33.0/Export/Parse.lean
* https://raw.githubusercontent.com/leanprover/lean4export/v4.33.0/format_ndjson.md
* https://raw.githubusercontent.com/leanprover/lean4export/v4.33.0/README.md
* https://raw.githubusercontent.com/leanprover/lean4/v4.33.1/src/library/module.cpp (olean header githash check under `LEAN_CHECK_OLEAN_VERSION`)
* https://raw.githubusercontent.com/leanprover/lean4/v4.33.1/src/CMakeLists.txt (`CHECK_OLEAN_VERSION` option, default OFF)
* https://raw.githubusercontent.com/ammkrn/nanoda_lib/master/README.md
* https://lean-lang.org/doc/reference/stable/releases/v4.33.1/

Repository sources: `comparator/README.md` in this worktree (old recipe,
section "Running the real comparator at Lean v4.27.0");
`docs/plans/2026-09-05-lean-mathlib-v4331-upgrade-audit.md` section 6.

## 8. Open items

* {{NEEDS_PROOF}} comparator `3927ad3` builds under `leanprover/lean4:v4.33.1`.
* {{NEEDS_PROOF}} lean4export `15f6055e` builds under `v4.33.1` and exports this project's `Challenge`/`Solution` oleans.
* {{NEEDS_PROOF}} nanoda commit that accepts the resulting export (section 5).
* {{NEEDS_PROOF}} whether official Lean release binaries enforce the olean githash check; irrelevant if the override above is used, relevant only if someone tries a `v4.33.0`-built exporter against `v4.33.1` oleans.
* {{NEEDS_PROOF}} end-to-end pass on `comparator/config.json` with `enable_nanoda: true`; record declaration count and kernel messages the way the README does for 2026-07-26.
* After the run, replace the v4.27.0 section of `comparator/README.md` with the validated v4.33.1 recipe (out of scope for this document; README not edited).
