#!/usr/bin/env python3
"""Compile split verified-ingress modules with logs and timing records.

The raw certificate modules are expected to expose orbit-qualified
``verifierMain`` declarations rather than a shared root ``main``.  That
constraint is what permits the final source dispatcher to import the left,
middle, and right verified endpoints in one Lean environment.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import json
import os
import subprocess
import time
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path


ORBIT_NAMES = {
    "left": "Left",
    "middle": "Middle",
    "right": "Right",
}
EXPECTED_BRIDGES = 114


@dataclass(frozen=True)
class Job:
    orbit: str
    kind: str
    module: str
    source: Path
    output_dir: Path
    import_dirs: tuple[Path, ...] = ()


@dataclass(frozen=True)
class Result:
    orbit: str
    kind: str
    module: str
    source: str
    olean: str
    ilean: str
    log: str
    elapsed_seconds: float
    returncode: int


def compile_job(job: Job, lean_dir: Path, certificate_dir: Path) -> Result:
    job.output_dir.mkdir(parents=True, exist_ok=True)
    logs_dir = job.output_dir / "logs"
    logs_dir.mkdir(parents=True, exist_ok=True)
    olean = job.output_dir / f"{job.module}.olean"
    ilean = job.output_dir / f"{job.module}.ilean"
    log = logs_dir / f"{job.module}.log"
    env = os.environ.copy()
    import_roots = (certificate_dir, *job.import_dirs, job.output_dir)
    env["LEAN_PATH"] = os.pathsep.join(
        dict.fromkeys(str(path) for path in import_roots)
    )
    command = [
        "lake",
        "env",
        "lean",
        "-M",
        "16384",
        "-DwarningAsError=true",
    ]
    project_root = lean_dir.resolve().parent
    source_text = str(job.source)
    if job.source.resolve().is_relative_to(project_root) or source_text.startswith("/tmp/"):
        command.extend(("-R", ".."))
    command.extend([
        str(job.source),
        "-o",
        str(olean),
        "-i",
        str(ilean),
    ])
    started = time.perf_counter()
    completed = subprocess.run(
        command,
        cwd=lean_dir,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        check=False,
    )
    elapsed = time.perf_counter() - started
    log.write_text(
        "command=" + " ".join(command) + "\n"
        + f"returncode={completed.returncode}\n"
        + f"elapsed_seconds={elapsed:.6f}\n"
        + "output:\n"
        + completed.stdout,
        encoding="utf-8",
    )
    return Result(
        orbit=job.orbit,
        kind=job.kind,
        module=job.module,
        source=str(job.source),
        olean=str(olean),
        ilean=str(ilean),
        log=str(log),
        elapsed_seconds=elapsed,
        returncode=completed.returncode,
    )


def write_axiom_audit(orbit: str, source_root: Path, output_dir: Path) -> Job:
    title = ORBIT_NAMES[orbit]
    prefix = f"AllOne{title}Verified"
    namespace = f"Problem97.ATailExactFiveCard13AllOneCertificate.{title}"
    imports = "\n".join(
        f"import {prefix}BridgeChunk{index:03d}"
        for index in range(EXPECTED_BRIDGES)
    )
    prints = "\n".join(
        f"#print axioms sourceChunk{index:03d}_each_of_flat"
        for index in range(EXPECTED_BRIDGES)
    )
    module = f"{prefix}SplitAxiomAudit"
    source_dir = source_root / "generated-split-axiom-audits"
    source_dir.mkdir(parents=True, exist_ok=True)
    source = source_dir / f"{module}.lean"
    source.write_text(
        f"{imports}\nimport {prefix}Endpoint\n\n"
        f"namespace {namespace}\n\n{prints}\n"
        "#print axioms false_of_sourceChunks_each\n\n"
        f"end {namespace}\n",
        encoding="utf-8",
    )
    return Job(orbit, "axiom_audit", module, source, output_dir)


def write_combined_import_smoke(
    source_root: Path, output_dir: Path, import_dirs: tuple[Path, ...]
) -> Job:
    module = "AllOneCombinedVerifiedSplitImportSmoke"
    source_dir = source_root / "generated-split-axiom-audits"
    source_dir.mkdir(parents=True, exist_ok=True)
    source = source_dir / f"{module}.lean"
    imports = "\n".join(
        f"import AllOne{title}VerifiedSplitAxiomAudit"
        for title in ORBIT_NAMES.values()
    )
    checks = "\n".join(
        "#check Problem97.ATailExactFiveCard13AllOneCertificate."
        f"{title}.verifierMain"
        for title in ORBIT_NAMES.values()
    )
    prints = "\n".join(
        "#print axioms Problem97.ATailExactFiveCard13AllOneCertificate."
        f"{title}.false_of_sourceChunks_each"
        for title in ORBIT_NAMES.values()
    )
    source.write_text(
        f"{imports}\n\n{checks}\n\n{prints}\n",
        encoding="utf-8",
    )
    return Job(
        "combined",
        "combined_import_smoke",
        module,
        source,
        output_dir,
        import_dirs,
    )


def jobs_for_orbit(
    orbit: str, source_root: Path, output_root: Path, output_suffix: str
) -> tuple[Job, list[Job]]:
    title = ORBIT_NAMES[orbit]
    prefix = f"AllOne{title}Verified"
    source_dir = source_root / f"generated-{orbit}-verified-ingress-split"
    output_dir = output_root / f"{orbit}{output_suffix}"
    assignment_module = f"{prefix}Assignment"
    assignment = Job(
        orbit,
        "assignment",
        assignment_module,
        source_dir / f"{assignment_module}.lean",
        output_dir,
    )
    bridge_sources = sorted(source_dir.glob(f"{prefix}BridgeChunk*.lean"))
    if len(bridge_sources) != EXPECTED_BRIDGES:
        raise ValueError(
            f"{orbit}: expected {EXPECTED_BRIDGES} bridge modules, "
            f"found {len(bridge_sources)}"
        )
    bridge_modules = [path.stem for path in bridge_sources]
    expected_modules = [
        f"{prefix}BridgeChunk{index:03d}" for index in range(EXPECTED_BRIDGES)
    ]
    if bridge_modules != expected_modules:
        raise ValueError(f"{orbit}: bridge module sequence is not dense")
    remainder = [
        Job(orbit, "bridge", path.stem, path, output_dir)
        for path in bridge_sources
    ]
    endpoint_module = f"{prefix}Endpoint"
    remainder.append(
        Job(
            orbit,
            "endpoint",
            endpoint_module,
            source_dir / f"{endpoint_module}.lean",
            output_dir,
        )
    )
    return assignment, remainder


def run_parallel(
    jobs: list[Job], jobs_count: int, lean_dir: Path, certificate_dir: Path
) -> list[Result]:
    results: list[Result] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs_count) as executor:
        futures = {
            executor.submit(compile_job, job, lean_dir, certificate_dir): job
            for job in jobs
        }
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            results.append(result)
            status = "PASS" if result.returncode == 0 else "FAIL"
            print(
                f"{status} orbit={result.orbit} kind={result.kind} "
                f"module={result.module} elapsed={result.elapsed_seconds:.3f}s",
                flush=True,
            )
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--orbit", action="append", choices=sorted(ORBIT_NAMES), required=True
    )
    parser.add_argument("--source-root", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--certificate-dir", type=Path, required=True)
    parser.add_argument("--jobs", type=int, default=24)
    parser.add_argument("--audit-only", action="store_true")
    parser.add_argument("--output-suffix", default="-ingress-split")
    args = parser.parse_args()
    if args.jobs < 1:
        raise ValueError("--jobs must be positive")

    started_at = datetime.now(timezone.utc).isoformat()
    requested_orbits = set(args.orbit)
    all_orbits_requested = requested_orbits == set(ORBIT_NAMES)
    orbit_output_dirs = tuple(
        args.output_root / f"{orbit}{args.output_suffix}"
        for orbit in ORBIT_NAMES
    )
    if args.audit_only:
        audit_jobs = [
            write_axiom_audit(
                orbit,
                args.source_root.resolve(),
                args.output_root / f"{orbit}{args.output_suffix}",
            )
            for orbit in args.orbit
        ]
        all_results = run_parallel(
            audit_jobs, min(args.jobs, len(audit_jobs)), args.lean_dir, args.certificate_dir
        )
        if all_orbits_requested and all(
            result.returncode == 0 for result in all_results
        ):
            combined_job = write_combined_import_smoke(
                args.source_root.resolve(),
                args.output_root / f"combined{args.output_suffix}",
                orbit_output_dirs,
            )
            all_results += run_parallel(
                [combined_job], 1, args.lean_dir, args.certificate_dir
            )
    else:
        assignments: list[Job] = []
        remainder: list[Job] = []
        for orbit in args.orbit:
            assignment, orbit_remainder = jobs_for_orbit(
                orbit, args.source_root.resolve(), args.output_root, args.output_suffix
            )
            assignments.append(assignment)
            remainder.extend(orbit_remainder)

        results = run_parallel(
            assignments,
            min(args.jobs, len(assignments)),
            args.lean_dir,
            args.certificate_dir,
        )
        if any(result.returncode != 0 for result in results):
            all_results = results
        else:
            all_results = results + run_parallel(
                remainder, args.jobs, args.lean_dir, args.certificate_dir
            )

        if all(result.returncode == 0 for result in all_results) and len(all_results) == (
            len(assignments) + len(remainder)
        ):
            audit_jobs = [
                write_axiom_audit(
                    orbit,
                    args.source_root.resolve(),
                    args.output_root / f"{orbit}{args.output_suffix}",
                )
                for orbit in args.orbit
            ]
            all_results += run_parallel(
                audit_jobs,
                min(args.jobs, len(audit_jobs)),
                args.lean_dir,
                args.certificate_dir,
            )
            if all_orbits_requested and all(
                result.returncode == 0 for result in all_results
            ):
                combined_job = write_combined_import_smoke(
                    args.source_root.resolve(),
                    args.output_root / f"combined{args.output_suffix}",
                    orbit_output_dirs,
                )
                all_results += run_parallel(
                    [combined_job], 1, args.lean_dir, args.certificate_dir
                )

    summary = {
        "schema": "p97-exact5-card13-all-one-split-ingress-validation-v1",
        "started_at": started_at,
        "finished_at": datetime.now(timezone.utc).isoformat(),
        "lean_version": "4.27.0",
        "warning_as_error": True,
        "jobs": args.jobs,
        "orbits": args.orbit,
        "audit_only": args.audit_only,
        "output_suffix": args.output_suffix,
        "results": [asdict(result) for result in sorted(all_results, key=lambda r: r.module)],
    }
    args.output_root.mkdir(parents=True, exist_ok=True)
    summary_name = (
        "validation-axiom-audit-results.json"
        if args.audit_only
        else "validation-results.json"
    )
    summary_path = args.output_root / summary_name
    summary_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    failures = [result for result in all_results if result.returncode != 0]
    print(f"results={len(all_results)}")
    print(f"failures={len(failures)}")
    print(f"summary={summary_path}")
    raise SystemExit(1 if failures else 0)


if __name__ == "__main__":
    main()
