import Std.Tactic.BVDecide.LRAT.Parser

open Std.Tactic.BVDecide

def certificate : String := include_str "verified-pass5-direct.lrat"

#eval match LRAT.parseLRATProof certificate.toUTF8 with
  | .ok proof => s!"OK actions={proof.size}"
  | .error error => "ERROR " ++ error
