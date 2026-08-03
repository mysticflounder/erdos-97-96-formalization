# V14 packet-B1/apex-profile projection admission

## Decision

Admit `apex_packet_b1_profile_compatibility` only in the exact-`n = 15`
retained-omission search slice. It is not admitted as a universal consequence
of the live all-large target.

The exact antecedent is:

- carrier cardinality exactly 15;
- all three Moser caps have cardinality at least six, hence exactly six;
- the named rich classes satisfy `ApexRichClassStructure`; and
- each packet `B1` is the support of a `SelectedFourClass` at the first apex.

For each of the two packets, v14 asserts:

- first-apex profile `S`: `B1` is contained in rich shell `[0,0]`;
- first-apex profile `D`: `B1` equals rich shell `[0,0]` or `[0,1]`.

## Lean provenance

The projection is sourced from namespace
`Problem97.ATailExactFifteenApexProfile`, principally:

- `capByIndex_card_eq_six_of_card_eq_fifteen`;
- `exactCapProfile_of_card_eq_fifteen`;
- `selectedFourClass_support_subset_richSixClass_of_cap_card_eq_six`;
- `twoRichClasses_card_eq_four_of_cap_card_eq_six`; and
- `selectedFourClass_support_eq_one_of_twoRichClasses_of_cap_card_eq_six`.

Every v14 invocation/result provenance record authenticates this source under
`source_contract.files.exact_fifteen_apex_profile`, with repository-relative
path and SHA-256 recomputed from the live file. The encoder and schema are
separately hashed. This admission document records the mathematical mapping;
external Z3 runs remain evidence about the finite encoding, not Lean closure.

## Load-bearing caveat

`SelectedFourClass.support` is a chosen four-subset of a radius class. Therefore
`x ∉ B1` does not imply that `x` is outside the underlying circle, and v14 must
not derive a nonzero power entry from the complement of `B1`.

This is why profile `S` uses only inclusion. Profile `D` may use equality
because the exact-six-cap theorem makes each of the two rich classes have
cardinality exactly four, while `B1` has cardinality four.

## Encoding and tests

There are exactly two packet `B1` supports in every normalized case. The new
tracked family therefore contains:

- 30 Boolean implications when the first profile is `S` (`2 × 15`); or
- 2 Boolean disjunctions of support equalities when it is `D`.

`test_round5_cegar_v14.py` checks both counts, both semantic branches, Boolean
prepass inclusion, provenance/runtime isolation, authenticated theorem-source
path/hash freshness, and—critically—a satisfiable strict-subset model showing
that `S` does not accidentally force equality.

Verification performed:

```text
uv run python -m unittest -v test_round5_cegar_v14.py
Ran 7 tests — OK

actual Encoding construction:
SDD 2 packets 30 tracked constraints
DDD 2 packets 2 tracked constraints
```

No v14 production matrix was launched. An earlier one-worker smoke predates the
addition of the authenticated exact-fifteen source entry and is therefore
superseded; it must not be treated as evidence for the launch-ready v14 bytes:

```text
artifacts-v14-smoke/20260802T112533.059088Z-smoke-pid83721
```

The current source-contract path/hash is covered by the focused tests above.
`run_v14_v11_16_replay.py` is the authenticated production canary driver.
