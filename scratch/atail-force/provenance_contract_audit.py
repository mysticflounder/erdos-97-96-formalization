# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Audit the exact liveData helper delta from retained critical provenance.

This is a source-contract census, not a geometric model and not proof evidence.
It checks every named liveData helper against the stronger scratch packet in
``live_critical_provenance.lean`` and reports which facts become available at
the existing helper boundaries.
"""

from __future__ import annotations

import argparse
import json
import re
from dataclasses import asdict, dataclass
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[2]
LIVE_SOURCE = REPO_ROOT / "lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean"
PROVENANCE_SOURCE = REPO_ROOT / "scratch/atail-force/live_critical_provenance.lean"

HELPER_RE = re.compile(r"\btheorem (liveData_[A-Za-z0-9_]+_false)\b")
CENTER_RE = re.compile(r"\(hcenter_(p|q|t1|t2|t3|u|fresh)\s*:")
ROW_CENTER_RE = re.compile(r"\(h(q|t1|t2|t3|u)Row_center_p\s*:")
SOURCE_COLLISION_RE = re.compile(
    r"\(h(q|t1|t2|t3|u)_t20\s*:\s*(?!¬)\1\s*="
)


@dataclass(frozen=True)
class HelperAudit:
    name: str
    family: str
    textual_sorries: int
    center_case: str
    named_source_collision: str | None
    row_center_p: str | None
    has_unlinked_critical_system: bool
    has_center_comparison_map: bool
    has_l1_comparison_map: bool
    has_linked_provenance_packet: bool
    has_f2_no_qfree_field: bool
    current_maps_transfer_full_support: bool
    provenance_rederives_existing_transfer: bool
    provenance_adds_new_same_center_transfer: bool
    provenance_adds_f2_no_qfree: bool
    named_center_membership_target: bool
    current_contract_forces_two_off_dangerous: bool


def family_of(name: str) -> str:
    if name.startswith("liveData_Q_"):
        return "LIVE-Q"
    if name.startswith("liveData_T1_"):
        return "LIVE-T1"
    if name.startswith("liveData_T3_"):
        return "LIVE-T3"
    if name.startswith("liveData_C_"):
        return "LIVE-C"
    raise AssertionError(f"unclassified helper: {name}")


def extract_helper_blocks(source: str) -> list[tuple[str, str, str]]:
    matches = list(HELPER_RE.finditer(source))
    if not matches:
        raise AssertionError("no liveData helper theorems found")
    result: list[tuple[str, str, str]] = []
    for index, match in enumerate(matches):
        end = matches[index + 1].start() if index + 1 < len(matches) else source.find(
            "theorem u1_largeCap_routeB_tail_liveData_false", match.end()
        )
        if end < 0:
            raise AssertionError(f"could not find end of {match.group(1)}")
        block = source[match.start() : end]
        body_match = re.search(r"\)\s*:\s*False\s*:=", block)
        if body_match is None:
            raise AssertionError(f"could not find theorem body for {match.group(1)}")
        signature = block[: body_match.start()]
        result.append((match.group(1), signature, block))
    return result


def audit_helper(name: str, signature: str, block: str) -> HelperAudit:
    center_match = CENTER_RE.search(signature)
    if center_match is None:
        raise AssertionError(f"missing center split in {name}")
    row_center_match = ROW_CENTER_RE.search(signature)
    collision_match = SOURCE_COLLISION_RE.search(signature)
    has_center_map = "hf2Center_eq_rowAt_center" in signature
    has_l1_map = "hf2Selected_l1_eq_rowAt_l1" in signature
    source_collision = collision_match.group(1) if collision_match else None
    row_center_p = row_center_match.group(1) if row_center_match else None
    same_center = center_match.group(1) == "p" and row_center_p is not None
    current_transfer = (
        source_collision is not None and has_center_map and has_l1_map
    )
    named_center = center_match.group(1) in {"q", "t1", "t2", "t3", "u"}
    current_two_off_dangerous = (
        family_of(name) == "LIVE-C" and center_match.group(1) != "p"
    )
    return HelperAudit(
        name=name,
        family=family_of(name),
        textual_sorries=len(re.findall(r"\bsorry\b", block)),
        center_case=center_match.group(1),
        named_source_collision=source_collision,
        row_center_p=row_center_p,
        has_unlinked_critical_system=(
            "hcritical : Nonempty (CriticalShellSystem D.A)" in signature
        ),
        has_center_comparison_map=has_center_map,
        has_l1_comparison_map=has_l1_map,
        has_linked_provenance_packet="LiveCriticalRowProvenance" in signature,
        has_f2_no_qfree_field="f2Row_no_qfree" in signature,
        current_maps_transfer_full_support=current_transfer,
        provenance_rederives_existing_transfer=same_center and current_transfer,
        provenance_adds_new_same_center_transfer=same_center and not current_transfer,
        provenance_adds_f2_no_qfree=True,
        named_center_membership_target=named_center,
        current_contract_forces_two_off_dangerous=current_two_off_dangerous,
    )


def summarize(audits: list[HelperAudit]) -> dict[str, object]:
    family_counts: dict[str, int] = {}
    for audit in audits:
        family_counts[audit.family] = family_counts.get(audit.family, 0) + 1
    center_counts: dict[str, int] = {}
    for audit in audits:
        center_counts[audit.center_case] = center_counts.get(audit.center_case, 0) + 1
    return {
        "helper_count": len(audits),
        "textual_sorry_count": sum(a.textual_sorries for a in audits),
        "family_counts": dict(sorted(family_counts.items())),
        "center_counts": dict(sorted(center_counts.items())),
        "helpers_with_unlinked_critical_system": sum(
            a.has_unlinked_critical_system for a in audits
        ),
        "helpers_with_linked_provenance_packet": sum(
            a.has_linked_provenance_packet for a in audits
        ),
        "helpers_with_f2_no_qfree_field": sum(a.has_f2_no_qfree_field for a in audits),
        "helpers_where_current_maps_transfer_full_support": sum(
            a.current_maps_transfer_full_support for a in audits
        ),
        "helpers_where_provenance_rederives_existing_transfer": sum(
            a.provenance_rederives_existing_transfer for a in audits
        ),
        "helpers_where_provenance_adds_new_same_center_transfer": sum(
            a.provenance_adds_new_same_center_transfer for a in audits
        ),
        "helpers_where_provenance_adds_f2_no_qfree": sum(
            a.provenance_adds_f2_no_qfree for a in audits
        ),
        "named_center_membership_targets": sum(
            a.named_center_membership_target for a in audits
        ),
        "helpers_where_current_contract_forces_two_off_dangerous": sum(
            a.current_contract_forces_two_off_dangerous for a in audits
        ),
    }


def check_sources() -> None:
    provenance = PROVENANCE_SOURCE.read_text(encoding="utf-8")
    required = (
        "structure LiveCriticalRowProvenance",
        "theorem rowAt_no_qfree",
        "theorem f2Row_no_qfree",
        "theorem f2Source_mem_selectedFourClass",
        "theorem selectedFourClass_support_eq_f2Row",
        "theorem f2Source_mem_selectedFourClass_of_center_eq",
        "theorem selectedFourClass_support_eq_f2Row_of_center_eq",
        "theorem f2Row_to_qCriticalTriple",
        "theorem two_le_f2Row_support_sdiff_dangerousBase",
        "theorem exists_two_f2Row_support_off_dangerousBase",
        "theorem rowAt_support_eq_of_center_eq",
        "theorem f2Row_support_eq_rowAt_of_center_eq",
    )
    missing = [declaration for declaration in required if declaration not in provenance]
    if missing:
        raise AssertionError(f"provenance module missing declarations: {missing}")


def check_expected(summary: dict[str, object]) -> None:
    expected = {
        "helper_count": 35,
        "textual_sorry_count": 79,
        "family_counts": {
            "LIVE-C": 7,
            "LIVE-Q": 4,
            "LIVE-T1": 12,
            "LIVE-T3": 12,
        },
        "center_counts": {
            "fresh": 1,
            "p": 28,
            "q": 1,
            "t1": 1,
            "t2": 2,
            "t3": 1,
            "u": 1,
        },
        "helpers_with_unlinked_critical_system": 35,
        "helpers_with_linked_provenance_packet": 0,
        "helpers_with_f2_no_qfree_field": 0,
        "helpers_where_current_maps_transfer_full_support": 28,
        "helpers_where_provenance_rederives_existing_transfer": 28,
        "helpers_where_provenance_adds_new_same_center_transfer": 0,
        "helpers_where_provenance_adds_f2_no_qfree": 35,
        "named_center_membership_targets": 6,
        "helpers_where_current_contract_forces_two_off_dangerous": 7,
    }
    if summary != expected:
        raise AssertionError(
            "live helper contract changed:\n"
            f"expected={json.dumps(expected, indent=2, sort_keys=True)}\n"
            f"actual={json.dumps(summary, indent=2, sort_keys=True)}"
        )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--details", action="store_true", help="include one record per helper"
    )
    parser.add_argument(
        "--check", action="store_true", help="enforce the pinned helper census"
    )
    args = parser.parse_args()

    check_sources()
    source = LIVE_SOURCE.read_text(encoding="utf-8")
    audits = [audit_helper(*parts) for parts in extract_helper_blocks(source)]
    summary = summarize(audits)
    if args.check:
        check_expected(summary)
    output: dict[str, object] = {
        "status": "PASS" if args.check else "AUDIT",
        "scope": "exact source-contract census; no geometric satisfiability claim",
        "summary": summary,
    }
    if args.details:
        output["helpers"] = [asdict(audit) for audit in audits]
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
