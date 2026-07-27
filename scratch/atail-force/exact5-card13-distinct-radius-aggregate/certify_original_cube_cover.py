#!/usr/bin/env python3
"""Certify the raw 64-cube covers directly against the original CNFs.

The raw ICNF base clauses must be byte-for-byte equal to the clause block of
the corresponding original CNF.  Coverage is checked independently: the 64
negated cubes are emitted as blocking clauses and their conjunction is
accepted as UNSAT only after CaDiCaL and drat-trim agree.  Every selected leaf
is then solved as the exact original CNF plus its cube's unit clauses.  SAT is
accepted only after model replay against that leaf; UNSAT is accepted only
after DRAT replay.

All result reuse is content-addressed and strict.  Missing or rejected cells
are scrubbed before resubmission.  This remains an external CNF certificate;
it does not provide kernel source-to-CNF ingress.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import gzip
import hashlib
import json
import subprocess
import tempfile
import time
from dataclasses import dataclass
from pathlib import Path

import run_solver


HERE = Path(__file__).resolve().parent
ORIENTATIONS = ("direct", "mirror")
CUBE_COUNT = 64
COVERAGE_SCHEMA = "p97-exact5-card13-original-cover-proof-v1"
LEAF_SCHEMA = "p97-exact5-card13-original-leaf-verdict-v1"
SUMMARY_SCHEMA = "p97-exact5-card13-original-cube-cover-certification-v1"


class ValidationError(ValueError):
    """An input or cached result failed a mandatory gate."""


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValidationError(message)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while chunk := stream.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def require_sha256(value: object, label: str) -> str:
    require(isinstance(value, str), f"invalid {label}")
    require(
        len(value) == 64
        and all(character in "0123456789abcdef" for character in value),
        f"invalid {label}",
    )
    return value


def require_exact(result: dict[str, object], field: str, expected: object) -> None:
    require(field in result, f"missing {field}")
    require(result[field] == expected, f"{field} drift")


def require_optional_int(value: object, label: str) -> None:
    require(
        value is None or (isinstance(value, int) and not isinstance(value, bool)),
        f"invalid {label}",
    )


def require_nonnegative_number(value: object, label: str) -> None:
    require(
        isinstance(value, (int, float))
        and not isinstance(value, bool)
        and value >= 0,
        f"invalid {label}",
    )


def parse_literals(
    fields: list[bytes], variables: int, label: str, allow_empty: bool
) -> tuple[int, ...]:
    require(fields and fields[-1] == b"0", f"unterminated {label}")
    try:
        literals = tuple(int(field) for field in fields[:-1])
    except ValueError as error:
        raise ValidationError(f"non-integer literal in {label}") from error
    require(allow_empty or literals, f"empty {label}")
    require(all(literal != 0 for literal in literals), f"interior zero in {label}")
    require(
        all(abs(literal) <= variables for literal in literals),
        f"out-of-range literal in {label}",
    )
    return literals


def validate_cube(cube: tuple[int, ...], variables: int, label: str) -> None:
    signs: dict[int, bool] = {}
    for literal in cube:
        variable = abs(literal)
        sign = literal > 0
        require(variable not in signs, f"duplicate variable in {label}")
        signs[variable] = sign


@dataclass(frozen=True)
class OriginalCnf:
    path: Path
    file_sha256: str
    variables: int
    clause_count: int
    clause_lines: tuple[bytes, ...]
    clause_bytes: bytes
    clause_bytes_sha256: str


@dataclass(frozen=True)
class CubeCover:
    path: Path
    file_sha256: str
    cubes: tuple[tuple[int, ...], ...]
    cubes_sha256: str
    base_clause_bytes_sha256: str


@dataclass(frozen=True)
class OrbitInput:
    orientation: str
    original: OriginalCnf
    cover: CubeCover


def parse_original_cnf(path: Path) -> OriginalCnf:
    raw = path.read_bytes()
    lines = raw.splitlines(keepends=True)
    require(lines, f"empty CNF: {path}")
    require(lines[0].endswith(b"\n"), "CNF header line-ending drift")
    header = lines[0].strip().split()
    require(len(header) == 4 and header[:2] == [b"p", b"cnf"], "bad CNF header")
    try:
        variables = int(header[2])
        declared_clauses = int(header[3])
    except ValueError as error:
        raise ValidationError("non-integer CNF header") from error
    require(variables > 0 and declared_clauses >= 0, "invalid CNF counts")
    clause_lines: list[bytes] = []
    comments_started = False
    for line_number, line in enumerate(lines[1:], start=2):
        stripped = line.strip()
        require(stripped, f"blank CNF line {line_number}")
        if stripped.startswith(b"c ") or stripped == b"c":
            comments_started = True
            continue
        require(not comments_started, "clause appears after trailing comments")
        require(not stripped.startswith(b"p "), "multiple CNF headers")
        require(line.endswith(b"\n"), f"CNF clause line-ending drift at {line_number}")
        parse_literals(
            stripped.split(), variables, f"CNF clause line {line_number}", True
        )
        clause_lines.append(line)
    require(
        len(clause_lines) == declared_clauses,
        f"CNF clause count drift: {len(clause_lines)} != {declared_clauses}",
    )
    clause_bytes = b"".join(clause_lines)
    return OriginalCnf(
        path=path,
        file_sha256=sha256_bytes(raw),
        variables=variables,
        clause_count=declared_clauses,
        clause_lines=tuple(clause_lines),
        clause_bytes=clause_bytes,
        clause_bytes_sha256=sha256_bytes(clause_bytes),
    )


def parse_cube_cover(path: Path, original: OriginalCnf) -> CubeCover:
    raw = path.read_bytes()
    lines = raw.splitlines(keepends=True)
    require(lines and lines[0] == b"p inccnf\n", "bad ICNF header bytes")
    require(all(line.endswith(b"\n") for line in lines), "ICNF line-ending drift")
    base_end = 1 + original.clause_count
    require(len(lines) >= base_end, "truncated ICNF base")
    base_lines = tuple(lines[1:base_end])
    require(
        base_lines == original.clause_lines,
        "ICNF base clauses are not byte-equal to original CNF clauses",
    )
    cube_lines = lines[base_end:]
    require(len(cube_lines) == CUBE_COUNT, f"expected {CUBE_COUNT} cubes")
    cubes: list[tuple[int, ...]] = []
    for cube_index, line in enumerate(cube_lines):
        fields = line.strip().split()
        require(fields and fields[0] == b"a", f"bad cube line {cube_index}")
        cube = parse_literals(
            fields[1:], original.variables, f"cube {cube_index}", False
        )
        validate_cube(cube, original.variables, f"cube {cube_index}")
        cubes.append(cube)
    require(len(set(cubes)) == CUBE_COUNT, "duplicate cubes")
    canonical = json.dumps(
        [list(cube) for cube in cubes], separators=(",", ":")
    ).encode()
    base_bytes = b"".join(base_lines)
    require(
        sha256_bytes(base_bytes) == original.clause_bytes_sha256,
        "ICNF base hash drift",
    )
    return CubeCover(
        path=path,
        file_sha256=sha256_bytes(raw),
        cubes=tuple(cubes),
        cubes_sha256=sha256_bytes(canonical),
        base_clause_bytes_sha256=sha256_bytes(base_bytes),
    )


def coverage_cnf_bytes(data: OrbitInput) -> bytes:
    lines = [f"p cnf {data.original.variables} {CUBE_COUNT}\n".encode()]
    for cube in data.cover.cubes:
        lines.append((" ".join(str(-literal) for literal in cube) + " 0\n").encode())
    return b"".join(lines)


def leaf_cnf_bytes(data: OrbitInput, cube: tuple[int, ...]) -> bytes:
    header = (
        f"p cnf {data.original.variables} "
        f"{data.original.clause_count + len(cube)}\n"
    ).encode()
    units = b"".join(f"{literal} 0\n".encode() for literal in cube)
    return header + data.original.clause_bytes + units


def write_bytes_atomic(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(dir=path.parent, delete=False) as output:
        temporary = Path(output.name)
        output.write(payload)
    temporary.replace(path)


def write_json_atomic(path: Path, payload: dict[str, object]) -> None:
    encoded = (json.dumps(payload, indent=2, sort_keys=True) + "\n").encode()
    write_bytes_atomic(path, encoded)


def run_bounded(command: list[str], timeout_seconds: int) -> tuple[int | None, bool, str]:
    try:
        completed = subprocess.run(
            command,
            text=True,
            capture_output=True,
            check=False,
            timeout=timeout_seconds,
        )
        return completed.returncode, False, completed.stdout + completed.stderr
    except subprocess.TimeoutExpired as error:
        stdout = error.stdout.decode() if isinstance(error.stdout, bytes) else error.stdout
        stderr = error.stderr.decode() if isinstance(error.stderr, bytes) else error.stderr
        return None, True, (stdout or "") + (stderr or "")


def compress_proof(proof: Path) -> Path:
    compressed = proof.with_suffix(proof.suffix + ".gz")
    with proof.open("rb") as source, compressed.open("wb") as raw_output:
        with gzip.GzipFile(
            filename="", mode="wb", compresslevel=6, fileobj=raw_output, mtime=0
        ) as output:
            while chunk := source.read(1024 * 1024):
                output.write(chunk)
    proof.unlink()
    return compressed


def parse_stat(output: str, label: str) -> int | None:
    prefix = f"c {label}:"
    for line in output.splitlines():
        if line.startswith(prefix):
            raw = line[len(prefix):].strip().split()[0]
            return int(raw)
    return None


def hashed_artifact(path: Path, format_name: str | None = None) -> dict[str, object]:
    result: dict[str, object] = {
        "path": str(path),
        "sha256": sha256(path),
        "size_bytes": path.stat().st_size,
    }
    if format_name is not None:
        result["format"] = format_name
    return result


def verify_model_file(cnf: Path, model: Path) -> tuple[bool, str]:
    require(model.is_file(), "missing model")
    return run_solver.verify_model(cnf, model.read_text(encoding="utf-8"))


def coverage_cell(output_root: Path, orientation: str) -> Path:
    return output_root / orientation / "coverage"


def leaf_cell(output_root: Path, orientation: str, cube_index: int) -> Path:
    return output_root / orientation / f"leaf-{cube_index:02d}"


def clean_coverage_cell(output_root: Path, orientation: str) -> None:
    cell = coverage_cell(output_root, orientation)
    for name in (
        "result.json",
        "coverage.cnf",
        "cadical.log",
        "drat-trim.log",
        "coverage.model",
        "proof.drat",
        "proof.drat.gz",
    ):
        (cell / name).unlink(missing_ok=True)


def clean_leaf_cell(output_root: Path, orientation: str, cube_index: int) -> None:
    cell = leaf_cell(output_root, orientation, cube_index)
    for name in (
        "result.json",
        "cadical.log",
        "drat-trim.log",
        "model.out",
        "proof.drat",
        "proof.drat.gz",
    ):
        (cell / name).unlink(missing_ok=True)


def solve_coverage(
    data: OrbitInput,
    output_root: Path,
    timeout_seconds: int,
    proof_timeout_seconds: int,
) -> dict[str, object]:
    cell = coverage_cell(output_root, data.orientation)
    cell.mkdir(parents=True, exist_ok=True)
    cnf = cell / "coverage.cnf"
    log = cell / "cadical.log"
    drat_log = cell / "drat-trim.log"
    model = cell / "coverage.model"
    proof = cell / "proof.drat"
    payload = coverage_cnf_bytes(data)
    write_bytes_atomic(cnf, payload)
    seed = 9100 + ORIENTATIONS.index(data.orientation)
    started = time.monotonic()
    returncode, timed_out, output = run_bounded(
        [
            "cadical",
            "--plain",
            f"--seed={seed}",
            "-t",
            str(timeout_seconds),
            "-w",
            str(model),
            str(cnf),
            str(proof),
        ],
        timeout_seconds + 15,
    )
    log.write_text(output, encoding="utf-8")
    solver_status = (
        "UNKNOWN" if timed_out else {10: "SAT", 20: "UNSAT"}.get(returncode, "UNKNOWN")
    )
    status = "UNKNOWN"
    model_check = None
    drat_check = None
    proof_artifact = None
    if solver_status == "SAT":
        ok, detail = verify_model_file(cnf, model)
        model_check = {"status": "PASS" if ok else "FAIL", "detail": detail}
        if ok:
            status = "SAT_NOT_A_COVER"
    elif solver_status == "UNSAT":
        replay_code, replay_timeout, replay_output = run_bounded(
            ["drat-trim", str(cnf), str(proof)], proof_timeout_seconds
        )
        drat_log.write_text(replay_output, encoding="utf-8")
        verified = replay_code == 0 and "s VERIFIED" in replay_output
        drat_check = {
            "status": "PASS" if verified else "FAIL",
            "returncode": replay_code,
            "timed_out": replay_timeout,
            **hashed_artifact(drat_log),
        }
        if verified:
            compressed = compress_proof(proof)
            proof_artifact = hashed_artifact(
                compressed, "deterministic gzip-compressed CaDiCaL DRAT"
            )
            status = "UNSAT_DRAT_VERIFIED"
    if proof.exists():
        proof.unlink()
    if status != "SAT_NOT_A_COVER" and model.exists():
        model.unlink()
    result = {
        "schema": COVERAGE_SCHEMA,
        "epistemic_status": "EXTERNAL_EXACT_CUBE_COVER_CERTIFICATE",
        "orientation": data.orientation,
        "original_cnf_sha256": data.original.file_sha256,
        "raw_icnf_sha256": data.cover.file_sha256,
        "base_clause_bytes_sha256": data.original.clause_bytes_sha256,
        "cubes_sha256": data.cover.cubes_sha256,
        "cube_count": CUBE_COUNT,
        "variables": data.original.variables,
        "coverage_cnf_sha256": sha256_bytes(payload),
        "seed": seed,
        "timeout_seconds": timeout_seconds,
        "proof_timeout_seconds": proof_timeout_seconds,
        "solver_status": solver_status,
        "status": status,
        "returncode": returncode,
        "timed_out": timed_out,
        "elapsed_seconds": time.monotonic() - started,
        "conflicts": parse_stat(output, "conflicts"),
        "decisions": parse_stat(output, "decisions"),
        "coverage_cnf": hashed_artifact(cnf),
        "cadical_log": hashed_artifact(log),
        "model_check": model_check,
        "model_artifact": (
            hashed_artifact(model) if status == "SAT_NOT_A_COVER" else None
        ),
        "drat_check": drat_check,
        "proof_artifact": proof_artifact,
    }
    write_json_atomic(cell / "result.json", result)
    return result


def solve_leaf(
    data: OrbitInput,
    cube_index: int,
    output_root: Path,
    timeout_seconds: int,
    proof_timeout_seconds: int,
) -> dict[str, object]:
    cube = data.cover.cubes[cube_index]
    cell = leaf_cell(output_root, data.orientation, cube_index)
    cell.mkdir(parents=True, exist_ok=True)
    log = cell / "cadical.log"
    drat_log = cell / "drat-trim.log"
    model = cell / "model.out"
    proof = cell / "proof.drat"
    payload = leaf_cnf_bytes(data, cube)
    temporary: Path | None = None
    started = time.monotonic()
    try:
        with tempfile.NamedTemporaryFile(
            prefix=f"p97-exact5-original-{data.orientation}-{cube_index:02d}-",
            suffix=".cnf",
            dir="/tmp",
            delete=False,
        ) as output:
            temporary = Path(output.name)
            output.write(payload)
        seed = 10000 + ORIENTATIONS.index(data.orientation) * 1000 + cube_index
        returncode, timed_out, solver_output = run_bounded(
            [
                "cadical",
                "--plain",
                f"--seed={seed}",
                "-t",
                str(timeout_seconds),
                "-w",
                str(model),
                str(temporary),
                str(proof),
            ],
            timeout_seconds + 15,
        )
        log.write_text(solver_output, encoding="utf-8")
        solver_status = (
            "UNKNOWN"
            if timed_out
            else {10: "SAT", 20: "UNSAT"}.get(returncode, "UNKNOWN")
        )
        status = "UNKNOWN"
        model_check = None
        drat_check = None
        proof_artifact = None
        if solver_status == "SAT":
            ok, detail = verify_model_file(temporary, model)
            model_check = {"status": "PASS" if ok else "FAIL", "detail": detail}
            if ok:
                status = "SAT"
        elif solver_status == "UNSAT":
            replay_code, replay_timeout, replay_output = run_bounded(
                ["drat-trim", str(temporary), str(proof)], proof_timeout_seconds
            )
            drat_log.write_text(replay_output, encoding="utf-8")
            verified = replay_code == 0 and "s VERIFIED" in replay_output
            drat_check = {
                "status": "PASS" if verified else "FAIL",
                "returncode": replay_code,
                "timed_out": replay_timeout,
                **hashed_artifact(drat_log),
            }
            if verified:
                compressed = compress_proof(proof)
                proof_artifact = hashed_artifact(
                    compressed, "deterministic gzip-compressed CaDiCaL DRAT"
                )
                status = "UNSAT"
        if proof.exists():
            proof.unlink()
        if status != "SAT" and model.exists():
            model.unlink()
        result = {
            "schema": LEAF_SCHEMA,
            "epistemic_status": "EXTERNAL_EXACT_ORIGINAL_CNF_LEAF_VERDICT",
            "orientation": data.orientation,
            "cube_index": cube_index,
            "cube": list(cube),
            "original_cnf_sha256": data.original.file_sha256,
            "raw_icnf_sha256": data.cover.file_sha256,
            "cubes_sha256": data.cover.cubes_sha256,
            "leaf_cnf_sha256": sha256_bytes(payload),
            "seed": seed,
            "timeout_seconds": timeout_seconds,
            "proof_timeout_seconds": proof_timeout_seconds,
            "solver_status": solver_status,
            "status": status,
            "returncode": returncode,
            "timed_out": timed_out,
            "elapsed_seconds": time.monotonic() - started,
            "conflicts": parse_stat(solver_output, "conflicts"),
            "decisions": parse_stat(solver_output, "decisions"),
            "cadical_log": hashed_artifact(log),
            "model_check": model_check,
            "model_artifact": hashed_artifact(model) if status == "SAT" else None,
            "drat_check": drat_check,
            "proof_artifact": proof_artifact,
        }
        write_json_atomic(cell / "result.json", result)
        return result
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)


def load_cached(path: Path) -> dict[str, object]:
    try:
        before = path.stat()
        payload = json.loads(path.read_text(encoding="utf-8"))
        after = path.stat()
    except (OSError, json.JSONDecodeError) as error:
        raise ValidationError(f"unreadable result: {error}") from error
    require(
        (before.st_size, before.st_mtime_ns) == (after.st_size, after.st_mtime_ns),
        "result changed while being read",
    )
    require(isinstance(payload, dict), "result is not an object")
    return payload


def validate_artifact(
    metadata: object, expected: Path, label: str, format_name: str | None = None
) -> Path:
    require(isinstance(metadata, dict), f"missing {label} metadata")
    require_exact(metadata, "path", str(expected))
    artifact = Path(metadata["path"])
    require(artifact.resolve() == expected.resolve(), f"{label} path drift")
    require(artifact.is_file(), f"missing {label}")
    require_exact(metadata, "sha256", sha256(artifact))
    require_exact(metadata, "size_bytes", artifact.stat().st_size)
    if format_name is not None:
        require_exact(metadata, "format", format_name)
    return artifact


def validate_common_solver_result(
    result: dict[str, object], cell: Path, timeout_seconds: int
) -> str:
    require_exact(result, "timeout_seconds", timeout_seconds)
    require(isinstance(result.get("timed_out"), bool), "invalid timed_out")
    require_optional_int(result.get("returncode"), "returncode")
    if result["timed_out"]:
        require(result["returncode"] is None, "timed-out result has returncode")
    solver_status = (
        "UNKNOWN"
        if result["timed_out"]
        else {10: "SAT", 20: "UNSAT"}.get(result["returncode"], "UNKNOWN")
    )
    require_exact(result, "solver_status", solver_status)
    require_nonnegative_number(result.get("elapsed_seconds"), "elapsed_seconds")
    require_optional_int(result.get("conflicts"), "conflicts")
    require_optional_int(result.get("decisions"), "decisions")
    validate_artifact(result.get("cadical_log"), cell / "cadical.log", "CaDiCaL log")
    require(not (cell / "proof.drat").exists(), "stale raw proof beside result")
    return solver_status


def validate_drat_success(result: dict[str, object], cell: Path) -> None:
    drat = result.get("drat_check")
    require(isinstance(drat, dict), "missing DRAT check")
    require_exact(drat, "status", "PASS")
    require_exact(drat, "returncode", 0)
    require_exact(drat, "timed_out", False)
    log = validate_artifact(drat, cell / "drat-trim.log", "drat-trim log")
    require("s VERIFIED" in log.read_text(encoding="utf-8"), "missing VERIFIED")
    validate_artifact(
        result.get("proof_artifact"),
        cell / "proof.drat.gz",
        "compressed proof",
        "deterministic gzip-compressed CaDiCaL DRAT",
    )


def validate_coverage_result(
    path: Path,
    data: OrbitInput,
    output_root: Path,
    timeout_seconds: int,
    proof_timeout_seconds: int,
) -> dict[str, object]:
    result = load_cached(path)
    payload = coverage_cnf_bytes(data)
    cell = coverage_cell(output_root, data.orientation)
    require_exact(result, "schema", COVERAGE_SCHEMA)
    require_exact(result, "epistemic_status", "EXTERNAL_EXACT_CUBE_COVER_CERTIFICATE")
    require_exact(result, "orientation", data.orientation)
    require_exact(result, "original_cnf_sha256", data.original.file_sha256)
    require_exact(result, "raw_icnf_sha256", data.cover.file_sha256)
    require_exact(result, "base_clause_bytes_sha256", data.original.clause_bytes_sha256)
    require_exact(result, "cubes_sha256", data.cover.cubes_sha256)
    require_exact(result, "cube_count", CUBE_COUNT)
    require_exact(result, "variables", data.original.variables)
    require_exact(result, "coverage_cnf_sha256", sha256_bytes(payload))
    require_exact(result, "seed", 9100 + ORIENTATIONS.index(data.orientation))
    require_exact(result, "proof_timeout_seconds", proof_timeout_seconds)
    cnf = validate_artifact(result.get("coverage_cnf"), cell / "coverage.cnf", "coverage CNF")
    require(cnf.read_bytes() == payload, "coverage CNF byte drift")
    solver_status = validate_common_solver_result(result, cell, timeout_seconds)
    status = result.get("status")
    if solver_status == "UNSAT":
        require(status == "UNSAT_DRAT_VERIFIED", "unverified coverage UNSAT")
        require(result.get("model_check") is None, "UNSAT coverage has model check")
        require(result.get("model_artifact") is None, "UNSAT coverage has model")
        validate_drat_success(result, cell)
    elif solver_status == "SAT":
        require(status == "SAT_NOT_A_COVER", "unverified coverage SAT")
        model_check = result.get("model_check")
        require(isinstance(model_check, dict), "missing coverage model check")
        require_exact(model_check, "status", "PASS")
        model = validate_artifact(
            result.get("model_artifact"), cell / "coverage.model", "coverage model"
        )
        ok, detail = verify_model_file(cnf, model)
        require(ok, f"coverage model replay failed: {detail}")
        require(result.get("drat_check") is None, "SAT coverage has DRAT check")
        require(result.get("proof_artifact") is None, "SAT coverage has proof")
    else:
        require(status == "UNKNOWN", "UNKNOWN coverage status drift")
        require(
            result.get("model_check") is None
            and result.get("drat_check") is None
            and result.get("model_artifact") is None
            and result.get("proof_artifact") is None,
            "UNKNOWN coverage has decisive artifact",
        )
    return result


def validate_leaf_result(
    path: Path,
    data: OrbitInput,
    cube_index: int,
    output_root: Path,
    timeout_seconds: int,
    proof_timeout_seconds: int,
) -> dict[str, object]:
    result = load_cached(path)
    cube = data.cover.cubes[cube_index]
    payload = leaf_cnf_bytes(data, cube)
    cell = leaf_cell(output_root, data.orientation, cube_index)
    require_exact(result, "schema", LEAF_SCHEMA)
    require_exact(result, "epistemic_status", "EXTERNAL_EXACT_ORIGINAL_CNF_LEAF_VERDICT")
    require_exact(result, "orientation", data.orientation)
    require_exact(result, "cube_index", cube_index)
    require_exact(result, "cube", list(cube))
    require_exact(result, "original_cnf_sha256", data.original.file_sha256)
    require_exact(result, "raw_icnf_sha256", data.cover.file_sha256)
    require_exact(result, "cubes_sha256", data.cover.cubes_sha256)
    require_exact(result, "leaf_cnf_sha256", sha256_bytes(payload))
    require_exact(
        result,
        "seed",
        10000 + ORIENTATIONS.index(data.orientation) * 1000 + cube_index,
    )
    require_exact(result, "proof_timeout_seconds", proof_timeout_seconds)
    solver_status = validate_common_solver_result(result, cell, timeout_seconds)
    status = result.get("status")
    if solver_status == "UNSAT":
        require(status == "UNSAT", "unverified leaf UNSAT")
        require(result.get("model_check") is None, "UNSAT leaf has model check")
        require(result.get("model_artifact") is None, "UNSAT leaf has model")
        validate_drat_success(result, cell)
    elif solver_status == "SAT":
        require(status == "SAT", "unverified leaf SAT")
        model_check = result.get("model_check")
        require(isinstance(model_check, dict), "missing leaf model check")
        require_exact(model_check, "status", "PASS")
        model = validate_artifact(
            result.get("model_artifact"), cell / "model.out", "leaf model"
        )
        temporary: Path | None = None
        try:
            with tempfile.NamedTemporaryFile(dir="/tmp", delete=False) as output:
                temporary = Path(output.name)
                output.write(payload)
            ok, detail = verify_model_file(temporary, model)
            require(ok, f"leaf model replay failed: {detail}")
        finally:
            if temporary is not None:
                temporary.unlink(missing_ok=True)
        require(result.get("drat_check") is None, "SAT leaf has DRAT check")
        require(result.get("proof_artifact") is None, "SAT leaf has proof")
    else:
        require(status == "UNKNOWN", "UNKNOWN leaf status drift")
        require(
            result.get("model_check") is None
            and result.get("drat_check") is None
            and result.get("model_artifact") is None
            and result.get("proof_artifact") is None,
            "UNKNOWN leaf has decisive artifact",
        )
    return result


def input_summary(data: OrbitInput) -> dict[str, object]:
    widths = [len(cube) for cube in data.cover.cubes]
    return {
        "original_cnf_path": str(data.original.path),
        "original_cnf_sha256": data.original.file_sha256,
        "variables": data.original.variables,
        "declared_and_actual_clause_count": data.original.clause_count,
        "original_clause_bytes_sha256": data.original.clause_bytes_sha256,
        "raw_icnf_path": str(data.cover.path),
        "raw_icnf_sha256": data.cover.file_sha256,
        "icnf_base_clause_bytes_sha256": data.cover.base_clause_bytes_sha256,
        "base_clause_bytes_equal": True,
        "cube_count": len(data.cover.cubes),
        "cube_width_min": min(widths),
        "cube_width_max": max(widths),
        "cubes_sha256": data.cover.cubes_sha256,
    }


def deterministic_coverage_summary(result: dict[str, object]) -> dict[str, object]:
    return {
        field: result.get(field)
        for field in (
            "orientation",
            "status",
            "solver_status",
            "coverage_cnf_sha256",
            "cubes_sha256",
            "proof_artifact",
            "model_artifact",
        )
    }


def deterministic_leaf_summary(result: dict[str, object]) -> dict[str, object]:
    return {
        field: result.get(field)
        for field in (
            "orientation",
            "cube_index",
            "cube",
            "status",
            "solver_status",
            "leaf_cnf_sha256",
            "proof_artifact",
            "model_artifact",
        )
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--direct-icnf",
        type=Path,
        default=Path("/tmp/p97-exact5-card13-distinct-direct-raw.icnf"),
    )
    parser.add_argument(
        "--mirror-icnf",
        type=Path,
        default=Path("/tmp/p97-exact5-card13-distinct-mirror-raw.icnf"),
    )
    parser.add_argument("--cnf-dir", type=Path, default=HERE / "artifacts")
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=HERE / "artifacts/original-cube-cover-certification",
    )
    parser.add_argument("--coverage-timeout-seconds", type=int, default=60)
    parser.add_argument("--solve-timeout-seconds", type=int, default=300)
    parser.add_argument("--proof-timeout-seconds", type=int, default=600)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument(
        "--leaf-limit-per-orientation",
        type=int,
        help="testing-only prefix limit; omit for all 64 leaves per orientation",
    )
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--plan-only", action="store_true")
    mode.add_argument(
        "--resume-dry-run",
        action="store_true",
        help="validate caches and report pending work without solver calls or cleanup",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise SystemExit("workers must be in 1..24")
    if args.leaf_limit_per_orientation is not None and not (
        1 <= args.leaf_limit_per_orientation <= CUBE_COUNT
    ):
        raise SystemExit("leaf limit must be in 1..64")
    for value, label in (
        (args.coverage_timeout_seconds, "coverage timeout"),
        (args.solve_timeout_seconds, "solve timeout"),
        (args.proof_timeout_seconds, "proof timeout"),
    ):
        if value < 1:
            raise SystemExit(f"{label} must be positive")

    icnf_paths = {"direct": args.direct_icnf, "mirror": args.mirror_icnf}
    inputs: dict[str, OrbitInput] = {}
    for orientation in ORIENTATIONS:
        original = parse_original_cnf(args.cnf_dir / f"{orientation}.cnf")
        cover = parse_cube_cover(icnf_paths[orientation], original)
        inputs[orientation] = OrbitInput(orientation, original, cover)
    plan = {
        "schema": SUMMARY_SCHEMA,
        "mode": "PLAN",
        "inputs": {key: input_summary(value) for key, value in inputs.items()},
        "coverage_jobs": {orientation: 1 for orientation in ORIENTATIONS},
        "leaf_jobs": {
            orientation: (
                args.leaf_limit_per_orientation
                if args.leaf_limit_per_orientation is not None
                else CUBE_COUNT
            )
            for orientation in ORIENTATIONS
        },
    }
    if args.plan_only:
        print(json.dumps(plan, indent=2, sort_keys=True))
        return 0

    args.output_dir.mkdir(parents=True, exist_ok=True)
    rejections: list[dict[str, object]] = []
    resume_counts = {
        orientation: {
            "coverage": {"reused": 0, "new": 0, "missing": 0, "rejected": 0},
            "leaves": {"reused": 0, "new": 0, "missing": 0, "rejected": 0},
        }
        for orientation in ORIENTATIONS
    }
    coverage_results: list[dict[str, object]] = []
    coverage_jobs: list[OrbitInput] = []
    for orientation in ORIENTATIONS:
        data = inputs[orientation]
        result_path = coverage_cell(args.output_dir, orientation) / "result.json"
        result = None
        if result_path.is_file():
            try:
                result = validate_coverage_result(
                    result_path,
                    data,
                    args.output_dir,
                    args.coverage_timeout_seconds,
                    args.proof_timeout_seconds,
                )
            except ValidationError as error:
                resume_counts[orientation]["coverage"]["rejected"] += 1
                rejections.append(
                    {
                        "kind": "coverage",
                        "orientation": orientation,
                        "path": str(result_path),
                        "reason": str(error),
                    }
                )
        else:
            resume_counts[orientation]["coverage"]["missing"] += 1
        if result is None:
            coverage_jobs.append(data)
        else:
            coverage_results.append(result)
            resume_counts[orientation]["coverage"]["reused"] += 1

    limit = args.leaf_limit_per_orientation or CUBE_COUNT
    selected_leaves = [
        (inputs[orientation], cube_index)
        for orientation in ORIENTATIONS
        for cube_index in range(limit)
    ]
    leaf_results: list[dict[str, object]] = []
    leaf_jobs: list[tuple[OrbitInput, int]] = []
    for data, cube_index in selected_leaves:
        result_path = leaf_cell(
            args.output_dir, data.orientation, cube_index
        ) / "result.json"
        result = None
        if result_path.is_file():
            try:
                result = validate_leaf_result(
                    result_path,
                    data,
                    cube_index,
                    args.output_dir,
                    args.solve_timeout_seconds,
                    args.proof_timeout_seconds,
                )
            except ValidationError as error:
                resume_counts[data.orientation]["leaves"]["rejected"] += 1
                rejections.append(
                    {
                        "kind": "leaf",
                        "orientation": data.orientation,
                        "cube_index": cube_index,
                        "path": str(result_path),
                        "reason": str(error),
                    }
                )
        else:
            resume_counts[data.orientation]["leaves"]["missing"] += 1
        if result is None:
            leaf_jobs.append((data, cube_index))
        else:
            leaf_results.append(result)
            resume_counts[data.orientation]["leaves"]["reused"] += 1

    if args.resume_dry_run:
        print(
            json.dumps(
                {
                    **plan,
                    "mode": "RESUME_DRY_RUN",
                    "resume_counts": resume_counts,
                    "would_submit": {
                        "coverage": len(coverage_jobs),
                        "leaves": len(leaf_jobs),
                    },
                    "rejections": rejections,
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0

    for data in coverage_jobs:
        clean_coverage_cell(args.output_dir, data.orientation)
    with concurrent.futures.ThreadPoolExecutor(
        max_workers=min(args.workers, len(coverage_jobs) or 1)
    ) as pool:
        futures = [
            pool.submit(
                solve_coverage,
                data,
                args.output_dir,
                args.coverage_timeout_seconds,
                args.proof_timeout_seconds,
            )
            for data in coverage_jobs
        ]
        for future in concurrent.futures.as_completed(futures):
            result = future.result()
            coverage_results.append(result)
            resume_counts[str(result["orientation"])]["coverage"]["new"] += 1
            print(
                f"coverage {result['orientation']}: {result['status']}", flush=True
            )
    coverage_results.sort(key=lambda item: ORIENTATIONS.index(str(item["orientation"])))
    coverage_ok = all(
        result["status"] == "UNSAT_DRAT_VERIFIED" for result in coverage_results
    ) and len(coverage_results) == len(ORIENTATIONS)
    if coverage_ok:
        for data, cube_index in leaf_jobs:
            clean_leaf_cell(args.output_dir, data.orientation, cube_index)
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
            futures = [
                pool.submit(
                    solve_leaf,
                    data,
                    cube_index,
                    args.output_dir,
                    args.solve_timeout_seconds,
                    args.proof_timeout_seconds,
                )
                for data, cube_index in leaf_jobs
            ]
            for count, future in enumerate(
                concurrent.futures.as_completed(futures), start=1
            ):
                result = future.result()
                leaf_results.append(result)
                resume_counts[str(result["orientation"])]["leaves"]["new"] += 1
                print(
                    f"leaf [{count}/{len(leaf_jobs)}] {result['orientation']} "
                    f"{result['cube_index']:02d}: {result['status']}",
                    flush=True,
                )
    leaf_results.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])), int(item["cube_index"])
        )
    )
    status_counts = {
        orientation: {
            status: sum(
                item["orientation"] == orientation and item["status"] == status
                for item in leaf_results
            )
            for status in ("SAT", "UNSAT", "UNKNOWN")
        }
        for orientation in ORIENTATIONS
    }
    full_scope = args.leaf_limit_per_orientation is None
    all_leaves_unsat = full_scope and all(
        status_counts[orientation]
        == {"SAT": 0, "UNSAT": CUBE_COUNT, "UNKNOWN": 0}
        for orientation in ORIENTATIONS
    )
    overall_status = (
        "SAT"
        if any(counts["SAT"] for counts in status_counts.values())
        else (
            "BOTH_ORIGINAL_CNFS_UNSAT_EXTERNALLY_CERTIFIED"
            if coverage_ok and all_leaves_unsat
            else "UNKNOWN"
        )
    )
    summary = {
        "schema": SUMMARY_SCHEMA,
        "epistemic_status": "EXTERNAL_ORIGINAL_CNF_COVER_CERTIFICATION_ONLY",
        "scope": (
            "all 64 raw cubes per orientation"
            if full_scope
            else f"bounded smoke prefix: {limit} leaves per orientation"
        ),
        "inputs": {key: input_summary(value) for key, value in inputs.items()},
        "settings": {
            "coverage_timeout_seconds": args.coverage_timeout_seconds,
            "solve_timeout_seconds": args.solve_timeout_seconds,
            "proof_timeout_seconds": args.proof_timeout_seconds,
            "workers": args.workers,
            "leaf_limit_per_orientation": args.leaf_limit_per_orientation,
        },
        "resume_counts": resume_counts,
        "cache_validation_rejections": rejections,
        "coverage_status": {
            orientation: next(
                result["status"]
                for result in coverage_results
                if result["orientation"] == orientation
            )
            for orientation in ORIENTATIONS
        },
        "leaf_status_counts": status_counts,
        "overall_status": overall_status,
        "no_kernel_claim_reason": "source-to-CNF ingress is not kernel checked",
        "coverage_results": [
            deterministic_coverage_summary(result) for result in coverage_results
        ],
        "leaf_results": [
            deterministic_leaf_summary(result) for result in leaf_results
        ],
    }
    summary_path = args.output_dir / "summary.json"
    write_json_atomic(summary_path, summary)
    print(
        json.dumps(
            {
                "coverage_status": summary["coverage_status"],
                "leaf_status_counts": status_counts,
                "overall_status": overall_status,
                "resume_counts": resume_counts,
                "summary_path": str(summary_path),
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0 if coverage_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
