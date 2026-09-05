# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Solve the source-bound exact-13 residual support domains through PIQD.

The structural CSP chooses one surviving four-support row at each center not
already fixed by the replayed source prefix.  It blocks only checked one-form
Kalmanson cancellations.  SAT therefore means a survivor of this finite bank,
not a metric or source realization; UNSAT is scoped to the encoded bank.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import re
from pathlib import Path
from typing import Any

import cardge13_exact13_fixed_base_k4_scan as scan

SCHEMA = "cardge13-exact13-residual-domain-csp-piqd/v1"
DEFAULT_DOMAINS_EVENT = Path(
    "scratch/runs/cardge13-exact13-k4-prefix-cegar-20260904/run-0006/"
    "events/all-centers-source-valid-exhaustive-short-scan.json"
)


def validate_row(center: int, support: tuple[int, ...]) -> None:
    if center not in scan.core.LABELS:
        raise ValueError("row center must be a Fin-13 label")
    if len(support) != 4 or len(set(support)) != 4:
        raise ValueError("row support must contain four distinct labels")
    if center in support:
        raise ValueError("row support must omit its center")
    if any(point not in scan.core.LABELS for point in support):
        raise ValueError("row support must use Fin-13 labels")


def domains_event_binding(
    path: Path,
) -> tuple[dict[int, tuple[tuple[int, ...], ...]], dict[str, object]]:
    payload = json.loads(path.read_text())
    if payload.get("schema") != scan.SCHEMA:
        raise AssertionError("unexpected residual-domain event schema")
    expected_source = scan.source_model_binding(scan.DEFAULT_SOURCE_EVENT)
    if payload.get("source_model_binding") != expected_source:
        raise AssertionError("residual-domain source binding drifted")
    rows = payload.get("centers")
    if not isinstance(rows, list):
        raise TypeError("residual-domain centers must be an array")
    by_center: dict[int, tuple[tuple[int, ...], ...]] = {}
    for row in rows:
        if not isinstance(row, dict):
            raise TypeError("residual-domain center row must be an object")
        center = row.get("center")
        residuals = row.get("first_uncovered_supports")
        uncovered = row.get("uncovered_count")
        covered = row.get("covered_count")
        if not isinstance(center, int) or not isinstance(residuals, list):
            raise TypeError("residual-domain center or supports are malformed")
        if row.get("scanned_support_count") != 495:
            raise AssertionError(f"center {center} scan is not exhaustive")
        if uncovered != len(residuals) or covered != 495 - len(residuals):
            raise AssertionError(f"center {center} residual count drifted")
        parsed: list[tuple[int, ...]] = []
        for support in residuals:
            if not isinstance(support, list):
                raise TypeError("residual support must be an array")
            value = tuple(int(point) for point in support)
            validate_row(center, value)
            if scan.certificate_for(center, value) is not None:
                raise AssertionError("residual support has a short certificate")
            parsed.append(value)
        by_center[center] = tuple(parsed)
    if set(by_center) != set(scan.DEFAULT_CENTERS):
        raise AssertionError("residual-domain center set drifted")
    challenge_rows = expected_source["challenge_rows"]
    if not isinstance(challenge_rows, dict):
        raise TypeError("source challenge rows must be an object")
    for center in scan.EXPECTED_CHALLENGE_CENTERS:
        support = tuple(int(point) for point in challenge_rows[str(center)])
        if support not in by_center[center]:
            raise AssertionError(f"source challenge row at center {center} left its domain")
    variable = {
        center: by_center[center]
        for center in scan.DEFAULT_CENTERS
        if center not in scan.EXPECTED_CHALLENGE_CENTERS
    }
    return variable, {
        "path": str(path),
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "source_model_binding": expected_source,
        "domain_sizes": {str(center): len(domain) for center, domain in variable.items()},
    }


def fixed_prefix_rows(source_binding: dict[str, object]) -> scan.Rows:
    challenge_rows = source_binding.get("challenge_rows")
    if not isinstance(challenge_rows, dict):
        raise TypeError("source challenge rows must be an object")
    rows = tuple(
        (center, tuple(int(point) for point in challenge_rows[str(center)]))
        for center in scan.EXPECTED_CHALLENGE_CENTERS
    )
    for center, support in rows:
        validate_row(center, support)
    return rows


def zero_form(rows: scan.Rows) -> scan.Form | None:
    classes = scan.edge_classes_for_rows(rows)
    for form, vector in scan.FORMS:
        if not scan.project(vector, classes):
            return form
    return None


def build_bank(
    domains: dict[int, tuple[tuple[int, ...], ...]], prefix: scan.Rows
) -> dict[str, list[dict[str, object]]]:
    if zero_form(prefix) is not None:
        raise AssertionError("the replayed source prefix already has a zero-form conflict")
    single: list[dict[str, object]] = []
    pair: list[dict[str, object]] = []
    for center, domain in domains.items():
        for index, support in enumerate(domain):
            form = zero_form(prefix + ((center, support),))
            if form is not None:
                single.append({"center": center, "index": index, "form": list(form)})
    blocked_single = {(row["center"], row["index"]) for row in single}
    for left_center, right_center in itertools.combinations(domains, 2):
        for left_index, left_support in enumerate(domains[left_center]):
            if (left_center, left_index) in blocked_single:
                continue
            for right_index, right_support in enumerate(domains[right_center]):
                if (right_center, right_index) in blocked_single:
                    continue
                form = zero_form(
                    prefix
                    + (
                        (left_center, left_support),
                        (right_center, right_support),
                    )
                )
                if form is not None:
                    pair.append(
                        {
                            "left_center": left_center,
                            "left_index": left_index,
                            "right_center": right_center,
                            "right_index": right_index,
                            "form": list(form),
                        }
                    )
    return {"single": single, "pair": pair}


def variable(center: int, index: int) -> str:
    return f"x_{center}_{index}"


def build_commands(
    domains: dict[int, tuple[tuple[int, ...], ...]],
    bank: dict[str, list[dict[str, object]]],
) -> tuple[str, ...]:
    commands = ["(set-logic QF_UF)"]
    for center, domain in domains.items():
        names = [variable(center, index) for index in range(len(domain))]
        commands.extend(f"(declare-const {name} Bool)" for name in names)
        commands.append(f"(assert (or {' '.join(names)}))")
        commands.extend(
            f"(assert (or (not {left}) (not {right})))"
            for left, right in itertools.combinations(names, 2)
        )
    commands.extend(
        f"(assert (not {variable(int(row['center']), int(row['index']))}))"
        for row in bank["single"]
    )
    commands.extend(
        "(assert (or "
        f"(not {variable(int(row['left_center']), int(row['left_index']))}) "
        f"(not {variable(int(row['right_center']), int(row['right_index']))})))"
        for row in bank["pair"]
    )
    return tuple(commands)


def exhaustive_bank_oracle(
    domains: dict[int, tuple[tuple[int, ...], ...]],
    bank: dict[str, list[dict[str, object]]],
) -> dict[str, object]:
    """Independently enumerate every assignment in the finite conflict CSP."""
    centers = tuple(domains)
    single = {
        (int(row["center"]), int(row["index"])) for row in bank["single"]
    }
    pair = {
        (
            (int(row["left_center"]), int(row["left_index"])),
            (int(row["right_center"]), int(row["right_index"])),
        )
        for row in bank["pair"]
    }
    assignment_count = math.prod(len(domains[center]) for center in centers)
    checked = 0
    for indices in itertools.product(*(range(len(domains[center])) for center in centers)):
        checked += 1
        selected = tuple(zip(centers, indices, strict=True))
        selected_set = set(selected)
        if any(choice in single for choice in selected):
            continue
        if any(left in selected_set and right in selected_set for left, right in pair):
            continue
        return {
            "expected_status": "SAT",
            "assignment_count": assignment_count,
            "checked_assignment_count": checked,
            "survivor": {
                str(center): list(domains[center][index])
                for center, index in selected
            },
        }
    if checked != assignment_count:
        raise AssertionError("finite CSP oracle did not enumerate every assignment")
    return {
        "expected_status": "UNSAT",
        "assignment_count": assignment_count,
        "checked_assignment_count": checked,
        "survivor": None,
    }


def decode_model(
    model: str, domains: dict[int, tuple[tuple[int, ...], ...]]
) -> dict[str, list[int]]:
    true_variables = {
        (int(center), int(index))
        for center, index in re.findall(
            r"\(define-fun x_(\d+)_(\d+) \(\) Bool\s+true\)", model
        )
    }
    selected: dict[str, list[int]] = {}
    for center, domain in domains.items():
        indices = [index for candidate_center, index in true_variables if candidate_center == center]
        if len(indices) != 1:
            raise AssertionError(f"SAT model did not select one row at center {center}")
        selected[str(center)] = list(domain[indices[0]])
    return selected


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8") + b"\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--domains-event", type=Path, default=DEFAULT_DOMAINS_EVENT)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()

    domains, binding = domains_event_binding(args.domains_event)
    source_binding = binding["source_model_binding"]
    if not isinstance(source_binding, dict):
        raise TypeError("source binding must be an object")
    prefix = fixed_prefix_rows(source_binding)
    bank = build_bank(domains, prefix)
    oracle = exhaustive_bank_oracle(domains, bank)
    commands = build_commands(domains, bank)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    solves = (
        scan.core.run_piqd(
            args.out,
            commands,
            tuple(args.solver or ()),
            args.timeout_ms,
            label="cardge13-exact13-residual-domain-zero-form-csp",
        )
        if args.solver
        else []
    )
    decoded: list[dict[str, Any]] = []
    for solve in solves:
        result = solve.get("solved")
        if not isinstance(result, dict):
            raise TypeError("PIQD solve response is malformed")
        status = result.get("status")
        if status == "SAT":
            replay = result.get("model_replay")
            model = result.get("model")
            if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED":
                raise AssertionError("PIQD SAT model did not replay")
            if not isinstance(model, str):
                raise TypeError("PIQD SAT model is missing")
            decoded.append(
                {"solver": solve["solver"], "selected_rows": decode_model(model, domains)}
            )
        if status != oracle["expected_status"]:
            raise AssertionError(
                f"PIQD {solve['solver']} status disagrees with exhaustive oracle"
            )
    report = {
        "schema": SCHEMA,
        "claim_boundary": (
            "exact finite CSP over exhaustive one-to-three-form residual domains; "
            "blocks only one-form Kalmanson conflicts involving the fixed source prefix "
            "and at most two variable rows; diagnostic only"
        ),
        "domains_event_binding": binding,
        "fixed_prefix_rows": [
            {"center": center, "support": list(support)} for center, support in prefix
        ],
        "domains": {
            str(center): [list(support) for support in domain]
            for center, domain in domains.items()
        },
        "bank": bank,
        "exhaustive_oracle": oracle,
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "command_count": len(commands),
        "solves": solves,
        "decoded_sat_models": decoded,
    }
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_bytes(canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "domain_sizes": binding["domain_sizes"],
                "single_blocks": len(bank["single"]),
                "pair_blocks": len(bank["pair"]),
                "assignment_count": oracle["assignment_count"],
                "oracle_status": oracle["expected_status"],
                "journal_sha256": report["journal_sha256"],
                "statuses": [row.get("solved", {}).get("status") for row in solves],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
