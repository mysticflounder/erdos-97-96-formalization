#!/usr/bin/env python3
"""Frozen one-shot exact-algebra probe for the FirstNonHit 13-row packet."""

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
SCHEMA = "freshthird-firstnonhit-exact3-algebra-v2"
MSOLVE_TIMEOUT_SECONDS = 60.0
SINGULAR_TIMEOUT_SECONDS = 60.0
CONTROL_TIMEOUT_SECONDS = 15.0
MSOLVE_THREADS = 4
MINIMIZATION_TOTAL_BUDGET_SECONDS = 240.0
MINIMIZATION_TRIAL_TIMEOUT_SECONDS = 15.0

GENERATED_FIXED = (
    "RUN_ONCE.guard",
    "control_nonempty.order_a.ms",
    "control_nonempty.order_b.ms",
    "control_nonempty.sing",
    "control_unit.order_a.ms",
    "control_unit.order_b.ms",
    "control_unit.sing",
    "target.order_a.ms",
    "target.order_b.ms",
    "target.sing",
    "results.json",
    "RESULTS.md",
    "manifest.terminal.json",
    "SHA256SUMS",
)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_json(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def write_new(path: Path, data: str) -> None:
    with path.open("x", encoding="utf-8") as handle:
        handle.write(data)


def create_guard() -> None:
    for name in GENERATED_FIXED:
        if (ROOT / name).exists():
            raise SystemExit(f"one-shot/no-overwrite refusal: {name} already exists")
    payload = {
        "schema": SCHEMA,
        "status": "FROZEN_ONE_SHOT_STARTED",
        "pid": os.getpid(),
        "started_unix_ns": time.time_ns(),
    }
    write_new(GUARD_PATH, json.dumps(payload, sort_keys=True) + "\n")


def load_and_verify() -> tuple[dict[str, Any], dict[str, Any], dict[str, Any]]:
    config = json.loads(INPUT_PATH.read_text())
    manifest = json.loads(PRELAUNCH_PATH.read_text())
    if config.get("schema") != SCHEMA or manifest.get("schema") != SCHEMA:
        raise RuntimeError("fresh schema mismatch")
    expected_hashes = manifest["hashes"]
    if sha256(INPUT_PATH) != expected_hashes["input.json"]:
        raise RuntimeError("input.json differs from prelaunch hash")
    if sha256(Path(__file__)) != expected_hashes["run_probe.py"]:
        raise RuntimeError("run_probe.py differs from prelaunch hash")
    source = REPO / config["source_packet"]["path"]
    if sha256(source) != config["source_packet"]["sha256"]:
        raise RuntimeError("v1 source packet differs from pinned exact hash")
    source_data = json.loads(source.read_text())
    if source_data["selected_supports"] != config["selected_supports"]:
        raise RuntimeError("13-row selected-support packet is not source-equivalent")
    support_hash = sha256_bytes(canonical_json(config["selected_supports"]))
    if support_hash != expected_hashes["canonical_selected_supports"]:
        raise RuntimeError("canonical selected-support hash mismatch")
    return config, manifest, source_data


def variable_orders(point_count: int) -> dict[str, tuple[str, ...]]:
    interleaved = tuple(
        name for i in range(point_count) for name in (f"x{i}", f"y{i}")
    )
    return {
        "order_a": interleaved,
        "order_b": tuple(reversed(interleaved)),
    }


def row_polynomials(center: int, support: tuple[int, ...]) -> tuple[str, ...]:
    reference = support[0]
    polynomials = []
    for point in support[1:]:
        polynomial = (
            f"x{point}^2-2*x{center}*x{point}"
            f"+y{point}^2-2*y{center}*y{point}"
            f"-x{reference}^2+2*x{center}*x{reference}"
            f"-y{reference}^2+2*y{center}*y{reference}"
        )
        if "(" in polynomial or ")" in polynomial:
            raise AssertionError("msolve polynomial contains parentheses")
        polynomials.append(polynomial)
    return tuple(polynomials)


def packet_polynomials(
    supports: dict[int, tuple[int, ...]], centers: tuple[int, ...]
) -> tuple[str, ...]:
    gauge = ("x0", "y0", "x1-1", "y1")
    rows = tuple(
        polynomial
        for center in centers
        for polynomial in row_polynomials(center, supports[center])
    )
    if len(rows) != 3 * len(centers):
        raise AssertionError("row polynomial count mismatch")
    return gauge + rows


def msolve_text(variables: tuple[str, ...], polynomials: tuple[str, ...]) -> str:
    if any("(" in polynomial or ")" in polynomial for polynomial in polynomials):
        raise AssertionError("parentheses forbidden in msolve input")
    body = ",\n".join(polynomials)
    return f"{','.join(variables)}\n0\n{body}\n"


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


def write_logs(prefix: str, stdout: str | bytes | None, stderr: str | bytes | None) -> None:
    def as_text(value: str | bytes | None) -> str:
        if value is None:
            return ""
        return value.decode(errors="replace") if isinstance(value, bytes) else value

    write_new(ROOT / f"{prefix}.stdout.txt", as_text(stdout))
    write_new(ROOT / f"{prefix}.stderr.txt", as_text(stderr))


def parse_msolve_output(text: str) -> str:
    stripped = text.strip()
    unit = bool(re.fullmatch(r"\[-1\]\s*:", stripped))
    positive_dimensional = bool(
        re.fullmatch(r"\[1,\s*[0-9]+,\s*-1,\s*\[\]\]\s*:", stripped)
    )
    finite = stripped.startswith("[0,") and stripped.endswith("]:")
    matches = [unit, positive_dimensional, finite]
    if sum(matches) != 1:
        raise ValueError("msolve output has no unique recognized verdict")
    return "UNIT" if unit else "NONUNIT"


def parse_singular_output(text: str) -> str:
    tokens = [
        line.strip().split("=", 1)[1]
        for line in text.splitlines()
        if line.strip() in {"ALGEBRA_VERDICT=UNIT", "ALGEBRA_VERDICT=NONUNIT"}
    ]
    if len(tokens) != 1:
        raise ValueError("Singular output has no unique verdict")
    return tokens[0]


def run_msolve(name: str, input_path: Path, timeout: float) -> dict[str, Any]:
    output_path = ROOT / f"{name}.msolve.out"
    if output_path.exists():
        raise RuntimeError(f"no-overwrite refusal: {output_path.name}")
    command = [
        "msolve", "-f", str(input_path), "-o", str(output_path),
        "-t", str(MSOLVE_THREADS),
    ]
    started = time.monotonic()
    try:
        proc = subprocess.run(
            command, capture_output=True, text=True, timeout=timeout, check=False
        )
    except subprocess.TimeoutExpired as exc:
        write_logs(name, exc.stdout, exc.stderr)
        return {
            "verdict": "UNKNOWN",
            "reason": "timeout",
            "timeout_seconds": timeout,
            "wall_seconds": time.monotonic() - started,
            "command": command,
        }
    write_logs(name, proc.stdout, proc.stderr)
    record: dict[str, Any] = {
        "returncode": proc.returncode,
        "wall_seconds": time.monotonic() - started,
        "command": command,
    }
    if proc.returncode != 0:
        record.update(verdict="UNKNOWN", reason="nonzero-returncode")
        return record
    if not output_path.exists():
        record.update(verdict="UNKNOWN", reason="missing-output")
        return record
    try:
        record["verdict"] = parse_msolve_output(output_path.read_text())
    except (OSError, UnicodeError, ValueError) as exc:
        record.update(verdict="UNKNOWN", reason=f"parse-failure: {exc}")
    return record


def run_singular(name: str, script_path: Path, timeout: float) -> dict[str, Any]:
    command = ["Singular", "-q", str(script_path)]
    started = time.monotonic()
    try:
        proc = subprocess.run(
            command, capture_output=True, text=True, timeout=timeout, check=False
        )
    except subprocess.TimeoutExpired as exc:
        write_logs(name, exc.stdout, exc.stderr)
        return {
            "verdict": "UNKNOWN",
            "reason": "timeout",
            "timeout_seconds": timeout,
            "wall_seconds": time.monotonic() - started,
            "command": command,
        }
    write_logs(name, proc.stdout, proc.stderr)
    record: dict[str, Any] = {
        "returncode": proc.returncode,
        "wall_seconds": time.monotonic() - started,
        "command": command,
    }
    if proc.returncode != 0:
        record.update(verdict="UNKNOWN", reason="nonzero-returncode")
        return record
    try:
        record["verdict"] = parse_singular_output(proc.stdout)
    except ValueError as exc:
        record.update(verdict="UNKNOWN", reason=f"parse-failure: {exc}")
    return record


def write_system(name: str, variables: dict[str, tuple[str, ...]], polynomials: tuple[str, ...]) -> dict[str, Path]:
    paths: dict[str, Path] = {}
    for order_name, order in variables.items():
        path = ROOT / f"{name}.{order_name}.ms"
        write_new(path, msolve_text(order, polynomials))
        paths[order_name] = path
    singular_path = ROOT / f"{name}.sing"
    write_new(singular_path, singular_text(variables["order_a"], polynomials))
    paths["singular"] = singular_path
    return paths


def run_three_engines(
    name: str,
    paths: dict[str, Path],
    msolve_timeout: float,
    singular_timeout: float,
) -> dict[str, Any]:
    records = {
        "msolve_order_a": run_msolve(
            f"{name}.order_a", paths["order_a"], msolve_timeout
        ),
        "msolve_order_b": run_msolve(
            f"{name}.order_b", paths["order_b"], msolve_timeout
        ),
        "singular": run_singular(
            f"{name}.singular", paths["singular"], singular_timeout
        ),
    }
    verdicts = [record["verdict"] for record in records.values()]
    if "UNKNOWN" in verdicts:
        consensus = "UNKNOWN"
        reason = "at least one engine timed out, failed, or did not parse uniquely"
    elif len(set(verdicts)) != 1:
        consensus = "UNKNOWN"
        reason = "variable-order or cross-engine disagreement"
    else:
        consensus = verdicts[0]
        reason = "two msolve variable orders and Singular agree"
    return {"engines": records, "consensus": consensus, "reason": reason}


def run_controls() -> dict[str, Any]:
    variables = {"order_a": ("x", "y"), "order_b": ("y", "x")}
    controls = {
        "control_nonempty": (("x-y",), "NONUNIT"),
        "control_unit": (("x", "x-1"), "UNIT"),
    }
    records: dict[str, Any] = {}
    for name, (polynomials, expected) in controls.items():
        paths = write_system(name, variables, polynomials)
        record = run_three_engines(
            name, paths, CONTROL_TIMEOUT_SECONDS, CONTROL_TIMEOUT_SECONDS
        )
        record["expected"] = expected
        record["passed"] = record["consensus"] == expected
        records[name] = record
    return records


def remaining_budget(deadline: float) -> float:
    return max(0.0, deadline - time.monotonic())


def minimize_rows(
    supports: dict[int, tuple[int, ...]],
    centers: tuple[int, ...],
    variables: dict[str, tuple[str, ...]],
) -> dict[str, Any]:
    deadline = time.monotonic() + MINIMIZATION_TOTAL_BUDGET_SECONDS
    core = list(centers)
    trials: list[dict[str, Any]] = []
    complete = True
    for center in centers:
        available = remaining_budget(deadline)
        if available < 1.0:
            complete = False
            trials.append({"dropped_center": center, "verdict": "UNKNOWN", "reason": "total-budget"})
            break
        candidate = tuple(value for value in core if value != center)
        polynomials = packet_polynomials(supports, candidate)
        script_path = ROOT / f"min_drop_{center}.sing"
        write_new(script_path, singular_text(variables["order_a"], polynomials))
        timeout = min(MINIMIZATION_TRIAL_TIMEOUT_SECONDS, available)
        trial = run_singular(f"min_drop_{center}.singular", script_path, timeout)
        trial["dropped_center"] = center
        trial["candidate_centers"] = list(candidate)
        trials.append(trial)
        if trial["verdict"] == "UNIT":
            core.remove(center)
        elif trial["verdict"] == "UNKNOWN":
            complete = False
            break

    replay: dict[str, Any] | None = None
    if complete:
        available = remaining_budget(deadline)
        if available < 3.0:
            complete = False
        else:
            core_polynomials = packet_polynomials(supports, tuple(core))
            core_paths = write_system("core_replay", variables, core_polynomials)
            each_timeout = min(60.0, max(1.0, available / 3.0))
            replay = run_three_engines(
                "core_replay", core_paths, each_timeout, each_timeout
            )
            if replay["consensus"] != "UNIT":
                complete = False

    return {
        "status": "AUTHENTICATED_GREEDY_ROW_CORE" if complete else "UNKNOWN_NO_CORE_CLAIM",
        "budget_seconds": MINIMIZATION_TOTAL_BUDGET_SECONDS,
        "trials": trials,
        "candidate_centers": core,
        "candidate_row_count": len(core),
        "independent_replay": replay,
    }


def results_markdown(results: dict[str, Any]) -> str:
    target = results.get("target", {})
    exact = results["exact_algebra_verdict"]
    mine = results["wave_data_only_general_theorem_mine"]
    lines = [
        "# Results",
        "",
        "## Terminal verdict",
        "",
        f"- Four-valued verdict: `{results['four_valued_verdict']}`.",
        f"- Exact algebra verdict: `{exact}`.",
        f"- Reason: {results['terminal_reason']}",
        "- Both smoke controls passed." if results.get("controls_passed") else "- A smoke control failed.",
        "",
        "The packet contains 39 expanded quadratic row equations plus four gauge equations.",
        "A unit ideal is complex emptiness of the equality superset and therefore rules out",
        "real pairwise-distinct realizations of this fixed packet. A non-unit ideal is not a",
        "real witness.",
        "",
        "## Engine consensus",
        "",
        f"`{target.get('consensus', 'NOT_RUN')}`: {target.get('reason', 'controls prevented target run')}.",
        "",
        "## Claim boundary",
        "",
        "This is a trusted exact-computation result about one fixed finite equality packet.",
        "It is not a P97 counterexample, universal theorem, finite-to-universal lift, Lean",
        "theorem, or proof-spine closure.",
        "",
        "## Wave-data-only general theorem mine",
        "",
        mine["outcome"],
        "",
    ]
    return "\n".join(lines)


def finalize(results: dict[str, Any], exit_code: int) -> int:
    results["ended_unix_ns"] = time.time_ns()
    write_new(ROOT / "results.json", json.dumps(results, indent=2, sort_keys=True) + "\n")
    write_new(ROOT / "RESULTS.md", results_markdown(results))

    before_terminal = sorted(
        path for path in ROOT.iterdir()
        if path.is_file() and path.name not in {"manifest.terminal.json", "SHA256SUMS"}
    )
    terminal = {
        "schema": SCHEMA,
        "status": "TERMINAL",
        "four_valued_verdict": results["four_valued_verdict"],
        "exact_algebra_verdict": results["exact_algebra_verdict"],
        "exit_code": exit_code,
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
        path for path in ROOT.iterdir()
        if path.is_file() and path.name != "SHA256SUMS"
    )
    checksum_text = "".join(f"{sha256(path)}  {path.name}\n" for path in authenticated)
    write_new(ROOT / "SHA256SUMS", checksum_text)
    return exit_code


def main() -> int:
    create_guard()
    started = time.time_ns()
    base_results: dict[str, Any] = {
        "schema": SCHEMA,
        "started_unix_ns": started,
        "four_valued_vocabulary": [
            "semantic-UNSAT", "relaxation-UNSAT", "SAT-abstraction", "UNKNOWN"
        ],
        "exact_algebra_vocabulary": ["COMPLEX_EMPTY", "NONUNIT", "UNKNOWN"],
        "claim_boundary": (
            "One fixed 13-row gauge equality packet only; no P97 counterexample, "
            "universal theorem, finite-to-universal lift, Lean theorem, or spine closure."
        ),
    }
    try:
        config, _, _ = load_and_verify()
        supports = {
            int(center): tuple(points)
            for center, points in config["selected_supports"].items()
        }
        centers = tuple(supports)
        variables = variable_orders(config["point_count"])
        target_polynomials = packet_polynomials(supports, centers)
        row_count = len(target_polynomials) - 4
        if len(centers) != 13 or row_count != 39 or len(target_polynomials) != 43:
            raise RuntimeError("expected exactly 13 rows, 39 row equations, 43 total")

        base_results["packet"] = {
            "centers": centers,
            "selected_rows": len(centers),
            "row_equalities": row_count,
            "gauge_equalities": 4,
            "total_equalities": len(target_polynomials),
            "canonical_polynomial_body_sha256": sha256_bytes(
                ("\n".join(target_polynomials) + "\n").encode()
            ),
        }
        controls = run_controls()
        base_results["controls"] = controls
        base_results["controls_passed"] = all(
            control["passed"] for control in controls.values()
        )
        if not base_results["controls_passed"]:
            base_results.update(
                four_valued_verdict="UNKNOWN",
                exact_algebra_verdict="UNKNOWN",
                terminal_reason="smoke-control failure; target not launched",
                wave_data_only_general_theorem_mine={
                    "records_reviewed": ["two algebra smoke controls"],
                    "candidate": None,
                    "outcome": "Control failure leaves no target-wave theorem data to mine.",
                },
            )
            return finalize(base_results, 2)

        target_paths = write_system("target", variables, target_polynomials)
        body_a = target_paths["order_a"].read_text().split("\n", 2)[2]
        body_b = target_paths["order_b"].read_text().split("\n", 2)[2]
        if body_a.encode() != body_b.encode():
            raise RuntimeError("msolve variable-order inputs do not share one exact polynomial body")
        base_results["msolve_polynomial_body_sha256"] = sha256_bytes(body_a.encode())

        target = run_three_engines(
            "target", target_paths, MSOLVE_TIMEOUT_SECONDS, SINGULAR_TIMEOUT_SECONDS
        )
        base_results["target"] = target
        if target["consensus"] == "UNIT":
            base_results["four_valued_verdict"] = "semantic-UNSAT"
            base_results["exact_algebra_verdict"] = "COMPLEX_EMPTY"
            base_results["terminal_reason"] = (
                "two msolve variable orders and independent Singular char-0 std "
                "agree that the gauge equality ideal is the unit ideal"
            )
            base_results["row_core_minimization"] = minimize_rows(
                supports, centers, variables
            )
        elif target["consensus"] == "NONUNIT":
            base_results["four_valued_verdict"] = "SAT-abstraction"
            base_results["exact_algebra_verdict"] = "NONUNIT"
            base_results["terminal_reason"] = (
                "the engines agree only that the complex equality ideal is non-unit; "
                "this is not a real witness"
            )
        else:
            base_results["four_valued_verdict"] = "UNKNOWN"
            base_results["exact_algebra_verdict"] = "UNKNOWN"
            base_results["terminal_reason"] = target["reason"]

        base_results["wave_data_only_general_theorem_mine"] = {
            "records_reviewed": [
                "control engine records",
                "target two-order msolve records",
                "target Singular record",
                "row-core trials and replay if launched",
            ],
            "candidate": None,
            "outcome": (
                "This wave contains one fixed equality packet and no family of independent "
                "survivors or cores. No cardinality-independent theorem candidate is justified "
                "by the wave data alone; no theorem-bank or prior-wave search was performed."
            ),
        }
        return finalize(base_results, 0 if target["consensus"] != "UNKNOWN" else 3)
    except Exception as exc:
        base_results.update(
            four_valued_verdict="UNKNOWN",
            exact_algebra_verdict="UNKNOWN",
            terminal_reason=f"fail-closed harness exception: {type(exc).__name__}: {exc}",
            controls_passed=False,
            wave_data_only_general_theorem_mine={
                "records_reviewed": ["partial one-shot artifacts"],
                "candidate": None,
                "outcome": "Harness failure leaves no authenticated theorem candidate.",
            },
        )
        return finalize(base_results, 4)


if __name__ == "__main__":
    sys.exit(main())
