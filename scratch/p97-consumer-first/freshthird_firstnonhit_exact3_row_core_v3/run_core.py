#!/usr/bin/env python3
"""One-shot authenticated row-group core miner for the v2 exact-three packet."""

from __future__ import annotations

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
INPUT_PATH = ROOT / "input.json"
PRELAUNCH_PATH = ROOT / "manifest.prelaunch.json"
GUARD_PATH = ROOT / "RUN_ONCE.guard"
SCHEMA = "freshthird-firstnonhit-exact3-row-core-v3"
MSOLVE_TIMEOUT_SECONDS = 20.0
MSOLVE_THREADS = 4
SINGULAR_TIMEOUT_SECONDS = 30.0
SINGULAR_TOTAL_BUDGET_SECONDS = 300.0
CONTROL_TIMEOUT_SECONDS = 10.0
INITIAL_FILES = {
    "README.md",
    "SOURCE-MAP.md",
    "input.json",
    "manifest.prelaunch.json",
    "run_core.py",
}


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_json(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def write_new(path: Path, text: str) -> None:
    with path.open("x", encoding="utf-8") as handle:
        handle.write(text)


def create_guard() -> None:
    present = {path.name for path in ROOT.iterdir() if path.is_file()}
    unexpected = sorted(present - INITIAL_FILES)
    missing = sorted(INITIAL_FILES - present)
    if unexpected or missing:
        raise SystemExit(
            f"one-shot/no-overwrite refusal: unexpected={unexpected}, missing={missing}"
        )
    payload = {
        "schema": SCHEMA,
        "status": "FROZEN_ONE_SHOT_STARTED",
        "pid": os.getpid(),
        "started_unix_ns": time.time_ns(),
    }
    write_new(GUARD_PATH, json.dumps(payload, sort_keys=True) + "\n")


def load_and_verify() -> tuple[dict[str, Any], dict[str, Any]]:
    config = json.loads(INPUT_PATH.read_text())
    manifest = json.loads(PRELAUNCH_PATH.read_text())
    if config.get("schema") != SCHEMA or manifest.get("schema") != SCHEMA:
        raise RuntimeError("fresh schema mismatch")
    hashes = manifest["hashes"]
    if sha256(INPUT_PATH) != hashes["input.json"]:
        raise RuntimeError("input.json differs from prelaunch hash")
    if sha256(Path(__file__)) != hashes["run_core.py"]:
        raise RuntimeError("run_core.py differs from prelaunch hash")
    for key in ("source_v2_input", "source_v2_results", "source_v1_input"):
        source = REPO / config[key]["path"]
        if sha256(source) != config[key]["sha256"]:
            raise RuntimeError(f"{key} differs from pinned exact hash")
    v2_input = json.loads((REPO / config["source_v2_input"]["path"]).read_text())
    v2_results = json.loads((REPO / config["source_v2_results"]["path"]).read_text())
    v1_input = json.loads((REPO / config["source_v1_input"]["path"]).read_text())
    if not (
        config["selected_supports"]
        == v2_input["selected_supports"]
        == v1_input["selected_supports"]
    ):
        raise RuntimeError("13-row selected-support packet is not source-equivalent")
    if v2_results.get("exact_algebra_verdict") != "COMPLEX_EMPTY":
        raise RuntimeError("pinned v2 result is not COMPLEX_EMPTY")
    if v2_results.get("target", {}).get("consensus") != "UNIT":
        raise RuntimeError("pinned v2 target lacks three-engine UNIT consensus")
    canonical_supports = sha256_bytes(canonical_json(config["selected_supports"]))
    if canonical_supports != hashes["canonical_selected_supports"]:
        raise RuntimeError("canonical selected-support hash mismatch")
    return config, v2_results


def variable_orders(point_count: int) -> dict[str, tuple[str, ...]]:
    interleaved = tuple(
        name for index in range(point_count) for name in (f"x{index}", f"y{index}")
    )
    return {"order_a": interleaved, "order_b": tuple(reversed(interleaved))}


def row_polynomials(center: int, support: tuple[int, ...]) -> tuple[str, ...]:
    reference = support[0]
    rows = tuple(
        f"x{point}^2-2*x{center}*x{point}+y{point}^2-2*y{center}*y{point}"
        f"-x{reference}^2+2*x{center}*x{reference}"
        f"-y{reference}^2+2*y{center}*y{reference}"
        for point in support[1:]
    )
    if len(rows) != 3 or any("(" in row or ")" in row for row in rows):
        raise AssertionError("row group is not three expanded msolve polynomials")
    return rows


def packet_polynomials(
    supports: dict[int, tuple[int, ...]], centers: tuple[int, ...]
) -> tuple[str, ...]:
    gauge = ("x0", "y0", "x1-1", "y1")
    rows = tuple(
        polynomial
        for center in centers
        for polynomial in row_polynomials(center, supports[center])
    )
    return gauge + rows


def msolve_text(variables: tuple[str, ...], polynomials: tuple[str, ...]) -> str:
    if any("(" in polynomial or ")" in polynomial for polynomial in polynomials):
        raise AssertionError("parentheses forbidden in msolve input")
    return f"{','.join(variables)}\n0\n{',\n'.join(polynomials)}\n"


def singular_text(variables: tuple[str, ...], polynomials: tuple[str, ...]) -> str:
    generators = ",\n  ".join(polynomials)
    return (
        f"ring R=0,({','.join(variables)}),dp;\n"
        f"ideal I =\n  {generators};\n"
        "ideal G = std(I);\n"
        'if (size(G)==1 and G[1]==1) { print("ALGEBRA_VERDICT=UNIT"); } '
        'else { print("ALGEBRA_VERDICT=NONUNIT"); }\n'
        "quit;\n"
    )


def as_text(value: str | bytes | None) -> str:
    if value is None:
        return ""
    return value.decode(errors="replace") if isinstance(value, bytes) else value


def write_logs(prefix: str, stdout: str | bytes | None, stderr: str | bytes | None) -> None:
    write_new(ROOT / f"{prefix}.stdout.txt", as_text(stdout))
    write_new(ROOT / f"{prefix}.stderr.txt", as_text(stderr))


def parse_msolve_output(text: str) -> str:
    stripped = text.strip()
    unit = bool(re.fullmatch(r"\[-1\]\s*:", stripped))
    positive = bool(re.fullmatch(r"\[1,\s*[0-9]+,\s*-1,\s*\[\]\]\s*:", stripped))
    finite = stripped.startswith("[0,") and stripped.endswith("]:")
    if sum((unit, positive, finite)) != 1:
        raise ValueError("msolve output has no unique recognized verdict")
    return "UNIT" if unit else "NONUNIT"


def parse_singular_output(text: str) -> str:
    matches = [
        line.strip().split("=", 1)[1]
        for line in text.splitlines()
        if line.strip() in {"ALGEBRA_VERDICT=UNIT", "ALGEBRA_VERDICT=NONUNIT"}
    ]
    if len(matches) != 1:
        raise ValueError("Singular output has no unique verdict")
    return matches[0]


def run_msolve(tag: str, path: Path, timeout: float) -> dict[str, Any]:
    output = ROOT / f"{tag}.msolve.out"
    command = ["msolve", "-f", str(path), "-o", str(output), "-t", str(MSOLVE_THREADS)]
    started = time.monotonic()
    try:
        proc = subprocess.run(
            command, capture_output=True, text=True, timeout=timeout, check=False
        )
    except subprocess.TimeoutExpired as exc:
        write_logs(tag, exc.stdout, exc.stderr)
        return {
            "verdict": "UNKNOWN",
            "reason": "timeout",
            "timeout_seconds": timeout,
            "wall_seconds": time.monotonic() - started,
            "command": command,
        }
    write_logs(tag, proc.stdout, proc.stderr)
    record: dict[str, Any] = {
        "returncode": proc.returncode,
        "wall_seconds": time.monotonic() - started,
        "command": command,
    }
    if proc.returncode != 0:
        record.update(verdict="UNKNOWN", reason="nonzero-returncode")
    elif not output.exists():
        record.update(verdict="UNKNOWN", reason="missing-output")
    else:
        try:
            record["verdict"] = parse_msolve_output(output.read_text())
        except (OSError, UnicodeError, ValueError) as exc:
            record.update(verdict="UNKNOWN", reason=f"parse-failure: {exc}")
    return record


def write_msolve_pair(
    tag: str,
    variables: dict[str, tuple[str, ...]],
    polynomials: tuple[str, ...],
) -> dict[str, Path]:
    paths: dict[str, Path] = {}
    for order_name, order in variables.items():
        path = ROOT / f"{tag}.{order_name}.ms"
        write_new(path, msolve_text(order, polynomials))
        paths[order_name] = path
    first_body = paths["order_a"].read_text().split("\n", 2)[2]
    second_body = paths["order_b"].read_text().split("\n", 2)[2]
    if first_body != second_body:
        raise RuntimeError("two msolve orders do not share an exact polynomial body")
    return paths


def run_msolve_pair(
    tag: str,
    variables: dict[str, tuple[str, ...]],
    polynomials: tuple[str, ...],
    timeout: float = MSOLVE_TIMEOUT_SECONDS,
) -> dict[str, Any]:
    paths = write_msolve_pair(tag, variables, polynomials)
    engines = {
        "order_a": run_msolve(f"{tag}.order_a", paths["order_a"], timeout),
        "order_b": run_msolve(f"{tag}.order_b", paths["order_b"], timeout),
    }
    verdicts = [engine["verdict"] for engine in engines.values()]
    if "UNKNOWN" in verdicts:
        consensus = "UNKNOWN"
        reason = "an msolve order timed out, failed, or did not parse"
    elif len(set(verdicts)) != 1:
        consensus = "UNKNOWN"
        reason = "msolve variable-order disagreement"
    else:
        consensus = verdicts[0]
        reason = "two fresh msolve declaration orders agree"
    return {"engines": engines, "consensus": consensus, "reason": reason}


class SingularBudget:
    def __init__(self, total_seconds: float) -> None:
        self.total_seconds = total_seconds
        self.wall_seconds = 0.0
        self.calls = 0

    def run(
        self,
        tag: str,
        variables: tuple[str, ...],
        polynomials: tuple[str, ...],
        requested_timeout: float,
    ) -> dict[str, Any]:
        remaining = self.total_seconds - self.wall_seconds
        if remaining <= 0.75:
            return {
                "verdict": "UNKNOWN",
                "reason": "strict-total-budget",
                "remaining_seconds": max(0.0, remaining),
            }
        timeout = min(requested_timeout, SINGULAR_TIMEOUT_SECONDS, remaining - 0.5)
        path = ROOT / f"{tag}.sing"
        write_new(path, singular_text(variables, polynomials))
        command = ["Singular", "-q", str(path)]
        started = time.monotonic()
        self.calls += 1
        try:
            proc = subprocess.run(
                command, capture_output=True, text=True, timeout=timeout, check=False
            )
        except subprocess.TimeoutExpired as exc:
            elapsed = time.monotonic() - started
            self.wall_seconds += elapsed
            write_logs(f"{tag}.singular", exc.stdout, exc.stderr)
            return {
                "verdict": "UNKNOWN",
                "reason": "timeout",
                "timeout_seconds": timeout,
                "wall_seconds": elapsed,
                "command": command,
            }
        elapsed = time.monotonic() - started
        self.wall_seconds += elapsed
        write_logs(f"{tag}.singular", proc.stdout, proc.stderr)
        record: dict[str, Any] = {
            "returncode": proc.returncode,
            "wall_seconds": elapsed,
            "command": command,
        }
        if proc.returncode != 0:
            record.update(verdict="UNKNOWN", reason="nonzero-returncode")
        else:
            try:
                record["verdict"] = parse_singular_output(proc.stdout)
            except ValueError as exc:
                record.update(verdict="UNKNOWN", reason=f"parse-failure: {exc}")
        return record


def run_three_engines(
    tag: str,
    variables: dict[str, tuple[str, ...]],
    polynomials: tuple[str, ...],
    singular_budget: SingularBudget,
    msolve_timeout: float = MSOLVE_TIMEOUT_SECONDS,
    singular_timeout: float = SINGULAR_TIMEOUT_SECONDS,
) -> dict[str, Any]:
    msolve = run_msolve_pair(tag, variables, polynomials, msolve_timeout)
    singular = singular_budget.run(
        tag, variables["order_a"], polynomials, singular_timeout
    )
    verdicts = [msolve["consensus"], singular["verdict"]]
    if "UNKNOWN" in verdicts:
        consensus = "UNKNOWN"
        reason = "at least one engine timed out, failed, or disagreed"
    elif len(set(verdicts)) != 1:
        consensus = "UNKNOWN"
        reason = "msolve/Singular disagreement"
    else:
        consensus = verdicts[0]
        reason = "two msolve orders and independent Singular agree"
    return {
        "msolve": msolve,
        "singular": singular,
        "consensus": consensus,
        "reason": reason,
    }


def connected_components(
    vertices: tuple[int, ...], edges: tuple[tuple[int, int], ...]
) -> list[list[int]]:
    adjacency = {vertex: set() for vertex in vertices}
    for left, right in edges:
        adjacency[left].add(right)
        adjacency[right].add(left)
    components: list[list[int]] = []
    unseen = set(vertices)
    for root in vertices:
        if root not in unseen:
            continue
        stack = [root]
        unseen.remove(root)
        component: list[int] = []
        while stack:
            vertex = stack.pop()
            component.append(vertex)
            for neighbor in reversed(vertices):
                if neighbor in adjacency[vertex] and neighbor in unseen:
                    unseen.remove(neighbor)
                    stack.append(neighbor)
        components.append(sorted(component, key=vertices.index))
    return components


def graph_record(
    centers: tuple[int, ...],
    supports: dict[int, tuple[int, ...]],
    minimum_intersection: int,
) -> dict[str, Any]:
    labeled_edges: list[dict[str, Any]] = []
    for left_index, left in enumerate(centers):
        for right in centers[left_index + 1 :]:
            shared = sorted(set(supports[left]) & set(supports[right]))
            if len(shared) >= minimum_intersection:
                labeled_edges.append({"rows": [left, right], "shared_supports": shared})
    edges = tuple(tuple(edge["rows"]) for edge in labeled_edges)
    components = connected_components(centers, edges)
    degrees = {str(center): 0 for center in centers}
    for left, right in edges:
        degrees[str(left)] += 1
        degrees[str(right)] += 1

    bridges: list[list[int]] = []
    base_count = len(components)
    for edge in edges:
        reduced = tuple(candidate for candidate in edges if candidate != edge)
        if len(connected_components(centers, reduced)) > base_count:
            bridges.append(list(edge))

    tree_edges: set[tuple[int, int]] = set()
    parent: dict[int, int | None] = {}
    adjacency = {center: [] for center in centers}
    for left, right in edges:
        adjacency[left].append(right)
        adjacency[right].append(left)
    for root in centers:
        if root in parent:
            continue
        parent[root] = None
        stack = [root]
        while stack:
            vertex = stack.pop()
            for neighbor in sorted(adjacency[vertex], key=centers.index, reverse=True):
                if neighbor not in parent:
                    parent[neighbor] = vertex
                    tree_edges.add(tuple(sorted((vertex, neighbor))))
                    stack.append(neighbor)

    def tree_path(left: int, right: int) -> list[int]:
        ancestors: dict[int, int] = {}
        path: list[int] = []
        vertex: int | None = left
        while vertex is not None:
            ancestors[vertex] = len(path)
            path.append(vertex)
            vertex = parent[vertex]
        tail: list[int] = []
        vertex = right
        while vertex not in ancestors:
            tail.append(vertex)
            vertex = parent[vertex]
            if vertex is None:
                raise AssertionError("non-tree edge crosses components")
        return path[: ancestors[vertex] + 1] + list(reversed(tail))

    cycles = [
        tree_path(left, right) + [left]
        for left, right in edges
        if tuple(sorted((left, right))) not in tree_edges
    ]
    return {
        "minimum_shared_supports": minimum_intersection,
        "vertices": list(centers),
        "labeled_edges": labeled_edges,
        "edge_count": len(edges),
        "components": components,
        "degree_by_row": degrees,
        "degree_sequence_descending": sorted(degrees.values(), reverse=True),
        "cycle_rank": len(edges) - len(centers) + len(components),
        "bridges": bridges,
        "fundamental_cycle_basis": cycles,
    }


def has_unknown(value: Any) -> bool:
    if isinstance(value, dict):
        return value.get("verdict") == "UNKNOWN" or value.get("consensus") == "UNKNOWN" or any(
            has_unknown(child) for child in value.values()
        )
    if isinstance(value, list):
        return any(has_unknown(child) for child in value)
    return False


def results_markdown(results: dict[str, Any]) -> str:
    core = results.get("row_core", {})
    centers = core.get("best_authenticated_unit_centers", [])
    graph = results.get("wave_data_only_generalization", {}).get(
        "pair_overlap_graph", {}
    )
    return "\n".join(
        [
            "# Results",
            "",
            "## Terminal status",
            "",
            f"- Status: `{results.get('status', 'UNKNOWN')}`.",
            f"- Minimal-core claim: `{core.get('minimal_core_claim', False)}`.",
            f"- Best authenticated UNIT centers: `{centers}`.",
            f"- Singular calls: `{results.get('singular_budget', {}).get('calls', 0)}`; "
            f"solver wall `{results.get('singular_budget', {}).get('wall_seconds', 0):.3f}s` "
            f"of `{SINGULAR_TOTAL_BUDGET_SECONDS:.0f}s`.",
            "",
            "## Row-intersection shape",
            "",
            f"On the best authenticated core, the pair-overlap graph has "
            f"`{graph.get('edge_count', 0)}` edges and cycle rank "
            f"`{graph.get('cycle_rank', 0)}`.",
            "The exact labeled edges and fundamental cycle basis are in `results.json`.",
            "This is a finite wave-data pattern, not a universal theorem.",
            "",
            "## Trust boundary",
            "",
            "The verdict is cross-engine exact computation over Q/its algebraic closure,",
            "without a checkable algebra certificate. It is not a Lean proof, universal",
            "closure, finite-to-universal lift, or P97 counterexample.",
            "",
        ]
    )


def finalize(results: dict[str, Any], exit_code: int) -> int:
    results["ended_unix_ns"] = time.time_ns()
    write_new(ROOT / "results.json", json.dumps(results, indent=2, sort_keys=True) + "\n")
    write_new(ROOT / "RESULTS.md", results_markdown(results))
    before_terminal = sorted(
        path
        for path in ROOT.iterdir()
        if path.is_file() and path.name not in {"manifest.terminal.json", "SHA256SUMS"}
    )
    terminal = {
        "schema": SCHEMA,
        "status": "TERMINAL",
        "result_status": results.get("status", "UNKNOWN"),
        "exit_code": exit_code,
        "minimal_core_claim": results.get("row_core", {}).get(
            "minimal_core_claim", False
        ),
        "artifact_hashes_before_terminal_manifest": {
            path.name: sha256(path) for path in before_terminal
        },
        "claim_boundary": results["claim_boundary"],
    }
    write_new(
        ROOT / "manifest.terminal.json",
        json.dumps(terminal, indent=2, sort_keys=True) + "\n",
    )
    authenticated = sorted(
        path for path in ROOT.iterdir() if path.is_file() and path.name != "SHA256SUMS"
    )
    checksums = "".join(f"{sha256(path)}  {path.name}\n" for path in authenticated)
    write_new(ROOT / "SHA256SUMS", checksums)
    return exit_code


def main() -> int:
    create_guard()
    singular_budget = SingularBudget(SINGULAR_TOTAL_BUDGET_SECONDS)
    results: dict[str, Any] = {
        "schema": SCHEMA,
        "started_unix_ns": time.time_ns(),
        "claim_boundary": (
            "One fixed 13-row gauge equality packet; trusted cross-engine computation "
            "without an exact certificate; no universal or Lean closure claim."
        ),
    }
    try:
        config, v2_results = load_and_verify()
        supports = {
            int(center): tuple(points)
            for center, points in config["selected_supports"].items()
        }
        centers = tuple(config["row_group_order"])
        if set(centers) != set(supports) or len(centers) != 13:
            raise RuntimeError("row-group order is not the exact 13-center universe")
        variables = variable_orders(config["point_count"])

        controls: dict[str, Any] = {}
        for name, polynomials, expected in (
            ("control_nonunit", ("x-y",), "NONUNIT"),
            ("control_unit", ("x", "x-1"), "UNIT"),
        ):
            control_variables = {"order_a": ("x", "y"), "order_b": ("y", "x")}
            record = run_three_engines(
                name,
                control_variables,
                polynomials,
                singular_budget,
                CONTROL_TIMEOUT_SECONDS,
                CONTROL_TIMEOUT_SECONDS,
            )
            record["expected"] = expected
            record["passed"] = record["consensus"] == expected
            controls[name] = record
        results["controls"] = controls
        if not all(record["passed"] for record in controls.values()):
            results.update(status="UNKNOWN_CONTROL_FAILURE")
            results["row_core"] = {
                "minimal_core_claim": False,
                "best_authenticated_unit_centers": list(centers),
                "fallback_source": config["source_v2_results"],
            }
            results["singular_budget"] = {
                "limit_seconds": singular_budget.total_seconds,
                "wall_seconds": singular_budget.wall_seconds,
                "calls": singular_budget.calls,
            }
            return finalize(results, 2)

        full_polynomials = packet_polynomials(supports, centers)
        if len(full_polynomials) != 43:
            raise RuntimeError("expected four gauge plus 39 row equations")
        initial = run_msolve_pair("discovery_full", variables, full_polynomials)
        results["initial_full_msolve"] = initial
        core = list(centers)
        trials: list[dict[str, Any]] = []
        if initial["consensus"] == "UNIT":
            for center in centers:
                candidate = tuple(value for value in core if value != center)
                record = run_msolve_pair(
                    f"discovery_drop_{center}",
                    variables,
                    packet_polynomials(supports, candidate),
                )
                accepted = record["consensus"] == "UNIT"
                record.update(
                    dropped_center=center,
                    candidate_centers=list(candidate),
                    deletion_accepted=accepted,
                )
                trials.append(record)
                if accepted:
                    core.remove(center)
        else:
            trials.append(
                {
                    "consensus": "UNKNOWN",
                    "reason": "initial full set did not receive dual-msolve UNIT",
                }
            )
        results["greedy_discovery"] = {
            "fixed_order": list(centers),
            "trials": trials,
            "candidate_centers": list(core),
        }

        final_centers = tuple(core)
        final_core = run_three_engines(
            "terminal_core",
            variables,
            packet_polynomials(supports, final_centers),
            singular_budget,
        )
        drop_ones: list[dict[str, Any]] = []
        for center in final_centers:
            candidate = tuple(value for value in final_centers if value != center)
            record = run_three_engines(
                f"terminal_drop_{center}",
                variables,
                packet_polynomials(supports, candidate),
                singular_budget,
            )
            record.update(dropped_center=center, candidate_centers=list(candidate))
            drop_ones.append(record)

        all_records = {"initial": initial, "trials": trials, "final": final_core, "drops": drop_ones}
        unknown_seen = has_unknown(all_records)
        minimal = (
            not unknown_seen
            and final_core["consensus"] == "UNIT"
            and all(record["consensus"] == "NONUNIT" for record in drop_ones)
        )
        if final_core["consensus"] == "UNIT":
            best = list(final_centers)
            fallback: dict[str, Any] | None = None
        else:
            best = list(centers)
            fallback = {
                "source": config["source_v2_results"],
                "v2_target_consensus": v2_results["target"]["consensus"],
            }
        if minimal:
            status = "AUTHENTICATED_INCLUSION_MINIMAL_ROW_CORE"
        elif final_core["consensus"] == "UNIT":
            status = "AUTHENTICATED_UNIT_NOT_MINIMAL_UNKNOWN"
        else:
            status = "UNKNOWN_FALLBACK_TO_PINNED_V2_UNIT"
        results["status"] = status
        results["row_core"] = {
            "minimal_core_claim": minimal,
            "candidate_centers": list(final_centers),
            "candidate_supports": {
                str(center): list(supports[center]) for center in final_centers
            },
            "final_core_replay": final_core,
            "final_drop_one_replays": drop_ones,
            "unknown_seen": unknown_seen,
            "best_authenticated_unit_centers": best,
            "best_authenticated_unit_supports": {
                str(center): list(supports[center]) for center in best
            },
            "fallback": fallback,
        }
        best_tuple = tuple(best)
        results["wave_data_only_generalization"] = {
            "scope": "only the retained row groups in this v3 wave",
            "candidate_universal_theorem": None,
            "nonempty_intersection_graph": graph_record(best_tuple, supports, 1),
            "pair_overlap_graph": graph_record(best_tuple, supports, 2),
            "outcome": (
                "The exact row-intersection and cycle shape is recorded as a finite "
                "motif only. No Lean, theorem-bank, prior-wave, or literature search "
                "was performed, and no universal theorem is claimed."
            ),
        }
        results["singular_budget"] = {
            "limit_seconds": singular_budget.total_seconds,
            "per_call_limit_seconds": SINGULAR_TIMEOUT_SECONDS,
            "wall_seconds": singular_budget.wall_seconds,
            "calls": singular_budget.calls,
            "strict_budget_respected": singular_budget.wall_seconds
            <= singular_budget.total_seconds,
        }
        return finalize(results, 0 if minimal else 3)
    except Exception as exc:
        results.update(
            status="UNKNOWN_HARNESS_FAILURE",
            error=f"{type(exc).__name__}: {exc}",
            row_core={"minimal_core_claim": False},
            singular_budget={
                "limit_seconds": singular_budget.total_seconds,
                "wall_seconds": singular_budget.wall_seconds,
                "calls": singular_budget.calls,
            },
        )
        return finalize(results, 4)


if __name__ == "__main__":
    sys.exit(main())
