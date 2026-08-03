# V30 ordered short-core motif audit (2026-08-02)

## Scope

This is a theorem-mining audit of an authenticated live prefix of v30
production2.  It is not a terminal v30 result, a transported clause bank, an
exact-15 closure certificate, or a proof of the uniform E1 theorem.

The validated prefix contains 10,402 UNSAT assignment outcomes and 528
projected cores of size below 100.  Literal cores remain tied to the exact case
formula against which they were replayed.

## Correct motif equivalence

The first experimental grouping forgot carrier order and was too coarse: it
collapsed the 528 cores to 223 motifs, 49 of them cross-case.  That grouping is
superseded.

The corrected graph contains all fifteen carrier points, the cyclic order

```text
13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11,
```

and the apex/interior coloring.  Exact graph isomorphism may therefore use
only the dihedral symmetries preserving the apex pattern.  It also preserves
literal family, truth value, directed endpoint role, shell identity, and shell
center attachment.

Under this equivalence the 528 cores split into 472 motifs:

- 438 occur once;
- 20 occur twice;
- 8 occur three times;
- 4 occur four times;
- 2 occur five times;
- 33 motifs occur in more than one case.

Thus literal theorem reuse is limited but nonzero.  No motif occurrence may be
transported to another case without a fresh formula replay or a checked Lean
renaming/coverage theorem.

## First bank hit

The recurring six-literal motif M0007 consists of all six directed K4
memberships on three points except one false membership.  It is exactly a
specialization of

```text
Problem97.false_of_mutualClassPair_sharedMember_thirdClassExcludes
```

from `Erdos9796Proof/P97/ATail/MutualShellPairSharedMember.lean`.  The module's
focused build passes.  Its axiom audit is

```text
[propext, Classical.choice, Quot.sound]
```

with no `sorryAx`.

The two five-occurrence four-literal motifs M0000 and M0001 occur only in SDD
cases.  They are not new metric lemmas: the exact S-profile shell at the first
apex supplies the two omitted directed memberships, after which the same
mutual-class theorem applies.  The remaining proof task is therefore a
source-faithful S-profile adapter plus checked finite-case coverage.

The bank theorem is currently marked `COMPAT-ONLY/BANK` and has no production
import consumer.  Importing it without the adapter and coverage theorem would
not close a case and receives no closure credit.

## Artifacts

```text
dba9b4ed9f046c93c908846cbacc26beb4f20a9f53888296ecde49e5971ac543  v30_short_core_motif_census.py
32df18dd0cd6631230b5778077ecebef632a034613c2e991d8fb092d5022a393  v30-production2-core-census-snapshot-20260802.json
5aa58d4a267b39ca06210785b6a7b87f601aa225bf709cb7d82dcb54a5da2992  v30-production2-ordered-short-core-motifs-snapshot-20260802.json
```
