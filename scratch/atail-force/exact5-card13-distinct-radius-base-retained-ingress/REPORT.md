# Exact-five card-13 base/retained semantic ingress checkpoint

Date: 2026-07-22

## Result

This lane has a complete source-faithful semantic map for its owned
base/retained assertion interval in both orientations.

| orientation | current source assertions | selected union | owned/mapped | generated modules | unsupported |
| --- | ---: | ---: | ---: | ---: | --- |
| direct | 58,433 | 17,537 | 8,869 / 8,869 | 155 | none |
| mirror | 58,433 | 18,043 | 9,437 / 9,437 | 164 | none |

The authoritative maps are `direct-assertion-map.json` and
`mirror-assertion-map.json`.  Both record
`all_mapped_current_indices_revalidated = true` and
`first_unsupported = null`.

This is semantic-ingress closure, not production theorem closure: it does not
by itself remove a production `sorry`.

## Fail-closed source contract

The generator rebuilds the full current 58,433-assertion stream separately for
each orientation and accepts only the pinned inputs below.

| orientation | current source-stream SHA-256 | manifest SHA-256 |
| --- | --- | --- |
| direct | `cf71dc4d0cf46e050fbbce43dce4a02c583989d5a4cf7533442e6c26afa8aec3` | `48d2343bb1b94cf92bf823b10f57a0488b15843244b5b7ac653592301481ef1b` |
| mirror | `12c1f105e80a0094169b518b25e636ddbb263f657bb890929ed454ab28d38389` | `606dab7c425c2e06587e2cf4230ab7475ea7ac911ecd4483abd54f635b8a6604` |

For every mapped current index, generation rechecks the exact s-expression,
its SHA-256 fingerprint, the structural schema classifier, its parameters, and
the emitted theorem name.  Any manifest, source-stream, h-index, expression,
or classifier drift fails generation instead of silently reusing a historical
mapping.

Generated sources are now written only when their contents change.  This
prevents a no-op regeneration from invalidating adjacent olean freshness.

## Semantic coverage

`BaseRetainedGeometryFacts.lean` supplies the generic source theorems used by
the manifest-specialized modules.  Covered families include:

- selected-row shared-pair and row-intersection constraints;
- packed-center cardinality bounds and row/shell cardinality facts;
- retained first-row and second-apex shell implications;
- distinguished source/blocker/third-role membership and omission facts;
- first-apex strict-block counts, frontier occurrences, and disjointness; and
- left/right cover-pair omissions.

Parent-row coverage is explicit rather than definitionally inferred.  It
includes first-parent cardinality, excluded center, adjacent-cap one-hit bounds,
strict-cap lower bound, physical-cap bound where selected, source-row shared
pairs, and the direct main-four overlap implication.  The second parent row has
cardinality, excluded center, first-wrap bound, nine row-to-shell implications,
the selected physical-cap lower bound, and the selected source-row shared-pair
instances.

The orientation-specific parent-row counts are:

| schema | direct | mirror |
| --- | ---: | ---: |
| `parent_first_source_row_shared_pair` | 48 | 46 |
| `parent_second_source_row_shared_pair` | 0 | 3 |
| `parent_second_implies_shell` | 9 | 9 |
| all other selected parent-first/second schemas | 10 | 9 |

The final row counts differ by orientation because each complete-cover
manifest selects a different source orbit; they are not assumed symmetric.

## h37390 build correction

The original 64-declaration direct chunk 136 and mirror chunk 145 each ran for
more than ten minutes at roughly 5.3 GiB RSS.  An eight-way split localized the
cost to direct part 07 and mirror part 06.  Singleton splitting then identified
the same assertion in both orientations:

`h37390` / `parent_first_first_strict_card_ge_two`.

The theorem statement uses `firstRowBit (directSourceFirstRow T)`, while the
generic semantic theorem uses `parentRowBit (directSourceParentFirst P)`.
Plain `exact` caused Lean to perform pathological definitional unification.
The generated proof now constructs four Nat-specialized pointwise equalities at
indices 9 through 12 using `directSource_parentFirst_eq_firstRow`, rewrites the
target explicitly, and invokes the generic theorem.  Its Werror smoke compile
then completed in about 1.2 seconds.

The generator preserves stable chunk wrappers, emits eight-theorem leaves for
direct chunk 136 and mirror chunk 145, and emits singleton leaves for the two
profiled subranges.  Each map entry records its authoritative leaf module.

## Validation

Focused `-DwarningAsError=true` Lean validation passed with exit code 0 for:

- `BaseRetainedGeometryFacts.lean`;
- all 16 singleton item modules;
- all 16 bounded part modules;
- the direct chunk-136 and mirror chunk-145 wrappers; and
- the direct and mirror aggregate modules.

Focused axiom queries for both generated `h37390` theorems report only
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`; neither reaches `sorryAx`.

At handoff, every module named by either map had both a source file and an
adjacent olean.  Because an earlier pre-content-aware regeneration refreshed
otherwise-identical source mtimes, 138 direct and 147 mirror normal-module
oleans still predated their sources.  The coordinator lane owns the final full
source-fresh module-list validation.  Until that finishes, the aggregate exit
codes establish importability, not whole-tree freshness.
