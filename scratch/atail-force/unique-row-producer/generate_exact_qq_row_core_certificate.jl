#!/usr/bin/env julia

# Registry-driven exact QQ change-matrix certificate generator for the
# source-indexed CEGAR loop.  Add a named core with a locked raw-identity hash,
# then regenerate and independently replay its JSON certificate.

using TSSOS
using SHA

const G = TSSOS.Groebner
const AA = TSSOS.AbstractAlgebra

const SPECS = Dict(
    "unit-core-654-02" => (
        target="normalized_unit_core_654_02_anchor1_8",
        output="unit_core_654_02_certificate.json",
        rows=(
            (0, (1, 2, 5, 8, 9)),
            (1, (0, 4, 8, 9)),
            (4, (0, 6, 7, 8)),
            (8, (3, 7, 9, 11)),
            (9, (2, 3, 4, 5)),
            (11, (0, 5, 7, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "93238d6c16f53f0c4216e20b65db38263d6fd7a6106ebf061a68e7270e4abfd0",
        source_full_equality_sha256=
            "e6f94a81ddab0caba870d6e3de16702b636894fbebcc4054164c84b80a431619",
        core_equality_sha256=
            "648d2a73b6aec22369993df730d70e60ade24fb1feab1008d5f8127e8babfaec",
        point_relabeling_old_to_new=(2, 0, 3, 4, 5, 6, 7, 8, 1, 9, 10, 11),
    ),
    "unit-core-654-06" => (
        target="normalized_unit_core_654_06",
        output="unit_core_654_06_certificate.json",
        rows=(
            (1, (0, 5, 7, 8, 9)),
            (5, (4, 6, 9, 11)),
            (7, (2, 6, 8, 11)),
            (8, (1, 3, 5, 9)),
            (11, (1, 6, 7, 10)),
        ),
        expected_raw_identity_sha256=
            "1120c6045297deee26b90935314a2e3c9d91eec2d435812b8db387a4c2ca6dfc",
        source_indexed_signature_sha256=
            "d576733bb6ac4b8944eb871de9f5869a49ccc278e7dd5c53ad7c9b3659b81fdb",
        source_full_equality_sha256=
            "6b9a71d7ca0c5b4d0498fafb76ed77173b770eef5016750ce8b6f483b51a787d",
        core_equality_sha256=
            "f009465db9269abc939ef8e5d2c81e1de61115e98c086ea297da8742feaba91c",
    ),
    "source-indexed-unit-core-654-07" => (
        target="normalized_source_indexed_unit_core_654_07",
        output="unit_core_source_indexed_654_07_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (0, 2, 3, 4)),
            (10, (0, 1, 3, 6)),
            (11, (1, 4, 8, 10)),
        ),
        expected_raw_identity_sha256=
            "84971a739208eb50e21f0ceb3fd775d43dd64f018c40e8325475ff3b63872c18",
        source_indexed_signature_sha256=
            "93a63c37b0701fb308ae457c1461bb7555b3c4048a491789e71543f8afd1f433",
        source_full_equality_sha256=
            "a15c81d6fbad93dec9037c013aa4c6ce9d7b38c1d7f6ee9e6210625575274621",
        core_equality_sha256=
            "ed80efefd755437ccfeafda4d0af7bbd4999820a84d5f449845e0ff569caa73d",
    ),
    "source-indexed-unit-core-654-08" => (
        target="normalized_source_indexed_unit_core_654_08",
        output="unit_core_source_indexed_654_08_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (9, (0, 2, 3, 6)),
            (10, (0, 1, 3, 4)),
            (11, (1, 5, 9, 10)),
        ),
        expected_raw_identity_sha256=
            "632e250600590ed5837ce4ca9f7d269f80cfe078e3a8582f254df5b3ff3307c4",
        source_indexed_signature_sha256=
            "0ffffb22b805bde94d808a1c370a0f8b91b63f2b775e88aa786ffc8c1ae29d33",
        source_full_equality_sha256=
            "7c40e60f5ffb09295e18c20ea040a7b6239ee67e8b7efdfe0084bad2d0fa512d",
        core_equality_sha256=
            "8b105c3ec3784f5bdab1ecf0fdc26a8a574ba16ebaf4957781fea9a1a6056e28",
    ),
    "unit-core-654-08" => (
        target="normalized_unit_core_654_08",
        output="unit_core_654_08_certificate.json",
        rows=(
            (0, (1, 2, 3, 4)),
            (2, (0, 1, 10, 11)),
            (4, (3, 6, 7, 11)),
            (10, (0, 4, 6, 11)),
            (11, (1, 5, 6, 10)),
        ),
        expected_raw_identity_sha256=
            "6f3bb145e58078a74bba6cd52a090768ea00421d1b1a5c1cf64ec9e883d83797",
        source_indexed_signature_sha256=
            "d13b8114d0877b4bf8f979e20870a825fc295bf0fbee67e14c8294a74c13f145",
        source_full_equality_sha256=
            "3d395458e10bd2f25761cfcef3cd4fb9a3d716cf8ac00215c8be2e9b54713947",
        core_equality_sha256=
            "d2a213fa3a6970603fcddba0ab8faaca22528e9c2f3f874d4786c09eeb5aafab",
    ),
    "source-indexed-unit-core-654-09" => (
        target="normalized_source_indexed_unit_core_654_09",
        output="unit_core_source_indexed_654_09_certificate.json",
        rows=(
            (0, (1, 2, 3, 4)),
            (2, (0, 1, 10, 11)),
            (8, (0, 3, 6, 9)),
            (9, (4, 6, 8, 10)),
            (10, (0, 1, 5, 8)),
            (11, (1, 6, 9, 10)),
        ),
        expected_raw_identity_sha256=
            "b9468bc2031f3546d8e42ecda8fdeaf2d0d6a2eed9acf941ca3f382c32df533a",
        source_indexed_signature_sha256=
            "4f728a58f59a3c5a16cfda0a9b475f37dc40b9601f8042a0135472f84bf31f84",
        source_full_equality_sha256=
            "80150212fdac704f000be5303610bd2e21cd39019c042499109d6ccb9163a1e2",
        core_equality_sha256=
            "ffa9527e4da39baf97500d41fad26f80c74cc6d5f50c545f7ae4b74c3176584f",
    ),
    "source-indexed-unit-core-654-10" => (
        target="normalized_source_indexed_unit_core_654_10_anchor1_9",
        output="unit_core_source_indexed_654_10_certificate.json",
        rows=(
            (0, (1, 2, 4, 8, 9)),
            (1, (3, 6, 9, 10)),
            (4, (0, 1, 5, 6)),
            (8, (1, 4, 7, 10)),
            (10, (2, 6, 7, 11)),
            (11, (0, 6, 8, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "32dc36bf895a7efde161adcf4890ab84b380d7269a6517fae9dfcfd998671095",
        source_full_equality_sha256=
            "8310c147fde77e03e8ce06069ec096784c9a1490b960f13bc5afc75881e40c4f",
        core_equality_sha256=
            "0375b3c66ab9cdd927bd829d2865c3e6f911c43af001f0fee4eb3912cd9f86b7",
        point_relabeling_old_to_new=(2, 0, 3, 4, 5, 6, 7, 8, 9, 1, 10, 11),
    ),
    "source-indexed-unit-core-654-11" => (
        target="normalized_source_indexed_unit_core_654_11",
        output="unit_core_source_indexed_654_11_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (7, (2, 5, 9, 11)),
            (9, (0, 5, 6, 8)),
            (10, (3, 6, 7, 11)),
            (11, (1, 4, 8, 10)),
        ),
        expected_raw_identity_sha256=
            "edc95118c3f4baa3475d6d9a20b0f681e1ef09db566cafd58171b8ea874dfe8b",
        source_indexed_signature_sha256=
            "65dc597ac2f6714bfd3262924f7e2490e49224831efd0538eb29b6561864c76f",
        source_full_equality_sha256=
            "e130ab20da96caaf6336a5a8487e80c75278945fc1a007742959d23985c4120e",
        core_equality_sha256=
            "da0eead0a09a25cb33bdb0e25ffab185e2008a73acf36085b6ee2acc7cadd197",
    ),
    "source-indexed-unit-core-654-12" => (
        target="normalized_source_indexed_unit_core_654_12_shift1",
        output="unit_core_source_indexed_654_12_certificate.json",
        rows=(
            (0, (1, 3, 4, 6)),
            (3, (0, 1, 2, 11)),
            (9, (0, 3, 8, 10)),
            (10, (3, 5, 9, 11)),
            (11, (0, 1, 7, 9)),
        ),
        expected_raw_identity_sha256=
            "2f50c97a0bb435953258e0be7e62a6700013e0e3c7a253364fc842de1b27aee3",
        source_indexed_signature_sha256=
            "98fca73afa640c8218cb668256f1d1b88c413ffe0c53e758bdc813de7c663874",
        source_full_equality_sha256=
            "e787a1b9d983db81765ce168bbf008622806898d651dabb032436772f9319c69",
        core_equality_sha256=
            "1eb18900bd27b1fbe664cf077778a7621b8e154d4509a66878d0060caf820dd6",
    ),
    "source-indexed-unit-core-654-13" => (
        target="normalized_source_indexed_unit_core_654_13_shift2",
        output="unit_core_source_indexed_654_13_certificate.json",
        rows=(
            (1, (0, 3, 6, 7)),
            (6, (1, 5, 7, 8)),
            (7, (0, 4, 8, 10)),
            (8, (1, 4, 7, 11)),
            (11, (1, 4, 6, 9)),
        ),
        expected_raw_identity_sha256=
            "4dc9171c22866766e04d92a3aa530f7bb559484da0103a713d519a7389b95a25",
        source_indexed_signature_sha256=
            "af501736354a6236584b5b6a1faf34429eac96385f14b4b6ede92269f0c40c34",
        source_full_equality_sha256=
            "87fa9263d05456fadda7f001bd9b4a5ca0388a0c446153acc29adfacdb355bd9",
        core_equality_sha256=
            "e21da3d0279ef886db35f50c551b1d65d71e244051ad752233722d863281e5d4",
    ),
    "source-indexed-unit-core-654-14" => (
        target="normalized_source_indexed_unit_core_654_14",
        output="unit_core_source_indexed_654_14_certificate.json",
        rows=(
            (0, (1, 2, 3, 4)),
            (2, (0, 1, 10, 11)),
            (3, (1, 5, 6, 9)),
            (4, (2, 3, 7, 10)),
            (5, (2, 4, 6, 11)),
            (6, (4, 5, 9, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "d0733e36a7f0f2f6928dfb899b00a2cc2dbc6a9ac535cbb5ba5925214cfbc71c",
        source_full_equality_sha256=
            "5c1d5a97feb03575e1cdbf9f00a2e982361762c2db3b570bb04b2ab44bdaf463",
        core_equality_sha256=
            "9f519a7eee7ed3ddd337387c115771fd0fb5cee3e3d0c14ef8c1fd3530bee27b",
    ),
    "source-indexed-unit-core-654-15" => (
        target="normalized_source_indexed_unit_core_654_15_shift1",
        output="unit_core_source_indexed_654_15_certificate.json",
        rows=(
            (0, (1, 3, 4, 6)),
            (1, (2, 4, 7, 10)),
            (3, (0, 1, 2, 11)),
            (4, (2, 5, 7, 8)),
            (5, (3, 4, 7, 11)),
            (11, (0, 1, 7, 9)),
        ),
        expected_raw_identity_sha256=
            "0d57b9226712c4dc277d17739b88dcb6ee0d5289e150a0677221f64f77ec9e17",
        source_indexed_signature_sha256=
            "ed0f21360796d0677fd4a582b7872ec3c0c263c726d886cb892e89418b53b826",
        source_full_equality_sha256=
            "1fbb9f435d924300499a00c221d79d35ec60e3ed425211bd89001755c3be2766",
        core_equality_sha256=
            "5ff208234fe0ee7c67a87d45a918b964569b2d4b2e24bf6482735208a5f42ebe",
    ),
    "source-indexed-unit-core-654-16" => (
        target="normalized_source_indexed_unit_core_654_16_shift2",
        output="unit_core_source_indexed_654_16_certificate.json",
        rows=(
            (0, (2, 3, 5, 9)),
            (1, (0, 4, 5, 7)),
            (4, (0, 1, 2, 3)),
            (5, (3, 7, 8, 9)),
            (6, (2, 5, 7, 10)),
            (8, (1, 4, 5, 6)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "fe73aaed9e10c94f15e21416554f881de48103fe361f2a06592ef7dabe209a44",
        source_full_equality_sha256=
            "116c7125207a37ee1ff7f208fa63702c1bc6749f6f7de3087009d7d8c2613396",
        core_equality_sha256=
            "2ef0d773c86163a7daf674a171ebbb618a56ec111c1699a7f4bf2fd4f69a4b5c",
    ),
    "source-indexed-unit-core-654-17" => (
        target="normalized_source_indexed_unit_core_654_17_shift1",
        output="unit_core_source_indexed_654_17_certificate.json",
        rows=(
            (0, (1, 3, 6, 9)),
            (1, (2, 4, 6, 10)),
            (2, (5, 8, 9, 10, 11)),
            (3, (0, 1, 2, 11)),
            (5, (0, 3, 4, 10)),
            (6, (3, 5, 7, 11)),
        ),
        expected_raw_identity_sha256=
            "03c0f21c5d6c089584feb594086bc450077be0faf86346e79caee052043fc6bf",
        source_indexed_signature_sha256=
            "2d77c9d9ad49c273c28e0f3bdd7795f9f1d8529efc42515d106a6093afffde2e",
        source_full_equality_sha256=
            "de79dc2243c70b18f70069b4b8af3098555402da22c97a383df5d38da59e67de",
        core_equality_sha256=
            "8b5bbc8b24dc1db3e6033ed72141c0f3df3f52047f1117ee55f2dc02409aaa6d",
    ),
    "source-indexed-unit-core-654-18" => (
        target="normalized_source_indexed_unit_core_654_18_shift1",
        output="unit_core_source_indexed_654_18_certificate.json",
        rows=(
            (0, (1, 2, 5, 10)),
            (1, (2, 4, 6, 8)),
            (2, (0, 7, 8, 9, 10)),
            (3, (0, 1, 6, 11)),
            (5, (3, 4, 6, 10)),
            (6, (2, 3, 8, 11)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "eae2e5c9ec98a8de006ed5a947c1808fcb809dd05916b44835c47e097f5c6e8a",
        source_full_equality_sha256=
            "85be9576a5032c86fe12fc1f3530575bfdc70b6e78f4097f021fe115205974f5",
        core_equality_sha256=
            "22567ec6cae7d4e1937a9ed2f9e78a7feaab1f0070d9b8767edc8680ac424a39",
    ),
    "source-indexed-unit-core-654-19" => (
        target="normalized_source_indexed_unit_core_654_19_shift4",
        output="unit_core_source_indexed_654_19_certificate.json",
        rows=(
            (0, (1, 6, 7, 11)),
            (5, (0, 1, 3, 9, 11)),
            (7, (5, 8, 10, 11)),
            (8, (3, 6, 7, 10)),
            (9, (1, 4, 8, 10)),
            (11, (0, 4, 9, 10)),
        ),
        expected_raw_identity_sha256=
            "b035db7272254ffd325dd36dfad2b45c6fd63025e495d97973dbb5c347fcfcc7",
        source_indexed_signature_sha256=
            "7aeb94f35719f6dffc6121daee4c56f124ddaaa483c5e4566fc31450db562cf4",
        source_full_equality_sha256=
            "6aa5f063c376a466e0d4c107abf7e3f46ace96000eb88bcb4c3e5cc655450bad",
        core_equality_sha256=
            "b28969dc483b9b10c9c6f75842a4a0719f74bfe0dc84fa13e7760a94c6e74f36",
    ),
    "source-indexed-unit-core-654-20" => (
        target="normalized_source_indexed_unit_core_654_20_shift2",
        output="unit_core_source_indexed_654_20_certificate.json",
        rows=(
            (0, (2, 3, 6, 8)),
            (1, (0, 3, 5, 7)),
            (4, (0, 1, 2, 3)),
            (5, (0, 4, 6, 10)),
            (6, (1, 4, 5, 9)),
            (7, (1, 6, 8, 10)),
        ),
        expected_raw_identity_sha256=
            "084c437950ede8da77dab5ab97d9a7279b229e1c2d4118f7f1c812b6d0c94760",
        source_indexed_signature_sha256=
            "690bbaf7c366cbda69f9287ff51ee1eec1b8dd8ca7bd2fc53c2cbe05540bf8f1",
        source_full_equality_sha256=
            "b194fd240661f26861e3c664c2543d6f001d9e94bdc99c391deeb8dbe2bb7c0d",
        core_equality_sha256=
            "868139a70cfbb175b428750d8accad2f5ecef1f96fec51b9c533b61b97f71e19",
    ),
    "source-indexed-unit-core-654-21" => (
        target="normalized_source_indexed_unit_core_654_21_shift1",
        output="unit_core_source_indexed_654_21_certificate.json",
        rows=(
            (0, (1, 3, 5, 9)),
            (3, (0, 1, 2, 11)),
            (5, (3, 4, 8, 11)),
            (7, (1, 5, 6, 8)),
            (8, (3, 6, 9, 11)),
            (11, (1, 2, 6, 7)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "6cfc4866799c3dc88a0e5546339ca0b0c23f856a1236b9471de562f3c687a5a5",
        source_full_equality_sha256=
            "8fcef37fe0f195afe741796df84394461883c74bbe84e731814b0e403dc5e0d9",
        core_equality_sha256=
            "600a3cad16d335265148d03151fa459a52036644e5a07f9e2fb0b2742f098b6c",
    ),
    "source-indexed-unit-core-654-21-anchor-1-3" => (
        target="normalized_source_indexed_unit_core_654_21_anchor_1_3",
        output="unit_core_source_indexed_654_21_certificate.json",
        rows=(
            (1, (0, 2, 3, 11)),
            (2, (0, 1, 5, 9)),
            (5, (1, 4, 8, 11)),
            (7, (0, 5, 6, 8)),
            (8, (1, 6, 9, 11)),
            (11, (0, 3, 6, 7)),
        ),
        expected_raw_identity_sha256=
            "847f5b22a9ef00b6af5a03b9e13963ee5aeccaa6213a160b0c3c64312893f5c5",
        source_indexed_signature_sha256=
            "6cfc4866799c3dc88a0e5546339ca0b0c23f856a1236b9471de562f3c687a5a5",
        source_full_equality_sha256=
            "8fcef37fe0f195afe741796df84394461883c74bbe84e731814b0e403dc5e0d9",
        core_equality_sha256=
            "80ca63aed7a7b3ea804d48e7fb8783c51e43a49b1b0c2b79c1cccecc6d1a3784",
        point_relabeling_old_to_new=(2, 0, 3, 1, 4, 5, 6, 7, 8, 9, 10, 11),
    ),
    "source-indexed-unit-core-654-21-anchor-3-11" => (
        target="normalized_source_indexed_unit_core_654_21_anchor_3_11",
        output="unit_core_source_indexed_654_21_certificate.json",
        rows=(
            (0, (1, 2, 3, 4)),
            (1, (3, 4, 7, 8)),
            (2, (0, 3, 6, 10)),
            (6, (0, 1, 5, 9)),
            (8, (3, 6, 7, 9)),
            (9, (0, 1, 7, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "6cfc4866799c3dc88a0e5546339ca0b0c23f856a1236b9471de562f3c687a5a5",
        source_full_equality_sha256=
            "8fcef37fe0f195afe741796df84394461883c74bbe84e731814b0e403dc5e0d9",
        core_equality_sha256=
            "8f261d90e406142ed30551a88acb38cae09cbc42931b9a5a8bd8c61e290f4793",
        point_relabeling_old_to_new=(2, 3, 4, 0, 5, 6, 7, 8, 9, 10, 11, 1),
    ),
    "source-indexed-unit-core-654-22" => (
        target="normalized_source_indexed_unit_core_654_22_shift6",
        output="unit_core_source_indexed_654_22_certificate.json",
        rows=(
            (1, (0, 4, 8, 10)),
            (2, (1, 3, 5, 8)),
            (3, (1, 4, 9, 11)),
            (4, (2, 6, 7, 9)),
            (7, (1, 2, 3, 4, 10)),
            (10, (0, 1, 6, 9)),
        ),
        expected_raw_identity_sha256=
            "823b4056f3f4eb320f6500845fdddf83d501ff40e0bb40b7e0dffb1a918a4ec1",
        source_indexed_signature_sha256=
            "0c91f4aa7448b4794e200941047b17dd114383bd4fabd45c81be37ff537649e8",
        source_full_equality_sha256=
            "e3952686e6ba50c8ca365fd937ff6af1787abd32f2094a247b7d4c1bc691c714",
        core_equality_sha256=
            "bb23793b18de6e68d432ce14e1d7b14eb3c40344232ed76d4899867e7b3960fd",
    ),
    "source-indexed-unit-core-654-23" => (
        target="normalized_source_indexed_unit_core_654_23_shift1",
        output="unit_core_source_indexed_654_23_certificate.json",
        rows=(
            (0, (1, 2, 4, 9)),
            (1, (0, 4, 7, 10)),
            (2, (5, 8, 9, 10, 11)),
            (4, (2, 6, 7, 9)),
            (5, (1, 4, 7, 8)),
            (7, (0, 5, 6, 8)),
        ),
        expected_raw_identity_sha256=
            "7159e2d5846ad56ec26b4f4afcf7aa45b2dde7ca7997677334095d84266393a5",
        source_indexed_signature_sha256=
            "165d702ae8aca79c118c27e8ef4afaf85051ccb704aa4f41e58c732d050b3531",
        source_full_equality_sha256=
            "e72fd9b678db3a7940a743dfaf341e83e83d86a29a6e2eb01491a2a38c504aaa",
        core_equality_sha256=
            "ace7e1dfe7cd2f9a6c252318c3fc2e0bdca6b55b6f0dfff3c6b736717ff00958",
    ),
    "source-indexed-unit-core-654-24" => (
        target="normalized_source_indexed_unit_core_654_24_shift0",
        output="unit_core_source_indexed_654_24_certificate.json",
        rows=(
            (0, (1, 2, 4, 5)),
            (1, (4, 7, 8, 9, 10)),
            (3, (1, 5, 6, 8)),
            (4, (0, 3, 6, 9)),
            (5, (3, 4, 7, 11)),
            (7, (0, 4, 6, 8)),
        ),
        expected_raw_identity_sha256=
            "b778397ade22ef196c3c921213448d679842a4b672ae65ee6c05083fb01816a8",
        source_indexed_signature_sha256=
            "f6a95b8cf2256482dad27d2d7bfbffc211773def5ed908e59fb064c49952e3dd",
        source_full_equality_sha256=
            "0862803d363d3bf20399c2ad965ff94dedb7fbffe6e3d6b75f669d3c1e701938",
        core_equality_sha256=
            "c9d63bf42a1ce4f40139ccffb1b5a363025cd10a345e11af304b1466bef7a3b2",
    ),
    "source-indexed-unit-core-654-25" => (
        target="normalized_source_indexed_unit_core_654_25_shift0",
        output="unit_core_source_indexed_654_25_certificate.json",
        rows=(
            (1, (0, 6, 7, 8, 9)),
            (7, (3, 4, 6, 8)),
            (8, (2, 6, 9, 10)),
            (9, (0, 1, 5, 6)),
            (10, (1, 3, 8, 11)),
            (11, (1, 4, 7, 10)),
        ),
        expected_raw_identity_sha256=
            "b1a6d31f1d7244598a33e390408d4f131a786016a18c9fea42165ef15b19498b",
        source_indexed_signature_sha256=
            "13a801c85a81443212a03487768484fec69545a61aa17ddcf695902cc5b3f1bd",
        source_full_equality_sha256=
            "b0396b406792067487cd7a7cc15d488ac1df665ab3243a58c7c9d20dde2627df",
        core_equality_sha256=
            "ed83b65752302c6a3a3921e01013a3ce176ffbcf9d2ae85cd63cfbce975c59dc",
    ),
    "source-indexed-unit-core-654-26" => (
        target="normalized_source_indexed_unit_core_654_26_shift2",
        output="unit_core_source_indexed_654_26_certificate.json",
        rows=(
            (0, (1, 2, 6, 8)),
            (1, (0, 3, 6, 7)),
            (2, (0, 5, 8, 10)),
            (4, (0, 1, 2, 3)),
            (5, (1, 4, 6, 11)),
            (6, (3, 5, 8, 11)),
        ),
        expected_raw_identity_sha256=
            "c83b00b05b9f9fd590bad683571597f98486d76707b6528d919df6d6f2cebab2",
        source_indexed_signature_sha256=
            "97e7617d7a823c76bf1898f45831441ec258741cb421096973fe513cfa184871",
        source_full_equality_sha256=
            "c8d7e9c0bff0a6fed47648e82c3d6bcdbb805a9a69ce65869ae2a8328a3171b4",
        core_equality_sha256=
            "55a2a122caaabf713275d7f3e3369cf8cf15e8b8134db5fff4cc4d61ab345683",
    ),
    "source-indexed-unit-core-654-27" => (
        target="normalized_source_indexed_unit_core_654_27_shift0",
        output="unit_core_source_indexed_654_27_certificate.json",
        rows=(
            (0, (1, 3, 6, 9)),
            (1, (4, 7, 8, 9, 10)),
            (3, (1, 5, 6, 8)),
            (4, (2, 3, 5, 10)),
            (5, (0, 4, 6, 7)),
            (9, (0, 3, 5, 7)),
        ),
        expected_raw_identity_sha256=
            "4106dfe7e3924779edc5ccadf02093bdde678d9c0fe7d8098ae85211c2c0b731",
        source_indexed_signature_sha256=
            "cbbdba56a459e197a1b66c1ef763226607fb160dc358da0b1f56c5dfb1c9c546",
        source_full_equality_sha256=
            "afe2b3a75ecc7ca5428b9dcdadb9aaf9d40d8fdabdcdc56c534e77d3e5b9b14b",
        core_equality_sha256=
            "1462da443a07ffd4ca669dec37f9a2d5a1f94e573a3ac25807f585d1c3793a86",
    ),
    "source-indexed-unit-core-654-28" => (
        target="normalized_source_indexed_unit_core_654_28_shift0",
        output="unit_core_source_indexed_654_28_certificate.json",
        rows=(
            (0, (3, 5, 7, 10)),
            (1, (0, 6, 7, 8, 9)),
            (2, (0, 4, 10, 11)),
            (3, (4, 5, 8, 11)),
            (4, (2, 3, 5, 9)),
            (5, (1, 2, 8, 10)),
            (9, (0, 1, 5, 6)),
        ),
        expected_raw_identity_sha256=
            "27def8ba53ac864577d4673d21999a47cbb2989b939ca299ac73cc6c5fc83f96",
        source_indexed_signature_sha256=
            "2193c4e99a0b5a74fdc6063d0303a1ee2c763092bd1089e727ea03a27b18abbb",
        source_full_equality_sha256=
            "4753cfb4a178d36790e90debb25c3ba766339f27fe1f9830ad3ba2d2eb656f9f",
        core_equality_sha256=
            "f476fc0644c24b4e05635b548935c0a2c67a0c018287c40e390bc73cb8fa13f6",
    ),
    "source-indexed-unit-core-654-29" => (
        target="normalized_source_indexed_unit_core_654_29_shift4",
        output="unit_core_source_indexed_654_29_certificate.json",
        rows=(
            (0, (1, 4, 10, 11)),
            (2, (0, 3, 4, 7)),
            (3, (4, 5, 8, 9)),
            (4, (1, 5, 7, 10)),
            (5, (0, 1, 2, 8, 11)),
            (11, (0, 3, 6, 8)),
        ),
        expected_raw_identity_sha256=
            "e97a43f8648631faed145050f55995a7d35cd7f1b84aee772dd16c0b385edbe1",
        source_indexed_signature_sha256=
            "1df28045e5ff28efce426e583b1a91c9c6c7d44ebb4b8fba60f5c05c55539f06",
        source_full_equality_sha256=
            "44d9be326fd20e95923d7ba9b7dfdd57a3f60fbe27b86419ae358c09e9959849",
        core_equality_sha256=
            "a3a4ebe5916823344529289c617bb9fda5c4cfc456a2cb4e473aace65b449334",
    ),
    "source-indexed-unit-core-654-30" => (
        target="normalized_source_indexed_unit_core_654_30_shift2",
        output="unit_core_source_indexed_654_30_certificate.json",
        rows=(
            (0, (3, 4, 6, 11)),
            (1, (0, 3, 7, 8)),
            (2, (0, 5, 8, 11)),
            (3, (2, 7, 9, 10, 11)),
            (4, (0, 1, 2, 3)),
            (8, (1, 4, 7, 10)),
        ),
        expected_raw_identity_sha256=
            "29d23bb4e61fead5681317203b83c68c71fd1bd5868638fcc917b6ef37b4dd9b",
        source_indexed_signature_sha256=
            "aa280141e67587bb2469edf5f7353e7d40fd5c190b7f9ffdddd369996ee5d427",
        source_full_equality_sha256=
            "4c9769449e49c0273948619026c31914424c0e22480d272023b172ff7f84bae9",
        core_equality_sha256=
            "f53af9f97960aefe224e29759789ca68f759598cb1fa13ffed058ea598fbe74f",
    ),
    "source-indexed-unit-core-654-31" => (
        target="normalized_source_indexed_unit_core_654_31_shift3",
        output="unit_core_source_indexed_654_31_certificate.json",
        rows=(
            (0, (1, 6, 9, 11)),
            (1, (2, 3, 7, 11)),
            (3, (0, 4, 6, 7)),
            (4, (0, 1, 8, 10, 11)),
            (11, (0, 3, 6, 10)),
        ),
        expected_raw_identity_sha256=
            "87ab512ed728d6abd3a420116298a06d4600e269c84a87e28e57f35b9d307f5f",
        source_indexed_signature_sha256=
            "f4cdafa2a8dc8ced434956d7d3c3de15a018debfa007a1c2682130fb160e1743",
        source_full_equality_sha256=
            "a873ba65bd01b9be6f790148cfae0488f533c44a6dc3f7c461977eee95a54623",
        core_equality_sha256=
            "3358af57a198c7650fdc7a7a85611ea16fc4d79745f32b9532cbf70bfe8fc824",
    ),
    "source-indexed-unit-core-654-32" => (
        target="normalized_source_indexed_unit_core_654_32_shift1",
        output="unit_core_source_indexed_654_32_certificate.json",
        rows=(
            (0, (1, 2, 7, 9)),
            (2, (0, 6, 8, 9, 10)),
            (6, (5, 7, 10, 11)),
            (8, (3, 6, 9, 11)),
            (9, (1, 3, 4, 7)),
            (10, (0, 3, 5, 9)),
            (11, (0, 1, 4, 6)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "5a5aa787c20c80ab925ddce78566db7016e6f5aebcabd7da137559db88244a4a",
        source_full_equality_sha256=
            "cdfad014b20762ba75ff6dbc2f196a57dfa219b5607a3dda30ba0d621b0c2b98",
        core_equality_sha256=
            "1eccfa864a15925b629c7c21795e0dfd86a0c9fa43c63874f4800ab7726ddef5",
    ),
    "source-indexed-unit-core-654-33" => (
        target="normalized_source_indexed_unit_core_654_33_shift9",
        output="unit_core_source_indexed_654_33_certificate.json",
        rows=(
            (0, (1, 3, 5, 10)),
            (1, (0, 3, 4, 11)),
            (2, (0, 1, 5, 9)),
            (3, (2, 5, 8, 11)),
            (4, (2, 3, 6, 9)),
            (5, (1, 4, 6, 8)),
        ),
        expected_raw_identity_sha256=
            "237b9d2f41912438eb91c54b548d7535106265070fea4c1ce5ec10369e154404",
        source_indexed_signature_sha256=
            "55ecb75515dd620ed4e1783024e35af739ffa01ccd3078a352e211410b22273e",
        source_full_equality_sha256=
            "04fc74ff945e4b83527b0252dea123b2e3852ff490f24185f0b6cea7a0972949",
        core_equality_sha256=
            "8a23f9b8f4579ff92b03cc97eca0da29d169e3932e5744e392b1790dae68bb27",
    ),
    "source-indexed-unit-core-654-34" => (
        target="normalized_source_indexed_unit_core_654_34_shift4",
        output="unit_core_source_indexed_654_34_certificate.json",
        rows=(
            (0, (1, 4, 10, 11)),
            (1, (6, 7, 9, 11)),
            (2, (0, 3, 4, 7)),
            (4, (1, 5, 7, 10)),
            (5, (0, 1, 2, 8, 11)),
            (11, (0, 3, 8, 10)),
        ),
        expected_raw_identity_sha256=
            "82c9b4b44979e98d6a657e6728a9e9e13ddf88be36944bf580818e2ba2b80572",
        source_indexed_signature_sha256=
            "0010ea6b2981fb2ff839be8fc506747ff0844593e7e8c2353c00704825c33a57",
        source_full_equality_sha256=
            "cc652578dd4855a063cefcb1efb44cb25ab6848d2b1a963be5b13975df238f4d",
        core_equality_sha256=
            "6d96f1287c6e18f66755db087382580ed3ec32372c8b4f67e27efa4da842e546",
    ),
    "source-indexed-unit-core-654-35" => (
        target="normalized_source_indexed_unit_core_654_35_shift8",
        output="unit_core_source_indexed_654_35_certificate.json",
        rows=(
            (0, (2, 6, 10, 11)),
            (1, (0, 2, 3, 7)),
            (2, (1, 4, 7, 10)),
            (3, (1, 5, 8, 11)),
            (4, (3, 5, 7, 10)),
            (5, (0, 1, 6, 10)),
        ),
        expected_raw_identity_sha256=
            "e81b944c18c074162c50e571f21800f44d46cb1aaf70e67da1e5db1081f2aab7",
        source_indexed_signature_sha256=
            "c8a2f3a15cf477ed1c092831d13f16f16e3a48f848058362dd56d8c4d7f730e7",
        source_full_equality_sha256=
            "918e2def5d6b909aa76594924f06573bd07db00293e3830d0ce39a39e79e0ac5",
        core_equality_sha256=
            "1413cd1ca70e271cae7b05fa6e95118baa52946b45d82257a6ec4e111ddb4ea0",
    ),
    "source-indexed-unit-core-654-36" => (
        target="normalized_source_indexed_unit_core_654_36_shift2",
        output="unit_core_source_indexed_654_36_certificate.json",
        rows=(
            (0, (1, 2, 7, 11)),
            (6, (1, 4, 5, 7)),
            (7, (1, 6, 8, 9)),
            (8, (2, 5, 7, 10)),
            (9, (1, 4, 8, 10)),
            (10, (4, 5, 6, 11)),
            (11, (0, 7, 8, 10)),
        ),
        expected_raw_identity_sha256=
            "b735ebcfd3a0f5ae7a600108776da28c9ca64b95fca0f9152c32f2dcc76b02e5",
        source_indexed_signature_sha256=
            "0d1bf311c1f4c53b5e7bd59ca9bf3a86f1cd4a9311515a92393fe834bd61e9ae",
        source_full_equality_sha256=
            "7bf2e9804b5c15cbce19684c7b115cd42613315497786189a4d6194fabc69019",
        core_equality_sha256=
            "f1722bd7729640d1eab34c9cefafdc8a951c720350fd656e424a70abcc50799e",
    ),
    "source-indexed-unit-core-654-37" => (
        target="normalized_source_indexed_unit_core_654_37_shift2",
        output="unit_core_source_indexed_654_37_certificate.json",
        rows=(
            (1, (0, 5, 6, 11)),
            (4, (0, 1, 2, 3)),
            (7, (0, 6, 8, 9)),
            (8, (0, 4, 5, 7)),
            (9, (4, 6, 7, 10)),
            (10, (2, 5, 9, 11)),
            (11, (1, 4, 5, 8)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "e3d1b562d612d35574b8c09b0eb0f820083eafa2abf747a9a8cf971d081705e2",
        source_full_equality_sha256=
            "d5402453630747df288e2a7c80717754d9f218ba86698619649a75b2029e84ca",
        core_equality_sha256=
            "d4d849a580d74aee924757ffe1e0353f4f972ee5f0035ba629feaab441773a95",
    ),
    "source-indexed-unit-core-654-38" => (
        target="normalized_source_indexed_unit_core_654_38_shift2",
        output="unit_core_source_indexed_654_38_certificate.json",
        rows=(
            (0, (1, 2, 6, 8)),
            (4, (0, 1, 2, 3)),
            (6, (0, 4, 5, 8)),
            (7, (2, 5, 6, 10)),
            (8, (1, 4, 7, 9)),
            (9, (3, 4, 6, 7)),
        ),
        expected_raw_identity_sha256=
            "0b0eb013671f26b761093cf498ab33486bb6bebeef4a787def1047d901570c99",
        source_indexed_signature_sha256=
            "78f0fccae0b2f750f733591a9ec8011aca28f673bfb867f1951b7e81ed01c1d5",
        source_full_equality_sha256=
            "9690ff279eec46380c80147e62d22812a12aff1d5640bc422378819d5880767a",
        core_equality_sha256=
            "3ae01075cb449d207964691690180b26b3d3221ef8a34cd7e2eba5055f5bd5c3",
    ),
    "source-indexed-unit-core-654-39" => (
        target="normalized_source_indexed_unit_core_654_39_shift2",
        output="unit_core_source_indexed_654_39_certificate.json",
        rows=(
            (0, (1, 6, 8, 11)),
            (6, (1, 5, 8, 9)),
            (7, (4, 6, 8, 10)),
            (8, (4, 5, 7, 11)),
            (9, (2, 5, 8, 10)),
            (11, (0, 4, 7, 9)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "12c2e483c95fe6175b8506e386878806ff4275d48e3f3220ace8e820c3829bda",
        source_full_equality_sha256=
            "463bf88b99a100020a803427f471e036d022f78fe7f80e660e2c1a55e0a98a61",
        core_equality_sha256=
            "3e4716d1b8b2f8157a5e1a6e4230d6ffcbc927789cfead60bee9ffc457821233",
    ),
    "source-indexed-unit-core-654-40" => (
        target="normalized_source_indexed_unit_core_654_40_shift0",
        output="unit_core_source_indexed_654_40_certificate.json",
        rows=(
            (1, (0, 5, 7, 8, 9)),
            (6, (2, 3, 5, 9)),
            (7, (2, 5, 8, 11)),
            (8, (6, 7, 9, 10)),
            (9, (1, 4, 5, 10)),
            (10, (0, 2, 3, 6)),
        ),
        expected_raw_identity_sha256=
            "f6261397e05a9a4aa86f9542aec0f05ef693529462b34f6980c066854b008f86",
        source_indexed_signature_sha256=
            "afbde5899e9e170fcf7abdb47907e2c9db02a8a9cf536461d0c2a64b97fc0c39",
        source_full_equality_sha256=
            "2cf803036e559ed07e082d32035a3a972495e2b437db5016f18ff5f95fd69f83",
        core_equality_sha256=
            "ffde43c9d3ac811227b8dda3084d9f9eb61931a1b25ef3d8a117f03c09853e6a",
        point_relabeling_old_to_new=(2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 10, 11),
    ),
    "source-indexed-unit-core-654-41" => (
        target="normalized_source_indexed_unit_core_654_41_shift0",
        output="unit_core_source_indexed_654_41_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (3, 6, 7, 9)),
            (9, (0, 2, 3, 4)),
            (10, (0, 1, 5, 6)),
            (11, (1, 3, 8, 10)),
        ),
        expected_raw_identity_sha256=
            "98820dc9c54395f0bebdd3095f965f6421a9bb12053bcb80be3634f4c727a305",
        source_indexed_signature_sha256=
            "0392366851f0aaca3f5d2c3009ab43b080d3f03beeb0e2aa90c15e5e52da6a26",
        source_full_equality_sha256=
            "ac6f4ed79049ae15ee15e0cd414a84168e44ee5596e48dc036f022f3f2be1bcc",
        core_equality_sha256=
            "407b26d022749528e27cf0d4b90ce5ff7ea6b52b7bc70f96794337b93cbf93c8",
    ),
    "source-indexed-unit-core-654-42" => (
        target="normalized_source_indexed_unit_core_654_42_shift2",
        output="unit_core_source_indexed_654_42_certificate.json",
        rows=(
            (0, (1, 2, 7, 11)),
            (1, (0, 3, 5, 8)),
            (2, (3, 6, 7, 9)),
            (3, (0, 4, 9, 10, 11)),
            (4, (0, 1, 2, 3)),
            (6, (1, 4, 5, 7)),
        ),
        expected_raw_identity_sha256=
            "f92a05ddc35d335e17d7aaa2bd2c86bad31e39df7826f4f1196dd84cb65e63c7",
        source_indexed_signature_sha256=
            "d3aae93e0b70df73a5a6c6d6d9563cf52ef785f162848560c9996657a2a5550b",
        source_full_equality_sha256=
            "d0128f407a7f553731ab3757aab72cd877bdec0c0c11f393ce8bf6184646b52e",
        core_equality_sha256=
            "851cc6f2165ab6f5c748497781d2fd39ee3806c50c4d4597e0b895c7ec7cc0c6",
        point_relabeling_old_to_new=(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1),
    ),
    "source-indexed-unit-core-654-43" => (
        target="normalized_source_indexed_unit_core_654_43_shift0",
        output="unit_core_source_indexed_654_43_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (6, 7, 9, 11)),
            (9, (0, 2, 3, 4)),
            (10, (0, 1, 5, 6)),
            (11, (1, 3, 7, 10)),
        ),
        expected_raw_identity_sha256=
            "09d06be47700d200c4852836767177d852be3de8a4a702e0c5c169a8fd4b6c0a",
        source_indexed_signature_sha256=
            "28a7aebecda7969dc35d989757ab7adee67571d5e66de3b5d9e79083e2f8d1b0",
        source_full_equality_sha256=
            "761857eb74b72caa45e36397b1d9a214e827d8e03970118370d95ff303eca3a4",
        core_equality_sha256=
            "b2b832861d062fdf9c4787b9cee27733c5013c199dc688bc47de8f26f7c61dbc",
    ),
    "source-indexed-unit-core-654-44" => (
        target="normalized_source_indexed_unit_core_654_44_shift2",
        output="unit_core_source_indexed_654_44_certificate.json",
        rows=(
            (0, (1, 2, 6, 8)),
            (1, (2, 5, 7, 9)),
            (2, (3, 5, 8, 11)),
            (3, (0, 6, 9, 10, 11)),
            (4, (0, 1, 2, 3)),
            (6, (0, 4, 5, 8)),
        ),
        expected_raw_identity_sha256=
            "cebcb788adb677089421d10d166d2a0abc1c7ddf5de3f5f746e33c7cac51a695",
        source_indexed_signature_sha256=
            "5c195f57028f8499b652f8855d8557227a43a93a02bc3e3ddece3bb5504216ee",
        source_full_equality_sha256=
            "6cdcd79deaab4c44f90973a47f3dede0f798a21aba14ab98a02ed2b7e836d76c",
        core_equality_sha256=
            "78d86fa38af94973e2cc748c3b09d855b9a2ed4b7f3d3697642de646dcdae150",
        point_relabeling_old_to_new=(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 1),
    ),
    "source-indexed-unit-core-654-45" => (
        target="normalized_source_indexed_unit_core_654_45_shift0",
        output="unit_core_source_indexed_654_45_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (2, 6, 9, 11)),
            (10, (0, 1, 5, 6)),
            (11, (1, 3, 9, 10)),
        ),
        expected_raw_identity_sha256=
            "8007b48d2c36c30604d5878b4499e46df2a08330e74c1e9317eea29c25dd6c63",
        source_indexed_signature_sha256=
            "8273a44e94bb399e68186cd606cc7e73bb80c39758ab9b8cf79f660e3a868fdb",
        source_full_equality_sha256=
            "4eb5d0b8a503f6ae518cadafae01dc606cb353c8d5995c1289fd1ff3fe27451e",
        core_equality_sha256=
            "907860e23d88eb2f7f1f8ff506f6c9ff6c31f699b0e7f1f7537cf1b75af0eca8",
    ),
    "source-indexed-unit-core-654-46" => (
        target="normalized_source_indexed_unit_core_654_46_anchor8_9",
        output="unit_core_source_indexed_654_46_certificate.json",
        rows=(
            (0, (1, 8, 9, 11)),
            (1, (0, 4, 6, 11)),
            (6, (4, 5, 8, 10)),
            (8, (4, 7, 9, 11)),
            (9, (1, 4, 5, 7)),
            (11, (2, 3, 6, 7)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "b55979797ff527d57a36f6e6b1ef30347b55c50b43eba9e106802305ab35b905",
        source_full_equality_sha256=
            "f007f483dd56bb78b37ab63a9e8beb1cf600e5dacb0864472666be1f647cafa2",
        core_equality_sha256=
            "e020c408ae96d7daa2674fead6282c3c80cd2a6f86e9934bf81caec4db91ac63",
        point_relabeling_old_to_new=(2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 10, 11),
    ),
    "source-indexed-unit-core-654-47" => (
        target="normalized_source_indexed_unit_core_654_47_shift0",
        output="unit_core_source_indexed_654_47_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (8, (2, 4, 9, 11)),
            (9, (0, 2, 3, 6)),
            (10, (0, 1, 5, 6)),
            (11, (4, 5, 9, 10)),
        ),
        expected_raw_identity_sha256=
            "0f34d517464404286576bdb228f40588de2c5bd631736bdbaa79787c381f366e",
        source_indexed_signature_sha256=
            "24c674a0f324ce9c435e1ec7516566b3982b48d3536564a426b4782d760d2b45",
        source_full_equality_sha256=
            "bfcf685d1c40112312f26d87df3a314378c251905ac7ea7d9d9d52a7bb322dc5",
        core_equality_sha256=
            "f355dc18d8515a63d589f48cbea997749e1b9778ab5513ca5f7ad1806f1d49cd",
    ),
    "source-indexed-unit-core-654-47-alt" => (
        target="normalized_source_indexed_unit_core_654_47_alt_shift0",
        output="unit_core_source_indexed_654_47_alt_certificate.json",
        rows=(
            (0, (3, 4, 8, 10)),
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (4, (1, 3, 5, 7)),
            (5, (1, 4, 6, 8)),
            (7, (2, 5, 8, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "24c674a0f324ce9c435e1ec7516566b3982b48d3536564a426b4782d760d2b45",
        source_full_equality_sha256=
            "bfcf685d1c40112312f26d87df3a314378c251905ac7ea7d9d9d52a7bb322dc5",
        core_equality_sha256=
            "7613d9a69172b033e2936265c5ef595e66f10f33afb3530cd605934cdee25091",
    ),
    "source-indexed-unit-core-654-48" => (
        target="normalized_source_indexed_unit_core_654_48_anchor1_9",
        output="unit_core_source_indexed_654_48_certificate.json",
        rows=(
            (1, (0, 4, 7, 8, 9)),
            (3, (1, 5, 6, 7)),
            (7, (2, 6, 9, 11)),
            (8, (1, 3, 7, 9)),
            (9, (0, 3, 4, 5)),
            (11, (1, 4, 6, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "ffa4b7a6d4a8becf15b8b0bc8a69c4b9f361882d34d74f42577135642146d55a",
        source_full_equality_sha256=
            "3d99d260f0c69eb65ec5a2267b7fc1a67f938dfdfca3b6bf0b2d8d66b939b80b",
        core_equality_sha256=
            "56bfa3781c59e322a1bcf3859fff43777178a2f0e11338c6ea941ca4afeeaf47",
        point_relabeling_old_to_new=(2, 0, 3, 4, 5, 6, 7, 8, 9, 1, 10, 11),
    ),
    "source-indexed-unit-core-654-49" => (
        target="normalized_source_indexed_unit_core_654_49_shift0",
        output="unit_core_source_indexed_654_49_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (7, (2, 5, 8, 10)),
            (9, (0, 2, 3, 6)),
            (10, (0, 1, 5, 6)),
            (11, (4, 5, 9, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "1b1ca643f68ab8f3a3b000de92bb928b795311fcc306168f7d879bc4cf964946",
        source_full_equality_sha256=
            "d6fe7d363ac6c5147bd54b2275b2ace1631bc8f792e4c235e041f468c1b8638b",
        core_equality_sha256=
            "880c827190a6e0816cb3fb1c104890425e9d341db316bbf018736bb0f4bc7711",
    ),
    "source-indexed-unit-core-654-49-alt" => (
        target="normalized_source_indexed_unit_core_654_49_alt_shift0",
        output="unit_core_source_indexed_654_49_alt_certificate.json",
        rows=(
            (0, (3, 4, 7, 10)),
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (4, (1, 3, 5, 7)),
            (5, (1, 4, 6, 9)),
            (7, (2, 5, 8, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "1b1ca643f68ab8f3a3b000de92bb928b795311fcc306168f7d879bc4cf964946",
        source_full_equality_sha256=
            "d6fe7d363ac6c5147bd54b2275b2ace1631bc8f792e4c235e041f468c1b8638b",
        core_equality_sha256=
            "9bc0e5c98b518aa504c729729395aa3fcb19d3af3f918061f7eba17a585c12b0",
    ),
    "source-indexed-unit-core-654-50" => (
        target="normalized_source_indexed_unit_core_654_50_shift0",
        output="unit_core_source_indexed_654_50_certificate.json",
        rows=(
            (0, (1, 3, 4, 8)),
            (1, (0, 6, 7, 8, 9)),
            (7, (4, 6, 8, 10)),
            (8, (3, 5, 7, 9)),
            (9, (0, 2, 3, 6)),
            (10, (0, 2, 4, 5)),
            (11, (1, 5, 6, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "c4082af4f60579cd30eeb9f622f89cafa952f54eeb976d36f4c93628a1a3c10e",
        source_full_equality_sha256=
            "b3c4e4e99037a5d1b5a6a222d43231a38a8d6b542c139115bfbfc784f62bd340",
        core_equality_sha256=
            "5b349963d36cbbf8e3f756f660920ec475fe66040c09bf95c794a85e553cb0cb",
    ),
    "source-indexed-unit-core-654-50-alt" => (
        target="normalized_source_indexed_unit_core_654_50_alt_shift0",
        output="unit_core_source_indexed_654_50_alt_certificate.json",
        rows=(
            (0, (1, 3, 4, 8)),
            (1, (0, 6, 7, 8, 9)),
            (2, (0, 5, 10, 11)),
            (3, (1, 4, 9, 10)),
            (4, (1, 5, 8, 11)),
            (5, (2, 3, 7, 10)),
            (6, (2, 4, 9, 11)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "c4082af4f60579cd30eeb9f622f89cafa952f54eeb976d36f4c93628a1a3c10e",
        source_full_equality_sha256=
            "b3c4e4e99037a5d1b5a6a222d43231a38a8d6b542c139115bfbfc784f62bd340",
        core_equality_sha256=
            "e9b1400b6d918f63403d238404a56d081d086e88a8756727dfb045ad0d614d46",
    ),
    "source-indexed-unit-core-654-51" => (
        target="normalized_source_indexed_unit_core_654_51_anchor5_6",
        output="unit_core_source_indexed_654_51_certificate.json",
        rows=(
            (3, (1, 4, 9, 11)),
            (4, (2, 3, 5, 11)),
            (6, (1, 4, 5, 7)),
            (7, (2, 6, 8, 11)),
            (8, (2, 3, 4, 9)),
            (9, (0, 4, 6, 7)),
            (11, (0, 1, 6, 9)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "d72a3084c85705e52a8b4ae7d94a034be9dd295f01ae2c6f60910244a91a2693",
        source_full_equality_sha256=
            "fd74a4c41abe00978bd36ad8a8ff6a689105d19b6da52128abdea65e55608729",
        core_equality_sha256=
            "06cea78868b60e18a77261c485aa908258b448c2ee5cad03d0ee16a8e31a6996",
        point_relabeling_old_to_new=(2, 3, 4, 5, 6, 0, 1, 7, 8, 9, 10, 11),
    ),
    "source-indexed-unit-core-654-52" => (
        target="normalized_source_indexed_unit_core_654_52_anchor0_8",
        output="unit_core_source_indexed_654_52_certificate.json",
        rows=(
            (4, (2, 3, 7, 11)),
            (6, (2, 4, 5, 10)),
            (7, (2, 5, 9, 11)),
            (8, (0, 6, 7, 9)),
            (9, (2, 3, 8, 10)),
            (10, (0, 4, 6, 11)),
            (11, (0, 1, 5, 7)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "4fadacf2dfbd4b3cd52ca07df57dc799d42757145096964bf2168b9bb811aadd",
        source_full_equality_sha256=
            "e56220d14d0fdee808e7bc8fb9ed319405cc76473ca8e92547cc3f4ae6205557",
        core_equality_sha256=
            "b09f37c228681ae8429edf18cb063f95a4ca9b0df7907588f0aaf39719175160",
        point_relabeling_old_to_new=(0, 2, 3, 4, 5, 6, 7, 8, 1, 9, 10, 11),
    ),
    "source-indexed-unit-core-654-53" => (
        target="normalized_source_indexed_unit_core_654_53_shift0",
        output="unit_core_source_indexed_654_53_certificate.json",
        rows=(
            (1, (0, 2, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (7, (2, 5, 8, 10)),
            (10, (0, 1, 5, 6)),
            (11, (4, 5, 7, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "d38276179b47f5a004c8dc1f358ba756a574d7440eed20ed46276d2d0dda5891",
        source_full_equality_sha256=
            "13c4f9a60b286260cc06b83715a2cf356746e00838ee350aab17bbe37c2ec30b",
        core_equality_sha256=
            "9b20ba3f98168d896bf4e46b4e36782bd3f86746f251e727314afa9fe0be4c8d",
    ),
    "source-indexed-unit-core-654-54" => (
        target="normalized_source_indexed_unit_core_654_54_anchor0_8",
        output="unit_core_source_indexed_654_54_certificate.json",
        rows=(
            (0, (1, 3, 6, 9)),
            (1, (4, 7, 8, 9, 10)),
            (3, (1, 5, 6, 8)),
            (8, (0, 6, 7, 9)),
            (9, (2, 3, 8, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "4fadacf2dfbd4b3cd52ca07df57dc799d42757145096964bf2168b9bb811aadd",
        source_full_equality_sha256=
            "e56220d14d0fdee808e7bc8fb9ed319405cc76473ca8e92547cc3f4ae6205557",
        core_equality_sha256=
            "7080337b65009b7f91deaed1f89e7829d32b6bc532111e0d2b08ac085a5a6b68",
        point_relabeling_old_to_new=(0, 2, 3, 4, 5, 6, 7, 8, 1, 9, 10, 11),
    ),
    "source-indexed-unit-core-654-55" => (
        target="normalized_source_indexed_unit_core_654_55_anchor0_9",
        output="unit_core_source_indexed_654_55_certificate.json",
        rows=(
            (0, (3, 6, 9, 10)),
            (5, (4, 6, 7, 10)),
            (6, (2, 5, 9, 10)),
            (7, (2, 5, 8, 11)),
            (8, (4, 6, 9, 11)),
            (9, (0, 3, 5, 7)),
            (11, (1, 4, 5, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "b55e772af16bb1b14109d6ae5e497bf150852ebb1eeb864d51ff76ef1da7d4a9",
        source_full_equality_sha256=
            "1ea2e1edad070d8276a981f6458d6181e64de06a1ecefa8d3697cfff91eef624",
        core_equality_sha256=
            "eef5a457ced4c08f444da92e17a772991f4c32c2e3cd640eac7d3a0581e65bfd",
        point_relabeling_old_to_new=(0, 2, 3, 4, 5, 6, 7, 8, 9, 1, 10, 11),
    ),
    "source-indexed-unit-core-654-56" => (
        target="normalized_source_indexed_unit_core_654_56_anchor2_11",
        output="unit_core_source_indexed_654_56_certificate.json",
        rows=(
            (2, (0, 1, 10, 11)),
            (5, (1, 4, 6, 7)),
            (6, (2, 3, 7, 10)),
            (7, (4, 6, 9, 10)),
            (9, (0, 3, 4, 5)),
            (10, (1, 2, 5, 9)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "22a21a25e0c4e1fed4e6de53b7ee03927b6f763fe9b74c37ef594d75a11b2e0a",
        source_full_equality_sha256=
            "9552cdb5572bf588e440831e9ec6d1597067ef9bed53402cd4bee87b5cbf3012",
        core_equality_sha256=
            "b6e4c812179d920e493c5e91fea11eaafc58f3e570a506d0cc87c870272d633a",
        point_relabeling_old_to_new=(2, 3, 0, 4, 5, 6, 7, 8, 9, 10, 11, 1),
    ),
    "source-indexed-unit-core-654-57" => (
        target="normalized_source_indexed_unit_core_654_57_anchor4_6",
        output="unit_core_source_indexed_654_57_certificate.json",
        rows=(
            (0, (1, 3, 6, 9)),
            (1, (4, 7, 8, 9, 10)),
            (2, (0, 1, 10, 11)),
            (4, (2, 3, 9, 11)),
            (6, (2, 4, 5, 10)),
            (10, (0, 4, 6, 11)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "9669a150eed0597d9ced28dad91089e2ad9e25432bbf90b06faf20610d64d606",
        source_full_equality_sha256=
            "dfbf43b294e023624e7877a8e306a323af6276c16b0fcf94f739000b7bdc89a5",
        core_equality_sha256=
            "36563619831c7bcf64f0deaaddfe69b7609287588a000ee83d0ec167b6814228",
        point_relabeling_old_to_new=(2, 3, 4, 5, 0, 6, 1, 7, 8, 9, 10, 11),
    ),
    "source-indexed-unit-core-654-58" => (
        target="normalized_source_indexed_unit_core_654_58_anchor2_11",
        output="unit_core_source_indexed_654_58_certificate.json",
        rows=(
            (0, (2, 3, 6, 11)),
            (1, (0, 3, 7, 8, 9)),
            (2, (0, 1, 10, 11)),
            (3, (2, 4, 8, 11)),
            (11, (1, 6, 8, 10)),
        ),
        expected_raw_identity_sha256="",
        source_indexed_signature_sha256=
            "22a21a25e0c4e1fed4e6de53b7ee03927b6f763fe9b74c37ef594d75a11b2e0a",
        source_full_equality_sha256=
            "9552cdb5572bf588e440831e9ec6d1597067ef9bed53402cd4bee87b5cbf3012",
        core_equality_sha256=
            "471ec4a062f281bcc1535d08d46f80303329077842f60328fbbe4d52bd4d3781",
        point_relabeling_old_to_new=(2, 3, 0, 4, 5, 6, 7, 8, 9, 10, 11, 1),
    ),
)

length(ARGS) >= 1 || error(
    "usage: generate_exact_qq_row_core_certificate.jl CORE [OUTPUT] " *
    "[ROW_ORDER] [POINT_RELABELING] [CORE_HASH]",
)
const CORE_ID = ARGS[1]
haskey(SPECS, CORE_ID) || error("unknown core: $(CORE_ID)")
const SPEC = SPECS[CORE_ID]
const CLI_POINT_RELABELING = if length(ARGS) >= 4
    parse.(Int, split(ARGS[4], ","))
else
    nothing
end
if CLI_POINT_RELABELING !== nothing
    @assert sort(CLI_POINT_RELABELING) == collect(0:11)
end
const ROWS = if CLI_POINT_RELABELING === nothing
    SPEC.rows
else
    tuple(sort(
        [
            (
                CLI_POINT_RELABELING[center + 1],
                tuple(sort([
                    CLI_POINT_RELABELING[point + 1] for point in support
                ])...),
            )
            for (center, support) in SPEC.rows
        ],
        by=first,
    )...)
end
const CORE_EQUALITY_SHA256 =
    length(ARGS) >= 5 ? ARGS[5] : SPEC.core_equality_sha256
const ROW_ORDER = if length(ARGS) >= 3
    parse.(Int, split(ARGS[3], ",")) .+ 1
else
    collect(eachindex(ROWS))
end
@assert sort(ROW_ORDER) == collect(eachindex(ROWS))

const VARIABLE_NAMES = [
    "x$(label)$(coordinate)"
    for label in 2:11 for coordinate in ("x", "y")
]
R, x = AA.polynomial_ring(
    AA.QQ,
    VARIABLE_NAMES,
    internal_ordering=:degrevlex,
)

point(label) = if label == 0
    (0, 0)
elseif label == 1
    (1, 0)
else
    offset = 2 * (label - 2)
    (x[offset + 1], x[offset + 2])
end

d2(left, right) = begin
    p = point(left)
    q = point(right)
    (p[1] - q[1])^2 + (p[2] - q[2])^2
end

canonical_generators = typeof(x[1])[]
generator_names = String[]
row_generator_indices = Vector{Vector{Int}}()
for (center, support) in ROWS
    first_index = length(canonical_generators) + 1
    pivot = support[1]
    for member in support[2:end]
        push!(canonical_generators, d2(center, pivot) - d2(center, member))
        push!(generator_names, "ROW_$(center)_$(pivot)_$(member)")
    end
    push!(
        row_generator_indices,
        collect(first_index:length(canonical_generators)),
    )
end
internal_generator_indices = reduce(vcat, row_generator_indices[ROW_ORDER])
generators = canonical_generators[internal_generator_indices]

basis, change = G.groebner_with_change_matrix(
    generators,
    ordering=G.DegRevLex(),
    certify=true,
    linalg=:deterministic,
    tasks=4,
)
@assert change * generators == basis
@assert length(basis) == 1
@assert !iszero(basis[1]) && AA.is_constant(basis[1])

scale = inv(AA.leading_coefficient(basis[1]))
internal_certificate_row = scale * change[1, :]
certificate_row = fill(
    zero(internal_certificate_row[1]),
    length(canonical_generators),
)
for (internal_index, canonical_index) in enumerate(internal_generator_indices)
    certificate_row[canonical_index] = internal_certificate_row[internal_index]
end
@assert sum(certificate_row[i] * canonical_generators[i]
    for i in eachindex(canonical_generators)) == 1

raw_identity_terms = [
    "($(certificate_row[i]))*($(canonical_generators[i]))"
    for i in eachindex(canonical_generators)
    if !iszero(certificate_row[i])
]
raw_identity = join(raw_identity_terms, "+")
raw_identity_sha256 = bytes2hex(sha256(raw_identity))
println("computed_raw_change_identity_sha256=", raw_identity_sha256)
if !isempty(SPEC.expected_raw_identity_sha256)
    @assert raw_identity_sha256 == SPEC.expected_raw_identity_sha256
end

common_text(p) = replace(string(p), "//" => "/")
generator_texts = common_text.(canonical_generators)
multiplier_texts = common_text.(collect(certificate_row))
identity_terms = [
    "($(multiplier_texts[i]))*($(generator_texts[i]))"
    for i in eachindex(generators)
    if !iszero(certificate_row[i])
]
identity_text = join(identity_terms, "+")
normalized_identity_sha256 = bytes2hex(sha256(identity_text))

json_quote(s) = "\"" * replace(
    string(s),
    "\\" => "\\\\",
    "\"" => "\\\"",
    "\n" => "\\n",
    "\r" => "\\r",
    "\t" => "\\t",
) * "\""

output = length(ARGS) >= 2 ? ARGS[2] : joinpath(@__DIR__, SPEC.output)
open(output, "w") do io
    println(io, "{")
    println(io, "  \"schema\": \"p97-atail-qq-change-matrix-certificate-v1\",")
    println(io, "  \"target\": ", json_quote(SPEC.target), ",")
    println(io, "  \"coordinate_model\": \"p0_zero_p1_e1\",")
    println(io, "  \"core_id\": ", json_quote(CORE_ID), ",")
    println(io, "  \"source_indexed_signature_sha256\": ",
        json_quote(SPEC.source_indexed_signature_sha256), ",")
    println(io, "  \"source_full_equality_sha256\": ",
        json_quote(SPEC.source_full_equality_sha256), ",")
    println(io, "  \"core_equality_sha256\": ",
        json_quote(CORE_EQUALITY_SHA256), ",")
    println(io, "  \"raw_change_identity_sha256\": ",
        json_quote(raw_identity_sha256), ",")
    println(io, "  \"normalized_change_identity_sha256\": ",
        json_quote(normalized_identity_sha256), ",")
    println(io, "  \"internal_row_order_zero_based\": [",
        join((string(index - 1) for index in ROW_ORDER), ", "), "],")
    if CLI_POINT_RELABELING !== nothing
        println(io, "  \"point_relabeling_old_to_new\": [",
            join(string.(CLI_POINT_RELABELING), ", "), "],")
    elseif haskey(SPEC, :point_relabeling_old_to_new)
        println(io, "  \"point_relabeling_old_to_new\": [",
            join(string.(SPEC.point_relabeling_old_to_new), ", "), "],")
    end
    println(io, "  \"generator_stream_sha256\": ",
        json_quote(bytes2hex(sha256(join(generator_texts, "\n")))), ",")
    println(io, "  \"variables\": [",
        join(("    " * json_quote(v) for v in VARIABLE_NAMES), ",\n"), "\n  ],")
    println(io, "  \"rows\": [")
    for i in eachindex(ROWS)
        center, support = ROWS[i]
        suffix = i == lastindex(ROWS) ? "" : ","
        println(io, "    {\"center\": ", center, ", \"support\": [",
            join(support, ", "), "]}", suffix)
    end
    println(io, "  ],")
    println(io, "  \"generator_names\": [",
        join(("    " * json_quote(v) for v in generator_names), ",\n"), "\n  ],")
    println(io, "  \"generators\": [",
        join(("    " * json_quote(v) for v in generator_texts), ",\n"), "\n  ],")
    println(io, "  \"multipliers\": [",
        join(("    " * json_quote(v) for v in multiplier_texts), ",\n"), "\n  ],")
    println(io, "  \"identity\": \"1 = sum_i multipliers[i] * generators[i]\",")
    println(io, "  \"basis_count\": 1,")
    println(io, "  \"nonzero_multiplier_count\": ", length(identity_terms))
    println(io, "}")
end

println("classification=EXACT_QQ_CHANGE_MATRIX_UNIT")
println("core_id=", CORE_ID)
println("output=", output)
println("generator_count=", length(generators))
println("nonzero_multiplier_count=", length(identity_terms))
println("raw_change_identity_sha256=", raw_identity_sha256)
println("normalized_change_identity_sha256=", normalized_identity_sha256)
