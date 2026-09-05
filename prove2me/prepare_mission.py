#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Prepare and upload an editable Prove2Me mission proposal, never submit it."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import time
import urllib.error
import urllib.request
from urllib.parse import quote

ROOT = Path(__file__).resolve().parent
BASE_HEAD = "757d852766f377f7c1a0ffeeef6d3526bc0cb7a4"
SOURCE = f"https://github.com/mysticflounder/erdos-97-96-formalization/blob/{BASE_HEAD}/"
ENV = "0df444a360eaa60ab8c11dca51a86af692955474"
API = "https://prove2.me/api/v1"
MARKER = "-- PROVE2ME_FORMAL_STATEMENT\n"
TAGS = ["erdos-97-96", "discrete-geometry", "convex-position", "unit-distances"]


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")


def theorem_metadata() -> list[dict]:
    return [
        dict(name="danzer_nine", title="Danzer's nine-point counterexample to the three-neighbour claim",
             statement="∃ A : Finset Plane, A.card = 9 ∧ ConvexIndep (A : Set Plane) ∧ HasNEquidistantProperty 3 A",
             prose="There is a set $A$ of exactly nine distinct points in the Euclidean plane, each outside the convex hull of the other eight, such that for every $p\\in A$ there is a positive radius $r_p$ with at least three points of $A$ at distance $r_p$ from $p$. The radius may depend on the vertex.\n\n$$|A|=9,\\qquad \\forall p\\in A\\;\\exists r_p>0:\\;|\\{q\\in A:\\|p-q\\|=r_p\\}|\\ge3.$$\n\nThis known construction explains why the mission asks about four equidistant neighbours rather than three. It is a literature formalization milestone, not a claim that Problem 97 is settled.",
             source="P. Erdős, Some Combinatorial and Metric Problems in Geometry (1987), pp. 175–176, Danzer's construction: https://www.renyi.hu/~p_erdos/1987-27.pdf",
             milestone="Formalize Danzer's convex nonagon with three equidistant neighbours at every vertex. The radius is allowed to vary with the vertex; this rules out the earlier three-neighbour conjecture."),
        dict(name="counterexample_card_ge_nine", title="Counting obstruction: a counterexample has at least nine vertices",
             statement="∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) → HasNEquidistantProperty 4 A → 9 ≤ A.card",
             prose="Let $A$ be a nonempty finite set of points in strictly convex position in the Euclidean plane. Suppose every vertex has at least four other vertices at one positive distance, which may depend on that vertex. Then\n\n$$|A|\\ge9.$$\n\nThe nonempty hypothesis excludes the empty set, whose all-vertices condition is vacuous. The repository supplies an isosceles-counting proof of this lower bound; transferring that proof to the platform is part of this milestone.",
             source=SOURCE+"lean/Erdos9796Proof/P97/Counting.lean#L95",
             milestone="Transfer the repository's counting obstruction: every nonempty convex four-equidistant counterexample has at least nine vertices."),
        dict(name="finite_nine_exclusion", title="Base case: exclude a nine-vertex counterexample",
             statement="∀ A : Finset Plane, A.card = 9 → ConvexIndep (A : Set Plane) → ¬ HasNEquidistantProperty 4 A",
             prose="For every set $A$ of exactly nine points in strictly convex position in the Euclidean plane, some vertex has no four other vertices at a common positive distance.\n\n$$|A|=9\\quad\\Longrightarrow\\quad\\exists p\\in A\\;\\forall r>0:\\;|\\{q\\in A:\\|p-q\\|=r\\}|\\le3.$$\n\nThis is the exact-cardinality base case used by the repository's descent strategy. Its existing proof is separate from the unresolved large-cardinality descent.",
             source=SOURCE+"lean/Erdos9796Proof/P97/N9Endpoint/Closure.lean#L56",
             milestone="Transfer the repository's exact nine-point exclusion. Together with the counting bound, this isolates the large-cardinality descent as the remaining part of this strategy."),
        dict(name="minimal_counterexample_removable", title="Descent: a minimal counterexample with more than nine vertices has a removable vertex",
             statement="∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) → HasNEquidistantProperty 4 A → 9 < A.card → (∀ B : Finset Plane, B.card < A.card → B.Nonempty → ConvexIndep (B : Set Plane) → HasNEquidistantProperty 4 B → False) → ∃ x ∈ A, HasNEquidistantProperty 4 (A.erase x)",
             prose="Let $A$ be a nonempty finite strictly convex point set with more than nine vertices, and assume every vertex has four other vertices at a common positive distance. Assume in addition that no smaller nonempty strictly convex point set anywhere in the plane has this four-neighbour property. Then some vertex $x\\in A$ can be removed while preserving that property:\n\n$$\\exists x\\in A:\\;\\forall p\\in A\\setminus\\{x\\}\\;\\exists r_p>0:\\;|\\{q\\in A\\setminus\\{x\\}:\\|p-q\\|=r_p\\}|\\ge4.$$\n\nThe smaller-set assumption quantifies over all point sets, not only subsets of $A$. This is the repository's open minimal-counterexample descent obligation. Convex independence survives deletion and the remaining set is nonempty, so such a deletion contradicts minimality.",
             source=SOURCE+"lean/Erdos9796Proof/P97/RemovableVertexAxiom/Base.lean#L53; "+SOURCE+"lean/Erdos9796Proof/P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean#L50",
             milestone="Close the repository's minimal-counterexample descent statement, retaining its global minimality hypothesis. Produce a vertex whose deletion preserves four equidistant neighbours at every surviving vertex."),
        dict(name="problem97", title="Erdős Problem 97: a vertex without four equidistant neighbours",
             prose="For every nonempty finite set $A$ of points in strictly convex position in the Euclidean plane, there is a vertex $p\\in A$ such that every circle of positive radius centred at $p$ contains at most three points of $A$.\n\n$$\\forall A\\ne\\varnothing\\;\\exists p\\in A\\;\\forall r>0:\\;|\\{q\\in A:\\|p-q\\|=r\\}|\\le3.$$\n\nThe set is finite and convex-independent: each vertex lies outside the convex hull of all the others. No lower bound of three on the cardinality is imposed; singletons and two-point sets are included. This is the affirmative target of Problem 97, which remains open in the repository.",
             source=SOURCE+"lean/Erdos9796Proof/P97/UpstreamBridge.lean#L30; https://www.erdosproblems.com/97",
             milestone="Resolve the affirmative Problem 97 statement for every finite nonempty convex-independent point set, without a cardinality cutoff or a preselected common radius."),
        dict(name="linear_bound_of_problem97", title="The bridge: Problem 97 implies the 3n bound and Problem 96",
             statement="Problem97 → (∀ A : Finset Plane, ConvexIndep (A : Set Plane) → unitDistancePairsCount A ≤ 3 * A.card) ∧ Problem96",
             prose="Assume the affirmative statement of Erdős Problem 97 for every nonempty finite convex-independent point set in the Euclidean plane. Then every finite convex-independent set $A$, including the empty set, satisfies\n\n$$u(A)\\le3|A|,$$\n\nand the extremal function satisfies\n\n$$U_c(n)=O(n).$$\n\nHere $u(A)$ counts unordered pairs of distinct points at distance one, each pair once, and $U_c(n)$ is the supremum of these counts over convex-independent n-point sets. Both conclusions are required. This is a conditional theorem, with Problem 97 as an explicit hypothesis. The repository records the conditional peeling proof and the subsequent supremum-to-Big-O step; transferring both makes the complete link between the two mission targets reusable.",
             source=SOURCE+"lean/Erdos9796Proof/P96/EuclideanPeeling.lean; "+SOURCE+"lean/Erdos9796Proof/P96/UpstreamBridge.lean",
             milestone="Transfer the conditional peeling argument from Problem 97 to the uniform bound of three times the number of vertices, then lift it to the supremum and Big-O statement of Problem 96. Count unordered unit-distance pairs once; keep Problem 97 as an explicit hypothesis."),
        dict(name="problem96", title="Erdős Problem 96: linearly many unit distances in convex position",
             prose="For each natural number $n$, let $U_c(n)$ be the supremum of the numbers of unordered unit-distance pairs determined by convex-independent sets of $n$ points in the Euclidean plane. Then\n\n$$U_c(n)=O(n)\\qquad(n\\to\\infty).$$\n\nThus there are a constant $C$ and a threshold after which $U_c(n)\\le Cn$. Pairs are unordered and counted once. The set of counts is bounded by the number of two-element subsets. The formal target uses the natural-number supremum, real casts, and Big-O at the filter of natural numbers tending to infinity. It does not require the stronger explicit constant three. The mission's Problem 97 route would supply that constant; the unconditional Problem 96 target is still open in the repository.",
             source=SOURCE+"lean/Erdos9796Proof/P96/UpstreamBridge.lean#L96; https://www.erdosproblems.com/96",
             milestone="Resolve the canonical asymptotic Problem 96 statement. The planned route lifts the conditional per-set bound of 3n to the supremum defining the maximum unit-distance count."),
        dict(name="combined", title="Erdős Problems 97 and 96: the combined convex-distance mission",
             prose="Establish both affirmative statements in one package: every nonempty finite convex-independent planar point set has a vertex with no four other vertices at a common positive distance, and the maximum number of unordered unit-distance pairs among convex-independent $n$-point sets is $O(n)$.\n\n$$\\text{Problem 97}\\;\\land\\;\\text{Problem 96}.$$\n\nThe two targets are linked by deletion: Problem 97 supplies a vertex of unit degree at most three in every nonempty remaining subset, so counting each edge when its first endpoint is removed gives at most $3n$ unordered unit-distance pairs. No implication from Problem 96 back to Problem 97 is asserted. Both statements are open targets, not assumptions hidden in the definitions.",
             source=SOURCE+"README.md; https://www.erdosproblems.com/97; https://www.erdosproblems.com/96"),
    ]


def prepare() -> None:
    items = [dict(kind="definition", definition_name="Erdos9796Mission",
                  definition_title="Convex point sets, equidistant neighbours, and unit-distance counts",
                  definition=(ROOT/"Definitions/Def_Erdos9796Mission.lean").read_text(),
                  natural_language_statement="The ambient space is the Euclidean plane. A set is convex-independent when each point is outside the convex hull of the remaining points. A vertex has at least k equidistant neighbours when a positive-radius circle centred there contains at least k members of the set; the radius may vary with the vertex. Unit-distance counts use unordered pairs at distance one, each counted once. For each n, the extremal count is the natural-number supremum over all convex-independent n-point sets. The two proposition names expand to the affirmative Problem 97 statement and Problem 96's asymptotic O(n) statement; neither is assumed true.",
                  source=SOURCE+"lean/Erdos9796Proof/P97/Foundation.lean; "+SOURCE+"lean/Erdos9796Proof/P96/UpstreamBridge.lean",
                  tags=TAGS)]
    for meta in theorem_metadata():
        name = meta["name"]
        path = ROOT/f"Theorems/Thm_Erdos9796Mission_{name}.lean"
        if "statement" in meta:
            text = ("/- Statement-only mission draft: SKETCH — NOT PROMOTABLE.\n"
                    "Source and precise status are recorded in items.json. -/\n"
                    "import Definitions.Def_Erdos9796Mission\n"
                    "open Erdos9796Mission\n\n" + MARKER +
                    f"theorem Erdos9796Mission.{name} :\n    {meta['statement']} := by sorry\n")
            path.write_text(text)
        text = path.read_text()
        assert text.count(MARKER) == 1, path
        preamble, statement = text.split(MARKER)
        assert statement.strip().endswith(":= by sorry"), path
        item = dict(kind="theorem", theorem_name=f"Erdos9796Mission.{name}",
                    theorem_title=meta["title"], formal_statement=statement.strip(),
                    preamble=preamble.rstrip(), natural_language_statement=meta["prose"],
                    source=meta["source"], tags=TAGS)
        if "milestone" in meta:
            item["_milestone"] = dict(milestone_title=meta["title"], milestone_description=meta["milestone"])
        items.append(item)
    write_json(ROOT/"items.json", items)
    write_json(ROOT/"proposal.json", dict(
        name="Erdős Problems 97 and 96: Convex Point Sets and Unit Distances",
        description=(ROOT/"mission-description.md").read_text(), mission_type="OpenProblem",
        field_ids=["eacb2bf6-9021-46c9-87ac-f30638efffb3", "55eec41b-ff24-45ad-96b6-49d7a6869286"],
        visibility="public", env=ENV))
    print(f"Prepared {len(items)} items and {sum('_milestone' in i for i in items)} milestones.")


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, *args, **kwargs):
        return None


def upload(credentials: Path) -> None:
    validation = json.loads((ROOT/"validation.json").read_text())
    assert validation["status"] == "STATEMENTS_CHECKED_NOT_PROVED"
    for name, expected in validation["packet_digests"].items():
        assert digest((ROOT/name).read_bytes()) == expected, f"Validation stale: {name}"
    readbacks = json.loads((ROOT/"readbacks.json").read_text())
    items = json.loads((ROOT/"items.json").read_text())
    proposal = json.loads((ROOT/"proposal.json").read_text())
    auth = json.loads(credentials.read_text())
    opener = urllib.request.build_opener(NoRedirect)

    def request(method: str, path: str, body: dict | None = None):
        assert path.startswith("/") and not path.startswith("//")
        if path != "/agent/refresh" and auth.get("expires_at", 0) < time.time()+60:
            refresh()
        req = urllib.request.Request(API+path, method=method,
            data=None if body is None else json.dumps(body).encode(),
            headers={"Content-Type": "application/json", **(
                {"Authorization": "Bearer "+auth["access_token"]} if auth.get("access_token") else {})})
        try:
            with opener.open(req, timeout=60) as response:
                return json.load(response)
        except urllib.error.HTTPError as exc:
            detail = exc.read().decode(errors="replace")
            for secret in (auth.get("access_token"), auth.get("api_key")):
                if secret:
                    detail = detail.replace(secret, "[REDACTED]")
            raise RuntimeError(f"{method} {path}: HTTP {exc.code}: {detail[:1200]}") from None

    def refresh():
        updated = request("POST", "/agent/refresh", {"api_key": auth["api_key"]})
        assert updated.get("version") == "0.9.7", "Platform skill changed; update onboarding instructions before upload"
        assert updated.get("access_token"), "Refresh returned no token"
        auth.update(updated)
        fd = os.open(credentials, os.O_WRONLY | os.O_TRUNC | os.O_NOFOLLOW)
        os.fchmod(fd, 0o600)
        with os.fdopen(fd, "w") as handle:
            json.dump(auth, handle, indent=2)

    def item_name(item):
        return item.get("theorem_name") or item.get("definition_name")

    for item in items:
        name = item.get("theorem_name", item.get("definition_name"))
        rb = readbacks[name]
        code = item.get("definition") or item["preamble"]+"\n"+item["formal_statement"]
        assert rb["code_sha256"] == digest(code.encode()), f"Stale readback: {name}"
    refresh()
    receipt_path = ROOT/"mission-receipt.json"
    if receipt_path.exists():
        receipt = json.loads(receipt_path.read_text())
        remote = request("GET", "/mission-proposals/"+quote(receipt["proposal_id"], safe=""))
        assert remote["status"] == "Draft", "Proposal is no longer editable"
        request("PATCH", "/mission-proposals/"+quote(receipt["proposal_id"], safe=""), proposal)
    else:
        existing = request("GET", "/mission-proposals?limit=100")
        assert existing["total"] <= len(existing["proposals"]), "Proposal list is paginated; resolve the intended proposal before upload"
        matches = [p for p in existing["proposals"] if p["name"] == proposal["name"]]
        assert len(matches) <= 1
        if matches:
            remote = request("GET", "/mission-proposals/"+quote(matches[0]["id"], safe=""))
            assert remote["status"] == "Draft", "Matching proposal is not editable"
            assert remote["description"] == proposal["description"], "Matching proposal has different content; inspect before adopting"
            assert remote["mission_type"] == proposal["mission_type"] and remote["env"] == proposal["env"]
        else:
            remote = request("POST", "/mission-proposals", proposal)
        receipt = dict(proposal_id=remote["id"], status=remote["status"], items={},
                       review_url="https://prove2.me/my-missions/"+remote["id"], source_base_head=BASE_HEAD)
        write_json(receipt_path, receipt)
    path = "/mission-proposals/"+quote(receipt["proposal_id"], safe="")
    order = []
    for item in items:
        name = item.get("theorem_name", item.get("definition_name"))
        rb = readbacks[name]
        payload = {k:v for k,v in item.items() if not k.startswith("_")}
        payload.update(readback=rb["readback"], readback_model=rb["readback_model"])
        request("POST", path+"/items", payload)
        current = request("GET", path)
        matches = [i for i in current["items"] if item_name(i) == name]
        assert len(matches) == 1, f"Cannot uniquely resolve uploaded item: {name}"
        result = matches[0]
        receipt["items"][name] = result["id"]
        order.append(result["id"])
        write_json(receipt_path, receipt)
    request("PATCH", path, dict(main_item_id=receipt["items"]["Erdos9796Mission.combined"], item_order=order))
    for item in items:
        if "_milestone" in item:
            request("POST", path+"/milestones", dict(item_id=receipt["items"][item["theorem_name"]], **item["_milestone"]))
    final = request("GET", path)
    milestones = request("GET", path+"/milestones")
    milestone_rows = milestones["milestones"] if isinstance(milestones, dict) else milestones
    receipt.update(status=final["status"], main_item_id=final["main_item_id"],
                   item_order=final["item_order"], item_count=len(final["items"]),
                   milestone_count=len(milestone_rows),
                   packet_digests=validation["packet_digests"], readbacks_sha256=digest((ROOT/"readbacks.json").read_bytes()),
                   local_validation="STATEMENTS_CHECKED_NOT_PROVED", submitted=False)
    assert receipt["item_count"] == len(items)
    assert receipt["status"] == "Draft"
    assert final["main_item_id"] == receipt["items"]["Erdos9796Mission.combined"]
    assert final["item_order"] == order
    for key in ("name", "description", "mission_type", "visibility", "env"):
        assert final[key] == proposal[key], f"Proposal mismatch: {key}"
    assert {f["id"] for f in final["fields"]} == set(proposal["field_ids"])
    # Compare every mathematical upload byte and the independent read-back with the server.
    returned = {i["id"]: i for i in final["items"]}
    for item in items:
        name = item.get("theorem_name", item.get("definition_name"))
        actual = returned[receipt["items"][name]]
        for key in ("kind", "definition_name", "theorem_name", "definition_title", "theorem_title",
                    "definition", "preamble", "formal_statement", "source", "natural_language_statement", "tags"):
            if key in item:
                returned_key = {"definition_name": "theorem_name", "definition_title": "theorem_title"}.get(key, key)
                assert actual.get(returned_key) == item[key], f"Server mismatch: {name}.{key}"
        assert actual["readback"] == readbacks[name]["readback"]
        assert actual["readback_model"] == readbacks[name]["readback_model"]
    expected_milestones = [dict(item_id=receipt["items"][i["theorem_name"]], **i["_milestone"])
                           for i in items if "_milestone" in i]
    assert len(milestone_rows) == len(expected_milestones)
    for actual, expected in zip(milestone_rows, expected_milestones, strict=True):
        assert all(actual.get("title" if k == "milestone_title" else k) == v
                   for k,v in expected.items()), "Milestone content/order mismatch"
    receipt["server_content_verified"] = True
    write_json(receipt_path, receipt)
    print(json.dumps({k:receipt[k] for k in ("review_url", "status", "item_count", "milestone_count", "server_content_verified")}))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["prepare", "upload"])
    parser.add_argument("--credentials", type=Path, default=Path.home()/"prove2me_workspace/credentials.json")
    args = parser.parse_args()
    if args.action == "prepare":
        prepare()
    else:
        upload(args.credentials)
