#!/usr/bin/env python3
"""Bounded census of the observed 21-bit v19 basin (analysis only)."""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from collections import Counter
from pathlib import Path

import z3

import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v18 as v18
import round5_cegar_v19 as v19


def sha(value: object) -> str:
    return v19.canonical_sha256(value)


def load_prefix(path: Path, count: int, expected_head: str) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []
    previous: str | None = None
    for sequence in range(count):
        record = json.loads((path / f"{sequence:06d}.json").read_text())
        assert record["sequence"] == sequence
        assert record["previous_record_sha256"] == previous
        assert record["payload_sha256"] == sha(record["payload"])
        body = {key: record[key] for key in (
            "sequence", "previous_record_sha256", "payload", "payload_sha256"
        )}
        assert record["record_sha256"] == sha(body)
        previous = record["record_sha256"]
        records.append(record)
    if previous != expected_head:
        raise RuntimeError(f"snapshot head mismatch: {previous}")
    return records


def build_master(seed: int) -> tuple[tuple[z3.BoolRef, ...], tuple[z3.BoolRef, ...], z3.Solver, dict[str, object]]:
    case = v19.Case("fresh", "DDD", 0, 2, 1)
    encoding = v16.Encoding(case, timeout_ms=3_600_000, seed=seed)
    tracked, _ = encoding.make_solver()
    for family in sorted(encoding.groups):
        tracked.add(z3.Bool(f"track_{family}"))
    gate = v12.FullSolverGate(tracked)
    prepass, learned, master = v12.run_boolean_prepass(
        encoding, gate, v12.PrepassConfig(30_000, 2_000_000, 256), seed,
        validated_miner_sha256=str(v19.provenance()["miner_v9_script_sha256"]),
    )
    if prepass.get("all_learned_cuts_theorem_sound_and_provenance_complete") is not True:
        raise RuntimeError("prepass admission audit failed")
    _, bank = v18.add_static_triangle_bank(master, case.profiles)
    raw = tuple(tracked.assertions())
    grouped = tuple(c for family in sorted(encoding.groups) for c in encoding.groups[family])
    semantic = v16.collect_semantic_bools((*grouped, *raw))
    return raw, semantic, master, {
        "raw_formula_sha256": v17.raw_formula_sha256(raw),
        "master_formula_sha256": v16.formula_sha256(master),
        "master_assertion_count": len(master.assertions()),
        "semantic_bool_count": len(semantic),
        "learned_cut_count": len(learned),
        "static_bank": bank,
    }


def as_values(payload: dict[str, object]) -> dict[str, bool]:
    return {str(item["bool"]): bool(item["value"]) for item in payload["assignment"]}


def blocker(values: dict[str, bool], variables: dict[str, z3.BoolRef]) -> z3.BoolRef:
    fixes = tuple(v19.Fix(variables[name], values[name]) for name in sorted(values))
    return v16.blocker_for_core(fixes)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--journal", type=Path, required=True)
    parser.add_argument("--records", type=int, required=True)
    parser.add_argument("--head", required=True)
    parser.add_argument("--max-models", type=int, default=100_000)
    parser.add_argument("--deadline-seconds", type=float, default=300.0)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    parser.add_argument("--seed", type=int, default=97)
    args = parser.parse_args()
    started = time.monotonic()
    records = load_prefix(args.journal, args.records, args.head)
    raw, semantic, master, formula = build_master(args.seed)
    variables = {str(item): item for item in semantic}

    proposals: list[dict[str, object]] = []
    outcomes: list[dict[str, object]] = []
    for index, record in enumerate(records):
        payload = record["payload"]
        expected_phase = "proposed" if index % 2 == 0 else "outcome"
        if payload.get("phase") != expected_phase or payload.get("iteration") != index // 2:
            raise RuntimeError(f"phase/iteration mismatch at {index}")
        if expected_phase == "proposed":
            if payload["assignment_sha256"] != sha(payload["assignment"]):
                raise RuntimeError(f"assignment hash mismatch at {index}")
            proposals.append(payload)
        else:
            if payload["assignment_sha256"] != proposals[-1]["assignment_sha256"]:
                raise RuntimeError(f"outcome identity mismatch at {index}")
            if payload.get("status") != "unsat":
                raise RuntimeError(f"non-UNSAT outcome at {index}")
            outcomes.append(payload)

    assignments = [as_values(payload) for payload in proposals]
    if any(set(values) != set(variables) for values in assignments):
        raise RuntimeError("semantic universe mismatch")
    raw_hashes = {payload["frozen_full_formula_sha256"] for payload in proposals}
    if raw_hashes != {formula["raw_formula_sha256"]}:
        raise RuntimeError("raw formula hash mismatch")
    invariant = sorted(name for name in variables if len({a[name] for a in assignments}) == 1)
    varying = sorted(set(variables) - set(invariant))
    if (len(invariant), len(varying)) != (804, 21):
        raise RuntimeError(f"unexpected split {len(invariant)}/{len(varying)}")

    for ordinal, outcome in enumerate(outcomes):
        b = outcome["blocker"]
        core = b["projected_core"]
        if len(core) != 825 or b["projected_core_sha256"] != sha(core):
            raise RuntimeError(f"bad full core at {ordinal}")
        reconstructed_blocker = blocker(assignments[ordinal], variables)
        reconstructed = reconstructed_blocker.sexpr()
        if b["blocker"] != reconstructed or b["blocker_sha256"] != hashlib.sha256(reconstructed.encode()).hexdigest():
            raise RuntimeError(f"bad blocker at {ordinal}")
        master.add(reconstructed_blocker)

    cube = [variables[name] == z3.BoolVal(assignments[0][name]) for name in invariant]
    outside = z3.Solver()
    outside.set(timeout=args.timeout_ms, random_seed=args.seed, threads=1)
    outside.add(*master.assertions(), z3.Not(z3.And(*cube)))
    outside_started = time.monotonic()
    outside_result = outside.check()
    outside_elapsed = time.monotonic() - outside_started
    if outside_result == z3.unknown:
        raise RuntimeError(f"outside-cube check unknown: {outside.reason_unknown()}")

    census = z3.Solver()
    census.set(timeout=args.timeout_ms, random_seed=args.seed, threads=1)
    census.add(*master.assertions(), *cube)
    masks: list[int] = []
    terminal = "limit"
    deadline = time.monotonic() + args.deadline_seconds
    while len(masks) < args.max_models:
        if time.monotonic() >= deadline:
            terminal = "deadline"
            break
        result = census.check()
        if result == z3.unsat:
            terminal = "exhausted"
            break
        if result == z3.unknown:
            terminal = "unknown"
            break
        model = census.model()
        bits = [z3.is_true(model.eval(variables[name], model_completion=True)) for name in varying]
        mask = sum((1 << index) for index, value in enumerate(bits) if value)
        masks.append(mask)
        census.add(z3.Or(*(variables[name] != z3.BoolVal(value) for name, value in zip(varying, bits, strict=True))))

    weight_hist = Counter(mask.bit_count() for mask in masks)
    truth_counts = {name: sum(bool(mask & (1 << i)) for mask in masks) for i, name in enumerate(varying)}
    result = {
        "scheme": "v19-observed-21bit-projection-census/v1",
        "journal": {"record_count": args.records, "head_sha256": args.head, "proposals": len(proposals), "completed_unsat": len(outcomes), "pending": len(proposals) - len(outcomes)},
        "formula": formula,
        "invariant_count": len(invariant),
        "varying_count": len(varying),
        "varying_names": varying,
        "invariant_literals_sha256": sha([{ "bool": n, "value": assignments[0][n]} for n in invariant]),
        "outside_observed_cube": {"outcome": str(outside_result), "elapsed_seconds": outside_elapsed},
        "projection": {
            "scope": "master plus completed blockers, conditioned on observed 804-literal cube",
            "terminal": terminal,
            "enumerated_distinct_models": len(masks),
            "exact": terminal == "exhausted",
            "unconditional_upper_bound": (1 << len(varying)) - len(outcomes),
            "sorted_masks_sha256": sha(sorted(masks)),
            "hamming_weight_histogram": dict(sorted(weight_hist.items())),
            "truth_counts": truth_counts,
        },
        "elapsed_seconds": time.monotonic() - started,
        "trust": "authenticated journal/formula reconstruction plus Z3 SAT/UNSAT; external solver evidence, not Lean/kernel closure",
    }
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
