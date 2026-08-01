# s2_o0 retained-core semantic bridge design

Status: live-source audit, 2026-07-30.

## Frozen core

- Initial compact-replay formula: 81,253 clauses over DIMACS variables
  `1..49357`.
- The authenticated family ledger manifest is
  `s2-o0-family-ledgers/manifest.json`, SHA-256
  `b57f5f3df43c100ebdd6f8266a31a50f0642de579d7165cad0e77e6c69447bbc`.
- Its 21 contiguous family segments concatenate exactly to core positions
  `1..81253`.
- Each payload stores one-based local source-family ordinals as positive
  LEB128 deltas wrapped in raw ASCII85.

## Reusable valuation

`CanonicalPacket.fullRadiusValuation shadow selected` depends on `selected`
only in the three selector variables `49358..49360`.  Every s2_o0 compact-core
variable is at most `49357`.  Therefore the existing valuation instantiated at
the dummy route `.s2_o9` is the intended semantic valuation for the entire
s2_o0 initial formula; no selector clause occurs in this core.

The semantic bridge should expose this choice explicitly, rather than treating
s2_o0 as a fourth `G3Case`.

## Existing theorem-bank reuse

The G3 slice ledgers publicly expose:

- typed occurrence structures;
- exact occurrence renderers; and
- per-occurrence semantic satisfaction theorems.

The complete-family ordinal-to-occurrence decoders and their finite validity
certificates are, with few exceptions, file-private.  Consequently the public
G3 API directly proves only the G3-retained subsets, not arbitrary s2_o0
source ordinals.

The authenticated overlap audit gives:

- 54,938 s2_o0 source positions also retained by G3;
- 18 first-apex positions retained by the G3 route-selected bank only; and
- 26,297 s2_o0-only source positions.

Using only the aggregate G3 checkpoint theorem is insufficient: its coordinator
also assumes the G3 first-apex choice, while s2_o0 has the other first apex.
Family-level occurrence theorems remain reusable once the s2_o0 ordinals have
been decoded.

## Production interface

`S2O0RetainedCoreSemantics.lean` should contain:

1. a named selector-free-on-core valuation (implemented by the existing full
   radius valuation at `.s2_o9`);
2. an exact proposition saying that all 81,253 signed clauses in compact
   checkpoint zero evaluate to true under that valuation;
3. the generic semantic-boundary theorem turning that proposition plus the
   compact replay's `Unsatisfiable` theorem into `False`; and
4. only after the 21 family ordinal decoders/renderers are kernel-connected, a
   producer of the all-clauses proposition.

The first three items are source-clean bookkeeping.  Item 4 is the actual
missing positive producer.  It must not be hidden as an untracked structure
field or advertised as closure.

## Recommended implementation split

Because the existing G3 ordinal decoders are private, the smallest honest
kernel-visible implementation is to generate, in this one owned module:

- a shared ASCII85/positive-delta decoder;
- 21 typed ordinal arrays from the authenticated payloads;
- one family renderer per segment, reusing public G3 occurrence renderers and
  semantic theorems where their decoders can be reproduced;
- a `native_decide` clausewise normalization theorem against compact
  checkpoint zero; and
- the final `all_signed_sat` theorem.

The clausewise authentication theorem must compare exact clauses up to the
normalization relation expected by `ParsedClauseNormalization`; family counts
alone are not enough.

## Trust boundary

The compact RUP package is structurally verified but still needs a Lean build
and transitive axiom audit.  The ordinal manifest is externally authenticated
until its payload decoding and checkpoint equality are proved in Lean.

The terminated monolithic full-RAT replay is a non-result caused by operator
termination after about 20h37m of CPU-active work; it is not a checker failure.
