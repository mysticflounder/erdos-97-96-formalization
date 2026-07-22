# Exact-card-13 all-one LRAT dependency slicing

Date: 2026-07-22

Status: **PROVEN FOR THE THREE CURRENT LEAN 4.27 CNFS.** Each sliced
certificate was replayed by the authoritative Lean 4.27 verified LRAT checker
with warnings as errors. No `sorryAx` occurs.

## Result

| orbit | original bytes | sliced bytes | retained additions | reduction |
| --- | ---: | ---: | ---: | ---: |
| left | 330,461,614 | 77,424,971 | 293,977 / 894,981 | 76.6% |
| middle | 357,826,547 | 75,096,168 | 314,007 / 1,007,048 | 79.0% |
| right | 353,287,580 | 77,204,554 | 298,942 / 948,941 | 78.1% |

Exact CNF, input-certificate, and sliced-certificate hashes are recorded in
`lrat-slice-manifest.json`. The persisted chunk sizes, hashes, and whole-stream
reassembly hashes are recorded in `certificates/manifest.json`.

All three `sourceExpr_unsat` theorems have axiom closure

```text
[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
```

The last two nonlogical entries are the already-approved native-decision trust
boundary. The output contains no RAT steps and introduces no extension
variables.

## Slicing rule

`slice_pure_rup_lrat.py` first checks the exact CNF and LRAT hashes. It then
rejects malformed records, negative/RAT hints, unseen or future hints,
duplicate or unordered derived IDs, extension variables, and a missing,
multiple, or nonterminal empty clause.

Starting from the final empty clause, it retains the transitive closure of
positive derived-clause hints. Deletion records are omitted. This is sound
because retaining an already available input or derived clause cannot
invalidate a RUP derivation.

The retained additions are densely renumbered from `cnfClauses + 1`, and every
derived hint is rewritten through the same checked map. Dense renumbering is
required by Lean 4.27's verified checker: its formula implementation appends
each addition and resolves hints by array index, while the syntactic action ID
is not used to choose the insertion slot. A diagnostic byte-preserving sparse
slice was dependency-closed but correctly failed Lean replay; it is not a
certificate endpoint.

## Reproduction boundary

The safe persistence endpoint is now materialized under `certificates/`. Each
75--78 MB slice is split into two newline-aligned ordinary files. Every part is
at most 48 MiB, and bytewise concatenation recovers the kernel-checked whole
hash. The generated modules use `String.join` over two relative `include_str`
terms. The generator's original single-`--certificate` mode remains available
and emits the same Lean source bytes when invoked in the same directory.

For a fresh checkout to replay these theorems without rerunning CaDiCaL, it
must have, for each orbit:

1. both exact `certificates/<orbit>/part-*.lrat.txt` files;
2. the generated `certificates/<orbit>/AllOne<Orbit>Verified.lean` module;
3. `generate_all_one_bvexpr.py`, `all_one_source_terms.py`, and the imported
   source-core encoder modules if regeneration is required; and
4. the Lean 4.27 toolchain and current transitive imports.

The original 330--358 MB LRAT files and their solver logs are not required once
the chunks are persisted. The six chunk files total 229,725,693 bytes. The
complete `certificates/` tree, including the three final generated modules,
three maps, and manifest, is 232,518,243 bytes. All files are visible to
ordinary Git staging; no force-add or ignore exception is required.

The authoritative validation command shape was

```bash
cd lean
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact5-card13-all-one-certificate-ingress/\
certificates/<orbit>/AllOne<Orbit>Verified.lean
```
