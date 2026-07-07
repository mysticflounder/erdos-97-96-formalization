#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Mine lifted-column support for the pinned surplus COMP-G bank.

This script is deliberately narrower than a full Lean certificate emitter.  It
reads the local 135-row pinned surplus bank, rebuilds the same base equality
systems from the rvol `.ms` inputs, appends the row's forced-pair
Rabinowitsch generator when needed, and asks Singular for a lifted-column
identity.  The output records which generators have nonzero lift coefficients.

The result is a support census for the emitted certificate, not a minimal-core
certificate.  A row whose lifted support uses a center may still admit a
different certificate with smaller support.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Iterable


LABELS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
LABEL_INDEX = {label: index for index, label in enumerate(LABELS)}
SAFE_EXACT_MASK_CENTERS = frozenset(("v", "w"))
SCHEMA = "pinned_surplus_lift_support.v1"
RELAXED_CENSUS_SCHEMA = "pinned_surplus_relaxed_incidence_census.v1"
RELAXED_PROBE_SCHEMA = "pinned_surplus_relaxed_certificate_probe.v1"
RELAXED_SPLIT_SCHEMA = "pinned_surplus_relaxed_split_probe.v1"
RELAXED_CERTIFICATE_SCHEMA = "pinned_surplus_relaxed_split_certificate.v1"
RELAXED_CERTIFICATE_CENSUS_SCHEMA = "pinned_surplus_relaxed_split_certificate_census.v1"


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def default_rvol_root() -> Path:
    return repo_root().parent / "p97-rvol"


def load_endpoint_tool() -> Any:
    path = Path(__file__).with_name("endpoint-certificate.py")
    spec = importlib.util.spec_from_file_location("endpoint_certificate_tool", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load endpoint certificate helpers from {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def load_json(path: Path) -> Any:
    with path.open() as f:
        return json.load(f)


def labels_from_mask(mask: int) -> list[str]:
    return [label for label in LABELS if mask & (1 << LABEL_INDEX[label])]


def mask_from_labels(labels: Iterable[str]) -> int:
    return sum(1 << LABEL_INDEX[label] for label in labels)


def mask_key(masks: dict[str, int]) -> str:
    return "|".join(f"{center}:{masks[center]}" for center in LABELS)


def parse_centers(value: str) -> frozenset[str]:
    centers = frozenset(part.strip() for part in value.split(",") if part.strip())
    unknown = sorted(centers - set(LABELS))
    if unknown:
        raise SystemExit(f"unknown center labels: {unknown}")
    return centers


def mask_from_payload(payload: dict[str, object]) -> int:
    value = payload.get("mask")
    if not isinstance(value, int):
        raise ValueError(f"bad mask payload {payload!r}")
    return value


def members_from_payload(payload: dict[str, object]) -> list[str]:
    members = payload.get("members")
    if not isinstance(members, list) or not all(isinstance(label, str) for label in members):
        raise ValueError(f"bad members payload {payload!r}")
    return [label for label in LABELS if label in set(members)]


def distance_eq_generator(endpoint_tool: Any, center: str, left: str, right: str) -> str:
    return f"{endpoint_tool.dist2_expr(center, left)}-({endpoint_tool.dist2_expr(center, right)})"


def center_mask_equations(
    endpoint_tool: Any,
    center: str,
    members: list[str],
    fact_id: str,
    source: str,
    optional: bool,
) -> list[dict[str, object]]:
    ordered = [label for label in LABELS if label in set(members)]
    if len(ordered) < 2:
        return []
    base = ordered[0]
    out: list[dict[str, object]] = []
    for witness in ordered[1:]:
        out.append(
            {
                "id": f"{fact_id}:{base}={witness}",
                "kind": "distance_eq",
                "source": source,
                "optional": optional,
                "center": center,
                "witnesses": [base, witness],
                "equation": f"dist2({center},{base}) = dist2({center},{witness})",
                "generator": distance_eq_generator(endpoint_tool, center, base, witness),
            }
        )
    return out


def bank_rows(bank: dict[str, Any], pids: set[str] | None) -> list[dict[str, Any]]:
    if bank.get("schema") != "pinned_surplus_comp_g_bank.v2":
        raise ValueError(f"unsupported pinned bank schema {bank.get('schema')!r}")
    rows = bank.get("rows")
    if not isinstance(rows, list):
        raise ValueError("pinned bank has no rows")
    if pids is None:
        return rows
    return [row for row in rows if str(row.get("pid")) in pids]


def read_ms(endpoint_tool: Any, path: Path) -> tuple[list[str], list[str]]:
    return endpoint_tool.read_ms(path)


def row_base_metadata(row: dict[str, Any]) -> list[dict[str, object]]:
    classes = row.get("classes")
    if not isinstance(classes, dict):
        raise ValueError(f"{row.get('pid')}: missing classes")
    out: list[dict[str, object]] = []
    for center in LABELS:
        members = classes.get(center)
        if not isinstance(members, list) or len(members) != 4:
            raise ValueError(f"{row.get('pid')}: bad class for {center}")
        base = str(members[0])
        for witness in members[1:]:
            out.append(
                {
                    "kind": "distance_eq",
                    "center": center,
                    "witnesses": [base, str(witness)],
                    "equation": f"dist2({center},{base}) = dist2({center},{witness})",
                }
            )
    if len(out) != 30:
        raise ValueError(f"{row.get('pid')}: expected 30 base metadata rows, got {len(out)}")
    return out


def row_system(
    endpoint_tool: Any,
    row: dict[str, Any],
    input_dir: Path,
) -> tuple[list[str], list[str], list[dict[str, object]], str]:
    pid = str(row["pid"])
    variables, generators = read_ms(endpoint_tool, input_dir / f"{pid}.ms")
    metadata = row_base_metadata(row)
    if len(generators) != len(metadata):
        raise ValueError(f"{pid}: generator metadata mismatch")

    comp_g = row.get("comp_g")
    if not isinstance(comp_g, dict):
        raise ValueError(f"{pid}: missing comp_g payload")
    verdict = comp_g.get("final_verdict")
    if verdict == "C_EMPTY":
        return variables, generators, metadata, "base_empty"

    pair = comp_g.get("forced_pair")
    if not isinstance(pair, str):
        raise ValueError(f"{pid}: NO_VALID_REAL row has no forced pair")
    variables = variables + ["t"]
    generators = generators + [endpoint_tool.rabinowitsch_generator(pair)]
    left, right = pair.split("=")
    metadata = metadata + [
        {
            "kind": "rabinowitsch_distinct",
            "pair": [left, right],
            "equation": f"t * dist2({left},{right}) - 1",
        }
    ]
    return variables, generators, metadata, "forced_collapse"


def singular_unit_ideal(
    variables: list[str],
    generators: list[str],
    timeout_s: int,
) -> str:
    endpoint_tool = load_endpoint_tool()
    body = ",\n".join(generators)
    script = f"""ring r = 0, ({",".join(variables)}), dp;
ideal I = {body};
ideal G = std(I);
if (size(G)==1 and G[1]==1) {{ print("UNIT"); }} else {{ print("NONUNIT"); }}
exit;
"""
    try:
        lines = endpoint_tool.run_singular_script(script, timeout_s)
    except AttributeError:
        # Compatibility with endpoint-certificate.py before run_singular_script
        # exists: use the same tempfile/subprocess shape locally.
        import os
        import tempfile

        fd, script_path = tempfile.mkstemp(prefix="pinned_unit_", suffix=".sing")
        os.close(fd)
        path = Path(script_path)
        try:
            path.write_text(script)
            proc = subprocess.run(
                ["Singular", "-q", str(path)],
                capture_output=True,
                text=True,
                timeout=timeout_s,
                check=False,
            )
            if proc.returncode != 0:
                return "error"
            lines = [line.strip() for line in proc.stdout.splitlines() if line.strip()]
        except subprocess.TimeoutExpired:
            return "timeout"
        finally:
            path.unlink(missing_ok=True)
    except subprocess.TimeoutExpired:
        return "timeout"
    if any(line == "UNIT" for line in lines):
        return "unit"
    if any(line == "NONUNIT" for line in lines):
        return "nonunit"
    return "unknown"


def row_forced_pair(row: dict[str, Any]) -> str | None:
    comp_g = row.get("comp_g")
    if isinstance(comp_g, dict) and isinstance(comp_g.get("forced_pair"), str):
        return str(comp_g["forced_pair"])
    pairscan = row.get("pairscan")
    if isinstance(pairscan, dict) and isinstance(pairscan.get("forced_pair"), str):
        return str(pairscan["forced_pair"])
    return None


def row_comp_g_forced_pair(row: dict[str, Any]) -> str | None:
    comp_g = row.get("comp_g")
    if isinstance(comp_g, dict) and isinstance(comp_g.get("forced_pair"), str):
        return str(comp_g["forced_pair"])
    return None


def uniform_center_test_row(
    endpoint_tool: Any,
    row: dict[str, Any],
    input_dir: Path,
    centers: frozenset[str],
    timeout_s: int,
) -> dict[str, object]:
    pid = str(row["pid"])
    variables, base_generators = read_ms(endpoint_tool, input_dir / f"{pid}.ms")
    metadata = row_base_metadata(row)
    selected_indices = [
        index
        for index, meta in enumerate(metadata)
        if meta.get("kind") == "distance_eq" and str(meta.get("center")) in centers
    ]
    generators = [base_generators[index] for index in selected_indices]
    pair = row_forced_pair(row)
    variables_for_test = list(variables)
    if pair is not None:
        variables_for_test.append("t")
        generators.append(endpoint_tool.rabinowitsch_generator(pair))
    status = singular_unit_ideal(variables_for_test, generators, timeout_s)
    return {
        "pid": pid,
        "sstar": row.get("sstar"),
        "selected_centers": sorted(centers, key=LABELS.index),
        "selected_base_indices": selected_indices,
        "selected_base_count": len(selected_indices),
        "forced_pair": pair,
        "generator_count": len(generators),
        "status": status,
    }


def build_uniform_center_test(
    bank_path: Path,
    rvol_root: Path,
    pids: set[str] | None,
    timeout_s: int,
    centers: frozenset[str],
    progress: bool,
) -> dict[str, object]:
    endpoint_tool = load_endpoint_tool()
    bank = load_json(bank_path)
    rows = bank_rows(bank, pids)
    if not rows:
        raise ValueError("no pinned rows selected")
    input_dir = rvol_root / "scratch" / "u2b_ssel_fragment" / "comp_g" / "inputs"
    out_rows = []
    for index, row in enumerate(rows, start=1):
        if progress:
            print(f"[{index}/{len(rows)}] testing {row['pid']}", flush=True)
        out_rows.append(
            uniform_center_test_row(
                endpoint_tool,
                row,
                input_dir,
                centers,
                timeout_s,
            )
        )
    return {
        "schema": "pinned_surplus_uniform_center_test.v1",
        "support_kind": "unit_ideal_test",
        "source": {
            "bank": str(bank_path),
            "bank_sha256": sha256_file(bank_path),
            "rvol_input_dir": str(input_dir),
        },
        "test": {
            "centers": sorted(centers, key=LABELS.index),
            "pair_policy": "use comp_g forced_pair, falling back to pairscan forced_pair",
            "timeout_s": timeout_s,
        },
        "summary": {
            "row_count": len(out_rows),
            "status_counts": count_by(row["status"] for row in out_rows),
            "unit_rows": [row["pid"] for row in out_rows if row["status"] == "unit"],
            "nonunit_rows": [row["pid"] for row in out_rows if row["status"] == "nonunit"],
            "timeout_rows": [row["pid"] for row in out_rows if row["status"] == "timeout"],
        },
        "rows": out_rows,
    }


def exact_row_masks(row: dict[str, Any]) -> dict[str, int]:
    bitsets = row.get("class_bitsets")
    if not isinstance(bitsets, dict):
        raise ValueError(f"{row.get('pid')}: missing class_bitsets")
    out: dict[str, int] = {}
    for center in LABELS:
        value = bitsets.get(center)
        if not isinstance(value, int):
            raise ValueError(f"{row.get('pid')}: missing bitset for {center}")
        out[center] = value
    return out


def relaxed_masks_for_row(row: dict[str, Any], exact_centers: frozenset[str]) -> dict[str, int]:
    exact = exact_row_masks(row)
    return {center: exact[center] if center in exact_centers else 0 for center in LABELS}


def mask_payload(masks: dict[str, int]) -> dict[str, object]:
    return {
        center: {"mask": masks[center], "members": labels_from_mask(masks[center])}
        for center in LABELS
    }


def partial_mask_payload(masks: dict[str, int]) -> dict[str, object]:
    return {
        center: {"mask": masks[center], "members": labels_from_mask(masks[center])}
        for center in sorted(masks, key=LABELS.index)
    }


def row_final_verdict(row: dict[str, Any]) -> str | None:
    comp_g = row.get("comp_g")
    if isinstance(comp_g, dict):
        value = comp_g.get("final_verdict")
        if isinstance(value, str):
            return value
    return None


def row_family_key(row: dict[str, Any], relaxed_key: str) -> tuple[str, str]:
    return (str(row.get("sstar")), relaxed_key)


def summarize_relaxed_group(
    group_index: int,
    sstar: str,
    relaxed_key: str,
    rows: list[dict[str, Any]],
    exact_centers: frozenset[str],
) -> dict[str, object]:
    exact_masks_by_row = {str(row["pid"]): exact_row_masks(row) for row in rows}
    relaxed_masks = relaxed_masks_for_row(rows[0], exact_centers)
    intersections: dict[str, int] = {}
    unions: dict[str, int] = {}
    options: dict[str, list[int]] = {}
    option_members: dict[str, list[dict[str, object]]] = {}
    for center in LABELS:
        values = [exact_masks_by_row[str(row["pid"])][center] for row in rows]
        inter = values[0]
        union = 0
        for value in values:
            inter &= value
            union |= value
        choices = sorted(set(values))
        intersections[center] = inter
        unions[center] = union
        options[center] = choices
        option_members[center] = [
            {"mask": value, "members": labels_from_mask(value)} for value in choices
        ]

    extra_common = {
        center: intersections[center] & ~relaxed_masks[center] for center in LABELS
    }
    variable_centers = [center for center in LABELS if len(options[center]) > 1]
    erased_centers = [center for center in LABELS if center not in exact_centers]
    erased_extra_common = {
        center: extra_common[center]
        for center in erased_centers
        if extra_common[center] != 0
    }
    return {
        "relaxed_id": f"R{group_index:03d}",
        "sstar": sstar,
        "relaxed_key": relaxed_key,
        "exact_completion_count": len(rows),
        "exact_pids": [str(row["pid"]) for row in rows],
        "final_verdict_counts": count_by(row_final_verdict(row) for row in rows),
        "comp_g_forced_pair_counts": count_by(row_comp_g_forced_pair(row) for row in rows),
        "separator_pair_counts": count_by(row_forced_pair(row) for row in rows),
        "relaxed_masks": mask_payload(relaxed_masks),
        "exact_mask_intersection": mask_payload(intersections),
        "exact_mask_union": mask_payload(unions),
        "extra_common_beyond_relaxed": mask_payload(extra_common),
        "erased_extra_common_centers": {
            center: {
                "mask": value,
                "members": labels_from_mask(value),
            }
            for center, value in erased_extra_common.items()
        },
        "variable_centers": variable_centers,
        "exact_mask_options": {
            center: option_members[center]
            for center in LABELS
            if len(option_members[center]) > 1 or center in exact_centers
        },
        "exact_rows": [
            {
                "pid": str(row["pid"]),
                "final_verdict": row_final_verdict(row),
                "comp_g_forced_pair": row_comp_g_forced_pair(row),
                "separator_pair": row_forced_pair(row),
                "masks": mask_payload(exact_masks_by_row[str(row["pid"])]),
            }
            for row in rows
        ],
    }


def build_relaxed_incidence_census(
    bank_path: Path,
    pids: set[str] | None,
    exact_centers: frozenset[str],
) -> dict[str, object]:
    bank = load_json(bank_path)
    rows = bank_rows(bank, pids)
    if not rows:
        raise ValueError("no pinned rows selected")

    groups: dict[tuple[str, str], list[dict[str, Any]]] = {}
    for row in rows:
        relaxed_masks = relaxed_masks_for_row(row, exact_centers)
        key = row_family_key(row, mask_key(relaxed_masks))
        groups.setdefault(key, []).append(row)

    ordered_groups = sorted(
        groups.items(),
        key=lambda item: (
            LABEL_INDEX.get(item[0][0], 99),
            item[0][1],
            [str(row["pid"]) for row in item[1]],
        ),
    )
    census_rows = [
        summarize_relaxed_group(index, sstar, key, group_rows, exact_centers)
        for index, ((sstar, key), group_rows) in enumerate(ordered_groups)
    ]

    completion_counts = [len(group_rows) for _key, group_rows in ordered_groups]
    extra_common_center_usage: dict[str, int] = {center: 0 for center in LABELS}
    variable_center_usage: dict[str, int] = {center: 0 for center in LABELS}
    for row in census_rows:
        extra = row["erased_extra_common_centers"]
        assert isinstance(extra, dict)
        for center in extra:
            extra_common_center_usage[center] += 1
        variable = row["variable_centers"]
        assert isinstance(variable, list)
        for center in variable:
            variable_center_usage[str(center)] += 1

    return {
        "schema": RELAXED_CENSUS_SCHEMA,
        "support_kind": "incidence_projection",
        "source": {
            "bank": str(bank_path),
            "bank_sha256": sha256_file(bank_path),
        },
        "policy": {
            "description": (
                "Keep exact masks for the listed centers and erase every other "
                "center to the empty guaranteed submask. Exact completions are "
                "the original pinned-bank rows with the same relaxed projection."
            ),
            "exact_centers": sorted(exact_centers, key=LABELS.index),
            "erased_centers": [center for center in LABELS if center not in exact_centers],
        },
        "summary": {
            "exact_row_count": len(rows),
            "relaxed_row_count": len(census_rows),
            "collapsed_row_count": len(rows) - len(census_rows),
            "exact_row_counts_by_sstar": count_by(row.get("sstar") for row in rows),
            "relaxed_row_counts_by_sstar": count_by(row["sstar"] for row in census_rows),
            "exact_completion_count_distribution": count_by(completion_counts),
            "max_exact_completion_count": max(completion_counts),
            "multi_completion_relaxed_rows": [
                row["relaxed_id"]
                for row in census_rows
                if int(row["exact_completion_count"]) > 1
            ],
            "erased_extra_common_center_usage": {
                center: count
                for center, count in extra_common_center_usage.items()
                if count
            },
            "variable_center_usage": {
                center: count for center, count in variable_center_usage.items() if count
            },
        },
        "rows": census_rows,
    }


def relaxed_exact_rows_for_separator(
    row: dict[str, object],
    separator_pair: str | None,
) -> list[dict[str, object]]:
    exact_rows = row.get("exact_rows")
    if not isinstance(exact_rows, list):
        raise ValueError(f"{row.get('relaxed_id')}: missing exact_rows")
    out = []
    for exact in exact_rows:
        if not isinstance(exact, dict):
            raise ValueError(f"{row.get('relaxed_id')}: bad exact row payload")
        if exact.get("comp_g_forced_pair") == separator_pair:
            out.append(exact)
    return out


def separator_cases_for_relaxed_row(row: dict[str, object]) -> list[str | None]:
    exact_rows = row.get("exact_rows")
    if not isinstance(exact_rows, list):
        raise ValueError(f"{row.get('relaxed_id')}: missing exact_rows")
    cases = sorted(
        {exact.get("comp_g_forced_pair") for exact in exact_rows if isinstance(exact, dict)},
        key=lambda item: "" if item is None else str(item),
    )
    return [case if isinstance(case, str) else None for case in cases]


def exact_row_mask_payload(exact: dict[str, object], center: str) -> dict[str, object]:
    masks = exact.get("masks")
    if not isinstance(masks, dict):
        raise ValueError(f"{exact.get('pid')}: missing masks")
    payload = masks.get(center)
    if not isinstance(payload, dict):
        raise ValueError(f"{exact.get('pid')}: missing mask for {center}")
    return payload


def common_masks_for_exact_rows(
    exact_rows: list[dict[str, object]],
    centers: Iterable[str],
) -> dict[str, int]:
    if not exact_rows:
        raise ValueError("separator branch has no exact rows")
    common: dict[str, int] = {}
    for center in centers:
        values = [
            mask_from_payload(exact_row_mask_payload(exact, center))
            for exact in exact_rows
        ]
        value = values[0]
        for other in values[1:]:
            value &= other
        common[center] = value
    return common


def probe_status(
    variables: list[str],
    required: list[dict[str, object]],
    optional: list[dict[str, object]],
    timeout_s: int,
) -> str:
    generators = [str(item["generator"]) for item in required + optional]
    return singular_unit_ideal(variables, generators, timeout_s)


def probe_lift_support(
    endpoint_tool: Any,
    variables: list[str],
    required: list[dict[str, object]],
    optional: list[dict[str, object]],
    timeout_s: int,
) -> tuple[str, list[int]]:
    generators = [str(item["generator"]) for item in required + optional]
    try:
        coefficients, singular_check = endpoint_tool.singular_witness(
            variables,
            generators,
            timeout_s,
        )
    except subprocess.TimeoutExpired:
        return "timeout", []
    except Exception:
        return "error", []
    if singular_check != "1":
        return "error", []
    required_count = len(required)
    support = [
        index - required_count
        for index, coeff in enumerate(coefficients)
        if index >= required_count and coefficient_string_is_nonzero(endpoint_tool, coeff)
    ]
    return "ok", support


def required_submasks_from_equations(
    equations: list[dict[str, object]],
) -> dict[str, dict[str, object]]:
    members_by_center: dict[str, set[str]] = {}
    for equation in equations:
        center = str(equation["center"])
        witnesses = equation.get("witnesses")
        if not isinstance(witnesses, list):
            continue
        bucket = members_by_center.setdefault(center, set())
        for witness in witnesses:
            bucket.add(str(witness))
    out: dict[str, dict[str, object]] = {}
    for center in sorted(members_by_center, key=LABELS.index):
        members = [label for label in LABELS if label in members_by_center[center]]
        out[center] = {"mask": mask_from_labels(members), "members": members}
    return out


def relaxed_probe_case(
    endpoint_tool: Any,
    variables0: list[str],
    relaxed_row: dict[str, object],
    separator_pair: str | None,
    exact_centers: frozenset[str],
    timeout_s: int,
    greedy_max_optional: int,
    use_lift_support: bool,
) -> dict[str, object]:
    relaxed_id = str(relaxed_row["relaxed_id"])
    exact_rows = relaxed_exact_rows_for_separator(relaxed_row, separator_pair)
    erased_centers = [center for center in LABELS if center not in exact_centers]
    relaxed_masks = relaxed_row.get("relaxed_masks")
    if not isinstance(relaxed_masks, dict):
        raise ValueError(f"{relaxed_id}: missing relaxed masks")

    required: list[dict[str, object]] = []
    for center in sorted(exact_centers, key=LABELS.index):
        payload = relaxed_masks.get(center)
        if not isinstance(payload, dict):
            raise ValueError(f"{relaxed_id}: missing relaxed mask for {center}")
        members = members_from_payload(payload)
        required.extend(
            center_mask_equations(
                endpoint_tool,
                center,
                members,
                fact_id=f"exact:{center}",
                source="exact_center",
                optional=False,
            )
        )

    variables = list(variables0)
    if separator_pair is not None:
        variables = variables + ["t"]
        left, right = separator_pair.split("=")
        required.append(
            {
                "id": f"separator:{separator_pair}",
                "kind": "rabinowitsch_distinct",
                "source": "separator",
                "optional": False,
                "pair": [left, right],
                "equation": f"t * dist2({left},{right}) - 1",
                "generator": endpoint_tool.rabinowitsch_generator(separator_pair),
            }
        )

    common_masks = common_masks_for_exact_rows(exact_rows, erased_centers)
    optional: list[dict[str, object]] = []
    singleton_or_empty_facts: list[dict[str, object]] = []
    for center in erased_centers:
        mask = common_masks[center]
        members = labels_from_mask(mask)
        if len(members) < 2:
            singleton_or_empty_facts.append(
                {
                    "center": center,
                    "mask": mask,
                    "members": members,
                    "reason": "fewer than two common labels; no distance equation",
                }
            )
            continue
        optional.extend(
            center_mask_equations(
                endpoint_tool,
                center,
                members,
                fact_id=f"common:{center}",
                source="erased_common_submask",
                optional=True,
            )
        )

    required_status = probe_status(variables, required, [], timeout_s)
    all_optional_status = required_status
    greedy_steps: list[dict[str, object]] = []
    lift_status = "not_run"
    initial_support_source = "required_only"
    greedy_skipped_reason = None
    kept = list(optional)
    if required_status == "unit":
        kept = []
        final_status = "unit"
    else:
        all_optional_status = probe_status(variables, required, optional, timeout_s)
        final_status = all_optional_status
        if all_optional_status == "unit":
            kept = list(optional)
            initial_support_source = "all_optional"
            if use_lift_support:
                lift_status, support_indices = probe_lift_support(
                    endpoint_tool,
                    variables,
                    required,
                    optional,
                    timeout_s,
                )
                if lift_status == "ok":
                    kept = [optional[index] for index in support_indices]
                    initial_support_source = "lift_nonzero_optional_support"
                    final_status = probe_status(variables, required, kept, timeout_s)
                else:
                    initial_support_source = "all_optional_after_lift_failed"
            if len(kept) <= greedy_max_optional:
                for candidate in list(kept):
                    if candidate not in kept:
                        continue
                    trial = [item for item in kept if item is not candidate]
                    status = probe_status(variables, required, trial, timeout_s)
                    if status == "unit":
                        kept = trial
                        greedy_steps.append(
                            {
                                "id": candidate["id"],
                                "status_without": status,
                                "decision": "drop",
                            }
                        )
                    else:
                        greedy_steps.append(
                            {
                                "id": candidate["id"],
                                "status_without": status,
                                "decision": "keep",
                            }
                        )
                final_status = probe_status(variables, required, kept, timeout_s)
            else:
                greedy_skipped_reason = (
                    f"initial optional support size {len(kept)} exceeds "
                    f"greedy limit {greedy_max_optional}"
                )

    dropped_ids = {str(item["id"]) for item in optional} - {str(item["id"]) for item in kept}
    return {
        "case_id": f"{relaxed_id}:{separator_pair if separator_pair is not None else 'no_separator'}",
        "relaxed_id": relaxed_id,
        "sstar": relaxed_row.get("sstar"),
        "separator_pair": separator_pair,
        "exact_completion_count": len(exact_rows),
        "exact_pids": [str(row.get("pid")) for row in exact_rows],
        "variables": variables,
        "required_status": required_status,
        "all_optional_status": all_optional_status,
        "final_status": final_status,
        "lift_status": lift_status,
        "initial_support_source": initial_support_source,
        "greedy_skipped_reason": greedy_skipped_reason,
        "required_equation_count": len(required),
        "optional_equation_count": len(optional),
        "kept_optional_equation_count": len(kept),
        "dropped_optional_equation_count": len(dropped_ids),
        "common_erased_masks": partial_mask_payload(common_masks),
        "ignored_common_facts": singleton_or_empty_facts,
        "required_equations": required,
        "optional_equations": optional,
        "kept_optional_equations": kept,
        "dropped_optional_equation_ids": sorted(dropped_ids),
        "greedy_steps": greedy_steps,
        "required_optional_submasks": required_submasks_from_equations(kept),
    }


def relaxed_case_base(
    endpoint_tool: Any,
    variables0: list[str],
    relaxed_row: dict[str, object],
    separator_pair: str | None,
    exact_centers: frozenset[str],
) -> tuple[list[str], list[dict[str, object]], list[str], list[dict[str, object]]]:
    exact_rows = relaxed_exact_rows_for_separator(relaxed_row, separator_pair)
    erased_centers = [center for center in LABELS if center not in exact_centers]
    relaxed_masks = relaxed_row.get("relaxed_masks")
    if not isinstance(relaxed_masks, dict):
        raise ValueError(f"{relaxed_row.get('relaxed_id')}: missing relaxed masks")

    required: list[dict[str, object]] = []
    for center in sorted(exact_centers, key=LABELS.index):
        payload = relaxed_masks.get(center)
        if not isinstance(payload, dict):
            raise ValueError(f"{relaxed_row.get('relaxed_id')}: missing relaxed mask for {center}")
        required.extend(
            center_mask_equations(
                endpoint_tool,
                center,
                members_from_payload(payload),
                fact_id=f"exact:{center}",
                source="exact_center",
                optional=False,
            )
        )

    variables = list(variables0)
    if separator_pair is not None:
        variables = variables + ["t"]
        left, right = separator_pair.split("=")
        required.append(
            {
                "id": f"separator:{separator_pair}",
                "kind": "rabinowitsch_distinct",
                "source": "separator",
                "optional": False,
                "pair": [left, right],
                "equation": f"t * dist2({left},{right}) - 1",
                "generator": endpoint_tool.rabinowitsch_generator(separator_pair),
            }
        )
    return variables, required, erased_centers, exact_rows


def common_optional_from_exact_rows(
    endpoint_tool: Any,
    exact_rows: list[dict[str, object]],
    erased_centers: Iterable[str],
) -> tuple[dict[str, int], list[dict[str, object]], list[dict[str, object]]]:
    common_masks = common_masks_for_exact_rows(exact_rows, erased_centers)
    optional: list[dict[str, object]] = []
    ignored: list[dict[str, object]] = []
    for center in sorted(common_masks, key=LABELS.index):
        mask = common_masks[center]
        members = labels_from_mask(mask)
        if len(members) < 2:
            ignored.append(
                {
                    "center": center,
                    "mask": mask,
                    "members": members,
                    "reason": "fewer than two common labels; no distance equation",
                }
            )
        else:
            optional.extend(
                center_mask_equations(
                    endpoint_tool,
                    center,
                    members,
                    fact_id=f"common:{center}",
                    source="split_common_submask",
                    optional=True,
                )
            )
    return common_masks, optional, ignored


def exact_has_label(exact: dict[str, object], center: str, label: str) -> bool:
    return bool(mask_from_payload(exact_row_mask_payload(exact, center)) & (1 << LABEL_INDEX[label]))


def common_equation_count_for_rows(
    endpoint_tool: Any,
    exact_rows: list[dict[str, object]],
    erased_centers: Iterable[str],
) -> int:
    _common, optional, _ignored = common_optional_from_exact_rows(
        endpoint_tool, exact_rows, erased_centers
    )
    return len(optional)


def choose_split_candidate(
    endpoint_tool: Any,
    exact_rows: list[dict[str, object]],
    erased_centers: list[str],
) -> dict[str, object] | None:
    if len(exact_rows) <= 1:
        return None
    best: dict[str, object] | None = None
    for center in erased_centers:
        for label in LABELS:
            if label == center:
                continue
            yes = [row for row in exact_rows if exact_has_label(row, center, label)]
            no = [row for row in exact_rows if not exact_has_label(row, center, label)]
            if not yes or not no:
                continue
            yes_common = common_equation_count_for_rows(endpoint_tool, yes, erased_centers)
            no_common = common_equation_count_for_rows(endpoint_tool, no, erased_centers)
            score = (
                min(len(yes), len(no)),
                yes_common + no_common,
                -abs(len(yes) - len(no)),
                -LABEL_INDEX[center],
                -LABEL_INDEX[label],
            )
            candidate = {
                "center": center,
                "label": label,
                "yes_count": len(yes),
                "no_count": len(no),
                "yes_common_equations": yes_common,
                "no_common_equations": no_common,
                "score": list(score),
            }
            if best is None or tuple(candidate["score"]) > tuple(best["score"]):
                best = candidate
    return best


def split_probe_node(
    endpoint_tool: Any,
    variables: list[str],
    required: list[dict[str, object]],
    erased_centers: list[str],
    exact_rows: list[dict[str, object]],
    timeout_s: int,
    max_depth: int,
    continue_unit_above: int,
    depth: int,
    node_id: str,
) -> dict[str, object]:
    common_masks, optional, ignored = common_optional_from_exact_rows(
        endpoint_tool, exact_rows, erased_centers
    )
    status = probe_status(variables, required, optional, timeout_s)
    leaf_reason = None
    children: list[dict[str, object]] = []
    split: dict[str, object] | None = None
    if status == "unit" and len(exact_rows) <= continue_unit_above:
        leaf_reason = "unit"
    elif len(exact_rows) <= 1:
        leaf_reason = "unit_singleton" if status == "unit" else "singleton_unresolved"
    elif depth >= max_depth:
        leaf_reason = "max_depth"
    else:
        split = choose_split_candidate(endpoint_tool, exact_rows, erased_centers)
        if split is None:
            leaf_reason = "no_split_candidate"
        else:
            center = str(split["center"])
            label = str(split["label"])
            yes_rows = [row for row in exact_rows if exact_has_label(row, center, label)]
            no_rows = [row for row in exact_rows if not exact_has_label(row, center, label)]
            children = [
                split_probe_node(
                    endpoint_tool,
                    variables,
                    required,
                    erased_centers,
                    yes_rows,
                    timeout_s,
                    max_depth,
                    continue_unit_above,
                    depth + 1,
                    f"{node_id}Y",
                ),
                split_probe_node(
                    endpoint_tool,
                    variables,
                    required,
                    erased_centers,
                    no_rows,
                    timeout_s,
                    max_depth,
                    continue_unit_above,
                    depth + 1,
                    f"{node_id}N",
                ),
            ]

    return {
        "node_id": node_id,
        "depth": depth,
        "exact_completion_count": len(exact_rows),
        "exact_pids": [str(row.get("pid")) for row in exact_rows],
        "status": status,
        "optional_equation_count": len(optional),
        "common_erased_masks": partial_mask_payload(common_masks),
        "common_optional_submasks": required_submasks_from_equations(optional),
        "ignored_common_facts": ignored,
        "leaf_reason": leaf_reason,
        "split": split,
        "children": children,
    }


def flatten_split_nodes(node: dict[str, object]) -> list[dict[str, object]]:
    children = node.get("children")
    if not isinstance(children, list) or not children:
        return [node]
    out: list[dict[str, object]] = []
    for child in children:
        if isinstance(child, dict):
            out.extend(flatten_split_nodes(child))
    return out


def flatten_split_leaves_with_paths(
    node: dict[str, object],
    path: list[dict[str, object]] | None = None,
) -> list[tuple[dict[str, object], list[dict[str, object]]]]:
    current_path = list(path or [])
    children = node.get("children")
    if not isinstance(children, list) or not children:
        return [(node, current_path)]
    split = node.get("split")
    if not isinstance(split, dict):
        split = {}
    out: list[tuple[dict[str, object], list[dict[str, object]]]] = []
    for index, child in enumerate(children):
        if not isinstance(child, dict):
            continue
        decision = "yes" if index == 0 else "no"
        out.extend(
            flatten_split_leaves_with_paths(
                child,
                current_path
                + [
                    {
                        "center": split.get("center"),
                        "label": split.get("label"),
                        "decision": decision,
                    }
                ],
            )
        )
    return out


def split_tree_status_counts(cases: list[dict[str, object]]) -> dict[str, int]:
    leaves: list[dict[str, object]] = []
    for case in cases:
        tree = case.get("tree")
        if isinstance(tree, dict):
            leaves.extend(flatten_split_nodes(tree))
    return count_by(leaf.get("status") for leaf in leaves)


def split_tree_leaf_count(cases: list[dict[str, object]]) -> int:
    total = 0
    for case in cases:
        tree = case.get("tree")
        if isinstance(tree, dict):
            total += len(flatten_split_nodes(tree))
    return total


def build_relaxed_split_probe(
    census_path: Path,
    rvol_root: Path,
    timeout_s: int,
    pids: set[str] | None,
    max_depth: int,
    continue_unit_above: int,
    progress: bool,
) -> dict[str, object]:
    endpoint_tool = load_endpoint_tool()
    census = load_json(census_path)
    if census.get("schema") != RELAXED_CENSUS_SCHEMA:
        raise ValueError(f"unsupported relaxed census schema {census.get('schema')!r}")
    policy = census.get("policy")
    if not isinstance(policy, dict):
        raise ValueError("relaxed census has no policy")
    exact_centers_raw = policy.get("exact_centers")
    if not isinstance(exact_centers_raw, list):
        raise ValueError("relaxed census policy has no exact_centers")
    exact_centers = frozenset(str(center) for center in exact_centers_raw)
    input_dir = rvol_root / "scratch" / "u2b_ssel_fragment" / "comp_g" / "inputs"
    rows = census.get("rows")
    if not isinstance(rows, list):
        raise ValueError("relaxed census has no rows")

    selected_rows = []
    for row in rows:
        if not isinstance(row, dict):
            raise ValueError("bad relaxed row")
        exact_pids = row.get("exact_pids")
        if not isinstance(exact_pids, list):
            raise ValueError(f"{row.get('relaxed_id')}: missing exact_pids")
        if pids is None or any(str(pid) in pids for pid in exact_pids):
            selected_rows.append(row)
    if not selected_rows:
        raise ValueError("no relaxed rows selected")

    first_pid = str(selected_rows[0]["exact_pids"][0])
    variables0, _generators = read_ms(endpoint_tool, input_dir / f"{first_pid}.ms")

    total_cases = sum(len(separator_cases_for_relaxed_row(row)) for row in selected_rows)
    cases: list[dict[str, object]] = []
    case_index = 0
    for row in selected_rows:
        for separator_pair in separator_cases_for_relaxed_row(row):
            case_index += 1
            sep = separator_pair if separator_pair is not None else "no_separator"
            if progress:
                print(f"[{case_index}/{total_cases}] split-probing {row['relaxed_id']} ({sep})", flush=True)
            variables, required, erased_centers, exact_rows = relaxed_case_base(
                endpoint_tool, variables0, row, separator_pair, exact_centers
            )
            tree = split_probe_node(
                endpoint_tool,
                variables,
                required,
                erased_centers,
                exact_rows,
                timeout_s,
                max_depth,
                continue_unit_above,
                0,
                str(row["relaxed_id"]),
            )
            leaves = flatten_split_nodes(tree)
            cases.append(
                {
                    "case_id": f"{row['relaxed_id']}:{sep}",
                    "relaxed_id": row.get("relaxed_id"),
                    "sstar": row.get("sstar"),
                    "separator_pair": separator_pair,
                    "exact_completion_count": len(exact_rows),
                    "required_equation_count": len(required),
                    "leaf_count": len(leaves),
                    "leaf_status_counts": count_by(leaf.get("status") for leaf in leaves),
                    "unresolved_leaf_ids": [
                        leaf["node_id"]
                        for leaf in leaves
                        if leaf.get("status") != "unit"
                    ],
                    "tree": tree,
                }
            )

    unresolved_cases = [
        case["case_id"]
        for case in cases
        if any(status != "unit" for status in case["leaf_status_counts"])
    ]
    return {
        "schema": RELAXED_SPLIT_SCHEMA,
        "support_kind": "recursive_submask_split_unit_probe",
        "source": {
            "relaxed_census": str(census_path),
            "relaxed_census_sha256": sha256_file(census_path),
            "rvol_input_dir": str(input_dir),
        },
        "policy": {
            "timeout_s": timeout_s,
            "max_depth": max_depth,
            "continue_unit_above": continue_unit_above,
            "exact_centers": sorted(exact_centers, key=LABELS.index),
            "split_policy": (
                "recursively split exact completions by erased-center label "
                "incidence; test each node with equations common to that node"
            ),
        },
        "summary": {
            "relaxed_row_count": len(selected_rows),
            "probe_case_count": len(cases),
            "leaf_count": split_tree_leaf_count(cases),
            "leaf_status_counts": split_tree_status_counts(cases),
            "unresolved_cases": unresolved_cases,
            "case_leaf_counts": {
                str(case["case_id"]): int(case["leaf_count"]) for case in cases
            },
            "case_leaf_status_counts": {
                str(case["case_id"]): case["leaf_status_counts"] for case in cases
            },
        },
        "cases": cases,
    }


def safe_file_stem(value: str) -> str:
    out = []
    for char in value:
        if char.isalnum() or char in {"_", "-"}:
            out.append(char)
        elif char == "=":
            out.append("eq")
        else:
            out.append("_")
    return "".join(out)


def safe_lean_decl_name(value: str) -> str:
    stem = safe_file_stem(value).replace("-", "_")
    if not stem or stem[0].isdigit():
        stem = f"cert_{stem}"
    return f"rs_{stem}"


def lean_module_part(value: str) -> str:
    return value[:1].upper() + value[1:] if value else value


def relaxed_lean_module_stem(cert_id: str) -> str:
    stem = safe_file_stem(cert_id).replace("-", "_")
    parts = [part for part in stem.split("_") if part]
    out = "".join(lean_module_part(part) for part in parts)
    if not out or out[0].isdigit():
        out = f"Cert{out}"
    return out


def relaxed_block_module_stem(cert_id: str, gen_index: int, start: int, stop: int) -> str:
    return f"{relaxed_lean_module_stem(cert_id)}Block{gen_index:02d}_{start:04d}_{stop - 1:04d}"


def read_relaxed_certificate(cert_path: Path) -> tuple[str, list[str], list[str], list[str]]:
    cert = load_json(cert_path)
    if cert.get("schema") != RELAXED_CERTIFICATE_SCHEMA:
        raise ValueError(f"{cert_path}: unsupported schema {cert.get('schema')!r}")
    cert_id = cert.get("certificate_id")
    variables = cert.get("variables")
    generators = cert.get("generators")
    coefficients = cert.get("coefficients")
    if not isinstance(cert_id, str):
        raise ValueError(f"{cert_path}: missing certificate_id")
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{cert_path}: invalid variables")
    if not isinstance(generators, list) or not all(isinstance(x, str) for x in generators):
        raise ValueError(f"{cert_path}: invalid generators")
    if not isinstance(coefficients, list) or not all(isinstance(x, str) for x in coefficients):
        raise ValueError(f"{cert_path}: invalid coefficients")
    if len(generators) != len(coefficients):
        raise ValueError(f"{cert_path}: generator/coefficient length mismatch")
    return cert_id, variables, generators, coefficients


def emit_relaxed_split_lean_certificate(
    cert_path: Path,
    out_path: Path,
    name: str | None,
    namespace_suffix: str,
) -> None:
    endpoint_tool = load_endpoint_tool()
    cert_id, variables, generators, coefficients = read_relaxed_certificate(cert_path)

    lean_name = name or safe_lean_decl_name(cert_id)
    source = cert_path.as_posix()
    namespace_open = f"\nnamespace {namespace_suffix}\n" if namespace_suffix else ""
    namespace_close = f"\nend {namespace_suffix}\n" if namespace_suffix else ""
    namespace_note = (
        f"\nThis generated module lives in the `{namespace_suffix}` namespace.\n"
        if namespace_suffix
        else ""
    )
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate {cert_id}

This generated module checks a relaxed pinned-surplus split certificate as an
exact rational-polynomial identity.  The theorem uses the shared endpoint
certificate checker; the certificate-specific content is only the generated
sparse polynomial data below.

Source certificate: `{source}`.
{namespace_note}
-/

namespace Problem97

namespace SurplusCertificate

open Problem97.EndpointCertificate
{namespace_open}

/-- Generator polynomials for relaxed split surplus certificate `{cert_id}`. -/
def {lean_name}_generators : List Poly :=
{endpoint_tool.lean_poly_list(generators, variables)}

/-- Coefficient polynomials for relaxed split surplus certificate `{cert_id}`. -/
def {lean_name}_coefficients : List Poly :=
{endpoint_tool.lean_poly_list(coefficients, variables)}

/-- Relaxed split surplus certificate `{cert_id}` as sparse rational polynomial data. -/
def {lean_name} : Certificate :=
  {{ generators := {lean_name}_generators
    coefficients := {lean_name}_coefficients }}

set_option linter.style.nativeDecide false in
/-- The checked identity for relaxed split surplus certificate `{cert_id}`. -/
theorem {lean_name}_valid : checkCertificate {lean_name} = true := by
  native_decide
{namespace_close}

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_relaxed_term_block_module(
    endpoint_tool: Any,
    cert_id: str,
    lean_name: str,
    gen_index: int,
    start: int,
    stop: int,
    generator: Any,
    terms: list[tuple[Any, Any]],
    partials: list[Any],
    block_sum: Any,
    out_path: Path,
) -> str:
    defs: list[str] = [
        f"""/-- Generator polynomial {gen_index} for relaxed split surplus certificate `{cert_id}`. -/
def {lean_name}_generator_{gen_index:02d}_{start:04d}_{stop - 1:04d} : Poly :=
{endpoint_tool.lean_poly(generator)}"""
    ]
    partial_names: list[str] = []
    for local_idx, term_index in enumerate(range(start, stop)):
        monom, coeff = terms[term_index]
        partial_names.append(f"{lean_name}_partial_{gen_index:02d}_{term_index:04d}")
        defs.append(
            f"""/-- Coefficient term {term_index} from coefficient polynomial {gen_index}. -/
def {lean_name}_coefficient_{gen_index:02d}_{term_index:04d} : Poly :=
{endpoint_tool.lean_poly(endpoint_tool.singleton_poly(monom, coeff))}

/-- Partial product {term_index} for generator {gen_index}. -/
def {lean_name}_partial_{gen_index:02d}_{term_index:04d} : Poly :=
{endpoint_tool.lean_poly(partials[local_idx])}

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity {term_index} for generator {gen_index}. -/
theorem {lean_name}_partial_{gen_index:02d}_{term_index:04d}_valid :
    mulPoly {lean_name}_coefficient_{gen_index:02d}_{term_index:04d}
        {lean_name}_generator_{gen_index:02d}_{start:04d}_{stop - 1:04d} =
      {lean_name}_partial_{gen_index:02d}_{term_index:04d} := by
  native_decide"""
        )

    partial_entries = ",\n".join(f"  {name}" for name in partial_names)
    defs.append(
        f"""/-- Partial products in this block. -/
def {lean_name}_partials_{gen_index:02d}_{start:04d}_{stop - 1:04d} : List Poly :=
[
{partial_entries}
]

/-- Sum of partial products in this block. -/
def {lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d} : Poly :=
{endpoint_tool.lean_poly(block_sum)}

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator {gen_index}, terms {start} through {stop - 1}. -/
theorem {lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}_valid :
    checkProductSumEq {lean_name}_partials_{gen_index:02d}_{start:04d}_{stop - 1:04d}
      {lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d} = true := by
  native_decide"""
    )

    body = "\n\n".join(defs)
    stem = relaxed_lean_module_stem(cert_id)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate {cert_id}, term block {gen_index}:{start}-{stop - 1}

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace {stem}TermShards

{body}

end {stem}TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)
    return out_path.stem


def emit_relaxed_split_lean_term_sharded_certificate(
    cert_path: Path,
    coordinator_out: Path,
    shard_out_dir: Path,
    module_root: str,
    block_size: int,
    name: str | None,
) -> None:
    if block_size <= 0:
        raise ValueError("--block-size must be positive")
    endpoint_tool = load_endpoint_tool()
    cert_id, variables, generator_exprs, coefficient_exprs = read_relaxed_certificate(cert_path)
    lean_name = name or safe_lean_decl_name(cert_id)

    generators = [endpoint_tool.parse_poly(expr, variables) for expr in generator_exprs]
    coefficients = [endpoint_tool.parse_poly(expr, variables) for expr in coefficient_exprs]
    stem = relaxed_lean_module_stem(cert_id)
    block_refs: list[str] = []
    imports: list[str] = []
    for gen_index, (generator, coeff_poly) in enumerate(zip(generators, coefficients, strict=True)):
        terms = endpoint_tool.sorted_poly_terms(coeff_poly)
        for start in range(0, len(terms), block_size):
            stop = min(start + block_size, len(terms))
            partials = [
                endpoint_tool.mul_poly(endpoint_tool.singleton_poly(monom, coeff), generator)
                for monom, coeff in terms[start:stop]
            ]
            block_sum = endpoint_tool.add_poly_many(partials)
            module_stem = relaxed_block_module_stem(cert_id, gen_index, start, stop)
            emit_relaxed_term_block_module(
                endpoint_tool,
                cert_id,
                lean_name,
                gen_index,
                start,
                stop,
                generator,
                terms,
                partials,
                block_sum,
                shard_out_dir / f"{module_stem}.lean",
            )
            imports.append(f"import {module_root}.{stem}TermShards.{module_stem}")
            block_refs.append(
                f"{stem}TermShards.{lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}"
            )

    import_text = "\n".join(imports)
    block_entries = ",\n".join(f"  {ref}" for ref in block_refs)
    source = cert_path.as_posix()
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{import_text}

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate {cert_id}

This generated coordinator checks the final block-sum identity for a
term-sharded relaxed pinned-surplus split certificate.  The imported shard
modules separately check each coefficient-term partial product and each block
sum.

Source certificate: `{source}`.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Block sums for the term-sharded relaxed split surplus certificate `{cert_id}`. -/
def {lean_name}_blocks : List Poly :=
[
{block_entries}
]

set_option linter.style.nativeDecide false in
/-- Final checked block-sum identity for relaxed split surplus certificate `{cert_id}`. -/
theorem {lean_name}_valid : checkProductSum {lean_name}_blocks = true := by
  native_decide

/-- Alias for the checked block-sum identity for relaxed split surplus certificate `{cert_id}`. -/
theorem {lean_name}_sum_valid : checkProductSum {lean_name}_blocks = true :=
  {lean_name}_valid

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    coordinator_out.parent.mkdir(parents=True, exist_ok=True)
    coordinator_out.write_text(module)


def relaxed_certificate_paths(cert_dir: Path) -> list[Path]:
    paths = sorted(cert_dir.glob("*.json"))
    if not paths:
        raise ValueError(f"{cert_dir} has no relaxed split certificate JSON files")
    return paths


def relaxed_certificate_source_size(cert_path: Path) -> int:
    _cert_id, _variables, generators, coefficients = read_relaxed_certificate(cert_path)
    return sum(len(item) for item in generators) + sum(len(item) for item in coefficients)


def relaxed_certificate_lean_path(cert_module_root: str, stem: str) -> Path:
    return repo_root() / "lean" / Path(*cert_module_root.split(".")) / f"{stem}.lean"


def relaxed_certificate_payload_kind(
    cert_path: Path,
    cert_module_root: str,
    shard_threshold: int,
) -> str:
    cert_id, _variables, _generators, _coefficients = read_relaxed_certificate(
        cert_path
    )
    stem = relaxed_lean_module_stem(cert_id)
    lean_name = safe_lean_decl_name(cert_id)
    lean_path = relaxed_certificate_lean_path(cert_module_root, stem)
    if lean_path.exists():
        source = lean_path.read_text()
        if f"def {lean_name}_blocks" in source:
            return "productSum"
        if f"def {lean_name}_generators" in source:
            return "direct"
        raise ValueError(f"{lean_path}: could not determine certificate payload kind")
    return (
        "productSum"
        if relaxed_certificate_source_size(cert_path) > shard_threshold
        else "direct"
    )


def write_relaxed_split_lean_aggregate(
    rows: list[dict[str, object]],
    out_path: Path,
    module_root: str,
) -> None:
    imports = "\n".join(f"import {module_root}.{row['stem']}" for row in rows)
    entries: list[str] = []
    for row in rows:
        payload_expr = (
            f".productSum {row['lean_name']}_blocks"
            if row["term_sharded"]
            else f".direct {row['lean_name']}"
        )
        entries.append(
            "  { id := "
            + json.dumps(row["certificate_id"])
            + f", payload := {payload_expr}, valid := {row['lean_name']}_valid }}"
        )
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate aggregate

This generated module imports the Lean-checked singleton relaxed split surplus
certificate bank.  Direct certificate modules check `checkCertificate`; larger
certificates are term-sharded and check their final block sum.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Algebraic payload carried by a generated relaxed split surplus certificate row. -/
inductive CertificatePayload where
  | direct (cert : Certificate)
  | productSum (products : List Poly)

/-- Run the Boolean checker associated with a relaxed split certificate payload. -/
def CertificatePayload.check : CertificatePayload → Bool
  | .direct cert => checkCertificate cert
  | .productSum products => checkProductSum products

/-- One checked relaxed split surplus certificate fact. -/
structure VerifiedCertificate where
  id : String
  payload : CertificatePayload
  valid : payload.check = true

/-- Run the Boolean checker associated with a verified relaxed split certificate. -/
def VerifiedCertificate.check (cert : VerifiedCertificate) : Bool :=
  cert.payload.check

/-- The full checked singleton relaxed split surplus certificate set. -/
def allRelaxedSplitSingletonCertificates : List VerifiedCertificate :=
[
{",\n".join(entries)}
]

set_option linter.style.nativeDecide false in
/-- The generated singleton relaxed split surplus certificate aggregate has 135 rows. -/
theorem allRelaxedSplitSingletonCertificates_length :
    allRelaxedSplitSingletonCertificates.length = {len(rows)} := by
  native_decide

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_relaxed_split_lean_dir(
    cert_dir: Path,
    lean_out_dir: Path,
    aggregate_out: Path | None,
    module_root: str,
    block_size: int,
    shard_threshold: int,
) -> None:
    rows: list[dict[str, object]] = []
    for cert_path in relaxed_certificate_paths(cert_dir):
        cert_id, _variables, _generators, _coefficients = read_relaxed_certificate(cert_path)
        stem = relaxed_lean_module_stem(cert_id)
        lean_name = safe_lean_decl_name(cert_id)
        source_size = relaxed_certificate_source_size(cert_path)
        out_path = lean_out_dir / f"{stem}.lean"
        term_sharded = source_size > shard_threshold
        if term_sharded:
            emit_relaxed_split_lean_term_sharded_certificate(
                cert_path,
                out_path,
                lean_out_dir / f"{stem}TermShards",
                module_root,
                block_size,
                lean_name,
            )
        else:
            emit_relaxed_split_lean_certificate(
                cert_path,
                out_path,
                lean_name,
                namespace_suffix="RelaxedSplit",
            )
        rows.append(
            {
                "certificate_id": cert_id,
                "stem": stem,
                "lean_name": lean_name,
                "source_size": source_size,
                "term_sharded": term_sharded,
            }
        )
    if aggregate_out is not None:
        write_relaxed_split_lean_aggregate(rows, aggregate_out, module_root)


def lean_string(value: str) -> str:
    return json.dumps(value)


def lean_string_list(values: list[str]) -> str:
    return "[" + ", ".join(lean_string(value) for value in values) + "]"


def lean_option_string(value: object) -> str:
    if value is None:
        return "none"
    if not isinstance(value, str):
        raise ValueError(f"expected optional string, got {value!r}")
    return f"some {lean_string(value)}"


def relaxed_split_row_entry(cert_path: Path) -> str:
    cert = json.loads(cert_path.read_text())
    masks = cert.get("common_erased_masks")
    if not isinstance(masks, dict):
        raise ValueError(f"{cert_path}: missing common_erased_masks")
    split_path = cert.get("split_path")
    if not isinstance(split_path, list):
        raise ValueError(f"{cert_path}: missing split_path")
    exact_pids = cert.get("exact_pids")
    if not isinstance(exact_pids, list) or not all(isinstance(pid, str) for pid in exact_pids):
        raise ValueError(f"{cert_path}: bad exact_pids")

    split_entries: list[str] = []
    for step in split_path:
        if not isinstance(step, dict):
            raise ValueError(f"{cert_path}: bad split_path step")
        center = step.get("center")
        label = step.get("label")
        decision = step.get("decision")
        if not all(isinstance(value, str) for value in [center, label, decision]):
            raise ValueError(f"{cert_path}: bad split_path step fields")
        split_entries.append(
            "{ center := "
            + lean_string(center)
            + ", label := "
            + lean_string(label)
            + ", decision := "
            + lean_string(decision)
            + " }"
        )

    mask_entries: list[str] = []
    for center in sorted(masks, key=LABELS.index):
        payload = masks[center]
        if not isinstance(payload, dict):
            raise ValueError(f"{cert_path}: bad common_erased_masks payload")
        mask = payload.get("mask")
        members = payload.get("members")
        if not isinstance(mask, int):
            raise ValueError(f"{cert_path}: bad mask for {center}")
        if not isinstance(members, list) or not all(isinstance(member, str) for member in members):
            raise ValueError(f"{cert_path}: bad members for {center}")
        mask_entries.append(
            "{ center := "
            + lean_string(center)
            + f", mask := {mask}, members := "
            + lean_string_list(members)
            + " }"
        )

    required_strings = [
        "certificate_id",
        "case_id",
        "leaf_id",
        "relaxed_id",
        "sstar",
    ]
    values: dict[str, str] = {}
    for key in required_strings:
        value = cert.get(key)
        if not isinstance(value, str):
            raise ValueError(f"{cert_path}: missing string {key}")
        values[key] = value

    return (
        "  { id := "
        + lean_string(values["certificate_id"])
        + ", caseId := "
        + lean_string(values["case_id"])
        + ", leafId := "
        + lean_string(values["leaf_id"])
        + ", relaxedId := "
        + lean_string(values["relaxed_id"])
        + ", separatorPair := "
        + lean_option_string(cert.get("separator_pair"))
        + ", sstar := "
        + lean_string(values["sstar"])
        + ", exactPids := "
        + lean_string_list(exact_pids)
        + ", splitPath := ["
        + ", ".join(split_entries)
        + "], commonMasks := ["
        + ", ".join(mask_entries)
        + "] }"
    )


def emit_relaxed_split_row_bank(
    cert_dir: Path,
    out_path: Path,
    module_root: str,
) -> None:
    paths = relaxed_certificate_paths(cert_dir)
    entries = ",\n".join(relaxed_split_row_entry(path) for path in paths)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import {module_root}.All

set_option linter.style.longLine false

/-!
# Relaxed split surplus row bank

This generated module records the finite metadata for the 135 singleton relaxed
split surplus leaves and aligns it with the generated algebraic certificate
aggregate.  It does not assert the geometric relaxed-submask bridge.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

abbrev Certificate := VerifiedCertificate

/-- One split decision on the path to a singleton relaxed split leaf. -/
structure SplitDecision where
  center : String
  label : String
  decision : String
  deriving Repr, DecidableEq

/-- A common erased-center mask required at a singleton relaxed split leaf. -/
structure CommonMask where
  center : String
  mask : Nat
  members : List String
  deriving Repr, DecidableEq

/-- One singleton relaxed split row, before pairing with its certificate. -/
structure Row where
  id : String
  caseId : String
  leafId : String
  relaxedId : String
  separatorPair : Option String
  sstar : String
  exactPids : List String
  splitPath : List SplitDecision
  commonMasks : List CommonMask
  deriving Repr, DecidableEq

/-- The generated singleton relaxed split row metadata. -/
def relaxedSplitRows : List Row :=
[
{entries}
]

/-- Relaxed split row ids in generated order. -/
def relaxedSplitRowIds : List String :=
  relaxedSplitRows.map (fun row => row.id)

/-- Relaxed split rows paired with their generated algebraic certificates. -/
def certifiedRelaxedSplitRows : List (Row × Certificate) :=
  relaxedSplitRows.zip allRelaxedSplitSingletonCertificates

/-- String-list membership as a checker Boolean. -/
def containsString (needle : String) : List String → Bool
  | [] => false
  | head :: tail => if head = needle then true else containsString needle tail

/-- Boolean singleton relaxed split row-id membership. -/
def relaxedSplitRowIdInBank (id : String) : Bool :=
  containsString id relaxedSplitRowIds

private theorem mem_of_containsString_eq_true {{needle : String}} :
    ∀ {{items : List String}}, containsString needle items = true → needle ∈ items
  | [], hcontains => by
      simp [containsString] at hcontains
  | head :: tail, hcontains => by
      by_cases hhead : head = needle
      · simp [hhead]
      · have htail : containsString needle tail = true := by
          simpa [containsString, hhead] using hcontains
        exact List.mem_cons_of_mem head
          (mem_of_containsString_eq_true htail)

private theorem list_all_eq_true_of_mem
    {{α : Type _}} {{p : α → Bool}} {{a : α}} :
    ∀ {{items : List α}}, items.all p = true → a ∈ items → p a = true
  | [], _hall, hmem => by
      cases hmem
  | head :: tail, hall, hmem => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      simp only [List.mem_cons] at hmem
      rcases hmem with rfl | htail
      · exact hall.1
      · exact list_all_eq_true_of_mem hall.2 htail

private theorem allPairCertificatesChecked :
    ∀ rows : List (Row × Certificate),
      rows.all (fun rowCert => rowCert.2.check) = true
  | [] => rfl
  | rowCert :: rows => by
      simp only [List.all_cons, Bool.and_eq_true, VerifiedCertificate.check]
      exact ⟨rowCert.2.valid, by
        simpa [VerifiedCertificate.check] using
          allPairCertificatesChecked rows⟩

set_option linter.style.nativeDecide false in
/-- The generated singleton relaxed split row bank has 135 rows. -/
theorem relaxedSplitRows_length : relaxedSplitRows.length = {len(paths)} := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The paired singleton relaxed split bank has 135 row/certificate pairs. -/
theorem certifiedRelaxedSplitRows_length :
    certifiedRelaxedSplitRows.length = {len(paths)} := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The singleton relaxed split row ids and generated certificate ids have the
same order. -/
theorem relaxedSplitRowIds_match_certificates :
    relaxedSplitRowIds =
      allRelaxedSplitSingletonCertificates.map (fun cert => cert.id) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The paired singleton relaxed split bank preserves the row-id list. -/
theorem certifiedRelaxedSplitRows_row_ids :
    certifiedRelaxedSplitRows.map (fun rowCert => rowCert.1.id) =
      relaxedSplitRowIds := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The paired singleton relaxed split bank is id-aligned at every row. -/
theorem certifiedRelaxedSplitRows_ids_match :
    certifiedRelaxedSplitRows.all (fun rowCert => rowCert.1.id == rowCert.2.id) =
      true := by
  native_decide

/-- Every certificate in the paired singleton relaxed split bank has its checker
proof. -/
theorem certifiedRelaxedSplitRows_certificates_checked :
    certifiedRelaxedSplitRows.all (fun rowCert => rowCert.2.check) = true :=
  allPairCertificatesChecked certifiedRelaxedSplitRows

/-- Boolean row-id membership determines a checked row/certificate pair in the
paired singleton relaxed split bank. -/
theorem exists_certifiedRelaxedSplitRow_of_rowIdInBank {{id : String}}
    (hin : relaxedSplitRowIdInBank id = true) :
    ∃ rowCert : Row × Certificate,
      rowCert ∈ certifiedRelaxedSplitRows ∧
        rowCert.1.id = id ∧
        rowCert.2.check = true := by
  have hmemId : id ∈ relaxedSplitRowIds :=
    mem_of_containsString_eq_true hin
  rw [← certifiedRelaxedSplitRows_row_ids] at hmemId
  rcases List.mem_map.mp hmemId with ⟨rowCert, hrowCert, hid⟩
  refine ⟨rowCert, hrowCert, hid, ?_⟩
  exact list_all_eq_true_of_mem
    (p := fun rowCert : Row × Certificate => rowCert.2.check)
    (a := rowCert)
    (items := certifiedRelaxedSplitRows)
    certifiedRelaxedSplitRows_certificates_checked hrowCert

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


ENDPOINT_VARS_BY_LABEL: dict[str, tuple[str, str]] = {
    "u": ("ux", "uy"),
    "s1": ("s1x", "s1y"),
    "s2": ("s2x", "s2y"),
    "s3": ("s3x", "s3y"),
    "Pw": ("pwx", "pwy"),
    "Pu": ("pux", "puy"),
    "Q1": ("q1x", "q1y"),
    "Q2": ("q2x", "q2y"),
}


def lean_label_expr(label: str) -> str:
    if label not in LABELS:
        raise ValueError(f"unknown label {label!r}")
    return f".{label}"


def endpoint_var_expr(label: str, axis: str) -> str:
    if label not in ENDPOINT_VARS_BY_LABEL:
        raise ValueError(f"{label!r} has no endpoint variable")
    xvar, yvar = ENDPOINT_VARS_BY_LABEL[label]
    if axis == "x":
        return f"EndpointVar.{xvar}"
    if axis == "y":
        return f"EndpointVar.{yvar}"
    raise ValueError(f"unknown axis {axis!r}")


def endpoint_var_pair(label: str) -> tuple[str, str]:
    return endpoint_var_expr(label, "x"), endpoint_var_expr(label, "y")


def row_zero_assignment_expr(separator_pair: str | None) -> str:
    if separator_pair is None:
        return "endpointS1S3Assignment pointOf"
    left, right = separator_pair.split("=")
    return (
        "endpointPairAssignment pointOf "
        f"{lean_label_expr(left)} {lean_label_expr(right)}"
    )


def lean_shape_sq_dist_center(center: str, left: str, right: str) -> str:
    cx, cy = endpoint_var_pair(center)
    ax, ay = endpoint_var_pair(left)
    bx, by = endpoint_var_pair(right)
    return (
        f"sqDistToCenterDiffPoly {cx}.index {cy}.index {ax}.index "
        f"{ay}.index {bx}.index {by}.index"
    )


def lean_shape_sq_norm_diff(left: str, right: str) -> str:
    ax, ay = endpoint_var_pair(left)
    bx, by = endpoint_var_pair(right)
    return f"sqNormDiffPoly {ax}.index {ay}.index {bx}.index {by}.index"


def lean_shape_sq_dist_unit_x_diff(left: str, right: str) -> str:
    ax, ay = endpoint_var_pair(left)
    bx, by = endpoint_var_pair(right)
    return (
        f"sqDistToUnitXDiffPoly {ax}.index {ay}.index "
        f"{bx}.index {by}.index"
    )


def lean_shape_common_v_member(center: str, member: str, reverse: bool) -> str:
    cx, cy = endpoint_var_pair(center)
    mx, my = endpoint_var_pair(member)
    name = "sqDistMinusSqNormFirstPoly" if reverse else "sqNormFirstMinusSqDistPoly"
    return f"{name} {cx}.index {cy}.index {mx}.index {my}.index"


def lean_shape_common_w_member(center: str, member: str, reverse: bool) -> str:
    cx, cy = endpoint_var_pair(center)
    mx, my = endpoint_var_pair(member)
    name = (
        "sqDistPointToUnitXDiffPoly"
        if reverse
        else "sqDistUnitXToPointMinusCenterDistPoly"
    )
    return f"{name} {mx}.index {my}.index {cx}.index {cy}.index"


def lean_shape_rabinowitsch(pair: tuple[str, str]) -> str:
    left, right = pair
    if right == "v" and left in ENDPOINT_VARS_BY_LABEL:
        ax, ay = endpoint_var_pair(left)
        return f"rabinowitschSqNormPoly EndpointVar.tau.index {ax}.index {ay}.index"
    if left in ENDPOINT_VARS_BY_LABEL and right in ENDPOINT_VARS_BY_LABEL:
        ax, ay = endpoint_var_pair(left)
        bx, by = endpoint_var_pair(right)
        return (
            "rabinowitschSqDistPoly EndpointVar.tau.index "
            f"{ax}.index {ay}.index {bx}.index {by}.index"
        )
    raise ValueError(f"unsupported Rabinowitsch pair {pair!r}")


def generator_get_expr(lean_name: str, index: int) -> str:
    return (
        f"Problem97.SurplusCertificate.RelaxedSplit.{lean_name}_generators.get "
        f"(Fin.mk {index} (by native_decide))"
    )


def common_mask_names(lean_name: str, cert: dict[str, object]) -> dict[str, str]:
    masks = cert.get("common_erased_masks")
    if not isinstance(masks, dict):
        raise ValueError(f"{cert.get('certificate_id')}: missing common_erased_masks")
    return {
        center: f"{lean_name}_commonMask_{index:02d}"
        for index, center in enumerate(sorted(masks, key=LABELS.index))
    }


def row_cert_defs(lean_name: str, row_index: int, exact_pid: str, cert: dict[str, object]) -> str:
    return f"""/-- Paired generated row/certificate metadata for `{cert['certificate_id']}`. -/
private def {lean_name}_rowCert : Row × Certificate :=
  certifiedRelaxedSplitRows.get (Fin.mk {row_index} (by native_decide))

set_option linter.style.nativeDecide false in
/-- The generated row/certificate pair carries the expected exact pid. -/
private theorem {lean_name}_rowCert_exactPids :
    {lean_name}_rowCert.1.exactPids = [{lean_string(exact_pid)}] := by
  native_decide

/-- The matched exact row has the generated singleton exact pid. -/
private theorem {lean_name}_exactRow_pid_eq
    {{exactRow : SurplusCOMPGBank.Row}}
    (hpid : {lean_name}_rowCert.1.exactPids = [exactRow.pid]) :
    exactRow.pid = {lean_string(exact_pid)} := by
  have hlist : [exactRow.pid] = [{lean_string(exact_pid)}] := by
    rw [← hpid, {lean_name}_rowCert_exactPids]
  simpa using hlist"""


def lean_common_mask_arg(common_names: dict[str, str], center: str) -> str:
    try:
        return common_names[center]
    except KeyError as exc:
        raise ValueError(f"no generated common mask for center {center}") from exc


def exact_bit_fact_name(exact_pid: str, center: str, label: str) -> str:
    return f"exactMaskAll_{safe_lean_decl_name(exact_pid)}_{center}_{label}"


def exact_mask_bits_module_root(row_zero_module_root: str) -> str:
    if "." not in row_zero_module_root:
        return "ExactMaskBits"
    return row_zero_module_root.rsplit(".", 1)[0] + ".ExactMaskBits"


def exact_mask_bits_module_stem(exact_pid: str) -> str:
    return relaxed_lean_module_stem(exact_pid)


def row_zero_shape_facts_module_root(row_zero_module_root: str) -> str:
    if "." not in row_zero_module_root:
        return "ShapeFacts"
    return row_zero_module_root.rsplit(".", 1)[0] + ".ShapeFacts"


def row_zero_shape_fact_qualified(lemma_name: str) -> str:
    return (
        "Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ShapeFacts."
        f"{lemma_name}"
    )


def row_zero_generator_zero_module_root(row_zero_module_root: str, stem: str) -> str:
    return row_zero_module_root + ".GeneratorZeros." + stem


def row_zero_generator_zero_module_name(index: int) -> str:
    return f"G{index:02d}"


def bridge_call_common_all_ordinary(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    center: str,
    left: str,
    right: str,
) -> str:
    cx, cy = endpoint_var_pair(center)
    ax, ay = endpoint_var_pair(left)
    bx, by = endpoint_var_pair(right)
    return f"""eval_sqDistCenter_zero_of_exactRow_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := {lean_label_expr(center)})
          (leftLabel := {lean_label_expr(left)})
          (rightLabel := {lean_label_expr(right)})
          (cx := {cx}) (cy := {cy}) (ax := {ax}) (ay := {ay})
          (bx := {bx}) (b_y := {by})
          hmetric hmasks
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, left)})
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, right)})
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)"""


def bridge_call_common_v_member(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    center: str,
    v_member: str,
    member: str,
    reverse: bool,
) -> str:
    cx, cy = endpoint_var_pair(center)
    mx, my = endpoint_var_pair(member)
    theorem = (
        "eval_sqDistVsNorm_zero_of_exactRow_v_member"
        if reverse
        else "eval_sqNormVsDist_zero_of_exactRow_v_member"
    )
    return f"""{theorem}
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := {lean_label_expr(center)})
          (memberLabel := {lean_label_expr(member)})
          (ax := {cx}) (ay := {cy}) (bx := {mx}) (b_y := {my})
          hmetric hmasks
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, v_member)})
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, member)})
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)"""


def bridge_call_common_w_member(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    center: str,
    w_member: str,
    member: str,
    reverse: bool,
) -> str:
    cx, cy = endpoint_var_pair(center)
    mx, my = endpoint_var_pair(member)
    theorem = (
        "eval_sqDistPointToUnitX_zero_of_exactRow_w_member"
        if reverse
        else "eval_sqDistUnitXToPoint_zero_of_exactRow_w_member"
    )
    return f"""{theorem}
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := {lean_label_expr(center)})
          (memberLabel := {lean_label_expr(member)})
          (cx := {mx}) (cy := {my}) (ax := {cx}) (ay := {cy})
          hmetric hmasks
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, w_member)})
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, member)})
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)"""


def bridge_call_common_v_w_frame(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    center: str,
    v_member: str,
    w_member: str,
) -> str:
    cx, _cy = endpoint_var_pair(center)
    return f"""eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := {lean_label_expr(center)})
          (ax := {cx})
          hmetric hmasks
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, v_member)})
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, center, w_member)})
          (by native_decide)"""


def exact_bit_call(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    center: str,
    label: str,
) -> str:
    del lean_name
    key = (exact_pid, center, label)
    fact_name = bit_fact_names.get(key)
    if fact_name is None:
        fact_name = exact_bit_fact_name(exact_pid, center, label)
        bit_fact_names[key] = fact_name
    qualified = (
        "Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits."
        f"{fact_name}"
    )
    return (
        "maskHas_exactRow_of_pid "
        f"(pid := {lean_string(exact_pid)}) "
        f"(center := {lean_label_expr(center)}) "
        f"(label := {lean_label_expr(label)}) "
        f"hrow hpidEq {qualified}"
    )


def exact_mask_bit_fact_lemmas(
    bit_fact_names: dict[tuple[str, str, str], str],
) -> str:
    if not bit_fact_names:
        return "/-- No exact mask-bit facts were required by the emitted direct row-zero modules. -/\nexample : True := by\n  trivial"
    lemmas: list[str] = []
    for exact_pid, center, label in sorted(
        bit_fact_names,
        key=lambda key: (key[0], LABEL_INDEX[key[1]], LABEL_INDEX[key[2]]),
    ):
        fact_name = bit_fact_names[(exact_pid, center, label)]
        lemmas.append(
            f"""/-- Finite exact-bank check: row `{exact_pid}` has `{label}` in `{center}`'s mask. -/
theorem {fact_name} :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = {lean_string(exact_pid)} then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.{center}.index 0)
            {lean_label_expr(label)}
        else
          true) = true := by
  native_decide"""
        )
    return "\n\n".join(lemmas)


def inline_exact_bit_call(exact_pid: str, center: str, label: str) -> str:
    return (
        "maskHas_exactRow_of_pid "
        f"(pid := {lean_string(exact_pid)}) "
        f"(center := {lean_label_expr(center)}) "
        f"(label := {lean_label_expr(label)}) "
        "hrow hpidEq (by native_decide)"
    )


def bridge_call_exact_v(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    left: str,
    right: str,
) -> str:
    ax, ay = endpoint_var_pair(left)
    bx, by = endpoint_var_pair(right)
    return f"""eval_sqNormDiff_zero_of_exactRow_v_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := {lean_label_expr(left)})
          (rightLabel := {lean_label_expr(right)})
          (ax := {ax}) (ay := {ay}) (bx := {bx}) (b_y := {by})
          hmetric hmasks
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, "v", left)})
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, "v", right)})
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)"""


def bridge_call_exact_w(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    left: str,
    right: str,
) -> str:
    ax, ay = endpoint_var_pair(left)
    bx, by = endpoint_var_pair(right)
    return f"""eval_sqDistToUnitX_zero_of_exactRow_w_center_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (leftLabel := {lean_label_expr(left)})
          (rightLabel := {lean_label_expr(right)})
          (ax := {ax}) (ay := {ay}) (bx := {bx}) (b_y := {by})
          hmetric hmasks
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, "w", left)})
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, "w", right)})
          (by native_decide) (by native_decide)
          (by native_decide) (by native_decide)"""


def bridge_call_exact_w_v_member(
    lean_name: str,
    bit_fact_names: dict[tuple[str, str, str], str],
    exact_pid: str,
    member: str,
) -> str:
    ax, ay = endpoint_var_pair(member)
    return f"""eval_oneMinusSqDistToUnitX_zero_of_exactRow_w_v_member
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (memberLabel := {lean_label_expr(member)})
          (ax := {ax}) (ay := {ay})
          hmetric hmasks
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, "w", "v")})
          ({exact_bit_call(lean_name, bit_fact_names, exact_pid, "w", member)})
          (by native_decide) (by native_decide)"""


def bridge_call_rabinowitsch(pair: tuple[str, str]) -> str:
    left, right = pair
    if right == "v" and left in ENDPOINT_VARS_BY_LABEL:
        ax, ay = endpoint_var_pair(left)
        return f"""eval_rabinowitsch_sqNorm_zero_of_pair_v
          (pointOf := pointOf) (centerClass := centerClass)
          (label := {lean_label_expr(left)}) (ax := {ax}) (ay := {ay})
          hmetric (by native_decide) (by native_decide) (by native_decide)"""
    if left in ENDPOINT_VARS_BY_LABEL and right in ENDPOINT_VARS_BY_LABEL:
        ax, ay = endpoint_var_pair(left)
        bx, by = endpoint_var_pair(right)
        return f"""eval_rabinowitsch_zero_of_pair
          (pointOf := pointOf) (centerClass := centerClass)
          (leftLabel := {lean_label_expr(left)})
          (rightLabel := {lean_label_expr(right)})
          (ax := {ax}) (ay := {ay}) (bx := {bx}) (b_y := {by})
          hmetric (by native_decide) (by native_decide)
          (by native_decide) (by native_decide) (by native_decide)"""
    raise ValueError(f"unsupported Rabinowitsch pair {pair!r}")


def row_zero_shape_and_bridge(
    lean_name: str,
    cert: dict[str, object],
    meta: dict[str, object],
    exact_pid: str,
    bit_fact_names: dict[tuple[str, str, str], str],
) -> tuple[str, str]:
    kind = meta.get("kind")
    if kind == "rabinowitsch_distinct":
        pair_raw = meta.get("pair")
        if not isinstance(pair_raw, list) or len(pair_raw) != 2:
            raise ValueError(f"{cert.get('certificate_id')}: bad Rabinowitsch pair")
        pair = (str(pair_raw[0]), str(pair_raw[1]))
        return lean_shape_rabinowitsch(pair), bridge_call_rabinowitsch(pair)
    if kind != "distance_eq":
        raise ValueError(f"{cert.get('certificate_id')}: unsupported generator kind {kind!r}")

    center = str(meta.get("center"))
    witnesses = meta.get("witnesses")
    if not isinstance(witnesses, list) or len(witnesses) != 2:
        raise ValueError(f"{cert.get('certificate_id')}: bad witnesses")
    left, right = str(witnesses[0]), str(witnesses[1])

    if center == "v":
        if left not in ENDPOINT_VARS_BY_LABEL or right not in ENDPOINT_VARS_BY_LABEL:
            raise ValueError(f"unsupported exact-v witnesses {(left, right)!r}")
        return lean_shape_sq_norm_diff(left, right), bridge_call_exact_v(
            lean_name, bit_fact_names, exact_pid, left, right
        )

    if center == "w":
        if left == "v" and right in ENDPOINT_VARS_BY_LABEL:
            shape = f"oneMinusSqDistToUnitXPoly {endpoint_var_expr(right, 'x')}.index {endpoint_var_expr(right, 'y')}.index"
            return shape, bridge_call_exact_w_v_member(
                lean_name, bit_fact_names, exact_pid, right
            )
        if left in ENDPOINT_VARS_BY_LABEL and right in ENDPOINT_VARS_BY_LABEL:
            return lean_shape_sq_dist_unit_x_diff(left, right), bridge_call_exact_w(
                lean_name, bit_fact_names, exact_pid, left, right
            )
        raise ValueError(f"unsupported exact-w witnesses {(left, right)!r}")

    if left in ENDPOINT_VARS_BY_LABEL and right in ENDPOINT_VARS_BY_LABEL:
        return lean_shape_sq_dist_center(center, left, right), bridge_call_common_all_ordinary(
            lean_name, bit_fact_names, exact_pid, center, left, right
        )
    if left == "v" and right in ENDPOINT_VARS_BY_LABEL:
        return lean_shape_common_v_member(center, right, reverse=False), bridge_call_common_v_member(
            lean_name, bit_fact_names, exact_pid, center, left, right, reverse=False
        )
    if right == "v" and left in ENDPOINT_VARS_BY_LABEL:
        return lean_shape_common_v_member(center, left, reverse=True), bridge_call_common_v_member(
            lean_name, bit_fact_names, exact_pid, center, right, left, reverse=True
        )
    if left == "w" and right in ENDPOINT_VARS_BY_LABEL:
        return lean_shape_common_w_member(center, right, reverse=False), bridge_call_common_w_member(
            lean_name, bit_fact_names, exact_pid, center, left, right, reverse=False
        )
    if right == "w" and left in ENDPOINT_VARS_BY_LABEL:
        return lean_shape_common_w_member(center, left, reverse=True), bridge_call_common_w_member(
            lean_name, bit_fact_names, exact_pid, center, right, left, reverse=True
        )
    if left == "v" and right == "w":
        shape = f"twiceVarMinusOnePoly {endpoint_var_expr(center, 'x')}.index"
        return shape, bridge_call_common_v_w_frame(
            lean_name, bit_fact_names, exact_pid, center, left, right
        )
    raise ValueError(f"unsupported common witnesses {(center, left, right)!r}")


def row_zero_generator_lemmas(
    lean_name: str,
    cert: dict[str, object],
    assignment: str,
    exact_pid: str,
    endpoint_tool: Any,
) -> tuple[list[str], list[str], dict[tuple[str, str, str], str], str]:
    metadata = cert.get("generator_metadata")
    generators = cert.get("generators")
    variables = cert.get("variables")
    if not isinstance(metadata, list) or not isinstance(generators, list):
        raise ValueError(f"{cert.get('certificate_id')}: missing generator metadata")
    if not isinstance(variables, list) or not all(isinstance(x, str) for x in variables):
        raise ValueError(f"{cert.get('certificate_id')}: bad variables")
    if len(metadata) != len(generators):
        raise ValueError(f"{cert.get('certificate_id')}: generator metadata length mismatch")
    lemmas: list[str] = []
    shape_fact_lemmas: list[str] = []
    names: list[str] = []
    bit_fact_names: dict[tuple[str, str, str], str] = {}
    for index, (meta, generator) in enumerate(zip(metadata, generators, strict=True)):
        if not isinstance(meta, dict):
            raise ValueError(f"{cert.get('certificate_id')}: bad generator metadata")
        if not isinstance(generator, str):
            raise ValueError(f"{cert.get('certificate_id')}: bad generator")
        shape, bridge = row_zero_shape_and_bridge(
            lean_name, cert, meta, exact_pid, bit_fact_names
        )
        generator_ref = generator_get_expr(lean_name, index)
        lemma_name = f"{lean_name}_generator_{index:02d}_zero"
        shape_fact_name = f"{lean_name}_generator_{index:02d}_shape"
        names.append(lemma_name)
        shape_fact_lemmas.append(
            f"""/-- Generator {index} for `{cert['certificate_id']}` has the expected geometric shape. -/
theorem {shape_fact_name} :
    normalizePoly ({generator_ref}) =
      normalizePoly ({shape}) := by
  native_decide"""
        )
        lemmas.append(
            f"""/-- Generator {index} for `{cert['certificate_id']}` evaluates to zero. -/
theorem {lemma_name}
    {{pointOf : SurplusCOMPGBank.Label → ℝ²}}
    {{centerClass : SurplusCOMPGBank.Label → Finset ℝ²}}
    {{exactRow : SurplusCOMPGBank.Row}}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpidEq : exactRow.pid = {lean_string(exact_pid)}) :
    evalPoly ({assignment}) ({generator_ref}) = 0 := by
  exact evalPoly_eq_zero_of_normalizePoly_eq
    ({assignment}) (q := {shape})
    {row_zero_shape_fact_qualified(shape_fact_name)}
    (by
      exact (
        {bridge}))"""
        )
    return lemmas, names, bit_fact_names, "\n\n".join(shape_fact_lemmas)


def emit_relaxed_split_direct_row_zero_module(
    cert_path: Path,
    out_path: Path,
    cert_module_root: str,
    exact_mask_module_import: str,
    shape_fact_module_import: str,
    generator_zero_module_root: str,
    row_index: int,
) -> dict[str, object]:
    cert = load_json(cert_path)
    cert_id = cert.get("certificate_id")
    if not isinstance(cert_id, str):
        raise ValueError(f"{cert_path}: missing certificate_id")
    exact_pids = cert.get("exact_pids")
    if not isinstance(exact_pids, list) or len(exact_pids) != 1:
        raise ValueError(f"{cert_path}: expected one exact pid")
    exact_pid = str(exact_pids[0])
    separator_pair_raw = cert.get("separator_pair")
    if separator_pair_raw is not None and not isinstance(separator_pair_raw, str):
        raise ValueError(f"{cert_path}: bad separator_pair")
    separator_pair = separator_pair_raw
    stem = relaxed_lean_module_stem(cert_id)
    lean_name = safe_lean_decl_name(cert_id)
    assignment = row_zero_assignment_expr(separator_pair)
    endpoint_tool = load_endpoint_tool()
    (
        generator_lemma_texts,
        generator_lemma_names,
        bit_fact_names,
        shape_fact_lemmas,
    ) = row_zero_generator_lemmas(
        lean_name, cert, assignment, exact_pid, endpoint_tool
    )
    fin_cases_branches = "\n".join(
        f"  · simpa using {name} hmetric hrow hmasks hpidEq"
        for name in generator_lemma_names
    )
    branch_text = "\n".join(
        f"  · exact {name} hmetric hrow hmasks ({lean_name}_exactRow_pid_eq hpid)"
        for name in generator_lemma_names
    )
    row_defs = row_cert_defs(lean_name, row_index, exact_pid, cert)
    generator_imports = "\n".join(
        "import "
        + generator_zero_module_root
        + "."
        + row_zero_generator_zero_module_name(index)
        for index in range(len(generator_lemma_names))
    )
    source = cert_path.as_posix()
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import {exact_mask_module_import}
import {shape_fact_module_import}
import {cert_module_root}.{stem}
{generator_imports}

/-!
# Direct row zeros for relaxed split surplus certificate {cert_id}

This generated module proves the semantic generator-zero condition for one
direct relaxed split payload from the geometric surplus bridge.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Direct

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

{row_defs}

/-- The direct payload for `{cert_id}` has all generators zero under the
row-local normal-axis assignment supplied by its separator metadata. -/
theorem {lean_name}_evaluationZeros_of_metricShadow
    {{pointOf : SurplusCOMPGBank.Label → ℝ²}}
    {{centerClass : SurplusCOMPGBank.Label → Finset ℝ²}}
    {{exactRow : SurplusCOMPGBank.Row}}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpid : {lean_name}_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros (.direct {lean_name}) ({assignment}) := by
  have hpidEq := {lean_name}_exactRow_pid_eq hpid
  change ∀ g ∈ {lean_name}_generators, evalPoly ({assignment}) g = 0
  intro g hg
  rcases List.get_of_mem hg with ⟨i, rfl⟩
  fin_cases i
{fin_cases_branches}

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)
    return {
        "certificate_id": cert_id,
        "stem": stem,
        "lean_name": lean_name,
        "row_index": row_index,
        "exact_pid": exact_pid,
        "separator_pair": separator_pair,
        "generator_count": len(generator_lemma_names),
        "mask_bit_facts": list(bit_fact_names.keys()),
        "shape_fact_lemmas": shape_fact_lemmas,
        "generator_lemma_texts": generator_lemma_texts,
    }


def product_row_zero_theorem_name(
    lean_name: str,
    gen_index: int,
    start: int,
    stop: int,
) -> str:
    return f"{lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}_eval_zero"


def emit_relaxed_split_product_block_zero_module(
    cert_path: Path,
    cert: dict[str, object],
    lean_name: str,
    exact_pid: str,
    exact_mask_module_import: str,
    cert_module_root: str,
    assignment: str,
    gen_index: int,
    start: int,
    stop: int,
    generator_meta: dict[str, object],
    bit_fact_names: dict[tuple[str, str, str], str],
    out_path: Path,
) -> str:
    cert_id = cert.get("certificate_id")
    if not isinstance(cert_id, str):
        raise ValueError(f"{cert_path}: missing certificate_id")
    stem = relaxed_lean_module_stem(cert_id)
    block_stem = relaxed_block_module_stem(cert_id, gen_index, start, stop)
    shard_namespace = f"Problem97.SurplusCertificate.RelaxedSplit.{stem}TermShards"
    theorem_name = product_row_zero_theorem_name(lean_name, gen_index, start, stop)
    shape, bridge = row_zero_shape_and_bridge(
        lean_name, cert, generator_meta, exact_pid, bit_fact_names
    )
    generator_ref = (
        f"{shard_namespace}.{lean_name}_generator_{gen_index:02d}_"
        f"{start:04d}_{stop - 1:04d}"
    )
    shape_fact_name = (
        f"{lean_name}_generator_{gen_index:02d}_{start:04d}_{stop - 1:04d}_shape"
    )
    hrow_name = "hrow" if "hrow" in bridge else "_hrow"
    hmasks_name = "hmasks" if "hmasks" in bridge else "_hmasks"
    hpid_name = "hpidEq" if "hpidEq" in bridge else "_hpidEq"
    partial_cases = []
    for term_index in range(start, stop):
        partial_cases.append(
            "  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero\n"
            f"      ({assignment})\n"
            f"      {shard_namespace}.{lean_name}_partial_{gen_index:02d}_{term_index:04d}_valid\n"
            "      hgenerator"
        )
    partial_cases_text = "\n".join(partial_cases)
    rcases_pattern = " | ".join("rfl" for _ in range(start, stop))
    source = cert_path.as_posix()
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import {exact_mask_module_import}
import {cert_module_root}.{stem}TermShards.{block_stem}

/-!
# Product-sum row block zero for relaxed split surplus certificate {cert_id}

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `{cert_id}`.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

private theorem {shape_fact_name} :
    normalizePoly ({generator_ref}) =
      normalizePoly ({shape}) := by
  native_decide

/-- Checked block `{gen_index}:{start}-{stop - 1}` in product-sum row `{cert_id}`
evaluates to zero under the row-local normal-axis assignment. -/
theorem {theorem_name}
    {{pointOf : SurplusCOMPGBank.Label → ℝ²}}
    {{centerClass : SurplusCOMPGBank.Label → Finset ℝ²}}
    {{exactRow : SurplusCOMPGBank.Row}}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    ({hrow_name} : exactRow ∈ SurplusCOMPGBank.rows)
    ({hmasks_name} :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    ({hpid_name} : exactRow.pid = {lean_string(exact_pid)}) :
    evalPoly ({assignment})
      {shard_namespace}.{lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d} = 0 := by
  have hgenerator :
      evalPoly ({assignment}) ({generator_ref}) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      ({assignment}) (q := {shape})
      {shape_fact_name}
      (by
        exact (
          {bridge}))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    ({assignment})
    {shard_namespace}.{lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}_valid ?_
  intro p hp
  simp only [{shard_namespace}.{lean_name}_partials_{gen_index:02d}_{start:04d}_{stop - 1:04d},
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with {rcases_pattern}
{partial_cases_text}

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)
    return out_path.stem


def emit_relaxed_split_product_row_zero_module(
    cert_path: Path,
    coordinator_out: Path,
    block_out_dir: Path,
    cert_module_root: str,
    row_zero_module_root: str,
    exact_mask_module_import: str,
    row_index: int,
    bit_fact_names: dict[tuple[str, str, str], str],
    block_size: int,
) -> dict[str, object]:
    cert = load_json(cert_path)
    cert_id = cert.get("certificate_id")
    if not isinstance(cert_id, str):
        raise ValueError(f"{cert_path}: missing certificate_id")
    exact_pids = cert.get("exact_pids")
    if not isinstance(exact_pids, list) or len(exact_pids) != 1:
        raise ValueError(f"{cert_path}: expected one exact pid")
    exact_pid = str(exact_pids[0])
    separator_pair_raw = cert.get("separator_pair")
    if separator_pair_raw is not None and not isinstance(separator_pair_raw, str):
        raise ValueError(f"{cert_path}: bad separator_pair")
    separator_pair = separator_pair_raw
    metadata = cert.get("generator_metadata")
    if not isinstance(metadata, list) or not all(isinstance(item, dict) for item in metadata):
        raise ValueError(f"{cert_path}: missing generator metadata")
    cert_id_read, variables, generator_exprs, coefficient_exprs = read_relaxed_certificate(
        cert_path
    )
    if cert_id_read != cert_id:
        raise ValueError(f"{cert_path}: certificate_id mismatch")
    if len(metadata) != len(generator_exprs):
        raise ValueError(f"{cert_path}: generator metadata length mismatch")
    stem = relaxed_lean_module_stem(cert_id)
    lean_name = safe_lean_decl_name(cert_id)
    assignment = row_zero_assignment_expr(separator_pair)
    endpoint_tool = load_endpoint_tool()
    block_refs: list[tuple[int, int, int, str]] = []
    imports: list[str] = []
    for gen_index, coeff_expr in enumerate(coefficient_exprs):
        coeff_poly = endpoint_tool.parse_poly(coeff_expr, variables)
        terms = endpoint_tool.sorted_poly_terms(coeff_poly)
        for start in range(0, len(terms), block_size):
            stop = min(start + block_size, len(terms))
            block_stem = emit_relaxed_split_product_block_zero_module(
                cert_path,
                cert,
                lean_name,
                exact_pid,
                exact_mask_module_import,
                cert_module_root,
                assignment,
                gen_index,
                start,
                stop,
                metadata[gen_index],
                bit_fact_names,
                block_out_dir / f"{relaxed_block_module_stem(cert_id, gen_index, start, stop)}.lean",
            )
            imports.append(f"import {row_zero_module_root}.{stem}BlockZeros.{block_stem}")
            block_refs.append((gen_index, start, stop, block_stem))
    row_defs = row_cert_defs(lean_name, row_index, exact_pid, cert)
    shard_namespace = f"Problem97.SurplusCertificate.RelaxedSplit.{stem}TermShards"
    block_list_entries = []
    block_cases = []
    for gen_index, start, stop, _block_stem in block_refs:
        block_list_entries.append(
            f"      {shard_namespace}.{lean_name}_block_{gen_index:02d}_{start:04d}_{stop - 1:04d}"
        )
        block_cases.extend(
            [
                "  rcases List.mem_cons.mp hp with rfl | hp",
                f"  · exact {product_row_zero_theorem_name(lean_name, gen_index, start, stop)} "
                "hmetric hrow hmasks hpidEq",
            ]
        )
    block_cases.append("  cases hp")
    block_list_text = ",\n".join(block_list_entries)
    block_cases_text = "\n".join(block_cases)
    import_text = "\n".join(imports)
    source = cert_path.as_posix()
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.AggregateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import {cert_module_root}.{stem}
{import_text}

/-!
# Product-sum row zeros for relaxed split surplus certificate {cert_id}

This generated module proves that every checked block in product-sum relaxed
split surplus row `{cert_id}` vanishes under the row-local normal-axis
assignment supplied by its separator metadata.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

{row_defs}

/-- Every checked block in product-sum relaxed split surplus certificate
`{cert_id}` evaluates to zero under the row-local normal-axis assignment. -/
theorem {lean_name}_evaluationZeros_of_metricShadow
    {{pointOf : SurplusCOMPGBank.Label → ℝ²}}
    {{centerClass : SurplusCOMPGBank.Label → Finset ℝ²}}
    {{exactRow : SurplusCOMPGBank.Row}}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpid : {lean_name}_rowCert.1.exactPids = [exactRow.pid]) :
    CertificatePayload.evaluationZeros
      (.productSum Problem97.SurplusCertificate.RelaxedSplit.{lean_name}_blocks)
      ({assignment}) := by
  have hpidEq := {lean_name}_exactRow_pid_eq hpid
  dsimp [CertificatePayload.evaluationZeros]
  intro p hp
  change p ∈
    [
{block_list_text}
    ] at hp
{block_cases_text}

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    coordinator_out.parent.mkdir(parents=True, exist_ok=True)
    coordinator_out.write_text(module)
    return {
        "certificate_id": cert_id,
        "stem": stem,
        "lean_name": lean_name,
        "row_index": row_index,
        "exact_pid": exact_pid,
        "separator_pair": separator_pair,
        "block_count": len(block_refs),
    }


def write_relaxed_split_product_row_zero_aggregate(
    rows: list[dict[str, object]],
    out_path: Path,
    row_zero_module_root: str,
) -> None:
    imports = "\n".join(f"import {row_zero_module_root}.{row['stem']}" for row in rows)
    entries = ",\n".join("  " + lean_string(str(row["certificate_id"])) for row in rows)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

/-!
# Product-sum relaxed split row-zero aggregate

This generated module imports the row-zero proofs for product-sum singleton
relaxed split surplus certificate payloads.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

/-- Certificate ids covered by product-sum relaxed split row-zero modules. -/
def productSumRowZeroCertificateIds : List String :=
[
{entries}
]

set_option linter.style.nativeDecide false in
/-- Number of product-sum relaxed split row-zero modules emitted. -/
theorem productSumRowZeroCertificateIds_length :
    productSumRowZeroCertificateIds.length = {len(rows)} := by
  native_decide

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_relaxed_split_product_row_zeros_dir(
    cert_dir: Path,
    lean_out_dir: Path,
    aggregate_out: Path | None,
    cert_module_root: str,
    row_zero_module_root: str,
    block_size: int,
    shard_threshold: int,
    certificate_ids: set[str] | None,
) -> None:
    rows: list[dict[str, object]] = []
    exact_mask_root = exact_mask_bits_module_root(row_zero_module_root)
    bit_fact_names: dict[tuple[str, str, str], str] = {}
    for row_index, cert_path in enumerate(relaxed_certificate_paths(cert_dir)):
        cert_id, _variables, _generators, _coefficients = read_relaxed_certificate(
            cert_path
        )
        if certificate_ids is not None and cert_id not in certificate_ids:
            continue
        if (
            relaxed_certificate_payload_kind(
                cert_path, cert_module_root, shard_threshold
            )
            != "productSum"
        ):
            continue
        cert = load_json(cert_path)
        exact_pids = cert.get("exact_pids")
        if not isinstance(exact_pids, list) or len(exact_pids) != 1:
            raise ValueError(f"{cert_path}: expected one exact pid")
        exact_pid = str(exact_pids[0])
        exact_mask_import = (
            exact_mask_root + "." + exact_mask_bits_module_stem(exact_pid)
        )
        stem = relaxed_lean_module_stem(cert_id)
        emitted = emit_relaxed_split_product_row_zero_module(
            cert_path,
            lean_out_dir / f"{stem}.lean",
            lean_out_dir / f"{stem}BlockZeros",
            cert_module_root,
            row_zero_module_root,
            exact_mask_import,
            row_index,
            bit_fact_names,
            block_size,
        )
        rows.append(emitted)
    exact_mask_dir = lean_out_dir.parent / "ExactMaskBits"
    for exact_pid in sorted({fact[0] for fact in bit_fact_names}):
        pid_facts = {
            fact: name
            for fact, name in bit_fact_names.items()
            if fact[0] == exact_pid
        }
        write_exact_mask_bits_module(
            pid_facts,
            exact_mask_dir / f"{exact_mask_bits_module_stem(exact_pid)}.lean",
        )
    if aggregate_out is not None:
        write_relaxed_split_product_row_zero_aggregate(
            rows, aggregate_out, row_zero_module_root
        )


def write_relaxed_split_direct_row_zero_aggregate(
    rows: list[dict[str, object]],
    out_path: Path,
    row_zero_module_root: str,
) -> None:
    imports = "\n".join(f"import {row_zero_module_root}.{row['stem']}" for row in rows)
    entries = ",\n".join("  " + lean_string(str(row["certificate_id"])) for row in rows)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

/-!
# Direct relaxed split row-zero aggregate

This generated module imports the row-zero proofs for direct singleton relaxed
split surplus certificate payloads.  Product-sum payloads are intentionally
handled by a separate block-lifting pass.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Direct

/-- Certificate ids covered by direct relaxed split row-zero modules. -/
def directRowZeroCertificateIds : List String :=
[
{entries}
]

set_option linter.style.nativeDecide false in
/-- Number of direct relaxed split row-zero modules emitted. -/
theorem directRowZeroCertificateIds_length :
    directRowZeroCertificateIds.length = {len(rows)} := by
  native_decide

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def relaxed_split_row_zero_roots(row_zero_module_root: str) -> tuple[str, str, str]:
    if row_zero_module_root.endswith(".Direct"):
        root = row_zero_module_root[: -len(".Direct")]
    elif row_zero_module_root.endswith(".Product"):
        root = row_zero_module_root[: -len(".Product")]
    else:
        root = row_zero_module_root
    return root, root + ".Direct", root + ".Product"


def write_relaxed_split_bank_row_zero_dispatch(
    rows: list[dict[str, object]],
    out_path: Path,
    row_zero_module_root: str,
) -> None:
    _root, direct_root, product_root = relaxed_split_row_zero_roots(
        row_zero_module_root
    )
    row_entries = ",\n".join(
        "      certifiedRelaxedSplitRows.get "
        f"(Fin.mk {row['row_index']} (by native_decide))"
        for row in rows
    )
    branch_lines: list[str] = []
    for row in rows:
        namespace = "Product" if row["payload_kind"] == "productSum" else "Direct"
        branch_lines.extend(
            [
                "  rcases List.mem_cons.mp hrowCert with rfl | hrowCert",
                f"  · exact ⟨{row['assignment']}, by",
                f"      simpa using {namespace}.{row['lean_name']}_evaluationZeros_of_metricShadow",
                "        hmetric hrow hmasks (by simpa using hpid)⟩",
            ]
        )
    branch_lines.append("  cases hrowCert")
    branches = "\n".join(branch_lines)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.ExactBridge
import {direct_root}.All
import {product_root}.All

/-!
# Relaxed split pinned-surplus bank row-zero dispatch

This generated module dispatches a matched finite singleton relaxed-split
certificate row to the corresponding generated direct or product-sum row-zero
theorem, then plugs the row-local zero witness into the exact pinned-bank
bridge.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

/-- A certified singleton relaxed-split pinned-surplus row carries a row-local
zero-evaluation assignment for its algebraic certificate payload. -/
theorem exists_payload_zeros_of_certifiedRelaxedSplitRow
    {{pointOf : SurplusCOMPGBank.Label → ℝ²}}
    {{centerClass : SurplusCOMPGBank.Label → Finset ℝ²}}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (exactRow : SurplusCOMPGBank.Row)
    (rowCert : Row × Certificate)
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid]) :
    ∃ ν : Nat → ℝ, rowCert.2.payload.evaluationZeros ν := by
  change rowCert ∈
    [
{row_entries}
    ] at hrowCert
{branches}

/-- Exact pinned-bank membership contradicts a metric interpretation of the
matched shadow. -/
theorem false_of_shadowInBank_of_metricShadow
    {{pointOf : SurplusCOMPGBank.Label → ℝ²}}
    {{centerClass : SurplusCOMPGBank.Label → Finset ℝ²}}
    (hin :
      SurplusCOMPGBank.shadowInBank
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) = true)
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)) :
    False := by
  exact
    Problem97.SurplusCertificate.RelaxedSplit.Bank.false_of_shadowInBank_of_exists_payload_zeros hin
      (fun exactRow rowCert hrow hmasks hrowCert hpid =>
        exists_payload_zeros_of_certifiedRelaxedSplitRow hmetric exactRow
          rowCert hrow hmasks hrowCert hpid)

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_relaxed_split_bank_row_zeros(
    cert_dir: Path,
    out_path: Path,
    cert_module_root: str,
    row_zero_module_root: str,
    shard_threshold: int,
) -> None:
    rows: list[dict[str, object]] = []
    for row_index, cert_path in enumerate(relaxed_certificate_paths(cert_dir)):
        cert_id, _variables, _generators, _coefficients = read_relaxed_certificate(
            cert_path
        )
        cert = load_json(cert_path)
        separator_pair_raw = cert.get("separator_pair")
        if separator_pair_raw is not None and not isinstance(separator_pair_raw, str):
            raise ValueError(f"{cert_path}: bad separator_pair")
        payload_kind = relaxed_certificate_payload_kind(
            cert_path, cert_module_root, shard_threshold
        )
        rows.append(
            {
                "certificate_id": cert_id,
                "lean_name": safe_lean_decl_name(cert_id),
                "row_index": row_index,
                "assignment": row_zero_assignment_expr(separator_pair_raw),
                "payload_kind": payload_kind,
            }
        )
    write_relaxed_split_bank_row_zero_dispatch(rows, out_path, row_zero_module_root)


def write_exact_mask_bits_module(
    bit_fact_names: dict[tuple[str, str, str], str],
    out_path: Path,
) -> None:
    lemmas = exact_mask_bit_fact_lemmas(bit_fact_names)
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.ExactBridge

/-!
# Exact mask-bit certificates for direct relaxed split row-zero proofs

This generated module contains the finite exact-bank `rows.all` checks consumed
by the direct relaxed split row-zero modules.  Keeping these checks in one
compiled dependency prevents each row-zero module from re-running the same
finite incidence decisions while elaborating geometric generator zeros.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace ExactMaskBits

{lemmas}

end ExactMaskBits

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def write_row_zero_shape_facts_module(
    cert_id: str,
    source: str,
    cert_module_import: str,
    lemmas: str,
    out_path: Path,
) -> None:
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import {cert_module_import}

/-!
# Shape facts for direct relaxed split row-zero certificate {cert_id}

This generated module contains the finite polynomial-normalization facts used
by the direct row-zero proof for one relaxed split surplus certificate.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace ShapeFacts

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

{lemmas}

end ShapeFacts

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def write_row_zero_generator_zero_module(
    cert_id: str,
    source: str,
    exact_mask_module_import: str,
    shape_fact_module_import: str,
    cert_module_import: str,
    lemma_text: str,
    out_path: Path,
) -> None:
    module = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import {exact_mask_module_import}
import {shape_fact_module_import}
import {cert_module_import}

/-!
# Generator-zero proof for direct relaxed split row-zero certificate {cert_id}

This generated module proves one geometric generator-zero fact for a direct
relaxed split surplus certificate.

Source certificate: `{source}`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Direct

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

{lemma_text}

end Direct

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
"""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(module)


def emit_relaxed_split_direct_row_zeros_dir(
    cert_dir: Path,
    lean_out_dir: Path,
    aggregate_out: Path | None,
    cert_module_root: str,
    row_zero_module_root: str,
    shard_threshold: int,
    certificate_ids: set[str] | None,
) -> None:
    rows: list[dict[str, object]] = []
    exact_mask_root = exact_mask_bits_module_root(row_zero_module_root)
    shape_fact_root = row_zero_shape_facts_module_root(row_zero_module_root)
    bit_fact_names: dict[tuple[str, str, str], str] = {}
    shape_fact_dir = lean_out_dir.parent / "ShapeFacts"
    generator_zero_dir = lean_out_dir / "GeneratorZeros"
    for row_index, cert_path in enumerate(relaxed_certificate_paths(cert_dir)):
        cert_id, _variables, _generators, _coefficients = read_relaxed_certificate(cert_path)
        if certificate_ids is not None and cert_id not in certificate_ids:
            continue
        if (
            relaxed_certificate_payload_kind(
                cert_path, cert_module_root, shard_threshold
            )
            != "direct"
        ):
            continue
        stem = relaxed_lean_module_stem(cert_id)
        exact_pids = load_json(cert_path).get("exact_pids")
        if not isinstance(exact_pids, list) or len(exact_pids) != 1:
            raise ValueError(f"{cert_path}: expected one exact pid")
        exact_pid = str(exact_pids[0])
        exact_mask_import = (
            exact_mask_root + "." + exact_mask_bits_module_stem(exact_pid)
        )
        shape_fact_import = shape_fact_root + "." + stem
        cert_module_import = cert_module_root + "." + stem
        generator_zero_root = row_zero_generator_zero_module_root(
            row_zero_module_root,
            stem,
        )
        emitted = emit_relaxed_split_direct_row_zero_module(
            cert_path,
            lean_out_dir / f"{stem}.lean",
            cert_module_root,
            exact_mask_import,
            shape_fact_import,
            generator_zero_root,
            row_index,
        )
        rows.append(emitted)
        shape_fact_lemmas = emitted["shape_fact_lemmas"]
        if not isinstance(shape_fact_lemmas, str):
            raise ValueError(f"bad emitted shape facts for {cert_id}")
        write_row_zero_shape_facts_module(
            cert_id,
            cert_path.as_posix(),
            cert_module_import,
            shape_fact_lemmas,
            shape_fact_dir / f"{stem}.lean",
        )
        generator_lemma_texts = emitted["generator_lemma_texts"]
        if not isinstance(generator_lemma_texts, list):
            raise ValueError(f"bad emitted generator lemmas for {cert_id}")
        for index, lemma_text in enumerate(generator_lemma_texts):
            if not isinstance(lemma_text, str):
                raise ValueError(f"bad emitted generator lemma for {cert_id}")
            write_row_zero_generator_zero_module(
                cert_id,
                cert_path.as_posix(),
                exact_mask_import,
                shape_fact_import,
                cert_module_import,
                lemma_text,
                generator_zero_dir
                / stem
                / f"{row_zero_generator_zero_module_name(index)}.lean",
            )
        for fact in emitted["mask_bit_facts"]:
            if not isinstance(fact, tuple) or len(fact) != 3:
                raise ValueError(f"bad emitted mask-bit fact {fact!r}")
            exact_pid, center, label = fact
            bit_fact_names[(exact_pid, center, label)] = exact_bit_fact_name(
                exact_pid, center, label
            )
    exact_mask_dir = lean_out_dir.parent / "ExactMaskBits"
    for exact_pid in sorted({fact[0] for fact in bit_fact_names}):
        pid_facts = {
            fact: name
            for fact, name in bit_fact_names.items()
            if fact[0] == exact_pid
        }
        write_exact_mask_bits_module(
            pid_facts,
            exact_mask_dir / f"{exact_mask_bits_module_stem(exact_pid)}.lean",
        )
    if aggregate_out is not None:
        write_relaxed_split_direct_row_zero_aggregate(
            rows, aggregate_out, row_zero_module_root
        )


def relaxed_rows_by_id(census: dict[str, object]) -> dict[str, dict[str, object]]:
    rows = census.get("rows")
    if not isinstance(rows, list):
        raise ValueError("relaxed census has no rows")
    out: dict[str, dict[str, object]] = {}
    for row in rows:
        if not isinstance(row, dict):
            raise ValueError("bad relaxed row")
        rid = row.get("relaxed_id")
        if not isinstance(rid, str):
            raise ValueError("relaxed row missing relaxed_id")
        out[rid] = row
    return out


def leaf_optional_equations(
    endpoint_tool: Any,
    leaf: dict[str, object],
) -> list[dict[str, object]]:
    masks = leaf.get("common_erased_masks")
    if not isinstance(masks, dict):
        raise ValueError(f"{leaf.get('node_id')}: missing common_erased_masks")
    out: list[dict[str, object]] = []
    for center in sorted(masks, key=LABELS.index):
        payload = masks[center]
        if not isinstance(payload, dict):
            raise ValueError(f"{leaf.get('node_id')}: bad mask payload for {center}")
        members = members_from_payload(payload)
        out.extend(
            center_mask_equations(
                endpoint_tool,
                center,
                members,
                fact_id=f"leaf:{leaf.get('node_id')}:{center}",
                source="leaf_common_submask",
                optional=True,
            )
        )
    return out


def certificate_leaf_row(
    endpoint_tool: Any,
    variables0: list[str],
    relaxed_row: dict[str, object],
    case: dict[str, object],
    leaf: dict[str, object],
    path: list[dict[str, object]],
    exact_centers: frozenset[str],
    timeout_s: int,
    python_check: bool,
    minimize_optional: bool,
    out_dir: Path,
) -> dict[str, object]:
    separator_pair = case.get("separator_pair")
    if separator_pair is not None and not isinstance(separator_pair, str):
        raise ValueError(f"{case.get('case_id')}: bad separator_pair")
    variables, required, _erased_centers, _exact_rows = relaxed_case_base(
        endpoint_tool,
        variables0,
        relaxed_row,
        separator_pair,
        exact_centers,
    )
    optional = leaf_optional_equations(endpoint_tool, leaf)
    minimize_steps: list[dict[str, object]] = []
    if minimize_optional:
        kept_optional = list(optional)
        for candidate in list(optional):
            if candidate not in kept_optional:
                continue
            trial = [item for item in kept_optional if item is not candidate]
            status = probe_status(variables, required, trial, timeout_s)
            if status == "unit":
                kept_optional = trial
                minimize_steps.append(
                    {
                        "id": candidate["id"],
                        "status_without": status,
                        "decision": "drop",
                    }
                )
            else:
                minimize_steps.append(
                    {
                        "id": candidate["id"],
                        "status_without": status,
                        "decision": "keep",
                    }
                )
        optional = kept_optional
    generator_payloads = required + optional
    generators = [str(item["generator"]) for item in generator_payloads]
    cert_id = f"{case['case_id']}:{leaf['node_id']}"
    file_stem = safe_file_stem(cert_id)
    out_path = out_dir / f"{file_stem}.json"
    try:
        coefficients, singular_check = endpoint_tool.singular_witness(
            variables,
            generators,
            timeout_s,
        )
    except subprocess.TimeoutExpired:
        return {
            "certificate_id": cert_id,
            "case_id": case.get("case_id"),
            "leaf_id": leaf.get("node_id"),
            "status": "timeout",
            "timeout_s": timeout_s,
            "path": None,
            "generator_count": len(generators),
            "required_generator_count": len(required),
            "optional_generator_count": len(optional),
            "minimize_optional": minimize_optional,
            "minimize_steps": minimize_steps,
            "exact_pids": leaf.get("exact_pids"),
            "split_path": path,
        }
    if python_check:
        endpoint_tool.check_identity(variables, generators, coefficients)

    nonzero_indices = [
        index
        for index, coeff in enumerate(coefficients)
        if coefficient_string_is_nonzero(endpoint_tool, coeff)
    ]
    nonzero_optional_indices = [
        index - len(required) for index in nonzero_indices if index >= len(required)
    ]
    centers_used: set[str] = set()
    for index in nonzero_indices:
        meta = generator_payloads[index]
        if meta.get("kind") == "distance_eq":
            centers_used.add(str(meta["center"]))
    cert = {
        "schema": RELAXED_CERTIFICATE_SCHEMA,
        "certificate_id": cert_id,
        "case_id": case.get("case_id"),
        "relaxed_id": relaxed_row.get("relaxed_id"),
        "sstar": relaxed_row.get("sstar"),
        "leaf_id": leaf.get("node_id"),
        "separator_pair": separator_pair,
        "exact_pids": leaf.get("exact_pids"),
        "split_path": path,
        "variables": variables,
        "generators": generators,
        "coefficients": coefficients,
        "generator_metadata": generator_payloads,
        "common_erased_masks": leaf.get("common_erased_masks"),
        "minimize_optional": minimize_optional,
        "minimize_steps": minimize_steps,
        "checks": {
            "singular_lifted_column": singular_check == "1",
            "python_exact_polynomial": python_check,
        },
        "support": {
            "nonzero_indices": nonzero_indices,
            "nonzero_count": len(nonzero_indices),
            "nonzero_optional_indices": nonzero_optional_indices,
            "centers_used": sorted(centers_used, key=LABELS.index),
        },
    }
    out_dir.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(cert, indent=2, sort_keys=True) + "\n")
    return {
        "certificate_id": cert_id,
        "case_id": case.get("case_id"),
        "leaf_id": leaf.get("node_id"),
        "status": "ok",
        "path": str(out_path),
        "sha256": sha256_file(out_path),
        "generator_count": len(generators),
        "required_generator_count": len(required),
        "optional_generator_count": len(optional),
        "minimize_optional": minimize_optional,
        "minimize_dropped_count": sum(
            1 for step in minimize_steps if step.get("decision") == "drop"
        ),
        "nonzero_count": len(nonzero_indices),
        "centers_used": sorted(centers_used, key=LABELS.index),
        "exact_pids": leaf.get("exact_pids"),
        "split_path": path,
    }


def build_relaxed_split_certificates(
    census_path: Path,
    split_probe_path: Path,
    rvol_root: Path,
    out_dir: Path,
    timeout_s: int,
    python_check: bool,
    pids: set[str] | None,
    certificate_ids: set[str] | None,
    minimize_optional: bool,
    progress: bool,
) -> dict[str, object]:
    endpoint_tool = load_endpoint_tool()
    census = load_json(census_path)
    if census.get("schema") != RELAXED_CENSUS_SCHEMA:
        raise ValueError(f"unsupported relaxed census schema {census.get('schema')!r}")
    split_probe = load_json(split_probe_path)
    if split_probe.get("schema") != RELAXED_SPLIT_SCHEMA:
        raise ValueError(f"unsupported split probe schema {split_probe.get('schema')!r}")
    policy = split_probe.get("policy")
    if not isinstance(policy, dict):
        raise ValueError("split probe has no policy")
    exact_centers_raw = policy.get("exact_centers")
    if not isinstance(exact_centers_raw, list):
        raise ValueError("split probe policy has no exact_centers")
    exact_centers = frozenset(str(center) for center in exact_centers_raw)
    input_dir = rvol_root / "scratch" / "u2b_ssel_fragment" / "comp_g" / "inputs"
    rows_by_id = relaxed_rows_by_id(census)

    cases = split_probe.get("cases")
    if not isinstance(cases, list):
        raise ValueError("split probe has no cases")
    selected_cases = []
    for case in cases:
        if not isinstance(case, dict):
            raise ValueError("bad split case")
        exact_pids = case.get("tree", {}).get("exact_pids") if isinstance(case.get("tree"), dict) else None
        if pids is None:
            selected_cases.append(case)
        elif isinstance(exact_pids, list) and any(str(pid) in pids for pid in exact_pids):
            selected_cases.append(case)
    if not selected_cases:
        raise ValueError("no split cases selected")

    first_case = selected_cases[0]
    first_tree = first_case.get("tree")
    if not isinstance(first_tree, dict):
        raise ValueError("first split case has no tree")
    first_pids = first_tree.get("exact_pids")
    if not isinstance(first_pids, list) or not first_pids:
        raise ValueError("first split case has no exact pids")
    variables0, _generators = read_ms(endpoint_tool, input_dir / f"{first_pids[0]}.ms")

    leaf_jobs: list[tuple[dict[str, object], dict[str, object], dict[str, object], list[dict[str, object]]]] = []
    for case in selected_cases:
        tree = case.get("tree")
        if not isinstance(tree, dict):
            raise ValueError(f"{case.get('case_id')}: missing tree")
        relaxed_id = case.get("relaxed_id")
        if not isinstance(relaxed_id, str):
            raise ValueError(f"{case.get('case_id')}: missing relaxed_id")
        relaxed_row = rows_by_id[relaxed_id]
        for leaf, path in flatten_split_leaves_with_paths(tree):
            if leaf.get("status") == "unit":
                cert_id = f"{case['case_id']}:{leaf['node_id']}"
                if certificate_ids is None or cert_id in certificate_ids:
                    leaf_jobs.append((relaxed_row, case, leaf, path))
    if not leaf_jobs:
        raise ValueError("no certificate leaves selected")

    rows: list[dict[str, object]] = []
    for index, (relaxed_row, case, leaf, path) in enumerate(leaf_jobs, start=1):
        if progress:
            print(
                f"[{index}/{len(leaf_jobs)}] certifying {case['case_id']} leaf {leaf['node_id']}",
                flush=True,
            )
        rows.append(
            certificate_leaf_row(
                endpoint_tool,
                variables0,
                relaxed_row,
                case,
                leaf,
                path,
                exact_centers,
                timeout_s,
                python_check,
                minimize_optional,
                out_dir,
            )
        )

    center_usage: dict[str, int] = {center: 0 for center in LABELS}
    for row in rows:
        centers = row.get("centers_used")
        if isinstance(centers, list):
            for center in centers:
                center_usage[str(center)] += 1
    return {
        "schema": RELAXED_CERTIFICATE_CENSUS_SCHEMA,
        "support_kind": "singular_lifted_column_certificates",
        "source": {
            "relaxed_census": str(census_path),
            "relaxed_census_sha256": sha256_file(census_path),
            "split_probe": str(split_probe_path),
            "split_probe_sha256": sha256_file(split_probe_path),
            "rvol_input_dir": str(input_dir),
        },
        "policy": {
            "timeout_s": timeout_s,
            "python_check": python_check,
            "minimize_optional": minimize_optional,
            "certificate_dir": str(out_dir),
            "exact_centers": sorted(exact_centers, key=LABELS.index),
        },
        "summary": {
            "leaf_job_count": len(leaf_jobs),
            "status_counts": count_by(row["status"] for row in rows),
            "generator_count_distribution": count_by(row["generator_count"] for row in rows),
            "nonzero_count_distribution": count_by(
                row.get("nonzero_count") for row in rows if row.get("nonzero_count") is not None
            ),
            "timeout_certificate_ids": [
                row["certificate_id"] for row in rows if row["status"] == "timeout"
            ],
            "minimize_dropped_count_distribution": count_by(
                row.get("minimize_dropped_count")
                for row in rows
                if row.get("minimize_dropped_count") is not None
            ),
            "center_usage_rows": {
                center: count for center, count in center_usage.items() if count
            },
        },
        "certificates": rows,
    }


def build_relaxed_certificate_probe(
    census_path: Path,
    rvol_root: Path,
    timeout_s: int,
    pids: set[str] | None,
    greedy_max_optional: int,
    use_lift_support: bool,
    progress: bool,
) -> dict[str, object]:
    endpoint_tool = load_endpoint_tool()
    census = load_json(census_path)
    if census.get("schema") != RELAXED_CENSUS_SCHEMA:
        raise ValueError(f"unsupported relaxed census schema {census.get('schema')!r}")
    policy = census.get("policy")
    if not isinstance(policy, dict):
        raise ValueError("relaxed census has no policy")
    exact_centers_raw = policy.get("exact_centers")
    if not isinstance(exact_centers_raw, list):
        raise ValueError("relaxed census policy has no exact_centers")
    exact_centers = frozenset(str(center) for center in exact_centers_raw)
    input_dir = rvol_root / "scratch" / "u2b_ssel_fragment" / "comp_g" / "inputs"

    rows = census.get("rows")
    if not isinstance(rows, list):
        raise ValueError("relaxed census has no rows")
    selected_rows = []
    for row in rows:
        if not isinstance(row, dict):
            raise ValueError("bad relaxed row")
        exact_pids = row.get("exact_pids")
        if not isinstance(exact_pids, list):
            raise ValueError(f"{row.get('relaxed_id')}: missing exact_pids")
        if pids is None or any(str(pid) in pids for pid in exact_pids):
            selected_rows.append(row)
    if not selected_rows:
        raise ValueError("no relaxed rows selected")

    first_pid = str(selected_rows[0]["exact_pids"][0])
    variables0, _generators = read_ms(endpoint_tool, input_dir / f"{first_pid}.ms")

    cases: list[dict[str, object]] = []
    total_cases = sum(len(separator_cases_for_relaxed_row(row)) for row in selected_rows)
    case_index = 0
    for row in selected_rows:
        for separator_pair in separator_cases_for_relaxed_row(row):
            case_index += 1
            if progress:
                sep = separator_pair if separator_pair is not None else "no separator"
                print(
                    f"[{case_index}/{total_cases}] probing {row['relaxed_id']} ({sep})",
                    flush=True,
                )
            cases.append(
                relaxed_probe_case(
                    endpoint_tool,
                    variables0,
                    row,
                    separator_pair,
                    exact_centers,
                    timeout_s,
                    greedy_max_optional,
                    use_lift_support,
                )
            )

    kept_center_usage: dict[str, int] = {center: 0 for center in LABELS}
    for case in cases:
        submasks = case["required_optional_submasks"]
        assert isinstance(submasks, dict)
        for center in submasks:
            kept_center_usage[center] += 1

    return {
        "schema": RELAXED_PROBE_SCHEMA,
        "support_kind": "singular_unit_support_probe",
        "source": {
            "relaxed_census": str(census_path),
            "relaxed_census_sha256": sha256_file(census_path),
            "rvol_input_dir": str(input_dir),
        },
        "policy": {
            "timeout_s": timeout_s,
            "exact_centers": sorted(exact_centers, key=LABELS.index),
            "separator_policy": "branch by COMP-G final forced pair; C_EMPTY rows use no separator",
            "optional_fact_policy": (
                "branch-specific intersections of erased-center exact masks; "
                "each common submask contributes star equal-distance equations"
            ),
            "greedy_policy": "single deterministic deletion pass over optional equations",
            "greedy_max_optional": greedy_max_optional,
            "lift_support": use_lift_support,
        },
        "summary": {
            "relaxed_row_count": len(selected_rows),
            "probe_case_count": len(cases),
            "case_counts_by_separator": count_by(case["separator_pair"] for case in cases),
            "required_status_counts": count_by(case["required_status"] for case in cases),
            "all_optional_status_counts": count_by(case["all_optional_status"] for case in cases),
            "final_status_counts": count_by(case["final_status"] for case in cases),
            "lift_status_counts": count_by(case["lift_status"] for case in cases),
            "initial_support_source_counts": count_by(
                case["initial_support_source"] for case in cases
            ),
            "optional_equation_count_distribution": count_by(
                case["optional_equation_count"] for case in cases
            ),
            "kept_optional_equation_count_distribution": count_by(
                case["kept_optional_equation_count"] for case in cases
            ),
            "cases_unit_required_only": [
                case["case_id"] for case in cases if case["required_status"] == "unit"
            ],
            "cases_unit_after_optional": [
                case["case_id"] for case in cases if case["all_optional_status"] == "unit"
            ],
            "cases_nonunit_with_all_optional": [
                case["case_id"] for case in cases if case["all_optional_status"] == "nonunit"
            ],
            "cases_timeout_or_error": [
                case["case_id"]
                for case in cases
                if case["final_status"] not in {"unit", "nonunit"}
            ],
            "cases_greedy_skipped": [
                case["case_id"]
                for case in cases
                if case["greedy_skipped_reason"] is not None
            ],
            "kept_optional_center_usage": {
                center: count for center, count in kept_center_usage.items() if count
            },
        },
        "cases": cases,
    }


def coefficient_string_is_nonzero(endpoint_tool: Any, expr: str) -> bool:
    return endpoint_tool.normalize_poly(expr).strip() not in {"", "0"}


def support_row(
    endpoint_tool: Any,
    row: dict[str, Any],
    input_dir: Path,
    timeout_s: int,
    python_check: bool,
    allow_timeout: bool,
) -> dict[str, object]:
    pid = str(row["pid"])
    variables, generators, metadata, kind = row_system(endpoint_tool, row, input_dir)
    input_path = input_dir / f"{pid}.ms"
    try:
        coefficients, singular_check = endpoint_tool.singular_witness(
            variables,
            generators,
            timeout_s,
        )
    except subprocess.TimeoutExpired:
        if not allow_timeout:
            raise
        return {
            "pid": pid,
            "sstar": row.get("sstar"),
            "kind": kind,
            "forced_pair": row.get("comp_g", {}).get("forced_pair"),
            "input_sha256": sha256_file(input_path),
            "status": "timeout",
            "timeout_s": timeout_s,
            "generator_count": len(generators),
            "nonzero_count": None,
            "zero_count": None,
            "nonzero_indices": [],
            "centers_used": [],
            "nonuniform_centers_used": [],
            "uses_nonuniform_center": None,
            "rabinowitsch_pairs": [],
            "singular_lifted_column": False,
            "python_exact_polynomial": False,
            "nonzero_generators": [],
        }
    if python_check:
        endpoint_tool.check_identity(variables, generators, coefficients)

    nonzero_indices = [
        index
        for index, coeff in enumerate(coefficients)
        if coefficient_string_is_nonzero(endpoint_tool, coeff)
    ]
    centers_used: set[str] = set()
    nonuniform_centers_used: set[str] = set()
    rabinowitsch_pairs: list[list[str]] = []
    nonzero_generators: list[dict[str, object]] = []
    for index in nonzero_indices:
        meta = metadata[index]
        if meta.get("kind") == "distance_eq":
            center = str(meta["center"])
            centers_used.add(center)
            if center not in SAFE_EXACT_MASK_CENTERS:
                nonuniform_centers_used.add(center)
        elif meta.get("kind") == "rabinowitsch_distinct":
            pair = meta.get("pair")
            if isinstance(pair, list):
                rabinowitsch_pairs.append([str(pair[0]), str(pair[1])])
        nonzero_generators.append(
            {
                "index": index,
                "generator": generators[index],
                "classification": meta,
            }
        )

    return {
        "pid": pid,
        "sstar": row.get("sstar"),
        "kind": kind,
        "forced_pair": row.get("comp_g", {}).get("forced_pair"),
        "input_sha256": sha256_file(input_path),
        "status": "ok",
        "generator_count": len(generators),
        "nonzero_count": len(nonzero_indices),
        "zero_count": len(generators) - len(nonzero_indices),
        "nonzero_indices": nonzero_indices,
        "centers_used": sorted(centers_used, key=LABELS.index),
        "nonuniform_centers_used": sorted(nonuniform_centers_used, key=LABELS.index),
        "uses_nonuniform_center": bool(nonuniform_centers_used),
        "rabinowitsch_pairs": rabinowitsch_pairs,
        "singular_lifted_column": singular_check == "1",
        "python_exact_polynomial": python_check,
        "nonzero_generators": nonzero_generators,
    }


def count_by(items: Iterable[object]) -> dict[str, int]:
    counts = Counter(str(item) for item in items)
    return dict(sorted(counts.items()))


def build_support_census(
    bank_path: Path,
    rvol_root: Path,
    pids: set[str] | None,
    timeout_s: int,
    python_check: bool,
    allow_timeout: bool,
    progress: bool,
) -> dict[str, object]:
    endpoint_tool = load_endpoint_tool()
    bank = load_json(bank_path)
    rows = bank_rows(bank, pids)
    if not rows:
        raise ValueError("no pinned rows selected")
    input_dir = rvol_root / "scratch" / "u2b_ssel_fragment" / "comp_g" / "inputs"
    support_rows = []
    for index, row in enumerate(rows, start=1):
        if progress:
            print(f"[{index}/{len(rows)}] mining {row['pid']}", flush=True)
        support_rows.append(
            support_row(
                endpoint_tool,
                row,
                input_dir,
                timeout_s,
                python_check,
                allow_timeout,
            )
        )

    center_usage: dict[str, int] = {label: 0 for label in LABELS}
    nonuniform_rows: list[str] = []
    timeout_rows: list[str] = []
    for row in support_rows:
        if row["status"] == "timeout":
            timeout_rows.append(str(row["pid"]))
            continue
        for center in row["centers_used"]:
            center_usage[str(center)] += 1
        if row["uses_nonuniform_center"]:
            nonuniform_rows.append(str(row["pid"]))

    return {
        "schema": SCHEMA,
        "support_kind": "nonzero_lift_coefficients",
        "safe_exact_mask_centers": sorted(SAFE_EXACT_MASK_CENTERS, key=LABELS.index),
        "source": {
            "bank": str(bank_path),
            "bank_sha256": sha256_file(bank_path),
            "rvol_input_dir": str(input_dir),
        },
        "summary": {
            "row_count": len(support_rows),
            "status_counts": count_by(row["status"] for row in support_rows),
            "kind_counts": count_by(row["kind"] for row in support_rows),
            "forced_pair_counts": count_by(row["forced_pair"] for row in support_rows),
            "nonzero_count_distribution": count_by(
                row["nonzero_count"]
                for row in support_rows
                if row["nonzero_count"] is not None
            ),
            "center_usage_rows": {
                center: count for center, count in center_usage.items() if count
            },
            "rows_using_nonuniform_centers_count": len(nonuniform_rows),
            "rows_using_nonuniform_centers": nonuniform_rows,
            "timeout_rows": timeout_rows,
        },
        "rows": support_rows,
    }


def write_markdown(census: dict[str, object], out_path: Path) -> None:
    summary = census["summary"]
    assert isinstance(summary, dict)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Pinned Surplus Lift Support Census",
        "",
        "This report records which generators have nonzero coefficients in a",
        "Singular lifted-column certificate for each selected pinned surplus",
        "COMP-G row. It is a support census for the emitted certificate, not a",
        "minimal-core certificate.",
        "",
        "The exact-mask-safe centers for the current ten-label bridge are `v` and",
        "`w`. Any support at another center is recorded as nonuniform support.",
        "",
        "## Summary",
        "",
        f"- rows: {summary['row_count']}",
        f"- status counts: `{summary['status_counts']}`",
        f"- kind counts: `{summary['kind_counts']}`",
        f"- forced-pair counts: `{summary['forced_pair_counts']}`",
        f"- nonzero-count distribution: `{summary['nonzero_count_distribution']}`",
        "- rows using nonuniform centers: "
        f"{summary['rows_using_nonuniform_centers_count']}",
        f"- timeout rows: `{summary['timeout_rows']}`",
        "",
        "## Center Usage",
        "",
    ]
    center_usage = summary["center_usage_rows"]
    assert isinstance(center_usage, dict)
    for center, count in center_usage.items():
        lines.append(f"- `{center}`: {count} rows")
    lines.extend(
        [
            "",
            "## Per-Row Support",
            "",
            "| pid | kind | forced pair | nonzero generators | centers | nonuniform centers |",
            "|---|---:|---:|---:|---|---|",
        ]
    )
    rows = census["rows"]
    assert isinstance(rows, list)
    for row in rows:
        assert isinstance(row, dict)
        centers = ", ".join(f"`{center}`" for center in row["centers_used"])
        nonuniform = ", ".join(
            f"`{center}`" for center in row["nonuniform_centers_used"]
        )
        nonzero = (
            f"{row['nonzero_count']}/{row['generator_count']}"
            if row["nonzero_count"] is not None
            else f"timeout/{row['generator_count']}"
        )
        lines.append(
            f"| `{row['pid']}` | `{row['kind']}` | `{row['forced_pair']}` | "
            f"{nonzero} | "
            f"{centers or '-'} | {nonuniform or '-'} |"
        )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n")


def write_uniform_center_markdown(census: dict[str, object], out_path: Path) -> None:
    summary = census["summary"]
    test = census["test"]
    assert isinstance(summary, dict)
    assert isinstance(test, dict)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Pinned Surplus Uniform-Center Unit Test",
        "",
        "This report tests whether each pinned surplus row is already killed by",
        "the selected center equations plus the row's forced-pair separator.",
        "It is a Singular `std` unit-ideal test, not a coefficient certificate.",
        "",
        "## Summary",
        "",
        f"- centers: `{test['centers']}`",
        f"- pair policy: `{test['pair_policy']}`",
        f"- timeout seconds: {test['timeout_s']}",
        f"- rows: {summary['row_count']}",
        f"- status counts: `{summary['status_counts']}`",
        f"- unit rows: {len(summary['unit_rows'])}",
        f"- nonunit rows: {len(summary['nonunit_rows'])}",
        f"- timeout rows: `{summary['timeout_rows']}`",
        "",
        "## Per-Row Results",
        "",
        "| pid | status | selected centers | forced pair | generators |",
        "|---|---:|---|---:|---:|",
    ]
    rows = census["rows"]
    assert isinstance(rows, list)
    for row in rows:
        assert isinstance(row, dict)
        centers = ", ".join(f"`{center}`" for center in row["selected_centers"])
        lines.append(
            f"| `{row['pid']}` | `{row['status']}` | {centers or '-'} | "
            f"`{row['forced_pair']}` | {row['generator_count']} |"
        )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n")


def write_relaxed_incidence_markdown(census: dict[str, object], out_path: Path) -> None:
    summary = census["summary"]
    policy = census["policy"]
    assert isinstance(summary, dict)
    assert isinstance(policy, dict)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Pinned Surplus Relaxed Incidence Census",
        "",
        "This report projects the exact 135-row pinned surplus bank to the",
        "currently guaranteed submask vocabulary. Exact masks are kept only at",
        "the listed centers; every other center is erased to the empty submask.",
        "Each relaxed row records the exact bank rows that complete it, plus",
        "the intersection and union of their exact masks.",
        "",
        "This is an incidence projection census, not an algebraic certificate.",
        "Extra common incidences are common to the exact completions in the",
        "current bank; they are not automatically geometric facts unless a",
        "separate bridge theorem proves the exact-bank completion hypothesis.",
        "",
        "## Policy",
        "",
        f"- exact centers: `{policy['exact_centers']}`",
        f"- erased centers: `{policy['erased_centers']}`",
        "",
        "## Summary",
        "",
        f"- exact rows: {summary['exact_row_count']}",
        f"- relaxed rows: {summary['relaxed_row_count']}",
        f"- collapsed rows: {summary['collapsed_row_count']}",
        f"- exact row counts by surplus star: `{summary['exact_row_counts_by_sstar']}`",
        f"- relaxed row counts by surplus star: `{summary['relaxed_row_counts_by_sstar']}`",
        "- exact-completion count distribution: "
        f"`{summary['exact_completion_count_distribution']}`",
        f"- max exact completions for one relaxed row: {summary['max_exact_completion_count']}",
        "- relaxed rows with multiple exact completions: "
        f"{len(summary['multi_completion_relaxed_rows'])}",
        "- erased-center extra common incidence usage: "
        f"`{summary['erased_extra_common_center_usage']}`",
        "- variable center usage across completion fibers: "
        f"`{summary['variable_center_usage']}`",
        "",
        "## Relaxed Rows",
        "",
        "| relaxed id | sstar | completions | exact pids | exact centers | erased common extras | variable centers |",
        "|---|---:|---:|---|---|---|---|",
    ]
    rows = census["rows"]
    assert isinstance(rows, list)
    exact_centers = policy["exact_centers"]
    assert isinstance(exact_centers, list)
    for row in rows:
        assert isinstance(row, dict)
        relaxed_masks = row["relaxed_masks"]
        assert isinstance(relaxed_masks, dict)
        exact_bits = []
        for center in exact_centers:
            payload = relaxed_masks[center]
            assert isinstance(payload, dict)
            exact_bits.append(
                f"`{center}`={payload['mask']}({','.join(payload['members'])})"
            )
        extra = row["erased_extra_common_centers"]
        assert isinstance(extra, dict)
        extras = []
        for center, payload in extra.items():
            assert isinstance(payload, dict)
            extras.append(
                f"`{center}`={payload['mask']}({','.join(payload['members'])})"
            )
        variable = row["variable_centers"]
        assert isinstance(variable, list)
        pids = row["exact_pids"]
        assert isinstance(pids, list)
        lines.append(
            f"| `{row['relaxed_id']}` | `{row['sstar']}` | "
            f"{row['exact_completion_count']} | "
            f"{', '.join(f'`{pid}`' for pid in pids)} | "
            f"{'; '.join(exact_bits) or '-'} | "
            f"{'; '.join(extras) or '-'} | "
            f"{', '.join(f'`{center}`' for center in variable) or '-'} |"
        )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n")


def write_relaxed_probe_markdown(census: dict[str, object], out_path: Path) -> None:
    summary = census["summary"]
    policy = census["policy"]
    assert isinstance(summary, dict)
    assert isinstance(policy, dict)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Pinned Surplus Relaxed Certificate Probe",
        "",
        "This report tests the 15-row relaxed incidence projection as an",
        "algebraic support-mining problem.  Each branch keeps the exact center",
        "equations, adds the branch separator when present, and then tries",
        "branch-common erased-center submask equations as optional facts.",
        "A deterministic greedy pass deletes optional equations when Singular",
        "still reports the unit ideal.",
        "",
        "This is not a Lean certificate.  It is the proof shopping list for",
        "the geometric submask bridge and the next certificate-generation pass.",
        "",
        "## Policy",
        "",
        f"- exact centers: `{policy['exact_centers']}`",
        f"- separator policy: {policy['separator_policy']}",
        f"- optional fact policy: {policy['optional_fact_policy']}",
        f"- greedy policy: {policy['greedy_policy']}",
        f"- greedy max optional equations: {policy['greedy_max_optional']}",
        f"- lifted support enabled: {policy['lift_support']}",
        f"- timeout seconds: {policy['timeout_s']}",
        "",
        "## Summary",
        "",
        f"- relaxed rows: {summary['relaxed_row_count']}",
        f"- probe cases: {summary['probe_case_count']}",
        f"- case counts by separator: `{summary['case_counts_by_separator']}`",
        f"- required-only status counts: `{summary['required_status_counts']}`",
        f"- all-optional status counts: `{summary['all_optional_status_counts']}`",
        f"- final status counts: `{summary['final_status_counts']}`",
        f"- lift status counts: `{summary['lift_status_counts']}`",
        "- initial support source counts: "
        f"`{summary['initial_support_source_counts']}`",
        "- optional equation count distribution: "
        f"`{summary['optional_equation_count_distribution']}`",
        "- kept optional equation count distribution: "
        f"`{summary['kept_optional_equation_count_distribution']}`",
        f"- cases unit required-only: `{summary['cases_unit_required_only']}`",
        f"- cases nonunit with all optional: `{summary['cases_nonunit_with_all_optional']}`",
        f"- cases greedy skipped: `{summary['cases_greedy_skipped']}`",
        f"- timeout/error cases: `{summary['cases_timeout_or_error']}`",
        f"- kept optional center usage: `{summary['kept_optional_center_usage']}`",
        "",
        "## Probe Cases",
        "",
        "| case | completions | required | all optional | final | lift | source | optional eqs | kept eqs | kept submasks |",
        "|---|---:|---:|---:|---:|---:|---|---:|---:|---|",
    ]
    cases = census["cases"]
    assert isinstance(cases, list)
    for case in cases:
        assert isinstance(case, dict)
        submasks = case["required_optional_submasks"]
        assert isinstance(submasks, dict)
        pieces = []
        for center, payload in submasks.items():
            assert isinstance(payload, dict)
            pieces.append(
                f"`{center}`={payload['mask']}({','.join(payload['members'])})"
            )
        lines.append(
            f"| `{case['case_id']}` | {case['exact_completion_count']} | "
            f"`{case['required_status']}` | `{case['all_optional_status']}` | "
            f"`{case['final_status']}` | `{case['lift_status']}` | "
            f"`{case['initial_support_source']}` | "
            f"{case['optional_equation_count']} | "
            f"{case['kept_optional_equation_count']} | "
            f"{'; '.join(pieces) or '-'} |"
        )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n")


def write_relaxed_split_markdown(census: dict[str, object], out_path: Path) -> None:
    summary = census["summary"]
    policy = census["policy"]
    assert isinstance(summary, dict)
    assert isinstance(policy, dict)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Pinned Surplus Relaxed Split Probe",
        "",
        "This report recursively splits relaxed incidence branches by",
        "erased-center label incidences.  Each node is tested using exact",
        "`.v/.w`, the separator when present, and the erased-center submask",
        "facts common to the exact completions under that node.",
        "",
        "A leaf with status `unit` is an algebraically closed certificate target.",
        "A non-`unit` leaf means the split depth or incidence vocabulary is still",
        "too coarse.",
        "",
        "## Policy",
        "",
        f"- exact centers: `{policy['exact_centers']}`",
        f"- split policy: {policy['split_policy']}",
        f"- max depth: {policy['max_depth']}",
        f"- continue unit above completions: {policy['continue_unit_above']}",
        f"- timeout seconds: {policy['timeout_s']}",
        "",
        "## Summary",
        "",
        f"- relaxed rows: {summary['relaxed_row_count']}",
        f"- probe cases: {summary['probe_case_count']}",
        f"- leaves: {summary['leaf_count']}",
        f"- leaf status counts: `{summary['leaf_status_counts']}`",
        f"- unresolved cases: `{summary['unresolved_cases']}`",
        f"- case leaf counts: `{summary['case_leaf_counts']}`",
        "",
        "## Cases",
        "",
        "| case | completions | leaves | leaf statuses | unresolved leaves |",
        "|---|---:|---:|---|---|",
    ]
    cases = census["cases"]
    assert isinstance(cases, list)
    for case in cases:
        assert isinstance(case, dict)
        unresolved = case["unresolved_leaf_ids"]
        assert isinstance(unresolved, list)
        lines.append(
            f"| `{case['case_id']}` | {case['exact_completion_count']} | "
            f"{case['leaf_count']} | `{case['leaf_status_counts']}` | "
            f"{', '.join(f'`{leaf}`' for leaf in unresolved) or '-'} |"
        )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n")


def write_relaxed_certificate_markdown(census: dict[str, object], out_path: Path) -> None:
    summary = census["summary"]
    policy = census["policy"]
    assert isinstance(summary, dict)
    assert isinstance(policy, dict)
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Pinned Surplus Relaxed Split Certificates",
        "",
        "This report indexes Singular lifted-column Nullstellensatz witnesses",
        "for the unit leaves of the relaxed split probe.  Each certificate JSON",
        "stores variables, generators, coefficients, generator metadata, and",
        "the split path for one unit leaf.",
        "",
        "## Policy",
        "",
        f"- exact centers: `{policy['exact_centers']}`",
        f"- certificate directory: `{policy['certificate_dir']}`",
        f"- timeout seconds: {policy['timeout_s']}",
        f"- Python exact polynomial check: {policy['python_check']}",
        f"- minimize optional equations: {policy['minimize_optional']}",
        "",
        "## Summary",
        "",
        f"- leaf jobs: {summary['leaf_job_count']}",
        f"- status counts: `{summary['status_counts']}`",
        f"- generator count distribution: `{summary['generator_count_distribution']}`",
        f"- nonzero count distribution: `{summary['nonzero_count_distribution']}`",
        f"- timeout certificate ids: `{summary['timeout_certificate_ids']}`",
        "- minimize dropped count distribution: "
        f"`{summary['minimize_dropped_count_distribution']}`",
        f"- center usage rows: `{summary['center_usage_rows']}`",
        "",
        "## Certificates",
        "",
        "| certificate | status | generators | nonzero | centers | path |",
        "|---|---:|---:|---:|---|---|",
    ]
    rows = census["certificates"]
    assert isinstance(rows, list)
    for row in rows:
        assert isinstance(row, dict)
        centers = row.get("centers_used")
        center_text = (
            ", ".join(f"`{center}`" for center in centers)
            if isinstance(centers, list)
            else "-"
        )
        path = row.get("path")
        path_text = f"`{path}`" if isinstance(path, str) else "-"
        nonzero = row.get("nonzero_count")
        lines.append(
            f"| `{row['certificate_id']}` | `{row['status']}` | "
            f"{row['generator_count']} | {nonzero if nonzero is not None else '-'} | "
            f"{center_text or '-'} | {path_text} |"
        )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n")


def write_census(
    census: dict[str, object],
    json_out: Path,
    markdown_out: Path | None,
) -> None:
    json_out.parent.mkdir(parents=True, exist_ok=True)
    json_out.write_text(json.dumps(census, indent=2, sort_keys=True) + "\n")
    if markdown_out is not None:
        if census.get("schema") == "pinned_surplus_uniform_center_test.v1":
            write_uniform_center_markdown(census, markdown_out)
        elif census.get("schema") == RELAXED_CENSUS_SCHEMA:
            write_relaxed_incidence_markdown(census, markdown_out)
        elif census.get("schema") == RELAXED_PROBE_SCHEMA:
            write_relaxed_probe_markdown(census, markdown_out)
        elif census.get("schema") == RELAXED_SPLIT_SCHEMA:
            write_relaxed_split_markdown(census, markdown_out)
        elif census.get("schema") == RELAXED_CERTIFICATE_CENSUS_SCHEMA:
            write_relaxed_certificate_markdown(census, markdown_out)
        else:
            write_markdown(census, markdown_out)


def parse_args(argv: Iterable[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--bank",
        type=Path,
        default=Path("certificates/surplus/pinned_surplus_comp_g_bank.json"),
        help="Local pinned surplus bank JSON.",
    )
    parser.add_argument(
        "--rvol-root",
        type=Path,
        default=default_rvol_root(),
        help="Sibling p97-rvol checkout containing COMP-G `.ms` inputs.",
    )
    parser.add_argument("--pid", action="append", help="Restrict to one row id.")
    parser.add_argument("--timeout-s", type=int, default=120, help="Singular timeout per row.")
    parser.add_argument(
        "--python-check",
        action="store_true",
        help="Also run the exact Python polynomial identity checker.",
    )
    parser.add_argument(
        "--allow-timeout",
        action="store_true",
        help="Record per-row Singular timeouts instead of aborting the whole census.",
    )
    parser.add_argument(
        "--uniform-center-test",
        action="store_true",
        help="Test whether selected center equations plus row separator already give unit ideal.",
    )
    parser.add_argument(
        "--relaxed-incidence-census",
        action="store_true",
        help="Project exact rows to relaxed submask rows by erasing non-exact centers.",
    )
    parser.add_argument(
        "--relaxed-certificate-probe",
        action="store_true",
        help="Probe Singular unit support for relaxed incidence rows.",
    )
    parser.add_argument(
        "--relaxed-split-probe",
        action="store_true",
        help="Recursively split relaxed rows on variable erased-center incidences.",
    )
    parser.add_argument(
        "--relaxed-split-certificates",
        action="store_true",
        help="Emit Singular lifted-column certificates for relaxed split unit leaves.",
    )
    parser.add_argument(
        "--emit-relaxed-split-lean",
        type=Path,
        help="Emit a Lean checker module for one relaxed split certificate JSON.",
    )
    parser.add_argument(
        "--emit-relaxed-split-lean-term-sharded",
        type=Path,
        help="Emit a term-sharded Lean checker module for one relaxed split certificate JSON.",
    )
    parser.add_argument(
        "--emit-relaxed-split-lean-dir",
        type=Path,
        help="Emit Lean checker modules for every relaxed split certificate JSON in a directory.",
    )
    parser.add_argument(
        "--emit-relaxed-split-row-bank",
        type=Path,
        help="Emit Lean row metadata/alignment bank for relaxed split certificate JSON files in a directory.",
    )
    parser.add_argument(
        "--emit-relaxed-split-direct-row-zeros",
        type=Path,
        help="Emit Lean row-zero proofs for direct relaxed split certificate JSON files in a directory.",
    )
    parser.add_argument(
        "--emit-relaxed-split-product-row-zeros",
        type=Path,
        help="Emit Lean row-zero proofs for product-sum relaxed split certificate JSON files in a directory.",
    )
    parser.add_argument(
        "--emit-relaxed-split-bank-row-zeros",
        type=Path,
        help="Emit the Lean bank dispatcher over generated direct/product relaxed split row-zero proofs.",
    )
    parser.add_argument(
        "--relaxed-census",
        type=Path,
        default=Path("certificates/surplus/reports/pinned_surplus_relaxed_incidence_census.json"),
        help="Relaxed incidence census JSON for --relaxed-certificate-probe.",
    )
    parser.add_argument(
        "--relaxed-split-probe-in",
        type=Path,
        default=Path("certificates/surplus/reports/pinned_surplus_relaxed_split_probe.json"),
        help="Relaxed split probe JSON for --relaxed-split-certificates.",
    )
    parser.add_argument(
        "--certificate-dir",
        type=Path,
        default=Path("certificates/surplus/relaxed_split"),
        help="Output directory for emitted relaxed split certificate JSON files.",
    )
    parser.add_argument(
        "--certificate-id",
        action="append",
        help="Restrict --relaxed-split-certificates to one certificate id.",
    )
    parser.add_argument(
        "--certificate-minimize-optional",
        action="store_true",
        help="Greedily remove optional leaf equations before Singular lifted-column extraction.",
    )
    parser.add_argument("--lean-out", type=Path, help="Output path for --emit-relaxed-split-lean.")
    parser.add_argument("--lean-out-dir", type=Path, help="Output directory for --emit-relaxed-split-lean-dir.")
    parser.add_argument(
        "--lean-row-bank-out",
        type=Path,
        help="Output path for --emit-relaxed-split-row-bank.",
    )
    parser.add_argument(
        "--lean-aggregate-out",
        type=Path,
        help="Optional aggregate Lean file for --emit-relaxed-split-lean-dir.",
    )
    parser.add_argument("--lean-name", help="Lean declaration basename for --emit-relaxed-split-lean.")
    parser.add_argument(
        "--lean-shard-out-dir",
        type=Path,
        help="Shard output directory for --emit-relaxed-split-lean-term-sharded.",
    )
    parser.add_argument(
        "--lean-module-root",
        default="Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit",
        help="Module import root for generated relaxed split certificate shards.",
    )
    parser.add_argument(
        "--lean-row-zero-module-root",
        default="Erdos9796Proof.P97.SurplusCertificate.RowZeros.Direct",
        help="Module import root for generated direct relaxed split row-zero modules.",
    )
    parser.add_argument(
        "--block-size",
        type=int,
        default=100,
        help="Coefficient terms per block for --emit-relaxed-split-lean-term-sharded.",
    )
    parser.add_argument(
        "--lean-shard-threshold",
        type=int,
        default=100_000,
        help="Use term-sharded Lean emission above this source-size threshold in directory mode.",
    )
    parser.add_argument(
        "--lean-namespace-suffix",
        default="RelaxedSplit",
        help="Nested namespace for --emit-relaxed-split-lean generated declarations.",
    )
    parser.add_argument(
        "--probe-greedy-max-optional",
        type=int,
        default=8,
        help="Run deletion probing only when the initial optional support has at most this many equations.",
    )
    parser.add_argument(
        "--no-probe-lift-support",
        action="store_true",
        help="Skip Singular lifted-column support mining before greedy deletion.",
    )
    parser.add_argument(
        "--split-max-depth",
        type=int,
        default=8,
        help="Maximum recursive split depth for --relaxed-split-probe.",
    )
    parser.add_argument(
        "--split-continue-unit-above",
        type=int,
        default=10**9,
        help=(
            "Continue splitting UNIT nodes while they have more than this many "
            "exact completions. Use 1 to force singleton certificate leaves."
        ),
    )
    parser.add_argument(
        "--uniform-centers",
        default="v,w",
        help="Comma-separated center labels for --uniform-center-test.",
    )
    parser.add_argument(
        "--relaxed-centers",
        default="v,w",
        help="Comma-separated center labels whose exact masks are kept for --relaxed-incidence-census.",
    )
    parser.add_argument("--json-out", type=Path, help="JSON report output path.")
    parser.add_argument("--markdown-out", type=Path, help="Optional Markdown report output path.")
    parser.add_argument("--quiet", action="store_true", help="Suppress summary output.")
    return parser.parse_args(list(argv))


def main(argv: Iterable[str]) -> int:
    args = parse_args(argv)
    lean_modes = [
        args.emit_relaxed_split_lean,
        args.emit_relaxed_split_lean_term_sharded,
        args.emit_relaxed_split_lean_dir,
        args.emit_relaxed_split_row_bank,
        args.emit_relaxed_split_direct_row_zeros,
        args.emit_relaxed_split_product_row_zeros,
        args.emit_relaxed_split_bank_row_zeros,
    ]
    if sum(mode is not None for mode in lean_modes) > 1:
        raise SystemExit("choose only one Lean emission mode")
    if args.emit_relaxed_split_lean is not None:
        if args.lean_out is None:
            raise SystemExit("--emit-relaxed-split-lean requires --lean-out")
        emit_relaxed_split_lean_certificate(
            args.emit_relaxed_split_lean,
            args.lean_out,
            args.lean_name,
            args.lean_namespace_suffix,
        )
        if not args.quiet:
            print(f"wrote {args.lean_out}")
        return 0
    if args.emit_relaxed_split_lean_term_sharded is not None:
        if args.lean_out is None:
            raise SystemExit("--emit-relaxed-split-lean-term-sharded requires --lean-out")
        if args.lean_shard_out_dir is None:
            raise SystemExit(
                "--emit-relaxed-split-lean-term-sharded requires --lean-shard-out-dir"
            )
        emit_relaxed_split_lean_term_sharded_certificate(
            args.emit_relaxed_split_lean_term_sharded,
            args.lean_out,
            args.lean_shard_out_dir,
            args.lean_module_root,
            args.block_size,
            args.lean_name,
        )
        if not args.quiet:
            print(f"wrote term-sharded coordinator {args.lean_out}")
            print(f"wrote term shards under {args.lean_shard_out_dir}")
        return 0
    if args.emit_relaxed_split_lean_dir is not None:
        if args.lean_out_dir is None:
            raise SystemExit("--emit-relaxed-split-lean-dir requires --lean-out-dir")
        emit_relaxed_split_lean_dir(
            args.emit_relaxed_split_lean_dir,
            args.lean_out_dir,
            args.lean_aggregate_out,
            args.lean_module_root,
            args.block_size,
            args.lean_shard_threshold,
        )
        if not args.quiet:
            print(f"wrote Lean modules under {args.lean_out_dir}")
            if args.lean_aggregate_out is not None:
                print(f"wrote aggregate {args.lean_aggregate_out}")
        return 0
    if args.emit_relaxed_split_row_bank is not None:
        if args.lean_row_bank_out is None:
            raise SystemExit("--emit-relaxed-split-row-bank requires --lean-row-bank-out")
        emit_relaxed_split_row_bank(
            args.emit_relaxed_split_row_bank,
            args.lean_row_bank_out,
            args.lean_module_root,
        )
        if not args.quiet:
            print(f"wrote row bank {args.lean_row_bank_out}")
        return 0
    if args.emit_relaxed_split_direct_row_zeros is not None:
        if args.lean_out_dir is None:
            raise SystemExit(
                "--emit-relaxed-split-direct-row-zeros requires --lean-out-dir"
            )
        emit_relaxed_split_direct_row_zeros_dir(
            args.emit_relaxed_split_direct_row_zeros,
            args.lean_out_dir,
            args.lean_aggregate_out,
            args.lean_module_root,
            args.lean_row_zero_module_root,
            args.lean_shard_threshold,
            set(args.certificate_id) if args.certificate_id else None,
        )
        if not args.quiet:
            print(f"wrote direct row-zero modules under {args.lean_out_dir}")
            if args.lean_aggregate_out is not None:
                print(f"wrote direct row-zero aggregate {args.lean_aggregate_out}")
        return 0
    if args.emit_relaxed_split_product_row_zeros is not None:
        if args.lean_out_dir is None:
            raise SystemExit(
                "--emit-relaxed-split-product-row-zeros requires --lean-out-dir"
            )
        emit_relaxed_split_product_row_zeros_dir(
            args.emit_relaxed_split_product_row_zeros,
            args.lean_out_dir,
            args.lean_aggregate_out,
            args.lean_module_root,
            args.lean_row_zero_module_root,
            args.block_size,
            args.lean_shard_threshold,
            set(args.certificate_id) if args.certificate_id else None,
        )
        if not args.quiet:
            print(f"wrote product row-zero modules under {args.lean_out_dir}")
            if args.lean_aggregate_out is not None:
                print(f"wrote product row-zero aggregate {args.lean_aggregate_out}")
        return 0
    if args.emit_relaxed_split_bank_row_zeros is not None:
        if args.lean_out is None:
            raise SystemExit("--emit-relaxed-split-bank-row-zeros requires --lean-out")
        emit_relaxed_split_bank_row_zeros(
            args.emit_relaxed_split_bank_row_zeros,
            args.lean_out,
            args.lean_module_root,
            args.lean_row_zero_module_root,
            args.lean_shard_threshold,
        )
        if not args.quiet:
            print(f"wrote bank row-zero dispatcher {args.lean_out}")
        return 0
    if args.json_out is None:
        raise SystemExit("--json-out is required for report/census modes")
    pids = set(args.pid) if args.pid else None
    if args.uniform_center_test:
        centers = parse_centers(args.uniform_centers)
        census = build_uniform_center_test(
            args.bank,
            args.rvol_root,
            pids,
            args.timeout_s,
            centers,
            progress=not args.quiet,
        )
    elif args.relaxed_incidence_census:
        census = build_relaxed_incidence_census(
            args.bank,
            pids,
            parse_centers(args.relaxed_centers),
        )
    elif args.relaxed_certificate_probe:
        census = build_relaxed_certificate_probe(
            args.relaxed_census,
            args.rvol_root,
            args.timeout_s,
            pids,
            args.probe_greedy_max_optional,
            not args.no_probe_lift_support,
            progress=not args.quiet,
        )
    elif args.relaxed_split_probe:
        census = build_relaxed_split_probe(
            args.relaxed_census,
            args.rvol_root,
            args.timeout_s,
            pids,
            args.split_max_depth,
            args.split_continue_unit_above,
            progress=not args.quiet,
        )
    elif args.relaxed_split_certificates:
        census = build_relaxed_split_certificates(
            args.relaxed_census,
            args.relaxed_split_probe_in,
            args.rvol_root,
            args.certificate_dir,
            args.timeout_s,
            args.python_check,
            pids,
            set(args.certificate_id) if args.certificate_id else None,
            args.certificate_minimize_optional,
            progress=not args.quiet,
        )
    else:
        census = build_support_census(
            args.bank,
            args.rvol_root,
            pids,
            args.timeout_s,
            args.python_check,
            args.allow_timeout,
            progress=not args.quiet,
        )
    write_census(census, args.json_out, args.markdown_out)
    if not args.quiet:
        summary = census["summary"]
        print(f"wrote {args.json_out}")
        if args.markdown_out is not None:
            print(f"wrote {args.markdown_out}")
        if "row_count" in summary:
            print("rows:", summary["row_count"])
        elif "exact_row_count" in summary:
            print("exact rows:", summary["exact_row_count"])
        if "rows_using_nonuniform_centers_count" in summary:
            print("rows using nonuniform centers:", summary["rows_using_nonuniform_centers_count"])
        if "relaxed_row_count" in summary:
            print("relaxed rows:", summary["relaxed_row_count"])
            if "collapsed_row_count" in summary:
                print("collapsed rows:", summary["collapsed_row_count"])
        if "probe_case_count" in summary:
            print("probe cases:", summary["probe_case_count"])
            if "final_status_counts" in summary:
                print("final status counts:", summary["final_status_counts"])
            if "leaf_status_counts" in summary:
                print("leaf status counts:", summary["leaf_status_counts"])
        if "status_counts" in summary:
            print("status counts:", summary["status_counts"])
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
