# Rigid221 Card18 v1 positive-controls review

**Review result: GO; ALL POSITIVE-CONTROL PUBLICATION GATES COMPLETE.**

Date: 2026-08-28

Base revision: `6d0fcc389255ac24be267636abb8f7545d63bcb7`

Lane: `rigid221-card18-v1-positive-controls-20260828`

## Scope

This review covers `Rigid221Card18PositiveControls.lean`, its aggregate import, and the associated
scope/documentation changes. It separately records the Card18 runner failure caused by the prior
Exact-A2 source edit.

## Independent semantic review

Reviewer: `positive_controls_semantic_review` (independent read-only agent).

Result: **GO**, with no required amendment.

The reviewer checked every closed literal against the published validity predicates:

- all twelve common atoms hold;
- all fourteen BI atoms hold, with both same-deletion intersections empty;
- all twelve U atoms hold with deleted endpoint `u` and retained endpoint `xv`;
- all twelve XV atoms hold with deleted endpoint `xv` and retained endpoint `u`; and
- both crossed incidence profiles contain a false atom because `actualCenter1 = 8` is absent from
  `BO`.

The three applications of `armCnf_sat_iff` use the valid-packet-to-model direction. No declaration
claims that a finite packet reconstructs a geometric source.

## Independent trust and import review

Reviewer: `positive_controls_trust_review` (independent read-only agent).

Result: **GO** for source, trust, import reachability, and off-spine classification.

The reviewer found no `sorry`, custom axiom, `native_decide`, native/compiler trust, `unsafe`,
`partial`, implementation hook, external hook, serializer, certificate, enumerator, or solver path.
The aggregate directly imports the positive-control module, and checked import diagnostics reach all
six public declarations. Proof-blueprint classifies all six declarations off the publication spine.

The literal axiom closures are:

| Declarations | Axioms |
| --- | --- |
| `*_v1_valid_nonempty` | `propext`, `Quot.sound` |
| `*_v1_armCnf_sat` | `propext`, `Classical.choice`, `Quot.sound` |

There is no `sorryAx`, native, or external evidence.

## Author verification

- Focused `lake-build` of `Rigid221Card18PositiveControls` passed: 10,886 jobs.
- Governed aggregate `lake-build` passed: 10,887 jobs.
- The new Lean source has no line over 100 columns and no forbidden trust-token hit.
- Fresh `proof-blueprint index --refresh` indexed the module.
- Fresh `proof-blueprint axioms` reproduced the independent axiom closures above.
- `proof-blueprint search --off-spine` found the new theorems; `--spine` found none.

## Custody resolution

The initial runner failure was fail-closed source-custody drift. The Exact-A2 commit changed
`Rigid221SourceHeavy.lean` from the frozen 880,556-byte source to 882,910 bytes and changed its
SHA-256 to `f2a5b2bf20dd6063177a2622f86751ce8a3a8549d8c9c386d660193bf4a54530`.

Fresh kernel mines confirmed that the diagnostic, labeled, and crossed dependency tuples remain
unchanged at 30, 26, and 27 modules. `ExactA2CapMetric` is imported by `Rigid221SourceHeavy` but is
not declaration-reachable from the Card18 roots, so it does not enter those tuples. Commit
`79cb6289c` publishes new labeled/crossed custody-v2 receipts and predicate coverage v4, updating
only the changed source row and the 37 resulting coverage custody digests. Every v1-v3 artifact
remains byte-for-byte unchanged.

The full runner now passes Ruff, 348 historical tests in the pinned v3 snapshot, 131 live v2/v4
tests, and the aggregate build at 10,887 jobs. The positive-control mathematics and trust boundary
are verified. Exact-path staged hygiene passes with zero lane issues and no foreign staged path.
