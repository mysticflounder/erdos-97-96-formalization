# V18 static length-two equality cuts

## Outcome

`round5_cegar_v18.py` implements the audited GO recommendation. It inserts a
complete reduced, profile-specific bank of length-two equality implications
into the Boolean master after the inherited Boolean prepass and before the
master's first model. The DDD bank contains exactly **15,684** distinct cuts.

The raw full formula is deliberately unchanged. Consequently:

- equality paths of length at least three still use v17's generalized-core
  extraction and fresh raw-formula replay;
- the QF_LRA fallback still blocks only the complete 825-literal assignment
  after independent normalized-full replay; and
- `UNKNOWN` remains terminal and admits no blocker.

The CLI retains v17's one-case-only policy. `smoke` runs one fixed SSS case,
`case` runs one explicit case, and broad matrix execution is rejected.

## Cut statement

For an active exact target shell `T` centered at `c`, choose a proved member
`y` and a proved nonmember `z`. If a shell centered at `z` contains both `c`
and `y`, and a shell centered at `y` contains both `z` and `c`, equality
transitivity gives `d(c,z) = d(c,y)`, contradicting exactness of `T`.

Every critical shell in this implication carries its `Used(center)` guard.
Global K4 shells are unconditional. At an apex, the profile's one S shell or
two D shells are active. Critical apex rows are omitted because the inherited
rich-apex exclusion makes them unreachable.

## Deterministic banks

| Profile | Cuts | Descriptor SHA-256 |
|---|---:|---|
| SSS | 10,920 | `a0d34a8e613a3d15bfbe2508e6f8002655b7fc95fffd856ffc1b6dcb981beaf5` |
| SSD | 12,376 | `4da9d93d4a27f359e6c006f7c64918ba252d4ccc6497f0f8b98a37e69b29076e` |
| SDS | 12,376 | `5816294a9d29511f73d86e314974b692a66208ed38a81f88bdd86c307c1096aa` |
| DSS | 12,376 | `7d8ead116b8311e2f7437aae64d49df07036db0d5076fb43ce342689f0c792f9` |
| SDD | 13,962 | `dfa68a5e69f01f447f8f18dd677da5bfbc5b49a9338788ab22f03e04a83e4542` |
| DSD | 13,962 | `066b3f9976b5e3264aed6886a454bba534f76197c47cfdbdb91a7e2421e81274` |
| DDS | 13,962 | `cec346e561c9ccbc61f8da9ec91eec544f9128f11ccf8fef64a6e9081d3468a2` |
| DDD | 15,684 | `0b6a64872273b44b656089f384128267beeca2d8c83382c4431f8b34fde673d7` |

The DDD clause-length distribution, including critical-row activation guards,
is `{6: 1764, 7: 6792, 8: 5808, 9: 1320}`.

## Frozen-trace regression

Focused tests perform no solver check. They replay only the semantic Boolean
assignments already recorded by v17 and establish:

- all 11 canary equality cores are rejected by the bank, with a static cut
  specializing each recorded core;
- 41 of 45 production equality assignments are rejected statically;
- production iterations 36, 37, 42, and 44 remain dynamic longer-path cases;
- all 19 production QF_LRA fallbacks retain 825-literal blockers marked
  `generalized: false`, and none is misclassified as a static triangle hit.

This regression authenticates the compilation and its observed coverage. It
does not itself prove the exact-n15 case UNSAT and does not promote the result
to Lean.
