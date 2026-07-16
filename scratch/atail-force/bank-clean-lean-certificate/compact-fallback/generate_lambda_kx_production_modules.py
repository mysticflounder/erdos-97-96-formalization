#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Promote the validated fine lambda-Kx replay into production module names.

This wrapper deliberately reuses the hard-capped fine emitter instead of
rewriting its certificate logic.  It changes only the module prefix,
namespace, output location, and the narrow generated-code linter policy.
The upstream emitter hash is pinned so promotion fails closed on drift.
"""

from __future__ import annotations

import argparse
from dataclasses import replace
import hashlib
import importlib.util
import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
FINE_GENERATOR = HERE / "generate_lambda_kx_fine_modules.py"
EXPECTED_FINE_GENERATOR_SHA256 = (
    "1a8325c4651db236e55195b9ea8a25d0cd03273f7ae5daf81f080f4d9984ab6b"
)

OUTPUT_DIR = ROOT / (
    "lean/Erdos9796Proof/P97/Census554/BankCleanFifteenCertificate"
)
MANIFEST = ROOT / "certificates/p97_bank_clean_fifteen_certificate_manifest.json"
MODULE_PREFIX = (
    "Erdos9796Proof.P97.Census554.BankCleanFifteenCertificate"
)
MODULE_NAMESPACE = "Problem97.Census554.BankCleanFifteenCertificate"
PRODUCTION_MAX_MODULE_SOURCE_BYTES = 900_000
PRE_HEADER_MAX_MODULE_SOURCE_BYTES = 899_600
PROHIBITED_PRODUCTION_TOKENS = (
    b"Problem97.ATailBankClean",
    b"import LambdaKxFine",
)
LEAN_HEADER = b"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

"""


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def load_fine_generator():
    actual = file_sha256(FINE_GENERATOR)
    if actual != EXPECTED_FINE_GENERATOR_SHA256:
        raise ValueError(
            "fine module generator drift: expected "
            f"{EXPECTED_FINE_GENERATOR_SHA256}, found {actual}"
        )
    spec = importlib.util.spec_from_file_location(
        "lambda_kx_fine_helpers_for_production", FINE_GENERATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load fine generator {FINE_GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def promoted_artifacts():
    fine = load_fine_generator()
    fine.MODULE_PREFIX = MODULE_PREFIX
    fine.MODULE_NAMESPACE = MODULE_NAMESPACE
    # Leave deterministic room for the production license header and the
    # narrow generated-code linter setting before the hard rendered cap.
    fine.MAX_MODULE_SOURCE_BYTES = PRE_HEADER_MAX_MODULE_SOURCE_BYTES
    artifacts, upstream_manifest = fine.build()

    needle = (
        b"set_option linter.unusedVariables false\n\n"
        b"noncomputable section"
    )
    replacement = (
        b"set_option linter.unusedVariables false\n\n"
        b"set_option linter.unnecessarySeqFocus false\n\n"
        b"set_option linter.style.longLine false\n\n"
        b"noncomputable section"
    )
    promoted = []
    for artifact in artifacts:
        if artifact.source.count(needle) != 1:
            raise ValueError(
                f"unexpected prelude shape in generated module {artifact.module}"
            )
        source = LEAN_HEADER + artifact.source.replace(needle, replacement)
        for token in PROHIBITED_PRODUCTION_TOKENS:
            if token in source:
                raise ValueError(
                    f"scratch token {token!r} leaked into {artifact.module}"
                )
        if len(source) > PRODUCTION_MAX_MODULE_SOURCE_BYTES:
            raise ValueError(
                f"production module {artifact.module} is {len(source)} bytes; "
                f"cap is {PRODUCTION_MAX_MODULE_SOURCE_BYTES}"
            )
        promoted.append(
            replace(
                artifact,
                source=source,
                command_count=artifact.command_count + 2,
                max_command_bytes=max(
                    artifact.max_command_bytes,
                    len(b"set_option linter.unnecessarySeqFocus false\n"),
                    len(b"set_option linter.style.longLine false\n"),
                ),
            )
        )

    records = [artifact.manifest_record() for artifact in promoted]
    manifest = dict(upstream_manifest)
    hard_caps = dict(manifest["hard_caps"])
    hard_caps["rendered_module_source_bytes"] = (
        PRODUCTION_MAX_MODULE_SOURCE_BYTES
    )
    manifest.update(
        {
            "schema": "p97-bank-clean-fifteen-production-modules-v1",
            "generator_sha256": file_sha256(Path(__file__)),
            "upstream_fine_generator_sha256": (
                EXPECTED_FINE_GENERATOR_SHA256
            ),
            "namespace": MODULE_NAMESPACE,
            "module_prefix": MODULE_PREFIX,
            "terminal_module": promoted[-1].module,
            "topological_order": [artifact.module for artifact in promoted],
            "modules": records,
            "hard_caps": hard_caps,
            "total_source_bytes": sum(
                len(artifact.source) for artifact in promoted
            ),
            "max_module_source_bytes": max(
                len(artifact.source) for artifact in promoted
            ),
            "total_command_count": sum(
                artifact.command_count for artifact in promoted
            ),
            "max_module_command_count": max(
                artifact.command_count for artifact in promoted
            ),
            "max_command_bytes": max(
                artifact.max_command_bytes for artifact in promoted
            ),
            "production_source_policy": {
                "generated_linter_suppressions": [
                    "linter.style.longLine",
                    "linter.unnecessarySeqFocus",
                ],
                "license_header_sha256": hashlib.sha256(
                    LEAN_HEADER
                ).hexdigest(),
                "pre_header_module_source_bytes": (
                    PRE_HEADER_MAX_MODULE_SOURCE_BYTES
                ),
                "overflow_allowed": False,
            },
            "epistemic_status": (
                "exact deterministic production-named Lean source; "
                "production kernel build pending"
            ),
        }
    )
    return promoted, manifest


def main() -> None:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--plan", action="store_true")
    arguments = parser.parse_args()

    artifacts, manifest = promoted_artifacts()
    manifest_bytes = (
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    ).encode("utf-8")
    expected_files = {artifact.relative_file for artifact in artifacts}

    if arguments.plan:
        print("production lambda Kx module plan: PASS")
    elif arguments.check:
        actual_files = (
            {
                str(path.relative_to(OUTPUT_DIR))
                for path in OUTPUT_DIR.glob("*.lean")
            }
            if OUTPUT_DIR.exists()
            else set()
        )
        if actual_files != expected_files:
            raise SystemExit(
                "generated production module set drift: expected "
                f"{len(expected_files)}, found {len(actual_files)}"
            )
        for artifact in artifacts:
            path = OUTPUT_DIR / artifact.relative_file
            if path.read_bytes() != artifact.source:
                raise SystemExit(f"generated production module drift: {path}")
        if MANIFEST.read_bytes() != manifest_bytes:
            raise SystemExit(f"generated production manifest drift: {MANIFEST}")
        print("production lambda Kx module generation check: PASS")
    else:
        actual_files = (
            {
                str(path.relative_to(OUTPUT_DIR))
                for path in OUTPUT_DIR.glob("*.lean")
            }
            if OUTPUT_DIR.exists()
            else set()
        )
        stale_files = actual_files - expected_files
        if stale_files:
            raise SystemExit(
                "refusing to overwrite production tree with stale modules: "
                + ", ".join(sorted(stale_files))
            )
        OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
        for artifact in artifacts:
            (OUTPUT_DIR / artifact.relative_file).write_bytes(artifact.source)
        MANIFEST.write_bytes(manifest_bytes)
        print(MANIFEST)

    print("modules", len(artifacts))
    print("total bytes", manifest["total_source_bytes"])
    print("max module bytes", manifest["max_module_source_bytes"])
    print("max module commands", manifest["max_module_command_count"])
    print("max command bytes", manifest["max_command_bytes"])


if __name__ == "__main__":
    main()
