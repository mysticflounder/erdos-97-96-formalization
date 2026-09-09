"""Validate and publish the Problem 97 counterexample milestone."""

from __future__ import annotations

import argparse
import hashlib
import json
import runpy
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parent
PAYLOAD_PATH = ROOT / "payload.json"
THEOREM_PATH = ROOT / "Theorems/Thm_Erdos9796Mission_problem97_counterexample_exists.lean"
EXPLANATION_PATH = ROOT / "explanation.md"
RECEIPT_PATH = ROOT / "receipt.json"
VALIDATION_PATH = ROOT / "validation.json"
CLIENT_MODULE = ROOT.parent / "counting-transfer/upload.py"


class PacketError(RuntimeError):
    pass


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path: Path, value: Any) -> None:
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_text(
        json.dumps(value, indent=2, ensure_ascii=False, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    temporary.replace(path)


def load_packet() -> dict[str, Any]:
    payload = json.loads(PAYLOAD_PATH.read_text(encoding="utf-8"))
    if payload.get("schema") != "prove2me-counterexample-goal/v1":
        raise PacketError("unexpected payload schema")
    if payload.get("host") != "https://prove2.me/api/v1":
        raise PacketError("unexpected API host")
    if payload.get("platform_version") != "0.9.8":
        raise PacketError("unexpected platform version")
    description_path = (ROOT / payload.get("mission_description_path", "")).resolve()
    expected_description_path = (ROOT.parents[1] / "mission-description.md").resolve()
    if description_path != expected_description_path or not description_path.is_file():
        raise PacketError("invalid mission description path")
    theorem = payload.get("theorem")
    milestone = payload.get("milestone")
    if not isinstance(theorem, dict) or not isinstance(milestone, dict):
        raise PacketError("missing theorem or milestone payload")
    expected = theorem["preamble"] + "\n\n" + theorem["formal_statement"] + "\n"
    if THEOREM_PATH.read_text(encoding="utf-8") != expected:
        raise PacketError("theorem file differs from payload")
    if theorem["formal_statement"].count("by sorry") != 1:
        raise PacketError("target must contain exactly one statement placeholder")
    if "at least four other points" not in milestone["milestone_description"]:
        raise PacketError("milestone description lost the counterexample semantics")
    if "disprove" not in EXPLANATION_PATH.read_text(encoding="utf-8"):
        raise PacketError("explanation must describe the negative-resolution route")
    return payload


def local_validation(payload: dict[str, Any]) -> dict[str, Any]:
    result = {
        "schema": "prove2me-counterexample-goal-validation/v1",
        "status": "STATEMENT_PACKET_VALIDATED",
        "theorem_name": payload["theorem"]["theorem_name"],
        "digests": {
            "payload.json": digest(PAYLOAD_PATH),
            str(THEOREM_PATH.relative_to(ROOT)): digest(THEOREM_PATH),
            "explanation.md": digest(EXPLANATION_PATH),
            payload["mission_description_path"]: digest(
                ROOT / payload["mission_description_path"]
            ),
        },
    }
    write_json(VALIDATION_PATH, result)
    return result


def execute(payload: dict[str, Any], poll_interval: float, poll_timeout: float) -> dict[str, Any]:
    module = runpy.run_path(str(CLIENT_MODULE))
    client = module["Client"](poll_interval, poll_timeout)
    previous_receipt = (
        json.loads(RECEIPT_PATH.read_text(encoding="utf-8"))
        if RECEIPT_PATH.is_file()
        else {}
    )
    theorem_payload = payload["theorem"]
    name = theorem_payload["theorem_name"]
    remote = client.lookup_exact(name, definition=False)
    publish_job: dict[str, Any] | None = None
    if remote is None:
        response = client.json_request("POST", "/submit-problem", {"problems": [theorem_payload]})
        jobs = response.get("jobs", []) if isinstance(response, dict) else []
        if len(jobs) != 1 or not jobs[0].get("job_id"):
            raise PacketError("submit-problem returned no unique publish job")
        publish_job = client.poll_job(jobs[0]["job_id"])
        if publish_job.get("status") != "PUBLISHED":
            raise PacketError(f"publish job ended as {publish_job.get('status')}")
        remote = client.lookup_exact(name, definition=False)
    if not isinstance(remote, dict):
        raise PacketError("published theorem could not be resolved")
    theorem_id = remote.get("theorem_id") or remote.get("id")
    if not isinstance(theorem_id, str):
        raise PacketError("published theorem has no theorem id")
    if remote.get("formal_statement") != theorem_payload["formal_statement"]:
        raise PacketError("remote theorem statement differs from the packet")

    mission_id = payload["mission_id"]
    response = client.request("GET", f"/missions/{mission_id}/milestones")
    milestones = response.get("milestones", response) if isinstance(response, dict) else response
    if not isinstance(milestones, list):
        raise PacketError("invalid milestone list response")
    matches = [
        row for row in milestones
        if isinstance(row, dict)
        and isinstance(row.get("theorem"), dict)
        and (row["theorem"].get("id") or row["theorem"].get("theorem_id")) == theorem_id
    ]
    if len(matches) > 1:
        raise PacketError("counterexample theorem is linked more than once")
    if matches:
        milestone = matches[0]
    else:
        milestone_body = dict(payload["milestone"], theorem_id=theorem_id)
        milestone = client.json_request(
            "POST", f"/missions/{mission_id}/milestones", milestone_body
        )

    mission_description = (ROOT / payload["mission_description_path"]).read_text(
        encoding="utf-8"
    )
    mission: dict[str, Any] | None = None
    offset = 0
    while mission is None:
        page = client.request(
            "GET", "/missions", query={"limit": "100", "offset": str(offset)}
        )
        rows = page.get("missions", []) if isinstance(page, dict) else []
        mission = next(
            (row for row in rows if isinstance(row, dict) and row.get("id") == mission_id),
            None,
        )
        offset += len(rows)
        if mission is not None or not rows or offset >= int(page.get("total", offset)):
            break
    if mission is None:
        raise PacketError("live mission could not be resolved")
    if mission.get("description") != mission_description:
        mission = client.json_request(
            "PATCH", f"/missions/{mission_id}", {"description": mission_description}
        )

    receipt = {
        "schema": "prove2me-counterexample-goal-receipt/v1",
        "mission_id": mission_id,
        "theorem_id": theorem_id,
        "theorem_name": name,
        "theorem_status": remote.get("status"),
        "publish_job": publish_job or previous_receipt.get("publish_job"),
        "milestone": milestone,
        "mission_description": {
            "patched": mission.get("description") == mission_description,
            "sha256": hashlib.sha256(mission_description.encode()).hexdigest(),
        },
        "digests": json.loads(VALIDATION_PATH.read_text(encoding="utf-8"))["digests"],
    }
    write_json(RECEIPT_PATH, receipt)
    return receipt


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--execute", action="store_true")
    parser.add_argument("--poll-interval", type=float, default=5.0)
    parser.add_argument("--poll-timeout", type=float, default=600.0)
    args = parser.parse_args()
    payload = load_packet()
    validation = local_validation(payload)
    if args.execute:
        receipt = execute(payload, args.poll_interval, args.poll_timeout)
        print(json.dumps({
            "status": "PUBLISHED_AND_LINKED",
            "theorem_id": receipt["theorem_id"],
            "milestone_id": receipt["milestone"].get("id"),
        }))
    else:
        print(json.dumps(validation))


if __name__ == "__main__":
    main()
