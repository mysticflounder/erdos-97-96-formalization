from pathlib import Path
import importlib.util
import json
import sys

import z3


repo = Path(__file__).resolve().parents[3]
module_path = repo / "census/p97_search/freshthird_qfiber_three_carrier_query_v1.py"
spec = importlib.util.spec_from_file_location("freshthird_query_v1", module_path)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {module_path}")
module = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = module
spec.loader.exec_module(module)

query = module.build_query(0, timeout_ms=240_000)
# Z3 serializes assert_and_track groups as implications guarded by these
# Booleans.  Enable every guard so the cvc5 input is the fully tracked query.
for group in query.groups:
    query.solver.add(z3.Bool(f"source__{group}"))
output = Path(__file__).with_name("boundary-0-exact.smt2")
output.write_text(query.solver.to_smt2(), encoding="utf-8")
serialized = output.read_text(encoding="utf-8")
labels = sorted(
    line.split()[1]
    for line in serialized.splitlines()
    if line.startswith("(declare-fun source__")
)
enabled = {
    line.strip()[len("source__") : -1]
    for line in serialized.splitlines()
    if line.strip().startswith("source__") and line.strip().endswith(")")
}
metadata = {
    "boundary_index": 0,
    "source_module": str(module_path.relative_to(repo)),
    "constraint_groups": list(query.groups),
    "constraint_group_count": len(query.groups),
    "source_labels_in_export": labels,
    "source_label_count": len(labels),
    "source_labels_enabled": all(group in enabled for group in query.groups),
    "smt2_bytes": output.stat().st_size,
}
Path(__file__).with_name("export-metadata.json").write_text(
    json.dumps(metadata, sort_keys=True, indent=2) + "\n", encoding="utf-8"
)
print(json.dumps(metadata, sort_keys=True))
