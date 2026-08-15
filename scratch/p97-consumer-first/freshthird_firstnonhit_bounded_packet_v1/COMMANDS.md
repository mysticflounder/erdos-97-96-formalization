# Commands

Run from `/Users/adam/projects/math-projects/erdos-97-96-formalization`:

```bash
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_bounded_packet_v1/run_packet.py
uv run python scratch/p97-consumer-first/freshthird_firstnonhit_bounded_packet_v1/validate_packet.py
```

The exact ten solver invocations emitted by the runner are recorded in
`commands.log`.  They use `z3 -smt2 -T:30` and
`cvc5 --lang smt2 --tlimit 30000`, with one input artifact per process.
