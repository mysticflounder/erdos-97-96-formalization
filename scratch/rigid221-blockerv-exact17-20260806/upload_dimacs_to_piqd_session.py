#!/usr/bin/env python3
"""Upload one authenticated DIMACS formula to a PIQD SAT session in bounded batches."""

from __future__ import annotations

import argparse
import hashlib
import json
import urllib.error
import urllib.request
from collections.abc import Iterator
from pathlib import Path
from typing import Any


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def request_json(
    base_url: str,
    method: str,
    path: str,
    body: bytes | None = None,
    *,
    timeout_s: float,
) -> dict[str, Any]:
    headers = {"accept": "application/json"}
    if body is not None:
        headers["content-type"] = "application/json"
    request = urllib.request.Request(
        base_url.rstrip("/") + path, data=body, headers=headers, method=method
    )
    try:
        with urllib.request.urlopen(request, timeout=timeout_s) as response:
            payload = response.read(1024 * 1024 + 1)
            if len(payload) > 1024 * 1024:
                raise ValueError("PIQD response exceeded the one-MiB audit cap")
            if response.status != 200:
                raise ValueError(f"PIQD returned HTTP {response.status}")
    except urllib.error.HTTPError as error:
        detail = error.read(4096).decode(errors="replace")
        raise ValueError(f"PIQD returned HTTP {error.code}: {detail}") from error
    value = json.loads(payload)
    if not isinstance(value, dict):
        raise TypeError("PIQD response is not a JSON object")
    return value


def dimacs_clauses(path: Path) -> tuple[int, int, Iterator[tuple[int, ...]]]:
    stream = path.open()
    expected_header: tuple[int, int] | None = None

    def clauses() -> Iterator[tuple[int, ...]]:
        header: tuple[int, int] | None = None
        current: list[int] = []
        seen = 0
        try:
            for line_number, line in enumerate(stream, start=1):
                stripped = line.strip()
                if not stripped or stripped.startswith("c"):
                    continue
                if stripped.startswith("p"):
                    if header is not None or current:
                        raise ValueError(
                            f"unexpected DIMACS header on line {line_number}"
                        )
                    fields = stripped.split()
                    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
                        raise ValueError(
                            f"malformed DIMACS header on line {line_number}"
                        )
                    variables = int(fields[2])
                    clause_count = int(fields[3])
                    if variables < 0 or clause_count < 0:
                        raise ValueError("negative DIMACS dimension")
                    header = (variables, clause_count)
                    if header != expected_header:
                        raise ValueError("DIMACS header changed between audit passes")
                    continue
                if header is None:
                    raise ValueError("DIMACS clause precedes header")
                variables, clause_count = header
                for token in stripped.split():
                    literal = int(token)
                    if literal == 0:
                        seen += 1
                        if seen > clause_count:
                            raise ValueError("DIMACS has more clauses than its header")
                        yield tuple(current)
                        current.clear()
                    else:
                        if abs(literal) > variables:
                            raise ValueError(
                                f"literal {literal} exceeds DIMACS variable range"
                            )
                        current.append(literal)
            if header is None:
                raise ValueError("DIMACS header is missing")
            if current:
                raise ValueError("DIMACS final clause is not zero-terminated")
            if seen != header[1]:
                raise ValueError(
                    f"DIMACS header declares {header[1]} clauses but parsed {seen}"
                )
        finally:
            stream.close()

    # Read just through the header, then rewind so the generator performs the
    # authoritative full parse once.
    for line in stream:
        stripped = line.strip()
        if not stripped or stripped.startswith("c"):
            continue
        fields = stripped.split()
        if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
            stream.close()
            raise ValueError("first DIMACS content line is not a valid header")
        expected_header = (int(fields[2]), int(fields[3]))
        if expected_header[0] < 0 or expected_header[1] < 0:
            stream.close()
            raise ValueError("negative DIMACS dimension")
        break
    if expected_header is None:
        stream.close()
        raise ValueError("DIMACS header is missing")
    stream.seek(0)
    return expected_header[0], expected_header[1], clauses()


BATCH_PREFIX = b'{"clauses":['
BATCH_SUFFIX = b"]}"


def encode_clause(clause: tuple[int, ...]) -> bytes:
    return json.dumps(clause, separators=(",", ":"), ensure_ascii=True).encode()


def encode_batch(entries: list[bytes]) -> bytes:
    return BATCH_PREFIX + b",".join(entries) + BATCH_SUFFIX


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--session-id", required=True)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--cnf-sha256", required=True)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--batch-byte-limit", type=int, default=1_500_000)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    args = parser.parse_args()
    if not 1 <= args.batch_byte_limit <= 1_750_000:
        raise ValueError("batch byte limit must be between 1 and 1,750,000")

    cnf = args.cnf.resolve()
    actual_sha = sha256(cnf)
    if actual_sha != args.cnf_sha256:
        raise ValueError("CNF SHA-256 does not match --cnf-sha256")
    variables, declared_clauses, clauses = dimacs_clauses(cnf)

    session_path = f"/sessions/{args.session_id}"
    session = request_json(
        args.base_url,
        "GET",
        session_path,
        timeout_s=args.timeout_seconds,
    )
    if session.get("id") != args.session_id:
        raise ValueError("PIQD returned the wrong session")
    if session.get("lane") != "sat" or session.get("state") != "live":
        raise ValueError("PIQD session is not a live SAT session")
    admitted = session.get("clauses")
    admitted_max_var = session.get("max_var")
    if type(admitted) is not int or not 0 <= admitted <= declared_clauses:
        raise ValueError("PIQD session clause count is not a valid resume point")
    if type(admitted_max_var) is not int or not 0 <= admitted_max_var <= variables:
        raise ValueError("PIQD session max_var is invalid")

    parsed = 0
    observed_max_var = 0
    resume_clauses = admitted
    session_max_var = admitted_max_var
    appended = 0
    requests = 0
    batch: list[bytes] = []
    batch_payload_bytes = 0
    batch_max_var = 0
    if resume_clauses == 0 and session_max_var != 0:
        raise ValueError("empty PIQD session has nonzero max_var")

    def flush() -> None:
        nonlocal admitted, appended, requests, batch, batch_payload_bytes
        nonlocal batch_max_var, session_max_var
        if not batch:
            return
        response = request_json(
            args.base_url,
            "POST",
            f"{session_path}/clauses",
            encode_batch(batch),
            timeout_s=args.timeout_seconds,
        )
        expected_total = admitted + len(batch)
        if set(response) != {"added", "clauses", "max_var"}:
            raise ValueError("PIQD add response has noncanonical keys")
        if response["added"] != len(batch) or response["clauses"] != expected_total:
            raise ValueError("PIQD add response has incorrect clause counts")
        expected_max_var = max(session_max_var, batch_max_var)
        if response["max_var"] != expected_max_var:
            raise ValueError("PIQD add response has incorrect max_var")
        admitted = expected_total
        session_max_var = expected_max_var
        appended += len(batch)
        requests += 1
        batch = []
        batch_payload_bytes = 0
        batch_max_var = 0

    for clause in clauses:
        parsed += 1
        clause_max = max((abs(literal) for literal in clause), default=0)
        observed_max_var = max(observed_max_var, clause_max)
        if parsed == resume_clauses and observed_max_var != admitted_max_var:
            raise ValueError("resume session max_var disagrees with the DIMACS prefix")
        if parsed <= resume_clauses:
            continue
        entry = encode_clause(clause)
        candidate_payload_bytes = (
            batch_payload_bytes + len(entry) + (1 if batch else 0)
        )
        candidate_body_bytes = (
            len(BATCH_PREFIX) + candidate_payload_bytes + len(BATCH_SUFFIX)
        )
        if candidate_body_bytes > args.batch_byte_limit and batch:
            flush()
            candidate_payload_bytes = len(entry)
            candidate_body_bytes = (
                len(BATCH_PREFIX) + candidate_payload_bytes + len(BATCH_SUFFIX)
            )
        if candidate_body_bytes > args.batch_byte_limit:
            raise ValueError("one clause exceeds the configured request-size cap")
        batch.append(entry)
        batch_payload_bytes = candidate_payload_bytes
        batch_max_var = max(batch_max_var, clause_max)
    if parsed != declared_clauses:
        raise AssertionError("DIMACS parser did not enforce its declared clause count")
    flush()
    if admitted != declared_clauses:
        raise AssertionError("PIQD upload stopped before the declared clause count")

    final = request_json(
        args.base_url,
        "GET",
        session_path,
        timeout_s=args.timeout_seconds,
    )
    if (
        final.get("clauses") != declared_clauses
        or final.get("max_var") != observed_max_var
    ):
        raise ValueError("PIQD final session dimensions disagree with the DIMACS")
    print(
        json.dumps(
            {
                "status": "PASS",
                "session_id": args.session_id,
                "cnf": str(cnf),
                "cnf_sha256": actual_sha,
                "variables": variables,
                "clauses": declared_clauses,
                "appended_clauses": appended,
                "requests": requests,
                "batch_byte_limit": args.batch_byte_limit,
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
