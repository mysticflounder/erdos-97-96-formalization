#!/usr/bin/env python3
"""Independent artifact verifier for the v4 exact-17 CEGAR round."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

HERE = Path(__file__).resolve().parent
V3 = HERE.parent / "post_rich_cut_v3"
VERIFICATION = HERE / "verification.json"
SHA_FILE = HERE / "SHA256SUMS"


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def edge(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise ValueError("loop is not a carrier edge")
    return (a, b) if a < b else (b, a)


def components(rows: list[list[int]]) -> dict[tuple[int, int], tuple[int, int]]:
    parent: dict[tuple[int, int], tuple[int, int]] = {}

    def find(node: tuple[int, int]) -> tuple[int, int]:
        parent.setdefault(node, node)
        while parent[node] != node:
            parent[node] = parent[parent[node]]
            node = parent[node]
        return node

    def union(left: tuple[int, int], right: tuple[int, int]) -> None:
        lroot, rroot = find(left), find(right)
        if lroot != rroot:
            parent[rroot] = lroot

    for center, raw_support in enumerate(rows):
        support = sorted(map(int, raw_support))
        if len(support) != 4 or len(set(support)) != 4 or center in support:
            raise ValueError(f"bad chosen row {center}")
        base = edge(center, support[0])
        for member in support[1:]:
            union(base, edge(center, member))
    return {node: find(node) for node in list(parent)}


def closure_collisions(assignment: dict[str, Any]) -> list[tuple[int, int, int]]:
    n = int(assignment["n"])
    blockers = set(map(int, assignment["blockers"]))
    rows = [list(map(int, row)) for row in assignment["point_k4_rows"]]
    roots = components(rows)
    collisions: list[tuple[int, int, int]] = []
    for center in sorted(blockers):
        support = set(rows[center])
        for member in sorted(support):
            root = roots.get(edge(center, member), edge(center, member))
            for off in range(n):
                if off == center or off in support:
                    continue
                if roots.get(edge(center, off), edge(center, off)) == root:
                    collisions.append((center, member, off))
    return collisions


def validate_cut_independently(
    cut: dict[str, Any], assignment: dict[str, Any]
) -> list[str]:
    errors: list[str] = []
    rows = [set(map(int, row)) for row in assignment["point_k4_rows"]]
    blockers = list(map(int, assignment["blockers"]))
    source, center = int(cut["source"]), int(cut["center"])
    support, off = int(cut["support_point"]), int(cut["off_support_point"])
    if blockers[source] != center:
        errors.append("false blocker/source identity guard")
    if support not in rows[center] or off in rows[center] or off == center:
        errors.append("false support/off-support guard")
    cursor = edge(center, support)
    seen_guards: list[tuple[str, int, int, bool]] = [
        ("point_k4", center, support, True),
        ("point_k4", center, off, False),
    ]
    for index, step in enumerate(cut["path"]):
        row_center = int(step["row_center"])
        first, second = map(int, step["row_members"])
        left, right = edge(row_center, first), edge(row_center, second)
        if list(left) != list(step["left"]) or list(right) != list(step["right"]):
            errors.append(f"step {index} node metadata mismatch")
        if first not in rows[row_center] or second not in rows[row_center]:
            errors.append(f"step {index} uses a false row membership")
        if cursor == left:
            cursor = right
        elif cursor == right:
            cursor = left
        else:
            errors.append(f"step {index} is not path-contiguous")
        seen_guards.extend(
            [
                ("point_k4", row_center, first, True),
                ("point_k4", row_center, second, True),
            ]
        )
    if cursor != edge(center, off):
        errors.append("path does not reach off-support edge")
    expected_guards = list(dict.fromkeys(seen_guards))
    recorded_guards = [
        (
            str(item["kind"]),
            int(item["center"]),
            int(item["point"]),
            bool(item["polarity"]),
        )
        for item in cut["membership_guards"]
    ]
    if expected_guards != recorded_guards:
        errors.append("guard set is not exactly the path support")
    hash_payload = dict(cut)
    recorded_hash = hash_payload.pop("sha256")
    actual_hash = hashlib.sha256(
        json.dumps(hash_payload, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    if recorded_hash != actual_hash:
        errors.append("cut metadata SHA256 mismatch")
    return errors


def check_one_query(path: Path) -> list[str]:
    text = path.read_text()
    errors: list[str] = []
    if len(re.findall(r"\(\s*check-sat\b", text)) != 1:
        errors.append(f"{path.relative_to(HERE)} is not one-check-sat")
    if "(model-add" in text:
        errors.append(f"{path.relative_to(HERE)} contains Z3 model-add commands")
    return errors


def artifact_paths() -> list[Path]:
    return sorted(
        path
        for path in HERE.rglob("*")
        if path.is_file()
        and path.name != "SHA256SUMS"
        and "__pycache__" not in path.parts
    )


def write_sha() -> None:
    lines = [
        f"{hashlib.sha256(path.read_bytes()).hexdigest()}  {path.relative_to(HERE)}"
        for path in artifact_paths()
    ]
    SHA_FILE.write_text("\n".join(lines) + "\n")


def verify_sha() -> list[str]:
    errors: list[str] = []
    entries: dict[str, str] = {}
    for line in SHA_FILE.read_text().splitlines():
        digest, relative = line.split("  ", 1)
        entries[relative] = digest
    expected = {str(path.relative_to(HERE)): path for path in artifact_paths()}
    if set(entries) != set(expected):
        errors.append("SHA256SUMS file list does not match artifact tree")
    for relative, path in expected.items():
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        if entries.get(relative) != digest:
            errors.append(f"SHA256 mismatch: {relative}")
    return errors


def run(write_hashes: bool) -> dict[str, Any]:
    v3_incidence = load_module("v3_incidence_verify", V3 / "incidence_round.py")
    source = v3_incidence.load_source_generator()
    incidence_results = json.loads((HERE / "incidence_results.json").read_text())
    metric_results = json.loads((HERE / "metric_results.json").read_text())
    cuts = [
        json.loads(line)
        for line in (HERE / incidence_results["cuts"]).read_text().splitlines()
        if line.strip()
    ]
    errors: list[str] = []

    iteration_assignments: dict[int, dict[str, Any]] = {}
    for path in sorted((HERE / "generated").glob("iteration_*_assignment.json")):
        iteration = int(path.stem.split("_")[1])
        assignment = json.loads(path.read_text())
        iteration_assignments[iteration] = assignment
        errors.extend(source.verify_global_assignment(assignment))
        errors.extend(v3_incidence.validate_cut(assignment))
    for cut in cuts:
        iteration = int(cut["generated_at_iteration"])
        if iteration not in iteration_assignments:
            errors.append(f"cut {cut['cut_id']} has no generating assignment")
            continue
        errors.extend(validate_cut_independently(cut, iteration_assignments[iteration]))

    final_assignment = json.loads((HERE / incidence_results["assignment"]).read_text())
    errors.extend(source.verify_global_assignment(final_assignment))
    errors.extend(v3_incidence.validate_cut(final_assignment))
    final_collisions = closure_collisions(final_assignment)
    if final_collisions:
        errors.append(
            f"final assignment has closure collisions: {final_collisions[:5]}"
        )
    if incidence_results["classification"] != "CLOSURE_CLEAN_SAT":
        errors.append("incidence classification is not CLOSURE_CLEAN_SAT")
    if incidence_results["dual_check"] != "PASS" or any(
        item["status"] != "SAT" for item in incidence_results["external"].values()
    ):
        errors.append("final incidence artifact lacks dual-solver SAT")
    errors.extend(check_one_query(HERE / incidence_results["query"]))

    for query in metric_results["queries"] + metric_results["controls"]:
        errors.extend(check_one_query(HERE / query["artifact"]))
        z3_data = query["z3"]
        if z3_data["status"] == "SAT":
            if z3_data.get("exact_substitution_validation") != "PASS":
                errors.append(f"{query['query']} lacks exact substitution replay")
            if z3_data.get("fraction_validation") != "PASS":
                errors.append(f"{query['query']} lacks Fraction replay")
    for control in metric_results["controls"]:
        if not all(
            control[key]["status"] == "UNSAT" for key in ("z3", "z3_cli", "cvc5")
        ):
            errors.append(f"malformed control did not reject: {control['query']}")

    result = {
        "status": "PASS" if not errors else "FAIL",
        "errors": errors,
        "cut_count": len(cuts),
        "iteration_assignment_count": len(iteration_assignments),
        "final_closure_collisions": final_collisions,
        "metric_first_joint_unsat_stage": metric_results["first_joint_unsat_stage"],
        "classification": (
            "independently verified exact-17 direct-crossed finite SAT survivor; "
            "no universal lift and no Lean closure"
        ),
    }
    VERIFICATION.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    if write_hashes:
        write_sha()
    elif SHA_FILE.exists():
        errors.extend(verify_sha())
        result["status"] = "PASS" if not errors else "FAIL"
        result["errors"] = errors
        VERIFICATION.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--write-sha", action="store_true")
    args = parser.parse_args()
    result = run(args.write_sha)
    print(f"verification={result['status']} cuts={result['cut_count']}")
    if result["errors"]:
        for error in result["errors"][:20]:
            print(error)
        raise SystemExit(1)


if __name__ == "__main__":
    main()
