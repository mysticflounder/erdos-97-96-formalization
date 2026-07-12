/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedBVCircuit
import Mathlib.Tactic

namespace Problem97.Census554.CapSelectedBVCircuit

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem prefixCore_of_p5_d4 (rows : RowBits) (colors : ColorBits)
    (h : antecedentP5D4 rows colors = true) :
    prefixCore rows colors = true := by
  unfold antecedentP5D4 commonAntecedent at h
  unfold common000 common001 common002 common003 common004 common005 common006 common007 common008 common009 common010 common011 common012 common013 common014 common015 common016 common017 common018 common019 common020 common021 common022 common023 common024 common025 common026 common027 common028 common029 common030 common031 common032 common033 common034 common035 common036 common037 common038 common039 common040 common041 common042 common043 common044 common045 at h
  unfold prefixCore
  unfold core000 core001 core002 core003 core004 core005 core006 core007 core008 core009 core010 core011 core012 core013 core014 core015 core016 core017 core018 core019 core020 core021 core022 core023 core024 core025 core026 core027 core028 core029 core030 core031 core032 core033 core034 core035 core036 core037 core038 core039 core040 core041
  bv_decide (config := { maxSteps := 100000000, timeout := 600 })

end Problem97.Census554.CapSelectedBVCircuit
