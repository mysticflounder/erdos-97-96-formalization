# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Independent cvc5 triage for the metric-realizability residual frontier.

This runner reconstructs the systems that survive the deterministic equality
prefilters in ``metric_realizability_probe`` and submits the same three QF_NRA
relaxations to cvc5's cylindrical algebraic coverings engine.  Its output is a
bounded diagnostic artifact.  In particular, a cvc5 UNSAT verdict is a trusted
computation rather than a Lean proof, and SAT is retained only as an unverified
candidate until a model is independently checked against every assertion.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import tempfile
import time
from collections import Counter
from concurrent.futures import ProcessPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

from .metric_realizability_probe import (
    DEFAULT_INPUTS,
    HERE,
    ROOT,
    MetricRow,
    _constraint_counts,
    _duplicate_center_core,
    _exact_off_circle_core,
    _smoke_systems,
    extract_systems,
)


SCHEMA = "p97-global-confinement-metric-realizability-cvc5-v1"
DEFAULT_OUT = HERE / "metric_realizability_cvc5.json"
DEFAULT_MARKDOWN = HERE / "metric_realizability_cvc5.md"
BASELINE_RESIDUAL = HERE / "metric_realizability_residual_60s.json"
STAGES = (
    "exact-metric-relaxation",
    "full-convex",
    "convex-only-relaxation",
)


def _rows(system: Mapping[str, Any]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(int(row["center"]), tuple(row["support"]), bool(row["exact"]))
        for row in system["rows"]
    )


def _frontier(
    systems: Iterable[Mapping[str, Any]],
) -> list[dict[str, Any]]:
    """Select exactly the systems not settled by either equality prefilter."""

    selected = []
    for system in systems:
        rows = _rows(system)
        n = int(system["n"])
        if _duplicate_center_core(rows, n) is not None:
            continue
        if _exact_off_circle_core(rows, n) is not None:
            continue
        selected.append(dict(system))
    return sorted(selected, key=lambda item: item["system_id"])


def _id_digest(system_ids: Iterable[str]) -> str:
    payload = "".join(f"{system_id}\n" for system_id in sorted(system_ids))
    return hashlib.sha256(payload.encode()).hexdigest()


def _baseline_ids(path: Path) -> tuple[list[str], str]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    ids = sorted(str(result["system_id"]) for result in payload["results"])
    return ids, hashlib.sha256(path.read_bytes()).hexdigest()


def _sub(left: str, right: str) -> str:
    return f"(- {left} {right})"


def _mul(left: str, right: str) -> str:
    return f"(* {left} {right})"


def _point(point: int) -> tuple[str, str]:
    if point == 0:
        return "0", "0"
    if point == 1:
        return "1", "0"
    return f"x_{point}", f"y_{point}"


def _d2(left: int, right: int) -> str:
    lx, ly = _point(left)
    rx, ry = _point(right)
    dx = _sub(lx, rx)
    dy = _sub(ly, ry)
    return f"(+ {_mul(dx, dx)} {_mul(dy, dy)})"


def _cross(a: int, b: int, c: int) -> str:
    ax, ay = _point(a)
    bx, by = _point(b)
    cx, cy = _point(c)
    return _sub(_mul(_sub(bx, ax), _sub(cy, ay)), _mul(_sub(by, ay), _sub(cx, ax)))


def build_smt2(
    system: Mapping[str, Any],
    stage: str,
    row_indices: Sequence[int] | None = None,
    equality_atoms: Sequence[tuple[int, int]] | None = None,
) -> tuple[str, dict[str, int]]:
    """Encode one stage, optionally restricted to a row-deletion core."""

    if stage not in STAGES:
        raise ValueError(f"unknown stage: {stage}")
    n = int(system["n"])
    order = tuple(int(point) for point in system["order"])
    all_rows = _rows(system)
    if row_indices is None:
        row_indices = tuple(range(len(all_rows)))
    if len(set(row_indices)) != len(row_indices):
        raise ValueError("row_indices contains a duplicate")
    if any(index < 0 or index >= len(all_rows) for index in row_indices):
        raise ValueError("row index outside the system")
    rows = tuple(all_rows[index] for index in row_indices)
    allowed_atoms = {
        (row_index, point)
        for row_index, row in zip(row_indices, rows, strict=True)
        for point in row.support[1:]
    }
    selected_atoms = allowed_atoms if equality_atoms is None else set(equality_atoms)
    if len(selected_atoms) != len(equality_atoms or selected_atoms):
        raise ValueError("equality_atoms contains a duplicate")
    if not selected_atoms <= allowed_atoms:
        raise ValueError("equality atom is not owned by a selected row")

    assertions: list[tuple[str, str]] = []
    for row_index, row in zip(row_indices, rows, strict=True):
        reference = _d2(row.center, row.support[0])
        for point in row.support[1:]:
            if (row_index, point) in selected_atoms:
                assertions.append(
                    ("row_equalities", f"(= {_d2(row.center, point)} {reference})")
                )
        if stage != "convex-only-relaxation" and row.exact:
            support = frozenset(row.support)
            for point in range(n):
                if point == row.center or point in support:
                    continue
                delta = _sub(_d2(row.center, point), reference)
                assertions.append(("exact_exclusions", f"(> {_mul(delta, delta)} 0)"))

    for left in range(n):
        for right in range(left + 1, n):
            assertions.append(("distinctness", f"(> {_d2(left, right)} 0)"))

    if stage != "exact-metric-relaxation":
        for index, left in enumerate(order):
            right = order[(index + 1) % n]
            for point in order:
                if point != left and point != right:
                    assertions.append(
                        ("convex_order", f"(> {_cross(left, right, point)} 0)")
                    )

    lines = ["(set-logic QF_NRA)"]
    for point in range(2, n):
        lines.append(f"(declare-fun x_{point} () Real)")
        lines.append(f"(declare-fun y_{point} () Real)")
    for row_index in row_indices:
        lines.append(f"; selected row {row_index}")
    for row_index, point in sorted(selected_atoms):
        lines.append(f"; selected equality atom {row_index}:{point}")
    lines.extend(f"(assert {assertion})" for _kind, assertion in assertions)
    lines.extend(("(check-sat)", "(exit)"))
    counts = Counter(kind for kind, _assertion in assertions)
    counts["total"] = len(assertions)
    counts["selected_rows"] = len(rows)
    return "\n".join(lines) + "\n", dict(sorted(counts.items()))


def _parse_status(stdout: str) -> str | None:
    statuses = [
        line.strip().lower()
        for line in stdout.splitlines()
        if line.strip().lower() in {"sat", "unsat", "unknown"}
    ]
    return statuses[-1].upper() if statuses else None


def _is_timeout_diagnostic(text: str) -> bool:
    return "interrupted by timeout" in text.lower()


def _run_query(
    *,
    cvc5: str,
    system: Mapping[str, Any],
    stage: str,
    timeout_s: float,
    row_indices: Sequence[int] | None = None,
    equality_atoms: Sequence[tuple[int, int]] | None = None,
) -> dict[str, Any]:
    smt2, counts = build_smt2(system, stage, row_indices, equality_atoms)
    timeout_ms = max(1, int(timeout_s * 1000))
    command = (
        cvc5,
        "--lang=smt2",
        "--nl-cov",
        f"--tlimit={timeout_ms}",
        "-",
    )
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
            "stage": stage,
            "status": "UNKNOWN",
            "reason": "subprocess-timeout",
            "elapsed_sec": round(time.monotonic() - started, 6),
            "constraint_counts": counts,
            "stdout": (error.stdout or "")[-2000:],
            "stderr": (error.stderr or "")[-2000:],
        }
    elapsed = time.monotonic() - started
    status = _parse_status(process.stdout)
    result: dict[str, Any] = {
        "stage": stage,
        "status": status or "ERROR",
        "elapsed_sec": round(elapsed, 6),
        "constraint_counts": counts,
        "return_code": process.returncode,
    }
    diagnostics = "\n".join(
        text.strip() for text in (process.stdout, process.stderr) if text.strip()
    )
    if status == "UNKNOWN" or (status is None and _is_timeout_diagnostic(diagnostics)):
        result["status"] = "UNKNOWN"
        result["reason"] = diagnostics[-2000:] or "cvc5-returned-unknown"
    elif status is None or process.returncode != 0:
        result["status"] = "ERROR"
        result["reason"] = diagnostics[-2000:] or "cvc5-produced-no-verdict"
    return result


def _classify(stages: Sequence[Mapping[str, Any]]) -> tuple[str, str | None]:
    by_name = {str(stage["stage"]): stage for stage in stages}
    for name in STAGES:
        if by_name[name]["status"] == "UNSAT":
            return "CVC5_UNSAT", name
    if by_name["full-convex"]["status"] == "SAT":
        return "SAT_CANDIDATE", "full-convex"
    if any(stage["status"] == "ERROR" for stage in stages):
        return "ERROR", None
    return "UNKNOWN", None


def _probe_system(
    system: Mapping[str, Any], cvc5: str, timeout_s: float
) -> dict[str, Any]:
    stages = [
        _run_query(cvc5=cvc5, system=system, stage=stage, timeout_s=timeout_s)
        for stage in STAGES
    ]
    status, decisive_stage = _classify(stages)
    return {
        "system_id": system["system_id"],
        "status": status,
        "decisive_stage": decisive_stage,
        "stages": stages,
        "constraint_counts": _constraint_counts(int(system["n"]), _rows(system)),
    }


def run_smoke(cvc5: str, timeout_s: float = 10.0) -> dict[str, Any]:
    sat_system, unsat_system = _smoke_systems()
    sat = _run_query(
        cvc5=cvc5,
        system=sat_system,
        stage="exact-metric-relaxation",
        timeout_s=timeout_s,
    )
    unsat = _run_query(
        cvc5=cvc5,
        system=unsat_system,
        stage="exact-metric-relaxation",
        timeout_s=timeout_s,
    )
    return {
        "passed": sat["status"] == "SAT" and unsat["status"] == "UNSAT",
        "sat": sat,
        "unsat": unsat,
    }


def _summary(results: Iterable[Mapping[str, Any]]) -> dict[str, Any]:
    results = list(results)
    return {
        "status_counts": dict(sorted(Counter(r["status"] for r in results).items())),
        "decisive_stage_counts": dict(
            sorted(Counter(r.get("decisive_stage") or "none" for r in results).items())
        ),
        "stage_status_counts": {
            stage: dict(
                sorted(
                    Counter(
                        item["status"]
                        for result in results
                        for item in result["stages"]
                        if item["stage"] == stage
                    ).items()
                )
            )
            for stage in STAGES
        },
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
    summary = payload["summary"]
    lines = [
        "# cvc5 metric-realizability frontier",
        "",
        "## Result",
        "",
        f"- Structural frontier: **{payload['selection']['count']} systems**",
        f"- Frontier-ID SHA256: `{payload['selection']['system_id_sha256']}`",
        f"- Completed: **{len(payload['results'])} systems**",
        "",
        "| Final status | Count |",
        "|---|---:|",
    ]
    for status, count in summary["status_counts"].items():
        lines.append(f"| {status} | {count} |")
    lines.extend(("", "| Decisive stage | Count |", "|---|---:|"))
    for stage, count in summary["decisive_stage_counts"].items():
        lines.append(f"| {stage} | {count} |")
    lines.extend(
        (
            "",
            "## Interpretation",
            "",
            "The runner independently encodes the same gauge, selected-row",
            "squared-distance equalities, ambient distinctness, exact-row",
            "exclusions, and recorded strict convex order used by the Z3 probe.",
            "Each stage is a fresh cvc5 QF_NRA query using `--nl-cov`.",
            "",
            "`CVC5_UNSAT` excludes only the saved bounded row system and is a",
            "trusted computation, not a Lean proof. `SAT_CANDIDATE` has not been",
            "accepted as a realization because no cvc5 model verifier is part of",
            "this runner. `UNKNOWN` is no verdict. No diameter, minimal-enclosing-",
            "circle, nonobtuse-frame, or unsaved radius-class constraints are",
            "encoded, so no status is a Problem 97 verdict.",
            "",
            "## Reproducibility",
            "",
            f"- cvc5: `{payload['config']['cvc5']}`",
            f"- cvc5 version: `{payload['config']['cvc5_version']}`",
            f"- workers: `{payload['config']['workers']}`",
            f"- per-query timeout: `{payload['config']['timeout_seconds']}` seconds",
            f"- smoke gate passed: `{str(payload['smoke']['passed']).lower()}`",
            "",
            "The frontier is reconstructed from the current saved assignments by",
            "removing exactly the duplicate-center and exact-off-circle equality",
            "cores. Its IDs must match the checked 60-second Z3 residual artifact",
            "unless `--allow-selection-drift` is explicitly supplied.",
            "",
        )
    )
    return "\n".join(lines)


def _cvc5_version(cvc5: str) -> str:
    process = subprocess.run(
        (cvc5, "--version"), text=True, capture_output=True, timeout=10.0, check=False
    )
    first_line = process.stdout.splitlines()[0] if process.stdout else "unknown"
    return first_line.strip()


def _write_checkpoint(
    *,
    out: Path,
    markdown: Path | None,
    extraction: Mapping[str, Any],
    selection: Mapping[str, Any],
    config: Mapping[str, Any],
    smoke: Mapping[str, Any],
    systems_by_id: Mapping[str, Mapping[str, Any]],
    results_by_id: Mapping[str, Mapping[str, Any]],
) -> None:
    results = []
    for system_id in sorted(results_by_id):
        system = systems_by_id[system_id]
        result = dict(results_by_id[system_id])
        result.update(
            {
                "n": system["n"],
                "profile": system["profile"],
                "order": system["order"],
                "rows": system["rows"],
                "sources": system["sources"],
            }
        )
        results.append(result)
    payload = {
        "schema": SCHEMA,
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "extraction": extraction,
        "selection": selection,
        "config": config,
        "smoke": smoke,
        "summary": _summary(results),
        "results": results,
    }
    _atomic_json(out, payload)
    if markdown is not None:
        markdown.write_text(_render_markdown(payload), encoding="utf-8")


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    found_cvc5 = shutil.which("cvc5") or "/Users/adam/bin/cvc5"
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", action="append", type=Path, dest="inputs")
    parser.add_argument("--baseline", type=Path, default=BASELINE_RESIDUAL)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--markdown", type=Path, default=DEFAULT_MARKDOWN)
    parser.add_argument("--cvc5", default=found_cvc5)
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--timeout", type=float, default=30.0)
    parser.add_argument("--system-id", action="append", default=[])
    parser.add_argument("--checkpoint-every", type=int, default=5)
    parser.add_argument("--allow-selection-drift", action="store_true")
    parser.add_argument("--smoke-only", action="store_true")
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    if args.workers < 1 or args.workers > 8:
        raise SystemExit("--workers must be between 1 and 8")
    if args.timeout <= 0:
        raise SystemExit("--timeout must be positive")
    if args.checkpoint_every < 1:
        raise SystemExit("--checkpoint-every must be positive")
    if not Path(args.cvc5).is_file() and shutil.which(args.cvc5) is None:
        raise SystemExit(f"cvc5 executable not found: {args.cvc5}")

    smoke = run_smoke(args.cvc5, min(max(args.timeout, 10.0), 60.0))
    if not smoke["passed"]:
        print(json.dumps(smoke, indent=2, sort_keys=True))
        raise SystemExit("cvc5 metric-realizability smoke gate failed")
    if args.smoke_only:
        print(json.dumps(smoke, indent=2, sort_keys=True))
        return 0

    inputs = tuple(path.resolve() for path in (args.inputs or DEFAULT_INPUTS))
    systems, extraction = extract_systems(inputs)
    frontier = _frontier(systems)
    frontier_ids = [system["system_id"] for system in frontier]
    baseline_ids, baseline_sha256 = _baseline_ids(args.baseline.resolve())
    selection_matches_baseline = frontier_ids == baseline_ids
    if not selection_matches_baseline and not args.allow_selection_drift:
        raise SystemExit(
            "reconstructed frontier does not match baseline; inspect inputs or use "
            "--allow-selection-drift"
        )

    if args.system_id:
        requested = set(args.system_id)
        frontier = [system for system in frontier if system["system_id"] in requested]
        missing = requested - {system["system_id"] for system in frontier}
        if missing:
            raise SystemExit(f"unknown frontier IDs: {', '.join(sorted(missing))}")

    systems_by_id = {system["system_id"]: system for system in frontier}
    selection = {
        "count": len(frontier_ids),
        "system_id_sha256": _id_digest(frontier_ids),
        "matches_baseline": selection_matches_baseline,
        "baseline_path": os.path.relpath(args.baseline.resolve(), ROOT),
        "baseline_sha256": baseline_sha256,
        "selected_for_run": len(frontier),
    }
    config = {
        "cvc5": args.cvc5,
        "cvc5_version": _cvc5_version(args.cvc5),
        "workers": args.workers,
        "timeout_seconds": args.timeout,
        "checkpoint_every": args.checkpoint_every,
    }
    results_by_id: dict[str, dict[str, Any]] = {}
    _write_checkpoint(
        out=args.out,
        markdown=args.markdown,
        extraction=extraction,
        selection=selection,
        config=config,
        smoke=smoke,
        systems_by_id=systems_by_id,
        results_by_id=results_by_id,
    )

    started = time.monotonic()
    completed = 0
    with ProcessPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(_probe_system, system, args.cvc5, args.timeout): system_id
            for system_id, system in systems_by_id.items()
        }
        for future in as_completed(futures):
            system_id = futures[future]
            try:
                results_by_id[system_id] = future.result()
            except Exception as error:  # noqa: BLE001
                results_by_id[system_id] = {
                    "system_id": system_id,
                    "status": "ERROR",
                    "decisive_stage": None,
                    "stages": [],
                    "error": f"{type(error).__name__}: {error}",
                }
            completed += 1
            if completed % args.checkpoint_every == 0 or completed == len(futures):
                _write_checkpoint(
                    out=args.out,
                    markdown=args.markdown,
                    extraction=extraction,
                    selection=selection,
                    config=config,
                    smoke=smoke,
                    systems_by_id=systems_by_id,
                    results_by_id=results_by_id,
                )
                counts = _summary(results_by_id.values())["status_counts"]
                print(
                    f"completed {completed}/{len(futures)} systems in "
                    f"{time.monotonic() - started:.1f}s; statuses={counts}",
                    flush=True,
                )

    return 0 if all(result["status"] != "ERROR" for result in results_by_id.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
