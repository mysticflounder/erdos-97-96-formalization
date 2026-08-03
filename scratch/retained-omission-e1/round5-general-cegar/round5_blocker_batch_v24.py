"""Authenticated v24 batch minimization of Boolean assignment blockers.

This is an external-Z3 evidence lane, not a Lean or proof-certificate lane.
Inputs are immutable prefixes of authenticated v19/v20 assignment journals.
A candidate is admitted only after two independent fresh-context parses of the
exact frozen raw formula both return UNSAT and agree on all content identities.
SAT, UNKNOWN, timeout, malformed input, or replay disagreement fails closed.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import json
import os
import time
from collections import defaultdict
from collections.abc import Iterable, Mapping, Sequence
from datetime import datetime, timezone
from pathlib import Path

import round5_cegar_v16 as v16
import round5_cegar_v17 as v17
import round5_cegar_v19 as v19
import round5_cegar_v20 as v20
import z3

HERE = Path(__file__).resolve().parent
SCRIPT_PATH = Path(__file__).resolve()
TEST_PATH = HERE / "test_round5_blocker_batch_v24.py"
DESIGN_PATH = HERE / "V24-BATCH-BLOCKER-MINIMIZATION.md"
DEFAULT_ROOT = HERE / "artifacts-v24"
V20_MANIFEST = HERE / "artifacts-v20-production1" / "manifest-v20.json"
V22_RESULT = HERE / "v22-blocker-minimization-pilot.json"
V19_RESUME_ROOT = HERE / "artifacts-v19-resume1"
V20_ROOT = HERE / "artifacts-v20-production1"
SCHEMA_VERSION = 24
EXPECTED_RAW_FORMULA_SHA256 = v20.TERMINAL_V19_RAW_FORMULA_SHA256
SEMANTIC_BOOL_COUNT = v20.SEMANTIC_BOOL_COUNT


def canonical_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def file_sha256(path: Path) -> str:
    return v20.file_sha256(path)


def expression_sha256(expressions: Iterable[z3.ExprRef]) -> str:
    return hashlib.sha256(
        "\n".join(expression.sexpr() for expression in expressions).encode()
    ).hexdigest()


def atomic_write_json(path: Path, value: object) -> None:
    v20.atomic_write_json(path, value)


def expect(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def validate_assignment(value: object, *, complete: bool = True) -> list[dict[str, object]]:
    assignment = v20._validate_assignment(value)
    if complete:
        expect(len(assignment) == SEMANTIC_BOOL_COUNT, "assignment is not complete")
    return assignment


def validate_core(value: object, assignment: Sequence[Mapping[str, object]]) -> list[dict[str, object]]:
    core = validate_assignment(value, complete=False)
    values = {str(item["bool"]): bool(item["value"]) for item in assignment}
    expect(core, "empty projected core")
    expect(all(values.get(str(item["bool"])) is item["value"] for item in core),
           "projected core is not a subset of its assignment")
    return core


class HashJournal:
    """Atomic append-only records with a validated content hash chain."""

    def __init__(self, path: Path):
        self.path = path

    def recover(self) -> dict[str, object]:
        paths = sorted(self.path.glob("[0-9][0-9][0-9][0-9][0-9][0-9].json")) \
            if self.path.is_dir() else []
        records: list[dict[str, object]] = []
        previous = None
        for sequence, path in enumerate(paths):
            record = json.loads(path.read_text())
            expect(record.get("sequence") == sequence, f"nonconsecutive v24 record {path.name}")
            expect(record.get("previous_record_sha256") == previous,
                   f"v24 hash-chain mismatch at {path.name}")
            payload = record.get("payload")
            expect(isinstance(payload, dict), f"v24 payload is not an object at {path.name}")
            expect(record.get("payload_sha256") == canonical_sha256(payload),
                   f"v24 payload hash mismatch at {path.name}")
            authenticated = {key: record[key] for key in
                             ("sequence", "previous_record_sha256", "payload", "payload_sha256")}
            digest = canonical_sha256(authenticated)
            expect(record.get("record_sha256") == digest,
                   f"v24 record hash mismatch at {path.name}")
            records.append(record)
            previous = digest
        return {"record_count": len(records), "head_sha256": previous, "records": records}

    def append(self, payload: Mapping[str, object]) -> dict[str, object]:
        state = self.recover()
        sequence = int(state["record_count"])
        record = {
            "sequence": sequence,
            "previous_record_sha256": state["head_sha256"],
            "payload": dict(payload),
            "payload_sha256": canonical_sha256(dict(payload)),
        }
        record["record_sha256"] = canonical_sha256(record)
        self.path.mkdir(parents=True, exist_ok=True)
        atomic_write_json(self.path / f"{sequence:06d}.json", record)
        return record


def _parse_raw(raw_path: Path, raw_formula_sha256: str) -> tuple[z3.BoolRef, ...]:
    ctx = z3.Context()
    with gzip.open(raw_path, "rt", encoding="utf-8") as handle:
        assertions = tuple(z3.parse_smt2_string(handle.read(), ctx=ctx))
    expect(v17.raw_formula_sha256(assertions) == raw_formula_sha256,
           "fresh raw-formula semantic SHA-256 mismatch")
    return assertions


def replay_raw_projection(
    raw_path: Path, raw_formula_sha256: str,
    fixes: Sequence[Mapping[str, object]], *, timeout_ms: int, seed: int, label: str,
) -> dict[str, object]:
    """Replay in a new Z3 context; no expression crosses replay boundaries."""
    started = time.monotonic()
    fixes_list = validate_assignment(list(fixes), complete=False)
    try:
        assertions = _parse_raw(raw_path, raw_formula_sha256)
        ctx = assertions[0].ctx
        trackers = v17._tracker_refs(assertions)
        tracker_ids = {tracker.get_id() for tracker in trackers}
        substitutions = tuple(
            (z3.Bool(str(item["bool"]), ctx=ctx), z3.BoolVal(bool(item["value"]), ctx=ctx))
            for item in fixes_list
        ) + tuple((tracker, z3.BoolVal(True, ctx=ctx)) for tracker in trackers)
        simplified = tuple(
            z3.simplify(z3.substitute(assertion, *substitutions))
            for assertion in assertions if assertion.get_id() not in tracker_ids
        )
        goal = z3.Goal(ctx=ctx)
        goal.add(*simplified)
        transformed = z3.Then("pb-preprocess", "card2bv", ctx=ctx)(goal)
        expect(len(transformed) == 1, "raw replay preprocessing split the goal")
        formula = tuple(transformed[0])
        solver = z3.Solver(ctx=ctx)
        solver.set(timeout=max(1, timeout_ms), random_seed=seed, threads=1)
        solver.add(*formula)
        checked = time.monotonic()
        outcome = solver.check()
        return {
            "label": label,
            "status": str(outcome),
            "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
            "raw_formula_sha256": raw_formula_sha256,
            "raw_blob_sha256": file_sha256(raw_path),
            "fix_count": len(fixes_list),
            "fixes_sha256": canonical_sha256(fixes_list),
            "derived_replay_assertion_count": len(formula),
            "derived_replay_formula_sha256": expression_sha256(formula),
            "derived_logic_audit": v17.logic_audit(formula),
            "pipeline": ["fresh raw parse", "fix and tracker substitution", "simplify",
                         "pb-preprocess", "card2bv"],
            "solve_seconds": time.monotonic() - checked,
            "elapsed_seconds": time.monotonic() - started,
        }
    except (MemoryError, OSError, RuntimeError, ValueError, z3.Z3Exception) as exc:
        return {
            "label": label, "status": "replay_error",
            "error": f"{type(exc).__name__}: {exc}",
            "raw_formula_sha256": raw_formula_sha256,
            "fix_count": len(fixes_list), "fixes_sha256": canonical_sha256(fixes_list),
            "elapsed_seconds": time.monotonic() - started,
        }


def replays_agree_and_unsat(first: Mapping[str, object], second: Mapping[str, object]) -> bool:
    keys = ("raw_formula_sha256", "raw_blob_sha256", "fix_count", "fixes_sha256",
            "derived_replay_assertion_count", "derived_replay_formula_sha256")
    return (first.get("status") == "unsat" and second.get("status") == "unsat"
            and all(first.get(key) == second.get(key) for key in keys))


def paired_completed(journal_path: Path, raw_hash: str) -> tuple[dict[str, object], list[dict[str, object]]]:
    state = v19.AssignmentJournal(journal_path).recover()
    pending: dict[str, tuple[dict[str, object], dict[str, object]]] = {}
    pairs: list[dict[str, object]] = []
    for record in state["records"]:
        payload = record["payload"]
        assignment_sha = str(payload["assignment_sha256"])
        if payload["phase"] == "proposed":
            assignment = validate_assignment(payload.get("assignment"))
            expect(canonical_sha256(assignment) == assignment_sha, "proposal assignment hash mismatch")
            expect(payload.get("frozen_full_formula_sha256") == raw_hash,
                   "proposal raw-formula identity mismatch")
            pending[assignment_sha] = (record, {**payload, "assignment": assignment})
        else:
            proposal_record, proposal = pending.pop(assignment_sha)
            expect(payload.get("status") == "unsat", "completed source outcome is not UNSAT")
            blocker = payload.get("blocker")
            expect(isinstance(blocker, dict), "source outcome lacks blocker evidence")
            core = validate_core(blocker.get("projected_core"), proposal["assignment"])
            expect(blocker.get("projected_core_sha256") == canonical_sha256(core),
                   "source projected-core hash mismatch")
            expression = v20.blocker_from_assignment(core).sexpr()
            expect(blocker.get("blocker") == expression, "source blocker expression mismatch")
            expect(blocker.get("blocker_sha256") == hashlib.sha256(expression.encode()).hexdigest(),
                   "source blocker expression hash mismatch")
            pairs.append({
                "assignment": proposal["assignment"], "assignment_sha256": assignment_sha,
                "projected_core": core, "projected_core_sha256": canonical_sha256(core),
                "proposal_sequence": proposal_record["sequence"],
                "proposal_record_sha256": proposal_record["record_sha256"],
                "outcome_sequence": record["sequence"],
                "outcome_record_sha256": record["record_sha256"],
            })
    return ({"path": str(journal_path.resolve()), "record_count": state["record_count"],
             "head_sha256": state["head_sha256"], "completed_count": len(pairs),
             "pending_count": len(state["pending"])}, pairs)


def blocker_subsumes(left: Sequence[Mapping[str, object]], right: Sequence[Mapping[str, object]]) -> bool:
    """The assignment cube left is a subset of right, so its blocker is stronger."""
    return {(str(x["bool"]), bool(x["value"])) for x in left}.issubset(
        {(str(x["bool"]), bool(x["value"])) for x in right})


def _source_rows(raw_hash: str) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    rows: list[dict[str, object]] = []
    prefixes: list[dict[str, object]] = []
    resume_paths = sorted(V19_RESUME_ROOT.glob("**/assignment-journal-v19"))
    expect(len(resume_paths) == 1, "expected one v19 resume journal")
    sources = [("v19-resume", resume_paths[0])]
    v20_paths = sorted(V20_ROOT.glob("**/assignment-journal-v19"))
    expect(len(v20_paths) == 16, "expected sixteen live v20 journals")
    sources.extend((f"v20-cube-{index:03d}", path) for index, path in enumerate(v20_paths))
    for source, path in sources:
        prefix, pairs = paired_completed(path, raw_hash)
        prefix["source"] = source
        prefixes.append(prefix)
        for pair in pairs:
            rows.append({**pair, "source": source, "journal_path": prefix["path"]})
    return prefixes, rows


def build_manifest(output_root: Path) -> Path:
    terminal = v20.authenticate_v19_terminal()
    result_path = Path(str(terminal["result_path"]))
    result = json.loads(result_path.read_text())
    blob = result["frozen_blob_hashes"]["full_frozen"]
    raw_path = (result_path.parent / str(blob["file"])).resolve()
    raw_blob_sha = file_sha256(raw_path)
    expect(raw_blob_sha == blob["sha256"], "raw gzip blob hash mismatch")
    raw_hash = str(terminal["raw_full_formula_sha256"])
    expect(raw_hash == EXPECTED_RAW_FORMULA_SHA256, "unexpected raw semantic hash")

    v20_manifest = json.loads(V20_MANIFEST.read_text())
    v20.authenticate_manifest(v20_manifest)
    v22 = json.loads(V22_RESULT.read_text())
    support = validate_assignment(v22.get("candidate_fixes"), complete=False)
    expect(len(support) == 55, "v22 reference support is not 55 fixes")
    expect(v22.get("candidate_fixes_sha256") == canonical_sha256(support),
           "v22 reference support hash mismatch")
    expect(v22.get("raw_full_formula_sha256") == raw_hash, "v22 raw identity mismatch")
    support_names = [str(item["bool"]) for item in support]

    prefixes, rows = _source_rows(raw_hash)
    terminal_blockers = terminal["blockers"]
    expect(isinstance(terminal_blockers, list) and len(terminal_blockers) == 190,
           "authenticated v19 terminal blocker count changed")
    for ordinal, assignment in enumerate(terminal_blockers):
        validated = validate_assignment(assignment)
        rows.append({
            "source": "v19-terminal", "assignment": validated,
            "assignment_sha256": canonical_sha256(validated),
            "projected_core": support if ordinal == 0 else validated,
            "projected_core_sha256": canonical_sha256(support if ordinal == 0 else validated),
            "terminal_ordinal": ordinal,
        })

    groups: dict[str, list[dict[str, object]]] = defaultdict(list)
    signatures: dict[str, list[dict[str, object]]] = {}
    for row in rows:
        values = {str(item["bool"]): bool(item["value"]) for item in row["assignment"]}
        fixes = [{"bool": name, "value": values[name]} for name in support_names]
        signature = canonical_sha256(fixes)
        groups[signature].append(row)
        signatures[signature] = fixes
    expect(len(groups) >= 2, "signature census unexpectedly collapsed")

    tasks: list[dict[str, object]] = []
    for signature in sorted(groups):
        members = groups[signature]
        representative = min(members, key=lambda row: (len(row["projected_core"]),
                                                         str(row["source"]),
                                                         str(row["assignment_sha256"])))
        shortest = validate_core(representative["projected_core"], representative["assignment"])
        candidate = shortest if len(shortest) < SEMANTIC_BOOL_COUNT else signatures[signature]
        source_counts: dict[str, int] = defaultdict(int)
        for member in members:
            source_counts[str(member["source"])] += 1
        task = {
            "task_id": f"sig-{len(tasks):03d}-{signature[:12]}",
            "signature_sha256": signature, "signature_fixes": signatures[signature],
            "source_counts": dict(sorted(source_counts.items())), "coverage_count": len(members),
            "representative_source": representative["source"],
            "representative_assignment": representative["assignment"],
            "representative_assignment_sha256": representative["assignment_sha256"],
            "source_candidate": candidate, "source_candidate_sha256": canonical_sha256(candidate),
            "source_candidate_count": len(candidate),
            "source_evidence": {key: representative[key] for key in representative
                                if key.endswith("sequence") or key.endswith("record_sha256")
                                or key == "journal_path" or key == "terminal_ordinal"},
        }
        tasks.append(task)

    def category(task: Mapping[str, object]) -> tuple[int, int, str]:
        counts = task["source_counts"]
        if counts.get("v19-terminal", 0):
            rank = 0
        elif counts.get("v19-resume", 0):
            rank = 1
        elif counts.get("v20-cube-008", 0):
            rank = 2
        elif counts.get("v20-cube-010", 0):
            rank = 3
        else:
            rank = 4
        return rank, int(task["source_candidate_count"]), str(task["signature_sha256"])

    canary: list[str] = []
    for desired in range(4):
        choices = [task for task in tasks if category(task)[0] == desired
                   and task["task_id"] not in canary]
        if not choices and desired >= 2:
            choices = [task for task in tasks if task["task_id"] not in canary]
        expect(bool(choices), f"missing canary category {desired}")
        canary.append(str(min(choices, key=category)["task_id"]))
    for task in tasks:
        task["phase"] = "canary" if task["task_id"] in canary else "production"

    run_id = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ-v24-batch")
    run_dir = (output_root / run_id).resolve()
    run_dir.mkdir(parents=True, exist_ok=False)
    core: dict[str, object] = {
        "schema_version": SCHEMA_VERSION, "kind": "v24-batch-blocker-snapshot",
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "run_dir": str(run_dir), "raw_path": str(raw_path),
        "raw_blob_sha256": raw_blob_sha, "raw_formula_sha256": raw_hash,
        "v19_terminal_summary_sha256": terminal["summary_sha256"],
        "v19_terminal_full_blockers_sha256": terminal["full_blockers_sha256"],
        "v20_manifest_path": str(V20_MANIFEST.resolve()),
        "v20_manifest_sha256": v20_manifest["manifest_sha256"],
        "v22_result_path": str(V22_RESULT.resolve()), "v22_result_sha256": file_sha256(V22_RESULT),
        "signature_support": support, "signature_support_sha256": canonical_sha256(support),
        "journal_prefixes": prefixes, "source_assignment_count": len(rows),
        "signature_count": len(tasks), "canary_task_ids": canary,
        "worker_contract": {"maximum_processes": 4, "nice": 15, "z3_threads_per_process": 1,
                            "admission_replays": 2, "fresh_context_per_replay": True},
        "tasks": tasks,
        "script_sha256": file_sha256(SCRIPT_PATH), "test_source_sha256": file_sha256(TEST_PATH),
        "design_note_sha256": file_sha256(DESIGN_PATH),
        "trust_boundary": "external Z3 exact-arithmetic UNSAT only; no proof certificate and no Lean kernel check",
    }
    core["manifest_sha256"] = canonical_sha256(core)
    manifest_path = run_dir / "manifest-v24.json"
    atomic_write_json(manifest_path, core)
    return manifest_path


def authenticate_manifest(path: Path) -> dict[str, object]:
    manifest = json.loads(path.read_text())
    digest = manifest.pop("manifest_sha256", None)
    expect(digest == canonical_sha256(manifest), "v24 manifest hash mismatch")
    manifest["manifest_sha256"] = digest
    expect(manifest.get("schema_version") == SCHEMA_VERSION, "v24 schema mismatch")
    expect(manifest.get("script_sha256") == file_sha256(SCRIPT_PATH), "v24 script drift")
    expect(manifest.get("test_source_sha256") == file_sha256(TEST_PATH), "v24 tests drift")
    expect(manifest.get("design_note_sha256") == file_sha256(DESIGN_PATH), "v24 design drift")
    raw_path = Path(str(manifest["raw_path"]))
    expect(file_sha256(raw_path) == manifest["raw_blob_sha256"], "v24 raw blob drift")
    return manifest


def _probe(journal: HashJournal, manifest: Mapping[str, object], task: Mapping[str, object],
           fixes: Sequence[Mapping[str, object]], timeout_ms: int, seed: int, label: str):
    replay = replay_raw_projection(Path(str(manifest["raw_path"])),
                                   str(manifest["raw_formula_sha256"]), fixes,
                                   timeout_ms=timeout_ms, seed=seed, label=label)
    journal.append({"phase": "probe", "task_id": task["task_id"], "replay": replay})
    return replay


def run_task(manifest_path: str, task_id: str, timeout_ms: int, seed: int) -> dict[str, object]:
    manifest = authenticate_manifest(Path(manifest_path))
    task = next(task for task in manifest["tasks"] if task["task_id"] == task_id)
    task_dir = Path(str(manifest["run_dir"])) / "workers" / str(task_id)
    journal = HashJournal(task_dir / "journal-v24")
    state = journal.recover()
    terminals = [r["payload"] for r in state["records"] if r["payload"].get("phase") == "terminal"]
    if terminals:
        expect(len(terminals) == 1, "multiple v24 task terminals")
        return terminals[0]
    journal.append({"phase": "start", "task_id": task_id,
                    "manifest_sha256": manifest["manifest_sha256"],
                    "source_candidate_sha256": task["source_candidate_sha256"]})
    candidate = list(task["source_candidate"])
    discovery: list[dict[str, object]] = []
    if len(candidate) < 55:
        # Short source cores are greedily reduced.  UNKNOWN and SAT retain the
        # literal; discovery never admits a candidate by itself.
        for index in range(len(candidate) - 1, -1, -1):
            trial = candidate[:index] + candidate[index + 1:]
            replay = _probe(journal, manifest, task, trial, timeout_ms, seed + index,
                            f"delete-{index:03d}")
            discovery.append(replay)
            if replay["status"] == "unsat":
                candidate = trial
    else:
        # The 55-fix signature is an authenticated saved-order suffix.  Establish
        # an UNSAT upper bound in this lane, then binary-search suffix length.
        assignment = list(task["representative_assignment"])
        expect(candidate == assignment[-len(candidate):],
               "non-short source candidate is not a saved-order suffix")
        initial = _probe(journal, manifest, task, candidate, timeout_ms, seed + len(candidate),
                         f"suffix-{len(candidate):03d}")
        discovery.append(initial)
        if initial["status"] == "unsat":
            lo, hi = 0, len(candidate)
        else:
            full = _probe(journal, manifest, task, assignment, timeout_ms,
                          seed + len(assignment), f"suffix-{len(assignment):03d}")
            discovery.append(full)
            if full["status"] != "unsat":
                lo, hi = len(assignment) - 1, len(assignment)
            else:
                lo, hi = len(candidate), len(assignment)
        while lo + 1 < hi:
            mid = (lo + hi) // 2
            trial = assignment[-mid:]
            replay = _probe(journal, manifest, task, trial, timeout_ms, seed + mid,
                            f"suffix-{mid:03d}")
            discovery.append(replay)
            if replay["status"] == "unsat":
                hi = mid
            else:
                lo = mid
        candidate = assignment[-hi:]

    first = _probe(journal, manifest, task, candidate, timeout_ms, seed + 100003, "admission-a")
    second = _probe(journal, manifest, task, candidate, timeout_ms, seed + 200003, "admission-b")
    admitted = replays_agree_and_unsat(first, second)
    terminal = {
        "phase": "terminal", "task_id": task_id,
        "status": "admitted" if admitted else "fail_closed",
        "candidate_fixes": candidate if admitted else task["representative_assignment"],
        "candidate_fixes_sha256": canonical_sha256(
            candidate if admitted else task["representative_assignment"]),
        "candidate_fix_count": len(candidate) if admitted else SEMANTIC_BOOL_COUNT,
        "discovery_probe_count": len(discovery), "admission_replays": [first, second],
        "trust_boundary": manifest["trust_boundary"],
    }
    journal.append(terminal)
    atomic_write_json(task_dir / "result.json", terminal)
    return terminal


def run_phase(manifest_path: Path, phase: str, workers: int, timeout_ms: int, seed: int) -> Path:
    manifest = authenticate_manifest(manifest_path)
    expect(1 <= workers <= 4, "v24 process count must be between one and four")
    if phase == "production":
        gate_path = Path(str(manifest["run_dir"])) / "canary-gate.json"
        expect(gate_path.is_file(), "production requires a canary gate")
        gate = json.loads(gate_path.read_text())
        expect(gate.get("passed") is True, "production blocked by canary gate")
    task_ids = [str(task["task_id"]) for task in manifest["tasks"] if task["phase"] == phase]
    with concurrent.futures.ProcessPoolExecutor(max_workers=workers) as pool:
        futures = [pool.submit(run_task, str(manifest_path), task_id, timeout_ms, seed + 1000 * i)
                   for i, task_id in enumerate(task_ids)]
        results = [future.result() for future in futures]
    payload: dict[str, object] = {
        "schema_version": SCHEMA_VERSION, "kind": f"v24-{phase}-batch",
        "manifest_sha256": manifest["manifest_sha256"], "phase": phase,
        "task_count": len(results), "results": results,
    }
    if phase == "canary":
        payload["passed"] = (len(results) == 4 and all(
            result["status"] == "admitted" and int(result["candidate_fix_count"]) < SEMANTIC_BOOL_COUNT
            for result in results))
        output = Path(str(manifest["run_dir"])) / "canary-gate.json"
    else:
        output = Path(str(manifest["run_dir"])) / "production-batch.json"
    payload["payload_sha256"] = canonical_sha256(payload)
    atomic_write_json(output, payload)
    return output


def aggregate(manifest_path: Path) -> Path:
    manifest = authenticate_manifest(manifest_path)
    results = []
    for task in manifest["tasks"]:
        path = Path(str(manifest["run_dir"])) / "workers" / str(task["task_id"]) / "result.json"
        expect(path.is_file(), f"missing v24 result for {task['task_id']}")
        result = json.loads(path.read_text())
        state = HashJournal(path.parent / "journal-v24").recover()
        expect(state["records"][-1]["payload"] == result, "v24 result/journal terminal mismatch")
        expect(result.get("status") == "admitted", "cannot aggregate fail-closed task")
        results.append((task, result))
    unique: dict[str, tuple[dict[str, object], dict[str, object]]] = {}
    for task, result in results:
        unique.setdefault(str(result["candidate_fixes_sha256"]), (task, result))
    retained = []
    for digest, (task, result) in sorted(unique.items()):
        fixes = result["candidate_fixes"]
        if any(other != digest and blocker_subsumes(other_result["candidate_fixes"], fixes)
               for other, (_, other_result) in unique.items()):
            continue
        retained.append({"blocker_sha256": digest, "fixes": fixes,
                         "fix_count": len(fixes), "witness_task_id": task["task_id"]})
    payload = {
        "schema_version": SCHEMA_VERSION, "kind": "v24-compact-blocker-bank",
        "manifest_sha256": manifest["manifest_sha256"],
        "snapshot_signature_count": manifest["signature_count"],
        "snapshot_assignment_count": manifest["source_assignment_count"],
        "admitted_task_count": len(results), "deduplicated_blocker_count": len(unique),
        "subsumption_reduced_blocker_count": len(retained), "blockers": retained,
        "ingress_scope": "next-wave Boolean master only; never mutate the live v20 wave",
        "trust_boundary": manifest["trust_boundary"],
    }
    payload["bank_sha256"] = canonical_sha256(payload)
    output = Path(str(manifest["run_dir"])) / "compact-blocker-bank-v24.json"
    atomic_write_json(output, payload)
    return output


def main() -> None:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    snapshot = sub.add_parser("snapshot")
    snapshot.add_argument("--output-root", type=Path, default=DEFAULT_ROOT)
    run = sub.add_parser("run")
    run.add_argument("--manifest", type=Path, required=True)
    run.add_argument("--phase", choices=("canary", "production"), required=True)
    run.add_argument("--workers", type=int, default=4)
    run.add_argument("--timeout-ms", type=int, default=900000)
    run.add_argument("--seed", type=int, default=240097)
    collect = sub.add_parser("aggregate")
    collect.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()
    if args.command == "snapshot":
        output = build_manifest(args.output_root)
    elif args.command == "run":
        output = run_phase(args.manifest, args.phase, args.workers, args.timeout_ms, args.seed)
    else:
        output = aggregate(args.manifest)
    print(output)


if __name__ == "__main__":
    main()
