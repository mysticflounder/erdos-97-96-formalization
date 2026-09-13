#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Publish and read back the owner-authorized mission closure, after disproofs."""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

PACKET = Path(__file__).resolve().parent
ROOT = PACKET.parents[1]
sys.path.insert(0, str(ROOT))
from tools.prove2me_submit import Client, SubmissionError, _atomic_json, _canonical_json

MISSION = "1061a384-cdea-43b4-adb5-273627ea45a0"
TARGETS = {
    "problem97": "4ec1c9bf-88ad-4632-aa55-375d24e19335",
    "problem96": "8ade9b04-8ed3-4b0a-a948-9a5df9f1c637",
    "combined": "a6bf5110-b91e-4a2c-9d03-8b51a8a9e6ad",
}
# Open project tasks: retirement preserves their statements, status, and imports.
RETIRE = {
    "16aca7e9-8752-4631-9f2f-d2958d38a571": "Erdos9796Mission.critical_cover_card_le_nine_of_tight_center",
    "c58343d6-7975-4a8c-8859-6a1043d5a09c": "Erdos9796Mission.critical_radius_cover_card_le_nine",
    "f03cf49e-3e3e-4cea-80fe-666a52629f3f": "Erdos9796Mission.minimal_counterexample_removable",
    "bbaf935e-32e1-4064-afaa-418647568fa9": "Erdos9796Mission.finite_ten_exclusion",
    "0c2105c8-40c2-4b5a-af9a-61f6237bd4b6": "Erdos9796Mission.finite_eleven_exclusion",
    "4d865c62-6c29-449b-b5b3-ee7bae2e60a6": "Erdos9796Mission.problem97_counterexample_exists",
    "6d8a5361-7510-4d18-afa3-8885f93a9bbd": "Erdos9796Mission.problem96_counterexample",
    "ae7c5b69-b078-4138-80cc-2d7cd5e8df61": "Erdos9796Mission.problem96_superlinear_family",
}
NOTICE = (
    "Closed by the mission owner on 2026-09-13 after the Kruer–Kohlmeyer–Price "
    "negative resolution of Erdős 96 and 97. No further work is requested on this "
    "historical project task. This retirement is administrative and does not "
    "assert that this individual lemma is false. The resolution is recorded on "
    "Erdos9796Mission.problem97, Erdos9796Mission.problem96, and "
    "Erdos9796Mission.combined."
)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=["inspect", "close"])
    args = parser.parse_args()
    credentials = json.loads(Path("~/prove2me_workspace/credentials.json").expanduser().read_text())
    client = Client("https://prove2.me/api/v1", "0.10.3", credentials["api_key"])
    receipt_path = PACKET / "closure-receipt.json"
    receipt = json.loads(receipt_path.read_text()) if receipt_path.exists() else {
        "schema": "prove2me-negative-closure/v1", "mission_id": MISSION,
        "upstream_commit": "0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2", "operations": {},
    }
    targets = {key: client.request("GET", f"/theorems/{value}") for key, value in TARGETS.items()}
    receipt["targets"] = targets
    _atomic_json(receipt_path, receipt)
    print("Target states:", {key: value.get("status") for key, value in targets.items()}, flush=True)
    if args.command == "inspect":
        return
    if any(row.get("status") != "Disproved" for row in targets.values()):
        raise SystemExit("Refusing verified closure until all three exact targets read Disproved")

    def mutate(key: str, method: str, path: str, payload: dict) -> dict:
        body = _canonical_json(payload)
        digest = hashlib.sha256(body).hexdigest()
        old = receipt["operations"].get(key, {})
        if old.get("state") == "RECORDED" and old.get("sha256") == digest:
            return old["response"]
        if method == "POST" and old.get("state") == "INTENT":
            raise RuntimeError("Uncertain comment POST: reconcile remote comments before retry")
        receipt["operations"][key] = {"state": "INTENT", "method": method, "path": path,
                                      "sha256": digest, "payload": payload}
        _atomic_json(receipt_path, receipt)
        try:
            response = client.request(method, path, body=body)
        except SubmissionError as error:
            rejected = any(f"HTTP {code}" in str(error) for code in (400, 401, 403, 404, 409, 422))
            receipt["operations"][key].update(
                state="REJECTED" if rejected else "INTENT", error=str(error)
            )
            _atomic_json(receipt_path, receipt)
            raise
        receipt["operations"][key].update(state="RECORDED", response=response)
        _atomic_json(receipt_path, receipt)
        return response

    description = (ROOT / "mission-description.md").read_text().strip()
    mission = mutate("mission-description", "PATCH", f"/missions/{MISSION}", {"description": description})
    if mission.get("description") != description:
        raise RuntimeError("Mission description readback mismatch")
    receipt["retirements"] = receipt.get("retirements", {})
    for theorem_id, expected_name in RETIRE.items():
        row = client.request("GET", f"/theorems/{theorem_id}")
        if row.get("theorem_name") != expected_name:
            raise RuntimeError("Retirement theorem identity mismatch")
        if row.get("status") != "Open":
            receipt["retirements"][theorem_id] = {"action": "preserved", "status": row.get("status")}
            continue
        text = row.get("natural_language_statement") or ""
        if NOTICE not in text:
            text += "\n\n" + NOTICE
        note_in_theorem = True
        try:
            mutate(f"retire:{theorem_id}", "PATCH", f"/theorems/{theorem_id}",
                   {"deprecated": True, "natural_language_statement": text})
        except SubmissionError as error:
            if "HTTP 403" not in str(error):
                raise
            # Captains can retire mission nodes but cannot edit another author's prose.
            # Their explanation is retained in the mission notice/discussion instead.
            note_in_theorem = False
            mutate(f"retire-flag:{theorem_id}", "PATCH", f"/theorems/{theorem_id}",
                   {"deprecated": True})
        fresh = client.request("GET", f"/theorems/{theorem_id}")
        if not fresh.get("deprecated_at") or (note_in_theorem and NOTICE not in (fresh.get("natural_language_statement") or "")):
            raise RuntimeError("Retirement readback mismatch")
        receipt["retirements"][theorem_id] = {
            "action": "deprecated", "readback": fresh,
            "note_location": "theorem and mission" if note_in_theorem else "mission notice and discussion",
        }
        _atomic_json(receipt_path, receipt)

    milestones = client.request("GET", f"/missions/{MISSION}/milestones", query={"limit": "100"})
    if milestones.get("pagination", {}).get("total", 0) > 100:
        raise RuntimeError("Milestone count exceeds reviewed scope")
    expected_milestones = {}
    for row in milestones.get("milestones", []):
        target = (row.get("theorem") or {}).get("id")
        if target not in RETIRE:
            continue
        text = row.get("milestone_description") or ""
        if NOTICE not in text:
            text = NOTICE + "\n\nHistorical task:\n\n" + text
        mutate(f"milestone:{row['id']}", "PATCH", f"/milestones/{row['id']}",
               {"milestone_description": text, "reason": "Owner-authorized closure after negative resolution"})
        expected_milestones[row["id"]] = text
    fresh_milestones = client.request("GET", f"/missions/{MISSION}/milestones", query={"limit": "100"})
    actual_milestones = {row["id"]: row.get("milestone_description")
                         for row in fresh_milestones.get("milestones", [])}
    if any(actual_milestones.get(key) != value for key, value in expected_milestones.items()):
        raise RuntimeError("Milestone closure notice readback mismatch")
    receipt["milestones_readback"] = fresh_milestones
    _atomic_json(receipt_path, receipt)

    body = (
        "**Mission closed — negative resolution, 13 September 2026.**\n\n"
        "The counterexample and Lean formalization are by **Liam Kruer, Jensen Kohlmeyer, and Liam Price**, "
        "[Unit distances in convex polygons](https://github.com/Leeham06972452/erdos-96-97/blob/"
        "0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2/96-97.pdf). They construct strictly convex point sets "
        "with superlinear unit-distance counts and arbitrarily large minimum unit-distance degree. "
        "Adam McKenna prepared the adapters; all credit for the construction belongs to the authors.\n\n"
        + " · ".join(f"[{name}](p2m:theorem/{theorem_id})" for name, theorem_id in TARGETS.items())
        + " are now **Disproved** by server-accepted exact-statement submissions.\n\n"
        "Please stop attempts to prove the affirmative conjectures and new solver/swarm work for this mission. "
        "Open historical project tasks have been retired; existing proved lemmas remain available. "
        "Reopening requires the owner's explicit direction."
    )
    comments = client.request("GET", f"/missions/{MISSION}/comments", query={"limit": "100"})
    matches = [row for row in comments.get("comments", []) if row.get("body_md") == body]
    if matches:
        receipt["closure_comment"] = matches[0]
    else:
        receipt["closure_comment"] = mutate("closure-comment", "POST", f"/missions/{MISSION}/comments",
                                             {"body_md": body, "tags": ["reference"]})
    receipt["status"] = "CLOSED_NEGATIVE_RESOLUTION"
    _atomic_json(receipt_path, receipt)
    print("Closure recorded; retired tasks:", len(receipt["retirements"]), flush=True)


if __name__ == "__main__":
    main()
