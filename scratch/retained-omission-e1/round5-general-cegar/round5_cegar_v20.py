"""Sound disjoint-cube successor to the terminal v19 full-blocker run.

The v19 blockers and the cube literals are admitted only to the Boolean master.
Every proposed assignment is still checked by v19 against the unmodified raw
full formula.  This module is preflight-only unless the private ``child``
command is selected explicitly by the wave coordinator.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
from collections.abc import Mapping, Sequence
from pathlib import Path

import z3

import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v19 as v19

HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v20.json"
SCHEMA_VERSION = 20
CASE = v16.Case("fresh", "DDD", 0, 2, 1)
CASE_ID = CASE.case_id

TERMINAL_V19_SUMMARY = (
    HERE / "artifacts-v19-production1" /
    "20260802T153331.017335Z-case-pid34172" / "summary.json"
)
TERMINAL_V19_SUMMARY_SHA256 = (
    "327dd9f3df4d4bc36b77bc1866eae8933abf083e4c017899ebead6f9602796b9"
)
TERMINAL_V19_RESULT_SHA256 = (
    "8e1a13271686fb558dc71d95db127afef06a9ba3f2cf28808fe9a30f04c8178a"
)
TERMINAL_V19_RAW_FORMULA_SHA256 = (
    "bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720"
)
TERMINAL_V19_BLOCKER_COUNT = 190
SEMANTIC_BOOL_COUNT = 825

# Balanced choice from the 190 terminal proposals: all sixteen observed cells
# are occupied (6--14 samples each).  These counts select work granularity;
# soundness uses the complete 2^4 truth-table partition below, not the sample.
DEFAULT_SPLIT_BOOLS = (
    "block_12_4", "block_5_4", "block_6_11", "k4_14_9",
)


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def canonical_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def atomic_write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    data = canonical_bytes(value) + b"\n"
    descriptor = os.open(temporary, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o644)
    try:
        if os.write(descriptor, data) != len(data):
            raise RuntimeError("short atomic JSON write")
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    os.replace(temporary, path)
    descriptor = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _expect(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def _validate_assignment(value: object) -> list[dict[str, object]]:
    _expect(isinstance(value, list), "journal assignment is not a list")
    assignment: list[dict[str, object]] = []
    for item in value:
        _expect(isinstance(item, dict), "journal assignment item is not an object")
        name, bit = item.get("bool"), item.get("value")
        _expect(isinstance(name, str) and isinstance(bit, bool), "invalid assignment literal")
        assignment.append({"bool": name, "value": bit})
    names = [str(item["bool"]) for item in assignment]
    _expect(names == sorted(names) and len(set(names)) == len(names),
            "assignment Bool universe is not sorted and unique")
    return assignment


def blocker_from_assignment(assignment: Sequence[Mapping[str, object]]) -> z3.BoolRef:
    literals = []
    for item in assignment:
        variable = z3.Bool(str(item["bool"]))
        literals.append(z3.Not(variable) if item["value"] is True else variable)
    return z3.Or(*literals) if literals else z3.BoolVal(False)


def authenticate_v19_terminal(
    summary_path: Path = TERMINAL_V19_SUMMARY,
    *,
    expected_summary_sha256: str = TERMINAL_V19_SUMMARY_SHA256,
) -> dict[str, object]:
    """Authenticate the exact terminal summary and all 190 full blockers."""
    summary_path = summary_path.resolve()
    _expect(summary_path.is_file(), f"missing v19 summary: {summary_path}")
    summary_hash = file_sha256(summary_path)
    _expect(summary_hash == expected_summary_sha256, "v19 summary SHA-256 mismatch")
    summary = json.loads(summary_path.read_text())
    _expect(summary.get("schema_version") == 19, "terminal summary is not schema v19")
    _expect(summary.get("complete") is False and summary.get("counts") == {"unknown": 1},
            "v19 terminal status contract changed")
    rows = summary.get("results")
    _expect(isinstance(rows, list) and len(rows) == 1, "v19 summary is not one exact case")
    attested = rows[0]
    _expect(isinstance(attested, dict) and attested.get("case_id") == CASE_ID,
            "v19 summary case mismatch")
    result_path = summary_path.parent / CASE_ID / "result.json"
    result_hash = file_sha256(result_path)
    _expect(result_hash == attested.get("result_file_sha256"),
            "v19 result external attestation mismatch")
    if expected_summary_sha256 == TERMINAL_V19_SUMMARY_SHA256:
        _expect(result_hash == TERMINAL_V19_RESULT_SHA256, "terminal v19 result SHA-256 mismatch")
    result = json.loads(result_path.read_text())
    _expect(result.get("case") == {
        "arm": "fresh", "profiles": "DDD", "kept": 0, "deleted": 2, "fresh": 1
    }, "v19 exact case payload mismatch")
    _expect(result.get("status") == "unknown" and result.get("complete") is False,
            "v19 terminal result is not fail-closed UNKNOWN")
    _expect(result.get("reason_incomplete") == "v19_wall_clock_budget_exhausted",
            "v19 terminal reason changed")
    _expect(result.get("blocker_count") == TERMINAL_V19_BLOCKER_COUNT,
            "v19 terminal blocker count mismatch")
    _expect(result.get("semantic_bool_count") == SEMANTIC_BOOL_COUNT,
            "v19 semantic Bool count mismatch")
    raw_hash = result.get("full_frozen_formula_sha256")
    _expect(raw_hash == TERMINAL_V19_RAW_FORMULA_SHA256,
            "v19 raw full-formula identity mismatch")
    blobs = result.get("frozen_blob_hashes")
    _expect(isinstance(blobs, dict), "v19 frozen blob attestations missing")
    for role in ("boolean_master", "full_frozen"):
        blob = blobs.get(role)
        _expect(isinstance(blob, dict), f"v19 {role} blob attestation missing")
        blob_path = result_path.parent / str(blob.get("file"))
        _expect(blob_path.is_file() and file_sha256(blob_path) == blob.get("sha256"),
                f"v19 {role} frozen blob hash mismatch")
    for file_key, hash_key in (
        ("boolean_prepass_file", "boolean_prepass_sha256"),
        ("cegar_trace_file", "cegar_trace_sha256"),
    ):
        artifact_path = result_path.parent / str(result.get(file_key))
        _expect(artifact_path.is_file() and file_sha256(artifact_path) == result.get(hash_key),
                f"v19 {file_key} hash mismatch")

    journal_info = result.get("assignment_journal")
    _expect(isinstance(journal_info, dict), "v19 journal summary missing")
    journal_path = result_path.parent / str(journal_info.get("directory"))
    journal = v19.AssignmentJournal(journal_path)
    recovered = journal.recover()
    actual_summary = v19._journal_summary(journal)
    _expect(actual_summary == journal_info, "v19 journal summary/hash-chain mismatch")
    _expect(actual_summary["record_count"] == 380, "v19 journal record count mismatch")
    _expect(actual_summary["completed_assignment_count"] == TERMINAL_V19_BLOCKER_COUNT,
            "v19 completed blocker count mismatch")
    _expect(actual_summary["pending_assignment_count"] == 0,
            "v19 terminal journal has a pending assignment")

    blockers: list[list[dict[str, object]]] = []
    blocker_hashes: list[str] = []
    proposal_counts = {name: {"false": 0, "true": 0} for name in DEFAULT_SPLIT_BOOLS}
    records = recovered["records"]
    _expect(isinstance(records, list) and len(records) == 380, "invalid recovered journal")
    for index in range(0, len(records), 2):
        proposed = records[index]["payload"]
        outcome = records[index + 1]["payload"]
        _expect(proposed.get("phase") == "proposed" and outcome.get("phase") == "outcome",
                "v19 proposal/outcome records are not paired")
        assignment = _validate_assignment(proposed.get("assignment"))
        assignment_hash = canonical_sha256(assignment)
        _expect(len(assignment) == SEMANTIC_BOOL_COUNT, "v19 blocker is not a full assignment")
        _expect(proposed.get("assignment_sha256") == assignment_hash,
                "v19 proposal assignment hash mismatch")
        _expect(proposed.get("frozen_full_formula_sha256") == raw_hash,
                "v19 proposal raw-formula hash mismatch")
        _expect(outcome.get("assignment_sha256") == assignment_hash and
                outcome.get("status") == "unsat", "v19 full assignment did not close UNSAT")
        blocker = outcome.get("blocker")
        _expect(isinstance(blocker, dict), "v19 UNSAT outcome has no blocker")
        _expect(blocker.get("projected_core") == assignment,
                "v19 blocker is projected rather than the full assignment")
        _expect(blocker.get("projected_core_sha256") == assignment_hash,
                "v19 blocker assignment hash mismatch")
        sexpr = blocker_from_assignment(assignment).sexpr()
        _expect(blocker.get("blocker") == sexpr and
                blocker.get("blocker_sha256") == hashlib.sha256(sexpr.encode()).hexdigest(),
                "v19 blocker SMT/hash mismatch")
        blocker_hashes.append(str(blocker["blocker_sha256"]))
        values = {str(item["bool"]): bool(item["value"]) for item in assignment}
        for name in DEFAULT_SPLIT_BOOLS:
            _expect(name in values, f"split Bool absent from v19 universe: {name}")
            proposal_counts[name]["true" if values[name] else "false"] += 1
        blockers.append(assignment)
    _expect(result.get("cumulative_blocker_sha256") == canonical_sha256(blocker_hashes),
            "v19 cumulative blocker hash mismatch")

    return {
        "summary_path": str(summary_path),
        "summary_sha256": summary_hash,
        "result_path": str(result_path),
        "result_sha256": result_hash,
        "journal_path": str(journal_path),
        "journal": actual_summary,
        "case_id": CASE_ID,
        "raw_full_formula_sha256": raw_hash,
        "semantic_bool_count": SEMANTIC_BOOL_COUNT,
        "full_blocker_count": len(blockers),
        "full_blockers_sha256": canonical_sha256(blockers),
        "blockers": blockers,
        "split_marginals": proposal_counts,
    }


def make_partition(split_bools: Sequence[str] = DEFAULT_SPLIT_BOOLS) -> list[dict[str, object]]:
    names = tuple(split_bools)
    _expect(bool(names) and len(names) == len(set(names)), "split Bool names must be nonempty/unique")
    cubes = []
    for index, bits in enumerate(itertools.product((False, True), repeat=len(names))):
        assignment = [{"bool": name, "value": bit} for name, bit in zip(names, bits)]
        cube_hash = canonical_sha256(assignment)
        cubes.append({
            "cube_id": f"cube-{index:03d}-{cube_hash[:12]}",
            "index": index,
            "assignment": assignment,
            "assignment_sha256": cube_hash,
        })
    validate_partition(names, cubes)
    return cubes


def validate_partition(split_bools: Sequence[str], cubes: Sequence[Mapping[str, object]]) -> None:
    names = tuple(split_bools)
    _expect(len(names) == len(set(names)), "partition split names are not unique")
    expected = set(itertools.product((False, True), repeat=len(names)))
    observed: set[tuple[bool, ...]] = set()
    ids: set[str] = set()
    for cube in cubes:
        assignment = _validate_assignment(cube.get("assignment"))
        _expect([item["bool"] for item in assignment] == list(names),
                "cube does not assign exactly the declared split Bools in order")
        bits = tuple(bool(item["value"]) for item in assignment)
        _expect(bits not in observed, "partition cubes overlap")
        observed.add(bits)
        cube_id = cube.get("cube_id")
        _expect(isinstance(cube_id, str) and cube_id not in ids, "duplicate cube id")
        ids.add(cube_id)
        _expect(cube.get("assignment_sha256") == canonical_sha256(assignment),
                "cube assignment hash mismatch")
    _expect(observed == expected, "partition is not exhaustive")


def _joint_counts(blockers: Sequence[Sequence[Mapping[str, object]]], names: Sequence[str]) -> dict[str, int]:
    result = {"".join("1" if bit else "0" for bit in bits): 0
              for bits in itertools.product((False, True), repeat=len(names))}
    for assignment in blockers:
        values = {str(item["bool"]): bool(item["value"]) for item in assignment}
        key = "".join("1" if values[name] else "0" for name in names)
        result[key] += 1
    return result


def build_manifest(terminal: Mapping[str, object], split_bools: Sequence[str] = DEFAULT_SPLIT_BOOLS) -> dict[str, object]:
    cubes = make_partition(split_bools)
    blockers = terminal.get("blockers")
    _expect(isinstance(blockers, list), "authenticated terminal blockers missing")
    core = {
        "schema_version": SCHEMA_VERSION,
        "kind": "v20-disjoint-cube-wave",
        "case_id": CASE_ID,
        "split_bools": list(split_bools),
        "cube_count": len(cubes),
        "partition_exhaustive": True,
        "partition_pairwise_disjoint": True,
        "cubes": cubes,
        "terminal_v19": {key: terminal[key] for key in (
            "summary_path", "summary_sha256", "result_path", "result_sha256",
            "journal_path", "journal", "raw_full_formula_sha256",
            "semantic_bool_count", "full_blocker_count", "full_blockers_sha256",
        )},
        "terminal_proposal_joint_counts": _joint_counts(blockers, split_bools),
        "empirical_counts_are_soundness_inputs": False,
        "admission": {
            "v19_full_blockers": "boolean_master_only",
            "cube_literals": "boolean_master_only",
            "raw_full_formula_augmented": False,
            "assignment_replay": "v19 primary plus fresh normalized raw full formula",
        },
        "script_sha256": file_sha256(SCRIPT_PATH),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "runner_sha256": file_sha256(HERE / "run_v20_cube_wave.py"),
        "focused_test_source_sha256": file_sha256(HERE / "test_round5_cegar_v20.py"),
        "design_note_sha256": file_sha256(HERE / "V20-CUBE-WAVE.md"),
        "base_v19_script_sha256": file_sha256(HERE / "round5_cegar_v19.py"),
        "base_v19_schema_sha256": file_sha256(HERE / "schema_v19.json"),
    }
    core["manifest_sha256"] = canonical_sha256(core)
    return core


def authenticate_manifest(manifest: Mapping[str, object]) -> None:
    core = dict(manifest)
    digest = core.pop("manifest_sha256", None)
    _expect(digest == canonical_sha256(core), "v20 manifest hash mismatch")
    _expect(core.get("schema_version") == 20 and core.get("case_id") == CASE_ID,
            "v20 manifest identity mismatch")
    for key, path in (
        ("script_sha256", SCRIPT_PATH),
        ("schema_sha256", SCHEMA_PATH),
        ("runner_sha256", HERE / "run_v20_cube_wave.py"),
        ("focused_test_source_sha256", HERE / "test_round5_cegar_v20.py"),
        ("design_note_sha256", HERE / "V20-CUBE-WAVE.md"),
        ("base_v19_script_sha256", HERE / "round5_cegar_v19.py"),
        ("base_v19_schema_sha256", HERE / "schema_v19.json"),
    ):
        _expect(core.get(key) == file_sha256(path), f"v20 source contract drift: {key}")
    cubes = core.get("cubes")
    split = core.get("split_bools")
    _expect(isinstance(cubes, list) and isinstance(split, list), "v20 partition missing")
    validate_partition(split, cubes)
    _expect(core.get("cube_count") == len(cubes), "v20 cube count mismatch")
    _expect(core.get("partition_exhaustive") is True and
            core.get("partition_pairwise_disjoint") is True,
            "v20 partition proof flags missing")


def admit_master_only(
    master: z3.Solver,
    full_blockers: Sequence[Sequence[Mapping[str, object]]],
    cube: Mapping[str, object],
) -> dict[str, object]:
    assignment = _validate_assignment(cube.get("assignment"))
    for blocker in full_blockers:
        master.add(blocker_from_assignment(blocker))
    for item in assignment:
        master.add(z3.Bool(str(item["bool"])) == z3.BoolVal(bool(item["value"])))
    return {
        "full_blocker_count": len(full_blockers),
        "full_blockers_sha256": canonical_sha256(full_blockers),
        "cube_id": cube.get("cube_id"),
        "cube_assignment_sha256": canonical_sha256(assignment),
        "master_formula_sha256_after_admission": v16.formula_sha256(master),
        "raw_full_formula_augmented": False,
        "constraint_destination": "boolean_master_only",
    }


def aggregate_cube_results(
    manifest: Mapping[str, object],
    results: Mapping[str, Mapping[str, object]],
) -> dict[str, object]:
    authenticate_manifest(manifest)
    cubes = manifest["cubes"]
    assert isinstance(cubes, list)
    expected_ids = [str(cube["cube_id"]) for cube in cubes]
    _expect(set(results).issubset(set(expected_ids)), "result for undeclared cube")
    missing = [cube_id for cube_id in expected_ids if cube_id not in results]
    unresolved = []
    closed = []
    sat = []
    authenticated_children = []
    for cube_id in expected_ids:
        if cube_id not in results:
            continue
        row = results[cube_id]
        _expect(row.get("cube_id") == cube_id, "child cube identity mismatch")
        _expect(row.get("manifest_sha256") == manifest["manifest_sha256"],
                "child manifest identity mismatch")
        status = row.get("status")
        complete = row.get("complete") is True
        evidence = row.get("authenticated_evidence")
        evidence_sha256 = row.get("authenticated_evidence_sha256")
        inherited_evidence = evidence.get("inherited") if isinstance(evidence, Mapping) else None
        evidence_files = (
            inherited_evidence.get("files")
            if isinstance(inherited_evidence, Mapping) else None
        )
        journal_evidence = (
            inherited_evidence.get("assignment_journal")
            if isinstance(inherited_evidence, Mapping) else None
        )
        required_file_roles = {
            "cegar_trace", "boolean_prepass", "boolean_master", "full_frozen"
        } | ({"sat_witness"} if status == "sat" else set())

        def sha256_value(value: object) -> bool:
            return (
                isinstance(value, str)
                and len(value) == 64
                and all(character in "0123456789abcdef" for character in value)
            )

        evidence_valid = (
            isinstance(evidence, Mapping)
            and sha256_value(evidence_sha256)
            and canonical_sha256(evidence) == evidence_sha256
            and isinstance(evidence.get("cube_result"), Mapping)
            and evidence["cube_result"].get("file") == "cube-result.json"
            and sha256_value(evidence["cube_result"].get("sha256"))
            and isinstance(evidence.get("child_attestation"), Mapping)
            and evidence["child_attestation"].get("file") == "child-attestation.json"
            and sha256_value(evidence["child_attestation"].get("sha256"))
            and isinstance(evidence_files, Mapping)
            and set(evidence_files) == required_file_roles
            and all(
                isinstance(item, Mapping)
                and isinstance(item.get("file"), str)
                and Path(item["file"]).name == item["file"]
                and sha256_value(item.get("sha256"))
                for item in evidence_files.values()
            )
            and isinstance(journal_evidence, Mapping)
            and isinstance(journal_evidence.get("directory"), str)
            and Path(journal_evidence["directory"]).name
            == journal_evidence["directory"]
            and sha256_value(journal_evidence.get("head_sha256"))
            and sha256_value(journal_evidence.get("completed_assignment_sha256"))
            and isinstance(journal_evidence.get("record_count"), int)
            and journal_evidence["record_count"] >= 0
            and sha256_value(inherited_evidence.get("final_master_formula_sha256"))
            and sha256_value(inherited_evidence.get("cumulative_blocker_sha256"))
        )
        if evidence_valid:
            authenticated_children.append({
                "cube_id": cube_id,
                "status": status,
                "complete": complete,
                "cube_result_sha256": evidence["cube_result"]["sha256"],
                "child_attestation_sha256":
                evidence["child_attestation"]["sha256"],
                "authenticated_evidence_sha256": evidence_sha256,
                "authenticated_evidence": evidence,
            })
        if status == "unsat" and complete and evidence_valid:
            closed.append(cube_id)
        elif status == "sat" and complete and evidence_valid:
            sat.append(cube_id)
        else:
            unresolved.append({"cube_id": cube_id, "status": status,
                               "complete": row.get("complete"),
                               "evidence_authenticated": evidence_valid})
    all_closed = not missing and not unresolved and not sat and len(closed) == len(expected_ids)
    if all_closed:
        status, complete = "unsat", True
    elif sat:
        status, complete = "sat", True
    else:
        status, complete = "unknown", False
    return {
        "schema_version": 20,
        "kind": "v20-cube-wave-aggregate",
        "manifest_sha256": manifest["manifest_sha256"],
        "case_id": CASE_ID,
        "status": status,
        "complete": complete,
        "conditional_unsat": all_closed,
        "declared_cube_count": len(expected_ids),
        "closed_unsat_cube_count": len(closed),
        "missing_cube_ids": missing,
        "unresolved_cubes": unresolved,
        "sat_cube_ids": sat,
        "authenticated_children": authenticated_children,
        "closure_rule": "UNSAT iff every cube in the authenticated exhaustive disjoint partition closes UNSAT",
    }


def run_child(
    manifest_path: Path,
    cube_id: str,
    out_dir: Path,
    *,
    timeout_ms: int,
    bool_timeout_ms: int,
    replay_timeout_ms: int,
    max_assignments: int,
    seed: int,
) -> dict[str, object]:
    manifest = json.loads(manifest_path.read_text())
    authenticate_manifest(manifest)
    terminal = authenticate_v19_terminal(Path(manifest["terminal_v19"]["summary_path"]))
    _expect(terminal["summary_sha256"] == manifest["terminal_v19"]["summary_sha256"],
            "live terminal v19 summary no longer matches manifest")
    cube = next((item for item in manifest["cubes"] if item["cube_id"] == cube_id), None)
    _expect(isinstance(cube, dict), f"cube not declared: {cube_id}")
    old_prepass = v12.run_boolean_prepass
    admission: dict[str, object] = {}

    def cube_prepass(*args: object, **kwargs: object):
        report, learned, master = old_prepass(*args, **kwargs)
        admission.update(admit_master_only(master, terminal["blockers"], cube))
        report = dict(report)
        report["v20_cube_admission"] = dict(admission)
        return report, learned, master

    v12.run_boolean_prepass = cube_prepass
    try:
        inherited = v19.provenance()
        result = v19.solve_case(
            case=CASE, timeout_ms=timeout_ms, out_dir=out_dir, seed=seed,
            bool_timeout_ms=bool_timeout_ms, replay_timeout_ms=replay_timeout_ms,
            max_assignments=max_assignments,
            expected_script_sha256=str(inherited["script_sha256"]),
            frozen_provenance=inherited,
        )
    finally:
        v12.run_boolean_prepass = old_prepass
    _expect(result.get("full_frozen_formula_sha256") == TERMINAL_V19_RAW_FORMULA_SHA256,
            "v20 child raw full formula drifted from authenticated v19")
    case_dir = out_dir / CASE_ID
    # The inherited result commits these exact v19 basenames and blob hashes.
    # Preserve them inside the v20 cube directory rather than creating stale
    # filename fields (or recursively rewriting and rehashing the result).
    v19_journal = case_dir / "assignment-journal-v19"
    if v19_journal.exists():
        result["assignment_journal"] = v19._journal_summary(
            v19.AssignmentJournal(v19_journal)
        )
    child = {
        "schema_version": 20,
        "kind": "v20-cube-child",
        "manifest_sha256": manifest["manifest_sha256"],
        "cube_id": cube_id,
        "cube_assignment": cube["assignment"],
        "cube_assignment_sha256": cube["assignment_sha256"],
        "status": result.get("status"),
        "complete": result.get("complete") is True,
        "reason_incomplete": result.get("reason_incomplete"),
        "error": result.get("error"),
        "raw_full_formula_sha256": result.get("full_frozen_formula_sha256"),
        "v19_terminal_summary_sha256": terminal["summary_sha256"],
        "imported_full_blocker_count": terminal["full_blocker_count"],
        "imported_full_blockers_sha256": terminal["full_blockers_sha256"],
        "master_only_admission": admission,
        "inherited_result": result,
    }
    atomic_write_json(case_dir / "cube-result.json", child)
    return child


def parser() -> argparse.ArgumentParser:
    result = argparse.ArgumentParser(description=__doc__)
    result.add_argument("--summary", type=Path, default=TERMINAL_V19_SUMMARY)
    result.add_argument("--manifest-out", type=Path)
    sub = result.add_subparsers(dest="command")
    child = sub.add_parser("child", help=argparse.SUPPRESS)
    child.add_argument("--manifest", type=Path, required=True)
    child.add_argument("--cube-id", required=True)
    child.add_argument("--out-dir", type=Path, required=True)
    child.add_argument("--timeout-ms", type=int, required=True)
    child.add_argument("--bool-timeout-ms", type=int, required=True)
    child.add_argument("--replay-timeout-ms", type=int, required=True)
    child.add_argument("--max-assignments", type=int, required=True)
    child.add_argument("--seed", type=int, default=97)
    return result


def main() -> int:
    args = parser().parse_args()
    if args.command == "child":
        child = run_child(
            args.manifest, args.cube_id, args.out_dir,
            timeout_ms=args.timeout_ms, bool_timeout_ms=args.bool_timeout_ms,
            replay_timeout_ms=args.replay_timeout_ms,
            max_assignments=args.max_assignments, seed=args.seed,
        )
        print(json.dumps({key: child[key] for key in ("cube_id", "status", "complete")},
                         sort_keys=True))
        return 0
    terminal = authenticate_v19_terminal(args.summary)
    manifest = build_manifest(terminal)
    if args.manifest_out:
        atomic_write_json(args.manifest_out, manifest)
    print(json.dumps({
        "mode": "preflight", "solver_launched": False,
        "manifest_sha256": manifest["manifest_sha256"],
        "cube_count": manifest["cube_count"],
        "terminal_full_blocker_count": terminal["full_blocker_count"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
