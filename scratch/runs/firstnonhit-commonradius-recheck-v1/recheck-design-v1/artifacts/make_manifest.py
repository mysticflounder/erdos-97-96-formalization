import json, hashlib, datetime, subprocess, pathlib
ROOT="scratch/runs/firstnonhit-commonradius-recheck-v1/recheck-design-v1"
AR=f"{ROOT}/artifacts"
LANE="firstnonhit-commonradius-recheck-v1"
RUN="recheck-design-v1"
OWNER="firstnonhit-commonradius-recheck-v1"
base_head=subprocess.run(["git","rev-parse","HEAD"],capture_output=True,text=True).stdout.strip()
created=datetime.datetime.now(datetime.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00","Z")
def canon(v): return json.dumps(v,ensure_ascii=True,sort_keys=True,separators=(",",":")).encode("utf-8")
def sha(p): return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
# sources = the lane's own owned source artifacts that exist now
source={
 "census/p97_search/freshthird_firstnonhit_commonradius_recheck_v1.py":
     sha("census/p97_search/freshthird_firstnonhit_commonradius_recheck_v1.py"),
 "census/p97_search/tests/test_freshthird_firstnonhit_commonradius_recheck_v1.py":
     sha("census/p97_search/tests/test_freshthird_firstnonhit_commonradius_recheck_v1.py"),
 "docs/solve-prompts/2026-08-16-freshthird-firstnonhit-recheck-D-design.md":
     sha("docs/solve-prompts/2026-08-16-freshthird-firstnonhit-recheck-D-design.md"),
 f"{AR}/make_checkpoint.py": sha(f"{AR}/make_checkpoint.py"),
}
# inputs = the Lean bridge authority the route points to + the lane checkpoint
inputs={
 "lean/scratch/firstnonhit-common-sixcenter-math/SixCenterMath.lean":
     sha("lean/scratch/firstnonhit-common-sixcenter-math/SixCenterMath.lean"),
 f"{AR}/checkpoint.json": sha(f"{AR}/checkpoint.json"),
}
unsigned={
 "schema":"worktree-run-manifest/v1","lane_id":LANE,"run_id":RUN,
 "root":ROOT,"owner":OWNER,"base_head":base_head,
 "output_classes":["artifacts","events","tmp"],
 "source_digests":source,"input_digests":inputs,"created_utc":created,
}
unsigned["manifest_sha256"]=hashlib.sha256(canon(unsigned)).hexdigest()
out=pathlib.Path(f"{ROOT}/run_manifest.json")
out.write_text(json.dumps(unsigned,ensure_ascii=True,sort_keys=True,separators=(",",":"))+"\n")
reloaded=json.loads(out.read_text())
check={k:v for k,v in reloaded.items() if k!="manifest_sha256"}
assert hashlib.sha256(canon(check)).hexdigest()==reloaded["manifest_sha256"], "self-hash mismatch"
print("OK run_manifest", reloaded["manifest_sha256"])
print("base_head", base_head, "sources", len(source), "inputs", len(inputs))
