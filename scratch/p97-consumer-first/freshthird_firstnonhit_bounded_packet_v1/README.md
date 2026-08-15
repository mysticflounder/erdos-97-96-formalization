# FreshThird first-non-hit bounded packet v1

This is one stopped finite-relaxation wave against commit `604b7d4b`.  It asks
whether the new bounded Q-row deletion packet, together with the two named
cap-source rows, already forces a different-center row with at least three Q
points among the rows it names.

The answer is **SAT in both Z3 and cvc5**: the named packet can avoid that
conclusion.  This is a diagnostic obstruction only.  The live Lean consumer
quantifies over an arbitrary carrier source, while this packet deliberately
does not assert absence of anonymous sources or witnesses.

Reproduce from the repository root:

```bash
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_bounded_packet_v1/run_packet.py
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_bounded_packet_v1/validate_packet.py
```

The first command generates all SMT-LIB artifacts and solver logs.  The second
is an independent readback validator: it does not import the generator, checks
every returned SAT assignment against a separately implemented packet
contract, confirms one `check-sat` per artifact, and confirms the three direct
malformed-control contradictions.

See `INGRESS-CONTRACT.md` before interpreting any solver status,
`SOURCE-MAP.md` for exact provenance, and `RESULTS.md` for the stopped-wave
result.
