#!/usr/bin/env python3
"""One-shot exact-algebra wave for three motif-free FirstNonHit packets."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import time
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[2]
SOURCE_ROOT = REPO / "scratch/p97-consumer-first/freshthird_firstnonhit_sevenrow_cut_v1"
SCHEMA = "freshthird-firstnonhit-motiffree-algebra-v2"
CASES = ("common", "common_sameblocker", "retained")
ACTIVE = {
    "common": ("q0", "q1", "q2", "q3", "first", "second"),
    "common_sameblocker": (
        "q0", "q1", "q2", "q3", "first", "second", "w0", "w1", "w2", "w3"
    ),
    "retained": ("q0", "q1", "q2", "q3", "first", "second", "retz", "retw"),
}
BLOCKER = {
    "q0": "b0", "q1": "b1", "q2": "b2", "q3": "b3",
    "first": "blk_first", "second": "blk_second",
    "retz": "blk_retz", "retw": "blk_retw",
    "w0": "blk_w0", "w1": "blk_w1", "w2": "blk_w2", "w3": "blk_w3",
}
SOURCE = {row: f"v_{row}" for row in BLOCKER}

SOLVER_WALL_BUDGET_SECONDS = 290.0
MSOLVE_THREADS = 4
CONTROL_TIMEOUT_SECONDS = 10.0
TARGET_TIMEOUT_SECONDS = 40.0
CORE_GREEDY_TIMEOUT_SECONDS = 6.0
CORE_AUTH_TIMEOUT_SECONDS = 12.0
CORE_PACKET_BUDGET_SECONDS = 75.0

INPUT_PATH = ROOT / "input.json"
PRELAUNCH_PATH = ROOT / "manifest.prelaunch.json"
SOURCE_MAP_PATH = ROOT / "SOURCE-MAP.md"
GUARD_PATH = ROOT / "RUN_ONCE.guard"


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_json(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def write_new(path: Path, data: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("x", encoding="utf-8") as handle:
        handle.write(data)


def point_term(row: str, kind: str) -> str:
    return SOURCE[row] if kind == "S" else BLOCKER[row]


def point_specs(case: str) -> list[tuple[str, str, str]]:
    rows = ACTIVE[case]
    return (
        [(f"S_{row}", SOURCE[row], "source") for row in rows]
        + [(f"B_{row}", BLOCKER[row], "blocker") for row in rows]
    )


def validate_source_checksums() -> dict[str, str]:
    entries: dict[str, str] = {}
    for raw in (SOURCE_ROOT / "SHA256SUMS").read_text().splitlines():
        expected, rel = raw.split("  ", 1)
        path = SOURCE_ROOT / rel
        if not path.is_file() or sha256(path) != expected:
            raise RuntimeError(f"source checksum mismatch: {rel}")
        entries[rel] = expected
    return entries


def extract_packet(case: str) -> dict[str, Any]:
    rel = f"iterations/{case}-00.json"
    source_path = SOURCE_ROOT / rel
    source_data = json.loads(source_path.read_text())
    if source_data.get("case") != case or source_data.get("status") != "sat":
        raise RuntimeError(f"bad terminal source packet: {case}")
    if source_data.get("motif_embedding") is not None:
        raise RuntimeError(f"source packet is not motif-free: {case}")
    readback = source_data["readback"]
    rows = ACTIVE[case]
    points = point_specs(case)
    expected_cells = len(rows) * len(points)
    cells: list[dict[str, Any]] = []
    for row in rows:
        for label, term, kind in points:
            name = f"M_{row}__{label}"
            if name not in readback or not isinstance(readback[name], bool):
                raise RuntimeError(f"missing Boolean table cell: {case}:{name}")
            cells.append({
                "row": row,
                "atom": name,
                "point_label": label,
                "point_term": term,
                "point_kind": kind,
                "point_class_value": int(readback[term]),
                "selected": readback[name],
            })
    actual_m = {key for key in readback if key.startswith("M_")}
    expected_m = {cell["atom"] for cell in cells}
    if actual_m != expected_m or len(cells) != expected_cells:
        raise RuntimeError(f"membership table is not the expected Cartesian table: {case}")

    aliases_by_value: dict[int, list[dict[str, str]]] = {}
    for label, term, kind in points:
        aliases_by_value.setdefault(int(readback[term]), []).append(
            {"label": label, "term": term, "kind": kind}
        )
    class_values = sorted(aliases_by_value)
    class_ids = {value: f"p{index}" for index, value in enumerate(class_values)}
    point_classes = [
        {
            "id": class_ids[value],
            "terminal_equality_class_value": value,
            "aliases": aliases_by_value[value],
        }
        for value in class_values
    ]

    # The finite table is extensional in both center and point equality classes.
    extensional: dict[tuple[int, int], bool] = {}
    for cell in cells:
        center_value = int(readback[BLOCKER[cell["row"]]])
        key = (center_value, cell["point_class_value"])
        prior = extensional.setdefault(key, cell["selected"])
        if prior != cell["selected"]:
            raise RuntimeError(f"non-extensional source readback: {case}:{key}")

    row_records: list[dict[str, Any]] = []
    for row in rows:
        own_source_atom = f"M_{row}__S_{row}"
        own_blocker_atom = f"M_{row}__B_{row}"
        if readback[own_source_atom] is not True or readback[own_blocker_atom] is not False:
            raise RuntimeError(f"source/blocker row invariant failed: {case}:{row}")
        selected_cells = [cell for cell in cells if cell["row"] == row and cell["selected"]]
        selected_values = sorted({cell["point_class_value"] for cell in selected_cells})
        row_records.append({
            "row_label": row,
            "source_term": SOURCE[row],
            "source_class_value": int(readback[SOURCE[row]]),
            "source_class_id": class_ids[int(readback[SOURCE[row]])],
            "center_term": BLOCKER[row],
            "center_class_value": int(readback[BLOCKER[row]]),
            "center_class_id": class_ids[int(readback[BLOCKER[row]])],
            "selected_point_labels": [cell["point_label"] for cell in selected_cells],
            "selected_class_values": selected_values,
            "selected_class_ids": [class_ids[value] for value in selected_values],
            "selected_unique_count": len(selected_values),
            "row_equality_count": max(0, len(selected_values) - 1),
        })

    q0 = int(readback["v_q0"])
    q1 = int(readback["v_q1"])
    if q0 == q1:
        raise RuntimeError(f"nondegenerate q0/q1 gauge unavailable: {case}")
    return {
        "case": case,
        "source_packet": {
            "path": str(source_path.relative_to(REPO)),
            "sha256": sha256(source_path),
            "terminal_status": source_data["status"],
            "motif_embedding": source_data["motif_embedding"],
        },
        "active_rows": list(rows),
        "point_classes": point_classes,
        "rows": row_records,
        "membership_cells": cells,
        "gauge": {
            "kind": "real Euclidean nondegenerate similarity gauge",
            "source_fact": "v_q0 and v_q1 are distinct Q-support carrier roles",
            "origin_label": "S_q0",
            "origin_class_id": class_ids[q0],
            "unit_label": "S_q1",
            "unit_class_id": class_ids[q1],
            "equalities": ["x(q0)=0", "y(q0)=0", "x(q1)=1", "y(q1)=0"],
        },
        "table_validation": {
            "cartesian_cell_count": len(cells),
            "expected_cartesian_cell_count": expected_cells,
            "extensional_center_point_pairs": len(extensional),
            "own_source_selected_all_rows": True,
            "own_blocker_unselected_all_rows": True,
        },
    }


OMITTED = [
    "all false membership cells as geometric off-circle disequalities",
    "support exhaustion and exact critical-four-shell support cardinality",
    "unnamed carrier points, unnamed selected-support points, and ambient carrier coverage",
    "all pairwise-distinctness and blockerVertex_ne inequalities except the q0/q1 gauge premise",
    "positive radii, nonzero squared distances, and real-feasibility conditions",
    "boundary/cyclic order, convexity, orientation, and Kalmanson/order inequalities",
    "the predecessor metric matrix and every unselected distance relation",
    "FirstNonHit constructor tags, deletion-fan, blocker-fiber, repeated-cap, retained, and common-helper clauses",
    "q_boundary, q_nonrobust, cap-location data, and motif non-embedding as algebraic constraints",
    "universal ingress, coverage, general-cardinality lift, and any Lean consumer",
]


def source_map_markdown(config: dict[str, Any]) -> str:
    lines = [
        "# Exact source and label map", "",
        "Each `M_<row>__<point>` cell is copied from one authenticated terminal",
        "readback. `S_r` denotes source term `v_r`; `B_r` denotes its actual blocker",
        "term (`b0`…`b3` or `blk_r`). Integer values are opaque terminal equality-class",
        "names. Equal values share one coordinate pair. No integer ordering is used.", "",
        "The ideal for a row contains `d(center,p)-d(center,reference)=0` for every",
        "other distinct positively selected named point class in that row. Negative cells",
        "are deliberately omitted, so this is the exact equality translation of the finite",
        "positive table and an equality superset of the intended Euclidean geometry.", "",
    ]
    for packet in config["packets"]:
        lines += [f"## `{packet['case']}`", "", "| row | source term/class | center term/class | selected labels | selected classes | equations |", "|---|---|---|---|---|---:|"]
        for row in packet["rows"]:
            lines.append(
                f"| `{row['row_label']}` | `{row['source_term']}={row['source_class_value']}` / `{row['source_class_id']}` "
                f"| `{row['center_term']}={row['center_class_value']}` / `{row['center_class_id']}` "
                f"| `{', '.join(row['selected_point_labels'])}` | `{', '.join(row['selected_class_ids'])}` | {row['row_equality_count']} |"
            )
        lines += ["", "Point-class aliases:", ""]
        for point in packet["point_classes"]:
            aliases = ", ".join(f"{a['label']}→{a['term']}" for a in point["aliases"])
            lines.append(f"- `{point['id']}` = terminal class `{point['terminal_equality_class_value']}`: {aliases}. ")
        gauge = packet["gauge"]
        lines += ["", f"Gauge: `{gauge['origin_label']}`/`{gauge['origin_class_id']}` is `(0,0)` and `{gauge['unit_label']}`/`{gauge['unit_class_id']}` is `(1,0)`.", ""]
    lines += ["## Omitted P97 hypotheses", ""] + [f"- {item}." for item in config["omitted_p97_hypotheses"]]
    lines += ["", "Consequently UNIT can rule out a real realization of this fixed positive table,", "while NONUNIT establishes only complex nonemptiness of the gauge equality ideal.", ""]
    return "\n".join(lines)


def prepare() -> int:
    for path in (INPUT_PATH, PRELAUNCH_PATH, SOURCE_MAP_PATH):
        if path.exists():
            raise SystemExit(f"prepare/no-overwrite refusal: {path.name}")
    source_checksums = validate_source_checksums()
    source_validation = json.loads((SOURCE_ROOT / "VALIDATION.json").read_text())
    terminal = json.loads((SOURCE_ROOT / "TERMINAL.json").read_text())
    if source_validation.get("status") != "VALID" or terminal.get("status") != "SAT_MOTIF_FREE_SURVIVOR":
        raise RuntimeError("source wave is not authenticated and terminal motif-free")
    packets = [extract_packet(case) for case in CASES]
    config = {
        "schema": SCHEMA,
        "scope": "three fixed terminal named-role quotient readbacks",
        "translation": "positive selected-row cells to exact squared-equidistance equalities",
        "packets": packets,
        "omitted_p97_hypotheses": OMITTED,
        "claim_boundary": (
            "UNIT is complex emptiness after a real-sound nondegenerate similarity gauge; "
            "NONUNIT is complex nonemptiness only and is not a real/Euclidean witness"
        ),
        "source_authentication": {
            "source_root": str(SOURCE_ROOT.relative_to(REPO)),
            "source_sha256sums_sha256": sha256(SOURCE_ROOT / "SHA256SUMS"),
            "verified_source_entry_count": len(source_checksums),
            "validation_sha256": sha256(SOURCE_ROOT / "VALIDATION.json"),
            "terminal_sha256": sha256(SOURCE_ROOT / "TERMINAL.json"),
            "source_map_sha256": sha256(SOURCE_ROOT / "SOURCE-MAP.md"),
        },
    }
    write_new(INPUT_PATH, json.dumps(config, indent=2, sort_keys=True) + "\n")
    write_new(SOURCE_MAP_PATH, source_map_markdown(config))
    manifest = {
        "schema": SCHEMA,
        "state": "PREPARED",
        "case_matrix": list(CASES),
        "compatibility_class": "C: fresh equality semantics and fresh output namespace",
        "solver_limits": {
            "total_solver_wall_seconds": SOLVER_WALL_BUDGET_SECONDS,
            "maximum_cores": MSOLVE_THREADS,
            "execution": "sequential subprocesses; at most one solver child",
            "control_timeout_seconds": CONTROL_TIMEOUT_SECONDS,
            "target_timeout_seconds": TARGET_TIMEOUT_SECONDS,
            "core_greedy_timeout_seconds": CORE_GREEDY_TIMEOUT_SECONDS,
            "core_auth_timeout_seconds": CORE_AUTH_TIMEOUT_SECONDS,
            "timeout_escalation": False,
        },
        "hashes": {
            "run_wave.py": sha256(Path(__file__)),
            "input.json": sha256(INPUT_PATH),
            "SOURCE-MAP.md": sha256(SOURCE_MAP_PATH),
            "canonical_packets": sha256_bytes(canonical_json(packets)),
        },
        "source_packet_hashes": {
            packet["case"]: packet["source_packet"]["sha256"] for packet in packets
        },
        "intended_command": f"uv run python {Path(__file__).relative_to(REPO)} --run",
    }
    write_new(PRELAUNCH_PATH, json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print("PREPARED")
    return 0


class SolverBudget:
    def __init__(self, limit: float) -> None:
        self.limit = limit
        self.used = 0.0
        self.calls = 0

    def timeout(self, requested: float) -> float | None:
        remaining = self.limit - self.used
        if remaining < 0.25:
            return None
        return min(requested, max(0.1, remaining - 0.1))

    def charge(self, elapsed: float) -> None:
        self.used += elapsed
        self.calls += 1


def row_polynomials(center: str, support: list[str]) -> list[str]:
    if not support:
        raise RuntimeError("empty selected support")
    reference = int(support[0][1:])
    center_index = int(center[1:])
    result = []
    for point_id in support[1:]:
        point = int(point_id[1:])
        polynomial = (
            f"x{point}^2-2*x{center_index}*x{point}+y{point}^2-2*y{center_index}*y{point}"
            f"-x{reference}^2+2*x{center_index}*x{reference}-y{reference}^2+2*y{center_index}*y{reference}"
        )
        if "(" in polynomial or ")" in polynomial:
            raise RuntimeError("parenthesis in msolve polynomial")
        result.append(polynomial)
    return result


def case_system(packet: dict[str, Any], selected_rows: list[str] | None = None) -> dict[str, Any]:
    allowed = set(selected_rows if selected_rows is not None else packet["active_rows"])
    point_count = len(packet["point_classes"])
    gauge = packet["gauge"]
    o = int(gauge["origin_class_id"][1:])
    u = int(gauge["unit_class_id"][1:])
    gauge_polys = [f"x{o}", f"y{o}", f"x{u}-1", f"y{u}"]
    groups = []
    for row in packet["rows"]:
        if row["row_label"] not in allowed:
            continue
        polys = row_polynomials(row["center_class_id"], row["selected_class_ids"])
        if len(polys) != row["row_equality_count"]:
            raise RuntimeError("row equation count mismatch")
        groups.append({"row_label": row["row_label"], "polynomials": polys})
    polynomials = gauge_polys + [poly for group in groups for poly in group["polynomials"]]
    variables_a = [name for i in range(point_count) for name in (f"x{i}", f"y{i}")]
    return {
        "variables_order_a": variables_a,
        "variables_order_b": list(reversed(variables_a)),
        "gauge_polynomials": gauge_polys,
        "row_groups": groups,
        "polynomials": polynomials,
        "point_count": point_count,
        "row_count": len(groups),
        "row_equality_count": len(polynomials) - len(gauge_polys),
        "total_equality_count": len(polynomials),
    }


def msolve_text(variables: list[str], polynomials: list[str]) -> str:
    if any("(" in p or ")" in p for p in polynomials):
        raise RuntimeError("parentheses forbidden in msolve input")
    return f"{','.join(variables)}\n0\n{',\n'.join(polynomials)}\n"


def singular_text(variables: list[str], polynomials: list[str]) -> str:
    generators = ",\n  ".join(polynomials)
    return (
        f"ring R=0,({','.join(variables)}),dp;\n"
        f"ideal I =\n  {generators};\n"
        "ideal G=std(I);\n"
        'if (size(G)==1 and G[1]==1) { print("ALGEBRA_VERDICT=UNIT"); } '
        'else { print("ALGEBRA_VERDICT=NONUNIT"); print("ALGEBRA_DIM="); print(dim(G)); }\n'
        "quit;\n"
    )


def write_system(name: str, system: dict[str, Any]) -> dict[str, Path]:
    ledger = ROOT / f"{name}.system.json"
    write_new(ledger, json.dumps(system, indent=2, sort_keys=True) + "\n")
    paths = {
        "order_a": ROOT / f"{name}.order_a.ms",
        "order_b": ROOT / f"{name}.order_b.ms",
        "singular": ROOT / f"{name}.sing",
    }
    write_new(paths["order_a"], msolve_text(system["variables_order_a"], system["polynomials"]))
    write_new(paths["order_b"], msolve_text(system["variables_order_b"], system["polynomials"]))
    write_new(paths["singular"], singular_text(system["variables_order_a"], system["polynomials"]))
    body_a = paths["order_a"].read_text().split("\n", 2)[2]
    body_b = paths["order_b"].read_text().split("\n", 2)[2]
    if body_a != body_b:
        raise RuntimeError("variable-order polynomial bodies differ")
    return paths


def write_logs(name: str, stdout: str | bytes | None, stderr: str | bytes | None) -> None:
    def text(value: str | bytes | None) -> str:
        if value is None:
            return ""
        return value.decode(errors="replace") if isinstance(value, bytes) else value
    write_new(ROOT / f"{name}.stdout.txt", text(stdout))
    write_new(ROOT / f"{name}.stderr.txt", text(stderr))


def parse_msolve(text: str) -> str:
    stripped = text.strip()
    if re.fullmatch(r"\[-1\]\s*:", stripped):
        return "UNIT"
    if re.fullmatch(r"\[1,\s*[0-9]+,\s*-1,\s*\[\]\]\s*:", stripped):
        return "NONUNIT"
    if stripped.startswith("[0,") and stripped.endswith("]:"):
        return "NONUNIT"
    raise ValueError("unrecognized msolve output")


def parse_singular(text: str) -> str:
    hits = [line.split("=", 1)[1] for line in text.splitlines() if line in {"ALGEBRA_VERDICT=UNIT", "ALGEBRA_VERDICT=NONUNIT"}]
    if len(hits) != 1:
        raise ValueError("Singular output has no unique verdict")
    return hits[0]


def run_msolve(name: str, path: Path, requested: float, budget: SolverBudget) -> dict[str, Any]:
    timeout = budget.timeout(requested)
    output = ROOT / f"{name}.msolve.out"
    command = ["msolve", "-f", str(path), "-o", str(output), "-t", str(MSOLVE_THREADS)]
    if timeout is None:
        return {"verdict": "UNKNOWN", "reason": "global-solver-wall-budget", "command": command}
    started = time.monotonic()
    try:
        proc = subprocess.run(command, capture_output=True, text=True, timeout=timeout, check=False)
        elapsed = time.monotonic() - started
        budget.charge(elapsed)
    except subprocess.TimeoutExpired as exc:
        elapsed = time.monotonic() - started
        budget.charge(elapsed)
        write_logs(name, exc.stdout, exc.stderr)
        return {"verdict": "UNKNOWN", "reason": "timeout", "timeout_seconds": timeout, "wall_seconds": elapsed, "command": command}
    write_logs(name, proc.stdout, proc.stderr)
    record: dict[str, Any] = {"returncode": proc.returncode, "wall_seconds": elapsed, "timeout_seconds": timeout, "command": command}
    if proc.returncode != 0 or not output.is_file():
        record.update(verdict="UNKNOWN", reason="nonzero-returncode-or-missing-output")
        return record
    try:
        record["verdict"] = parse_msolve(output.read_text())
    except Exception as exc:
        record.update(verdict="UNKNOWN", reason=f"parse-failure:{exc}")
    return record


def run_singular(name: str, path: Path, requested: float, budget: SolverBudget) -> dict[str, Any]:
    timeout = budget.timeout(requested)
    command = ["Singular", "-q", str(path)]
    if timeout is None:
        return {"verdict": "UNKNOWN", "reason": "global-solver-wall-budget", "command": command}
    started = time.monotonic()
    try:
        proc = subprocess.run(command, capture_output=True, text=True, timeout=timeout, check=False)
        elapsed = time.monotonic() - started
        budget.charge(elapsed)
    except subprocess.TimeoutExpired as exc:
        elapsed = time.monotonic() - started
        budget.charge(elapsed)
        write_logs(name, exc.stdout, exc.stderr)
        return {"verdict": "UNKNOWN", "reason": "timeout", "timeout_seconds": timeout, "wall_seconds": elapsed, "command": command}
    write_logs(name, proc.stdout, proc.stderr)
    record: dict[str, Any] = {"returncode": proc.returncode, "wall_seconds": elapsed, "timeout_seconds": timeout, "command": command}
    if proc.returncode != 0:
        record.update(verdict="UNKNOWN", reason="nonzero-returncode")
        return record
    try:
        record["verdict"] = parse_singular(proc.stdout)
    except Exception as exc:
        record.update(verdict="UNKNOWN", reason=f"parse-failure:{exc}")
    return record


def run_three(name: str, paths: dict[str, Path], timeout: float, budget: SolverBudget) -> dict[str, Any]:
    engines = {
        "msolve_order_a": run_msolve(f"{name}.order_a", paths["order_a"], timeout, budget),
        "msolve_order_b": run_msolve(f"{name}.order_b", paths["order_b"], timeout, budget),
        "singular": run_singular(f"{name}.singular", paths["singular"], timeout, budget),
    }
    verdicts = [record["verdict"] for record in engines.values()]
    if "UNKNOWN" in verdicts:
        consensus, reason = "UNKNOWN", "at least one engine did not return an authenticated verdict"
    elif len(set(verdicts)) != 1:
        consensus, reason = "UNKNOWN", "variable-order or independent-engine disagreement"
    else:
        consensus, reason = verdicts[0], "two msolve variable orders and Singular agree"
    return {"engines": engines, "consensus": consensus, "reason": reason}


def run_controls(budget: SolverBudget) -> dict[str, Any]:
    controls = {
        "control_nonunit": ({"variables_order_a": ["x", "y"], "variables_order_b": ["y", "x"], "polynomials": ["x-y"], "gauge_polynomials": [], "row_groups": [], "point_count": 1, "row_count": 0, "row_equality_count": 1, "total_equality_count": 1}, "NONUNIT"),
        "control_unit": ({"variables_order_a": ["x", "y"], "variables_order_b": ["y", "x"], "polynomials": ["x", "x-1"], "gauge_polynomials": [], "row_groups": [], "point_count": 1, "row_count": 0, "row_equality_count": 2, "total_equality_count": 2}, "UNIT"),
    }
    result = {}
    for name, (system, expected) in controls.items():
        paths = write_system(name, system)
        record = run_three(name, paths, CONTROL_TIMEOUT_SECONDS, budget)
        record.update(expected=expected, passed=record["consensus"] == expected)
        result[name] = record
    return result


def minimize_rows(packet: dict[str, Any], budget: SolverBudget) -> dict[str, Any]:
    deadline_used = budget.used + min(CORE_PACKET_BUDGET_SECONDS, max(0.0, budget.limit - budget.used))
    core = list(packet["active_rows"])
    greedy = []
    complete = True
    for index, row in enumerate(packet["active_rows"]):
        if budget.used >= deadline_used:
            complete = False
            greedy.append({"dropped_row": row, "verdict": "UNKNOWN", "reason": "core-packet-budget"})
            break
        candidate = [item for item in core if item != row]
        name = f"{packet['case']}.core_greedy_{index:02d}_drop_{row}"
        paths = write_system(name, case_system(packet, candidate))
        trial = run_singular(f"{name}.singular", paths["singular"], CORE_GREEDY_TIMEOUT_SECONDS, budget)
        trial.update(dropped_row=row, candidate_rows=candidate)
        greedy.append(trial)
        if trial["verdict"] == "UNIT":
            core.remove(row)
        elif trial["verdict"] == "UNKNOWN":
            complete = False
            break

    final_replay = None
    drop_one = []
    if complete and budget.used < deadline_used:
        name = f"{packet['case']}.core_final"
        final_replay = run_three(name, write_system(name, case_system(packet, core)), CORE_AUTH_TIMEOUT_SECONDS, budget)
        complete = final_replay["consensus"] == "UNIT"
    else:
        complete = False
    if complete:
        for index, row in enumerate(core):
            if budget.used >= deadline_used:
                complete = False
                drop_one.append({"dropped_row": row, "consensus": "UNKNOWN", "reason": "core-packet-budget"})
                break
            candidate = [item for item in core if item != row]
            name = f"{packet['case']}.core_dropone_{index:02d}_drop_{row}"
            replay = run_three(name, write_system(name, case_system(packet, candidate)), CORE_AUTH_TIMEOUT_SECONDS, budget)
            replay.update(dropped_row=row, candidate_rows=candidate)
            drop_one.append(replay)
            if replay["consensus"] != "NONUNIT":
                complete = False
                break
    return {
        "status": "AUTHENTICATED_ROW_MINIMAL_CORE" if complete else "UNKNOWN_NO_CORE_CLAIM",
        "candidate_rows": core,
        "greedy_trials": greedy,
        "final_candidate_replay": final_replay,
        "every_drop_one_replay": drop_one,
        "authentication_contract": "final candidate UNIT and every drop-one NONUNIT on both msolve orders plus Singular",
    }


def theorem_mine(packets: list[dict[str, Any]]) -> dict[str, Any]:
    supports = []
    for packet in packets:
        groups: dict[tuple[str, tuple[str, ...]], list[str]] = {}
        for row in packet["rows"]:
            key = (row["center_class_id"], tuple(row["selected_class_ids"]))
            groups.setdefault(key, []).append(row["row_label"])
        for (center, support), rows in groups.items():
            if len(rows) > 1:
                supports.append({"case": packet["case"], "center_class_id": center, "selected_class_ids": list(support), "rows": rows})
    return {
        "records_reviewed": [f"{packet['case']} positive row table and classified equality packet" for packet in packets],
        "supporting_groups": supports,
        "candidate": {
            "name": "co-centered selected-row contraction",
            "statement": (
                "On any finite named point set T, two selected rows represented by the same extensional membership predicate mem(c,p) at the same blocker center c have identical positive supports on T; therefore their row equidistance generator groups are identical and either row may be deleted without changing the equality ideal."
            ),
            "immediate_consumer": "deduplicate co-centered row groups before exact-algebra classification",
            "status": "reusable but not materially new",
        },
        "external_or_lean_search": "NOT_RUN",
        "search_reason": (
            "The candidate is a direct extensionality consequence already named in the pinned source map by selectedSupports_eq_of_actualBlockers_eq; it is not a materially new theorem candidate."
        ),
    }


def tool_version(command: list[str]) -> dict[str, Any]:
    proc = subprocess.run(command, capture_output=True, text=True, timeout=5, check=False)
    return {"command": command, "returncode": proc.returncode, "stdout": proc.stdout, "stderr": proc.stderr}


def results_markdown(results: dict[str, Any]) -> str:
    lines = ["# Results", "", "One bounded wave completed. Both algebra controls passed." if results["controls_passed"] else "The wave failed closed because a control did not pass.", "", "## Packet classifications", "", "| packet | rows | row equations | consensus | exact meaning |", "|---|---:|---:|---|---|"]
    for case in CASES:
        record = results["packets"].get(case, {})
        lines.append(f"| `{case}` | {record.get('row_count', '—')} | {record.get('row_equality_count', '—')} | `{record.get('consensus', 'NOT_RUN')}` | {record.get('exact_meaning', 'not classified')} |")
    lines += [
        "", "## Claim boundary", "",
        "The gauge is sound for real Euclidean configurations because the terminal source makes `q0` and `q1` distinct. UNIT would therefore eliminate the fixed positive table. NONUNIT says only that the gauge equality ideal has a complex point; it is not a real/Euclidean witness and does not validate any omitted P97 hypothesis.",
        "", "No boundary order, inequality, support-exhaustion, or full metric constraint was encoded. Exact source/label mappings and all omissions are in `SOURCE-MAP.md`.",
        "", "## Wave-data theorem mine", "",
        "Candidate: **co-centered selected-row contraction**. The new packets exhibit duplicate row groups at the same center. The candidate is useful preprocessing but is not materially new: it is direct extensionality and the pinned source already names `selectedSupports_eq_of_actualBlockers_eq`. No Lean-corpus or external search was run.",
        "", f"Recorded solver wall: {results['solver_budget']['used_seconds']:.6f}s of {results['solver_budget']['limit_seconds']:.1f}s; maximum live solver allocation: {MSOLVE_THREADS} cores.", "",
    ]
    return "\n".join(lines)


def verify_prelaunch() -> tuple[dict[str, Any], dict[str, Any]]:
    config = json.loads(INPUT_PATH.read_text())
    manifest = json.loads(PRELAUNCH_PATH.read_text())
    if config.get("schema") != SCHEMA or manifest.get("schema") != SCHEMA:
        raise RuntimeError("schema mismatch")
    for name, path in (("run_wave.py", Path(__file__)), ("input.json", INPUT_PATH), ("SOURCE-MAP.md", SOURCE_MAP_PATH)):
        if sha256(path) != manifest["hashes"][name]:
            raise RuntimeError(f"prelaunch hash mismatch: {name}")
    if sha256_bytes(canonical_json(config["packets"])) != manifest["hashes"]["canonical_packets"]:
        raise RuntimeError("packet hash mismatch")
    validate_source_checksums()
    for packet in config["packets"]:
        source_path = REPO / packet["source_packet"]["path"]
        if sha256(source_path) != packet["source_packet"]["sha256"]:
            raise RuntimeError(f"source packet drift: {packet['case']}")
    return config, manifest


def finalize(results: dict[str, Any], exit_code: int) -> int:
    results["ended_unix_ns"] = time.time_ns()
    write_new(ROOT / "results.json", json.dumps(results, indent=2, sort_keys=True) + "\n")
    write_new(ROOT / "THEOREM-MINE.md", "# Wave-data-only theorem mine\n\n" + results["theorem_mine"]["candidate"]["statement"] + "\n\n" + results["theorem_mine"]["search_reason"] + "\n")
    write_new(ROOT / "RESULTS.md", results_markdown(results))
    validation = {
        "status": "PASS" if results["controls_passed"] and results["solver_budget"]["used_seconds"] <= SOLVER_WALL_BUDGET_SECONDS and all(value.get("consensus") != "UNKNOWN" for value in results["packets"].values()) else "FAIL_CLOSED",
        "source_hashes_revalidated": True,
        "controls_passed": results["controls_passed"],
        "two_msolve_orders_each_target": True,
        "independent_singular_each_target": True,
        "msolve_polynomial_bodies_byte_identical_across_orders": results["polynomial_body_validation"],
        "no_boundary_order_or_inequality_constraints": True,
        "sequential_solver_children": True,
        "maximum_solver_cores": MSOLVE_THREADS,
        "solver_wall_seconds": results["solver_budget"]["used_seconds"],
        "solver_wall_cap_seconds": SOLVER_WALL_BUDGET_SECONDS,
        "solver_wall_within_cap": results["solver_budget"]["used_seconds"] <= SOLVER_WALL_BUDGET_SECONDS,
        "unit_core_claims": {case: record.get("row_core", {}).get("status") for case, record in results["packets"].items() if record.get("consensus") == "UNIT"},
    }
    write_new(ROOT / "VALIDATION.json", json.dumps(validation, indent=2, sort_keys=True) + "\n")
    artifacts = sorted(path for path in ROOT.iterdir() if path.is_file() and path.name not in {"manifest.terminal.json", "SHA256SUMS"})
    terminal = {
        "schema": SCHEMA,
        "state": "TERMINAL",
        "exit_code": exit_code,
        "validation_status": validation["status"],
        "packet_consensus": {case: record.get("consensus", "NOT_RUN") for case, record in results["packets"].items()},
        "solver_wall_seconds": results["solver_budget"]["used_seconds"],
        "artifact_hashes_before_terminal_manifest": {path.name: sha256(path) for path in artifacts},
        "claim_boundary": results["claim_boundary"],
    }
    write_new(ROOT / "manifest.terminal.json", json.dumps(terminal, indent=2, sort_keys=True) + "\n")
    authenticated = sorted(path for path in ROOT.iterdir() if path.is_file() and path.name != "SHA256SUMS")
    write_new(ROOT / "SHA256SUMS", "".join(f"{sha256(path)}  {path.name}\n" for path in authenticated))
    return exit_code


def run() -> int:
    generated = [path for path in ROOT.iterdir() if path.is_file() and path.name not in {"run_wave.py", "input.json", "manifest.prelaunch.json", "SOURCE-MAP.md"}]
    if generated:
        raise SystemExit("one-shot/no-overwrite refusal: " + ",".join(path.name for path in generated))
    write_new(GUARD_PATH, json.dumps({"schema": SCHEMA, "pid": os.getpid(), "started_unix_ns": time.time_ns()}, sort_keys=True) + "\n")
    config, manifest = verify_prelaunch()
    budget = SolverBudget(SOLVER_WALL_BUDGET_SECONDS)
    results: dict[str, Any] = {
        "schema": SCHEMA,
        "started_unix_ns": time.time_ns(),
        "claim_boundary": config["claim_boundary"],
        "prelaunch_manifest_sha256": sha256(PRELAUNCH_PATH),
        "tool_versions": {"msolve": tool_version(["msolve", "--version"]), "Singular": tool_version(["Singular", "--version"])},
        "packets": {},
        "polynomial_body_validation": True,
    }
    controls = run_controls(budget)
    results["controls"] = controls
    results["controls_passed"] = all(record["passed"] for record in controls.values())
    packets = config["packets"]
    if results["controls_passed"]:
        for packet in packets:
            case = packet["case"]
            system = case_system(packet)
            name = f"packet_{case}"
            paths = write_system(name, system)
            body_a = paths["order_a"].read_text().split("\n", 2)[2]
            body_b = paths["order_b"].read_text().split("\n", 2)[2]
            results["polynomial_body_validation"] &= body_a == body_b
            target = run_three(name, paths, TARGET_TIMEOUT_SECONDS, budget)
            target.update(
                row_count=system["row_count"],
                point_count=system["point_count"],
                row_equality_count=system["row_equality_count"],
                total_equality_count=system["total_equality_count"],
                polynomial_body_sha256=sha256_bytes(body_a.encode()),
            )
            if target["consensus"] == "UNIT":
                target["exact_classification"] = "COMPLEX_EMPTY"
                target["exact_meaning"] = "complex-empty equality superset; fixed positive table eliminated"
                target["four_valued_verdict"] = "semantic-UNSAT"
                target["row_core"] = minimize_rows(packet, budget)
            elif target["consensus"] == "NONUNIT":
                target["exact_classification"] = "COMPLEX_NONEMPTY"
                target["exact_meaning"] = "complex nonempty only; not a real/Euclidean witness"
                target["four_valued_verdict"] = "SAT-abstraction"
            else:
                target["exact_classification"] = "UNKNOWN"
                target["exact_meaning"] = "fail-closed engine/order uncertainty"
                target["four_valued_verdict"] = "UNKNOWN"
            results["packets"][case] = target
    else:
        for packet in packets:
            results["packets"][packet["case"]] = {"consensus": "NOT_RUN", "exact_meaning": "control failure"}
    results["theorem_mine"] = theorem_mine(packets)
    results["solver_budget"] = {"limit_seconds": budget.limit, "used_seconds": budget.used, "calls": budget.calls, "remaining_seconds": max(0.0, budget.limit - budget.used)}
    verdicts = [record.get("consensus") for record in results["packets"].values()]
    exit_code = 0 if results["controls_passed"] and "UNKNOWN" not in verdicts and "NOT_RUN" not in verdicts else 3
    return finalize(results, exit_code)


def main() -> int:
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--prepare", action="store_true")
    group.add_argument("--run", action="store_true")
    args = parser.parse_args()
    return prepare() if args.prepare else run()


if __name__ == "__main__":
    sys.exit(main())
