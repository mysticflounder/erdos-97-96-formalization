"""Post-finalize an authenticated v19 resume child without rerunning solvers."""

from __future__ import annotations

import argparse
import copy
import json
import shutil
from pathlib import Path

import z3

import round5_cegar_v19 as v19
import run_v19_retry_matrix as runner


def finalize(source_summary: Path, raw_run: Path, output: Path) -> dict[str, object]:
    if output.exists():
        raise RuntimeError(f"refusing to overwrite post-finalization output: {output}")
    source_summary = source_summary.resolve()
    raw_run = raw_run.resolve()
    resume = runner.validate_resume_artifact(
        runner.ResumeSpec(source_summary, runner.file_sha256(source_summary))
    )
    invocation_path = raw_run / "invocation.json"
    raw_case = raw_run / resume.case.case_id
    raw_result_path = raw_case / "result.json"
    invocation = runner.read_json(invocation_path)
    raw_result = runner.read_json(raw_result_path)
    if invocation.get("resume_source") != resume.manifest():
        raise RuntimeError("raw child invocation does not match authenticated resume")
    if raw_result.get("case_id") != resume.case.case_id:
        raise RuntimeError("raw child result case mismatch")

    raw_trace_name = raw_result.get("cegar_trace_file")
    if not isinstance(raw_trace_name, str) or Path(raw_trace_name).name != raw_trace_name:
        raise RuntimeError("raw child trace filename is unsafe")
    raw_trace_path = raw_case / raw_trace_name
    if raw_result.get("cegar_trace_sha256") != runner.file_sha256(raw_trace_path):
        raise RuntimeError("raw child trace hash mismatch")
    raw_trace = runner.read_json(raw_trace_path)
    universe, full_hash, blockers, _ = runner.validate_trace_object(
        raw_trace, expected_case_id=resume.case.case_id
    )
    if universe != resume.semantic_bools or full_hash != resume.full_frozen_formula_sha256:
        raise RuntimeError("raw child changed formula or semantic-Bool universe")

    journal_summary = runner._dict(
        raw_result.get("assignment_journal"), "raw assignment journal"
    )
    journal_name = journal_summary.get("directory")
    if not isinstance(journal_name, str) or Path(journal_name).name != journal_name:
        raise RuntimeError("raw assignment-journal directory is unsafe")
    journal = runner.validate_assignment_journal(
        raw_case / journal_name, journal_summary,
        case_id=resume.case.case_id, universe=universe, full_hash=full_hash,
        incremental_trace=raw_trace,
    )
    pending = runner._merge_pending_assignments(resume.pending_assignments, journal)
    continuation = runner.compose_resumed_trace(
        resume, raw_trace, pending_assignments=pending
    )

    iterations = runner._list(raw_trace.get("iterations"), "raw trace iterations")
    if not iterations:
        raise RuntimeError("raw child has no proposal to audit")
    first = runner._dict(iterations[0], "raw first iteration")
    assignment = runner._signed_map(first.get("assignment"), "raw first assignment")
    proposal_audit = runner.audit_resumed_proposal(
        resume, resume.case,
        tuple(v19.Fix(z3.Bool(name), value) for name, value in assignment),
    )
    proposal_audit["check_assignment_call_count"] = len(iterations)

    output.mkdir(parents=True)
    out_case = output / resume.case.case_id
    shutil.copytree(raw_case, out_case)
    shutil.copy2(invocation_path, output / "invocation.json")
    incremental_path = out_case / "incremental_cegar_trace_v19.json"
    shutil.copy2(raw_trace_path, incremental_path)
    continuation_path = out_case / "resumed_cegar_trace_v19.json"
    runner.write_json_atomic(continuation_path, continuation)

    result = copy.deepcopy(raw_result)
    runtime_import = runner._dict(
        runner._dict(result.get("boolean_prepass"), "raw Boolean prepass").get("resume_import"),
        "raw resume import",
    )
    if runtime_import.get("cumulative_blocker_sha256") != resume.cumulative_blocker_sha256:
        raise RuntimeError("raw child did not attest imported blocker hash")
    result.update({
        "resume_import": runtime_import,
        "first_resumed_proposal_audit": proposal_audit,
        "incremental_cegar_trace_file": incremental_path.name,
        "incremental_cegar_trace_sha256": runner.file_sha256(incremental_path),
        "cegar_trace_file": continuation_path.name,
        "cegar_trace_sha256": runner.file_sha256(continuation_path),
        "assignment_checks": len(continuation["iterations"]),
        "blocker_count": continuation["blocker_count"],
        "cumulative_blocker_sha256": continuation["cumulative_blocker_sha256"],
        "resumed_cegar_trace_file": continuation_path.name,
        "resumed_cegar_trace_sha256": runner.file_sha256(continuation_path),
        "resumed_cumulative_blocker_sha256": continuation["cumulative_blocker_sha256"],
        "pending_assignment_count": len(pending),
        "pending_assignments": [item.record() for item in pending],
        "pending_assignments_sha256": runner.canonical_sha256(
            [item.record() for item in pending]
        ),
    })
    out_result = out_case / "result.json"
    runner.write_json_atomic(out_result, result)
    raw_evidence = {
        "raw_invocation_path": str(invocation_path),
        "raw_invocation_sha256": runner.file_sha256(invocation_path),
        "raw_result_path": str(raw_result_path),
        "raw_result_sha256": runner.file_sha256(raw_result_path),
        "raw_incremental_trace_path": str(raw_trace_path),
        "raw_incremental_trace_sha256": runner.file_sha256(raw_trace_path),
        "raw_blocker_count": len(blockers),
        "postfinalizer_sha256": runner.file_sha256(Path(__file__).resolve()),
        "fixed_orchestrator_sha256": runner.file_sha256(Path(runner.__file__).resolve()),
    }
    result_attested = {**result, "result_file_sha256": runner.file_sha256(out_result)}
    summary = {
        **invocation,
        "command": "case",
        "elapsed_seconds": raw_result.get("elapsed_seconds"),
        "counts": {str(result.get("status")): 1},
        "complete": False,
        "results": [result_attested],
        "postfinalization": raw_evidence,
    }
    summary_path = output / "summary.json"
    runner.write_json_atomic(summary_path, summary)
    validated = runner.validate_resume_artifact(
        runner.ResumeSpec(summary_path, runner.file_sha256(summary_path)),
        expected_case_id=resume.case.case_id,
    )
    aggregate = {
        "schema_version": 1,
        "kind": "retained-core-v19-existing-resume-postfinalization/v1",
        "state": "TERMINAL",
        "complete": False,
        "terminal_claim": "none_fail_closed_incomplete",
        "counts": {str(result.get("status")): 1},
        "artifact_attested": True,
        "source": raw_evidence,
        "summary": {"path": str(summary_path), "sha256": runner.file_sha256(summary_path)},
        "result": {"path": str(out_result), "sha256": runner.file_sha256(out_result)},
        "composed_trace": {
            "path": str(continuation_path),
            "sha256": runner.file_sha256(continuation_path),
            "imported_blocker_count": len(resume.blockers),
            "new_blocker_count": len(blockers),
            "blocker_count": len(validated.blockers),
            "cumulative_blocker_sha256": validated.cumulative_blocker_sha256,
        },
        "recursive_resume_validation": "passed",
    }
    runner.write_json_atomic(output / "aggregate_manifest.json", aggregate)
    return aggregate


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source-summary", required=True, type=Path)
    parser.add_argument("--raw-run", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    result = finalize(args.source_summary, args.raw_run, args.output)
    print(json.dumps({
        "artifact_attested": result["artifact_attested"],
        "blocker_count": result["composed_trace"]["blocker_count"],
        "output": str(args.output),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
