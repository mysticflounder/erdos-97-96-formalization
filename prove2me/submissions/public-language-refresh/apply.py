"""Apply the mission's public-language metadata refresh idempotently."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(REPO))

from prove2me.tools.prove2me_submit import (
    Client,
    SubmissionError,
    _atomic_json,
    _load_api_key,
    _milestone_rows,
)

HERE = Path(__file__).resolve().parent
PATCHES_PATH = HERE / "patches.json"
RECEIPT_PATH = HERE / "receipt.json"
REASON = "Refresh public mathematical descriptions and recorded completion status."


def _load() -> tuple[dict[str, Any], str, str]:
    raw = PATCHES_PATH.read_bytes()
    plan = json.loads(raw)
    if plan.get("schema") != "prove2me-public-language-refresh/v1":
        raise SubmissionError("unexpected public-language refresh schema")
    description_path = (HERE / plan["mission_description"]).resolve()
    description = description_path.read_text(encoding="utf-8")
    if not description.strip():
        raise SubmissionError("mission description is empty")
    digest = hashlib.sha256(raw + b"\0" + description.encode()).hexdigest()
    for section in ("milestones", "theorems"):
        rows = plan.get(section)
        if not isinstance(rows, list) or any(not isinstance(row, dict) for row in rows):
            raise SubmissionError(f"{section} must be a list of objects")
        ids = [row.get("id") for row in rows]
        if any(not isinstance(value, str) or not value for value in ids):
            raise SubmissionError(f"{section} contains an invalid id")
        if len(ids) != len(set(ids)):
            raise SubmissionError(f"{section} contains duplicate ids")
    return plan, description, digest


def _mission_rows(client: Client) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    offset = 0
    while True:
        response = client.request(
            "GET", "/missions", query={"limit": "100", "offset": str(offset)}
        )
        page = response.get("missions", []) if isinstance(response, dict) else []
        pagination = response.get("pagination", {}) if isinstance(response, dict) else {}
        if not isinstance(page, list) or any(not isinstance(row, dict) for row in page):
            raise SubmissionError("invalid mission list response")
        rows.extend(page)
        total = pagination.get("total", len(rows))
        if not isinstance(total, int) or total < len(rows):
            raise SubmissionError("invalid mission pagination response")
        if len(rows) >= total:
            return rows
        if not page:
            raise SubmissionError("mission pagination stopped before total")
        offset += len(page)


def _theorem_name(row: dict[str, Any]) -> str | None:
    theorem = row.get("theorem")
    return theorem.get("theorem_name") if isinstance(theorem, dict) else None


def _unwrap_theorem(response: Any) -> dict[str, Any]:
    if not isinstance(response, dict):
        raise SubmissionError("invalid theorem response")
    nested = response.get("theorem")
    return nested if isinstance(nested, dict) else response


def _theorem_id(row: dict[str, Any]) -> str | None:
    value = row.get("theorem_id") or row.get("id")
    return value if isinstance(value, str) else None


def validate() -> dict[str, Any]:
    plan, _description, digest = _load()
    return {
        "schema": plan["schema"],
        "status": "VALIDATED",
        "digest": digest,
        "mission": plan["mission_id"],
        "milestones": len(plan["milestones"]),
        "theorems": len(plan["theorems"]),
    }


def apply() -> dict[str, Any]:
    plan, description, digest = _load()
    credentials = Path(plan["credentials"]).expanduser()
    client = Client(plan["host"], plan["api_version"], _load_api_key(credentials))
    receipt: dict[str, Any] = {
        "schema": "prove2me-public-language-refresh-receipt/v1",
        "digest": digest,
        "mission": {},
        "milestones": {},
        "theorems": {},
    }

    mission_id = plan["mission_id"]
    matches = [row for row in _mission_rows(client) if row.get("id") == mission_id]
    if len(matches) != 1:
        raise SubmissionError("mission id did not resolve uniquely")
    mission = matches[0]
    changed = mission.get("description") != description
    if changed:
        mission = client.json_request(
            "PATCH", f"/missions/{mission_id}", {"description": description}
        )
    if not isinstance(mission, dict) or mission.get("description") != description:
        raise SubmissionError("mission description readback mismatch")
    receipt["mission"] = {"id": mission_id, "changed": changed, "status": "VERIFIED"}
    _atomic_json(RECEIPT_PATH, receipt)

    live_milestones = {row.get("id"): row for row in _milestone_rows(client, mission_id)}
    for desired in plan["milestones"]:
        milestone_id = desired["id"]
        remote = live_milestones.get(milestone_id)
        if remote is None or _theorem_name(remote) != desired["theorem_name"]:
            raise SubmissionError(f"milestone identity mismatch: {milestone_id}")
        changed = (
            remote.get("title") != desired["title"]
            or remote.get("milestone_description") != desired["milestone_description"]
        )
        if changed:
            remote = client.json_request(
                "PATCH",
                f"/milestones/{milestone_id}",
                {
                    "title": desired["title"],
                    "milestone_description": desired["milestone_description"],
                    "reason": REASON,
                },
            )
        if (
            not isinstance(remote, dict)
            or remote.get("id") != milestone_id
            or remote.get("title") != desired["title"]
            or remote.get("milestone_description") != desired["milestone_description"]
            or _theorem_name(remote) != desired["theorem_name"]
        ):
            raise SubmissionError(f"milestone readback mismatch: {milestone_id}")
        receipt["milestones"][milestone_id] = {
            "changed": changed,
            "status": "VERIFIED",
            "title": desired["title"],
        }
        _atomic_json(RECEIPT_PATH, receipt)

    for desired in plan["theorems"]:
        theorem_id = desired["id"]
        remote = _unwrap_theorem(client.request("GET", f"/theorems/{theorem_id}"))
        if (
            _theorem_id(remote) != theorem_id
            or remote.get("theorem_name") != desired["theorem_name"]
        ):
            raise SubmissionError(f"theorem identity mismatch: {theorem_id}")
        changed = remote.get("natural_language_statement") != desired["natural_language_statement"]
        if changed:
            remote = _unwrap_theorem(
                client.json_request(
                    "PATCH",
                    f"/theorems/{theorem_id}",
                    {
                        "natural_language_statement": desired["natural_language_statement"],
                        "reason": REASON,
                    },
                )
            )
        if (
            _theorem_id(remote) != theorem_id
            or remote.get("theorem_name") != desired["theorem_name"]
            or remote.get("natural_language_statement")
            != desired["natural_language_statement"]
        ):
            raise SubmissionError(f"theorem readback mismatch: {theorem_id}")
        receipt["theorems"][theorem_id] = {
            "changed": changed,
            "status": "VERIFIED",
            "theorem_name": desired["theorem_name"],
        }
        _atomic_json(RECEIPT_PATH, receipt)

    receipt["status"] = "VERIFIED"
    _atomic_json(RECEIPT_PATH, receipt)
    return receipt


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("command", choices=("validate", "apply"))
    args = parser.parse_args()
    result = validate() if args.command == "validate" else apply()
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
