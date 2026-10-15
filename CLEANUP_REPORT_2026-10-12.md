# Storage cleanup, October 12, 2026

Updated: 2026-10-13T21:40:53.5165795Z. The admitted cleanup runs are complete; further candidates remain held, and the **600 GB removal target is unmet**.

The requested target is at least 600 GB removed from the local MatterSyn folder. The fresh scans observed about 845 GB outside the main paper-collection folders; these are logical file sizes and do not establish that all of it is removable.

Completed target receipts and confirmed file-removal events establish **324,947,723,133 logical bytes (324.948 GB)** and **6,951,560 files** removed since this request. Earlier cleanup events are excluded. An unfinished scope receives only individually confirmed removals from a fixed journal prefix; intents and holds receive zero credit. Prefix snapshots replace older observations of the same scopes; final receipts reconcile those events and are never added a second time.

The 10 event prefixes were observed at 2026-10-13T06:50:56.014675+00:00; later removals are not inferred.

C: free space at the start of this cleanup request: 11,985,891,328 bytes (observed 2026-10-12 16:12:58 UTC). Latest Root observation: **84,779,479,040 bytes free at 2026-10-13T21:40:53.5165795Z**. Free-space changes also reflect other disk activity; logical bytes removed are reported separately.

For the owner-approved unused 4B model cleanup, C: free space was 146,323,890,176 bytes before and 150,663,954,432 bytes after. The verified model removal was 4,280,404,704 bytes; concurrent disk activity explains why the free-space delta differs.

| Scope | Finished targets | Removed files | Removed bytes | Receipt SHA256 |
|---|---:|---:|---:|---|
| SourceR4_confirmed_file_events | 0 | 833,135 | 37,544,653,478 | `96e3166b679c5d5a8778e8380a8526d626a79f811e610991d5e4c3772debda39` |
| Remaining000R4_confirmed_file_events | 0 | 457,093 | 13,284,988,824 | `160e2d8b13e8c9dcc71aeacf4defd0957a28e19b851b7b208e3fc21e738ccf70` |
| Remaining100R4_confirmed_file_events | 0 | 393,564 | 12,357,545,609 | `8a9a0cfe7b2fca88231813b8052589b0264ecda97543bf2795f45d56113d854f` |
| Remaining200R6_confirmed_file_events | 0 | 199,078 | 5,770,075,434 | `797d9fd334e82fa92095c1df0c4001354fb50f1ef839e6b64813749e4b4f6f50` |
| Remaining300R4_confirmed_file_events | 0 | 223,121 | 8,042,687,698 | `2bea04eed04d16b4b774006bcc043a0df17ee722672ab2996704a9e5a7a1b175` |
| Remaining400R6_confirmed_file_events | 0 | 306,768 | 12,405,635,277 | `111a099c5b334a834d2dc6a32048eb5717bb3ff4ae5095c52109b554eda6954b` |
| Remaining500HistoricalR6_confirmed_file_events | 0 | 296,789 | 17,921,116,664 | `4033d0f461bbe427ace1796aecf9b77539a450b85db7a6ff1bccb4965aea8f50` |
| Remaining600CurrentPublicR6_confirmed_file_events | 0 | 141,703 | 8,478,700,553 | `c5900714751452f474060f76cd48b2f3bd70dedfd44df39b3cd4eb134b996e8e` |
| Remaining700CurrentPublicR6_confirmed_file_events | 0 | 173,950 | 7,336,274,518 | `576359756eb02d6e6d88019545ef2185561982d2f8c140153850645c6739e61e` |
| Remaining800EndCurrentPublicR6_confirmed_file_events | 0 | 66,327 | 2,369,702,769 | `9f45df34f8fac8f111a4351e7fa0a5b4a11eb6a2b8663b9758fd63469b4b9901` |
| cleanup-method | 211 | 20,383 | 1,034,692,961 | `908e2f6f69d6766345b821ea0af6dc3dbf29ef98c835b9e524e94cca9b7acb57` |
| fresh-generated-manifest-cleanup | 27 | 658,414 | 38,526,809,482 | `411f7c54a95ffa1e13badaf6c7500bc02039a82f9edb891100b99d359b83c7a1` |
| fresh-generated-manifest-cleanup | 84 | 1,062,533 | 53,740,105,881 | `2d4c57b356c4d1d6c1621fcfea5ee2853b894f3582092cad31244c102d6e8dca` |
| fresh-public-static-cleanup | 4 | 68,012 | 4,501,779,457 | `f24de4389492e1eddb6510dec32ff38581953279854fa3d34358587bc88dbbcb` |
| root-bulk-frozen-r1 | 18 | 297,289 | 17,224,803,393 | `2d03a0087c6245c4535fddf7c72082b4b0ab984a634edd89acf0176613a315f3` |
| root-small-frozen-r1 | 131 | 632,549 | 24,729,351,970 | `eb5ab497e828f1a8b3b7a79fb1b436880e9e554b4991b36b33edf87a107726b2` |
| disjoint-static34-executable | 34 | 378,928 | 12,321,856,608 | `6046596df83d1f40e6177d23d4f6dcb3c0ce948b6f632646bb913aff460336f3` |
| remaining-generated-dist-executable-r2 | 125 | 0 | 0 | `a5861ca56f91778f8524cc80c3cf2e5f4bab005f9564c7cb792c88c86fdd4fd7` |
| native-http-held-executor-r1 | 1 | 0 | 0 | `7832797a6035a925a8e691344c20de2545ff32d79f2088b109e9cbb284cbb9ab` |
| owner_approved_unused_4b | 1 | 1 | 4,280,404,704 | `0768c2343ec50c97f67a256cb4efcbc025b5cab27fad3be604b0c7b633998bf2` |
| obsolete_checkout_20 | 1 | 8,355 | 561,004,239 | `bfb67d0a0c5026865cfbb0449fc5f7933d418dd594119400df9c2179c07bb8b9` |
| obsolete_checkout_21 | 1 | 8,646 | 621,432,042 | `755390d066748312a98d2f79ff060a021667b7c9c75c6da8e2de06be1d2e236e` |
| obsolete_checkout_22 | 1 | 8,474 | 611,069,826 | `d35dbe00ef07b7d601f29ad90e62f156823be3cfea897d3926d28e509a7ebd43` |
| obsolete_checkout_23 | 1 | 8,372 | 322,450,687 | `4a8df5c219735271fcf128b2a959a84dc637422e97112f30e0b085090fc26457` |
| obsolete_checkout_24 | 1 | 8,653 | 506,772,583 | `96372b4dfe475828f461e1b1b041a6f2001e694830ed6af8829d45c6f87f4928` |
| obsolete_checkout_25 | 1 | 8,403 | 607,114,370 | `d3a269988afa3f2bd73a0c6bdb7a6cfd16ef39252028795f148490320ebd6933` |
| obsolete_checkout_26 | 1 | 8,317 | 601,673,562 | `e06537e5e1077198635fd9bfc61bff3fc5ea92dc762c2909cead7fc1de280fec` |
| obsolete_checkout_27 | 1 | 8,362 | 604,173,405 | `bb53fcc88687ad1ed3ef5cb7c2ff50b81521096616cbda5a2288d5d7e14a0e5e` |
| obsolete_checkout_28 | 1 | 8,312 | 560,281,719 | `5b6fcfa2735989d52f7e354aebd4757fe9a6cf3befbb59ed89cc74f2564cdfa5` |
| obsolete_checkout_29 | 1 | 9,132 | 698,716,492 | `b34905800f284da09a2ddcc53c6244c98339967982b0236f23f116a0b427e032` |
| obsolete_checkout_30 | 1 | 8,678 | 627,090,876 | `a14d0e99e0b0925395e9c20e5202c299ef7f0b7c64764fd26a2273302968b71d` |
| obsolete_checkout_31 | 1 | 8,323 | 560,790,418 | `4354b6c048aa9d36abf9e76d7ab60bd62eeb836c670a595aa1514317b953219e` |
| obsolete_checkout_32 | 1 | 8,898 | 685,071,054 | `deed5b6daed16db55f302b9f02e626dfe1375631fcc909d222fc9dadfc451833` |
| obsolete_checkout_33 | 1 | 8,839 | 672,784,466 | `58affaaebb1dde07fcd29fff4866ef7d725b6d96ccb287b1846d8a9502faad55` |
| obsolete_checkout_34 | 1 | 8,323 | 550,861,203 | `c06c95928b30dd15b21ccaaf743637358415f054204576a3975887e21e45efb7` |
| obsolete_checkout_35 | 1 | 8,356 | 552,231,426 | `ceff8a38e2b195f860c7c9c87759f1dfafda3d303cbcb050868a8ec021fdea56` |
| obsolete_checkout_36 | 1 | 8,324 | 560,620,893 | `255d335cc7f7ccfdfee8115e9344849462fa984b029f9d25049417e49da079d2` |
| obsolete_checkout_37 | 1 | 9,068 | 695,304,424 | `fb53700d7f38db014bc258fa56a00aad2eed45f1b34ed68329fe29918ec5cabf` |
| obsolete_checkout_38 | 1 | 8,573 | 616,342,382 | `1dcdd2fe75531b6594b29e83aabf2e0a3772857fe8b0425e5602eb775e2c4c85` |
| obsolete_checkout_39 | 1 | 8,647 | 485,962,612 | `ce229b8980c79543c5c3e574ca130646a87e4a9f52a8b278594470d4f8ae55c5` |
| obsolete_checkout_40 | 1 | 8,619 | 618,964,714 | `e97b7d971399ccbc74fe5482a47baae0725553c515e1107d0b8d8d7701f0f369` |
| obsolete_checkout_41 | 1 | 5,636 | 463,029,630 | `e32f46be08e579de1c7d60d44390ac2630577b68209df3460e2414b35908d73d` |
| obsolete_checkout_42 | 1 | 7,201 | 533,747,986 | `b7aa957ee2823ada66268c6991dbbd799c2c5c5ab3b820de6978de3c157c3cea` |
| obsolete_checkout_43 | 1 | 8,977 | 631,234,286 | `c98355fcdcb228f39a3d6eb540153512c695dc8e69b3d4bbf2c3cfff375a7f7b` |
| obsolete_checkout_44 | 1 | 26,117 | 1,834,843,306 | `483815ad654ebedc983f743016fda05a6084b57c8bd5827030deea505eb6a794` |
| obsolete_checkout_45 | 1 | 8,532 | 559,791,723 | `041fcd3366d83b9b8889de697885a2f1153bec191fed1db938ae36610018cb3a` |
| obsolete_checkout_46 | 1 | 8,536 | 560,675,765 | `514688731fbf68f26eecaa2014f1df1558423f278f5dc2e93911432960076c1f` |
| obsolete_checkout_47 | 1 | 8,403 | 607,114,370 | `ae3b07aa978b98eb7a1370fb367fc55df7a6af998a60797f102c39261e2e8e74` |
| obsolete_checkout_48 | 1 | 8,983 | 688,927,148 | `c3b806f6923aa72e11dd9a0ddf4f25d8a78db3c8bdeec98d2acc2c1cdf887fda` |
| obsolete_checkout_49 | 1 | 8,660 | 623,537,874 | `71c007801d6971ed3bbd254a9ea935183a052bacfc71589ff8f4a02e114ce051` |
| obsolete_checkout_50 | 1 | 8,568 | 562,382,259 | `5ad0db2bac3fddfe9b974b994b08ed1467918bf42f1277e6fceabd41115cba53` |
| obsolete_checkout_51 | 1 | 5,760 | 468,128,755 | `8b3395353da3ebb2b53449465e918e591d4094871c45e3a83ee2a452d6ea60d9` |
| obsolete_checkout_52 | 1 | 8,536 | 560,675,765 | `70dd91332213d49252c0b1c20ea6e6aca87d8f8b307863b8bfb0672a4218aa99` |
| obsolete_checkout_53 | 1 | 8,538 | 614,641,672 | `bed51d56306014d499fe8c420afedf14c7e4d2c58c65aa1c0869f6bcf6d9c8a9` |
| obsolete_checkout_54 | 1 | 8,534 | 558,983,860 | `cc76b89da0cbc889b483be60fb62c3847ea1a5663191e788774f93439330001b` |
| obsolete_checkout_55 | 1 | 8,844 | 353,943,620 | `7aa05ff8512dd5d8774ec996fdb8476a9f37a78b30d897f7ab7ae528185359b1` |
| obsolete_checkout_56 | 1 | 17,361 | 923,679,620 | `f7a25185ceb70dd283e9852c9981fdafcaf99430d12972f6c5ca71254c89d232` |
| obsolete_checkout_57 | 1 | 8,985 | 688,958,495 | `ac243b474ef29e67571fbc983f460cbee7ed993cca8d56cafc499278912c12af` |
| obsolete_checkout_58 | 1 | 8,982 | 648,436,345 | `6a8891e97b1b7a5c47726617c850c2830580f0d7dbb88753c9e6bc77baab8166` |
| obsolete_checkout_59 | 1 | 8,980 | 648,491,091 | `58e77d0cb6467bd1aec8c1b301909c38e896a43122c196570e59b17dfe543606` |
| obsolete_checkout_60 | 1 | 8,843 | 353,445,303 | `5c742fa4e4aef1622f725a8330f98b6b3e384a71d3c9eca9b10e806ea2d4f186` |
| obsolete_checkout_61 | 1 | 8,315 | 601,608,581 | `1c7da085220f493c565cfc693e553626e1d6b9df2fd17614b6f01c23a3ac182a` |
| obsolete_checkout_62 | 1 | 8,397 | 564,563,657 | `dbd03223164bd7d72f439bf57a44fbd8b4eda6f02cde594b66754f6e4d2a80f4` |
| obsolete_checkout_63 | 1 | 7,198 | 524,427,956 | `768c6ef5ff0fe64e007205871a6d6b3235e6a40ca2204c2658a665da83fb8ed1` |
| obsolete_checkout_64 | 1 | 8,302 | 601,010,781 | `f340544114a62150b47c133a28d609338a533da11e275976babaf3c0b979d286` |
| obsolete_checkout_65 | 1 | 8,766 | 645,727,964 | `e61480e37da5ef7c424227f42e04e657b025cb187592a2b260a5064a117213f8` |
| obsolete_checkout_66 | 1 | 8,647 | 485,962,612 | `3c175c166a597465c0a39f659e970b5c1243b8c542f3125a5813b18f6f973184` |
| obsolete_checkout_67 | 1 | 5,188 | 470,264,812 | `b71153745a79987d8877cacba36617ac01b10abe1b8e485834abe5d3277f8dbd` |
| obsolete_checkout_68 | 1 | 8,603 | 574,704,273 | `558d5ddc0eca3834617bdaa9dbee83fd250e125a5c5439d1ee204687d4c4644c` |
| obsolete_checkout_69 | 1 | 8,324 | 560,620,893 | `be12ff07d49abf8fb8b94132f23f88a42679fb22e7041db9b7dd5dc352ba5b5a` |
| obsolete_checkout_70 | 1 | 8,312 | 560,281,719 | `e30f6ad04abe69dfd8f93f54d32ff574b0dbf79ab84967a566f1ce88ca865fdd` |
| obsolete_checkout_71 | 1 | 8,396 | 563,687,330 | `26df43654705e6f9f1431731037cace439f2b65dc2b43ab3a006a5b78d85a412` |
| obsolete_checkout_72 | 1 | 8,329 | 602,413,496 | `12d24d9f563abfdad2b3ee254ff9e30bb5a9eac1d8236afdc4208575beaf32bf` |
| obsolete_checkout_73 | 1 | 8,142 | 314,920,312 | `9e86ce28dafafc35dcd1c64f0d086c0921b4de78ee348144eb7ead81a21538c8` |
| obsolete_checkout_74 | 1 | 8,356 | 552,229,734 | `ee427f71914a80fbc1eb1520943d216364de5f58b839b6974b57c9dac4771e07` |
| obsolete_checkout_75 | 1 | 8,535 | 559,821,373 | `94f7d61845538f913dfe610884441a07e9150082244781c293cff40e671165be` |
| obsolete_checkout_76 | 1 | 8,196 | 592,262,522 | `f0f03ef611b233049a93547348a50863811e39e2452b32706910262e3016da08` |
| obsolete_checkout_77 | 1 | 8,268 | 553,967,433 | `d35eed0792bc2ca42e74020e7c62c7bf59b4534b4a39d1390ee7b90eed9840f1` |
| obsolete_checkout_78 | 1 | 8,733 | 633,800,109 | `f1cd3ac71bcf57675650c3ce970362967b99e6199ea541432c8ac1a6d37bd495` |
| obsolete_checkout_79 | 1 | 8,511 | 558,778,140 | `8c80910b1d8a842c5417561a8b12c96d25f139661a1e2cd7e4f4f6d16c71f12c` |
| obsolete_checkout_80 | 1 | 8,329 | 602,413,495 | `cb7a5675ad61790aec486e183fd7fbcdeababbf1204693b6ea141b71f71731af` |
| obsolete_checkout_81 | 1 | 8,357 | 562,085,509 | `274abe677c909bda72bc2718b45abeefc4e55ab371edf43ff1a23ea1876004b3` |
| obsolete_checkout_82 | 1 | 8,741 | 635,011,022 | `efb4d174e95243d33168adef7c35d6aeb09b666214324165a423b370670137c6` |
| obsolete_checkout_83 | 1 | 8,403 | 607,114,370 | `b4c5488013d52da879c421b292f3a1a6952a642cb1d7d609ac77ed8c2dca5bd0` |
| obsolete_checkout_84 | 1 | 8,983 | 648,455,600 | `ed0f162369205b9cf2a4891bc849ac817c35fe8c229a628e82e67a2a6ba0ac97` |
| obsolete_checkout_85 | 1 | 8,398 | 565,130,579 | `9bde182727d4661cac579ee47bc8b45dfa4176315a0b9876fdfbe009a3510739` |
| obsolete_checkout_86 | 1 | 8,362 | 604,175,097 | `53490a2cbb73b0329b1be5ead263a12d3c4a85e1f7ac630ad76a080b4b0e477a` |

Necessary publication-safe material is retained in GitHub. Regenerable caches and verified redundant copies are deleted directly. Original papers, quoted text/pass/pair files, unique private evidence, the active local model and current working repositories remain local. Detailed paths, audits, patches, model payloads and source text are excluded from this public report.

Automatic approval rejected removal of one worktree whose name indicates pending integration; it remains intact. Other verified scopes continue. No website review status, sampling denominator or release gate changes.

Two old preview programs retain generated cleanup folders; neither was stopped. Their identities and folder details were provided privately in chat. Automatic approval rejected publishing those local host details to public GitHub; that disclosure was left out.

Two obsolete-copy attempts conservatively retained files because their native volume-ID comparison used a narrower representation than the scan. Both attempts were stopped and their unchanged journals confirm zero removals. A full-width same-handle identity correction passed focused tests and an actual metadata probe, and its new cleanup attempts are running; no identity check is bypassed.

The earlier official-metadata model/download attempt failed DNS before removal and remains preserved with zero credit. The owner later explicitly authorized removal of the unused, re-downloadable Qwen3-4B Q8 model: one SHA256-verified file, 4,280,404,704 logical bytes, was removed. The recorded active Qwen3-32B server identity was unchanged before and after; no program was stopped or restarted. The old Vulkan download remains parked. No Ollama CLI, process or default/environment installation was found, so no Ollama removal is claimed.

## Completed cleanup metadata compression, October 13

Five completed cleanup metadata spools/journals were compressed locally with full decompressed byte-count/SHA verification before the redundant uncompressed copies were removed through exclusive held handles. All original content remains recoverable locally. No paper, page-text, pass, pair, model, scientific audit, current working checkout or running programme was changed.

The original files held 6,056,119,856 bytes; their retained lossless archives hold 596,268,609 bytes, a net file-size reduction of **5,459,851,247 bytes (5.46 GB)**. This is compression savings, separate from the 321,822,006,915 logical bytes of confirmed deleted redundant material; it adds zero raw-removal credit. The 600 GB target remains unmet.

C: free space was 174,906,949,632 bytes before this compression and 180,374,134,784 bytes after; concurrent cleanup and other disk activity also affect that difference. Later observation: 180,422,107,136 bytes free. The additional B14/B15 exact-public copy cleanup remains in progress and is not yet added to this total.

Administrative aggregate SHA256: `fe0c1d3d6e7398857593448f2330edc84e0adc5a596d1511892461a085102825`. Detailed local host paths and payloads remain off public GitHub.


<!-- cleanup-b14-b15-r4-receipt-sha256:fd2c011596435ee59a8eca95a40abbee35aff06b53af0ee1cec47294a67dac62 -->
## B14/B15 cleanup completion — 2026-10-13

The completed run removed **3,125,716,218 bytes (3.126 GB)** across **154,182 files**. It held 179,899 files; no files were missing. No directories or processes were removed or stopped, and Source/Site changes were zero. The original read-only scan remains recorded as failed; this update credits only the completed disposition receipt.

Confirmed cumulative cleanup accounting is **324,947,723,133 bytes (324.948 GB)** across **6,951,560 files**. The requested 600 GB removal target remains unmet by **275,052,276,867 bytes (275.052 GB)**.

Local lossless metadata compression remains separate: **5,459,851,247 bytes** of net file-size reduction, with every original byte retained in verified local archives. This is not added to removed-byte or removed-file accounting. The preceding compression record and report history are preserved unchanged.

Current C: free space at 2026-10-13T12:32:45.140149+00:00: **181,709,901,824 bytes (181.710 GB)**. This is a point-in-time observation, not a cleanup recovery measurement.

Administrative proof SHA256: `fd2c011596435ee59a8eca95a40abbee35aff06b53af0ee1cec47294a67dac62`. Compression aggregate SHA256: `fe0c1d3d6e7398857593448f2330edc84e0adc5a596d1511892461a085102825`.


<!-- cleanup-proof-compression-r2-receipt-sha256:9d0eb7fb5b4ba0baf19492a97efc5a15f53f56ac500b3a57e5cfff776a903d15 -->
## Additional retained-metadata compression — 2026-10-13

Three completed proof-metadata spools, **6,849,886,935 bytes**, are retained in verified local gzip archives totaling **538,721,572 bytes**. Fresh archive SHA256 checks match the saved recovery receipts; every original byte remains recoverable locally.

This pass reduced file sizes by **6,311,165,363 bytes (6.311 GB)**. Together with the first pass's **5,459,851,247 bytes**, cumulative local compression reduction is **11,771,016,610 bytes (11.771 GB)**. Compression adds zero removed-content credit.

Confirmed logical removals remain **324,947,723,133 bytes (324.948 GB)** across **6,951,560 files**. The 600 GB removal target remains unmet. Previous report fields and history are preserved unchanged.

Current C: free space at 2026-10-13T14:10:37.598852+00:00: **168,471,433,216 bytes (168.471 GB)**. This is a point-in-time observation; concurrent disk activity can affect free space.

Administrative receipt SHA256: `9d0eb7fb5b4ba0baf19492a97efc5a15f53f56ac500b3a57e5cfff776a903d15`. Fresh verification addendum SHA256: `d4204967427c1cd78ac99b705642711a39895ea4ae25b5ca8dcf1072ed46b87e`.


## Subsequent delivery and current storage observation

Root observed C free space of **145,718,960,128 bytes at 2026-10-13T17:08:45.5103146Z**. The initial observation was 11,985,891,328 bytes, so the measured net increase between those observations is 133,733,068,800 bytes. Builds and concurrent disk activity continued during this interval; this net change is distinct from logical removal accounting.

Confirmed removal remains **324,947,723,133 logical bytes / 6,951,560 files**, including the earlier unused 4B model removal. Lossless compression savings remain a separate **11,771,016,610 bytes** with all original metadata content retained locally. **The 600 GB target remains unmet.** This update adds zero deletion credit.

All 20 known Python HTTP-preview process IDs were present at the storage observation. Their saved directory observations and exact launch receipts remain the folder authority; presence was checked without inventing a fresh process-directory read. No preview programme was stopped. The exact programme, PID, port and served-folder list is retained in the local `HELD_PREVIEW_FOLDERS_2026-10-13.private.md` report for the owner to close programmes deliberately. The active Qwen3-32B model, CUDA build and server remain protected.

One completed Batch 19 staging tree has metadata recovery proof for 35,342 files / 2,001,765,748 bytes. It has not been deleted: fresh native identity/consumer evidence is still required, and the older fixed-scope cleanup wrappers do not cover that tree. Unlisted or changed members receive no removal credit. The final predecessor build and served previews stay retained.

Batch 19 completed normal deployment and anonymous verification at **2026-10-13T16:35:31Z**, adding **26 papers / 33 records / 105 figure crops**. The live website contains **845 contributing papers / 3,902 canonical records / 1,781 displayed recipe–structure pairs**. Source b7217048be4cd05d7ad196c10a34959812c01a09 merged through PR37; Site 429387c95f263f0925d884c7cf0bd4d5d39f337a passed Pages run 38430512988 and 400 anonymous file probes with zero mismatches. No throughput or uninterrupted-work claim is made.

Batch 20 is separately prepared for normal release; it has no new live credit here. The audited lane and its owner questions remain paused. No PDF, page-text, pass or quoted pair file was deleted or uploaded by this cleanup.


## Dated storage observation while Batch 20 is being corrected

C free space was **125,944,041,472 bytes at 2026-10-13T17:56:40.0896920Z**, compared with **11,985,891,328 bytes** at the initial cleanup observation. The measured net increase is **113,958,150,144 bytes**; ongoing temporary release builds use disk space, so this is not a claim that all net change came from deletion.

Confirmed removal remains **324,947,723,133 logical bytes / 6,951,560 files**. Lossless compression savings remain separately **11,771,016,610 bytes**. This update adds zero deletion credit; **the 600 GB target is not met**.

All **21 known Python HTTP preview processes** were present, including the new Batch 20 preview. Their exact folder/port/PID list is in the local `HELD_PREVIEW_FOLDERS_2026-10-13.private.md` report, based on saved launch-directory evidence. No programme was stopped, and no fresh native CWD read is claimed. Protected Qwen3-32B server PID 32512 was also present. No PDF, page-text, pass or quoted pair file was deleted or uploaded.

Batch 14 through Batch 19 are live. Batch 20 has no new publication credit yet: visual review found stale author labels after citation correction. Root corrected only 11 new titles and their checksum dependencies, preserved every prior record, and used the existing exact digest-approval mechanism after a normal baseline guard rejected the first preparation. The failed attempt is retained. Corrected Source commit a65d047eaa4c5b4beae48280418dd4006ccc1991 is undergoing fresh complete local checks, browser review, CI and normal publication; no release gate was weakened.


## Dated storage and additional Batch 20 preview holds

Root measured C free space at **105,682,673,664 bytes at 2026-10-13T19:16:31.413241+00:00**. Against the initial 11,985,891,328-byte observation, the measured net change is **93,696,782,336 bytes**. Concurrent builds and other disk activity continue; this is separate from logical removal accounting.

Confirmed removal remains **324,947,723,133 logical bytes / 6,951,560 files**. Verified local lossless compression savings remain separately **11,771,016,610 bytes**. This report update adds zero deletion or compression credit; **the 600 GB target remains unmet**.

The private hold-register append contains **23 saved Python HTTP-preview owners**: the earlier 21 plus the corrected Batch 20 preview PID61416/port8882 and normal release preview PID64456/port8883. Their directory authority is the saved Root launch/owner receipts, not a fresh PID-presence or native CWD query. All listed preview folders remain held; no programme was stopped and no new cleanup scope was admitted. Protected Qwen3-32B/CUDA server PID32512 is untouched by this update. No original PDF, page-text, pass, quoted pair, training or private audit payload was deleted or uploaded.

The preserved Batch 20 preparation snapshot binds corrected Source `a65d047eaa4c5b4beae48280418dd4006ccc1991`, 33 proposed primary papers and 51 records, and `pushed: false`. Its local public boundary passed 35,844 files with zero failures. These preparation facts add no live credit. Actual final Source/Site/Pages/anonymous/ledger delivery evidence is required separately; no future result is inferred here. Earlier stale-label checks/correction, failed attempts, deployment warnings, audit questions and denominators remain unchanged in the historical report.


## Owner-requested unused-model cleanup and current workbench space

The unused MatterSyn Qwen3-4B Q8 file was removed first: **4,280,404,704 logical bytes**, already included in the cumulative deletion total below. Ollama and its requested 9B/27B installations were not found, so no Ollama removal is claimed. The active Qwen3-32B Q4_K_M model and llama.cpp CUDA server remain protected; no server or other programme was stopped or restarted. Other work remains untouched.

C free space was **11,985,891,328 bytes before cleanup** (October 12, 16:12:58 UTC). The earlier post-cleanup observation was **105,682,673,664 bytes** at October 13, 19:16:31 UTC. The current observation is **98,200,895,488 bytes at 2026-10-13T20:22:30.561219+00:00**. Builds continue to use workbench space; these observations are separate from logical-byte accounting. Confirmed cumulative removal remains **324,947,723,133 logical bytes / 6,951,560 files** and lossless compression savings remain separately **11,771,016,610 bytes**. This append adds zero deletion or compression credit; **the 600 GB target remains unmet**.

There are now **24 saved Python HTTP-preview owners**: the previous 23 plus the actual Batch 21 local-q preview PID42560, port8885. Its folder is in the owner's local hold register. The proposed port8884 was held by Windows System PID4; it was left alone and the preview used an unused port. The saved owner receipts establish the folder paths; this append makes no fresh native-CWD or all-process-presence claim. No protected page-text, pass, quoted pair, training, private audit or original PDF was deleted or uploaded.

Batch 20 has completed deployment and anonymous verification: 33 distinct papers, 51 records and 135 captioned crops. Batch 21's complete local checks passed, with 27 papers, 39 records and 105 captioned figures prepared; its publication remains pending in this dated observation. The separate audited lane remains paused.


## Final dated cleanup measurement and Batch 21 delivery

C free space is **84,752,220,160 bytes at 2026-10-13T21:32:11.129161+00:00**, compared with **11,985,891,328 bytes before cleanup**. The intervening peak and later observations remain above; new release builds consume workbench space. Cumulative deletion remains **324,947,723,133 logical bytes / 6,951,560 files**, including the unused 4,280,404,704-byte Qwen3-4B file. Lossless compression remains separately **11,771,016,610 bytes**. No new deletion or compression credit is added. **The 600 GB target remains unmet.**

The private folder register now lists **25 saved Python HTTP-preview owners**, including normal Batch 21 preview PID45548/port8886. Their exact folders are available to the owner locally so they can close the programs. No programme was stopped; no new all-PID presence or native-CWD assertion is made. The active Qwen3-32B model/CUDA server, other work, page-text/pass/quoted-pair/training/private-audit data and original papers remain untouched. Ollama 9B/27B installations were not found, and no Ollama removal is claimed.

Batch 21 is now genuinely deployed and anonymously verified: **27 distinct source-extracted papers /39 records /105 captioned crops**. Source PR39 passed CI38461970557 and ordinarily merged; Site7e7cb11698385fe3791331c48530757419033190 passed Pages38469205232. Anonymous verification at21:24:50UTC checked439 files,27 paper routes and42 material bindings with zero failures. This cleanup update adds no audited-paper or training credit. Local Batch35 reading continues; the separate audited lane stays paused.


## Latest cleanup status and preservation observations

The admitted cleanup runs have completed. Further candidates remain held pending their exact reconstruction, identity and consumer proofs; no additional scope is admitted. Confirmed removal remains **324,947,723,133 logical bytes / 6,951,560 files**, including the earlier unused 4B model removal. Verified lossless metadata compression remains separately **11,771,016,610 bytes**, with original content retained locally. This report revision adds **zero deletion or compression credit**. The requested 600 GB removal target remains unmet by **275,052,276,867 bytes**; physical free space is a separate observation.

Root observed **84,779,479,040 bytes free at 2026-10-13T21:40:53.5165795Z**. At that file-metadata observation, the protected Qwen3-32B Q4_K_M model remained present at **19,762,149,024 bytes**, and the previously removed Qwen3-4B file remained absent. Root's native server check at 21:42 UTC found the same `llama-server.exe` process PID32512, original creation time **2026-10-11T10:10:33.250034Z**, and unchanged owned CUDA runtime. No additional model removal is claimed; the requested Ollama 9B/27B installations were not located.

The saved Root presence observation at **2026-10-13T21:44:13.9729742Z** found all **25 saved preview process IDs** present with the name `python.exe`. This is a process-presence observation, not a new served-folder, native-CWD or open-handle check. Folder authority remains the saved launch receipts and earlier bounded directory observations in the private owner register; all listed preview folders remain held. No model or preview programme was stopped or restarted by this cleanup update. The earlier history of two owned obsolete-cleanup attempts being stopped is retained unchanged. Original papers, PDFs, page-text, pass/pair, training and private audit files remain protected; no fresh payload audit or new scientific credit is asserted.

Historical summary retained: the replaced opening status was “Updated: 2026-10-13T12:32:45.140149+00:00. Cleanup is in progress,” with **181,709,901,824 bytes free** at that update. That dated snapshot remains history and is not the latest free-space measurement. All other prior report history remains unchanged.

<!-- cleanup-b18-b21-zero-removal-20261014-root-r1 -->

## Dated cleanup hold and current diagnostic — 2026-10-14

The cleanup attempt completed at 02:30:03 UTC with all 12 Batch18–Batch21 generated-build output scopes held by the named/opaque programme-folder guard. It completed no target preflight and removed **0 files / 0 bytes**. No directory or programme was removed or stopped, and no compression credit was added. The proposed output copies remain retained.

A separate read-only diagnostic at 03:00:41–03:00:44 UTC observed current Codex/Node path references intersecting these scopes under the unchanged path rule. This is token-reference evidence, not proof of physical file locks, actual file use, or the identity of the earlier attempt's blocking process. Ambiguous literals remain unknown and held; this observation does not retrospectively identify the historical culprit. No guard or cleanup admission was changed.

Confirmed logical removal remains **324,947,723,133 bytes / 6,951,560 files**. Separate lossless compression savings remain **11,771,016,610 bytes**, with content retained locally. The **600 GB removal target remains unmet**.

Root observed C free space of **24,146,292,736 bytes at 02:59:55 UTC**. The earlier zero-removal attempt observed 33,174,081,536 bytes before and 33,129,566,208 bytes after. These are separate dated free-space observations during concurrent work; their changes add no removal or compression credit. All prior report history and accounting remain preserved.

<!-- cleanup-b18-finalized-r2-20261014-root -->

## Finalized admitted Batch18 output cleanup R2 — 2026-10-14

This dated entry records only the finalized R2 result, from 2026-10-14T03:30:40.0241627+00:00 to 2026-10-14T04:10:42.0596927+00:00. The disposition loop completed. Its finite admitted scopes were b18-stage, b18-candidate, b18-final; the other candidate batches were not admitted by this attempt. The final receipt confirms **20,200 files / 628,779,452 logical bytes actually removed**; declared and preflight bytes add no credit. No directories or programmes were removed or stopped.

Confirmed cumulative logical removal is now **325,576,502,585 bytes / 6,971,760 files**. Separate lossless compression savings remain **11,771,016,610 bytes**, with content retained locally; this attempt adds zero compression credit. The **600 GB removal target remains unmet**.

The disposition loop recorded 84,845 held files and 0 missing files; scope-level hold entries: 0. None were recorded at scope level. Model/CUDA files, Source/Site working checkouts, source/PDF/training originals and protected page-text/pass/pair/private-audit files remained outside this output-only cleanup scope. Retained or unresolved output members, including any chemical/model assets held by the filters, add no removal credit. This entry adds no claim that retained programmes or folders are unused.

The executor observed C free space of **23,451,021,312 bytes before** and **23,449,452,544 bytes after**, an observed change of -1,568,768 bytes during concurrent work. This physical delta is not attributed wholly or partially to this cleanup; logical removal and observed free space are separate measurements. All previous report bytes and dated history remain preserved.

<!-- cleanup-b25-two-dist-completed-20261014-root-r1 -->
## 2026-10-14 22:56 UTC: Batch 25 generated-output cleanup

The completed cleanup removed 75,458 verified public generated files from the two Batch 25 candidate/final display copies, totaling 4,292,239,322 logical bytes. Both exact scopes completed with zero holds or aborts. No directories were removed and no programs were stopped. Original/private data, papers, text/pass/quoted-pair files, training data, current model/server, user folders and the working source/site repositories were preserved.

Confirmed cumulative cleanup is now **329,868,741,907 logical bytes across 7,047,218 files**. Retained-content compression remains separate at 11,771,016,610 bytes, with no new compression credit. The 600,000,000,000-byte cleanup target remains unmet by 270,131,258,093 logical bytes.

Observed C free space was **76,976,939,008 bytes** at 2026-10-14 22:20:00.8598427 UTC and **74,749,702,144 bytes** at 22:56:18.8707719 UTC. The net observed change was **−2,227,236,864 bytes** while build and local-generation activity continued. This is net disk activity, not a measurement of pure physical space reclaimed by cleanup; logical removed bytes must not be presented as physical recovery.

The cleanup ended at 22:56:00.5329848 UTC. It used exact historical public-byte verification and same-handle file disposition, retained all directories and protected inputs, and did not extend or replay another cleanup attempt. No new paper, accuracy, audit or publication credit is claimed by this storage update.

<!-- cleanup-B22-B23-B24-B26-completed-20261015-Root-r1 -->

## October 15: twelve obsolete public build copies removed

Two completed cleanup operations removed only old candidate/final distribution and site-stage copies whose full file sets and bytes matched their manifests and published Git blobs. Working checkouts, proof metadata, private audits, papers, page text, pass files, quoted pair files and the active Qwen3-32B model/CUDA server were preserved. No program was stopped; no folder was held by another program.

| Completed operation | Removed file copies | Removed logical bytes | C free before | C free after | Observed net free-space change |
|---|---:|---:|---:|---:|---:|
| Batch 22/23, six old public output directories | 220,260 | 12,488,709,534 | 57,061,253,120 | 70,154,395,648 | +13,093,142,528 |
| Batch 24/26, six old public output directories | 225,855 | 12,857,356,119 | 69,556,756,480 | 83,036,639,232 | +13,479,882,752 |

Build and model work ran concurrently with these observations. Net free-space changes are measured disk observations, not isolated physical deletion recovery. Logical copy totals do not establish physical allocation or recovery.

These two operations add 446,115 removed file copies and 25,346,065,653 logical bytes to the previously reported total. Cumulative verified removal is now **7,493,333 file copies / 355,214,807,560 logical bytes**. Retained-file compression remains separately reported at 11,771,016,610 bytes; no new compression credit is added here.

**The 600 GB cleanup target remains unmet**, by 244,785,192,440 logical bytes. This update preserves all earlier outcomes and holds; it does not claim a website publication or alter the paused audited lane.


## Cleanup checkpoint — 2026-10-15T17:56:12.578104+00:00

Owner rule added October 15: check C: free space at every existing 30-minute continuation wake-up and before large builds. Below 100 GiB (107,374,182,400 bytes), clean completed, verified rebuildable MatterSyn copies and aim to restore that headroom. The existing wake-up is ACTIVE; no duplicate schedule or routine report was added. Cleanup does not resume a paused website or audit lane. The rule is saved in MatterSyn main through PR52, merge `d3f777b58a7eec2634b8c32b27069db0f704079e`.

This checkpoint confirms 20 more inactive generated preview copies removed: 641,992 file copies / 35,631,740,314 logical bytes. Current cumulative confirmed removal accounting is 8,995,553 file copies / 444,662,980,547 logical bytes; this replaces earlier totals and does not add them together. The historical unused 4B model removal remains included once. The original 600 GB target remains unmet.

C: free space was 20,174,811,136 bytes before the first successful retirement in this group (2026-10-15T17:33:34.636390+00:00), and 51,300,216,832 bytes at this checkpoint. Concurrent build and other disk activity prevent attributing that change solely to cleanup. The 100 GiB threshold is still unmet.

Every retired preview was bound to a previously published Site Git tree, verified byte for byte, and checked again for complete current membership, path containment, registration, metadata and active consumers before ordinary Git worktree removal. No other program was stopped. Original papers, owner folders, page text, quoted passes/pairs, training inputs, the active Qwen3-32B/CUDA runtime, the working Source/Site checkouts and the current release outputs remain protected.

Initial zero-removal holds from Windows path spelling and historical directory-layout assumptions remain recorded. Freshness holds were not counted as removals; a later fresh unchanged check admitted four of them. Additional static-copy byte verification is not deletion credit. Actively served previews and folders with unresolved membership differences remain preserved. No release check, scientific policy, audited record or training export changed.


## Cleanup checkpoint — 2026-10-15T18:18:42.376223+00:00

Since the preceding checkpoint, 13 additional inactive generated preview copies were confirmed removed: 270,479 file copies / 13,603,110,220 logical bytes. All 33 preview retirements together total 912,471 file copies / 49,234,850,534 logical bytes; the first 20 were already reported and are not counted again here.

A separate completed cleanup removed 20 verified regenerable public static copies: 466,441 file copies / 31,843,291,810 logical bytes. Each successful scope is unique. Held or unsuccessful attempts contribute no removal credit.

This append adds only the newly unreported 33 copies: 736,920 file copies / 45,446,402,030 logical bytes. Current cumulative confirmed removal is 9,732,473 file copies / 490,109,382,577 logical bytes, including the historical unused-model removal once. These cumulative totals replace prior totals rather than being added to them. The original 600 GB target remains unmet.

C: free space measured 90,875,891,712 bytes at 2026-10-15T18:18:42.376223+00:00. The 100 GiB (107,374,182,400-byte) headroom threshold remains unmet. Concurrent builds and disk activity prevent attributing free-space changes solely to cleanup.

The completed scopes were verified against published Git content, with fresh complete membership, metadata, containment and active-consumer checks before removal. No other program was stopped by these operations. Original papers, owner folders, page text, quoted passes/pairs, training inputs, active models/CUDA, the working Source/Site checkouts and current release outputs remain protected. All prior holds and failed-attempt evidence remain preserved. No release check, scientific policy, audited record or training export changed.


## Cleanup checkpoint — 2026-10-15T18:40:18.938335+00:00

Ten additional completed regenerable generated-dist copies were confirmed removed: 375,125 file copies / 21,261,750,062 logical bytes. All ten actual removals completed successfully in unique scopes; held or incomplete attempts contribute no credit. Their saved generated manifests and original public Source inputs were verified before removal, without changing historical build-approval status.

Current cumulative confirmed removal is 10,107,598 file copies / 511,371,132,639 logical bytes. This adds only these ten newly reported copies to the preceding checkpoint, with prior removals retained once. The original 600 GB target remains unmet.

C: free space measured 110,175,473,664 bytes at 2026-10-15T18:40:18.938335+00:00. The 100 GiB (107,374,182,400-byte) headroom threshold was met at this reading. This is a dated free-space observation, not an isolated physical-recovery measurement; concurrent builds and other disk activity continue.

Fresh complete membership, metadata, containment and active-consumer checks preceded the literal generated-output removals. No other program was stopped by these operations. Original papers, owner folders, page text, quoted passes/pairs, training inputs, active models/CUDA, the working Source/Site checkouts and current release outputs remain protected. All previous holds and failed-attempt evidence remain preserved. No release check, scientific policy, audited record or training export changed.


## Cleanup checkpoint — 2026-10-15T19:53:33.937706+00:00

Three additional completed regenerable public-output scopes were confirmed removed: two generated distribution copies and one public static copy. They total **104,609 file copies / 6,384,577,038 logical bytes**. Each actual receipt records successful removal of a unique scope; prior zero-removal holds and unresolved membership holds receive no removal credit.

Current cumulative confirmed removal is **10,212,207 file copies / 517,755,709,677 logical bytes**. This adds only the three newly reported scopes to the preceding checkpoint and retains all earlier removals once. The original 600 GB target remains unmet.

C: free space measured **108,898,209,792 bytes** at 2026-10-15T19:53:33.937706+00:00. The 100 GiB (107,374,182,400-byte) headroom threshold was met at this reading. The latest completed removal separately recorded 108,896,157,696 bytes free afterward. These are dated free-space observations, not isolated physical-recovery measurements; concurrent builds and other disk activity continue.

Fresh public-byte, complete-membership, metadata, containment and active-consumer checks preceded the successful removals. No programs were stopped by these operations. Original papers, owner folders, page text, quoted passes/pairs, training inputs, active models/CUDA and working Source/Site checkouts were preserved. All earlier holds and failed-attempt evidence remain preserved. No release check, scientific policy, audited record or training export changed.


## Cleanup checkpoint — 2026-10-15T19:59:21.204552+00:00

Two additional completed regenerable public-output scopes were confirmed removed: one public static copy and one generated distribution copy. The unique successful scopes total **66,007 file copies / 4,226,538,244 logical bytes**. Held, failed or incomplete attempts contribute no removal credit.

Current cumulative confirmed removal is **10,278,214 file copies / 521,982,247,921 logical bytes**. This adds only these two newly reported scopes to the previous checkpoint and retains prior removals once. The original 600 GB target remains unmet.

The final removal receipt recorded C: free space of **113,258,561,536 bytes** at 2026-10-15T19:59:21.204552+00:00. The 100 GiB (107,374,182,400-byte) headroom threshold was met at that reading. This is a dated free-space observation, not an isolated physical-recovery measurement; subsequent build and disk activity continue.

Full public-byte verification and fresh complete-membership, metadata, containment and active-consumer checks preceded both removals. No programs were stopped. Original papers, owner folders, page text, quoted passes/pairs, training inputs, active models/CUDA and working Source/Site checkouts were preserved. All prior HOLDs and failed-attempt evidence remain preserved. No release check, scientific policy, audited record, training export or publication credit changed.


## Cleanup checkpoint — 2026-10-15T20:35:11.879425+00:00

Four additional regenerable public-output scopes were confirmed removed after the previous report checkpoint. Their exact relative paths and actual removal-receipt measurements are:

| Removed generated scope | File copies | Logical bytes | C: free before | C: free after | Completed UTC |
|---|---:|---:|---:|---:|---|
| `batch31/r2/final/project/recipe-atlas/static` | 24,736 | 1,691,201,147 | 99,671,953,408 | 100,321,460,224 | 2026-10-15T20:24:00.037991+00:00 |
| `batch31/r2/final/project/recipe-atlas/dist` | 39,192 | 2,219,290,232 | 100,316,409,856 | 102,302,519,296 | 2026-10-15T20:27:20.985974+00:00 |
| `batch32/q/local-build/project/recipe-atlas/static` | 25,161 | 1,773,711,498 | 102,294,798,336 | 104,135,753,728 | 2026-10-15T20:33:05.058643+00:00 |
| `batch32/q/local-build/project/recipe-atlas/dist` | 39,724 | 2,305,432,770 | 104,080,461,824 | 106,490,548,224 | 2026-10-15T20:35:11.879425+00:00 |

These four unique successful removals add **128,813 file copies / 7,989,635,647 logical bytes**. Current cumulative confirmed removal is **10,407,027 file copies / 529,971,883,568 logical bytes**. Prior removals are retained once; held or unsuccessful scopes add zero credit. The original 600 GB cleanup target remains unmet.

The table reports measured free-space readings, not isolated physical recovery. Concurrent builds and disk activity prevent attributing the before/after differences solely to deletion. A subsequent recorded C: reading was 106,482,892,800 bytes (about 99.17 GiB), below the 100 GiB headroom target. This soft headroom shortfall is not a release gate.

The fresh candidate-static proof remains HOLD with zero deletion. Three older distribution-proof HOLDs also contribute zero removal credit. The metadata-change cause is unknown; no responsible program was identified, and no program was stopped by these cleanup operations. The separate completed-preview lookup had no accepted existing mapping and adds no removal credit. All old HOLDs and failed-attempt evidence remain preserved.

Successful scopes passed their public-byte, complete-membership, metadata, containment, current-role and active-consumer checks. Original papers, owner folders, page text, quoted passes/pairs, training inputs, active models/CUDA and working Source/Site checkouts were preserved. No release check, scientific policy, audited record, training export or publication credit changed.

## Cleanup checkpoint — 2026-10-15T21:10:04.187468+00:00

After B33's normal anonymous verification at 20:57:04 UTC and successful Pages deployment, two exact duplicate candidate-output leaves were removed. Paths below are relative to `research-assets/simple-website-20261010`; the final output, input snapshots, manifests and receipts were retained.

| Removed generated scope | File copies | Logical bytes | C: free before | C: free after | Completed UTC |
|---|---:|---:|---:|---:|---|
| `batch33/r/candidate/project/recipe-atlas/static` | 25,646 | 1,845,273,134 | 106,018,516,992 | 107,932,966,912 | 2026-10-15T21:08:59.364496+00:00 |
| `batch33/r/candidate/project/recipe-atlas/dist` | 40,361 | 2,381,265,110 | 107,933,732,864 | 110,421,483,520 | 2026-10-15T21:10:04.187468+00:00 |

These two unique successful removals add **66,007 file copies / 4,226,538,244 logical bytes**. Cumulative confirmed removal is now **10,473,034 file copies / 534,198,421,812 logical bytes**. Previously counted paths remain counted once; held and failed attempts add zero. The original **600 GB cleanup goal remains unmet**.

The last recorded C: free-space reading was **110,421,483,520 bytes**, above the 100 GiB headroom threshold of 107,374,182,400 bytes at that observation. The before/after readings are concurrent disk observations; they are **not isolated physical-recovery measurements**, and no persistent future headroom is promised. Compression remains separate from deletion accounting.

Both fresh scopes passed complete public-byte, membership, identity, containment, current-role and native consumer/CWD checks; all verification handles were closed before removal. Their actual receipts record exit code 0, roots absent and **0 programs stopped**. The initial R1 ancestry HOLDs remain preserved with **zero removal credit**: Root confirmed that the historical merge object was missing locally, then performed an ordinary fetch of `origin/main` to obtain merge `37c7da9d0a678ce22235c8a942fda452b05a4d99`, while Source HEAD and files stayed unchanged. Acceptance predicates were unchanged; new R2 proof/attempt outputs were used, with no replay of the failed outputs.

Actual removal receipts are retained privately at:

- `engineering/b33-candidate-static-dist-cleanup-readiness-private-20261015-r2/static/attempts/b33_candidate_static-rank-01/result.json`
- `engineering/b33-candidate-static-dist-cleanup-readiness-private-20261015-r2/dist/attempts/rank-01/result.json`

B33's final output, working Source/Site checkouts, Qwen server/model/CUDA, original papers and owner folders, text/pass/pair evidence, training inputs, other private data, snapshots and all old HOLD/failure evidence were preserved. No release gate, scientific/audit status, audited baseline, training export or publication credit changed through this cleanup.
