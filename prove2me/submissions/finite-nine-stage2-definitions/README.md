# Finite-nine Stage-2 public definitions

This packet closes the public-definition residual from the first finite-nine modular
packet. It supplies the exact `Batch3N9.Problem97.FiniteEndpointShell` interface used by
all nine child theorem statements, in four public definition nodes:

1. `Erdos9796FiniteNine_CountingCore` connects the authenticated namespace to eight
   already-accepted counting definition modules.
2. `Erdos9796FiniteNine_Shell` declares `FiniteEndpointShell`, its three triangle/packet
   views, and `I1`, `I2`, `I3`.
3. `Erdos9796FiniteNine_Forms` declares the three witness classes, nine geometric form
   predicates, and nine public N4d exclusion predicates.
4. `Erdos9796FiniteNine_N8Interface` declares `N4eCapContainment`, `capByIndex`, and
   `capInteriorByIndex`.

The order is strict and is also the order of the `[[definition]]` entries in
`plan.toml`. No definition file contains a theorem or proof body. The public N4d
abbreviations inline the authenticated predicate bodies instead of routing through
source-private helper names; this prevents one platform definition from depending on
a private constant in another compilation unit.

## Reproduction and validation

From `prove2me/`:

```bash
uv run python submissions/finite-nine-stage2-definitions/generate.py --check
uv run python tools/prove2me_submit.py validate \
  submissions/finite-nine-stage2-definitions/plan.toml
```

`generate.py` authenticates the retained 1.36 MB submission snapshot and the four
source units from which these declarations are extracted. It rejects any definition
file at or above one MiB and rejects proof, sorry, native/compiler, unsafe, partial, or
external-code tokens.

Both validation modes passed under Lean 4.33.1:

- `platform/Check.lean` elaborated the four definition bodies in exact dependency
  order as one self-contained check;
- the four platform modules were copied to the local Prove2Me workspace, compiled
  leaf-first as real modules, and `platform/ModuleCheck.lean` then imported only the
  final module.

The exported shell, one N4d predicate, `N4eCapContainment`, and
`capInteriorByIndex` each report the same axiom closure:
`{propext, Classical.choice, Quot.sound}`. No native/compiler trust appears.
`validation.json` records the exact hashes and checks.

The retained submission units are the primary extraction source. Independent
review also compared the normalized extracted declaration spans with tracked
revision `a46894f6078319d3001d06310531df50af0f6bbd`; the exact full-file hashes
and comparison scope are recorded in `validation.json`. This avoids treating
the older migration-worktree hashes as tracked-source custody.

## Remaining transfer work

This packet has not been uploaded and is not a proof of a child theorem. After the
completed bounded review, submit these four public definitions in plan order. Then update the
nine first-wave child theorem files to import
`Definitions.Def_Erdos9796FiniteNine_N8Interface`, elaborate the authenticated proof
fragments leaf-first, and finally submit the tiny root reduction. No network or
Prove2Me mutation was performed here.
