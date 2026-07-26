#!/usr/bin/env python3
"""Refine the verified first-level UNKNOWN children by one further cube level.

The input is the summary emitted by ``recursive_recube.py``.  Only children
whose independently checked status is ``UNKNOWN`` are selected.  Every new
cube is solved against the same pinned simplified CNF, and the acceptance
rules remain unchanged: SAT must extend to a model of the original CNF, while
UNSAT must replay through ``drat-trim``.

This is a bounded external search.  It does not claim source-to-CNF ingress or
global UNSAT coverage.

Interrupted runs are resumable.  A cached partition or child is reused only
after its lineage, settings, deterministic assumption-CNF hash, status, logs,
and any proof/model verification artifacts have been checked.  Missing or
rejected cells are scrubbed of stale solver artifacts before resubmission.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import tempfile
from pathlib import Path

import preprocessed_cube_probe as pipeline
import recursive_recube as level_one


HERE = Path(__file__).resolve().parent
ORIENTATIONS = level_one.ORIENTATIONS

RECUBE_SCHEMA = "p97-exact5-card13-distinct-recube-parent-v1"
CHILD_SCHEMA = "p97-exact5-card13-distinct-recube-child-v1"


class CacheValidationError(ValueError):
    """A cached result is not safe to reuse for the requested job."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise CacheValidationError(message)


def require_exact(result: dict[str, object], field: str, expected: object) -> None:
    require(field in result, f"missing {field}")
    require(result[field] == expected, f"{field} drift")


def require_nonnegative_number(value: object, label: str) -> None:
    require(
        isinstance(value, (int, float)) and not isinstance(value, bool) and value >= 0,
        f"invalid {label}",
    )


def require_optional_nonnegative_int(value: object, label: str) -> None:
    require(
        value is None
        or (isinstance(value, int) and not isinstance(value, bool) and value >= 0),
        f"invalid {label}",
    )


def require_optional_int(value: object, label: str) -> None:
    require(
        value is None or (isinstance(value, int) and not isinstance(value, bool)),
        f"invalid {label}",
    )


def require_sha256(value: object, label: str) -> str:
    require(isinstance(value, str), f"invalid {label}")
    require(
        len(value) == 64 and all(character in "0123456789abcdef" for character in value),
        f"invalid {label}",
    )
    return value


def int_tuple(value: object, label: str) -> tuple[int, ...]:
    require(isinstance(value, list), f"invalid {label}")
    require(
        all(isinstance(item, int) and not isinstance(item, bool) for item in value),
        f"invalid {label}",
    )
    return tuple(value)


def validate_assumptions(
    assumptions: tuple[int, ...], variables: int, label: str
) -> None:
    signs: dict[int, bool] = {}
    for literal in assumptions:
        require(literal != 0, f"zero literal in {label}")
        require(abs(literal) <= variables, f"out-of-range literal in {label}")
        variable = abs(literal)
        sign = literal > 0
        require(
            variable not in signs or signs[variable] == sign,
            f"contradictory literals in {label}",
        )
        signs[variable] = sign


def assumption_cnf_sha256(
    variables: int,
    base_clauses: int,
    base_body: str,
    assumptions: tuple[int, ...],
) -> str:
    digest = hashlib.sha256()
    digest.update(
        f"p cnf {variables} {base_clauses + len(assumptions)}\n".encode()
    )
    digest.update(base_body.encode())
    for literal in assumptions:
        digest.update(f"{literal} 0\n".encode())
    return digest.hexdigest()


def exact_artifact_path(value: object, expected: Path, label: str) -> Path:
    require(isinstance(value, str), f"invalid {label} path")
    actual = Path(value)
    require(actual.resolve() == expected.resolve(), f"{label} path drift")
    require(actual.is_file(), f"missing {label}")
    return actual


def validate_hashed_artifact(
    metadata: dict[str, object],
    path_field: str,
    hash_field: str,
    expected: Path,
    label: str,
) -> Path:
    artifact = exact_artifact_path(metadata.get(path_field), expected, label)
    expected_hash = require_sha256(metadata.get(hash_field), f"{label} sha256")
    require(level_one.sha256(artifact) == expected_hash, f"{label} hash drift")
    return artifact


def load_cached_object(path: Path) -> dict[str, object]:
    try:
        before = path.stat()
        payload = json.loads(path.read_text(encoding="utf-8"))
        after = path.stat()
    except (OSError, json.JSONDecodeError) as error:
        raise CacheValidationError(f"unreadable result: {error}") from error
    require(
        (before.st_size, before.st_mtime_ns) == (after.st_size, after.st_mtime_ns),
        "result changed while being read",
    )
    require(isinstance(payload, dict), "result is not an object")
    return payload


def validate_recube_result(
    path: Path,
    parent: dict[str, object],
    variables: int,
    base_clauses: int,
    base_body: str,
    output_root: Path,
    child_depth: int,
    child_limit: int,
    timeout_seconds: int,
) -> dict[str, object]:
    result = load_cached_object(path)
    orientation = str(parent["orientation"])
    parent_index = int(parent["cube_index"])
    parent_cube = tuple(int(value) for value in parent["cube"])
    validate_assumptions(parent_cube, variables, "parent cube")
    require_exact(result, "schema", RECUBE_SCHEMA)
    require_exact(result, "epistemic_status", "EXTERNAL_MARCH_PARTITION_ONLY")
    require_exact(result, "orientation", orientation)
    require_exact(result, "parent_cube_index", parent_index)
    require_exact(result, "parent_cube", list(parent_cube))
    require_exact(result, "parent_cube_width", len(parent_cube))
    require_exact(result, "parent_first_pass_status", parent["status"])
    require_exact(result, "parent_first_pass_conflicts", parent["conflicts"])
    require_exact(result, "child_depth", child_depth)
    require_exact(result, "child_limit", child_limit)
    require_exact(result, "timeout_seconds", timeout_seconds)
    require_nonnegative_number(result.get("elapsed_seconds"), "elapsed_seconds")
    require_exact(
        result,
        "parent_cnf_sha256",
        assumption_cnf_sha256(
            variables, base_clauses, base_body, parent_cube
        ),
    )
    cell = output_root / orientation / f"parent-{parent_index:03d}" / "recube"
    validate_hashed_artifact(
        result, "log_path", "log_sha256", cell / "march.log", "march log"
    )
    require(isinstance(result.get("timed_out"), bool), "invalid timed_out")
    require_optional_int(result.get("returncode"), "returncode")
    status = result.get("status")
    require(status in ("PARTITIONED", "UNKNOWN"), "invalid partition status")
    raw_cubes = result.get("child_cubes")
    require(isinstance(raw_cubes, list), "invalid child_cubes")
    cubes = [int_tuple(cube, "child cube") for cube in raw_cubes]
    require_exact(result, "child_cube_count", len(cubes))
    if status == "PARTITIONED":
        require(result["timed_out"] is False, "partition marked timed out")
        require(result["returncode"] == 0, "partition returncode drift")
        require(1 <= len(cubes) <= child_limit, "partition child count drift")
        require(
            result.get("partition_base_clause_count")
            == base_clauses + len(parent_cube),
            "partition base-clause drift",
        )
        require_sha256(
            result.get("partition_icnf_sha256"), "partition ICNF sha256"
        )
        require_nonnegative_number(
            result.get("partition_icnf_size_bytes"), "partition ICNF size"
        )
        require(result["partition_icnf_size_bytes"] > 0, "empty partition ICNF")
        require(len(set(cubes)) == len(cubes), "duplicate child cube")
        for cube in cubes:
            require(1 <= len(cube) <= child_depth, "child cube depth drift")
            validate_assumptions(parent_cube + cube, variables, "combined cube")
    else:
        require(not cubes, "UNKNOWN partition has child cubes")
        require(
            result.get("partition_base_clause_count") is None
            and result.get("partition_icnf_sha256") is None
            and result.get("partition_icnf_size_bytes") is None,
            "UNKNOWN partition has partition metadata",
        )
        require(
            result["timed_out"] is True or result["returncode"] != 0,
            "UNKNOWN partition has successful march result",
        )
        if result["timed_out"]:
            require(result["returncode"] is None, "timed-out partition has returncode")
    return result


def validate_cached_model(
    model: Path,
    variables: int,
    base_clauses: int,
    base_body: str,
    assumptions: tuple[int, ...],
) -> None:
    temporary: Path | None = None
    try:
        handle = tempfile.NamedTemporaryFile(
            prefix="p97-exact5-resume-model-check-",
            suffix=".cnf",
            dir="/tmp",
            delete=False,
        )
        handle.close()
        temporary = Path(handle.name)
        level_one.write_assumption_cnf(
            temporary, variables, base_clauses, base_body, assumptions
        )
        ok, detail = level_one.run_solver.verify_model(
            temporary, model.read_text(encoding="utf-8")
        )
        require(ok, f"cached simplified model failed replay: {detail}")
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)


def validate_child_result(
    path: Path,
    partition: dict[str, object],
    child_index: int,
    child_cube: tuple[int, ...],
    variables: int,
    base_clauses: int,
    base_body: str,
    original_cnf: Path,
    output_root: Path,
    timeout_seconds: int,
) -> dict[str, object]:
    result = load_cached_object(path)
    orientation = str(partition["orientation"])
    parent_index = int(partition["parent_cube_index"])
    parent_cube = tuple(int(value) for value in partition["parent_cube"])
    assumptions = parent_cube + child_cube
    validate_assumptions(assumptions, variables, "combined assumptions")
    config_name, config = level_one.CONFIGS[
        (parent_index + child_index + (1 if orientation == "mirror" else 0))
        % len(level_one.CONFIGS)
    ]
    seed = (
        2000
        + parent_index * 16
        + child_index
        + (2000 if orientation == "mirror" else 0)
    )
    require_exact(result, "schema", CHILD_SCHEMA)
    require_exact(
        result, "epistemic_status", "EXTERNAL_EXACT_CHILD_CNF_VERDICT"
    )
    require_exact(result, "orientation", orientation)
    require_exact(result, "parent_cube_index", parent_index)
    require_exact(result, "parent_cube", list(parent_cube))
    require_exact(result, "child_cube_index", child_index)
    require_exact(result, "child_cube", list(child_cube))
    require_exact(result, "combined_assumptions", list(assumptions))
    require_exact(result, "config", config_name)
    require_exact(result, "config_args", list(config))
    require_exact(result, "seed", seed)
    require_exact(result, "timeout_seconds", timeout_seconds)
    require_exact(
        result,
        "child_cnf_sha256",
        assumption_cnf_sha256(
            variables, base_clauses, base_body, assumptions
        ),
    )
    require_nonnegative_number(result.get("elapsed_seconds"), "elapsed_seconds")
    require_optional_nonnegative_int(result.get("conflicts"), "conflicts")
    require_optional_nonnegative_int(result.get("decisions"), "decisions")
    require(isinstance(result.get("timed_out"), bool), "invalid timed_out")
    require_optional_int(result.get("returncode"), "returncode")
    if result["timed_out"]:
        require(result["returncode"] is None, "timed-out child has returncode")
    expected_solver_status = (
        "UNKNOWN"
        if result["timed_out"]
        else {10: "SAT", 20: "UNSAT"}.get(result["returncode"], "UNKNOWN")
    )
    require_exact(result, "solver_status", expected_solver_status)
    require(result.get("status") in ("SAT", "UNSAT", "UNKNOWN"), "invalid status")
    cell = (
        output_root / orientation / f"parent-{parent_index:03d}"
        / f"child-{child_index:02d}"
    )
    validate_hashed_artifact(
        result, "log_path", "log_sha256", cell / "cadical.log", "CaDiCaL log"
    )
    simplified_check = result.get("model_check_against_child_cnf")
    original_check = result.get("extended_model_check_against_original_cnf")
    drat_check = result.get("drat_check")
    proof_artifact = result.get("proof_artifact")
    if expected_solver_status == "SAT":
        require(isinstance(simplified_check, dict), "missing simplified model check")
        require(
            simplified_check.get("status") in ("PASS", "FAIL"),
            "invalid simplified model check",
        )
        require(drat_check is None and proof_artifact is None, "SAT has proof data")
        if simplified_check["status"] == "PASS":
            model = cell / "simplified.model"
            require(model.is_file(), "missing simplified model")
            validate_cached_model(
                model, variables, base_clauses, base_body, assumptions
            )
            require(isinstance(original_check, dict), "missing original model check")
            require(
                original_check.get("status") in ("PASS", "FAIL"),
                "invalid original model check",
            )
            extended = validate_hashed_artifact(
                original_check,
                "extended_model_path",
                "extended_model_sha256",
                cell / "extended-original.model",
                "extended model",
            )
            validate_hashed_artifact(
                original_check,
                "extension_log_path",
                "extension_log_sha256",
                cell / "extend.log",
                "extension log",
            )
            if original_check["status"] == "PASS":
                ok, detail = level_one.run_solver.verify_model(
                    original_cnf, extended.read_text(encoding="utf-8")
                )
                require(ok, f"cached extended model failed replay: {detail}")
        else:
            require(original_check is None, "failed simplified check has original check")
        expected_final = (
            "SAT"
            if simplified_check["status"] == "PASS"
            and isinstance(original_check, dict)
            and original_check.get("status") == "PASS"
            else "UNKNOWN"
        )
        require_exact(result, "status", expected_final)
    elif expected_solver_status == "UNSAT":
        require(
            simplified_check is None and original_check is None,
            "UNSAT has model check data",
        )
        require(isinstance(drat_check, dict), "missing DRAT check")
        require(
            drat_check.get("status") in ("PASS", "FAIL"), "invalid DRAT check"
        )
        require(isinstance(drat_check.get("timed_out"), bool), "invalid DRAT timeout")
        require_optional_int(drat_check.get("returncode"), "DRAT returncode")
        drat_log = validate_hashed_artifact(
            drat_check,
            "log_path",
            "log_sha256",
            cell / "drat-trim.log",
            "drat-trim log",
        )
        if drat_check["status"] == "PASS":
            require(
                drat_check["timed_out"] is False
                and drat_check["returncode"] == 0,
                "passing DRAT metadata drift",
            )
            require(
                "s VERIFIED" in drat_log.read_text(encoding="utf-8"),
                "drat-trim log lacks VERIFIED",
            )
            require(isinstance(proof_artifact, dict), "missing proof artifact")
            proof = validate_hashed_artifact(
                proof_artifact,
                "path",
                "sha256",
                cell / "proof.drat.gz",
                "compressed DRAT proof",
            )
            require_exact(
                proof_artifact, "format", "gzip-compressed CaDiCaL DRAT"
            )
            require_exact(proof_artifact, "size_bytes", proof.stat().st_size)
            require_exact(result, "status", "UNSAT")
        else:
            require(proof_artifact is None, "failed DRAT check has proof artifact")
            require_exact(result, "status", "UNKNOWN")
    else:
        require_exact(result, "status", "UNKNOWN")
        require(
            simplified_check is None
            and original_check is None
            and drat_check is None
            and proof_artifact is None,
            "UNKNOWN solver result has verification data",
        )
    return result


def clean_recube_cell(output_root: Path, orientation: str, parent_index: int) -> None:
    cell = output_root / orientation / f"parent-{parent_index:03d}" / "recube"
    for name in ("result.json", "march.log"):
        (cell / name).unlink(missing_ok=True)


def clean_child_cell(
    output_root: Path, orientation: str, parent_index: int, child_index: int
) -> None:
    cell = (
        output_root / orientation / f"parent-{parent_index:03d}"
        / f"child-{child_index:02d}"
    )
    for name in (
        "result.json",
        "cadical.log",
        "drat-trim.log",
        "simplified.model",
        "extended-original.model",
        "extend.log",
        "proof.drat",
        "proof.drat.gz",
    ):
        (cell / name).unlink(missing_ok=True)


def composite_index(parent_index: int, child_index: int) -> int:
    """Inject a first-level parent/child pair into one stable integer."""

    if not 0 <= child_index < 100:
        raise AssertionError("first-level child index must be below 100")
    return parent_index * 100 + child_index


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--previous-summary",
        type=Path,
        default=HERE / "artifacts/recursive-recubing/summary.json",
    )
    parser.add_argument(
        "--pipeline-dir",
        type=Path,
        default=HERE / "artifacts/preprocessed-cube-probe",
    )
    parser.add_argument("--cnf-dir", type=Path, default=HERE / "artifacts")
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=HERE / "artifacts/recursive-recubing-level2",
    )
    parser.add_argument("--child-depth", type=int, default=3)
    parser.add_argument("--child-limit", type=int, default=8)
    parser.add_argument("--recube-timeout-seconds", type=int, default=90)
    parser.add_argument("--solve-timeout-seconds", type=int, default=30)
    parser.add_argument("--proof-timeout-seconds", type=int, default=180)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument(
        "--plan-only",
        action="store_true",
        help="validate inputs and print the selected frontier without solving",
    )
    parser.add_argument(
        "--resume-dry-run",
        action="store_true",
        help=(
            "validate reusable cached results and report missing/rejected jobs "
            "without deleting artifacts or invoking solvers"
        ),
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise SystemExit("workers must be in 1..24")
    if not 1 <= args.child_limit <= 64:
        raise SystemExit("child limit must be in 1..64")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    previous = json.loads(args.previous_summary.read_text(encoding="utf-8"))
    if previous.get("schema") != "p97-exact5-card13-distinct-recursive-recubing-v1":
        raise AssertionError("unexpected first-level summary schema")
    unresolved = [
        item for item in previous["children"] if item["status"] == "UNKNOWN"
    ]
    unresolved.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["parent_cube_index"]),
            int(item["child_cube_index"]),
        )
    )
    expected_unknown = previous["child_status_counts"]["UNKNOWN"]
    if len(unresolved) != expected_unknown:
        raise AssertionError(
            f"UNKNOWN count drift: {len(unresolved)} != {expected_unknown}"
        )

    lineage: dict[tuple[str, int], dict[str, int]] = {}
    parents: list[dict[str, object]] = []
    for item in unresolved:
        orientation = str(item["orientation"])
        first_parent = int(item["parent_cube_index"])
        first_child = int(item["child_cube_index"])
        index = composite_index(first_parent, first_child)
        key = (orientation, index)
        if key in lineage:
            raise AssertionError(f"duplicate unresolved lineage {key}")
        lineage[key] = {
            "first_level_parent_index": first_parent,
            "first_level_child_index": first_child,
        }
        parents.append(
            {
                "orientation": orientation,
                "cube_index": index,
                "cube": item["combined_assumptions"],
                "status": item["status"],
                "conflicts": item["conflicts"],
            }
        )

    pipeline_summary = json.loads(
        (args.pipeline_dir / "summary.json").read_text(encoding="utf-8")
    )
    inputs: dict[str, dict[str, object]] = {}
    cnf_data: dict[str, tuple[int, int, str]] = {}
    for orientation in ORIENTATIONS:
        preprocessing = pipeline_summary["preprocessing"][orientation]
        simplified = Path(preprocessing["simplified_cnf_path"])
        original = args.cnf_dir / f"{orientation}.cnf"
        extension = Path(preprocessing["extension_path"])
        expected_simplified = preprocessing["simplified_cnf_inspection"]["sha256"]
        expected_original = preprocessing["original_cnf_inspection"]["sha256"]
        if level_one.sha256(simplified) != expected_simplified:
            raise AssertionError(f"{orientation} simplified CNF hash drift")
        if level_one.sha256(original) != expected_original:
            raise AssertionError(f"{orientation} original CNF hash drift")
        if level_one.sha256(extension) != preprocessing["extension_sha256"]:
            raise AssertionError(f"{orientation} extension stack hash drift")
        cnf_data[orientation] = level_one.load_cnf(simplified)
        inputs[orientation] = {
            "original_cnf_path": str(original),
            "original_cnf_sha256": expected_original,
            "simplified_cnf_path": str(simplified),
            "simplified_cnf_sha256": expected_simplified,
            "extension_path": str(extension),
            "extension_sha256": preprocessing["extension_sha256"],
        }

    if args.plan_only:
        counts = {
            orientation: sum(
                parent["orientation"] == orientation for parent in parents
            )
            for orientation in ORIENTATIONS
        }
        print(
            json.dumps(
                {
                    "selected_unknown_count": len(parents),
                    "selected_by_orientation": counts,
                    "previous_summary_sha256": level_one.sha256(
                        args.previous_summary
                    ),
                    "inputs": inputs,
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0

    rejections: list[dict[str, object]] = []
    partition_resume_counts = {
        "expected": len(parents),
        "reused": 0,
        "new": 0,
        "missing": 0,
        "rejected": 0,
    }
    partitions: list[dict[str, object]] = []
    recube_jobs: list[tuple[object, ...]] = []
    for parent in parents:
        orientation = str(parent["orientation"])
        parent_index = int(parent["cube_index"])
        variables, clauses, body = cnf_data[orientation]
        result_path = (
            args.output_dir / orientation / f"parent-{parent_index:03d}"
            / "recube" / "result.json"
        )
        result = None
        if result_path.is_file():
            try:
                result = validate_recube_result(
                    result_path,
                    parent,
                    variables,
                    clauses,
                    body,
                    args.output_dir,
                    args.child_depth,
                    args.child_limit,
                    args.recube_timeout_seconds,
                )
            except CacheValidationError as error:
                partition_resume_counts["rejected"] += 1
                rejections.append(
                    {
                        "kind": "recube",
                        "orientation": orientation,
                        "parent_cube_index": parent_index,
                        "path": str(result_path),
                        "reason": str(error),
                    }
                )
                print(
                    f"resume reject recube {orientation} {parent_index}: {error}",
                    flush=True,
                )
        else:
            partition_resume_counts["missing"] += 1
        if result is not None:
            key = (orientation, parent_index)
            result.update(lineage[key])
            partitions.append(result)
            partition_resume_counts["reused"] += 1
        else:
            recube_jobs.append(
                (
                    parent,
                    variables,
                    clauses,
                    body,
                    args.output_dir,
                    args.child_depth,
                    args.child_limit,
                    args.recube_timeout_seconds,
                )
            )

    if not args.resume_dry_run:
        for job in recube_jobs:
            parent = job[0]
            clean_recube_cell(
                args.output_dir,
                str(parent["orientation"]),
                int(parent["cube_index"]),
            )
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
            futures = [pool.submit(level_one.recube_parent, *job) for job in recube_jobs]
            for count, future in enumerate(
                concurrent.futures.as_completed(futures), start=1
            ):
                result = future.result()
                key = (
                    str(result["orientation"]),
                    int(result["parent_cube_index"]),
                )
                result.update(lineage[key])
                partitions.append(result)
                partition_resume_counts["new"] += 1
                print(
                    f"recube new [{count}/{len(recube_jobs)}] "
                    f"{result['orientation']} "
                    f"{result['first_level_parent_index']:03d}/"
                    f"{result['first_level_child_index']:02d}: "
                    f"{result['status']} children={result['child_cube_count']}",
                    flush=True,
                )
    partitions.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["parent_cube_index"]),
        )
    )

    expected_child_jobs: list[tuple[object, ...]] = []
    for partition in partitions:
        if partition["status"] != "PARTITIONED":
            continue
        orientation = str(partition["orientation"])
        variables, clauses, body = cnf_data[orientation]
        preprocessing = pipeline_summary["preprocessing"][orientation]
        simplified = Path(preprocessing["simplified_cnf_path"])
        original = args.cnf_dir / f"{orientation}.cnf"
        extension = Path(preprocessing["extension_path"])
        for child_index, raw_cube in enumerate(partition["child_cubes"]):
            expected_child_jobs.append(
                (
                    partition,
                    child_index,
                    tuple(int(value) for value in raw_cube),
                    variables,
                    clauses,
                    body,
                    simplified,
                    original,
                    extension,
                    args.output_dir,
                    args.solve_timeout_seconds,
                    args.proof_timeout_seconds,
                )
            )

    child_resume_counts = {
        "expected": len(expected_child_jobs),
        "reused": 0,
        "new": 0,
        "missing": 0,
        "rejected": 0,
    }
    child_results: list[dict[str, object]] = []
    child_jobs: list[tuple[object, ...]] = []
    for job in expected_child_jobs:
        (
            partition,
            child_index,
            child_cube,
            variables,
            clauses,
            body,
            _simplified,
            original,
            _extension,
            output_root,
            solve_timeout,
            _proof_timeout,
        ) = job
        orientation = str(partition["orientation"])
        parent_index = int(partition["parent_cube_index"])
        result_path = (
            output_root / orientation / f"parent-{parent_index:03d}"
            / f"child-{child_index:02d}" / "result.json"
        )
        result = None
        if result_path.is_file():
            try:
                result = validate_child_result(
                    result_path,
                    partition,
                    int(child_index),
                    tuple(int(value) for value in child_cube),
                    int(variables),
                    int(clauses),
                    str(body),
                    Path(original),
                    Path(output_root),
                    int(solve_timeout),
                )
            except CacheValidationError as error:
                child_resume_counts["rejected"] += 1
                rejections.append(
                    {
                        "kind": "child",
                        "orientation": orientation,
                        "parent_cube_index": parent_index,
                        "child_cube_index": child_index,
                        "path": str(result_path),
                        "reason": str(error),
                    }
                )
                print(
                    f"resume reject child {orientation} {parent_index}/"
                    f"{child_index}: {error}",
                    flush=True,
                )
        else:
            child_resume_counts["missing"] += 1
        if result is not None:
            key = (orientation, parent_index)
            result.update(lineage[key])
            child_results.append(result)
            child_resume_counts["reused"] += 1
        else:
            child_jobs.append(job)

    resume_counts = {
        "partitions": partition_resume_counts,
        "children": child_resume_counts,
    }
    if args.resume_dry_run:
        print(
            json.dumps(
                {
                    "schema": (
                        "p97-exact5-card13-distinct-level2-resume-validation-v1"
                    ),
                    "selected_unknown_count": len(parents),
                    "child_frontier_complete": not recube_jobs,
                    "resume_counts": resume_counts,
                    "would_submit": {
                        "partitions": len(recube_jobs),
                        "children_from_reused_partitions": len(child_jobs),
                    },
                    "rejections": rejections,
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0

    for job in child_jobs:
        partition, child_index = job[:2]
        clean_child_cell(
            args.output_dir,
            str(partition["orientation"]),
            int(partition["parent_cube_index"]),
            int(child_index),
        )
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(level_one.solve_child, *job) for job in child_jobs]
        for count, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            result = future.result()
            key = (str(result["orientation"]), int(result["parent_cube_index"]))
            result.update(lineage[key])
            child_results.append(result)
            child_resume_counts["new"] += 1
            print(
                f"solve new [{count}/{len(child_jobs)}] {result['orientation']} "
                f"{result['first_level_parent_index']:03d}/"
                f"{result['first_level_child_index']:02d}/"
                f"{result['child_cube_index']:02d}: {result['status']}",
                flush=True,
            )
    child_results.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["parent_cube_index"]),
            int(item["child_cube_index"]),
        )
    )

    subtrees: list[dict[str, object]] = []
    for partition in partitions:
        orientation = str(partition["orientation"])
        index = int(partition["parent_cube_index"])
        children = [
            item
            for item in child_results
            if item["orientation"] == orientation
            and int(item["parent_cube_index"]) == index
        ]
        if partition["status"] != "PARTITIONED":
            status = "UNKNOWN"
        elif any(item["status"] == "SAT" for item in children):
            status = "SAT"
        elif len(children) == partition["child_cube_count"] and all(
            item["status"] == "UNSAT" for item in children
        ):
            status = "UNSAT_CHILDREN_DRAT_VERIFIED"
        else:
            status = "UNKNOWN"
        subtrees.append(
            {
                "orientation": orientation,
                **lineage[(orientation, index)],
                "combined_first_level_assumptions": partition["parent_cube"],
                "partition_status": partition["status"],
                "child_count": len(children),
                "child_status_counts": {
                    verdict: sum(item["status"] == verdict for item in children)
                    for verdict in ("SAT", "UNSAT", "UNKNOWN")
                },
                "status": status,
            }
        )

    summary = {
        "schema": "p97-exact5-card13-distinct-recursive-recubing-level2-v1",
        "epistemic_status": "EXTERNAL_SECOND_LEVEL_REFINEMENT_ONLY",
        "scope": "exactly the checked UNKNOWN children in the input summary",
        "previous_summary_path": str(args.previous_summary),
        "previous_summary_sha256": level_one.sha256(args.previous_summary),
        "selected_unknown_count": len(parents),
        "workers": args.workers,
        "child_depth": args.child_depth,
        "child_limit": args.child_limit,
        "recube_timeout_seconds": args.recube_timeout_seconds,
        "solve_timeout_seconds_per_child": args.solve_timeout_seconds,
        "proof_timeout_seconds": args.proof_timeout_seconds,
        "inputs": inputs,
        "resume_counts": resume_counts,
        "cache_validation_rejections": rejections,
        "partition_status_counts": {
            status: sum(item["status"] == status for item in partitions)
            for status in ("PARTITIONED", "UNKNOWN")
        },
        "child_status_counts": {
            status: sum(item["status"] == status for item in child_results)
            for status in ("SAT", "UNSAT", "UNKNOWN")
        },
        "subtree_status_counts": {
            status: sum(item["status"] == status for item in subtrees)
            for status in ("SAT", "UNSAT_CHILDREN_DRAT_VERIFIED", "UNKNOWN")
        },
        "overall_status": (
            "SAT" if any(item["status"] == "SAT" for item in subtrees) else "UNKNOWN"
        ),
        "no_global_unsat_claim_reason": (
            "second-level refinement may leave UNKNOWN subtrees, and kernel "
            "source-to-CNF ingress is not yet available; first-pass UNSAT "
            "parent proofs are retained and replay-verified"
        ),
        "partitions": partitions,
        "children": child_results,
        "subtrees": subtrees,
    }
    summary_path = args.output_dir / "summary.json"
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "selected_unknown_count": len(parents),
                "partition_status_counts": summary["partition_status_counts"],
                "child_status_counts": summary["child_status_counts"],
                "subtree_status_counts": summary["subtree_status_counts"],
                "overall_status": summary["overall_status"],
                "resume_counts": summary["resume_counts"],
                "summary_path": str(summary_path),
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
