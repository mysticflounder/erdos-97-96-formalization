/-
Generated itemwise endpoint for the persisted verified left certificate.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

/-- Complete itemwise chunk facts contradict the verified LRAT endpoint. -/
theorem false_of_sourceChunks_each (source : BVExpr.Assignment)
    (c000 : ∀ item ∈ sourceChunk000Assertions,
      item.eval source = true)
    (c001 : ∀ item ∈ sourceChunk001Assertions,
      item.eval source = true)
    (c002 : ∀ item ∈ sourceChunk002Assertions,
      item.eval source = true)
    (c003 : ∀ item ∈ sourceChunk003Assertions,
      item.eval source = true)
    (c004 : ∀ item ∈ sourceChunk004Assertions,
      item.eval source = true)
    (c005 : ∀ item ∈ sourceChunk005Assertions,
      item.eval source = true)
    (c006 : ∀ item ∈ sourceChunk006Assertions,
      item.eval source = true)
    (c007 : ∀ item ∈ sourceChunk007Assertions,
      item.eval source = true)
    (c008 : ∀ item ∈ sourceChunk008Assertions,
      item.eval source = true)
    (c009 : ∀ item ∈ sourceChunk009Assertions,
      item.eval source = true)
    (c010 : ∀ item ∈ sourceChunk010Assertions,
      item.eval source = true)
    (c011 : ∀ item ∈ sourceChunk011Assertions,
      item.eval source = true)
    (c012 : ∀ item ∈ sourceChunk012Assertions,
      item.eval source = true)
    (c013 : ∀ item ∈ sourceChunk013Assertions,
      item.eval source = true)
    (c014 : ∀ item ∈ sourceChunk014Assertions,
      item.eval source = true)
    (c015 : ∀ item ∈ sourceChunk015Assertions,
      item.eval source = true)
    (c016 : ∀ item ∈ sourceChunk016Assertions,
      item.eval source = true)
    (c017 : ∀ item ∈ sourceChunk017Assertions,
      item.eval source = true)
    (c018 : ∀ item ∈ sourceChunk018Assertions,
      item.eval source = true)
    (c019 : ∀ item ∈ sourceChunk019Assertions,
      item.eval source = true)
    (c020 : ∀ item ∈ sourceChunk020Assertions,
      item.eval source = true)
    (c021 : ∀ item ∈ sourceChunk021Assertions,
      item.eval source = true)
    (c022 : ∀ item ∈ sourceChunk022Assertions,
      item.eval source = true)
    (c023 : ∀ item ∈ sourceChunk023Assertions,
      item.eval source = true)
    (c024 : ∀ item ∈ sourceChunk024Assertions,
      item.eval source = true)
    (c025 : ∀ item ∈ sourceChunk025Assertions,
      item.eval source = true)
    (c026 : ∀ item ∈ sourceChunk026Assertions,
      item.eval source = true)
    (c027 : ∀ item ∈ sourceChunk027Assertions,
      item.eval source = true)
    (c028 : ∀ item ∈ sourceChunk028Assertions,
      item.eval source = true)
    (c029 : ∀ item ∈ sourceChunk029Assertions,
      item.eval source = true)
    (c030 : ∀ item ∈ sourceChunk030Assertions,
      item.eval source = true)
    (c031 : ∀ item ∈ sourceChunk031Assertions,
      item.eval source = true)
    (c032 : ∀ item ∈ sourceChunk032Assertions,
      item.eval source = true)
    (c033 : ∀ item ∈ sourceChunk033Assertions,
      item.eval source = true)
    (c034 : ∀ item ∈ sourceChunk034Assertions,
      item.eval source = true)
    (c035 : ∀ item ∈ sourceChunk035Assertions,
      item.eval source = true)
    (c036 : ∀ item ∈ sourceChunk036Assertions,
      item.eval source = true)
    (c037 : ∀ item ∈ sourceChunk037Assertions,
      item.eval source = true)
    (c038 : ∀ item ∈ sourceChunk038Assertions,
      item.eval source = true)
    (c039 : ∀ item ∈ sourceChunk039Assertions,
      item.eval source = true)
    (c040 : ∀ item ∈ sourceChunk040Assertions,
      item.eval source = true)
    (c041 : ∀ item ∈ sourceChunk041Assertions,
      item.eval source = true)
    (c042 : ∀ item ∈ sourceChunk042Assertions,
      item.eval source = true)
    (c043 : ∀ item ∈ sourceChunk043Assertions,
      item.eval source = true)
    (c044 : ∀ item ∈ sourceChunk044Assertions,
      item.eval source = true)
    (c045 : ∀ item ∈ sourceChunk045Assertions,
      item.eval source = true)
    (c046 : ∀ item ∈ sourceChunk046Assertions,
      item.eval source = true)
    (c047 : ∀ item ∈ sourceChunk047Assertions,
      item.eval source = true)
    (c048 : ∀ item ∈ sourceChunk048Assertions,
      item.eval source = true)
    (c049 : ∀ item ∈ sourceChunk049Assertions,
      item.eval source = true)
    (c050 : ∀ item ∈ sourceChunk050Assertions,
      item.eval source = true)
    (c051 : ∀ item ∈ sourceChunk051Assertions,
      item.eval source = true)
    (c052 : ∀ item ∈ sourceChunk052Assertions,
      item.eval source = true)
    (c053 : ∀ item ∈ sourceChunk053Assertions,
      item.eval source = true)
    (c054 : ∀ item ∈ sourceChunk054Assertions,
      item.eval source = true)
    (c055 : ∀ item ∈ sourceChunk055Assertions,
      item.eval source = true)
    (c056 : ∀ item ∈ sourceChunk056Assertions,
      item.eval source = true)
    (c057 : ∀ item ∈ sourceChunk057Assertions,
      item.eval source = true)
    (c058 : ∀ item ∈ sourceChunk058Assertions,
      item.eval source = true)
    (c059 : ∀ item ∈ sourceChunk059Assertions,
      item.eval source = true)
    (c060 : ∀ item ∈ sourceChunk060Assertions,
      item.eval source = true)
    (c061 : ∀ item ∈ sourceChunk061Assertions,
      item.eval source = true)
    (c062 : ∀ item ∈ sourceChunk062Assertions,
      item.eval source = true)
    (c063 : ∀ item ∈ sourceChunk063Assertions,
      item.eval source = true)
    (c064 : ∀ item ∈ sourceChunk064Assertions,
      item.eval source = true)
    (c065 : ∀ item ∈ sourceChunk065Assertions,
      item.eval source = true)
    (c066 : ∀ item ∈ sourceChunk066Assertions,
      item.eval source = true)
    (c067 : ∀ item ∈ sourceChunk067Assertions,
      item.eval source = true)
    (c068 : ∀ item ∈ sourceChunk068Assertions,
      item.eval source = true)
    (c069 : ∀ item ∈ sourceChunk069Assertions,
      item.eval source = true)
    (c070 : ∀ item ∈ sourceChunk070Assertions,
      item.eval source = true)
    (c071 : ∀ item ∈ sourceChunk071Assertions,
      item.eval source = true)
    (c072 : ∀ item ∈ sourceChunk072Assertions,
      item.eval source = true)
    (c073 : ∀ item ∈ sourceChunk073Assertions,
      item.eval source = true)
    (c074 : ∀ item ∈ sourceChunk074Assertions,
      item.eval source = true)
    (c075 : ∀ item ∈ sourceChunk075Assertions,
      item.eval source = true)
    (c076 : ∀ item ∈ sourceChunk076Assertions,
      item.eval source = true)
    (c077 : ∀ item ∈ sourceChunk077Assertions,
      item.eval source = true)
    (c078 : ∀ item ∈ sourceChunk078Assertions,
      item.eval source = true)
    (c079 : ∀ item ∈ sourceChunk079Assertions,
      item.eval source = true)
    (c080 : ∀ item ∈ sourceChunk080Assertions,
      item.eval source = true)
    (c081 : ∀ item ∈ sourceChunk081Assertions,
      item.eval source = true)
    (c082 : ∀ item ∈ sourceChunk082Assertions,
      item.eval source = true)
    (c083 : ∀ item ∈ sourceChunk083Assertions,
      item.eval source = true)
    (c084 : ∀ item ∈ sourceChunk084Assertions,
      item.eval source = true)
    (c085 : ∀ item ∈ sourceChunk085Assertions,
      item.eval source = true)
    (c086 : ∀ item ∈ sourceChunk086Assertions,
      item.eval source = true)
    (c087 : ∀ item ∈ sourceChunk087Assertions,
      item.eval source = true)
    (c088 : ∀ item ∈ sourceChunk088Assertions,
      item.eval source = true)
    (c089 : ∀ item ∈ sourceChunk089Assertions,
      item.eval source = true)
    (c090 : ∀ item ∈ sourceChunk090Assertions,
      item.eval source = true)
    (c091 : ∀ item ∈ sourceChunk091Assertions,
      item.eval source = true)
    (c092 : ∀ item ∈ sourceChunk092Assertions,
      item.eval source = true)
    (c093 : ∀ item ∈ sourceChunk093Assertions,
      item.eval source = true)
    (c094 : ∀ item ∈ sourceChunk094Assertions,
      item.eval source = true)
    (c095 : ∀ item ∈ sourceChunk095Assertions,
      item.eval source = true)
    (c096 : ∀ item ∈ sourceChunk096Assertions,
      item.eval source = true)
    (c097 : ∀ item ∈ sourceChunk097Assertions,
      item.eval source = true)
    (c098 : ∀ item ∈ sourceChunk098Assertions,
      item.eval source = true)
    (c099 : ∀ item ∈ sourceChunk099Assertions,
      item.eval source = true)
    (c100 : ∀ item ∈ sourceChunk100Assertions,
      item.eval source = true)
    (c101 : ∀ item ∈ sourceChunk101Assertions,
      item.eval source = true)
    (c102 : ∀ item ∈ sourceChunk102Assertions,
      item.eval source = true)
    (c103 : ∀ item ∈ sourceChunk103Assertions,
      item.eval source = true)
    (c104 : ∀ item ∈ sourceChunk104Assertions,
      item.eval source = true)
    (c105 : ∀ item ∈ sourceChunk105Assertions,
      item.eval source = true)
    (c106 : ∀ item ∈ sourceChunk106Assertions,
      item.eval source = true)
    (c107 : ∀ item ∈ sourceChunk107Assertions,
      item.eval source = true)
    (c108 : ∀ item ∈ sourceChunk108Assertions,
      item.eval source = true)
    (c109 : ∀ item ∈ sourceChunk109Assertions,
      item.eval source = true)
    (c110 : ∀ item ∈ sourceChunk110Assertions,
      item.eval source = true)
    (c111 : ∀ item ∈ sourceChunk111Assertions,
      item.eval source = true)
    (c112 : ∀ item ∈ sourceChunk112Assertions,
      item.eval source = true)
    (c113 : ∀ item ∈ sourceChunk113Assertions,
      item.eval source = true) : False := by
  have hs000 := sourceChunk000_sat_of_each source c000
  have hs001 := sourceChunk001_sat_of_each source c001
  have hs002 := sourceChunk002_sat_of_each source c002
  have hs003 := sourceChunk003_sat_of_each source c003
  have hs004 := sourceChunk004_sat_of_each source c004
  have hs005 := sourceChunk005_sat_of_each source c005
  have hs006 := sourceChunk006_sat_of_each source c006
  have hs007 := sourceChunk007_sat_of_each source c007
  have hs008 := sourceChunk008_sat_of_each source c008
  have hs009 := sourceChunk009_sat_of_each source c009
  have hs010 := sourceChunk010_sat_of_each source c010
  have hs011 := sourceChunk011_sat_of_each source c011
  have hs012 := sourceChunk012_sat_of_each source c012
  have hs013 := sourceChunk013_sat_of_each source c013
  have hs014 := sourceChunk014_sat_of_each source c014
  have hs015 := sourceChunk015_sat_of_each source c015
  have hs016 := sourceChunk016_sat_of_each source c016
  have hs017 := sourceChunk017_sat_of_each source c017
  have hs018 := sourceChunk018_sat_of_each source c018
  have hs019 := sourceChunk019_sat_of_each source c019
  have hs020 := sourceChunk020_sat_of_each source c020
  have hs021 := sourceChunk021_sat_of_each source c021
  have hs022 := sourceChunk022_sat_of_each source c022
  have hs023 := sourceChunk023_sat_of_each source c023
  have hs024 := sourceChunk024_sat_of_each source c024
  have hs025 := sourceChunk025_sat_of_each source c025
  have hs026 := sourceChunk026_sat_of_each source c026
  have hs027 := sourceChunk027_sat_of_each source c027
  have hs028 := sourceChunk028_sat_of_each source c028
  have hs029 := sourceChunk029_sat_of_each source c029
  have hs030 := sourceChunk030_sat_of_each source c030
  have hs031 := sourceChunk031_sat_of_each source c031
  have hs032 := sourceChunk032_sat_of_each source c032
  have hs033 := sourceChunk033_sat_of_each source c033
  have hs034 := sourceChunk034_sat_of_each source c034
  have hs035 := sourceChunk035_sat_of_each source c035
  have hs036 := sourceChunk036_sat_of_each source c036
  have hs037 := sourceChunk037_sat_of_each source c037
  have hs038 := sourceChunk038_sat_of_each source c038
  have hs039 := sourceChunk039_sat_of_each source c039
  have hs040 := sourceChunk040_sat_of_each source c040
  have hs041 := sourceChunk041_sat_of_each source c041
  have hs042 := sourceChunk042_sat_of_each source c042
  have hs043 := sourceChunk043_sat_of_each source c043
  have hs044 := sourceChunk044_sat_of_each source c044
  have hs045 := sourceChunk045_sat_of_each source c045
  have hs046 := sourceChunk046_sat_of_each source c046
  have hs047 := sourceChunk047_sat_of_each source c047
  have hs048 := sourceChunk048_sat_of_each source c048
  have hs049 := sourceChunk049_sat_of_each source c049
  have hs050 := sourceChunk050_sat_of_each source c050
  have hs051 := sourceChunk051_sat_of_each source c051
  have hs052 := sourceChunk052_sat_of_each source c052
  have hs053 := sourceChunk053_sat_of_each source c053
  have hs054 := sourceChunk054_sat_of_each source c054
  have hs055 := sourceChunk055_sat_of_each source c055
  have hs056 := sourceChunk056_sat_of_each source c056
  have hs057 := sourceChunk057_sat_of_each source c057
  have hs058 := sourceChunk058_sat_of_each source c058
  have hs059 := sourceChunk059_sat_of_each source c059
  have hs060 := sourceChunk060_sat_of_each source c060
  have hs061 := sourceChunk061_sat_of_each source c061
  have hs062 := sourceChunk062_sat_of_each source c062
  have hs063 := sourceChunk063_sat_of_each source c063
  have hs064 := sourceChunk064_sat_of_each source c064
  have hs065 := sourceChunk065_sat_of_each source c065
  have hs066 := sourceChunk066_sat_of_each source c066
  have hs067 := sourceChunk067_sat_of_each source c067
  have hs068 := sourceChunk068_sat_of_each source c068
  have hs069 := sourceChunk069_sat_of_each source c069
  have hs070 := sourceChunk070_sat_of_each source c070
  have hs071 := sourceChunk071_sat_of_each source c071
  have hs072 := sourceChunk072_sat_of_each source c072
  have hs073 := sourceChunk073_sat_of_each source c073
  have hs074 := sourceChunk074_sat_of_each source c074
  have hs075 := sourceChunk075_sat_of_each source c075
  have hs076 := sourceChunk076_sat_of_each source c076
  have hs077 := sourceChunk077_sat_of_each source c077
  have hs078 := sourceChunk078_sat_of_each source c078
  have hs079 := sourceChunk079_sat_of_each source c079
  have hs080 := sourceChunk080_sat_of_each source c080
  have hs081 := sourceChunk081_sat_of_each source c081
  have hs082 := sourceChunk082_sat_of_each source c082
  have hs083 := sourceChunk083_sat_of_each source c083
  have hs084 := sourceChunk084_sat_of_each source c084
  have hs085 := sourceChunk085_sat_of_each source c085
  have hs086 := sourceChunk086_sat_of_each source c086
  have hs087 := sourceChunk087_sat_of_each source c087
  have hs088 := sourceChunk088_sat_of_each source c088
  have hs089 := sourceChunk089_sat_of_each source c089
  have hs090 := sourceChunk090_sat_of_each source c090
  have hs091 := sourceChunk091_sat_of_each source c091
  have hs092 := sourceChunk092_sat_of_each source c092
  have hs093 := sourceChunk093_sat_of_each source c093
  have hs094 := sourceChunk094_sat_of_each source c094
  have hs095 := sourceChunk095_sat_of_each source c095
  have hs096 := sourceChunk096_sat_of_each source c096
  have hs097 := sourceChunk097_sat_of_each source c097
  have hs098 := sourceChunk098_sat_of_each source c098
  have hs099 := sourceChunk099_sat_of_each source c099
  have hs100 := sourceChunk100_sat_of_each source c100
  have hs101 := sourceChunk101_sat_of_each source c101
  have hs102 := sourceChunk102_sat_of_each source c102
  have hs103 := sourceChunk103_sat_of_each source c103
  have hs104 := sourceChunk104_sat_of_each source c104
  have hs105 := sourceChunk105_sat_of_each source c105
  have hs106 := sourceChunk106_sat_of_each source c106
  have hs107 := sourceChunk107_sat_of_each source c107
  have hs108 := sourceChunk108_sat_of_each source c108
  have hs109 := sourceChunk109_sat_of_each source c109
  have hs110 := sourceChunk110_sat_of_each source c110
  have hs111 := sourceChunk111_sat_of_each source c111
  have hs112 := sourceChunk112_sat_of_each source c112
  have hs113 := sourceChunk113_sat_of_each source c113
  have hs := sourceExpr_sat_of_chunks source hs000 hs001 hs002 hs003 hs004 hs005 hs006 hs007 hs008 hs009 hs010 hs011 hs012 hs013 hs014 hs015 hs016 hs017 hs018 hs019 hs020 hs021 hs022 hs023 hs024 hs025 hs026 hs027 hs028 hs029 hs030 hs031 hs032 hs033 hs034 hs035 hs036 hs037 hs038 hs039 hs040 hs041 hs042 hs043 hs044 hs045 hs046 hs047 hs048 hs049 hs050 hs051 hs052 hs053 hs054 hs055 hs056 hs057 hs058 hs059 hs060 hs061 hs062 hs063 hs064 hs065 hs066 hs067 hs068 hs069 hs070 hs071 hs072 hs073 hs074 hs075 hs076 hs077 hs078 hs079 hs080 hs081 hs082 hs083 hs084 hs085 hs086 hs087 hs088 hs089 hs090 hs091 hs092 hs093 hs094 hs095 hs096 hs097 hs098 hs099 hs100 hs101 hs102 hs103 hs104 hs105 hs106 hs107 hs108 hs109 hs110 hs111 hs112 hs113
  have hu := sourceExpr_unsat source
  exact Bool.noConfusion (hu.symm.trans hs)

#print axioms false_of_sourceChunks_each

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
