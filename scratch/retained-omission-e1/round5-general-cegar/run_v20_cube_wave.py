"""Preflight, execute, resume, and aggregate the v20 disjoint cube wave.

The default is a read-only preflight.  ``--execute`` is the explicit launch
gate.  A bounded process wave runs at most one nice+10 child per cube and at
most one child per declared worker/core.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import os
import subprocess
import sys
from collections.abc import Mapping
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

import z3

import round5_cegar_v19 as v19
import round5_cegar_v20 as v20

HERE = Path(__file__).resolve().parent


def _declared_file(directory: Path, filename: object, role: str) -> Path:
    if not isinstance(filename, str) or not filename or Path(filename).name != filename:
        raise RuntimeError(f"invalid inherited {role} filename: {filename!r}")
    path = directory / filename
    if not path.is_file():
        raise RuntimeError(f"missing inherited {role}: {path}")
    return path


def _authenticate_file_bytes(
    directory: Path, filename: object, digest: object, role: str
) -> tuple[Path, bytes]:
    path = _declared_file(directory, filename, role)
    body = path.read_bytes()
    if not isinstance(digest, str) or hashlib.sha256(body).hexdigest() != digest:
        raise RuntimeError(f"inherited {role} hash mismatch: {path}")
    return path, body


def _parse_smt_gzip(body: bytes, path: Path, role: str) -> tuple[z3.BoolRef, ...]:
    try:
        text = gzip.decompress(body).decode("utf-8")
        return tuple(z3.parse_smt2_string(text))
    except Exception as exc:
        raise RuntimeError(f"invalid inherited {role}: {path}: {exc}") from exc


def _authenticate_replayed_formula_hash(
    body: bytes, expected_sha256: object, role: str
) -> str:
    try:
        formula_body = gzip.decompress(body)
    except Exception as exc:
        raise RuntimeError(f"invalid inherited {role} gzip body") from exc
    actual = hashlib.sha256(formula_body).hexdigest()
    if not isinstance(expected_sha256, str) or actual != expected_sha256:
        raise RuntimeError(f"replayed {role} formula hash mismatch")
    return actual


def _authenticate_journal(
    directory: Path, inherited: Mapping[str, object]
) -> list[dict[str, object]]:
    expected = inherited.get("assignment_journal")
    if expected is None:
        raise RuntimeError("missing inherited assignment journal declaration")
    if not isinstance(expected, Mapping):
        raise TypeError("invalid inherited assignment journal declaration")
    journal_name = expected.get("directory")
    if (
        not isinstance(journal_name, str)
        or not journal_name
        or Path(journal_name).name != journal_name
    ):
        raise RuntimeError(f"invalid inherited assignment journal filename: {journal_name!r}")
    journal_path = directory / journal_name
    if not journal_path.is_dir():
        raise RuntimeError(f"missing inherited assignment journal: {journal_path}")
    journal = v19.AssignmentJournal(journal_path)
    recovered = journal.recover()
    if v19._journal_summary(journal) != dict(expected):
        raise RuntimeError(f"child journal is not committed by result: {directory}")
    if recovered["pending"]:
        raise RuntimeError(f"child has a pending journal proposal: {directory}")
    records = recovered["records"]
    if not isinstance(records, list) or len(records) % 2:
        raise RuntimeError(f"child journal has an unpaired record: {directory}")
    for index in range(0, len(records), 2):
        proposal = records[index]["payload"]
        outcome = records[index + 1]["payload"]
        assignment = v20._validate_assignment(proposal.get("assignment"))
        assignment_hash = v20.canonical_sha256(assignment)
        if (
            len(assignment) != v20.SEMANTIC_BOOL_COUNT
            or proposal.get("assignment_sha256") != assignment_hash
            or proposal.get("frozen_full_formula_sha256")
            != v20.TERMINAL_V19_RAW_FORMULA_SHA256
            or outcome.get("assignment_sha256") != assignment_hash
        ):
            raise RuntimeError(f"child journal proposal authentication failed: {directory}")
        if outcome.get("status") not in {"unsat", "sat", "unknown", "error"}:
            raise RuntimeError(f"invalid child journal outcome: {directory}")
        blocker = outcome.get("blocker")
        if outcome.get("status") == "unsat":
            if not isinstance(blocker, dict) or blocker.get("projected_core") != assignment:
                raise RuntimeError(f"child journal UNSAT blocker is not full: {directory}")
            sexpr = v20.blocker_from_assignment(assignment).sexpr()
            if (
                blocker.get("projected_core_sha256") != assignment_hash
                or blocker.get("blocker") != sexpr
                or blocker.get("blocker_sha256")
                != hashlib.sha256(sexpr.encode()).hexdigest()
            ):
                raise RuntimeError(f"child journal blocker hash/body mismatch: {directory}")
        elif blocker is not None:
            raise RuntimeError(f"non-UNSAT child outcome carries a blocker: {directory}")
    return records


def _authenticate_journal_trace(
    records: list[dict[str, object]],
    trace: Mapping[str, object],
    inherited: Mapping[str, object],
) -> None:
    iterations = trace.get("iterations")
    if not isinstance(iterations, list) or len(records) != 2 * len(iterations):
        raise RuntimeError("inherited journal/trace iteration count mismatch")
    blocker_hashes: list[str] = []
    previous_master_hash = inherited.get("initial_master_formula_sha256")
    for index, trace_row in enumerate(iterations):
        if not isinstance(trace_row, Mapping):
            raise TypeError("invalid inherited CEGAR trace iteration")
        proposal = records[2 * index]["payload"]
        outcome = records[2 * index + 1]["payload"]
        assignment = v20._validate_assignment(proposal.get("assignment"))
        assignment_hash = v20.canonical_sha256(assignment)
        full_check = trace_row.get("full_check")
        if not isinstance(full_check, Mapping):
            raise TypeError("inherited CEGAR trace full check missing")
        common_contract = (
            proposal.get("phase") == "proposed",
            outcome.get("phase") == "outcome",
            proposal.get("iteration") == index,
            outcome.get("iteration") == index,
            trace_row.get("iteration") == index,
            trace_row.get("assignment") == assignment,
            trace_row.get("assignment_sha256") == assignment_hash,
            full_check.get("assignment_sha256") == assignment_hash,
            outcome.get("assignment_sha256") == assignment_hash,
            outcome.get("status") == full_check.get("status"),
            outcome.get("full_check_sha256") == v20.canonical_sha256(full_check),
            trace_row.get("master_formula_sha256_before") == previous_master_hash,
        )
        if not all(common_contract):
            raise RuntimeError("inherited journal/trace iteration mismatch")
        if outcome.get("status") == "unsat":
            blocker = outcome.get("blocker")
            if not isinstance(blocker, Mapping):
                raise TypeError("inherited journal UNSAT blocker missing")
            blocker_hash = blocker.get("blocker_sha256")
            if not isinstance(blocker_hash, str):
                raise TypeError("inherited journal blocker hash missing")
            blocker_hashes.append(blocker_hash)
            cumulative_hash = v20.canonical_sha256(blocker_hashes)
            unsat_contract = (
                trace_row.get("projected_core") == blocker.get("projected_core"),
                trace_row.get("projected_core_sha256")
                == blocker.get("projected_core_sha256"),
                trace_row.get("blocker") == blocker.get("blocker"),
                trace_row.get("blocker_sha256") == blocker_hash,
                full_check.get("expected_complete_blocker_sha256") == blocker_hash,
                trace_row.get("cumulative_blocker_sha256") == cumulative_hash,
                isinstance(trace_row.get("master_formula_sha256_after"), str),
            )
            if not all(unsat_contract):
                raise RuntimeError("inherited journal/trace blocker chain mismatch")
            previous_master_hash = trace_row.get("master_formula_sha256_after")
        elif outcome.get("blocker") is not None:
            raise RuntimeError("non-UNSAT journal outcome carries a blocker")
    terminal_contract = (
        trace.get("cumulative_blocker_sha256")
        == v20.canonical_sha256(blocker_hashes),
        inherited.get("cumulative_blocker_sha256")
        == v20.canonical_sha256(blocker_hashes),
        trace.get("blocker_count") == len(blocker_hashes),
        inherited.get("blocker_count") == len(blocker_hashes),
        trace.get("final_master_formula_sha256") == previous_master_hash,
        inherited.get("final_master_formula_sha256") == previous_master_hash,
    )
    if not all(terminal_contract):
        raise RuntimeError("inherited journal/trace terminal chain mismatch")


def _authenticate_inherited_artifacts(
    directory: Path, result: Mapping[str, object]
) -> dict[str, object]:
    inherited = result.get("inherited_result")
    if not isinstance(inherited, Mapping):
        raise TypeError("child result omitted inherited result")
    if result.get("status") != inherited.get("status"):
        raise RuntimeError("child status is not bound to inherited result")
    if result.get("complete") is not inherited.get("complete"):
        raise RuntimeError("child completeness is not bound to inherited result")
    if result.get("reason_incomplete") != inherited.get("reason_incomplete"):
        raise RuntimeError("child incomplete reason is not bound to inherited result")
    if result.get("error") != inherited.get("error"):
        raise RuntimeError("child error is not bound to inherited result")
    status = inherited.get("status")
    complete = inherited.get("complete")
    if status not in {"sat", "unsat", "unknown", "budget", "error"}:
        raise RuntimeError("invalid inherited terminal status")
    if not isinstance(complete, bool) or complete != (status in {"sat", "unsat"}):
        raise RuntimeError("invalid inherited terminal completeness contract")
    if inherited.get("full_frozen_formula_sha256") != v20.TERMINAL_V19_RAW_FORMULA_SHA256:
        raise RuntimeError("inherited raw full formula hash mismatch")

    journal_records = _authenticate_journal(directory, inherited)
    trace_path, trace_body = _authenticate_file_bytes(
        directory, inherited.get("cegar_trace_file"),
        inherited.get("cegar_trace_sha256"), "CEGAR trace",
    )
    prepass_path, prepass_body = _authenticate_file_bytes(
        directory, inherited.get("boolean_prepass_file"),
        inherited.get("boolean_prepass_sha256"), "Boolean prepass",
    )
    trace = json.loads(trace_body)
    prepass = json.loads(prepass_body)
    if prepass != inherited.get("boolean_prepass"):
        raise RuntimeError("inherited Boolean prepass body/result mismatch")
    trace_contract = (
        trace.get("case_id") == v20.CASE_ID,
        trace.get("semantic_bool_count") == inherited.get("semantic_bool_count"),
        trace.get("full_frozen_formula_sha256")
        == inherited.get("full_frozen_formula_sha256"),
        trace.get("initial_master_formula_sha256")
        == inherited.get("initial_master_formula_sha256"),
        trace.get("final_master_formula_sha256")
        == inherited.get("final_master_formula_sha256"),
        trace.get("blocker_count") == inherited.get("blocker_count"),
        trace.get("cumulative_blocker_sha256")
        == inherited.get("cumulative_blocker_sha256"),
        isinstance(trace.get("iterations"), list),
        len(trace.get("iterations", [])) == inherited.get("assignment_checks"),
        len(journal_records) == 2 * inherited.get("assignment_checks", -1),
    )
    if not all(trace_contract):
        raise RuntimeError("inherited CEGAR trace/result/journal contract mismatch")
    _authenticate_journal_trace(journal_records, trace, inherited)

    blobs = inherited.get("frozen_blob_hashes")
    if not isinstance(blobs, Mapping):
        raise TypeError("inherited frozen blob hash contract missing")
    parsed: dict[str, tuple[z3.BoolRef, ...]] = {}
    blob_paths: dict[str, Path] = {}
    blob_bodies: dict[str, bytes] = {}
    for role, field in (
        ("boolean_master", "boolean_master_file"),
        ("full_frozen", "full_frozen_file"),
    ):
        blob = blobs.get(role)
        if not isinstance(blob, Mapping) or blob.get("file") != inherited.get(field):
            raise RuntimeError(f"inherited {role} filename contract mismatch")
        blob_path, blob_body = _authenticate_file_bytes(
            directory, blob.get("file"), blob.get("sha256"), role
        )
        blob_paths[role] = blob_path
        blob_bodies[role] = blob_body
        parsed[role] = _parse_smt_gzip(blob_body, blob_path, role)
    if v19.v17.raw_formula_sha256(parsed["full_frozen"]) != v20.TERMINAL_V19_RAW_FORMULA_SHA256:
        raise RuntimeError("inherited full-frozen blob does not encode the committed raw formula")

    if status == "unsat":
        _authenticate_replayed_formula_hash(
            blob_bodies["boolean_master"],
            trace.get("final_master_formula_sha256"),
            "Boolean-master",
        )
        phase = inherited.get("unsat_phase")
        if phase == "inherited_boolean_prepass":
            if prepass.get("sound_full_case_unsat") is not True:
                raise RuntimeError("UNSAT prepass phase lacks its terminal contract")
        elif phase != "replay_authenticated_boolean_master":
            raise RuntimeError("UNSAT result has an unauthenticated terminal phase")
        closure = z3.Solver()
        closure.set(timeout=30_000)
        closure.add(parsed["boolean_master"])
        if closure.check() != z3.unsat:
            raise RuntimeError("inherited Boolean-master UNSAT did not replay")
    elif status == "sat":
        _witness_path, witness_body = _authenticate_file_bytes(
            directory, inherited.get("witness_file"),
            inherited.get("witness_sha256"), "SAT witness",
        )
        _replay_sat_witness(parsed["full_frozen"], json.loads(witness_body))

    journal_summary = inherited["assignment_journal"]
    assert isinstance(journal_summary, Mapping)
    evidence_files: dict[str, dict[str, object]] = {
        "cegar_trace": {
            "file": trace_path.name,
            "sha256": inherited["cegar_trace_sha256"],
        },
        "boolean_prepass": {
            "file": prepass_path.name,
            "sha256": inherited["boolean_prepass_sha256"],
        },
    }
    for role in ("boolean_master", "full_frozen"):
        blob = blobs[role]
        assert isinstance(blob, Mapping)
        evidence_files[role] = {"file": blob["file"], "sha256": blob["sha256"]}
    if status == "sat":
        evidence_files["sat_witness"] = {
            "file": inherited["witness_file"],
            "sha256": inherited["witness_sha256"],
        }
    return {
        "files": evidence_files,
        "assignment_journal": {
            "directory": journal_summary["directory"],
            "head_sha256": journal_summary["head_sha256"],
            "completed_assignment_sha256":
            journal_summary["completed_assignment_sha256"],
            "record_count": journal_summary["record_count"],
        },
        "final_master_formula_sha256": inherited["final_master_formula_sha256"],
        "cumulative_blocker_sha256": inherited["cumulative_blocker_sha256"],
    }


def _replay_sat_witness(
    raw_assertions: tuple[z3.BoolRef, ...], witness: object
) -> None:
    if not isinstance(witness, dict):
        raise TypeError("invalid inherited SAT witness")
    encoding = v20.v16.Encoding(v20.CASE, timeout_ms=30_000, seed=97)
    solver = z3.Solver()
    solver.set(timeout=30_000)
    solver.add(raw_assertions)

    blockers = witness.get("blockers")
    if not isinstance(blockers, dict):
        raise TypeError("SAT witness blockers missing")
    points = sorted({q for q, _ in encoding.block})
    centers = sorted({c for _, c in encoding.block})
    if set(blockers) != {str(q) for q in points}:
        raise RuntimeError("SAT witness blocker domain mismatch")
    for q in points:
        value = blockers[str(q)]
        if isinstance(value, int):
            selected = {value}
        elif isinstance(value, list) and all(isinstance(item, int) for item in value):
            selected = set(value)
        else:
            raise RuntimeError("SAT witness blocker value mismatch")
        if not selected.issubset(set(centers)):
            raise RuntimeError("SAT witness blocker value mismatch")
        for center in centers:
            solver.add(encoding.block[q, center] == (center in selected))

    def bind_rows(
        rows: object, key_fields: tuple[str, ...], table: Mapping[object, object]
    ) -> None:
        if not isinstance(rows, list):
            raise TypeError("SAT witness row family missing")
        indexed = {tuple(row.get(key) for key in key_fields): row for row in rows if isinstance(row, dict)}
        if len(indexed) != len(rows) or set(indexed) != set(table):
            raise RuntimeError("SAT witness row domain mismatch")
        for key, data in table.items():
            row = indexed[key]
            support_vars, radius = data
            support = row.get("support")
            if not isinstance(support, list):
                raise TypeError("SAT witness support missing")
            selected = set(support)
            for point, variable in support_vars.items():
                solver.add(variable == (point in selected))
            solver.add(radius == z3.RealVal(str(row.get("radius"))))

    used_centers = {center for q in points for center in centers if center in ({blockers[str(q)]} if isinstance(blockers[str(q)], int) else set(blockers[str(q)]))}
    critical_table = {
        (center,): ({point: encoding.row[center, point] for point in points}, encoding.row_radius[center])
        for center in used_centers
    }
    bind_rows(witness.get("critical_rows"), ("center",), critical_table)
    k4_table = {
        (center,): ({point: encoding.k4[center, point] for point in points}, encoding.k4_radius[center])
        for center in sorted({center for center, _ in encoding.k4})
    }
    bind_rows(witness.get("global_k4"), ("center",), k4_table)
    rich_table = {
        key: ({point: data["support"][point] for point in points}, data["radius"])
        for key, data in encoding.rich.items()
    }
    bind_rows(witness.get("rich_classes"), ("apex_index", "class"), rich_table)

    packets = witness.get("packets")
    if not isinstance(packets, list):
        raise TypeError("SAT witness packets missing")
    packet_rows = {row.get("name"): row for row in packets if isinstance(row, dict)}
    packet_defs = {packet["name"]: packet for packet in encoding.packets}
    if len(packet_rows) != len(packets) or set(packet_rows) != set(packet_defs):
        raise RuntimeError("SAT witness packet domain mismatch")
    for name, packet in packet_defs.items():
        row = packet_rows[name]
        for side in ("B1", "B2"):
            selected = set(row.get(side, []))
            for point, variable in enumerate(packet[side]):
                solver.add(variable == (point in selected))
        solver.add(packet["radius1"] == z3.RealVal(str(row.get("radius1"))))
        solver.add(packet["radius2"] == z3.RealVal(str(row.get("radius2"))))

    distances = witness.get("distances")
    expected_distances = {f"{i}-{j}": variable for (i, j), variable in encoding.distance.items()}
    if not isinstance(distances, dict) or set(distances) != set(expected_distances):
        raise RuntimeError("SAT witness distance domain mismatch")
    for name, variable in expected_distances.items():
        solver.add(variable == z3.RealVal(str(distances[name])))
    if solver.check() != z3.sat:
        raise RuntimeError("SAT witness failed raw-formula replay")
    if encoding.serialize_model(solver.model()) != witness:
        raise RuntimeError("SAT witness replay model serialization mismatch")


def authenticate_child_directory(
    directory: Path,
    manifest: Mapping[str, object],
    cube: Mapping[str, object],
) -> dict[str, object]:
    result_path = directory / "cube-result.json"
    attestation_path = directory / "child-attestation.json"
    if not result_path.is_file() or not attestation_path.is_file():
        raise RuntimeError(f"incomplete child artifact: {directory}")
    result_body = result_path.read_bytes()
    attestation_body = attestation_path.read_bytes()
    attestation = json.loads(attestation_body)
    expected_hash = hashlib.sha256(result_body).hexdigest()
    if attestation != {
        "cube_id": cube["cube_id"],
        "cube_result_file": result_path.name,
        "cube_result_sha256": expected_hash,
        "manifest_sha256": manifest["manifest_sha256"],
    }:
        raise RuntimeError(f"child result attestation mismatch: {directory}")
    result = json.loads(result_body)
    admission = result.get("master_only_admission", {})
    inherited_result = result.get("inherited_result", {})
    admitted_master_hash = admission.get("master_formula_sha256_after_admission")
    inherited_initial_master_hash = inherited_result.get(
        "initial_master_formula_sha256"
    )
    checks = (
        result.get("schema_version") == 20,
        result.get("kind") == "v20-cube-child",
        result.get("cube_id") == cube["cube_id"],
        result.get("cube_assignment") == cube["assignment"],
        result.get("cube_assignment_sha256") == cube["assignment_sha256"],
        result.get("manifest_sha256") == manifest["manifest_sha256"],
        result.get("raw_full_formula_sha256") == v20.TERMINAL_V19_RAW_FORMULA_SHA256,
        result.get("imported_full_blocker_count") == v20.TERMINAL_V19_BLOCKER_COUNT,
        result.get("imported_full_blockers_sha256") ==
        manifest["terminal_v19"]["full_blockers_sha256"],
        result.get("v19_terminal_summary_sha256") ==
        manifest["terminal_v19"]["summary_sha256"],
        admission.get("full_blocker_count") ==
        v20.TERMINAL_V19_BLOCKER_COUNT,
        admission.get("full_blockers_sha256") ==
        manifest["terminal_v19"]["full_blockers_sha256"],
        admission.get("cube_id") == cube["cube_id"],
        admission.get("cube_assignment_sha256") ==
        cube["assignment_sha256"],
        admission.get("raw_full_formula_augmented") is False,
        admission.get("constraint_destination") ==
        "boolean_master_only",
        isinstance(admitted_master_hash, str)
        and len(admitted_master_hash) == 64
        and all(
            character in "0123456789abcdef"
            for character in admitted_master_hash
        )
        and admitted_master_hash == inherited_initial_master_hash,
    )
    if not all(checks):
        raise RuntimeError(f"child resume contract mismatch: {directory}")
    inherited_evidence = _authenticate_inherited_artifacts(directory, result)
    evidence = {
        "cube_result": {"file": result_path.name, "sha256": expected_hash},
        "child_attestation": {
            "file": attestation_path.name,
            "sha256": hashlib.sha256(attestation_body).hexdigest(),
        },
        "inherited": inherited_evidence,
    }
    authenticated = dict(result)
    authenticated["authenticated_evidence"] = evidence
    authenticated["authenticated_evidence_sha256"] = v20.canonical_sha256(evidence)
    return authenticated


def _attest_child(case_dir: Path, manifest: Mapping[str, object], cube: Mapping[str, object]) -> None:
    result_path = case_dir / "cube-result.json"
    v20.atomic_write_json(case_dir / "child-attestation.json", {
        "cube_id": cube["cube_id"],
        "cube_result_file": result_path.name,
        "cube_result_sha256": v20.file_sha256(result_path),
        "manifest_sha256": manifest["manifest_sha256"],
    })


def resolve_workers(requested: int, cube_count: int, cpu_count: int | None = None) -> int:
    available = cpu_count if cpu_count is not None else (os.cpu_count() or 1)
    if requested <= 0:
        raise ValueError("v20 workers must be positive")
    if requested > available:
        raise ValueError(f"v20 workers={requested} exceeds available cores={available}")
    return min(requested, cube_count)


def _pid_is_alive(pid: int) -> bool:
    if pid == os.getpid():
        return False  # Cleanup runs before this process creates any cube staging tree.
    try:
        os.kill(pid, 0)
    except ProcessLookupError:
        return False
    except PermissionError:
        return True
    return True


def quarantine_stale_staging(root: Path, cube_id: str) -> list[Path]:
    quarantined: list[Path] = []
    quarantine_root = root / ".quarantine-v20"
    for pending in sorted(root.glob(f".{cube_id}.pending.*"), key=lambda path: path.name):
        suffix = pending.name.rsplit(".", 1)[-1]
        if not suffix.isdigit():
            raise RuntimeError(f"invalid v20 staging name: {pending}")
        if _pid_is_alive(int(suffix)):
            raise RuntimeError(f"live v20 staging lease exists: {pending}")
        quarantine_root.mkdir(exist_ok=True)
        target = quarantine_root / pending.name
        ordinal = 1
        while target.exists():
            target = quarantine_root / f"{pending.name}.{ordinal}"
            ordinal += 1
        os.replace(pending, target)
        quarantined.append(target)
    return quarantined


def _run_one_cube(
    args: argparse.Namespace,
    root: Path,
    manifest_path: Path,
    manifest: Mapping[str, object],
    cube: Mapping[str, object],
) -> dict[str, object]:
    cube_id = str(cube["cube_id"])
    staging = root / f".{cube_id}.pending.{os.getpid()}"
    staging.mkdir(exist_ok=False)
    command = [
        "nice", "-n", "10", sys.executable, str(v20.SCRIPT_PATH), "child",
        "--manifest", str(manifest_path), "--cube-id", cube_id,
        "--out-dir", str(staging), "--timeout-ms", str(args.timeout_ms),
        "--bool-timeout-ms", str(args.bool_timeout_ms),
        "--replay-timeout-ms", str(args.replay_timeout_ms),
        "--max-assignments", str(args.max_assignments), "--seed", str(args.seed),
    ]
    completed = subprocess.run(command, check=False)
    if completed.returncode != 0:
        raise RuntimeError(f"v20 child failed for {cube_id}: exit {completed.returncode}")
    case_dir = staging / v20.CASE_ID
    if not case_dir.is_dir():
        raise RuntimeError(f"v20 child omitted case directory for {cube_id}")
    _attest_child(case_dir, manifest, cube)
    final_dir = root / cube_id
    os.replace(case_dir, final_dir)
    os.rmdir(staging)
    return authenticate_child_directory(final_dir, manifest, cube)


def run_wave(args: argparse.Namespace, manifest: dict[str, object]) -> dict[str, object]:
    root = args.artifacts.resolve()
    root.mkdir(parents=True, exist_ok=True)
    manifest_path = root / "manifest-v20.json"
    if manifest_path.exists():
        existing = json.loads(manifest_path.read_text())
        v20.authenticate_manifest(existing)
        if existing["manifest_sha256"] != manifest["manifest_sha256"]:
            raise RuntimeError("resume manifest differs from current authenticated preflight")
    else:
        v20.atomic_write_json(manifest_path, manifest)

    results: dict[str, dict[str, object]] = {}
    pending: list[dict[str, object]] = []
    for cube in manifest["cubes"]:
        cube_id = str(cube["cube_id"])
        quarantine_stale_staging(root, cube_id)
        final_dir = root / cube_id
        if final_dir.exists():
            try:
                results[cube_id] = authenticate_child_directory(final_dir, manifest, cube)
            except Exception as exc:  # noqa: BLE001 - corrupt resume must fail closed.
                results[cube_id] = {
                    "cube_id": cube_id,
                    "manifest_sha256": manifest["manifest_sha256"],
                    "status": "error",
                    "complete": False,
                    "error": f"resume authentication: {type(exc).__name__}: {exc}",
                }
        else:
            pending.append(cube)

    worker_count = resolve_workers(args.workers, len(manifest["cubes"]))
    with ThreadPoolExecutor(max_workers=worker_count) as pool:
        futures = {
            pool.submit(_run_one_cube, args, root, manifest_path, manifest, cube): cube
            for cube in pending
        }
        for future in as_completed(futures):
            cube = futures[future]
            cube_id = str(cube["cube_id"])
            try:
                results[cube_id] = future.result()
            except Exception as exc:  # noqa: BLE001 - child failures become UNKNOWN.
                results[cube_id] = {
                    "cube_id": cube_id,
                    "manifest_sha256": manifest["manifest_sha256"],
                    "status": "error",
                    "complete": False,
                    "error": f"{type(exc).__name__}: {exc}",
                }
            aggregate = v20.aggregate_cube_results(manifest, results)
            v20.atomic_write_json(root / "aggregate-v20.json", aggregate)

    aggregate = v20.aggregate_cube_results(manifest, results)
    v20.atomic_write_json(root / "aggregate-v20.json", aggregate)
    return aggregate


def parser() -> argparse.ArgumentParser:
    result = argparse.ArgumentParser(description=__doc__)
    result.add_argument("--summary", type=Path, default=v20.TERMINAL_V19_SUMMARY)
    result.add_argument("--split-bool", action="append", dest="split_bools")
    result.add_argument("--manifest-out", type=Path)
    result.add_argument("--execute", action="store_true",
                        help="explicitly launch the bounded parallel nice+10 cube wave")
    result.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v20-cube-wave")
    result.add_argument("--timeout-ms", type=int, default=3_600_000)
    result.add_argument("--bool-timeout-ms", type=int, default=30_000)
    result.add_argument("--replay-timeout-ms", type=int, default=30_000)
    result.add_argument("--max-assignments", type=int, default=256)
    result.add_argument("--workers", type=int, default=16,
                        help="bounded child-process workers (default 16; one process/core max)")
    result.add_argument("--seed", type=int, default=97)
    return result


def main() -> int:
    args = parser().parse_args()
    terminal = v20.authenticate_v19_terminal(args.summary)
    split = tuple(args.split_bools or v20.DEFAULT_SPLIT_BOOLS)
    manifest = v20.build_manifest(terminal, split)
    if args.manifest_out:
        v20.atomic_write_json(args.manifest_out, manifest)
    if not args.execute:
        print(json.dumps({
            "mode": "preflight", "solver_launched": False,
            "cube_count": manifest["cube_count"],
            "planned_workers": resolve_workers(args.workers, manifest["cube_count"]),
            "manifest_sha256": manifest["manifest_sha256"],
            "joint_counts": manifest["terminal_proposal_joint_counts"],
        }, sort_keys=True))
        return 0
    aggregate = run_wave(args, manifest)
    print(json.dumps({
        "mode": "execute", "status": aggregate["status"],
        "complete": aggregate["complete"], "conditional_unsat": aggregate["conditional_unsat"],
        "artifacts": str(args.artifacts.resolve()),
    }, sort_keys=True))
    return 0 if aggregate["complete"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
