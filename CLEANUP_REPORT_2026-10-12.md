# Storage cleanup, October 12, 2026

Updated: 2026-10-13T05:35:47.839566+00:00. Cleanup is **in progress**.

The requested target is at least 600 GB removed from the local MatterSyn folder. The fresh scans observed about 845 GB outside the main paper-collection folders; these are logical file sizes and do not establish that all of it is removable.

Completed target receipts and confirmed file-removal events establish **312,116,029,628 logical bytes (312.12 GB)** and **6,557,101 files** removed since this request. Earlier cleanup events are excluded. An unfinished scope receives only individually confirmed removals from a fixed journal prefix; intents and holds receive zero credit. Prefix snapshots replace older observations of the same scopes; final receipts reconcile those events and are never added a second time.

The 8 event prefixes were observed at 2026-10-13T05:31:07.069291+00:00; later removals are not inferred.

C: free space at the start of this cleanup request: 11,985,891,328 bytes (observed 2026-10-12 16:12:58 UTC). C: free space at this update: 219,859,783,680 bytes. Free-space changes also reflect other disk activity; logical bytes removed are reported separately.

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
| obsolete_checkout_18 | 1 | 8,355 | 561,004,239 | `bfb67d0a0c5026865cfbb0449fc5f7933d418dd594119400df9c2179c07bb8b9` |
| obsolete_checkout_19 | 1 | 8,646 | 621,432,042 | `755390d066748312a98d2f79ff060a021667b7c9c75c6da8e2de06be1d2e236e` |
| obsolete_checkout_20 | 1 | 8,474 | 611,069,826 | `d35dbe00ef07b7d601f29ad90e62f156823be3cfea897d3926d28e509a7ebd43` |
| obsolete_checkout_21 | 1 | 8,372 | 322,450,687 | `4a8df5c219735271fcf128b2a959a84dc637422e97112f30e0b085090fc26457` |
| obsolete_checkout_22 | 1 | 8,653 | 506,772,583 | `96372b4dfe475828f461e1b1b041a6f2001e694830ed6af8829d45c6f87f4928` |
| obsolete_checkout_23 | 1 | 8,403 | 607,114,370 | `d3a269988afa3f2bd73a0c6bdb7a6cfd16ef39252028795f148490320ebd6933` |
| obsolete_checkout_24 | 1 | 8,317 | 601,673,562 | `e06537e5e1077198635fd9bfc61bff3fc5ea92dc762c2909cead7fc1de280fec` |
| obsolete_checkout_25 | 1 | 8,362 | 604,173,405 | `bb53fcc88687ad1ed3ef5cb7c2ff50b81521096616cbda5a2288d5d7e14a0e5e` |
| obsolete_checkout_26 | 1 | 8,312 | 560,281,719 | `5b6fcfa2735989d52f7e354aebd4757fe9a6cf3befbb59ed89cc74f2564cdfa5` |
| obsolete_checkout_27 | 1 | 9,132 | 698,716,492 | `b34905800f284da09a2ddcc53c6244c98339967982b0236f23f116a0b427e032` |
| obsolete_checkout_28 | 1 | 8,678 | 627,090,876 | `a14d0e99e0b0925395e9c20e5202c299ef7f0b7c64764fd26a2273302968b71d` |
| obsolete_checkout_29 | 1 | 8,323 | 560,790,418 | `4354b6c048aa9d36abf9e76d7ab60bd62eeb836c670a595aa1514317b953219e` |
| obsolete_checkout_30 | 1 | 8,898 | 685,071,054 | `deed5b6daed16db55f302b9f02e626dfe1375631fcc909d222fc9dadfc451833` |
| obsolete_checkout_31 | 1 | 8,839 | 672,784,466 | `58affaaebb1dde07fcd29fff4866ef7d725b6d96ccb287b1846d8a9502faad55` |
| obsolete_checkout_32 | 1 | 8,323 | 550,861,203 | `c06c95928b30dd15b21ccaaf743637358415f054204576a3975887e21e45efb7` |
| obsolete_checkout_33 | 1 | 8,356 | 552,231,426 | `ceff8a38e2b195f860c7c9c87759f1dfafda3d303cbcb050868a8ec021fdea56` |
| obsolete_checkout_34 | 1 | 8,324 | 560,620,893 | `255d335cc7f7ccfdfee8115e9344849462fa984b029f9d25049417e49da079d2` |
| obsolete_checkout_35 | 1 | 9,068 | 695,304,424 | `fb53700d7f38db014bc258fa56a00aad2eed45f1b34ed68329fe29918ec5cabf` |
| obsolete_checkout_36 | 1 | 8,573 | 616,342,382 | `1dcdd2fe75531b6594b29e83aabf2e0a3772857fe8b0425e5602eb775e2c4c85` |
| obsolete_checkout_37 | 1 | 8,647 | 485,962,612 | `ce229b8980c79543c5c3e574ca130646a87e4a9f52a8b278594470d4f8ae55c5` |
| obsolete_checkout_38 | 1 | 8,619 | 618,964,714 | `e97b7d971399ccbc74fe5482a47baae0725553c515e1107d0b8d8d7701f0f369` |
| obsolete_checkout_39 | 1 | 5,636 | 463,029,630 | `e32f46be08e579de1c7d60d44390ac2630577b68209df3460e2414b35908d73d` |
| obsolete_checkout_40 | 1 | 7,201 | 533,747,986 | `b7aa957ee2823ada66268c6991dbbd799c2c5c5ab3b820de6978de3c157c3cea` |
| obsolete_checkout_41 | 1 | 8,977 | 631,234,286 | `c98355fcdcb228f39a3d6eb540153512c695dc8e69b3d4bbf2c3cfff375a7f7b` |
| obsolete_checkout_42 | 1 | 26,117 | 1,834,843,306 | `483815ad654ebedc983f743016fda05a6084b57c8bd5827030deea505eb6a794` |
| obsolete_checkout_43 | 1 | 8,532 | 559,791,723 | `041fcd3366d83b9b8889de697885a2f1153bec191fed1db938ae36610018cb3a` |
| obsolete_checkout_44 | 1 | 8,536 | 560,675,765 | `514688731fbf68f26eecaa2014f1df1558423f278f5dc2e93911432960076c1f` |
| obsolete_checkout_45 | 1 | 8,403 | 607,114,370 | `ae3b07aa978b98eb7a1370fb367fc55df7a6af998a60797f102c39261e2e8e74` |
| obsolete_checkout_46 | 1 | 8,983 | 688,927,148 | `c3b806f6923aa72e11dd9a0ddf4f25d8a78db3c8bdeec98d2acc2c1cdf887fda` |
| obsolete_checkout_47 | 1 | 8,660 | 623,537,874 | `71c007801d6971ed3bbd254a9ea935183a052bacfc71589ff8f4a02e114ce051` |
| obsolete_checkout_48 | 1 | 8,568 | 562,382,259 | `5ad0db2bac3fddfe9b974b994b08ed1467918bf42f1277e6fceabd41115cba53` |
| obsolete_checkout_49 | 1 | 5,760 | 468,128,755 | `8b3395353da3ebb2b53449465e918e591d4094871c45e3a83ee2a452d6ea60d9` |
| obsolete_checkout_50 | 1 | 8,536 | 560,675,765 | `70dd91332213d49252c0b1c20ea6e6aca87d8f8b307863b8bfb0672a4218aa99` |
| obsolete_checkout_51 | 1 | 8,538 | 614,641,672 | `bed51d56306014d499fe8c420afedf14c7e4d2c58c65aa1c0869f6bcf6d9c8a9` |
| obsolete_checkout_52 | 1 | 8,534 | 558,983,860 | `cc76b89da0cbc889b483be60fb62c3847ea1a5663191e788774f93439330001b` |
| obsolete_checkout_53 | 1 | 8,844 | 353,943,620 | `7aa05ff8512dd5d8774ec996fdb8476a9f37a78b30d897f7ab7ae528185359b1` |
| obsolete_checkout_54 | 1 | 17,361 | 923,679,620 | `f7a25185ceb70dd283e9852c9981fdafcaf99430d12972f6c5ca71254c89d232` |
| obsolete_checkout_55 | 1 | 8,985 | 688,958,495 | `ac243b474ef29e67571fbc983f460cbee7ed993cca8d56cafc499278912c12af` |
| obsolete_checkout_56 | 1 | 8,982 | 648,436,345 | `6a8891e97b1b7a5c47726617c850c2830580f0d7dbb88753c9e6bc77baab8166` |
| obsolete_checkout_57 | 1 | 8,980 | 648,491,091 | `58e77d0cb6467bd1aec8c1b301909c38e896a43122c196570e59b17dfe543606` |
| obsolete_checkout_58 | 1 | 8,843 | 353,445,303 | `5c742fa4e4aef1622f725a8330f98b6b3e384a71d3c9eca9b10e806ea2d4f186` |
| obsolete_checkout_59 | 1 | 8,315 | 601,608,581 | `1c7da085220f493c565cfc693e553626e1d6b9df2fd17614b6f01c23a3ac182a` |
| obsolete_checkout_60 | 1 | 8,397 | 564,563,657 | `dbd03223164bd7d72f439bf57a44fbd8b4eda6f02cde594b66754f6e4d2a80f4` |
| obsolete_checkout_61 | 1 | 7,198 | 524,427,956 | `768c6ef5ff0fe64e007205871a6d6b3235e6a40ca2204c2658a665da83fb8ed1` |
| obsolete_checkout_62 | 1 | 8,302 | 601,010,781 | `f340544114a62150b47c133a28d609338a533da11e275976babaf3c0b979d286` |
| obsolete_checkout_63 | 1 | 8,766 | 645,727,964 | `e61480e37da5ef7c424227f42e04e657b025cb187592a2b260a5064a117213f8` |
| obsolete_checkout_64 | 1 | 8,647 | 485,962,612 | `3c175c166a597465c0a39f659e970b5c1243b8c542f3125a5813b18f6f973184` |
| obsolete_checkout_65 | 1 | 5,188 | 470,264,812 | `b71153745a79987d8877cacba36617ac01b10abe1b8e485834abe5d3277f8dbd` |
| obsolete_checkout_66 | 1 | 8,603 | 574,704,273 | `558d5ddc0eca3834617bdaa9dbee83fd250e125a5c5439d1ee204687d4c4644c` |
| obsolete_checkout_67 | 1 | 8,324 | 560,620,893 | `be12ff07d49abf8fb8b94132f23f88a42679fb22e7041db9b7dd5dc352ba5b5a` |
| obsolete_checkout_68 | 1 | 8,312 | 560,281,719 | `e30f6ad04abe69dfd8f93f54d32ff574b0dbf79ab84967a566f1ce88ca865fdd` |
| obsolete_checkout_69 | 1 | 8,396 | 563,687,330 | `26df43654705e6f9f1431731037cace439f2b65dc2b43ab3a006a5b78d85a412` |
| obsolete_checkout_70 | 1 | 8,329 | 602,413,496 | `12d24d9f563abfdad2b3ee254ff9e30bb5a9eac1d8236afdc4208575beaf32bf` |
| obsolete_checkout_71 | 1 | 8,142 | 314,920,312 | `9e86ce28dafafc35dcd1c64f0d086c0921b4de78ee348144eb7ead81a21538c8` |
| obsolete_checkout_72 | 1 | 8,356 | 552,229,734 | `ee427f71914a80fbc1eb1520943d216364de5f58b839b6974b57c9dac4771e07` |
| obsolete_checkout_73 | 1 | 8,535 | 559,821,373 | `94f7d61845538f913dfe610884441a07e9150082244781c293cff40e671165be` |
| obsolete_checkout_74 | 1 | 8,196 | 592,262,522 | `f0f03ef611b233049a93547348a50863811e39e2452b32706910262e3016da08` |
| obsolete_checkout_75 | 1 | 8,268 | 553,967,433 | `d35eed0792bc2ca42e74020e7c62c7bf59b4534b4a39d1390ee7b90eed9840f1` |
| obsolete_checkout_76 | 1 | 8,733 | 633,800,109 | `f1cd3ac71bcf57675650c3ce970362967b99e6199ea541432c8ac1a6d37bd495` |
| obsolete_checkout_77 | 1 | 8,511 | 558,778,140 | `8c80910b1d8a842c5417561a8b12c96d25f139661a1e2cd7e4f4f6d16c71f12c` |
| obsolete_checkout_78 | 1 | 8,329 | 602,413,495 | `cb7a5675ad61790aec486e183fd7fbcdeababbf1204693b6ea141b71f71731af` |
| obsolete_checkout_79 | 1 | 8,357 | 562,085,509 | `274abe677c909bda72bc2718b45abeefc4e55ab371edf43ff1a23ea1876004b3` |
| obsolete_checkout_80 | 1 | 8,741 | 635,011,022 | `efb4d174e95243d33168adef7c35d6aeb09b666214324165a423b370670137c6` |
| obsolete_checkout_81 | 1 | 8,403 | 607,114,370 | `b4c5488013d52da879c421b292f3a1a6952a642cb1d7d609ac77ed8c2dca5bd0` |
| obsolete_checkout_82 | 1 | 8,983 | 648,455,600 | `ed0f162369205b9cf2a4891bc849ac817c35fe8c229a628e82e67a2a6ba0ac97` |
| obsolete_checkout_83 | 1 | 8,398 | 565,130,579 | `9bde182727d4661cac579ee47bc8b45dfa4176315a0b9876fdfbe009a3510739` |
| obsolete_checkout_84 | 1 | 8,362 | 604,175,097 | `53490a2cbb73b0329b1be5ead263a12d3c4a85e1f7ac630ad76a080b4b0e477a` |

Necessary publication-safe material is retained in GitHub. Regenerable caches and verified redundant copies are deleted directly. Original papers, quoted text/pass/pair files, unique private evidence, the active local model and current working repositories remain local. Detailed paths, audits, patches, model payloads and source text are excluded from this public report.

Automatic approval rejected removal of one worktree whose name indicates pending integration; it remains intact. Other verified scopes continue. No website review status, sampling denominator or release gate changes.

Two old preview programs retain generated cleanup folders; neither was stopped. Their identities and folder details were provided privately in chat. Automatic approval rejected publishing those local host details to public GitHub; that disclosure was left out.

Two obsolete-copy attempts conservatively retained files because their native volume-ID comparison used a narrower representation than the scan. Both attempts were stopped and their unchanged journals confirm zero removals. A full-width same-handle identity correction passed focused tests and an actual metadata probe, and its new cleanup attempts are running; no identity check is bypassed.

The earlier official-metadata model/download attempt failed DNS before removal and remains preserved with zero credit. The owner later explicitly authorized removal of the unused, re-downloadable Qwen3-4B Q8 model: one SHA256-verified file, 4,280,404,704 logical bytes, was removed. The recorded active Qwen3-32B server identity was unchanged before and after; no program was stopped or restarted. The old Vulkan download remains parked. No Ollama CLI, process or default/environment installation was found, so no Ollama removal is claimed.
