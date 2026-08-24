#!/usr/bin/env python3
"""Forbidden-import lint for the FrontierLiveClosure proof clusters.

The A-tail frontier live-closure directory is partitioned into proof clusters
(Rigid221, TriApex, TwoSource, TwoDeletion, B1) plus a `shared` remainder.  The
architectural rule this script enforces:

  * a cluster module may import shared modules freely (`to-shared`);
  * a cluster module may import modules of its own cluster (`intra-cluster`);
  * a cluster module must NOT import a module of a different cluster
    (`cross-cluster`);
  * a shared module must NOT import a cluster module
    (`from-shared-to-cluster`) -- a core/shared module must not depend on a
    cluster.

Every cross-cluster and from-shared-to-cluster edge that already existed when
the rule was introduced is recorded in `proof-status/import-waivers.json`.  The
lint fails only on edges that are not covered by a waiver, so the graph can be
frozen at its current shape and untangled wave by wave.

Usage:

    uv run python scripts/lint_cluster_imports.py
    uv run python scripts/lint_cluster_imports.py --json
    uv run python scripts/lint_cluster_imports.py --list-waived

Exit status:
    0  every forbidden edge in the live tree is waived
    1  at least one non-waived forbidden edge exists
    2  the lint could not run (missing tree, unreadable waiver file)

Standard library only.  No third-party imports, no regular expressions.
"""

from __future__ import annotations

import argparse
import json
import os
import sys

# --------------------------------------------------------------------------
# Repository layout
# --------------------------------------------------------------------------

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
LEAN_ROOT = os.path.join(REPO_ROOT, "lean")

CLUSTER_NAMESPACE = "Erdos9796Proof.P97.ATail.FrontierLiveClosure"
CLUSTER_DIR = os.path.join(
    LEAN_ROOT, "Erdos9796Proof", "P97", "ATail", "FrontierLiveClosure"
)
# The parent coordinator module file sits beside the directory, not inside it.
COORDINATOR_FILE = CLUSTER_DIR + ".lean"

WAIVER_FILE = os.path.join(REPO_ROOT, "proof-status", "import-waivers.json")

# --------------------------------------------------------------------------
# Cluster classification
# --------------------------------------------------------------------------

SHARED = "shared"

# Ordered (basename prefix, cluster) pairs.  Matching is on the FINAL dotted
# component of the module name only -- never on a substring of the full path --
# so `ExactTwelveRigid221Ingress` is shared, not Rigid221, and the nested
# `...FrontierLiveClosure.Coordinator` is never confused with the parent
# coordinator module `...ATail.FrontierLiveClosure`.
CLUSTER_PREFIXES = (
    ("Rigid221", "Rigid221"),
    ("TriApex", "TriApex"),
    ("TwoSource", "TwoSource"),
    ("FreshThird", "TwoSource"),
    ("FirstFiber", "TwoSource"),
    ("FirstNonHit", "TwoSource"),
    ("TwoDeletion", "TwoDeletion"),
)

# Exact basenames (not prefixes) that name a cluster.
CLUSTER_EXACT = {
    "B1Live": "B1",
}

MODULE_CHARS = frozenset(
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ" "abcdefghijklmnopqrstuvwxyz" "0123456789" "_.'"
)
ASCII_UPPER = frozenset("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

IMPORT_KEYWORD = "import "


def cluster_of(module: str) -> str:
    """Cluster owning `module`, by the final dotted component of its name."""
    basename = module.rsplit(".", 1)[-1]
    exact = CLUSTER_EXACT.get(basename)
    if exact is not None:
        return exact
    for prefix, cluster in CLUSTER_PREFIXES:
        if basename.startswith(prefix):
            return cluster
    return SHARED


def classify(from_cluster: str, to_cluster: str) -> str:
    """Edge class.  The four labels are total and mutually exclusive."""
    if to_cluster == SHARED:
        # Covers cluster -> shared and shared -> shared.  Always permitted.
        return "to-shared"
    if from_cluster == SHARED:
        return "from-shared-to-cluster"
    if from_cluster == to_cluster:
        return "intra-cluster"
    return "cross-cluster"


FORBIDDEN_CLASSES = frozenset(("cross-cluster", "from-shared-to-cluster"))


# --------------------------------------------------------------------------
# Parsing
# --------------------------------------------------------------------------


def module_name(path: str) -> str:
    """Lean module name for a `.lean` file under `lean/`."""
    relative = os.path.relpath(path, LEAN_ROOT)
    if relative.endswith(".lean"):
        relative = relative[: -len(".lean")]
    return relative.replace(os.sep, ".")


def source_files() -> list:
    """Every `.lean` file in the cluster tree, plus the parent coordinator."""
    found = []
    if os.path.isfile(COORDINATOR_FILE):
        found.append(COORDINATOR_FILE)
    for dirpath, dirnames, filenames in os.walk(CLUSTER_DIR):
        dirnames.sort()
        for filename in sorted(filenames):
            if filename.endswith(".lean"):
                found.append(os.path.join(dirpath, filename))
    return found


def import_target(line: str):
    """Module imported by `line`, or None when the line is not an import.

    A real Lean import starts at column 0 with `import ` and is followed by a
    capitalized module path.  Prose such as a line beginning `important:` or
    `imported here.` has no space after `import`, so it is rejected here.
    """
    if not line.startswith(IMPORT_KEYWORD):
        return None
    target = line[len(IMPORT_KEYWORD) :].strip()
    if not target:
        return None
    if target[0] not in ASCII_UPPER:
        return None
    for character in target:
        if character not in MODULE_CHARS:
            return None
    return target


def in_cluster_tree(module: str) -> bool:
    return module == CLUSTER_NAMESPACE or module.startswith(CLUSTER_NAMESPACE + ".")


def collect_edges() -> list:
    """Every intra-directory import edge in the live tree.

    Each edge is a dict with `from`, `to`, `from_cluster`, `to_cluster`,
    `class`, `from_file` (repo-relative) and `line`.
    """
    edges = []
    for path in source_files():
        source_module = module_name(path)
        source_cluster = cluster_of(source_module)
        relative_path = os.path.relpath(path, REPO_ROOT)
        with open(path, "r", encoding="utf-8") as handle:
            for number, raw in enumerate(handle, 1):
                target = import_target(raw.rstrip("\n"))
                if target is None or not in_cluster_tree(target):
                    continue
                target_cluster = cluster_of(target)
                edges.append(
                    {
                        "from": source_module,
                        "to": target,
                        "from_cluster": source_cluster,
                        "to_cluster": target_cluster,
                        "class": classify(source_cluster, target_cluster),
                        "from_file": relative_path,
                        "line": number,
                    }
                )
    edges.sort(key=lambda edge: (edge["from"], edge["to"], edge["line"]))
    return edges


# --------------------------------------------------------------------------
# Waivers
# --------------------------------------------------------------------------


def load_waivers(path: str) -> set:
    """Set of waived `(from, to)` module pairs."""
    with open(path, "r", encoding="utf-8") as handle:
        document = json.load(handle)
    entries = document.get("waivers")
    if not isinstance(entries, list):
        raise ValueError("import-waivers.json: 'waivers' must be a list")
    pairs = set()
    for index, entry in enumerate(entries):
        if not isinstance(entry, dict):
            raise ValueError("import-waivers.json: waiver %d is not an object" % index)
        source = entry.get("from")
        target = entry.get("to")
        if not isinstance(source, str) or not isinstance(target, str):
            raise ValueError(
                "import-waivers.json: waiver %d needs string 'from' and 'to'" % index
            )
        pairs.add((source, target))
    return pairs


# --------------------------------------------------------------------------
# Entry point
# --------------------------------------------------------------------------


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description="Fail on non-waived cross-cluster imports in "
        "Erdos9796Proof/P97/ATail/FrontierLiveClosure."
    )
    parser.add_argument(
        "--waivers",
        default=WAIVER_FILE,
        help="path to import-waivers.json (default: proof-status/import-waivers.json)",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="emit the violation report as JSON on stdout",
    )
    parser.add_argument(
        "--list-waived",
        action="store_true",
        help="also list the forbidden edges that a waiver currently covers",
    )
    parser.add_argument(
        "--stale-waivers",
        action="store_true",
        help="report waivers whose edge no longer exists (informational only)",
    )
    arguments = parser.parse_args(argv)

    if not os.path.isdir(CLUSTER_DIR):
        sys.stderr.write("lint_cluster_imports: missing tree %s\n" % CLUSTER_DIR)
        return 2
    try:
        waived = load_waivers(arguments.waivers)
    except (OSError, ValueError, json.JSONDecodeError) as error:
        sys.stderr.write("lint_cluster_imports: %s\n" % error)
        return 2

    edges = collect_edges()
    forbidden = [edge for edge in edges if edge["class"] in FORBIDDEN_CLASSES]
    violations = [edge for edge in forbidden if (edge["from"], edge["to"]) not in waived]
    covered = [edge for edge in forbidden if (edge["from"], edge["to"]) in waived]

    live_pairs = set((edge["from"], edge["to"]) for edge in forbidden)
    stale = sorted(pair for pair in waived if pair not in live_pairs)

    if arguments.json:
        report = {
            "edges_scanned": len(edges),
            "forbidden_edges": len(forbidden),
            "waived_edges": len(covered),
            "violations": violations,
            "stale_waivers": [{"from": a, "to": b} for a, b in stale],
        }
        sys.stdout.write(json.dumps(report, indent=2, sort_keys=True) + "\n")
        return 1 if violations else 0

    if arguments.list_waived:
        sys.stdout.write("waived forbidden edges (%d):\n" % len(covered))
        for edge in covered:
            sys.stdout.write(
                "  %s:%d  %s -> %s  [%s -> %s]\n"
                % (
                    edge["from_file"],
                    edge["line"],
                    edge["from"],
                    edge["to"],
                    edge["from_cluster"],
                    edge["to_cluster"],
                )
            )

    if arguments.stale_waivers and stale:
        sys.stdout.write("stale waivers (edge no longer present) (%d):\n" % len(stale))
        for source, target in stale:
            sys.stdout.write("  %s -> %s\n" % (source, target))

    if not violations:
        sys.stdout.write(
            "lint_cluster_imports: OK -- %d import edges scanned, "
            "%d forbidden edges, all waived.\n" % (len(edges), len(forbidden))
        )
        return 0

    sys.stderr.write(
        "lint_cluster_imports: FAIL -- %d non-waived forbidden import edge%s\n"
        % (len(violations), "" if len(violations) == 1 else "s")
    )
    for edge in violations:
        sys.stderr.write(
            "  %s:%d: import %s  (%s -> %s, %s)\n"
            % (
                edge["from_file"],
                edge["line"],
                edge["to"],
                edge["from_cluster"],
                edge["to_cluster"],
                edge["class"],
            )
        )
    waiver_label = os.path.abspath(arguments.waivers)
    if waiver_label.startswith(REPO_ROOT + os.sep):
        waiver_label = os.path.relpath(waiver_label, REPO_ROOT)
    sys.stderr.write(
        "Add a waiver to %s with a planned retirement wave, or remove the import.\n"
        % waiver_label
    )
    return 1


if __name__ == "__main__":
    sys.exit(main())
