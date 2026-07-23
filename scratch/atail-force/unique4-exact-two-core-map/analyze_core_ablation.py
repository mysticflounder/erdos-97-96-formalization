#!/usr/bin/env python3
"""Ablate mapped clause groups from an authenticated exact-two input core.

This script does not establish source-level Lean closure.  It answers the
smaller, exact finite question: relative to the extracted UNSAT input core,
does deleting every clause in one mapped family/schema group leave an UNSAT
formula or admit a SAT assignment?
"""

from __future__ import annotations

import argparse
from collections import Counter
import concurrent.futures
import hashlib
import json
import os
from pathlib import Path
import random
import shutil
import subprocess
import tempfile
import time
from typing import Any


HERE = Path(__file__).resolve().parent


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(8 * 1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def parse_dimacs(path: Path) -> tuple[int, list[tuple[int, ...]]]:
    variable_count: int | None = None
    expected_clause_count: int | None = None
    clauses: list[tuple[int, ...]] = []
    with path.open("r", encoding="ascii") as stream:
        for line_number, raw in enumerate(stream, 1):
            line = raw.strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p "):
                if variable_count is not None:
                    raise ValueError(f"{path}:{line_number}: duplicate header")
                fields = line.split()
                if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                    raise ValueError(f"{path}:{line_number}: malformed header")
                variable_count = int(fields[2])
                expected_clause_count = int(fields[3])
                continue
            if variable_count is None:
                raise ValueError(f"{path}:{line_number}: clause before header")
            values = tuple(map(int, line.split()))
            if not values or values[-1] != 0 or 0 in values[:-1]:
                raise ValueError(f"{path}:{line_number}: malformed clause")
            clause = values[:-1]
            if not clause:
                raise ValueError(f"{path}:{line_number}: empty clause")
            if len(set(clause)) != len(clause):
                raise ValueError(f"{path}:{line_number}: duplicate literal")
            if any(abs(literal) > variable_count for literal in clause):
                raise ValueError(f"{path}:{line_number}: variable out of range")
            clauses.append(clause)
    if variable_count is None or expected_clause_count is None:
        raise ValueError(f"{path}: missing header")
    if len(clauses) != expected_clause_count:
        raise ValueError(
            f"{path}: header says {expected_clause_count} clauses, "
            f"parsed {len(clauses)}"
        )
    return variable_count, clauses


def schema_key(entry: dict[str, Any]) -> str | None:
    candidates = entry["schema_orientation_candidates"]
    if not candidates:
        return None
    if len(candidates) != 1:
        raise ValueError(
            "ablation requires an unambiguous schema/orientation candidate"
        )
    value = candidates[0]
    return str(value["schema"])


def schema_orientation_key(entry: dict[str, Any]) -> str | None:
    candidates = entry["schema_orientation_candidates"]
    if not candidates:
        return None
    if len(candidates) != 1:
        raise ValueError(
            "ablation requires an unambiguous schema/orientation candidate"
        )
    value = candidates[0]
    return f"{value['schema']}|orientation:{value['orientation']}"


def build_groups(
    entries: list[dict[str, Any]],
    mode: str,
    individually_removable_families: set[str] | None = None,
) -> dict[str, set[int]]:
    groups: dict[str, set[int]] = {}

    def add(group: str, index: int) -> None:
        groups.setdefault(group, set()).add(index)

    for expected_index, entry in enumerate(entries, 1):
        if int(entry["core_clause_index"]) != expected_index:
            raise ValueError("core map clause indices are not contiguous")
        family = str(entry["allocated_family"])
        if mode == "family":
            add(f"family:{family}", expected_index)
        elif mode == "family-combined":
            if individually_removable_families is None:
                raise ValueError("combined family ablation lacks prior results")
            if family in individually_removable_families:
                add(
                    "family_remove_all_individually_removable",
                    expected_index,
                )
        elif mode == "seed-record":
            if family != "seeded_full_linear_kalmanson_cut":
                continue
            key = schema_key(entry)
            if key is None or not key.startswith("p5_seeded:record:"):
                raise ValueError("seeded clause lacks a p5 seed-record mapping")
            add(key, expected_index)
            add("seeded_all_records", expected_index)
        elif mode == "seed-orientation":
            if family != "seeded_full_linear_kalmanson_cut":
                continue
            key = schema_orientation_key(entry)
            if key is None or not key.startswith("p5_seeded:record:"):
                raise ValueError("seeded clause lacks a p5 seed mapping")
            add(key, expected_index)
        else:
            raise ValueError(mode)
    if not groups:
        raise ValueError(f"mode {mode} produced no ablation groups")
    if mode == "seed-record":
        record_groups = {
            group: indices
            for group, indices in groups.items()
            if group.startswith("p5_seeded:record:")
        }
        all_seeded = groups["seeded_all_records"]
        for record, indices in record_groups.items():
            groups[f"seeded_remove_all_except:{record}"] = (
                all_seeded - indices
            )
    return groups


def write_filtered_dimacs(
    path: Path,
    variable_count: int,
    clauses: list[tuple[int, ...]],
    removed: set[int],
) -> int:
    kept_count = len(clauses) - len(removed)
    with path.open("w", encoding="ascii") as stream:
        stream.write(f"p cnf {variable_count} {kept_count}\n")
        for index, clause in enumerate(clauses, 1):
            if index in removed:
                continue
            stream.write(" ".join(map(str, clause)))
            stream.write(" 0\n")
    return kept_count


def last_solver_lines(stdout: str, limit: int = 12) -> list[str]:
    lines = [line for line in stdout.splitlines() if line.strip()]
    return lines[-limit:]


def replay_sat_model(
    stdout: str,
    variable_count: int,
    clauses: list[tuple[int, ...]],
    removed: set[int],
) -> dict[str, Any]:
    assignment: dict[int, bool] = {}
    saw_model_line = False
    for raw in stdout.splitlines():
        line = raw.strip()
        if not line.startswith("v"):
            continue
        fields = line.split()
        if not fields or fields[0] != "v":
            continue
        saw_model_line = True
        for field in fields[1:]:
            literal = int(field)
            if literal == 0:
                continue
            variable = abs(literal)
            if variable > variable_count:
                raise ValueError("SAT model variable exceeds DIMACS header")
            value = literal > 0
            previous = assignment.get(variable)
            if previous is not None and previous != value:
                raise ValueError("SAT model assigns one variable both ways")
            assignment[variable] = value
    if not saw_model_line or not assignment:
        raise ValueError("SAT solver emitted no replayable model")
    for index, clause in enumerate(clauses, 1):
        if index in removed:
            continue
        if not any(
            assignment.get(abs(literal), False) == (literal > 0)
            for literal in clause
        ):
            raise ValueError(f"SAT model falsifies retained clause {index}")
    canonical = "\n".join(
        f"{variable}={int(value)}"
        for variable, value in sorted(assignment.items())
    ).encode("ascii")
    return {
        "status": "MODEL_REPLAY_PASS",
        "assigned_variable_count": len(assignment),
        "assignment_sha256": hashlib.sha256(canonical).hexdigest(),
    }


def run_ablation(
    solver: Path,
    temp_root: Path,
    variable_count: int,
    clauses: list[tuple[int, ...]],
    group: str,
    removed: set[int],
    timeout_seconds: int,
) -> dict[str, Any]:
    safe_name = hashlib.sha256(group.encode("utf-8")).hexdigest()[:16]
    cnf_path = temp_root / f"{safe_name}.cnf"
    kept_count = write_filtered_dimacs(
        cnf_path, variable_count, clauses, removed
    )
    filtered_cnf_sha256 = sha256(cnf_path)
    command = [str(solver), str(cnf_path)]
    started = time.monotonic()
    try:
        result = subprocess.run(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            timeout=timeout_seconds,
            check=False,
        )
        elapsed = time.monotonic() - started
        if result.returncode == 10:
            status = "SAT"
            model_replay = replay_sat_model(
                result.stdout,
                variable_count,
                clauses,
                removed,
            )
        elif result.returncode == 20:
            status = "UNSAT"
            model_replay = None
        else:
            status = "ERROR"
            model_replay = None
        return {
            "group": group,
            "status": status,
            "solver_exit_code": result.returncode,
            "elapsed_seconds": elapsed,
            "removed_clause_count": len(removed),
            "kept_clause_count": kept_count,
            "filtered_cnf_sha256": filtered_cnf_sha256,
            "solver_command": command,
            "sat_model_replay": model_replay,
            "solver_tail": last_solver_lines(result.stdout),
        }
    except subprocess.TimeoutExpired as error:
        elapsed = time.monotonic() - started
        stdout = error.stdout
        if isinstance(stdout, bytes):
            stdout = stdout.decode("utf-8", errors="replace")
        return {
            "group": group,
            "status": "TIMEOUT",
            "solver_exit_code": None,
            "elapsed_seconds": elapsed,
            "removed_clause_count": len(removed),
            "kept_clause_count": kept_count,
            "filtered_cnf_sha256": filtered_cnf_sha256,
            "solver_command": command,
            "sat_model_replay": None,
            "solver_tail": last_solver_lines(stdout or ""),
        }
    finally:
        cnf_path.unlink(missing_ok=True)


def atomic_write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp-{os.getpid()}")
    with temporary.open("w", encoding="utf-8") as stream:
        json.dump(payload, stream, indent=2, sort_keys=True)
        stream.write("\n")
    os.replace(temporary, path)


def quarantine_existing(path: Path) -> Path | None:
    if not path.exists():
        return None
    stale = path.with_name(
        f"{path.stem}.rejected-stale-{time.time_ns()}{path.suffix}"
    )
    os.replace(path, stale)
    return stale


def load_family_ablation(
    profile: int, core_path: Path, map_path: Path
) -> dict[str, Any]:
    path = HERE / f"p{profile}.family-ablation.json"
    payload = json.loads(path.read_text(encoding="utf-8"))
    if (
        int(payload["profile"]) != profile
        or payload["mode"] != "family"
        or payload["core"]["sha256"] != sha256(core_path)
        or payload["map"]["sha256"] != sha256(map_path)
    ):
        raise ValueError("family ablation does not match the current core/map")
    if any(
        result["status"] in {"TIMEOUT", "ERROR"}
        for result in payload["results"]
    ):
        raise ValueError("family ablation has unresolved results")
    groups = [str(result["group"]) for result in payload["results"]]
    if len(groups) != len(set(groups)):
        raise ValueError("family ablation contains duplicate result groups")
    if int(payload["result_count"]) != len(groups):
        raise ValueError("family ablation result count is inconsistent")
    if payload["status_counts"] != {
        status: sum(
            result["status"] == status for result in payload["results"]
        )
        for status in ("SAT", "UNSAT", "TIMEOUT", "ERROR")
    }:
        raise ValueError("family ablation status counts are inconsistent")
    referenced_map = json.loads(
        Path(payload["map"]["path"]).read_text(encoding="utf-8")
    )
    family_counts = Counter(
        str(entry["allocated_family"])
        for entry in referenced_map["core_clauses"]
    )
    for result in payload["results"]:
        family = str(result["group"]).removeprefix("family:")
        expected = family_counts[family]
        if int(result["removed_clause_count"]) != expected:
            raise ValueError(
                f"family ablation removal count drifted for {family}"
            )
    return payload


def run_greedy_family(
    *,
    profile: int,
    solver: Path,
    core_path: Path,
    map_path: Path,
    map_payload: dict[str, Any],
    variable_count: int,
    clauses: list[tuple[int, ...]],
    timeout_seconds: int,
    order: str,
    seed: int,
    output: Path,
) -> None:
    family_ablation = load_family_ablation(profile, core_path, map_path)
    mandatory = {
        str(result["group"]).removeprefix("family:")
        for result in family_ablation["results"]
        if result["status"] == "SAT"
    }
    candidates = [
        str(result["group"]).removeprefix("family:")
        for result in family_ablation["results"]
        if result["status"] == "UNSAT"
    ]
    family_indices: dict[str, set[int]] = {}
    for index, entry in enumerate(map_payload["core_clauses"], 1):
        family = str(entry["allocated_family"])
        family_indices.setdefault(family, set()).add(index)
    if set(family_indices) != mandatory | set(candidates):
        raise ValueError("family census differs from prior ablation")

    if order == "largest":
        candidates.sort(key=lambda family: (-len(family_indices[family]), family))
    elif order == "smallest":
        candidates.sort(key=lambda family: (len(family_indices[family]), family))
    elif order == "random":
        random.Random(seed).shuffle(candidates)
    else:
        raise ValueError(order)

    removed_families: list[str] = []
    retained_optional: list[str] = []
    removed_indices: set[int] = set()
    steps: list[dict[str, Any]] = []
    with tempfile.TemporaryDirectory(
        prefix=f"p97-exact-two-p{profile}-greedy-family-"
    ) as temp:
        temp_root = Path(temp)
        for ordinal, family in enumerate(candidates, 1):
            proposed = removed_indices | family_indices[family]
            result = run_ablation(
                solver,
                temp_root,
                variable_count,
                clauses,
                f"try_remove:{family}",
                proposed,
                timeout_seconds,
            )
            accepted = result["status"] == "UNSAT"
            if accepted:
                removed_indices = proposed
                removed_families.append(family)
            else:
                retained_optional.append(family)
            step = {
                **result,
                "ordinal": ordinal,
                "candidate_family": family,
                "accepted_removal": accepted,
                "cumulative_removed_family_count": len(removed_families),
                "cumulative_removed_clause_count": len(removed_indices),
            }
            steps.append(step)
            print(
                json.dumps(
                    {
                        "ordinal": ordinal,
                        "family": family,
                        "status": result["status"],
                        "accepted_removal": accepted,
                        "retained_family_count": (
                            len(family_indices) - len(removed_families)
                        ),
                        "elapsed_seconds": round(
                            result["elapsed_seconds"], 3
                        ),
                    },
                    sort_keys=True,
                ),
                flush=True,
            )
            if result["status"] in {"TIMEOUT", "ERROR"}:
                raise RuntimeError(
                    f"greedy family ablation unresolved at {family}"
                )

        final = run_ablation(
            solver,
            temp_root,
            variable_count,
            clauses,
            "final_retained_family_core",
            removed_indices,
            timeout_seconds,
        )
    if final["status"] != "UNSAT":
        raise RuntimeError("final retained-family core is not verified UNSAT")

    retained_families = sorted(set(family_indices) - set(removed_families))
    payload = {
        "schema": "p97-unique4-exact-two-greedy-family-core-v1",
        "epistemic_status": (
            "SOLVER-REPORTED DELETION-MINIMAL FAMILY CORE FOR THE RECORDED "
            "ORDER, WITH REPLAYED SAT REJECTION MODELS; FINAL UNSAT IS NOT "
            "PROOF-CERTIFIED; NOT A SOURCE-LEVEL LEAN THEOREM"
        ),
        "profile": profile,
        "order": order,
        "seed": seed,
        "core": {
            "path": str(core_path.resolve()),
            "sha256": sha256(core_path),
            "variable_count": variable_count,
            "clause_count": len(clauses),
        },
        "map": {
            "path": str(map_path.resolve()),
            "sha256": sha256(map_path),
        },
        "family_ablation": {
            "path": str(
                (HERE / f"p{profile}.family-ablation.json").resolve()
            ),
            "sha256": sha256(
                HERE / f"p{profile}.family-ablation.json"
            ),
        },
        "solver": {
            "path": str(solver),
            "sha256": sha256(solver),
        },
        "analyzer": {
            "path": str(Path(__file__).resolve()),
            "sha256": sha256(Path(__file__).resolve()),
        },
        "timeout_seconds": timeout_seconds,
        "mandatory_family_count": len(mandatory),
        "mandatory_families": sorted(mandatory),
        "removed_optional_family_count": len(removed_families),
        "removed_optional_families": removed_families,
        "retained_optional_family_count": len(retained_optional),
        "retained_optional_families": sorted(retained_optional),
        "retained_family_count": len(retained_families),
        "retained_families": retained_families,
        "retained_clause_count": len(clauses) - len(removed_indices),
        "final_solver_result": final,
        "steps": steps,
    }
    atomic_write_json(output, payload)
    print(
        json.dumps(
            {
                "status": "GREEDY_FAMILY_CORE_COMPLETE",
                "output": str(output),
                "retained_family_count": len(retained_families),
                "retained_clause_count": payload["retained_clause_count"],
            },
            indent=2,
            sort_keys=True,
        )
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile", type=int, choices=(4, 5), required=True)
    parser.add_argument(
        "--mode",
        choices=(
            "family",
            "family-combined",
            "greedy-family",
            "seed-record",
            "seed-orientation",
        ),
        required=True,
    )
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--timeout-seconds", type=int, default=600)
    parser.add_argument(
        "--greedy-order",
        choices=("largest", "smallest", "random"),
        default="largest",
    )
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--solver", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    if args.workers <= 0 or args.timeout_seconds <= 0:
        parser.error("--workers and --timeout-seconds must be positive")
    if args.profile != 5 and args.mode.startswith("seed"):
        parser.error("seed ablation modes apply only to profile 5")

    solver = args.solver
    if solver is None:
        resolved = shutil.which("cadical")
        if resolved is None:
            parser.error("cadical is not on PATH; pass --solver")
        solver = Path(resolved)
    solver = solver.resolve()
    if not solver.is_file():
        parser.error(f"solver does not exist: {solver}")

    core_path = HERE / f"p{args.profile}.input-core.cnf"
    map_path = HERE / f"p{args.profile}.input-core-map.json"
    map_payload = json.loads(map_path.read_text(encoding="utf-8"))
    if int(map_payload["profile"]) != args.profile:
        raise ValueError("map profile mismatch")
    variable_count, clauses = parse_dimacs(core_path)
    if len(map_payload["core_clauses"]) != len(clauses):
        raise ValueError("map/core clause-count mismatch")
    if map_payload["core"]["sha256"] != sha256(core_path):
        raise ValueError("map/core SHA-256 mismatch")
    for clause, entry in zip(
        clauses, map_payload["core_clauses"], strict=True
    ):
        if list(clause) != entry["core_clause_literal_order"]:
            raise ValueError("map/core clause-order mismatch")

    if args.mode == "greedy-family":
        output = (
            args.output
            if args.output is not None
            else HERE
            / (
                f"p{args.profile}.greedy-family-"
                f"{args.greedy_order}-seed{args.seed}.json"
            )
        ).resolve()
        quarantine_existing(output)
        run_greedy_family(
            profile=args.profile,
            solver=solver,
            core_path=core_path,
            map_path=map_path,
            map_payload=map_payload,
            variable_count=variable_count,
            clauses=clauses,
            timeout_seconds=args.timeout_seconds,
            order=args.greedy_order,
            seed=args.seed,
            output=output,
        )
        return 0

    individually_removable_families: set[str] | None = None
    if args.mode == "family-combined":
        family_ablation = load_family_ablation(
            args.profile, core_path, map_path
        )
        individually_removable_families = {
            str(result["group"]).removeprefix("family:")
            for result in family_ablation["results"]
            if result["status"] == "UNSAT"
        }
    groups = build_groups(
        map_payload["core_clauses"],
        args.mode,
        individually_removable_families,
    )
    output = (
        args.output
        if args.output is not None
        else HERE / f"p{args.profile}.{args.mode}-ablation.json"
    ).resolve()
    stale_output = quarantine_existing(output)

    with tempfile.TemporaryDirectory(
        prefix=f"p97-exact-two-p{args.profile}-ablation-"
    ) as temp:
        temp_root = Path(temp)
        with concurrent.futures.ThreadPoolExecutor(
            max_workers=min(args.workers, len(groups))
        ) as executor:
            futures = {
                executor.submit(
                    run_ablation,
                    solver,
                    temp_root,
                    variable_count,
                    clauses,
                    group,
                    removed,
                    args.timeout_seconds,
                ): group
                for group, removed in groups.items()
            }
            results = []
            for future in concurrent.futures.as_completed(futures):
                result = future.result()
                results.append(result)
                print(
                    json.dumps(
                        {
                            "group": result["group"],
                            "status": result["status"],
                            "elapsed_seconds": round(
                                result["elapsed_seconds"], 3
                            ),
                        },
                        sort_keys=True,
                    ),
                    flush=True,
                )

    results.sort(key=lambda item: item["group"])
    payload = {
        "schema": "p97-unique4-exact-two-input-core-ablation-v1",
        "epistemic_status": (
            "SOLVER-REPORTED CLAUSE-DELETION AUDIT WITH REPLAYED SAT MODELS; "
            "UNSAT RESULTS ARE NOT PROOF-CERTIFIED; "
            "NOT A SOURCE-LEVEL LEAN THEOREM"
        ),
        "profile": args.profile,
        "mode": args.mode,
        "core": {
            "path": str(core_path.resolve()),
            "sha256": sha256(core_path),
            "variable_count": variable_count,
            "clause_count": len(clauses),
        },
        "map": {
            "path": str(map_path.resolve()),
            "sha256": sha256(map_path),
        },
        "solver": {
            "path": str(solver),
            "sha256": sha256(solver),
        },
        "analyzer": {
            "path": str(Path(__file__).resolve()),
            "sha256": sha256(Path(__file__).resolve()),
        },
        "command": [
            str(Path(__file__).resolve()),
            "--profile",
            str(args.profile),
            "--mode",
            args.mode,
            "--workers",
            str(args.workers),
            "--timeout-seconds",
            str(args.timeout_seconds),
        ],
        "quarantined_prior_output": (
            str(stale_output) if stale_output is not None else None
        ),
        "timeout_seconds": args.timeout_seconds,
        "workers": min(args.workers, len(groups)),
        "result_count": len(results),
        "status_counts": {
            status: sum(result["status"] == status for result in results)
            for status in ("SAT", "UNSAT", "TIMEOUT", "ERROR")
        },
        "interpretation": {
            "SAT": (
                "the removed group is collectively load-bearing relative to "
                "the remaining clauses of this fixed input core"
            ),
            "UNSAT": (
                "the removed group is not required by this fixed input core"
            ),
            "TIMEOUT": "unresolved under the recorded solver budget",
            "ERROR": "solver invocation failed",
        },
        "results": results,
    }
    if args.mode == "family-combined":
        family_ablation_path = (
            HERE / f"p{args.profile}.family-ablation.json"
        ).resolve()
        payload["family_ablation_dependency"] = {
            "path": str(family_ablation_path),
            "sha256": sha256(family_ablation_path),
            "individually_removable_families": sorted(
                individually_removable_families or set()
            ),
        }
    atomic_write_json(output, payload)
    print(
        json.dumps(
            {
                "status": "ABLATION_COMPLETE",
                "output": str(output),
                "status_counts": payload["status_counts"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
