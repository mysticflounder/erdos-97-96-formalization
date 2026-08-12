"""Faithful A-core model-completion adapter for the direct MetricRow probe.

This module deliberately probes only the metric rows justified by the A-core
source hypotheses:

* the full exact-five class ``Cl(a2, rho)``;
* the full exact-four class ``Cl(a1, r)``; and
* the selected two-point part ``I_u = Row(u) ∩ T``.

The A-core ``*.model.json`` files are complete SAT assignments, not exhaustive
leaf certificates.  In particular, RESULTS.md warns that some row-membership
bits are unconstrained and must not be treated as semantic facts.  Such rows
are therefore represented in the per-row ledger but are not sent to the
metric backend.

Every backend verdict produced here has only the scope of the named,
direct-row relaxation for one concrete equality/cap completion.  It is not a
P97 verdict, a leaf closure, or a Lean theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import re
from collections.abc import Callable, Iterable, Mapping, Sequence
from concurrent.futures import ProcessPoolExecutor
from dataclasses import asdict
from pathlib import Path
from typing import Any

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    probe_metric_rows,
)

REPO_ROOT = Path(__file__).resolve().parents[2]
A_CORE_DIR = REPO_ROOT / "census" / "frontier-packages" / "a_core"
DEFAULT_OUTPUT = (
    REPO_ROOT
    / "scratch"
    / "p97-distinct-distance-lane"
    / "a_core_metric_physical_leaves.json"
)
DEFAULT_PIQD_SERVER = "http://127.0.0.1:7272"
SOLVER_ROUTES = ("piqd", "legacy-local-z3")

SCHEMA = "p97-a-core-direct-metric-adapter-v1"
TRUST_CLASS = "TRUSTED_PYTHON_OR_Z3_COMPUTATION_NOT_KERNEL_CHECKED"
SCOPE = (
    "Named direct-row relaxation for one A-core SAT equality/cap completion; "
    "not an exhaustive A-leaf result, not P97 closure, and not Lean-checked."
)

LABELS: tuple[str, ...] = (
    "a0",
    "a1",
    "a2",
    "zd",
    "u",
    "xu",
    "v",
    "xv",
    "oth",
    "qh",
    "wh",
    "f1",
    "f2",
)
LABEL_INDEX = {label: i for i, label in enumerate(LABELS)}
TARGETS = LABELS + ("OUT",)

PHYSICAL_LEAF_BLOCKER: dict[str, str] = {
    "base+P+A2": "zd",
    "base+P+A3": "v",
    "base+P+A6": "xv",
    "base+P+A7": "xv",
    "base+P+A8": "xv",
}

_ATOM_RE = re.compile(r"^([A-Za-z0-9_]+)\(([^,()]+)(?:,([^,()]+))?\)$")


class ACoreMetricAdapterError(ValueError):
    """A fail-closed validation failure in an A-core artifact."""


class _DisjointSet:
    def __init__(self, values: Iterable[str]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: str) -> str:
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: str, right: str) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root == right_root:
            return
        if LABEL_INDEX[left_root] > LABEL_INDEX[right_root]:
            left_root, right_root = right_root, left_root
        self.parent[right_root] = left_root


def _pair(left: str, right: str) -> tuple[str, str]:
    if LABEL_INDEX[left] <= LABEL_INDEX[right]:
        return left, right
    return right, left


def _expected_eq_pairs() -> frozenset[tuple[str, str]]:
    pairs: set[tuple[str, str]] = set()
    for left in ("qh", "wh"):
        for right in ("zd", "xu", "xv", "v"):
            pairs.add(_pair(left, right))
    for left in ("f1", "f2"):
        for right in ("zd", "xu", "xv", "v", "oth", "a0", "a2"):
            pairs.add(_pair(left, right))
    for right in ("zd", "v", "xv"):
        pairs.add(_pair("oth", right))
    for left in ("a0", "a1"):
        for right in ("zd", "xu", "xv"):
            pairs.add(_pair(left, right))
    for right in ("qh", "wh"):
        pairs.add(_pair("a0", right))
    for right in ("a0", "a1"):
        pairs.add(_pair("v", right))
    return frozenset(pairs)


EXPECTED_EQ_PAIRS = _expected_eq_pairs()


def _strict_json(path: Path) -> Any:
    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ACoreMetricAdapterError(
                    f"{path}: duplicate JSON object key {key!r}"
                )
            result[key] = value
        return result

    try:
        return json.loads(path.read_text(), object_pairs_hook=reject_duplicates)
    except (OSError, json.JSONDecodeError) as exc:
        raise ACoreMetricAdapterError(f"could not read {path}: {exc}") from exc


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _parse_eq_atoms(model: Mapping[str, bool]) -> dict[tuple[str, str], bool]:
    values: dict[tuple[str, str], bool] = {}
    for atom, value in model.items():
        if not atom.startswith("eq("):
            continue
        match = _ATOM_RE.fullmatch(atom)
        if match is None or match.group(1) != "eq" or match.group(3) is None:
            raise ACoreMetricAdapterError(f"malformed equality atom {atom!r}")
        left, right = match.group(2), match.group(3)
        if left not in LABEL_INDEX or right not in LABEL_INDEX or left == right:
            raise ACoreMetricAdapterError(f"invalid equality atom {atom!r}")
        pair = _pair(left, right)
        if pair in values:
            raise ACoreMetricAdapterError(
                f"duplicate unordered equality atom for {pair}"
            )
        if not isinstance(value, bool):
            raise ACoreMetricAdapterError(f"non-Boolean value for {atom!r}")
        values[pair] = value

    actual = frozenset(values)
    if actual != EXPECTED_EQ_PAIRS:
        missing = sorted(EXPECTED_EQ_PAIRS - actual)
        unexpected = sorted(actual - EXPECTED_EQ_PAIRS)
        raise ACoreMetricAdapterError(
            "equality atom domain mismatch: "
            f"missing={missing!r}, unexpected={unexpected!r}"
        )
    return values


def _raw_quotient(
    model: Mapping[str, bool],
) -> tuple[dict[tuple[str, str], bool], dict[str, int], list[list[str]]]:
    eq_values = _parse_eq_atoms(model)
    dsu = _DisjointSet(LABELS)
    for (left, right), value in eq_values.items():
        if value:
            dsu.union(left, right)

    grouped: dict[str, list[str]] = {}
    for label in LABELS:
        grouped.setdefault(dsu.find(label), []).append(label)
    components = sorted(
        (sorted(labels, key=LABEL_INDEX.__getitem__) for labels in grouped.values()),
        key=lambda labels: LABEL_INDEX[labels[0]],
    )
    label_to_vertex = {
        label: vertex
        for vertex, labels in enumerate(components)
        for label in labels
    }
    return eq_values, label_to_vertex, components


def _validate_equivalence_closure(
    eq_values: Mapping[tuple[str, str], bool],
    label_to_vertex: Mapping[str, int],
) -> None:
    for i, left in enumerate(LABELS):
        for right in LABELS[i + 1 :]:
            same_component = label_to_vertex[left] == label_to_vertex[right]
            pair = _pair(left, right)
            encoded = eq_values.get(pair)
            if same_component and encoded is not True:
                relation = "explicitly false" if encoded is False else "baked distinct"
                raise ACoreMetricAdapterError(
                    "true equality graph is not a valid equivalence relation: "
                    f"{left} and {right} are connected but {relation}"
                )


def _atom(model: Mapping[str, bool], family: str, *args: str) -> bool:
    key = f"{family}({','.join(args)})"
    if key not in model:
        raise ACoreMetricAdapterError(f"missing required atom {key!r}")
    value = model[key]
    if not isinstance(value, bool):
        raise ACoreMetricAdapterError(f"non-Boolean value for {key!r}")
    return value


def _validate_unary_congruence(
    model: Mapping[str, bool],
    components: Sequence[Sequence[str]],
    family: str,
) -> None:
    for component in components:
        values = {_atom(model, family, label) for label in component}
        if len(values) != 1:
            raise ACoreMetricAdapterError(
                f"{family} is not equality-congruent on {list(component)!r}"
            )


def _support_vertices(
    labels: Sequence[str], label_to_vertex: Mapping[str, int]
) -> tuple[int, ...]:
    return tuple(sorted({label_to_vertex[label] for label in labels}))


def _validate_exact_class(
    *,
    model: Mapping[str, bool],
    family: str,
    canonical_support: Sequence[str],
    expected_size: int,
    center: str,
    label_to_vertex: Mapping[str, int],
    components: Sequence[Sequence[str]],
) -> tuple[int, ...]:
    _validate_unary_congruence(model, components, family)
    support = _support_vertices(canonical_support, label_to_vertex)
    if len(support) != expected_size:
        raise ACoreMetricAdapterError(
            f"{family} exact class collapsed after equality quotient: "
            f"expected {expected_size}, got {len(support)}"
        )
    if label_to_vertex[center] in support:
        raise ACoreMetricAdapterError(f"{family} exact class contains its center")
    support_set = set(support)
    for label in LABELS:
        expected = label_to_vertex[label] in support_set
        actual = _atom(model, family, label)
        if actual != expected:
            raise ACoreMetricAdapterError(
                f"{family}({label})={actual} conflicts with exact quotient support"
            )
    return support


def _forced_beta_u(model: Mapping[str, bool], run: str) -> str:
    true_targets = [target for target in TARGETS if _atom(model, "b", "u", target)]
    if len(true_targets) != 1:
        raise ACoreMetricAdapterError(
            f"expected one beta(u) target, got {true_targets!r}"
        )
    expected = PHYSICAL_LEAF_BLOCKER[run]
    if true_targets[0] != expected:
        raise ACoreMetricAdapterError(
            f"{run} requires beta(u)={expected}, model has {true_targets[0]}"
        )
    return expected


def _derive_cap_orders(
    model: Mapping[str, bool],
    label_to_vertex: Mapping[str, int],
    components: Sequence[Sequence[str]],
) -> list[tuple[int, ...]]:
    for family in ("moser", "inSig", "inO1i", "inO2i"):
        _validate_unary_congruence(model, components, family)

    anchor_vertices = {
        label_to_vertex["a0"],
        label_to_vertex["a1"],
        label_to_vertex["a2"],
    }
    if len(anchor_vertices) != 3:
        raise ACoreMetricAdapterError("Moser anchors collapse in the quotient")

    fibers: dict[str, list[int]] = {"inO2i": [], "inSig": [], "inO1i": []}
    for vertex, component in enumerate(components):
        representative = component[0]
        is_anchor = vertex in anchor_vertices
        if _atom(model, "moser", representative) != is_anchor:
            raise ACoreMetricAdapterError(
                f"moser membership inconsistent on quotient class {component!r}"
            )
        cap_memberships = [
            family
            for family in ("inO2i", "inSig", "inO1i")
            if _atom(model, family, representative)
        ]
        if is_anchor:
            if cap_memberships:
                raise ACoreMetricAdapterError(
                    f"Moser class {component!r} also belongs to a cap"
                )
        elif len(cap_memberships) != 1:
            raise ACoreMetricAdapterError(
                f"non-Moser class {component!r} has cap memberships "
                f"{cap_memberships!r}"
            )
        else:
            fibers[cap_memberships[0]].append(vertex)

    orders: list[tuple[int, ...]] = []
    for o2 in itertools.permutations(fibers["inO2i"]):
        for sig in itertools.permutations(fibers["inSig"]):
            for o1 in itertools.permutations(fibers["inO1i"]):
                orders.append(
                    (
                        label_to_vertex["a0"],
                        *o2,
                        label_to_vertex["a1"],
                        *sig,
                        label_to_vertex["a2"],
                        *o1,
                    )
                )
    if not orders:
        raise ACoreMetricAdapterError("cap-order enumeration unexpectedly empty")
    expected_vertices = tuple(range(len(components)))
    for order in orders:
        if tuple(sorted(order)) != expected_vertices:
            raise ACoreMetricAdapterError(
                f"derived order is not a vertex permutation: {order!r}"
            )
    return orders


def _encoded_ledger(
    row_id: str,
    row: MetricRow,
    provenance: Sequence[str],
    exactness_basis: str,
) -> dict[str, Any]:
    return {
        "row_id": row_id,
        "disposition": "ENCODED",
        "metric_row": asdict(row),
        "provenance": list(provenance),
        "exactness_basis": exactness_basis,
    }


def _omitted_ledger(
    row_id: str,
    reason: str,
    provenance: Sequence[str],
    **details: Any,
) -> dict[str, Any]:
    return {
        "row_id": row_id,
        "disposition": "OMITTED_FAIL_CLOSED",
        "reason": reason,
        "provenance": list(provenance),
        **details,
    }


def _build_projection(run: str, model: Mapping[str, bool]) -> dict[str, Any]:
    if run not in PHYSICAL_LEAF_BLOCKER:
        raise ACoreMetricAdapterError(f"unsupported physical A leaf {run!r}")
    if any(not isinstance(key, str) for key in model):
        raise ACoreMetricAdapterError("model keys must be strings")
    if any(not isinstance(value, bool) for value in model.values()):
        raise ACoreMetricAdapterError("every model value must be Boolean")

    eq_values, label_to_vertex, components = _raw_quotient(model)

    # Check exact-five collapse before the general equivalence audit so a
    # malformed assignment that identifies two shell points fails with the
    # most load-bearing diagnostic.
    t_support = _validate_exact_class(
        model=model,
        family="inT",
        canonical_support=("zd", "u", "xu", "v", "xv"),
        expected_size=5,
        center="a2",
        label_to_vertex=label_to_vertex,
        components=components,
    )
    _validate_equivalence_closure(eq_values, label_to_vertex)
    cl1_support = _validate_exact_class(
        model=model,
        family="cl1",
        canonical_support=("qh", "wh", "f1", "f2"),
        expected_size=4,
        center="a1",
        label_to_vertex=label_to_vertex,
        components=components,
    )

    beta_u = _forced_beta_u(model, run)
    selected_u_support = _support_vertices(("u", "xu"), label_to_vertex)
    if len(selected_u_support) != 2:
        raise ACoreMetricAdapterError("the selected I_u pair collapsed")
    beta_u_vertex = label_to_vertex[beta_u]
    if beta_u_vertex in selected_u_support:
        raise ACoreMetricAdapterError("beta(u) lies in its selected row support")

    rows = [
        MetricRow(
            center=label_to_vertex["a2"],
            support=t_support,
            exact=True,
        ),
        MetricRow(
            center=label_to_vertex["a1"],
            support=cl1_support,
            exact=True,
        ),
        MetricRow(
            center=beta_u_vertex,
            support=selected_u_support,
            exact=False,
        ),
    ]
    ledger = [
        _encoded_ledger(
            "T_full_exact_five",
            rows[0],
            ("A-CORE-ENCODING-SPEC B9", "A-CORE-ENCODING-SPEC G1"),
            "Entire ambient radius class Cl(a2,rho), cardinality exactly five.",
        ),
        _encoded_ledger(
            "cl1_full_exact_four",
            rows[1],
            ("A-CORE-ENCODING-SPEC E4",),
            "Entire ambient radius class Cl(a1,r), cardinality exactly four.",
        ),
        _encoded_ledger(
            "I_u_selected_projection",
            rows[2],
            (
                "A-CORE-ENCODING-SPEC Rows units",
                "A-CORE-ENCODING-SPEC G1 and Remark",
                f"A-CORE physical leaf {run}: beta(u)={beta_u}",
            ),
            (
                "Only the selected pair Row(u) intersect T is encoded; exact=False "
                "because this is not the whole radius class."
            ),
        ),
        _omitted_ledger(
            "row_u_full_exact_four",
            (
                "The source fixes u and xu in the full row, but the artifacts do "
                "not identify the other two support points semantically. Raw "
                "row_u model bits may be unconstrained solver completions."
            ),
            (
                "A-CORE-ENCODING-SPEC Rows units and R1",
                "RESULTS.md model-reading warning",
            ),
            missing_bridge="A provenance-bearing support completion for Row(u).",
        ),
        _omitted_ledger(
            "row_v_full_exact_four",
            (
                "The source fixes v and xv, but neither beta(v) nor the other two "
                "support identities is fixed by the physical A leaf."
            ),
            (
                "A-CORE-ENCODING-SPEC Rows units and R1",
                "RESULTS.md model-reading warning",
            ),
            missing_bridge=(
                "A provenance-bearing beta(v) choice and support completion for "
                "Row(v)."
            ),
        ),
        _omitted_ledger(
            "I_v_selected_projection",
            "The selected pair is known, but its center beta(v) is not leaf-fixed.",
            ("A-CORE-ENCODING-SPEC G1",),
            missing_bridge="A provenance-bearing named beta(v) target.",
        ),
        _omitted_ledger(
            "critical_double_bs1",
            "The SAT completion does not prove a named positive support projection.",
            ("A-CORE-ENCODING-SPEC J5", "RESULTS.md model-reading warning"),
            exact_if_encoded=False,
        ),
        _omitted_ledger(
            "critical_double_bs2",
            "The SAT completion does not prove a named positive support projection.",
            ("A-CORE-ENCODING-SPEC J5", "RESULTS.md model-reading warning"),
            exact_if_encoded=False,
        ),
        _omitted_ledger(
            "critical_double_bt1",
            "The SAT completion does not prove a named positive support projection.",
            ("A-CORE-ENCODING-SPEC J6", "RESULTS.md model-reading warning"),
            exact_if_encoded=False,
        ),
        _omitted_ledger(
            "critical_double_bt2",
            "The SAT completion does not prove a named positive support projection.",
            ("A-CORE-ENCODING-SPEC J6", "RESULTS.md model-reading warning"),
            exact_if_encoded=False,
        ),
        _omitted_ledger(
            "f_chain_class_1",
            (
                "The theorem permits three fresh anonymous support slots because "
                "the full class has cardinality four, but the artifact supplies "
                "no cap membership/order for those points."
            ),
            ("A-CORE-ENCODING-SPEC N8", "A-CORE-ENCODING-SPEC FB"),
            anonymous_slots_required=3,
            anonymous_slot_distinctness=(
                "Slots would be pairwise distinct within this class and disjoint "
                "from T and the other F-chain class."
            ),
            missing_bridge="Cap placement/order for the anonymous support points.",
        ),
        _omitted_ledger(
            "f_chain_class_2",
            (
                "The theorem permits three fresh anonymous support slots because "
                "the full class has cardinality four, but the artifact supplies "
                "no cap membership/order for those points."
            ),
            ("A-CORE-ENCODING-SPEC N8", "A-CORE-ENCODING-SPEC FB"),
            anonymous_slots_required=3,
            anonymous_slot_distinctness=(
                "Slots would be pairwise distinct within this class and disjoint "
                "from T and the other F-chain class."
            ),
            missing_bridge="Cap placement/order for the anonymous support points.",
        ),
    ]

    orders = _derive_cap_orders(model, label_to_vertex, components)
    return {
        "status": "READY_NAMED_PROJECTION",
        "fail_closed": False,
        "run": run,
        "n_vertices": len(components),
        "quotient_classes": components,
        "label_to_vertex": label_to_vertex,
        "metric_rows": [asdict(row) for row in rows],
        "row_ledger": ledger,
        "orders": [list(order) for order in orders],
        "scope": SCOPE,
        "complete_for_p97": False,
    }


def adapt_physical_cube(run: str, model: Mapping[str, bool]) -> dict[str, Any]:
    """Adapt one complete A-core SAT assignment, rejecting malformed data."""

    try:
        return _build_projection(run, model)
    except (ACoreMetricAdapterError, KeyError, TypeError, ValueError) as exc:
        return {
            "status": "REJECTED",
            "fail_closed": True,
            "run": run,
            "error": str(exc),
            "scope": SCOPE,
            "complete_for_p97": False,
        }


def load_current_physical_cubes(
    a_core_dir: Path = A_CORE_DIR,
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    manifest_path = a_core_dir / "out" / "manifest.json"
    manifest = _strict_json(manifest_path)
    if not isinstance(manifest, list):
        raise ACoreMetricAdapterError("A-core manifest must be a JSON array")
    by_run = {
        record.get("run"): record
        for record in manifest
        if isinstance(record, dict) and isinstance(record.get("run"), str)
    }

    cubes: list[dict[str, Any]] = []
    for run in PHYSICAL_LEAF_BLOCKER:
        record = by_run.get(run)
        if record is None:
            raise ACoreMetricAdapterError(f"manifest lacks physical leaf {run}")
        if record.get("verdict") != "SAT":
            raise ACoreMetricAdapterError(
                f"{run} manifest verdict is {record.get('verdict')!r}, not SAT"
            )
        relative_model_path = record.get("model_file")
        if not isinstance(relative_model_path, str):
            raise ACoreMetricAdapterError(f"{run} lacks a model_file path")
        model_path = a_core_dir / relative_model_path
        model = _strict_json(model_path)
        if not isinstance(model, dict):
            raise ACoreMetricAdapterError(f"{model_path} is not a JSON object")
        if any(not isinstance(key, str) for key in model):
            raise ACoreMetricAdapterError(f"{model_path} has a non-string atom")
        if any(not isinstance(value, bool) for value in model.values()):
            raise ACoreMetricAdapterError(f"{model_path} has a non-Boolean value")
        true_atoms = sorted(key for key, value in model.items() if value)
        if true_atoms != sorted(record.get("model_true_atoms", [])):
            raise ACoreMetricAdapterError(
                f"{run} model truth assignment disagrees with manifest"
            )
        if _atom(model, "row_u", "qh") and _atom(model, "row_u", "wh"):
            raise ACoreMetricAdapterError(
                f"{run} model completion violates the current physical C10 clause"
            )
        cubes.append(
            {
                "run": run,
                "model": model,
                "model_path": str(model_path.relative_to(REPO_ROOT)),
                "model_sha256": _sha256(model_path),
                "manifest_record": record,
            }
        )

    provenance = {
        "manifest_path": str(manifest_path.relative_to(REPO_ROOT)),
        "manifest_sha256": _sha256(manifest_path),
        "spec_path": str(
            (a_core_dir.parent / "A-CORE-ENCODING-SPEC.md").relative_to(REPO_ROOT)
        ),
        "spec_sha256": _sha256(a_core_dir.parent / "A-CORE-ENCODING-SPEC.md"),
        "results_path": str((a_core_dir / "RESULTS.md").relative_to(REPO_ROOT)),
        "results_sha256": _sha256(a_core_dir / "RESULTS.md"),
        "model_reuse_note": (
            "Pinned manifest/model files are used only as concrete SAT "
            "completions. The driver independently checks the current C10 "
            "clause; it does not claim the files were regenerated by the "
            "current encoder."
        ),
    }
    return cubes, provenance


def _probe_task(task: Mapping[str, Any]) -> dict[str, Any]:
    rows = tuple(MetricRow(**row) for row in task["metric_rows"])
    result = probe_metric_rows(
        task["n_vertices"],
        rows,
        order=task["order"],
        timeout_s=task["timeout_s"],
        backend="legacy-local-z3",
    )
    return _summarize_probe_result(task, result)


def _summarize_probe_result(
    task: Mapping[str, Any], result: Mapping[str, Any]
) -> dict[str, Any]:
    serialized = json.dumps(result, sort_keys=True, separators=(",", ":"))
    stages = [
        {
            key: stage.get(key)
            for key in ("stage", "status", "elapsed_sec", "reason")
            if stage.get(key) is not None
        }
        for stage in result.get("stages", [])
        if isinstance(stage, Mapping)
    ]
    return {
        "run": task["run"],
        "order_index": task["order_index"],
        "order": list(task["order"]),
        "status": result.get("status", "ERROR"),
        "backend_status": result.get("backend_status"),
        "decisive_stage": result.get("decisive_stage"),
        "fail_closed": result.get("fail_closed", True),
        "verification": result.get("verification"),
        "diagnostic": result.get("diagnostic"),
        "stages": stages,
        "raw_result_sha256": hashlib.sha256(serialized.encode()).hexdigest(),
    }


def _run_tasks(
    tasks: Sequence[dict[str, Any]],
    *,
    workers: int,
    probe_runner: Callable[[Mapping[str, Any]], dict[str, Any]] | None = None,
) -> list[dict[str, Any]]:
    if not tasks:
        return []
    if workers < 1 or workers > 24:
        raise ACoreMetricAdapterError("workers must lie in [1, 24]")
    if probe_runner is not None:
        return [probe_runner(task) for task in tasks]
    if workers == 1:
        return [_probe_task(task) for task in tasks]
    with ProcessPoolExecutor(max_workers=min(workers, len(tasks))) as executor:
        return list(executor.map(_probe_task, tasks))


def _piqd_task_result(result: Mapping[str, Any]) -> dict[str, Any]:
    status = result.get("status")
    if status not in {"SAT", "UNSAT", "UNKNOWN"}:
        status = "ERROR"
    stages = [
        {
            key: stage.get(key)
            for key in (
                "stage",
                "status",
                "effective_status",
                "classification",
            )
        }
        for stage in result.get("stages", [])
        if isinstance(stage, Mapping)
    ]
    diagnostic = (
        "SAT_EXACT_RATIONAL_REPLAYED_ROW_LEVEL_DIAGNOSTIC"
        if status == "SAT"
        else (
            "Z3_UNSAT_DIAGNOSTIC_NOT_PROOF_CHECKED"
            if status == "UNSAT"
            else "UNKNOWN_OR_INCONCLUSIVE_NO_VERDICT"
        )
    )
    serialized = json.dumps(result, sort_keys=True, separators=(",", ":"))
    return {
        "run": result["run"],
        "order_index": result["order_index"],
        "order": list(result["order"]),
        "status": status,
        "backend_status": stages[-1]["status"] if stages else None,
        "decisive_stage": result.get("decisive_stage"),
        "fail_closed": status not in {"SAT", "UNSAT"},
        "verification": result.get("verification"),
        "diagnostic": diagnostic,
        "stages": stages,
        "raw_result_sha256": hashlib.sha256(serialized.encode()).hexdigest(),
    }


def _run_piqd_tasks(
    tasks: Sequence[dict[str, Any]],
    *,
    adaptations: Mapping[str, Mapping[str, Any]],
    a_core_dir: Path,
    timeout_s: float,
    transport: Any,
    output_directory: Path,
) -> list[dict[str, Any]]:
    """Run selected A-core orders sequentially, without a local fallback."""

    from census.p97_search import a_core_metric_piqd as piqd

    bindings = piqd.capture_sources(a_core_dir)
    by_run = {binding.run: binding for binding in bindings}
    for run, adaptation in adaptations.items():
        binding = by_run.get(run)
        if binding is None or binding.adaptation != adaptation:
            raise ACoreMetricAdapterError("PIQD A-core binding crossed ingress replay")
    piqd.create_output_root(output_directory)
    run_roots: dict[str, Path] = {}
    results: list[dict[str, Any]] = []
    for task in tasks:
        run = task["run"]
        binding = by_run[run]
        run_root = run_roots.get(run)
        if run_root is None:
            run_root = output_directory / run.replace("+", "-")
            run_root.mkdir(mode=0o700)
            run_roots[run] = run_root
        result = piqd.run_staged_order(
            binding,
            task["order_index"],
            timeout_s=timeout_s,
            transport=transport,
            output_directory=run_root / f"order-{task['order_index']:05d}",
        )
        results.append(_piqd_task_result(result))
    return results


def _aggregate_status(results: Sequence[Mapping[str, Any]]) -> str:
    statuses = [result.get("status") for result in results]
    if "SAT" in statuses:
        return "SAT"
    if statuses and all(status == "UNSAT" for status in statuses):
        return "UNSAT"
    return "UNKNOWN"


def run_current_physical_leaves(
    *,
    output_path: Path = DEFAULT_OUTPUT,
    workers: int = 1,
    timeout_s: float = 2.0,
    a_core_dir: Path = A_CORE_DIR,
    solver_route: str = "piqd",
    piqd_transport: Any | None = None,
    piqd_server: str = DEFAULT_PIQD_SERVER,
    piqd_output_directory: Path | None = None,
    run: str | None = None,
    order_index: int | None = None,
    probe_runner: Callable[[Mapping[str, Any]], dict[str, Any]] | None = None,
) -> dict[str, Any]:
    if type(output_path) is not type(Path()):
        raise ACoreMetricAdapterError("output_path must be an exact platform Path")
    if type(a_core_dir) is not type(Path()):
        raise ACoreMetricAdapterError("a_core_dir must be an exact platform Path")
    if type(solver_route) is not str or solver_route not in SOLVER_ROUTES:
        raise ACoreMetricAdapterError("unknown metric solver route")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s <= 0
    ):
        raise ACoreMetricAdapterError("timeout_s must be positive")
    if type(workers) is not int or not 1 <= workers <= 24:
        raise ACoreMetricAdapterError("workers must lie in [1, 24]")
    if (run is None) != (order_index is None):
        raise ACoreMetricAdapterError("run and order_index must be supplied together")
    if run is not None and run not in PHYSICAL_LEAF_BLOCKER:
        raise ACoreMetricAdapterError("selected run is not a physical A-core leaf")
    if order_index is not None and (type(order_index) is not int or order_index < 0):
        raise ACoreMetricAdapterError("order_index must be nonnegative")
    injected_test_route = probe_runner is not None
    if solver_route == "piqd" and workers != 1:
        raise ACoreMetricAdapterError("PIQD metric route requires workers=1")
    if injected_test_route and workers != 1:
        raise ACoreMetricAdapterError("custom probe runner requires workers=1")
    if output_path.exists():
        raise ACoreMetricAdapterError(f"refusing to overwrite output: {output_path}")
    selected_piqd_output = piqd_output_directory
    if solver_route == "piqd" and not injected_test_route:
        if selected_piqd_output is None:
            selected_piqd_output = Path(f"{output_path}.piqd")
        if type(selected_piqd_output) is not type(Path()):
            raise ACoreMetricAdapterError(
                "piqd_output_directory must be an exact platform Path"
            )
        if selected_piqd_output.exists():
            raise ACoreMetricAdapterError(
                f"refusing to overwrite PIQD custody root: {selected_piqd_output}"
            )
    cubes, provenance = load_current_physical_cubes(a_core_dir)
    adaptations: list[dict[str, Any]] = []
    authenticated_adaptations: dict[str, dict[str, Any]] = {}
    tasks: list[dict[str, Any]] = []
    for cube in cubes:
        adaptation = adapt_physical_cube(cube["run"], cube["model"])
        if run is not None and cube["run"] != run:
            continue
        authenticated_adaptations[cube["run"]] = dict(adaptation)
        adaptation["source_model"] = cube["model_path"]
        adaptation["source_model_sha256"] = cube["model_sha256"]
        adaptations.append(adaptation)
        if adaptation["status"] != "READY_NAMED_PROJECTION":
            continue
        for task_order_index, order in enumerate(adaptation["orders"]):
            if run is not None and task_order_index != order_index:
                continue
            tasks.append(
                {
                    "run": cube["run"],
                    "order_index": task_order_index,
                    "order": order,
                    "n_vertices": adaptation["n_vertices"],
                    "metric_rows": adaptation["metric_rows"],
                    "timeout_s": timeout_s,
                }
            )

    if run is not None and not tasks:
        raise ACoreMetricAdapterError("selected order_index is out of range")
    if solver_route == "piqd" and not injected_test_route:
        from census.p97_search import phase3_piqd_smt_source_adapter as neutral

        transport = piqd_transport
        if transport is None:
            if run is None:
                transport = neutral.UrllibPiqdTransport(piqd_server)
            else:
                transport = neutral.UrllibPiqdTransport(
                    piqd_server,
                    http_timeout_s=neutral.bounded_solve_http_timeout_s(
                        max(1, int(float(timeout_s) * 1000))
                    ),
                )
        if selected_piqd_output is None:
            raise ACoreMetricAdapterError("PIQD custody root was not selected")
        probe_results = _run_piqd_tasks(
            tasks,
            adaptations=authenticated_adaptations,
            a_core_dir=a_core_dir,
            timeout_s=float(timeout_s),
            transport=transport,
            output_directory=selected_piqd_output,
        )
        effective_route = "piqd-z3-qfnra"
    else:
        probe_results = _run_tasks(
            tasks, workers=workers, probe_runner=probe_runner
        )
        effective_route = (
            "injected-test-runner" if injected_test_route else "legacy-local-z3"
        )
    stage_status_counts: dict[str, int] = {}
    for result in probe_results:
        for stage in result.get("stages", []):
            key = f"{stage.get('stage')}:{stage.get('status')}"
            stage_status_counts[key] = stage_status_counts.get(key, 0) + 1
    results_by_run: dict[str, list[dict[str, Any]]] = {
        run: [] for run in PHYSICAL_LEAF_BLOCKER
    }
    for result in probe_results:
        results_by_run[result["run"]].append(result)

    leaves: list[dict[str, Any]] = []
    total_counts = {"SAT": 0, "UNSAT": 0, "UNKNOWN": 0, "ERROR": 0}
    for adaptation in adaptations:
        run_results = results_by_run[adaptation["run"]]
        for result in run_results:
            status = result["status"]
            key = status if status in total_counts else "ERROR"
            total_counts[key] += 1
        leaf = dict(adaptation)
        leaf.pop("orders", None)
        leaf["order_count"] = len(run_results)
        leaf["direct_row_status"] = (
            _aggregate_status(run_results) if run_results else "ERROR"
        )
        leaf["order_results"] = run_results
        leaves.append(leaf)

    artifact = {
        "schema": SCHEMA,
        "trust_class": TRUST_CLASS,
        "scope": SCOPE,
        "parameters": {
            "workers": workers,
            "timeout_s": timeout_s,
            "solver_route": effective_route,
            "requested_solver_route": solver_route,
            "legacy_local_z3_explicit": solver_route == "legacy-local-z3",
            "local_fallback": False,
            "proof_blueprint": {
                "session_id": "019fdf9c",
                "state": "OPEN",
                "relation": "OFF_SPINE",
                "changed": False,
            },
        },
        "source_provenance": provenance,
        "totals": {
            "physical_leaves": len(leaves),
            "probe_orders": len(probe_results),
            "status_counts": total_counts,
            "stage_status_counts": dict(sorted(stage_status_counts.items())),
        },
        "interpretation": {
            "SAT": "One named direct-row order was realized for this completion.",
            "UNSAT": (
                "All enumerated cap-compatible orders were excluded only for the "
                "encoded named direct-row projection of this completion."
            ),
            "UNKNOWN": "The named direct-row projection was not decided.",
            "ERROR": "The adapter or backend failed closed; no metric verdict.",
            "not_claimed": (
                "No result is an exhaustive A-leaf classification, P97 closure, "
                "or kernel-checked theorem."
            ),
        },
        "global_missing_bridge": (
            "A provenance-bearing physical-cube interface must distinguish "
            "source-forced incidence facts from arbitrary SAT completion bits and "
            "supply complete row supports (plus cap order for anonymous points) "
            "before omitted rows can be added faithfully."
        ),
        "leaves": leaves,
    }
    if selected_piqd_output is not None and effective_route == "piqd-z3-qfnra":
        artifact["parameters"]["piqd_output_directory"] = str(
            selected_piqd_output
        )
    if run is not None:
        artifact["parameters"]["selection"] = {
            "run": run,
            "order_index": order_index,
            "authenticated_physical_leaf_count": len(cubes),
        }
    output_path.parent.mkdir(parents=True, exist_ok=True)
    payload = json.dumps(artifact, sort_keys=True, separators=(",", ":")) + "\n"
    with output_path.open("x", encoding="utf-8") as handle:
        handle.write(payload)
    return artifact


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--timeout-s", type=float, default=2.0)
    parser.add_argument(
        "--solver-route",
        choices=SOLVER_ROUTES,
        default="piqd",
        help="production PIQD route (default) or explicit legacy local Z3",
    )
    parser.add_argument("--piqd-server", default=DEFAULT_PIQD_SERVER)
    parser.add_argument("--piqd-output-directory", type=Path)
    parser.add_argument("--run", choices=tuple(PHYSICAL_LEAF_BLOCKER))
    parser.add_argument("--order-index", type=int)
    args = parser.parse_args(argv)
    artifact = run_current_physical_leaves(
        output_path=args.output,
        workers=args.workers,
        timeout_s=args.timeout_s,
        solver_route=args.solver_route,
        piqd_server=args.piqd_server,
        piqd_output_directory=args.piqd_output_directory,
        run=args.run,
        order_index=args.order_index,
    )
    print(
        json.dumps(
            {
                "output": str(args.output),
                "leaves": artifact["totals"]["physical_leaves"],
                "orders": artifact["totals"]["probe_orders"],
                "status_counts": artifact["totals"]["status_counts"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
