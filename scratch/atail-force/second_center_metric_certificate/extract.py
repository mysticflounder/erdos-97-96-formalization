#!/usr/bin/env python3
"""Bounded Singular membership and Nullstellensatz extraction driver.

Every target call is hard-capped at 120 seconds and 10 MiB of Singular
output.  A timeout, output cap, malformed transcript, or CAS error is recorded
as no certificate/no verdict.  Only an emitted coefficient vector whose exact
Singular-side reconstruction is 1 is saved as a candidate certificate; the
separate ``check.py`` must still replay it independently.
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import tempfile
import time
from pathlib import Path
from typing import Any, Sequence

from targets import Target, all_targets, canonical_sha256


HERE = Path(__file__).resolve().parent
MAX_TIMEOUT_SECONDS = 120.0
MAX_OUTPUT_BYTES = 10 * 1024 * 1024
SINGULAR = "Singular"


def membership_script(variables: Sequence[str], generators: Sequence[str]) -> str:
    return "\n".join((
        f"ring R=0,({','.join(variables)}),dp;",
        f"ideal I={','.join(generators)};",
        "ideal G=slimgb(I);",
        'print("P97_MEMBERSHIP_BEGIN");',
        "reduce(1,G);",
        'print("P97_MEMBERSHIP_END");',
        "quit;",
        "",
    ))


def extraction_script(target: Target, method: str) -> str:
    lines = [
        f"ring R=0,({','.join(target.variables)}),dp;",
        f"ideal I={','.join(target.generators)};",
    ]
    if method == "liftstd_slimgb":
        lines.extend((
            "matrix T;",
            'ideal G=liftstd(I,T,"slimgb");',
            # liftstd need not normalize a constant basis element: the live
            # five-row core returns G[1]=12.  Scaling the corresponding tracked
            # column by its inverse gives a representation of 1.
            "int certificateFound=(size(G)==1 and deg(G[1])==0 and G[1]!=0);",
            "number basisScale=1/leadcoef(G[1]);",
            "matrix C=basisScale*T;",
        ))
    elif method == "direct_lift_slimgb":
        lines.extend((
            "ideal J=1;",
            "matrix U;",
            'matrix T=lift(I,J,U,"slimgb");',
            "poly directCheck=matrix(I)*T;",
            "int certificateFound=(directCheck==1);",
            "matrix C=T;",
        ))
    else:
        raise ValueError(f"unsupported method {method}")
    lines.extend((
        "if (certificateFound) {",
        'print("P97_STATUS_CERTIFICATE");',
    ))
    for index in range(1, len(target.generators) + 1):
        lines.extend((
            f'print("P97_COEFFICIENT_BEGIN_{index}");',
            f"print(C[{index},1]);",
            f'print("P97_COEFFICIENT_END_{index}");',
        ))
    lines.extend((
        "poly exactCheck=0;",
        f"for (int i=1; i<={len(target.generators)}; i=i+1) "
        "{ exactCheck=exactCheck+I[i]*C[i,1]; }",
        'print("P97_INTERNAL_CHECK_BEGIN");',
        "print(exactCheck);",
        'print("P97_INTERNAL_CHECK_END");',
        "} else {",
        'print("P97_STATUS_NO_CERTIFICATE");',
        "}",
        "quit;",
        "",
    ))
    return "\n".join(lines)


def bounded_singular(script: str, timeout_seconds: float) -> dict[str, Any]:
    if timeout_seconds <= 0 or timeout_seconds > MAX_TIMEOUT_SECONDS:
        raise ValueError(f"timeout must be in (0,{MAX_TIMEOUT_SECONDS}]")
    started = time.monotonic()
    with tempfile.TemporaryDirectory(prefix="p97-atail-certificate-") as tmp:
        stdout_path = Path(tmp) / "stdout.txt"
        stderr_path = Path(tmp) / "stderr.txt"
        with stdout_path.open("wb") as stdout, stderr_path.open("wb") as stderr:
            process = subprocess.Popen(
                [SINGULAR, "-q"],
                stdin=subprocess.PIPE,
                stdout=stdout,
                stderr=stderr,
            )
            assert process.stdin is not None
            process.stdin.write(script.encode())
            process.stdin.close()
            reason: str | None = None
            while process.poll() is None:
                elapsed = time.monotonic() - started
                stdout.flush()
                stderr.flush()
                if elapsed >= timeout_seconds:
                    reason = "TIMEOUT_NO_VERDICT"
                    process.kill()
                    break
                if stdout_path.stat().st_size + stderr_path.stat().st_size > MAX_OUTPUT_BYTES:
                    reason = "OUTPUT_LIMIT_NO_VERDICT"
                    process.kill()
                    break
                time.sleep(0.05)
            process.wait()
        elapsed = time.monotonic() - started
        stdout_bytes = stdout_path.read_bytes()
        stderr_bytes = stderr_path.read_bytes()
    base = {
        "elapsed_seconds": round(elapsed, 3),
        "timeout_seconds": timeout_seconds,
        "stdout_bytes": len(stdout_bytes),
        "stderr_bytes": len(stderr_bytes),
        "returncode": process.returncode,
    }
    if reason is not None:
        return {**base, "status": reason, "stdout": "", "stderr": ""}
    try:
        stdout_text = stdout_bytes.decode()
        stderr_text = stderr_bytes.decode()
    except UnicodeDecodeError:
        return {**base, "status": "MALFORMED_OUTPUT_NO_VERDICT", "stdout": "", "stderr": ""}
    if process.returncode != 0:
        return {
            **base,
            "status": "CAS_ERROR_NO_VERDICT",
            "stdout": stdout_text,
            "stderr": stderr_text,
        }
    return {**base, "status": "COMPLETED", "stdout": stdout_text, "stderr": stderr_text}


def _between(output: str, begin: str, end: str) -> str | None:
    lines = output.splitlines()
    begins = [i for i, line in enumerate(lines) if line.strip() == begin]
    ends = [i for i, line in enumerate(lines) if line.strip() == end]
    if len(begins) != 1 or len(ends) != 1 or begins[0] >= ends[0]:
        return None
    # Singular may wrap a long polynomial at line boundaries; concatenation is
    # its parseable polynomial representation because whitespace is immaterial.
    return "".join(line.strip() for line in lines[begins[0] + 1:ends[0]] if line.strip())


def membership(target: Target, timeout_seconds: float) -> dict[str, Any]:
    run = bounded_singular(
        membership_script(target.variables, target.generators), timeout_seconds
    )
    stdout = run.pop("stdout")
    stderr = run.pop("stderr")
    result = {
        **run,
        "operation": "membership",
        "target": target.name,
        "generator_sha256": canonical_sha256(list(target.generators)),
    }
    if run["status"] != "COMPLETED":
        return result
    payload = _between(stdout, "P97_MEMBERSHIP_BEGIN", "P97_MEMBERSHIP_END")
    if payload == "0":
        result["status"] = "UNIT"
    elif payload == "1":
        result["status"] = "NONUNIT"
    else:
        result["status"] = "MALFORMED_OUTPUT_NO_VERDICT"
        result["diagnostic"] = (stderr or stdout)[-1000:]
    return result


def extract(target: Target, method: str, timeout_seconds: float) -> tuple[dict[str, Any], dict[str, Any] | None]:
    run = bounded_singular(extraction_script(target, method), timeout_seconds)
    stdout = run.pop("stdout")
    stderr = run.pop("stderr")
    result = {
        **run,
        "operation": "certificate_extraction",
        "method": method,
        "target": target.name,
        "generator_sha256": canonical_sha256(list(target.generators)),
    }
    if run["status"] != "COMPLETED":
        return result, None
    if "P97_STATUS_CERTIFICATE" not in stdout:
        result["status"] = "NO_CERTIFICATE_NO_VERDICT"
        result["diagnostic"] = (stderr or stdout)[-1000:]
        return result, None
    internal = _between(stdout, "P97_INTERNAL_CHECK_BEGIN", "P97_INTERNAL_CHECK_END")
    if internal != "1":
        result["status"] = "FAILED_INTERNAL_IDENTITY_NO_VERDICT"
        return result, None
    multipliers: list[str] = []
    for index in range(1, len(target.generators) + 1):
        coefficient = _between(
            stdout,
            f"P97_COEFFICIENT_BEGIN_{index}",
            f"P97_COEFFICIENT_END_{index}",
        )
        if coefficient is None:
            result["status"] = "MALFORMED_OUTPUT_NO_VERDICT"
            return result, None
        multipliers.append(coefficient)
    certificate = {
        "schema": "p97-atail-nullstellensatz-certificate-v1",
        "target": target.name,
        "coordinate_model": target.coordinate_model,
        "coefficient_field": "QQ",
        "monomial_order": "dp",
        "variables": list(target.variables),
        "rows": [row.encoded() for row in target.rows],
        "generators": list(target.generators),
        "multipliers": multipliers,
        "identity": "1 = sum_i multipliers[i] * generators[i]",
        "generator_sha256": canonical_sha256(list(target.generators)),
        "row_set_sha256": canonical_sha256([row.encoded() for row in target.rows]),
        "provenance": target.provenance,
        "extraction": {
            "method": method,
            "singular_executable": SINGULAR,
            "timeout_seconds": timeout_seconds,
        },
    }
    result["status"] = "CANDIDATE_CERTIFICATE_EXTRACTED"
    result["certificate_payload_sha256"] = canonical_sha256(certificate)
    return result, certificate


def smoke_gates() -> dict[str, Any]:
    variables = ("z",)
    unit = Target("smoke_unit", "smoke", variables, ("z", "z-1"), (), {})
    nonunit = Target("smoke_nonunit", "smoke", variables, ("z^2-1",), (), {})
    unit_membership = membership(unit, 5.0)
    nonunit_membership = membership(nonunit, 5.0)
    unit_extraction, certificate = extract(unit, "liftstd_slimgb", 5.0)
    if unit_membership["status"] != "UNIT":
        raise RuntimeError(f"UNIT smoke failed: {unit_membership}")
    if nonunit_membership["status"] != "NONUNIT":
        raise RuntimeError(f"NONUNIT smoke failed: {nonunit_membership}")
    if unit_extraction["status"] != "CANDIDATE_CERTIFICATE_EXTRACTED" or certificate is None:
        raise RuntimeError(f"certificate smoke failed: {unit_extraction}")
    return {
        "known_unit_membership": unit_membership["status"],
        "known_nonunit_membership": nonunit_membership["status"],
        "known_unit_certificate": unit_extraction["status"],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", choices=sorted(all_targets()))
    parser.add_argument(
        "--operation", choices=("membership", "liftstd_slimgb", "direct_lift_slimgb")
    )
    parser.add_argument("--timeout", type=float, default=MAX_TIMEOUT_SECONDS)
    parser.add_argument("--result", type=Path)
    parser.add_argument("--certificate", type=Path)
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()
    smoke = smoke_gates()
    if args.smoke_only:
        print(json.dumps(smoke, indent=2, sort_keys=True))
        return
    if args.target is None or args.operation is None:
        parser.error("--target and --operation are required unless --smoke-only")
    target = all_targets()[args.target]
    if args.operation == "membership":
        result = membership(target, args.timeout)
        certificate = None
    else:
        result, certificate = extract(target, args.operation, args.timeout)
    result["smoke_gates"] = smoke
    if args.result:
        args.result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    if certificate is not None:
        if args.certificate is None:
            raise RuntimeError("extraction succeeded but --certificate was not supplied")
        args.certificate.write_text(json.dumps(certificate, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
