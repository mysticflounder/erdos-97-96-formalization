# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mine the kernel dependency set of a bank's Lean root declarations.

A bank's ``source_manifest`` authenticates the Lean source the bank's
proof-carrying claim rests on.  Deriving that source set from the transitive
*import* closure over-couples it: in this repository the core-pair bank's
import closure is 2,875 files, while only 29 of them supply a declaration its
theorems actually use.  A neighbouring commit to any of the other 2,846 then
breaks every downstream pin for no mathematical reason, which has already cost
one repair (revert ``5fe42600``).

This tool computes the narrow set instead, from the Lean kernel rather than
from import syntax: starting at the bank's root declarations it walks the
transitive constant dependencies of every type and value, then maps each
declaration back to the module that supplies it and keeps the
repository-local ones.

The result is meant to be FROZEN into the bank module as
``LEAN_DEPENDENCY_MODULES``, not recomputed at build time -- mining needs a
built ``.olean`` tree, and bank builds must stay pure Python.  Freezing is
safe because the set is closed under change detection: a new dependency can
only be introduced by editing a declaration that is already inside the set,
and every module in the set is hashed.  So no edit can add a dependency
without breaking the pin first.

Usage:

    uv run python scripts/mine_bank_lean_dependencies.py \
        census.card_head.exact12_core_pair_all_order_common_five_membership_family_bank

The bank module must define ``LEAN_ROOT_MODULES``.  The roots are every
declaration those modules themselves supply, so no per-bank curation of root
declarations is needed and none can drift.  Prints the mined modules as a
ready-to-paste Python tuple literal.
"""

from __future__ import annotations

import argparse
import importlib
import sys
from pathlib import Path

from lean_lake_probe import ProbeError, normalize_probe_message, run_probe

REPO_ROOT = Path(__file__).resolve().parent.parent
LOCAL_PREFIX = "Erdos9796Proof."

LEAN_TEMPLATE = """{imports}

open Lean

private def rootModules : List Name :=
  [{roots}]

/-- Every declaration the root modules themselves supply. -/
private def rootDeclarations (env : Environment) : Array Name := Id.run do
  let names := env.header.moduleNames
  let mut roots : Array Name := #[]
  for index in [0 : names.size] do
    if rootModules.contains names[index]! then
      roots := roots ++ env.header.moduleData[index]!.constNames
  return roots

private def declClosure (env : Environment) (roots : Array Name) : NameSet := Id.run do
  let mut seen : NameSet := {{}}
  let mut stack : List Name := roots.toList
  while !stack.isEmpty do
    let name := stack.head!
    stack := stack.tail!
    if !seen.contains name then
      seen := seen.insert name
      match env.find? name with
      | none => pure ()
      | some info =>
        for used in info.type.getUsedConstants do
          stack := used :: stack
        match info.value? with
        | some value =>
          for used in value.getUsedConstants do
            stack := used :: stack
        | none => pure ()
  return seen

#eval show CoreM Unit from do
  let env <- getEnv
  let names := env.header.moduleNames
  for root in rootModules do
    if !names.contains root then
      IO.println s!"MISSING-ROOT {{root}}"
  let roots := rootDeclarations env
  let reached := declClosure env roots
  let mut modules : NameSet := {{}}
  for declaration in reached.toList do
    match env.getModuleIdxFor? declaration with
    | some index => modules := modules.insert names[index.toNat]!
    | none => pure ()
  IO.println s!"ROOTDECLS {{roots.size}}"
  IO.println s!"DECLARATIONS {{reached.toList.length}}"
  for module in modules.toList do
    IO.println s!"MOD {{module}}"
"""


def mine(
    root_modules: tuple[str, ...],
    *,
    probe_run_root: Path | str | None = None,
    timeout: int = 900,
) -> tuple[str, ...]:
    """Repository-local modules supplying a declaration the roots depend on."""

    source = LEAN_TEMPLATE.format(
        imports="\n".join(f"import {module}" for module in root_modules),
        roots="\n  , ".join(f"`{module}" for module in root_modules),
    )
    try:
        result = run_probe(
            repo_root=REPO_ROOT,
            lake_root="lean",
            source=source,
            run_root=probe_run_root,
            timeout=timeout,
        )
    except ProbeError as exc:
        raise SystemExit(
            "governed Lean probe failed while mining the dependency set; "
            f"the tree must be built first.\n{exc}"
        ) from exc
    normalized_lines: list[str] = []
    for line in result.output.splitlines():
        positioned = normalize_probe_message(line, result.probe_path)
        normalized_lines.append(positioned[1] if positioned is not None else line)
    probe_output = "\n".join(normalized_lines)
    missing = [
        line.split(None, 1)[1]
        for line in probe_output.splitlines()
        if line.startswith("MISSING-ROOT ")
    ]
    if missing:
        raise SystemExit(f"root declarations absent from the environment: {missing}")
    modules = sorted(
        line.split(None, 1)[1]
        for line in probe_output.splitlines()
        if line.startswith("MOD ") and line.split(None, 1)[1].startswith(LOCAL_PREFIX)
    )
    if not modules:
        raise SystemExit("mined no repository-local modules; that cannot be right")
    declarations = next(
        (
            line.split(None, 1)[1]
            for line in probe_output.splitlines()
            if line.startswith("DECLARATIONS ")
        ),
        "?",
    )
    rootdecls = next(
        (
            line.split(None, 1)[1]
            for line in probe_output.splitlines()
            if line.startswith("ROOTDECLS ")
        ),
        "?",
    )
    print(
        f"# {rootdecls} root declarations reached {declarations} declarations",
        file=sys.stderr,
    )
    return tuple(modules)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank_module", help="importable bank module path")
    parser.add_argument(
        "--probe-run-root",
        type=Path,
        help="registered scratch/runs/<lane>/<run>/ directory for the generated package",
    )
    parser.add_argument(
        "--probe-timeout",
        type=int,
        default=900,
        help="seconds allowed for the governed probe (default: 900)",
    )
    parser.add_argument(
        "--compare",
        action="store_true",
        help="also report the module's current LEAN_DEPENDENCY_MODULES",
    )
    arguments = parser.parse_args()

    sys.path.insert(0, str(REPO_ROOT))
    bank = importlib.import_module(arguments.bank_module)
    root_modules = tuple(bank.LEAN_ROOT_MODULES)
    mined = mine(
        root_modules, probe_run_root=arguments.probe_run_root, timeout=arguments.probe_timeout
    )

    for module in root_modules:
        if module not in mined:
            raise SystemExit(
                f"root module {module} supplies no reached declaration; the roots "
                "are wrong or the module is dead"
            )

    if arguments.compare:
        frozen = tuple(getattr(bank, "LEAN_DEPENDENCY_MODULES", ()))
        if frozen == mined:
            print(f"UNCHANGED {len(mined)} modules", file=sys.stderr)
        else:
            print(f"ADDED   {sorted(set(mined) - set(frozen))}", file=sys.stderr)
            print(f"REMOVED {sorted(set(frozen) - set(mined))}", file=sys.stderr)

    print("LEAN_DEPENDENCY_MODULES = (")
    for module in mined:
        print(f'    "{module}",')
    print(")")


if __name__ == "__main__":
    main()
