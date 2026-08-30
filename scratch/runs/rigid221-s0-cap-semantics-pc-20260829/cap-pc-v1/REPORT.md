# Rigid221 cap-semantics control run `cap-pc-v1`

**Status:** positive control complete
**Verdict:** `CAP_SEMANTICS_POSITIVE_CONTROL_EXACT`
**Epistemic status:** EMPIRICALLY VERIFIED external exact computation
**Base and executed Git HEAD:** `55687ab3e1d47a0f8a5a3646031faf912e28ac80`

## Result

The exact rational harness derives all three caps by filtering a closed,
twelve-point carrier with the repository's closed signed-area predicate. It
checks the literal cap endpoint pattern, exactly-one membership for every
non-Moser carrier point, endpoint-erased interiors, every `oppIndex2`
rotation, a supplied unit-disk MEC certificate, all three non-obtuse Moser dot
products, exact point equality, and a strict cyclic-order certificate.

The positive fixture gives

```text
|C1|=7, |C2|=4, |C3|=4
I0={five upper points}
I1={two lower-left points}
I2={two lower-right points}
surplusIdx=0 -> oppIndex2=2, apex=v3, J=I2
MEC center=(0,0), R²=1
Moser dot products=(0,2,2)
minimum edge/nonincident signed area2=2/25
```

All 120 strict orientation checks pass. Each of the nine non-Moser points
belongs to exactly one derived cap. The exact coordinate quotient has
cardinality twelve.

## Controls and replay

All eleven diagnostic controls pass:

- closed versus strict arc endpoints;
- wrong fixed opposite-cap index;
- missing endpoint erasure;
- collinear Moser vertices;
- zero-cap central and two-cap corner probes;
- carrier filtering;
- convexity failure;
- adjacent-Moser non-obtuse failure;
- duplicate coordinates; and
- malformed serialized replay.

An independent `Fraction` implementation reproduced every cap, interior,
membership count, MEC equality, dot product, and orientation margin. Strict
serialized replay passes. A repeat run is byte-identical.

The focused suite has 29 passing tests; Ruff lint and format checks pass.
Runtime was 0.062 s real / 0.043 s user / 0.014 s system.

## Authenticated artifact

```text
artifacts/accepted-primary/cap_semantics_result.json
artifacts/accepted-repeat/cap_semantics_result.json
SHA-256:
  931ea6bf7f1f782038f89ac7b922d244a475f14214d12e22cf3b75106b6512e4
```

The executed script SHA-256 is
`be67ca9522341a1afe987fffc713add54972250307684ed05fd56f78905f4b7d`.
Git HEAD is recorded as informational metadata; strict replay pins the script
bytes and does not spuriously fail after an unrelated commit.

## Source ledger and boundary

The emitted declaration ledger uses the actual names:

```text
Problem97.signedArea2
Problem97.OnArcOpposite
Problem97.MoserTriangle
Problem97.CapTriple
Problem97.SurplusCapPacket.capInteriorByIndex
Problem97.SurplusCapPacket.oppIndex2
Problem97.MEC.NonObtuseCircumscribedMoserTriangle
```

This validates a supplied finite MEC certificate; it does not identify the
certificate with source `mec A hA`. The fixture is not the coupled-row
carrier, and legal row-support overlap/center-identification cells remain to be
instantiated. Therefore this run has
`full_L1_claim=false`, `s0_claim=false`,
`source_binding_claim=false`, and `promotion_claim=false`.

The next computational wave combines these predicates with the coupled-row
carrier and the source-legal incidence partition:

```text
(S0-I or S0-N)
× (M0, M1, or M2 shared auxiliaries)
× legal cu placement
× legal cv placement,
```

while leaving physical-center/auxiliary equalities solver-visible.
