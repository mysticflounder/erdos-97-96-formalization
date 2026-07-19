#!/usr/bin/env python3
"""Raw-CNF exact-six CEGAR driver with fail-closed cut banking.

The deterministic exact-six structural encoder supplies the Boolean map.
Either local CaDiCaL or piqd's raw-DIMACS endpoint proposes complete
assignments; each assignment is substituted back into every emitted clause
before the exact Kalmanson oracle is called.  A metric-UNSAT leaf becomes
bankable only after the independent CEGAR checker accepts the proposed
one-record JSONL bank.

This is finite theorem-discovery infrastructure.  Neither a derived cut nor a
terminal n=14 result closes the variable-cardinality Lean parent theorem.
"""

from __future__ import annotations

import argparse
import atexit
import hashlib
import importlib.util
import json
import os
import subprocess
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import uuid
from pathlib import Path
from types import ModuleType
from typing import Iterable, Sequence


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
INTEGRATED_DIR = HERE.parent / "exact6-integrated-milp"
EXACT_CEGAR_PATH = INTEGRATED_DIR / "exact_cegar.py"
ENCODER_PATH = HERE.parent / "exact6-allcenter-coverage-certificate" / "encode.py"
INDEPENDENT_VERIFIER = (
    HERE.parent / "exact6-integrated-cegar-audit" / "verify_exact_cegar.py"
)
DEFAULT_LEARNED_BANK = (
    HERE.parent
    / "exact6-allcenter-capaware-gate"
    / "combined_round1_round2_minimized_schema_bank.json"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def event(path: Path, phase: str, **fields: object) -> None:
    payload = {"time": time.time(), "phase": phase, **fields}
    line = json.dumps(payload, sort_keys=True)
    print(line, flush=True)
    with path.open("a", encoding="utf-8") as handle:
        handle.write(line + "\n")
        handle.flush()
        os.fsync(handle.fileno())


def atomic_json(path: Path, payload: dict[str, object]) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def append_jsonl(path: Path, payload: dict[str, object]) -> None:
    with path.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(payload, sort_keys=True) + "\n")
        handle.flush()
        os.fsync(handle.fileno())


def render_current_cnf(module: ModuleType, encoder, path: Path) -> str:
    payload = module.render_dimacs(
        encoder.cnf,
        (
            "schema p97-exact6-direct-cnf-cegar-candidate-v1",
            f"orbit {encoder.orbit}",
            "all imported exact cuts independently replayed before launch",
            "every newly derived cut independently replayed before banking",
        ),
    )
    path.write_bytes(payload)
    return hashlib.sha256(payload).hexdigest()


def parse_cadical_assignment(output: str, variable_count: int) -> list[bool]:
    assignment: dict[int, bool] = {}
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            if not 1 <= variable <= variable_count:
                raise ValueError(f"CaDiCaL model variable out of range: {variable}")
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise ValueError(f"conflicting CaDiCaL model value: {variable}")
            assignment[variable] = value
    missing = sorted(set(range(1, variable_count + 1)) - set(assignment))
    if missing:
        raise ValueError(
            f"incomplete CaDiCaL model: {len(missing)} missing; first={missing[:8]}"
        )
    return [assignment[index] for index in range(1, variable_count + 1)]


def parse_signed_assignment(
    literals: Sequence[int], variable_count: int
) -> list[bool]:
    assignment: dict[int, bool] = {}
    for literal in literals:
        if literal == 0:
            continue
        variable = abs(literal)
        if not 1 <= variable <= variable_count:
            raise ValueError(f"piqd model variable out of range: {variable}")
        value = literal > 0
        if variable in assignment and assignment[variable] != value:
            raise ValueError(f"conflicting piqd model value: {variable}")
        assignment[variable] = value
    missing = sorted(set(range(1, variable_count + 1)) - set(assignment))
    if missing:
        raise ValueError(
            f"incomplete piqd model: {len(missing)} missing; first={missing[:8]}"
        )
    return [assignment[index] for index in range(1, variable_count + 1)]


def verify_clause_substitution(
    clauses: Sequence[Sequence[int]], truth: Sequence[bool]
) -> None:
    for index, clause in enumerate(clauses, start=1):
        if not any(truth[abs(literal) - 1] == (literal > 0) for literal in clause):
            raise ValueError(f"CaDiCaL assignment fails emitted clause {index}")


def unique_true(
    truth: Sequence[bool], candidates: Iterable[tuple[int, int]], label: str
) -> int:
    selected = [value for value, variable in candidates if truth[variable - 1]]
    if len(selected) != 1:
        raise ValueError(f"{label} is not one-hot: {selected}")
    return selected[0]


def decode_assignment(module: ModuleType, encoder, truth: Sequence[bool]) -> dict[str, object]:
    rows = {
        center: tuple(
            point
            for point in module.VERTICES
            if truth[encoder.m(center, point) - 1]
        )
        for center in module.VERTICES
    }
    if any(len(support) != 4 or center in support for center, support in rows.items()):
        raise ValueError("decoded selected-row cardinality/self-membership failure")
    shell = tuple(
        point for point in module.VERTICES if truth[encoder.shell[point] - 1]
    )
    if len(shell) != 5 or module.SECOND_APEX in shell:
        raise ValueError(f"decoded exact-five shell failure: {shell}")
    roles = {
        role: unique_true(
            truth,
            ((point, encoder.r(role, point)) for point in module.VERTICES),
            f"role {role}",
        )
        for role in ("first", "second", "source", "target", "unused")
    }
    blockers = {
        source: unique_true(
            truth,
            ((center, encoder.b(source, center)) for center in module.VERTICES),
            f"blocker source {source}",
        )
        for source in module.VERTICES
    }
    return {
        "truth": list(truth),
        "rows": rows,
        "shell": shell,
        "roles": roles,
        "blockers": blockers,
    }


def verify_decoded_truth(module: ModuleType, encoder, decoded: dict[str, object]) -> None:
    """Reconstruct every named Boolean from decoded semantic fields."""
    truth: list[bool] = decoded["truth"]  # type: ignore[assignment]
    expected: dict[int, bool] = {}
    rows: dict[int, tuple[int, ...]] = decoded["rows"]  # type: ignore[assignment]
    shell: tuple[int, ...] = decoded["shell"]  # type: ignore[assignment]
    roles: dict[str, int] = decoded["roles"]  # type: ignore[assignment]
    blockers: dict[int, int] = decoded["blockers"]  # type: ignore[assignment]
    for center in module.VERTICES:
        for point in module.VERTICES:
            expected[encoder.m(center, point)] = point in rows[center]
    for point in module.VERTICES:
        expected[encoder.shell[point]] = point in shell
    for role, selected in roles.items():
        for point in module.VERTICES:
            expected[encoder.r(role, point)] = point == selected
    for source, selected in blockers.items():
        for center in module.VERTICES:
            expected[encoder.b(source, center)] = center == selected
    if sorted(expected) != list(range(1, encoder.v.count + 1)):
        raise ValueError("decoded fields do not reconstruct the complete Boolean namespace")
    mismatches = [
        variable
        for variable, value in expected.items()
        if truth[variable - 1] != value
    ]
    if mismatches:
        raise ValueError(f"decoded/model Boolean mismatch: {mismatches[:8]}")


def verify_strong_connectivity(module: ModuleType, decoded: dict[str, object]) -> None:
    rows: dict[int, tuple[int, ...]] = decoded["rows"]  # type: ignore[assignment]
    for start in module.VERTICES:
        reached = {start}
        frontier = [start]
        while frontier:
            center = frontier.pop()
            for point in rows[center]:
                if point not in reached:
                    reached.add(point)
                    frontier.append(point)
        if reached != set(module.VERTICES):
            raise ValueError(
                f"decoded selected-row digraph is not strongly connected from {start}"
            )


def verify_cut_occurs(cut: dict[str, object], decoded: dict[str, object]) -> None:
    rows: dict[int, tuple[int, ...]] = decoded["rows"]  # type: ignore[assignment]
    actual_memberships = {
        (center, point) for center, support in rows.items() for point in support
    }
    required = {
        tuple(item) for item in cut["required_memberships"]  # type: ignore[index]
    }
    missing = sorted(required - actual_memberships)
    if missing:
        raise ValueError(f"proposed cut antecedent absent from source model: {missing}")
    conditioned_shell = cut.get("conditioned_shell")
    if conditioned_shell is not None and set(conditioned_shell) != set(decoded["shell"]):
        raise ValueError("proposed shell-conditioned cut does not match source shell")


def run_cadical(cnf: Path, timeout: int) -> dict[str, object]:
    started = time.monotonic()
    try:
        solved = subprocess.run(
            ["cadical", "--sat", "-q", "-t", str(timeout), str(cnf)],
            capture_output=True,
            text=True,
            timeout=timeout + 15,
            check=False,
        )
    except subprocess.TimeoutExpired as error:
        return {
            "status": "UNKNOWN",
            "reason": "supervisor_timeout",
            "elapsed_seconds": time.monotonic() - started,
            "stdout": error.stdout or "",
            "stderr": error.stderr or "",
        }
    output = solved.stdout + solved.stderr
    if solved.returncode == 10 and any(
        line.strip() == "s SATISFIABLE" for line in output.splitlines()
    ):
        status = "SAT"
    elif solved.returncode == 20 and any(
        line.strip() == "s UNSATISFIABLE" for line in output.splitlines()
    ):
        status = "UNSAT"
    else:
        status = "UNKNOWN"
    return {
        "status": status,
        "returncode": solved.returncode,
        "elapsed_seconds": time.monotonic() - started,
        "stdout": solved.stdout,
        "stderr": solved.stderr,
    }


def http_bytes(
    url: str,
    *,
    method: str = "GET",
    data: bytes | None = None,
    headers: dict[str, str] | None = None,
    timeout: float = 30,
) -> tuple[bytes, dict[str, str]]:
    request = urllib.request.Request(
        url,
        data=data,
        headers=headers or {},
        method=method,
    )
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            return response.read(), dict(response.headers.items())
    except urllib.error.HTTPError as error:
        body = error.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"piqd HTTP {error.code} for {url}: {body}") from error
    except urllib.error.URLError as error:
        raise RuntimeError(f"piqd request failed for {url}: {error}") from error


def http_json(
    url: str,
    *,
    method: str = "GET",
    data: bytes | None = None,
    headers: dict[str, str] | None = None,
    timeout: float = 30,
) -> dict[str, object]:
    payload, _ = http_bytes(
        url, method=method, data=data, headers=headers, timeout=timeout
    )
    decoded = json.loads(payload)
    if not isinstance(decoded, dict):
        raise ValueError(f"piqd returned non-object JSON for {url}")
    return decoded


def multipart_body(
    parts: Sequence[tuple[str, str | None, str, bytes]],
) -> tuple[bytes, str]:
    boundary = "p97-exact6-" + uuid.uuid4().hex
    chunks: list[bytes] = []
    for name, filename, content_type, payload in parts:
        chunks.append(f"--{boundary}\r\n".encode())
        disposition = f'Content-Disposition: form-data; name="{name}"'
        if filename is not None:
            disposition += f'; filename="{filename}"'
        chunks.append((disposition + "\r\n").encode())
        chunks.append(f"Content-Type: {content_type}\r\n\r\n".encode())
        chunks.append(payload)
        chunks.append(b"\r\n")
    chunks.append(f"--{boundary}--\r\n".encode())
    return b"".join(chunks), boundary


def run_piqd(
    cnf: Path,
    timeout: int,
    *,
    base_url: str,
    producer_manifest: dict[str, object],
    poll_seconds: float,
) -> dict[str, object]:
    """Submit one byte-exact static CNF job and return its terminal model."""
    started = time.monotonic()
    base = base_url.rstrip("/")
    cnf_bytes = cnf.read_bytes()
    cnf_hash = hashlib.sha256(cnf_bytes).hexdigest()
    meta_bytes = (
        json.dumps(
            {
                "backend": "cadical",
                "solver_profile": "sat",
                "timeout_s": timeout,
                "project": "erdos-97-96-exact6-cegar",
            },
            sort_keys=True,
            separators=(",", ":"),
        ).encode()
        + b"\n"
    )
    manifest_bytes = (
        json.dumps(producer_manifest, sort_keys=True, separators=(",", ":")).encode()
        + b"\n"
    )
    body, boundary = multipart_body(
        (
            ("cnf", cnf.name, "application/octet-stream", cnf_bytes),
            ("meta", None, "application/json", meta_bytes),
            ("manifest", None, "application/json", manifest_bytes),
        )
    )
    try:
        prepared = http_json(
            base + "/jobs/prepare-cnf",
            method="POST",
            data=body,
            headers={"Content-Type": f"multipart/form-data; boundary={boundary}"},
            timeout=max(30, min(timeout, 120)),
        )
        if prepared.get("cnf_blob_hash") != cnf_hash:
            raise ValueError("piqd prepare-cnf hash differs from submitted CNF")
        job_id = str(prepared["job_id"])
        status_url = base + "/jobs/" + urllib.parse.quote(job_id, safe="")
        status = http_json(status_url, timeout=30)
        if status.get("status") == "prepared":
            confirm_url = (
                base
                + "/jobs/confirm?"
                + urllib.parse.urlencode({"job_id": job_id})
            )
            http_json(confirm_url, method="POST", data=b"", timeout=30)
        elif status.get("status") not in {"confirmed", "running", "completed"}:
            raise RuntimeError(
                f"piqd existing job {job_id} has unusable status {status.get('status')}"
            )

        deadline = time.monotonic() + timeout + 90
        while True:
            status = http_json(status_url, timeout=30)
            if status.get("status") in {"completed", "failed"}:
                break
            if time.monotonic() >= deadline:
                return {
                    "status": "UNKNOWN",
                    "reason": "piqd_supervisor_timeout",
                    "elapsed_seconds": time.monotonic() - started,
                    "job_id": job_id,
                    "piqd_status": status,
                }
            time.sleep(poll_seconds)

        result = status.get("result")
        if status.get("status") != "completed" or result not in {"SAT", "UNSAT"}:
            return {
                "status": "UNKNOWN",
                "reason": "piqd_no_terminal_verdict",
                "elapsed_seconds": time.monotonic() - started,
                "job_id": job_id,
                "piqd_status": status,
            }

        exported_cnf, _ = http_bytes(status_url + "/cnf", timeout=60)
        if exported_cnf != cnf_bytes:
            raise ValueError("piqd GET /cnf was not byte-identical to submitted CNF")
        solved: dict[str, object] = {
            "status": result,
            "elapsed_seconds": time.monotonic() - started,
            "job_id": job_id,
            "piqd_status": status,
            "piqd_existing": prepared.get("existing"),
            "piqd_identity_hash": prepared.get("identity_hash"),
            "piqd_cnf_blob_hash": prepared.get("cnf_blob_hash"),
            "exported_cnf_verified": True,
        }
        if result == "SAT":
            model = http_json(status_url + "/model", timeout=60)
            assignment = model.get("assignment")
            if not isinstance(assignment, list) or not all(
                isinstance(literal, int) for literal in assignment
            ):
                raise ValueError("piqd returned a malformed signed assignment")
            solved["assignment"] = assignment
            solved["piqd_num_assigned"] = model.get("num_assigned")
        return solved
    except (RuntimeError, ValueError) as error:
        return {
            "status": "UNKNOWN",
            "reason": "piqd_protocol_failure",
            "detail": str(error),
            "elapsed_seconds": time.monotonic() - started,
        }


def package_piqd_unsat(
    base_url: str,
    solved: dict[str, object],
    current_cnf: Path,
    prefix: Path,
) -> dict[str, object]:
    """Fetch piqd's terminal LRAT and generated Lean checker stub."""
    job_id = str(solved["job_id"])
    job_url = base_url.rstrip("/") + "/jobs/" + urllib.parse.quote(job_id, safe="")
    prefix.parent.mkdir(parents=True, exist_ok=True)
    cnf_path = prefix.with_suffix(".cnf")
    lrat_path = prefix.with_suffix(".lrat")
    lean_path = prefix.with_suffix(".lean")
    try:
        cnf_bytes, _ = http_bytes(job_url + "/cnf", timeout=60)
        if cnf_bytes != current_cnf.read_bytes():
            raise ValueError("terminal piqd CNF differs from the current outer CNF")
        lrat_bytes, proof_headers = http_bytes(job_url + "/proof", timeout=120)
        lean_bytes, _ = http_bytes(job_url + "/lean", timeout=120)
    except (RuntimeError, ValueError) as error:
        return {
            "verdict": "PIQD_UNSAT_ARTIFACT_FETCH_FAIL_CLOSED",
            "job_id": job_id,
            "reason": str(error),
        }
    cnf_path.write_bytes(cnf_bytes)
    lrat_path.write_bytes(lrat_bytes)
    lean_path.write_bytes(lean_bytes)
    return {
        "verdict": "PIQD_UNSAT_WITH_STORED_LRAT_AND_LEAN_STUB",
        "job_id": job_id,
        "proof_blob_hash": proof_headers.get("X-Proof-Blob-Hash"),
        "artifacts": {
            name: {
                "path": str(path),
                "bytes": path.stat().st_size,
                "sha256": sha256(path),
            }
            for name, path in (("cnf", cnf_path), ("lrat", lrat_path), ("lean", lean_path))
        },
    }


def run_independent_verifier(
    verifier: Path,
    *,
    banks: Sequence[Path] = (),
    seeds: Sequence[Path] = (),
    alive: Path | None = None,
    output: Path,
) -> dict[str, object]:
    command = [sys.executable, str(verifier), "--output", str(output)]
    for bank in banks:
        command.extend(("--bank", str(bank)))
    for seed in seeds:
        command.extend(("--seed", str(seed)))
    if alive is not None:
        command.extend(("--alive", str(alive)))
    checked = subprocess.run(command, capture_output=True, text=True, check=False)
    if checked.returncode != 0 or not output.is_file():
        raise ValueError(
            "independent verifier rejected artifact: "
            + checked.stdout
            + checked.stderr
        )
    payload = json.loads(output.read_text(encoding="utf-8"))
    if payload.get("verdict") != "INDEPENDENT_EXACT_LOCAL_CUT_REPLAY_PASS":
        raise ValueError(f"unexpected independent verdict: {payload.get('verdict')}")
    return payload


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", required=True)
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--learned-bank", type=Path, default=DEFAULT_LEARNED_BANK)
    parser.add_argument("--learned-max-vertices", type=int, default=8)
    parser.add_argument("--import-bank", action="append", default=[], type=Path)
    parser.add_argument("--seed", action="append", default=[], type=Path)
    parser.add_argument("--max-new-cuts", type=int, default=10)
    parser.add_argument("--wall-seconds", type=float, default=1800)
    parser.add_argument("--solver-timeout", type=int, default=120)
    parser.add_argument("--proof-timeout", type=int, default=1800)
    parser.add_argument(
        "--outer-oracle", choices=("direct", "piqd"), default="direct"
    )
    parser.add_argument("--piqd-url", default="http://127.0.0.1:7272")
    parser.add_argument("--piqd-poll-seconds", type=float, default=0.2)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--break-stale-lock", action="store_true")
    args = parser.parse_args()
    if (
        args.max_new_cuts <= 0
        or args.wall_seconds <= 0
        or args.solver_timeout <= 0
        or args.piqd_poll_seconds <= 0
    ):
        parser.error("all budgets must be positive")

    args.output_dir.mkdir(parents=True, exist_ok=True)
    log_path = args.output_dir / "events.jsonl"
    bank_path = args.output_dir / "derived-cuts.jsonl"
    result_path = args.output_dir / "result.json"
    manifest_path = args.output_dir / "run-manifest.json"
    current_cnf = args.output_dir / "current.cnf"
    current_solver_output = args.output_dir / "current.cadical.txt"
    lock_path = args.output_dir / ".run.lock"
    pending_cut_path = args.output_dir / "pending-cut.jsonl"
    pending_replay_path = args.output_dir / "pending-cut.replay.json"
    if not args.resume and any(
        path.exists() for path in (log_path, bank_path, result_path, manifest_path)
    ):
        raise SystemExit("output exists; pass --resume")
    if args.break_stale_lock and lock_path.exists():
        lock_path.unlink()
    try:
        with lock_path.open("x", encoding="utf-8") as handle:
            handle.write(json.dumps({"pid": os.getpid(), "time": time.time()}) + "\n")
    except FileExistsError as error:
        raise SystemExit(f"active/stale run lock exists: {lock_path}") from error
    atexit.register(lambda: lock_path.unlink(missing_ok=True))

    if str(INTEGRATED_DIR) not in sys.path:
        sys.path.insert(0, str(INTEGRATED_DIR))
    exact = load_module("exact6_direct_cnf_exact_cegar", EXACT_CEGAR_PATH)
    module = load_module("exact6_direct_cnf_encoder", ENCODER_PATH)
    if args.orbit not in module.ORBITS:
        parser.error(f"unknown orbit: {args.orbit}")

    identity = {
        "schema": "p97-exact6-direct-cnf-cegar-run-manifest-v1",
        "epistemic_status": "FINITE_EXACT_CEGAR_NOT_LIVE_LEAN_CLOSURE",
        "orbit": args.orbit,
        "driver_sha256": sha256(Path(__file__)),
        "exact_cegar_sha256": sha256(EXACT_CEGAR_PATH),
        "encoder_sha256": sha256(ENCODER_PATH),
        "independent_verifier_sha256": sha256(INDEPENDENT_VERIFIER),
        "learned_bank": {
            "path": str(args.learned_bank),
            "sha256": sha256(args.learned_bank),
            "max_vertices": args.learned_max_vertices,
        },
        "import_banks": [
            {"path": str(path), "sha256": sha256(path)} for path in args.import_bank
        ],
        "seeds": [{"path": str(path), "sha256": sha256(path)} for path in args.seed],
        "budgets": {
            "max_new_cuts": args.max_new_cuts,
            "wall_seconds": args.wall_seconds,
            "solver_timeout": args.solver_timeout,
            "proof_timeout": args.proof_timeout,
        },
        "outer_oracle": {
            "kind": args.outer_oracle,
            "piqd_url": args.piqd_url if args.outer_oracle == "piqd" else None,
            "piqd_poll_seconds": (
                args.piqd_poll_seconds if args.outer_oracle == "piqd" else None
            ),
        },
        "distance_profile": "positive-distances-plus-strict-Kalmanson",
        "python_version": sys.version,
        "z3_version": exact.z3.get_version_string(),
    }
    if manifest_path.exists():
        if json.loads(manifest_path.read_text(encoding="utf-8")) != identity:
            raise SystemExit("resume manifest identity mismatch")
    else:
        atomic_json(manifest_path, identity)

    startup_replay = args.output_dir / "startup-inputs.replay.json"
    replay = run_independent_verifier(
        INDEPENDENT_VERIFIER,
        banks=args.import_bank,
        seeds=args.seed,
        output=startup_replay,
    )

    encoder = module.ExactSixOuterEncoder(args.orbit)
    encoder.build(args.learned_bank, args.learned_max_vertices)
    seed_count = 0
    for path in args.seed:
        artifact = json.loads(path.read_text(encoding="utf-8"))
        encoder.cnf.add("seed_exact_rational_dual_nogood", exact.seed_clause(encoder, artifact))
        seed_count += 1
    imported_count = 0
    for path in args.import_bank:
        for cut in exact.load_cuts(path):
            encoder.cnf.add("imported_exact_kalmanson_nogood", exact.cut_clause(encoder, cut))
            imported_count += 1
    local_cuts = exact.load_cuts(bank_path)
    for cut in local_cuts:
        encoder.cnf.add("derived_exact_kalmanson_nogood", exact.cut_clause(encoder, cut))

    event(
        log_path,
        "start",
        orbit=args.orbit,
        variables=encoder.v.count,
        base_clauses=len(encoder.cnf.clauses),
        seed_count=seed_count,
        imported_cut_count=imported_count,
        resumed_local_cut_count=len(local_cuts),
        startup_replay_verdict=replay["verdict"],
        outer_oracle=args.outer_oracle,
    )
    started = time.monotonic()
    initial_local_count = len(local_cuts)
    terminal: dict[str, object] | None = None

    while (
        len(local_cuts) - initial_local_count < args.max_new_cuts
        and time.monotonic() - started < args.wall_seconds
    ):
        iteration = len(local_cuts) + 1
        cnf_hash = render_current_cnf(module, encoder, current_cnf)
        if args.outer_oracle == "piqd":
            producer_manifest = {
                "schema": "p97-exact6-piqd-raw-cnf-producer-manifest-v1",
                "epistemic_status": "FINITE_EXACT_CEGAR_NOT_LIVE_LEAN_CLOSURE",
                "orbit": args.orbit,
                "cnf_sha256": cnf_hash,
                "variables": encoder.v.count,
                "clauses": len(encoder.cnf.clauses),
                "driver_sha256": identity["driver_sha256"],
                "exact_cegar_sha256": identity["exact_cegar_sha256"],
                "encoder_sha256": identity["encoder_sha256"],
                "learned_bank": identity["learned_bank"],
                "import_banks": identity["import_banks"],
                "seeds": identity["seeds"],
            }
            solved = run_piqd(
                current_cnf,
                args.solver_timeout,
                base_url=args.piqd_url,
                producer_manifest=producer_manifest,
                poll_seconds=args.piqd_poll_seconds,
            )
            current_solver_output.write_text(
                json.dumps(solved, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
        else:
            solved = run_cadical(current_cnf, args.solver_timeout)
            current_solver_output.write_text(
                str(solved.get("stdout", "")) + str(solved.get("stderr", "")),
                encoding="utf-8",
            )
        event(
            log_path,
            "outer_result",
            iteration=iteration,
            status=solved["status"],
            elapsed_seconds=solved["elapsed_seconds"],
            cnf_sha256=cnf_hash,
            clauses=len(encoder.cnf.clauses),
            outer_oracle=args.outer_oracle,
            job_id=solved.get("job_id"),
            exported_cnf_verified=solved.get("exported_cnf_verified"),
        )
        if solved["status"] == "UNKNOWN":
            terminal = {
                "verdict": "OUTER_UNKNOWN_FAIL_CLOSED",
                "reason": solved.get("reason", "outer_oracle_no_terminal_verdict"),
                "detail": solved.get("detail"),
                "returncode": solved.get("returncode"),
                "job_id": solved.get("job_id"),
            }
            break
        if solved["status"] == "UNSAT":
            if args.outer_oracle == "piqd":
                terminal = package_piqd_unsat(
                    args.piqd_url,
                    solved,
                    current_cnf,
                    args.output_dir / "terminal-piqd",
                )
            else:
                terminal = exact.final_sat_proof(
                    module, encoder, args.output_dir / "terminal", args.proof_timeout
                )
            terminal["outer_discovery_cnf_sha256"] = cnf_hash
            break

        if args.outer_oracle == "piqd":
            truth = parse_signed_assignment(
                solved["assignment"], encoder.v.count  # type: ignore[arg-type]
            )
        else:
            truth = parse_cadical_assignment(str(solved["stdout"]), encoder.v.count)
        verify_clause_substitution(encoder.cnf.clauses, truth)
        decoded = decode_assignment(module, encoder, truth)
        verify_decoded_truth(module, encoder, decoded)
        verify_strong_connectivity(module, decoded)
        event(log_path, "outer_model_verified", iteration=iteration)
        cut_id = f"{args.orbit}-{args.outer_oracle}-cnf-cut-{iteration:05d}"
        metric_started = time.monotonic()
        metric = exact.exact_metric_check(module, decoded, cut_id, 1)
        event(
            log_path,
            "metric_result",
            iteration=iteration,
            status=metric["status"],
            elapsed_seconds=time.monotonic() - metric_started,
        )
        if metric["status"] == "UNKNOWN":
            terminal = {
                "verdict": "EXACT_METRIC_ORACLE_UNKNOWN_FAIL_CLOSED",
                "reason": metric.get("reason"),
            }
            break
        if metric["status"] == "SAT":
            alive = {
                "schema": "p97-exact6-integrated-exact-kalmanson-alive-v1",
                "epistemic_status": (
                    "EXACT_POSITIVE_KALMANSON_LINEAR_SHADOW_ALIVE_"
                    "NOT_EUCLIDEAN_NOT_LIVE_LEAN_CLOSURE"
                ),
                "orbit": args.orbit,
                "rows": {
                    str(center): list(support)
                    for center, support in decoded["rows"].items()
                },
                "shell": list(decoded["shell"]),
                "roles": decoded["roles"],
                "blockers": {
                    str(source): center for source, center in decoded["blockers"].items()
                },
                **metric["witness"],
            }
            alive_path = args.output_dir / "alive.json"
            atomic_json(alive_path, alive)
            alive_replay = run_independent_verifier(
                INDEPENDENT_VERIFIER,
                alive=alive_path,
                output=args.output_dir / "alive.replay.json",
            )
            terminal = {
                "verdict": "EXACT_POSITIVE_KALMANSON_LINEAR_SHADOW_ALIVE_VERIFIED",
                "alive_path": str(alive_path),
                "alive_sha256": sha256(alive_path),
                "independent_replay": alive_replay["verdict"],
            }
            break

        cut: dict[str, object] = metric["cut"]
        verify_cut_occurs(cut, decoded)
        proposed_clause = exact.cut_clause(encoder, cut)
        if any(truth[abs(literal) - 1] == (literal > 0) for literal in proposed_clause):
            raise ValueError("proposed cut does not exclude the current outer witness")
        pending_cut_path.write_text(json.dumps(cut, sort_keys=True) + "\n")
        pending_replay_path.unlink(missing_ok=True)
        run_independent_verifier(
            INDEPENDENT_VERIFIER,
            banks=(pending_cut_path,),
            output=pending_replay_path,
        )
        append_jsonl(bank_path, cut)
        local_cuts.append(cut)
        encoder.cnf.add("derived_exact_kalmanson_nogood", proposed_clause)
        pending_cut_path.unlink(missing_ok=True)
        event(
            log_path,
            "cut_banked",
            iteration=iteration,
            local_cut_count=len(local_cuts),
            new_cut_count=len(local_cuts) - initial_local_count,
            cut_id=cut_id,
            required_memberships=len(cut["required_memberships"]),
            constraint_count=len(cut["constraints"]),
            conditioned_shell=cut["conditioned_shell"] is not None,
            independent_replay="PASS",
        )

    if terminal is None:
        terminal = {
            "verdict": "GENERALIZATION_CHECKPOINT",
            "new_cut_count": len(local_cuts) - initial_local_count,
            "wall_limit_reached": time.monotonic() - started >= args.wall_seconds,
        }
    final_local_replay = None
    if bank_path.exists():
        final_local_replay = run_independent_verifier(
            INDEPENDENT_VERIFIER,
            banks=(bank_path,),
            output=args.output_dir / "derived-cuts.replay.json",
        )["verdict"]
    result = {
        "schema": "p97-exact6-raw-cnf-cegar-result-v2",
        "epistemic_status": "FINITE_EXACT_CEGAR_NOT_LIVE_LEAN_CLOSURE",
        "orbit": args.orbit,
        "outer_oracle": args.outer_oracle,
        "imported_cut_count": imported_count,
        "resumed_local_cut_count": initial_local_count,
        "new_cut_count": len(local_cuts) - initial_local_count,
        "total_local_cut_count": len(local_cuts),
        "derived_cut_replay": final_local_replay,
        "elapsed_seconds": time.monotonic() - started,
        "terminal": terminal,
    }
    atomic_json(result_path, result)
    event(
        log_path,
        "done",
        verdict=terminal["verdict"],
        new_cut_count=len(local_cuts) - initial_local_count,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
