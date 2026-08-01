"""Extract a liftstd-based exact QQ certificate for x9x^2+x9y^2."""

from __future__ import annotations

import hashlib
import json
import re
import shutil
import subprocess
import sys
import time
from pathlib import Path
from typing import Any

import sympy as sp

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[1]
SOURCE = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_new_survivors_realization_20260729/"
    "system-01-d6db6d91d18e/system.json"
)
TARGET = "x9x^2+x9y^2"
EXPECTED_METRIC_HASH = (
    "d6db6d91d18e0e8ca9efe6941711375be4f3849d21adc4bcfc6c6806afd5ed5e"
)
TIMEOUT_SECONDS = 3600
COFACTOR_RE = re.compile(r"^COFACTOR_(\d{3})_BEGIN$")


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def json_bytes(value: Any, *, pretty: bool = True) -> bytes:
    if pretty:
        text = json.dumps(value, indent=2, sort_keys=True, allow_nan=False)
    else:
        text = json.dumps(
            value, sort_keys=True, separators=(",", ":"), allow_nan=False
        )
    return (text + "\n").encode()


def write(path: Path, data: bytes) -> str:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
    return sha256(data)


def parse_poly(
    text: str, symbols: tuple[sp.Symbol, ...]
) -> sp.Poly:
    expression = sp.sympify(
        text.replace("^", "**"),
        locals={str(symbol): symbol for symbol in symbols},
        evaluate=True,
    )
    return sp.Poly(expression, *symbols, domain=sp.QQ)


def singular_script(variables: list[str], polynomials: list[str]) -> str:
    generators = ",\n  ".join(polynomials)
    lines = [
        f"ring r=0,({','.join(variables)}),dp;",
        f"ideal I={generators};",
        "matrix T;",
        'ideal G=liftstd(I,T,"slimgb");',
        f"poly target={TARGET};",
        "poly nf=reduce(target,G);",
        'print("NORMAL_FORM_BEGIN");',
        "string(nf);",
        'print("NORMAL_FORM_END");',
        'if (nf!=0) { print("TARGET_NOT_IN_IDEAL"); quit; }',
        "ideal J=target;",
        "matrix U;",
        'matrix K=lift(G,J,U,"slimgb");',
        "matrix C=T*K;",
        "poly identity=0;",
        "for (int i=1;i<=size(I);i++)"
        " { identity=identity+I[i]*C[i,1]; }",
        'print("IDENTITY_BEGIN");',
        "string(identity);",
        'print("IDENTITY_END");',
    ]
    for index in range(1, len(polynomials) + 1):
        lines.extend(
            [
                f'print("COFACTOR_{index:03d}_BEGIN");',
                f"string(C[{index},1]);",
                f'print("COFACTOR_{index:03d}_END");',
            ]
        )
    lines.extend(["quit;", ""])
    return "\n".join(lines)


def smoke_script() -> str:
    return """\
ring r=0,(x,y),dp;
ideal I=x+y,x-y;
matrix T;
ideal G=liftstd(I,T,"slimgb");
ideal J=2*x;
matrix U;
matrix K=lift(G,J,U,"slimgb");
matrix C=T*K;
poly identity=I[1]*C[1,1]+I[2]*C[2,1];
if (identity==2*x) { print("KNOWN_MEMBER_PASS"); }
else { print("KNOWN_MEMBER_FAIL"); }
if (reduce(1,G)!=0) { print("KNOWN_NONMEMBER_PASS"); }
else { print("KNOWN_NONMEMBER_FAIL"); }
quit;
"""


def run_singular(
    binary: str, script: Path, timeout: int
) -> tuple[dict[str, Any], bytes, bytes]:
    started = time.monotonic()
    result = subprocess.run(
        [binary, "-q", str(script)],
        stdin=subprocess.DEVNULL,
        capture_output=True,
        check=False,
        timeout=timeout,
    )
    metadata = {
        "argv": [binary, "-q", str(script.relative_to(ROOT))],
        "elapsed_seconds": time.monotonic() - started,
        "returncode": result.returncode,
        "stdin": "DEVNULL",
    }
    return metadata, result.stdout, result.stderr


def marked_block(lines: list[str], begin: str, end: str) -> str:
    starts = [i for i, line in enumerate(lines) if line == begin]
    stops = [i for i, line in enumerate(lines) if line == end]
    if len(starts) != 1 or len(stops) != 1 or starts[0] >= stops[0]:
        raise ValueError(f"bad marker block {begin}/{end}")
    return "".join(lines[starts[0] + 1 : stops[0]]).strip()


def parse_singular(stdout: bytes, count: int) -> dict[str, Any]:
    lines = [line.strip() for line in stdout.decode().splitlines()]
    if "TARGET_NOT_IN_IDEAL" in lines:
        raise ValueError("Singular reports target is not in the ideal")
    cofactors: dict[int, str] = {}
    for position, line in enumerate(lines):
        match = COFACTOR_RE.fullmatch(line)
        if match is None:
            continue
        index = int(match.group(1))
        end = f"COFACTOR_{index:03d}_END"
        try:
            stop = lines.index(end, position + 1)
        except ValueError as error:
            raise ValueError(f"missing marker {end}") from error
        cofactors[index] = "".join(lines[position + 1 : stop]).strip()
    if sorted(cofactors) != list(range(1, count + 1)):
        raise ValueError("cofactor indices do not match generator order")
    return {
        "normal_form": marked_block(
            lines, "NORMAL_FORM_BEGIN", "NORMAL_FORM_END"
        ),
        "identity": marked_block(lines, "IDENTITY_BEGIN", "IDENTITY_END"),
        "cofactors": [cofactors[i] for i in range(1, count + 1)],
    }


def replay(
    variables: list[str], polynomials: list[str], cofactors: list[str]
) -> dict[str, Any]:
    symbols = tuple(sp.Symbol(name) for name in variables)
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    metrics = []
    for index, (generator, cofactor) in enumerate(
        zip(polynomials, cofactors, strict=True)
    ):
        cofactor_poly = parse_poly(cofactor, symbols)
        total += parse_poly(generator, symbols) * cofactor_poly
        metrics.append(
            {
                "index": index,
                "nonzero": not cofactor_poly.is_zero,
                "term_count": cofactor_poly.length(),
                "total_degree": (
                    0
                    if cofactor_poly.is_zero
                    else int(cofactor_poly.total_degree())
                ),
            }
        )
    target = parse_poly(TARGET, symbols)
    return {
        "passed": total == target,
        "computed_result": sp.sstr(total.as_expr()),
        "target": sp.sstr(target.as_expr()),
        "cofactor_metrics": metrics,
    }


def main() -> int:
    if (OUT / "certificate.json").exists():
        raise SystemExit("refusing to overwrite certificate.json")
    binary = shutil.which("Singular")
    if binary is None:
        raise RuntimeError("Singular not found")
    version_run = subprocess.run(
        [binary, "--version"],
        stdin=subprocess.DEVNULL,
        capture_output=True,
        check=False,
    )
    if version_run.returncode != 0:
        raise RuntimeError("Singular --version failed")
    version = version_run.stdout.decode(errors="replace").strip()

    source_raw = SOURCE.read_bytes()
    source = json.loads(source_raw)
    variables = source["free_variables"]
    polynomials = source["polynomials"]
    rows = source["rows"]
    if source["metric_rows_sha256"] != EXPECTED_METRIC_HASH:
        raise ValueError("unexpected metric row hash")
    if len(variables) != 16 or len(polynomials) != 30 or len(rows) != 10:
        raise ValueError("unexpected source dimensions")
    if source["coordinate_gauge"] != {"0": ["0", "0"], "1": ["1", "0"]}:
        raise ValueError("unexpected coordinate gauge")

    smoke_path = OUT / "smoke" / "job.sing"
    write(smoke_path, smoke_script().encode())
    smoke_meta, smoke_stdout, smoke_stderr = run_singular(
        binary, smoke_path, 60
    )
    write(OUT / "smoke" / "stdout.txt", smoke_stdout)
    write(OUT / "smoke" / "stderr.txt", smoke_stderr)
    write(OUT / "smoke" / "result.json", json_bytes(smoke_meta))
    smoke_lines = set(smoke_stdout.decode().splitlines())
    if smoke_meta["returncode"] != 0 or not {
        "KNOWN_MEMBER_PASS",
        "KNOWN_NONMEMBER_PASS",
    }.issubset(smoke_lines):
        raise RuntimeError("Singular liftstd smoke test failed")

    script_path = OUT / "singular" / "job.sing"
    write(script_path, singular_script(variables, polynomials).encode())
    run_meta, stdout, stderr = run_singular(
        binary, script_path, TIMEOUT_SECONDS
    )
    write(OUT / "singular" / "stdout.txt", stdout)
    write(OUT / "singular" / "stderr.txt", stderr)
    write(OUT / "singular" / "result.json", json_bytes(run_meta))
    if run_meta["returncode"] != 0:
        raise RuntimeError(f"Singular failed: {run_meta}")
    parsed = parse_singular(stdout, len(polynomials))
    if parsed["normal_form"] != "0":
        raise ValueError(f"nonzero normal form: {parsed['normal_form']}")
    in_process = replay(variables, polynomials, parsed["cofactors"])
    if not in_process["passed"]:
        raise RuntimeError("in-process SymPy QQ replay failed")

    entries = []
    nonzero_indices = []
    antecedent_rows: dict[int, dict[str, Any]] = {}
    for index, (generator, cofactor, metric) in enumerate(
        zip(
            polynomials,
            parsed["cofactors"],
            in_process["cofactor_metrics"],
            strict=True,
        )
    ):
        row_index = index // 3
        entry = {
            "index": index,
            "singular_index": index + 1,
            "row_index": row_index,
            "row_equation_index": index % 3,
            "generator": generator,
            "cofactor": cofactor,
            "cofactor_metrics": {
                "nonzero": metric["nonzero"],
                "term_count": metric["term_count"],
                "total_degree": metric["total_degree"],
            },
        }
        entries.append(entry)
        if metric["nonzero"]:
            nonzero_indices.append(index)
            antecedent_rows[row_index] = rows[row_index]

    certificate = {
        "schema": "p97-singular-liftstd-target-membership-certificate-v1",
        "coefficient_field": "QQ",
        "target": TARGET,
        "exact_identity": (
            "x9x^2+x9y^2 = sum_{i=0}^{29} cofactor_i * generator_i"
        ),
        "source_system": {
            "relative_path": str(SOURCE.relative_to(ROOT)),
            "raw_sha256": sha256(source_raw),
            "schema": source["schema"],
            "metric_rows_sha256": source["metric_rows_sha256"],
            "coordinate_gauge": source["coordinate_gauge"],
        },
        "order_hashes": {
            "variables_canonical_json_sha256": sha256(
                json_bytes(variables, pretty=False)
            ),
            "generators_canonical_json_sha256": sha256(
                json_bytes(polynomials, pretty=False)
            ),
            "rows_canonical_json_sha256": sha256(
                json_bytes(rows, pretty=False)
            ),
        },
        "variables": variables,
        "generator_count": len(entries),
        "entries": entries,
        "nonzero_cofactor_indices": nonzero_indices,
        "antecedent_membership_rows": [
            {"row_index": index, **antecedent_rows[index]}
            for index in sorted(antecedent_rows)
        ],
        "singular_extraction": {
            "binary": binary,
            "version": version,
            "ring": "QQ[x2x,x2y,...,x9x,x9y]",
            "monomial_order": "dp",
            "algorithm": (
                'G=liftstd(I,T,"slimgb"); '
                'K=lift(G,ideal(target),U,"slimgb"); C=T*K'
            ),
            "normal_form": parsed["normal_form"],
            "printed_identity": parsed["identity"],
        },
    }
    certificate_path = OUT / "certificate.json"
    certificate_hash = write(certificate_path, json_bytes(certificate))

    replay_command = [
        sys.executable,
        str((OUT / "replay_certificate.py").relative_to(ROOT)),
        str(certificate_path.relative_to(ROOT)),
        str(SOURCE.relative_to(ROOT)),
    ]
    fresh = subprocess.run(
        replay_command,
        cwd=ROOT,
        stdin=subprocess.DEVNULL,
        capture_output=True,
        check=False,
    )
    write(OUT / "fresh-replay" / "stdout.json", fresh.stdout)
    write(OUT / "fresh-replay" / "stderr.txt", fresh.stderr)
    write(
        OUT / "fresh-replay" / "command.json",
        json_bytes({"argv": replay_command, "stdin": "DEVNULL"}),
    )
    replay_result = json.loads(fresh.stdout) if fresh.stdout else None
    if (
        fresh.returncode != 0
        or replay_result is None
        or replay_result["status"] != "PASS"
    ):
        raise RuntimeError(f"fresh replay failed: {replay_result}")

    manifest = {
        "schema": "p97-singular-liftstd-x9-manifest-v1",
        "status": "CERTIFIED_QQ_IDEAL_MEMBERSHIP",
        "target": TARGET,
        "generator_count": len(entries),
        "nonzero_cofactor_count": len(nonzero_indices),
        "nonzero_cofactor_indices": nonzero_indices,
        "antecedent_membership_row_indices": sorted(antecedent_rows),
        "source_system_sha256": sha256(source_raw),
        "metric_rows_sha256": source["metric_rows_sha256"],
        "certificate_sha256": certificate_hash,
        "singular_job_sha256": sha256(script_path.read_bytes()),
        "singular_stdout_sha256": sha256(stdout),
        "singular_elapsed_seconds": run_meta["elapsed_seconds"],
        "singular_version": version,
        "in_process_sympy_qq_replay": in_process["passed"],
        "fresh_process_sympy_qq_replay": replay_result,
        "scope": (
            "Exact target ideal membership for this ordered 30-generator "
            "equality system only; no production or Lean closure is claimed."
        ),
    }
    write(OUT / "manifest.json", json_bytes(manifest))

    files = sorted(
        path
        for path in OUT.rglob("*")
        if path.is_file() and path.name != "SHA256SUMS"
    )
    checksums = "".join(
        f"{sha256(path.read_bytes())}  {path.relative_to(OUT)}\n"
        for path in files
    ).encode()
    write(OUT / "SHA256SUMS", checksums)
    print(json.dumps(manifest, sort_keys=True, allow_nan=False))
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except subprocess.TimeoutExpired as error:
        print(f"TIMEOUT: {error}", file=sys.stderr)
        raise SystemExit(2) from error
