#!/usr/bin/env python3
"""Run one PIQD SAT-session solve and record a complete CaDiCaL-style model."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import re
from pathlib import Path

LOWER_HEX_64 = re.compile(r"[0-9a-f]{64}\Z")
SOLVE_BASE_KEYS = {"status", "solve_ms", "solve_index", "result_sha256"}


def load_uploader(path: Path):  # type: ignore[no-untyped-def]
    spec = importlib.util.spec_from_file_location("piqd_dimacs_uploader", path)
    if spec is None or spec.loader is None:
        raise ValueError("cannot load PIQD HTTP helpers")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def atomic_bytes(path: Path, value: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_bytes(value)
    os.replace(temporary, path)


def atomic_json(path: Path, value: object) -> None:
    atomic_bytes(path, (json.dumps(value, indent=2, sort_keys=True) + "\n").encode())


def exact_int(value: object, *, where: str, minimum: int) -> int:
    if type(value) is not int or value < minimum:
        raise ValueError(f"{where} is not an integer at least {minimum}")
    return value


def validate_session(
    value: dict[str, object],
    *,
    session_id: str,
    clauses: int,
    max_var: int,
) -> None:
    if value.get("id") != session_id:
        raise ValueError("PIQD returned the wrong session")
    if value.get("lane") != "sat" or value.get("state") != "live":
        raise ValueError("PIQD session is not a live SAT session")
    if value.get("clauses") != clauses or value.get("max_var") != max_var:
        raise ValueError("PIQD session dimensions do not match the expected CNF")


def validate_sat_response(
    value: dict[str, object], *, max_var: int
) -> tuple[int, ...]:
    if set(value) != SOLVE_BASE_KEYS | {"model"}:
        raise ValueError("PIQD SAT response has missing or extra keys")
    if value.get("status") != "SAT":
        raise ValueError("PIQD response is not SAT")
    exact_int(value.get("solve_ms"), where="solve_ms", minimum=0)
    exact_int(value.get("solve_index"), where="solve_index", minimum=1)
    if not isinstance(value.get("result_sha256"), str) or not LOWER_HEX_64.fullmatch(
        value["result_sha256"]
    ):
        raise ValueError("PIQD result_sha256 is malformed")
    raw_model = value.get("model")
    if type(raw_model) is not list or len(raw_model) != max_var:
        raise ValueError("PIQD SAT model is not complete")
    model: list[int] = []
    for variable, literal in enumerate(raw_model, start=1):
        if type(literal) is not int or abs(literal) != variable:
            raise ValueError("PIQD SAT model is not ordered over 1..=max_var")
        model.append(literal)
    return tuple(model)


def cadical_log(model: tuple[int, ...], *, width: int = 20) -> bytes:
    lines = ["c model returned by an authenticated PIQD SAT session", "s SATISFIABLE"]
    lines.extend(
        "v " + " ".join(str(literal) for literal in model[start : start + width]) + " 0"
        for start in range(0, len(model), width)
    )
    return ("\n".join(lines) + "\n").encode()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--expected-clauses", type=int, required=True)
    parser.add_argument("--expected-max-var", type=int, required=True)
    parser.add_argument("--model-log", type=Path, required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=600.0)
    parser.add_argument("--conflict-limit", type=int)
    args = parser.parse_args()
    if args.expected_clauses < 0 or args.expected_max_var < 0:
        raise ValueError("expected dimensions must be nonnegative")
    if args.conflict_limit is not None and args.conflict_limit < 1:
        raise ValueError("conflict limit must be positive")

    uploader = load_uploader(Path(__file__).resolve().with_name("upload_dimacs_to_piqd_session.py"))
    session_path = f"/sessions/{args.session_id}"
    before = uploader.request_json(
        args.base_url, "GET", session_path, timeout_s=args.timeout_seconds
    )
    validate_session(
        before,
        session_id=args.session_id,
        clauses=args.expected_clauses,
        max_var=args.expected_max_var,
    )
    body: dict[str, object] = {"assumptions": [], "include_model": True}
    if args.conflict_limit is not None:
        body["conflict_limit"] = args.conflict_limit
    response = uploader.request_json(
        args.base_url,
        "POST",
        f"{session_path}/solve",
        json.dumps(body, separators=(",", ":")).encode(),
        timeout_s=args.timeout_seconds,
    )
    if response.get("status") != "SAT":
        atomic_json(
            args.receipt,
            {"session_before": before, "solve_response": response, "model_log": None},
        )
        print(json.dumps({"status": response.get("status"), "receipt": str(args.receipt)}))
        return 3

    model = validate_sat_response(response, max_var=args.expected_max_var)
    atomic_bytes(args.model_log, cadical_log(model))
    response_without_model = {key: value for key, value in response.items() if key != "model"}
    receipt = {
        "schema": "p97-piqd-sat-session-model-capture-v1",
        "session_before": before,
        "solve_response": response_without_model,
        "model_log": str(args.model_log.resolve()),
        "model_log_sha256": sha256(args.model_log),
        "model_literals": len(model),
    }
    atomic_json(args.receipt, receipt)
    print(
        json.dumps(
            {
                "status": "SAT",
                "solve_ms": response["solve_ms"],
                "solve_index": response["solve_index"],
                "model_log_sha256": receipt["model_log_sha256"],
                "receipt": str(args.receipt),
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
