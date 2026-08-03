#!/usr/bin/env python3
"""Round-5 v29-C: spawn-safe v15 with full nonapex K4 multiplicity.

At every nonapex carrier point, ``k4[c,x]`` is the exact membership predicate
for one positive-radius carrier shell and that full shell has cardinality at
least four.  Used critical centers retain their exact critical row, so the
global shell is tied to that row and is not duplicated in the power miner.

Apex ``k4`` supports deliberately retain v13/v15's selected-four semantics:
an S-profile apex may select four points from its physical six-shell.  Treating
those four selected points as the whole shell would be unsound.

The runner owns its worker entry point and uses an explicit ``spawn`` context.
Every child recomputes the frozen contract, returns a worker attestation, and
is exact-compared by the parent before its result is admitted to the summary.
This remains external exact-n15 evidence, not a Lean proof.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import contextlib
import gzip
import hashlib
import itertools
import json
import multiprocessing
import os
import sys
import time
from collections import Counter
from dataclasses import asdict
from pathlib import Path
from typing import Sequence

import z3

import round5_cegar_v8 as v8
import round5_cegar_v9 as v9
import round5_cegar_v12 as v12
import round5_cegar_v15 as v15


HERE = Path(__file__).resolve().parent
PROJECT_ROOT = v8.PROJECT_ROOT
TARGET = v8.TARGET
SCHEMA_VERSION = 29
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v29.json"
UV_LOCK_PATH = HERE / "uv.lock"
WORKER_MODULE_ID = "round5_cegar_v29"
AUTHENTICATED_V8_SEED1001_SUMMARY_SHA256 = (
    "159b4773efe899119b64bd1b95a5bcba94cb2bfd62f03b4287e869d71c7f1733"
)
AUTHENTICATED_V8_SEED1001_INVOCATION_SHA256 = (
    "700c2e28ccf91965678502d92e320b59b7bde497f86d2f6a91f30f75a01228f6"
)
AUTHENTICATED_V8_SOURCE_SUMMARY_SHA256 = (
    "1727b3ea7bd39e20bd22a3788ea328163bf72a33745d2c5517987b0c3e3d8ebb"
)
WITNESS_PACKET_INTERFACE_PATH = (
    PROJECT_ROOT / "lean/Erdos9796Proof/P97/WitnessPacketInterface.lean"
)
Case = v8.Case

_BASE_V15_SOURCE_CONTRACT = v15.source_contract
_BASE_ACTIVE_FULL_SHELLS = v9.active_full_shells
_BASE_ALLOWED_FULL_SHELLS = v12._allowed_full_shells


class Encoding(v15.Encoding):
    """The v15 encoding with physical full shells at nonapex K4 centers."""

    def _build_global_k4(self) -> None:
        for center in v8.CENTER_CANDIDATES:
            radius = z3.Real(f"k4_radius_{center}")
            self.k4_radius[center] = radius
            support: list[z3.BoolRef] = []
            for point in v8.POINTS:
                bit = z3.Bool(f"k4_{center}_{point}")
                self.k4[center, point] = bit
                support.append(bit)
                if point == center:
                    self.add("global_K4", z3.Not(bit))
                    continue
                if center in v8.NONAPICES:
                    self.add("global_K4", bit == (self.d(center, point) == radius))
                else:
                    self.add(
                        "global_K4",
                        z3.Implies(bit, self.d(center, point) == radius),
                    )
                self.add(
                    "global_K4",
                    z3.Implies(self.used(center), bit == self.row[center, point]),
                )
            if center in v8.NONAPICES:
                cardinality = z3.PbGe([(bit, 1) for bit in support], 4)
            else:
                cardinality = v8.exactly(support, 4)
            self.add("global_K4", radius >= 1, cardinality)
            self.circles.append(
                v8.Circle(
                    f"globalK4_{center}",
                    support,
                    {center: z3.BoolVal(True)},
                )
            )


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_contract() -> dict[str, object]:
    contract = _BASE_V15_SOURCE_CONTRACT()
    files = dict(contract["files"])
    files["witness_packet_interface"] = {
        "path": str(WITNESS_PACKET_INTERFACE_PATH.relative_to(PROJECT_ROOT)),
        "sha256": file_sha256(WITNESS_PACKET_INTERFACE_PATH),
    }
    role_map = dict(contract["role_map"])
    role_map["rich_apex_exclusion"] = str(role_map["rich_apex_exclusion"]).replace(
        "schema v15", "schema v29"
    )
    role_map["global_k4_full_nonapex_shell"] = (
        "Problem97.exists_selectedClass_card_ge_four_of_hasNEquidistantProperty "
        "provides a positive radius and cardinality at least four; "
        "Problem97.mem_selectedClass gives exact carrier membership.  Only "
        "nonapex global K4 supports receive this full-shell interpretation."
    )
    role_map["apex_global_k4_selected_four"] = (
        "the inherited v13/v14 profile projection keeps each apex K4 support "
        "as a selected four-subset; it is never licensed as a full shell"
    )
    role_map["power_pattern_rank4_full_shell"] = (
        f"{v9.POWER_THEOREM}; active rows are critical full rows, rich full "
        "classes, and unused nonapex physical global K4 shells only"
    )
    contract["files"] = files
    contract["role_map"] = role_map
    return contract


def _inherited_hashes() -> dict[str, str]:
    names = (
        "round5_cegar_v15.py",
        "round5_cegar_v14.py",
        "round5_cegar_v13.py",
        "round5_cegar_v12.py",
        "round5_cegar_v9.py",
        "round5_cegar_v8.py",
        "schema_v15.json",
        "schema_v14.json",
        "schema_v13.json",
        "schema_v12.json",
        "schema_v9.json",
        "schema_v8.json",
    )
    return {name: file_sha256(HERE / name) for name in names}


def provenance() -> dict[str, object]:
    frozen = v15.provenance()
    frozen.update({
        "target": TARGET,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "uv_lock_sha256": file_sha256(UV_LOCK_PATH),
        "retry_source_contract": {
            "kind": "byte-frozen previously authenticated v8 seed-1001 summary",
            "sha256": AUTHENTICATED_V8_SEED1001_SUMMARY_SHA256,
            "invocation_sha256": AUTHENTICATED_V8_SEED1001_INVOCATION_SHA256,
            "source_summary_sha256": AUTHENTICATED_V8_SOURCE_SUMMARY_SHA256,
            "expected_schema_version": 8,
            "expected_case_count": 67,
            "expected_status": "unknown",
        },
        "inherited_sha256": _inherited_hashes(),
        "power_shell_registry": {
            "allowed_nonapex_centers": list(v8.NONAPICES),
            "support_formula": "d(center, point) == k4_radius[center]",
            "activation": "not used(center)",
            "used_center_deduplication": "critical row only",
            "excluded_sources": ["apex selected K4", "packet B1", "packet B2"],
        },
        "source_contract": source_contract(),
    })
    return frozen


def active_full_shells(
    encoding: Encoding, model: z3.ModelRef
) -> tuple[v9.FullShell, ...]:
    """Return active physical shells, never selected apex/B1 subsets."""
    shells = list(_BASE_ACTIVE_FULL_SHELLS(encoding, model))
    for center in v8.NONAPICES:
        used = encoding.used(center)
        if encoding._bool(model, used):
            # The critical row is already in ``shells`` and equals this global
            # shell.  Registering both would duplicate one physical circle.
            continue
        shells.append(
            v9.FullShell(
                name=f"physical_globalK4_{center}",
                kind="physical_nonapex_global_k4_full_class",
                support=tuple(
                    encoding.d(center, point) == encoding.k4_radius[center]
                    for point in v8.POINTS
                ),
                activation=z3.Not(used),
            )
        )
    return tuple(shells)


def _allowed_full_shells(encoding: Encoding) -> dict[str, v9.FullShell]:
    """Whitelist every theorem-licensed shell a v29 certificate may name."""
    shells = dict(_BASE_ALLOWED_FULL_SHELLS(encoding))
    for center in v8.NONAPICES:
        support = tuple(
            encoding.d(center, point) == encoding.k4_radius[center]
            for point in v8.POINTS
        )
        activation = z3.Not(encoding.used(center))
        if not all(z3.is_bool(bit) for bit in support) or not z3.is_bool(activation):
            raise AssertionError("global K4 full-shell source is not Boolean")
        shell = v9.FullShell(
            name=f"physical_globalK4_{center}",
            kind="physical_nonapex_global_k4_full_class",
            support=support,
            activation=activation,
        )
        if shell.name in shells:
            raise AssertionError("duplicate full-shell name")
        shells[shell.name] = shell
    return shells


def _configure_v12_runtime() -> None:
    """Bind the audited v12 engine and v9 miner to v29 inside this process."""
    v12.SCHEMA_VERSION = SCHEMA_VERSION
    v12.SCRIPT_PATH = SCRIPT_PATH
    v12.SCHEMA_PATH = SCHEMA_PATH
    v12.Encoding = Encoding
    v12.source_contract = source_contract
    v12.provenance = provenance
    v12._allowed_full_shells = _allowed_full_shells
    v12.v9.active_full_shells = active_full_shells


@contextlib.contextmanager
def _bound_v12_runtime():
    names = (
        "SCHEMA_VERSION",
        "SCRIPT_PATH",
        "SCHEMA_PATH",
        "Encoding",
        "source_contract",
        "provenance",
        "_allowed_full_shells",
    )
    previous = {name: getattr(v12, name) for name in names}
    previous_active = v12.v9.active_full_shells
    _configure_v12_runtime()
    try:
        yield
    finally:
        for name, value in previous.items():
            setattr(v12, name, value)
        v12.v9.active_full_shells = previous_active


def solve_case(*args, **kwargs) -> dict[str, object]:
    with _bound_v12_runtime():
        return v12.solve_case(*args, **kwargs)


def stable_case_seed(base_seed: int, case_id: str) -> int:
    digest = hashlib.sha256(f"{base_seed}\0{case_id}".encode()).digest()
    seed = int.from_bytes(digest[:4], "big") & 0x7FFF_FFFF
    return seed or 1


def load_frozen_v8_seed1001_summary(path: Path) -> tuple[dict[str, object], str]:
    """Authenticate the historical retry input by its previously audited bytes.

    Recomputing ``v8.provenance()`` here is intentionally wrong: Lean source
    contracts may evolve after a completed run.  The exact summary byte hash
    freezes the provenance and every result that were audited together.
    """
    source_bytes = path.read_bytes()
    source_hash = hashlib.sha256(source_bytes).hexdigest()
    if source_hash != AUTHENTICATED_V8_SEED1001_SUMMARY_SHA256:
        raise ValueError("retry source does not match frozen authenticated v8 bytes")
    try:
        prior = json.loads(source_bytes)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError("retry source is not valid JSON") from exc
    if not isinstance(prior, dict):
        raise ValueError("retry source is not a summary object")
    results = prior.get("results")
    if (
        prior.get("target") != TARGET
        or prior.get("schema_version") != 8
        or prior.get("case_count") != 67
        or prior.get("statuses") != {"unknown": 67}
        or prior.get("complete") is not False
        or not isinstance(results, list)
        or len(results) != 67
        or any(
            not isinstance(result, dict) or result.get("status") != "unknown"
            for result in results
        )
    ):
        raise ValueError("frozen retry source has an invalid semantic envelope")
    case_ids = [str(result.get("case_id")) for result in results]
    if case_ids != sorted(case_ids) or len(set(case_ids)) != len(case_ids):
        raise ValueError("frozen retry source case ids are not sorted and unique")

    invocation_path = path.parent / "invocation.json"
    invocation_bytes = invocation_path.read_bytes()
    if (
        hashlib.sha256(invocation_bytes).hexdigest()
        != AUTHENTICATED_V8_SEED1001_INVOCATION_SHA256
    ):
        raise ValueError("frozen retry invocation hash mismatch")
    invocation = json.loads(invocation_bytes)
    if not isinstance(invocation, dict):
        raise ValueError("frozen retry invocation is not an object")
    provenance_keys = (
        "target", "schema_version", "script_sha256", "schema_sha256",
        "uv_lock_sha256", "source_contract",
    )
    if any(invocation.get(key) != prior.get(key) for key in provenance_keys):
        raise ValueError("frozen summary and invocation provenance differ")
    argv = invocation.get("argv")
    if (
        invocation.get("workers") != 24
        or invocation.get("timeout_ms") != 600_000
        or not isinstance(argv, list)
        or len(argv) < 2
        or argv[1] != "retry"
        or "--seed" not in argv
        or argv[argv.index("--seed") + 1] != "1001"
        or invocation.get("source_summary_sha256")
        != AUTHENTICATED_V8_SOURCE_SUMMARY_SHA256
    ):
        raise ValueError("frozen retry invocation parameters differ")

    recorded_source = invocation.get("source_summary")
    if not isinstance(recorded_source, str):
        raise ValueError("frozen retry invocation lacks source summary path")
    original_path = Path(recorded_source)
    if not original_path.is_absolute():
        original_path = PROJECT_ROOT / original_path
    original_bytes = original_path.read_bytes()
    if (
        hashlib.sha256(original_bytes).hexdigest()
        != AUTHENTICATED_V8_SOURCE_SUMMARY_SHA256
    ):
        raise ValueError("original v8 source summary hash mismatch")
    original = json.loads(original_bytes)
    original_results = original.get("results") if isinstance(original, dict) else None
    if (
        not isinstance(original, dict)
        or original.get("target") != TARGET
        or original.get("schema_version") != 8
        or original.get("case_count") != 68
        or original.get("statuses") != {"unknown": 67, "unsat": 1}
        or original.get("complete") is not False
        or not isinstance(original_results, list)
        or len(original_results) != 68
    ):
        raise ValueError("original v8 source summary has invalid terminal shape")
    original_unknown_ids = [
        str(result.get("case_id")) for result in original_results
        if isinstance(result, dict) and result.get("status") == "unknown"
    ]
    if original_unknown_ids != case_ids:
        raise ValueError("seed-1001 cases differ from original v8 UNKNOWN set")

    universe = {
        case.case_id for case in (*v8.all_cases(), *v8.all_secondcap_endpoint_cases())
    }
    if not set(case_ids) <= universe:
        raise ValueError("frozen retry source names cases outside the v29 universe")

    seeds: list[int] = []
    for compact in results:
        case_id = str(compact["case_id"])
        result_path = path.parent / case_id / "result.json"
        result = json.loads(result_path.read_bytes())
        if not isinstance(result, dict):
            raise ValueError(f"historical result is not an object: {case_id}")
        projection = {
            "case_id": result.get("case_id"),
            "status": result.get("status"),
            "elapsed_seconds": result.get("elapsed_seconds"),
            "unsat_core_families": result.get("unsat_core_families"),
            "reason_unknown": result.get("reason_unknown"),
            "schema_version": result.get("schema_version"),
            "script_sha256": result.get("script_sha256"),
            "encoding_sha256": result.get("encoding_sha256"),
        }
        if projection != compact:
            raise ValueError(f"historical result projection mismatch: {case_id}")
        if any(result.get(key) != prior.get(key) for key in provenance_keys):
            raise ValueError(f"historical result provenance mismatch: {case_id}")
        case_payload = result.get("case")
        if not isinstance(case_payload, dict) or Case(**case_payload).case_id != case_id:
            raise ValueError(f"historical result case payload mismatch: {case_id}")
        counts = result.get("constraint_counts")
        if (
            not isinstance(counts, dict)
            or result.get("constraint_total") != sum(int(value) for value in counts.values())
        ):
            raise ValueError(f"historical constraint count mismatch: {case_id}")
        solver = result.get("solver")
        if not isinstance(solver, dict) or not isinstance(solver.get("seed"), int):
            raise ValueError(f"historical solver seed missing: {case_id}")
        seeds.append(int(solver["seed"]))
        with gzip.open(path.parent / case_id / "encoding.smt2.gz", "rb") as handle:
            encoding_hash = hashlib.sha256(handle.read()).hexdigest()
        if encoding_hash != result.get("encoding_sha256"):
            raise ValueError(f"historical encoding hash mismatch: {case_id}")
    if seeds != list(range(1001, 1068)):
        raise ValueError("historical solver seed schedule mismatch")
    return prior, source_hash


def _worker_attestation(frozen: dict[str, object]) -> dict[str, object]:
    current = provenance()
    if current != frozen:
        raise RuntimeError("v29 worker source differs from frozen parent provenance")
    return {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": current["script_sha256"],
        "provenance_sha256": v12.canonical_sha256(current),
        "encoding_class": f"{WORKER_MODULE_ID}.Encoding",
        "pid": os.getpid(),
        "start_method": multiprocessing.get_start_method(),
    }


def _worker(payload: tuple[dict[str, object], dict[str, object]]) -> dict[str, object]:
    data, frozen = payload
    local = dict(data)
    case = Case(**local.pop("case"))
    result = solve_case(case, frozen_provenance=frozen, **local)
    result["worker_attestation"] = _worker_attestation(frozen)
    cut_path = Path(local["out_dir"]) / case.case_id / "power_cuts_v12.json"
    kind_counts: Counter[str] = Counter()
    if cut_path.exists():
        cut_artifact = json.loads(cut_path.read_text())
        for cut in cut_artifact.get("cuts", []):
            for row in cut.get("rows", []):
                kind_counts[str(row.get("kind"))] += 1
    result["power_cut_row_kind_counts"] = dict(sorted(kind_counts.items()))
    v12.write_json(Path(local["out_dir"]) / case.case_id / "result.json", result)
    return result


def _spawn_contract_probe(case_data: dict[str, object]) -> dict[str, object]:
    """Cheap regression probe that executes after an actual spawn import."""
    case = Case(**case_data)
    with _bound_v12_runtime():
        encoding = Encoding(case, timeout_ms=1, seed=97)
        family = encoding.groups["global_K4"]
        return {
            **_worker_attestation(provenance()),
            "case_id": case.case_id,
            "global_K4_count": len(family),
            "global_K4_sha256": hashlib.sha256(
                "\n".join(constraint.sexpr() for constraint in family).encode()
            ).hexdigest(),
            "nonapex_superadditivity_count": len(
                encoding.groups["nonapex_global_k4_squared_superadditivity"]
            ),
        }


def _validate_child_result(
    result: object, case: Case, frozen: dict[str, object]
) -> list[str]:
    errors: list[str] = []
    if not isinstance(result, dict):
        return ["worker returned a non-object result"]
    for key, value in frozen.items():
        if result.get(key) != value:
            errors.append(f"frozen provenance mismatch: {key}")
    if result.get("case_id") != case.case_id:
        errors.append("case id mismatch")
    if result.get("case") != asdict(case):
        errors.append("case payload mismatch")
    attestation = result.get("worker_attestation")
    expected_attestation = {
        "module": WORKER_MODULE_ID,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": frozen["script_sha256"],
        "provenance_sha256": v12.canonical_sha256(frozen),
        "encoding_class": f"{WORKER_MODULE_ID}.Encoding",
        "start_method": "spawn",
    }
    if not isinstance(attestation, dict):
        errors.append("missing worker attestation")
    else:
        for key, value in expected_attestation.items():
            if attestation.get(key) != value:
                errors.append(f"worker attestation mismatch: {key}")
        pid = attestation.get("pid")
        if isinstance(pid, bool) or not isinstance(pid, int) or pid <= 0:
            errors.append("worker attestation has invalid pid")
    counts = result.get("constraint_counts")
    if not isinstance(counts, dict):
        errors.append("missing constraint counts")
    else:
        if counts.get("global_K4") != 465:
            errors.append("global_K4 contract count is not 465")
        if counts.get("nonapex_global_k4_squared_superadditivity") != 4368:
            errors.append("v15 superadditivity contract count is not 4368")
    if not isinstance(result.get("power_cut_row_kind_counts"), dict):
        errors.append("missing power-cut row-kind accounting")
    return errors


def _atomic_write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, path)


def _args_budgets(args: argparse.Namespace) -> dict[str, dict[str, int]]:
    return v12.resolved_budgets(
        args.timeout_ms,
        args.max_power_candidates,
        args.max_power_cuts,
        args.bool_timeout_ms,
        args.max_bool_power_candidates,
        args.max_bool_power_cuts,
    )


def run_matrix(
    args: argparse.Namespace,
    cases: Sequence[Case],
    command: str,
    source_summary: Path | None = None,
    source_summary_sha256: str | None = None,
) -> int:
    started = time.monotonic()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must be in the closed interval 1..24")
    if not cases:
        raise ValueError("at least one case is required")
    case_ids = [case.case_id for case in cases]
    if len(set(case_ids)) != len(case_ids):
        raise ValueError("duplicate case ids are forbidden")
    if (source_summary is None) != (source_summary_sha256 is None):
        raise ValueError("retry source path and authenticated byte hash must be paired")

    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    with _bound_v12_runtime():
        v12.verify_frozen_provenance(frozen, str(frozen["script_sha256"]))
    invocation = {
        **frozen,
        "argv": sys.argv,
        "case_count": len(cases),
        "workers": args.workers,
        "multiprocessing_start_method": "spawn",
        "seed_schedule": "sha256(base_seed, NUL, case_id) low 31 bits",
        "resolved_budgets": _args_budgets(args),
        "source_summary": str(source_summary) if source_summary else None,
        "source_summary_sha256": source_summary_sha256,
    }
    v12.write_json(run_dir / "invocation.json", invocation)
    payloads: list[tuple[dict[str, object], dict[str, object]]] = []
    for case in cases:
        payloads.append(({
            "case": asdict(case),
            "timeout_ms": args.timeout_ms,
            "out_dir": run_dir,
            "seed": stable_case_seed(args.seed, case.case_id),
            "max_power_cuts": args.max_power_cuts,
            "max_power_candidates": args.max_power_candidates,
            "bool_timeout_ms": args.bool_timeout_ms,
            "max_bool_power_cuts": args.max_bool_power_cuts,
            "max_bool_power_candidates": args.max_bool_power_candidates,
            "expected_script_sha256": str(frozen["script_sha256"]),
        }, frozen))

    results: list[dict[str, object]] = []
    validation_errors: dict[str, list[str]] = {}
    context = multiprocessing.get_context("spawn")
    worker_count = min(args.workers, len(payloads))
    with concurrent.futures.ProcessPoolExecutor(
        max_workers=worker_count, mp_context=context
    ) as pool:
        future_cases = {
            pool.submit(_worker, payload): case
            for payload, case in zip(payloads, cases, strict=True)
        }
        for future in concurrent.futures.as_completed(future_cases):
            case = future_cases[future]
            try:
                result = future.result()
            except Exception as exc:
                result = {
                    **frozen,
                    "case": asdict(case),
                    "case_id": case.case_id,
                    "status": "error",
                    "complete": False,
                    "error": f"worker exception: {type(exc).__name__}: {exc}",
                }
            errors = _validate_child_result(result, case, frozen)
            if errors:
                validation_errors[case.case_id] = errors
                result["status"] = "error"
                result["complete"] = False
                result["parent_validation_errors"] = errors
            results.append(result)
            progress = {
                **invocation,
                "completed_count": len(results),
                "remaining_count": len(cases) - len(results),
                "counts": dict(sorted(Counter(
                    str(item.get("status")) for item in results
                ).items())),
                "validation_errors": validation_errors,
                "completed": [
                    {
                        "case_id": item.get("case_id"),
                        "status": item.get("status"),
                        "result_file": f"{item.get('case_id')}/result.json",
                    }
                    for item in sorted(results, key=lambda value: str(value.get("case_id")))
                ],
            }
            _atomic_write_json(run_dir / "progress.json", progress)

    results.sort(key=lambda item: str(item.get("case_id")))
    counts = Counter(str(result.get("status")) for result in results)
    child_contract_valid = not validation_errors
    complete = child_contract_valid and v12.matrix_is_complete(cases, results)
    summary = {
        **invocation,
        "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": dict(sorted(counts.items())),
        "child_contract_valid": child_contract_valid,
        "child_validation_errors": validation_errors,
        "complete": complete,
        "full_encoding_sha256_by_case": {
            str(result["case_id"]): result.get("full_encoding_sha256")
            for result in results
        },
        "results": results,
    }
    _atomic_write_json(run_dir / "summary.json", summary)
    print(json.dumps({
        "counts": summary["counts"],
        "child_contract_valid": child_contract_valid,
        "run_dir": str(run_dir),
    }, sort_keys=True))
    return 0 if complete else 2


def parser() -> argparse.ArgumentParser:
    parser = v15.parser()
    parser.description = __doc__
    for action in parser._actions:
        if isinstance(action, argparse._SubParsersAction):
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = HERE / "artifacts-v29-c-full-nonapex-shell"
    return parser


def main() -> int:
    args = parser().parse_args()
    if args.command == "matrix":
        return run_matrix(args, v8.all_cases(), "matrix")
    if args.command == "secondcap-matrix":
        return run_matrix(args, v8.all_secondcap_endpoint_cases(), "secondcap-matrix")
    if args.command == "smoke":
        args.workers = 1
        return run_matrix(args, [Case("paired", "SSS", 0, 1, None)], "smoke")
    if args.command == "case":
        args.workers = 1
        case = Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh)
        return run_matrix(args, [case], "case")
    if args.command == "retry":
        prior, source_hash = load_frozen_v8_seed1001_summary(args.summary)
        statuses = {"unknown"}
        if args.include_error:
            statuses.add("error")
        requested = {
            str(item["case_id"])
            for item in prior.get("results", [])
            if item.get("status") in statuses
        }
        universe = {
            case.case_id: case
            for case in (*v8.all_cases(), *v8.all_secondcap_endpoint_cases())
        }
        missing = sorted(requested - universe.keys())
        if missing:
            raise SystemExit(f"summary contains unknown case ids: {missing}")
        cases = [universe[case_id] for case_id in sorted(requested)]
        if not cases:
            raise SystemExit(f"no cases with statuses {sorted(statuses)}")
        return run_matrix(args, cases, "retry", args.summary, source_hash)
    raise AssertionError(args.command)


if __name__ == "__main__":
    raise SystemExit(main())
