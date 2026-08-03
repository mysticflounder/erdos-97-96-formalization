#!/usr/bin/env python3
"""Regenerate the original v16 iteration-10 assignment under v17 checks."""

from __future__ import annotations

import argparse
import gzip
import json
import time
from pathlib import Path

import z3

import round5_cegar_v12 as v12
import round5_cegar_v17 as v17


HERE = Path(__file__).resolve().parent
GENERATOR_PATH = Path(__file__).resolve()
DEFAULT_TRACE = HERE / "artifacts-v16-canary3/20260802T130201.186839Z-case-pid86814/fresh_DDD_k0_d2_f1/cegar_trace_v16.json"
DEFAULT_FROZEN = DEFAULT_TRACE.with_name("full_frozen_v16.smt2.gz")
DEFAULT_OUTPUT = HERE / "artifacts-v17-canary2/original-v16-iter10-theory-replay.json"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--trace", type=Path, default=DEFAULT_TRACE)
    parser.add_argument("--frozen", type=Path, default=DEFAULT_FROZEN)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=97)
    args = parser.parse_args()

    started = time.monotonic()
    trace = json.loads(args.trace.read_text())
    iteration = next(item for item in trace["iterations"] if item["iteration"] == 10)
    assignment = iteration["assignment"]
    universe = sorted(trace["semantic_bools"])
    if sorted(item["bool"] for item in assignment) != universe:
        raise RuntimeError("iteration-10 assignment does not exactly cover source universe")

    ctx = z3.Context()
    with gzip.open(args.frozen, "rt") as handle:
        assertions = tuple(z3.parse_smt2_string(handle.read(), ctx=ctx))
    fixes = tuple(
        v17.Fix(z3.Bool(item["bool"], ctx=ctx), bool(item["value"]))
        for item in assignment
    )
    raw_formula_hash = v17.raw_formula_sha256(assertions)
    if raw_formula_hash != trace["full_frozen_formula_sha256"]:
        raise RuntimeError("parsed frozen formula differs from v16 trace hash")

    status, model, core, record = v17.check_assignment(
        assertions, fixes, args.timeout_ms, args.seed, 10
    )
    if status != "unsat" or model is not None or record.get("lane") != "fixed_assignment_qf_lra":
        raise RuntimeError(f"expected theory UNSAT replay, got {status}: {record.get('lane')}")
    replay = record["fresh_normalized_full_replay"]
    artifact = {
        **v17.provenance(),
        "generator_source": GENERATOR_PATH.name,
        "generator_source_sha256": v17.file_sha256(GENERATOR_PATH),
        "source_v16_trace": str(args.trace.relative_to(HERE)),
        "source_v16_trace_sha256": v17.file_sha256(args.trace),
        "source_v16_frozen_blob": str(args.frozen.relative_to(HERE)),
        "source_v16_frozen_blob_sha256": v17.file_sha256(args.frozen),
        "source_iteration": 10,
        "source_iteration_sha256": v17.canonical_sha256(iteration),
        "source_raw_formula_sha256": raw_formula_hash,
        "status": status,
        "lane": record["lane"],
        "generalized": record["generalized"],
        "core_size": len(core),
        "assignment_sha256": record["assignment_sha256"],
        "universe_sha256": record["semantic_bool_universe_sha256"],
        "expected_blocker_sha256": record["expected_complete_blocker_sha256"],
        "primary": record["primary"],
        "replay": replay,
        "wall_seconds": time.monotonic() - started,
        "trust_boundary": "external exact-n15 Z3 replay; not a Lean or universal proof",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    v12.write_json(args.output, artifact)
    print(json.dumps({
        "output": str(args.output),
        "sha256": v17.file_sha256(args.output),
        "status": status,
        "replay_status": replay["replay_status"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
