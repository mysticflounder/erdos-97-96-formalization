# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Minimize and cross-check cvc5 UNSAT row systems from the metric frontier."""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import shutil
import subprocess
import tempfile
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Mapping, Sequence

from .metric_realizability_cvc5 import (
    DEFAULT_OUT,
    HERE,
    SCHEMA as INPUT_SCHEMA,
    _parse_status,
    _run_query,
    build_smt2,
)


SCHEMA = "p97-global-confinement-metric-realizability-cvc5-cores-v1"
DEFAULT_CORE_OUT = HERE / "metric_realizability_cvc5_cores.json"
DEFAULT_CORE_MARKDOWN = HERE / "metric_realizability_cvc5_cores.md"


def _run_z3_query(
    *,
    z3: str,
    system: Mapping[str, Any],
    stage: str,
    timeout_s: float,
    row_indices: Sequence[int],
    equality_atoms: Sequence[tuple[int, int]] | None = None,
) -> dict[str, Any]:
    smt2, counts = build_smt2(system, stage, row_indices, equality_atoms)
    command = (z3, "-in", f"-T:{max(1, math.ceil(timeout_s))}")
    started = time.monotonic()
    try:
        process = subprocess.run(
            command,
            input=smt2,
            text=True,
            capture_output=True,
            timeout=timeout_s + 10.0,
            check=False,
        )
    except subprocess.TimeoutExpired as error:
        return {
            "solver": "z3",
            "stage": stage,
            "status": "UNKNOWN",
            "reason": "subprocess-timeout",
            "elapsed_sec": round(time.monotonic() - started, 6),
            "constraint_counts": counts,
            "stdout": (error.stdout or "")[-2000:],
            "stderr": (error.stderr or "")[-2000:],
        }
    status = _parse_status(process.stdout)
    diagnostics = "\n".join(
        text.strip() for text in (process.stdout, process.stderr) if text.strip()
    )
    result: dict[str, Any] = {
        "solver": "z3",
        "stage": stage,
        "status": status or "ERROR",
        "elapsed_sec": round(time.monotonic() - started, 6),
        "constraint_counts": counts,
        "return_code": process.returncode,
    }
    if status == "UNKNOWN" or (status is None and diagnostics.strip().lower() == "timeout"):
        result["status"] = "UNKNOWN"
        result["reason"] = diagnostics[-2000:] or "z3-returned-unknown"
    elif status is None or process.returncode != 0:
        result["status"] = "ERROR"
        result["reason"] = diagnostics[-2000:] or "z3-produced-no-verdict"
    return result


def _classify_crosscheck(cvc5_status: str, z3_status: str) -> str:
    if cvc5_status != "UNSAT":
        return "CORE_NOT_REVALIDATED"
    if z3_status == "UNSAT":
        return "CROSSCHECKED_UNSAT"
    if z3_status == "UNKNOWN":
        return "CVC5_UNSAT_Z3_UNKNOWN"
    if z3_status == "SAT":
        return "SOLVER_DISAGREEMENT"
    return "CVC5_UNSAT_Z3_ERROR"


def _all_equality_atoms(
    system: Mapping[str, Any], row_indices: Sequence[int]
) -> list[tuple[int, int]]:
    return [
        (row_index, int(point))
        for row_index in row_indices
        for point in system["rows"][row_index]["support"][1:]
    ]


def _minimize_equality_atoms(
    system: Mapping[str, Any],
    *,
    cvc5: str,
    z3: str,
    stage: str,
    row_indices: Sequence[int],
    deletion_timeout_s: float,
    validation_timeout_s: float,
) -> dict[str, Any]:
    current = _all_equality_atoms(system, row_indices)
    attempts = []
    for atom in tuple(current):
        trial = tuple(candidate for candidate in current if candidate != atom)
        verdict = _run_query(
            cvc5=cvc5,
            system=system,
            stage=stage,
            timeout_s=deletion_timeout_s,
            row_indices=row_indices,
            equality_atoms=trial,
        )
        removed = verdict["status"] == "UNSAT"
        attempts.append(
            {
                "atom": list(atom),
                "status": verdict["status"],
                "elapsed_sec": verdict["elapsed_sec"],
                "removed": removed,
            }
        )
        if removed:
            current = list(trial)
    atoms = tuple(current)
    cvc5_validation = _run_query(
        cvc5=cvc5,
        system=system,
        stage=stage,
        timeout_s=validation_timeout_s,
        row_indices=row_indices,
        equality_atoms=atoms,
    )
    z3_validation = _run_z3_query(
        z3=z3,
        system=system,
        stage=stage,
        timeout_s=validation_timeout_s,
        row_indices=row_indices,
        equality_atoms=atoms,
    )
    return {
        "stage": stage,
        "original_atom_count": len(_all_equality_atoms(system, row_indices)),
        "atom_count": len(atoms),
        "atoms": [list(atom) for atom in atoms],
        "deletion_attempts": attempts,
        "cvc5_validation": cvc5_validation,
        "z3_validation": z3_validation,
        "crosscheck_status": _classify_crosscheck(
            cvc5_validation["status"], z3_validation["status"]
        ),
    }


def _minimize_one(
    system: Mapping[str, Any],
    *,
    cvc5: str,
    z3: str,
    deletion_timeout_s: float,
    validation_timeout_s: float,
) -> dict[str, Any]:
    stage_status = {
        str(item["stage"]): str(item["status"]) for item in system["stages"]
    }
    stage = (
        "convex-only-relaxation"
        if stage_status.get("convex-only-relaxation") == "UNSAT"
        else "full-convex"
    )
    current = list(range(len(system["rows"])))
    attempts = []
    for row_index in tuple(current):
        trial = tuple(index for index in current if index != row_index)
        verdict = _run_query(
            cvc5=cvc5,
            system=system,
            stage=stage,
            timeout_s=deletion_timeout_s,
            row_indices=trial,
        )
        removed = verdict["status"] == "UNSAT"
        attempts.append(
            {
                "row_index": row_index,
                "trial_row_indices": list(trial),
                "status": verdict["status"],
                "elapsed_sec": verdict["elapsed_sec"],
                "removed": removed,
            }
        )
        if removed:
            current = list(trial)

    core_indices = tuple(current)
    cvc5_validation = _run_query(
        cvc5=cvc5,
        system=system,
        stage=stage,
        timeout_s=validation_timeout_s,
        row_indices=core_indices,
    )
    z3_validation = _run_z3_query(
        z3=z3,
        system=system,
        stage=stage,
        timeout_s=validation_timeout_s,
        row_indices=core_indices,
    )
    convex_only_validation = None
    if stage == "full-convex":
        convex_only_validation = _run_query(
            cvc5=cvc5,
            system=system,
            stage="convex-only-relaxation",
            timeout_s=validation_timeout_s,
            row_indices=core_indices,
        )
    atom_stage = (
        "convex-only-relaxation"
        if stage == "convex-only-relaxation"
        or (
            convex_only_validation is not None
            and convex_only_validation["status"] == "UNSAT"
        )
        else "full-convex"
    )
    atom_core = _minimize_equality_atoms(
        system,
        cvc5=cvc5,
        z3=z3,
        stage=atom_stage,
        row_indices=core_indices,
        deletion_timeout_s=deletion_timeout_s,
        validation_timeout_s=validation_timeout_s,
    )

    return {
        "system_id": system["system_id"],
        "n": system["n"],
        "profile": system["profile"],
        "order": system["order"],
        "source": system["sources"][0],
        "minimized_stage": stage,
        "original_row_count": len(system["rows"]),
        "core_row_count": len(core_indices),
        "core_row_indices": list(core_indices),
        "core_rows": [system["rows"][index] for index in core_indices],
        "deletion_attempts": attempts,
        "cvc5_validation": cvc5_validation,
        "z3_validation": z3_validation,
        "convex_only_validation": convex_only_validation,
        "atom_core": atom_core,
        "crosscheck_status": _classify_crosscheck(
            cvc5_validation["status"], z3_validation["status"]
        ),
    }


def _atomic_json(path: Path, payload: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        "w", encoding="utf-8", dir=path.parent, delete=False
    ) as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        temporary = Path(handle.name)
    temporary.replace(path)


def _render_markdown(payload: Mapping[str, Any]) -> str:
    lines = [
        "# Minimized cvc5 convex-order cores",
        "",
        "## Scope",
        "",
        "These are deletion-minimal relative to the recorded cvc5 run and the",
        "configured timeout, not formal minimal-unsatisfiable-subset proofs.",
        "Every retained core is re-run at the validation timeout and submitted",
        "as identical SMT-LIB to Z3. An UNSAT result remains a bounded trusted",
        "computation and is not a Lean theorem.",
        "",
        "## Results",
        "",
        "| System | Stage | Rows | Atoms | cvc5 | Z3 | Cross-check |",
        "|---|---|---:|---:|---|---|---|",
    ]
    for result in payload["results"]:
        lines.append(
            f"| `{result['system_id']}` | `{result['minimized_stage']}` | "
            f"{result['core_row_count']}/{result['original_row_count']} | "
            f"{result['atom_core']['atom_count']}/"
            f"{result['atom_core']['original_atom_count']} | "
            f"{result['atom_core']['cvc5_validation']['status']} | "
            f"{result['atom_core']['z3_validation']['status']} | "
            f"`{result['atom_core']['crosscheck_status']}` |"
        )
    for result in payload["results"]:
        lines.extend(
            (
                "",
                f"### `{result['system_id']}`",
                "",
                f"- Cyclic order: `{result['order']}`",
                f"- Retained row indices: `{result['core_row_indices']}`",
                f"- Retained equality atoms: `{result['atom_core']['atoms']}`",
                f"- Source family: `{result['source']['family']}`",
                "",
                "| Index | Center | Support | Exact |",
                "|---:|---:|---|---|",
            )
        )
        for index, row in zip(
            result["core_row_indices"], result["core_rows"], strict=True
        ):
            lines.append(
                f"| {index} | {row['center']} | `{row['support']}` | "
                f"{str(row['exact']).lower()} |"
            )
    lines.extend(
        (
            "",
            "## Formula ledger",
            "",
            "Encoded: the fixed two-point Euclidean gauge, all retained-row",
            "distance equalities, pairwise distinct ambient labels, and strict",
            "convexity in the saved cyclic order. Full-convex cores additionally",
            "encode each retained exact row's nonmember radius exclusions.",
            "",
            "Omitted: all Problem 97 hypotheses absent from the saved assignment,",
            "including diameter, minimal-enclosing-circle, nonobtuse-frame, and",
            "unsaved radius classes. The results therefore exclude only these",
            "bounded row systems.",
            "",
        )
    )
    return "\n".join(lines)


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--out", type=Path, default=DEFAULT_CORE_OUT)
    parser.add_argument("--markdown", type=Path, default=DEFAULT_CORE_MARKDOWN)
    parser.add_argument(
        "--cvc5", default=shutil.which("cvc5") or "/Users/adam/bin/cvc5"
    )
    parser.add_argument("--z3", default=shutil.which("z3") or "/Users/adam/bin/z3")
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument("--deletion-timeout", type=float, default=5.0)
    parser.add_argument("--validation-timeout", type=float, default=60.0)
    parser.add_argument("--system-id", action="append", default=[])
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    if args.workers < 1 or args.workers > 8:
        raise SystemExit("--workers must be between 1 and 8")
    if args.deletion_timeout <= 0 or args.validation_timeout <= 0:
        raise SystemExit("timeouts must be positive")
    for solver in (args.cvc5, args.z3):
        if not Path(solver).is_file() and shutil.which(solver) is None:
            raise SystemExit(f"solver executable not found: {solver}")

    input_bytes = args.input.read_bytes()
    source = json.loads(input_bytes)
    if source.get("schema") != INPUT_SCHEMA:
        raise SystemExit(f"unsupported input schema: {source.get('schema')}")
    systems = [result for result in source["results"] if result["status"] == "CVC5_UNSAT"]
    if args.system_id:
        requested = set(args.system_id)
        systems = [system for system in systems if system["system_id"] in requested]
        missing = requested - {system["system_id"] for system in systems}
        if missing:
            raise SystemExit(f"unknown CVC5_UNSAT IDs: {', '.join(sorted(missing))}")
    if not systems:
        raise SystemExit("input contains no CVC5_UNSAT systems")

    results_by_id: dict[str, dict[str, Any]] = {}
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(
                _minimize_one,
                system,
                cvc5=args.cvc5,
                z3=args.z3,
                deletion_timeout_s=args.deletion_timeout,
                validation_timeout_s=args.validation_timeout,
            ): system["system_id"]
            for system in systems
        }
        for future in as_completed(futures):
            system_id = futures[future]
            results_by_id[system_id] = future.result()
            print(
                f"minimized {len(results_by_id)}/{len(systems)}: {system_id}",
                flush=True,
            )

    results = [results_by_id[system_id] for system_id in sorted(results_by_id)]
    payload = {
        "schema": SCHEMA,
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "input": {
            "path": str(args.input),
            "sha256": hashlib.sha256(input_bytes).hexdigest(),
            "schema": source["schema"],
        },
        "config": {
            "cvc5": args.cvc5,
            "z3": args.z3,
            "workers": args.workers,
            "deletion_timeout_seconds": args.deletion_timeout,
            "validation_timeout_seconds": args.validation_timeout,
        },
        "results": results,
    }
    _atomic_json(args.out, payload)
    args.markdown.write_text(_render_markdown(payload), encoding="utf-8")
    return 0 if all(r["crosscheck_status"] != "SOLVER_DISAGREEMENT" for r in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
