#!/usr/bin/env python3
"""Negative control for the Tier-2d bank chain check.  Not a general tool.

Corrupts one digest in one bank's ``source_manifest`` in memory and requires
the build to fail closed.  Run as a subprocess by
``scripts/verify_bank_chain_pins.py`` so the monkeypatched builders cannot leak
into the caller; it prints one JSON object on stdout and writes nothing.

The walk mirrors ``scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py:70-124``
and stops at the first chain position carrying an own ``EXPECTED_BANK_SHA256``.
Earlier positions hold no own pin, so a perturbation there has nothing to fail
closed against and the control would report a false pass.
"""

from __future__ import annotations

import importlib
import json
import sys
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO_ROOT))

sys.path.insert(0, str(REPO_ROOT / "scripts"))
from verify_bank_chain_pins import (
    OWN_PIN,
    chain_modules,
    corrupt_digest,
    pin_literals,
)

DRIFT_TEXT = "hash drifted"


def entry_points(module: Any) -> tuple[Any, Any, Any]:
    """Resolve build/validate/install exactly as the refreeze walk does."""

    names = {}
    for name in module.__all__:
        for kind in ("build_", "validate_", "install_"):
            if name.startswith(kind):
                names[kind.rstrip("_")] = getattr(module, name)
    return names["build"], names["validate"], names["install"]


def main() -> int:
    order = chain_modules(REPO_ROOT)
    target_index = next(
        (
            index
            for index, name in enumerate(order)
            if isinstance(pin_literals(REPO_ROOT, name)[OWN_PIN], str)
        ),
        None,
    )
    if target_index is None:
        print(json.dumps({"n_mutants": 0, "n_rejected": 0, "skipped": "no own pin"}))
        return 1

    from census.card_head.tests.test_exact12_apex_first_opposite_shared_pair_common_five_membership_family_bank import (
        _parent as chain_head,
    )

    instance, layout, parent_bank = chain_head()
    module = None
    for name in order[: target_index + 1]:
        module = importlib.import_module(f"census.card_head.{name}")
        build, validate, install = entry_points(module)
        (cell,) = sorted(module.PRODUCTION_FAMILY_ID_BY_CELL)
        if name == order[target_index]:
            break
        bank = build(REPO_ROOT, instance, layout, parent_bank, cell_index=cell)
        validate(REPO_ROOT, instance, layout, parent_bank, bank, cell_index=cell)
        parent_bank = install(REPO_ROOT, instance, layout, parent_bank, cell_index=cell)

    target = order[target_index]
    result: dict[str, Any] = {
        "target_module": target,
        "chain_position": target_index + 1,
        "pinned_sha256": pin_literals(REPO_ROOT, target)[OWN_PIN],
    }

    # Clean build first.  A control that runs only the perturbed build cannot
    # tell a working guard from a build that was broken to begin with.
    try:
        clean = build(REPO_ROOT, instance, layout, parent_bank, cell_index=cell)
        result["clean_build"] = "OK"
        result["clean_sha256"] = clean["bank_sha256"]
        result["clean_manifest_entries"] = len(clean["source_manifest"])
    except Exception as exc:  # noqa: BLE001 - the verdict is the message
        result["clean_build"] = "FAILED"
        result["clean_error"] = str(exc)[:400]
        result["n_mutants"] = 0
        result["n_rejected"] = 0
        print(json.dumps(result))
        return 1

    original = module._source_record
    perturbed_path: list[str] = []

    def corrupting_source_record(repo_root, relative, _original=original):
        record = dict(_original(repo_root, relative))
        # Perturb exactly one entry: the first the builder asks for.
        if not perturbed_path:
            perturbed_path.append(relative)
            record["sha256"] = corrupt_digest(record["sha256"])
        return record

    module._source_record = corrupting_source_record
    try:
        build(REPO_ROOT, instance, layout, parent_bank, cell_index=cell)
    except Exception as exc:  # noqa: BLE001 - the verdict is the message
        result["mutant_raised"] = type(exc).__name__
        result["mutant_message"] = str(exc)[:400]
        result["mutant_message_reports_drift"] = DRIFT_TEXT in str(exc)
        result["n_mutants"] = 1
        result["n_rejected"] = 1
    else:
        result["mutant_raised"] = None
        result["n_mutants"] = 1
        result["n_rejected"] = 0
    finally:
        module._source_record = original

    result["perturbed_entry"] = perturbed_path[0] if perturbed_path else None
    print(json.dumps(result))
    return 0 if result["n_rejected"] == result["n_mutants"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
