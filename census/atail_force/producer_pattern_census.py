#!/usr/bin/env python3
"""Bounded cvc5 pattern census for the ATAIL geometry producer.

Exactly eight deterministic, target-negating, theorem-bank-clean assignments
are selected per surviving cap profile.  Each receives one cvc5 QF_NRA query
with a three-second limit and no retry.  Named UNSAT cores are normalized to
cap-role shapes so recurring patterns can be proposed for Lean generalization.

All solver outcomes are discovery evidence.  In particular, neither an UNSAT
core nor a recurring normalized shape is a Lean proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from dataclasses import dataclass
from itertools import product
from pathlib import Path
import re
import tempfile
import time
from typing import Any, Callable, Iterable, Mapping

from census.atail_force import producer_bank as bank
from census.atail_force import producer_geometry as geometry
from census.atail_force import producer_surface as surface


SCHEMA = "p97_atail_force_producer_pattern_census.v1"
HERE = Path(__file__).resolve().parent
DEFAULT_CHECKPOINT = HERE / "producer_pattern_census_checkpoint.json"
ASSIGNMENTS_PER_CASE = 8
CVC5_TIMEOUT_SECONDS = 3.0
TOTAL_QUERY_BUDGET = ASSIGNMENTS_PER_CASE * len(surface.PRODUCER_CASES)


class PatternCensusError(ValueError):
    """The bounded census or its stored checkpoint violates its contract."""


@dataclass(frozen=True)
class SelectedAssignment:
    assignment_id: str
    case: surface.ProducerCase
    assignment: surface.ApexClassAssignment
    order: tuple[int, ...]
    system: geometry.GeometrySystem
    input_sha256: str


Runner = Callable[[geometry.GeometrySystem, Iterable[str] | None], Mapping[str, Any]]


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise PatternCensusError(message)


def _digest_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def _json_digest(value: Any) -> str:
    return _digest_text(json.dumps(value, sort_keys=True, separators=(",", ":")))


def _canonical(value: Any) -> str:
    return json.dumps(value, sort_keys=True, indent=2) + "\n"


def _write_atomic(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def _assignment_rows(
    assignment: surface.ApexClassAssignment,
) -> tuple[bank.MetricRow, bank.MetricRow]:
    """Full exact apex classes, not truncated selected-four witnesses."""

    return (
        bank.MetricRow(
            assignment.opp_apex1_exact.center,
            assignment.opp_apex1_exact.support,
            exact=True,
        ),
        bank.MetricRow(
            assignment.opp_apex2_exact.center,
            assignment.opp_apex2_exact.support,
            exact=True,
        ),
    )


def _canonical_assignment(
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> surface.ApexClassAssignment:
    return surface.ApexClassAssignment(
        opp_apex1_exact=first,
        opp_apex2_exact=second,
        opp_apex1_selected_four=next(surface.iter_selected_four_witnesses(first)),
        opp_apex2_selected_four=next(surface.iter_selected_four_witnesses(second)),
    )


def select_assignments(
    case: surface.ProducerCase,
    *,
    count: int = ASSIGNMENTS_PER_CASE,
) -> tuple[SelectedAssignment, ...]:
    """Select the first deterministic target-negating bank-clean assignments."""

    _require(0 < count <= ASSIGNMENTS_PER_CASE, "assignment count exceeds fixed budget")
    selected: list[SelectedAssignment] = []
    first_classes = surface.iter_exact_apex_classes(case, "opp_apex1")
    # Materializing the smaller second-apex list avoids restarting its generator.
    second_classes = tuple(surface.iter_exact_apex_classes(case, "opp_apex2"))
    for first, second in product(first_classes, second_classes):
        assignment = _canonical_assignment(first, second)
        if not surface.no_shared_off_surplus_pair(case, assignment):
            continue
        blueprint = geometry.blueprint_from_surface(case, assignment)
        order = tuple(int(label) for label in blueprint.cyclic_order)
        bank_matches = bank.scan_all_formalized_cores(
            _assignment_rows(assignment), case.cardinality, order
        )
        if bank_matches:
            continue
        system = geometry.build_geometry_system(blueprint)
        smt2 = geometry.build_cvc5_smt2(system)
        selected.append(
            SelectedAssignment(
                assignment_id=f"{case.case_id}_a{len(selected):02d}",
                case=case,
                assignment=assignment,
                order=order,
                system=system,
                input_sha256=_digest_text(smt2),
            )
        )
        if len(selected) == count:
            break
    _require(len(selected) == count, f"{case.case_id}: found only {len(selected)} assignments")
    return tuple(selected)


_CORE_SYMBOL = re.compile(r"\|([^|]*)\||([^\s()]+)")


def parse_named_unsat_core(
    stdout: str,
    known_names: Iterable[str],
) -> tuple[str, ...]:
    """Parse cvc5's named-core S-expression and reject foreign names."""

    lines = [line.strip() for line in stdout.splitlines() if line.strip()]
    _require(lines and lines[0] == "unsat", "cvc5 output does not begin with unsat")
    payload = " ".join(lines[1:])
    _require(payload.startswith("(") and payload.endswith(")"), "missing core S-expression")
    # Atom names intentionally contain lowercase class ids (for example,
    # EXACT_FILTER_opp_apex1_exact_2).  Tokenize the S-expression first and
    # compare whole symbols against the declared-name set; an uppercase-only
    # regex would silently truncate such names.
    symbols = tuple(
        match.group(1) if match.group(1) is not None else match.group(2)
        for match in _CORE_SYMBOL.finditer(payload)
    )
    known = set(known_names)
    names = tuple(symbol for symbol in symbols if symbol in known)
    _require(bool(names), "cvc5 returned an empty named core")
    foreign = set(symbols) - known
    _require(not foreign, f"cvc5 core contains unknown atoms: {sorted(foreign)}")
    _require(len(names) == len(set(names)), "cvc5 core repeats a named atom")
    return names


def _label_roles(item: SelectedAssignment) -> dict[str, str]:
    frame = surface.frame_for_case(item.case)
    roles = {
        "0": "SURPLUS_APEX",
        str(item.case.opp_apex1): "OPP_APEX1",
        str(item.case.opp_apex2): "OPP_APEX2",
    }
    for cap in surface.mc.CAPS:
        for label in frame.ints[cap]:
            roles[str(label)] = f"{cap}_INTERIOR"
    return roles


def normalize_atom_shape(atom: geometry.NamedPolynomialAtom, item: SelectedAssignment) -> str:
    """Forget concrete interior indices while retaining family and apex roles."""

    roles = _label_roles(item)
    shaped = re.sub(r"(?<![A-Za-z0-9])\d+(?![A-Za-z0-9])", lambda m: roles[m.group(0)], atom.name)
    return f"{atom.family}:{shaped}"


def normalize_core_shape(
    names: Iterable[str], item: SelectedAssignment
) -> tuple[str, ...]:
    by_name = {atom.name: atom for atom in item.system.atoms}
    return tuple(sorted(normalize_atom_shape(by_name[name], item) for name in names))


def _assignment_record(item: SelectedAssignment) -> dict[str, Any]:
    return {
        "assignment_id": item.assignment_id,
        "case_id": item.case.case_id,
        "assignment": item.assignment.as_dict(),
        "cyclic_order": list(item.order),
        "bank_matches": [],
        "target_negation_holds": True,
        "geometry": {
            "variables": len(item.system.variables),
            "named_atoms": len(item.system.atoms),
            "input_sha256": item.input_sha256,
        },
    }


def _default_runner(
    system: geometry.GeometrySystem,
    enabled_atoms: Iterable[str] | None,
) -> Mapping[str, Any]:
    return geometry.run_cvc5_bounded(
        system,
        enabled_atoms,
        timeout_seconds=CVC5_TIMEOUT_SECONDS,
    )


def run_census(*, runner: Runner = _default_runner) -> dict[str, Any]:
    """Execute the immutable 24-query census once, without retries."""

    items = tuple(
        item
        for case in surface.PRODUCER_CASES
        for item in select_assignments(case)
    )
    _require(len(items) == TOTAL_QUERY_BUDGET, "query-budget construction drift")
    results: list[dict[str, Any]] = []
    started = time.monotonic()
    for item in items:
        call_started = time.monotonic()
        raw = dict(runner(item.system, None))
        elapsed = time.monotonic() - call_started
        status = str(raw.get("status", "ERROR"))
        record: dict[str, Any] = {
            **_assignment_record(item),
            "status": status,
            "elapsed_seconds": round(elapsed, 6),
            "solver_returncode": raw.get("returncode"),
            "solver_stderr_tail": str(raw.get("stderr", ""))[-1000:],
            "evidence_scope": "cvc5 discovery evidence only; not a Lean proof",
        }
        if status == "UNSAT":
            try:
                core = parse_named_unsat_core(
                    str(raw.get("stdout", "")), item.system.atom_names()
                )
            except PatternCensusError as exc:
                record["status"] = "UNSAT_CORE_PARSE_ERROR"
                record["parse_error"] = str(exc)
            else:
                record["named_unsat_core"] = list(core)
                record["normalized_core_shape"] = list(normalize_core_shape(core, item))
        results.append(record)

    shapes: dict[tuple[str, ...], list[str]] = {}
    for record in results:
        shape = tuple(record.get("normalized_core_shape", ()))
        if shape:
            shapes.setdefault(shape, []).append(record["assignment_id"])
    recurring = [
        {
            "normalized_core_shape": list(shape),
            "count": len(assignments),
            "assignments": assignments,
        }
        for shape, assignments in sorted(shapes.items())
        if len(assignments) >= 2
    ]
    survivors = [
        {
            "assignment_id": record["assignment_id"],
            "case_id": record["case_id"],
            "status": record["status"],
        }
        for record in results
        if record["status"] != "UNSAT"
    ]
    body = {
        "schema": SCHEMA,
        "epistemic_status": "BOUNDED_CVC5_DISCOVERY_EVIDENCE_NOT_LEAN_PROOF",
        "policy": {
            "assignments_per_case": ASSIGNMENTS_PER_CASE,
            "case_count": len(surface.PRODUCER_CASES),
            "query_count": TOTAL_QUERY_BUDGET,
            "timeout_seconds_per_query": CVC5_TIMEOUT_SECONDS,
            "retries": 0,
            "automatic_extension": False,
            "selection": "first deterministic target-negating theorem-bank-clean assignments",
        },
        "ledger": {
            "ENCODED": [
                "producer_surface exact classes and selected-four witnesses",
                "producer_geometry named QF_NRA atoms",
                "producer_bank all-match preflight with zero accepted matches",
                "named cvc5 core parsing and cap-role shape normalization",
            ],
            "OMITTED": list(geometry.OMITTED_LEDGER),
        },
        "results": results,
        "summary": {
            "status_counts": {
                status: sum(record["status"] == status for record in results)
                for status in sorted({record["status"] for record in results})
            },
            "recurring_cores": recurring,
            "survivors": survivors,
            "elapsed_seconds": round(time.monotonic() - started, 6),
        },
    }
    return {**body, "checkpoint_sha256": _json_digest(body)}


def validate_checkpoint(document: Mapping[str, Any]) -> None:
    _require(document.get("schema") == SCHEMA, "checkpoint schema drift")
    body = {key: value for key, value in document.items() if key != "checkpoint_sha256"}
    _require(document.get("checkpoint_sha256") == _json_digest(body), "checkpoint digest drift")
    policy = document.get("policy", {})
    _require(policy.get("query_count") == TOTAL_QUERY_BUDGET, "query budget drift")
    _require(policy.get("retries") == 0, "checkpoint permits retries")
    results = document.get("results")
    _require(isinstance(results, list) and len(results) == TOTAL_QUERY_BUDGET, "result count drift")
    expected = {
        item.assignment_id: item
        for case in surface.PRODUCER_CASES
        for item in select_assignments(case)
    }
    _require(set(expected) == {row.get("assignment_id") for row in results}, "assignment ids drift")
    for row in results:
        item = expected[row["assignment_id"]]
        _require(row.get("geometry", {}).get("input_sha256") == item.input_sha256, "input digest drift")
        _require(row.get("bank_matches") == [], "checkpoint contains a bank-dirty assignment")
        if row.get("status") == "UNSAT":
            names = tuple(row.get("named_unsat_core", ()))
            _require(bool(names), "UNSAT row has no named core")
            _require(
                tuple(row.get("normalized_core_shape", ())) == normalize_core_shape(names, item),
                "normalized core drift",
            )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--run", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    args = parser.parse_args()
    if args.run:
        document = run_census()
        _write_atomic(args.checkpoint, _canonical(document))
        print(_canonical(document), end="")
    else:
        try:
            document = json.loads(args.checkpoint.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            raise PatternCensusError(f"cannot load checkpoint: {exc}") from exc
        validate_checkpoint(document)
        print(_canonical(document["summary"]), end="")


if __name__ == "__main__":
    main()
